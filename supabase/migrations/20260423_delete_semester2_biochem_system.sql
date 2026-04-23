-- Migration: Delete "BIOCHEM (SYSTEM LEVEL)" from Semester 2
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Find the topic ID for "BIOCHEM (SYSTEM LEVEL)" in Semester 2
    SELECT id INTO v_topic_id 
    FROM topics 
    WHERE title ILIKE 'BIOCHEM (SYSTEM LEVEL)%' 
    AND semester_id = 2
    LIMIT 1;

    IF v_topic_id IS NOT NULL THEN
        -- 2. Delete associated MCQs
        DELETE FROM mcqs WHERE topic_id = v_topic_id;
        
        -- 3. Delete associated Case Questions and Case Studies
        DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
        DELETE FROM case_studies WHERE topic_id = v_topic_id;

        -- 4. Delete the topic itself
        DELETE FROM topics WHERE id = v_topic_id;

        RAISE NOTICE 'SUCCESS: "BIOCHEM (SYSTEM LEVEL)" and all related data removed from Semester 2.';
    ELSE
        RAISE NOTICE 'INFO: Topic "BIOCHEM (SYSTEM LEVEL)" not found in Semester 2. No action taken.';
    END IF;
END $$;

COMMIT;
