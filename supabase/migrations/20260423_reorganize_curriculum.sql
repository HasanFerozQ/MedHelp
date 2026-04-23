-- Migration: Reorganize Curriculum - Duplicate Topics to USMLE Step 1 and Cleanup
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_old_topic_id UUID;
    v_new_topic_id UUID;
    v_case_id UUID;
    v_new_case_id UUID;
    v_topic_name TEXT;
    v_target_usmle_step INTEGER := 1;
BEGIN

    -- Helper Logic to Duplicate a Topic and its Content
    -- We will iterate through the requested topics

    FOR v_topic_name IN 
        SELECT unnest(ARRAY[
            'Cardiovascular System', 
            'Respiratory System', 
            'Renal System', 
            'GI System', 
            'Endocrine System', 
            'Reproductive System', 
            'Neuroanatomy',
            'Blood Physiology' -- Will handle rename separately
        ])
    LOOP
        -- Find the source topic (MBBS/US MD - usually usmle_step is NULL)
        SELECT id INTO v_old_topic_id FROM topics WHERE title = v_topic_name AND (usmle_step IS NULL OR usmle_step != v_target_usmle_step) LIMIT 1;

        IF v_old_topic_id IS NOT NULL THEN
            -- Create/Get the target topic in USMLE 1
            -- Handle Rename for Blood Physiology -> Hematology
            IF v_topic_name = 'Blood Physiology' THEN
                INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
                VALUES (1, 'Hematology', 'hematology', 20, v_target_usmle_step)
                ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, usmle_step = EXCLUDED.usmle_step
                RETURNING id INTO v_new_topic_id;
            ELSE
                INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
                VALUES (1, v_topic_name, lower(replace(v_topic_name, ' ', '-')), 15, v_target_usmle_step)
                ON CONFLICT (slug) DO UPDATE SET usmle_step = EXCLUDED.usmle_step
                RETURNING id INTO v_new_topic_id;
            END IF;

            -- 1. Duplicate MCQs
            INSERT INTO mcqs (topic_id, question, options, correct_index, explanation, image_url)
            SELECT v_new_topic_id, question, options, correct_index, explanation, image_url
            FROM mcqs WHERE topic_id = v_old_topic_id
            ON CONFLICT DO NOTHING; -- Avoid exact duplicates if re-run

            -- 2. Duplicate Case Studies and their Questions
            FOR v_case_id IN SELECT id FROM case_studies WHERE topic_id = v_old_topic_id LOOP
                -- Insert the Case Study
                INSERT INTO case_studies (topic_id, title, scenario, "order")
                SELECT v_new_topic_id, title, scenario, "order"
                FROM case_studies WHERE id = v_case_id
                RETURNING id INTO v_new_case_id;

                -- Insert Questions for this Case
                INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
                SELECT v_new_case_id, question, options, correct_index, explanation
                FROM case_questions WHERE case_id = v_case_id;
            END LOOP;

            RAISE NOTICE 'Duplicated % to USMLE 1', v_topic_name;
        ELSE
            RAISE NOTICE 'Source topic % not found', v_topic_name;
        END IF;
    END LOOP;

    -- Special Case: Merge "Systemic Embryology" and "General Embryology" into "Embryology"
    -- 1. Create target topic "Embryology"
    INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
    VALUES (1, 'Embryology', 'embryology', 5, v_target_usmle_step)
    ON CONFLICT (slug) DO UPDATE SET usmle_step = EXCLUDED.usmle_step
    RETURNING id INTO v_new_topic_id;

    -- 2. Copy from "General Embryology"
    SELECT id INTO v_old_topic_id FROM topics WHERE title = 'General Embryology' LIMIT 1;
    IF v_old_topic_id IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation, image_url)
        SELECT v_new_topic_id, question, options, correct_index, explanation, image_url
        FROM mcqs WHERE topic_id = v_old_topic_id;

        FOR v_case_id IN SELECT id FROM case_studies WHERE topic_id = v_old_topic_id LOOP
            INSERT INTO case_studies (topic_id, title, scenario, "order")
            SELECT v_new_topic_id, title, scenario, "order"
            FROM case_studies WHERE id = v_case_id
            RETURNING id INTO v_new_case_id;

            INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
            SELECT v_new_case_id, question, options, correct_index, explanation
            FROM case_questions WHERE case_id = v_case_id;
        END LOOP;
    END IF;

    -- 3. Copy from "Systemic Embryology"
    SELECT id INTO v_old_topic_id FROM topics WHERE title = 'Systemic Embryology' LIMIT 1;
    IF v_old_topic_id IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation, image_url)
        SELECT v_new_topic_id, question, options, correct_index, explanation, image_url
        FROM mcqs WHERE topic_id = v_old_topic_id;

        FOR v_case_id IN SELECT id FROM case_studies WHERE topic_id = v_old_topic_id LOOP
            INSERT INTO case_studies (topic_id, title, scenario, "order")
            SELECT v_new_topic_id, title, scenario, "order"
            FROM case_studies WHERE id = v_case_id
            RETURNING id INTO v_new_case_id;

            INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
            SELECT v_new_case_id, question, options, correct_index, explanation
            FROM case_questions WHERE case_id = v_case_id;
        END LOOP;
    END IF;

    -- Final Cleanup: Delete Immunology from MBBS Semester 1
    -- We define MBBS as usmle_step IS NULL
    DELETE FROM topics WHERE title = 'Immunology' AND semester_id = 1 AND usmle_step IS NULL;

    RAISE NOTICE 'Curriculum reorganization complete.';

END $$;

COMMIT;
