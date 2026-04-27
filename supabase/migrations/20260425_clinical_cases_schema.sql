-- Migration: Create Clinical Cases Schema
-- Date: 2026-04-25

BEGIN;

-- 1. Create the clinical_cases table
CREATE TABLE IF NOT EXISTS clinical_cases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    topic_id UUID REFERENCES topics(id) ON DELETE CASCADE,
    case_text TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Add case_id to mcqs table to link them
ALTER TABLE mcqs ADD COLUMN IF NOT EXISTS case_id UUID REFERENCES clinical_cases(id) ON DELETE SET NULL;

-- 3. Create an index for faster lookups
CREATE INDEX IF NOT EXISTS idx_mcqs_case_id ON mcqs(case_id);

RAISE NOTICE 'SUCCESS: Clinical Cases schema initialized.';

COMMIT;
