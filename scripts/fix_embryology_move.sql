-- Fix: Move General Embryology (with data) from Sem 2 to Sem 1
BEGIN;

-- 1. Identify and delete the empty shell in Semester 1
-- We ensure we only delete it if it has no questions/cases attached
DELETE FROM public.topics 
WHERE semester_id = 1 
  AND slug = 'general-embryology'
  AND NOT EXISTS (SELECT 1 FROM public.mcqs WHERE topic_id = public.topics.id)
  AND NOT EXISTS (SELECT 1 FROM public.case_studies WHERE topic_id = public.topics.id);

-- 2. Move the data-rich topic from Semester 2 to Semester 1
-- We also ensure the order is set correctly for Semester 1
UPDATE public.topics 
SET semester_id = 1, "order" = 8
WHERE semester_id = 2 
  AND slug = 'general-embryology';

COMMIT;
