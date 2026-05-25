-- Step 3 Mock #2 day1-fip — 240 MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock2-day1-fip' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock2-day1-fip missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 51-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Platelet transfusion", "Anticoagulation and evaluate for antiphospholipid syndrome", "No workup for thrombophilia", "Only hydroxychloroquine increase", "Stop all anticoagulation"]'::jsonb, 1, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 24-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["IV magnesium sulfate loading and maintenance", "Oral phenytoin monotherapy", "Observation only", "Immediate magnesium-free vaginal delivery without BP control", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 0, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 54-year-old male is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Racemic epinephrine required for all", "Antibiotics mandatory", "Single dose dexamethasone and supportive care", "Intubation", "Chest tube"]'::jsonb, 2, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 66-year-old female has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Cholestyramine", "Observation without treatment ever", "Direct-acting antiviral regimen for 8\u201312 weeks", "Interferon-ribavirin only", "Liver transplant evaluation first-line"]'::jsonb, 2, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 76-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Irritable bowel syndrome \u2014 antispasmodics", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Constipation \u2014 enema and discharge", "Acute diverticulitis \u2014 oral metronidazole", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization"]'::jsonb, 4, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 71-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Immediate thyroidectomy", "Kayexalate only without steroids", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Oral rehydration and discharge", "Observation until outpatient endocrinology visit"]'::jsonb, 2, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 36-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Immediate MRI spine before any fluids", "Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only"]'::jsonb, 3, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 27-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Observation until outpatient endocrinology visit", "Immediate thyroidectomy", "Kayexalate only without steroids", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Oral rehydration and discharge"]'::jsonb, 3, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 83-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "IV antibiotics for pneumonia", "Thrombolysis for all stable patients", "Observation with repeat imaging in 1 week", "Aspirin monotherapy"]'::jsonb, 0, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 67-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Delay fracture management 72 hours", "Oral antibiotics only", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Discharge if FAST negative", "Immediate MRI spine before any fluids"]'::jsonb, 2, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 47-year-old male is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Oral rehydration and discharge", "Observation until outpatient endocrinology visit", "Immediate thyroidectomy", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Kayexalate only without steroids"]'::jsonb, 3, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 23-year-old male with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["High-dose steroids without antifungals", "Fluconazole monotherapy for induction", "Oral metronidazole", "Amphotericin B plus flucytosine, with careful ICP management", "Acyclovir IV"]'::jsonb, 3, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 64-year-old male has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Upper endoscopy (EGD)", "Abdominal MRI as first test", "Colonoscopy first", "Observe without endoscopy", "Barium swallow"]'::jsonb, 0, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 23-year-old male has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Lupus only", "Drug reaction (amoxicillin rash)", "Toxic epidermal necrolysis", "Meningococcemia", "Stevens-Johnson syndrome"]'::jsonb, 1, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 51-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["High-dose loop diuretics alone", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Immediate surgery without medical preparation", "Beta-blocker monotherapy first", "Calcium channel blocker only"]'::jsonb, 1, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 44-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "IV magnesium sulfate loading and maintenance", "Oral phenytoin monotherapy", "Immediate magnesium-free vaginal delivery without BP control", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 1, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 62-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 58-year-old female G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Expectant management at home", "Vaginal delivery despite non-reassuring FHR without preparation", "Observation with outpatient follow-up", "Magnesium sulfate only", "Emergent cesarean delivery and maternal resuscitation"]'::jsonb, 4, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 77-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 55-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Acute hepatitis A", "Alcohol-induced acute pancreatitis", "Peptic ulcer perforation", "Acute cholecystitis from cholelithiasis", "Mesenteric ischemia"]'::jsonb, 1, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 59-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "Steroids only", "Immediate surgery", "Macrolide (azithromycin), supportive care, contact prophylaxis", "No antibiotics needed"]'::jsonb, 3, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 34-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "Azithromycin first-line always", "No antibiotics for positive rapid strep", "Acyclovir", "Penicillin or amoxicillin"]'::jsonb, 4, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 81-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start insulin immediately without further testing", "Schedule delivery at 28 weeks", "Start metformin and skip diagnostic testing", "Reassure \u2014 no further testing needed"]'::jsonb, 0, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 78-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 50-year-old female G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Magnesium sulfate only", "Vaginal delivery despite non-reassuring FHR without preparation", "Expectant management at home", "Observation with outpatient follow-up", "Emergent cesarean delivery and maternal resuscitation"]'::jsonb, 4, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 83-year-old male on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Continue heparin and transfuse platelets", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Switch to subcutaneous enoxaparin", "Start warfarin immediately", "Observation only"]'::jsonb, 1, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 36-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ectopic pregnancy", "Threatened abortion with IUP", "PID only", "Normal pregnancy", "Ovarian torsion only without pregnancy"]'::jsonb, 0, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 67-year-old male has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Hyperosmolar hyperglycemic state", "DKA", "Hypoglycemia", "Normal variant", "Lactic acidosis primary"]'::jsonb, 0, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 25-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Immediate intubation for all stridor", "Nebulized racemic epinephrine and dexamethasone", "Incision and drainage of neck", "Antibiotics (amoxicillin) as first-line", "Chest CT with contrast"]'::jsonb, 1, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 69-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 24-year-old male is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Oral rehydration and discharge", "Observation until outpatient endocrinology visit", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Kayexalate only without steroids", "Immediate thyroidectomy"]'::jsonb, 2, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 47-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["All burns are partial thickness", "Superficial only", "Full-thickness (third-degree)", "First-degree sunburn pattern", "Chemical burn only"]'::jsonb, 2, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 61-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ovarian torsion only without pregnancy", "PID only", "Normal pregnancy", "Ectopic pregnancy", "Threatened abortion with IUP"]'::jsonb, 3, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 33-year-old female Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Immediate intubation without ventilation trial", "Stop all resuscitation efforts", "Discharge to nursery", "Begin chest compressions coordinated with ventilation", "Epinephrine as first step before compressions"]'::jsonb, 3, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 47-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 45-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["High-dose steroids", "Lumbar puncture first", "IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Immediate anticoagulation with warfarin", "Observation only"]'::jsonb, 2, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 36-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Hashimoto thyroiditis", "Subclinical hypothyroidism", "Graves disease", "Pituitary TSHoma only without hyperthyroid labs", "Sick euthyroid"]'::jsonb, 2, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 28-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Immediate MRI spine before any fluids", "Oral antibiotics only", "Delay fracture management 72 hours", "Discharge if FAST negative"]'::jsonb, 0, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 73-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Racemic epinephrine required for all", "Single dose dexamethasone and supportive care", "Chest tube", "Antibiotics mandatory", "Intubation"]'::jsonb, 1, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 32-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids", "Oral antibiotics only", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation"]'::jsonb, 4, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 63-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only", "Immediate MRI spine before any fluids", "Delay fracture management 72 hours", "Discharge if FAST negative"]'::jsonb, 0, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 61-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Single dose dexamethasone and supportive care", "Racemic epinephrine required for all", "Chest tube", "Intubation", "Antibiotics mandatory"]'::jsonb, 0, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 57-year-old male presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["Immediate anticoagulation with warfarin", "Lumbar puncture first", "IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Observation only", "High-dose steroids"]'::jsonb, 2, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 59-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["No treatment ever", "Stroke", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Myasthenia gravis", "Brain tumor first-line"]'::jsonb, 2, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 83-year-old male Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Stop all resuscitation efforts", "Immediate intubation without ventilation trial", "Begin chest compressions coordinated with ventilation", "Discharge to nursery", "Epinephrine as first step before compressions"]'::jsonb, 2, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 45-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Antibiotics mandatory", "Intubation", "Chest tube", "Racemic epinephrine required for all", "Single dose dexamethasone and supportive care"]'::jsonb, 4, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 49-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["No treatment ever", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Brain tumor first-line", "Stroke", "Myasthenia gravis"]'::jsonb, 1, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 74-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Observation without treatment ever", "Interferon-ribavirin only", "Direct-acting antiviral regimen for 8\u201312 weeks", "Cholestyramine", "Liver transplant evaluation first-line"]'::jsonb, 2, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 56-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Stevens-Johnson syndrome", "Lupus only", "Toxic epidermal necrolysis", "Drug reaction (amoxicillin rash)", "Meningococcemia"]'::jsonb, 3, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 46-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 51-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Kawasaki disease", "Roseola infantum (exanthem subitum due to HHV-6)", "Scarlet fever", "Meningococcemia", "Measles with ongoing high fever"]'::jsonb, 1, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 77-year-old male is brought to the Emergency Department by his wife due to confusion and acting strange for the past 24 hours. he has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. he was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 0.9% (normal) saline", "Desmopressin (dDAVP) administration", "Administration of IV 3% (hypertonic) saline", "Administration of IV 0.45% (half-normal) saline", "Rapid correction with 5% Dextrose in water (D5W)"]'::jsonb, 3, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 82-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Penicillin or amoxicillin", "No antibiotics for positive rapid strep", "Acyclovir", "Prednisone only", "Azithromycin first-line always"]'::jsonb, 0, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 39-year-old male Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Stop all resuscitation efforts", "Immediate intubation without ventilation trial", "Discharge to nursery", "Begin chest compressions coordinated with ventilation", "Epinephrine as first step before compressions"]'::jsonb, 3, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 52-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 45-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 31-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Normal pregnancy", "Ectopic pregnancy", "Ovarian torsion only without pregnancy", "Threatened abortion with IUP", "PID only"]'::jsonb, 1, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 73-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 47-year-old male child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["Leukemia", "Aplastic anemia all cell lines low", "TTP", "ITP", "DIC"]'::jsonb, 3, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 32-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Direct-acting antiviral regimen for 8\u201312 weeks", "Observation without treatment ever", "Interferon-ribavirin only", "Liver transplant evaluation first-line", "Cholestyramine"]'::jsonb, 0, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 26-year-old male child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["Leukemia", "TTP", "ITP", "Aplastic anemia all cell lines low", "DIC"]'::jsonb, 2, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 22-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Normal variant", "DKA", "Lactic acidosis primary", "Hypoglycemia", "Hyperosmolar hyperglycemic state"]'::jsonb, 4, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 35-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Immediate thrombolysis", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Oral clopidogrel and aspirin only", "Aggressive IV fluid bolus", "Sublingual nitroglycerin as monotherapy"]'::jsonb, 1, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 29-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Normal lochia \u2014 no treatment", "Appendicitis only", "UTI only without uterine exam", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Mastitis"]'::jsonb, 3, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 74-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Hypothyroidism", "Renal cell carcinoma", "Primary hyperaldosteronism", "Essential hypertension only", "Pheochromocytoma"]'::jsonb, 2, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 25-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Anticoagulation and evaluate for antiphospholipid syndrome", "Platelet transfusion", "No workup for thrombophilia", "Only hydroxychloroquine increase", "Stop all anticoagulation"]'::jsonb, 0, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 54-year-old female presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Immediate thrombolysis", "Aggressive IV fluid bolus", "Oral clopidogrel and aspirin only", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Sublingual nitroglycerin as monotherapy"]'::jsonb, 3, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 62-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 38-year-old male with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Rheumatoid factor and ANA panel only", "Bone marrow biopsy", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Immediate valve replacement without antibiotics", "Oral amoxicillin and outpatient follow-up"]'::jsonb, 2, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 62-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Observation only", "Levothyroxine replacement", "Methimazole", "Radioactive iodine", "Propranolol only without levothyroxine"]'::jsonb, 1, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 28-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Oral antibiotics only", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Discharge if FAST negative"]'::jsonb, 3, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 61-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start metformin and skip diagnostic testing", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start insulin immediately without further testing", "Reassure \u2014 no further testing needed", "Schedule delivery at 28 weeks"]'::jsonb, 1, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 53-year-old female has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Observation for spontaneous resolution", "Empiric ceftriaxone for ascending cholangitis without imaging", "Immediate appendectomy", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Oral ursodiol only and discharge"]'::jsonb, 3, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 78-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["Antibiotics for meningitis", "Immediate craniotomy", "Acetazolamide, weight loss, stop offending agents, monitor vision", "No treatment", "High-dose opioids only"]'::jsonb, 2, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 31-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 48-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Beta-blockers (e.g., carvedilol)", "Loop diuretics alone", "Digoxin as first-line mortality therapy", "Short-acting nitrates as monotherapy", "Calcium channel blockers (amlodipine)"]'::jsonb, 0, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 31-year-old male has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Septic arthritis only without crystals", "Rheumatoid arthritis initial presentation", "Pseudogout (CPPD)", "OA flare", "Gout"]'::jsonb, 4, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 42-year-old male presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Oral aspirin and discharge with outpatient stress test", "Urgent CT pulmonary angiography", "High-dose IV beta-blocker before reperfusion", "Intravenous heparin alone without reperfusion strategy", "Emergent coronary angiography with primary PCI"]'::jsonb, 4, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 38-year-old male postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Appendicitis only", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "UTI only without uterine exam", "Mastitis", "Normal lochia \u2014 no treatment"]'::jsonb, 1, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 78-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["GERD only", "Costochondritis only", "STEMI", "Pulmonary embolism only", "Acute pericarditis"]'::jsonb, 4, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 49-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 68-year-old female has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Oral NSAIDs", "High-dose beta-blocker acute bolus only without endoscopy plan", "Warfarin loading", "Discharge without endoscopy", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol"]'::jsonb, 4, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 71-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Continue active labor management per stage", "Forceps before complete dilation", "Immediate cesarean for all primigravidas", "Discharge home", "Magnesium for seizure prophylaxis"]'::jsonb, 0, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 64-year-old female with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Amphotericin B plus flucytosine, with careful ICP management", "Fluconazole monotherapy for induction", "Oral metronidazole", "Acyclovir IV", "High-dose steroids without antifungals"]'::jsonb, 0, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 46-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Autonomy of physician to choose any procedure"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 36-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Immediate surgery", "Macrolide (azithromycin), supportive care, contact prophylaxis", "No antibiotics needed", "Ribavirin", "Steroids only"]'::jsonb, 1, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 47-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Reassure \u2014 no further testing needed", "Start metformin and skip diagnostic testing", "Schedule delivery at 28 weeks", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)"]'::jsonb, 4, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 43-year-old male is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Antibiotics mandatory", "Racemic epinephrine required for all", "Chest tube", "Single dose dexamethasone and supportive care", "Intubation"]'::jsonb, 3, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 78-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start metformin and skip diagnostic testing", "Reassure \u2014 no further testing needed", "Schedule delivery at 28 weeks"]'::jsonb, 1, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 75-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Threatened abortion with closed cervix", "Molar pregnancy only", "Normal intrauterine pregnancy", "Ectopic pregnancy", "Incomplete abortion"]'::jsonb, 4, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 76-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["ITP", "Leukemia", "Aplastic anemia all cell lines low", "DIC", "TTP"]'::jsonb, 0, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 41-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Oral antidiabetic agents and discharge", "Subcutaneous insulin only and oral fluids", "Immediate sodium bicarbonate for all patients", "Potassium supplementation before any fluids", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2"]'::jsonb, 4, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 82-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Immediate intubation for all COPD exacerbations", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Antibiotics only without bronchodilators", "Sedation with benzodiazepines for anxiety", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics"]'::jsonb, 4, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 64-year-old male has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Abdominal MRI as first test", "Observe without endoscopy", "Upper endoscopy (EGD)", "Barium swallow", "Colonoscopy first"]'::jsonb, 2, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 33-year-old male has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Levothyroxine replacement", "Methimazole", "Observation only", "Propranolol only without levothyroxine", "Radioactive iodine"]'::jsonb, 0, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 67-year-old male has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Oral NSAIDs", "High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "Discharge without endoscopy", "Warfarin loading"]'::jsonb, 2, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 75-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 49-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Dermatomyositis only", "Contact dermatitis only", "Gout", "Systemic lupus erythematosus", "Scabies"]'::jsonb, 3, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 23-year-old female with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Fluconazole monotherapy for induction", "Amphotericin B plus flucytosine, with careful ICP management", "Oral metronidazole", "High-dose steroids without antifungals", "Acyclovir IV"]'::jsonb, 1, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 33-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Renal cell carcinoma", "Pheochromocytoma", "Essential hypertension only", "Primary hyperaldosteronism", "Hypothyroidism"]'::jsonb, 3, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 42-year-old female has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Acute pericarditis", "Pulmonary embolism only", "Costochondritis only", "STEMI", "GERD only"]'::jsonb, 0, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 59-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "High-dose loop diuretics alone", "Beta-blocker monotherapy first", "Immediate surgery without medical preparation", "Calcium channel blocker only"]'::jsonb, 0, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 31-year-old male G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Magnesium sulfate only", "Observation with outpatient follow-up", "Expectant management at home", "Emergent cesarean delivery and maternal resuscitation", "Vaginal delivery despite non-reassuring FHR without preparation"]'::jsonb, 3, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 25-year-old female has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Anticoagulation only", "No imaging needed", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Immediate amputation", "Knee arthroscopy"]'::jsonb, 2, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 29-year-old female has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Brain tumor first-line", "Stroke", "Myasthenia gravis", "No treatment ever"]'::jsonb, 0, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 48-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "Oral phenytoin monotherapy", "Immediate magnesium-free vaginal delivery without BP control", "IV magnesium sulfate loading and maintenance", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 3, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 26-year-old male is brought to the Emergency Department by his wife due to confusion and acting strange for the past 24 hours. he has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. he was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 0.9% (normal) saline", "Desmopressin (dDAVP) administration", "Rapid correction with 5% Dextrose in water (D5W)", "Administration of IV 0.45% (half-normal) saline", "Administration of IV 3% (hypertonic) saline"]'::jsonb, 3, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 66-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Justice requires randomization", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 31-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Calcium channel blockers (amlodipine)", "Loop diuretics alone", "Beta-blockers (e.g., carvedilol)", "Digoxin as first-line mortality therapy", "Short-acting nitrates as monotherapy"]'::jsonb, 2, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 26-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["Immediate craniotomy", "Acetazolamide, weight loss, stop offending agents, monitor vision", "High-dose opioids only", "No treatment", "Antibiotics for meningitis"]'::jsonb, 1, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 40-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Oral iron only always sufficient", "Phlebotomy", "Immediate transfuse to Hgb 15", "Vitamin B12 alone without checking iron", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals"]'::jsonb, 4, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 50-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["PID only", "Ovarian torsion only without pregnancy", "Ectopic pregnancy", "Normal pregnancy", "Threatened abortion with IUP"]'::jsonb, 2, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 33-year-old male presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Observation only", "High-dose steroids", "Lumbar puncture first", "Immediate anticoagulation with warfarin"]'::jsonb, 0, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 62-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Postoperative adhesions", "Incarcerated inguinal hernia", "Acute appendicitis", "Primary biliary cholangitis", "Colonic malignancy as primary cause of SBO"]'::jsonb, 0, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 61-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "No antibiotics needed", "Immediate surgery", "Steroids only", "Macrolide (azithromycin), supportive care, contact prophylaxis"]'::jsonb, 4, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 47-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Immediate cesarean for all primigravidas", "Magnesium for seizure prophylaxis", "Discharge home", "Forceps before complete dilation", "Continue active labor management per stage"]'::jsonb, 4, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 47-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Contact dermatitis only", "Dermatomyositis only", "Systemic lupus erythematosus", "Scabies", "Gout"]'::jsonb, 2, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 81-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Immediate MRI spine before any fluids", "Oral antibiotics only", "Discharge if FAST negative"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 55-year-old male has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Stevens-Johnson syndrome", "Meningococcemia", "Drug reaction (amoxicillin rash)", "Toxic epidermal necrolysis", "Lupus only"]'::jsonb, 2, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 37-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "No antibiotics needed", "Immediate surgery", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Steroids only"]'::jsonb, 3, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 42-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 43-year-old male has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "Immediate elective colectomy during this admission for all cases", "Appendectomy", "IV thrombolysis", "No antibiotics ever for diverticulitis"]'::jsonb, 0, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 65-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["PID only", "Threatened abortion with IUP", "Normal pregnancy", "Ovarian torsion only without pregnancy", "Ectopic pregnancy"]'::jsonb, 4, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 62-year-old male postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Normal lochia \u2014 no treatment", "Mastitis", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Appendicitis only", "UTI only without uterine exam"]'::jsonb, 2, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 52-year-old female with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Phlebotomy", "Oral iron only always sufficient", "Vitamin B12 alone without checking iron", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Immediate transfuse to Hgb 15"]'::jsonb, 3, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 26-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ectopic pregnancy", "Ovarian torsion only without pregnancy", "Threatened abortion with IUP", "PID only", "Normal pregnancy"]'::jsonb, 0, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 43-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Drug reaction (amoxicillin rash)", "Toxic epidermal necrolysis", "Meningococcemia", "Lupus only", "Stevens-Johnson syndrome"]'::jsonb, 0, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 61-year-old male child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["TTP", "ITP", "DIC", "Leukemia", "Aplastic anemia all cell lines low"]'::jsonb, 1, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 22-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["No antibiotics for positive rapid strep", "Acyclovir", "Prednisone only", "Penicillin or amoxicillin", "Azithromycin first-line always"]'::jsonb, 3, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 38-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Meningococcemia", "Kawasaki disease", "Roseola infantum (exanthem subitum due to HHV-6)", "Measles with ongoing high fever", "Scarlet fever"]'::jsonb, 2, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 78-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Propranolol only without levothyroxine", "Radioactive iodine", "Observation only", "Levothyroxine replacement", "Methimazole"]'::jsonb, 3, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 39-year-old male presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Emergent coronary angiography with primary PCI", "Urgent CT pulmonary angiography", "Intravenous heparin alone without reperfusion strategy", "Oral aspirin and discharge with outpatient stress test", "High-dose IV beta-blocker before reperfusion"]'::jsonb, 0, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 68-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Observation with repeat imaging in 1 week", "Aspirin monotherapy", "IV antibiotics for pneumonia", "Thrombolysis for all stable patients", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant"]'::jsonb, 4, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 75-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Potassium supplementation before any fluids", "Oral antidiabetic agents and discharge", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Subcutaneous insulin only and oral fluids", "Immediate sodium bicarbonate for all patients"]'::jsonb, 2, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 64-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Gout", "OA flare", "Rheumatoid arthritis initial presentation", "Septic arthritis only without crystals", "Pseudogout (CPPD)"]'::jsonb, 0, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 47-year-old female on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Start warfarin immediately", "Continue heparin and transfuse platelets", "Switch to subcutaneous enoxaparin", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Observation only"]'::jsonb, 3, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 39-year-old female has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["GERD only", "STEMI", "Costochondritis only", "Pulmonary embolism only", "Acute pericarditis"]'::jsonb, 4, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 79-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Septic arthritis only without crystals", "Rheumatoid arthritis initial presentation", "Pseudogout (CPPD)", "OA flare", "Gout"]'::jsonb, 4, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 43-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Sedation with benzodiazepines for anxiety", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "Immediate intubation for all COPD exacerbations", "Antibiotics only without bronchodilators", "High-flow oxygen to maintain SpO2 >98% regardless of CO2"]'::jsonb, 1, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 80-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Antibiotics (amoxicillin) as first-line", "Nebulized racemic epinephrine and dexamethasone", "Immediate intubation for all stridor", "Chest CT with contrast", "Incision and drainage of neck"]'::jsonb, 1, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 79-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Meningococcemia", "Measles with ongoing high fever", "Roseola infantum (exanthem subitum due to HHV-6)", "Kawasaki disease", "Scarlet fever"]'::jsonb, 2, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 61-year-old male child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["DIC", "Aplastic anemia all cell lines low", "ITP", "Leukemia", "TTP"]'::jsonb, 2, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 82-year-old female has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Ribavirin", "Fluconazole", "Amoxicillin or doxycycline per guidelines", "Vancomycin monotherapy", "Metronidazole only"]'::jsonb, 2, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 58-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "No antibiotics for positive rapid strep", "Penicillin or amoxicillin", "Acyclovir", "Azithromycin first-line always"]'::jsonb, 2, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 83-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Molar pregnancy only", "Incomplete abortion", "Ectopic pregnancy", "Normal intrauterine pregnancy", "Threatened abortion with closed cervix"]'::jsonb, 1, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 47-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 30-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Normal intrauterine pregnancy", "Threatened abortion with closed cervix", "Molar pregnancy only", "Ectopic pregnancy", "Incomplete abortion"]'::jsonb, 4, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 45-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["DIC", "TTP", "Leukemia", "Aplastic anemia all cell lines low", "ITP"]'::jsonb, 4, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 49-year-old male G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Vaginal delivery despite non-reassuring FHR without preparation", "Magnesium sulfate only", "Observation with outpatient follow-up", "Expectant management at home", "Emergent cesarean delivery and maternal resuscitation"]'::jsonb, 4, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 29-year-old male reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Calcium channel blocker only", "High-dose loop diuretics alone", "Beta-blocker monotherapy first", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Immediate surgery without medical preparation"]'::jsonb, 3, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 62-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Immediate intubation for all COPD exacerbations", "Sedation with benzodiazepines for anxiety", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "Antibiotics only without bronchodilators"]'::jsonb, 3, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 37-year-old female G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Vaginal delivery despite non-reassuring FHR without preparation", "Expectant management at home", "Emergent cesarean delivery and maternal resuscitation", "Observation with outpatient follow-up", "Magnesium sulfate only"]'::jsonb, 2, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 38-year-old female has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Emergency appendectomy", "Topical estrogen cream only", "Antibiotics for mastitis", "Staging workup and multidisciplinary oncologic/surgical planning", "Ignore BI-RADS 4"]'::jsonb, 3, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 69-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only", "Immediate MRI spine before any fluids"]'::jsonb, 2, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 66-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Delay fracture management 72 hours", "Immediate MRI spine before any fluids", "Discharge if FAST negative", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Oral antibiotics only"]'::jsonb, 3, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 55-year-old female with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Phlebotomy", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Vitamin B12 alone without checking iron", "Immediate transfuse to Hgb 15", "Oral iron only always sufficient"]'::jsonb, 1, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 61-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Schedule delivery at 28 weeks", "Start metformin and skip diagnostic testing", "Reassure \u2014 no further testing needed", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)"]'::jsonb, 4, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 57-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Oral rehydration and discharge", "Kayexalate only without steroids", "Immediate thyroidectomy", "Observation until outpatient endocrinology visit", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis"]'::jsonb, 4, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 45-year-old male primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Magnesium for seizure prophylaxis", "Forceps before complete dilation", "Immediate cesarean for all primigravidas", "Discharge home", "Continue active labor management per stage"]'::jsonb, 4, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 40-year-old male Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Begin chest compressions coordinated with ventilation", "Discharge to nursery", "Stop all resuscitation efforts", "Epinephrine as first step before compressions", "Immediate intubation without ventilation trial"]'::jsonb, 0, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 40-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Graves disease", "Pituitary TSHoma only without hyperthyroid labs", "Subclinical hypothyroidism", "Sick euthyroid", "Hashimoto thyroiditis"]'::jsonb, 0, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 44-year-old male with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Primary biliary cholangitis", "Acute appendicitis", "Postoperative adhesions", "Incarcerated inguinal hernia", "Colonic malignancy as primary cause of SBO"]'::jsonb, 2, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 37-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "Immediate magnesium-free vaginal delivery without BP control", "Oral phenytoin monotherapy", "IV magnesium sulfate loading and maintenance", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 3, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 40-year-old male Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Stop all resuscitation efforts", "Immediate intubation without ventilation trial", "Begin chest compressions coordinated with ventilation", "Epinephrine as first step before compressions", "Discharge to nursery"]'::jsonb, 2, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 22-year-old male is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Kayexalate only without steroids", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Immediate thyroidectomy", "Oral rehydration and discharge", "Observation until outpatient endocrinology visit"]'::jsonb, 1, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 83-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Emergent OR for all groin masses", "Elective surgical repair when symptomatic", "Chemotherapy", "No repair ever", "Antibiotics only"]'::jsonb, 1, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 31-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Normal lochia \u2014 no treatment", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Mastitis", "Appendicitis only", "UTI only without uterine exam"]'::jsonb, 1, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 63-year-old male with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Oral amoxicillin and outpatient follow-up", "Bone marrow biopsy", "Immediate valve replacement without antibiotics", "Rheumatoid factor and ANA panel only"]'::jsonb, 0, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 58-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Threatened abortion with closed cervix", "Incomplete abortion", "Normal intrauterine pregnancy", "Ectopic pregnancy", "Molar pregnancy only"]'::jsonb, 1, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 51-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["Antibiotics for meningitis", "Immediate craniotomy", "Acetazolamide, weight loss, stop offending agents, monitor vision", "No treatment", "High-dose opioids only"]'::jsonb, 2, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 38-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Continue active labor management per stage", "Immediate cesarean for all primigravidas", "Magnesium for seizure prophylaxis", "Discharge home", "Forceps before complete dilation"]'::jsonb, 0, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 61-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Immediate surgery", "No antibiotics needed", "Steroids only", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Ribavirin"]'::jsonb, 3, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 50-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Ectopic pregnancy", "Incomplete abortion", "Molar pregnancy only", "Normal intrauterine pregnancy", "Threatened abortion with closed cervix"]'::jsonb, 1, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 46-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "IV magnesium sulfate loading and maintenance", "Immediate magnesium-free vaginal delivery without BP control", "Oral phenytoin monotherapy", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 1, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 37-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Bone marrow biopsy", "Rheumatoid factor and ANA panel only", "Oral amoxicillin and outpatient follow-up", "Immediate valve replacement without antibiotics", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done"]'::jsonb, 4, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 58-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Acyclovir", "Penicillin or amoxicillin", "Prednisone only", "No antibiotics for positive rapid strep", "Azithromycin first-line always"]'::jsonb, 1, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 34-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Nebulized racemic epinephrine and dexamethasone", "Immediate intubation for all stridor", "Chest CT with contrast", "Incision and drainage of neck", "Antibiotics (amoxicillin) as first-line"]'::jsonb, 0, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 63-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Abdominal MRI as first test", "Upper endoscopy (EGD)", "Colonoscopy first", "Barium swallow", "Observe without endoscopy"]'::jsonb, 1, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 25-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Immediate surgery", "Macrolide (azithromycin), supportive care, contact prophylaxis", "No antibiotics needed", "Ribavirin", "Steroids only"]'::jsonb, 1, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 41-year-old male was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Oral fluids and observation", "CT abdomen with contrast before any transfusion in unstable patient", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "Discharge after normal FAST", "Diagnostic peritoneal lavage only without resuscitation"]'::jsonb, 2, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 74-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Discharge if FAST negative", "Immediate MRI spine before any fluids", "Oral antibiotics only"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 47-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["UTI only without uterine exam", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Mastitis", "Normal lochia \u2014 no treatment", "Appendicitis only"]'::jsonb, 1, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 25-year-old male primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Discharge home", "Continue active labor management per stage", "Forceps before complete dilation", "Immediate cesarean for all primigravidas", "Magnesium for seizure prophylaxis"]'::jsonb, 1, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 78-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Renal cell carcinoma", "Hypothyroidism", "Essential hypertension only", "Primary hyperaldosteronism", "Pheochromocytoma"]'::jsonb, 3, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 45-year-old male MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Discharge if FAST negative", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation", "Delay fracture management 72 hours", "Immediate MRI spine before any fluids", "Oral antibiotics only"]'::jsonb, 1, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 23-year-old female is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Meningococcemia", "Measles with ongoing high fever", "Scarlet fever", "Kawasaki disease", "Roseola infantum (exanthem subitum due to HHV-6)"]'::jsonb, 4, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 30-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start metformin and skip diagnostic testing", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Schedule delivery at 28 weeks", "Reassure \u2014 no further testing needed", "Start insulin immediately without further testing"]'::jsonb, 1, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 76-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Futility \u2014 do not operate", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Justice requires randomization"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 36-year-old male is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Antibiotics mandatory", "Chest tube", "Intubation", "Racemic epinephrine required for all", "Single dose dexamethasone and supportive care"]'::jsonb, 4, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 66-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Futility \u2014 do not operate", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 31-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Dermatomyositis only", "Scabies", "Systemic lupus erythematosus", "Gout", "Contact dermatitis only"]'::jsonb, 2, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 83-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Irritable bowel syndrome \u2014 antispasmodics", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Constipation \u2014 enema and discharge", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Acute diverticulitis \u2014 oral metronidazole"]'::jsonb, 3, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 80-year-old female has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Metronidazole only", "Ribavirin", "Amoxicillin or doxycycline per guidelines", "Vancomycin monotherapy", "Fluconazole"]'::jsonb, 2, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 76-year-old female MVC unrestrained driver, GCS 13, open femur fracture, BP 88/50 after 1 L saline.

Physical Examination:

Vitals: HR 128 | RR 24 | SpO2 92%.
Extremity: Open femur fracture with bleeding.
Abdomen: Soft.

Laboratory Results:

FAST: Negative
Hemoglobin: 8.2 g/dL


What is the priority per ATLS after airway/breathing assessment?', '["Immediate MRI spine before any fluids", "Oral antibiotics only", "Discharge if FAST negative", "Delay fracture management 72 hours", "Control hemorrhage, IV resuscitation, type and cross, ortho/trauma evaluation"]'::jsonb, 4, 'ATLS: circulation — stop bleeding, resuscitate, transfuse as needed, stabilize fractures.'),
    (v_topic_id, 'A 26-year-old male has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["High-dose beta-blocker acute bolus only without endoscopy plan", "Discharge without endoscopy", "Warfarin loading", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "Oral NSAIDs"]'::jsonb, 3, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 70-year-old male has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Sick euthyroid", "Hashimoto thyroiditis", "Graves disease", "Subclinical hypothyroidism", "Pituitary TSHoma only without hyperthyroid labs"]'::jsonb, 2, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 37-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Barium swallow", "Abdominal MRI as first test", "Colonoscopy first", "Upper endoscopy (EGD)", "Observe without endoscopy"]'::jsonb, 3, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 35-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Oral antidiabetic agents and discharge", "Potassium supplementation before any fluids", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Immediate sodium bicarbonate for all patients", "Subcutaneous insulin only and oral fluids"]'::jsonb, 2, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 65-year-old male G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Emergent cesarean delivery and maternal resuscitation", "Vaginal delivery despite non-reassuring FHR without preparation", "Observation with outpatient follow-up", "Expectant management at home", "Magnesium sulfate only"]'::jsonb, 0, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 42-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Thrombolysis for all stable patients", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "IV antibiotics for pneumonia", "Aspirin monotherapy", "Observation with repeat imaging in 1 week"]'::jsonb, 1, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 40-year-old male postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Appendicitis only", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Mastitis", "Normal lochia \u2014 no treatment", "UTI only without uterine exam"]'::jsonb, 1, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 24-year-old male G2P1 at 38 weeks has painful vaginal bleeding, firm tender uterus, and fetal bradycardia 90 bpm.

Physical Examination:

Vitals: HR 118 | BP 90/58 | RR 22.
Uterus: Firm, tender, high tone.
FHR: 90 bpm with late decelerations.

Laboratory Results:

Ultrasound: Retroplacental hematoma
Hemoglobin: 9.8 g/dL
Fibrinogen: Low


What is the most appropriate immediate management?', '["Emergent cesarean delivery and maternal resuscitation", "Observation with outpatient follow-up", "Magnesium sulfate only", "Vaginal delivery despite non-reassuring FHR without preparation", "Expectant management at home"]'::jsonb, 0, 'Placental abruption with maternal instability and non-reassuring fetal status requires emergent delivery (usually cesarean) and resuscitation.'),
    (v_topic_id, 'A 78-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Molar pregnancy only", "Normal intrauterine pregnancy", "Incomplete abortion", "Threatened abortion with closed cervix", "Ectopic pregnancy"]'::jsonb, 2, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 75-year-old male has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Observation for spontaneous resolution", "Empiric ceftriaxone for ascending cholangitis without imaging", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Immediate appendectomy", "Oral ursodiol only and discharge"]'::jsonb, 2, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 41-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ovarian torsion only without pregnancy", "Ectopic pregnancy", "Threatened abortion with IUP", "PID only", "Normal pregnancy"]'::jsonb, 1, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 50-year-old male has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["No treatment", "High-dose opioids only", "Immediate craniotomy", "Antibiotics for meningitis", "Acetazolamide, weight loss, stop offending agents, monitor vision"]'::jsonb, 4, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 33-year-old male has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["DKA", "Hypoglycemia", "Lactic acidosis primary", "Normal variant", "Hyperosmolar hyperglycemic state"]'::jsonb, 4, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 35-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Futility \u2014 do not operate"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 22-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 0.45% (half-normal) saline", "Desmopressin (dDAVP) administration", "Administration of IV 3% (hypertonic) saline", "Rapid correction with 5% Dextrose in water (D5W)", "Administration of IV 0.9% (normal) saline"]'::jsonb, 0, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 45-year-old male primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Immediate cesarean for all primigravidas", "Discharge home", "Continue active labor management per stage", "Magnesium for seizure prophylaxis", "Forceps before complete dilation"]'::jsonb, 2, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 25-year-old male postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Appendicitis only", "Mastitis", "UTI only without uterine exam", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Normal lochia \u2014 no treatment"]'::jsonb, 3, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 39-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Incomplete abortion", "Normal intrauterine pregnancy", "Ectopic pregnancy", "Molar pregnancy only", "Threatened abortion with closed cervix"]'::jsonb, 0, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 76-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Stroke", "No treatment ever", "Brain tumor first-line", "Myasthenia gravis", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol"]'::jsonb, 4, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 49-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Oral phenytoin monotherapy", "Nitroprusside as first-line seizure prophylaxis", "Observation only", "Immediate magnesium-free vaginal delivery without BP control", "IV magnesium sulfate loading and maintenance"]'::jsonb, 4, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 68-year-old female Term newborn fails to cry at delivery, floppy, cyanotic; bag-mask ventilation started.

Physical Examination:

Vitals after 30 sec PPV: HR 80, poor respiratory effort.
Cord gases pending.

Laboratory Results:

APGAR at 1 min: 3
APGAR at 5 min: pending


Per NRP, what is the next step if HR remains 80 after effective ventilation?', '["Epinephrine as first step before compressions", "Discharge to nursery", "Stop all resuscitation efforts", "Begin chest compressions coordinated with ventilation", "Immediate intubation without ventilation trial"]'::jsonb, 3, 'NRP: if HR <100 after 30 sec effective PPV, start chest compressions; epinephrine if HR remains <60 after compressions.'),
    (v_topic_id, 'A 61-year-old female was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["CT abdomen with contrast before any transfusion in unstable patient", "Discharge after normal FAST", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "Diagnostic peritoneal lavage only without resuscitation", "Oral fluids and observation"]'::jsonb, 2, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 27-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Continue active labor management per stage", "Magnesium for seizure prophylaxis", "Forceps before complete dilation", "Discharge home", "Immediate cesarean for all primigravidas"]'::jsonb, 0, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 56-year-old male is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Nebulized racemic epinephrine and dexamethasone", "Immediate intubation for all stridor", "Antibiotics (amoxicillin) as first-line", "Incision and drainage of neck", "Chest CT with contrast"]'::jsonb, 0, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 32-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Schedule delivery at 28 weeks", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start metformin and skip diagnostic testing", "Reassure \u2014 no further testing needed"]'::jsonb, 2, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 77-year-old male is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Short-acting nitrates as monotherapy", "Digoxin as first-line mortality therapy", "Beta-blockers (e.g., carvedilol)", "Loop diuretics alone", "Calcium channel blockers (amlodipine)"]'::jsonb, 2, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 40-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["No antibiotics for positive rapid strep", "Azithromycin first-line always", "Prednisone only", "Penicillin or amoxicillin", "Acyclovir"]'::jsonb, 3, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 34-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Kawasaki disease", "Roseola infantum (exanthem subitum due to HHV-6)", "Meningococcemia", "Scarlet fever", "Measles with ongoing high fever"]'::jsonb, 1, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 34-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Urgent CT pulmonary angiography", "Intravenous heparin alone without reperfusion strategy", "Oral aspirin and discharge with outpatient stress test", "Emergent coronary angiography with primary PCI", "High-dose IV beta-blocker before reperfusion"]'::jsonb, 3, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 67-year-old male Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Emergency exception / implied consent for life-threatening emergency", "Beneficence requires waiting for family indefinitely", "Autonomy of physician to choose any procedure", "Justice requires randomization", "Futility \u2014 do not operate"]'::jsonb, 0, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 23-year-old male with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Anticoagulation and evaluate for antiphospholipid syndrome", "No workup for thrombophilia", "Only hydroxychloroquine increase", "Stop all anticoagulation", "Platelet transfusion"]'::jsonb, 0, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 31-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Immediate intubation for all stridor", "Incision and drainage of neck", "Antibiotics (amoxicillin) as first-line", "Chest CT with contrast", "Nebulized racemic epinephrine and dexamethasone"]'::jsonb, 4, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 59-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Contact dermatitis only", "Systemic lupus erythematosus", "Gout", "Scabies", "Dermatomyositis only"]'::jsonb, 1, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 46-year-old female on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Start warfarin immediately", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets", "Switch to subcutaneous enoxaparin", "Observation only"]'::jsonb, 1, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 29-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Futility \u2014 do not operate"]'::jsonb, 2, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 59-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Incision and drainage of neck", "Immediate intubation for all stridor", "Nebulized racemic epinephrine and dexamethasone", "Antibiotics (amoxicillin) as first-line", "Chest CT with contrast"]'::jsonb, 2, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 75-year-old female has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["UTI", "Acute appendicitis only", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "GERD", "Splenic sequestration benign"]'::jsonb, 2, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 25-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Meningococcemia", "Kawasaki disease", "Measles with ongoing high fever", "Scarlet fever", "Roseola infantum (exanthem subitum due to HHV-6)"]'::jsonb, 4, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 26-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Oral clopidogrel and aspirin only", "Sublingual nitroglycerin as monotherapy", "Immediate thrombolysis", "Aggressive IV fluid bolus", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed"]'::jsonb, 4, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 82-year-old male has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Observation without antibiotics", "ERCP as first step for all RUQ pain", "Immediate splenectomy", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)"]'::jsonb, 4, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 43-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["STEMI", "Pulmonary embolism only", "Costochondritis only", "GERD only", "Acute pericarditis"]'::jsonb, 4, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 64-year-old female has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Empiric ceftriaxone for ascending cholangitis without imaging", "Oral ursodiol only and discharge", "Observation for spontaneous resolution", "Immediate appendectomy"]'::jsonb, 0, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 68-year-old female has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Fluconazole", "Ribavirin", "Vancomycin monotherapy", "Metronidazole only", "Amoxicillin or doxycycline per guidelines"]'::jsonb, 4, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 69-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Irritable bowel syndrome \u2014 antispasmodics", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Acute diverticulitis \u2014 oral metronidazole", "Constipation \u2014 enema and discharge", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization"]'::jsonb, 4, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 29-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely", "Justice requires randomization", "Emergency exception / implied consent for life-threatening emergency"]'::jsonb, 4, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.'),
    (v_topic_id, 'A 38-year-old female Unconscious trauma patient needs emergent surgery; no family reachable; no advance directive on chart.

Physical Examination:

Vitals: Unstable.
Mental status: Unresponsive.

Laboratory Results:

Type and screen available


What ethical principle allows proceeding with lifesaving surgery?', '["Futility \u2014 do not operate", "Emergency exception / implied consent for life-threatening emergency", "Justice requires randomization", "Autonomy of physician to choose any procedure", "Beneficence requires waiting for family indefinitely"]'::jsonb, 1, 'Life-threatening emergency with inability to consent: treat under emergency/implied consent doctrine while attempting to reach surrogate.');
END $$;
COMMIT;
