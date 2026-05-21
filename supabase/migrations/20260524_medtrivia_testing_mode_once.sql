-- =============================================================================
-- RUN ONCE in Supabase SQL (then seed once if empty). No daily scripts needed.
--
-- Testing behavior (until you apply a production revert migration):
--   • Any day: latest 10-question set is playable (not tied to today's date)
--   • No 8 PM ET window — always "live" when a set exists
--   • Every Join starts a fresh quiz (unlimited retakes)
-- =============================================================================

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
    s.id AS set_id,
    s.scheduled_date,
    s.status,
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz) AS start_at,
    ((s.scheduled_date::text || ' 20:20:00 America/New_York')::timestamptz) AS end_at,
    COALESCE(s.allow_retakes, true) AS allow_retakes
  FROM public.trivia_sets s
  CROSS JOIN et
  WHERE s.status IN ('draft', 'scheduled', 'live')
    AND (SELECT COUNT(*)::int FROM public.trivia_questions q WHERE q.set_id = s.id) = 10
  ORDER BY
    CASE WHEN s.scheduled_date = et.today THEN 0 ELSE 1 END,
    CASE s.status WHEN 'live' THEN 0 WHEN 'scheduled' THEN 1 ELSE 2 END,
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
  v_status text;
BEGIN
  SELECT gs.status INTO v_status
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_status IS NULL THEN
    RETURN 'no_content';
  END IF;
  IF v_status = 'closed' THEN
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
BEGIN
  IF v_user_id IS NULL AND (p_guest_token IS NULL OR length(trim(p_guest_token)) = 0) THEN
    RAISE EXCEPTION 'guest_token is required for unauthenticated users';
  END IF;

  SELECT gs.set_id, gs.scheduled_date, gs.status, gs.start_at, gs.end_at, gs.allow_retakes
  INTO v_set_id, v_scheduled_date, v_set_status, v_start_at, v_end_at, v_allow_retakes
  FROM public.get_today_set_for_play() AS gs
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No playable trivia set. Run supabase/seed_medtrivia_first_set.sql once.';
  END IF;

  v_set := jsonb_build_object(
    'set_id', v_set_id,
    'scheduled_date', v_scheduled_date,
    'status', v_set_status,
    'start_at', v_start_at,
    'end_at', v_end_at,
    'allow_retakes', true
  );

  -- Testing: always a fresh run on Join (no one-session-per-day lock)
  IF v_user_id IS NOT NULL THEN
    DELETE FROM public.trivia_sessions WHERE set_id = v_set_id AND user_id = v_user_id;
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

  DELETE FROM public.trivia_sessions
  WHERE set_id = v_set_id AND guest_token = trim(p_guest_token);

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

-- One-time: activate latest 10-question set (safe to re-run; idempotent)
DO $$
DECLARE
  v_set_id uuid;
  v_qcount int;
BEGIN
  SELECT s.id INTO v_set_id
  FROM public.trivia_sets s
  WHERE (SELECT COUNT(*)::int FROM public.trivia_questions q WHERE q.set_id = s.id) = 10
  ORDER BY s.updated_at DESC NULLS LAST, s.created_at DESC
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE NOTICE 'No 10-question set yet — run seed_medtrivia_first_set.sql once.';
    RETURN;
  END IF;

  UPDATE public.trivia_sets
  SET
    status = 'scheduled',
    allow_retakes = true,
    published_at = COALESCE(published_at, now()),
    updated_at = now()
  WHERE id = v_set_id;

  INSERT INTO public.trivia_daily_stats (set_id, scheduled_date)
  SELECT v_set_id, scheduled_date FROM public.trivia_sets WHERE id = v_set_id
  ON CONFLICT (set_id) DO NOTHING;

  RAISE NOTICE 'Testing set ready: %', v_set_id;
END $$;

REVOKE ALL ON FUNCTION public.trivia_join_session(text, text, text) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.trivia_join_session(text, text, text) TO anon, authenticated, service_role;

COMMIT;
