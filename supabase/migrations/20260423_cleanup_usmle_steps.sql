-- Cleanup: Remove USMLE Step 2 and Step 3
-- We are focusing exclusively on Step 1.

BEGIN;

-- 1. Identify and delete topics for Step 2 and 3
-- Cascading delete (if enabled) will handle MCQs/Cases, but we'll do it explicitly for safety.

DELETE FROM mcqs 
WHERE topic_id IN (SELECT id FROM topics WHERE usmle_step IN (2, 3));

DELETE FROM case_questions 
WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id IN (SELECT id FROM topics WHERE usmle_step IN (2, 3)));

DELETE FROM case_studies 
WHERE topic_id IN (SELECT id FROM topics WHERE usmle_step IN (2, 3));

DELETE FROM topics 
WHERE usmle_step IN (2, 3);

COMMIT;
