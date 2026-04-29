-- Migration: Move residual "Basics" topics from Year 3 to Year 4
-- Date: 2026-05-04

BEGIN;

-- Move any remaining OB/GYN topics (like "Obstetrics & Gynecology Basics") from Year 3 to Year 4
UPDATE topics 
SET year_id = 4, section = 'Obstetrics & Gynecology' 
WHERE section ILIKE '%Obstetrics & Gynecology%' AND year_id = 3;

-- Move any remaining Emergency Medicine topics from Year 3 to Year 4
UPDATE topics 
SET year_id = 4, section = 'Emergency Medicine' 
WHERE section ILIKE '%Emergency Medicine%' AND year_id = 3;

-- Move any remaining Ethics topics from Year 3 to Year 4
UPDATE topics 
SET year_id = 4, section = 'Ethics, Law & Health Systems' 
WHERE section ILIKE '%Ethics%' AND year_id = 3;

COMMIT;
