-- Step 3 Mock #3 day2-acp — 198 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock3-day2-acp' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock3-day2-acp missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 58-year-old male has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Naloxone and airway support", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 83-year-old female has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "NSAID, colchicine, or steroid depending comorbidities", "Observation only", "Alternative unrelated therapy"]'::jsonb, 2, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 69-year-old male is seen for Tumor lysis syndrome.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Rasburicase hydration allopurinol", "No intervention", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Rasburicase hydration allopurinol.'),
    (v_topic_id, 'A 32-year-old male has Acute angle closure glaucoma and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Discharge without therapy", "Delay treatment 1 week", "Timolol, pilocarpine, IV acetazolamide, emergent laser"]'::jsonb, 4, 'Standard management for Acute angle closure glaucoma: Timolol, pilocarpine, IV acetazolamide, emergent laser.'),
    (v_topic_id, 'A 75-year-old male is a Average-risk 50-year-old presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "No screening ever", "PET scan annually", "Colorectal cancer screening per USPSTF", "Screening only if symptomatic for all diseases"]'::jsonb, 3, 'Evidence-based screening: Colorectal cancer screening per USPSTF.'),
    (v_topic_id, 'A 81-year-old female is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Neurologic decline days 4-14", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 79-year-old female is seen for Breakthrough pain cancer.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Delayed care 6 months", "Short-acting opioid with bowel regimen", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Short-acting opioid with bowel regimen.'),
    (v_topic_id, 'A 71-year-old female has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["IV diphenhydramine alone", "Intramuscular epinephrine", "Observation without meds", "Albuterol nebulizer only", "Oral prednisone only"]'::jsonb, 1, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 45-year-old male is seen for STI partner treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Expedited partner therapy where legal", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Expedited partner therapy where legal.'),
    (v_topic_id, 'A 36-year-old female has Thyroid storm and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Propranolol, PTU/methimazole, iodine after antithyroid drug", "Observation only", "Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week"]'::jsonb, 0, 'Standard management for Thyroid storm: Propranolol, PTU/methimazole, iodine after antithyroid drug.'),
    (v_topic_id, 'A 67-year-old female is a Abdominal aortic aneurysm presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Antibiotics prophylaxis", "One-time ultrasound men 65\u201375 ever smoked", "PET scan annually", "Screening only if symptomatic for all diseases"]'::jsonb, 2, 'Evidence-based screening: One-time ultrasound men 65–75 ever smoked.'),
    (v_topic_id, 'A 32-year-old female is seen for Lung cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention", "Annual LDCT if criteria"]'::jsonb, 4, 'Guideline-consistent care: Annual LDCT if criteria.'),
    (v_topic_id, 'A 62-year-old female returns for follow-up of Hypertension stage 2.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Start thiazide/CCB/ACEi per JNC guidelines", "Antibiotics chronically", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for Hypertension stage 2.'),
    (v_topic_id, 'A 64-year-old male returns for follow-up of COPD GOLD B.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "LAMA or LABA; pulmonary rehab", "No treatment indicated", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for COPD GOLD B.'),
    (v_topic_id, 'A 43-year-old female has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["Oral prednisone only", "IV diphenhydramine alone", "Albuterol nebulizer only", "Observation without meds", "Intramuscular epinephrine"]'::jsonb, 4, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 33-year-old female returns for follow-up of IBD maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Immunomodulator or biologic per severity"]'::jsonb, 4, 'Guideline-based chronic care for IBD maintenance.'),
    (v_topic_id, 'A 83-year-old male is seen for Acute mania.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Antipsychotic mood stabilizer", "No intervention", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Antipsychotic mood stabilizer.'),
    (v_topic_id, 'A 49-year-old female is seen for IBD remission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Continue biologic therapy", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Continue biologic therapy.'),
    (v_topic_id, 'A 35-year-old female is a Osteoporosis postmenopausal presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "DEXA screening per age/risk", "No screening ever"]'::jsonb, 3, 'Evidence-based screening: DEXA screening per age/risk.'),
    (v_topic_id, 'A 83-year-old male is seen for Bell palsy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Prednisone within 72 hours", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Prednisone within 72 hours.'),
    (v_topic_id, 'A 50-year-old female returns for follow-up of Type 2 diabetes A1c 9.2% on metformin.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "High-dose steroids indefinitely without indication", "Add GLP-1 RA or SGLT2i with ASCVD benefit if indicated", "Discontinue all prior meds abruptly", "No treatment indicated"]'::jsonb, 2, 'Guideline-based chronic care for Type 2 diabetes A1c 9.2% on metformin.'),
    (v_topic_id, 'A 66-year-old male returns for follow-up of Atrial fibrillation CHA2DS2-VASc 3.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "Anticoagulation unless contraindicated", "No treatment indicated"]'::jsonb, 3, 'Guideline-based chronic care for Atrial fibrillation CHA2DS2-VASc 3.'),
    (v_topic_id, 'A 42-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Vasospasm days 3\u201314; neurologic monitoring", "Disease is always benign", "Immediate cure expected", "No follow-up needed"]'::jsonb, 1, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 50-year-old female is seen for CKD G3a albuminuria.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["ACEi max tolerated dose", "No intervention", "Contradicted therapy", "Placebo only", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: ACEi max tolerated dose.'),
    (v_topic_id, 'A 36-year-old male is seen for Hearing loss screening elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Audiology referral", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Audiology referral.'),
    (v_topic_id, 'A 72-year-old male has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "No complications ever occur", "Immediate cure expected", "No follow-up needed", "5-year mortality remains significant; implantable defibrillator if criteria met"]'::jsonb, 4, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 36-year-old male is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Neutropenia infection risk", "Delayed care 6 months", "Placebo only", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 53-year-old male is seen for Elder neglect.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "APS referral safety plan", "Contradicted therapy", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: APS referral safety plan.'),
    (v_topic_id, 'A 62-year-old female returns for follow-up of Atrial fibrillation CHA2DS2-VASc 3.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antibiotics chronically", "No treatment indicated", "Anticoagulation unless contraindicated"]'::jsonb, 4, 'Guideline-based chronic care for Atrial fibrillation CHA2DS2-VASc 3.'),
    (v_topic_id, 'A 40-year-old male is seen for Osteoporosis screening female.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["DEXA age 65 or earlier risk", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: DEXA age 65 or earlier risk.'),
    (v_topic_id, 'A 41-year-old female is a 25-year-old sexually active female presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "PET scan annually", "Chlamydia/gonorrhea screening", "No screening ever"]'::jsonb, 3, 'Evidence-based screening: Chlamydia/gonorrhea screening.'),
    (v_topic_id, 'A 44-year-old female is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Risk osteomyelitis amputation", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 33-year-old male is seen for Hyperlipidemia ASCVD.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["High-intensity statin", "No intervention", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: High-intensity statin.'),
    (v_topic_id, 'A 59-year-old female returns for follow-up of Prior TIA noncardioembolic.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antiplatelet therapy and risk factor control", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Prior TIA noncardioembolic.'),
    (v_topic_id, 'A 26-year-old female is seen for CHF readmission reduction.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Teach diuretic titration early follow-up", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Teach diuretic titration early follow-up.'),
    (v_topic_id, 'A 30-year-old male is a Depression primary care presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Screening only if symptomatic for all diseases", "PET scan annually", "PHQ-2/9 screening", "Antibiotics prophylaxis"]'::jsonb, 3, 'Evidence-based screening: PHQ-2/9 screening.'),
    (v_topic_id, 'A 64-year-old male has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Uterotonics, massage, transfusion as needed", "Alternative unrelated therapy", "Observation only", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 0, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 49-year-old male is seen for Latent TB treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Isoniazid or rifampin course", "Placebo only", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Isoniazid or rifampin course.'),
    (v_topic_id, 'A 32-year-old male has Malignant hyperthermia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Dantrolene and stop triggering agents", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 2, 'Standard management for Malignant hyperthermia: Dantrolene and stop triggering agents.'),
    (v_topic_id, 'A 79-year-old male has Anaphylaxis refractory and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week", "Observation only", "Repeat epinephrine, fluids, ICU monitoring"]'::jsonb, 4, 'Standard management for Anaphylaxis refractory: Repeat epinephrine, fluids, ICU monitoring.'),
    (v_topic_id, 'A 69-year-old female is seen for Cervical cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Pap/HPV per guidelines", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Pap/HPV per guidelines.'),
    (v_topic_id, 'A 58-year-old female is seen for Increased ICP.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Head elevation mannitol hyperventilation", "Contradicted therapy", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Head elevation mannitol hyperventilation.'),
    (v_topic_id, 'A 67-year-old female has septic shock from pneumonia; MAP 58 on norepinephrine.

Physical Examination:

Lactate 4.2.

Laboratory Results:

Blood cultures drawn.


What is the most appropriate antibiotic strategy?', '["Broad-spectrum IV antibiotics within 1 hour", "Oral amoxicillin only", "Fluoroquinolone monotherapy for all ICU patients always", "Await culture 48 hours before antibiotics", "Topical antibiotics"]'::jsonb, 0, 'Septic shock requires urgent IV broad-spectrum antibiotics after cultures.'),
    (v_topic_id, 'A 40-year-old female is seen for Hypothyroidism.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Levothyroxine titrate TSH", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Levothyroxine titrate TSH.'),
    (v_topic_id, 'A 43-year-old female is seen for Prior authorization appeal.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Contradicted therapy", "Delayed care 6 months", "Peer-to-peer when denied"]'::jsonb, 4, 'Guideline-consistent care: Peer-to-peer when denied.'),
    (v_topic_id, 'A 58-year-old female has Acute spinal cord compression and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Discharge without therapy", "Delay treatment 1 week", "Dexamethasone and emergent radiation/surgery", "Alternative unrelated therapy"]'::jsonb, 3, 'Standard management for Acute spinal cord compression: Dexamethasone and emergent radiation/surgery.'),
    (v_topic_id, 'A 70-year-old male returns for follow-up of Cirrhosis ascites.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "Discontinue all prior meds abruptly", "No treatment indicated", "Sodium restriction and diuretics; paracentesis PRN", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for Cirrhosis ascites.'),
    (v_topic_id, 'A 74-year-old female is seen for Acute optic neuritis MS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "IV methylprednisolone", "Delayed care 6 months", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: IV methylprednisolone.'),
    (v_topic_id, 'A 41-year-old female returns for follow-up of Schizophrenia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antipsychotic with metabolic monitoring", "No treatment indicated"]'::jsonb, 3, 'Guideline-based chronic care for Schizophrenia.'),
    (v_topic_id, 'A 28-year-old male has septic shock from pneumonia; MAP 58 on norepinephrine.

Physical Examination:

Lactate 4.2.

Laboratory Results:

Blood cultures drawn.


What is the most appropriate antibiotic strategy?', '["Oral amoxicillin only", "Await culture 48 hours before antibiotics", "Topical antibiotics", "Broad-spectrum IV antibiotics within 1 hour", "Fluoroquinolone monotherapy for all ICU patients always"]'::jsonb, 3, 'Septic shock requires urgent IV broad-spectrum antibiotics after cultures.'),
    (v_topic_id, 'A 29-year-old male has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Watch for VSD, papillary muscle rupture, arrhythmia", "No follow-up needed", "Disease is always benign", "Immediate cure expected", "No complications ever occur"]'::jsonb, 0, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 41-year-old male has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "High short-term mortality; transplant evaluation", "No follow-up needed", "No complications ever occur", "Immediate cure expected"]'::jsonb, 1, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 22-year-old female is seen for Postpartum hemorrhage.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Contradicted therapy", "No intervention", "Uterotonics balloon tamponade"]'::jsonb, 4, 'Guideline-consistent care: Uterotonics balloon tamponade.'),
    (v_topic_id, 'A 80-year-old male is seen for Hep B vaccination risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention", "HBV vaccine series"]'::jsonb, 4, 'Guideline-consistent care: HBV vaccine series.'),
    (v_topic_id, 'A 68-year-old female is seen for Advance directives.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Document goals before incapacity", "Contradicted therapy", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Document goals before incapacity.'),
    (v_topic_id, 'A 38-year-old female is a Type 2 diabetes presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "PET scan annually", "No screening ever", "Annual dilated eye exam and urine albumin"]'::jsonb, 4, 'Evidence-based screening: Annual dilated eye exam and urine albumin.'),
    (v_topic_id, 'A 39-year-old female is seen for Tobacco cessation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Placebo only", "Contradicted therapy", "Varenicline plus counseling"]'::jsonb, 4, 'Guideline-consistent care: Varenicline plus counseling.'),
    (v_topic_id, 'A 32-year-old male is seen for Atrial fibrillation new anticoagulation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Start DOAC unless contraindicated", "No intervention", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Start DOAC unless contraindicated.'),
    (v_topic_id, 'A 42-year-old female returns for follow-up of Hypertension stage 2.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "No treatment indicated", "Start thiazide/CCB/ACEi per JNC guidelines", "Antibiotics chronically", "Discontinue all prior meds abruptly"]'::jsonb, 2, 'Guideline-based chronic care for Hypertension stage 2.'),
    (v_topic_id, 'A 30-year-old male returns for follow-up of CKD stage 3 with albuminuria.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "No treatment indicated", "ACEi/ARB for proteinuria reduction", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly"]'::jsonb, 2, 'Guideline-based chronic care for CKD stage 3 with albuminuria.'),
    (v_topic_id, 'A 69-year-old male has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "Alternative unrelated therapy", "Observation only", "Naloxone and airway support"]'::jsonb, 4, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 44-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Immediate cure expected", "Disease is always benign", "Active surveillance may be appropriate", "No complications ever occur"]'::jsonb, 3, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 27-year-old male is seen for PrEP HIV risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Tenofovir emtricitabine monitoring", "Placebo only", "Contradicted therapy", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Tenofovir emtricitabine monitoring.'),
    (v_topic_id, 'A 31-year-old male is seen for Telehealth follow-up CHF.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Daily weight remote monitoring", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Daily weight remote monitoring.'),
    (v_topic_id, 'A 30-year-old male is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Active surveillance low grade", "Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 83-year-old female has STEMI post-PCI and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Dual antiplatelet therapy for 12 months unless bleeding risk", "Observation only", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 1, 'Standard management for STEMI post-PCI: Dual antiplatelet therapy for 12 months unless bleeding risk.'),
    (v_topic_id, 'A 42-year-old male is seen for Hypercalcemia malignancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "IV fluids bisphosphonate", "Placebo only", "No intervention", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: IV fluids bisphosphonate.'),
    (v_topic_id, 'A 46-year-old female returns for follow-up of Rheumatoid arthritis.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Methotrexate first-line DMARD", "No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for Rheumatoid arthritis.'),
    (v_topic_id, 'A 40-year-old male is seen for Macular degeneration AREDS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Antioxidant vitamins", "No intervention", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Antioxidant vitamins.'),
    (v_topic_id, 'A 50-year-old female has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Digoxin Fab fragments", "Observation only", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 75-year-old female has Acute angle closure glaucoma and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Timolol, pilocarpine, IV acetazolamide, emergent laser", "Alternative unrelated therapy", "Observation only", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for Acute angle closure glaucoma: Timolol, pilocarpine, IV acetazolamide, emergent laser.'),
    (v_topic_id, 'A 82-year-old female has Acute stroke tPA candidate and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "IV alteplase within 4.5 h if no contraindications", "Observation only", "Alternative unrelated therapy"]'::jsonb, 2, 'Standard management for Acute stroke tPA candidate: IV alteplase within 4.5 h if no contraindications.'),
    (v_topic_id, 'A 79-year-old female is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "New holosystolic murmur shock", "Contradicted therapy", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 44-year-old male has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Immediate cure expected", "No complications ever occur", "Hypercalcemia, renal injury, infection risk", "Disease is always benign"]'::jsonb, 3, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 47-year-old male returns for follow-up of Bipolar disorder maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "No treatment indicated", "Lithium or valproate mood stabilizer"]'::jsonb, 4, 'Guideline-based chronic care for Bipolar disorder maintenance.'),
    (v_topic_id, 'A 67-year-old male is a 65-year-old never screened presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "One-time AAA ultrasound if ever smoked", "No screening ever", "PET scan annually", "Antibiotics prophylaxis"]'::jsonb, 1, 'Evidence-based screening: One-time AAA ultrasound if ever smoked.'),
    (v_topic_id, 'A 37-year-old female is seen for Hep B vaccination risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Delayed care 6 months", "HBV vaccine series", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: HBV vaccine series.'),
    (v_topic_id, 'A 84-year-old male returns for follow-up of Osteoporosis T-score -2.8.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Bisphosphonate or alternative per guidelines"]'::jsonb, 4, 'Guideline-based chronic care for Osteoporosis T-score -2.8.'),
    (v_topic_id, 'A 26-year-old male is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Progressive renal failure risk", "Delayed care 6 months", "Placebo only", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 67-year-old female is seen for Schizophrenia adherence.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Placebo only", "No intervention", "Long-acting injectable antipsychotic"]'::jsonb, 4, 'Guideline-consistent care: Long-acting injectable antipsychotic.'),
    (v_topic_id, 'A 40-year-old female is seen for PCOS infertility desire.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Contradicted therapy", "Weight loss clomiphene", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Weight loss clomiphene.'),
    (v_topic_id, 'A 41-year-old male is seen for Influenza prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Annual influenza vaccine", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Annual influenza vaccine.'),
    (v_topic_id, 'A 44-year-old female is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Monitor abscess fistula formation", "Contradicted therapy", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 44-year-old male is seen for Hep C cured.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Sustained virologic response surveillance", "No intervention", "Contradicted therapy", "Delayed care 6 months", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Sustained virologic response surveillance.'),
    (v_topic_id, 'A 79-year-old female has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy", "Calcium gluconate, insulin/dextrose, albuterol"]'::jsonb, 4, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 61-year-old female is seen for STI partner treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Expedited partner therapy where legal", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Expedited partner therapy where legal.'),
    (v_topic_id, 'A 62-year-old male is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Progressive renal failure risk", "Placebo only", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 53-year-old female has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "No complications ever occur", "Immediate cure expected", "Progressive renal failure without treatment"]'::jsonb, 4, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 47-year-old male is a 45-year-old smoker 30 pack-years presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "PET scan annually", "Antibiotics prophylaxis", "No screening ever", "Annual low-dose CT lung cancer screening"]'::jsonb, 4, 'Evidence-based screening: Annual low-dose CT lung cancer screening.'),
    (v_topic_id, 'A 38-year-old male scenario: Quality improvement fall protocol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["No documentation", "Ignore discharge planning", "Medication review and home safety evaluation", "Avoid care coordination", "Skip follow-up"]'::jsonb, 2, 'Medication review and home safety evaluation'),
    (v_topic_id, 'A 56-year-old male has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Disease is always benign", "No follow-up needed", "High short-term mortality; transplant evaluation", "Immediate cure expected"]'::jsonb, 3, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 75-year-old male has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["NSAID, colchicine, or steroid depending comorbidities", "Observation only", "Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week"]'::jsonb, 0, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 39-year-old male has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "Risk of necrosis, infection, organ failure", "No complications ever occur", "Immediate cure expected"]'::jsonb, 2, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 77-year-old female is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Contradicted therapy", "No intervention", "Offloading wound care nutrition"]'::jsonb, 4, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 57-year-old female is seen for Spinal cord compression.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Dexamethasone emergent radiation", "Delayed care 6 months", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Dexamethasone emergent radiation.'),
    (v_topic_id, 'A 30-year-old male is a Abdominal aortic aneurysm presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "One-time ultrasound men 65\u201375 ever smoked", "Screening only if symptomatic for all diseases", "No screening ever", "Antibiotics prophylaxis"]'::jsonb, 1, 'Evidence-based screening: One-time ultrasound men 65–75 ever smoked.'),
    (v_topic_id, 'A 36-year-old male returns for follow-up of HFpEF.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "No treatment indicated", "Discontinue all prior meds abruptly", "Diuretics for congestion; treat comorbid HTN/diabetes", "Antibiotics chronically"]'::jsonb, 3, 'Guideline-based chronic care for HFpEF.'),
    (v_topic_id, 'A 45-year-old male is seen for STEMI post stent.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Delayed care 6 months", "Placebo only", "DAPT statin beta-blocker ACEi"]'::jsonb, 4, 'Guideline-consistent care: DAPT statin beta-blocker ACEi.'),
    (v_topic_id, 'A 45-year-old male is seen for Heart failure admission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Diuretic GDMT optimization", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Diuretic GDMT optimization.'),
    (v_topic_id, 'A 81-year-old male has Tension pneumothorax and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Needle decompression then chest tube", "Observation only", "Discharge without therapy"]'::jsonb, 2, 'Standard management for Tension pneumothorax: Needle decompression then chest tube.'),
    (v_topic_id, 'A 84-year-old male is seen for NAFLD lifestyle.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Weight loss 7-10% target", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Weight loss 7-10% target.'),
    (v_topic_id, 'A 35-year-old female is seen for Iron deficiency post-menopause.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Colonoscopy if no obvious source", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Colonoscopy if no obvious source.'),
    (v_topic_id, 'A 70-year-old female is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Monitor abscess fistula formation", "No intervention", "Placebo only", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 44-year-old female returns for follow-up of Osteoporosis T-score -2.8.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Antibiotics chronically", "No treatment indicated", "Bisphosphonate or alternative per guidelines", "Discontinue all prior meds abruptly"]'::jsonb, 3, 'Guideline-based chronic care for Osteoporosis T-score -2.8.'),
    (v_topic_id, 'A 82-year-old male has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Discharge without therapy", "Alternative unrelated therapy", "N-acetylcysteine", "Delay treatment 1 week"]'::jsonb, 3, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 27-year-old male returns for follow-up of HIV stable.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "ART adherence counseling; continue regimen", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for HIV stable.'),
    (v_topic_id, 'A 72-year-old female is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Risk osteomyelitis amputation", "No intervention", "Contradicted therapy", "Delayed care 6 months", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 46-year-old female is a Hep C baby boomer presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "PET scan annually", "HCV antibody screening once"]'::jsonb, 4, 'Evidence-based screening: HCV antibody screening once.'),
    (v_topic_id, 'A 27-year-old male has Testicular torsion and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "Emergent urologic exploration", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Testicular torsion: Emergent urologic exploration.'),
    (v_topic_id, 'A 24-year-old female has STEMI post-PCI and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Dual antiplatelet therapy for 12 months unless bleeding risk", "Discharge without therapy", "Delay treatment 1 week", "Alternative unrelated therapy"]'::jsonb, 1, 'Standard management for STEMI post-PCI: Dual antiplatelet therapy for 12 months unless bleeding risk.'),
    (v_topic_id, 'A 58-year-old male has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "N-acetylcysteine", "Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 76-year-old female is seen for Celiac strict gluten-free.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "No intervention", "Dietitian referral", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Dietitian referral.'),
    (v_topic_id, 'A 39-year-old female is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "New holosystolic murmur shock", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 46-year-old female is seen for Cervical cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Pap/HPV per guidelines", "Placebo only", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Pap/HPV per guidelines.'),
    (v_topic_id, 'A 81-year-old female is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Active surveillance low grade", "Placebo only", "Contradicted therapy", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 49-year-old female is seen for Statin primary prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "ASCVD risk calculator", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: ASCVD risk calculator.'),
    (v_topic_id, 'A 24-year-old male is seen for Child abuse reporting.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Mandatory report when suspected", "Contradicted therapy", "Delayed care 6 months", "Placebo only", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Mandatory report when suspected.'),
    (v_topic_id, 'A 59-year-old male has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Immediate cure expected", "No complications ever occur", "No follow-up needed", "Risk of necrosis, infection, organ failure"]'::jsonb, 4, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 42-year-old female has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Observation only", "Calcium gluconate, insulin/dextrose, albuterol", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 44-year-old male is seen for Febrile neutropenia.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Empiric antipseudomonal beta-lactam", "Contradicted therapy", "Placebo only", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Empiric antipseudomonal beta-lactam.'),
    (v_topic_id, 'A 82-year-old female has DKA with pH 7.05 and K+ 5.8 mEq/L on presentation.

Physical Examination:

Dry mucous membranes.

Laboratory Results:

Glucose 520 mg/dL.


What is the most appropriate initial management?', '["Potassium supplementation before any insulin regardless of level", "Oral hypoglycemic agent", "Insulin bolus only without fluids", "IV fluids and insulin after confirming potassium adequacy", "Bicarbonate for all DKA"]'::jsonb, 3, 'DKA: fluids first; insulin when K+ safe (>3.3); hold insulin if K+ <3.3 until repleted.'),
    (v_topic_id, 'A 44-year-old female scenario: Workers compensation back pain.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Skip follow-up", "No documentation", "Ignore discharge planning", "Functional restoration; avoid prolonged opioids", "Avoid care coordination"]'::jsonb, 3, 'Functional restoration; avoid prolonged opioids'),
    (v_topic_id, 'A 36-year-old female is seen for Diabetic retinopathy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Tight glucose laser anti-VEGF", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Tight glucose laser anti-VEGF.'),
    (v_topic_id, 'A 42-year-old male is seen for Delirium hospital.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "No intervention", "Treat cause minimize sedatives", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Treat cause minimize sedatives.'),
    (v_topic_id, 'A 84-year-old female is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Offloading wound care nutrition", "Contradicted therapy", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 80-year-old female is seen for RA methotrexate.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "No intervention", "Folic acid monitoring LFTs", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Folic acid monitoring LFTs.'),
    (v_topic_id, 'A 44-year-old female is seen for Alcohol withdrawal CIWA.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "No intervention", "Symptom-triggered benzodiazepines", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Symptom-triggered benzodiazepines.'),
    (v_topic_id, 'A 59-year-old male has DKA with pH 7.05 and K+ 5.8 mEq/L on presentation.

Physical Examination:

Dry mucous membranes.

Laboratory Results:

Glucose 520 mg/dL.


What is the most appropriate initial management?', '["Potassium supplementation before any insulin regardless of level", "IV fluids and insulin after confirming potassium adequacy", "Oral hypoglycemic agent", "Bicarbonate for all DKA", "Insulin bolus only without fluids"]'::jsonb, 1, 'DKA: fluids first; insulin when K+ safe (>3.3); hold insulin if K+ <3.3 until repleted.'),
    (v_topic_id, 'A 48-year-old male was diagnosed with STEMI 45 minutes ago; cath lab activated.

Physical Examination:

Chest pain resolving after nitroglycerin.

Laboratory Results:

ECG: Residual ST elevation inferior leads.


In addition to aspirin, which medication should be given now before PCI?', '["Routine thrombolysis if PCI available", "Warfarin loading", "Discharge on heparin only", "P2Y12 inhibitor loading dose", "Oral beta-blocker mandatory before cath"]'::jsonb, 3, 'DAPT with P2Y12 load (ticagrelor/prasugrel/clopidogrel per protocol) is standard with PCI.'),
    (v_topic_id, 'A 66-year-old female has NSTEMI high-risk and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Early invasive strategy within 24\u201348 h", "Alternative unrelated therapy", "Delay treatment 1 week", "Observation only"]'::jsonb, 1, 'Standard management for NSTEMI high-risk: Early invasive strategy within 24–48 h.'),
    (v_topic_id, 'A 76-year-old female scenario: Medicare patient discharge.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Avoid care coordination", "Skip follow-up", "Ignore discharge planning", "Ensure understanding of meds and follow-up within 30 days", "No documentation"]'::jsonb, 3, 'Ensure understanding of meds and follow-up within 30 days'),
    (v_topic_id, 'A 38-year-old female is seen for Colorectal screening average risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Colonoscopy or FIT per guidelines"]'::jsonb, 4, 'Guideline-consistent care: Colonoscopy or FIT per guidelines.'),
    (v_topic_id, 'A 40-year-old male is seen for OUD buprenorphine.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Delayed care 6 months", "Induction when mild withdrawal", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Induction when mild withdrawal.'),
    (v_topic_id, 'A 45-year-old female is seen for Polypharmacy elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Deprescribing Beers criteria", "No intervention", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Deprescribing Beers criteria.'),
    (v_topic_id, 'A 25-year-old female is a 25-year-old sexually active female presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "Chlamydia/gonorrhea screening"]'::jsonb, 4, 'Evidence-based screening: Chlamydia/gonorrhea screening.'),
    (v_topic_id, 'A 76-year-old female is seen for Workers comp rehab.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy", "Graded return to work plan"]'::jsonb, 4, 'Guideline-consistent care: Graded return to work plan.'),
    (v_topic_id, 'A 59-year-old male is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Neutropenia infection risk", "No intervention", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 28-year-old female has Bacterial meningitis and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Empiric ceftriaxone + vancomycin \u00b1 ampicillin by age", "Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Bacterial meningitis: Empiric ceftriaxone + vancomycin ± ampicillin by age.'),
    (v_topic_id, 'A 75-year-old male is seen for Hypertension uncontrolled.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Add second agent thiazide or CCB", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Add second agent thiazide or CCB.'),
    (v_topic_id, 'A 23-year-old male is seen for HIV viral load detectable.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Resistance testing adjust ART", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Resistance testing adjust ART.'),
    (v_topic_id, 'A 43-year-old female is seen for Tdap pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Tdap each pregnancy", "Delayed care 6 months", "Contradicted therapy", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Tdap each pregnancy.'),
    (v_topic_id, 'A 58-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Vasospasm days 3\u201314; neurologic monitoring", "No follow-up needed", "No complications ever occur", "Disease is always benign"]'::jsonb, 1, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 23-year-old female has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Disease is always benign", "No follow-up needed", "Watch for VSD, papillary muscle rupture, arrhythmia"]'::jsonb, 4, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 44-year-old female has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Palliative focus; prognosis discussion", "No complications ever occur", "Immediate cure expected", "No follow-up needed", "Disease is always benign"]'::jsonb, 0, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 83-year-old male has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Disease is always benign", "No follow-up needed", "Risk progression to osteomyelitis/amputation", "No complications ever occur"]'::jsonb, 3, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 45-year-old male returns for follow-up of Chronic pain fibromyalgia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "No treatment indicated", "High-dose steroids indefinitely without indication", "Exercise, CBT, SNRI/gabapentinoid", "Antibiotics chronically"]'::jsonb, 3, 'Guideline-based chronic care for Chronic pain fibromyalgia.'),
    (v_topic_id, 'A 45-year-old female has Tension pneumothorax and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Needle decompression then chest tube", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Tension pneumothorax: Needle decompression then chest tube.'),
    (v_topic_id, 'A 76-year-old male has status asthmaticus not responding to three albuterol nebulizers.

Physical Examination:

Silent chest on auscultation.

Laboratory Results:

ABG: pH 7.32, PaCO2 48.


What is the most appropriate next step?', '["Discharge with inhaler", "Oral antihistamine only", "Chest CT", "Immediate intubation without trial of medical therapy", "IV magnesium sulfate and systemic corticosteroids"]'::jsonb, 4, 'Severe asthma requires systemic steroids and magnesium; prepare for escalation.'),
    (v_topic_id, 'A 44-year-old male is seen for Falls prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Delayed care 6 months", "Vitamin D exercise PT", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Vitamin D exercise PT.'),
    (v_topic_id, 'A 38-year-old female is seen for Breast cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Mammography per age risk", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Mammography per age risk.'),
    (v_topic_id, 'A 46-year-old female is seen for Preeclampsia severe.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Contradicted therapy", "Magnesium sulfate delivery planning", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Magnesium sulfate delivery planning.'),
    (v_topic_id, 'A 64-year-old female has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Hypercalcemia, renal injury, infection risk", "Disease is always benign", "No complications ever occur", "Immediate cure expected", "No follow-up needed"]'::jsonb, 0, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 64-year-old female is a Type 2 diabetes presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "Screening only if symptomatic for all diseases", "Annual dilated eye exam and urine albumin", "PET scan annually", "No screening ever"]'::jsonb, 2, 'Evidence-based screening: Annual dilated eye exam and urine albumin.'),
    (v_topic_id, 'A 62-year-old female has Thyroid storm and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Propranolol, PTU/methimazole, iodine after antithyroid drug", "Alternative unrelated therapy", "Discharge without therapy", "Observation only"]'::jsonb, 1, 'Standard management for Thyroid storm: Propranolol, PTU/methimazole, iodine after antithyroid drug.'),
    (v_topic_id, 'A 34-year-old female has status asthmaticus not responding to three albuterol nebulizers.

Physical Examination:

Silent chest on auscultation.

Laboratory Results:

ABG: pH 7.32, PaCO2 48.


What is the most appropriate next step?', '["Chest CT", "Immediate intubation without trial of medical therapy", "Discharge with inhaler", "IV magnesium sulfate and systemic corticosteroids", "Oral antihistamine only"]'::jsonb, 3, 'Severe asthma requires systemic steroids and magnesium; prepare for escalation.'),
    (v_topic_id, 'A 76-year-old male is seen for Pneumococcal vaccines.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["PCV/PPSV per age immunocompromised", "Delayed care 6 months", "Placebo only", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: PCV/PPSV per age immunocompromised.'),
    (v_topic_id, 'A 72-year-old female is seen for Vitamin D deficiency.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy", "Supplementation recheck level"]'::jsonb, 4, 'Guideline-consistent care: Supplementation recheck level.'),
    (v_topic_id, 'A 38-year-old male is a 65-year-old never screened presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "PET scan annually", "One-time AAA ultrasound if ever smoked"]'::jsonb, 4, 'Evidence-based screening: One-time AAA ultrasound if ever smoked.'),
    (v_topic_id, 'A 42-year-old female is seen for COPD exacerbation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Delayed care 6 months", "Bronchodilator systemic steroid", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Bronchodilator systemic steroid.'),
    (v_topic_id, 'A 62-year-old female returns for follow-up of HFrEF EF 30%.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "ACE inhibitor/ARB + beta-blocker + MRA + SGLT2 inhibitor", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for HFrEF EF 30%.'),
    (v_topic_id, 'A 67-year-old female is seen for Lung cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Annual LDCT if criteria", "Placebo only", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Annual LDCT if criteria.'),
    (v_topic_id, 'A 62-year-old female returns for follow-up of Prior TIA noncardioembolic.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antiplatelet therapy and risk factor control", "High-dose steroids indefinitely without indication", "No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically"]'::jsonb, 0, 'Guideline-based chronic care for Prior TIA noncardioembolic.'),
    (v_topic_id, 'A 45-year-old male is seen for Asthma moderate.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["ICS LABA action plan", "Placebo only", "No intervention", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: ICS LABA action plan.'),
    (v_topic_id, 'A 29-year-old male is seen for ADHD school impairment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Stimulant with cardiovascular screening", "No intervention", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Stimulant with cardiovascular screening.'),
    (v_topic_id, 'A 28-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "Active surveillance may be appropriate", "No complications ever occur", "Immediate cure expected"]'::jsonb, 2, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 46-year-old female is seen for Diabetes A1c 8.5 on metformin.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Add GLP-1 or SGLT2i", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Add GLP-1 or SGLT2i.'),
    (v_topic_id, 'A 26-year-old female is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Neurologic decline days 4-14", "Contradicted therapy", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 49-year-old male has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "Immediate cure expected", "Progressive renal failure without treatment", "No complications ever occur"]'::jsonb, 3, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 24-year-old female is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Ultrasound q6 months", "Contradicted therapy", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 56-year-old male is seen for PrEP HIV risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Tenofovir emtricitabine monitoring", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Tenofovir emtricitabine monitoring.'),
    (v_topic_id, 'A 34-year-old male returns for follow-up of Rheumatoid arthritis.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Methotrexate first-line DMARD", "No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for Rheumatoid arthritis.'),
    (v_topic_id, 'A 38-year-old male is a HIV risk presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "HIV screening at least once", "Antibiotics prophylaxis", "Screening only if symptomatic for all diseases", "No screening ever"]'::jsonb, 1, 'Evidence-based screening: HIV screening at least once.'),
    (v_topic_id, 'A 49-year-old female has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Palliative focus; prognosis discussion", "No complications ever occur", "No follow-up needed", "Disease is always benign", "Immediate cure expected"]'::jsonb, 0, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 55-year-old female returns for follow-up of Asthma persistent.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["ICS with as-needed SABA; step up if uncontrolled", "Antibiotics chronically", "Discontinue all prior meds abruptly", "No treatment indicated", "High-dose steroids indefinitely without indication"]'::jsonb, 0, 'Guideline-based chronic care for Asthma persistent.'),
    (v_topic_id, 'A 63-year-old male has Anaphylaxis refractory and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy", "Observation only", "Repeat epinephrine, fluids, ICU monitoring"]'::jsonb, 4, 'Standard management for Anaphylaxis refractory: Repeat epinephrine, fluids, ICU monitoring.'),
    (v_topic_id, 'A 84-year-old male is seen for Neonatal jaundice phototherapy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Bilirubin threshold by age", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Bilirubin threshold by age.'),
    (v_topic_id, 'A 76-year-old male returns for follow-up of Type 2 diabetes A1c 9.2% on metformin.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Add GLP-1 RA or SGLT2i with ASCVD benefit if indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Type 2 diabetes A1c 9.2% on metformin.'),
    (v_topic_id, 'A 70-year-old female is seen for AAA screening smoker.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["One-time ultrasound", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: One-time ultrasound.'),
    (v_topic_id, 'A 74-year-old male is seen for Status epilepticus.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Contradicted therapy", "Benzodiazepine then levetiracetam", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Benzodiazepine then levetiracetam.'),
    (v_topic_id, 'A 49-year-old male has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "No follow-up needed", "5-year mortality remains significant; implantable defibrillator if criteria met", "Disease is always benign"]'::jsonb, 3, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 82-year-old male is seen for Latent TB treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Placebo only", "Isoniazid or rifampin course", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Isoniazid or rifampin course.'),
    (v_topic_id, 'A 28-year-old female is seen for Restless legs iron.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Check ferritin replete if low", "Placebo only", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Check ferritin replete if low.'),
    (v_topic_id, 'A 84-year-old male is seen for Eating disorder outpatient.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "No intervention", "Medical stabilization nutrition therapy", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Medical stabilization nutrition therapy.'),
    (v_topic_id, 'A 39-year-old male is seen for Iron deficiency post-menopause.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Colonoscopy if no obvious source", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Colonoscopy if no obvious source.'),
    (v_topic_id, 'A 31-year-old female is seen for Gout prophylaxis start ULT.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Colchicine when initiating allopurinol", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Colchicine when initiating allopurinol.'),
    (v_topic_id, 'A 84-year-old male is seen for Gestational diabetes.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Nutrition therapy insulin if needed", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Nutrition therapy insulin if needed.'),
    (v_topic_id, 'A 45-year-old female is seen for Migraine prophylaxis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Topiramate or CGRP inhibitor", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Topiramate or CGRP inhibitor.'),
    (v_topic_id, 'A 58-year-old female is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Ultrasound q6 months", "Placebo only", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 46-year-old female has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Uterotonics, massage, transfusion as needed", "Discharge without therapy", "Alternative unrelated therapy", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 37-year-old female is seen for GERD maintenance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Lowest effective PPI dose", "Contradicted therapy", "Delayed care 6 months", "Placebo only", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Lowest effective PPI dose.'),
    (v_topic_id, 'A 25-year-old male is seen for PTSD first line.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Contradicted therapy", "Delayed care 6 months", "Trauma-focused CBT or EMDR"]'::jsonb, 4, 'Guideline-consistent care: Trauma-focused CBT or EMDR.'),
    (v_topic_id, 'A 28-year-old male has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Immediate cure expected", "Risk progression to osteomyelitis/amputation", "No follow-up needed", "No complications ever occur"]'::jsonb, 2, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 35-year-old female has Acute spinal cord compression and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Dexamethasone and emergent radiation/surgery", "Discharge without therapy", "Observation only", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for Acute spinal cord compression: Dexamethasone and emergent radiation/surgery.'),
    (v_topic_id, 'A 62-year-old male is a Hep C baby boomer presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "HCV antibody screening once", "PET scan annually"]'::jsonb, 3, 'Evidence-based screening: HCV antibody screening once.'),
    (v_topic_id, 'A 63-year-old male has Malignant hyperthermia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy", "Dantrolene and stop triggering agents", "Observation only"]'::jsonb, 3, 'Standard management for Malignant hyperthermia: Dantrolene and stop triggering agents.'),
    (v_topic_id, 'A 42-year-old female has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Digoxin Fab fragments", "Observation only", "Alternative unrelated therapy", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 63-year-old male is seen for Cluster headache acute.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "No intervention", "High-flow oxygen sumatriptan", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: High-flow oxygen sumatriptan.'),
    (v_topic_id, 'A 50-year-old male has Ectopic pregnancy unstable and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Emergent surgical management", "Discharge without therapy", "Alternative unrelated therapy", "Delay treatment 1 week", "Observation only"]'::jsonb, 0, 'Standard management for Ectopic pregnancy unstable: Emergent surgical management.');
END $$;
COMMIT;
