-- Migration: Fix Cardiac Emergencies MCQ and Case Counts
-- Date: 2026-05-12
-- Goal: Synchronize the topics table metadata with the actual record counts in mcqs and case_studies tables.

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_standalone_mcq_count INT;
    v_case_count INT;
BEGIN
    -- 1. Identify the topic
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE NOTICE 'Topic em-cardiac-emergencies not found. Skipping count synchronization.';
    ELSE
        -- 2. Calculate actual standalone MCQ count
        SELECT count(*) INTO v_standalone_mcq_count 
        FROM mcqs 
        WHERE topic_id = v_topic_id;

        -- 3. Calculate actual case study count
        SELECT count(*) INTO v_case_count 
        FROM case_studies 
        WHERE topic_id = v_topic_id;

        -- 4. Update the topics table with correct counts
        UPDATE topics 
        SET 
            mcq_count = v_standalone_mcq_count,
            case_count = v_case_count
        WHERE id = v_topic_id;

        RAISE NOTICE 'SUCCESS: Synchronized Cardiac Emergencies. MCQs: %, Cases: %', v_standalone_mcq_count, v_case_count;
    END IF;
END $$;

COMMIT;
