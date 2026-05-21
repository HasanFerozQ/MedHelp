-- Run once in Supabase SQL Editor to make your existing trivia set playable "today" (US Eastern).
-- Moves the latest published set to today's ET date. Safe if it is already today.

DO $$
DECLARE
  v_today date := (now() AT TIME ZONE 'America/New_York')::date;
  v_set_id uuid;
  v_old_date date;
  v_conflict uuid;
BEGIN
  SELECT id, scheduled_date
  INTO v_set_id, v_old_date
  FROM public.trivia_sets
  WHERE status IN ('draft', 'scheduled', 'live')
  ORDER BY published_at DESC NULLS LAST, created_at DESC
  LIMIT 1;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'No trivia set found. Run seed_medtrivia_first_set.sql first.';
  END IF;

  IF v_old_date = v_today THEN
    RAISE NOTICE 'Set % is already scheduled for today (%).', v_set_id, v_today;
    RETURN;
  END IF;

  SELECT id INTO v_conflict
  FROM public.trivia_sets
  WHERE scheduled_date = v_today
    AND id <> v_set_id
  LIMIT 1;

  IF v_conflict IS NOT NULL THEN
    DELETE FROM public.trivia_sets WHERE id = v_conflict;
    RAISE NOTICE 'Removed duplicate empty set % for today.', v_conflict;
  END IF;

  UPDATE public.trivia_daily_stats
  SET scheduled_date = v_today
  WHERE set_id = v_set_id;

  UPDATE public.trivia_sets
  SET
    scheduled_date = v_today,
    status = CASE WHEN status = 'closed' THEN status ELSE 'scheduled' END,
    allow_retakes = true,
    published_at = COALESCE(published_at, now()),
    updated_at = now()
  WHERE id = v_set_id;

  RAISE NOTICE 'Moved set % from % to % (status scheduled).', v_set_id, v_old_date, v_today;
END $$;

-- Quick check
SELECT id, scheduled_date, status, title, published_at
FROM public.trivia_sets
WHERE scheduled_date = (now() AT TIME ZONE 'America/New_York')::date;
