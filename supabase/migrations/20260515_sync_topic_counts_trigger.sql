-- Migration: Automatic Topic Count Synchronization (Triggers)
-- Date: 2026-05-15
-- Goal: Ensure mcq_count and case_count in the topics table are always accurate without manual intervention or slow frontend counts.

BEGIN;

---------------------------------------------------------------------------
-- 1. TRIGGER FUNCTION: sync_topic_counts
---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_sync_topic_counts()
RETURNS TRIGGER AS $$
DECLARE
    v_topic_id UUID;
    v_mcq_count INT;
    v_case_count INT;
BEGIN
    -- Determine which topic_id to sync (works for both INSERT and DELETE)
    IF (TG_OP = 'DELETE') THEN
        v_topic_id := OLD.topic_id;
    ELSE
        v_topic_id := NEW.topic_id;
    END IF;

    -- Exit if no topic_id is found (shouldn't happen with FK constraints)
    IF v_topic_id IS NULL THEN
        RETURN NULL;
    END IF;

    -- Calculate current counts for the topic
    SELECT count(*) INTO v_mcq_count FROM mcqs WHERE topic_id = v_topic_id;
    SELECT count(*) INTO v_case_count FROM case_studies WHERE topic_id = v_topic_id;

    -- Update the topics table
    UPDATE topics 
    SET 
        mcq_count = v_mcq_count,
        case_count = v_case_count
    WHERE id = v_topic_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------
-- 2. ATTACH TRIGGERS TO mcqs TABLE
---------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_sync_mcq_count ON mcqs;
CREATE TRIGGER trg_sync_mcq_count
AFTER INSERT OR DELETE OR UPDATE OF topic_id ON mcqs
FOR EACH ROW
EXECUTE FUNCTION fn_sync_topic_counts();

---------------------------------------------------------------------------
-- 3. ATTACH TRIGGERS TO case_studies TABLE
---------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_sync_case_count ON case_studies;
CREATE TRIGGER trg_sync_case_count
AFTER INSERT OR DELETE OR UPDATE OF topic_id ON case_studies
FOR EACH ROW
EXECUTE FUNCTION fn_sync_topic_counts();

---------------------------------------------------------------------------
-- 4. ONE-TIME SYNCHRONIZATION FOR ALL TOPICS
---------------------------------------------------------------------------
-- This ensures that any existing discrepancies (like the 516 count) are fixed immediately.
UPDATE topics t
SET 
    mcq_count = (SELECT count(*) FROM mcqs m WHERE m.topic_id = t.id),
    case_count = (SELECT count(*) FROM case_studies c WHERE c.topic_id = t.id);

COMMIT;
