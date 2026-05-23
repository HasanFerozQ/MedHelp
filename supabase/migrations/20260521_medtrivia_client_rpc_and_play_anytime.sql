-- MedTrivia: strict 8 PM ET schedule for today's set.
-- Adds trivia_join_session() so the browser can join without edge functions (RLS blocks direct inserts).
-- Uses production-style gating for scheduled sets.

BEGIN;

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
  v_start_at timestamptz;
  v_end_at timestamptz;
  v_session jsonb;
  v_set jsonb;
BEGIN
  IF v_user_id IS NULL AND (p_guest_token IS NULL OR length(trim(p_guest_token)) = 0) THEN
    RAISE EXCEPTION 'guest_token is required for unauthenticated users';
  END IF;

  SELECT gs.set_id, gs.scheduled_date, gs.status, gs.start_at, gs.end_at
  INTO v_set_id, v_scheduled_date, v_set_status, v_start_at, v_end_at
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No trivia set scheduled for today';
  END IF;
  IF now() < v_start_at THEN
    RAISE EXCEPTION 'Trivia opens at 8:00 PM America/New_York.';
  END IF;
  IF now() > v_end_at OR v_set_status = 'closed' THEN
    RAISE EXCEPTION 'Today''s trivia is closed.';
  END IF;

  v_set := jsonb_build_object(
    'set_id', v_set_id,
    'scheduled_date', v_scheduled_date,
    'status', v_set_status,
    'start_at', v_start_at,
    'end_at', v_end_at
  );

  IF v_user_id IS NOT NULL THEN
    SELECT to_jsonb(s) INTO v_session
    FROM (
      SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
      FROM public.trivia_sessions
      WHERE set_id = v_set_id AND user_id = v_user_id
      LIMIT 1
    ) s;

    IF v_session IS NOT NULL THEN
      RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
    END IF;

    WITH ins AS (
      INSERT INTO public.trivia_sessions (
        set_id, user_id, guest_token, guest_username, timezone_snapshot, client_started_at
      )
      VALUES (
        v_set_id,
        v_user_id,
        NULL,
        NULL,
        COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'),
        now()
      )
      RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
    )
    SELECT to_jsonb(ins) INTO v_session FROM ins;

    RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
  END IF;

  SELECT to_jsonb(s) INTO v_session
  FROM (
    SELECT id, set_id, status, started_at, ended_at, score, correct_count, share_grid
    FROM public.trivia_sessions
    WHERE set_id = v_set_id AND guest_token = trim(p_guest_token)
    LIMIT 1
  ) s;

  IF v_session IS NOT NULL THEN
    RETURN jsonb_build_object('reused', true, 'session', v_session, 'set', v_set);
  END IF;

  WITH ins AS (
    INSERT INTO public.trivia_sessions (
      set_id, user_id, guest_token, guest_username, timezone_snapshot, client_started_at
    )
    VALUES (
      v_set_id,
      NULL,
      trim(p_guest_token),
      NULLIF(trim(p_guest_username), ''),
      COALESCE(NULLIF(trim(p_timezone), ''), 'UTC'),
      now()
    )
    RETURNING id, set_id, status, started_at, ended_at, score, correct_count, share_grid
  )
  SELECT to_jsonb(ins) INTO v_session FROM ins;

  RETURN jsonb_build_object('reused', false, 'session', v_session, 'set', v_set);
END;
$$;

REVOKE ALL ON FUNCTION public.trivia_join_session(text, text, text) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.trivia_join_session(text, text, text) TO anon, authenticated, service_role;

COMMIT;
