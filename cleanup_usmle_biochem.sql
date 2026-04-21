-- ==========================================
-- Cleanup USMLE Step 1 Dashboard
-- Removes specialized Semester 2 topics from clinical board view
-- ==========================================

DO $$ 
BEGIN
    -- 1. Remove USMLE Step 1 tag from specialized Biochemistry topics
    -- This keeps them in Semester 2 but removes them from the Board Prep grid.
    UPDATE topics 
    SET usmle_step = NULL 
    WHERE title IN ('Biochemistry (System Level)', 'Biochemistry (Metabolism + Genetics)');

    -- 2. (Optional) Ensure the generic Biochemistry topic exists for Step 1
    -- This ensures there is still a place for general Biochem content
    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-1-biochemistry') THEN
        INSERT INTO topics (title, slug, usmle_step, "order")
        VALUES ('Biochemistry', 'usmle-1-biochemistry', 1, 8);
    END IF;

    RAISE NOTICE 'USMLE Step 1 Dashboard cleaned. Specialized Biochemistry topics moved back to Semester 2 only.';
END $$;
