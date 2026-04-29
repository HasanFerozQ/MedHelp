-- Migration: Update Curriculum Titles for OB/GYN, Emergency Medicine, and Ethics
-- Date: 2026-05-04

BEGIN;

-- 1. Obstetrics & Gynecology Updates (Force into Year 4)
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Normal labor, delivery & postpartum care', 'obgyn-normal-labor', 4, 'Obstetrics & Gynecology', 400),
('High-risk pregnancy — pre-eclampsia, GDM, placenta previa', 'obgyn-high-risk-pregnancy', 4, 'Obstetrics & Gynecology', 410),
('Fetal monitoring & obstetric emergencies', 'obgyn-fetal-monitoring', 4, 'Obstetrics & Gynecology', 420),
('Gynecological malignancies — cervical, uterine, ovarian', 'obgyn-malignancies', 4, 'Obstetrics & Gynecology', 430),
('Benign gynecology — fibroids, endometriosis, PCOS', 'obgyn-benign-gynecology', 4, 'Obstetrics & Gynecology', 440),
('Contraception & family planning', 'obgyn-contraception', 4, 'Obstetrics & Gynecology', 450),
('Menstrual disorders & infertility basics', 'obgyn-menstrual-infertility', 4, 'Obstetrics & Gynecology', 460),
('Neonatology & newborn resuscitation', 'obgyn-neonatology', 4, 'Obstetrics & Gynecology', 470)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

-- 2. Emergency Medicine Updates (Force into Year 4)
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('ACLS & BLS protocols', 'em-acls-bls', 4, 'Emergency Medicine', 550),
('Trauma management (ATLS advanced)', 'em-advanced-trauma', 4, 'Emergency Medicine', 560),
('Toxicology & poisoning management', 'em-toxicology', 4, 'Emergency Medicine', 570),
('Shock types & resuscitation', 'em-shock-resuscitation', 4, 'Emergency Medicine', 580),
('Neurological emergencies — stroke protocol, status epilepticus', 'em-neurological', 4, 'Emergency Medicine', 590),
('Cardiac emergencies', 'em-cardiac-emergencies', 4, 'Emergency Medicine', 600),
('Procedural skills — intubation, central lines, chest tubes', 'em-procedural-skills', 4, 'Emergency Medicine', 610)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

-- 3. Ethics, Law & Health Systems Updates (Force into Year 4)
INSERT INTO topics (title, slug, year_id, section, "order") VALUES
('Medical ethics — autonomy, beneficence, justice', 'ethics-medical', 4, 'Ethics, Law & Health Systems', 850),
('Informed consent & capacity assessment', 'ethics-consent', 4, 'Ethics, Law & Health Systems', 860),
('End-of-life care & advance directives', 'ethics-end-of-life', 4, 'Ethics, Law & Health Systems', 870),
('Healthcare systems — Medicare, Medicaid, insurance', 'ethics-healthcare-systems', 4, 'Ethics, Law & Health Systems', 880),
('Patient safety & quality improvement', 'ethics-patient-safety', 4, 'Ethics, Law & Health Systems', 890),
('Public health & preventive medicine', 'ethics-public-health', 4, 'Ethics, Law & Health Systems', 900)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    section = EXCLUDED.section;

COMMIT;
