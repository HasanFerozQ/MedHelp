-- ==========================================
-- MedHelp Database Update — Case Study System
-- ==========================================

-- 1. Case Studies Table
CREATE TABLE IF NOT EXISTS public.case_studies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID REFERENCES public.topics(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    scenario TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Case Questions Table
CREATE TABLE IF NOT EXISTS public.case_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    case_id UUID REFERENCES public.case_studies(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    options JSONB NOT NULL, -- Format: ["A", "B", "C", "D"]
    correct_index INTEGER NOT NULL, -- 0-3
    explanation TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. Enable RLS
ALTER TABLE public.case_studies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.case_questions ENABLE ROW LEVEL SECURITY;

-- 4. Public Read Access
DROP POLICY IF EXISTS "Allow public read on case_studies" ON public.case_studies;
CREATE POLICY "Allow public read on case_studies" ON public.case_studies FOR SELECT USING (true);

DROP POLICY IF EXISTS "Allow public read on case_questions" ON public.case_questions;
CREATE POLICY "Allow public read on case_questions" ON public.case_questions FOR SELECT USING (true);

-- 5. Admin Full Access (Authenticated)
-- Restricted to specific Admin UID
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
