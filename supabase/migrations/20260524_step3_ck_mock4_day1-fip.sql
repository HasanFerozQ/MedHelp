-- Step 3 Mock #4 day1-fip — 240 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock4-day1-fip' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock4-day1-fip missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 61-year-old female has RUQ pain after fatty meal with positive Murphy sign.

Physical Examination:

Fever mild.

Laboratory Results:

US: Gallstones, gallbladder wall thickening.


What is the most likely diagnosis?', '["Functional pain syndrome", "Medication side effect", "Normal variant", "Anxiety disorder", "Acute cholecystitis"]'::jsonb, 4, 'Clinical pattern matches Acute cholecystitis.'),
    (v_topic_id, 'A 30-year-old male has suspected nephrotic syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Urinalysis, protein quantification, renal ultrasound", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Urinalysis, protein quantification, renal ultrasound.'),
    (v_topic_id, 'A 57-year-old male has first unprovoked generalized seizure.

Physical Examination:

Neuro exam normal postictally.

Laboratory Results:

Noncontrast CT head: No bleed.


Which study is most appropriate next?', '["No further imaging", "MRI brain", "EEG during active seizure only", "Lumbar puncture immediately", "Carotid duplex only"]'::jsonb, 1, 'First unprovoked seizure in adult warrants MRI to exclude structural lesion.'),
    (v_topic_id, 'A 58-year-old male has suspected cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "PET scan whole body", "Right upper quadrant ultrasound", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 2, 'For Suspected cholecystitis, Right upper quadrant ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 31-year-old male is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Venodilation reducing preload", "Placebo effect only", "Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 46-year-old male has acute unilateral facial droop and inability to close one eye.

Physical Examination:

Forehead involvement on affected side.

Laboratory Results:

Noncontrast CT head: No hemorrhage.


What is the most likely diagnosis?', '["Musculoskeletal strain", "Gastroenteritis", "Pulmonary embolism", "Functional disorder", "Bell palsy"]'::jsonb, 4, 'Peripheral VII palsy with forehead involvement, negative CT — Bell palsy.'),
    (v_topic_id, 'A 33-year-old male clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Acknowledge emotion, apologize for delay, clarify plan", "Transfer without handoff", "Avoid discussion", "Dismiss patient concerns", "Guarantee cure"]'::jsonb, 0, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 38-year-old male presents with urethritis arthritis conjunctivitis.

Physical Examination:

Post Chlamydia

Laboratory Results:

Key finding: NSAIDs treat infection.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Reactive arthritis", "Conversion disorder", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Reactive arthritis.'),
    (v_topic_id, 'A 48-year-old female has progressive painless jaundice and 5-kg weight loss over 2 months.

Physical Examination:

Vitals: Temp 98.6°F | HR 88 | BP 132/78.

Abdomen: Palpable, nontender gallbladder. No ascites.

Laboratory Results:

Total bilirubin 9.2 mg/dL (direct predominant) | CT abdomen: Mass at pancreatic head with biliary dilation.


What is the most likely diagnosis?', '["Acute cholecystitis", "Hemolytic anemia", "Gilbert syndrome", "Pancreatic head adenocarcinoma", "Viral hepatitis A"]'::jsonb, 3, 'Painless jaundice, Courvoisier sign, and pancreatic head mass suggest pancreatic cancer.'),
    (v_topic_id, 'A 63-year-old female clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Assess immediate safety; provide resources", "Dismiss patient concerns", "Transfer without handoff", "Guarantee cure"]'::jsonb, 1, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 78-year-old female has suspected subdural hematoma elderly fall.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "PET scan screening", "Empiric treatment without workup", "Noncontrast head CT", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: Noncontrast head CT.'),
    (v_topic_id, 'A 42-year-old male with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Competitive inhibition of HMG-CoA reductase", "PCSK9 gene deletion", "Bile acid sequestration in gut", "Niacin receptor agonism", "Inhibition of lipoprotein lipase"]'::jsonb, 0, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 84-year-old female presents with fever on central line.

Physical Examination:

Blood yeast

Laboratory Results:

Key finding: Echinocandin.


What is the most likely diagnosis?', '["Medication adverse effect", "Candidemia", "Functional disorder", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Candidemia.'),
    (v_topic_id, 'A 77-year-old female has acute vertigo, nausea, and unidirectional nystagmus for 2 days.

Physical Examination:

Neuro: No other focal signs.

Laboratory Results:

Head CT: No acute stroke.


What is the most likely diagnosis?', '["Musculoskeletal strain", "Gastroenteritis", "Pulmonary embolism", "Functional disorder", "Vestibular neuritis"]'::jsonb, 4, 'Continuous vertigo, positive head impulse, no focal deficits = vestibular neuritis.'),
    (v_topic_id, 'A 27-year-old female clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Use professional interpreter, not child", "Transfer without handoff", "Guarantee cure", "Dismiss patient concerns", "Avoid discussion"]'::jsonb, 0, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 41-year-old female clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Transfer without handoff", "Dismiss patient concerns", "Discuss values before procedure menu", "Avoid discussion"]'::jsonb, 3, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 69-year-old male has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Stimulation of host IgM only", "Neutralization of endotoxin", "Inhibition of viral replication enzymes", "Increasing hepatic blood flow", "Blocking TNF-\u03b1 only"]'::jsonb, 2, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 22-year-old male clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Transfer without handoff", "Use professional interpreter, not child"]'::jsonb, 4, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 25-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Exposure protective", "No association", "Case-fatality rate reported", "Study proves mechanism"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 27-year-old female presents with cola urine hypertension.

Physical Examination:

RBC casts

Laboratory Results:

Key finding: Post-strep GN workup.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Functional disorder", "Nephritic syndrome", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Nephritic syndrome.'),
    (v_topic_id, 'A 44-year-old male is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Direct DNA replication block only", "Irreversible inhibition of H+/K+ ATPase", "Hormone supplementation only"]'::jsonb, 3, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 26-year-old female has suspected acute mesenteric ischemia.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "Empiric treatment without diagnosis", "No further testing; observe", "CT angiography abdomen"]'::jsonb, 4, 'For Suspected acute mesenteric ischemia, CT angiography abdomen is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 41-year-old female has suspected RPGN.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "ANCA, anti-GBM, complement, urgent renal biopsy", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: ANCA, anti-GBM, complement, urgent renal biopsy.'),
    (v_topic_id, 'A 49-year-old female a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Transfuse emergently regardless", "Honor refusal; optimize nonblood alternatives", "Sedate and transfuse", "Call security", "Obtain psychiatric hold"]'::jsonb, 1, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 26-year-old male with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["\u03b1-glucosidase inhibition", "DPP-4 inhibition", "SGLT2-mediated glucosuria only", "Decreased hepatic gluconeogenesis", "Stimulation of insulin secretion from \u03b2 cells"]'::jsonb, 3, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 23-year-old female has chronic cough, weight loss, and hemoptysis; 40 pack-year smoking history.

Physical Examination:

Lungs: Decreased breath sounds right upper lobe.

Laboratory Results:

Chest CT: Spiculated 3-cm right upper lobe mass.


What is the most likely diagnosis?', '["Gastroenteritis", "Pulmonary embolism", "Functional disorder", "Musculoskeletal strain", "Lung cancer"]'::jsonb, 4, 'Smoker with hemoptysis and spiculated mass — lung cancer until proven otherwise.'),
    (v_topic_id, 'A 46-year-old male presents with fever post pneumonia.

Physical Examination:

Pleural pH low, glucose low

Laboratory Results:

Key finding: Chest tube + antibiotics.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Empyema", "Conversion disorder", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Empyema.'),
    (v_topic_id, 'A 60-year-old female has bloody diarrhea, abdominal cramps, and tenesmus for 5 days.

Physical Examination:

Vitals: Temp 100.8°F | HR 102 | BP 110/70.

Abdomen: Diffuse tenderness, no rebound.

Laboratory Results:

Stool culture: Shiga toxin–producing organism detected.


What is the most likely diagnosis?', '["Ischemic colitis", "Irritable bowel syndrome", "Ulcerative colitis flare", "C. difficile colitis", "Shiga toxin E. coli colitis"]'::jsonb, 4, 'Acute bloody diarrhea with STEC on culture indicates infectious colitis (watch HUS).'),
    (v_topic_id, 'A 36-year-old female presents with bone pain fever.

Physical Examination:

MRI edema

Laboratory Results:

Key finding: Prolonged antibiotics.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Normal variant", "Medication adverse effect", "Osteomyelitis"]'::jsonb, 4, 'Presentation consistent with Osteomyelitis.'),
    (v_topic_id, 'A 67-year-old male has fatigue, constipation, and cold intolerance.

Physical Examination:

Bradycardia, delayed reflexes.

Laboratory Results:

TSH 18, low free T4.


What is the most likely diagnosis?', '["Primary hypothyroidism", "Anxiety disorder", "Normal variant", "Functional pain syndrome", "Medication side effect"]'::jsonb, 0, 'Clinical pattern matches Primary hypothyroidism.'),
    (v_topic_id, 'A 67-year-old male has suspected myasthenia gravis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Acetylcholine receptor antibodies and edrophonium/EMG", "Empiric treatment without workup", "PET scan screening", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Acetylcholine receptor antibodies and edrophonium/EMG.'),
    (v_topic_id, 'A 38-year-old male presents with INR 3.2.

Physical Examination:

High APAP level

Laboratory Results:

Key finding: NAC transplant eval.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "Functional disorder", "Medication adverse effect", "Acute liver failure acetaminophen"]'::jsonb, 4, 'Presentation consistent with Acute liver failure acetaminophen.'),
    (v_topic_id, 'A 41-year-old female presents with hemoptysis, cavitation.

Physical Examination:

Galactomannan elevated

Laboratory Results:

Key finding: Voriconazole.


What is the most likely diagnosis?', '["Aspergillosis neutropenic", "Medication adverse effect", "Conversion disorder", "Functional disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Aspergillosis neutropenic.'),
    (v_topic_id, 'A 54-year-old female presents with salivation miosis.

Physical Examination:

Low cholinesterase

Laboratory Results:

Key finding: Atropine pralidoxime.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Conversion disorder", "Organophosphate poisoning", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Organophosphate poisoning.'),
    (v_topic_id, 'A 81-year-old female has suspected lung nodule incidental.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Exome sequencing first", "CT chest per Fleischner criteria", "Empiric treatment without workup"]'::jsonb, 3, 'Appropriate initial study: CT chest per Fleischner criteria.'),
    (v_topic_id, 'A 40-year-old male is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "\u03bc-opioid receptor agonism", "Placebo effect only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 47-year-old female has fatigue, easy bruising, and gum bleeding for 2 weeks.

Physical Examination:

Vitals: HR 96 | BP 118/74.

HEENT: Petechiae on palate. No lymphadenopathy.

Laboratory Results:

CBC: WBC 18,000 (blasts 42%) | Platelets 18,000 | Hgb 7.8 g/dL.


What is the most likely diagnosis?', '["Aplastic anemia", "ITP", "Acute leukemia", "DIC from sepsis", "Iron deficiency anemia"]'::jsonb, 2, 'Cytopenias with circulating blasts indicate acute leukemia.'),
    (v_topic_id, 'A 49-year-old male has unexplained iron deficiency anemia.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "No testing indicated", "Esophagogastroduodenoscopy and colonoscopy"]'::jsonb, 4, 'Appropriate initial study: Esophagogastroduodenoscopy and colonoscopy.'),
    (v_topic_id, 'A 58-year-old female is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Selective serotonin reuptake inhibition"]'::jsonb, 4, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 69-year-old female presents with diabetes, bronzing.

Physical Examination:

High ferritin transferrin sat

Laboratory Results:

Key finding: Phlebotomy.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Hemochromatosis", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Hemochromatosis.'),
    (v_topic_id, 'A 45-year-old male a study finds OR 2.4 (p=0.03) for smoking and lung cancer.

Physical Examination:

N/A

Laboratory Results:

N/A


This design is most likely:', '["RCT", "Cohort with relative risk only", "Case-control study", "Case series", "Cross-sectional survey only"]'::jsonb, 2, 'OR is typical effect measure in case-control studies.'),
    (v_topic_id, 'A 30-year-old female has malar rash and photosensitivity with oral ulcers.

Physical Examination:

No arthritis deformity yet.

Laboratory Results:

ANA positive, anti-dsDNA elevated.


What is the most likely diagnosis?', '["Functional pain syndrome", "Systemic lupus erythematosus", "Normal variant", "Medication side effect", "Anxiety disorder"]'::jsonb, 1, 'Clinical pattern matches Systemic lupus erythematosus.'),
    (v_topic_id, 'A 46-year-old male clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Use SPIKES framework; assess understanding first", "Dismiss patient concerns", "Transfer without handoff", "Guarantee cure"]'::jsonb, 1, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 47-year-old female is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "Inhibition of L-type calcium channels in vascular smooth muscle"]'::jsonb, 4, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 24-year-old male presents with erythema nodosum, hilar adenopathy.

Physical Examination:

Noncaseating granulomas

Laboratory Results:

Key finding: Steroids if symptomatic.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Sarcoidosis", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Sarcoidosis.'),
    (v_topic_id, 'A 29-year-old male presents with profound hyperosmolarity.

Physical Examination:

Minimal ketosis

Laboratory Results:

Key finding: Slow fluids insulin.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "HHNK", "Functional disorder", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with HHNK.'),
    (v_topic_id, 'A 31-year-old female has suspected subarachnoid hemorrhage negative ct.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "Lumbar puncture for xanthochromia", "No further testing; observe"]'::jsonb, 3, 'For Suspected subarachnoid hemorrhage negative CT, Lumbar puncture for xanthochromia is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 28-year-old female a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Ignore unless patient harm occurs", "Resign immediately", "Cover shifts indefinitely without report", "Publicly confront on ward", "Report to patient safety/medical staff health per policy"]'::jsonb, 4, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 27-year-old female a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Obtain court order first", "Mandatory parental notification always", "Provide confidential care per mature minor laws", "Report to child protective services", "Refuse all care until 18"]'::jsonb, 2, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 41-year-old male has suspected acute pericarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "ECG, troponin, echocardiography"]'::jsonb, 4, 'Appropriate initial study: ECG, troponin, echocardiography.'),
    (v_topic_id, 'A 51-year-old female has suspected acute ischemic stroke.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Noncontrast CT then CTA if thrombectomy considered", "Empiric treatment without workup", "No testing indicated", "PET scan screening", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: Noncontrast CT then CTA if thrombectomy considered.'),
    (v_topic_id, 'A 46-year-old male has suspected pulmonary embolism; Wells score moderate.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

D-dimer elevated.


Which test confirms the diagnosis?', '["CT pulmonary angiography", "ABG alone", "Ventilation-perfusion scan as first test in all patients", "Chest X-ray alone", "Lower extremity duplex only"]'::jsonb, 0, 'CTPA is standard confirmatory test for PE when renal function allows.'),
    (v_topic_id, 'A 65-year-old female has periorbital edema and frothy urine for 2 weeks.

Physical Examination:

BP 158/96.

Laboratory Results:

UA: 4+ protein, oval fat bodies.


What is the most likely diagnosis?', '["Functional pain syndrome", "Normal variant", "Medication side effect", "Anxiety disorder", "Nephrotic syndrome"]'::jsonb, 4, 'Clinical pattern matches Nephrotic syndrome.'),
    (v_topic_id, 'A 26-year-old male clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Transfer without handoff", "Avoid discussion", "Discuss values before procedure menu", "Dismiss patient concerns"]'::jsonb, 3, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 53-year-old female has resting tremor, rigidity, and shuffling gait.

Physical Examination:

Masked facies.

Laboratory Results:

No acute CT findings.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Medication side effect", "Parkinson disease", "Normal variant"]'::jsonb, 3, 'Clinical pattern matches Parkinson disease.'),
    (v_topic_id, 'A 76-year-old male is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Inhibition of L-type calcium channels in vascular smooth muscle", "Direct DNA replication block only", "Placebo effect only", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 41-year-old male presents with asbestos exposure pleural mass.

Physical Examination:

Pleural thickening

Laboratory Results:

Key finding: Oncology referral.


What is the most likely diagnosis?', '["Normal variant", "Mesothelioma", "Medication adverse effect", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Mesothelioma.'),
    (v_topic_id, 'A 24-year-old male has suspected acute hepatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "PET scan screening", "No testing indicated", "Empiric treatment without workup", "Hepatitis serologies and liver synthetic panel"]'::jsonb, 4, 'Appropriate initial study: Hepatitis serologies and liver synthetic panel.'),
    (v_topic_id, 'A 58-year-old male has suspected temporal arteritis vision symptoms.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "Temporal artery biopsy after steroids if vision threatened", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 2, 'For Suspected temporal arteritis vision symptoms, Temporal artery biopsy after steroids if vision threatened is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 79-year-old female has suspected infectious endocarditis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "No further testing; observe", "Transesophageal echocardiography", "Genetic panel first", "PET scan whole body"]'::jsonb, 2, 'For Suspected infectious endocarditis, Transesophageal echocardiography is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 38-year-old male has suspected community-acquired pneumonia outpatient.

Physical Examination:

CURB-65 score 0.

Laboratory Results:

No prior antibiotics.


Which test is most appropriate at initial visit?', '["CT chest for all outpatients", "Bronchoscopy", "No imaging needed", "Sputum culture for all", "Chest X-ray"]'::jsonb, 4, 'CXR confirms infiltrate and guides management in suspected CAP.'),
    (v_topic_id, 'A 43-year-old female has suspected thyroid nodule.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "Thyroid ultrasound with FNA if indicated", "No further testing; observe"]'::jsonb, 3, 'For Suspected thyroid nodule, Thyroid ultrasound with FNA if indicated is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 26-year-old female develops acute dyspnea and pleuritic pain 10 days after knee replacement surgery.

Physical Examination:

Vitals: HR 112 | RR 26 | BP 128/76 | SpO2 89% on room air.

Lungs: Clear. Extremities: Left calf tenderness and swelling.

Laboratory Results:

D-dimer elevated | CT pulmonary angiography: Bilateral segmental filling defects.


What is the most likely diagnosis?', '["Acute coronary syndrome", "Pulmonary embolism", "Pneumonia", "Pericarditis", "Anxiety disorder"]'::jsonb, 1, 'Postoperative setting, hypoxemia, calf findings, and CTPA filling defects confirm PE.'),
    (v_topic_id, 'A 66-year-old female presents with vomiting, delayed emptying.

Physical Examination:

Gastric retention on scintigraphy

Laboratory Results:

Key finding: Prokinetics, glucose control.


What is the most likely diagnosis?', '["Functional disorder", "Gastroparesis diabetic", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Gastroparesis diabetic.'),
    (v_topic_id, 'A 38-year-old female presents with tremor autonomic.

Physical Examination:

CIWA high

Laboratory Results:

Key finding: Benzodiazepines thiamine.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect", "Alcohol withdrawal"]'::jsonb, 4, 'Presentation consistent with Alcohol withdrawal.'),
    (v_topic_id, 'A 65-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 3).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "Study proves mechanism", "Exposure protective"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 50-year-old female has suspected ectopic pregnancy.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "Transvaginal pelvic ultrasound with \u03b2-hCG", "PET scan whole body", "No further testing; observe"]'::jsonb, 2, 'For Suspected ectopic pregnancy, Transvaginal pelvic ultrasound with β-hCG is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 29-year-old female has suspected ovarian torsion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Pelvic Doppler ultrasound emergently", "No testing indicated", "Exome sequencing first", "PET scan screening"]'::jsonb, 1, 'Appropriate initial study: Pelvic Doppler ultrasound emergently.'),
    (v_topic_id, 'A 43-year-old female presents with fasciculations progression.

Physical Examination:

UMN and LMN signs

Laboratory Results:

Key finding: Supportive riluzole.


What is the most likely diagnosis?', '["Normal variant", "ALS", "Conversion disorder", "Medication adverse effect", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with ALS.'),
    (v_topic_id, 'A 33-year-old male is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Placebo effect only", "Potentiation of antithrombin III", "Hormone supplementation only"]'::jsonb, 3, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 45-year-old female an intervention reduces events from 20% to 10%.

Physical Examination:

N/A

Laboratory Results:

N/A


The number needed to treat (NNT) is approximately:', '["20", "0.1", "2", "10", "100"]'::jsonb, 3, 'ARR = 10%; NNT = 1/0.10 = 10.'),
    (v_topic_id, 'A 74-year-old female is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Facilitated glucose uptake and suppression of ketogenesis", "Unknown mechanism", "Hormone supplementation only", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 61-year-old female has suspected carotid stenosis bruit.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "Carotid duplex ultrasound", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 2, 'For Suspected carotid stenosis bruit, Carotid duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 30-year-old female has suspected lung cancer mass.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT chest with tissue biopsy plan", "PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe", "Genetic panel first"]'::jsonb, 0, 'For Suspected lung cancer mass, CT chest with tissue biopsy plan is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 56-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 14).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Study proves mechanism", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "No association"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 54-year-old male has suspected osteomyelitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated", "MRI of involved bone and blood cultures"]'::jsonb, 4, 'Appropriate initial study: MRI of involved bone and blood cultures.'),
    (v_topic_id, 'A 64-year-old male a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Cover shifts indefinitely without report", "Ignore unless patient harm occurs", "Resign immediately", "Publicly confront on ward", "Report to patient safety/medical staff health per policy"]'::jsonb, 4, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 60-year-old female has suspected urinary tract obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Renal ultrasound or noncontrast CT", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: Renal ultrasound or noncontrast CT.'),
    (v_topic_id, 'A 58-year-old male has acute severe abdominal pain out of proportion to exam findings.

Physical Examination:

Abdomen: Soft, mild tenderness.

Laboratory Results:

Lactate 5.8 mmol/L | CT: SMA occlusion.


What is the most likely diagnosis?', '["Gastroenteritis", "Mesenteric ischemia", "Functional disorder", "Musculoskeletal strain", "Pulmonary embolism"]'::jsonb, 1, 'Pain out of proportion, elevated lactate, SMA occlusion = mesenteric ischemia.'),
    (v_topic_id, 'A 42-year-old male clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Dismiss patient concerns", "Avoid discussion", "Transfer without handoff", "Explore barriers; shared decision-making"]'::jsonb, 4, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 30-year-old female is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Vitamin K epoxide reductase inhibition", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 55-year-old female presents with irregular menses hirsutism.

Physical Examination:

High androgens

Laboratory Results:

Key finding: Weight loss OCPs.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "PCOS", "Functional disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with PCOS.'),
    (v_topic_id, 'A 25-year-old female has ascending numbness after Campylobacter gastroenteritis.

Physical Examination:

Areflexia.

Laboratory Results:

CSF albuminocytologic dissociation.


What is the most likely diagnosis?', '["Medication side effect", "Anxiety disorder", "Functional pain syndrome", "Normal variant", "Guillain-Barr\u00e9 syndrome"]'::jsonb, 4, 'Clinical pattern matches Guillain-Barré syndrome.'),
    (v_topic_id, 'A 82-year-old female a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Call security", "Sedate and transfuse", "Transfuse emergently regardless", "Obtain psychiatric hold", "Honor refusal; optimize nonblood alternatives"]'::jsonb, 4, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 53-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 1).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism", "No association"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 48-year-old female has suspected pulmonary embolism low risk.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "D-dimer then CTPA if elevated"]'::jsonb, 4, 'Appropriate initial study: D-dimer then CTPA if elevated.'),
    (v_topic_id, 'A 23-year-old male has suspected PID.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Pelvic exam with NAAT for gonorrhea/chlamydia", "No testing indicated", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: Pelvic exam with NAAT for gonorrhea/chlamydia.'),
    (v_topic_id, 'A 69-year-old female presents with chorea family history.

Physical Examination:

CAG repeats

Laboratory Results:

Key finding: Genetic counseling.


What is the most likely diagnosis?', '["Functional disorder", "Huntington disease", "Conversion disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Huntington disease.'),
    (v_topic_id, 'A 46-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 2).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Exposure protective", "Study proves mechanism", "No association", "Case-fatality rate reported"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 76-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 1).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 54-year-old female presents with sinusitis hemoptysis.

Physical Examination:

c-ANCA PR3

Laboratory Results:

Key finding: Cyclophosphamide rituximab.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Vasculitis GPA", "Conversion disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Vasculitis GPA.'),
    (v_topic_id, 'A 75-year-old male with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Pulmonary vasodilation only", "Increased mucus production", "Paralysis of respiratory muscles", "Immediate bronchodilation via \u03b22 agonism", "Reduction of airway inflammation"]'::jsonb, 4, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 65-year-old male has fever, uterine tenderness, and foul lochia day 5 postpartum.

Physical Examination:

Tachycardia.

Laboratory Results:

WBC 18,000.


What is the most likely diagnosis?', '["Normal variant", "Functional pain syndrome", "Anxiety disorder", "Postpartum endometritis", "Medication side effect"]'::jsonb, 3, 'Clinical pattern matches Postpartum endometritis.'),
    (v_topic_id, 'A 36-year-old male presents with short stature web neck.

Physical Examination:

45,X

Laboratory Results:

Key finding: Growth hormone estrogen.


What is the most likely diagnosis?', '["Turner syndrome", "Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Turner syndrome.'),
    (v_topic_id, 'A 35-year-old female presents with fever, murmur, IVDU.

Physical Examination:

Vegetation on TEE

Laboratory Results:

Key finding: IV antibiotics.


What is the most likely diagnosis?', '["Functional disorder", "Endocarditis", "Normal variant", "Conversion disorder", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with Endocarditis.'),
    (v_topic_id, 'A 72-year-old female presents with hematuria flank mass.

Physical Examination:

Renal mass on CT

Laboratory Results:

Key finding: Surgical resection.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Renal cell carcinoma"]'::jsonb, 4, 'Presentation consistent with Renal cell carcinoma.'),
    (v_topic_id, 'A 75-year-old male has suspected multiple sclerosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "PET scan screening", "Empiric treatment without workup", "MRI brain and spine with contrast", "No testing indicated"]'::jsonb, 3, 'Appropriate initial study: MRI brain and spine with contrast.'),
    (v_topic_id, 'A 36-year-old male presents with urticaria wheeze.

Physical Examination:

Hypotension

Laboratory Results:

Key finding: Epinephrine.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Anaphylaxis food", "Conversion disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Anaphylaxis food.'),
    (v_topic_id, 'A 81-year-old female is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Hormone supplementation only", "Unknown mechanism", "Direct DNA replication block only", "Inhibition of dihydrofolate reductase"]'::jsonb, 4, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 53-year-old male presents with nightmares hypervigilance.

Physical Examination:

Trauma history

Laboratory Results:

Key finding: Trauma-focused therapy SSRI.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "PTSD", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with PTSD.'),
    (v_topic_id, 'A 31-year-old female has suspected dvt unilateral leg swelling.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "No further testing; observe", "Lower extremity venous duplex ultrasound"]'::jsonb, 4, 'For Suspected DVT unilateral leg swelling, Lower extremity venous duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 33-year-old male clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Acknowledge emotion, apologize for delay, clarify plan", "Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Transfer without handoff"]'::jsonb, 0, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 51-year-old male presents with purulent sputum.

Physical Examination:

Pseudomonas growth

Laboratory Results:

Key finding: Antipseudomonal regimen.


What is the most likely diagnosis?', '["CF exacerbation", "Conversion disorder", "Normal variant", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with CF exacerbation.'),
    (v_topic_id, 'A 62-year-old female has suspected primary hyperaldosteronism.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Aldosterone-renin ratio after correction of hypokalemia", "Empiric treatment without workup", "No testing indicated", "PET scan screening"]'::jsonb, 1, 'Appropriate initial study: Aldosterone-renin ratio after correction of hypokalemia.'),
    (v_topic_id, 'A 62-year-old female presents with pleuritic pain, friction rub.

Physical Examination:

Diffuse ST elevation

Laboratory Results:

Key finding: NSAIDs/colchicine.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder", "Pericarditis"]'::jsonb, 4, 'Presentation consistent with Pericarditis.'),
    (v_topic_id, 'A 81-year-old male has suspected deep vein thrombosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "No testing indicated", "Compression ultrasonography of extremity", "Exome sequencing first", "PET scan screening"]'::jsonb, 2, 'Appropriate initial study: Compression ultrasonography of extremity.'),
    (v_topic_id, 'A 37-year-old female a screening test has sensitivity 90% and specificity 80% in a low-prevalence population.

Physical Examination:

N/A

Laboratory Results:

N/A


If a patient has a positive test, which statement is most accurate regarding PPV?', '["PPV equals specificity", "PPV is lower than in high-prevalence settings", "PPV is always 90%", "PPV equals sensitivity", "PPV is independent of prevalence"]'::jsonb, 1, 'PPV falls when disease prevalence is low, even with good test characteristics.'),
    (v_topic_id, 'A 46-year-old female presents with synpharyngitic hematuria.

Physical Examination:

IgA deposits

Laboratory Results:

Key finding: ACEi BP control.


What is the most likely diagnosis?', '["IgA nephropathy", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with IgA nephropathy.'),
    (v_topic_id, 'A 56-year-old female clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Guarantee cure", "Dismiss patient concerns", "Explain viral etiology; offer symptomatic care", "Avoid discussion"]'::jsonb, 3, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 64-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "GABA-A receptor positive allosteric modulation", "Placebo effect only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 69-year-old female is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Hormone supplementation only", "Placebo effect only", "Direct DNA replication block only", "Selective serotonin reuptake inhibition"]'::jsonb, 4, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 60-year-old male presents with myalgias, fever, winter outbreak.

Physical Examination:

Rapid flu A positive

Laboratory Results:

Key finding: Oseltamivir if high risk.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Influenza", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Influenza.'),
    (v_topic_id, 'A 26-year-old female presents with polymorphic VT after macrolide.

Physical Examination:

QTc 520

Laboratory Results:

Key finding: Magnesium, defibrillation.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Long QT torsades", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Long QT torsades.'),
    (v_topic_id, 'A 35-year-old female is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Venodilation reducing preload", "Unknown mechanism", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 74-year-old female presents with thrombosis pregnancy loss.

Physical Examination:

Lupus anticoagulant

Laboratory Results:

Key finding: Anticoagulation.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Antiphospholipid syndrome", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Antiphospholipid syndrome.'),
    (v_topic_id, 'A 84-year-old male has symmetric small-joint pain and morning stiffness >1 hour.

Physical Examination:

PIP/MCP synovitis.

Laboratory Results:

RF and anti-CCP positive.


What is the most likely diagnosis?', '["Normal variant", "Medication side effect", "Functional pain syndrome", "Anxiety disorder", "Rheumatoid arthritis"]'::jsonb, 4, 'Clinical pattern matches Rheumatoid arthritis.'),
    (v_topic_id, 'A 84-year-old male presents with malar rash arthritis.

Physical Examination:

Low C3 C4

Laboratory Results:

Key finding: Steroids hydroxychloroquine.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Medication adverse effect", "Conversion disorder", "SLE flare"]'::jsonb, 4, 'Presentation consistent with SLE flare.'),
    (v_topic_id, 'A 77-year-old female has suspected infective endocarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Blood cultures and transthoracic then TEE echo", "No testing indicated", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 1, 'Appropriate initial study: Blood cultures and transthoracic then TEE echo.'),
    (v_topic_id, 'A 81-year-old female presents with fever, rash palms/soles, tick exposure.

Physical Examination:

Rickettsia serology

Laboratory Results:

Key finding: Doxycycline empiric.


What is the most likely diagnosis?', '["Normal variant", "Rocky Mountain spotted fever", "Conversion disorder", "Medication adverse effect", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Rocky Mountain spotted fever.'),
    (v_topic_id, 'A 58-year-old male presents with acute cytopenias blasts.

Physical Examination:

Auer rods

Laboratory Results:

Key finding: Chemotherapy.


What is the most likely diagnosis?', '["AML", "Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with AML.'),
    (v_topic_id, 'A 82-year-old male has suspected adrenal incidentaloma.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "PET scan screening", "Biochemical hormonal workup then adrenal CT/MRI", "Empiric treatment without workup"]'::jsonb, 3, 'Appropriate initial study: Biochemical hormonal workup then adrenal CT/MRI.'),
    (v_topic_id, 'A 58-year-old male has suspected pheochromocytoma spells.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Plasma or 24-hour urine metanephrines", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Plasma or 24-hour urine metanephrines.'),
    (v_topic_id, 'A 66-year-old female is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Facilitated glucose uptake and suppression of ketogenesis", "Unknown mechanism", "Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 74-year-old male has suspected biliary obstruction.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["RUQ ultrasound first", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 0, 'For Suspected biliary obstruction, RUQ ultrasound first is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 56-year-old male has 3 days of fever, productive cough, and pleuritic chest pain. he smokes 1 pack per day.

Physical Examination:

Vitals: Temp 102.4°F | HR 104 | RR 22 | BP 118/72.

Lungs: Dullness and bronchial breath sounds at the right base.

No JVD.

Laboratory Results:

WBC 16,200/µL | Chest X-ray: Right lower lobe consolidation with air bronchograms.


What is the most likely diagnosis?', '["Lung adenocarcinoma", "Heart failure exacerbation", "Spontaneous pneumothorax", "Pulmonary embolism", "Community-acquired bacterial pneumonia"]'::jsonb, 4, 'Fever, productive cough, focal consolidation with air bronchograms indicate bacterial pneumonia.'),
    (v_topic_id, 'A 41-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 11).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 78-year-old female presents with dysphagia solids and liquids.

Physical Examination:

Bird beak on barium

Laboratory Results:

Key finding: POEM or pneumatic dilation.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Achalasia", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Achalasia.'),
    (v_topic_id, 'A 68-year-old female has suspected acute cholecystitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Right upper quadrant ultrasound", "PET scan screening", "Exome sequencing first", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Right upper quadrant ultrasound.'),
    (v_topic_id, 'A 25-year-old male presents with fever agitation.

Physical Examination:

Very low TSH high T4

Laboratory Results:

Key finding: Propranolol PTU iodine.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Conversion disorder", "Normal variant", "Thyroid storm"]'::jsonb, 4, 'Presentation consistent with Thyroid storm.'),
    (v_topic_id, 'A 35-year-old male presents with fever neuro renal MAHA.

Physical Examination:

ADAMTS13 low

Laboratory Results:

Key finding: Plasmapheresis.


What is the most likely diagnosis?', '["Medication adverse effect", "TTP", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with TTP.'),
    (v_topic_id, 'A 81-year-old female presents with epigastric pain.

Physical Examination:

Urea breath test positive

Laboratory Results:

Key finding: Triple therapy.


What is the most likely diagnosis?', '["Peptic ulcer H pylori", "Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Peptic ulcer H pylori.'),
    (v_topic_id, 'A 74-year-old female has flank pain, hematuria, and hypertension in young adult.

Physical Examination:

Abdominal bruit.

Laboratory Results:

Renal artery stenosis on Doppler.


What is the most likely diagnosis?', '["Normal variant", "Anxiety disorder", "Medication side effect", "Fibromuscular dysplasia", "Functional pain syndrome"]'::jsonb, 3, 'Clinical pattern matches Fibromuscular dysplasia.'),
    (v_topic_id, 'A 31-year-old male has fever, myalgias, and thrombocytopenia after tick bite.

Physical Examination:

No rash yet.

Laboratory Results:

Peripheral smear shows morulae in granulocytes.


What is the most likely diagnosis?', '["Normal variant", "Functional pain syndrome", "Anaplasmosis", "Medication side effect", "Anxiety disorder"]'::jsonb, 2, 'Clinical pattern matches Anaplasmosis.'),
    (v_topic_id, 'A 34-year-old male has acute chest pain; troponin pending.

Physical Examination:

Vitals stable.

Lungs clear.

Laboratory Results:

ECG: Nonspecific ST changes.


Which initial diagnostic study is most appropriate to evaluate for acute coronary syndrome?', '["No testing; reassurance", "Exercise stress test now", "Coronary CT angiography first", "Echocardiography only", "12-lead ECG and serial troponins"]'::jsonb, 4, 'ACS evaluation requires ECG and serial troponins in the ED.'),
    (v_topic_id, 'A 75-year-old female is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Microtubule disruption inhibiting neutrophil chemotaxis", "Unknown mechanism", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 34-year-old male presents with overdose history.

Physical Examination:

Positive urine

Laboratory Results:

Key finding: Buprenorphine naloxone.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "Medication adverse effect", "Functional disorder", "Opioid use disorder"]'::jsonb, 4, 'Presentation consistent with Opioid use disorder.'),
    (v_topic_id, 'A 75-year-old female presents with hypothermia altered.

Physical Examination:

Low T4 high TSH

Laboratory Results:

Key finding: IV levothyroxine.


What is the most likely diagnosis?', '["Myxedema coma", "Normal variant", "Medication adverse effect", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Myxedema coma.'),
    (v_topic_id, 'A 34-year-old male presents with monoarticular hot joint.

Physical Examination:

Synovial WBC>50k

Laboratory Results:

Key finding: Drain + IV antibiotics.


What is the most likely diagnosis?', '["Septic arthritis", "Functional disorder", "Conversion disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Septic arthritis.'),
    (v_topic_id, 'A 35-year-old male is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Microtubule disruption inhibiting neutrophil chemotaxis", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 76-year-old male presents with syncope athlete.

Physical Examination:

Murmur increases Valsalva

Laboratory Results:

Key finding: Beta-blocker, ICD if high risk.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Hypertrophic cardiomyopathy", "Conversion disorder", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 36-year-old female clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Dismiss patient concerns", "Explore barriers; shared decision-making", "Transfer without handoff", "Guarantee cure"]'::jsonb, 2, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 44-year-old male presents with EF 20%.

Physical Examination:

S3 gallop

Laboratory Results:

Key finding: GDMT.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Dilated cardiomyopathy", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Dilated cardiomyopathy.'),
    (v_topic_id, 'A 75-year-old female is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Irreversible inhibition of H+/K+ ATPase"]'::jsonb, 4, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 26-year-old female presents with unilateral leg swelling.

Physical Examination:

Duplex positive

Laboratory Results:

Key finding: Anticoagulation.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "DVT", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with DVT.'),
    (v_topic_id, 'A 62-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 12).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Exposure protective", "Study proves mechanism", "No association", "Case-fatality rate reported"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 42-year-old male presents with confusion.

Physical Examination:

High insulin C-peptide

Laboratory Results:

Key finding: D50 octreotide.


What is the most likely diagnosis?', '["Conversion disorder", "Hypoglycemia sulfonylurea", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Hypoglycemia sulfonylurea.'),
    (v_topic_id, 'A 61-year-old male presents with UC association.

Physical Examination:

Beaded bile ducts

Laboratory Results:

Key finding: Surveillance cholangiocarcinoma.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Medication adverse effect", "Primary sclerosing cholangitis", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Primary sclerosing cholangitis.'),
    (v_topic_id, 'A 74-year-old female clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Avoid discussion", "Dismiss patient concerns", "Apologize, explain, commit to prevention", "Transfer without handoff"]'::jsonb, 3, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 23-year-old female has suspected SLE flare.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "No testing indicated", "ANA, anti-dsDNA, complement levels, urinalysis", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 2, 'Appropriate initial study: ANA, anti-dsDNA, complement levels, urinalysis.'),
    (v_topic_id, 'A 22-year-old female is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "Local anti-inflammatory glucocorticoid effect"]'::jsonb, 4, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 73-year-old female has suspected acute compartment syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Compartment pressure measurement", "PET scan screening", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Compartment pressure measurement.'),
    (v_topic_id, 'A 78-year-old male clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Assess immediate safety; provide resources", "Transfer without handoff", "Dismiss patient concerns", "Avoid discussion"]'::jsonb, 1, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 63-year-old female has suspected testicular torsion.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "No further testing; observe", "Genetic panel first", "Empiric treatment without diagnosis", "Scrotal Doppler ultrasound emergently"]'::jsonb, 4, 'For Suspected testicular torsion, Scrotal Doppler ultrasound emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 23-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 4).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 31-year-old male presents with pleuritic pain malignancy.

Physical Examination:

Light criteria exudate

Laboratory Results:

Key finding: Thoracentesis.


What is the most likely diagnosis?', '["Pleural effusion exudative", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Pleural effusion exudative.'),
    (v_topic_id, 'A 83-year-old male presents with anion gap acidosis ketones.

Physical Examination:

Hyperglycemia

Laboratory Results:

Key finding: Insulin fluids potassium.


What is the most likely diagnosis?', '["Conversion disorder", "DKA", "Medication adverse effect", "Functional disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with DKA.'),
    (v_topic_id, 'A 24-year-old male has suspected biliary obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "No testing indicated", "PET scan screening", "RUQ ultrasound then MRCP if indicated", "Empiric treatment without workup"]'::jsonb, 3, 'Appropriate initial study: RUQ ultrasound then MRCP if indicated.'),
    (v_topic_id, 'A 74-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "No association", "Study proves mechanism", "Exposure associated with higher risk of outcome", "Exposure protective"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 80-year-old female has suspected acute pancreatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Lipase and triglycerides; CT if severe or uncertain", "PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Lipase and triglycerides; CT if severe or uncertain.'),
    (v_topic_id, 'A 49-year-old male presents with bulbar weakness.

Physical Examination:

Anti-AChR

Laboratory Results:

Key finding: Plasmapheresis ventilation.


What is the most likely diagnosis?', '["Myasthenia crisis", "Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Myasthenia crisis.'),
    (v_topic_id, 'A 62-year-old female presents with headache multiple victims.

Physical Examination:

Cherry red skin COHb high

Laboratory Results:

Key finding: 100% O2 hyperbaric.


What is the most likely diagnosis?', '["Carbon monoxide poisoning", "Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Carbon monoxide poisoning.'),
    (v_topic_id, 'A 70-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "No association", "Study proves mechanism"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 73-year-old male is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Unknown mechanism", "Inhibition of dihydrofolate reductase", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 2, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 69-year-old male clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Apologize, explain, commit to prevention", "Guarantee cure", "Avoid discussion", "Dismiss patient concerns"]'::jsonb, 1, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 46-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 53-year-old male has suspected knee internal derangement.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "PET scan whole body", "Genetic panel first", "MRI knee", "Empiric treatment without diagnosis"]'::jsonb, 3, 'For Suspected knee internal derangement, MRI knee is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 28-year-old female presents with proximal weakness CK high.

Physical Examination:

Endomysial inflammation

Laboratory Results:

Key finding: Steroids immunosuppression.


What is the most likely diagnosis?', '["Polymyositis", "Functional disorder", "Conversion disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Polymyositis.'),
    (v_topic_id, 'A 74-year-old female has suspected celiac disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["IgA anti-tissue transglutaminase and total IgA", "Exome sequencing first", "No testing indicated", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: IgA anti-tissue transglutaminase and total IgA.'),
    (v_topic_id, 'A 48-year-old male presents with lymphocytosis elderly.

Physical Examination:

Smudge cells

Laboratory Results:

Key finding: Watch treat.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant", "CLL"]'::jsonb, 4, 'Presentation consistent with CLL.'),
    (v_topic_id, 'A 31-year-old female with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Increased mucus production", "Paralysis of respiratory muscles", "Reduction of airway inflammation", "Pulmonary vasodilation only", "Immediate bronchodilation via \u03b22 agonism"]'::jsonb, 2, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 78-year-old female has suspected hemochromatosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Ferritin, transferrin saturation, HFE genotyping", "PET scan screening", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Ferritin, transferrin saturation, HFE genotyping.'),
    (v_topic_id, 'A 28-year-old female with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Increased preload", "Sodium retention", "Arterial vasoconstriction", "Inhibition of angiotensin II\u2013mediated remodeling", "Positive inotropy"]'::jsonb, 3, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 56-year-old male is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Hormone supplementation only", "\u03b22-adrenergic bronchodilation", "Direct DNA replication block only"]'::jsonb, 3, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 51-year-old male presents with isolated thrombocytopenia.

Physical Examination:

Normal marrow

Laboratory Results:

Key finding: Steroids IVIG.


What is the most likely diagnosis?', '["Normal variant", "ITP", "Medication adverse effect", "Functional disorder", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with ITP.'),
    (v_topic_id, 'A 38-year-old female presents with erythema migrans after hiking.

Physical Examination:

ELISA positive

Laboratory Results:

Key finding: Doxycycline.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Lyme disease", "Conversion disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Lyme disease.'),
    (v_topic_id, 'A 32-year-old male presents with fatigue splenomegaly.

Physical Examination:

Philadelphia chromosome

Laboratory Results:

Key finding: TKI.


What is the most likely diagnosis?', '["CML", "Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with CML.'),
    (v_topic_id, 'A 55-year-old male has suspected pe pregnant patient.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "V/Q scan or CTPA per risk", "No further testing; observe", "Empiric treatment without diagnosis", "PET scan whole body"]'::jsonb, 1, 'For Suspected PE pregnant patient, V/Q scan or CTPA per risk is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 45-year-old male lead-time bias is a concern in which situation?

Physical Examination:

N/A

Laboratory Results:

N/A


Early detection appears to prolong survival without changing disease course because:', '["Prevalence decreases", "Randomization failed", "Diagnosis is made earlier without altering time of death", "Specificity improves", "Treatment is more effective"]'::jsonb, 2, 'Lead-time bias inflates apparent survival by earlier diagnosis only.'),
    (v_topic_id, 'A 48-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "No association", "Exposure protective", "Study proves mechanism", "Case-fatality rate reported"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 35-year-old male has acute flank pain suspicious for stone.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

UA: Trace blood.


Which initial imaging study is most appropriate?', '["No imaging", "Contrast CT abdomen", "KUB only for all patients", "MRI abdomen first line", "Noncontrast CT abdomen/pelvis"]'::jsonb, 4, 'Noncontrast CT is sensitive for ureteral stones and alternative diagnoses.'),
    (v_topic_id, 'A 46-year-old male has suspected acute diverticulitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["CT abdomen with contrast", "Exome sequencing first", "No testing indicated", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: CT abdomen with contrast.'),
    (v_topic_id, 'A 69-year-old male is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "\u03b22-adrenergic bronchodilation"]'::jsonb, 4, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 67-year-old male presents with gait urinary incontinence dementia.

Physical Examination:

Large ventricles

Laboratory Results:

Key finding: VP shunt trial.


What is the most likely diagnosis?', '["Normal variant", "Normal pressure hydrocephalus", "Medication adverse effect", "Functional disorder", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with Normal pressure hydrocephalus.'),
    (v_topic_id, 'A 79-year-old female presents with painful thyroid post viral.

Physical Examination:

ESR high

Laboratory Results:

Key finding: NSAIDs steroids.


What is the most likely diagnosis?', '["Medication adverse effect", "Thyroiditis subacute", "Conversion disorder", "Normal variant", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Thyroiditis subacute.'),
    (v_topic_id, 'A 37-year-old male has suspected testicular cancer mass.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Scrotal ultrasound and tumor markers", "No testing indicated", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: Scrotal ultrasound and tumor markers.'),
    (v_topic_id, 'A 54-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 9).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Exposure protective", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 38-year-old male clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Dismiss patient concerns", "Use SPIKES framework; assess understanding first", "Guarantee cure", "Transfer without handoff"]'::jsonb, 2, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 65-year-old female has episodic diaphoresis, tremor, and glucose 42 mg/dL.

Physical Examination:

Symptoms resolve with D50.

Laboratory Results:

Insulin level inappropriately elevated during hypoglycemia.


What is the most likely diagnosis?', '["Insulinoma", "Anxiety disorder", "Normal variant", "Functional pain syndrome", "Medication side effect"]'::jsonb, 0, 'Clinical pattern matches Insulinoma.'),
    (v_topic_id, 'A 53-year-old male is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 34-year-old male is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["\u03bc-opioid receptor agonism", "Placebo effect only", "Unknown mechanism", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 24-year-old male has suspected adrenal incidentaloma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "Genetic panel first", "No further testing; observe", "CT adrenal protocol or MRI", "PET scan whole body"]'::jsonb, 3, 'For Suspected adrenal incidentaloma, CT adrenal protocol or MRI is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 25-year-old female presents with hematemesis cirrhosis.

Physical Examination:

Varices on endoscopy

Laboratory Results:

Key finding: Band ligation + octreotide.


What is the most likely diagnosis?', '["Conversion disorder", "Esophageal varices", "Normal variant", "Medication adverse effect", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Esophageal varices.'),
    (v_topic_id, 'A 28-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Placebo effect only", "GABA-A receptor positive allosteric modulation"]'::jsonb, 4, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 78-year-old male has suspected Cushing syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "PET scan screening", "Overnight 1-mg dexamethasone suppression test", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: Overnight 1-mg dexamethasone suppression test.'),
    (v_topic_id, 'A 23-year-old male presents with syncope, angina, HF.

Physical Examination:

Harsh crescendo-decrescendo murmur

Laboratory Results:

Key finding: Valve replacement when severe.


What is the most likely diagnosis?', '["Functional disorder", "Aortic stenosis", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Aortic stenosis.'),
    (v_topic_id, 'A 48-year-old male has suspected diabetic neuropathy.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Monofilament exam and consider EMG if atypical", "Exome sequencing first", "PET scan screening"]'::jsonb, 2, 'Appropriate initial study: Monofilament exam and consider EMG if atypical.'),
    (v_topic_id, 'A 77-year-old male clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Dismiss patient concerns", "Explain viral etiology; offer symptomatic care", "Guarantee cure", "Transfer without handoff"]'::jsonb, 2, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 83-year-old male a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Refuse all care until 18", "Obtain court order first", "Mandatory parental notification always", "Provide confidential care per mature minor laws", "Report to child protective services"]'::jsonb, 3, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 33-year-old male presents with chest pain post viral.

Physical Examination:

Troponin elevated, MRI edema

Laboratory Results:

Key finding: Supportive.


What is the most likely diagnosis?', '["Myocarditis", "Functional disorder", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Myocarditis.'),
    (v_topic_id, 'A 48-year-old female presents with foul sputum, alcoholism.

Physical Examination:

Cavity air-fluid level

Laboratory Results:

Key finding: Prolonged antibiotics.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Lung abscess", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Lung abscess.'),
    (v_topic_id, 'A 76-year-old female is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Local anti-inflammatory glucocorticoid effect", "Unknown mechanism", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 73-year-old male has suspected interstitial lung disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["High-resolution CT chest", "PET scan screening", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: High-resolution CT chest.'),
    (v_topic_id, 'A 44-year-old female has suspected acute cholecystitis.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe", "HIDA scan if US equivocal", "Genetic panel first"]'::jsonb, 3, 'For Suspected acute cholecystitis, HIDA scan if US equivocal is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 52-year-old male has acute monocular painless vision loss that began 2 hours ago.

Physical Examination:

Vitals: BP 168/94.

Eye: Afferent pupillary defect on affected side; fundoscopy difficult.

Laboratory Results:

ESR 68 mm/h | CRP elevated | No retinal detachment on bedside exam.


What is the most likely diagnosis?', '["Acute angle-closure glaucoma", "Migraine aura", "Vitreous hemorrhage", "Optic neuritis", "Central retinal artery occlusion"]'::jsonb, 4, 'Painless monocular vision loss with RAPD in older patient suggests CRAO; giant cell arteritis risk.'),
    (v_topic_id, 'A 65-year-old male has suspected appendicitis rlq pain.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["CT abdomen with contrast or ultrasound in pregnancy", "No further testing; observe", "PET scan whole body", "Empiric treatment without diagnosis", "Genetic panel first"]'::jsonb, 0, 'For Suspected appendicitis RLQ pain, CT abdomen with contrast or ultrasound in pregnancy is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 22-year-old female presents with hallucinations fever.

Physical Examination:

Severe withdrawal

Laboratory Results:

Key finding: ICU benzodiazepines.


What is the most likely diagnosis?', '["Delirium tremens", "Normal variant", "Conversion disorder", "Medication adverse effect", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Delirium tremens.'),
    (v_topic_id, 'A 48-year-old female has acute monoarticular knee pain; joint warm and swollen.

Physical Examination:

No skin tophi.

Laboratory Results:

Synovial fluid: Needle-shaped negatively birefringent crystals.


What is the most likely diagnosis?', '["Functional pain syndrome", "Normal variant", "Acute gout", "Anxiety disorder", "Medication side effect"]'::jsonb, 2, 'Clinical pattern matches Acute gout.'),
    (v_topic_id, 'A 71-year-old female presents with refractory HTN flash edema.

Physical Examination:

Stenosis on CTA

Laboratory Results:

Key finding: Revascularization if indicated.


What is the most likely diagnosis?', '["Conversion disorder", "Renal artery stenosis", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Renal artery stenosis.'),
    (v_topic_id, 'A 71-year-old female an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Court order required before any treatment", "Treat per emergent best-interest standard and seek ethics consult", "Wait indefinitely for family", "Use physician personal preference only", "Withdraw all care immediately"]'::jsonb, 1, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 72-year-old female with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Positive inotropy", "Sodium retention", "Arterial vasoconstriction", "Increased preload", "Inhibition of angiotensin II\u2013mediated remodeling"]'::jsonb, 4, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 53-year-old male is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Reduced myocardial oxygen demand and arrhythmia risk", "Hormone supplementation only", "Unknown mechanism", "Direct DNA replication block only", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 30-year-old female presents with metabolic syndrome.

Physical Examination:

Steatosis fibrosis

Laboratory Results:

Key finding: Weight loss.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Normal variant", "NASH cirrhosis", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with NASH cirrhosis.'),
    (v_topic_id, 'A 47-year-old male infant has paroxysmal cough followed by whoop.

Physical Examination:

No fever.

Laboratory Results:

WBC lymphocytosis.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Pertussis", "Normal variant", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches Pertussis.'),
    (v_topic_id, 'A 40-year-old male has palpitations, tremor, and heat intolerance for 3 weeks.

Physical Examination:

Vitals: HR 124 (irregular) | BP 142/78.

Thyroid: Diffusely enlarged, no nodules. Lid lag present.

Laboratory Results:

TSH <0.01 mIU/L | Free T4 elevated | TSH receptor antibody positive.


What is the most likely diagnosis?', '["Subacute thyroiditis", "Toxic multinodular goiter", "Pituitary TSHoma", "Euthyroid sick syndrome", "Graves disease"]'::jsonb, 4, 'Suppressed TSH, elevated T4, diffuse goiter, TRAb positive = Graves.'),
    (v_topic_id, 'A 59-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "No association", "Exposure associated with higher risk of outcome", "Case-fatality rate reported"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 65-year-old male presents with Charcot triad.

Physical Examination:

CBD dilation

Laboratory Results:

Key finding: IV antibiotics ERCP.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Cholangitis", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Cholangitis.'),
    (v_topic_id, 'A 46-year-old female is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Vitamin K epoxide reductase inhibition", "Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 1, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 84-year-old male has episodic severe unilateral periorbital pain with lacrimation and nasal congestion.

Physical Examination:

Neuro intact between attacks.

Laboratory Results:

No acute lab abnormality.


What is the most likely diagnosis?', '["Cluster headache", "Gastroenteritis", "Pulmonary embolism", "Functional disorder", "Musculoskeletal strain"]'::jsonb, 0, 'Short severe unilateral periorbital pain with autonomic symptoms = cluster.'),
    (v_topic_id, 'A 27-year-old female has suspected pneumothorax trauma.

Physical Examination:

Vitals stable unless noted.

Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "Chest X-ray or bedside ultrasound"]'::jsonb, 4, 'For Suspected pneumothorax trauma, Chest X-ray or bedside ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 70-year-old male has 2 weeks of depressed mood, insomnia, and guilt with suicidal ideation.

Physical Examination:

Psychomotor retardation.

Laboratory Results:

TSH normal.


What is the most likely diagnosis?', '["Major depressive episode", "Medication side effect", "Anxiety disorder", "Normal variant", "Functional pain syndrome"]'::jsonb, 0, 'Clinical pattern matches Major depressive episode.'),
    (v_topic_id, 'A 51-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 7).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 58-year-old male has microcytic anemia and occult blood positive stool.

Physical Examination:

No weight loss yet.

Laboratory Results:

Hgb 9.2 g/dL.


Which diagnostic evaluation is most appropriate?', '["Colonoscopy", "Empiric iron without evaluation", "Bone marrow biopsy", "Abdominal ultrasound only", "Repeat CBC in 1 year"]'::jsonb, 0, 'Positive occult blood with anemia requires colonoscopy to exclude malignancy.'),
    (v_topic_id, 'A 36-year-old female has suspected appendicitis adult.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Empiric treatment without workup", "No testing indicated", "CT abdomen/pelvis or graded ultrasound", "PET scan screening"]'::jsonb, 3, 'Appropriate initial study: CT abdomen/pelvis or graded ultrasound.'),
    (v_topic_id, 'A 24-year-old female with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Inhibition of lipoprotein lipase", "Bile acid sequestration in gut", "Competitive inhibition of HMG-CoA reductase", "PCSK9 gene deletion", "Niacin receptor agonism"]'::jsonb, 2, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 68-year-old female has syncope during exercise; family history of sudden death.

Physical Examination:

Murmur increases with Valsalva.

Laboratory Results:

Echo: Asymmetric septal hypertrophy.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Hypertrophic cardiomyopathy", "Normal variant", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 69-year-old female an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Withdraw all care immediately", "Wait indefinitely for family", "Court order required before any treatment", "Treat per emergent best-interest standard and seek ethics consult", "Use physician personal preference only"]'::jsonb, 3, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 34-year-old male has suspected pleural effusion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "No testing indicated", "Exome sequencing first", "PET scan screening", "Thoracentesis with fluid studies"]'::jsonb, 4, 'Appropriate initial study: Thoracentesis with fluid studies.'),
    (v_topic_id, 'A 57-year-old female a trial reports RR 0.72 for death with Drug X vs placebo (95% CI 0.55–0.94).

Physical Examination:

N/A

Laboratory Results:

N/A


Which conclusion is most appropriate?', '["Drug X increases mortality", "Study is case-control", "No association", "Drug X is associated with lower mortality", "CI proves causation individually"]'::jsonb, 3, 'RR <1 with CI excluding 1 suggests lower event rate with treatment.'),
    (v_topic_id, 'A 47-year-old female has central obesity, striae, and proximal muscle weakness.

Physical Examination:

Moon facies.

Laboratory Results:

24-h urine cortisol elevated.


What is the most likely diagnosis?', '["Cushing syndrome", "Functional pain syndrome", "Medication side effect", "Anxiety disorder", "Normal variant"]'::jsonb, 0, 'Clinical pattern matches Cushing syndrome.'),
    (v_topic_id, 'A 53-year-old female has fever, cough, and hypoxia; recent COVID exposure.

Physical Examination:

Bilateral infiltrates.

Laboratory Results:

PCR positive for SARS-CoV-2.


What is the most likely diagnosis?', '["Medication side effect", "Anxiety disorder", "COVID-19 pneumonia", "Normal variant", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches COVID-19 pneumonia.'),
    (v_topic_id, 'A 44-year-old male has new-onset atrial fibrillation with rapid ventricular response.

Physical Examination:

Irregularly irregular pulse.

Laboratory Results:

ECG: No ST elevation; AF with RVR.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Normal variant", "Functional pain syndrome", "Atrial fibrillation"]'::jsonb, 4, 'Clinical pattern matches Atrial fibrillation.'),
    (v_topic_id, 'A 73-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Study proves mechanism", "Exposure associated with higher risk of outcome", "Case-fatality rate reported"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 60-year-old female has suspected septic arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Arthrocentesis with synovial analysis", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Arthrocentesis with synovial analysis.'),
    (v_topic_id, 'A 31-year-old female presents with hypoxemia, low compliance.

Physical Examination:

Bilateral infiltrates P/F<200

Laboratory Results:

Key finding: Lung protective ventilation.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Medication adverse effect", "Normal variant", "ARDS"]'::jsonb, 4, 'Presentation consistent with ARDS.'),
    (v_topic_id, 'A 32-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 15).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome", "Exposure protective"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 28-year-old male has suspected prostate cancer elevated PSA.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "No testing indicated", "MRI-targeted biopsy pathway per guidelines", "Empiric treatment without workup"]'::jsonb, 3, 'Appropriate initial study: MRI-targeted biopsy pathway per guidelines.'),
    (v_topic_id, 'A 22-year-old male presents with hyperpigmentation hypotension.

Physical Examination:

Low cortisol high ACTH

Laboratory Results:

Key finding: Hydrocortisone fludrocortisone.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Addison disease", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Addison disease.'),
    (v_topic_id, 'A 25-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 6).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure protective", "No association", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 80-year-old female has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Inhibition of viral replication enzymes", "Blocking TNF-\u03b1 only", "Neutralization of endotoxin", "Increasing hepatic blood flow", "Stimulation of host IgM only"]'::jsonb, 0, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 29-year-old female presents with pain out of proportion.

Physical Examination:

Crepitus gas

Laboratory Results:

Key finding: Surgery antibiotics.


What is the most likely diagnosis?', '["Necrotizing fasciitis", "Normal variant", "Medication adverse effect", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Necrotizing fasciitis.');
END $$;
COMMIT;
