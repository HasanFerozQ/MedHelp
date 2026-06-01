-- =============================================================================
-- Add participant count to trivia_admin_list_sets RPC.
-- Run ONCE in Supabase SQL Editor.
-- =============================================================================

CREATE OR REPLACE FUNCTION public.trivia_admin_list_sets(p_admin_secret text)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_stored text;
BEGIN
  SELECT admin_secret INTO v_stored FROM public.trivia_admin_config WHERE id = 1;
  IF v_stored IS NULL OR length(v_stored) = 0 THEN
    RETURN jsonb_build_object(
      'ok', false,
      'error', 'Admin secret not configured in database. In SQL Editor run: SELECT public.trivia_admin_sync_secret(''your-secret'');'
    );
  END IF;
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

  RETURN jsonb_build_object(
    'ok', true,
    'sets', COALESCE((
      SELECT jsonb_agg(
        jsonb_build_object(
          'set_id', s.id,
          'scheduled_date', s.scheduled_date,
          'title', s.title,
          'status', s.status,
          'question_count', (SELECT count(*)::int FROM public.trivia_questions q WHERE q.set_id = s.id),
          'participants', (SELECT count(*)::int FROM public.trivia_sessions ts WHERE ts.set_id = s.id),
          'completers', (SELECT count(*)::int FROM public.trivia_sessions ts WHERE ts.set_id = s.id AND ts.status = 'finished'),
          'created_at', s.created_at,
          'published_at', s.published_at,
          'updated_at', s.updated_at,
          'allow_retakes', s.allow_retakes
        )
        ORDER BY s.created_at DESC
      )
      FROM public.trivia_sets s
    ), '[]'::jsonb)
  );
END;
$$;
