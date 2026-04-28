-- Migration: Align Surgery Topics with User Request
-- Date: 2026-04-29

BEGIN;

-- 1. Clean up duplicate/overlapping topics
DELETE FROM topics WHERE slug IN ('trauma', 'hepatobiliary', 'breast-surgery');

-- 2. Create/Update Surgery Topics
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Surgical Principles', 'surgical-principles', 3, 'General Surgery', 100),
('Pre/Post-Operative Care & Anesthesia', 'pre-post-op-anesthesia', 3, 'General Surgery', 110),
('Abdominal Surgery (Wall & Hernias)', 'abdominal-surgery', 3, 'General Surgery', 120),
('Esophagus & Stomach', 'esophagus-stomach', 3, 'General Surgery', 121),
('Small Bowel, Colon, Rectum & Anus', 'colorectal-anal-surgery', 3, 'General Surgery', 122),
('Hepatobiliary & Pancreas', 'hepatobiliary-pancreas', 3, 'General Surgery', 130),
('Breast & Endocrine Surgery', 'breast-endocrine-surgery', 3, 'General Surgery', 140),
('Trauma & Critical Care (Advanced)', 'trauma-critical-care', 3, 'General Surgery', 150),
('Surgical Oncology Basics', 'surgical-oncology-basics', 3, 'General Surgery', 160),
('Vascular Surgery', 'vascular-surgery', 3, 'General Surgery', 170)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

COMMIT;
