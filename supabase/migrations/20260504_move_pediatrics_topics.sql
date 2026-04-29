-- Migration: Move Pediatrics Topics to Year 4
-- Date: 2026-04-29

BEGIN;

-- Move the specified topics from 3rd Year to 4th Year under "Advanced Pediatrics"
UPDATE topics 
SET year_id = 4, section = 'Advanced Pediatrics' 
WHERE title ILIKE '%Pediatric emergencies%' 
   OR title ILIKE '%Congenital heart disease%'
   OR title ILIKE '%Pediatric respiratory disorders%'
   OR title ILIKE '%Pediatric oncology%'
   OR title ILIKE '%Developmental & behavioral pediatrics%'
   OR title ILIKE '%Pediatric nephrology%'
   OR title ILIKE '%Child abuse recognition%';

-- Just in case they are identified by their slugs
UPDATE topics 
SET year_id = 4, section = 'Advanced Pediatrics' 
WHERE slug IN (
    'peds-emergencies-pals',
    'peds-congenital-heart',
    'peds-respiratory',
    'peds-oncology',
    'peds-developmental',
    'peds-nephro-endo',
    'peds-child-abuse'
);

COMMIT;
