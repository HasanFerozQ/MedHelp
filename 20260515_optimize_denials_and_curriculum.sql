-- 20260515_optimize_denials_and_curriculum.sql
-- Optimizes search for CARC/RARC codes and resolves curriculum loading bottlenecks.

-- 1. Indexing for Claim Denial Codes (CARC & RARC)
-- B-TREE for exact code matches and prefix searches
CREATE INDEX IF NOT EXISTS idx_carc_codes_code ON carc_codes (code);
CREATE INDEX IF NOT EXISTS idx_rarc_codes_code ON rarc_codes (code);

-- GIN index for full-text description search
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX IF NOT EXISTS idx_carc_codes_description_trgm ON carc_codes USING gin (description gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_rarc_codes_description_trgm ON rarc_codes USING gin (description gin_trgm_ops);

-- 2. Indexing for Curriculum Tables
CREATE INDEX IF NOT EXISTS idx_mcqs_topic_id ON mcqs (topic_id);
CREATE INDEX IF NOT EXISTS idx_mcqs_type ON mcqs (type);
CREATE INDEX IF NOT EXISTS idx_case_studies_topic_id ON case_studies (topic_id);
CREATE INDEX IF NOT EXISTS idx_topics_year_id ON topics (year_id);

-- 3. Analyze to update stats
ANALYZE carc_codes;
ANALYZE rarc_codes;
ANALYZE mcqs;
ANALYZE topics;
