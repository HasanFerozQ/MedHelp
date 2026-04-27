-- Migration: Final Toxicology Verification (Ultra-Safe)
-- Goal: Count the data without guessing column names.

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_mcqs INT;
    v_cases INT;
    v_case_qs INT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- 1. Count Standalone MCQs
    SELECT count(*) INTO v_mcqs FROM mcqs WHERE topic_id = v_topic_id;

    -- 2. Count Case Blocks
    SELECT count(*) INTO v_cases FROM case_studies WHERE topic_id = v_topic_id;

    -- 3. Count Questions inside Cases (Safe Count)
    SELECT count(*) INTO v_case_qs FROM case_questions;

    RAISE NOTICE '--- FINAL TOXICOLOGY VERIFICATION ---';
    RAISE NOTICE 'Standalone MCQs: %', v_mcqs;
    RAISE NOTICE 'Clinical Case Blocks: %', v_cases;
    RAISE NOTICE 'Total Questions in Case Table: %', v_case_qs;
    RAISE NOTICE '--------------------------------------';
    RAISE NOTICE 'Refresh your website now!';
END $$;
