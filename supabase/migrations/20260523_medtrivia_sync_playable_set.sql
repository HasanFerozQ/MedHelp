-- Lobby + join use get_today_set_for_play(); state must match. Enforces today-only 8 PM ET window for scheduled/live sets.

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
    s.allow_retakes
  FROM public.trivia_sets s
  CROSS JOIN et
  WHERE s.scheduled_date = et.today
    AND s.status IN ('scheduled', 'live', 'closed')
    AND EXISTS (SELECT 1 FROM public.trivia_questions q WHERE q.set_id = s.id)
  ORDER BY
    CASE s.status WHEN 'live' THEN 0 WHEN 'scheduled' THEN 1 WHEN 'closed' THEN 2 ELSE 3 END,
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

COMMIT;
