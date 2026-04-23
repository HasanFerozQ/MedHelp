-- Cleanup: Remove all Microbiology cases to fix double-upload
-- Run this, then re-run the 60-case migration ONCE.

BEGIN;

-- Identify the topic
DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-microbiology' LIMIT 1;

    IF v_topic_id IS NOT NULL THEN
        -- Delete questions first (child table)
        DELETE FROM case_questions 
        WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);

        -- Delete cases (parent table)
        DELETE FROM case_studies 
        WHERE topic_id = v_topic_id;
        
        RAISE NOTICE 'Microbiology cases cleared. You can now re-run the migration script once.';
    ELSE
        RAISE NOTICE 'Topic not found. Nothing to clear.';
    END IF;
END $$;

COMMIT;
