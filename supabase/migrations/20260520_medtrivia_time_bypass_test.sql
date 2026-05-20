-- TEST WINDOW: ignore 7:30 PM / 8:00 PM ET gates so MedTrivia can be played anytime.
-- Revert before production by restoring get_current_trivia_state from 20260520_medtrivia_daily_live.sql
-- or by applying a follow-up migration that restores the time-based logic.

BEGIN;

CREATE OR REPLACE FUNCTION public.get_current_trivia_state(now_tz timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
  v_local timestamp;
  v_today date;
  v_today_set uuid;
  v_set_status text;
BEGIN
  v_local := now_tz AT TIME ZONE 'America/New_York';
  v_today := v_local::date;

  SELECT id, status INTO v_today_set, v_set_status
  FROM public.trivia_sets
  WHERE scheduled_date = v_today
  LIMIT 1;

  IF v_today_set IS NULL THEN
    RETURN 'no_content';
  END IF;

  IF v_set_status = 'closed' THEN
    RETURN 'post_game';
  END IF;

  -- Bypass clock: any non-closed set for today is playable as "live"
  RETURN 'live';
END;
$$;

COMMIT;
