BEGIN;

CREATE TABLE IF NOT EXISTS public.trivia_sets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scheduled_date date NOT NULL UNIQUE,
  title text NOT NULL DEFAULT 'MedTrivia Daily',
  status text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'scheduled', 'live', 'closed')),
  allow_retakes boolean NOT NULL DEFAULT false,
  published_at timestamptz,
  created_by uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.trivia_questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  set_id uuid NOT NULL REFERENCES public.trivia_sets(id) ON DELETE CASCADE,
  question_order int NOT NULL CHECK (question_order BETWEEN 1 AND 10),
  prompt text NOT NULL,
  options jsonb NOT NULL CHECK (jsonb_typeof(options) = 'array' AND jsonb_array_length(options) = 4),
  correct_index int NOT NULL CHECK (correct_index BETWEEN 0 AND 3),
  rationale text NOT NULL DEFAULT '',
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (set_id, question_order)
);

CREATE TABLE IF NOT EXISTS public.trivia_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  set_id uuid NOT NULL REFERENCES public.trivia_sets(id) ON DELETE CASCADE,
  user_id uuid,
  guest_token text,
  guest_username text,
  timezone_snapshot text NOT NULL DEFAULT 'UTC',
  status text NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'finished', 'expired')),
  started_at timestamptz NOT NULL DEFAULT now(),
  ended_at timestamptz,
  score int NOT NULL DEFAULT 0,
  correct_count int NOT NULL DEFAULT 0,
  duration_seconds int,
  share_grid text,
  rank_percentile numeric(5,2),
  client_started_at timestamptz,
  CONSTRAINT trivia_sessions_identity_ck CHECK (user_id IS NOT NULL OR guest_token IS NOT NULL)
);

CREATE UNIQUE INDEX IF NOT EXISTS trivia_sessions_one_user_per_day_idx
  ON public.trivia_sessions(set_id, user_id) WHERE user_id IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS trivia_sessions_one_guest_per_day_idx
  ON public.trivia_sessions(set_id, guest_token) WHERE guest_token IS NOT NULL;

CREATE TABLE IF NOT EXISTS public.trivia_answers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES public.trivia_sessions(id) ON DELETE CASCADE,
  set_id uuid NOT NULL REFERENCES public.trivia_sets(id) ON DELETE CASCADE,
  question_id uuid NOT NULL REFERENCES public.trivia_questions(id) ON DELETE CASCADE,
  question_order int NOT NULL CHECK (question_order BETWEEN 1 AND 10),
  selected_index int NOT NULL CHECK (selected_index BETWEEN 0 AND 3),
  correct boolean NOT NULL,
  question_started_at timestamptz NOT NULL,
  server_received_at timestamptz NOT NULL DEFAULT now(),
  locked_at timestamptz NOT NULL DEFAULT now(),
  latency_ms int,
  idempotency_key text,
  UNIQUE (session_id, question_id),
  UNIQUE (session_id, idempotency_key)
);

CREATE TABLE IF NOT EXISTS public.trivia_daily_stats (
  set_id uuid PRIMARY KEY REFERENCES public.trivia_sets(id) ON DELETE CASCADE,
  scheduled_date date NOT NULL UNIQUE,
  participants int NOT NULL DEFAULT 0,
  completers int NOT NULL DEFAULT 0,
  perfect_10 int NOT NULL DEFAULT 0,
  avg_score numeric(5,2) NOT NULL DEFAULT 0,
  refreshed_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.trivia_waiting_room_presence (
  id bigserial PRIMARY KEY,
  set_id uuid NOT NULL REFERENCES public.trivia_sets(id) ON DELETE CASCADE,
  identity_key text NOT NULL,
  username text,
  last_seen timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (set_id, identity_key)
);

CREATE INDEX IF NOT EXISTS trivia_presence_set_last_seen_idx
  ON public.trivia_waiting_room_presence(set_id, last_seen DESC);

CREATE OR REPLACE FUNCTION public.touch_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trivia_sets_touch_updated_at ON public.trivia_sets;
CREATE TRIGGER trivia_sets_touch_updated_at
BEFORE UPDATE ON public.trivia_sets
FOR EACH ROW
EXECUTE FUNCTION public.touch_updated_at();

CREATE OR REPLACE FUNCTION public.ensure_trivia_set_has_ten_questions(p_set_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM public.trivia_questions
  WHERE set_id = p_set_id;

  IF v_count <> 10 THEN
    RAISE EXCEPTION 'Trivia set % must have exactly 10 questions (found %)', p_set_id, v_count;
  END IF;
END;
$$;

CREATE OR REPLACE FUNCTION public.get_today_set_for_play()
RETURNS TABLE (
  set_id uuid,
  scheduled_date date,
  status text,
  start_at timestamptz,
  end_at timestamptz
)
LANGUAGE sql
STABLE
AS $$
  WITH et_now AS (
    SELECT now() AT TIME ZONE 'America/New_York' AS local_ts
  )
  SELECT
    s.id,
    s.scheduled_date,
    s.status,
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz) AS start_at,
    ((s.scheduled_date::text || ' 20:20:00 America/New_York')::timestamptz) AS end_at
  FROM public.trivia_sets s
  CROSS JOIN et_now
  WHERE s.scheduled_date = et_now.local_ts::date
  LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION public.get_current_trivia_state(now_tz timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
  v_local timestamp;
  v_today date;
  v_today_set uuid;
  v_wait_start timestamp;
  v_live_start timestamp;
  v_live_end timestamp;
BEGIN
  v_local := now_tz AT TIME ZONE 'America/New_York';
  v_today := v_local::date;
  v_wait_start := v_today::timestamp + interval '19 hours 30 minutes';
  v_live_start := v_today::timestamp + interval '20 hours';
  v_live_end := v_today::timestamp + interval '20 hours 20 minutes';

  SELECT id INTO v_today_set
  FROM public.trivia_sets
  WHERE scheduled_date = v_today
  LIMIT 1;

  IF v_today_set IS NULL THEN
    RETURN 'no_content';
  END IF;

  IF v_local < v_wait_start THEN
    RETURN 'pre_hype';
  ELSIF v_local >= v_wait_start AND v_local < v_live_start THEN
    RETURN 'waiting_room';
  ELSIF v_local >= v_live_start AND v_local < v_live_end THEN
    RETURN 'live';
  END IF;

  RETURN 'post_game';
END;
$$;

CREATE OR REPLACE FUNCTION public.get_trivia_question(
  p_session_id uuid,
  p_question_order int
)
RETURNS TABLE (
  question_id uuid,
  question_order int,
  prompt text,
  options jsonb,
  rationale text
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_set_id uuid;
BEGIN
  SELECT set_id INTO v_set_id
  FROM public.trivia_sessions
  WHERE id = p_session_id;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'Session not found';
  END IF;

  RETURN QUERY
  SELECT q.id, q.question_order, q.prompt, q.options, q.rationale
  FROM public.trivia_questions q
  WHERE q.set_id = v_set_id
    AND q.question_order = p_question_order
  LIMIT 1;
END;
$$;

CREATE OR REPLACE FUNCTION public.record_trivia_answer(
  p_session_id uuid,
  p_question_order int,
  p_selected_index int,
  p_question_started_at timestamptz,
  p_idempotency_key text DEFAULT NULL
)
RETURNS TABLE (
  accepted boolean,
  is_correct boolean,
  correct_index int,
  locked_at timestamptz,
  message text
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_set_id uuid;
  v_question_id uuid;
  v_correct_index int;
  v_existing record;
  v_now timestamptz := now();
BEGIN
  IF p_selected_index < 0 OR p_selected_index > 3 THEN
    RAISE EXCEPTION 'selected_index out of bounds';
  END IF;

  IF v_now > (p_question_started_at + interval '60 seconds') THEN
    RETURN QUERY SELECT false, false, NULL::int, v_now, 'answer_window_expired';
    RETURN;
  END IF;

  SELECT set_id INTO v_set_id
  FROM public.trivia_sessions
  WHERE id = p_session_id
    AND status = 'active';

  IF v_set_id IS NULL THEN
    RETURN QUERY SELECT false, false, NULL::int, v_now, 'session_not_active';
    RETURN;
  END IF;

  SELECT q.id, q.correct_index
    INTO v_question_id, v_correct_index
  FROM public.trivia_questions q
  WHERE q.set_id = v_set_id
    AND q.question_order = p_question_order;

  IF v_question_id IS NULL THEN
    RETURN QUERY SELECT false, false, NULL::int, v_now, 'question_not_found';
    RETURN;
  END IF;

  INSERT INTO public.trivia_answers (
    session_id,
    set_id,
    question_id,
    question_order,
    selected_index,
    correct,
    question_started_at,
    server_received_at,
    locked_at,
    latency_ms,
    idempotency_key
  )
  VALUES (
    p_session_id,
    v_set_id,
    v_question_id,
    p_question_order,
    p_selected_index,
    (p_selected_index = v_correct_index),
    p_question_started_at,
    v_now,
    v_now,
    GREATEST(0, FLOOR(EXTRACT(EPOCH FROM (v_now - p_question_started_at)) * 1000))::int,
    p_idempotency_key
  )
  ON CONFLICT (session_id, question_id) DO NOTHING;

  IF NOT FOUND THEN
    SELECT a.correct, q.correct_index, a.locked_at
      INTO v_existing
    FROM public.trivia_answers a
    JOIN public.trivia_questions q
      ON q.id = a.question_id
    WHERE a.session_id = p_session_id
      AND a.question_id = v_question_id;

    RETURN QUERY SELECT false, v_existing.correct, v_existing.correct_index, v_existing.locked_at, 'already_locked';
    RETURN;
  END IF;

  RETURN QUERY SELECT true, (p_selected_index = v_correct_index), v_correct_index, v_now, 'accepted';
END;
$$;

CREATE OR REPLACE FUNCTION public.finalize_trivia_session(p_session_id uuid)
RETURNS TABLE (
  session_id uuid,
  score int,
  total_questions int,
  share_grid text,
  duration_seconds int,
  finished_at timestamptz
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_started_at timestamptz;
  v_set_id uuid;
  v_score int := 0;
  v_total int := 10;
  v_grid text;
  v_finished_at timestamptz := now();
BEGIN
  SELECT started_at, set_id
    INTO v_started_at, v_set_id
  FROM public.trivia_sessions
  WHERE id = p_session_id
  FOR UPDATE;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'Session not found';
  END IF;

  SELECT COUNT(*)
    INTO v_score
  FROM public.trivia_answers a
  WHERE a.session_id = p_session_id
    AND a.correct = true;

  SELECT string_agg(CASE WHEN a.correct THEN '🟩' ELSE '⬜' END, '' ORDER BY q.question_order)
    INTO v_grid
  FROM public.trivia_questions q
  LEFT JOIN public.trivia_answers a
    ON a.question_id = q.id
    AND a.session_id = p_session_id
  WHERE q.set_id = v_set_id;

  UPDATE public.trivia_sessions
  SET
    status = 'finished',
    ended_at = v_finished_at,
    score = v_score,
    correct_count = v_score,
    duration_seconds = GREATEST(0, FLOOR(EXTRACT(EPOCH FROM (v_finished_at - v_started_at)))::int),
    share_grid = COALESCE(v_grid, '')
  WHERE id = p_session_id;

  PERFORM public.refresh_trivia_daily_stats(v_set_id);

  RETURN QUERY
  SELECT p_session_id, v_score, v_total, COALESCE(v_grid, ''), GREATEST(0, FLOOR(EXTRACT(EPOCH FROM (v_finished_at - v_started_at)))::int), v_finished_at;
END;
$$;

CREATE OR REPLACE FUNCTION public.refresh_trivia_daily_stats(p_set_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_date date;
BEGIN
  SELECT scheduled_date INTO v_date
  FROM public.trivia_sets
  WHERE id = p_set_id;

  IF v_date IS NULL THEN
    RETURN;
  END IF;

  INSERT INTO public.trivia_daily_stats (set_id, scheduled_date, participants, completers, perfect_10, avg_score, refreshed_at)
  SELECT
    p_set_id,
    v_date,
    COUNT(*)::int AS participants,
    COUNT(*) FILTER (WHERE status = 'finished')::int AS completers,
    COUNT(*) FILTER (WHERE status = 'finished' AND score = 10)::int AS perfect_10,
    COALESCE(ROUND(AVG(score)::numeric, 2), 0)::numeric(5,2) AS avg_score,
    now()
  FROM public.trivia_sessions
  WHERE set_id = p_set_id
  ON CONFLICT (set_id) DO UPDATE SET
    participants = EXCLUDED.participants,
    completers = EXCLUDED.completers,
    perfect_10 = EXCLUDED.perfect_10,
    avg_score = EXCLUDED.avg_score,
    refreshed_at = EXCLUDED.refreshed_at;
END;
$$;

CREATE OR REPLACE FUNCTION public.upsert_trivia_set_with_questions(
  p_scheduled_date date,
  p_title text,
  p_questions jsonb,
  p_publish boolean DEFAULT false
)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_set_id uuid;
  v_status text;
BEGIN
  IF jsonb_typeof(p_questions) <> 'array' OR jsonb_array_length(p_questions) <> 10 THEN
    RAISE EXCEPTION 'p_questions must be an array of exactly 10 items';
  END IF;

  INSERT INTO public.trivia_sets (scheduled_date, title, status, published_at)
  VALUES (
    p_scheduled_date,
    COALESCE(NULLIF(trim(p_title), ''), 'MedTrivia Daily'),
    CASE WHEN p_publish THEN 'scheduled' ELSE 'draft' END,
    CASE WHEN p_publish THEN now() ELSE NULL END
  )
  ON CONFLICT (scheduled_date)
  DO UPDATE SET
    title = EXCLUDED.title,
    status = CASE
      WHEN public.trivia_sets.status = 'live' THEN public.trivia_sets.status
      ELSE EXCLUDED.status
    END,
    published_at = CASE WHEN p_publish THEN now() ELSE public.trivia_sets.published_at END,
    updated_at = now()
  RETURNING id, status INTO v_set_id, v_status;

  IF v_status = 'live' THEN
    RAISE EXCEPTION 'Cannot overwrite questions for a live set';
  END IF;

  DELETE FROM public.trivia_questions WHERE set_id = v_set_id;

  INSERT INTO public.trivia_questions (set_id, question_order, prompt, options, correct_index, rationale)
  SELECT
    v_set_id,
    COALESCE((item->>'question_order')::int, ordinality::int),
    item->>'prompt',
    item->'options',
    (item->>'correct_index')::int,
    COALESCE(item->>'rationale', '')
  FROM jsonb_array_elements(p_questions) WITH ORDINALITY AS t(item, ordinality);

  PERFORM public.ensure_trivia_set_has_ten_questions(v_set_id);
  PERFORM public.refresh_trivia_daily_stats(v_set_id);

  RETURN v_set_id;
END;
$$;

ALTER TABLE public.trivia_sets ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trivia_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trivia_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trivia_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trivia_daily_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trivia_waiting_room_presence ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS trivia_daily_stats_read_all ON public.trivia_daily_stats;
CREATE POLICY trivia_daily_stats_read_all
ON public.trivia_daily_stats
FOR SELECT
USING (true);

DROP POLICY IF EXISTS trivia_waiting_room_read_all ON public.trivia_waiting_room_presence;
CREATE POLICY trivia_waiting_room_read_all
ON public.trivia_waiting_room_presence
FOR SELECT
USING (true);

DROP POLICY IF EXISTS trivia_waiting_room_insert_all ON public.trivia_waiting_room_presence;
CREATE POLICY trivia_waiting_room_insert_all
ON public.trivia_waiting_room_presence
FOR INSERT
WITH CHECK (true);

DROP POLICY IF EXISTS trivia_waiting_room_update_all ON public.trivia_waiting_room_presence;
CREATE POLICY trivia_waiting_room_update_all
ON public.trivia_waiting_room_presence
FOR UPDATE
USING (true)
WITH CHECK (true);

CREATE OR REPLACE FUNCTION public.trivia_mark_live_today()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_today date;
BEGIN
  v_today := (now() AT TIME ZONE 'America/New_York')::date;
  UPDATE public.trivia_sets
  SET status = 'live', updated_at = now()
  WHERE scheduled_date = v_today
    AND status IN ('scheduled', 'draft');
END;
$$;

CREATE OR REPLACE FUNCTION public.trivia_close_today()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_today date;
BEGIN
  v_today := (now() AT TIME ZONE 'America/New_York')::date;
  UPDATE public.trivia_sets
  SET status = 'closed', updated_at = now()
  WHERE scheduled_date = v_today
    AND status = 'live';
END;
$$;

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN
    PERFORM cron.schedule(
      'trivia-live-start-et',
      '0 20 * * *',
      $job$SELECT public.trivia_mark_live_today();$job$
    );

    PERFORM cron.schedule(
      'trivia-live-close-et',
      '20 20 * * *',
      $job$SELECT public.trivia_close_today();$job$
    );
  END IF;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_today_set_for_play() TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_current_trivia_state(timestamptz) TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_trivia_question(uuid, int) TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.record_trivia_answer(uuid, int, int, timestamptz, text) TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.finalize_trivia_session(uuid) TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.refresh_trivia_daily_stats(uuid) TO service_role;
GRANT EXECUTE ON FUNCTION public.upsert_trivia_set_with_questions(date, text, jsonb, boolean) TO service_role;
GRANT EXECUTE ON FUNCTION public.trivia_mark_live_today() TO service_role;
GRANT EXECUTE ON FUNCTION public.trivia_close_today() TO service_role;

COMMIT;
