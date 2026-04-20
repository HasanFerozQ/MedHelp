-- ==========================================
-- MedHelp Comprehensive Migration v5.0
-- 1. Updates Topics Schema (Slugs & Constraints)
-- 2. Creates Case Study System Tables
-- ==========================================

-- 1. Update Topics Table
DO $$ 
BEGIN
    -- Add slug column if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='topics' AND column_name='slug') THEN
        ALTER TABLE public.topics ADD COLUMN slug TEXT;
    END IF;
END $$;

-- Populate missing slugs (simple conversion)
UPDATE public.topics 
SET slug = LOWER(REPLACE(title, ' ', '-'))
WHERE slug IS NULL;

-- Add Unique Constraints to Topics
-- Note: We drop existing ones to ensure clean state
ALTER TABLE public.topics DROP CONSTRAINT IF EXISTS topics_semester_id_title_key;
ALTER TABLE public.topics ADD CONSTRAINT topics_semester_id_title_key UNIQUE (semester_id, title);

ALTER TABLE public.topics DROP CONSTRAINT IF EXISTS topics_semester_id_slug_key;
ALTER TABLE public.topics ADD CONSTRAINT topics_semester_id_slug_key UNIQUE (semester_id, slug);


-- 2. Create Case Studies Table
CREATE TABLE IF NOT EXISTS public.case_studies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID REFERENCES public.topics(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    scenario TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. Create Case Questions Table
CREATE TABLE IF NOT EXISTS public.case_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    case_id UUID REFERENCES public.case_studies(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    options JSONB NOT NULL, -- Format: ["A", "B", "C", "D"]
    correct_index INTEGER NOT NULL, -- 0-3
    explanation TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);


-- 4. Security (RLS)
ALTER TABLE public.case_studies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.case_questions ENABLE ROW LEVEL SECURITY;

-- Public Read
DROP POLICY IF EXISTS "Allow public read on case_studies" ON public.case_studies;
CREATE POLICY "Allow public read on case_studies" ON public.case_studies FOR SELECT USING (true);

DROP POLICY IF EXISTS "Allow public read on case_questions" ON public.case_questions;
CREATE POLICY "Allow public read on case_questions" ON public.case_questions FOR SELECT USING (true);

-- Admin Full Access (Specific UID)
DROP POLICY IF EXISTS "Allow admin all on case_studies" ON public.case_studies;
CREATE POLICY "Allow admin all on case_studies" ON public.case_studies 
FOR ALL TO authenticated 
USING (auth.uid() = '0fcd3894-4ca1-4538-9f45-b0334ee65407') 
WITH CHECK (auth.uid() = '0fcd3894-4ca1-4538-9f45-b0334ee65407');

DROP POLICY IF EXISTS "Allow admin all on case_questions" ON public.case_questions;
CREATE POLICY "Allow admin all on case_questions" ON public.case_questions 
FOR ALL TO authenticated 
USING (auth.uid() = '0fcd3894-4ca1-4538-9f45-b0334ee65407') 
WITH CHECK (auth.uid() = '0fcd3894-4ca1-4538-9f45-b0334ee65407');
