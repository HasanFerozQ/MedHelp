-- =============================================================================
-- FIX: Extend MedTrivia daily window from 8:00–8:20 PM ET to 8:00 PM–11:59 PM ET.
-- Run ONCE in Supabase SQL Editor.
--
-- Effect:
--   Before: Quiz only open 8:00–8:20 PM ET (20 min) → 1:00–1:20 AM PKT
--   After:  Quiz open 8:00 PM–11:59 PM ET (4 hours) → 1:00 AM–5:00 AM PKT
-- =============================================================================

DROP FUNCTION IF EXISTS public.get_today_set_for_play();

CREATE OR REPLACE FUNCTION public.get_today_set_for_play()
RETURNS TABLE (
  set_id uuid,
  scheduled_date date,
  status text,
  start_at timestamptz,
  end_at timestamptz,
  allow_retakes boolean
)
LANGUAGE sql
STABLE
SET search_path = public
AS $$
  WITH et AS (
    SELECT (now() AT TIME ZONE 'America/New_York')::date AS today
  )
  SELECT
    s.id AS set_id,
    s.scheduled_date,
    s.status,
    -- Opens: 8:00 PM ET
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz) AS start_at,
    -- Closes: 11:59 PM ET same day (was 20:20 — only 20 min!)
    ((s.scheduled_date::text || ' 23:59:59 America/New_York')::timestamptz) AS end_at,
    COALESCE(s.allow_retakes, false) AS allow_retakes
  FROM public.trivia_sets s
  CROSS JOIN et
  WHERE s.scheduled_date = et.today
    AND s.status IN ('scheduled', 'live', 'closed')
    AND (SELECT COUNT(*)::int FROM public.trivia_questions q WHERE q.set_id = s.id) = 10
  ORDER BY
    CASE s.status WHEN 'live' THEN 0 WHEN 'scheduled' THEN 1 WHEN 'closed' THEN 2 ELSE 3 END,
    s.updated_at DESC
  LIMIT 1;
$$;

-- Also update get_current_trivia_state to use the new end window
CREATE OR REPLACE FUNCTION public.get_current_trivia_state(now_tz timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
STABLE
SET search_path = public
AS $$
DECLARE
  v_set_id uuid;
  v_set_status text;
  v_start_at timestamptz;
  v_end_at timestamptz;
BEGIN
  SELECT gs.set_id, gs.status, gs.start_at, gs.end_at
  INTO v_set_id, v_set_status, v_start_at, v_end_at
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RETURN 'no_content';
  END IF;
  IF v_set_status = 'closed' THEN
    RETURN 'post_game';
  END IF;
  IF now_tz < v_start_at THEN
    RETURN 'scheduled';
  END IF;
  IF now_tz > v_end_at THEN
    RETURN 'post_game';
  END IF;
  RETURN 'live';
END;
$$;

-- Also update trivia_join_session to match new window
CREATE OR REPLACE FUNCTION public.trivia_join_session(
  p_guest_token text DEFAULT NULL,
  p_guest_username text DEFAULT NULL,
  p_timezone text DEFAULT 'UTC'
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_set_id uuid;
  v_scheduled_date date;
  v_set_status text;
  v_allow_retakes boolean;
  v_start_at timestamptz;
  v_end_at timestamptz;
  v_session jsonb;
  v_set jsonb;
  v_existing_status text;
BEGIN
  IF v_user_id IS NULL AND (p_guest_token IS NULL OR length(trim(p_guest_token)) = 0) THEN
    RAISE EXCEPTION 'guest_token is required for unauthenticated users';
  END IF;

  SELECT gs.set_id, gs.scheduled_date, gs.status, gs.start_at, gs.end_at, gs.allow_retakes
  INTO v_set_id, v_scheduled_date, v_set_status, v_start_at, v_end_at, v_allow_retakes
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No playable trivia set for today. Upload a set via the admin panel.';
  END IF;
  IF now() < v_start_at THEN
    RAISE EXCEPTION 'Trivia opens at 8:00 PM Eastern Time.';
  END IF;
  IF now() > v_end_at OR v_set_status = 'closed' THEN
    RAISE EXCEPTION 'Today''s trivia has closed. Come back tomorrow at 8 PM ET!';
  END IF;

  v_set := jsonb_build_object(
    'set_id', v_set_id,
    'scheduled_date', v_scheduled_date,
    'status', v_set_status,
    'start_at', v_start_at,
    'end_at', v_end_at,
    'allow_retakes', v_allow_retakes
  );

  IF v_user_id IS NOT NULL THEN
    SELECT status INTO v_existing_status
    FROM public.trivia_sessions
    WHERE set_id = v_set_id AND user_id = v_user_id
    LIMIT 1;

    IF v_allow_retakes AND v_existing_status IS NOT NULL THEN
      DELETE FROM public.trivia_sessions WHERE set_id = v_set_id AND user_id = v_user_id;
      v_existing_status := NULL;
    END IF;

    IF v_existing_status IS NOT NULL THEN
      SELECT to_jsonb(s) INTO v_session
      FROM (
        SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
        FROM public.trivia_sessions
        WHERE set_id = v_set_id AND user_id = v_user_id
        LIMIT 1
      ) s;
      RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
    END IF;

    WITH ins AS (
      INSERT INTO public.trivia_sessions (
        set_id, user_id, timezone_snapshot, client_started_at, status
      )
      VALUES (
        v_set_id, v_user_id, COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'), now(), 'active'
      )
      RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
    )
    SELECT to_jsonb(ins) INTO v_session FROM ins;
    RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
  END IF;

  SELECT status INTO v_existing_status
  FROM public.trivia_sessions
  WHERE set_id = v_set_id AND guest_token = trim(p_guest_token)
  LIMIT 1;

  IF v_allow_retakes AND v_existing_status IS NOT NULL THEN
    DELETE FROM public.trivia_sessions WHERE set_id = v_set_id AND guest_token = trim(p_guest_token);
    v_existing_status := NULL;
  END IF;

  IF v_existing_status IS NOT NULL THEN
    SELECT to_jsonb(s) INTO v_session
    FROM (
      SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
      FROM public.trivia_sessions
      WHERE set_id = v_set_id AND guest_token = trim(p_guest_token)
      LIMIT 1
    ) s;
    RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
  END IF;

  WITH ins AS (
    INSERT INTO public.trivia_sessions (
      set_id, guest_token, guest_username, timezone_snapshot, client_started_at, status
    )
    VALUES (
      v_set_id,
      trim(p_guest_token),
      NULLIF(trim(p_guest_username), ''),
      COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'),
      now(),
      'active'
    )
    RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
  )
  SELECT to_jsonb(ins) INTO v_session FROM ins;
  RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
END;
$$;

REVOKE ALL ON FUNCTION public.trivia_join_session(text, text, text) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.trivia_join_session(text, text, text) TO anon, authenticated, service_role;

-- Verify
SELECT
  '8:00 PM ET opens =' AS label,
  ((now()::date::text || ' 20:00:00 America/New_York')::timestamptz AT TIME ZONE 'Asia/Karachi') AS pkt_open_time,
  ((now()::date::text || ' 23:59:00 America/New_York')::timestamptz AT TIME ZONE 'Asia/Karachi') AS pkt_close_time;
