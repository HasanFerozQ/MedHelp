-- Migration: Add type to mcqs
-- Date: 2026-04-28

BEGIN;

-- Add type column if it doesn't exist
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_attribute WHERE attrelid = 'mcqs'::regclass AND attname = 'type') THEN
        ALTER TABLE mcqs ADD COLUMN type VARCHAR(10) DEFAULT 'MCQ';
    END IF;
END $$;

COMMIT;
