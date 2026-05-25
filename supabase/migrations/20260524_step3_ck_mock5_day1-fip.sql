-- Step 3 Mock #5 day1-fip — 240 authentic MCQs
BEGIN;
DO $$
DECLARE v_topic_id UUID;
BEGIN
  SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-3-mock-pool-mock5-day1-fip' LIMIT 1;
  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic usmle-3-mock-pool-mock5-day1-fip missing';
  END IF;
  DELETE FROM mcqs WHERE topic_id = v_topic_id;
  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 83-year-old male has resting tremor, rigidity, and shuffling gait.

Physical Examination:

Masked facies.

Laboratory Results:

No acute CT findings.


What is the most likely diagnosis?', '["Medication side effect", "Parkinson disease", "Anxiety disorder", "Functional pain syndrome", "Normal variant"]'::jsonb, 1, 'Clinical pattern matches Parkinson disease.'),
    (v_topic_id, 'A 78-year-old male has suspected acute hepatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "PET scan screening", "Hepatitis serologies and liver synthetic panel", "Exome sequencing first"]'::jsonb, 3, 'Appropriate initial study: Hepatitis serologies and liver synthetic panel.'),
    (v_topic_id, 'A 26-year-old male presents with nail pitting dactylitis.

Physical Examination:

Skin psoriasis

Laboratory Results:

Key finding: DMARD biologic.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect", "Psoriatic arthritis"]'::jsonb, 4, 'Presentation consistent with Psoriatic arthritis.'),
    (v_topic_id, 'A 74-year-old female has suspected appendicitis adult.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "CT abdomen/pelvis or graded ultrasound", "Empiric treatment without workup", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: CT abdomen/pelvis or graded ultrasound.'),
    (v_topic_id, 'A 73-year-old female has flank pain, hematuria, and hypertension in young adult.

Physical Examination:

Abdominal bruit.

Laboratory Results:

Renal artery stenosis on Doppler.


What is the most likely diagnosis?', '["Fibromuscular dysplasia", "Normal variant", "Medication side effect", "Functional pain syndrome", "Anxiety disorder"]'::jsonb, 0, 'Clinical pattern matches Fibromuscular dysplasia.'),
    (v_topic_id, 'A 41-year-old male is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Facilitated glucose uptake and suppression of ketogenesis", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 2, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 49-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 8).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Study proves mechanism", "Exposure protective", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 25-year-old female has suspected acute mesenteric ischemia.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "No further testing; observe", "CT angiography abdomen", "PET scan whole body", "Genetic panel first"]'::jsonb, 2, 'For Suspected acute mesenteric ischemia, CT angiography abdomen is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 50-year-old male has acute right flank pain radiating to the groin with nausea and vomiting.

Physical Examination:

Vitals: HR 98 | BP 148/92.
Abdomen: Right CVA tenderness; no peritoneal signs.

Laboratory Results:

Urinalysis: Gross hematuria | Noncontrast CT: 6-mm calculus at ureterovesical junction with hydronephrosis.


What is the most likely diagnosis?', '["Ectopic pregnancy", "Ureteral nephrolithiasis", "Acute appendicitis", "Abdominal aortic aneurysm rupture", "Pyelonephritis"]'::jsonb, 1, 'Colicky flank pain, hematuria, and obstructing ureteral stone on CT define nephrolithiasis.'),
    (v_topic_id, 'A 22-year-old female a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Cover shifts indefinitely without report", "Publicly confront on ward", "Report to patient safety/medical staff health per policy", "Ignore unless patient harm occurs", "Resign immediately"]'::jsonb, 2, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 32-year-old male presents with syncope athlete.

Physical Examination:

Murmur increases Valsalva

Laboratory Results:

Key finding: Beta-blocker, ICD if high risk.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Hypertrophic cardiomyopathy", "Conversion disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 28-year-old male has fatigue, easy bruising, and gum bleeding for 2 weeks.

Physical Examination:

Vitals: HR 96 | BP 118/74.
HEENT: Petechiae on palate. No lymphadenopathy.

Laboratory Results:

CBC: WBC 18,000 (blasts 42%) | Platelets 18,000 | Hgb 7.8 g/dL.


What is the most likely diagnosis?', '["Aplastic anemia", "DIC from sepsis", "Acute leukemia", "ITP", "Iron deficiency anemia"]'::jsonb, 2, 'Cytopenias with circulating blasts indicate acute leukemia.'),
    (v_topic_id, 'A 54-year-old female is prescribed therapy for Insulin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Hormone supplementation only", "Direct DNA replication block only", "Facilitated glucose uptake and suppression of ketogenesis"]'::jsonb, 4, 'Correct mechanism: Facilitated glucose uptake and suppression of ketogenesis.'),
    (v_topic_id, 'A 47-year-old female has suspected multiple sclerosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["MRI brain and spine with contrast", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: MRI brain and spine with contrast.'),
    (v_topic_id, 'A 29-year-old male presents with pleuritic pain, friction rub.

Physical Examination:

Diffuse ST elevation

Laboratory Results:

Key finding: NSAIDs/colchicine.


What is the most likely diagnosis?', '["Normal variant", "Pericarditis", "Medication adverse effect", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Pericarditis.'),
    (v_topic_id, 'A 69-year-old male a screening test has sensitivity 90% and specificity 80% in a low-prevalence population.

Physical Examination:

N/A

Laboratory Results:

N/A


If a patient has a positive test, which statement is most accurate regarding PPV?', '["PPV equals sensitivity", "PPV is lower than in high-prevalence settings", "PPV is always 90%", "PPV is independent of prevalence", "PPV equals specificity"]'::jsonb, 1, 'PPV falls when disease prevalence is low, even with good test characteristics.'),
    (v_topic_id, 'A 25-year-old male has new-onset atrial fibrillation with rapid ventricular response.

Physical Examination:

Irregularly irregular pulse.

Laboratory Results:

ECG: No ST elevation; AF with RVR.


What is the most likely diagnosis?', '["Anxiety disorder", "Atrial fibrillation", "Normal variant", "Functional pain syndrome", "Medication side effect"]'::jsonb, 1, 'Clinical pattern matches Atrial fibrillation.'),
    (v_topic_id, 'A 41-year-old female presents with clonus hyperreflexia on serotonergics.

Physical Examination:

Hyperthermia

Laboratory Results:

Key finding: Cyproheptadine stop agents.


What is the most likely diagnosis?', '["Serotonin syndrome", "Medication adverse effect", "Conversion disorder", "Normal variant", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Serotonin syndrome.'),
    (v_topic_id, 'A 44-year-old male with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Bile acid sequestration in gut", "PCSK9 gene deletion", "Competitive inhibition of HMG-CoA reductase", "Niacin receptor agonism", "Inhibition of lipoprotein lipase"]'::jsonb, 2, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 61-year-old female presents with heartburn postprandial.

Physical Examination:

Normal EGD mild esophagitis

Laboratory Results:

Key finding: PPI lifestyle.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "GERD", "Medication adverse effect", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with GERD.'),
    (v_topic_id, 'A 39-year-old female has suspected lung cancer mass.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "CT chest with tissue biopsy plan", "PET scan whole body", "No further testing; observe"]'::jsonb, 2, 'For Suspected lung cancer mass, CT chest with tissue biopsy plan is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 47-year-old female has first unprovoked generalized seizure.

Physical Examination:

Neuro exam normal postictally.

Laboratory Results:

Noncontrast CT head: No bleed.


Which study is most appropriate next?', '["No further imaging", "Carotid duplex only", "EEG during active seizure only", "Lumbar puncture immediately", "MRI brain"]'::jsonb, 4, 'First unprovoked seizure in adult warrants MRI to exclude structural lesion.'),
    (v_topic_id, 'A 54-year-old male clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Use professional interpreter, not child", "Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Transfer without handoff"]'::jsonb, 0, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 32-year-old male has suspected ectopic pregnancy.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "Transvaginal pelvic ultrasound with \u03b2-hCG", "No further testing; observe"]'::jsonb, 3, 'For Suspected ectopic pregnancy, Transvaginal pelvic ultrasound with β-hCG is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 42-year-old male has fever, arthritis, and new holosystolic murmur after IV drug use.

Physical Examination:

Splinter hemorrhages, Janeway lesions.

Laboratory Results:

Blood cultures: MSSA in 2/2 bottles at 12 hours.


What is the most likely diagnosis?', '["Infective endocarditis", "Musculoskeletal strain", "Gastroenteritis", "Functional disorder", "Pulmonary embolism"]'::jsonb, 0, 'Fever, murmur, septic emboli, persistent bacteremia = IE.'),
    (v_topic_id, 'A 57-year-old female has suspected cholecystitis.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "Empiric treatment without diagnosis", "Right upper quadrant ultrasound", "No further testing; observe"]'::jsonb, 3, 'For Suspected cholecystitis, Right upper quadrant ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 60-year-old male has fever, sore throat, and a diffuse sandpaper-like rash for 2 days.

Physical Examination:

Vitals: Temp 101.2°F | HR 100.
Pharynx: Exudative tonsillitis. Skin: Circumoral pallor, accentuated neck folds.

Laboratory Results:

Rapid strep antigen positive | Throat culture pending.


What is the most likely diagnosis?', '["Drug eruption", "Measles", "Group A streptococcal pharyngitis with scarlet fever", "Infectious mononucleosis", "Kawasaki disease"]'::jsonb, 2, 'Exudative pharyngitis with sandpaper rash and positive rapid strep indicate strep/scarlet fever.'),
    (v_topic_id, 'A 60-year-old female has oliguria and rising creatinine after contrast study.

Physical Examination:

Mild edema.

Laboratory Results:

Cr 3.8 from baseline 1.0.


What is the most likely diagnosis?', '["Medication side effect", "Normal variant", "Contrast-induced AKI", "Functional pain syndrome", "Anxiety disorder"]'::jsonb, 2, 'Clinical pattern matches Contrast-induced AKI.'),
    (v_topic_id, 'A 62-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 13).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Exposure associated with higher risk of outcome", "No association", "Study proves mechanism", "Case-fatality rate reported"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 23-year-old male at 32 weeks has headache, epigastric pain, and 3+ proteinuria.

Physical Examination:

Hyperreflexia.

Laboratory Results:

Platelets 98,000.


What is the most likely diagnosis?', '["Preeclampsia with severe features", "Normal variant", "Anxiety disorder", "Functional pain syndrome", "Medication side effect"]'::jsonb, 0, 'Clinical pattern matches Preeclampsia with severe features.'),
    (v_topic_id, 'A 77-year-old male clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Transfer without handoff", "Dismiss patient concerns", "Use SPIKES framework; assess understanding first", "Avoid discussion"]'::jsonb, 3, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 45-year-old male has acute monocular painless vision loss that began 2 hours ago.

Physical Examination:

Vitals: BP 168/94.
Eye: Afferent pupillary defect on affected side; fundoscopy difficult.

Laboratory Results:

ESR 68 mm/h | CRP elevated | No retinal detachment on bedside exam.


What is the most likely diagnosis?', '["Central retinal artery occlusion", "Migraine aura", "Optic neuritis", "Acute angle-closure glaucoma", "Vitreous hemorrhage"]'::jsonb, 0, 'Painless monocular vision loss with RAPD in older patient suggests CRAO; giant cell arteritis risk.'),
    (v_topic_id, 'A 27-year-old male is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Microtubule disruption inhibiting neutrophil chemotaxis", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 1, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 83-year-old female clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Assess immediate safety; provide resources", "Guarantee cure", "Avoid discussion", "Dismiss patient concerns", "Transfer without handoff"]'::jsonb, 0, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 27-year-old female at 8 weeks gestation has pelvic pain and vaginal bleeding.

Physical Examination:

Adnexal mass.

Laboratory Results:

β-hCG 2,400, empty uterus on US.


What is the most likely diagnosis?', '["Medication side effect", "Functional pain syndrome", "Anxiety disorder", "Ectopic pregnancy", "Normal variant"]'::jsonb, 3, 'Clinical pattern matches Ectopic pregnancy.'),
    (v_topic_id, 'A 59-year-old female has suspected pneumothorax trauma.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Empiric treatment without diagnosis", "No further testing; observe", "Chest X-ray or bedside ultrasound", "PET scan whole body"]'::jsonb, 3, 'For Suspected pneumothorax trauma, Chest X-ray or bedside ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 73-year-old female is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Unknown mechanism", "Venodilation reducing preload", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 44-year-old female is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Potentiation of antithrombin III", "Direct DNA replication block only", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 1, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 34-year-old male has fever, cough, and hypoxia; recent COVID exposure.

Physical Examination:

Bilateral infiltrates.

Laboratory Results:

PCR positive for SARS-CoV-2.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Normal variant", "COVID-19 pneumonia", "Medication side effect"]'::jsonb, 3, 'Clinical pattern matches COVID-19 pneumonia.'),
    (v_topic_id, 'A 73-year-old female has acute flank pain suspicious for stone.

Physical Examination:

Hemodynamically stable.

Laboratory Results:

UA: Trace blood.


Which initial imaging study is most appropriate?', '["Noncontrast CT abdomen/pelvis", "KUB only for all patients", "No imaging", "MRI abdomen first line", "Contrast CT abdomen"]'::jsonb, 0, 'Noncontrast CT is sensitive for ureteral stones and alternative diagnoses.'),
    (v_topic_id, 'A 43-year-old male presents with bloody diarrhea thrombocytopenia.

Physical Examination:

Schistocytes

Laboratory Results:

Key finding: Supportive avoid antibiotics.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Conversion disorder", "Normal variant", "HUS STEC"]'::jsonb, 4, 'Presentation consistent with HUS STEC.'),
    (v_topic_id, 'A 31-year-old female clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Dismiss patient concerns", "Transfer without handoff", "Avoid discussion", "Explore barriers; shared decision-making"]'::jsonb, 4, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 41-year-old female presents with anion gap acidosis ketones.

Physical Examination:

Hyperglycemia

Laboratory Results:

Key finding: Insulin fluids potassium.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "DKA", "Functional disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with DKA.'),
    (v_topic_id, 'A 30-year-old male presents with hypoxemia, low compliance.

Physical Examination:

Bilateral infiltrates P/F<200

Laboratory Results:

Key finding: Lung protective ventilation.


What is the most likely diagnosis?', '["Normal variant", "ARDS", "Functional disorder", "Conversion disorder", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with ARDS.'),
    (v_topic_id, 'A 77-year-old female clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Avoid discussion", "Discuss values before procedure menu", "Transfer without handoff", "Guarantee cure"]'::jsonb, 2, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 26-year-old female presents with fever, murmur, IVDU.

Physical Examination:

Vegetation on TEE

Laboratory Results:

Key finding: IV antibiotics.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Endocarditis", "Normal variant", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with Endocarditis.'),
    (v_topic_id, 'A 66-year-old female has suspected primary hyperaldosteronism.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Aldosterone-renin ratio after correction of hypokalemia", "No testing indicated", "Empiric treatment without workup", "PET scan screening", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: Aldosterone-renin ratio after correction of hypokalemia.'),
    (v_topic_id, 'A 51-year-old male has suspected hyperthyroidism.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["TSH and free T4; thyroid uptake scan if Graves suspected", "PET scan screening", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 0, 'Appropriate initial study: TSH and free T4; thyroid uptake scan if Graves suspected.'),
    (v_topic_id, 'A 69-year-old female clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Apologize, explain, commit to prevention", "Transfer without handoff", "Avoid discussion", "Guarantee cure"]'::jsonb, 1, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 31-year-old male has suspected subdural hematoma elderly fall.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "Noncontrast head CT", "No testing indicated"]'::jsonb, 3, 'Appropriate initial study: Noncontrast head CT.'),
    (v_topic_id, 'A 33-year-old female is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "Unknown mechanism", "Irreversible inhibition of H+/K+ ATPase"]'::jsonb, 4, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 77-year-old male presents with chorea family history.

Physical Examination:

CAG repeats

Laboratory Results:

Key finding: Genetic counseling.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Huntington disease", "Normal variant", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Huntington disease.'),
    (v_topic_id, 'A 41-year-old female has suspected pheochromocytoma spells.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Plasma or 24-hour urine metanephrines", "Exome sequencing first", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Plasma or 24-hour urine metanephrines.'),
    (v_topic_id, 'A 31-year-old male presents with foul sputum, alcoholism.

Physical Examination:

Cavity air-fluid level

Laboratory Results:

Key finding: Prolonged antibiotics.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Conversion disorder", "Lung abscess", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Lung abscess.'),
    (v_topic_id, 'A 51-year-old female has acute monoarticular knee pain; joint warm and swollen.

Physical Examination:

No skin tophi.

Laboratory Results:

Synovial fluid: Needle-shaped negatively birefringent crystals.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Acute gout", "Normal variant", "Medication side effect"]'::jsonb, 2, 'Clinical pattern matches Acute gout.'),
    (v_topic_id, 'A 69-year-old female has syncope during exercise; family history of sudden death.

Physical Examination:

Murmur increases with Valsalva.

Laboratory Results:

Echo: Asymmetric septal hypertrophy.


What is the most likely diagnosis?', '["Medication side effect", "Anxiety disorder", "Normal variant", "Functional pain syndrome", "Hypertrophic cardiomyopathy"]'::jsonb, 4, 'Clinical pattern matches Hypertrophic cardiomyopathy.'),
    (v_topic_id, 'A 33-year-old male is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Unknown mechanism", "Hormone supplementation only", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 0, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 25-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 15).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Study proves mechanism", "Exposure protective", "Case-fatality rate reported", "No association"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 51-year-old female has suspected community-acquired pneumonia outpatient.

Physical Examination:

CURB-65 score 0.

Laboratory Results:

No prior antibiotics.


Which test is most appropriate at initial visit?', '["Sputum culture for all", "Bronchoscopy", "CT chest for all outpatients", "No imaging needed", "Chest X-ray"]'::jsonb, 4, 'CXR confirms infiltrate and guides management in suspected CAP.'),
    (v_topic_id, 'A 62-year-old male with hyperlipidemia takes a statin.

Physical Examination:

LFTs normal.

Laboratory Results:

LDL elevated at baseline.


Which mechanism explains LDL lowering?', '["Niacin receptor agonism", "Bile acid sequestration in gut", "Competitive inhibition of HMG-CoA reductase", "Inhibition of lipoprotein lipase", "PCSK9 gene deletion"]'::jsonb, 2, 'Statins block HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A 25-year-old male presents with hemoptysis, cavitation.

Physical Examination:

Galactomannan elevated

Laboratory Results:

Key finding: Voriconazole.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Aspergillosis neutropenic", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Aspergillosis neutropenic.'),
    (v_topic_id, 'A 32-year-old female presents with gait urinary incontinence dementia.

Physical Examination:

Large ventricles

Laboratory Results:

Key finding: VP shunt trial.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal pressure hydrocephalus", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Normal pressure hydrocephalus.'),
    (v_topic_id, 'A 60-year-old female presents with hallucinations fever.

Physical Examination:

Severe withdrawal

Laboratory Results:

Key finding: ICU benzodiazepines.


What is the most likely diagnosis?', '["Conversion disorder", "Delirium tremens", "Functional disorder", "Normal variant", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with Delirium tremens.'),
    (v_topic_id, 'A 64-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "GABA-A receptor positive allosteric modulation", "Hormone supplementation only", "Direct DNA replication block only", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 72-year-old male presents with urticaria wheeze.

Physical Examination:

Hypotension

Laboratory Results:

Key finding: Epinephrine.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "Conversion disorder", "Anaphylaxis food", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Anaphylaxis food.'),
    (v_topic_id, 'A 45-year-old female has suspected pulmonary embolism low risk.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "D-dimer then CTPA if elevated", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: D-dimer then CTPA if elevated.'),
    (v_topic_id, 'A 75-year-old female has acute bilateral eye redness with mucopurulent discharge and preauricular lymphadenopathy.

Physical Examination:

Visual acuity preserved.

Laboratory Results:

No corneal staining.


What is the most likely diagnosis?', '["Musculoskeletal strain", "Bacterial conjunctivitis", "Gastroenteritis", "Pulmonary embolism", "Functional disorder"]'::jsonb, 1, 'Mucopurulent discharge without keratitis = bacterial conjunctivitis.'),
    (v_topic_id, 'A 65-year-old male presents with bone pain anemia.

Physical Examination:

M spike plasma cells

Laboratory Results:

Key finding: Chemo transplant.


What is the most likely diagnosis?', '["Multiple myeloma", "Medication adverse effect", "Normal variant", "Functional disorder", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Multiple myeloma.'),
    (v_topic_id, 'A 49-year-old male presents with fever, anosmia, exposure.

Physical Examination:

PCR positive

Laboratory Results:

Key finding: Isolation and monitoring.


What is the most likely diagnosis?', '["Functional disorder", "COVID-19", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with COVID-19.'),
    (v_topic_id, 'A 80-year-old female a colleague appears impaired on duty smelling of alcohol.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the physician''s most appropriate action?', '["Report to patient safety/medical staff health per policy", "Cover shifts indefinitely without report", "Ignore unless patient harm occurs", "Resign immediately", "Publicly confront on ward"]'::jsonb, 0, 'Impaired colleague threatens patients; formal reporting pathways exist.'),
    (v_topic_id, 'A 25-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 11).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Case-fatality rate reported", "No association", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 63-year-old female clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Guarantee cure", "Dismiss patient concerns", "Transfer without handoff", "Explain viral etiology; offer symptomatic care"]'::jsonb, 4, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 46-year-old female has suspected aortic dissection.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Genetic panel first", "No further testing; observe", "CT angiography chest/abdomen/pelvis", "Empiric treatment without diagnosis"]'::jsonb, 3, 'For Suspected aortic dissection, CT angiography chest/abdomen/pelvis is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 64-year-old male has suspected septic arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Arthrocentesis with synovial analysis", "PET scan screening", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: Arthrocentesis with synovial analysis.'),
    (v_topic_id, 'A 30-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 9).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Study proves mechanism", "No association"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 45-year-old male an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Use physician personal preference only", "Wait indefinitely for family", "Withdraw all care immediately", "Court order required before any treatment", "Treat per emergent best-interest standard and seek ethics consult"]'::jsonb, 4, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 59-year-old female has acute headache with papilledema on exam.

Physical Examination:

Vitals: BP 190/110.

Laboratory Results:

CT head without contrast: No mass bleed.


Which study should be performed next?', '["Orbital ultrasound", "EEG", "No LP; discharge", "Immediate carotid endarterectomy", "Lumbar puncture after imaging"]'::jsonb, 4, 'Suspected meningitis/SAH with negative CT may still need LP if clinically indicated (follow local protocols).'),
    (v_topic_id, 'A 74-year-old female has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Stimulation of host IgM only", "Neutralization of endotoxin", "Inhibition of viral replication enzymes", "Increasing hepatic blood flow", "Blocking TNF-\u03b1 only"]'::jsonb, 2, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 23-year-old female with asthma uses an inhaled glucocorticoid.

Physical Examination:

Wheezes improved.

Laboratory Results:

Peak flow improved.


Which mechanism best explains the benefit of inhaled corticosteroids in asthma?', '["Paralysis of respiratory muscles", "Pulmonary vasodilation only", "Reduction of airway inflammation", "Immediate bronchodilation via \u03b22 agonism", "Increased mucus production"]'::jsonb, 2, 'ICS reduce eosinophilic airway inflammation, the core of asthma control.'),
    (v_topic_id, 'A 71-year-old female presents with fever on central line.

Physical Examination:

Blood yeast

Laboratory Results:

Key finding: Echinocandin.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder", "Candidemia"]'::jsonb, 4, 'Presentation consistent with Candidemia.'),
    (v_topic_id, 'A 72-year-old male presents with EF 20%.

Physical Examination:

S3 gallop

Laboratory Results:

Key finding: GDMT.


What is the most likely diagnosis?', '["Dilated cardiomyopathy", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Dilated cardiomyopathy.'),
    (v_topic_id, 'A 45-year-old male has suspected acute compartment syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Compartment pressure measurement", "PET scan screening", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Compartment pressure measurement.'),
    (v_topic_id, 'A 43-year-old female a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Report to child protective services", "Obtain court order first", "Refuse all care until 18", "Mandatory parental notification always", "Provide confidential care per mature minor laws"]'::jsonb, 4, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 72-year-old male has auditory hallucinations and disorganized thought for 6 months.

Physical Examination:

Flat affect.

Laboratory Results:

Negative toxicology.


What is the most likely diagnosis?', '["Schizophrenia", "Medication side effect", "Functional pain syndrome", "Normal variant", "Anxiety disorder"]'::jsonb, 0, 'Clinical pattern matches Schizophrenia.'),
    (v_topic_id, 'A 33-year-old male has suspected biliary obstruction.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Empiric treatment without diagnosis", "Genetic panel first", "RUQ ultrasound first", "No further testing; observe"]'::jsonb, 3, 'For Suspected biliary obstruction, RUQ ultrasound first is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 49-year-old female has suspected acute cholecystitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "PET scan screening", "Right upper quadrant ultrasound", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 2, 'Appropriate initial study: Right upper quadrant ultrasound.'),
    (v_topic_id, 'A 57-year-old female child has fever and drooling in tripod position.

Physical Examination:

Muffled voice.

Laboratory Results:

Lateral neck X-ray: Thumbprint sign.


What is the most likely diagnosis?', '["Functional pain syndrome", "Epiglottitis", "Medication side effect", "Normal variant", "Anxiety disorder"]'::jsonb, 1, 'Clinical pattern matches Epiglottitis.'),
    (v_topic_id, 'A 27-year-old female presents with epigastric pain.

Physical Examination:

Urea breath test positive

Laboratory Results:

Key finding: Triple therapy.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Functional disorder", "Peptic ulcer H pylori", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with Peptic ulcer H pylori.'),
    (v_topic_id, 'A 34-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 4).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Study proves mechanism", "Case-fatality rate reported", "No association", "Exposure protective"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 62-year-old female has suspected urinary tract obstruction.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "PET scan screening", "Renal ultrasound or noncontrast CT"]'::jsonb, 4, 'Appropriate initial study: Renal ultrasound or noncontrast CT.'),
    (v_topic_id, 'A 26-year-old female presents with pulmonary edema post MI.

Physical Examination:

Holosystolic murmur

Laboratory Results:

Key finding: Afterload reduction, surgery.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Medication adverse effect", "Conversion disorder", "Mitral regurgitation acute"]'::jsonb, 4, 'Presentation consistent with Mitral regurgitation acute.'),
    (v_topic_id, 'A 47-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 6).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure protective", "Exposure associated with higher risk of outcome", "Study proves mechanism", "No association"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 63-year-old male is prescribed therapy for Opioid condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "\u03bc-opioid receptor agonism", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: μ-opioid receptor agonism.'),
    (v_topic_id, 'A 47-year-old female clinical scenario: Medical error disclosed to patient.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Apologize, explain, commit to prevention", "Transfer without handoff"]'::jsonb, 3, 'Best practice: Apologize, explain, commit to prevention.'),
    (v_topic_id, 'A 47-year-old male has suspected hemochromatosis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Empiric treatment without workup", "Ferritin, transferrin saturation, HFE genotyping", "PET scan screening", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Ferritin, transferrin saturation, HFE genotyping.'),
    (v_topic_id, 'A 65-year-old male has suspected rheumatoid arthritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["RF, anti-CCP, and baseline X-rays", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: RF, anti-CCP, and baseline X-rays.'),
    (v_topic_id, 'A 41-year-old female has chronic cough, weight loss, and hemoptysis; 40 pack-year smoking history.

Physical Examination:

Lungs: Decreased breath sounds right upper lobe.

Laboratory Results:

Chest CT: Spiculated 3-cm right upper lobe mass.


What is the most likely diagnosis?', '["Lung cancer", "Musculoskeletal strain", "Gastroenteritis", "Functional disorder", "Pulmonary embolism"]'::jsonb, 0, 'Smoker with hemoptysis and spiculated mass — lung cancer until proven otherwise.'),
    (v_topic_id, 'A 58-year-old female clinical scenario: Interpreter needed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Guarantee cure", "Avoid discussion", "Use professional interpreter, not child", "Transfer without handoff"]'::jsonb, 3, 'Best practice: Use professional interpreter, not child.'),
    (v_topic_id, 'A 62-year-old female has acute unilateral facial droop and inability to close one eye.

Physical Examination:

Forehead involvement on affected side.

Laboratory Results:

Noncontrast CT head: No hemorrhage.


What is the most likely diagnosis?', '["Functional disorder", "Musculoskeletal strain", "Pulmonary embolism", "Bell palsy", "Gastroenteritis"]'::jsonb, 3, 'Peripheral VII palsy with forehead involvement, negative CT — Bell palsy.'),
    (v_topic_id, 'A 83-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 63-year-old female presents with urethritis arthritis conjunctivitis.

Physical Examination:

Post Chlamydia

Laboratory Results:

Key finding: NSAIDs treat infection.


What is the most likely diagnosis?', '["Medication adverse effect", "Reactive arthritis", "Functional disorder", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Reactive arthritis.'),
    (v_topic_id, 'A 39-year-old male is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Reduced myocardial oxygen demand and arrhythmia risk", "Direct DNA replication block only", "Hormone supplementation only"]'::jsonb, 2, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 51-year-old female has suspected knee internal derangement.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "PET scan whole body", "MRI knee", "Empiric treatment without diagnosis", "Genetic panel first"]'::jsonb, 2, 'For Suspected knee internal derangement, MRI knee is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 24-year-old male presents with macrocytic alcohol.

Physical Examination:

Low folate

Laboratory Results:

Key finding: Folate.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "Folate deficiency", "Functional disorder", "Medication adverse effect"]'::jsonb, 2, 'Presentation consistent with Folate deficiency.'),
    (v_topic_id, 'A 32-year-old female has suspected myasthenia gravis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "Empiric treatment without workup", "Acetylcholine receptor antibodies and edrophonium/EMG", "No testing indicated"]'::jsonb, 3, 'Appropriate initial study: Acetylcholine receptor antibodies and edrophonium/EMG.'),
    (v_topic_id, 'A 72-year-old male is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Inhibition of L-type calcium channels in vascular smooth muscle", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 51-year-old female has suspected acute pericarditis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "ECG, troponin, echocardiography", "No testing indicated", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: ECG, troponin, echocardiography.'),
    (v_topic_id, 'A 58-year-old male a screening test has sensitivity 90% and specificity 80% in a low-prevalence population.

Physical Examination:

N/A

Laboratory Results:

N/A


If a patient has a positive test, which statement is most accurate regarding PPV?', '["PPV is lower than in high-prevalence settings", "PPV equals sensitivity", "PPV equals specificity", "PPV is always 90%", "PPV is independent of prevalence"]'::jsonb, 0, 'PPV falls when disease prevalence is low, even with good test characteristics.'),
    (v_topic_id, 'A 39-year-old female is prescribed therapy for Warfarin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Unknown mechanism", "Vitamin K epoxide reductase inhibition", "Placebo effect only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Vitamin K epoxide reductase inhibition.'),
    (v_topic_id, 'A 34-year-old male is prescribed therapy for Beta-blocker condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Reduced myocardial oxygen demand and arrhythmia risk", "Placebo effect only", "Direct DNA replication block only", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 0, 'Correct mechanism: Reduced myocardial oxygen demand and arrhythmia risk.'),
    (v_topic_id, 'A 74-year-old female presents with bulbar weakness.

Physical Examination:

Anti-AChR

Laboratory Results:

Key finding: Plasmapheresis ventilation.


What is the most likely diagnosis?', '["Myasthenia crisis", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 0, 'Presentation consistent with Myasthenia crisis.'),
    (v_topic_id, 'A 56-year-old male has acute severe abdominal pain out of proportion to exam findings.

Physical Examination:

Abdomen: Soft, mild tenderness.

Laboratory Results:

Lactate 5.8 mmol/L | CT: SMA occlusion.


What is the most likely diagnosis?', '["Mesenteric ischemia", "Functional disorder", "Musculoskeletal strain", "Pulmonary embolism", "Gastroenteritis"]'::jsonb, 0, 'Pain out of proportion, elevated lactate, SMA occlusion = mesenteric ischemia.'),
    (v_topic_id, 'A 37-year-old female clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Acknowledge emotion, apologize for delay, clarify plan", "Avoid discussion", "Guarantee cure", "Transfer without handoff", "Dismiss patient concerns"]'::jsonb, 0, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 31-year-old female has chronic productive cough and hyperinflation on imaging.

Physical Examination:

Barrel chest.

Laboratory Results:

PFTs: FEV1/FVC 0.62, reduced FEV1.


What is the most likely diagnosis?', '["Normal variant", "COPD", "Anxiety disorder", "Medication side effect", "Functional pain syndrome"]'::jsonb, 1, 'Clinical pattern matches COPD.'),
    (v_topic_id, 'A 55-year-old female has suspected osteomyelitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["MRI of involved bone and blood cultures", "No testing indicated", "PET scan screening", "Empiric treatment without workup", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: MRI of involved bone and blood cultures.'),
    (v_topic_id, 'A 44-year-old male has suspected interstitial lung disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "High-resolution CT chest", "No testing indicated", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: High-resolution CT chest.'),
    (v_topic_id, 'A 50-year-old female with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["\u03b1-glucosidase inhibition", "Decreased hepatic gluconeogenesis", "DPP-4 inhibition", "SGLT2-mediated glucosuria only", "Stimulation of insulin secretion from \u03b2 cells"]'::jsonb, 1, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 28-year-old male has suspected acute pancreatitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Lipase and triglycerides; CT if severe or uncertain", "Empiric treatment without workup", "PET scan screening", "No testing indicated"]'::jsonb, 1, 'Appropriate initial study: Lipase and triglycerides; CT if severe or uncertain.'),
    (v_topic_id, 'A 38-year-old female is prescribed therapy for Colchicine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Placebo effect only", "Hormone supplementation only", "Microtubule disruption inhibiting neutrophil chemotaxis"]'::jsonb, 4, 'Correct mechanism: Microtubule disruption inhibiting neutrophil chemotaxis.'),
    (v_topic_id, 'A 84-year-old female has fever, dysuria, and suprapubic pain for 2 days.

Physical Examination:

CVA tenderness absent.

Laboratory Results:

UA: Nitrites positive, WBC 50/hpf.


What is the most likely diagnosis?', '["Functional disorder", "Pulmonary embolism", "Gastroenteritis", "Acute uncomplicated cystitis", "Musculoskeletal strain"]'::jsonb, 3, 'Dysuria, suprapubic pain, positive nitrites = UTI.'),
    (v_topic_id, 'A 79-year-old male presents with widespread pain tender points.

Physical Examination:

Normal labs

Laboratory Results:

Key finding: Exercise SNRI.


What is the most likely diagnosis?', '["Fibromyalgia", "Functional disorder", "Normal variant", "Conversion disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Fibromyalgia.'),
    (v_topic_id, 'A 84-year-old female presents with overdose history.

Physical Examination:

Positive urine

Laboratory Results:

Key finding: Buprenorphine naloxone.


What is the most likely diagnosis?', '["Conversion disorder", "Normal variant", "Functional disorder", "Medication adverse effect", "Opioid use disorder"]'::jsonb, 4, 'Presentation consistent with Opioid use disorder.'),
    (v_topic_id, 'A 24-year-old female has lower extremity edema and orthopnea; BNP markedly elevated.

Physical Examination:

S3, JVD.

Laboratory Results:

Echo: Dilated cardiomyopathy EF 20%.


What is the most likely diagnosis?', '["Anxiety disorder", "Functional pain syndrome", "Normal variant", "Decompensated heart failure", "Medication side effect"]'::jsonb, 3, 'Clinical pattern matches Decompensated heart failure.'),
    (v_topic_id, 'A 75-year-old male presents with hematemesis cirrhosis.

Physical Examination:

Varices on endoscopy

Laboratory Results:

Key finding: Band ligation + octreotide.


What is the most likely diagnosis?', '["Medication adverse effect", "Esophageal varices", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Esophageal varices.'),
    (v_topic_id, 'A 68-year-old female an incapacitated patient has no surrogate; life-sustaining treatment decision needed emergently.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate next step?', '["Treat per emergent best-interest standard and seek ethics consult", "Wait indefinitely for family", "Use physician personal preference only", "Court order required before any treatment", "Withdraw all care immediately"]'::jsonb, 0, 'Emergency treatment in incapacitated patients without surrogate follows best-interest/emergency standards.'),
    (v_topic_id, 'A 62-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 7).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "Exposure protective", "No association", "Case-fatality rate reported", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 67-year-old male presents with dysphagia solids and liquids.

Physical Examination:

Bird beak on barium

Laboratory Results:

Key finding: POEM or pneumatic dilation.


What is the most likely diagnosis?', '["Functional disorder", "Conversion disorder", "Normal variant", "Achalasia", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Achalasia.'),
    (v_topic_id, 'A 70-year-old male presents with LLQ pain fever.

Physical Examination:

CT fat stranding sigmoid

Laboratory Results:

Key finding: Antibiotics bowel rest.


What is the most likely diagnosis?', '["Conversion disorder", "Diverticulitis", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Diverticulitis.'),
    (v_topic_id, 'A 59-year-old female presents with tremor autonomic.

Physical Examination:

CIWA high

Laboratory Results:

Key finding: Benzodiazepines thiamine.


What is the most likely diagnosis?', '["Functional disorder", "Alcohol withdrawal", "Normal variant", "Medication adverse effect", "Conversion disorder"]'::jsonb, 1, 'Presentation consistent with Alcohol withdrawal.'),
    (v_topic_id, 'A 46-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 2).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "No association", "Exposure protective", "Study proves mechanism", "Case-fatality rate reported"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 27-year-old female presents with acute cytopenias blasts.

Physical Examination:

Auer rods

Laboratory Results:

Key finding: Chemotherapy.


What is the most likely diagnosis?', '["AML", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with AML.'),
    (v_topic_id, 'A 35-year-old male has suspected PID.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Empiric treatment without workup", "Pelvic exam with NAAT for gonorrhea/chlamydia", "No testing indicated", "Exome sequencing first"]'::jsonb, 2, 'Appropriate initial study: Pelvic exam with NAAT for gonorrhea/chlamydia.'),
    (v_topic_id, 'A 84-year-old male a trial reports RR 0.72 for death with Drug X vs placebo (95% CI 0.55–0.94).

Physical Examination:

N/A

Laboratory Results:

N/A


Which conclusion is most appropriate?', '["Study is case-control", "No association", "CI proves causation individually", "Drug X increases mortality", "Drug X is associated with lower mortality"]'::jsonb, 4, 'RR <1 with CI excluding 1 suggests lower event rate with treatment.'),
    (v_topic_id, 'A 64-year-old male is prescribed therapy for Proton condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Irreversible inhibition of H+/K+ ATPase", "Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 0, 'Correct mechanism: Irreversible inhibition of H+/K+ ATPase.'),
    (v_topic_id, 'A 67-year-old male is prescribed therapy for Benzodiazepine condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Direct DNA replication block only", "Hormone supplementation only", "Placebo effect only", "GABA-A receptor positive allosteric modulation"]'::jsonb, 4, 'Correct mechanism: GABA-A receptor positive allosteric modulation.'),
    (v_topic_id, 'A 78-year-old male clinical scenario: Angry patient about wait time.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Acknowledge emotion, apologize for delay, clarify plan", "Dismiss patient concerns", "Transfer without handoff", "Avoid discussion"]'::jsonb, 1, 'Best practice: Acknowledge emotion, apologize for delay, clarify plan.'),
    (v_topic_id, 'A 29-year-old female is prescribed therapy for Heparin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Placebo effect only", "Potentiation of antithrombin III", "Unknown mechanism", "Hormone supplementation only"]'::jsonb, 2, 'Correct mechanism: Potentiation of antithrombin III.'),
    (v_topic_id, 'A 45-year-old male presents with rapid Cr rise hematuria.

Physical Examination:

Crescents on biopsy

Laboratory Results:

Key finding: Pulse steroids plasmapheresis.


What is the most likely diagnosis?', '["RPGN", "Functional disorder", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 0, 'Presentation consistent with RPGN.'),
    (v_topic_id, 'A 25-year-old female infant has paroxysmal cough followed by whoop.

Physical Examination:

No fever.

Laboratory Results:

WBC lymphocytosis.


What is the most likely diagnosis?', '["Functional pain syndrome", "Medication side effect", "Anxiety disorder", "Normal variant", "Pertussis"]'::jsonb, 4, 'Clinical pattern matches Pertussis.'),
    (v_topic_id, 'A 41-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 2).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure protective", "No association", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 31-year-old female is prescribed therapy for Nitroglycerin condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Placebo effect only", "Venodilation reducing preload", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: Venodilation reducing preload.'),
    (v_topic_id, 'A 51-year-old male has suspected prostate cancer elevated PSA.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "MRI-targeted biopsy pathway per guidelines", "No testing indicated", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: MRI-targeted biopsy pathway per guidelines.'),
    (v_topic_id, 'A 34-year-old female has chronic hepatitis C and asks why interferon-free regimens cure infection.

Physical Examination:

No ascites.

Laboratory Results:

HCV RNA detectable.


Which mechanism best explains successful direct-acting antiviral therapy?', '["Inhibition of viral replication enzymes", "Blocking TNF-\u03b1 only", "Increasing hepatic blood flow", "Stimulation of host IgM only", "Neutralization of endotoxin"]'::jsonb, 0, 'DAAs target HCV NS3/4A, NS5A, NS5B polymerase — blocking viral replication.'),
    (v_topic_id, 'A 37-year-old male has suspected pleural effusion.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup", "Thoracentesis with fluid studies"]'::jsonb, 4, 'Appropriate initial study: Thoracentesis with fluid studies.'),
    (v_topic_id, 'A 30-year-old female has suspected acute diverticulitis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Exome sequencing first", "CT abdomen with contrast", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 2, 'Appropriate initial study: CT abdomen with contrast.'),
    (v_topic_id, 'A 79-year-old female presents with mediastinal mass night sweats.

Physical Examination:

Reed-Sternberg

Laboratory Results:

Key finding: ABVD.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Conversion disorder", "Normal variant", "Hodgkin lymphoma"]'::jsonb, 4, 'Presentation consistent with Hodgkin lymphoma.'),
    (v_topic_id, 'A 43-year-old female clinical scenario: End-of-life goals of care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Transfer without handoff", "Discuss values before procedure menu", "Avoid discussion", "Guarantee cure", "Dismiss patient concerns"]'::jsonb, 1, 'Best practice: Discuss values before procedure menu.'),
    (v_topic_id, 'A 66-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 3).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Study proves mechanism", "No association", "Exposure associated with higher risk of outcome", "Exposure protective", "Case-fatality rate reported"]'::jsonb, 2, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 56-year-old male clinical scenario: Request for inappropriate antibiotics.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Transfer without handoff", "Explain viral etiology; offer symptomatic care", "Guarantee cure", "Avoid discussion"]'::jsonb, 2, 'Best practice: Explain viral etiology; offer symptomatic care.'),
    (v_topic_id, 'A 74-year-old female is prescribed therapy for Loop condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Placebo effect only", "Inhibition of Na-K-2Cl cotransporter in loop of Henle", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: Inhibition of Na-K-2Cl cotransporter in loop of Henle.'),
    (v_topic_id, 'A 44-year-old female presents with irregular menses hirsutism.

Physical Examination:

High androgens

Laboratory Results:

Key finding: Weight loss OCPs.


What is the most likely diagnosis?', '["Conversion disorder", "PCOS", "Functional disorder", "Medication adverse effect", "Normal variant"]'::jsonb, 1, 'Presentation consistent with PCOS.'),
    (v_topic_id, 'A 43-year-old female presents with bone pain fever.

Physical Examination:

MRI edema

Laboratory Results:

Key finding: Prolonged antibiotics.


What is the most likely diagnosis?', '["Osteomyelitis", "Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Osteomyelitis.'),
    (v_topic_id, 'A 22-year-old female presents with exertional syncope.

Physical Examination:

Loud P2

Laboratory Results:

Key finding: PAH targeted therapy.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Functional disorder", "Conversion disorder", "Pulmonary hypertension"]'::jsonb, 4, 'Presentation consistent with Pulmonary hypertension.'),
    (v_topic_id, 'A 44-year-old female presents with proximal weakness CK high.

Physical Examination:

Endomysial inflammation

Laboratory Results:

Key finding: Steroids immunosuppression.


What is the most likely diagnosis?', '["Functional disorder", "Polymyositis", "Normal variant", "Conversion disorder", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with Polymyositis.'),
    (v_topic_id, 'A 34-year-old female has suspected lung nodule incidental.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["CT chest per Fleischner criteria", "PET scan screening", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: CT chest per Fleischner criteria.'),
    (v_topic_id, 'A 79-year-old female has suspected dvt unilateral leg swelling.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Lower extremity venous duplex ultrasound", "PET scan whole body", "No further testing; observe", "Empiric treatment without diagnosis"]'::jsonb, 1, 'For Suspected DVT unilateral leg swelling, Lower extremity venous duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 63-year-old male has suspected Cushing syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "Empiric treatment without workup", "PET scan screening", "No testing indicated", "Overnight 1-mg dexamethasone suppression test"]'::jsonb, 4, 'Appropriate initial study: Overnight 1-mg dexamethasone suppression test.'),
    (v_topic_id, 'A 28-year-old male presents with erythema migrans after hiking.

Physical Examination:

ELISA positive

Laboratory Results:

Key finding: Doxycycline.


What is the most likely diagnosis?', '["Normal variant", "Lyme disease", "Medication adverse effect", "Conversion disorder", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Lyme disease.'),
    (v_topic_id, 'A 62-year-old female has suspected carotid bruit stroke prevention.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Carotid duplex ultrasonography", "Exome sequencing first", "PET scan screening", "Empiric treatment without workup", "No testing indicated"]'::jsonb, 0, 'Appropriate initial study: Carotid duplex ultrasonography.'),
    (v_topic_id, 'A 68-year-old male has microcytic anemia and occult blood positive stool.

Physical Examination:

No weight loss yet.

Laboratory Results:

Hgb 9.2 g/dL.


Which diagnostic evaluation is most appropriate?', '["Colonoscopy", "Repeat CBC in 1 year", "Bone marrow biopsy", "Empiric iron without evaluation", "Abdominal ultrasound only"]'::jsonb, 0, 'Positive occult blood with anemia requires colonoscopy to exclude malignancy.'),
    (v_topic_id, 'A 64-year-old female is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Unknown mechanism", "Placebo effect only", "Inhibition of dihydrofolate reductase", "Hormone supplementation only", "Direct DNA replication block only"]'::jsonb, 2, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 44-year-old female has suspected temporal arteritis vision symptoms.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe", "Temporal artery biopsy after steroids if vision threatened"]'::jsonb, 4, 'For Suspected temporal arteritis vision symptoms, Temporal artery biopsy after steroids if vision threatened is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 83-year-old male is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Direct DNA replication block only", "Placebo effect only", "Selective serotonin reuptake inhibition", "Unknown mechanism"]'::jsonb, 3, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 83-year-old female has suspected testicular cancer mass.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Scrotal ultrasound and tumor markers", "PET scan screening", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: Scrotal ultrasound and tumor markers.'),
    (v_topic_id, 'A 54-year-old male has ascending numbness after Campylobacter gastroenteritis.

Physical Examination:

Areflexia.

Laboratory Results:

CSF albuminocytologic dissociation.


What is the most likely diagnosis?', '["Anxiety disorder", "Medication side effect", "Normal variant", "Functional pain syndrome", "Guillain-Barr\u00e9 syndrome"]'::jsonb, 4, 'Clinical pattern matches Guillain-Barré syndrome.'),
    (v_topic_id, 'A 27-year-old female has suspected acute spinal cord compression.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "Genetic panel first", "Empiric treatment without diagnosis", "PET scan whole body", "MRI spine emergently"]'::jsonb, 4, 'For Suspected acute spinal cord compression, MRI spine emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 58-year-old female is prescribed therapy for Methotrexate condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Placebo effect only", "Direct DNA replication block only", "Hormone supplementation only", "Unknown mechanism", "Inhibition of dihydrofolate reductase"]'::jsonb, 4, 'Correct mechanism: Inhibition of dihydrofolate reductase.'),
    (v_topic_id, 'A 38-year-old male presents with hyperkalemia mild acidosis.

Physical Examination:

Hypoaldosteronism

Laboratory Results:

Key finding: Fludrocortisone treat cause.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder", "RTA type 4"]'::jsonb, 4, 'Presentation consistent with RTA type 4.'),
    (v_topic_id, 'A 28-year-old male has unexplained iron deficiency anemia.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Esophagogastroduodenoscopy and colonoscopy", "Exome sequencing first", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: Esophagogastroduodenoscopy and colonoscopy.'),
    (v_topic_id, 'A 30-year-old female presents with confusion.

Physical Examination:

High insulin C-peptide

Laboratory Results:

Key finding: D50 octreotide.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Medication adverse effect", "Hypoglycemia sulfonylurea", "Normal variant"]'::jsonb, 3, 'Presentation consistent with Hypoglycemia sulfonylurea.'),
    (v_topic_id, 'A 23-year-old female has suspected appendicitis rlq pain.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["No further testing; observe", "PET scan whole body", "CT abdomen with contrast or ultrasound in pregnancy", "Empiric treatment without diagnosis", "Genetic panel first"]'::jsonb, 2, 'For Suspected appendicitis RLQ pain, CT abdomen with contrast or ultrasound in pregnancy is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 63-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 12).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "No association", "Study proves mechanism"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 55-year-old male presents with fever agitation.

Physical Examination:

Very low TSH high T4

Laboratory Results:

Key finding: Propranolol PTU iodine.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect", "Thyroid storm"]'::jsonb, 4, 'Presentation consistent with Thyroid storm.'),
    (v_topic_id, 'A 38-year-old female presents with macrocytic neuropathy.

Physical Examination:

Low B12 methylmalonic high

Laboratory Results:

Key finding: B12 replacement.


What is the most likely diagnosis?', '["Medication adverse effect", "Normal variant", "Functional disorder", "B12 deficiency", "Conversion disorder"]'::jsonb, 3, 'Presentation consistent with B12 deficiency.'),
    (v_topic_id, 'A 23-year-old male has suspected acute cholecystitis.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Empiric treatment without diagnosis", "HIDA scan if US equivocal", "No further testing; observe", "Genetic panel first"]'::jsonb, 2, 'For Suspected acute cholecystitis, HIDA scan if US equivocal is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 40-year-old male has fatigue, pruritus, and dark urine after camping trip.

Physical Examination:

Scleral icterus.

Laboratory Results:

Anti-HAV IgM positive.


What is the most likely diagnosis?', '["Musculoskeletal strain", "Gastroenteritis", "Pulmonary embolism", "Acute hepatitis A", "Functional disorder"]'::jsonb, 3, 'IgM anti-HAV confirms acute HAV.'),
    (v_topic_id, 'A 70-year-old male has acute severe headache described as the worst of his life, with brief loss of consciousness.

Physical Examination:

Vitals: HR 88 | BP 168/96.
Neuro: Meningismus; no lateralizing signs initially.

Laboratory Results:

Noncontrast head CT: Hyperdensity in basal cisterns.


What is the most likely diagnosis?', '["Migraine", "Subarachnoid hemorrhage", "Tension headache", "Cluster headache", "Meningitis"]'::jsonb, 1, 'Thunderclap headache with cisternal blood on CT = SAH until proven otherwise.'),
    (v_topic_id, 'A 82-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 14).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Study proves mechanism", "Case-fatality rate reported", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 56-year-old female is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Unknown mechanism", "Placebo effect only", "Hormone supplementation only", "Local anti-inflammatory glucocorticoid effect"]'::jsonb, 4, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 23-year-old male has fever, uterine tenderness, and foul lochia day 5 postpartum.

Physical Examination:

Tachycardia.

Laboratory Results:

WBC 18,000.


What is the most likely diagnosis?', '["Normal variant", "Functional pain syndrome", "Medication side effect", "Anxiety disorder", "Postpartum endometritis"]'::jsonb, 4, 'Clinical pattern matches Postpartum endometritis.'),
    (v_topic_id, 'A 41-year-old female clinical scenario: Breaking bad news of cancer diagnosis.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Avoid discussion", "Guarantee cure", "Transfer without handoff", "Use SPIKES framework; assess understanding first", "Dismiss patient concerns"]'::jsonb, 3, 'Best practice: Use SPIKES framework; assess understanding first.'),
    (v_topic_id, 'A 84-year-old male presents with regular tachycardia 150.

Physical Examination:

Sawtooth flutter waves

Laboratory Results:

Key finding: Rate control/cardioversion.


What is the most likely diagnosis?', '["Atrial flutter", "Medication adverse effect", "Normal variant", "Conversion disorder", "Functional disorder"]'::jsonb, 0, 'Presentation consistent with Atrial flutter.'),
    (v_topic_id, 'A 46-year-old male has suspected thyroid nodule.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Genetic panel first", "Thyroid ultrasound with FNA if indicated", "PET scan whole body", "Empiric treatment without diagnosis", "No further testing; observe"]'::jsonb, 1, 'For Suspected thyroid nodule, Thyroid ultrasound with FNA if indicated is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 35-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 15).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["No association", "Exposure protective", "Case-fatality rate reported", "Study proves mechanism", "Exposure associated with higher risk of outcome"]'::jsonb, 4, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 51-year-old female a cohort study evaluates risk factor Z for outcome Y (mock scenario 10).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure protective", "No association", "Case-fatality rate reported", "Exposure associated with higher risk of outcome", "Study proves mechanism"]'::jsonb, 3, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 34-year-old male has pruritic vesicles in different stages on the trunk and face after daycare exposure.

Physical Examination:

Vitals: Temp 99.8°F.
Skin: Macules, papules, vesicles, crusted lesions simultaneously.

Laboratory Results:

No labs required for typical presentation.


What is the most likely diagnosis?', '["Varicella (chickenpox)", "Hand-foot-mouth disease", "Impetigo", "Contact dermatitis", "Herpes zoster"]'::jsonb, 0, 'Lesions in multiple stages (crop phenomenon) are classic for varicella.'),
    (v_topic_id, 'A 34-year-old female presents with child nephrotic selective protein.

Physical Examination:

Foot process effacement

Laboratory Results:

Key finding: Steroids.


What is the most likely diagnosis?', '["Normal variant", "Minimal change disease", "Conversion disorder", "Medication adverse effect", "Functional disorder"]'::jsonb, 1, 'Presentation consistent with Minimal change disease.'),
    (v_topic_id, 'A 30-year-old female a 16-year-old requests contraception and asks that parents not be informed; state allows mature minor care.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate action?', '["Obtain court order first", "Provide confidential care per mature minor laws", "Mandatory parental notification always", "Report to child protective services", "Refuse all care until 18"]'::jsonb, 1, 'Many jurisdictions allow confidential reproductive care for mature minors.'),
    (v_topic_id, 'A 29-year-old male has suspected temporal arteritis.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["ESR/CRP and temporal artery biopsy", "Empiric treatment without workup", "No testing indicated", "PET scan screening", "Exome sequencing first"]'::jsonb, 0, 'Appropriate initial study: ESR/CRP and temporal artery biopsy.'),
    (v_topic_id, 'A 31-year-old female has new-onset ascites and suspected cirrhosis.

Physical Examination:

Shifting dullness present.

Laboratory Results:

No prior imaging.


Which study is most appropriate as the next diagnostic step?', '["Serum ammonia alone", "Immediate liver transplant referral without workup", "Upper endoscopy before any fluid studies", "Diagnostic paracentesis", "CT abdomen only"]'::jsonb, 3, 'New ascites requires diagnostic paracentesis to assess for SBP and etiology.'),
    (v_topic_id, 'A 65-year-old male a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Call security", "Obtain psychiatric hold", "Sedate and transfuse", "Transfuse emergently regardless", "Honor refusal; optimize nonblood alternatives"]'::jsonb, 4, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 35-year-old male has suspected SLE flare.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "No testing indicated", "Empiric treatment without workup", "Exome sequencing first", "ANA, anti-dsDNA, complement levels, urinalysis"]'::jsonb, 4, 'Appropriate initial study: ANA, anti-dsDNA, complement levels, urinalysis.'),
    (v_topic_id, 'A 42-year-old female presents with lymphocytosis elderly.

Physical Examination:

Smudge cells

Laboratory Results:

Key finding: Watch treat.


What is the most likely diagnosis?', '["CLL", "Normal variant", "Conversion disorder", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with CLL.'),
    (v_topic_id, 'A 50-year-old male presents with young neuropsychiatric.

Physical Examination:

Low ceruloplasmin

Laboratory Results:

Key finding: Chelation.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Normal variant", "Medication adverse effect", "Wilson disease"]'::jsonb, 4, 'Presentation consistent with Wilson disease.'),
    (v_topic_id, 'A 45-year-old female a patient refuses blood transfusion for religious reasons but is alert and competent.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate management?', '["Transfuse emergently regardless", "Obtain psychiatric hold", "Honor refusal; optimize nonblood alternatives", "Sedate and transfuse", "Call security"]'::jsonb, 2, 'Competent adults may refuse transfusions; document informed refusal.'),
    (v_topic_id, 'A 67-year-old female presents with elevated ALT.

Physical Examination:

HCV RNA positive

Laboratory Results:

Key finding: DAA therapy.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Conversion disorder", "Functional disorder", "Hepatitis C chronic"]'::jsonb, 4, 'Presentation consistent with Hepatitis C chronic.'),
    (v_topic_id, 'A 33-year-old female presents with nightmares hypervigilance.

Physical Examination:

Trauma history

Laboratory Results:

Key finding: Trauma-focused therapy SSRI.


What is the most likely diagnosis?', '["Normal variant", "Conversion disorder", "PTSD", "Medication adverse effect", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with PTSD.'),
    (v_topic_id, 'A 62-year-old female has RUQ pain after fatty meal with positive Murphy sign.

Physical Examination:

Fever mild.

Laboratory Results:

US: Gallstones, gallbladder wall thickening.


What is the most likely diagnosis?', '["Acute cholecystitis", "Anxiety disorder", "Medication side effect", "Normal variant", "Functional pain syndrome"]'::jsonb, 0, 'Clinical pattern matches Acute cholecystitis.'),
    (v_topic_id, 'A 71-year-old female presents with night sweats, weight loss.

Physical Examination:

AFB positive

Laboratory Results:

Key finding: RIPE therapy.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Functional disorder", "Normal variant", "Tuberculosis"]'::jsonb, 4, 'Presentation consistent with Tuberculosis.'),
    (v_topic_id, 'A 65-year-old male with type 2 diabetes receives metformin.

Physical Examination:

No lactic acidosis risk factors.

Laboratory Results:

A1c 8.9%.


Which mechanism best explains metformin''s primary effect?', '["SGLT2-mediated glucosuria only", "DPP-4 inhibition", "Decreased hepatic gluconeogenesis", "Stimulation of insulin secretion from \u03b2 cells", "\u03b1-glucosidase inhibition"]'::jsonb, 2, 'Metformin mainly lowers hepatic glucose production.'),
    (v_topic_id, 'A 84-year-old female has suspected carotid stenosis bruit.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "Empiric treatment without diagnosis", "Genetic panel first", "No further testing; observe", "Carotid duplex ultrasound"]'::jsonb, 4, 'For Suspected carotid stenosis bruit, Carotid duplex ultrasound is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 53-year-old male presents with hyperpigmentation hypotension.

Physical Examination:

Low cortisol high ACTH

Laboratory Results:

Key finding: Hydrocortisone fludrocortisone.


What is the most likely diagnosis?', '["Medication adverse effect", "Functional disorder", "Addison disease", "Conversion disorder", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Addison disease.'),
    (v_topic_id, 'A 52-year-old male is prescribed therapy for CCB condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Placebo effect only", "Inhibition of L-type calcium channels in vascular smooth muscle", "Hormone supplementation only", "Unknown mechanism"]'::jsonb, 2, 'Correct mechanism: Inhibition of L-type calcium channels in vascular smooth muscle.'),
    (v_topic_id, 'A 46-year-old male with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Arterial vasoconstriction", "Inhibition of angiotensin II\u2013mediated remodeling", "Sodium retention", "Positive inotropy", "Increased preload"]'::jsonb, 1, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 38-year-old male has suspected adrenal incidentaloma.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["PET scan whole body", "CT adrenal protocol or MRI", "Empiric treatment without diagnosis", "Genetic panel first", "No further testing; observe"]'::jsonb, 1, 'For Suspected adrenal incidentaloma, CT adrenal protocol or MRI is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 43-year-old male a study finds OR 2.4 (p=0.03) for smoking and lung cancer.

Physical Examination:

N/A

Laboratory Results:

N/A


This design is most likely:', '["Cohort with relative risk only", "RCT", "Case-control study", "Case series", "Cross-sectional survey only"]'::jsonb, 2, 'OR is typical effect measure in case-control studies.'),
    (v_topic_id, 'A 62-year-old male presents with Charcot triad.

Physical Examination:

CBD dilation

Laboratory Results:

Key finding: IV antibiotics ERCP.


What is the most likely diagnosis?', '["Conversion disorder", "Medication adverse effect", "Cholangitis", "Normal variant", "Functional disorder"]'::jsonb, 2, 'Presentation consistent with Cholangitis.'),
    (v_topic_id, 'A 77-year-old female presents with optic neuritis weakness.

Physical Examination:

Demyelinating plaques

Laboratory Results:

Key finding: Steroids.


What is the most likely diagnosis?', '["Functional disorder", "Normal variant", "MS relapse", "Medication adverse effect", "Conversion disorder"]'::jsonb, 2, 'Presentation consistent with MS relapse.'),
    (v_topic_id, 'A 70-year-old male clinical scenario: Domestic violence disclosed.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Dismiss patient concerns", "Avoid discussion", "Assess immediate safety; provide resources", "Transfer without handoff", "Guarantee cure"]'::jsonb, 2, 'Best practice: Assess immediate safety; provide resources.'),
    (v_topic_id, 'A 80-year-old male presents with petechiae shock.

Physical Examination:

Gram negative diplococci

Laboratory Results:

Key finding: Ceftriaxone contacts prophylaxis.


What is the most likely diagnosis?', '["Conversion disorder", "Functional disorder", "Meningococcemia", "Medication adverse effect", "Normal variant"]'::jsonb, 2, 'Presentation consistent with Meningococcemia.'),
    (v_topic_id, 'A 59-year-old male has suspected testicular torsion.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Scrotal Doppler ultrasound emergently", "Empiric treatment without diagnosis", "No further testing; observe", "PET scan whole body", "Genetic panel first"]'::jsonb, 0, 'For Suspected testicular torsion, Scrotal Doppler ultrasound emergently is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 30-year-old female presents with salivation miosis.

Physical Examination:

Low cholinesterase

Laboratory Results:

Key finding: Atropine pralidoxime.


What is the most likely diagnosis?', '["Organophosphate poisoning", "Conversion disorder", "Normal variant", "Functional disorder", "Medication adverse effect"]'::jsonb, 0, 'Presentation consistent with Organophosphate poisoning.'),
    (v_topic_id, 'A 76-year-old female has fever, cough, and night sweats for 6 weeks; immigrated from endemic area.

Physical Examination:

Lungs: Upper lobe cavitary changes.

Laboratory Results:

AFB smear positive.


What is the most likely diagnosis?', '["Functional disorder", "Pulmonary embolism", "Pulmonary tuberculosis", "Gastroenteritis", "Musculoskeletal strain"]'::jsonb, 2, 'Chronic cough, night sweats, cavitary lesion, AFB+ = TB.'),
    (v_topic_id, 'A 62-year-old female has suspected nephrotic syndrome.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Exome sequencing first", "No testing indicated", "Empiric treatment without workup", "Urinalysis, protein quantification, renal ultrasound", "PET scan screening"]'::jsonb, 3, 'Appropriate initial study: Urinalysis, protein quantification, renal ultrasound.'),
    (v_topic_id, 'A 30-year-old male clinical scenario: Nonadherence to insulin.

Physical Examination:

N/A

Laboratory Results:

N/A


What is the most appropriate physician response?', '["Guarantee cure", "Explore barriers; shared decision-making", "Avoid discussion", "Transfer without handoff", "Dismiss patient concerns"]'::jsonb, 1, 'Best practice: Explore barriers; shared decision-making.'),
    (v_topic_id, 'A 33-year-old male is prescribed therapy for SSRIs condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Direct DNA replication block only", "Selective serotonin reuptake inhibition", "Unknown mechanism", "Hormone supplementation only", "Placebo effect only"]'::jsonb, 1, 'Correct mechanism: Selective serotonin reuptake inhibition.'),
    (v_topic_id, 'A 51-year-old female presents with shoulder hip girdle pain.

Physical Examination:

ESR high

Laboratory Results:

Key finding: Low-dose prednisone.


What is the most likely diagnosis?', '["Functional disorder", "Polymyalgia rheumatica", "Medication adverse effect", "Conversion disorder", "Normal variant"]'::jsonb, 1, 'Presentation consistent with Polymyalgia rheumatica.'),
    (v_topic_id, 'A 60-year-old male is prescribed therapy for Albuterol condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["\u03b22-adrenergic bronchodilation", "Unknown mechanism", "Hormone supplementation only", "Direct DNA replication block only", "Placebo effect only"]'::jsonb, 0, 'Correct mechanism: β2-adrenergic bronchodilation.'),
    (v_topic_id, 'A 36-year-old female has suspected RPGN.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["ANCA, anti-GBM, complement, urgent renal biopsy", "Empiric treatment without workup", "No testing indicated", "Exome sequencing first", "PET scan screening"]'::jsonb, 0, 'Appropriate initial study: ANCA, anti-GBM, complement, urgent renal biopsy.'),
    (v_topic_id, 'A 33-year-old female has periorbital edema and frothy urine for 2 weeks.

Physical Examination:

BP 158/96.

Laboratory Results:

UA: 4+ protein, oval fat bodies.


What is the most likely diagnosis?', '["Medication side effect", "Anxiety disorder", "Nephrotic syndrome", "Normal variant", "Functional pain syndrome"]'::jsonb, 2, 'Clinical pattern matches Nephrotic syndrome.'),
    (v_topic_id, 'A 56-year-old male has suspected infectious endocarditis.

Physical Examination:

Vitals stable unless noted.
Focused exam supports pretest suspicion.

Laboratory Results:

Initial basic labs obtained; definitive test not yet done.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without diagnosis", "No further testing; observe", "PET scan whole body", "Transesophageal echocardiography", "Genetic panel first"]'::jsonb, 3, 'For Suspected infectious endocarditis, Transesophageal echocardiography is the appropriate next diagnostic step.'),
    (v_topic_id, 'A 44-year-old female presents with fatigue splenomegaly.

Physical Examination:

Philadelphia chromosome

Laboratory Results:

Key finding: TKI.


What is the most likely diagnosis?', '["CML", "Medication adverse effect", "Functional disorder", "Normal variant", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with CML.'),
    (v_topic_id, 'A 29-year-old male presents with central obesity striae.

Physical Examination:

ACTH pituitary adenoma

Laboratory Results:

Key finding: Transsphenoidal surgery.


What is the most likely diagnosis?', '["Normal variant", "Cushing disease", "Functional disorder", "Conversion disorder", "Medication adverse effect"]'::jsonb, 1, 'Presentation consistent with Cushing disease.'),
    (v_topic_id, 'A 71-year-old male has suspected celiac disease.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["No testing indicated", "Exome sequencing first", "IgA anti-tissue transglutaminase and total IgA", "PET scan screening", "Empiric treatment without workup"]'::jsonb, 2, 'Appropriate initial study: IgA anti-tissue transglutaminase and total IgA.'),
    (v_topic_id, 'A 53-year-old male lead-time bias is a concern in which situation?

Physical Examination:

N/A

Laboratory Results:

N/A


Early detection appears to prolong survival without changing disease course because:', '["Specificity improves", "Treatment is more effective", "Prevalence decreases", "Randomization failed", "Diagnosis is made earlier without altering time of death"]'::jsonb, 4, 'Lead-time bias inflates apparent survival by earlier diagnosis only.'),
    (v_topic_id, 'A 82-year-old male has suspected acute ischemic stroke.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["Empiric treatment without workup", "Noncontrast CT then CTA if thrombectomy considered", "PET scan screening", "No testing indicated", "Exome sequencing first"]'::jsonb, 1, 'Appropriate initial study: Noncontrast CT then CTA if thrombectomy considered.'),
    (v_topic_id, 'A 69-year-old female has palpitations, tremor, and heat intolerance for 3 weeks.

Physical Examination:

Vitals: HR 124 (irregular) | BP 142/78.
Thyroid: Diffusely enlarged, no nodules. Lid lag present.

Laboratory Results:

TSH <0.01 mIU/L | Free T4 elevated | TSH receptor antibody positive.


What is the most likely diagnosis?', '["Toxic multinodular goiter", "Graves disease", "Subacute thyroiditis", "Euthyroid sick syndrome", "Pituitary TSHoma"]'::jsonb, 1, 'Suppressed TSH, elevated T4, diffuse goiter, TRAb positive = Graves.'),
    (v_topic_id, 'A 77-year-old male presents with painful thyroid post viral.

Physical Examination:

ESR high

Laboratory Results:

Key finding: NSAIDs steroids.


What is the most likely diagnosis?', '["Normal variant", "Functional disorder", "Conversion disorder", "Thyroiditis subacute", "Medication adverse effect"]'::jsonb, 3, 'Presentation consistent with Thyroiditis subacute.'),
    (v_topic_id, 'A 52-year-old female with heart failure is started on an ACE inhibitor.

Physical Examination:

BP tolerates medication.

Laboratory Results:

Cr stable.


Which mechanism primarily reduces mortality in HFrEF?', '["Inhibition of angiotensin II\u2013mediated remodeling", "Arterial vasoconstriction", "Sodium retention", "Increased preload", "Positive inotropy"]'::jsonb, 0, 'ACEi reduce maladaptive RAAS-mediated remodeling in HFrEF.'),
    (v_topic_id, 'A 69-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 1).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Case-fatality rate reported", "Exposure associated with higher risk of outcome", "No association", "Exposure protective", "Study proves mechanism"]'::jsonb, 1, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 69-year-old female presents with monoarticular hot joint.

Physical Examination:

Synovial WBC>50k

Laboratory Results:

Key finding: Drain + IV antibiotics.


What is the most likely diagnosis?', '["Medication adverse effect", "Conversion disorder", "Normal variant", "Septic arthritis", "Functional disorder"]'::jsonb, 3, 'Presentation consistent with Septic arthritis.'),
    (v_topic_id, 'A 23-year-old male is prescribed therapy for Fluticasone condition; clinician reviews mechanism.

Physical Examination:

Stable vitals.

Laboratory Results:

Labs unremarkable.


Which mechanism best describes how this drug class works?', '["Hormone supplementation only", "Local anti-inflammatory glucocorticoid effect", "Direct DNA replication block only", "Placebo effect only", "Unknown mechanism"]'::jsonb, 1, 'Correct mechanism: Local anti-inflammatory glucocorticoid effect.'),
    (v_topic_id, 'A 24-year-old female has acute chest pain; troponin pending.

Physical Examination:

Vitals stable.
Lungs clear.

Laboratory Results:

ECG: Nonspecific ST changes.


Which initial diagnostic study is most appropriate to evaluate for acute coronary syndrome?', '["12-lead ECG and serial troponins", "Coronary CT angiography first", "No testing; reassurance", "Echocardiography only", "Exercise stress test now"]'::jsonb, 0, 'ACS evaluation requires ECG and serial troponins in the ED.'),
    (v_topic_id, 'A 60-year-old male a cohort study evaluates risk factor Z for outcome Y (mock scenario 5).

Physical Examination:

N/A

Laboratory Results:

Relative risk 1.8 (95% CI 1.1–2.9).


Which interpretation is most appropriate?', '["Exposure associated with higher risk of outcome", "Case-fatality rate reported", "Exposure protective", "Study proves mechanism", "No association"]'::jsonb, 0, 'RR >1 with CI excluding 1 suggests positive association.'),
    (v_topic_id, 'A 45-year-old female has fever, myalgias, and thrombocytopenia after tick bite.

Physical Examination:

No rash yet.

Laboratory Results:

Peripheral smear shows morulae in granulocytes.


What is the most likely diagnosis?', '["Anaplasmosis", "Medication side effect", "Normal variant", "Functional pain syndrome", "Anxiety disorder"]'::jsonb, 0, 'Clinical pattern matches Anaplasmosis.'),
    (v_topic_id, 'A 34-year-old female has suspected adrenal incidentaloma.

Physical Examination:

Stable unless emergent features present.

Laboratory Results:

Baseline labs obtained.


Which diagnostic study is most appropriate at this stage?', '["PET scan screening", "Biochemical hormonal workup then adrenal CT/MRI", "Exome sequencing first", "No testing indicated", "Empiric treatment without workup"]'::jsonb, 1, 'Appropriate initial study: Biochemical hormonal workup then adrenal CT/MRI.'),
    (v_topic_id, 'A 76-year-old male presents with galactorrhea amenorrhea.

Physical Examination:

Prolactin very high

Laboratory Results:

Key finding: Dopamine agonist.


What is the most likely diagnosis?', '["Functional disorder", "Medication adverse effect", "Normal variant", "Conversion disorder", "Prolactinoma"]'::jsonb, 4, 'Presentation consistent with Prolactinoma.'),
    (v_topic_id, 'A 41-year-old female presents with RLQ pain migration.

Physical Examination:

CT appendiceal dilation

Laboratory Results:

Key finding: Appendectomy.


What is the most likely diagnosis?', '["Appendicitis", "Functional disorder", "Normal variant", "Medication adverse effect", "Conversion disorder"]'::jsonb, 0, 'Presentation consistent with Appendicitis.'),
    (v_topic_id, 'A 82-year-old male presents with thrombosis pregnancy loss.

Physical Examination:

Lupus anticoagulant

Laboratory Results:

Key finding: Anticoagulation.


What is the most likely diagnosis?', '["Normal variant", "Medication adverse effect", "Functional disorder", "Conversion disorder", "Antiphospholipid syndrome"]'::jsonb, 4, 'Presentation consistent with Antiphospholipid syndrome.'),
    (v_topic_id, 'A 50-year-old female an intervention reduces events from 20% to 10%.

Physical Examination:

N/A

Laboratory Results:

N/A


The number needed to treat (NNT) is approximately:', '["0.1", "2", "10", "20", "100"]'::jsonb, 2, 'ARR = 10%; NNT = 1/0.10 = 10.');
END $$;
COMMIT;
