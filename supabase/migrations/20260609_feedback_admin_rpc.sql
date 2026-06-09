-- Feedback submissions table + admin read RPC (same secret as MedTrivia admin).
-- Run in Supabase SQL Editor if not applied via migration tooling.

BEGIN;

CREATE TABLE IF NOT EXISTS public.feedback_submissions (
  id bigserial PRIMARY KEY,
  source text NOT NULL DEFAULT 'website',
  type text NOT NULL DEFAULT 'General Inquiry',
  name text,
  email text,
  phone text,
  message text NOT NULL,
  page_url text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS feedback_submissions_created_at_idx
  ON public.feedback_submissions (created_at DESC);

ALTER TABLE public.feedback_submissions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS feedback_submissions_insert_anon ON public.feedback_submissions;
CREATE POLICY feedback_submissions_insert_anon
ON public.feedback_submissions
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

GRANT INSERT ON public.feedback_submissions TO anon, authenticated;
GRANT USAGE, SELECT ON SEQUENCE public.feedback_submissions_id_seq TO anon, authenticated;

CREATE OR REPLACE FUNCTION public.trivia_admin_list_feedback(
  p_admin_secret text,
  p_limit int DEFAULT 1000
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_stored text;
  v_limit int;
BEGIN
  SELECT admin_secret INTO v_stored FROM public.trivia_admin_config WHERE id = 1;
  IF v_stored IS NULL OR length(v_stored) = 0 THEN
    RETURN jsonb_build_object(
      'ok', false,
      'error', 'Admin secret not configured. Run: SELECT public.trivia_admin_sync_secret(''your-secret'');'
    );
  END IF;
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

  v_limit := LEAST(GREATEST(COALESCE(p_limit, 1000), 1), 5000);

  RETURN jsonb_build_object(
    'ok', true,
    'feedback', COALESCE((
      SELECT jsonb_agg(
        jsonb_build_object(
          'id', f.id,
          'source', f.source,
          'type', f.type,
          'name', f.name,
          'email', f.email,
          'phone', f.phone,
          'message', f.message,
          'page_url', f.page_url,
          'created_at', f.created_at
        )
        ORDER BY f.created_at DESC
      )
      FROM (
        SELECT *
        FROM public.feedback_submissions
        ORDER BY created_at DESC
        LIMIT v_limit
      ) f
    ), '[]'::jsonb)
  );
END;
$$;

GRANT EXECUTE ON FUNCTION public.trivia_admin_list_feedback(text, int)
  TO anon, authenticated, service_role;

-- Delete feedback RPC
CREATE OR REPLACE FUNCTION public.trivia_admin_delete_feedback(
  p_admin_secret text,
  p_id bigint
)
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
      'error', 'Admin secret not configured.'
    );
  END IF;
  IF NOT public.trivia_admin_check_secret(p_admin_secret) THEN
    RETURN jsonb_build_object('ok', false, 'error', 'Unauthorized');
  END IF;

  DELETE FROM public.feedback_submissions WHERE id = p_id;

  RETURN jsonb_build_object('ok', true);
END;
$$;

GRANT EXECUTE ON FUNCTION public.trivia_admin_delete_feedback(text, bigint)
  TO anon, authenticated, service_role;

COMMIT;
