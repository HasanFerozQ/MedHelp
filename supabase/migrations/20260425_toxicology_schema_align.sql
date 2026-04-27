-- Migration: Smart Align Toxicology Schema
-- Goal: Detect correct column names and move data.

BEGIN;

-- 1. Ensure the tables exist
CREATE TABLE IF NOT EXISTS case_studies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID REFERENCES topics(id) ON DELETE CASCADE,
    title TEXT,
    scenario TEXT NOT NULL,
    "order" INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS case_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    case_id UUID REFERENCES case_studies(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    options JSONB NOT NULL,
    correct_index INT NOT NULL,
    explanation TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_row RECORD;
    v_new_case_id UUID;
    v_mcq_row RECORD;
    v_case_num INT := 1;
    v_col_name TEXT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- Detect if it's case_id or case_study_id
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'case_questions' AND column_name = 'case_study_id') THEN
        v_col_name := 'case_study_id';
    ELSE
        v_col_name := 'case_id';
    END IF;

    -- 2. MOVE DATA FROM clinical_cases TO case_studies
    FOR v_case_row IN SELECT * FROM clinical_cases WHERE topic_id = v_topic_id LOOP
        
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clinical Case ' || LPAD(v_case_num::text, 2, '0'), v_case_row.case_text, v_case_num)
        RETURNING id INTO v_new_case_id;

        -- 3. MOVE LINKED MCQS TO case_questions using detected column
        FOR v_mcq_row IN SELECT * FROM mcqs WHERE case_id = v_case_row.id LOOP
            EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) 
                            VALUES ($1, $2, $3, $4, $5)', v_col_name)
            USING v_new_case_id, v_mcq_row.question, v_mcq_row.options, v_mcq_row.correct_index, v_mcq_row.explanation;
            
            DELETE FROM mcqs WHERE id = v_mcq_row.id;
        END LOOP;

        v_case_num := v_case_num + 1;
    END LOOP;

    DELETE FROM clinical_cases WHERE topic_id = v_topic_id;

    RAISE NOTICE 'SUCCESS: Aligned Toxicology cases using column %.', v_col_name;
END $$;

COMMIT;
