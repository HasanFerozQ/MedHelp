-- Fix: Rename 'Physiology' (Sem 2) to 'General Physiology' and move to Sem 1
BEGIN;

-- 1. Delete the empty/wrong shell in Semester 1
-- We only delete it if it has no data attached
DELETE FROM public.topics 
WHERE semester_id = 1 
  AND slug = 'general-physiology'
  AND NOT EXISTS (SELECT 1 FROM public.mcqs WHERE topic_id = public.topics.id)
  AND NOT EXISTS (SELECT 1 FROM public.case_studies WHERE topic_id = public.topics.id);

-- 2. Rename and move the actual topic from Semester 2
-- We update BOTH title and slug to match the new naming convention
UPDATE public.topics 
SET title = 'General Physiology',
    slug = 'general-physiology',
    semester_id = 1,
    "order" = 5
WHERE semester_id = 2 
  AND slug = 'physiology';

COMMIT;
