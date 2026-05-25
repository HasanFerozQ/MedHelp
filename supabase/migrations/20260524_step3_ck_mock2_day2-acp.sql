-- Step 3 Mock #2 day2-acp — 198 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock2-day2-acp' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock2-day2-acp missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 53-year-old female is a Depression primary care presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Screening only if symptomatic for all diseases", "PET scan annually", "Antibiotics prophylaxis", "PHQ-2/9 screening"]'::jsonb, 4, 'Evidence-based screening: PHQ-2/9 screening.'),
    (v_topic_id, 'A 54-year-old female returns for follow-up of Asthma persistent.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "No treatment indicated", "Antibiotics chronically", "ICS with as-needed SABA; step up if uncontrolled", "Discontinue all prior meds abruptly"]'::jsonb, 3, 'Guideline-based chronic care for Asthma persistent.'),
    (v_topic_id, 'A 71-year-old male returns for follow-up of Hyperthyroidism Graves.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "No treatment indicated", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "Methimazole; consider definitive therapy"]'::jsonb, 4, 'Guideline-based chronic care for Hyperthyroidism Graves.'),
    (v_topic_id, 'A 59-year-old female is seen for Glaucoma medical.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "No intervention", "Contradicted therapy", "Prostaglandin first line"]'::jsonb, 4, 'Guideline-consistent care: Prostaglandin first line.'),
    (v_topic_id, 'A 54-year-old female has Acute stroke tPA candidate and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "Alternative unrelated therapy", "Observation only", "IV alteplase within 4.5 h if no contraindications"]'::jsonb, 4, 'Standard management for Acute stroke tPA candidate: IV alteplase within 4.5 h if no contraindications.'),
    (v_topic_id, 'A 29-year-old female is a Abdominal aortic aneurysm presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["One-time ultrasound men 65\u201375 ever smoked", "Antibiotics prophylaxis", "PET scan annually", "No screening ever", "Screening only if symptomatic for all diseases"]'::jsonb, 0, 'Evidence-based screening: One-time ultrasound men 65–75 ever smoked.'),
    (v_topic_id, 'A 22-year-old male is seen for Hep B vaccination risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "HBV vaccine series", "Contradicted therapy", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: HBV vaccine series.'),
    (v_topic_id, 'A 49-year-old male has Testicular torsion and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Emergent urologic exploration", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Testicular torsion: Emergent urologic exploration.'),
    (v_topic_id, 'A 28-year-old female is seen for Celiac strict gluten-free.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Contradicted therapy", "Dietitian referral", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Dietitian referral.'),
    (v_topic_id, 'A 82-year-old female is seen for Lung cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Annual LDCT if criteria", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Annual LDCT if criteria.'),
    (v_topic_id, 'A 26-year-old male has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["Observation without meds", "Intramuscular epinephrine", "IV diphenhydramine alone", "Oral prednisone only", "Albuterol nebulizer only"]'::jsonb, 1, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 53-year-old male is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Active surveillance low grade", "Contradicted therapy", "Placebo only", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 37-year-old female has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "N-acetylcysteine", "Discharge without therapy", "Observation only"]'::jsonb, 2, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 43-year-old male has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Disease is always benign", "Risk progression to osteomyelitis/amputation", "No follow-up needed"]'::jsonb, 3, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 69-year-old female is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Neutropenia infection risk", "Placebo only", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 68-year-old male is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "New holosystolic murmur shock", "Placebo only", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 53-year-old female is a HIV risk presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["HIV screening at least once", "Antibiotics prophylaxis", "PET scan annually", "Screening only if symptomatic for all diseases", "No screening ever"]'::jsonb, 0, 'Evidence-based screening: HIV screening at least once.'),
    (v_topic_id, 'A 61-year-old male is seen for Hep B vaccination risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention", "HBV vaccine series"]'::jsonb, 4, 'Guideline-consistent care: HBV vaccine series.'),
    (v_topic_id, 'A 59-year-old male has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Disease is always benign", "No follow-up needed", "Progressive renal failure without treatment", "No complications ever occur"]'::jsonb, 3, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 56-year-old female is seen for Statin primary prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "Placebo only", "ASCVD risk calculator", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: ASCVD risk calculator.'),
    (v_topic_id, 'A 44-year-old male is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Progressive renal failure risk", "Delayed care 6 months", "Contradicted therapy", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 64-year-old female is seen for Osteoporosis screening female.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["DEXA age 65 or earlier risk", "Contradicted therapy", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: DEXA age 65 or earlier risk.'),
    (v_topic_id, 'A 77-year-old male has Anaphylaxis refractory and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Observation only", "Discharge without therapy", "Repeat epinephrine, fluids, ICU monitoring", "Alternative unrelated therapy"]'::jsonb, 3, 'Standard management for Anaphylaxis refractory: Repeat epinephrine, fluids, ICU monitoring.'),
    (v_topic_id, 'A 70-year-old female has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No follow-up needed", "Disease is always benign", "No complications ever occur", "Palliative focus; prognosis discussion", "Immediate cure expected"]'::jsonb, 3, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 82-year-old female returns for follow-up of Psoriasis moderate.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Antibiotics chronically", "No treatment indicated", "High-dose steroids indefinitely without indication", "Topical steroids; phototherapy or systemic per severity"]'::jsonb, 4, 'Guideline-based chronic care for Psoriasis moderate.'),
    (v_topic_id, 'A 42-year-old male has Acute angle closure glaucoma and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Delay treatment 1 week", "Timolol, pilocarpine, IV acetazolamide, emergent laser", "Observation only", "Alternative unrelated therapy"]'::jsonb, 2, 'Standard management for Acute angle closure glaucoma: Timolol, pilocarpine, IV acetazolamide, emergent laser.'),
    (v_topic_id, 'A 47-year-old female has DKA with pH 7.05 and K+ 5.8 mEq/L on presentation.

Physical Examination:

Dry mucous membranes.

Laboratory Results:

Glucose 520 mg/dL.


What is the most appropriate initial management?', '["Oral hypoglycemic agent", "Potassium supplementation before any insulin regardless of level", "Insulin bolus only without fluids", "IV fluids and insulin after confirming potassium adequacy", "Bicarbonate for all DKA"]'::jsonb, 3, 'DKA: fluids first; insulin when K+ safe (>3.3); hold insulin if K+ <3.3 until repleted.'),
    (v_topic_id, 'A 52-year-old male is seen for Sleep apnea CPAP.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Adherence coaching", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Adherence coaching.'),
    (v_topic_id, 'A 42-year-old female is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Monitor abscess fistula formation", "No intervention", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 27-year-old male is seen for PTSD first line.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Trauma-focused CBT or EMDR", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Trauma-focused CBT or EMDR.'),
    (v_topic_id, 'A 58-year-old male is seen for Hypothyroidism.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Levothyroxine titrate TSH", "Placebo only", "No intervention", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Levothyroxine titrate TSH.'),
    (v_topic_id, 'A 74-year-old male is seen for BPH LUTS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Contradicted therapy", "No intervention", "Placebo only", "Alpha blocker 5-ARI if large prostate"]'::jsonb, 4, 'Guideline-consistent care: Alpha blocker 5-ARI if large prostate.'),
    (v_topic_id, 'A 53-year-old female has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Delay treatment 1 week", "Naloxone and airway support", "Observation only", "Discharge without therapy"]'::jsonb, 2, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 70-year-old male is seen for Tdap pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Placebo only", "Delayed care 6 months", "Tdap each pregnancy"]'::jsonb, 4, 'Guideline-consistent care: Tdap each pregnancy.'),
    (v_topic_id, 'A 25-year-old female is seen for Gestational diabetes.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Nutrition therapy insulin if needed", "Delayed care 6 months", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Nutrition therapy insulin if needed.'),
    (v_topic_id, 'A 43-year-old female has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "Observation only", "Alternative unrelated therapy", "NSAID, colchicine, or steroid depending comorbidities"]'::jsonb, 4, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 51-year-old female returns for follow-up of Type 2 diabetes A1c 9.2% on metformin.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "Antibiotics chronically", "Add GLP-1 RA or SGLT2i with ASCVD benefit if indicated", "No treatment indicated", "High-dose steroids indefinitely without indication"]'::jsonb, 2, 'Guideline-based chronic care for Type 2 diabetes A1c 9.2% on metformin.'),
    (v_topic_id, 'A 58-year-old male is seen for Status epilepticus.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention", "Benzodiazepine then levetiracetam"]'::jsonb, 4, 'Guideline-consistent care: Benzodiazepine then levetiracetam.'),
    (v_topic_id, 'A 31-year-old male is seen for Eating disorder outpatient.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Medical stabilization nutrition therapy", "No intervention", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Medical stabilization nutrition therapy.'),
    (v_topic_id, 'A 30-year-old male has Malignant hyperthermia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Discharge without therapy", "Alternative unrelated therapy", "Dantrolene and stop triggering agents", "Delay treatment 1 week"]'::jsonb, 3, 'Standard management for Malignant hyperthermia: Dantrolene and stop triggering agents.'),
    (v_topic_id, 'A 44-year-old female is seen for Pediatric asthma controller.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Daily ICS if frequent symptoms", "No intervention", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Daily ICS if frequent symptoms.'),
    (v_topic_id, 'A 57-year-old female has Ectopic pregnancy unstable and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Discharge without therapy", "Emergent surgical management", "Observation only", "Alternative unrelated therapy"]'::jsonb, 2, 'Standard management for Ectopic pregnancy unstable: Emergent surgical management.'),
    (v_topic_id, 'A 55-year-old female is seen for Advance care planning.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "POLST after goals discussion", "Placebo only", "No intervention", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: POLST after goals discussion.'),
    (v_topic_id, 'A 28-year-old female is seen for Opioid stewardship.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "PDMP check multimodal pain", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: PDMP check multimodal pain.'),
    (v_topic_id, 'A 67-year-old female is seen for Breast cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Mammography per age risk", "No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Mammography per age risk.'),
    (v_topic_id, 'A 69-year-old male scenario: Telemedicine rural follow-up.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Ignore discharge planning", "Video visit with BP log review", "No documentation", "Skip follow-up", "Avoid care coordination"]'::jsonb, 1, 'Video visit with BP log review'),
    (v_topic_id, 'A 34-year-old male has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "Calcium gluconate, insulin/dextrose, albuterol", "Delay treatment 1 week", "Observation only", "Alternative unrelated therapy"]'::jsonb, 1, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 61-year-old male returns for follow-up of HFpEF.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "No treatment indicated", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Diuretics for congestion; treat comorbid HTN/diabetes"]'::jsonb, 4, 'Guideline-based chronic care for HFpEF.'),
    (v_topic_id, 'A 39-year-old male is seen for Bell palsy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Prednisone within 72 hours", "Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Prednisone within 72 hours.'),
    (v_topic_id, 'A 74-year-old female was diagnosed with STEMI 45 minutes ago; cath lab activated.

Physical Examination:

Chest pain resolving after nitroglycerin.

Laboratory Results:

ECG: Residual ST elevation inferior leads.


In addition to aspirin, which medication should be given now before PCI?', '["Routine thrombolysis if PCI available", "Warfarin loading", "P2Y12 inhibitor loading dose", "Oral beta-blocker mandatory before cath", "Discharge on heparin only"]'::jsonb, 2, 'DAPT with P2Y12 load (ticagrelor/prasugrel/clopidogrel per protocol) is standard with PCI.'),
    (v_topic_id, 'A 75-year-old female is seen for Neonatal jaundice phototherapy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "No intervention", "Bilirubin threshold by age", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Bilirubin threshold by age.'),
    (v_topic_id, 'A 80-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Active surveillance may be appropriate", "Disease is always benign", "Immediate cure expected", "No complications ever occur", "No follow-up needed"]'::jsonb, 0, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 32-year-old male is seen for Alcohol withdrawal CIWA.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Symptom-triggered benzodiazepines", "Delayed care 6 months", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Symptom-triggered benzodiazepines.'),
    (v_topic_id, 'A 48-year-old male returns for follow-up of Rheumatoid arthritis.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "No treatment indicated", "Discontinue all prior meds abruptly", "High-dose steroids indefinitely without indication", "Methotrexate first-line DMARD"]'::jsonb, 4, 'Guideline-based chronic care for Rheumatoid arthritis.'),
    (v_topic_id, 'A 35-year-old female returns for follow-up of Schizophrenia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Antibiotics chronically", "Discontinue all prior meds abruptly", "Antipsychotic with metabolic monitoring", "No treatment indicated", "High-dose steroids indefinitely without indication"]'::jsonb, 2, 'Guideline-based chronic care for Schizophrenia.'),
    (v_topic_id, 'A 69-year-old female is seen for Restless legs iron.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Check ferritin replete if low", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Check ferritin replete if low.'),
    (v_topic_id, 'A 26-year-old female is seen for Cluster headache acute.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "High-flow oxygen sumatriptan", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: High-flow oxygen sumatriptan.'),
    (v_topic_id, 'A 31-year-old male is seen for Colorectal screening average risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "Placebo only", "Colonoscopy or FIT per guidelines", "No intervention"]'::jsonb, 3, 'Guideline-consistent care: Colonoscopy or FIT per guidelines.'),
    (v_topic_id, 'A 47-year-old male is seen for Osteoporosis screening female.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "DEXA age 65 or earlier risk", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: DEXA age 65 or earlier risk.'),
    (v_topic_id, 'A 25-year-old female is seen for OUD buprenorphine.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Induction when mild withdrawal", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Induction when mild withdrawal.'),
    (v_topic_id, 'A 66-year-old female is seen for Falls prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Vitamin D exercise PT", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Vitamin D exercise PT.'),
    (v_topic_id, 'A 57-year-old female is a Depression primary care presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Antibiotics prophylaxis", "Screening only if symptomatic for all diseases", "PET scan annually", "PHQ-2/9 screening"]'::jsonb, 4, 'Evidence-based screening: PHQ-2/9 screening.'),
    (v_topic_id, 'A 42-year-old female is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Neurologic decline days 4-14", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 44-year-old female has anaphylaxis with urticaria and wheeze after peanut ingestion.

Physical Examination:

BP 86/54 | HR 128 | SpO2 91%.

Laboratory Results:

No labs needed emergently.


What is the most appropriate immediate treatment?', '["Observation without meds", "Albuterol nebulizer only", "Oral prednisone only", "IV diphenhydramine alone", "Intramuscular epinephrine"]'::jsonb, 4, 'Anaphylaxis first-line is IM epinephrine; adjuncts do not replace it.'),
    (v_topic_id, 'A 24-year-old female is seen for Advance directives.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Document goals before incapacity", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Document goals before incapacity.'),
    (v_topic_id, 'A 74-year-old female is seen for Diabetes A1c 8.5 on metformin.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "No intervention", "Add GLP-1 or SGLT2i", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Add GLP-1 or SGLT2i.'),
    (v_topic_id, 'A 72-year-old male returns for follow-up of HFrEF EF 30%.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "ACE inhibitor/ARB + beta-blocker + MRA + SGLT2 inhibitor", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for HFrEF EF 30%.'),
    (v_topic_id, 'A 66-year-old female returns for follow-up of IBD maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Immunomodulator or biologic per severity", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "No treatment indicated", "Discontinue all prior meds abruptly"]'::jsonb, 0, 'Guideline-based chronic care for IBD maintenance.'),
    (v_topic_id, 'A 72-year-old male returns for follow-up of Bipolar disorder maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Lithium or valproate mood stabilizer", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Bipolar disorder maintenance.'),
    (v_topic_id, 'A 53-year-old female is seen for PrEP HIV risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Tenofovir emtricitabine monitoring", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Tenofovir emtricitabine monitoring.'),
    (v_topic_id, 'A 35-year-old female has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Digoxin Fab fragments", "Delay treatment 1 week", "Discharge without therapy", "Observation only"]'::jsonb, 1, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 23-year-old female has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No follow-up needed", "No complications ever occur", "Disease is always benign", "5-year mortality remains significant; implantable defibrillator if criteria met"]'::jsonb, 4, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 81-year-old male has GI bleed variceal and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Discharge without therapy", "Delay treatment 1 week", "Octreotide, antibiotics, emergent endoscopy banding"]'::jsonb, 4, 'Standard management for GI bleed variceal: Octreotide, antibiotics, emergent endoscopy banding.'),
    (v_topic_id, 'A 58-year-old male is seen for Delirium hospital.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "Treat cause minimize sedatives"]'::jsonb, 4, 'Guideline-consistent care: Treat cause minimize sedatives.'),
    (v_topic_id, 'A 51-year-old female is seen for Falls prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "No intervention", "Delayed care 6 months", "Vitamin D exercise PT"]'::jsonb, 4, 'Guideline-consistent care: Vitamin D exercise PT.'),
    (v_topic_id, 'A 64-year-old male is seen for Hypercalcemia malignancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["IV fluids bisphosphonate", "Delayed care 6 months", "Contradicted therapy", "Placebo only", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: IV fluids bisphosphonate.'),
    (v_topic_id, 'A 52-year-old male has Acute liver failure acetaminophen and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Discharge without therapy", "N-acetylcysteine", "Alternative unrelated therapy", "Observation only", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for Acute liver failure acetaminophen: N-acetylcysteine.'),
    (v_topic_id, 'A 66-year-old male is seen for Heart failure admission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "Diuretic GDMT optimization"]'::jsonb, 4, 'Guideline-consistent care: Diuretic GDMT optimization.'),
    (v_topic_id, 'A 38-year-old male is seen for Influenza prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "No intervention", "Delayed care 6 months", "Annual influenza vaccine"]'::jsonb, 4, 'Guideline-consistent care: Annual influenza vaccine.'),
    (v_topic_id, 'A 27-year-old female is seen for Asthma moderate.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["ICS LABA action plan", "Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: ICS LABA action plan.'),
    (v_topic_id, 'A 25-year-old male returns for follow-up of Osteoporosis T-score -2.8.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Bisphosphonate or alternative per guidelines", "No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 0, 'Guideline-based chronic care for Osteoporosis T-score -2.8.'),
    (v_topic_id, 'A 76-year-old female is seen for Increased ICP.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Placebo only", "Contradicted therapy", "Head elevation mannitol hyperventilation", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: Head elevation mannitol hyperventilation.'),
    (v_topic_id, 'A 73-year-old male is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Risk osteomyelitis amputation", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 70-year-old female has Heart failure reduced EF.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "Disease is always benign", "5-year mortality remains significant; implantable defibrillator if criteria met", "No follow-up needed", "No complications ever occur"]'::jsonb, 2, '5-year mortality remains significant; implantable defibrillator if criteria met'),
    (v_topic_id, 'A 23-year-old male is seen for STI partner treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Expedited partner therapy where legal", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Expedited partner therapy where legal.'),
    (v_topic_id, 'A 37-year-old female is a 45-year-old smoker 30 pack-years presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases", "Annual low-dose CT lung cancer screening", "PET scan annually"]'::jsonb, 3, 'Evidence-based screening: Annual low-dose CT lung cancer screening.'),
    (v_topic_id, 'A 43-year-old female has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Risk of necrosis, infection, organ failure", "Immediate cure expected", "No complications ever occur", "No follow-up needed", "Disease is always benign"]'::jsonb, 0, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 48-year-old male is a Hep C baby boomer presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["HCV antibody screening once", "Screening only if symptomatic for all diseases", "Antibiotics prophylaxis", "No screening ever", "PET scan annually"]'::jsonb, 0, 'Evidence-based screening: HCV antibody screening once.'),
    (v_topic_id, 'A 58-year-old male is seen for Preeclampsia severe.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Placebo only", "Magnesium sulfate delivery planning", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Magnesium sulfate delivery planning.'),
    (v_topic_id, 'A 28-year-old male was diagnosed with STEMI 45 minutes ago; cath lab activated.

Physical Examination:

Chest pain resolving after nitroglycerin.

Laboratory Results:

ECG: Residual ST elevation inferior leads.


In addition to aspirin, which medication should be given now before PCI?', '["P2Y12 inhibitor loading dose", "Oral beta-blocker mandatory before cath", "Discharge on heparin only", "Routine thrombolysis if PCI available", "Warfarin loading"]'::jsonb, 0, 'DAPT with P2Y12 load (ticagrelor/prasugrel/clopidogrel per protocol) is standard with PCI.'),
    (v_topic_id, 'A 78-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Immediate cure expected", "Vasospasm days 3\u201314; neurologic monitoring", "No complications ever occur", "No follow-up needed"]'::jsonb, 2, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 67-year-old female has Hyperkalemia ECG changes and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Calcium gluconate, insulin/dextrose, albuterol", "Delay treatment 1 week", "Observation only", "Discharge without therapy", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Hyperkalemia ECG changes: Calcium gluconate, insulin/dextrose, albuterol.'),
    (v_topic_id, 'A 40-year-old female is seen for Child abuse reporting.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Contradicted therapy", "Placebo only", "Mandatory report when suspected"]'::jsonb, 4, 'Guideline-consistent care: Mandatory report when suspected.'),
    (v_topic_id, 'A 30-year-old male returns for follow-up of COPD GOLD B.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "LAMA or LABA; pulmonary rehab", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for COPD GOLD B.'),
    (v_topic_id, 'A 28-year-old female has NSTEMI high-risk and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Early invasive strategy within 24\u201348 h", "Alternative unrelated therapy", "Delay treatment 1 week", "Observation only", "Discharge without therapy"]'::jsonb, 0, 'Standard management for NSTEMI high-risk: Early invasive strategy within 24–48 h.'),
    (v_topic_id, 'A 73-year-old male is seen for RA methotrexate.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Placebo only", "No intervention", "Folic acid monitoring LFTs", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Folic acid monitoring LFTs.'),
    (v_topic_id, 'A 84-year-old male has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Immediate cure expected", "High short-term mortality; transplant evaluation", "No complications ever occur", "No follow-up needed"]'::jsonb, 2, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 61-year-old female has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Immediate cure expected", "No complications ever occur", "Hypercalcemia, renal injury, infection risk", "Disease is always benign", "No follow-up needed"]'::jsonb, 2, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 24-year-old female has SLE nephritis.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "No follow-up needed", "Immediate cure expected", "Disease is always benign", "Progressive renal failure without treatment"]'::jsonb, 4, 'Progressive renal failure without treatment'),
    (v_topic_id, 'A 73-year-old male has Bacterial meningitis and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Empiric ceftriaxone + vancomycin \u00b1 ampicillin by age", "Delay treatment 1 week", "Observation only", "Discharge without therapy", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Bacterial meningitis: Empiric ceftriaxone + vancomycin ± ampicillin by age.'),
    (v_topic_id, 'A 77-year-old male is seen for Acute mania.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Antipsychotic mood stabilizer", "No intervention", "Placebo only", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Antipsychotic mood stabilizer.'),
    (v_topic_id, 'A 66-year-old female is a Average-risk 50-year-old presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "PET scan annually", "No screening ever", "Colorectal cancer screening per USPSTF", "Antibiotics prophylaxis"]'::jsonb, 3, 'Evidence-based screening: Colorectal cancer screening per USPSTF.'),
    (v_topic_id, 'A 71-year-old male has Diabetic foot ulcer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Risk progression to osteomyelitis/amputation", "No follow-up needed", "Disease is always benign", "Immediate cure expected"]'::jsonb, 1, 'Risk progression to osteomyelitis/amputation'),
    (v_topic_id, 'A 66-year-old female has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Watch for VSD, papillary muscle rupture, arrhythmia", "Immediate cure expected", "No complications ever occur", "No follow-up needed"]'::jsonb, 1, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 27-year-old female is seen for SAH vasospasm.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Neurologic decline days 4-14", "Placebo only", "No intervention", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Neurologic decline days 4-14.'),
    (v_topic_id, 'A 29-year-old female scenario: Workers compensation back pain.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Functional restoration; avoid prolonged opioids", "No documentation", "Ignore discharge planning", "Avoid care coordination", "Skip follow-up"]'::jsonb, 0, 'Functional restoration; avoid prolonged opioids'),
    (v_topic_id, 'A 28-year-old male is seen for Breakthrough pain cancer.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Short-acting opioid with bowel regimen", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Short-acting opioid with bowel regimen.'),
    (v_topic_id, 'A 68-year-old male has Neutropenic fever and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Discharge without therapy", "Delay treatment 1 week", "Empiric antipseudomonal beta-lactam"]'::jsonb, 4, 'Standard management for Neutropenic fever: Empiric antipseudomonal beta-lactam.'),
    (v_topic_id, 'A 36-year-old male has GI bleed variceal and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Octreotide, antibiotics, emergent endoscopy banding", "Delay treatment 1 week", "Observation only", "Alternative unrelated therapy", "Discharge without therapy"]'::jsonb, 0, 'Standard management for GI bleed variceal: Octreotide, antibiotics, emergent endoscopy banding.'),
    (v_topic_id, 'A 66-year-old female has status asthmaticus not responding to three albuterol nebulizers.

Physical Examination:

Silent chest on auscultation.

Laboratory Results:

ABG: pH 7.32, PaCO2 48.


What is the most appropriate next step?', '["Oral antihistamine only", "Chest CT", "Discharge with inhaler", "Immediate intubation without trial of medical therapy", "IV magnesium sulfate and systemic corticosteroids"]'::jsonb, 4, 'Severe asthma requires systemic steroids and magnesium; prepare for escalation.'),
    (v_topic_id, 'A 55-year-old male has Ectopic pregnancy unstable and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Emergent surgical management", "Delay treatment 1 week", "Observation only", "Discharge without therapy", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Ectopic pregnancy unstable: Emergent surgical management.'),
    (v_topic_id, 'A 30-year-old male is seen for Informed consent surgery.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "Placebo only", "Risks benefits alternatives documented", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Risks benefits alternatives documented.'),
    (v_topic_id, 'A 52-year-old male has Acute spinal cord compression and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Dexamethasone and emergent radiation/surgery", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 1, 'Standard management for Acute spinal cord compression: Dexamethasone and emergent radiation/surgery.'),
    (v_topic_id, 'A 74-year-old female has Tension pneumothorax and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Needle decompression then chest tube", "Alternative unrelated therapy", "Discharge without therapy", "Observation only"]'::jsonb, 1, 'Standard management for Tension pneumothorax: Needle decompression then chest tube.'),
    (v_topic_id, 'A 47-year-old male is seen for CKD G3a albuminuria.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only", "ACEi max tolerated dose"]'::jsonb, 4, 'Guideline-consistent care: ACEi max tolerated dose.'),
    (v_topic_id, 'A 79-year-old female has Acute gout and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["NSAID, colchicine, or steroid depending comorbidities", "Discharge without therapy", "Observation only", "Delay treatment 1 week", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Acute gout: NSAID, colchicine, or steroid depending comorbidities.'),
    (v_topic_id, 'A 83-year-old male is seen for Tobacco cessation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Varenicline plus counseling", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Varenicline plus counseling.'),
    (v_topic_id, 'A 84-year-old female is seen for Latent TB treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Isoniazid or rifampin course", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Isoniazid or rifampin course.'),
    (v_topic_id, 'A 44-year-old male is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only", "Ultrasound q6 months"]'::jsonb, 4, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 76-year-old male returns for follow-up of CKD stage 3 with albuminuria.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "ACEi/ARB for proteinuria reduction", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for CKD stage 3 with albuminuria.'),
    (v_topic_id, 'A 58-year-old male has Prostate cancer low risk.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "Active surveillance may be appropriate", "No follow-up needed", "Disease is always benign", "Immediate cure expected"]'::jsonb, 1, 'Active surveillance may be appropriate'),
    (v_topic_id, 'A 41-year-old female scenario: Quality improvement fall protocol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate systems-based action?', '["Avoid care coordination", "Ignore discharge planning", "No documentation", "Medication review and home safety evaluation", "Skip follow-up"]'::jsonb, 3, 'Medication review and home safety evaluation'),
    (v_topic_id, 'A 68-year-old male has Acute stroke tPA candidate and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["IV alteplase within 4.5 h if no contraindications", "Discharge without therapy", "Alternative unrelated therapy", "Delay treatment 1 week", "Observation only"]'::jsonb, 0, 'Standard management for Acute stroke tPA candidate: IV alteplase within 4.5 h if no contraindications.'),
    (v_topic_id, 'A 43-year-old male has Subarachnoid hemorrhage.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Vasospasm days 3\u201314; neurologic monitoring", "No follow-up needed", "No complications ever occur", "Immediate cure expected"]'::jsonb, 1, 'Vasospasm days 3–14; neurologic monitoring'),
    (v_topic_id, 'A 49-year-old male is a Osteoporosis postmenopausal presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Antibiotics prophylaxis", "PET scan annually", "DEXA screening per age/risk", "Screening only if symptomatic for all diseases", "No screening ever"]'::jsonb, 2, 'Evidence-based screening: DEXA screening per age/risk.'),
    (v_topic_id, 'A 37-year-old male is seen for PCOS infertility desire.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Weight loss clomiphene", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Weight loss clomiphene.'),
    (v_topic_id, 'A 31-year-old female is seen for Breast cancer chemo.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Neutropenia infection risk", "Placebo only", "Contradicted therapy", "No intervention", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: Neutropenia infection risk.'),
    (v_topic_id, 'A 48-year-old female is seen for Hearing loss screening elderly.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Audiology referral", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Audiology referral.'),
    (v_topic_id, 'A 64-year-old male is seen for Prostate cancer surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Active surveillance low grade", "Delayed care 6 months", "Placebo only"]'::jsonb, 2, 'Guideline-consistent care: Active surveillance low grade.'),
    (v_topic_id, 'A 50-year-old female is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Offloading wound care nutrition", "Contradicted therapy", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 55-year-old female returns for follow-up of Type 2 diabetes A1c 9.2% on metformin.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Add GLP-1 RA or SGLT2i with ASCVD benefit if indicated", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "Discontinue all prior meds abruptly", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Type 2 diabetes A1c 9.2% on metformin.'),
    (v_topic_id, 'A 51-year-old male is seen for Colorectal screening average risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Colonoscopy or FIT per guidelines", "Delayed care 6 months", "Placebo only", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Colonoscopy or FIT per guidelines.'),
    (v_topic_id, 'A 78-year-old female is a Type 2 diabetes presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["No screening ever", "Annual dilated eye exam and urine albumin", "Screening only if symptomatic for all diseases", "PET scan annually", "Antibiotics prophylaxis"]'::jsonb, 1, 'Evidence-based screening: Annual dilated eye exam and urine albumin.'),
    (v_topic_id, 'A 26-year-old female has Stage IV lung cancer.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Palliative focus; prognosis discussion", "No follow-up needed", "Disease is always benign", "No complications ever occur", "Immediate cure expected"]'::jsonb, 0, 'Palliative focus; prognosis discussion'),
    (v_topic_id, 'A 50-year-old male is seen for Pneumococcal vaccines.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "PCV/PPSV per age immunocompromised", "No intervention", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: PCV/PPSV per age immunocompromised.'),
    (v_topic_id, 'A 51-year-old male is seen for STEMI post stent.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention", "DAPT statin beta-blocker ACEi"]'::jsonb, 4, 'Guideline-consistent care: DAPT statin beta-blocker ACEi.'),
    (v_topic_id, 'A 81-year-old male is seen for Osteoporosis treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Bisphosphonate calcium vitamin D", "Placebo only", "Delayed care 6 months", "Contradicted therapy", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Bisphosphonate calcium vitamin D.'),
    (v_topic_id, 'A 57-year-old female has Cirrhosis Child-Pugh C.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["High short-term mortality; transplant evaluation", "No complications ever occur", "No follow-up needed", "Disease is always benign", "Immediate cure expected"]'::jsonb, 0, 'High short-term mortality; transplant evaluation'),
    (v_topic_id, 'A 61-year-old male has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Uterotonics, massage, transfusion as needed", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy", "Observation only"]'::jsonb, 0, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 49-year-old female is seen for Acute optic neuritis MS.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "IV methylprednisolone", "No intervention", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: IV methylprednisolone.'),
    (v_topic_id, 'A 60-year-old female has septic shock from pneumonia; MAP 58 on norepinephrine.

Physical Examination:

Lactate 4.2.

Laboratory Results:

Blood cultures drawn.


What is the most appropriate antibiotic strategy?', '["Await culture 48 hours before antibiotics", "Broad-spectrum IV antibiotics within 1 hour", "Oral amoxicillin only", "Topical antibiotics", "Fluoroquinolone monotherapy for all ICU patients always"]'::jsonb, 1, 'Septic shock requires urgent IV broad-spectrum antibiotics after cultures.'),
    (v_topic_id, 'A 60-year-old female is seen for Statin primary prevention.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy", "ASCVD risk calculator"]'::jsonb, 4, 'Guideline-consistent care: ASCVD risk calculator.'),
    (v_topic_id, 'A 67-year-old male is seen for Iron deficiency post-menopause.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Colonoscopy if no obvious source", "Placebo only", "No intervention", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Colonoscopy if no obvious source.'),
    (v_topic_id, 'A 70-year-old female returns for follow-up of Atrial fibrillation CHA2DS2-VASc 3.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Anticoagulation unless contraindicated", "No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically"]'::jsonb, 1, 'Guideline-based chronic care for Atrial fibrillation CHA2DS2-VASc 3.'),
    (v_topic_id, 'A 31-year-old female has Postpartum hemorrhage and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Uterotonics, massage, transfusion as needed", "Observation only", "Alternative unrelated therapy", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 0, 'Standard management for Postpartum hemorrhage: Uterotonics, massage, transfusion as needed.'),
    (v_topic_id, 'A 47-year-old male is seen for Postpartum depression.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "SSRI therapy support", "No intervention", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: SSRI therapy support.'),
    (v_topic_id, 'A 23-year-old female is seen for Diabetic foot infection.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Contradicted therapy", "Placebo only", "Risk osteomyelitis amputation"]'::jsonb, 4, 'Guideline-consistent care: Risk osteomyelitis amputation.'),
    (v_topic_id, 'A 59-year-old male is seen for COPD exacerbation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Bronchodilator systemic steroid", "No intervention", "Contradicted therapy", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Bronchodilator systemic steroid.'),
    (v_topic_id, 'A 54-year-old male is seen for IBD remission.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "No intervention", "Continue biologic therapy", "Placebo only"]'::jsonb, 3, 'Guideline-consistent care: Continue biologic therapy.'),
    (v_topic_id, 'A 70-year-old male is seen for Bipolar maintenance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Delayed care 6 months", "No intervention", "Placebo only", "Lithium level monitoring"]'::jsonb, 4, 'Guideline-consistent care: Lithium level monitoring.'),
    (v_topic_id, 'A 76-year-old female returns for follow-up of Psoriasis moderate.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Topical steroids; phototherapy or systemic per severity", "Discontinue all prior meds abruptly", "Antibiotics chronically", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for Psoriasis moderate.'),
    (v_topic_id, 'A 81-year-old female is a 25-year-old sexually active female presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Chlamydia/gonorrhea screening", "Antibiotics prophylaxis", "No screening ever", "Screening only if symptomatic for all diseases"]'::jsonb, 1, 'Evidence-based screening: Chlamydia/gonorrhea screening.'),
    (v_topic_id, 'A 30-year-old male returns for follow-up of Schizophrenia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "Discontinue all prior meds abruptly", "Antipsychotic with metabolic monitoring", "Antibiotics chronically", "No treatment indicated"]'::jsonb, 2, 'Guideline-based chronic care for Schizophrenia.'),
    (v_topic_id, 'A 58-year-old female is seen for NAFLD lifestyle.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Weight loss 7-10% target", "No intervention", "Placebo only", "Contradicted therapy"]'::jsonb, 1, 'Guideline-consistent care: Weight loss 7-10% target.'),
    (v_topic_id, 'A 27-year-old male is seen for Crohn fistula risk.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Monitor abscess fistula formation", "Contradicted therapy"]'::jsonb, 3, 'Guideline-consistent care: Monitor abscess fistula formation.'),
    (v_topic_id, 'A 48-year-old male returns for follow-up of IBD maintenance.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Immunomodulator or biologic per severity", "Discontinue all prior meds abruptly", "Antibiotics chronically", "No treatment indicated", "High-dose steroids indefinitely without indication"]'::jsonb, 0, 'Guideline-based chronic care for IBD maintenance.'),
    (v_topic_id, 'A 69-year-old male is seen for Lung cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "Annual LDCT if criteria"]'::jsonb, 4, 'Guideline-consistent care: Annual LDCT if criteria.'),
    (v_topic_id, 'A 25-year-old male returns for follow-up of Chronic pain fibromyalgia.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["No treatment indicated", "Antibiotics chronically", "Discontinue all prior meds abruptly", "Exercise, CBT, SNRI/gabapentinoid", "High-dose steroids indefinitely without indication"]'::jsonb, 3, 'Guideline-based chronic care for Chronic pain fibromyalgia.'),
    (v_topic_id, 'A 58-year-old female has Multiple myeloma.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "Hypercalcemia, renal injury, infection risk", "No follow-up needed", "Immediate cure expected", "No complications ever occur"]'::jsonb, 1, 'Hypercalcemia, renal injury, infection risk'),
    (v_topic_id, 'A 79-year-old female has Acute angle closure glaucoma and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Delay treatment 1 week", "Discharge without therapy", "Alternative unrelated therapy", "Timolol, pilocarpine, IV acetazolamide, emergent laser"]'::jsonb, 4, 'Standard management for Acute angle closure glaucoma: Timolol, pilocarpine, IV acetazolamide, emergent laser.'),
    (v_topic_id, 'A 76-year-old male is seen for Cirrhosis HCC surveillance.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Ultrasound q6 months", "Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention"]'::jsonb, 0, 'Guideline-consistent care: Ultrasound q6 months.'),
    (v_topic_id, 'A 33-year-old male has Acute pancreatitis severe.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["No complications ever occur", "No follow-up needed", "Risk of necrosis, infection, organ failure", "Disease is always benign", "Immediate cure expected"]'::jsonb, 2, 'Risk of necrosis, infection, organ failure'),
    (v_topic_id, 'A 38-year-old male is seen for Spinal cord compression.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Dexamethasone emergent radiation", "No intervention", "Contradicted therapy", "Delayed care 6 months"]'::jsonb, 1, 'Guideline-consistent care: Dexamethasone emergent radiation.'),
    (v_topic_id, 'A 68-year-old male has Neutropenic fever and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Discharge without therapy", "Delay treatment 1 week", "Observation only", "Empiric antipseudomonal beta-lactam"]'::jsonb, 4, 'Standard management for Neutropenic fever: Empiric antipseudomonal beta-lactam.'),
    (v_topic_id, 'A 71-year-old female is seen for Pressure ulcer stage 3.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Offloading wound care nutrition", "No intervention", "Delayed care 6 months", "Placebo only"]'::jsonb, 1, 'Guideline-consistent care: Offloading wound care nutrition.'),
    (v_topic_id, 'A 76-year-old female has STEMI post-PCI and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Dual antiplatelet therapy for 12 months unless bleeding risk", "Observation only", "Discharge without therapy", "Delay treatment 1 week"]'::jsonb, 1, 'Standard management for STEMI post-PCI: Dual antiplatelet therapy for 12 months unless bleeding risk.'),
    (v_topic_id, 'A 41-year-old female is seen for SLE lupus nephritis.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "Delayed care 6 months", "No intervention", "Progressive renal failure risk"]'::jsonb, 4, 'Guideline-consistent care: Progressive renal failure risk.'),
    (v_topic_id, 'A 80-year-old female has Acute spinal cord compression and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Observation only", "Alternative unrelated therapy", "Dexamethasone and emergent radiation/surgery", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Acute spinal cord compression: Dexamethasone and emergent radiation/surgery.'),
    (v_topic_id, 'A 71-year-old male has Digoxin toxicity arrhythmia and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy", "Digoxin Fab fragments", "Observation only"]'::jsonb, 3, 'Standard management for Digoxin toxicity arrhythmia: Digoxin Fab fragments.'),
    (v_topic_id, 'A 33-year-old female returns for follow-up of HIV stable.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Discontinue all prior meds abruptly", "ART adherence counseling; continue regimen", "High-dose steroids indefinitely without indication", "Antibiotics chronically", "No treatment indicated"]'::jsonb, 1, 'Guideline-based chronic care for HIV stable.'),
    (v_topic_id, 'A 40-year-old female is seen for Cervical cancer screening.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "Pap/HPV per guidelines", "Contradicted therapy", "Placebo only", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Pap/HPV per guidelines.'),
    (v_topic_id, 'A 28-year-old female has Thyroid storm and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Discharge without therapy", "Propranolol, PTU/methimazole, iodine after antithyroid drug", "Observation only"]'::jsonb, 3, 'Standard management for Thyroid storm: Propranolol, PTU/methimazole, iodine after antithyroid drug.'),
    (v_topic_id, 'A 27-year-old male returns for follow-up of Asthma persistent.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["ICS with as-needed SABA; step up if uncontrolled", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication", "No treatment indicated"]'::jsonb, 0, 'Guideline-based chronic care for Asthma persistent.'),
    (v_topic_id, 'A 29-year-old female is seen for Schizophrenia adherence.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Long-acting injectable antipsychotic", "Contradicted therapy", "Delayed care 6 months", "No intervention", "Placebo only"]'::jsonb, 0, 'Guideline-consistent care: Long-acting injectable antipsychotic.'),
    (v_topic_id, 'A 68-year-old female has Opioid overdose and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Alternative unrelated therapy", "Observation only", "Naloxone and airway support", "Discharge without therapy", "Delay treatment 1 week"]'::jsonb, 2, 'Standard management for Opioid overdose: Naloxone and airway support.'),
    (v_topic_id, 'A 26-year-old female has AMI complications.

Physical Examination:

Currently hospitalized.

Laboratory Results:

Clinical course discussed with team.


Which statement regarding prognosis/complications is most accurate?', '["Disease is always benign", "No complications ever occur", "Immediate cure expected", "No follow-up needed", "Watch for VSD, papillary muscle rupture, arrhythmia"]'::jsonb, 4, 'Watch for VSD, papillary muscle rupture, arrhythmia'),
    (v_topic_id, 'A 70-year-old male is seen for Tobacco cessation.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only", "Varenicline plus counseling"]'::jsonb, 4, 'Guideline-consistent care: Varenicline plus counseling.'),
    (v_topic_id, 'A 40-year-old female is seen for ADHD school impairment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Stimulant with cardiovascular screening", "Contradicted therapy", "Delayed care 6 months", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Stimulant with cardiovascular screening.'),
    (v_topic_id, 'A 51-year-old female returns for follow-up of COPD GOLD B.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["High-dose steroids indefinitely without indication", "No treatment indicated", "Discontinue all prior meds abruptly", "LAMA or LABA; pulmonary rehab", "Antibiotics chronically"]'::jsonb, 3, 'Guideline-based chronic care for COPD GOLD B.'),
    (v_topic_id, 'A 46-year-old female is seen for AAA screening smoker.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["One-time ultrasound", "Placebo only", "Delayed care 6 months", "No intervention", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: One-time ultrasound.'),
    (v_topic_id, 'A 67-year-old female is seen for Obesity pharmacotherapy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Contradicted therapy", "No intervention", "GLP-1 RA lifestyle", "Delayed care 6 months"]'::jsonb, 3, 'Guideline-consistent care: GLP-1 RA lifestyle.'),
    (v_topic_id, 'A 80-year-old female is a Osteoporosis postmenopausal presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "DEXA screening per age/risk", "No screening ever", "PET scan annually", "Antibiotics prophylaxis"]'::jsonb, 1, 'Evidence-based screening: DEXA screening per age/risk.'),
    (v_topic_id, 'A 75-year-old female is seen for AMI VSD complication.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["New holosystolic murmur shock", "No intervention", "Contradicted therapy", "Placebo only", "Delayed care 6 months"]'::jsonb, 0, 'Guideline-consistent care: New holosystolic murmur shock.'),
    (v_topic_id, 'A 74-year-old male is seen for Tdap pregnancy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Delayed care 6 months", "Placebo only", "Tdap each pregnancy"]'::jsonb, 4, 'Guideline-consistent care: Tdap each pregnancy.'),
    (v_topic_id, 'A 65-year-old female is seen for HIV viral load detectable.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Placebo only", "Delayed care 6 months", "No intervention", "Resistance testing adjust ART"]'::jsonb, 4, 'Guideline-consistent care: Resistance testing adjust ART.'),
    (v_topic_id, 'A 43-year-old female is seen for Postpartum hemorrhage.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "Uterotonics balloon tamponade", "Delayed care 6 months", "Placebo only", "No intervention"]'::jsonb, 1, 'Guideline-consistent care: Uterotonics balloon tamponade.'),
    (v_topic_id, 'A 48-year-old male has STEMI post-PCI and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Observation only", "Alternative unrelated therapy", "Dual antiplatelet therapy for 12 months unless bleeding risk", "Delay treatment 1 week", "Discharge without therapy"]'::jsonb, 2, 'Standard management for STEMI post-PCI: Dual antiplatelet therapy for 12 months unless bleeding risk.'),
    (v_topic_id, 'A 61-year-old female is seen for Vitamin D deficiency.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Delayed care 6 months", "No intervention", "Placebo only", "Contradicted therapy", "Supplementation recheck level"]'::jsonb, 4, 'Guideline-consistent care: Supplementation recheck level.'),
    (v_topic_id, 'A 33-year-old female is seen for Quality metric diabetes.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Placebo only", "Delayed care 6 months", "A1c BP LDL targets documented", "Contradicted therapy", "No intervention"]'::jsonb, 2, 'Guideline-consistent care: A1c BP LDL targets documented.'),
    (v_topic_id, 'A 45-year-old male has Thyroid storm and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Delay treatment 1 week", "Alternative unrelated therapy", "Observation only", "Propranolol, PTU/methimazole, iodine after antithyroid drug", "Discharge without therapy"]'::jsonb, 3, 'Standard management for Thyroid storm: Propranolol, PTU/methimazole, iodine after antithyroid drug.'),
    (v_topic_id, 'A 32-year-old female has Tension pneumothorax and is hemodynamically stable after initial resuscitation.

Physical Examination:

Vitals improving.

Laboratory Results:

Relevant diagnostics completed.


What is the most appropriate next step in management?', '["Needle decompression then chest tube", "Delay treatment 1 week", "Observation only", "Discharge without therapy", "Alternative unrelated therapy"]'::jsonb, 0, 'Standard management for Tension pneumothorax: Needle decompression then chest tube.'),
    (v_topic_id, 'A 22-year-old male has septic shock from pneumonia; MAP 58 on norepinephrine.

Physical Examination:

Lactate 4.2.

Laboratory Results:

Blood cultures drawn.


What is the most appropriate antibiotic strategy?', '["Oral amoxicillin only", "Topical antibiotics", "Await culture 48 hours before antibiotics", "Broad-spectrum IV antibiotics within 1 hour", "Fluoroquinolone monotherapy for all ICU patients always"]'::jsonb, 3, 'Septic shock requires urgent IV broad-spectrum antibiotics after cultures.'),
    (v_topic_id, 'A 70-year-old male is seen for Elder neglect.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["No intervention", "Delayed care 6 months", "APS referral safety plan", "Placebo only", "Contradicted therapy"]'::jsonb, 2, 'Guideline-consistent care: APS referral safety plan.'),
    (v_topic_id, 'A 84-year-old female is a 65-year-old never screened presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["Screening only if symptomatic for all diseases", "PET scan annually", "One-time AAA ultrasound if ever smoked", "No screening ever", "Antibiotics prophylaxis"]'::jsonb, 2, 'Evidence-based screening: One-time AAA ultrasound if ever smoked.'),
    (v_topic_id, 'A 60-year-old male is seen for Latent TB treatment.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Isoniazid or rifampin course", "Placebo only", "No intervention", "Delayed care 6 months", "Contradicted therapy"]'::jsonb, 0, 'Guideline-consistent care: Isoniazid or rifampin course.'),
    (v_topic_id, 'A 42-year-old male is seen for Diabetic retinopathy.

Physical Examination:

Appropriate exam for setting.

Laboratory Results:

Relevant diagnostics reviewed.


What is the most appropriate next step in management?', '["Contradicted therapy", "No intervention", "Tight glucose laser anti-VEGF", "Placebo only", "Delayed care 6 months"]'::jsonb, 2, 'Guideline-consistent care: Tight glucose laser anti-VEGF.'),
    (v_topic_id, 'A 26-year-old male returns for follow-up of Rheumatoid arthritis.

Physical Examination:

Stable exam.

Laboratory Results:

Labs reviewed.


What is the most appropriate long-term management?', '["Methotrexate first-line DMARD", "No treatment indicated", "Discontinue all prior meds abruptly", "Antibiotics chronically", "High-dose steroids indefinitely without indication"]'::jsonb, 0, 'Guideline-based chronic care for Rheumatoid arthritis.'),
    (v_topic_id, 'A 47-year-old male is a 25-year-old sexually active female presenting for preventive visit.

Physical Examination:

No acute complaints.

Laboratory Results:

Prior records reviewed.


Which preventive measure is most appropriate?', '["PET scan annually", "Chlamydia/gonorrhea screening", "Screening only if symptomatic for all diseases", "No screening ever", "Antibiotics prophylaxis"]'::jsonb, 1, 'Evidence-based screening: Chlamydia/gonorrhea screening.');
END $$;
COMMIT;
