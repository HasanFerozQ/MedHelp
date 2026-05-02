-- Migration: Update Year 4 Specialties (Ortho, ENT, Derm, Case Integration)
-- Date: 2026-05-04

BEGIN;

-- 1. Orthopedics Updates
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Fractures & dislocations — classification & management', 'ortho-fractures', 4, 'Orthopedics', 620),
('Spine disorders — disc herniation, stenosis, scoliosis', 'ortho-spine', 4, 'Orthopedics', 630),
('Sports medicine & soft tissue injuries', 'ortho-sports-medicine', 4, 'Orthopedics', 640),
('Joint replacements — indications & complications', 'ortho-joint-replacements', 4, 'Orthopedics', 650),
('Bone & soft tissue tumors', 'ortho-bone-tumors', 4, 'Orthopedics', 660),
('Pediatric orthopedics — DDH, clubfoot, Perthes', 'ortho-pediatric', 4, 'Orthopedics', 670)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

-- 2. ENT (Otolaryngology) Updates
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Ear — otitis, hearing loss, vertigo, cholesteatoma', 'ent-ear', 4, 'ENT (Otolaryngology)', 740),
('Nose — sinusitis, epistaxis, allergic rhinitis', 'ent-nose', 4, 'ENT (Otolaryngology)', 750),
('Throat — tonsillitis, pharyngitis, peritonsillar abscess', 'ent-throat', 4, 'ENT (Otolaryngology)', 760),
('Head & neck tumors', 'ent-head-neck-tumors', 4, 'ENT (Otolaryngology)', 770),
('Laryngeal disorders & hoarseness', 'ent-laryngeal', 4, 'ENT (Otolaryngology)', 780),
('Obstructive sleep apnea', 'ent-sleep-apnea', 4, 'ENT (Otolaryngology)', 790)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

-- 3. Dermatology Updates
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Common dermatoses — eczema, psoriasis, acne, rosacea', 'derm-common-dermatoses', 4, 'Dermatology', 800),
('Skin malignancies — melanoma, BCC, SCC', 'derm-malignancies', 4, 'Dermatology', 810),
('Drug-induced skin reactions (SJS, TEN)', 'derm-drug-reactions', 4, 'Dermatology', 820),
('Infectious dermatology — cellulitis, impetigo, fungal', 'derm-infectious', 4, 'Dermatology', 830),
('Autoimmune skin conditions — pemphigus, bullous pemphigoid', 'derm-autoimmune', 4, 'Dermatology', 840)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

-- 4. Clinical Case Integration (Step 2 CK) Updates
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Multi-system clinical vignettes', 'case-vignettes', 4, 'Clinical Case Integration (Step 2 CK)', 910),
('Diagnostic reasoning & management algorithms', 'case-algorithms', 4, 'Clinical Case Integration (Step 2 CK)', 920),
('Pharmacotherapy in clinical context', 'case-pharmacotherapy', 4, 'Clinical Case Integration (Step 2 CK)', 930),
('Surgical vs medical decision making', 'case-surgical-medical', 4, 'Clinical Case Integration (Step 2 CK)', 940),
('Interpretation of labs, imaging, biopsies in context', 'case-labs-imaging', 4, 'Clinical Case Integration (Step 2 CK)', 950)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

COMMIT;
