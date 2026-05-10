-- MediHelp Secure Licensing & Authentication Rollout
-- Migration: 20260511_secure_rls_licensing.sql

BEGIN;

-- 1. Add Column: is_free_demo to topics
ALTER TABLE topics ADD COLUMN IF NOT EXISTS is_free_demo BOOLEAN DEFAULT false;

-- 2. Backfill Data: Set is_free_demo = true for the first topic in each year.
-- We'll use a subquery to find the minimum order for each year_id.
WITH first_topics AS (
    SELECT id FROM (
        SELECT id, ROW_NUMBER() OVER (PARTITION BY year_id ORDER BY "order" ASC, id ASC) as rank
        FROM topics
        WHERE usmle_step IS NULL
    ) t WHERE rank = 1
)
UPDATE topics SET is_free_demo = true WHERE id IN (SELECT id FROM first_topics);

-- 3. Enable RLS on topics, mcqs, and case_studies
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE mcqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE case_studies ENABLE ROW LEVEL SECURITY;

-- 4. Public Policies: Allow reading of demo topics and their children
DROP POLICY IF EXISTS "Public demo topics are readable by everyone" ON topics;
CREATE POLICY "Public demo topics are readable by everyone" ON topics
    FOR SELECT USING (is_free_demo = true);

DROP POLICY IF EXISTS "Public demo mcqs are readable by everyone" ON mcqs;
CREATE POLICY "Public demo mcqs are readable by everyone" ON mcqs
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM topics 
            WHERE topics.id = mcqs.topic_id 
            AND topics.is_free_demo = true
        )
    );

DROP POLICY IF EXISTS "Public demo case studies are readable by everyone" ON case_studies;
CREATE POLICY "Public demo case studies are readable by everyone" ON case_studies
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM topics 
            WHERE topics.id = case_studies.topic_id 
            AND topics.is_free_demo = true
        )
    );

-- 5. Premium Policies: Allow access if logged in AND active license exists
DROP POLICY IF EXISTS "Premium topics readable by licensed users" ON topics;
CREATE POLICY "Premium topics readable by licensed users" ON topics
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND EXISTS (
            SELECT 1 FROM licenses 
            WHERE user_id = auth.uid() 
            AND status = 'active'
        )
    );

DROP POLICY IF EXISTS "Premium mcqs readable by licensed users" ON mcqs;
CREATE POLICY "Premium mcqs readable by licensed users" ON mcqs
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND EXISTS (
            SELECT 1 FROM licenses 
            WHERE user_id = auth.uid() 
            AND status = 'active'
        )
    );

DROP POLICY IF EXISTS "Premium case studies readable by licensed users" ON case_studies;
CREATE POLICY "Premium case studies readable by licensed users" ON case_studies
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND EXISTS (
            SELECT 1 FROM licenses 
            WHERE user_id = auth.uid() 
            AND status = 'active'
        )
    );

COMMIT;
