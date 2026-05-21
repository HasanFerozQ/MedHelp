-- =============================================================================
-- MEDTRIVIA — TESTING MODE (run entire file in Supabase SQL Editor)
-- • No 8 PM ET window — play anytime
-- • Unlimited attempts per day (retakes)
-- • Activates your latest set (fixes draft → scheduled)
-- Revert later: restore get_current_trivia_state time logic from 20260520 migration
-- =============================================================================

BEGIN;

-- --- 1) Playable set picker (today OR latest scheduled/live) ---
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
    s.id,
    s.scheduled_date,
    s.status,
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz),
    ((s.scheduled_date::text || ' 20:20:00 America/New_York')::timestamptz),
    s.allow_retakes
  FROM public.trivia_sets s
  CROSS JOIN et
  WHERE s.status IN ('scheduled', 'live')
  ORDER BY
    CASE WHEN s.scheduled_date = et.today THEN 0 ELSE 1 END,
    s.scheduled_date DESC,
    s.updated_at DESC
  LIMIT 1;
$$;

-- --- 2) State = live whenever a playable set exists (no time gate) ---
CREATE OR REPLACE FUNCTION public.get_current_trivia_state(now_tz timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
STABLE
SET search_path = public
AS $$
DECLARE
  v_set_id uuid;
  v_status text;
BEGIN
  SELECT gs.set_id, gs.status INTO v_set_id, v_status
  FROM public.get_today_set_for_play() AS gs LIMIT 1;

  IF v_set_id IS NULL THEN
    RETURN 'no_content';
  END IF;
  IF v_status = 'closed' THEN
    RETURN 'post_game';
  END IF;
  RETURN 'live';
END;
$$;

-- --- 3) Join = fresh run when allow_retakes (deletes prior session for this user/guest) ---
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
  FROM public.get_today_set_for_play() AS gs LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No trivia set found. Run seed_medtrivia_first_set.sql first.';
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
    SELECT status INTO v_existing_status FROM public.trivia_sessions
    WHERE set_id = v_set_id AND user_id = v_user_id LIMIT 1;

    IF COALESCE(v_allow_retakes, false) AND v_existing_status IS NOT NULL THEN
      DELETE FROM public.trivia_sessions WHERE set_id = v_set_id AND user_id = v_user_id;
      v_existing_status := NULL;
    END IF;

    IF v_existing_status IS NOT NULL THEN
      SELECT to_jsonb(s) INTO v_session FROM (
        SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
        FROM public.trivia_sessions WHERE set_id = v_set_id AND user_id = v_user_id LIMIT 1
      ) s;
      RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
    END IF;

    WITH ins AS (
      INSERT INTO public.trivia_sessions (set_id, user_id, timezone_snapshot, client_started_at, status)
      VALUES (v_set_id, v_user_id, COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'), now(), 'active')
      RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
    )
    SELECT to_jsonb(ins) INTO v_session FROM ins;
    RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
  END IF;

  SELECT status INTO v_existing_status FROM public.trivia_sessions
  WHERE set_id = v_set_id AND guest_token = trim(p_guest_token) LIMIT 1;

  IF COALESCE(v_allow_retakes, false) AND v_existing_status IS NOT NULL THEN
    DELETE FROM public.trivia_sessions WHERE set_id = v_set_id AND guest_token = trim(p_guest_token);
    v_existing_status := NULL;
  END IF;

  IF v_existing_status IS NOT NULL THEN
    SELECT to_jsonb(s) INTO v_session FROM (
      SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
      FROM public.trivia_sessions WHERE set_id = v_set_id AND guest_token = trim(p_guest_token) LIMIT 1
    ) s;
    RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
  END IF;

  WITH ins AS (
    INSERT INTO public.trivia_sessions (set_id, guest_token, guest_username, timezone_snapshot, client_started_at, status)
    VALUES (v_set_id, trim(p_guest_token), NULLIF(trim(p_guest_username), ''),
      COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'), now(), 'active')
    RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
  )
  SELECT to_jsonb(ins) INTO v_session FROM ins;
  RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
END;
$$;

-- --- 4) Activate latest set: today (ET), scheduled, retakes, 10 questions required ---
DO $$
DECLARE
  v_today date := (now() AT TIME ZONE 'America/New_York')::date;
  v_set_id uuid;
  v_qcount int;
  v_conflict uuid;
BEGIN
  SELECT id INTO v_set_id
  FROM public.trivia_sets
  ORDER BY created_at DESC
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No trivia_sets row. Run: supabase/seed_medtrivia_first_set.sql';
  END IF;

  SELECT COUNT(*)::int INTO v_qcount FROM public.trivia_questions WHERE set_id = v_set_id;
  IF v_qcount <> 10 THEN
    RAISE EXCEPTION 'Set % has % questions. Need 10 — re-run seed_medtrivia_first_set.sql', v_set_id, v_qcount;
  END IF;

  SELECT id INTO v_conflict FROM public.trivia_sets
  WHERE scheduled_date = v_today AND id <> v_set_id LIMIT 1;
  IF v_conflict IS NOT NULL THEN
    DELETE FROM public.trivia_sets WHERE id = v_conflict;
  END IF;

  UPDATE public.trivia_sets
  SET scheduled_date = v_today, status = 'scheduled', allow_retakes = true,
      published_at = COALESCE(published_at, now()), updated_at = now()
  WHERE id = v_set_id;

  INSERT INTO public.trivia_daily_stats (set_id, scheduled_date)
  VALUES (v_set_id, v_today)
  ON CONFLICT (set_id) DO UPDATE SET scheduled_date = EXCLUDED.scheduled_date;
END $$;

COMMIT;

-- --- Verify (expect 1 row, status scheduled, 10 questions) ---
SELECT
  s.id,
  s.scheduled_date,
  s.status,
  s.allow_retakes,
  (SELECT COUNT(*) FROM public.trivia_questions q WHERE q.set_id = s.id) AS questions,
  (now() AT TIME ZONE 'America/New_York')::date AS et_today
FROM public.trivia_sets s
WHERE s.status IN ('scheduled', 'live')
ORDER BY s.updated_at DESC
LIMIT 3;
