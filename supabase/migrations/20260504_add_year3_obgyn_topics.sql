-- Migration: Add 3rd Year Ob/Gyn Topics
-- Date: 2026-05-04

BEGIN;

INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Normal Pregnancy & Prenatal Care', 'obgyn-prenatal-care', 3, 'Ob/Gyn (Introductory)', 380),
('Common Pregnancy Complications', 'obgyn-pregnancy-complications', 3, 'Ob/Gyn (Introductory)', 390),
('Normal Labor & Delivery', 'obgyn-labor-delivery', 3, 'Ob/Gyn (Introductory)', 400),
('Gynecology Basics', 'obgyn-gyn-basics', 3, 'Ob/Gyn (Introductory)', 410),
('Common Gynecological Conditions', 'obgyn-gyn-conditions', 3, 'Ob/Gyn (Introductory)', 420)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

COMMIT;
