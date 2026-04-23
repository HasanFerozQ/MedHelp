-- ============================================================
-- Migration: Semester → Year System
-- Maps: S1+S2 → Year 1, S3+S4 → Year 2, S5+S6 → Year 3, S7+S8 → Year 4
-- Date: 2026-04-23
-- ============================================================

BEGIN;

-- Step 1: Add a new year_id column to topics
ALTER TABLE topics ADD COLUMN IF NOT EXISTS year_id INTEGER;

-- Step 2: Populate year_id based on existing semester_id
UPDATE topics SET year_id = 1 WHERE semester_id IN (1, 2);
UPDATE topics SET year_id = 2 WHERE semester_id IN (3, 4);
UPDATE topics SET year_id = 3 WHERE semester_id IN (5, 6);
UPDATE topics SET year_id = 4 WHERE semester_id IN (7, 8);

-- Step 3: Set a default for any unset topics (safety net)
UPDATE topics SET year_id = 1 WHERE year_id IS NULL;

-- Step 4: Verify the result
DO $$
DECLARE
    y1 INT; y2 INT; y3 INT; y4 INT;
BEGIN
    SELECT COUNT(*) INTO y1 FROM topics WHERE year_id = 1;
    SELECT COUNT(*) INTO y2 FROM topics WHERE year_id = 2;
    SELECT COUNT(*) INTO y3 FROM topics WHERE year_id = 3;
    SELECT COUNT(*) INTO y4 FROM topics WHERE year_id = 4;
    RAISE NOTICE '✅ Year System Migration Complete:';
    RAISE NOTICE '   1st Year Topics: %', y1;
    RAISE NOTICE '   2nd Year Topics: %', y2;
    RAISE NOTICE '   3rd Year Topics: %', y3;
    RAISE NOTICE '   4th Year Topics: %', y4;
END $$;

COMMIT;
