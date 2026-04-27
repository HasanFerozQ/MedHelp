-- Migration: Final Toxicology Count Fix (Aligned)
-- Goal: Set counts based on the app-standard tables.

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_standalone_mcq_count INT;
    v_case_count INT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- 1. Count standalone MCQs
    SELECT count(*) INTO v_standalone_mcq_count 
    FROM mcqs 
    WHERE topic_id = v_topic_id;

    -- 2. Count the 40 cases from the correct table
    SELECT count(*) INTO v_case_count 
    FROM case_studies 
    WHERE topic_id = v_topic_id;

    -- 3. Update the UI counts
    UPDATE topics 
    SET 
        mcq_count = v_standalone_mcq_count, -- Should be 335
        case_count = v_case_count           -- Should be 40
    WHERE id = v_topic_id;

    RAISE NOTICE 'SUCCESS: Set standalone MCQs to % and Cases to %.', v_standalone_mcq_count, v_case_count;
END $$;

COMMIT;
