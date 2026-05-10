-- Migration: Fix Demo Tags and year_id type issues
-- Date: 2026-05-12

BEGIN;

-- 1. Reset all demo tags
UPDATE topics SET is_free_demo = false;

-- 2. Mark the first topic of each year as Free Demo
-- We use subqueries to find the topic with the minimum 'order' for each year
UPDATE topics 
SET is_free_demo = true 
WHERE id IN (
  SELECT id FROM (
    SELECT id, ROW_NUMBER() OVER(PARTITION BY year_id ORDER BY "order" ASC, created_at ASC) as rn
    FROM topics
    WHERE usmle_step IS NULL
  ) t WHERE rn = 1
);

-- 3. Mark the first USMLE Step topic as Free Demo (optional but good for UX)
UPDATE topics 
SET is_free_demo = true 
WHERE id IN (
  SELECT id FROM (
    SELECT id, ROW_NUMBER() OVER(PARTITION BY usmle_step ORDER BY "order" ASC, created_at ASC) as rn
    FROM topics
    WHERE usmle_step IS NOT NULL
  ) t WHERE rn = 1
);

-- 4. Double check specific logic for Flash Cards category 1
-- (Assuming category 1 is the first one in the list rendered on the page)

COMMIT;
