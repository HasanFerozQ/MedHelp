-- Activate today's MedTrivia set (US Eastern). Run in Supabase SQL Editor.
-- Prefer supabase/FIX_trivia_play_now.sql (diagnostics + never skips draft fix).
-- OLD versions that RETURN early when date=today left status as draft — do not use those.

DO $$
DECLARE
  v_today date := (now() AT TIME ZONE 'America/New_York')::date;
  v_set_id uuid;
  v_old_date date;
  v_old_status text;
  v_conflict uuid;
  v_qcount int;
BEGIN
  SELECT id, scheduled_date, status
  INTO v_set_id, v_old_date, v_old_status
  FROM public.trivia_sets
  WHERE status IN ('draft', 'scheduled', 'live')
  ORDER BY
    CASE status WHEN 'live' THEN 0 WHEN 'scheduled' THEN 1 ELSE 2 END,
    published_at DESC NULLS LAST,
    created_at DESC
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No trivia set found. Run supabase/seed_medtrivia_first_set.sql first.';
  END IF;

  SELECT COUNT(*)::int INTO v_qcount
  FROM public.trivia_questions WHERE set_id = v_set_id;

  IF v_qcount <> 10 THEN
    RAISE EXCEPTION 'Set % has % questions (need 10). Re-run seed_medtrivia_first_set.sql.', v_set_id, v_qcount;
  END IF;

  SELECT id INTO v_conflict
  FROM public.trivia_sets
  WHERE scheduled_date = v_today AND id <> v_set_id
  LIMIT 1;

  IF v_conflict IS NOT NULL THEN
    DELETE FROM public.trivia_sets WHERE id = v_conflict;
    RAISE NOTICE 'Removed other set % dated today.', v_conflict;
  END IF;

  UPDATE public.trivia_sets
  SET
    scheduled_date = v_today,
    status = 'scheduled',
    allow_retakes = true,
    published_at = COALESCE(published_at, now()),
    updated_at = now()
  WHERE id = v_set_id;

  INSERT INTO public.trivia_daily_stats (set_id, scheduled_date, participants, completers, perfect_10, avg_score, refreshed_at)
  VALUES (v_set_id, v_today, 0, 0, 0, 0, now())
  ON CONFLICT (set_id) DO UPDATE SET scheduled_date = EXCLUDED.scheduled_date;

  RAISE NOTICE 'Active set % — was % on % (status was %). Now scheduled for % with 10 questions.',
    v_set_id, v_old_status, v_old_date, v_old_status, v_today;
END $$;

-- Must return 1 row for lobby to work (needs migration 20260522 for fallback, or today match):
SELECT
  id,
  scheduled_date,
  status,
  allow_retakes,
  (SELECT COUNT(*) FROM public.trivia_questions q WHERE q.set_id = trivia_sets.id) AS question_count,
  (now() AT TIME ZONE 'America/New_York')::date AS et_today
FROM public.trivia_sets
WHERE status IN ('scheduled', 'live')
ORDER BY scheduled_date DESC
LIMIT 5;
