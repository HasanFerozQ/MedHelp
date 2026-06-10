-- Step 3 Mock #1 day1-fip — 240 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock1-day1-fip' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock1-day1-fip missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 70-year-old male has suspected lung nodule incidental.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "CT chest per Fleischner criteria", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: CT chest per Fleischner criteria.'),
    (v_topic_id, 'A 75-year-old female has suspected adrenal incidentaloma.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "Biochemical hormonal workup then adrenal CT/MRI", "PET scan screening"]'::jsonb, 3, 'Appropriate initial study: Biochemical hormonal workup then adrenal CT/MRI.'),
    (v_topic_id, 'A 73-year-old male presents with proximal weakness CK high.

Physical Examination:

Endomysial inflammation

Laboratory Results:

Key finding: Steroids immunosuppression.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Medication adverse effect", "Conversion disorder", "Polymyositis"]'::jsonb, 4, 'Presentation consistent with Polymyositis.'),
    (v_topic_id, 'A 23-year-old male is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "\u03bc-opioid receptor agonism", "Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 32-year-old female has suspected appendicitis adult.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "CT abdomen/pelvis or graded ultrasound", "Empiric treatment without workup", "PET scan screening", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: CT abdomen/pelvis or graded ultrasound.'),
    (v_topic_id, 'A 23-year-old male is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Local anti-inflammatory glucocorticoid effect", "Direct DNA replication block only", "Placebo effect only", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 44-year-old female presents with fever post pneumonia.

Physical Examination:

Pleural pH low, glucose low

Laboratory Results:

Key finding: Chest tube + antibiotics.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Empyema", "Conversion disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Empyema.'),
    (v_topic_id, 'A 57-year-old female presents with lymphocytosis elderly.

Physical Examination:

Smudge cells

Laboratory Results:

Key finding: Watch treat.


What is the most likely diagnosis?', '["Normal variant", "CLL", "Functional disorder", "Conversion disorder", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with CLL.'),
    (v_topic_id, 'A 53-year-old female has unexplained iron deficiency anemia.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "PET scan screening", "Empiric treatment without workup", "Esophagogastroduodenoscopy and colonoscopy", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: Esophagogastroduodenoscopy and colonoscopy.'),
    (v_topic_id, 'A 24-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 9).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "No association", "Exposure protective", "Study proves mechanism"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 77-year-old female presents with monoarticular hot joint.

Physical Examination:

Synovial WBC>50k

Laboratory Results:

Key finding: Drain + IV antibiotics.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Septic arthritis", "Conversion disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Septic arthritis.'),
    (v_topic_id, 'A 22-year-old female presents with fever, anosmia, exposure.

Physical Examination:

PCR positive

Laboratory Results:

Key finding: Isolation and monitoring.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "COVID-19", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with COVID-19.'),
    (v_topic_id, 'A 31-year-old female has suspected septic arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Arthrocentesis with synovial analysis", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Arthrocentesis with synovial analysis.'),
    (v_topic_id, 'A 45-year-old female presents with nightmares hypervigilance.

Physical Examination:

Trauma history

Laboratory Results:

Key finding: Trauma-focused therapy SSRI.


What is the most likely diagnosis?', '["PTSD", "Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with PTSD.'),
    (v_topic_id, 'A 33-year-old male is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Unknown mechanism", "Hormone supplementation only", "Placebo effect only", "Irreversible inhibition of H+/K+ ATPase"]'::jsonb, 4, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 78-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Case-fatality rate reported", "No association", "Exposure protective", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 26-year-old male has suspected hemochromatosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "No testing indicated", "Ferritin, transferrin saturation, HFE genotyping", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: Ferritin, transferrin saturation, HFE genotyping.'),
    (v_topic_id, 'A 52-year-old male has suspected diabetic neuropathy.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Monofilament exam and consider EMG if atypical", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Monofilament exam and consider EMG if atypical.'),
    (v_topic_id, 'A 82-year-old female presents with exertional chest pressure relieved by rest for 2 months.

Physical Examination:

Vitals stable.

Cardiac: No murmurs.

Laboratory Results:

Stress ECG: Horizontal ST depression at peak exercise.


What is the most likely diagnosis?', '["Functional disorder", "Pulmonary embolism", "Musculoskeletal strain", "Stable angina", "Gastroenteritis"]'::jsonb, 3, 'Exertional angina relieved by rest with exercise-induced ST depression.'),
    (v_topic_id, 'A 29-year-old female has suspected myasthenia gravis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Acetylcholine receptor antibodies and edrophonium/EMG", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: Acetylcholine receptor antibodies and edrophonium/EMG.'),
    (v_topic_id, 'A 44-year-old male is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Hormone supplementation only", "Selective serotonin reuptake inhibition", "Unknown mechanism", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 82-year-old male has polyuria, polydipsia, and 8-kg weight loss over 3 weeks.

Physical Examination:

Vitals: HR 102 | RR 28 (Kussmaul) | BP 104/68.

General: Appears ill, dry mucous membranes.

Laboratory Results:

Glucose 412 mg/dL | pH 7.18 | Bicarbonate 10 mEq/L | Anion gap 24 | Positive serum ketones.


What is the most likely diagnosis?', '["Lactic acidosis", "Uremia", "Salicylate toxicity", "Hyperosmolar hyperglycemic state", "Diabetic ketoacidosis"]'::jsonb, 4, 'Hyperglycemia, ketones, anion-gap acidosis, and Kussmaul breathing indicate DKA.'),
    (v_topic_id, 'A 32-year-old female clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Dismiss patient concerns", "Guarantee cure", "Use professional interpreter, not child", "Avoid discussion"]'::jsonb, 3, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 26-year-old female has suspected acute cholecystitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Right upper quadrant ultrasound", "No testing indicated", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Right upper quadrant ultrasound.'),
    (v_topic_id, 'A 44-year-old female presents with gait urinary incontinence dementia.

Physical Examination:

Large ventricles

Laboratory Results:

Key finding: VP shunt trial.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Normal pressure hydrocephalus"]'::jsonb, 4, 'Presentation consistent with Normal pressure hydrocephalus.'),
    (v_topic_id, 'A 25-year-old male is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Potentiation of antithrombin III"]'::jsonb, 4, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 38-year-old female has suspected osteomyelitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "MRI of involved bone and blood cultures", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 2, 'Appropriate initial study: MRI of involved bone and blood cultures.'),
    (v_topic_id, 'A 71-year-old female has acute vertigo, nausea, and unidirectional nystagmus for 2 days.

Physical Examination:

Neuro: No other focal signs.

Laboratory Results:

Head CT: No acute stroke.


What is the most likely diagnosis?', '["Functional disorder", "Vestibular neuritis", "Gastroenteritis", "Pulmonary embolism", "Musculoskeletal strain"]'::jsonb, 1, 'Continuous vertigo, positive head impulse, no focal deficits = vestibular neuritis.'),
    (v_topic_id, 'A 51-year-old female presents with fever headache focal.

Physical Examination:

Ring enhancing lesion

Laboratory Results:

Key finding: Antibiotics drainage.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Brain abscess", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Brain abscess.'),
    (v_topic_id, 'A 54-year-old male with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Inhibition of angiotensin II\u2013mediated remodeling", "Sodium retention", "Increased preload", "Arterial vasoconstriction", "Positive inotropy"]'::jsonb, 0, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 35-year-old male has suspected RPGN.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "ANCA, anti-GBM, complement, urgent renal biopsy", "PET scan screening", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: ANCA, anti-GBM, complement, urgent renal biopsy.'),
    (v_topic_id, 'A 25-year-old female has suspected pe pregnant patient.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "No further testing; observe", "PET scan whole body", "Genetic panel first", "V/Q scan or CTPA per risk"]'::jsonb, 4, 'For Suspected PE pregnant patient, V/Q scan or CTPA per risk is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 79-year-old male has pruritic vesicles in different stages on the trunk and face after daycare exposure.

Physical Examination:

Vitals: Temp 99.8°F.

Skin: Macules, papules, vesicles, crusted lesions simultaneously.

Laboratory Results:

No labs required for typical presentation.


What is the most likely diagnosis?', '["Impetigo", "Contact dermatitis", "Herpes zoster", "Varicella (chickenpox)", "Hand-foot-mouth disease"]'::jsonb, 3, 'Lesions in multiple stages (crop phenomenon) are classic for varicella.'),
    (v_topic_id, 'A 82-year-old female presents with pleuritic pain malignancy.

Physical Examination:

Light criteria exudate

Laboratory Results:

Key finding: Thoracentesis.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Pleural effusion exudative", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Pleural effusion exudative.'),
    (v_topic_id, 'A 72-year-old female has suspected carotid bruit stroke prevention.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Carotid duplex ultrasonography", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: Carotid duplex ultrasonography.'),
    (v_topic_id, 'A 38-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "No association", "Exposure protective", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 57-year-old male presents with dysphagia solids and liquids.

Physical Examination:

Bird beak on barium

Laboratory Results:

Key finding: POEM or pneumatic dilation.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "Achalasia", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Achalasia.'),
    (v_topic_id, 'A 29-year-old female has suspected dvt unilateral leg swelling.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Lower extremity venous duplex ultrasound", "Empiric treatment without diagnosis", "No further testing; observe", "Genetic panel first"]'::jsonb, 1, 'For Suspected DVT unilateral leg swelling, Lower extremity venous duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 40-year-old male a screening test has sensitivity 90% and specificity 80% in a low-prevalence population.

Physical Examination:

N/A

Laboratory Results:

N/A


If a patient has a positive test, which statement is most accurate regarding PPV?', '["PPV is always 90%", "PPV equals sensitivity", "PPV is lower than in high-prevalence settings", "PPV equals specificity", "PPV is independent of prevalence"]'::jsonb, 2, 'PPV falls when disease prevalence is low, even with good test characteristics.'),
    (v_topic_id, 'A 84-year-old female a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Transfuse emergently regardless", "Obtain psychiatric hold", "Honor refusal; optimize nonblood alternatives", "Call security", "Sedate and transfuse"]'::jsonb, 2, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 35-year-old female has chronic diarrhea, weight loss, and iron deficiency.

Physical Examination:

Oral aphthae.

Laboratory Results:

Anti-tTG IgA positive.


What is the most likely diagnosis?', '["Anxiety disorder", "Celiac disease", "Normal variant", "Medication side effect", "Functional pain syndrome"]'::jsonb, 1, 'Clinical pattern matches Celiac disease.'),
    (v_topic_id, 'A 79-year-old male a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Report to child protective services", "Mandatory parental notification always", "Obtain court order first", "Refuse all care until 18", "Provide confidential care per mature minor laws"]'::jsonb, 4, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 69-year-old female a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Publicly confront on ward", "Cover shifts indefinitely without report", "Resign immediately", "Report to patient safety/medical staff health per policy", "Ignore unless patient harm occurs"]'::jsonb, 3, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 82-year-old female has suspected subdural hematoma elderly fall.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Noncontrast head CT", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Noncontrast head CT.'),
    (v_topic_id, 'A 49-year-old female presents with synpharyngitic hematuria.

Physical Examination:

IgA deposits

Laboratory Results:

Key finding: ACEi BP control.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Conversion disorder", "IgA nephropathy", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with IgA nephropathy.'),
    (v_topic_id, 'A 34-year-old female has suspected biliary obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup", "RUQ ultrasound then MRCP if indicated"]'::jsonb, 4, 'Appropriate initial study: RUQ ultrasound then MRCP if indicated.'),
    (v_topic_id, 'A 49-year-old male a study finds OR 2.4 (p=0.03) for smoking and lung cancer.

Physical Examination:

N/A

Laboratory Results:

N/A


This design is most likely:', '["Case-control study", "Cohort with relative risk only", "Cross-sectional survey only", "Case series", "RCT"]'::jsonb, 0, 'OR is typical effect measure in case-control studies.'),
    (v_topic_id, 'A 38-year-old male clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Explore barriers; shared decision-making", "Dismiss patient concerns", "Transfer without handoff", "Guarantee cure", "Avoid discussion"]'::jsonb, 0, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 55-year-old male presents with hypothermia altered.

Physical Examination:

Low T4 high TSH

Laboratory Results:

Key finding: IV levothyroxine.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder", "Myxedema coma"]'::jsonb, 4, 'Presentation consistent with Myxedema coma.'),
    (v_topic_id, 'A 81-year-old male has suspected temporal arteritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "ESR/CRP and temporal artery biopsy", "PET scan screening", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: ESR/CRP and temporal artery biopsy.'),
    (v_topic_id, 'A 32-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Exposure associated with higher risk of outcome", "Exposure protective", "Study proves mechanism", "Case-fatality rate reported"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 34-year-old male has fatigue, constipation, and cold intolerance.

Physical Examination:

Bradycardia, delayed reflexes.

Laboratory Results:

TSH 18, low free T4.


What is the most likely diagnosis?', '["Normal variant", "Medication side effect", "Functional pain syndrome", "Primary hypothyroidism", "Anxiety disorder"]'::jsonb, 3, 'Clinical pattern matches Primary hypothyroidism.'),
    (v_topic_id, 'A 59-year-old female presents with hyperpigmentation hypotension.

Physical Examination:

Low cortisol high ACTH

Laboratory Results:

Key finding: Hydrocortisone fludrocortisone.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Medication adverse effect", "Addison disease", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Addison disease.'),
    (v_topic_id, 'A 81-year-old male presents with tremor autonomic.

Physical Examination:

CIWA high

Laboratory Results:

Key finding: Benzodiazepines thiamine.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Medication adverse effect", "Alcohol withdrawal", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Alcohol withdrawal.'),
    (v_topic_id, 'A 56-year-old female has suspected prostate cancer elevated PSA.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["MRI-targeted biopsy pathway per guidelines", "PET scan screening", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: MRI-targeted biopsy pathway per guidelines.'),
    (v_topic_id, 'A 76-year-old male an intervention reduces events from 20% to 10%.

Physical Examination:

N/A

Laboratory Results:

N/A


The number needed to treat (NNT) is approximately:', '["2", "10", "100", "20", "0.1"]'::jsonb, 1, 'ARR = 10%; NNT = 1/0.10 = 10.'),
    (v_topic_id, 'A 50-year-old male has fever, right upper quadrant pain, and jaundice after cholecystectomy.

Physical Examination:

RUQ tenderness.

Laboratory Results:

US: Common bile duct 9 mm with dilation.


What is the most likely diagnosis?', '["Pulmonary embolism", "Ascending cholangitis", "Gastroenteritis", "Musculoskeletal strain", "Functional disorder"]'::jsonb, 1, 'Charcot triad (fever, RUQ pain, jaundice) with CBD dilation = cholangitis.'),
    (v_topic_id, 'A 54-year-old male presents with vomiting, delayed emptying.

Physical Examination:

Gastric retention on scintigraphy

Laboratory Results:

Key finding: Prokinetics, glucose control.


What is the most likely diagnosis?', '["Gastroparesis diabetic", "Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Gastroparesis diabetic.'),
    (v_topic_id, 'A 66-year-old female has fever, sore throat, and posterior cervical lymphadenopathy after college exposure.

Physical Examination:

Splenomegaly.

Laboratory Results:

Monospot positive.


What is the most likely diagnosis?', '["Infectious mononucleosis", "Functional disorder", "Pulmonary embolism", "Gastroenteritis", "Musculoskeletal strain"]'::jsonb, 0, 'Posterior nodes, splenomegaly, Monospot+ = mono.'),
    (v_topic_id, 'A 51-year-old female has suspected SLE flare.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "PET scan screening", "Exome sequencing first", "ANA, anti-dsDNA, complement levels, urinalysis"]'::jsonb, 4, 'Appropriate initial study: ANA, anti-dsDNA, complement levels, urinalysis.'),
    (v_topic_id, 'A 24-year-old female has suspected acute spinal cord compression.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Empiric treatment without diagnosis", "PET scan whole body", "Genetic panel first", "MRI spine emergently"]'::jsonb, 4, 'For Suspected acute spinal cord compression, MRI spine emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 77-year-old male presents with elevated ALT.

Physical Examination:

HCV RNA positive

Laboratory Results:

Key finding: DAA therapy.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Hepatitis C chronic", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Hepatitis C chronic.'),
    (v_topic_id, 'A 45-year-old female is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Inhibition of L-type calcium channels in vascular smooth muscle", "Unknown mechanism", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 27-year-old male presents with confusion.

Physical Examination:

High insulin C-peptide

Laboratory Results:

Key finding: D50 octreotide.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Hypoglycemia sulfonylurea", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Hypoglycemia sulfonylurea.'),
    (v_topic_id, 'A 22-year-old female has acute severe headache described as the worst of her life, with brief loss of consciousness.

Physical Examination:

Vitals: HR 88 | BP 168/96.

Neuro: Meningismus; no lateralizing signs initially.

Laboratory Results:

Noncontrast head CT: Hyperdensity in basal cisterns.


What is the most likely diagnosis?', '["Cluster headache", "Tension headache", "Subarachnoid hemorrhage", "Migraine", "Meningitis"]'::jsonb, 2, 'Thunderclap headache with cisternal blood on CT = SAH until proven otherwise.'),
    (v_topic_id, 'A 38-year-old female develops acute dyspnea and pleuritic pain 10 days after knee replacement surgery.

Physical Examination:

Vitals: HR 112 | RR 26 | BP 128/76 | SpO2 89% on room air.

Lungs: Clear. Extremities: Left calf tenderness and swelling.

Laboratory Results:

D-dimer elevated | CT pulmonary angiography: Bilateral segmental filling defects.


What is the most likely diagnosis?', '["Anxiety disorder", "Acute coronary syndrome", "Pericarditis", "Pulmonary embolism", "Pneumonia"]'::jsonb, 3, 'Postoperative setting, hypoxemia, calf findings, and CTPA filling defects confirm PE.'),
    (v_topic_id, 'A 84-year-old female presents with overdose history.

Physical Examination:

Positive urine

Laboratory Results:

Key finding: Buprenorphine naloxone.


What is the most likely diagnosis?', '["Opioid use disorder", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Opioid use disorder.'),
    (v_topic_id, 'A 43-year-old female has expansive mood, decreased sleep, and pressured speech for 1 week.

Physical Examination:

Grandiosity.

Laboratory Results:

No substance use.


What is the most likely diagnosis?', '["Bipolar I manic episode", "Anxiety disorder", "Medication side effect", "Functional pain syndrome", "Normal variant"]'::jsonb, 0, 'Clinical pattern matches Bipolar I manic episode.'),
    (v_topic_id, 'A 47-year-old female clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Avoid discussion", "Guarantee cure", "Assess immediate safety; provide resources", "Dismiss patient concerns"]'::jsonb, 3, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 55-year-old male presents with salivation miosis.

Physical Examination:

Low cholinesterase

Laboratory Results:

Key finding: Atropine pralidoxime.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Medication adverse effect", "Organophosphate poisoning", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Organophosphate poisoning.'),
    (v_topic_id, 'A 57-year-old male with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["DPP-4 inhibition", "Decreased hepatic gluconeogenesis", "SGLT2-mediated glucosuria only", "Stimulation of insulin secretion from \u03b2 cells", "\u03b1-glucosidase inhibition"]'::jsonb, 1, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 61-year-old male clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Explain viral etiology; offer symptomatic care", "Guarantee cure", "Avoid discussion", "Dismiss patient concerns", "Transfer without handoff"]'::jsonb, 0, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 63-year-old male clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Explain viral etiology; offer symptomatic care", "Avoid discussion", "Transfer without handoff", "Dismiss patient concerns", "Guarantee cure"]'::jsonb, 0, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 81-year-old male has suspected acute diverticulitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "CT abdomen with contrast", "Exome sequencing first", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 1, 'Appropriate initial study: CT abdomen with contrast.'),
    (v_topic_id, 'A 74-year-old male has suspected testicular torsion.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Scrotal Doppler ultrasound emergently", "Empiric treatment without diagnosis", "PET scan whole body", "Genetic panel first", "No further testing; observe"]'::jsonb, 0, 'For Suspected testicular torsion, Scrotal Doppler ultrasound emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 60-year-old female presents with chest pain post viral.

Physical Examination:

Troponin elevated, MRI edema

Laboratory Results:

Key finding: Supportive.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Conversion disorder", "Myocarditis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Myocarditis.'),
    (v_topic_id, 'A 75-year-old female has acute severe epigastric pain radiating to the back after alcohol binge.

Physical Examination:

Epigastric tenderness.

Laboratory Results:

Lipase 1,240 U/L (normal <60).


What is the most likely diagnosis?', '["Acute pancreatitis", "Pulmonary embolism", "Functional disorder", "Musculoskeletal strain", "Gastroenteritis"]'::jsonb, 0, 'Epigastric pain + lipase >3× normal = pancreatitis.'),
    (v_topic_id, 'A 63-year-old female is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Irreversible inhibition of H+/K+ ATPase", "Hormone supplementation only", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 73-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 1).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association", "Study proves mechanism", "Exposure protective"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 69-year-old female presents with regular tachycardia 150.

Physical Examination:

Sawtooth flutter waves

Laboratory Results:

Key finding: Rate control/cardioversion.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Atrial flutter", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Atrial flutter.'),
    (v_topic_id, 'A 45-year-old female is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Reduced myocardial oxygen demand and arrhythmia risk", "Placebo effect only", "Hormone supplementation only", "Unknown mechanism", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 46-year-old female a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Ignore unless patient harm occurs", "Cover shifts indefinitely without report", "Publicly confront on ward", "Resign immediately", "Report to patient safety/medical staff health per policy"]'::jsonb, 4, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 81-year-old female has acute bilateral eye redness with mucopurulent discharge and preauricular lymphadenopathy.

Physical Examination:

Visual acuity preserved.

Laboratory Results:

No corneal staining.


What is the most likely diagnosis?', '["Gastroenteritis", "Musculoskeletal strain", "Functional disorder", "Bacterial conjunctivitis", "Pulmonary embolism"]'::jsonb, 3, 'Mucopurulent discharge without keratitis = bacterial conjunctivitis.'),
    (v_topic_id, 'A 51-year-old female has fever, cough, and hypoxia; recent COVID exposure.

Physical Examination:

Bilateral infiltrates.

Laboratory Results:

PCR positive for SARS-CoV-2.


What is the most likely diagnosis?', '["COVID-19 pneumonia", "Anxiety disorder", "Normal variant", "Functional pain syndrome", "Medication side effect"]'::jsonb, 0, 'Clinical pattern matches COVID-19 pneumonia.'),
    (v_topic_id, 'A 69-year-old female is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only", "Facilitated glucose uptake and suppression of ketogenesis", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 66-year-old female presents with short stature web neck.

Physical Examination:

45,X

Laboratory Results:

Key finding: Growth hormone estrogen.


What is the most likely diagnosis?', '["Conversion disorder", "Turner syndrome", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Turner syndrome.'),
    (v_topic_id, 'A 38-year-old female has fatigue, pruritus, and dark urine after camping trip.

Physical Examination:

Scleral icterus.

Laboratory Results:

Anti-HAV IgM positive.


What is the most likely diagnosis?', '["Gastroenteritis", "Pulmonary embolism", "Acute hepatitis A", "Functional disorder", "Musculoskeletal strain"]'::jsonb, 2, 'IgM anti-HAV confirms acute HAV.'),
    (v_topic_id, 'A 46-year-old male presents with foul sputum, alcoholism.

Physical Examination:

Cavity air-fluid level

Laboratory Results:

Key finding: Prolonged antibiotics.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Lung abscess", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Lung abscess.'),
    (v_topic_id, 'A 33-year-old female presents with pleuritic pain, friction rub.

Physical Examination:

Diffuse ST elevation

Laboratory Results:

Key finding: NSAIDs/colchicine.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Pericarditis", "Functional disorder", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with Pericarditis.'),
    (v_topic_id, 'A 22-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 3).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Exposure protective", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Study proves mechanism"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 27-year-old female is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Local anti-inflammatory glucocorticoid effect", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 78-year-old male is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Reduced myocardial oxygen demand and arrhythmia risk", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 84-year-old male has suspected appendicitis rlq pain.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "No further testing; observe", "CT abdomen with contrast or ultrasound in pregnancy", "Empiric treatment without diagnosis", "PET scan whole body"]'::jsonb, 2, 'For Suspected appendicitis RLQ pain, CT abdomen with contrast or ultrasound in pregnancy is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 61-year-old male is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Microtubule disruption inhibiting neutrophil chemotaxis", "Direct DNA replication block only", "Placebo effect only", "Unknown mechanism"]'::jsonb, 1, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 24-year-old male presents with rapid Cr rise hematuria.

Physical Examination:

Crescents on biopsy

Laboratory Results:

Key finding: Pulse steroids plasmapheresis.


What is the most likely diagnosis?', '["Conversion disorder", "RPGN", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with RPGN.'),
    (v_topic_id, 'A 84-year-old male has suspected urinary tract obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "PET scan screening", "Exome sequencing first", "Renal ultrasound or noncontrast CT", "No testing indicated"]'::jsonb, 3, 'Appropriate initial study: Renal ultrasound or noncontrast CT.'),
    (v_topic_id, 'A 75-year-old female is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Vitamin K epoxide reductase inhibition", "Unknown mechanism", "Direct DNA replication block only", "Placebo effect only", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 25-year-old male presents with young male back stiffness.

Physical Examination:

HLA-B27 sacroiliitis

Laboratory Results:

Key finding: NSAIDs TNF inhibitor.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Functional disorder", "Ankylosing spondylitis"]'::jsonb, 4, 'Presentation consistent with Ankylosing spondylitis.'),
    (v_topic_id, 'A 34-year-old male presents with LLQ pain fever.

Physical Examination:

CT fat stranding sigmoid

Laboratory Results:

Key finding: Antibiotics bowel rest.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect", "Diverticulitis"]'::jsonb, 4, 'Presentation consistent with Diverticulitis.'),
    (v_topic_id, 'A 23-year-old male presents with pruritus AMA positive.

Physical Examination:

Alkaline phosphatase high

Laboratory Results:

Key finding: UDCA.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Medication adverse effect", "Primary biliary cholangitis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Primary biliary cholangitis.'),
    (v_topic_id, 'A 28-year-old female presents with exertional syncope.

Physical Examination:

Loud P2

Laboratory Results:

Key finding: PAH targeted therapy.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Pulmonary hypertension"]'::jsonb, 4, 'Presentation consistent with Pulmonary hypertension.'),
    (v_topic_id, 'A 58-year-old female presents with purulent sputum.

Physical Examination:

Pseudomonas growth

Laboratory Results:

Key finding: Antipseudomonal regimen.


What is the most likely diagnosis?', '["CF exacerbation", "Conversion disorder", "Normal variant", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with CF exacerbation.'),
    (v_topic_id, 'A 28-year-old male has acute warm, swollen knee after twisting injury.

Physical Examination:

Effusion present.

Laboratory Results:

Arthrocentesis: Gross blood, no crystals.


What is the most likely diagnosis?', '["Hemarthrosis (ligament injury)", "Functional disorder", "Gastroenteritis", "Musculoskeletal strain", "Pulmonary embolism"]'::jsonb, 0, 'Traumatic hemarthrosis suggests ACL/ligament tear.'),
    (v_topic_id, 'A 40-year-old female has suspected acute pericarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "ECG, troponin, echocardiography", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 2, 'Appropriate initial study: ECG, troponin, echocardiography.'),
    (v_topic_id, 'A 84-year-old male clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Avoid discussion", "Apologize, explain, commit to prevention", "Transfer without handoff", "Dismiss patient concerns"]'::jsonb, 2, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 60-year-old male has suspected rheumatoid arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "No testing indicated", "RF, anti-CCP, and baseline X-rays", "PET scan screening", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: RF, anti-CCP, and baseline X-rays.'),
    (v_topic_id, 'A 36-year-old female has bloody diarrhea, abdominal cramps, and tenesmus for 5 days.

Physical Examination:

Vitals: Temp 100.8°F | HR 102 | BP 110/70.

Abdomen: Diffuse tenderness, no rebound.

Laboratory Results:

Stool culture: Shiga toxin–producing organism detected.


What is the most likely diagnosis?', '["Irritable bowel syndrome", "Shiga toxin E. coli colitis", "C. difficile colitis", "Ulcerative colitis flare", "Ischemic colitis"]'::jsonb, 1, 'Acute bloody diarrhea with STEC on culture indicates infectious colitis (watch HUS).'),
    (v_topic_id, 'A 45-year-old male presents with shoulder hip girdle pain.

Physical Examination:

ESR high

Laboratory Results:

Key finding: Low-dose prednisone.


What is the most likely diagnosis?', '["Polymyalgia rheumatica", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Polymyalgia rheumatica.'),
    (v_topic_id, 'A 47-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure associated with higher risk of outcome", "No association", "Exposure protective", "Case-fatality rate reported"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 45-year-old male has suspected nephrotic syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "PET scan screening", "Urinalysis, protein quantification, renal ultrasound", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 2, 'Appropriate initial study: Urinalysis, protein quantification, renal ultrasound.'),
    (v_topic_id, 'A 75-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 14).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "No association", "Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 59-year-old male has suspected primary hyperaldosteronism.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "PET scan screening", "Aldosterone-renin ratio after correction of hypokalemia", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Aldosterone-renin ratio after correction of hypokalemia.'),
    (v_topic_id, 'A 48-year-old male presents with asbestos exposure pleural mass.

Physical Examination:

Pleural thickening

Laboratory Results:

Key finding: Oncology referral.


What is the most likely diagnosis?', '["Mesothelioma", "Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Mesothelioma.'),
    (v_topic_id, 'A 83-year-old male presents with petechiae shock.

Physical Examination:

Gram negative diplococci

Laboratory Results:

Key finding: Ceftriaxone contacts prophylaxis.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Meningococcemia", "Conversion disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Meningococcemia.'),
    (v_topic_id, 'A 70-year-old male has central obesity, striae, and proximal muscle weakness.

Physical Examination:

Moon facies.

Laboratory Results:

24-h urine cortisol elevated.


What is the most likely diagnosis?', '["Medication side effect", "Anxiety disorder", "Cushing syndrome", "Functional pain syndrome", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Cushing syndrome.'),
    (v_topic_id, 'A 47-year-old male has fever, uterine tenderness, and foul lochia day 5 postpartum.

Physical Examination:

Tachycardia.

Laboratory Results:

WBC 18,000.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Postpartum endometritis", "Functional pain syndrome", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Postpartum endometritis.'),
    (v_topic_id, 'A 78-year-old female has fever, neck stiffness, and photophobia for 12 hours.

Physical Examination:

Vitals: Temp 101.8°F | HR 110 | BP 138/82.

Neuro: Nuchal rigidity; no focal motor deficits.

Laboratory Results:

LP: CSF WBC 1,200/µL (90% PMNs), protein 180 mg/dL, glucose 22 mg/dL (serum 110).


What is the most likely diagnosis?', '["Tension headache", "Subarachnoid hemorrhage", "Migraine", "Bacterial meningitis", "Viral meningitis"]'::jsonb, 3, 'Acute fever with PMN-predominant CSF pleocytosis and low glucose suggest bacterial meningitis.'),
    (v_topic_id, 'A 56-year-old female has syncope during exercise; family history of sudden death.

Physical Examination:

Murmur increases with Valsalva.

Laboratory Results:

Echo: Asymmetric septal hypertrophy.


What is the most likely diagnosis?', '["Medication side effect", "Normal variant", "Hypertrophic cardiomyopathy", "Functional pain syndrome", "Anxiety disorder"]'::jsonb, 2, 'Clinical pattern matches Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 68-year-old female has suspected infectious endocarditis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Transesophageal echocardiography", "No further testing; observe", "PET scan whole body", "Genetic panel first"]'::jsonb, 1, 'For Suspected infectious endocarditis, Transesophageal echocardiography is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 55-year-old female has suspected Cushing syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Overnight 1-mg dexamethasone suppression test", "Exome sequencing first", "PET scan screening", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: Overnight 1-mg dexamethasone suppression test.'),
    (v_topic_id, 'A 36-year-old male presents with headache multiple victims.

Physical Examination:

Cherry red skin COHb high

Laboratory Results:

Key finding: 100% O2 hyperbaric.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Carbon monoxide poisoning", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Carbon monoxide poisoning.'),
    (v_topic_id, 'A 52-year-old female with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["PCSK9 gene deletion", "Niacin receptor agonism", "Inhibition of lipoprotein lipase", "Competitive inhibition of HMG-CoA reductase", "Bile acid sequestration in gut"]'::jsonb, 3, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 29-year-old male is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Vitamin K epoxide reductase inhibition", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 62-year-old female has episodic severe unilateral periorbital pain with lacrimation and nasal congestion.

Physical Examination:

Neuro intact between attacks.

Laboratory Results:

No acute lab abnormality.


What is the most likely diagnosis?', '["Cluster headache", "Musculoskeletal strain", "Gastroenteritis", "Functional disorder", "Pulmonary embolism"]'::jsonb, 0, 'Short severe unilateral periorbital pain with autonomic symptoms = cluster.'),
    (v_topic_id, 'A 60-year-old female has acute monoarticular knee pain; joint warm and swollen.

Physical Examination:

No skin tophi.

Laboratory Results:

Synovial fluid: Needle-shaped negatively birefringent crystals.


What is the most likely diagnosis?', '["Medication side effect", "Normal variant", "Functional pain syndrome", "Acute gout", "Anxiety disorder"]'::jsonb, 3, 'Clinical pattern matches Acute gout.'),
    (v_topic_id, 'A 25-year-old male has microcytic anemia and occult blood positive stool.

Physical Examination:

No weight loss yet.

Laboratory Results:

Hgb 9.2 g/dL.


Which diagnostic evaluation is most appropriate?', '["Abdominal ultrasound only", "Colonoscopy", "Empiric iron without evaluation", "Repeat CBC in 1 year", "Bone marrow biopsy"]'::jsonb, 1, 'Positive occult blood with anemia requires colonoscopy to exclude malignancy.'),
    (v_topic_id, 'A 61-year-old male is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "\u03b22-adrenergic bronchodilation", "Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 81-year-old female presents with epigastric pain.

Physical Examination:

Urea breath test positive

Laboratory Results:

Key finding: Triple therapy.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Conversion disorder", "Peptic ulcer H pylori", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Peptic ulcer H pylori.'),
    (v_topic_id, 'A 60-year-old female with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Bile acid sequestration in gut", "Niacin receptor agonism", "Inhibition of lipoprotein lipase", "Competitive inhibition of HMG-CoA reductase", "PCSK9 gene deletion"]'::jsonb, 3, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 35-year-old female presents with pain out of proportion tense.

Physical Examination:

High compartment pressures

Laboratory Results:

Key finding: Fasciotomy.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Compartment syndrome", "Normal variant", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Compartment syndrome.'),
    (v_topic_id, 'A 48-year-old male presents with heartburn postprandial.

Physical Examination:

Normal EGD mild esophagitis

Laboratory Results:

Key finding: PPI lifestyle.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder", "GERD"]'::jsonb, 4, 'Presentation consistent with GERD.'),
    (v_topic_id, 'A 39-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 4).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 66-year-old female has suspected PID.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Pelvic exam with NAAT for gonorrhea/chlamydia", "PET scan screening", "No testing indicated", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: Pelvic exam with NAAT for gonorrhea/chlamydia.'),
    (v_topic_id, 'A 43-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 15).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "Case-fatality rate reported", "No association", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 37-year-old female is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["\u03bc-opioid receptor agonism", "Unknown mechanism", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 60-year-old male presents with tachy with delta wave.

Physical Examination:

Short PR, delta

Laboratory Results:

Key finding: Avoid AV nodal blockers in preexcited AF.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Wolff-Parkinson-White", "Functional disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Wolff-Parkinson-White.'),
    (v_topic_id, 'A 69-year-old female is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Venodilation reducing preload", "Direct DNA replication block only"]'::jsonb, 3, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 28-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Placebo effect only", "Hormone supplementation only", "GABA-A receptor positive allosteric modulation", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 47-year-old female clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Guarantee cure", "Use SPIKES framework; assess understanding first", "Dismiss patient concerns", "Transfer without handoff"]'::jsonb, 2, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 57-year-old male has suspected acute hepatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "Hepatitis serologies and liver synthetic panel"]'::jsonb, 4, 'Appropriate initial study: Hepatitis serologies and liver synthetic panel.'),
    (v_topic_id, 'A 38-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 7).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Study proves mechanism", "Exposure protective", "Case-fatality rate reported", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 59-year-old male clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Guarantee cure", "Avoid discussion", "Dismiss patient concerns", "Explore barriers; shared decision-making"]'::jsonb, 4, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 30-year-old female has suspected acute compartment syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "No testing indicated", "Compartment pressure measurement"]'::jsonb, 4, 'Appropriate initial study: Compartment pressure measurement.'),
    (v_topic_id, 'A 31-year-old male has suspected testicular cancer mass.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Scrotal ultrasound and tumor markers", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Scrotal ultrasound and tumor markers.'),
    (v_topic_id, 'A 38-year-old female presents with knee pain worse stairs.

Physical Examination:

Osteophytes

Laboratory Results:

Key finding: Weight loss PT NSAIDs.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Medication adverse effect", "Osteoarthritis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Osteoarthritis.'),
    (v_topic_id, 'A 39-year-old male with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Reduction of airway inflammation", "Pulmonary vasodilation only", "Paralysis of respiratory muscles", "Immediate bronchodilation via \u03b22 agonism", "Increased mucus production"]'::jsonb, 0, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 52-year-old female has acute monocular painless vision loss that began 2 hours ago.

Physical Examination:

Vitals: BP 168/94.

Eye: Afferent pupillary defect on affected side; fundoscopy difficult.

Laboratory Results:

ESR 68 mm/h | CRP elevated | No retinal detachment on bedside exam.


What is the most likely diagnosis?', '["Migraine aura", "Acute angle-closure glaucoma", "Central retinal artery occlusion", "Vitreous hemorrhage", "Optic neuritis"]'::jsonb, 2, 'Painless monocular vision loss with RAPD in older patient suggests CRAO; giant cell arteritis risk.'),
    (v_topic_id, 'A 63-year-old male has suspected temporal arteritis vision symptoms.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Temporal artery biopsy after steroids if vision threatened", "No further testing; observe", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis"]'::jsonb, 0, 'For Suspected temporal arteritis vision symptoms, Temporal artery biopsy after steroids if vision threatened is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 77-year-old male is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Potentiation of antithrombin III", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 36-year-old female a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Obtain psychiatric hold", "Transfuse emergently regardless", "Honor refusal; optimize nonblood alternatives", "Sedate and transfuse", "Call security"]'::jsonb, 2, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 74-year-old male presents with heliotrope rash weakness.

Physical Examination:

Gottron papules

Laboratory Results:

Key finding: Cancer screening.


What is the most likely diagnosis?', '["Dermatomyositis", "Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Dermatomyositis.'),
    (v_topic_id, 'A 78-year-old male presents with fever, retro-orbital pain, travel.

Physical Examination:

NS1 antigen positive

Laboratory Results:

Key finding: Supportive; avoid NSAIDs if warning signs.


What is the most likely diagnosis?', '["Dengue", "Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Dengue.'),
    (v_topic_id, 'A 51-year-old male has suspected acute pancreatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "No testing indicated", "Lipase and triglycerides; CT if severe or uncertain"]'::jsonb, 4, 'Appropriate initial study: Lipase and triglycerides; CT if severe or uncertain.'),
    (v_topic_id, 'A 42-year-old female presents with paroxysmal HTN headache.

Physical Examination:

Metanephrines elevated

Laboratory Results:

Key finding: Alpha then beta blockade.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Pheochromocytoma", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Pheochromocytoma.'),
    (v_topic_id, 'A 31-year-old male has acute headache with papilledema on exam.

Physical Examination:

Vitals: BP 190/110.

Laboratory Results:

CT head without contrast: No mass bleed.


Which study should be performed next?', '["Immediate carotid endarterectomy", "Lumbar puncture after imaging", "EEG", "No LP; discharge", "Orbital ultrasound"]'::jsonb, 1, 'Suspected meningitis/SAH with negative CT may still need LP if clinically indicated (follow local protocols).'),
    (v_topic_id, 'A 78-year-old female has suspected subarachnoid hemorrhage negative ct.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Lumbar puncture for xanthochromia", "PET scan whole body", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected subarachnoid hemorrhage negative CT, Lumbar puncture for xanthochromia is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 56-year-old female has chronic productive cough and hyperinflation on imaging.

Physical Examination:

Barrel chest.

Laboratory Results:

PFTs: FEV1/FVC 0.62, reduced FEV1.


What is the most likely diagnosis?', '["Anxiety disorder", "Normal variant", "COPD", "Medication side effect", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches COPD.'),
    (v_topic_id, 'A 82-year-old male has suspected interstitial lung disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Empiric treatment without workup", "High-resolution CT chest", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: High-resolution CT chest.'),
    (v_topic_id, 'A 77-year-old female has suspected acute ischemic stroke.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Noncontrast CT then CTA if thrombectomy considered", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Noncontrast CT then CTA if thrombectomy considered.'),
    (v_topic_id, 'A 59-year-old male has suspected lung cancer mass.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "CT chest with tissue biopsy plan", "No further testing; observe"]'::jsonb, 3, 'For Suspected lung cancer mass, CT chest with tissue biopsy plan is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 65-year-old female presents with nephrolithiasis normal anion gap acidosis.

Physical Examination:

Urine pH high

Laboratory Results:

Key finding: Alkali replacement.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Medication adverse effect", "Functional disorder", "RTA type 1"]'::jsonb, 4, 'Presentation consistent with RTA type 1.'),
    (v_topic_id, 'A 74-year-old female with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Paralysis of respiratory muscles", "Pulmonary vasodilation only", "Reduction of airway inflammation", "Increased mucus production", "Immediate bronchodilation via \u03b22 agonism"]'::jsonb, 2, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 58-year-old female has suspected pulmonary embolism; Wells score moderate.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

D-dimer elevated.


Which test confirms the diagnosis?', '["ABG alone", "Lower extremity duplex only", "Ventilation-perfusion scan as first test in all patients", "CT pulmonary angiography", "Chest X-ray alone"]'::jsonb, 3, 'CTPA is standard confirmatory test for PE when renal function allows.'),
    (v_topic_id, 'A 56-year-old female infant has paroxysmal cough followed by whoop.

Physical Examination:

No fever.

Laboratory Results:

WBC lymphocytosis.


What is the most likely diagnosis?', '["Anxiety disorder", "Normal variant", "Pertussis", "Medication side effect", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches Pertussis.'),
    (v_topic_id, 'A 37-year-old male presents with headache jaw claudication.

Physical Examination:

ESR high

Laboratory Results:

Key finding: High-dose steroids.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Temporal arteritis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Temporal arteritis.'),
    (v_topic_id, 'A 66-year-old male is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Unknown mechanism", "Venodilation reducing preload", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 68-year-old male presents with polyuria hypernatremia.

Physical Examination:

Low urine osm

Laboratory Results:

Key finding: Desmopressin.


What is the most likely diagnosis?', '["Diabetes insipidus central", "Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Diabetes insipidus central.'),
    (v_topic_id, 'A 54-year-old male presents with profound hyperosmolarity.

Physical Examination:

Minimal ketosis

Laboratory Results:

Key finding: Slow fluids insulin.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Functional disorder", "HHNK", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with HHNK.'),
    (v_topic_id, 'A 60-year-old female has chronic cough, weight loss, and hemoptysis; 40 pack-year smoking history.

Physical Examination:

Lungs: Decreased breath sounds right upper lobe.

Laboratory Results:

Chest CT: Spiculated 3-cm right upper lobe mass.


What is the most likely diagnosis?', '["Pulmonary embolism", "Musculoskeletal strain", "Lung cancer", "Functional disorder", "Gastroenteritis"]'::jsonb, 2, 'Smoker with hemoptysis and spiculated mass — lung cancer until proven otherwise.'),
    (v_topic_id, 'A 63-year-old male a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Report to child protective services", "Refuse all care until 18", "Mandatory parental notification always", "Provide confidential care per mature minor laws", "Obtain court order first"]'::jsonb, 3, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 55-year-old female with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["SGLT2-mediated glucosuria only", "DPP-4 inhibition", "Stimulation of insulin secretion from \u03b2 cells", "\u03b1-glucosidase inhibition", "Decreased hepatic gluconeogenesis"]'::jsonb, 4, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 71-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Study proves mechanism", "No association", "Exposure protective"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 51-year-old male child has barking cough and stridor at rest.

Physical Examination:

Inspiratory stridor.

Laboratory Results:

AP neck X-ray: Steeple sign.


What is the most likely diagnosis?', '["Functional pain syndrome", "Anxiety disorder", "Croup", "Medication side effect", "Normal variant"]'::jsonb, 2, 'Clinical pattern matches Croup.'),
    (v_topic_id, 'A 38-year-old female has suspected cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Genetic panel first", "No further testing; observe", "PET scan whole body", "Right upper quadrant ultrasound"]'::jsonb, 4, 'For Suspected cholecystitis, Right upper quadrant ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 40-year-old male presents with UC association.

Physical Examination:

Beaded bile ducts

Laboratory Results:

Key finding: Surveillance cholangiocarcinoma.


What is the most likely diagnosis?', '["Functional disorder", "Primary sclerosing cholangitis", "Medication adverse effect", "Normal variant", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with Primary sclerosing cholangitis.'),
    (v_topic_id, 'A 55-year-old female presents with night sweats, weight loss.

Physical Examination:

AFB positive

Laboratory Results:

Key finding: RIPE therapy.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Medication adverse effect", "Tuberculosis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Tuberculosis.'),
    (v_topic_id, 'A 33-year-old female is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "\u03b22-adrenergic bronchodilation", "Unknown mechanism", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 59-year-old male presents with family history hypertension.

Physical Examination:

Multiple cysts

Laboratory Results:

Key finding: BP control tolvaptan select cases.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Normal variant", "Polycystic kidney disease", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Polycystic kidney disease.'),
    (v_topic_id, 'A 37-year-old female presents with RLQ pain migration.

Physical Examination:

CT appendiceal dilation

Laboratory Results:

Key finding: Appendectomy.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Appendicitis"]'::jsonb, 4, 'Presentation consistent with Appendicitis.'),
    (v_topic_id, 'A 50-year-old male is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Inhibition of L-type calcium channels in vascular smooth muscle", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 2, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 67-year-old female has acute right flank pain radiating to the groin with nausea and vomiting.

Physical Examination:

Vitals: HR 98 | BP 148/92.

Abdomen: Right CVA tenderness; no peritoneal signs.

Laboratory Results:

Urinalysis: Gross hematuria | Noncontrast CT: 6-mm calculus at ureterovesical junction with hydronephrosis.


What is the most likely diagnosis?', '["Acute appendicitis", "Pyelonephritis", "Abdominal aortic aneurysm rupture", "Ectopic pregnancy", "Ureteral nephrolithiasis"]'::jsonb, 4, 'Colicky flank pain, hematuria, and obstructing ureteral stone on CT define nephrolithiasis.'),
    (v_topic_id, 'A 28-year-old male is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Direct DNA replication block only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 79-year-old female has fever, rash on palms/soles, and generalized lymphadenopathy.

Physical Examination:

Chancre healed.

Laboratory Results:

RPR positive.


What is the most likely diagnosis?', '["Normal variant", "Anxiety disorder", "Functional pain syndrome", "Medication side effect", "Secondary syphilis"]'::jsonb, 4, 'Clinical pattern matches Secondary syphilis.'),
    (v_topic_id, 'A 49-year-old male has suspected acute mesenteric ischemia.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "PET scan whole body", "No further testing; observe", "Genetic panel first", "CT angiography abdomen"]'::jsonb, 4, 'For Suspected acute mesenteric ischemia, CT angiography abdomen is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 52-year-old male has fatigue, easy bruising, and gum bleeding for 2 weeks.

Physical Examination:

Vitals: HR 96 | BP 118/74.

HEENT: Petechiae on palate. No lymphadenopathy.

Laboratory Results:

CBC: WBC 18,000 (blasts 42%) | Platelets 18,000 | Hgb 7.8 g/dL.


What is the most likely diagnosis?', '["Aplastic anemia", "Iron deficiency anemia", "DIC from sepsis", "ITP", "Acute leukemia"]'::jsonb, 4, 'Cytopenias with circulating blasts indicate acute leukemia.'),
    (v_topic_id, 'A 82-year-old male has suspected ectopic pregnancy.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Transvaginal pelvic ultrasound with \u03b2-hCG", "PET scan whole body", "No further testing; observe", "Empiric treatment without diagnosis", "Genetic panel first"]'::jsonb, 0, 'For Suspected ectopic pregnancy, Transvaginal pelvic ultrasound with β-hCG is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 47-year-old female lead-time bias is a concern in which situation?

Physical Examination:

N/A

Laboratory Results:

N/A


Early detection appears to prolong survival without changing disease course because:', '["Treatment is more effective", "Diagnosis is made earlier without altering time of death", "Prevalence decreases", "Specificity improves", "Randomization failed"]'::jsonb, 1, 'Lead-time bias inflates apparent survival by earlier diagnosis only.'),
    (v_topic_id, 'A 61-year-old female presents with palpitations paresthesias.

Physical Examination:

Normal vitals labs

Laboratory Results:

Key finding: Reassurance CBT SSRI.


What is the most likely diagnosis?', '["Panic attack", "Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Panic attack.'),
    (v_topic_id, 'A 41-year-old male has 2 weeks of depressed mood, insomnia, and guilt with suicidal ideation.

Physical Examination:

Psychomotor retardation.

Laboratory Results:

TSH normal.


What is the most likely diagnosis?', '["Anxiety disorder", "Major depressive episode", "Normal variant", "Functional pain syndrome", "Medication side effect"]'::jsonb, 1, 'Clinical pattern matches Major depressive episode.'),
    (v_topic_id, 'A 56-year-old female presents with postpartum failure to lactate.

Physical Examination:

Low pituitary hormones

Laboratory Results:

Key finding: Hormone replacement.


What is the most likely diagnosis?', '["Sheehan syndrome", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Sheehan syndrome.'),
    (v_topic_id, 'A 38-year-old male clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Transfer without handoff", "Acknowledge emotion, apologize for delay, clarify plan", "Guarantee cure", "Avoid discussion"]'::jsonb, 2, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 75-year-old female a trial reports RR 0.72 for death with Drug X vs placebo (95% CI 0.55–0.94).

Physical Examination:

N/A

Laboratory Results:

N/A


Which conclusion is most appropriate?', '["No association", "Drug X is associated with lower mortality", "Drug X increases mortality", "Study is case-control", "CI proves causation individually"]'::jsonb, 1, 'RR <1 with CI excluding 1 suggests lower event rate with treatment.'),
    (v_topic_id, 'A 47-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 2).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "Study proves mechanism", "Exposure protective"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 41-year-old female has suspected biliary obstruction.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "RUQ ultrasound first", "Genetic panel first", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected biliary obstruction, RUQ ultrasound first is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 82-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association", "Exposure protective"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 34-year-old male presents with jaundice, high ALT.

Physical Examination:

IgM anti-HBc

Laboratory Results:

Key finding: Supportive.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Functional disorder", "Normal variant", "Hepatitis B acute"]'::jsonb, 4, 'Presentation consistent with Hepatitis B acute.'),
    (v_topic_id, 'A 52-year-old female presents with macrocytic neuropathy.

Physical Examination:

Low B12 methylmalonic high

Laboratory Results:

Key finding: B12 replacement.


What is the most likely diagnosis?', '["B12 deficiency", "Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with B12 deficiency.'),
    (v_topic_id, 'A 61-year-old male clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Apologize, explain, commit to prevention", "Dismiss patient concerns", "Avoid discussion", "Guarantee cure"]'::jsonb, 1, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 68-year-old male clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Use SPIKES framework; assess understanding first", "Transfer without handoff", "Guarantee cure", "Avoid discussion"]'::jsonb, 1, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 58-year-old female presents with sinusitis hemoptysis.

Physical Examination:

c-ANCA PR3

Laboratory Results:

Key finding: Cyclophosphamide rituximab.


What is the most likely diagnosis?', '["Vasculitis GPA", "Medication adverse effect", "Normal variant", "Functional disorder", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Vasculitis GPA.'),
    (v_topic_id, 'A 76-year-old male presents with nail pitting dactylitis.

Physical Examination:

Skin psoriasis

Laboratory Results:

Key finding: DMARD biologic.


What is the most likely diagnosis?', '["Psoriatic arthritis", "Medication adverse effect", "Normal variant", "Functional disorder", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Psoriatic arthritis.'),
    (v_topic_id, 'A 79-year-old male has suspected aortic dissection.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Genetic panel first", "CT angiography chest/abdomen/pelvis", "PET scan whole body", "No further testing; observe"]'::jsonb, 2, 'For Suspected aortic dissection, CT angiography chest/abdomen/pelvis is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 24-year-old male clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Avoid discussion", "Guarantee cure", "Assess immediate safety; provide resources", "Dismiss patient concerns"]'::jsonb, 3, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 84-year-old male an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Wait indefinitely for family", "Withdraw all care immediately", "Use physician personal preference only", "Treat per emergent best-interest standard and seek ethics consult", "Court order required before any treatment"]'::jsonb, 3, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 22-year-old female has suspected pulmonary embolism low risk.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "D-dimer then CTPA if elevated", "PET scan screening", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: D-dimer then CTPA if elevated.'),
    (v_topic_id, 'A 46-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 6).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "No association", "Study proves mechanism", "Case-fatality rate reported", "Exposure protective"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 48-year-old male has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Neutralization of endotoxin", "Inhibition of viral replication enzymes", "Blocking TNF-\u03b1 only", "Stimulation of host IgM only", "Increasing hepatic blood flow"]'::jsonb, 1, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 65-year-old female presents with fasciculations progression.

Physical Examination:

UMN and LMN signs

Laboratory Results:

Key finding: Supportive riluzole.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Normal variant", "ALS"]'::jsonb, 4, 'Presentation consistent with ALS.'),
    (v_topic_id, 'A 25-year-old male presents with coarse features.

Physical Examination:

IGF-1 high

Laboratory Results:

Key finding: Somatostatin analog surgery.


What is the most likely diagnosis?', '["Acromegaly", "Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Acromegaly.'),
    (v_topic_id, 'A 68-year-old female clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Acknowledge emotion, apologize for delay, clarify plan", "Transfer without handoff", "Dismiss patient concerns", "Avoid discussion", "Guarantee cure"]'::jsonb, 0, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 24-year-old female is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["GABA-A receptor positive allosteric modulation", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 0, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 44-year-old male is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Microtubule disruption inhibiting neutrophil chemotaxis", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 32-year-old male presents with hematuria flank mass.

Physical Examination:

Renal mass on CT

Laboratory Results:

Key finding: Surgical resection.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder", "Renal cell carcinoma"]'::jsonb, 4, 'Presentation consistent with Renal cell carcinoma.'),
    (v_topic_id, 'A 60-year-old male has fever, sore throat, and a diffuse sandpaper-like rash for 2 days.

Physical Examination:

Vitals: Temp 101.2°F | HR 100.

Pharynx: Exudative tonsillitis. Skin: Circumoral pallor, accentuated neck folds.

Laboratory Results:

Rapid strep antigen positive | Throat culture pending.


What is the most likely diagnosis?', '["Infectious mononucleosis", "Drug eruption", "Group A streptococcal pharyngitis with scarlet fever", "Measles", "Kawasaki disease"]'::jsonb, 2, 'Exudative pharyngitis with sandpaper rash and positive rapid strep indicate strep/scarlet fever.'),
    (v_topic_id, 'A 37-year-old male has suspected celiac disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "PET scan screening", "No testing indicated", "Exome sequencing first", "IgA anti-tissue transglutaminase and total IgA"]'::jsonb, 4, 'Appropriate initial study: IgA anti-tissue transglutaminase and total IgA.'),
    (v_topic_id, 'A 44-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 9).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "Case-fatality rate reported", "No association", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 65-year-old female has suspected adrenal incidentaloma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT adrenal protocol or MRI", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 0, 'For Suspected adrenal incidentaloma, CT adrenal protocol or MRI is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 77-year-old male has suspected carotid stenosis bruit.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Genetic panel first", "PET scan whole body", "Carotid duplex ultrasound", "Empiric treatment without diagnosis"]'::jsonb, 3, 'For Suspected carotid stenosis bruit, Carotid duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 55-year-old female is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Inhibition of dihydrofolate reductase", "Direct DNA replication block only", "Placebo effect only", "Unknown mechanism"]'::jsonb, 1, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 24-year-old male has suspected multiple sclerosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "MRI brain and spine with contrast", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: MRI brain and spine with contrast.'),
    (v_topic_id, 'A 70-year-old female with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Arterial vasoconstriction", "Sodium retention", "Inhibition of angiotensin II\u2013mediated remodeling", "Increased preload", "Positive inotropy"]'::jsonb, 2, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 53-year-old female has suspected community-acquired pneumonia outpatient.

Physical Examination:

CURB-65 score 0.

Laboratory Results:

No prior antibiotics.


Which test is most appropriate at initial visit?', '["CT chest for all outpatients", "Chest X-ray", "Sputum culture for all", "No imaging needed", "Bronchoscopy"]'::jsonb, 1, 'CXR confirms infiltrate and guides management in suspected CAP.'),
    (v_topic_id, 'A 23-year-old female has flank pain, hematuria, and hypertension in young adult.

Physical Examination:

Abdominal bruit.

Laboratory Results:

Renal artery stenosis on Doppler.


What is the most likely diagnosis?', '["Functional pain syndrome", "Normal variant", "Anxiety disorder", "Medication side effect", "Fibromuscular dysplasia"]'::jsonb, 4, 'Clinical pattern matches Fibromuscular dysplasia.'),
    (v_topic_id, 'A 25-year-old female clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Transfer without handoff", "Avoid discussion", "Discuss values before procedure menu"]'::jsonb, 4, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 67-year-old male an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Treat per emergent best-interest standard and seek ethics consult", "Use physician personal preference only", "Wait indefinitely for family", "Withdraw all care immediately", "Court order required before any treatment"]'::jsonb, 0, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 40-year-old female has suspected pneumothorax trauma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Chest X-ray or bedside ultrasound", "Genetic panel first", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected pneumothorax trauma, Chest X-ray or bedside ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 82-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 11).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "Exposure protective", "No association"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 67-year-old female has fever, dysuria, and suprapubic pain for 2 days.

Physical Examination:

CVA tenderness absent.

Laboratory Results:

UA: Nitrites positive, WBC 50/hpf.


What is the most likely diagnosis?', '["Gastroenteritis", "Acute uncomplicated cystitis", "Pulmonary embolism", "Functional disorder", "Musculoskeletal strain"]'::jsonb, 1, 'Dysuria, suprapubic pain, positive nitrites = UTI.'),
    (v_topic_id, 'A 36-year-old female has suspected pleural effusion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "PET scan screening", "Thoracentesis with fluid studies"]'::jsonb, 4, 'Appropriate initial study: Thoracentesis with fluid studies.'),
    (v_topic_id, 'A 23-year-old male presents with mediastinal mass night sweats.

Physical Examination:

Reed-Sternberg

Laboratory Results:

Key finding: ABVD.


What is the most likely diagnosis?', '["Hodgkin lymphoma", "Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Hodgkin lymphoma.'),
    (v_topic_id, 'A 79-year-old female has suspected acute cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["HIDA scan if US equivocal", "Empiric treatment without diagnosis", "PET scan whole body", "No further testing; observe", "Genetic panel first"]'::jsonb, 0, 'For Suspected acute cholecystitis, HIDA scan if US equivocal is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 59-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 11).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "No association"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 25-year-old male clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Transfer without handoff", "Discuss values before procedure menu", "Guarantee cure", "Avoid discussion"]'::jsonb, 2, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 32-year-old female has acute chest pain; troponin pending.

Physical Examination:

Vitals stable.

Lungs clear.

Laboratory Results:

ECG: Nonspecific ST changes.


Which initial diagnostic study is most appropriate to evaluate for acute coronary syndrome?', '["Echocardiography only", "12-lead ECG and serial troponins", "Coronary CT angiography first", "Exercise stress test now", "No testing; reassurance"]'::jsonb, 1, 'ACS evaluation requires ECG and serial troponins in the ED.'),
    (v_topic_id, 'A 34-year-old male has suspected deep vein thrombosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "PET scan screening", "Empiric treatment without workup", "Compression ultrasonography of extremity"]'::jsonb, 4, 'Appropriate initial study: Compression ultrasonography of extremity.'),
    (v_topic_id, 'A 73-year-old male clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Use professional interpreter, not child", "Dismiss patient concerns", "Avoid discussion", "Transfer without handoff", "Guarantee cure"]'::jsonb, 0, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 46-year-old male presents with widespread pain tender points.

Physical Examination:

Normal labs

Laboratory Results:

Key finding: Exercise SNRI.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Fibromyalgia", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Fibromyalgia.'),
    (v_topic_id, 'A 61-year-old male is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Facilitated glucose uptake and suppression of ketogenesis", "Unknown mechanism", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 63-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 12).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Exposure associated with higher risk of outcome", "No association", "Case-fatality rate reported", "Study proves mechanism"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 81-year-old female has new-onset ascites and suspected cirrhosis.

Physical Examination:

Shifting dullness present.

Laboratory Results:

No prior imaging.


Which study is most appropriate as the next diagnostic step?', '["Serum ammonia alone", "Immediate liver transplant referral without workup", "Diagnostic paracentesis", "CT abdomen only", "Upper endoscopy before any fluid studies"]'::jsonb, 2, 'New ascites requires diagnostic paracentesis to assess for SBP and etiology.');
END $$;
COMMIT;
