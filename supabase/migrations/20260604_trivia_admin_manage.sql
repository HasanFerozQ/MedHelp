-- =============================================================================
-- MedTrivia admin: change date & delete set RPCs.
-- Run ONCE in Supabase SQL Editor after existing trivia admin migrations.
-- =============================================================================

-- ── Change the scheduled_date of an existing quiz set ──────────────────────
CREATE OR REPLACE FUNCTION public.trivia_admin_change_date(
  p_admin_secret text,
  p_set_id uuid,
  p_new_date date
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_old_date date;
  v_conflict_id uuid;
BEGIN
  -- Auth check
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

  -- Verify set exists
  SELECT scheduled_date INTO v_old_date
    FROM public.trivia_sets WHERE id = p_set_id;
  IF v_old_date IS NULL THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Set not found');
  END IF;

  -- Check for date collision
  SELECT id INTO v_conflict_id
    FROM public.trivia_sets
   WHERE scheduled_date = p_new_date AND id <> p_set_id
   LIMIT 1;
  IF v_conflict_id IS NOT NULL THEN
    RETURN jsonb_build_object(
      'ok', false,
      'error', 'Another quiz already exists on ' || p_new_date::text
    );
  END IF;

  -- Perform update
  UPDATE public.trivia_sets
     SET scheduled_date = p_new_date,
         updated_at     = now()
   WHERE id = p_set_id;

  RETURN jsonb_build_object(
    'ok', true,
    'set_id', p_set_id,
    'old_date', v_old_date,
    'new_date', p_new_date
  );
END;
$$;

-- ── Delete a quiz set and all related data ─────────────────────────────────
CREATE OR REPLACE FUNCTION public.trivia_admin_delete_set(
  p_admin_secret text,
  p_set_id uuid
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_date date;
  v_title text;
BEGIN
  -- Auth check
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

  -- Verify set exists
  SELECT scheduled_date, title INTO v_date, v_title
    FROM public.trivia_sets WHERE id = p_set_id;
  IF v_date IS NULL THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Set not found');
  END IF;

  -- Delete responses that belong to sessions of this set
  DELETE FROM public.trivia_responses
   WHERE session_id IN (
     SELECT id FROM public.trivia_sessions WHERE set_id = p_set_id
   );

  -- Delete sessions
  DELETE FROM public.trivia_sessions WHERE set_id = p_set_id;

  -- Delete waiting-room presence rows (if column exists)
  BEGIN
    DELETE FROM public.trivia_waiting_room_presence WHERE set_id = p_set_id;
  EXCEPTION WHEN undefined_table OR undefined_column THEN
    NULL; -- table may not exist in all deployments
  END;

  -- Delete questions
  DELETE FROM public.trivia_questions WHERE set_id = p_set_id;

  -- Delete the set itself
  DELETE FROM public.trivia_sets WHERE id = p_set_id;

  RETURN jsonb_build_object(
    'ok', true,
    'deleted_set_id', p_set_id,
    'deleted_date', v_date,
    'deleted_title', v_title
  );
END;
$$;

-- ── Grant permissions ──────────────────────────────────────────────────────
GRANT EXECUTE ON FUNCTION public.trivia_admin_change_date(text, uuid, date)
  TO anon, authenticated, service_role;

GRANT EXECUTE ON FUNCTION public.trivia_admin_delete_set(text, uuid)
  TO anon, authenticated, service_role;
