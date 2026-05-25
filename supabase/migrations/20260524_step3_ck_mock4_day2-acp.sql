-- Step 3 Mock #4 day2-acp — 198 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock4-day2-acp' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock4-day2-acp missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 64-year-old female is a Average-risk 50-year-old presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Antibiotics prophylaxis", "Colorectal cancer screening per USPSTF", "PET scan annually", "Screening only if symptomatic for all diseases"]'::jsonb, 2, 'Evidence-based screening: Colorectal cancer screening per USPSTF.'),
    (v_topic_id, 'A 48-year-old female has Ectopic pregnancy unstable and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Discharge without therapy", "Emergent surgical management", "Delay treatment 1 week", "Alternative unrelated therapy"]'::jsonb, 2, 'Standard management for Ectopic pregnancy unstable: Emergent surgical management.'),
    (v_topic_id, 'A 61-year-old female is seen for Transitions of care.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Medication reconciliation 48h", "Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Medication reconciliation 48h.'),
    (v_topic_id, 'A 44-year-old female is seen for Hypercalcemia malignancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "IV fluids bisphosphonate", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: IV fluids bisphosphonate.'),
    (v_topic_id, 'A 50-year-old female is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Monitor abscess fistula formation", "No intervention", "Placebo only", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 54-year-old female has Bacterial meningitis and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Empiric ceftriaxone + vancomycin \u00b1 ampicillin by age", "Delay treatment 1 week", "Discharge without therapy", "Observation only"]'::jsonb, 1, 'Standard management for Bacterial meningitis: Empiric ceftriaxone + vancomycin ± ampicillin by age.'),
    (v_topic_id, 'A 70-year-old male is seen for Acute mania.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Antipsychotic mood stabilizer", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Antipsychotic mood stabilizer.'),
    (v_topic_id, 'A 48-year-old male is seen for Influenza prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Annual influenza vaccine", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Annual influenza vaccine.'),
    (v_topic_id, 'A 48-year-old male is seen for ADHD school impairment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Placebo only", "Stimulant with cardiovascular screening", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Stimulant with cardiovascular screening.'),
    (v_topic_id, 'A 58-year-old female is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "Ultrasound q6 months", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 71-year-old female is a Osteoporosis postmenopausal presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Antibiotics prophylaxis", "PET scan annually", "DEXA screening per age/risk", "Screening only if symptomatic for all diseases"]'::jsonb, 3, 'Evidence-based screening: DEXA screening per age/risk.'),
    (v_topic_id, 'A 23-year-old male has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "No follow-up needed", "Disease is always benign", "Risk progression to osteomyelitis/amputation"]'::jsonb, 4, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 23-year-old male has Tension pneumothorax and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Needle decompression then chest tube", "Observation only", "Delay treatment 1 week", "Alternative unrelated therapy"]'::jsonb, 1, 'Standard management for Tension pneumothorax: Needle decompression then chest tube.'),
    (v_topic_id, 'A 30-year-old male is seen for OUD buprenorphine.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "No intervention", "Delayed care 6 months", "Induction when mild withdrawal"]'::jsonb, 4, 'Guideline-consistent care: Induction when mild withdrawal.'),
    (v_topic_id, 'A 71-year-old male is seen for COPD exacerbation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Bronchodilator systemic steroid", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Bronchodilator systemic steroid.'),
    (v_topic_id, 'A 79-year-old male returns for follow-up of Hypertension stage 2.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "No treatment indicated", "Start thiazide/CCB/ACEi per JNC guidelines", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication"]'::jsonb, 2, 'Guideline-based chronic care for Hypertension stage 2.'),
    (v_topic_id, 'A 70-year-old female returns for follow-up of Type 2 diabetes A1c 9.2% on metformin.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Add GLP-1 RA or SGLT2i with ASCVD benefit if indicated", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antibiotics chronically"]'::jsonb, 1, 'Guideline-based chronic care for Type 2 diabetes A1c 9.2% on metformin.'),
    (v_topic_id, 'A 29-year-old male is seen for Elder neglect.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["APS referral safety plan", "Contradicted therapy", "Delayed care 6 months", "Placebo only", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: APS referral safety plan.'),
    (v_topic_id, 'A 42-year-old male is a 25-year-old sexually active female presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Chlamydia/gonorrhea screening", "Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "PET scan annually", "No screening ever"]'::jsonb, 0, 'Evidence-based screening: Chlamydia/gonorrhea screening.'),
    (v_topic_id, 'A 39-year-old female is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Active surveillance low grade", "Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 35-year-old male is seen for Tdap pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Tdap each pregnancy", "Placebo only", "Contradicted therapy", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Tdap each pregnancy.'),
    (v_topic_id, 'A 69-year-old male is seen for Iron deficiency post-menopause.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Colonoscopy if no obvious source", "Contradicted therapy", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Colonoscopy if no obvious source.'),
    (v_topic_id, 'A 68-year-old male is seen for Glaucoma medical.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Prostaglandin first line", "Delayed care 6 months", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Prostaglandin first line.'),
    (v_topic_id, 'A 74-year-old female has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["Intramuscular epinephrine", "Observation without meds", "Albuterol nebulizer only", "IV diphenhydramine alone", "Oral prednisone only"]'::jsonb, 0, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 38-year-old female is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Risk osteomyelitis amputation", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 29-year-old female is seen for Alcohol withdrawal CIWA.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Symptom-triggered benzodiazepines", "Placebo only", "Contradicted therapy", "No intervention", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Symptom-triggered benzodiazepines.'),
    (v_topic_id, 'A 35-year-old male is seen for Pediatric asthma controller.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Daily ICS if frequent symptoms", "Placebo only", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Daily ICS if frequent symptoms.'),
    (v_topic_id, 'A 33-year-old female is seen for Increased ICP.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "Head elevation mannitol hyperventilation"]'::jsonb, 4, 'Guideline-consistent care: Head elevation mannitol hyperventilation.'),
    (v_topic_id, 'A 44-year-old female is a Depression primary care presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PHQ-2/9 screening", "Antibiotics prophylaxis", "No screening ever", "PET scan annually", "Screening only if symptomatic for all diseases"]'::jsonb, 0, 'Evidence-based screening: PHQ-2/9 screening.'),
    (v_topic_id, 'A 45-year-old female is a Depression primary care presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Screening only if symptomatic for all diseases", "PHQ-2/9 screening", "No screening ever", "Antibiotics prophylaxis"]'::jsonb, 2, 'Evidence-based screening: PHQ-2/9 screening.'),
    (v_topic_id, 'A 76-year-old female is a Abdominal aortic aneurysm presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Antibiotics prophylaxis", "One-time ultrasound men 65\u201375 ever smoked", "Screening only if symptomatic for all diseases", "No screening ever"]'::jsonb, 2, 'Evidence-based screening: One-time ultrasound men 65–75 ever smoked.'),
    (v_topic_id, 'A 77-year-old male is seen for Heart failure admission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Diuretic GDMT optimization", "Delayed care 6 months", "Contradicted therapy", "Placebo only", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Diuretic GDMT optimization.'),
    (v_topic_id, 'A 62-year-old male is seen for Statin primary prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["ASCVD risk calculator", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: ASCVD risk calculator.'),
    (v_topic_id, 'A 35-year-old female returns for follow-up of Atrial fibrillation CHA2DS2-VASc 3.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "Anticoagulation unless contraindicated", "High-dose steroids indefinitely without indication", "No treatment indicated", "Discontinue all prior meds abruptly"]'::jsonb, 1, 'Guideline-based chronic care for Atrial fibrillation CHA2DS2-VASc 3.'),
    (v_topic_id, 'A 30-year-old female has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Naloxone and airway support", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 50-year-old male has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Calcium gluconate, insulin/dextrose, albuterol", "Delay treatment 1 week", "Discharge without therapy", "Observation only", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 52-year-old male returns for follow-up of Osteoporosis T-score -2.8.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Bisphosphonate or alternative per guidelines", "Antibiotics chronically", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for Osteoporosis T-score -2.8.'),
    (v_topic_id, 'A 38-year-old male returns for follow-up of IBD maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "No treatment indicated", "Discontinue all prior meds abruptly", "Immunomodulator or biologic per severity", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for IBD maintenance.'),
    (v_topic_id, 'A 40-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "No follow-up needed", "Active surveillance may be appropriate", "Disease is always benign", "Immediate cure expected"]'::jsonb, 2, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 65-year-old male is seen for Hearing loss screening elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Audiology referral", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Audiology referral.'),
    (v_topic_id, 'A 81-year-old male is seen for Migraine prophylaxis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Topiramate or CGRP inhibitor", "Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Topiramate or CGRP inhibitor.'),
    (v_topic_id, 'A 78-year-old female is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Neutropenia infection risk", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 46-year-old female is seen for Workers comp rehab.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Graded return to work plan", "Contradicted therapy", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Graded return to work plan.'),
    (v_topic_id, 'A 45-year-old male is a Average-risk 50-year-old presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Colorectal cancer screening per USPSTF", "Antibiotics prophylaxis", "Screening only if symptomatic for all diseases", "PET scan annually", "No screening ever"]'::jsonb, 0, 'Evidence-based screening: Colorectal cancer screening per USPSTF.'),
    (v_topic_id, 'A 76-year-old male is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Active surveillance low grade", "Placebo only", "No intervention", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 54-year-old male has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["N-acetylcysteine", "Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy", "Observation only"]'::jsonb, 0, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 66-year-old male has Malignant hyperthermia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Dantrolene and stop triggering agents", "Delay treatment 1 week", "Observation only", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 0, 'Standard management for Malignant hyperthermia: Dantrolene and stop triggering agents.'),
    (v_topic_id, 'A 74-year-old male is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only", "New holosystolic murmur shock"]'::jsonb, 4, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 27-year-old male is seen for Statin primary prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "ASCVD risk calculator", "Contradicted therapy", "No intervention", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: ASCVD risk calculator.'),
    (v_topic_id, 'A 26-year-old female is seen for Colorectal screening average risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Colonoscopy or FIT per guidelines", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Colonoscopy or FIT per guidelines.'),
    (v_topic_id, 'A 46-year-old female is seen for Colorectal screening average risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Contradicted therapy", "Delayed care 6 months", "Colonoscopy or FIT per guidelines"]'::jsonb, 4, 'Guideline-consistent care: Colonoscopy or FIT per guidelines.'),
    (v_topic_id, 'A 48-year-old female returns for follow-up of Hypothyroidism.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Levothyroxine titrated to TSH", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for Hypothyroidism.'),
    (v_topic_id, 'A 29-year-old female is seen for Hospital discharge bundle.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Follow-up appointment scheduled", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Follow-up appointment scheduled.'),
    (v_topic_id, 'A 34-year-old female has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Naloxone and airway support", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy", "Observation only"]'::jsonb, 0, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 44-year-old female has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Digoxin Fab fragments", "Alternative unrelated therapy", "Delay treatment 1 week", "Observation only", "Discharge without therapy"]'::jsonb, 0, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 51-year-old female is seen for Hep B vaccination risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["HBV vaccine series", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: HBV vaccine series.'),
    (v_topic_id, 'A 48-year-old male is seen for Advance directives.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Contradicted therapy", "Document goals before incapacity", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Document goals before incapacity.'),
    (v_topic_id, 'A 41-year-old male has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Immediate cure expected", "Disease is always benign", "No follow-up needed", "Hypercalcemia, renal injury, infection risk"]'::jsonb, 4, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 35-year-old female is seen for NAFLD lifestyle.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Contradicted therapy", "Placebo only", "Weight loss 7-10% target"]'::jsonb, 4, 'Guideline-consistent care: Weight loss 7-10% target.'),
    (v_topic_id, 'A 51-year-old male is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "New holosystolic murmur shock", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 50-year-old male has DKA with pH 7.05 and K+ 5.8 mEq/L on presentation.

Physical Examination:

Dry mucous membranes.

Laboratory Results:

Glucose 520 mg/dL.


What is the most appropriate initial management?', '["IV fluids and insulin after confirming potassium adequacy", "Bicarbonate for all DKA", "Oral hypoglycemic agent", "Insulin bolus only without fluids", "Potassium supplementation before any insulin regardless of level"]'::jsonb, 0, 'DKA: fluids first; insulin when K+ safe (>3.3); hold insulin if K+ <3.3 until repleted.'),
    (v_topic_id, 'A 53-year-old female returns for follow-up of Asthma persistent.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["ICS with as-needed SABA; step up if uncontrolled", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Asthma persistent.'),
    (v_topic_id, 'A 28-year-old female has Testicular torsion and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "Emergent urologic exploration", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Testicular torsion: Emergent urologic exploration.'),
    (v_topic_id, 'A 36-year-old male returns for follow-up of HFrEF EF 30%.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "ACE inhibitor/ARB + beta-blocker + MRA + SGLT2 inhibitor", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antibiotics chronically"]'::jsonb, 1, 'Guideline-based chronic care for HFrEF EF 30%.'),
    (v_topic_id, 'A 50-year-old male is seen for STI partner treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy", "Expedited partner therapy where legal"]'::jsonb, 4, 'Guideline-consistent care: Expedited partner therapy where legal.'),
    (v_topic_id, 'A 81-year-old female has Acute angle closure glaucoma and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Timolol, pilocarpine, IV acetazolamide, emergent laser", "Alternative unrelated therapy", "Observation only", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 0, 'Standard management for Acute angle closure glaucoma: Timolol, pilocarpine, IV acetazolamide, emergent laser.'),
    (v_topic_id, 'A 34-year-old male is seen for Febrile neutropenia.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Empiric antipseudomonal beta-lactam", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Empiric antipseudomonal beta-lactam.'),
    (v_topic_id, 'A 47-year-old male has DKA with pH 7.05 and K+ 5.8 mEq/L on presentation.

Physical Examination:

Dry mucous membranes.

Laboratory Results:

Glucose 520 mg/dL.


What is the most appropriate initial management?', '["Insulin bolus only without fluids", "Oral hypoglycemic agent", "Bicarbonate for all DKA", "Potassium supplementation before any insulin regardless of level", "IV fluids and insulin after confirming potassium adequacy"]'::jsonb, 4, 'DKA: fluids first; insulin when K+ safe (>3.3); hold insulin if K+ <3.3 until repleted.'),
    (v_topic_id, 'A 69-year-old female is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Ultrasound q6 months", "Placebo only", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 58-year-old male has Malignant hyperthermia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week", "Dantrolene and stop triggering agents"]'::jsonb, 4, 'Standard management for Malignant hyperthermia: Dantrolene and stop triggering agents.'),
    (v_topic_id, 'A 64-year-old male is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Neutropenia infection risk", "Delayed care 6 months", "Placebo only", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 30-year-old female is a 45-year-old smoker 30 pack-years presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Screening only if symptomatic for all diseases", "Annual low-dose CT lung cancer screening", "Antibiotics prophylaxis", "No screening ever"]'::jsonb, 2, 'Evidence-based screening: Annual low-dose CT lung cancer screening.'),
    (v_topic_id, 'A 62-year-old male is seen for Breakthrough pain cancer.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Short-acting opioid with bowel regimen", "Placebo only", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Short-acting opioid with bowel regimen.'),
    (v_topic_id, 'A 62-year-old female is seen for Delirium hospital.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Treat cause minimize sedatives", "No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Treat cause minimize sedatives.'),
    (v_topic_id, 'A 26-year-old male returns for follow-up of Schizophrenia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Antipsychotic with metabolic monitoring", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for Schizophrenia.'),
    (v_topic_id, 'A 45-year-old female is seen for STEMI post stent.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "DAPT statin beta-blocker ACEi", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: DAPT statin beta-blocker ACEi.'),
    (v_topic_id, 'A 84-year-old male has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "NSAID, colchicine, or steroid depending comorbidities", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 45-year-old male is seen for HIV viral load detectable.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "No intervention", "Delayed care 6 months", "Resistance testing adjust ART"]'::jsonb, 4, 'Guideline-consistent care: Resistance testing adjust ART.'),
    (v_topic_id, 'A 22-year-old female returns for follow-up of Asthma persistent.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "ICS with as-needed SABA; step up if uncontrolled"]'::jsonb, 4, 'Guideline-based chronic care for Asthma persistent.'),
    (v_topic_id, 'A 66-year-old female returns for follow-up of IBD maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Immunomodulator or biologic per severity"]'::jsonb, 4, 'Guideline-based chronic care for IBD maintenance.'),
    (v_topic_id, 'A 61-year-old male is seen for Falls prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Delayed care 6 months", "Vitamin D exercise PT", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Vitamin D exercise PT.'),
    (v_topic_id, 'A 65-year-old male is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Placebo only", "Neurologic decline days 4-14", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 61-year-old female is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "No intervention", "Progressive renal failure risk", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 59-year-old female is seen for PrEP HIV risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Tenofovir emtricitabine monitoring", "No intervention", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Tenofovir emtricitabine monitoring.'),
    (v_topic_id, 'A 78-year-old male is seen for Celiac strict gluten-free.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Dietitian referral", "No intervention", "Placebo only", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Dietitian referral.'),
    (v_topic_id, 'A 47-year-old female is seen for ED cardiovascular risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Assess ASCVD before PDE5", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Assess ASCVD before PDE5.'),
    (v_topic_id, 'A 81-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No follow-up needed", "No complications ever occur", "Disease is always benign", "Vasospasm days 3\u201314; neurologic monitoring"]'::jsonb, 4, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 24-year-old female is seen for Neonatal jaundice phototherapy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Bilirubin threshold by age", "Delayed care 6 months", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Bilirubin threshold by age.'),
    (v_topic_id, 'A 29-year-old female is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Contradicted therapy", "No intervention", "Neurologic decline days 4-14"]'::jsonb, 4, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 37-year-old male returns for follow-up of COPD GOLD B.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "LAMA or LABA; pulmonary rehab", "Discontinue all prior meds abruptly"]'::jsonb, 3, 'Guideline-based chronic care for COPD GOLD B.'),
    (v_topic_id, 'A 32-year-old male is a Hep C baby boomer presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["HCV antibody screening once", "PET scan annually", "Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "No screening ever"]'::jsonb, 0, 'Evidence-based screening: HCV antibody screening once.'),
    (v_topic_id, 'A 57-year-old female has Acute spinal cord compression and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Dexamethasone and emergent radiation/surgery", "Delay treatment 1 week", "Discharge without therapy", "Alternative unrelated therapy"]'::jsonb, 1, 'Standard management for Acute spinal cord compression: Dexamethasone and emergent radiation/surgery.'),
    (v_topic_id, 'A 64-year-old female is seen for Postpartum hemorrhage.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Contradicted therapy", "Uterotonics balloon tamponade", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Uterotonics balloon tamponade.'),
    (v_topic_id, 'A 53-year-old female has septic shock from pneumonia; MAP 58 on norepinephrine.

Physical Examination:

Lactate 4.2.

Laboratory Results:

Blood cultures drawn.


What is the most appropriate antibiotic strategy?', '["Topical antibiotics", "Broad-spectrum IV antibiotics within 1 hour", "Oral amoxicillin only", "Fluoroquinolone monotherapy for all ICU patients always", "Await culture 48 hours before antibiotics"]'::jsonb, 1, 'Septic shock requires urgent IV broad-spectrum antibiotics after cultures.'),
    (v_topic_id, 'A 73-year-old female returns for follow-up of Bipolar disorder maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antibiotics chronically", "Lithium or valproate mood stabilizer", "No treatment indicated"]'::jsonb, 3, 'Guideline-based chronic care for Bipolar disorder maintenance.'),
    (v_topic_id, 'A 64-year-old male has Bacterial meningitis and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy", "Observation only", "Empiric ceftriaxone + vancomycin \u00b1 ampicillin by age"]'::jsonb, 4, 'Standard management for Bacterial meningitis: Empiric ceftriaxone + vancomycin ± ampicillin by age.'),
    (v_topic_id, 'A 38-year-old female is seen for Cervical cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Pap/HPV per guidelines", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Pap/HPV per guidelines.'),
    (v_topic_id, 'A 30-year-old male has Neutropenic fever and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Empiric antipseudomonal beta-lactam", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 2, 'Standard management for Neutropenic fever: Empiric antipseudomonal beta-lactam.'),
    (v_topic_id, 'A 61-year-old male is seen for Gout prophylaxis start ULT.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "No intervention", "Delayed care 6 months", "Colchicine when initiating allopurinol"]'::jsonb, 4, 'Guideline-consistent care: Colchicine when initiating allopurinol.'),
    (v_topic_id, 'A 39-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Disease is always benign", "Active surveillance may be appropriate", "No follow-up needed"]'::jsonb, 3, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 29-year-old male is seen for Lung cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only", "Annual LDCT if criteria"]'::jsonb, 4, 'Guideline-consistent care: Annual LDCT if criteria.'),
    (v_topic_id, 'A 56-year-old male is seen for Cluster headache acute.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "High-flow oxygen sumatriptan", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: High-flow oxygen sumatriptan.'),
    (v_topic_id, 'A 57-year-old male returns for follow-up of Psoriasis moderate.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "Topical steroids; phototherapy or systemic per severity", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for Psoriasis moderate.'),
    (v_topic_id, 'A 23-year-old male is seen for Asthma moderate.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Placebo only", "Delayed care 6 months", "ICS LABA action plan"]'::jsonb, 4, 'Guideline-consistent care: ICS LABA action plan.'),
    (v_topic_id, 'A 79-year-old male is a HIV risk presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "No screening ever", "Antibiotics prophylaxis", "PET scan annually", "HIV screening at least once"]'::jsonb, 4, 'Evidence-based screening: HIV screening at least once.'),
    (v_topic_id, 'A 48-year-old female returns for follow-up of Hyperthyroidism Graves.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "High-dose steroids indefinitely without indication", "No treatment indicated", "Methimazole; consider definitive therapy", "Discontinue all prior meds abruptly"]'::jsonb, 3, 'Guideline-based chronic care for Hyperthyroidism Graves.'),
    (v_topic_id, 'A 74-year-old male is seen for Pneumococcal vaccines.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "PCV/PPSV per age immunocompromised", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: PCV/PPSV per age immunocompromised.'),
    (v_topic_id, 'A 35-year-old male has STEMI post-PCI and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Observation only", "Alternative unrelated therapy", "Dual antiplatelet therapy for 12 months unless bleeding risk", "Delay treatment 1 week"]'::jsonb, 3, 'Standard management for STEMI post-PCI: Dual antiplatelet therapy for 12 months unless bleeding risk.'),
    (v_topic_id, 'A 45-year-old male has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["Observation without meds", "IV diphenhydramine alone", "Intramuscular epinephrine", "Albuterol nebulizer only", "Oral prednisone only"]'::jsonb, 2, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 72-year-old female is a Type 2 diabetes presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Annual dilated eye exam and urine albumin", "No screening ever", "Antibiotics prophylaxis", "PET scan annually", "Screening only if symptomatic for all diseases"]'::jsonb, 0, 'Evidence-based screening: Annual dilated eye exam and urine albumin.'),
    (v_topic_id, 'A 70-year-old male has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "No follow-up needed", "Immediate cure expected", "Disease is always benign", "Progressive renal failure without treatment"]'::jsonb, 4, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 53-year-old male returns for follow-up of Hypertension stage 2.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "Discontinue all prior meds abruptly", "No treatment indicated", "Start thiazide/CCB/ACEi per JNC guidelines", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for Hypertension stage 2.'),
    (v_topic_id, 'A 49-year-old female is seen for Autism early intervention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["ABA/speech therapy referral", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: ABA/speech therapy referral.'),
    (v_topic_id, 'A 42-year-old male is seen for Postpartum depression.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Delayed care 6 months", "SSRI therapy support", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: SSRI therapy support.'),
    (v_topic_id, 'A 34-year-old male has Testicular torsion and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Emergent urologic exploration"]'::jsonb, 4, 'Standard management for Testicular torsion: Emergent urologic exploration.'),
    (v_topic_id, 'A 58-year-old female is seen for Bipolar maintenance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Lithium level monitoring", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Lithium level monitoring.'),
    (v_topic_id, 'A 64-year-old female has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Palliative focus; prognosis discussion", "No follow-up needed", "Disease is always benign", "No complications ever occur"]'::jsonb, 1, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 43-year-old female has GI bleed variceal and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Octreotide, antibiotics, emergent endoscopy banding", "Observation only", "Discharge without therapy", "Delay treatment 1 week", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for GI bleed variceal: Octreotide, antibiotics, emergent endoscopy banding.'),
    (v_topic_id, 'A 79-year-old female has Thyroid storm and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Propranolol, PTU/methimazole, iodine after antithyroid drug", "Observation only", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Thyroid storm: Propranolol, PTU/methimazole, iodine after antithyroid drug.'),
    (v_topic_id, 'A 34-year-old male is seen for Hearing loss screening elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Audiology referral", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Audiology referral.'),
    (v_topic_id, 'A 72-year-old male is seen for Pneumococcal vaccines.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "PCV/PPSV per age immunocompromised", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: PCV/PPSV per age immunocompromised.'),
    (v_topic_id, 'A 84-year-old female has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Uterotonics, massage, transfusion as needed", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 58-year-old male has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Discharge without therapy", "Alternative unrelated therapy", "Delay treatment 1 week", "Calcium gluconate, insulin/dextrose, albuterol"]'::jsonb, 4, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 62-year-old female is seen for STI partner treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Expedited partner therapy where legal", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Expedited partner therapy where legal.'),
    (v_topic_id, 'A 72-year-old female is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Offloading wound care nutrition", "No intervention", "Delayed care 6 months", "Placebo only", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 58-year-old female has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Progressive renal failure without treatment", "No follow-up needed", "No complications ever occur", "Disease is always benign", "Immediate cure expected"]'::jsonb, 0, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 30-year-old male is seen for Spinal cord compression.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Contradicted therapy", "Dexamethasone emergent radiation", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Dexamethasone emergent radiation.'),
    (v_topic_id, 'A 84-year-old male is seen for Acute optic neuritis MS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Placebo only", "Contradicted therapy", "IV methylprednisolone"]'::jsonb, 4, 'Guideline-consistent care: IV methylprednisolone.'),
    (v_topic_id, 'A 41-year-old female is seen for Telehealth follow-up CHF.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "Contradicted therapy", "Daily weight remote monitoring", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Daily weight remote monitoring.'),
    (v_topic_id, 'A 22-year-old female has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "Immediate cure expected", "Risk of necrosis, infection, organ failure", "No complications ever occur"]'::jsonb, 3, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 60-year-old female has Anaphylaxis refractory and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Delay treatment 1 week", "Alternative unrelated therapy", "Observation only", "Repeat epinephrine, fluids, ICU monitoring"]'::jsonb, 4, 'Standard management for Anaphylaxis refractory: Repeat epinephrine, fluids, ICU monitoring.'),
    (v_topic_id, 'A 41-year-old male is seen for Tumor lysis syndrome.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Rasburicase hydration allopurinol", "No intervention", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Rasburicase hydration allopurinol.'),
    (v_topic_id, 'A 42-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "No follow-up needed", "No complications ever occur", "Immediate cure expected", "Vasospasm days 3\u201314; neurologic monitoring"]'::jsonb, 4, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 43-year-old male is seen for IBD remission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Continue biologic therapy", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Continue biologic therapy.'),
    (v_topic_id, 'A 77-year-old male is a 45-year-old smoker 30 pack-years presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "Screening only if symptomatic for all diseases", "No screening ever", "PET scan annually", "Annual low-dose CT lung cancer screening"]'::jsonb, 4, 'Evidence-based screening: Annual low-dose CT lung cancer screening.'),
    (v_topic_id, 'A 60-year-old male is seen for Osteoporosis screening female.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention", "DEXA age 65 or earlier risk"]'::jsonb, 4, 'Guideline-consistent care: DEXA age 65 or earlier risk.'),
    (v_topic_id, 'A 45-year-old female is seen for Influenza prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "Annual influenza vaccine"]'::jsonb, 4, 'Guideline-consistent care: Annual influenza vaccine.'),
    (v_topic_id, 'A 48-year-old female is seen for AAA screening smoker.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "One-time ultrasound", "Contradicted therapy", "No intervention", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: One-time ultrasound.'),
    (v_topic_id, 'A 81-year-old female has NSTEMI high-risk and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Early invasive strategy within 24\u201348 h", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 2, 'Standard management for NSTEMI high-risk: Early invasive strategy within 24–48 h.'),
    (v_topic_id, 'A 22-year-old female is seen for Falls prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Placebo only", "Vitamin D exercise PT", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Vitamin D exercise PT.'),
    (v_topic_id, 'A 28-year-old female scenario: Telemedicine rural follow-up.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Avoid care coordination", "Ignore discharge planning", "No documentation", "Skip follow-up", "Video visit with BP log review"]'::jsonb, 4, 'Video visit with BP log review'),
    (v_topic_id, 'A 46-year-old female has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Disease is always benign", "Hypercalcemia, renal injury, infection risk", "No follow-up needed"]'::jsonb, 3, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 79-year-old female is seen for Atrial fibrillation new anticoagulation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "Start DOAC unless contraindicated", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Start DOAC unless contraindicated.'),
    (v_topic_id, 'A 62-year-old female is seen for Sleep apnea CPAP.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "No intervention", "Adherence coaching", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Adherence coaching.'),
    (v_topic_id, 'A 30-year-old female is seen for Subclinical hypothyroid pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Treat TSH >2.5 in first trimester", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Treat TSH >2.5 in first trimester.'),
    (v_topic_id, 'A 75-year-old female has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Immediate cure expected", "No complications ever occur", "Disease is always benign", "Risk of necrosis, infection, organ failure"]'::jsonb, 4, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 72-year-old male returns for follow-up of HFpEF.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Diuretics for congestion; treat comorbid HTN/diabetes", "No treatment indicated", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antibiotics chronically"]'::jsonb, 0, 'Guideline-based chronic care for HFpEF.'),
    (v_topic_id, 'A 70-year-old female is a 65-year-old never screened presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Antibiotics prophylaxis", "PET scan annually", "Screening only if symptomatic for all diseases", "One-time AAA ultrasound if ever smoked"]'::jsonb, 4, 'Evidence-based screening: One-time AAA ultrasound if ever smoked.'),
    (v_topic_id, 'A 31-year-old female is seen for Tdap pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Tdap each pregnancy", "Delayed care 6 months", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Tdap each pregnancy.'),
    (v_topic_id, 'A 42-year-old male has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "High short-term mortality; transplant evaluation", "No complications ever occur", "Disease is always benign", "No follow-up needed"]'::jsonb, 1, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 81-year-old male has status asthmaticus not responding to three albuterol nebulizers.

Physical Examination:

Silent chest on auscultation.

Laboratory Results:

ABG: pH 7.32, PaCO2 48.


What is the most appropriate next step?', '["IV magnesium sulfate and systemic corticosteroids", "Oral antihistamine only", "Immediate intubation without trial of medical therapy", "Chest CT", "Discharge with inhaler"]'::jsonb, 0, 'Severe asthma requires systemic steroids and magnesium; prepare for escalation.'),
    (v_topic_id, 'A 39-year-old male has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Digoxin Fab fragments", "Alternative unrelated therapy", "Discharge without therapy", "Observation only"]'::jsonb, 1, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 22-year-old male has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Discharge without therapy", "N-acetylcysteine", "Delay treatment 1 week"]'::jsonb, 3, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 30-year-old male is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Offloading wound care nutrition", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 50-year-old male was diagnosed with STEMI 45 minutes ago; cath lab activated.

Physical Examination:

Chest pain resolving after nitroglycerin.

Laboratory Results:

ECG: Residual ST elevation inferior leads.


In addition to aspirin, which medication should be given now before PCI?', '["P2Y12 inhibitor loading dose", "Oral beta-blocker mandatory before cath", "Warfarin loading", "Discharge on heparin only", "Routine thrombolysis if PCI available"]'::jsonb, 0, 'DAPT with P2Y12 load (ticagrelor/prasugrel/clopidogrel per protocol) is standard with PCI.'),
    (v_topic_id, 'A 50-year-old male is seen for Hypertension uncontrolled.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Add second agent thiazide or CCB", "Contradicted therapy", "Placebo only", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Add second agent thiazide or CCB.'),
    (v_topic_id, 'A 51-year-old female is seen for BPH LUTS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "No intervention", "Alpha blocker 5-ARI if large prostate", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Alpha blocker 5-ARI if large prostate.'),
    (v_topic_id, 'A 33-year-old male is seen for Tobacco cessation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Varenicline plus counseling", "Placebo only", "No intervention", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Varenicline plus counseling.'),
    (v_topic_id, 'A 30-year-old male has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Palliative focus; prognosis discussion", "No follow-up needed", "Disease is always benign"]'::jsonb, 2, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 25-year-old male is seen for Polypharmacy elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Deprescribing Beers criteria", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Deprescribing Beers criteria.'),
    (v_topic_id, 'A 49-year-old male is seen for Advance care planning.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "POLST after goals discussion", "Delayed care 6 months", "Placebo only", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: POLST after goals discussion.'),
    (v_topic_id, 'A 37-year-old male is seen for Hypothyroidism.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Levothyroxine titrate TSH", "Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Levothyroxine titrate TSH.'),
    (v_topic_id, 'A 68-year-old male has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "No complications ever occur", "Immediate cure expected", "5-year mortality remains significant; implantable defibrillator if criteria met", "No follow-up needed"]'::jsonb, 3, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 38-year-old female was diagnosed with STEMI 45 minutes ago; cath lab activated.

Physical Examination:

Chest pain resolving after nitroglycerin.

Laboratory Results:

ECG: Residual ST elevation inferior leads.


In addition to aspirin, which medication should be given now before PCI?', '["Routine thrombolysis if PCI available", "Discharge on heparin only", "Warfarin loading", "P2Y12 inhibitor loading dose", "Oral beta-blocker mandatory before cath"]'::jsonb, 3, 'DAPT with P2Y12 load (ticagrelor/prasugrel/clopidogrel per protocol) is standard with PCI.'),
    (v_topic_id, 'A 67-year-old male returns for follow-up of HFpEF.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Diuretics for congestion; treat comorbid HTN/diabetes"]'::jsonb, 4, 'Guideline-based chronic care for HFpEF.'),
    (v_topic_id, 'A 33-year-old female is seen for Gestational diabetes.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "No intervention", "Delayed care 6 months", "Nutrition therapy insulin if needed"]'::jsonb, 4, 'Guideline-consistent care: Nutrition therapy insulin if needed.'),
    (v_topic_id, 'A 60-year-old male has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week", "Uterotonics, massage, transfusion as needed", "Observation only"]'::jsonb, 3, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 39-year-old male is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Delayed care 6 months", "Placebo only", "Progressive renal failure risk"]'::jsonb, 4, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 82-year-old female is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Risk osteomyelitis amputation", "Contradicted therapy", "No intervention", "Placebo only", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 47-year-old male has status asthmaticus not responding to three albuterol nebulizers.

Physical Examination:

Silent chest on auscultation.

Laboratory Results:

ABG: pH 7.32, PaCO2 48.


What is the most appropriate next step?', '["IV magnesium sulfate and systemic corticosteroids", "Oral antihistamine only", "Chest CT", "Immediate intubation without trial of medical therapy", "Discharge with inhaler"]'::jsonb, 0, 'Severe asthma requires systemic steroids and magnesium; prepare for escalation.'),
    (v_topic_id, 'A 54-year-old male has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "No complications ever occur", "Immediate cure expected", "5-year mortality remains significant; implantable defibrillator if criteria met"]'::jsonb, 4, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 35-year-old male has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Delay treatment 1 week", "NSAID, colchicine, or steroid depending comorbidities", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 2, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 57-year-old female has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "No complications ever occur", "Watch for VSD, papillary muscle rupture, arrhythmia", "Immediate cure expected", "No follow-up needed"]'::jsonb, 2, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 34-year-old female is seen for Preeclampsia severe.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Magnesium sulfate delivery planning", "Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Magnesium sulfate delivery planning.'),
    (v_topic_id, 'A 46-year-old female is seen for Macular degeneration AREDS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention", "Antioxidant vitamins"]'::jsonb, 4, 'Guideline-consistent care: Antioxidant vitamins.'),
    (v_topic_id, 'A 55-year-old male has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Immediate cure expected", "No follow-up needed", "Disease is always benign", "Watch for VSD, papillary muscle rupture, arrhythmia"]'::jsonb, 4, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 36-year-old female has Anaphylaxis refractory and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Repeat epinephrine, fluids, ICU monitoring", "Discharge without therapy", "Delay treatment 1 week", "Observation only", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Anaphylaxis refractory: Repeat epinephrine, fluids, ICU monitoring.'),
    (v_topic_id, 'A 57-year-old female scenario: Workers compensation back pain.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Skip follow-up", "Ignore discharge planning", "No documentation", "Avoid care coordination", "Functional restoration; avoid prolonged opioids"]'::jsonb, 4, 'Functional restoration; avoid prolonged opioids'),
    (v_topic_id, 'A 79-year-old male returns for follow-up of HIV stable.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "No treatment indicated", "ART adherence counseling; continue regimen", "Antibiotics chronically"]'::jsonb, 3, 'Guideline-based chronic care for HIV stable.'),
    (v_topic_id, 'A 64-year-old male is seen for Trigeminal neuralgia.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "No intervention", "Carbamazepine first line", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Carbamazepine first line.'),
    (v_topic_id, 'A 63-year-old male has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "High short-term mortality; transplant evaluation", "No complications ever occur", "Disease is always benign", "No follow-up needed"]'::jsonb, 1, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 42-year-old male is seen for Latent TB treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "Isoniazid or rifampin course"]'::jsonb, 4, 'Guideline-consistent care: Isoniazid or rifampin course.'),
    (v_topic_id, 'A 56-year-old male is seen for Status epilepticus.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Benzodiazepine then levetiracetam", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Benzodiazepine then levetiracetam.'),
    (v_topic_id, 'A 62-year-old female is a 65-year-old never screened presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "One-time AAA ultrasound if ever smoked"]'::jsonb, 4, 'Evidence-based screening: One-time AAA ultrasound if ever smoked.'),
    (v_topic_id, 'A 25-year-old female has NSTEMI high-risk and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Alternative unrelated therapy", "Observation only", "Early invasive strategy within 24\u201348 h", "Delay treatment 1 week"]'::jsonb, 3, 'Standard management for NSTEMI high-risk: Early invasive strategy within 24–48 h.'),
    (v_topic_id, 'A 37-year-old male returns for follow-up of Psoriasis moderate.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "No treatment indicated", "Discontinue all prior meds abruptly", "Topical steroids; phototherapy or systemic per severity", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for Psoriasis moderate.'),
    (v_topic_id, 'A 55-year-old female has GI bleed variceal and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "Octreotide, antibiotics, emergent endoscopy banding", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for GI bleed variceal: Octreotide, antibiotics, emergent endoscopy banding.'),
    (v_topic_id, 'A 65-year-old male scenario: Medicare patient discharge.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Ignore discharge planning", "Skip follow-up", "No documentation", "Avoid care coordination", "Ensure understanding of meds and follow-up within 30 days"]'::jsonb, 4, 'Ensure understanding of meds and follow-up within 30 days'),
    (v_topic_id, 'A 45-year-old female is seen for Eating disorder outpatient.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "No intervention", "Medical stabilization nutrition therapy", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Medical stabilization nutrition therapy.'),
    (v_topic_id, 'A 47-year-old male has Ectopic pregnancy unstable and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Emergent surgical management", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Ectopic pregnancy unstable: Emergent surgical management.'),
    (v_topic_id, 'A 29-year-old female is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "No intervention", "Monitor abscess fistula formation", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 78-year-old female is seen for Breast cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Mammography per age risk", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Mammography per age risk.'),
    (v_topic_id, 'A 40-year-old male returns for follow-up of HFrEF EF 30%.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "ACE inhibitor/ARB + beta-blocker + MRA + SGLT2 inhibitor", "Discontinue all prior meds abruptly", "No treatment indicated", "High-dose steroids indefinitely without indication"]'::jsonb, 1, 'Guideline-based chronic care for HFrEF EF 30%.'),
    (v_topic_id, 'A 83-year-old male is seen for Osteoporosis treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Bisphosphonate calcium vitamin D", "Placebo only", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Bisphosphonate calcium vitamin D.'),
    (v_topic_id, 'A 84-year-old male returns for follow-up of Atrial fibrillation CHA2DS2-VASc 3.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Anticoagulation unless contraindicated", "Discontinue all prior meds abruptly", "No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 0, 'Guideline-based chronic care for Atrial fibrillation CHA2DS2-VASc 3.'),
    (v_topic_id, 'A 54-year-old male returns for follow-up of Rheumatoid arthritis.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Methotrexate first-line DMARD", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Rheumatoid arthritis.'),
    (v_topic_id, 'A 82-year-old female has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Risk progression to osteomyelitis/amputation", "Disease is always benign", "No complications ever occur", "No follow-up needed"]'::jsonb, 1, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 48-year-old male returns for follow-up of Cirrhosis ascites.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Sodium restriction and diuretics; paracentesis PRN", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly"]'::jsonb, 1, 'Guideline-based chronic care for Cirrhosis ascites.');
END $$;
COMMIT;
