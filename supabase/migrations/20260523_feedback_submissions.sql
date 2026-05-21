-- Path A: store site feedback in Supabase (no SMTP required on free ImprovMX).

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

-- No public read; use Supabase dashboard or service role to review.

GRANT INSERT ON public.feedback_submissions TO anon, authenticated;
GRANT USAGE, SELECT ON SEQUENCE public.feedback_submissions_id_seq TO anon, authenticated;

COMMIT;
