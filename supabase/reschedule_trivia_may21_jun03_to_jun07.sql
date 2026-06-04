-- Reschedule 2026-05-21 .. 2026-06-03 to start 2026-06-07 (keeps 2026-06-04 .. 06).
-- Sets already on 2026-06-07+ move to dates after the relocated block.

BEGIN;

-- Free unique (scheduled_date) on trivia_daily_stats before moving sets.
UPDATE public.trivia_daily_stats ds
SET scheduled_date = DATE '2099-12-01' + (r.rn - 1)::int
FROM (
  SELECT ds2.set_id, ROW_NUMBER() OVER (ORDER BY ds2.scheduled_date, ds2.set_id) AS rn
  FROM public.trivia_daily_stats ds2
  JOIN public.trivia_sets s ON s.id = ds2.set_id
  WHERE s.scheduled_date BETWEEN DATE '2026-05-21' AND DATE '2026-06-03'
     OR (s.scheduled_date >= DATE '2026-06-07' AND s.scheduled_date < DATE '2099-01-01')
) r
WHERE ds.set_id = r.set_id;

-- 1) Stash missed-window sets
UPDATE public.trivia_sets s
SET scheduled_date = DATE '2099-01-01' + (r.rn - 1)::int, updated_at = now()
FROM (
  SELECT id, ROW_NUMBER() OVER (ORDER BY scheduled_date, created_at) AS rn
  FROM public.trivia_sets
  WHERE scheduled_date BETWEEN DATE '2026-05-21' AND DATE '2026-06-03'
) r
WHERE s.id = r.id;

-- 2) Stash sets already on Jun 7+ (real calendar dates only)
UPDATE public.trivia_sets s
SET scheduled_date = DATE '2099-07-01' + (r.rn - 1)::int, updated_at = now()
FROM (
  SELECT id, ROW_NUMBER() OVER (ORDER BY scheduled_date, created_at) AS rn
  FROM public.trivia_sets
  WHERE scheduled_date >= DATE '2026-06-07'
    AND scheduled_date < DATE '2099-01-01'
) r
WHERE s.id = r.id;

-- 3) Place missed-window sets starting Jun 7
UPDATE public.trivia_sets s
SET
  scheduled_date = DATE '2026-06-07' + (r.rn - 1)::int,
  status = CASE WHEN s.status IN ('closed', 'live') THEN 'scheduled' ELSE s.status END,
  published_at = COALESCE(s.published_at, now()),
  updated_at = now()
FROM (
  SELECT id, ROW_NUMBER() OVER (ORDER BY scheduled_date, created_at) AS rn
  FROM public.trivia_sets
  WHERE scheduled_date BETWEEN DATE '2099-01-01' AND DATE '2099-06-30'
) r
WHERE s.id = r.id;

-- 4) Place former Jun 7+ sets after that block
WITH missed AS (
  SELECT COUNT(*)::int AS n
  FROM public.trivia_sets
  WHERE scheduled_date >= DATE '2026-06-07'
    AND scheduled_date < DATE '2099-01-01'
)
UPDATE public.trivia_sets s
SET
  scheduled_date = DATE '2026-06-07' + missed.n + (r.rn - 1)::int,
  status = CASE WHEN s.status IN ('closed', 'live') THEN 'scheduled' ELSE s.status END,
  published_at = COALESCE(s.published_at, now()),
  updated_at = now()
FROM (
  SELECT id, ROW_NUMBER() OVER (ORDER BY scheduled_date, created_at) AS rn
  FROM public.trivia_sets
  WHERE scheduled_date BETWEEN DATE '2099-07-01' AND DATE '2099-12-30'
) r
CROSS JOIN missed
WHERE s.id = r.id;

UPDATE public.trivia_daily_stats ds
SET scheduled_date = s.scheduled_date
FROM public.trivia_sets s
WHERE ds.set_id = s.id;

COMMIT;

SELECT scheduled_date, status, title
FROM public.trivia_sets
ORDER BY scheduled_date ASC;
