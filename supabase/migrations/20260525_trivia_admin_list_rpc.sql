-- MedTrivia admin: list/upload via RPC (no Edge Function deploy required).
-- After migration, run ONCE in SQL Editor (same value as TRIVIA_ADMIN_SECRET):
--   SELECT public.trivia_admin_sync_secret('your-secret-here');

CREATE TABLE IF NOT EXISTS public.trivia_admin_config (
  id int PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  admin_secret text NOT NULL DEFAULT ''
);

ALTER TABLE public.trivia_admin_config ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.trivia_admin_sync_secret(p_secret text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF p_secret IS NULL OR length(trim(p_secret)) < 8 THEN
    RAISE EXCEPTION 'Secret must be at least 8 characters';
  END IF;
  INSERT INTO public.trivia_admin_config (id, admin_secret)
  VALUES (1, trim(p_secret))
  ON CONFLICT (id) DO UPDATE SET admin_secret = EXCLUDED.admin_secret;
END;
$$;

CREATE OR REPLACE FUNCTION public.trivia_admin_check_secret(p_admin_secret text)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_stored text;
BEGIN
  SELECT admin_secret INTO v_stored FROM public.trivia_admin_config WHERE id = 1;
  IF v_stored IS NULL OR length(v_stored) = 0 THEN
    RETURN false;
  END IF;
  RETURN trim(COALESCE(p_admin_secret, '')) = v_stored;
END;
$$;

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

CREATE OR REPLACE FUNCTION public.trivia_admin_upsert_set(
  p_admin_secret text,
  p_scheduled_date date,
  p_title text,
  p_questions jsonb,
  p_publish boolean DEFAULT false
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_set_id uuid;
  v_stored text;
BEGIN
  SELECT admin_secret INTO v_stored FROM public.trivia_admin_config WHERE id = 1;
  IF v_stored IS NULL OR length(v_stored) = 0 THEN
    RETURN jsonb_build_object(
      'ok', false,
      'error', 'Admin secret not configured in database. Run trivia_admin_sync_secret in SQL Editor first.'
    );
  END IF;
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

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
  v_existing_id uuid;
BEGIN
  SELECT id INTO v_existing_id
  FROM public.trivia_sets
  WHERE scheduled_date = p_scheduled_date
  LIMIT 1;

  IF v_existing_id IS NOT NULL THEN
    UPDATE public.trivia_sets
    SET
      title = COALESCE(p_title, title),
      status = CASE WHEN p_publish THEN 'scheduled' ELSE status END,
      published_at = CASE WHEN p_publish AND published_at IS NULL THEN now() ELSE published_at END,
      updated_at = now()
    WHERE id = v_existing_id
    RETURNING id INTO v_set_id;

    DELETE FROM public.trivia_questions WHERE set_id = v_set_id;
  ELSE
    INSERT INTO public.trivia_sets (
      scheduled_date, title, status, published_at, updated_at, allow_retakes
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

  FOR v_question IN SELECT jsonb_array_elements(p_questions)
  LOOP
    INSERT INTO public.trivia_questions (
      set_id, question_order, prompt, options, correct_index, rationale
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

  v_set_id := public.upsert_trivia_set_with_questions(
    p_scheduled_date,
    p_title,
    p_questions,
    p_publish
  );

  RETURN jsonb_build_object('ok', true, 'set_id', v_set_id, 'publish', p_publish);
END;
$$;

REVOKE ALL ON FUNCTION public.trivia_admin_sync_secret(text) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.trivia_admin_sync_secret(text) TO service_role;

GRANT EXECUTE ON FUNCTION public.trivia_admin_list_sets(text) TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.trivia_admin_upsert_set(text, date, text, jsonb, boolean) TO anon, authenticated, service_role;
