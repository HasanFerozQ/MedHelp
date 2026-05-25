-- Step 3 Mock #5 day2-acp — 198 MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock5-day2-acp' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock5-day2-acp missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 33-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["DIC", "Aplastic anemia all cell lines low", "ITP", "Leukemia", "TTP"]'::jsonb, 2, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 81-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Annual chest CT for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "Screening starts at age 65 only"]'::jsonb, 2, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 55-year-old female has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Metronidazole only", "Fluconazole", "Ribavirin", "Vancomycin monotherapy", "Amoxicillin or doxycycline per guidelines"]'::jsonb, 4, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 60-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Justice requires randomization", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 62-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 27-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Sublingual nitroglycerin as monotherapy", "Oral clopidogrel and aspirin only", "Aggressive IV fluid bolus", "Immediate thrombolysis", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed"]'::jsonb, 4, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 62-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Barium swallow", "Observe without endoscopy", "Colonoscopy first", "Upper endoscopy (EGD)", "Abdominal MRI as first test"]'::jsonb, 3, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 59-year-old female with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Fluconazole monotherapy for induction", "Acyclovir IV", "High-dose steroids without antifungals", "Oral metronidazole", "Amphotericin B plus flucytosine, with careful ICP management"]'::jsonb, 4, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 77-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Discharge without any care", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Transfuse against wishes because physician knows best", "Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion"]'::jsonb, 1, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 30-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Macrolide (azithromycin), supportive care, contact prophylaxis", "Immediate surgery", "Steroids only", "No antibiotics needed", "Ribavirin"]'::jsonb, 0, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 59-year-old female has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["First-degree sunburn pattern", "Full-thickness (third-degree)", "Chemical burn only", "Superficial only", "All burns are partial thickness"]'::jsonb, 1, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 57-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "Discharge to home alone", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 26-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 62-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 37-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 71-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 82-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Justice requires randomization"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 71-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "Azithromycin first-line always", "Acyclovir", "No antibiotics for positive rapid strep", "Penicillin or amoxicillin"]'::jsonb, 4, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 69-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 62-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 44-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "No antibiotics for positive rapid strep", "Acyclovir", "Azithromycin first-line always", "Penicillin or amoxicillin"]'::jsonb, 4, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 23-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "Discharge to home alone", "Antipsychotic monotherapy without infection workup"]'::jsonb, 1, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 44-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["PID only", "Ectopic pregnancy", "Threatened abortion with IUP", "Normal pregnancy", "Ovarian torsion only without pregnancy"]'::jsonb, 1, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 26-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Annual chest CT for CRC screening", "No screening until symptoms", "Screening starts at age 65 only", "Colonoscopy every 10 years or FIT annually (shared decision)", "PSA for CRC screening"]'::jsonb, 3, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 74-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 29-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Start metformin and skip diagnostic testing", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Reassure \u2014 no further testing needed", "Schedule delivery at 28 weeks"]'::jsonb, 2, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 74-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "Physical restraints for agitation as first step"]'::jsonb, 1, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 74-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 42-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Obtain court order for transfusion in all religious refusal cases", "Discharge without any care"]'::jsonb, 2, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 42-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 62-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Transfuse against wishes because physician knows best", "Obtain court order for transfusion in all religious refusal cases", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Sedate patient and transfuse without discussion", "Discharge without any care"]'::jsonb, 2, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 64-year-old male G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Expectant management at home", "Vaginal delivery despite non-reassuring FHR without preparation", "Magnesium sulfate only", "Emergent cesarean delivery and maternal resuscitation", "Observation with outpatient follow-up"]'::jsonb, 3, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 37-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Screening starts at age 65 only", "PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "Annual chest CT for CRC screening", "No screening until symptoms"]'::jsonb, 2, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 55-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Obtain court order for transfusion in all religious refusal cases", "Discharge without any care", "Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 80-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Discharge without any care", "Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion", "Obtain court order for transfusion in all religious refusal cases"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 61-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Obtain court order for transfusion in all religious refusal cases", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Discharge without any care", "Sedate patient and transfuse without discussion", "Transfuse against wishes because physician knows best"]'::jsonb, 1, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 71-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Antipsychotic monotherapy without infection workup"]'::jsonb, 1, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 43-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 59-year-old male has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Graves disease", "Hashimoto thyroiditis", "Pituitary TSHoma only without hyperthyroid labs", "Subclinical hypothyroidism", "Sick euthyroid"]'::jsonb, 0, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 38-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Rheumatoid arthritis initial presentation", "Pseudogout (CPPD)", "Septic arthritis only without crystals", "OA flare", "Gout"]'::jsonb, 4, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 22-year-old female has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["Acute appendicitis only", "UTI", "Splenic sequestration benign", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "GERD"]'::jsonb, 3, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 36-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "Oral phenytoin monotherapy", "Nitroprusside as first-line seizure prophylaxis", "Immediate magnesium-free vaginal delivery without BP control", "IV magnesium sulfate loading and maintenance"]'::jsonb, 4, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 45-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 69-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 65-year-old male developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["IV antibiotics for pneumonia", "Thrombolysis for all stable patients", "Aspirin monotherapy", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "Observation with repeat imaging in 1 week"]'::jsonb, 3, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 34-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Kayexalate only without steroids", "Immediate thyroidectomy", "Observation until outpatient endocrinology visit", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Oral rehydration and discharge"]'::jsonb, 3, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 68-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 70-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Interferon-ribavirin only", "Liver transplant evaluation first-line", "Direct-acting antiviral regimen for 8\u201312 weeks", "Cholestyramine", "Observation without treatment ever"]'::jsonb, 2, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 74-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Antipsychotic monotherapy without infection workup"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 64-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Antipsychotic monotherapy without infection workup", "Discharge to home alone"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 43-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Screening starts at age 65 only", "Annual chest CT for CRC screening", "PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms"]'::jsonb, 3, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 48-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 65-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Incarcerated inguinal hernia", "Primary biliary cholangitis", "Postoperative adhesions", "Colonic malignancy as primary cause of SBO", "Acute appendicitis"]'::jsonb, 2, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 65-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Measles with ongoing high fever", "Roseola infantum (exanthem subitum due to HHV-6)", "Kawasaki disease", "Scarlet fever", "Meningococcemia"]'::jsonb, 1, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 70-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 69-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "PSA for CRC screening", "Annual chest CT for CRC screening", "Screening starts at age 65 only", "No screening until symptoms"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 42-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Septic arthritis only without crystals", "Rheumatoid arthritis initial presentation", "OA flare", "Gout", "Pseudogout (CPPD)"]'::jsonb, 3, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 56-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Contact dermatitis only", "Dermatomyositis only", "Gout", "Systemic lupus erythematosus", "Scabies"]'::jsonb, 3, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 55-year-old female with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Immediate transfuse to Hgb 15", "Oral iron only always sufficient", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Phlebotomy", "Vitamin B12 alone without checking iron"]'::jsonb, 2, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 34-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Obtain court order for transfusion in all religious refusal cases", "Transfuse against wishes because physician knows best", "Discharge without any care", "Sedate patient and transfuse without discussion", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 29-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 58-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Sedate patient and transfuse without discussion", "Discharge without any care", "Obtain court order for transfusion in all religious refusal cases", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Transfuse against wishes because physician knows best"]'::jsonb, 3, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 36-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Pulmonary embolism only", "Acute pericarditis", "Costochondritis only", "STEMI", "GERD only"]'::jsonb, 1, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 48-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 74-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "PSA for CRC screening", "Screening starts at age 65 only", "Annual chest CT for CRC screening"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 81-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "UTI only without uterine exam", "Appendicitis only", "Normal lochia \u2014 no treatment", "Mastitis"]'::jsonb, 0, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 58-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 77-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion", "Obtain court order for transfusion in all religious refusal cases", "Discharge without any care", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 81-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 30-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["No screening until symptoms", "Colonoscopy every 10 years or FIT annually (shared decision)", "Annual chest CT for CRC screening", "Screening starts at age 65 only", "PSA for CRC screening"]'::jsonb, 1, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 33-year-old male was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Oral fluids and observation", "Discharge after normal FAST", "CT abdomen with contrast before any transfusion in unstable patient", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "Diagnostic peritoneal lavage only without resuscitation"]'::jsonb, 3, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 42-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Stevens-Johnson syndrome", "Toxic epidermal necrolysis", "Lupus only", "Meningococcemia", "Drug reaction (amoxicillin rash)"]'::jsonb, 4, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 72-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 34-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 22-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Immediate surgery without medical preparation", "Beta-blocker monotherapy first", "High-dose loop diuretics alone", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Calcium channel blocker only"]'::jsonb, 3, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 79-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 46-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only", "Discharge if FAST negative", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids"]'::jsonb, 0, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 42-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Anticoagulation and evaluate for antiphospholipid syndrome", "Only hydroxychloroquine increase", "Stop all anticoagulation", "No workup for thrombophilia", "Platelet transfusion"]'::jsonb, 0, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 27-year-old male is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Immediate intubation for all stridor", "Chest CT with contrast", "Nebulized racemic epinephrine and dexamethasone", "Incision and drainage of neck", "Antibiotics (amoxicillin) as first-line"]'::jsonb, 2, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 32-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["No treatment", "Antibiotics for meningitis", "Acetazolamide, weight loss, stop offending agents, monitor vision", "High-dose opioids only", "Immediate craniotomy"]'::jsonb, 2, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 78-year-old male presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["High-dose IV beta-blocker before reperfusion", "Oral aspirin and discharge with outpatient stress test", "Urgent CT pulmonary angiography", "Emergent coronary angiography with primary PCI", "Intravenous heparin alone without reperfusion strategy"]'::jsonb, 3, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 52-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 72-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 32-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 35-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 24-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Immediate MRI spine before any fluids", "Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Discharge if FAST negative", "Oral antibiotics only"]'::jsonb, 2, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 83-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Abdominal MRI as first test", "Colonoscopy first", "Barium swallow", "Upper endoscopy (EGD)", "Observe without endoscopy"]'::jsonb, 3, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 68-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 44-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only", "Delay fracture management 72 hours", "Discharge if FAST negative", "Immediate MRI spine before any fluids"]'::jsonb, 0, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 34-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Discharge without any care", "Transfuse against wishes because physician knows best", "Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 42-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Annual chest CT for CRC screening", "Screening starts at age 65 only", "No screening until symptoms", "Colonoscopy every 10 years or FIT annually (shared decision)"]'::jsonb, 4, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 22-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["DKA", "Hypoglycemia", "Normal variant", "Hyperosmolar hyperglycemic state", "Lactic acidosis primary"]'::jsonb, 3, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 65-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 59-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

Physical Examination:

Vitals: Temp 37.0°C | HR 118 bpm | RR 28/min (deep) | BP 96/60 mmHg.
General: Lethargic but arousable.
Abdomen: Mild diffuse tenderness.

Laboratory Results:

Glucose: 486 mg/dL
pH: 7.12 | HCO3: 8 mEq/L
Anion gap: 28
Serum ketones: Positive
Potassium: 5.4 mEq/L (on presentation)


What is the most appropriate initial management?', '["Potassium supplementation before any fluids", "Immediate sodium bicarbonate for all patients", "Oral antidiabetic agents and discharge", "Subcutaneous insulin only and oral fluids", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2"]'::jsonb, 4, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 37-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Chest tube", "Antibiotics mandatory", "Racemic epinephrine required for all", "Single dose dexamethasone and supportive care", "Intubation"]'::jsonb, 3, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 64-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "PSA for CRC screening", "Annual chest CT for CRC screening", "Screening starts at age 65 only"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 43-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion", "Discharge without any care", "Transfuse against wishes because physician knows best", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 50-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Immediate intubation for all COPD exacerbations", "Antibiotics only without bronchodilators", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Sedation with benzodiazepines for anxiety", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics"]'::jsonb, 4, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 76-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours", "Oral antibiotics only", "Immediate MRI spine before any fluids", "Discharge if FAST negative"]'::jsonb, 0, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 78-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Intubation", "Single dose dexamethasone and supportive care", "Chest tube", "Racemic epinephrine required for all", "Antibiotics mandatory"]'::jsonb, 1, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 83-year-old female has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["GERD only", "Costochondritis only", "Pulmonary embolism only", "Acute pericarditis", "STEMI"]'::jsonb, 3, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 50-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion", "Transfuse against wishes because physician knows best", "Discharge without any care"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 76-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 23-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "No treatment ever", "Stroke", "Myasthenia gravis", "Brain tumor first-line"]'::jsonb, 0, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 80-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Antipsychotic monotherapy without infection workup", "Discharge to home alone"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 66-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Antipsychotic monotherapy without infection workup"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 43-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "Annual chest CT for CRC screening", "Screening starts at age 65 only"]'::jsonb, 1, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 43-year-old male has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Levothyroxine replacement", "Methimazole", "Propranolol only without levothyroxine", "Observation only", "Radioactive iodine"]'::jsonb, 0, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 67-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Normal lochia \u2014 no treatment", "Appendicitis only", "Mastitis", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "UTI only without uterine exam"]'::jsonb, 3, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 29-year-old male has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Essential hypertension only", "Primary hyperaldosteronism", "Hypothyroidism", "Pheochromocytoma", "Renal cell carcinoma"]'::jsonb, 1, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 58-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 39-year-old male has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Fluconazole", "Ribavirin", "Vancomycin monotherapy", "Amoxicillin or doxycycline per guidelines", "Metronidazole only"]'::jsonb, 3, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 77-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Normal pregnancy", "Ovarian torsion only without pregnancy", "PID only", "Threatened abortion with IUP", "Ectopic pregnancy"]'::jsonb, 4, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 39-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Oral antibiotics only", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids", "Discharge if FAST negative"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 47-year-old female with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Phlebotomy", "Immediate transfuse to Hgb 15", "Vitamin B12 alone without checking iron", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Oral iron only always sufficient"]'::jsonb, 3, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 69-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "Annual chest CT for CRC screening", "No screening until symptoms", "Screening starts at age 65 only", "PSA for CRC screening"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 78-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Obtain court order for transfusion in all religious refusal cases", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Sedate patient and transfuse without discussion", "Transfuse against wishes because physician knows best", "Discharge without any care"]'::jsonb, 1, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 81-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 71-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 64-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Screening starts at age 65 only", "PSA for CRC screening", "Annual chest CT for CRC screening", "No screening until symptoms", "Colonoscopy every 10 years or FIT annually (shared decision)"]'::jsonb, 4, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 66-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Physical restraints for agitation as first step"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 36-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 71-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Antipsychotic monotherapy without infection workup"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 29-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Discharge if FAST negative", "Immediate MRI spine before any fluids", "Oral antibiotics only"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 33-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging"]'::jsonb, 1, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 57-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["Observation only", "Immediate anticoagulation with warfarin", "High-dose steroids", "Lumbar puncture first", "IV alteplase evaluation and/or mechanical thrombectomy per protocol"]'::jsonb, 4, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 55-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 33-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 57-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Immediate MRI spine before any fluids", "Discharge if FAST negative", "Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only"]'::jsonb, 3, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 76-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "Discharge to home alone"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 37-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 82-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Acute diverticulitis \u2014 oral metronidazole", "Irritable bowel syndrome \u2014 antispasmodics", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Constipation \u2014 enema and discharge"]'::jsonb, 0, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 74-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 44-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 56-year-old male has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Empiric ceftriaxone for ascending cholangitis without imaging", "Observation for spontaneous resolution", "Oral ursodiol only and discharge", "Immediate appendectomy"]'::jsonb, 0, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 38-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "Discharge to home alone", "Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints"]'::jsonb, 4, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 41-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 29-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 83-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

Physical Examination:

Vitals: Temp 98.1°F | HR 96 bpm | RR 24/min | BP 102/68 mmHg.
Neck: JVD to the angle of the jaw.
Cardiac: Displaced PMI, S3 gallop, holosystolic murmur at the apex radiating to the axilla.
Lungs: Bibasilar crackles to mid-lung fields.
Extremities: 2+ pitting edema to the knees bilaterally.

Laboratory Results:

BNP: 1,420 pg/mL
Echocardiogram: LVEF 25%, moderate mitral regurgitation, dilated LV
Creatinine: 1.3 mg/dL


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Short-acting nitrates as monotherapy", "Digoxin as first-line mortality therapy", "Beta-blockers (e.g., carvedilol)", "Calcium channel blockers (amlodipine)", "Loop diuretics alone"]'::jsonb, 2, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 39-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Antibiotics only", "No repair ever", "Elective surgical repair when symptomatic", "Chemotherapy", "Emergent OR for all groin masses"]'::jsonb, 2, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 64-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Discharge without any care", "Obtain court order for transfusion in all religious refusal cases", "Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 40-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step", "Discharge to home alone", "Antipsychotic monotherapy without infection workup"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 31-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Physical restraints for agitation as first step", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 70-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 75-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 28-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Discharge home", "Forceps before complete dilation", "Magnesium for seizure prophylaxis", "Continue active labor management per stage", "Immediate cesarean for all primigravidas"]'::jsonb, 3, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 55-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Threatened abortion with closed cervix", "Molar pregnancy only", "Normal intrauterine pregnancy", "Incomplete abortion", "Ectopic pregnancy"]'::jsonb, 3, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 27-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Interferon-ribavirin only", "Direct-acting antiviral regimen for 8\u201312 weeks", "Liver transplant evaluation first-line", "Cholestyramine", "Observation without treatment ever"]'::jsonb, 1, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 26-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "Screening starts at age 65 only", "No screening until symptoms", "Annual chest CT for CRC screening"]'::jsonb, 1, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 34-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 78-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["No screening until symptoms", "Colonoscopy every 10 years or FIT annually (shared decision)", "PSA for CRC screening", "Screening starts at age 65 only", "Annual chest CT for CRC screening"]'::jsonb, 1, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 23-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Justice requires randomization", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 76-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 80-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 36-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

Physical Examination:

Vitals: Temp 38.4°C | HR 108 bpm | RR 20/min | BP 118/74 mmHg.
Cardiac: Holosystolic murmur at the left lower sternal border increasing with inspiration.
Skin: Non-tender hemorrhagic macules on palms (Janeway lesions) and tender nodules on finger pads (Osler nodes).
Eyes: Roth spots on fundoscopy.

Laboratory Results:

Blood cultures: Pending (3 sets drawn)
WBC: 14,200/mm³
ESR: 88 mm/hr
Transthoracic echo: 1.2 cm vegetation on tricuspid valve


What is the most appropriate next diagnostic/management step?', '["Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Rheumatoid factor and ANA panel only", "Bone marrow biopsy", "Oral amoxicillin and outpatient follow-up", "Immediate valve replacement without antibiotics"]'::jsonb, 0, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 76-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Screening starts at age 65 only", "Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "Annual chest CT for CRC screening"]'::jsonb, 2, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 24-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Normal intrauterine pregnancy", "Molar pregnancy only", "Ectopic pregnancy", "Incomplete abortion", "Threatened abortion with closed cervix"]'::jsonb, 3, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 82-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 58-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Annual chest CT for CRC screening", "PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "Screening starts at age 65 only", "No screening until symptoms"]'::jsonb, 2, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 74-year-old male has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["No antibiotics ever for diverticulitis", "Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "IV thrombolysis", "Immediate elective colectomy during this admission for all cases", "Appendectomy"]'::jsonb, 1, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 68-year-old male has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Knee arthroscopy", "Anticoagulation only", "Immediate amputation", "No imaging needed"]'::jsonb, 0, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 59-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion", "Transfuse against wishes because physician knows best", "Discharge without any care", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 55-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate"]'::jsonb, 3, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 69-year-old male has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "Warfarin loading", "Oral NSAIDs", "Discharge without endoscopy"]'::jsonb, 1, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 65-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Immediate MRI spine before any fluids", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours", "Oral antibiotics only", "Discharge if FAST negative"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 80-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Physical restraints for agitation as first step"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 62-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 58-year-old male is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Discharge without any care", "Sedate patient and transfuse without discussion", "Obtain court order for transfusion in all religious refusal cases", "Transfuse against wishes because physician knows best", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 56-year-old male Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Epinephrine as first step before compressions", "Begin chest compressions coordinated with ventilation", "Discharge to nursery", "Immediate intubation without ventilation trial", "Stop all resuscitation efforts"]'::jsonb, 1, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 62-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Sick euthyroid", "Subclinical hypothyroidism", "Pituitary TSHoma only without hyperthyroid labs", "Graves disease", "Hashimoto thyroiditis"]'::jsonb, 3, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 82-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "Screening starts at age 65 only", "No screening until symptoms", "Annual chest CT for CRC screening", "PSA for CRC screening"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 80-year-old male 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["Colonoscopy every 10 years or FIT annually (shared decision)", "PSA for CRC screening", "Screening starts at age 65 only", "No screening until symptoms", "Annual chest CT for CRC screening"]'::jsonb, 0, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 48-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Levothyroxine replacement", "Radioactive iodine", "Propranolol only without levothyroxine", "Methimazole", "Observation only"]'::jsonb, 0, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 63-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Platelet transfusion", "Stop all anticoagulation", "Anticoagulation and evaluate for antiphospholipid syndrome", "Only hydroxychloroquine increase", "No workup for thrombophilia"]'::jsonb, 2, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 58-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Immediate MRI spine before any fluids", "Oral antibiotics only", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours"]'::jsonb, 3, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 47-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 36-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Physical restraints for agitation as first step", "No antibiotics \u2014 delirium is normal aging", "Discharge to home alone", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Antipsychotic monotherapy without infection workup"]'::jsonb, 3, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 74-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Justice requires randomization", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 49-year-old female on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Start warfarin immediately", "Switch to subcutaneous enoxaparin", "Observation only", "Continue heparin and transfuse platelets", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)"]'::jsonb, 4, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 49-year-old female 45-year-old asymptomatic patient, never screened, average CRC risk, no family history of early CRC.

Physical Examination:

Vitals: Normal.
Exam: Normal.

Laboratory Results:

Prior labs normal


Appropriate colorectal cancer screening per USPSTF?', '["PSA for CRC screening", "Colonoscopy every 10 years or FIT annually (shared decision)", "No screening until symptoms", "Annual chest CT for CRC screening", "Screening starts at age 65 only"]'::jsonb, 1, 'Average-risk CRC screening begins at 45 (USPSTF) with colonoscopy or stool-based tests.'),
    (v_topic_id, 'A 23-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 80-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Antipsychotic monotherapy without infection workup", "Physical restraints for agitation as first step", "Discharge to home alone", "No antibiotics \u2014 delirium is normal aging"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 38-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 79-year-old male 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Antipsychotic monotherapy without infection workup", "No antibiotics \u2014 delirium is normal aging", "Physical restraints for agitation as first step"]'::jsonb, 0, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 36-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 24-year-old male is brought to the Emergency Department by his wife due to confusion and acting strange for the past 24 hours. he has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. he was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

Physical Examination:

Vitals: Temp 100.2°F | HR 104 bpm | RR 18/min | BP 108/62 mmHg.
Mental Status: Disoriented to time and place; follows simple commands but is slow to respond.
Physical: Mucous membranes are dry. Skin turgor is poor. No focal neurological deficits. Cardiac exam shows a soft systolic murmur. Lungs are clear to auscultation.

Laboratory Results:

Serum Sodium: 158 mEq/L (135–145)
Serum Potassium: 4.1 mEq/L (3.5–5.0)
Serum Glucose: 142 mg/dL (70–100)
BUN / Creatinine: 52 mg/dL / 2.1 mg/dL (baseline Cr 1.4)
Urine Osmolality: 550 mOsm/kg


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 3% (hypertonic) saline", "Administration of IV 0.9% (normal) saline", "Administration of IV 0.45% (half-normal) saline", "Rapid correction with 5% Dextrose in water (D5W)", "Desmopressin (dDAVP) administration"]'::jsonb, 2, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 76-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 27-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Transfuse against wishes because physician knows best", "Sedate patient and transfuse without discussion", "Discharge without any care", "Obtain court order for transfusion in all religious refusal cases", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 49-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Discharge without any care", "Sedate patient and transfuse without discussion", "Obtain court order for transfusion in all religious refusal cases", "Transfuse against wishes because physician knows best", "Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion"]'::jsonb, 4, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 22-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "Discharge to home alone", "Physical restraints for agitation as first step"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 52-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Alcohol-induced acute pancreatitis", "Mesenteric ischemia", "Peptic ulcer perforation", "Acute hepatitis A", "Acute cholecystitis from cholelithiasis"]'::jsonb, 0, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 55-year-old female 84-year-old nursing home resident with acute confusion, foul-smelling urine, suprapubic tenderness.

Physical Examination:

Vitals: Temp 38.8°C | HR 102.
Mental status: Acute delirium.
Abdomen: Suprapubic tenderness.

Laboratory Results:

UA: Positive nitrites, many WBC
WBC: 15,000


Most appropriate initial management?', '["Discharge to home alone", "Physical restraints for agitation as first step", "IV antibiotics, fluids, treat delirium triggers, avoid unnecessary restraints", "No antibiotics \u2014 delirium is normal aging", "Antipsychotic monotherapy without infection workup"]'::jsonb, 2, 'Delirium in elderly often infection — treat UTI, hydrate, avoid restraints; antipsychotics only if severe agitation threatening safety.'),
    (v_topic_id, 'A 22-year-old female is a competent adult who refuses life-saving blood transfusion for severe GI bleed due to religious beliefs, but is alert and understands mortality risk.

Physical Examination:

Vitals: HR 118 bpm | BP 88/54 mmHg after 1 L saline.
Mental status: Alert, oriented, articulate consistent refusal.
Abdomen: Melena reported.

Laboratory Results:

Hemoglobin: 5.9 g/dL


What is the most appropriate ethical/legal course?', '["Honor informed refusal if capacity intact; optimize non-blood alternatives and document discussion", "Transfuse against wishes because physician knows best", "Obtain court order for transfusion in all religious refusal cases", "Sedate patient and transfuse without discussion", "Discharge without any care"]'::jsonb, 0, 'Capacitated adults may refuse treatment including life-saving transfusion; document informed refusal and use maximal non-blood supportive care. Forced transfusion without incapacity violates autonomy. Court orders apply when lack of capacity/minor/emergency exceptions per law — not automatic for all refusals.'),
    (v_topic_id, 'A 43-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 52-year-old male has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Staging workup and multidisciplinary oncologic/surgical planning", "Ignore BI-RADS 4", "Antibiotics for mastitis", "Emergency appendectomy", "Topical estrogen cream only"]'::jsonb, 0, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 65-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["ERCP as first step for all RUQ pain", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "Observation without antibiotics", "Immediate splenectomy", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)"]'::jsonb, 4, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 64-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Oral antibiotics only", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids"]'::jsonb, 2, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 30-year-old male has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Lupus only", "Drug reaction (amoxicillin rash)", "Toxic epidermal necrolysis", "Meningococcemia", "Stevens-Johnson syndrome"]'::jsonb, 1, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.');
END $$;
COMMIT;
