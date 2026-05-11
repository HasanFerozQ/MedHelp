-- DELETE all existing MCQs for Cardiac Emergencies to avoid redundancy
-- Run this FIRST before inserting new MCQs
DO $$
DECLARE
    topic_id_val UUID;
    deleted_count INTEGER;
BEGIN
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;
    IF topic_id_val IS NOT NULL THEN
        DELETE FROM mcqs WHERE topic_id = topic_id_val;
        GET DIAGNOSTICS deleted_count = ROW_COUNT;
        RAISE NOTICE 'Deleted % existing MCQs for Cardiac Emergencies', deleted_count;
    END IF;
END $$;
