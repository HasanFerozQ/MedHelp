-- Migration: Add Performance Indexes for Medical Quiz Engine
-- Date: 2026-05-10
-- Description: Resolves statement timeouts when fetching year dashboards by indexing foreign keys.

BEGIN;

-- Add indexes to foreign keys used in complex topic joins
CREATE INDEX IF NOT EXISTS idx_mcqs_topic_id ON mcqs(topic_id);
CREATE INDEX IF NOT EXISTS idx_case_studies_topic_id ON case_studies(topic_id);
CREATE INDEX IF NOT EXISTS idx_case_questions_case_id ON case_questions(case_id);

-- Also add an index on year_id to speed up the main topics fetch
CREATE INDEX IF NOT EXISTS idx_topics_year_id ON topics(year_id);

COMMIT;
