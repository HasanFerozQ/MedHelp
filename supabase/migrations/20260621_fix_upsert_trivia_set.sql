-- =============================================================================
-- CRITICAL FIX: Create missing upsert_trivia_set_with_questions function.
-- Run ONCE in Supabase SQL Editor.
--
-- This function is called by:
--   - trivia_admin_upsert_set RPC
--   - trivia-admin-schedule Edge Function
--   - seed_medtrivia_first_set.sql
-- =============================================================================

BEGIN;

CREATE OR REPLACE FUNCTION public.upsert_trivia_set_with_questions(
  p_scheduled_date date,
  p_title text,
  p_questions jsonb,
  p_publish boolean DEFAULT false
)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_set_id uuid;
  v_question jsonb;
  v_scheduled_date date;
  v_existing_id uuid;
BEGIN
  -- Find existing set for this scheduled_date
  SELECT id INTO v_existing_id
  FROM public.trivia_sets
  WHERE scheduled_date = p_scheduled_date
  LIMIT 1;

  IF v_existing_id IS NOT NULL THEN
    -- Update existing set
    UPDATE public.trivia_sets
    SET
      title = COALESCE(p_title, title),
      status = CASE WHEN p_publish THEN 'scheduled' ELSE status END,
      published_at = CASE WHEN p_publish AND published_at IS NULL THEN now() ELSE published_at END,
      updated_at = now()
    WHERE id = v_existing_id
    RETURNING id INTO v_set_id;

    -- Delete existing questions for this set
    DELETE FROM public.trivia_questions WHERE set_id = v_set_id;
  ELSE
    -- Insert new set
    INSERT INTO public.trivia_sets (
      scheduled_date,
      title,
      status,
      published_at,
      updated_at,
      allow_retakes
    )
    VALUES (
      p_scheduled_date,
      COALESCE(p_title, 'MedTrivia Daily'),
      CASE WHEN p_publish THEN 'scheduled' ELSE 'draft' END,
      CASE WHEN p_publish THEN now() ELSE NULL END,
      now(),
      false
    )
    RETURNING id INTO v_set_id;
  END IF;

  -- Insert new questions
  FOR v_question IN SELECT jsonb_array_elements(p_questions)
  LOOP
    INSERT INTO public.trivia_questions (
      set_id,
      question_order,
      prompt,
      options,
      correct_index,
      rationale
    )
    VALUES (
      v_set_id,
      (v_question->>'question_order')::int,
      v_question->>'prompt',
      v_question->'options',
      (v_question->>'correct_index')::int,
      v_question->>'rationale'
    );
  END LOOP;

  RETURN v_set_id;
END;
$$;

GRANT EXECUTE ON FUNCTION public.upsert_trivia_set_with_questions(date, text, jsonb, boolean)
  TO anon, authenticated, service_role;

COMMIT;
