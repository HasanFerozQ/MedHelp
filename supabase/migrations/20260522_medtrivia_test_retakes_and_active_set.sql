-- Test-friendly: latest playable set (not only strict ET "today"), unlimited retakes when allow_retakes.

BEGIN;

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
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz) AS start_at,
    ((s.scheduled_date::text || ' 20:20:00 America/New_York')::timestamptz) AS end_at,
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

CREATE OR REPLACE FUNCTION public.get_current_trivia_state(now_tz timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
STABLE
SET search_path = public
AS $$
DECLARE
  v_set_id uuid;
  v_set_status text;
BEGIN
  SELECT gs.set_id, gs.status
  INTO v_set_id, v_set_status
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RETURN 'no_content';
  END IF;

  IF v_set_status = 'closed' THEN
    RETURN 'post_game';
  END IF;

  RETURN 'live';
END;
$$;

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
    RAISE EXCEPTION 'No trivia set scheduled for today';
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
        set_id, user_id, guest_token, guest_username, timezone_snapshot, client_started_at, status
      )
      VALUES (
        v_set_id, v_user_id, NULL, NULL,
        COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'), now(), 'active'
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
      set_id, user_id, guest_token, guest_username, timezone_snapshot, client_started_at, status
    )
    VALUES (
      v_set_id, NULL, trim(p_guest_token), NULLIF(trim(p_guest_username), ''),
      COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'), now(), 'active'
    )
    RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
  )
  SELECT to_jsonb(ins) INTO v_session FROM ins;
  RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
END;
$$;

UPDATE public.trivia_sets
SET allow_retakes = true, status = 'scheduled'
WHERE status IN ('draft', 'scheduled', 'live');

COMMIT;
