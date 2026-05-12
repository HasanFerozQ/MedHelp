-- Migration: Create Licenses Table and RLS Policies
-- Date: 2026-05-12
-- Goal: Ensure the licenses table exists for secure license tracking.

BEGIN;

-- 1. Create Licenses Table
CREATE TABLE IF NOT EXISTS licenses (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    license_key TEXT UNIQUE NOT NULL,
    email TEXT NOT NULL,
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'expired', 'revoked')),
    source TEXT DEFAULT 'gumroad',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    expires_at TIMESTAMP WITH TIME ZONE
);

-- 2. Enable RLS
ALTER TABLE licenses ENABLE ROW LEVEL SECURITY;

-- 3. Create RLS Policies
DROP POLICY IF EXISTS "Users can view own licenses" ON licenses;
CREATE POLICY "Users can view own licenses" ON licenses
    FOR SELECT USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own licenses" ON licenses;
CREATE POLICY "Users can insert own licenses" ON licenses
    FOR INSERT WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own licenses" ON licenses;
CREATE POLICY "Users can update own licenses" ON licenses
    FOR UPDATE USING (auth.uid() = user_id);

-- 4. Create Indexes
CREATE INDEX IF NOT EXISTS idx_licenses_user_id ON licenses(user_id);
CREATE INDEX IF NOT EXISTS idx_licenses_license_key ON licenses(license_key);

COMMIT;
