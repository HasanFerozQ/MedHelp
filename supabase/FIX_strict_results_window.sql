-- =============================================================================
-- FIX: Strict Trivia Results Window & Next Day Rollover
-- Run ONCE in Supabase SQL Editor.
-- =============================================================================

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
    SELECT (now() AT TIME ZONE 'America/New_York') AS now_et
  ),
  target_date AS (
    SELECT CASE
      -- At 10:20 PM ET, rollover to tomorrow's date
      WHEN et.now_et::time >= '22:20:00'::time THEN (et.now_et + interval '1 day')::date
      ELSE et.now_et::date
    END AS fetch_date
    FROM et
  )
  SELECT
    s.id AS set_id,
    s.scheduled_date,
    s.status,
    -- Opens: 8:00 PM ET on the scheduled date
    ((s.scheduled_date::text || ' 20:00:00 America/New_York')::timestamptz) AS start_at,
    -- Closes: 8:20 PM ET same day (strict 20 min window)
    ((s.scheduled_date::text || ' 20:20:00 America/New_York')::timestamptz) AS end_at,
    -- Force allow_retakes to false for strict one-time play
    false AS allow_retakes
  FROM public.trivia_sets s
  CROSS JOIN target_date td
  WHERE s.scheduled_date = td.fetch_date
    AND s.status IN ('scheduled', 'live', 'closed')
    AND (SELECT COUNT(*)::int FROM public.trivia_questions q WHERE q.set_id = s.id) = 10
  ORDER BY
    CASE s.status WHEN 'live' THEN 0 WHEN 'scheduled' THEN 1 WHEN 'closed' THEN 2 ELSE 3 END,
    s.updated_at DESC
  LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION public.get_trivia_session_results(p_session_id uuid)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_results jsonb;
BEGIN
  -- Validate user owns session
  IF NOT EXISTS (
    SELECT 1 FROM public.trivia_sessions 
    WHERE id = p_session_id 
      AND (user_id = auth.uid() OR guest_token IS NOT NULL)
  ) THEN
    RAISE EXCEPTION 'Unauthorized or session does not exist';
  END IF;

  SELECT jsonb_agg(
    jsonb_build_object(
      'question_order', q.question_order,
      'prompt', q.prompt,
      'options', q.options,
      'correct_index', q.correct_index,
      'rationale', q.rationale,
      'user_selected_index', a.selected_index,
      'is_correct', a.is_correct
    ) ORDER BY q.question_order
  ) INTO v_results
  FROM public.trivia_sessions s
  JOIN public.trivia_questions q ON q.set_id = s.set_id
  LEFT JOIN public.trivia_answers a 
    ON a.session_id = p_session_id AND a.question_order = q.question_order
  WHERE s.id = p_session_id;

  RETURN COALESCE(v_results, '[]'::jsonb);
END;
$$;

REVOKE ALL ON FUNCTION public.get_trivia_session_results(uuid) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_trivia_session_results(uuid) TO anon, authenticated, service_role;
