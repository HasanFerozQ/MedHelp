-- DEPRECATED — run ONCE: supabase/migrations/20260524_medtrivia_testing_mode_once.sql
-- (No daily scripts. Seed once: seed_medtrivia_first_set.sql)
-- =============================================================================
-- Legacy quick fix below (same as migration tail). Prefer the migration file.
-- =============================================================================

-- 0) What exists right now?
SELECT
  s.id,
  s.scheduled_date,
  s.status,
  s.allow_retakes,
  s.title,
  (SELECT COUNT(*) FROM public.trivia_questions q WHERE q.set_id = s.id) AS questions
FROM public.trivia_sets s
ORDER BY s.created_at DESC;

-- 1) Force-activate the best set (latest with 10 questions — NEVER skips if already today)
DO $$
DECLARE
  v_today date := (now() AT TIME ZONE 'America/New_York')::date;
  v_set_id uuid;
  v_qcount int;
  v_conflict uuid;
BEGIN
  SELECT s.id INTO v_set_id
  FROM public.trivia_sets s
  WHERE (SELECT COUNT(*) FROM public.trivia_questions q WHERE q.set_id = s.id) = 10
  ORDER BY s.created_at DESC
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No set with 10 questions. Run supabase/seed_medtrivia_first_set.sql first, then run this file again.';
  END IF;

  DELETE FROM public.trivia_sets
  WHERE scheduled_date = v_today AND id <> v_set_id;

  UPDATE public.trivia_sets
  SET
    scheduled_date = v_today,
    status = 'scheduled',
    allow_retakes = true,
    published_at = COALESCE(published_at, now()),
    updated_at = now()
  WHERE id = v_set_id;

  INSERT INTO public.trivia_daily_stats (set_id, scheduled_date)
  VALUES (v_set_id, v_today)
  ON CONFLICT (set_id) DO UPDATE SET scheduled_date = EXCLUDED.scheduled_date;

  RAISE NOTICE 'Activated set % for % (scheduled, retakes on).', v_set_id, v_today;
END $$;

-- 2) Optional: wipe YOUR test sessions so join always starts fresh (all users/guests)
-- DELETE FROM public.trivia_sessions
-- WHERE set_id IN (SELECT id FROM public.trivia_sets WHERE status IN ('scheduled', 'live'));

-- 3) Verify row the app needs
SELECT
  id,
  scheduled_date,
  status,
  allow_retakes,
  (now() AT TIME ZONE 'America/New_York')::date AS et_today,
  scheduled_date = (now() AT TIME ZONE 'America/New_York')::date AS is_today
FROM public.trivia_sets
WHERE status IN ('scheduled', 'live')
ORDER BY updated_at DESC;

-- 4) Sync RPCs (fixes "State live in SQL but No set on website")
-- Run supabase/migrations/20260523_medtrivia_sync_playable_set.sql if step 4 returns 0 rows but step 3 has a row.

-- 5) Verify RPCs (both must succeed; set row must NOT be empty)
SELECT * FROM public.get_today_set_for_play();
SELECT public.get_current_trivia_state() AS state;
