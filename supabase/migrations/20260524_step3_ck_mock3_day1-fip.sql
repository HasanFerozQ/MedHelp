-- Step 3 Mock #3 day1-fip — 240 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock3-day1-fip' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock3-day1-fip missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 75-year-old male has polyuria, polydipsia, and 8-kg weight loss over 3 weeks.

Physical Examination:

Vitals: HR 102 | RR 28 (Kussmaul) | BP 104/68.

General: Appears ill, dry mucous membranes.

Laboratory Results:

Glucose 412 mg/dL | pH 7.18 | Bicarbonate 10 mEq/L | Anion gap 24 | Positive serum ketones.


What is the most likely diagnosis?', '["Uremia", "Lactic acidosis", "Diabetic ketoacidosis", "Hyperosmolar hyperglycemic state", "Salicylate toxicity"]'::jsonb, 2, 'Hyperglycemia, ketones, anion-gap acidosis, and Kussmaul breathing indicate DKA.'),
    (v_topic_id, 'A 41-year-old female presents with elevated ALT.

Physical Examination:

HCV RNA positive

Laboratory Results:

Key finding: DAA therapy.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Hepatitis C chronic", "Functional disorder", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with Hepatitis C chronic.'),
    (v_topic_id, 'A 46-year-old male is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["\u03bc-opioid receptor agonism", "Placebo effect only", "Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 35-year-old female has acute severe headache described as the worst of her life, with brief loss of consciousness.

Physical Examination:

Vitals: HR 88 | BP 168/96.

Neuro: Meningismus; no lateralizing signs initially.

Laboratory Results:

Noncontrast head CT: Hyperdensity in basal cisterns.


What is the most likely diagnosis?', '["Tension headache", "Meningitis", "Subarachnoid hemorrhage", "Migraine", "Cluster headache"]'::jsonb, 2, 'Thunderclap headache with cisternal blood on CT = SAH until proven otherwise.'),
    (v_topic_id, 'A 57-year-old male an intervention reduces events from 20% to 10%.

Physical Examination:

N/A

Laboratory Results:

N/A


The number needed to treat (NNT) is approximately:', '["2", "0.1", "100", "20", "10"]'::jsonb, 4, 'ARR = 10%; NNT = 1/0.10 = 10.'),
    (v_topic_id, 'A 53-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Study proves mechanism", "Exposure associated with higher risk of outcome", "Exposure protective", "Case-fatality rate reported"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 27-year-old male has suspected pneumothorax trauma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Chest X-ray or bedside ultrasound", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected pneumothorax trauma, Chest X-ray or bedside ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 67-year-old female has suspected hemochromatosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Ferritin, transferrin saturation, HFE genotyping", "No testing indicated", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Ferritin, transferrin saturation, HFE genotyping.'),
    (v_topic_id, 'A 72-year-old female clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Guarantee cure", "Avoid discussion", "Dismiss patient concerns", "Explain viral etiology; offer symptomatic care"]'::jsonb, 4, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 36-year-old female presents with young neuropsychiatric.

Physical Examination:

Low ceruloplasmin

Laboratory Results:

Key finding: Chelation.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder", "Wilson disease"]'::jsonb, 4, 'Presentation consistent with Wilson disease.'),
    (v_topic_id, 'A 53-year-old female has suspected adrenal incidentaloma.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "PET scan screening", "Biochemical hormonal workup then adrenal CT/MRI", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: Biochemical hormonal workup then adrenal CT/MRI.'),
    (v_topic_id, 'A 68-year-old male is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Reduced myocardial oxygen demand and arrhythmia risk", "Unknown mechanism", "Direct DNA replication block only", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 68-year-old male presents with urticaria wheeze.

Physical Examination:

Hypotension

Laboratory Results:

Key finding: Epinephrine.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect", "Anaphylaxis food"]'::jsonb, 4, 'Presentation consistent with Anaphylaxis food.'),
    (v_topic_id, 'A 47-year-old female has unexplained iron deficiency anemia.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Esophagogastroduodenoscopy and colonoscopy", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Esophagogastroduodenoscopy and colonoscopy.'),
    (v_topic_id, 'A 76-year-old female is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Potentiation of antithrombin III", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 0, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 27-year-old female presents with cyclical fevers after travel.

Physical Examination:

Thick smear with ring forms

Laboratory Results:

Key finding: Antimalarial per species.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Malaria", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Malaria.'),
    (v_topic_id, 'A 37-year-old male has suspected ovarian torsion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Pelvic Doppler ultrasound emergently", "No testing indicated", "Exome sequencing first", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: Pelvic Doppler ultrasound emergently.'),
    (v_topic_id, 'A 39-year-old female has suspected biliary obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "RUQ ultrasound then MRCP if indicated", "PET scan screening", "No testing indicated"]'::jsonb, 2, 'Appropriate initial study: RUQ ultrasound then MRCP if indicated.'),
    (v_topic_id, 'A 64-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 1).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Study proves mechanism", "Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 41-year-old female presents with nephrolithiasis normal anion gap acidosis.

Physical Examination:

Urine pH high

Laboratory Results:

Key finding: Alkali replacement.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "RTA type 1", "Conversion disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with RTA type 1.'),
    (v_topic_id, 'A 80-year-old female has fever, myalgias, and thrombocytopenia after tick bite.

Physical Examination:

No rash yet.

Laboratory Results:

Peripheral smear shows morulae in granulocytes.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Normal variant", "Anaplasmosis", "Medication side effect"]'::jsonb, 3, 'Clinical pattern matches Anaplasmosis.'),
    (v_topic_id, 'A 78-year-old male has first unprovoked generalized seizure.

Physical Examination:

Neuro exam normal postictally.

Laboratory Results:

Noncontrast CT head: No bleed.


Which study is most appropriate next?', '["MRI brain", "Carotid duplex only", "EEG during active seizure only", "Lumbar puncture immediately", "No further imaging"]'::jsonb, 0, 'First unprovoked seizure in adult warrants MRI to exclude structural lesion.'),
    (v_topic_id, 'A 43-year-old female has suspected diabetic neuropathy.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Monofilament exam and consider EMG if atypical", "Empiric treatment without workup", "PET scan screening", "Exome sequencing first", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Monofilament exam and consider EMG if atypical.'),
    (v_topic_id, 'A 38-year-old female presents with unilateral leg swelling.

Physical Examination:

Duplex positive

Laboratory Results:

Key finding: Anticoagulation.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "DVT", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with DVT.'),
    (v_topic_id, 'A 56-year-old male presents with cola urine hypertension.

Physical Examination:

RBC casts

Laboratory Results:

Key finding: Post-strep GN workup.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Nephritic syndrome", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Nephritic syndrome.'),
    (v_topic_id, 'A 70-year-old female has suspected RPGN.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "ANCA, anti-GBM, complement, urgent renal biopsy", "No testing indicated", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: ANCA, anti-GBM, complement, urgent renal biopsy.'),
    (v_topic_id, 'A 57-year-old female clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Discuss values before procedure menu", "Transfer without handoff", "Guarantee cure", "Dismiss patient concerns"]'::jsonb, 1, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 37-year-old male presents with epigastric pain.

Physical Examination:

Urea breath test positive

Laboratory Results:

Key finding: Triple therapy.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant", "Peptic ulcer H pylori"]'::jsonb, 4, 'Presentation consistent with Peptic ulcer H pylori.'),
    (v_topic_id, 'A 27-year-old male has acute flank pain suspicious for stone.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

UA: Trace blood.


Which initial imaging study is most appropriate?', '["KUB only for all patients", "Noncontrast CT abdomen/pelvis", "No imaging", "Contrast CT abdomen", "MRI abdomen first line"]'::jsonb, 1, 'Noncontrast CT is sensitive for ureteral stones and alternative diagnoses.'),
    (v_topic_id, 'A 48-year-old male has suspected appendicitis rlq pain.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT abdomen with contrast or ultrasound in pregnancy", "PET scan whole body", "No further testing; observe", "Genetic panel first", "Empiric treatment without diagnosis"]'::jsonb, 0, 'For Suspected appendicitis RLQ pain, CT abdomen with contrast or ultrasound in pregnancy is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 29-year-old female has suspected multiple sclerosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "MRI brain and spine with contrast", "No testing indicated", "PET scan screening", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: MRI brain and spine with contrast.'),
    (v_topic_id, 'A 54-year-old male has suspected deep vein thrombosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Compression ultrasonography of extremity", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: Compression ultrasonography of extremity.'),
    (v_topic_id, 'A 44-year-old male has suspected adrenal incidentaloma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "CT adrenal protocol or MRI", "PET scan whole body", "Empiric treatment without diagnosis", "Genetic panel first"]'::jsonb, 1, 'For Suspected adrenal incidentaloma, CT adrenal protocol or MRI is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 84-year-old female presents with diabetes, bronzing.

Physical Examination:

High ferritin transferrin sat

Laboratory Results:

Key finding: Phlebotomy.


What is the most likely diagnosis?', '["Hemochromatosis", "Normal variant", "Functional disorder", "Medication adverse effect", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Hemochromatosis.'),
    (v_topic_id, 'A 37-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 12).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "No association", "Study proves mechanism"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 57-year-old female a screening test has sensitivity 90% and specificity 80% in a low-prevalence population.

Physical Examination:

N/A

Laboratory Results:

N/A


If a patient has a positive test, which statement is most accurate regarding PPV?', '["PPV is independent of prevalence", "PPV is always 90%", "PPV equals specificity", "PPV equals sensitivity", "PPV is lower than in high-prevalence settings"]'::jsonb, 4, 'PPV falls when disease prevalence is low, even with good test characteristics.'),
    (v_topic_id, 'A 84-year-old female with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["DPP-4 inhibition", "Decreased hepatic gluconeogenesis", "Stimulation of insulin secretion from \u03b2 cells", "SGLT2-mediated glucosuria only", "\u03b1-glucosidase inhibition"]'::jsonb, 1, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 66-year-old male is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Placebo effect only", "Facilitated glucose uptake and suppression of ketogenesis", "Hormone supplementation only"]'::jsonb, 3, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 76-year-old female presents with heliotrope rash weakness.

Physical Examination:

Gottron papules

Laboratory Results:

Key finding: Cancer screening.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Dermatomyositis", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Dermatomyositis.'),
    (v_topic_id, 'A 40-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism", "No association"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 26-year-old female presents with pleuritic pain, friction rub.

Physical Examination:

Diffuse ST elevation

Laboratory Results:

Key finding: NSAIDs/colchicine.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Pericarditis", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Pericarditis.'),
    (v_topic_id, 'A 22-year-old male presents with hematemesis after retching.

Physical Examination:

Mucosal tear at GE junction

Laboratory Results:

Key finding: Usually self-limited.


What is the most likely diagnosis?', '["Mallory-Weiss", "Normal variant", "Medication adverse effect", "Functional disorder", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Mallory-Weiss.'),
    (v_topic_id, 'A 83-year-old male presents with fever, retro-orbital pain, travel.

Physical Examination:

NS1 antigen positive

Laboratory Results:

Key finding: Supportive; avoid NSAIDs if warning signs.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Medication adverse effect", "Conversion disorder", "Dengue"]'::jsonb, 4, 'Presentation consistent with Dengue.'),
    (v_topic_id, 'A 68-year-old male has suspected testicular torsion.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Scrotal Doppler ultrasound emergently", "Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body"]'::jsonb, 1, 'For Suspected testicular torsion, Scrotal Doppler ultrasound emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 28-year-old female presents with acute cytopenias blasts.

Physical Examination:

Auer rods

Laboratory Results:

Key finding: Chemotherapy.


What is the most likely diagnosis?', '["Conversion disorder", "AML", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with AML.'),
    (v_topic_id, 'A 26-year-old female has acute chest pain; troponin pending.

Physical Examination:

Vitals stable.

Lungs clear.

Laboratory Results:

ECG: Nonspecific ST changes.


Which initial diagnostic study is most appropriate to evaluate for acute coronary syndrome?', '["Echocardiography only", "No testing; reassurance", "12-lead ECG and serial troponins", "Exercise stress test now", "Coronary CT angiography first"]'::jsonb, 2, 'ACS evaluation requires ECG and serial troponins in the ED.'),
    (v_topic_id, 'A 70-year-old female is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Local anti-inflammatory glucocorticoid effect", "Unknown mechanism", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 52-year-old female has suspected osteomyelitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["MRI of involved bone and blood cultures", "Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: MRI of involved bone and blood cultures.'),
    (v_topic_id, 'A 35-year-old female has suspected pe pregnant patient.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "PET scan whole body", "No further testing; observe", "V/Q scan or CTPA per risk", "Empiric treatment without diagnosis"]'::jsonb, 3, 'For Suspected PE pregnant patient, V/Q scan or CTPA per risk is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 35-year-old male presents with Charcot triad.

Physical Examination:

CBD dilation

Laboratory Results:

Key finding: IV antibiotics ERCP.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Cholangitis", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Cholangitis.'),
    (v_topic_id, 'A 72-year-old female presents with fever on central line.

Physical Examination:

Blood yeast

Laboratory Results:

Key finding: Echinocandin.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Candidemia", "Functional disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Candidemia.'),
    (v_topic_id, 'A 33-year-old female has episodic severe unilateral periorbital pain with lacrimation and nasal congestion.

Physical Examination:

Neuro intact between attacks.

Laboratory Results:

No acute lab abnormality.


What is the most likely diagnosis?', '["Pulmonary embolism", "Musculoskeletal strain", "Cluster headache", "Gastroenteritis", "Functional disorder"]'::jsonb, 2, 'Short severe unilateral periorbital pain with autonomic symptoms = cluster.'),
    (v_topic_id, 'A 83-year-old male presents with RLQ pain migration.

Physical Examination:

CT appendiceal dilation

Laboratory Results:

Key finding: Appendectomy.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Normal variant", "Functional disorder", "Appendicitis"]'::jsonb, 4, 'Presentation consistent with Appendicitis.'),
    (v_topic_id, 'A 52-year-old male presents with hematemesis cirrhosis.

Physical Examination:

Varices on endoscopy

Laboratory Results:

Key finding: Band ligation + octreotide.


What is the most likely diagnosis?', '["Functional disorder", "Esophageal varices", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Esophageal varices.'),
    (v_topic_id, 'A 42-year-old female is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Unknown mechanism", "Selective serotonin reuptake inhibition", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 25-year-old male is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Unknown mechanism", "Inhibition of L-type calcium channels in vascular smooth muscle", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 59-year-old male has suspected aortic dissection.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT angiography chest/abdomen/pelvis", "Empiric treatment without diagnosis", "Genetic panel first", "PET scan whole body", "No further testing; observe"]'::jsonb, 0, 'For Suspected aortic dissection, CT angiography chest/abdomen/pelvis is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 64-year-old male has suspected rheumatoid arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["RF, anti-CCP, and baseline X-rays", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: RF, anti-CCP, and baseline X-rays.'),
    (v_topic_id, 'A 41-year-old female presents with rhinorrhea, cough, low-grade fever.

Physical Examination:

Lungs clear

Laboratory Results:

Key finding: Supportive care only; no antibiotics.


What is the most likely diagnosis?', '["Viral URI", "Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Viral URI.'),
    (v_topic_id, 'A 82-year-old female has suspected temporal arteritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["ESR/CRP and temporal artery biopsy", "Empiric treatment without workup", "PET scan screening", "No testing indicated", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: ESR/CRP and temporal artery biopsy.'),
    (v_topic_id, 'A 50-year-old female clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Use SPIKES framework; assess understanding first", "Dismiss patient concerns", "Guarantee cure", "Transfer without handoff", "Avoid discussion"]'::jsonb, 0, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 57-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 2).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism", "No association"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 61-year-old female presents with petechiae shock.

Physical Examination:

Gram negative diplococci

Laboratory Results:

Key finding: Ceftriaxone contacts prophylaxis.


What is the most likely diagnosis?', '["Normal variant", "Meningococcemia", "Functional disorder", "Medication adverse effect", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with Meningococcemia.'),
    (v_topic_id, 'A 48-year-old male presents with galactorrhea amenorrhea.

Physical Examination:

Prolactin very high

Laboratory Results:

Key finding: Dopamine agonist.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect", "Prolactinoma"]'::jsonb, 4, 'Presentation consistent with Prolactinoma.'),
    (v_topic_id, 'A 27-year-old female clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Explore barriers; shared decision-making", "Dismiss patient concerns", "Guarantee cure", "Avoid discussion"]'::jsonb, 1, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 22-year-old female is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Inhibition of L-type calcium channels in vascular smooth muscle"]'::jsonb, 4, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 41-year-old male has suspected dvt unilateral leg swelling.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "Empiric treatment without diagnosis", "No further testing; observe", "Lower extremity venous duplex ultrasound"]'::jsonb, 4, 'For Suspected DVT unilateral leg swelling, Lower extremity venous duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 68-year-old female has suspected lung nodule incidental.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "CT chest per Fleischner criteria", "Exome sequencing first", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: CT chest per Fleischner criteria.'),
    (v_topic_id, 'A 47-year-old male presents with isolated thrombocytopenia.

Physical Examination:

Normal marrow

Laboratory Results:

Key finding: Steroids IVIG.


What is the most likely diagnosis?', '["ITP", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with ITP.'),
    (v_topic_id, 'A 43-year-old male presents with hypoxia, dry cough.

Physical Examination:

Induced sputum PJP positive

Laboratory Results:

Key finding: TMP-SMX.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Pneumocystis pneumonia HIV", "Functional disorder", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with Pneumocystis pneumonia HIV.'),
    (v_topic_id, 'A 53-year-old male a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Publicly confront on ward", "Cover shifts indefinitely without report", "Ignore unless patient harm occurs", "Resign immediately", "Report to patient safety/medical staff health per policy"]'::jsonb, 4, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 82-year-old female has suspected appendicitis adult.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "No testing indicated", "CT abdomen/pelvis or graded ultrasound", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: CT abdomen/pelvis or graded ultrasound.'),
    (v_topic_id, 'A 35-year-old male presents with mediastinal mass night sweats.

Physical Examination:

Reed-Sternberg

Laboratory Results:

Key finding: ABVD.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Medication adverse effect", "Functional disorder", "Hodgkin lymphoma"]'::jsonb, 4, 'Presentation consistent with Hodgkin lymphoma.'),
    (v_topic_id, 'A 78-year-old female presents with young male back stiffness.

Physical Examination:

HLA-B27 sacroiliitis

Laboratory Results:

Key finding: NSAIDs TNF inhibitor.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Medication adverse effect", "Conversion disorder", "Ankylosing spondylitis"]'::jsonb, 4, 'Presentation consistent with Ankylosing spondylitis.'),
    (v_topic_id, 'A 25-year-old female has suspected acute cholecystitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "Right upper quadrant ultrasound", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: Right upper quadrant ultrasound.'),
    (v_topic_id, 'A 80-year-old male has suspected SLE flare.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "Empiric treatment without workup", "ANA, anti-dsDNA, complement levels, urinalysis", "PET scan screening"]'::jsonb, 3, 'Appropriate initial study: ANA, anti-dsDNA, complement levels, urinalysis.'),
    (v_topic_id, 'A 40-year-old male has microcytic anemia and occult blood positive stool.

Physical Examination:

No weight loss yet.

Laboratory Results:

Hgb 9.2 g/dL.


Which diagnostic evaluation is most appropriate?', '["Bone marrow biopsy", "Empiric iron without evaluation", "Repeat CBC in 1 year", "Abdominal ultrasound only", "Colonoscopy"]'::jsonb, 4, 'Positive occult blood with anemia requires colonoscopy to exclude malignancy.'),
    (v_topic_id, 'A 80-year-old female clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Dismiss patient concerns", "Acknowledge emotion, apologize for delay, clarify plan", "Transfer without handoff", "Guarantee cure"]'::jsonb, 2, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 61-year-old male is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Placebo effect only", "Venodilation reducing preload", "Hormone supplementation only"]'::jsonb, 3, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 84-year-old female child has barking cough and stridor at rest.

Physical Examination:

Inspiratory stridor.

Laboratory Results:

AP neck X-ray: Steeple sign.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Functional pain syndrome", "Croup", "Normal variant"]'::jsonb, 3, 'Clinical pattern matches Croup.'),
    (v_topic_id, 'A 22-year-old female presents with optic neuritis weakness.

Physical Examination:

Demyelinating plaques

Laboratory Results:

Key finding: Steroids.


What is the most likely diagnosis?', '["Conversion disorder", "MS relapse", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with MS relapse.'),
    (v_topic_id, 'A 75-year-old male has acute monoarticular knee pain; joint warm and swollen.

Physical Examination:

No skin tophi.

Laboratory Results:

Synovial fluid: Needle-shaped negatively birefringent crystals.


What is the most likely diagnosis?', '["Functional pain syndrome", "Acute gout", "Normal variant", "Medication side effect", "Anxiety disorder"]'::jsonb, 1, 'Clinical pattern matches Acute gout.'),
    (v_topic_id, 'A 31-year-old female is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Placebo effect only", "Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 22-year-old female is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Placebo effect only", "Hormone supplementation only"]'::jsonb, 2, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 75-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "GABA-A receptor positive allosteric modulation"]'::jsonb, 4, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 49-year-old female presents with child nephrotic selective protein.

Physical Examination:

Foot process effacement

Laboratory Results:

Key finding: Steroids.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Minimal change disease", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Minimal change disease.'),
    (v_topic_id, 'A 78-year-old male has resting tremor, rigidity, and shuffling gait.

Physical Examination:

Masked facies.

Laboratory Results:

No acute CT findings.


What is the most likely diagnosis?', '["Normal variant", "Functional pain syndrome", "Anxiety disorder", "Medication side effect", "Parkinson disease"]'::jsonb, 4, 'Clinical pattern matches Parkinson disease.'),
    (v_topic_id, 'A 74-year-old male has auditory hallucinations and disorganized thought for 6 months.

Physical Examination:

Flat affect.

Laboratory Results:

Negative toxicology.


What is the most likely diagnosis?', '["Medication side effect", "Functional pain syndrome", "Schizophrenia", "Anxiety disorder", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Schizophrenia.'),
    (v_topic_id, 'A 32-year-old male has suspected nephrotic syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Empiric treatment without workup", "Urinalysis, protein quantification, renal ultrasound", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: Urinalysis, protein quantification, renal ultrasound.'),
    (v_topic_id, 'A 30-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "Case-fatality rate reported", "No association", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 32-year-old male with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Reduction of airway inflammation", "Immediate bronchodilation via \u03b22 agonism", "Increased mucus production", "Pulmonary vasodilation only", "Paralysis of respiratory muscles"]'::jsonb, 0, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 40-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 15).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 56-year-old male clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Dismiss patient concerns", "Use SPIKES framework; assess understanding first", "Avoid discussion", "Guarantee cure"]'::jsonb, 2, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 82-year-old female clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Use professional interpreter, not child", "Transfer without handoff"]'::jsonb, 3, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 55-year-old female presents with exertional chest pressure relieved by rest for 2 months.

Physical Examination:

Vitals stable.

Cardiac: No murmurs.

Laboratory Results:

Stress ECG: Horizontal ST depression at peak exercise.


What is the most likely diagnosis?', '["Musculoskeletal strain", "Pulmonary embolism", "Gastroenteritis", "Functional disorder", "Stable angina"]'::jsonb, 4, 'Exertional angina relieved by rest with exercise-induced ST depression.'),
    (v_topic_id, 'A 60-year-old female presents with abdominal pain basophilic stippling.

Physical Examination:

High lead level

Laboratory Results:

Key finding: Chelation.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Medication adverse effect", "Normal variant", "Lead poisoning"]'::jsonb, 4, 'Presentation consistent with Lead poisoning.'),
    (v_topic_id, 'A 72-year-old female has acute warm, swollen knee after twisting injury.

Physical Examination:

Effusion present.

Laboratory Results:

Arthrocentesis: Gross blood, no crystals.


What is the most likely diagnosis?', '["Hemarthrosis (ligament injury)", "Musculoskeletal strain", "Pulmonary embolism", "Functional disorder", "Gastroenteritis"]'::jsonb, 0, 'Traumatic hemarthrosis suggests ACL/ligament tear.'),
    (v_topic_id, 'A 63-year-old female is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "\u03b22-adrenergic bronchodilation", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 64-year-old male presents with fever neuro renal MAHA.

Physical Examination:

ADAMTS13 low

Laboratory Results:

Key finding: Plasmapheresis.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect", "TTP"]'::jsonb, 4, 'Presentation consistent with TTP.'),
    (v_topic_id, 'A 80-year-old female is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Hormone supplementation only", "Unknown mechanism", "\u03b22-adrenergic bronchodilation", "Direct DNA replication block only"]'::jsonb, 3, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 43-year-old male has suspected acute pancreatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "Lipase and triglycerides; CT if severe or uncertain"]'::jsonb, 4, 'Appropriate initial study: Lipase and triglycerides; CT if severe or uncertain.'),
    (v_topic_id, 'A 24-year-old male presents with malar rash arthritis.

Physical Examination:

Low C3 C4

Laboratory Results:

Key finding: Steroids hydroxychloroquine.


What is the most likely diagnosis?', '["SLE flare", "Functional disorder", "Conversion disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with SLE flare.'),
    (v_topic_id, 'A 48-year-old female is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Facilitated glucose uptake and suppression of ketogenesis", "Hormone supplementation only", "Direct DNA replication block only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 82-year-old female has fatigue, easy bruising, and gum bleeding for 2 weeks.

Physical Examination:

Vitals: HR 96 | BP 118/74.

HEENT: Petechiae on palate. No lymphadenopathy.

Laboratory Results:

CBC: WBC 18,000 (blasts 42%) | Platelets 18,000 | Hgb 7.8 g/dL.


What is the most likely diagnosis?', '["Aplastic anemia", "Iron deficiency anemia", "Acute leukemia", "DIC from sepsis", "ITP"]'::jsonb, 2, 'Cytopenias with circulating blasts indicate acute leukemia.'),
    (v_topic_id, 'A 29-year-old female presents with dysphagia solids and liquids.

Physical Examination:

Bird beak on barium

Laboratory Results:

Key finding: POEM or pneumatic dilation.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Achalasia", "Conversion disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Achalasia.'),
    (v_topic_id, 'A 63-year-old male lead-time bias is a concern in which situation?

Physical Examination:

N/A

Laboratory Results:

N/A


Early detection appears to prolong survival without changing disease course because:', '["Prevalence decreases", "Specificity improves", "Treatment is more effective", "Randomization failed", "Diagnosis is made earlier without altering time of death"]'::jsonb, 4, 'Lead-time bias inflates apparent survival by earlier diagnosis only.'),
    (v_topic_id, 'A 22-year-old male is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Direct DNA replication block only", "Potentiation of antithrombin III"]'::jsonb, 4, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 29-year-old male has acute severe epigastric pain radiating to the back after alcohol binge.

Physical Examination:

Epigastric tenderness.

Laboratory Results:

Lipase 1,240 U/L (normal <60).


What is the most likely diagnosis?', '["Musculoskeletal strain", "Pulmonary embolism", "Acute pancreatitis", "Functional disorder", "Gastroenteritis"]'::jsonb, 2, 'Epigastric pain + lipase >3× normal = pancreatitis.'),
    (v_topic_id, 'A 58-year-old male has suspected lung cancer mass.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT chest with tissue biopsy plan", "PET scan whole body", "No further testing; observe", "Genetic panel first", "Empiric treatment without diagnosis"]'::jsonb, 0, 'For Suspected lung cancer mass, CT chest with tissue biopsy plan is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 69-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 7).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 54-year-old male has suspected interstitial lung disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "High-resolution CT chest"]'::jsonb, 4, 'Appropriate initial study: High-resolution CT chest.'),
    (v_topic_id, 'A 37-year-old female has suspected infectious endocarditis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Transesophageal echocardiography", "No further testing; observe", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis"]'::jsonb, 0, 'For Suspected infectious endocarditis, Transesophageal echocardiography is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 81-year-old male with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["SGLT2-mediated glucosuria only", "Stimulation of insulin secretion from \u03b2 cells", "\u03b1-glucosidase inhibition", "Decreased hepatic gluconeogenesis", "DPP-4 inhibition"]'::jsonb, 3, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 43-year-old female has suspected celiac disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "IgA anti-tissue transglutaminase and total IgA", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: IgA anti-tissue transglutaminase and total IgA.'),
    (v_topic_id, 'A 25-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 11).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "No association", "Exposure associated with higher risk of outcome", "Exposure protective", "Case-fatality rate reported"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 33-year-old female has suspected acute ischemic stroke.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Noncontrast CT then CTA if thrombectomy considered", "PET scan screening", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: Noncontrast CT then CTA if thrombectomy considered.'),
    (v_topic_id, 'A 79-year-old male presents with euvolemic hyponatremia low serum osm.

Physical Examination:

Urine sodium high

Laboratory Results:

Key finding: Fluid restriction.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Functional disorder", "Conversion disorder", "SIADH"]'::jsonb, 4, 'Presentation consistent with SIADH.'),
    (v_topic_id, 'A 39-year-old female child has fever and drooling in tripod position.

Physical Examination:

Muffled voice.

Laboratory Results:

Lateral neck X-ray: Thumbprint sign.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Epiglottitis", "Medication side effect", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Epiglottitis.'),
    (v_topic_id, 'A 45-year-old male has acute headache with papilledema on exam.

Physical Examination:

Vitals: BP 190/110.

Laboratory Results:

CT head without contrast: No mass bleed.


Which study should be performed next?', '["Immediate carotid endarterectomy", "Lumbar puncture after imaging", "EEG", "No LP; discharge", "Orbital ultrasound"]'::jsonb, 1, 'Suspected meningitis/SAH with negative CT may still need LP if clinically indicated (follow local protocols).'),
    (v_topic_id, 'A 70-year-old female presents with short stature web neck.

Physical Examination:

45,X

Laboratory Results:

Key finding: Growth hormone estrogen.


What is the most likely diagnosis?', '["Turner syndrome", "Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Turner syndrome.'),
    (v_topic_id, 'A 63-year-old female has suspected acute compartment syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Compartment pressure measurement", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Compartment pressure measurement.'),
    (v_topic_id, 'A 83-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Unknown mechanism", "GABA-A receptor positive allosteric modulation", "Placebo effect only"]'::jsonb, 3, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 72-year-old female has suspected septic arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Arthrocentesis with synovial analysis", "Exome sequencing first", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: Arthrocentesis with synovial analysis.'),
    (v_topic_id, 'A 73-year-old female presents with rapid Cr rise hematuria.

Physical Examination:

Crescents on biopsy

Laboratory Results:

Key finding: Pulse steroids plasmapheresis.


What is the most likely diagnosis?', '["RPGN", "Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with RPGN.'),
    (v_topic_id, 'A 69-year-old male with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Paralysis of respiratory muscles", "Pulmonary vasodilation only", "Increased mucus production", "Immediate bronchodilation via \u03b22 agonism", "Reduction of airway inflammation"]'::jsonb, 4, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 46-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "No association", "Exposure protective", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 43-year-old female has RUQ pain after fatty meal with positive Murphy sign.

Physical Examination:

Fever mild.

Laboratory Results:

US: Gallstones, gallbladder wall thickening.


What is the most likely diagnosis?', '["Acute cholecystitis", "Anxiety disorder", "Normal variant", "Medication side effect", "Functional pain syndrome"]'::jsonb, 0, 'Clinical pattern matches Acute cholecystitis.'),
    (v_topic_id, 'A 84-year-old female has new-onset atrial fibrillation with rapid ventricular response.

Physical Examination:

Irregularly irregular pulse.

Laboratory Results:

ECG: No ST elevation; AF with RVR.


What is the most likely diagnosis?', '["Medication side effect", "Functional pain syndrome", "Anxiety disorder", "Atrial fibrillation", "Normal variant"]'::jsonb, 3, 'Clinical pattern matches Atrial fibrillation.'),
    (v_topic_id, 'A 67-year-old female presents with headache jaw claudication.

Physical Examination:

ESR high

Laboratory Results:

Key finding: High-dose steroids.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Functional disorder", "Temporal arteritis", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Temporal arteritis.'),
    (v_topic_id, 'A 38-year-old female has suspected testicular cancer mass.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Scrotal ultrasound and tumor markers", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: Scrotal ultrasound and tumor markers.'),
    (v_topic_id, 'A 36-year-old male a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Report to patient safety/medical staff health per policy", "Publicly confront on ward", "Cover shifts indefinitely without report", "Ignore unless patient harm occurs", "Resign immediately"]'::jsonb, 0, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 28-year-old male presents with hyperpigmentation hypotension.

Physical Examination:

Low cortisol high ACTH

Laboratory Results:

Key finding: Hydrocortisone fludrocortisone.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Addison disease", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Addison disease.'),
    (v_topic_id, 'A 62-year-old male clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Guarantee cure", "Dismiss patient concerns", "Avoid discussion", "Explain viral etiology; offer symptomatic care"]'::jsonb, 4, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 72-year-old male has suspected PID.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Pelvic exam with NAAT for gonorrhea/chlamydia", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Pelvic exam with NAAT for gonorrhea/chlamydia.'),
    (v_topic_id, 'A 69-year-old female has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Inhibition of viral replication enzymes", "Neutralization of endotoxin", "Blocking TNF-\u03b1 only", "Stimulation of host IgM only", "Increasing hepatic blood flow"]'::jsonb, 0, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 25-year-old female has suspected acute pericarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "ECG, troponin, echocardiography"]'::jsonb, 4, 'Appropriate initial study: ECG, troponin, echocardiography.'),
    (v_topic_id, 'A 78-year-old male has suspected acute mesenteric ischemia.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT angiography abdomen", "PET scan whole body", "Genetic panel first", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 0, 'For Suspected acute mesenteric ischemia, CT angiography abdomen is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 26-year-old female has fever, sore throat, and a diffuse sandpaper-like rash for 2 days.

Physical Examination:

Vitals: Temp 101.2°F | HR 100.

Pharynx: Exudative tonsillitis. Skin: Circumoral pallor, accentuated neck folds.

Laboratory Results:

Rapid strep antigen positive | Throat culture pending.


What is the most likely diagnosis?', '["Measles", "Group A streptococcal pharyngitis with scarlet fever", "Drug eruption", "Kawasaki disease", "Infectious mononucleosis"]'::jsonb, 1, 'Exudative pharyngitis with sandpaper rash and positive rapid strep indicate strep/scarlet fever.'),
    (v_topic_id, 'A 42-year-old male clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Explore barriers; shared decision-making", "Guarantee cure", "Transfer without handoff", "Avoid discussion"]'::jsonb, 1, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 31-year-old male a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Provide confidential care per mature minor laws", "Refuse all care until 18", "Obtain court order first", "Report to child protective services", "Mandatory parental notification always"]'::jsonb, 0, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 39-year-old male presents with fever post pneumonia.

Physical Examination:

Pleural pH low, glucose low

Laboratory Results:

Key finding: Chest tube + antibiotics.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Empyema", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Empyema.'),
    (v_topic_id, 'A 47-year-old male has fever, neck stiffness, and photophobia for 12 hours.

Physical Examination:

Vitals: Temp 101.8°F | HR 110 | BP 138/82.

Neuro: Nuchal rigidity; no focal motor deficits.

Laboratory Results:

LP: CSF WBC 1,200/µL (90% PMNs), protein 180 mg/dL, glucose 22 mg/dL (serum 110).


What is the most likely diagnosis?', '["Bacterial meningitis", "Viral meningitis", "Subarachnoid hemorrhage", "Tension headache", "Migraine"]'::jsonb, 0, 'Acute fever with PMN-predominant CSF pleocytosis and low glucose suggest bacterial meningitis.'),
    (v_topic_id, 'A 56-year-old male a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Honor refusal; optimize nonblood alternatives", "Transfuse emergently regardless", "Sedate and transfuse", "Call security", "Obtain psychiatric hold"]'::jsonb, 0, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 40-year-old female has suspected pulmonary embolism low risk.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["D-dimer then CTPA if elevated", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: D-dimer then CTPA if elevated.'),
    (v_topic_id, 'A 35-year-old female presents with microcytic.

Physical Examination:

Low ferritin

Laboratory Results:

Key finding: Iron workup GI if men.


What is the most likely diagnosis?', '["Conversion disorder", "Iron deficiency anemia", "Functional disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with Iron deficiency anemia.'),
    (v_topic_id, 'A 26-year-old male presents with fever, rash palms/soles, tick exposure.

Physical Examination:

Rickettsia serology

Laboratory Results:

Key finding: Doxycycline empiric.


What is the most likely diagnosis?', '["Rocky Mountain spotted fever", "Normal variant", "Functional disorder", "Medication adverse effect", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Rocky Mountain spotted fever.'),
    (v_topic_id, 'A 44-year-old male presents with rigidity fever on antipsychotic.

Physical Examination:

CK high

Laboratory Results:

Key finding: Stop drug dantrolene.


What is the most likely diagnosis?', '["Neuroleptic malignant syndrome", "Normal variant", "Functional disorder", "Conversion disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Neuroleptic malignant syndrome.'),
    (v_topic_id, 'A 54-year-old male has suspected acute cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "HIDA scan if US equivocal"]'::jsonb, 4, 'For Suspected acute cholecystitis, HIDA scan if US equivocal is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 42-year-old male is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Inhibition of dihydrofolate reductase", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "Unknown mechanism"]'::jsonb, 0, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 52-year-old male is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only", "Local anti-inflammatory glucocorticoid effect"]'::jsonb, 4, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 84-year-old female presents with erythema nodosum, hilar adenopathy.

Physical Examination:

Noncaseating granulomas

Laboratory Results:

Key finding: Steroids if symptomatic.


What is the most likely diagnosis?', '["Sarcoidosis", "Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Sarcoidosis.'),
    (v_topic_id, 'A 69-year-old male presents with hematuria flank mass.

Physical Examination:

Renal mass on CT

Laboratory Results:

Key finding: Surgical resection.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Functional disorder", "Renal cell carcinoma"]'::jsonb, 4, 'Presentation consistent with Renal cell carcinoma.'),
    (v_topic_id, 'A 57-year-old male has suspected Cushing syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "Overnight 1-mg dexamethasone suppression test", "PET scan screening"]'::jsonb, 3, 'Appropriate initial study: Overnight 1-mg dexamethasone suppression test.'),
    (v_topic_id, 'A 35-year-old male presents with nail pitting dactylitis.

Physical Examination:

Skin psoriasis

Laboratory Results:

Key finding: DMARD biologic.


What is the most likely diagnosis?', '["Psoriatic arthritis", "Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Psoriatic arthritis.'),
    (v_topic_id, 'A 73-year-old male with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Niacin receptor agonism", "PCSK9 gene deletion", "Bile acid sequestration in gut", "Inhibition of lipoprotein lipase", "Competitive inhibition of HMG-CoA reductase"]'::jsonb, 4, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 44-year-old male is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Venodilation reducing preload", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 40-year-old male has sudden unilateral chest pain and diminished breath sounds.

Physical Examination:

Trachea midline.

Laboratory Results:

CXR: Visceral pleural line without lung markings.


What is the most likely diagnosis?', '["Anxiety disorder", "Primary spontaneous pneumothorax", "Medication side effect", "Normal variant", "Functional pain syndrome"]'::jsonb, 1, 'Clinical pattern matches Primary spontaneous pneumothorax.'),
    (v_topic_id, 'A 25-year-old male has chronic diarrhea, weight loss, and iron deficiency.

Physical Examination:

Oral aphthae.

Laboratory Results:

Anti-tTG IgA positive.


What is the most likely diagnosis?', '["Celiac disease", "Functional pain syndrome", "Anxiety disorder", "Normal variant", "Medication side effect"]'::jsonb, 0, 'Clinical pattern matches Celiac disease.'),
    (v_topic_id, 'A 28-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 9).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association", "Study proves mechanism"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 24-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Exposure associated with higher risk of outcome", "No association", "Case-fatality rate reported", "Study proves mechanism"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 22-year-old male has acute monocular painless vision loss that began 2 hours ago.

Physical Examination:

Vitals: BP 168/94.

Eye: Afferent pupillary defect on affected side; fundoscopy difficult.

Laboratory Results:

ESR 68 mm/h | CRP elevated | No retinal detachment on bedside exam.


What is the most likely diagnosis?', '["Vitreous hemorrhage", "Acute angle-closure glaucoma", "Optic neuritis", "Migraine aura", "Central retinal artery occlusion"]'::jsonb, 4, 'Painless monocular vision loss with RAPD in older patient suggests CRAO; giant cell arteritis risk.'),
    (v_topic_id, 'A 22-year-old female has expansive mood, decreased sleep, and pressured speech for 1 week.

Physical Examination:

Grandiosity.

Laboratory Results:

No substance use.


What is the most likely diagnosis?', '["Bipolar I manic episode", "Anxiety disorder", "Medication side effect", "Normal variant", "Functional pain syndrome"]'::jsonb, 0, 'Clinical pattern matches Bipolar I manic episode.'),
    (v_topic_id, 'A 65-year-old male clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Transfer without handoff", "Avoid discussion", "Guarantee cure", "Assess immediate safety; provide resources"]'::jsonb, 4, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 27-year-old female has 3 days of fever, productive cough, and pleuritic chest pain. she smokes 1 pack per day.

Physical Examination:

Vitals: Temp 102.4°F | HR 104 | RR 22 | BP 118/72.

Lungs: Dullness and bronchial breath sounds at the right base.

No JVD.

Laboratory Results:

WBC 16,200/µL | Chest X-ray: Right lower lobe consolidation with air bronchograms.


What is the most likely diagnosis?', '["Spontaneous pneumothorax", "Pulmonary embolism", "Lung adenocarcinoma", "Community-acquired bacterial pneumonia", "Heart failure exacerbation"]'::jsonb, 3, 'Fever, productive cough, focal consolidation with air bronchograms indicate bacterial pneumonia.'),
    (v_topic_id, 'A 42-year-old male is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Microtubule disruption inhibiting neutrophil chemotaxis", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 82-year-old male presents with pruritus AMA positive.

Physical Examination:

Alkaline phosphatase high

Laboratory Results:

Key finding: UDCA.


What is the most likely diagnosis?', '["Primary biliary cholangitis", "Functional disorder", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Primary biliary cholangitis.'),
    (v_topic_id, 'A 63-year-old female presents with B symptoms nodes.

Physical Examination:

Biopsy subtype

Laboratory Results:

Key finding: R-CHOP etc.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Non-Hodgkin lymphoma", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Non-Hodgkin lymphoma.'),
    (v_topic_id, 'A 82-year-old female presents with polymorphic VT after macrolide.

Physical Examination:

QTc 520

Laboratory Results:

Key finding: Magnesium, defibrillation.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Long QT torsades", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Long QT torsades.'),
    (v_topic_id, 'A 48-year-old male presents with proximal weakness CK high.

Physical Examination:

Endomysial inflammation

Laboratory Results:

Key finding: Steroids immunosuppression.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Polymyositis", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Polymyositis.'),
    (v_topic_id, 'A 67-year-old male presents with lymphocytosis elderly.

Physical Examination:

Smudge cells

Laboratory Results:

Key finding: Watch treat.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "CLL", "Normal variant"]'::jsonb, 3, 'Presentation consistent with CLL.'),
    (v_topic_id, 'A 31-year-old male clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Acknowledge emotion, apologize for delay, clarify plan", "Dismiss patient concerns", "Transfer without handoff", "Avoid discussion"]'::jsonb, 1, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 49-year-old female has suspected ectopic pregnancy.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "Transvaginal pelvic ultrasound with \u03b2-hCG"]'::jsonb, 4, 'For Suspected ectopic pregnancy, Transvaginal pelvic ultrasound with β-hCG is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 74-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 4).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 24-year-old male has suspected subarachnoid hemorrhage negative ct.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "No further testing; observe", "Empiric treatment without diagnosis", "Lumbar puncture for xanthochromia"]'::jsonb, 4, 'For Suspected subarachnoid hemorrhage negative CT, Lumbar puncture for xanthochromia is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 70-year-old female has wheezing and episodic dyspnea triggered by allergens.

Physical Examination:

Expiratory wheezes.

Laboratory Results:

Peak flow 65% personal best.


What is the most likely diagnosis?', '["Asthma exacerbation", "Anxiety disorder", "Medication side effect", "Functional pain syndrome", "Normal variant"]'::jsonb, 0, 'Clinical pattern matches Asthma exacerbation.'),
    (v_topic_id, 'A 57-year-old female develops acute dyspnea and pleuritic pain 10 days after knee replacement surgery.

Physical Examination:

Vitals: HR 112 | RR 26 | BP 128/76 | SpO2 89% on room air.

Lungs: Clear. Extremities: Left calf tenderness and swelling.

Laboratory Results:

D-dimer elevated | CT pulmonary angiography: Bilateral segmental filling defects.


What is the most likely diagnosis?', '["Anxiety disorder", "Acute coronary syndrome", "Pneumonia", "Pericarditis", "Pulmonary embolism"]'::jsonb, 4, 'Postoperative setting, hypoxemia, calf findings, and CTPA filling defects confirm PE.'),
    (v_topic_id, 'A 49-year-old male is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Vitamin K epoxide reductase inhibition", "Placebo effect only"]'::jsonb, 3, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 35-year-old female presents with vomiting, delayed emptying.

Physical Examination:

Gastric retention on scintigraphy

Laboratory Results:

Key finding: Prokinetics, glucose control.


What is the most likely diagnosis?', '["Normal variant", "Gastroparesis diabetic", "Functional disorder", "Medication adverse effect", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with Gastroparesis diabetic.'),
    (v_topic_id, 'A 62-year-old female an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Treat per emergent best-interest standard and seek ethics consult", "Use physician personal preference only", "Court order required before any treatment", "Wait indefinitely for family", "Withdraw all care immediately"]'::jsonb, 0, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 83-year-old female presents with tall infertile male.

Physical Examination:

XXY karyotype

Laboratory Results:

Key finding: Testosterone.


What is the most likely diagnosis?', '["Klinefelter", "Functional disorder", "Conversion disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Klinefelter.'),
    (v_topic_id, 'A 68-year-old female a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Obtain court order first", "Report to child protective services", "Refuse all care until 18", "Provide confidential care per mature minor laws", "Mandatory parental notification always"]'::jsonb, 3, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 56-year-old female has suspected cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Right upper quadrant ultrasound", "Genetic panel first", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected cholecystitis, Right upper quadrant ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 69-year-old male clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Assess immediate safety; provide resources", "Avoid discussion", "Transfer without handoff", "Guarantee cure"]'::jsonb, 1, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 30-year-old male has suspected carotid stenosis bruit.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Carotid duplex ultrasound", "Genetic panel first", "No further testing; observe", "PET scan whole body"]'::jsonb, 1, 'For Suspected carotid stenosis bruit, Carotid duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 56-year-old male presents with EF 20%.

Physical Examination:

S3 gallop

Laboratory Results:

Key finding: GDMT.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Dilated cardiomyopathy", "Conversion disorder", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Dilated cardiomyopathy.'),
    (v_topic_id, 'A 65-year-old female presents with chronic purulent cough.

Physical Examination:

Tram-track opacities

Laboratory Results:

Key finding: Airway clearance, antibiotics.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Bronchiectasis"]'::jsonb, 4, 'Presentation consistent with Bronchiectasis.'),
    (v_topic_id, 'A 55-year-old female presents with pain out of proportion.

Physical Examination:

Crepitus gas

Laboratory Results:

Key finding: Surgery antibiotics.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Necrotizing fasciitis"]'::jsonb, 4, 'Presentation consistent with Necrotizing fasciitis.'),
    (v_topic_id, 'A 41-year-old female has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Increasing hepatic blood flow", "Inhibition of viral replication enzymes", "Neutralization of endotoxin", "Blocking TNF-\u03b1 only", "Stimulation of host IgM only"]'::jsonb, 1, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 76-year-old female an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Use physician personal preference only", "Court order required before any treatment", "Wait indefinitely for family", "Treat per emergent best-interest standard and seek ethics consult", "Withdraw all care immediately"]'::jsonb, 3, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 41-year-old female is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Unknown mechanism", "Hormone supplementation only", "Microtubule disruption inhibiting neutrophil chemotaxis"]'::jsonb, 4, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 29-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 14).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 75-year-old male has suspected myasthenia gravis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Acetylcholine receptor antibodies and edrophonium/EMG", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Acetylcholine receptor antibodies and edrophonium/EMG.'),
    (v_topic_id, 'A 44-year-old male presents with erythema spreading.

Physical Examination:

No crepitus

Laboratory Results:

Key finding: Antistaphylococcal.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Functional disorder", "Conversion disorder", "Cellulitis"]'::jsonb, 4, 'Presentation consistent with Cellulitis.'),
    (v_topic_id, 'A 59-year-old male is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Irreversible inhibition of H+/K+ ATPase"]'::jsonb, 4, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 30-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Exposure associated with higher risk of outcome", "Study proves mechanism", "Case-fatality rate reported"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 81-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 7).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure protective", "No association", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 52-year-old male presents with heartburn postprandial.

Physical Examination:

Normal EGD mild esophagitis

Laboratory Results:

Key finding: PPI lifestyle.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "GERD", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with GERD.'),
    (v_topic_id, 'A 29-year-old male has suspected biliary obstruction.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "RUQ ultrasound first", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 2, 'For Suspected biliary obstruction, RUQ ultrasound first is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 68-year-old female presents with hallucinations fever.

Physical Examination:

Severe withdrawal

Laboratory Results:

Key finding: ICU benzodiazepines.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder", "Delirium tremens"]'::jsonb, 4, 'Presentation consistent with Delirium tremens.'),
    (v_topic_id, 'A 28-year-old male presents with steroid-resistant nephrotic.

Physical Examination:

Segmental sclerosis

Laboratory Results:

Key finding: Immunosuppression.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "Functional disorder", "FSGS", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with FSGS.'),
    (v_topic_id, 'A 83-year-old female has suspected pulmonary embolism; Wells score moderate.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

D-dimer elevated.


Which test confirms the diagnosis?', '["ABG alone", "Ventilation-perfusion scan as first test in all patients", "Chest X-ray alone", "CT pulmonary angiography", "Lower extremity duplex only"]'::jsonb, 3, 'CTPA is standard confirmatory test for PE when renal function allows.'),
    (v_topic_id, 'A 54-year-old female presents with palpitations paresthesias.

Physical Examination:

Normal vitals labs

Laboratory Results:

Key finding: Reassurance CBT SSRI.


What is the most likely diagnosis?', '["Panic attack", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Panic attack.'),
    (v_topic_id, 'A 53-year-old male presents with clonus hyperreflexia on serotonergics.

Physical Examination:

Hyperthermia

Laboratory Results:

Key finding: Cyproheptadine stop agents.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Functional disorder", "Serotonin syndrome", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Serotonin syndrome.'),
    (v_topic_id, 'A 70-year-old female presents with fever headache focal.

Physical Examination:

Ring enhancing lesion

Laboratory Results:

Key finding: Antibiotics drainage.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Brain abscess"]'::jsonb, 4, 'Presentation consistent with Brain abscess.'),
    (v_topic_id, 'A 48-year-old male presents with sudden severe tearing chest pain radiating to the back, with unequal blood pressures in both arms.

Physical Examination:

Vitals: HR 118 bpm | BP 188/102 right arm, 142/78 left arm.

Cardiac: S1/S2 without murmur. Lungs clear.

Neuro: Alert, no focal deficits.

Laboratory Results:

Chest CT angiography: Intimal flap in the ascending aorta with true/false lumen.


What is the most likely diagnosis?', '["Acute pericarditis", "Unstable angina", "Esophageal rupture", "Acute pulmonary embolism", "Acute aortic dissection"]'::jsonb, 4, 'Tearing pain with arm BP differential and CT intimal flap are classic for aortic dissection.'),
    (v_topic_id, 'A 43-year-old male has suspected infective endocarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Exome sequencing first", "Empiric treatment without workup", "Blood cultures and transthoracic then TEE echo"]'::jsonb, 4, 'Appropriate initial study: Blood cultures and transthoracic then TEE echo.'),
    (v_topic_id, 'A 37-year-old male has syncope during exercise; family history of sudden death.

Physical Examination:

Murmur increases with Valsalva.

Laboratory Results:

Echo: Asymmetric septal hypertrophy.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Normal variant", "Hypertrophic cardiomyopathy", "Functional pain syndrome"]'::jsonb, 3, 'Clinical pattern matches Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 41-year-old female has suspected carotid bruit stroke prevention.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "Carotid duplex ultrasonography"]'::jsonb, 4, 'Appropriate initial study: Carotid duplex ultrasonography.'),
    (v_topic_id, 'A 61-year-old female has progressive memory loss and visuospatial deficits.

Physical Examination:

MMSE 19/30.

Laboratory Results:

MRI: Hippocampal atrophy.


What is the most likely diagnosis?', '["Normal variant", "Anxiety disorder", "Functional pain syndrome", "Medication side effect", "Alzheimer disease"]'::jsonb, 4, 'Clinical pattern matches Alzheimer disease.'),
    (v_topic_id, 'A 51-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 6).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "No association", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 36-year-old male clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Guarantee cure", "Avoid discussion", "Discuss values before procedure menu", "Dismiss patient concerns"]'::jsonb, 3, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 23-year-old male is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Hormone supplementation only", "Placebo effect only", "Inhibition of dihydrofolate reductase", "Direct DNA replication block only"]'::jsonb, 3, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 58-year-old female presents with night sweats, weight loss.

Physical Examination:

AFB positive

Laboratory Results:

Key finding: RIPE therapy.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Functional disorder", "Normal variant", "Tuberculosis"]'::jsonb, 4, 'Presentation consistent with Tuberculosis.'),
    (v_topic_id, 'A 63-year-old female is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Unknown mechanism", "Placebo effect only", "Vitamin K epoxide reductase inhibition"]'::jsonb, 4, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 32-year-old female has palpitations, tremor, and heat intolerance for 3 weeks.

Physical Examination:

Vitals: HR 124 (irregular) | BP 142/78.

Thyroid: Diffusely enlarged, no nodules. Lid lag present.

Laboratory Results:

TSH <0.01 mIU/L | Free T4 elevated | TSH receptor antibody positive.


What is the most likely diagnosis?', '["Subacute thyroiditis", "Graves disease", "Euthyroid sick syndrome", "Pituitary TSHoma", "Toxic multinodular goiter"]'::jsonb, 1, 'Suppressed TSH, elevated T4, diffuse goiter, TRAb positive = Graves.'),
    (v_topic_id, 'A 22-year-old male a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Sedate and transfuse", "Transfuse emergently regardless", "Honor refusal; optimize nonblood alternatives", "Call security", "Obtain psychiatric hold"]'::jsonb, 2, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 56-year-old male has progressive painless jaundice and 5-kg weight loss over 2 months.

Physical Examination:

Vitals: Temp 98.6°F | HR 88 | BP 132/78.

Abdomen: Palpable, nontender gallbladder. No ascites.

Laboratory Results:

Total bilirubin 9.2 mg/dL (direct predominant) | CT abdomen: Mass at pancreatic head with biliary dilation.


What is the most likely diagnosis?', '["Acute cholecystitis", "Hemolytic anemia", "Viral hepatitis A", "Pancreatic head adenocarcinoma", "Gilbert syndrome"]'::jsonb, 3, 'Painless jaundice, Courvoisier sign, and pancreatic head mass suggest pancreatic cancer.'),
    (v_topic_id, 'A 60-year-old female presents with monoarticular hot joint.

Physical Examination:

Synovial WBC>50k

Laboratory Results:

Key finding: Drain + IV antibiotics.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Septic arthritis", "Medication adverse effect", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Septic arthritis.'),
    (v_topic_id, 'A 68-year-old female has suspected subdural hematoma elderly fall.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "Noncontrast head CT", "No testing indicated"]'::jsonb, 3, 'Appropriate initial study: Noncontrast head CT.'),
    (v_topic_id, 'A 72-year-old female has malar rash and photosensitivity with oral ulcers.

Physical Examination:

No arthritis deformity yet.

Laboratory Results:

ANA positive, anti-dsDNA elevated.


What is the most likely diagnosis?', '["Functional pain syndrome", "Medication side effect", "Systemic lupus erythematosus", "Anxiety disorder", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Systemic lupus erythematosus.'),
    (v_topic_id, 'A 67-year-old female clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Apologize, explain, commit to prevention", "Transfer without handoff", "Avoid discussion"]'::jsonb, 2, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 34-year-old female a study finds OR 2.4 (p=0.03) for smoking and lung cancer.

Physical Examination:

N/A

Laboratory Results:

N/A


This design is most likely:', '["Cross-sectional survey only", "Case series", "Case-control study", "RCT", "Cohort with relative risk only"]'::jsonb, 2, 'OR is typical effect measure in case-control studies.'),
    (v_topic_id, 'A 41-year-old male has suspected pleural effusion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Thoracentesis with fluid studies", "PET scan screening", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Thoracentesis with fluid studies.'),
    (v_topic_id, 'A 57-year-old male has suspected acute diverticulitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "CT abdomen with contrast", "Exome sequencing first", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: CT abdomen with contrast.'),
    (v_topic_id, 'A 75-year-old male at 8 weeks gestation has pelvic pain and vaginal bleeding.

Physical Examination:

Adnexal mass.

Laboratory Results:

β-hCG 2,400, empty uterus on US.


What is the most likely diagnosis?', '["Functional pain syndrome", "Medication side effect", "Anxiety disorder", "Normal variant", "Ectopic pregnancy"]'::jsonb, 4, 'Clinical pattern matches Ectopic pregnancy.'),
    (v_topic_id, 'A 69-year-old male presents with paroxysmal HTN headache.

Physical Examination:

Metanephrines elevated

Laboratory Results:

Key finding: Alpha then beta blockade.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Pheochromocytoma", "Medication adverse effect", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Pheochromocytoma.'),
    (v_topic_id, 'A 82-year-old male with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Positive inotropy", "Sodium retention", "Arterial vasoconstriction", "Inhibition of angiotensin II\u2013mediated remodeling", "Increased preload"]'::jsonb, 3, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 75-year-old male has suspected acute spinal cord compression.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Genetic panel first", "No further testing; observe", "PET scan whole body", "MRI spine emergently"]'::jsonb, 4, 'For Suspected acute spinal cord compression, MRI spine emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 45-year-old male clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Transfer without handoff", "Dismiss patient concerns", "Guarantee cure", "Apologize, explain, commit to prevention"]'::jsonb, 4, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 75-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Study proves mechanism", "Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 39-year-old female is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "\u03bc-opioid receptor agonism", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 63-year-old male has suspected community-acquired pneumonia outpatient.

Physical Examination:

CURB-65 score 0.

Laboratory Results:

No prior antibiotics.


Which test is most appropriate at initial visit?', '["CT chest for all outpatients", "Chest X-ray", "Bronchoscopy", "Sputum culture for all", "No imaging needed"]'::jsonb, 1, 'CXR confirms infiltrate and guides management in suspected CAP.'),
    (v_topic_id, 'A 52-year-old female presents with pleuritic pain malignancy.

Physical Examination:

Light criteria exudate

Laboratory Results:

Key finding: Thoracentesis.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Pleural effusion exudative", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Pleural effusion exudative.'),
    (v_topic_id, 'A 49-year-old female has suspected prostate cancer elevated PSA.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "MRI-targeted biopsy pathway per guidelines", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: MRI-targeted biopsy pathway per guidelines.'),
    (v_topic_id, 'A 65-year-old female clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Dismiss patient concerns", "Transfer without handoff", "Use professional interpreter, not child", "Guarantee cure"]'::jsonb, 3, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 46-year-old female has new-onset ascites and suspected cirrhosis.

Physical Examination:

Shifting dullness present.

Laboratory Results:

No prior imaging.


Which study is most appropriate as the next diagnostic step?', '["Serum ammonia alone", "Upper endoscopy before any fluid studies", "Diagnostic paracentesis", "CT abdomen only", "Immediate liver transplant referral without workup"]'::jsonb, 2, 'New ascites requires diagnostic paracentesis to assess for SBP and etiology.'),
    (v_topic_id, 'A 37-year-old male is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Selective serotonin reuptake inhibition", "Direct DNA replication block only"]'::jsonb, 3, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 56-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 3).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "No association", "Study proves mechanism", "Exposure protective"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 64-year-old female has fever, uterine tenderness, and foul lochia day 5 postpartum.

Physical Examination:

Tachycardia.

Laboratory Results:

WBC 18,000.


What is the most likely diagnosis?', '["Medication side effect", "Postpartum endometritis", "Functional pain syndrome", "Normal variant", "Anxiety disorder"]'::jsonb, 1, 'Clinical pattern matches Postpartum endometritis.'),
    (v_topic_id, 'A 23-year-old female a trial reports RR 0.72 for death with Drug X vs placebo (95% CI 0.55–0.94).

Physical Examination:

N/A

Laboratory Results:

N/A


Which conclusion is most appropriate?', '["Drug X increases mortality", "CI proves causation individually", "Study is case-control", "No association", "Drug X is associated with lower mortality"]'::jsonb, 4, 'RR <1 with CI excluding 1 suggests lower event rate with treatment.');
END $$;
COMMIT;
