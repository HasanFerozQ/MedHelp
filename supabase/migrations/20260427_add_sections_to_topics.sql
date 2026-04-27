-- Migration: Add Sections and Populate 3rd Year Topics
-- Date: 2026-04-27

BEGIN;

-- 1. Add section column to topics
ALTER TABLE topics ADD COLUMN IF NOT EXISTS section TEXT;

-- 2. Populate 3rd Year Topics
-- Internal Medicine
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Cardiology', 'cardiology', 3, 'Internal Medicine', 10),
('Pulmonology', 'pulmonology', 3, 'Internal Medicine', 20),
('Gastroenterology', 'gastroenterology', 3, 'Internal Medicine', 30),
('Nephrology', 'nephrology', 3, 'Internal Medicine', 40),
('Endocrinology', 'endocrinology', 3, 'Internal Medicine', 50),
('Hematology/Oncology', 'hematology-oncology', 3, 'Internal Medicine', 60),
('Infectious Disease', 'infectious-disease', 3, 'Internal Medicine', 70),
('Rheumatology', 'rheumatology', 3, 'Internal Medicine', 80),
('Neurology', 'neurology', 3, 'Internal Medicine', 90)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- General Surgery
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Surgical Principles', 'surgical-principles', 3, 'General Surgery', 100),
('Pre/Post-operative Care & Anesthesia', 'pre-post-op-anesthesia', 3, 'General Surgery', 110),
('Abdominal Surgery', 'abdominal-surgery', 3, 'General Surgery', 120),
('Hepatobiliary', 'hepatobiliary-surgery', 3, 'General Surgery', 130),
('Breast Surgery', 'breast-surgery', 3, 'General Surgery', 140),
('Trauma', 'trauma-surgery', 3, 'General Surgery', 150),
('Surgical Oncology Basics', 'surgical-oncology-basics', 3, 'General Surgery', 160),
('Vascular Surgery', 'vascular-surgery', 3, 'General Surgery', 170)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Psychiatry
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Mood Disorders', 'mood-disorders', 3, 'Psychiatry', 180),
('Psychotic Disorders', 'psychotic-disorders', 3, 'Psychiatry', 190),
('Anxiety Disorders', 'anxiety-disorders', 3, 'Psychiatry', 200),
('Substance Use Disorders', 'substance-use-disorders', 3, 'Psychiatry', 210),
('Personality Disorders', 'personality-disorders', 3, 'Psychiatry', 220),
('Eating Disorders', 'eating-disorders', 3, 'Psychiatry', 230),
('Psychiatric Emergencies & Law', 'psychiatric-emergencies-law', 3, 'Psychiatry', 240),
('Psychopharmacology Essentials', 'psychopharmacology-essentials', 3, 'Psychiatry', 250)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Pediatrics (Introductory)
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Growth & Development Milestones', 'pediatrics-growth-development', 3, 'Pediatrics (Introductory)', 260),
('Neonatal Conditions', 'neonatal-conditions', 3, 'Pediatrics (Introductory)', 270),
('Common Pediatric Infections', 'common-pediatric-infections', 3, 'Pediatrics (Introductory)', 280),
('Pediatric Vaccines & Preventive Care', 'pediatric-vaccines-preventive', 3, 'Pediatrics (Introductory)', 290),
('Congenital Anomalies Overview', 'congenital-anomalies-overview', 3, 'Pediatrics (Introductory)', 300),
('Failure to Thrive & Nutritional Disorders', 'pediatrics-nutritional-disorders', 3, 'Pediatrics (Introductory)', 310)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Clinical Skills & Diagnostics
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('History Taking & Physical Examination', 'history-physical-exam', 3, 'Clinical Skills & Diagnostics', 320),
('ECG Interpretation', 'ecg-interpretation', 3, 'Clinical Skills & Diagnostics', 330),
('Chest X-ray & Radiology', 'chest-xray-radiology', 3, 'Clinical Skills & Diagnostics', 340),
('ABG Interpretation', 'abg-interpretation', 3, 'Clinical Skills & Diagnostics', 350),
('Common Lab Interpretation', 'common-lab-interpretation', 3, 'Clinical Skills & Diagnostics', 360),
('Clinical Reasoning & Differential Diagnosis', 'clinical-reasoning-diagnosis', 3, 'Clinical Skills & Diagnostics', 370)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Obstetrics & Gynecology
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Normal Labor & Postpartum', 'obgyn-normal-labor', 4, 'Obstetrics & Gynecology', 400),
('High-Risk Pregnancy', 'obgyn-high-risk-pregnancy', 4, 'Obstetrics & Gynecology', 410),
('Fetal Monitoring & Emergencies', 'obgyn-fetal-monitoring', 4, 'Obstetrics & Gynecology', 420),
('Gynecological Malignancies', 'obgyn-malignancies', 4, 'Obstetrics & Gynecology', 430),
('Benign Gynecology', 'obgyn-benign-gynecology', 4, 'Obstetrics & Gynecology', 440),
('Contraception & Planning', 'obgyn-contraception', 4, 'Obstetrics & Gynecology', 450),
('Menstrual Disorders & Infertility', 'obgyn-menstrual-infertility', 4, 'Obstetrics & Gynecology', 460),
('Neonatology & Resuscitation', 'obgyn-neonatology', 4, 'Obstetrics & Gynecology', 470)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Advanced Pediatrics
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Pediatric Emergencies (PALS)', 'peds-emergencies-pals', 4, 'Advanced Pediatrics', 480),
('Congenital Heart Disease', 'peds-congenital-heart', 4, 'Advanced Pediatrics', 490),
('Pediatric Respiratory Disorders', 'peds-respiratory', 4, 'Advanced Pediatrics', 500),
('Pediatric Oncology Essentials', 'peds-oncology', 4, 'Advanced Pediatrics', 510),
('Developmental Pediatrics', 'peds-developmental', 4, 'Advanced Pediatrics', 520),
('Pediatric Nephrology & Endo', 'peds-nephro-endo', 4, 'Advanced Pediatrics', 530),
('Child Abuse Recognition', 'peds-child-abuse', 4, 'Advanced Pediatrics', 540)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Emergency Medicine
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('ACLS & BLS Protocols', 'em-acls-bls', 4, 'Emergency Medicine', 550),
('Advanced Trauma (ATLS)', 'em-advanced-trauma', 4, 'Emergency Medicine', 560),
('Toxicology & Poisoning', 'em-toxicology', 4, 'Emergency Medicine', 570),
('Shock & Resuscitation', 'em-shock-resuscitation', 4, 'Emergency Medicine', 580),
('Neurological Emergencies', 'em-neurological', 4, 'Emergency Medicine', 590),
('Cardiac Emergencies', 'em-cardiac-emergencies', 4, 'Emergency Medicine', 600),
('Procedural Skills', 'em-procedural-skills', 4, 'Emergency Medicine', 610)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Orthopedics
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Fractures & Dislocations', 'ortho-fractures', 4, 'Orthopedics', 620),
('Spine Disorders', 'ortho-spine', 4, 'Orthopedics', 630),
('Sports & Soft Tissue', 'ortho-sports-medicine', 4, 'Orthopedics', 640),
('Joint Replacements', 'ortho-joint-replacements', 4, 'Orthopedics', 650),
('Bone & Soft Tissue Tumors', 'ortho-bone-tumors', 4, 'Orthopedics', 660),
('Pediatric Orthopedics', 'ortho-pediatric', 4, 'Orthopedics', 670)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Ophthalmology
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Red Eye (Uveitis/Keratitis)', 'ophtha-red-eye', 4, 'Ophthalmology', 680),
('Glaucoma Management', 'ophtha-glaucoma', 4, 'Ophthalmology', 690),
('Retinal Emergencies', 'ophtha-retinal-emergencies', 4, 'Ophthalmology', 700),
('Diabetic & Hypertensive Retinopathy', 'ophtha-retinopathy', 4, 'Ophthalmology', 710),
('Cataract & Lens Disorders', 'ophtha-cataract', 4, 'Ophthalmology', 720),
('Ocular Trauma', 'ophtha-trauma', 4, 'Ophthalmology', 730)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- ENT (Otolaryngology)
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Ear (Otitis/Vertigo)', 'ent-ear', 4, 'ENT (Otolaryngology)', 740),
('Nose (Sinusitis/Epistaxis)', 'ent-nose', 4, 'ENT (Otolaryngology)', 750),
('Throat (Tonsillitis/Abscess)', 'ent-throat', 4, 'ENT (Otolaryngology)', 760),
('Head & Neck Tumors', 'ent-head-neck-tumors', 4, 'ENT (Otolaryngology)', 770),
('Laryngeal & Hoarseness', 'ent-laryngeal', 4, 'ENT (Otolaryngology)', 780),
('Obstructive Sleep Apnea', 'ent-sleep-apnea', 4, 'ENT (Otolaryngology)', 790)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Dermatology
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Common Dermatoses', 'derm-common-dermatoses', 4, 'Dermatology', 800),
('Skin Malignancies', 'derm-malignancies', 4, 'Dermatology', 810),
('Drug-Induced Reactions (SJS/TEN)', 'derm-drug-reactions', 4, 'Dermatology', 820),
('Infectious Dermatology', 'derm-infectious', 4, 'Dermatology', 830),
('Autoimmune Skin Conditions', 'derm-autoimmune', 4, 'Dermatology', 840)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Ethics, Law & Health Systems
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Medical Ethics & Autonomy', 'ethics-medical', 4, 'Ethics, Law & Health Systems', 850),
('Informed Consent & Capacity', 'ethics-consent', 4, 'Ethics, Law & Health Systems', 860),
('End-of-Life & Advance Directives', 'ethics-end-of-life', 4, 'Ethics, Law & Health Systems', 870),
('Healthcare Systems & Insurance', 'ethics-healthcare-systems', 4, 'Ethics, Law & Health Systems', 880),
('Patient Safety & Quality', 'ethics-patient-safety', 4, 'Ethics, Law & Health Systems', 890),
('Public Health & Preventive', 'ethics-public-health', 4, 'Ethics, Law & Health Systems', 900)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

-- Clinical Case Integration
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Multi-System Clinical Vignettes', 'case-vignettes', 4, 'Clinical Case Integration', 910),
('Diagnostic & Management Algorithms', 'case-algorithms', 4, 'Clinical Case Integration', 920),
('Pharmacotherapy in Context', 'case-pharmacotherapy', 4, 'Clinical Case Integration', 930),
('Surgical vs Medical Decisions', 'case-surgical-medical', 4, 'Clinical Case Integration', 940),
('Labs & Imaging Interpretation', 'case-labs-imaging', 4, 'Clinical Case Integration', 950)
ON CONFLICT (slug) DO UPDATE SET 
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section,
    "order" = EXCLUDED."order";

COMMIT;
