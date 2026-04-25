-- Migration: Blog Read Count Analytics (v2.1)
-- Date: 2026-04-25
-- Purpose: Track real-time views for blog posts

BEGIN;

-- 1. Create Analytics Table
CREATE TABLE IF NOT EXISTS blog_analytics (
    slug TEXT PRIMARY KEY,
    view_count BIGINT DEFAULT 0,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Create Atomic Increment Function (RPC)
CREATE OR REPLACE FUNCTION increment_blog_view(blog_slug TEXT)
RETURNS BIGINT AS $$
DECLARE
    new_count BIGINT;
BEGIN
    INSERT INTO blog_analytics (slug, view_count)
    VALUES (blog_slug, 1)
    ON CONFLICT (slug) 
    DO UPDATE SET 
        view_count = blog_analytics.view_count + 1,
        updated_at = NOW()
    RETURNING view_count INTO new_count;
    
    RETURN new_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Enable public access
ALTER TABLE blog_analytics ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access to blog_analytics" ON blog_analytics;
CREATE POLICY "Allow public read access to blog_analytics"
ON blog_analytics FOR SELECT
TO public
USING (true);

-- Fixed RAISE NOTICE (must be inside a DO block)
DO $$ 
BEGIN 
    RAISE NOTICE 'SUCCESS: Blog Analytics (v2.1) initialized.'; 
END $$;

COMMIT;
