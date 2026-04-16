-- ==========================================
-- MediHelp MCQ Exam System Schema
-- ==========================================

-- 1. Semesters (1-8)
CREATE TABLE IF NOT EXISTS public.semesters (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "order" INTEGER NOT NULL
);

-- Seed Semesters if they don't exist
INSERT INTO public.semesters (id, name, "order")
VALUES 
    (1, 'Semester 1', 1),
    (2, 'Semester 2', 2),
    (3, 'Semester 3', 3),
    (4, 'Semester 4', 4),
    (5, 'Semester 5', 5),
    (6, 'Semester 6', 6),
    (7, 'Semester 7', 7),
    (8, 'Semester 8', 8)
ON CONFLICT (id) DO NOTHING;

-- 2. Topics
CREATE TABLE IF NOT EXISTS public.topics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    semester_id INTEGER REFERENCES public.semesters(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. MCQs
CREATE TABLE IF NOT EXISTS public.mcqs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID REFERENCES public.topics(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    image_url TEXT,
    options JSONB NOT NULL, -- Format: ["A", "B", "C", "D"]
    correct_index INTEGER NOT NULL, -- 0, 1, 2, or 3
    explanation TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- ==========================================
-- Security (RLS)
-- ==========================================

-- Enable RLS
ALTER TABLE public.semesters ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mcqs ENABLE ROW LEVEL SECURITY;

-- 1. Public Read (SELECT) for everyone
CREATE POLICY "Allow public read on semesters" ON public.semesters FOR SELECT USING (true);
CREATE POLICY "Allow public read on topics" ON public.topics FOR SELECT USING (true);
CREATE POLICY "Allow public read on mcqs" ON public.mcqs FOR SELECT USING (true);

-- 2. Admin (Authenticated) Write/Update/Delete
-- Ensure you have an Admin role or specific UID check
CREATE POLICY "Allow admin all on semesters" ON public.semesters 
FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow admin all on topics" ON public.topics 
FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow admin all on mcqs" ON public.mcqs 
FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- ==========================================
-- Storage (MCQ Images)
-- ==========================================

-- Insert bucket for storage (Required for Supabase Storage)
INSERT INTO storage.buckets (id, name, public) 
VALUES ('mcq-images', 'mcq-images', true)
ON CONFLICT (id) DO NOTHING;

-- Storage Policies (Allow public to view, authenticated to upload)
CREATE POLICY "Public Access" ON storage.objects FOR SELECT USING (bucket_id = 'mcq-images');
CREATE POLICY "Admin Upload" ON storage.objects FOR INSERT TO authenticated WITH CHECK (bucket_id = 'mcq-images');
CREATE POLICY "Admin Delete" ON storage.objects FOR DELETE TO authenticated USING (bucket_id = 'mcq-images');
