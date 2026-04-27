-- Migration: Toxicology Data Verification
-- Goal: Check if cases exist and if they are linked to MCQs.

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_cases INT;
    v_standalone_mcqs INT;
    v_case_mcqs INT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- 1. Count Cases
    SELECT count(*) INTO v_cases FROM clinical_cases WHERE topic_id = v_topic_id;

    -- 2. Count Standalone MCQs
    SELECT count(*) INTO v_standalone_mcqs FROM mcqs WHERE topic_id = v_topic_id AND case_id IS NULL;

    -- 3. Count MCQs linked to Cases
    SELECT count(*) INTO v_case_mcqs FROM mcqs WHERE topic_id = v_topic_id AND case_id IS NOT NULL;

    RAISE NOTICE '--- TOXICOLOGY STATUS ---';
    RAISE NOTICE 'Total Clinical Cases: %', v_cases;
    RAISE NOTICE 'Standalone MCQs: %', v_standalone_mcqs;
    RAISE NOTICE 'MCQs inside Cases: %', v_case_mcqs;
    RAISE NOTICE 'Total Questions: %', (v_standalone_mcqs + v_case_mcqs);
    RAISE NOTICE '------------------------';

    IF v_cases = 0 THEN
        RAISE NOTICE 'WARNING: No cases found! Please run the Toxicology Cases Master script.';
    END IF;
END $$;
