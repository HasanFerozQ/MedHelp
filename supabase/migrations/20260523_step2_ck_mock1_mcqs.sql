-- USMLE Step 2 CK Mock #1 — 320 clinical vignette MCQs
BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-2-mock-pool-mock1' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic usmle-2-mock-pool-mock1 not found. Run 20260523_step2_ck_mock_topics.sql first.';
    END IF;

    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 67-year-old male reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Calcium channel blocker only", "Immediate surgery without medical preparation", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Beta-blocker monotherapy first", "High-dose loop diuretics alone"]'::jsonb, 2, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 34-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Immediate cesarean for all primigravidas", "Magnesium for seizure prophylaxis", "Continue active labor management per stage", "Forceps before complete dilation", "Discharge home"]'::jsonb, 2, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 64-year-old female on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Start warfarin immediately", "Switch to subcutaneous enoxaparin", "Observation only", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets"]'::jsonb, 3, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 77-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "Thrombolysis for all stable patients", "IV antibiotics for pneumonia", "Aspirin monotherapy", "Observation with repeat imaging in 1 week"]'::jsonb, 0, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 48-year-old male developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "Thrombolysis for all stable patients", "Aspirin monotherapy", "IV antibiotics for pneumonia", "Observation with repeat imaging in 1 week"]'::jsonb, 0, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 41-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["First-degree sunburn pattern", "Superficial only", "All burns are partial thickness", "Full-thickness (third-degree)", "Chemical burn only"]'::jsonb, 3, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 47-year-old male has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Metronidazole only", "Amoxicillin or doxycycline per guidelines", "Ribavirin", "Fluconazole", "Vancomycin monotherapy"]'::jsonb, 1, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 30-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Immediate surgery", "No antibiotics needed", "Steroids only"]'::jsonb, 1, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 36-year-old female presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Immediate thrombolysis", "Aggressive IV fluid bolus", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Oral clopidogrel and aspirin only", "Sublingual nitroglycerin as monotherapy"]'::jsonb, 2, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 63-year-old female has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["STEMI", "GERD only", "Costochondritis only", "Acute pericarditis", "Pulmonary embolism only"]'::jsonb, 3, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 22-year-old female with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Fluconazole monotherapy for induction", "Amphotericin B plus flucytosine, with careful ICP management", "Acyclovir IV", "Oral metronidazole", "High-dose steroids without antifungals"]'::jsonb, 1, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 78-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Observation without antibiotics", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "Immediate splenectomy", "ERCP as first step for all RUQ pain"]'::jsonb, 2, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 76-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Drug reaction (amoxicillin rash)", "Lupus only", "Stevens-Johnson syndrome", "Toxic epidermal necrolysis", "Meningococcemia"]'::jsonb, 0, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 49-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Sick euthyroid", "Graves disease", "Hashimoto thyroiditis", "Subclinical hypothyroidism", "Pituitary TSHoma only without hyperthyroid labs"]'::jsonb, 1, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 45-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Meningococcemia", "Stevens-Johnson syndrome", "Toxic epidermal necrolysis", "Drug reaction (amoxicillin rash)", "Lupus only"]'::jsonb, 3, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 61-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["Chemical burn only", "First-degree sunburn pattern", "All burns are partial thickness", "Superficial only", "Full-thickness (third-degree)"]'::jsonb, 4, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 27-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Immediate surgery without medical preparation", "High-dose loop diuretics alone", "Calcium channel blocker only", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Beta-blocker monotherapy first"]'::jsonb, 3, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 80-year-old female has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Discharge without endoscopy", "Oral NSAIDs", "Warfarin loading", "High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol"]'::jsonb, 4, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 45-year-old male has 3 weeks of depressed mood, insomnia, 5-kg weight loss, poor concentration, and passive suicidal ideation without plan.

Physical Examination:

Vitals: Normal.
Mental status: Depressed affect, no psychosis, intact judgment for safety contract discussion.
Physical: Nonfocal neuro exam.

Laboratory Results:

TSH: Normal
CBC, BMP: Normal
Urine tox: Negative


What is the most appropriate initial treatment for this major depressive episode?', '["No treatment \u2014 watchful waiting only for severe functional impairment", "SSRI (e.g., sertraline) plus psychotherapy and safety planning", "Lithium monotherapy as first-line for unipolar depression", "Benzodiazepine monotherapy long-term", "Haloperidol monotherapy"]'::jsonb, 1, 'Moderate–severe MDD without psychosis is first treated with SSRI/SNRI plus therapy and safety assessment. Lithium is for bipolar disorder. Antipsychotic monotherapy is not first-line unipolar depression. Benzos are not antidepressants. Severe functional impairment warrants active treatment.'),
    (v_topic_id, 'A 59-year-old male with alcohol use disorder presents with tremor, anxiety, hypertension 6 hours after last drink.

Physical Examination:

Vitals: HR 118 | BP 162/98 | Temp 37.8°C.
Tremor: Bilateral hands.

Laboratory Results:

CIWA-Ar: 18


Initial management?', '["Benzodiazepines (e.g., lorazepam) per symptom-triggered protocol and thiamine", "Beta-blocker monotherapy without benzos", "No monitoring needed outpatient", "Haloperidol monotherapy first", "Disulfiram during acute withdrawal"]'::jsonb, 0, 'Alcohol withdrawal with high CIWA needs benzodiazepines and thiamine; benzos prevent seizures/delirium. Haloperidol does not prevent seizures. Disulfiram is for maintenance not acute withdrawal.'),
    (v_topic_id, 'A 22-year-old female has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["Superficial only", "Full-thickness (third-degree)", "Chemical burn only", "All burns are partial thickness", "First-degree sunburn pattern"]'::jsonb, 1, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 40-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Renal cell carcinoma", "Hypothyroidism", "Primary hyperaldosteronism", "Pheochromocytoma", "Essential hypertension only"]'::jsonb, 2, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 67-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Acute hepatitis A", "Acute cholecystitis from cholelithiasis", "Alcohol-induced acute pancreatitis", "Mesenteric ischemia", "Peptic ulcer perforation"]'::jsonb, 2, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 22-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["DIC", "Aplastic anemia all cell lines low", "TTP", "ITP", "Leukemia"]'::jsonb, 3, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 44-year-old male has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["Acute appendicitis only", "GERD", "UTI", "Splenic sequestration benign", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization"]'::jsonb, 4, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 55-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Contact dermatitis only", "Scabies", "Systemic lupus erythematosus", "Dermatomyositis only", "Gout"]'::jsonb, 2, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 68-year-old female presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Aggressive IV fluid bolus", "Oral clopidogrel and aspirin only", "Immediate thrombolysis", "Sublingual nitroglycerin as monotherapy", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed"]'::jsonb, 4, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 78-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Acute diverticulitis \u2014 oral metronidazole", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Constipation \u2014 enema and discharge", "Irritable bowel syndrome \u2014 antispasmodics"]'::jsonb, 2, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 22-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Colonic malignancy as primary cause of SBO", "Postoperative adhesions", "Acute appendicitis", "Primary biliary cholangitis", "Incarcerated inguinal hernia"]'::jsonb, 1, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 22-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Acute diverticulitis \u2014 oral metronidazole", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Constipation \u2014 enema and discharge", "Irritable bowel syndrome \u2014 antispasmodics"]'::jsonb, 2, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 59-year-old male has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Knee arthroscopy", "Anticoagulation only", "Immediate amputation", "No imaging needed"]'::jsonb, 0, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 44-year-old male with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Irritable bowel syndrome \u2014 antispasmodics", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Constipation \u2014 enema and discharge", "Acute diverticulitis \u2014 oral metronidazole", "Peptic ulcer disease \u2014 PPI and outpatient follow-up"]'::jsonb, 1, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 62-year-old male has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Observation for spontaneous resolution", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Empiric ceftriaxone for ascending cholangitis without imaging", "Oral ursodiol only and discharge", "Immediate appendectomy"]'::jsonb, 1, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 70-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Stroke", "No treatment ever", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Myasthenia gravis", "Brain tumor first-line"]'::jsonb, 2, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 79-year-old male has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Anticoagulation only", "Knee arthroscopy", "No imaging needed", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Immediate amputation"]'::jsonb, 3, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 36-year-old female has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["No antibiotics ever for diverticulitis", "Appendectomy", "Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "Immediate elective colectomy during this admission for all cases", "IV thrombolysis"]'::jsonb, 2, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 80-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Barium swallow", "Observe without endoscopy", "Abdominal MRI as first test", "Upper endoscopy (EGD)", "Colonoscopy first"]'::jsonb, 3, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 22-year-old female has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Knee arthroscopy", "Anticoagulation only", "No imaging needed", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Immediate amputation"]'::jsonb, 3, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 25-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Primary biliary cholangitis", "Postoperative adhesions", "Incarcerated inguinal hernia", "Colonic malignancy as primary cause of SBO", "Acute appendicitis"]'::jsonb, 1, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 66-year-old male with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Amphotericin B plus flucytosine, with careful ICP management", "Oral metronidazole", "Acyclovir IV", "High-dose steroids without antifungals", "Fluconazole monotherapy for induction"]'::jsonb, 0, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 74-year-old male reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["High-dose loop diuretics alone", "Immediate surgery without medical preparation", "Beta-blocker monotherapy first", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Calcium channel blocker only"]'::jsonb, 3, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 77-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["Chemical burn only", "Superficial only", "First-degree sunburn pattern", "All burns are partial thickness", "Full-thickness (third-degree)"]'::jsonb, 4, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 33-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Chest tube", "Antibiotics mandatory", "Racemic epinephrine required for all", "Intubation", "Single dose dexamethasone and supportive care"]'::jsonb, 4, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 51-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Toxic epidermal necrolysis", "Drug reaction (amoxicillin rash)", "Stevens-Johnson syndrome", "Meningococcemia", "Lupus only"]'::jsonb, 1, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 35-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Molar pregnancy only", "Normal intrauterine pregnancy", "Incomplete abortion", "Threatened abortion with closed cervix", "Ectopic pregnancy"]'::jsonb, 2, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 77-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Rheumatoid factor and ANA panel only", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Immediate valve replacement without antibiotics", "Oral amoxicillin and outpatient follow-up", "Bone marrow biopsy"]'::jsonb, 1, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 32-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Reassure \u2014 no further testing needed", "Start insulin immediately without further testing", "Schedule delivery at 28 weeks", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start metformin and skip diagnostic testing"]'::jsonb, 3, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 54-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Azithromycin first-line always", "Prednisone only", "Penicillin or amoxicillin", "Acyclovir", "No antibiotics for positive rapid strep"]'::jsonb, 2, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 42-year-old male has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["IV thrombolysis", "Immediate elective colectomy during this admission for all cases", "Appendectomy", "No antibiotics ever for diverticulitis", "Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable"]'::jsonb, 4, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 50-year-old male presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["High-dose IV beta-blocker before reperfusion", "Intravenous heparin alone without reperfusion strategy", "Emergent coronary angiography with primary PCI", "Urgent CT pulmonary angiography", "Oral aspirin and discharge with outpatient stress test"]'::jsonb, 2, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 43-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Ectopic pregnancy", "Molar pregnancy only", "Incomplete abortion", "Normal intrauterine pregnancy", "Threatened abortion with closed cervix"]'::jsonb, 2, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 75-year-old female has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Observation without treatment ever", "Direct-acting antiviral regimen for 8\u201312 weeks", "Interferon-ribavirin only", "Cholestyramine", "Liver transplant evaluation first-line"]'::jsonb, 1, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 77-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Myasthenia gravis", "Stroke", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Brain tumor first-line", "No treatment ever"]'::jsonb, 2, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 46-year-old female with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Subcutaneous insulin only and oral fluids", "Oral antidiabetic agents and discharge", "Immediate sodium bicarbonate for all patients", "Potassium supplementation before any fluids"]'::jsonb, 0, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 45-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["High-dose IV beta-blocker before reperfusion", "Oral aspirin and discharge with outpatient stress test", "Emergent coronary angiography with primary PCI", "Urgent CT pulmonary angiography", "Intravenous heparin alone without reperfusion strategy"]'::jsonb, 2, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 29-year-old male with alcohol use disorder presents with tremor, anxiety, hypertension 6 hours after last drink.

Physical Examination:

Vitals: HR 118 | BP 162/98 | Temp 37.8°C.
Tremor: Bilateral hands.

Laboratory Results:

CIWA-Ar: 18


Initial management?', '["No monitoring needed outpatient", "Disulfiram during acute withdrawal", "Beta-blocker monotherapy without benzos", "Benzodiazepines (e.g., lorazepam) per symptom-triggered protocol and thiamine", "Haloperidol monotherapy first"]'::jsonb, 3, 'Alcohol withdrawal with high CIWA needs benzodiazepines and thiamine; benzos prevent seizures/delirium. Haloperidol does not prevent seizures. Disulfiram is for maintenance not acute withdrawal.'),
    (v_topic_id, 'A 24-year-old female has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Warfarin loading", "Oral NSAIDs", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "High-dose beta-blocker acute bolus only without endoscopy plan", "Discharge without endoscopy"]'::jsonb, 2, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 67-year-old male is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Nebulized racemic epinephrine and dexamethasone", "Incision and drainage of neck", "Immediate intubation for all stridor", "Chest CT with contrast", "Antibiotics (amoxicillin) as first-line"]'::jsonb, 0, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 53-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["DKA", "Hyperosmolar hyperglycemic state", "Lactic acidosis primary", "Hypoglycemia", "Normal variant"]'::jsonb, 1, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 61-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Oral clopidogrel and aspirin only", "Sublingual nitroglycerin as monotherapy", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Immediate thrombolysis", "Aggressive IV fluid bolus"]'::jsonb, 2, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 38-year-old female has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Warfarin loading", "Discharge without endoscopy", "Oral NSAIDs", "High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol"]'::jsonb, 4, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 46-year-old female has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Ribavirin", "Fluconazole", "Metronidazole only", "Amoxicillin or doxycycline per guidelines", "Vancomycin monotherapy"]'::jsonb, 3, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 41-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["No treatment", "Antibiotics for meningitis", "Immediate craniotomy", "High-dose opioids only", "Acetazolamide, weight loss, stop offending agents, monitor vision"]'::jsonb, 4, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 82-year-old female has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Antibiotics only", "Elective surgical repair when symptomatic", "Emergent OR for all groin masses", "No repair ever", "Chemotherapy"]'::jsonb, 1, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 52-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Colonoscopy first", "Barium swallow", "Abdominal MRI as first test", "Observe without endoscopy", "Upper endoscopy (EGD)"]'::jsonb, 4, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 82-year-old female has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["High-dose opioids only", "Acetazolamide, weight loss, stop offending agents, monitor vision", "Antibiotics for meningitis", "Immediate craniotomy", "No treatment"]'::jsonb, 1, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 39-year-old female has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Ignore BI-RADS 4", "Staging workup and multidisciplinary oncologic/surgical planning", "Emergency appendectomy", "Topical estrogen cream only", "Antibiotics for mastitis"]'::jsonb, 1, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 80-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Rheumatoid factor and ANA panel only", "Oral amoxicillin and outpatient follow-up", "Bone marrow biopsy", "Immediate valve replacement without antibiotics", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done"]'::jsonb, 4, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 67-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Vitamin B12 alone without checking iron", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Immediate transfuse to Hgb 15", "Oral iron only always sufficient", "Phlebotomy"]'::jsonb, 1, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 56-year-old male has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Antibiotics for mastitis", "Topical estrogen cream only", "Staging workup and multidisciplinary oncologic/surgical planning", "Emergency appendectomy", "Ignore BI-RADS 4"]'::jsonb, 2, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 24-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 0.45% (half-normal) saline", "Desmopressin (dDAVP) administration", "Administration of IV 0.9% (normal) saline", "Administration of IV 3% (hypertonic) saline", "Rapid correction with 5% Dextrose in water (D5W)"]'::jsonb, 0, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 68-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Calcium channel blockers (amlodipine)", "Beta-blockers (e.g., carvedilol)", "Digoxin as first-line mortality therapy", "Loop diuretics alone", "Short-acting nitrates as monotherapy"]'::jsonb, 1, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 70-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Meningococcemia", "Stevens-Johnson syndrome", "Toxic epidermal necrolysis", "Lupus only", "Drug reaction (amoxicillin rash)"]'::jsonb, 4, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 35-year-old male has 3 weeks of depressed mood, insomnia, 5-kg weight loss, poor concentration, and passive suicidal ideation without plan.

Physical Examination:

Vitals: Normal.
Mental status: Depressed affect, no psychosis, intact judgment for safety contract discussion.
Physical: Nonfocal neuro exam.

Laboratory Results:

TSH: Normal
CBC, BMP: Normal
Urine tox: Negative


What is the most appropriate initial treatment for this major depressive episode?', '["Benzodiazepine monotherapy long-term", "Haloperidol monotherapy", "Lithium monotherapy as first-line for unipolar depression", "SSRI (e.g., sertraline) plus psychotherapy and safety planning", "No treatment \u2014 watchful waiting only for severe functional impairment"]'::jsonb, 3, 'Moderate–severe MDD without psychosis is first treated with SSRI/SNRI plus therapy and safety assessment. Lithium is for bipolar disorder. Antipsychotic monotherapy is not first-line unipolar depression. Benzos are not antidepressants. Severe functional impairment warrants active treatment.'),
    (v_topic_id, 'A 44-year-old male with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Platelet transfusion", "Only hydroxychloroquine increase", "No workup for thrombophilia", "Anticoagulation and evaluate for antiphospholipid syndrome", "Stop all anticoagulation"]'::jsonb, 3, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 76-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Chemotherapy", "Emergent OR for all groin masses", "Antibiotics only", "Elective surgical repair when symptomatic", "No repair ever"]'::jsonb, 3, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 64-year-old male with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Irritable bowel syndrome \u2014 antispasmodics", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Constipation \u2014 enema and discharge", "Acute diverticulitis \u2014 oral metronidazole"]'::jsonb, 0, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 31-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Acute hepatitis A", "Acute cholecystitis from cholelithiasis", "Peptic ulcer perforation", "Mesenteric ischemia", "Alcohol-induced acute pancreatitis"]'::jsonb, 4, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 59-year-old male on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Observation only", "Switch to subcutaneous enoxaparin", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets", "Start warfarin immediately"]'::jsonb, 2, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 46-year-old male at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["IV magnesium sulfate loading and maintenance", "Oral phenytoin monotherapy", "Nitroprusside as first-line seizure prophylaxis", "Observation only", "Immediate magnesium-free vaginal delivery without BP control"]'::jsonb, 0, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 47-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Immediate cesarean for all primigravidas", "Forceps before complete dilation", "Continue active labor management per stage", "Magnesium for seizure prophylaxis", "Discharge home"]'::jsonb, 2, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 83-year-old male was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Oral fluids and observation", "CT abdomen with contrast before any transfusion in unstable patient", "Diagnostic peritoneal lavage only without resuscitation", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "Discharge after normal FAST"]'::jsonb, 3, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 66-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Emergent coronary angiography with primary PCI", "Oral aspirin and discharge with outpatient stress test", "Urgent CT pulmonary angiography", "High-dose IV beta-blocker before reperfusion", "Intravenous heparin alone without reperfusion strategy"]'::jsonb, 0, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 64-year-old female has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["GERD", "UTI", "Acute appendicitis only", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "Splenic sequestration benign"]'::jsonb, 3, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 33-year-old male has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Vancomycin monotherapy", "Fluconazole", "Ribavirin", "Amoxicillin or doxycycline per guidelines", "Metronidazole only"]'::jsonb, 3, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 42-year-old male has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Contact dermatitis only", "Scabies", "Dermatomyositis only", "Systemic lupus erythematosus", "Gout"]'::jsonb, 3, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 33-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Oral clopidogrel and aspirin only", "Immediate thrombolysis", "Aggressive IV fluid bolus", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Sublingual nitroglycerin as monotherapy"]'::jsonb, 3, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 40-year-old female presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Acute hepatitis A", "Acute cholecystitis from cholelithiasis", "Mesenteric ischemia", "Alcohol-induced acute pancreatitis", "Peptic ulcer perforation"]'::jsonb, 3, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 59-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "Immediate splenectomy", "ERCP as first step for all RUQ pain", "Observation without antibiotics"]'::jsonb, 1, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 53-year-old male has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Ribavirin", "Metronidazole only", "Amoxicillin or doxycycline per guidelines", "Vancomycin monotherapy", "Fluconazole"]'::jsonb, 2, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 42-year-old male has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Subclinical hypothyroidism", "Sick euthyroid", "Hashimoto thyroiditis", "Graves disease", "Pituitary TSHoma only without hyperthyroid labs"]'::jsonb, 3, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 61-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Alcohol-induced acute pancreatitis", "Mesenteric ischemia", "Peptic ulcer perforation", "Acute cholecystitis from cholelithiasis", "Acute hepatitis A"]'::jsonb, 0, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 31-year-old female with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Subcutaneous insulin only and oral fluids", "Oral antidiabetic agents and discharge", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Potassium supplementation before any fluids", "Immediate sodium bicarbonate for all patients"]'::jsonb, 2, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 26-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Oral amoxicillin and outpatient follow-up", "Rheumatoid factor and ANA panel only", "Immediate valve replacement without antibiotics", "Bone marrow biopsy", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done"]'::jsonb, 4, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 81-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Normal variant", "Hyperosmolar hyperglycemic state", "Hypoglycemia", "DKA", "Lactic acidosis primary"]'::jsonb, 1, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 45-year-old male with alcohol use disorder presents with tremor, anxiety, hypertension 6 hours after last drink.

Physical Examination:

Vitals: HR 118 | BP 162/98 | Temp 37.8°C.
Tremor: Bilateral hands.

Laboratory Results:

CIWA-Ar: 18


Initial management?', '["Beta-blocker monotherapy without benzos", "Haloperidol monotherapy first", "Benzodiazepines (e.g., lorazepam) per symptom-triggered protocol and thiamine", "Disulfiram during acute withdrawal", "No monitoring needed outpatient"]'::jsonb, 2, 'Alcohol withdrawal with high CIWA needs benzodiazepines and thiamine; benzos prevent seizures/delirium. Haloperidol does not prevent seizures. Disulfiram is for maintenance not acute withdrawal.'),
    (v_topic_id, 'A 39-year-old male has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Normal variant", "Hypoglycemia", "DKA", "Lactic acidosis primary", "Hyperosmolar hyperglycemic state"]'::jsonb, 4, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 81-year-old male has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Pheochromocytoma", "Hypothyroidism", "Essential hypertension only", "Renal cell carcinoma", "Primary hyperaldosteronism"]'::jsonb, 4, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 42-year-old female hears persecutory voices commanding self-harm, poor insight, not eating 2 days.

Physical Examination:

Vitals: Dehydration signs.
Mental status: Psychotic, disorganized, cannot contract for safety.

Laboratory Results:

Urine tox: Positive methamphetamine


Disposition and treatment?', '["No safety assessment", "Discharge with follow-up in 1 month only", "Hospitalization, antipsychotic treatment, safety precautions, treat stimulant intoxication", "Benzodiazepine long-term maintenance only", "Antidepressant monotherapy"]'::jsonb, 2, 'Acute psychosis with command hallucinations and inability to care for self requires inpatient stabilization and antipsychotics.'),
    (v_topic_id, 'A 44-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["Aplastic anemia all cell lines low", "Leukemia", "ITP", "TTP", "DIC"]'::jsonb, 2, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 33-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Immediate thyroidectomy", "Kayexalate only without steroids", "Observation until outpatient endocrinology visit", "Oral rehydration and discharge"]'::jsonb, 0, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 33-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Acute diverticulitis \u2014 oral metronidazole", "Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Constipation \u2014 enema and discharge", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Irritable bowel syndrome \u2014 antispasmodics"]'::jsonb, 3, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 30-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["ITP", "Leukemia", "TTP", "DIC", "Aplastic anemia all cell lines low"]'::jsonb, 0, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 54-year-old male is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Immediate thyroidectomy", "Kayexalate only without steroids", "Oral rehydration and discharge", "Observation until outpatient endocrinology visit"]'::jsonb, 0, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 35-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Start insulin immediately without further testing", "Reassure \u2014 no further testing needed", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start metformin and skip diagnostic testing", "Schedule delivery at 28 weeks"]'::jsonb, 2, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 39-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Sublingual nitroglycerin as monotherapy", "Immediate thrombolysis", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Oral clopidogrel and aspirin only", "Aggressive IV fluid bolus"]'::jsonb, 2, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 23-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Pulmonary embolism only", "STEMI", "Costochondritis only", "Acute pericarditis", "GERD only"]'::jsonb, 3, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 42-year-old female presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Peptic ulcer perforation", "Mesenteric ischemia", "Alcohol-induced acute pancreatitis", "Acute hepatitis A", "Acute cholecystitis from cholelithiasis"]'::jsonb, 2, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 46-year-old male has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Lupus only", "Stevens-Johnson syndrome", "Toxic epidermal necrolysis", "Drug reaction (amoxicillin rash)", "Meningococcemia"]'::jsonb, 3, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 26-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Acute pericarditis", "GERD only", "Costochondritis only", "Pulmonary embolism only", "STEMI"]'::jsonb, 0, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 72-year-old female at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Schedule delivery at 28 weeks", "Reassure \u2014 no further testing needed", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start metformin and skip diagnostic testing", "Start insulin immediately without further testing"]'::jsonb, 2, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 44-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Mastitis", "UTI only without uterine exam", "Normal lochia \u2014 no treatment", "Appendicitis only"]'::jsonb, 0, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 54-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "Penicillin or amoxicillin", "No antibiotics for positive rapid strep", "Azithromycin first-line always", "Acyclovir"]'::jsonb, 1, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 67-year-old male has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["Immediate craniotomy", "Antibiotics for meningitis", "High-dose opioids only", "Acetazolamide, weight loss, stop offending agents, monitor vision", "No treatment"]'::jsonb, 3, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 55-year-old male on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets", "Switch to subcutaneous enoxaparin", "Observation only", "Start warfarin immediately"]'::jsonb, 0, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 63-year-old male has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["No treatment", "Acetazolamide, weight loss, stop offending agents, monitor vision", "High-dose opioids only", "Immediate craniotomy", "Antibiotics for meningitis"]'::jsonb, 1, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 58-year-old male has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Immediate appendectomy", "Oral ursodiol only and discharge", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Observation for spontaneous resolution", "Empiric ceftriaxone for ascending cholangitis without imaging"]'::jsonb, 2, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 78-year-old female has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["All burns are partial thickness", "Superficial only", "Chemical burn only", "First-degree sunburn pattern", "Full-thickness (third-degree)"]'::jsonb, 4, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 28-year-old male with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Oral amoxicillin and outpatient follow-up", "Bone marrow biopsy", "Immediate valve replacement without antibiotics", "Rheumatoid factor and ANA panel only", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done"]'::jsonb, 4, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 57-year-old female has rash on trunk, fever, and recent amoxicillin for strep throat.

Physical Examination:

Vitals: Temp 38.4°C.
Skin: Morbilliform rash, no mucosal involvement.

Laboratory Results:

No labs critical


Most likely diagnosis?', '["Stevens-Johnson syndrome", "Meningococcemia", "Drug reaction (amoxicillin rash)", "Lupus only", "Toxic epidermal necrolysis"]'::jsonb, 2, 'Morbilliform rash after antibiotic without mucosal involvement = simple drug eruption. SJS/TEN have mucosal involvement and skin detachment.'),
    (v_topic_id, 'A 57-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["OA flare", "Gout", "Pseudogout (CPPD)", "Rheumatoid arthritis initial presentation", "Septic arthritis only without crystals"]'::jsonb, 1, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 51-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Continue active labor management per stage", "Forceps before complete dilation", "Magnesium for seizure prophylaxis", "Discharge home", "Immediate cesarean for all primigravidas"]'::jsonb, 0, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 59-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "UTI only without uterine exam", "Normal lochia \u2014 no treatment", "Appendicitis only", "Mastitis"]'::jsonb, 0, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 59-year-old female has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Staging workup and multidisciplinary oncologic/surgical planning", "Emergency appendectomy", "Topical estrogen cream only", "Ignore BI-RADS 4", "Antibiotics for mastitis"]'::jsonb, 0, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 45-year-old male patient on haloperidol develops rigidity, fever 40.1°C, autonomic instability.

Physical Examination:

Vitals: HR 130 | BP 180/100 | Temp 40.1°C.
Muscular: Lead-pipe rigidity.

Laboratory Results:

CK: 9,800 U/L


Diagnosis and treatment?', '["Neuroleptic malignant syndrome \u2014 stop antipsychotic, supportive care, dantrolene/bromocriptine per severity", "Catatonia \u2014 benzodiazepines only without stopping agent", "Meningitis \u2014 antibiotics only", "Continue haloperidol", "Serotonin syndrome only"]'::jsonb, 0, 'NMS: rigidity, hyperthermia, autonomic instability, elevated CK after dopamine blockade — stop offending drug and treat.'),
    (v_topic_id, 'A 39-year-old male reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade", "Beta-blocker monotherapy first", "Calcium channel blocker only", "High-dose loop diuretics alone", "Immediate surgery without medical preparation"]'::jsonb, 0, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 78-year-old male with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Acute appendicitis", "Colonic malignancy as primary cause of SBO", "Postoperative adhesions", "Primary biliary cholangitis", "Incarcerated inguinal hernia"]'::jsonb, 2, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 82-year-old female has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["No repair ever", "Chemotherapy", "Emergent OR for all groin masses", "Elective surgical repair when symptomatic", "Antibiotics only"]'::jsonb, 3, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 55-year-old female has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Stroke", "No treatment ever", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Brain tumor first-line", "Myasthenia gravis"]'::jsonb, 2, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 75-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Steroids only", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Immediate surgery", "No antibiotics needed", "Ribavirin"]'::jsonb, 1, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 69-year-old male has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Antibiotics for mastitis", "Emergency appendectomy", "Topical estrogen cream only", "Staging workup and multidisciplinary oncologic/surgical planning", "Ignore BI-RADS 4"]'::jsonb, 3, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 55-year-old male has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Observation only", "Levothyroxine replacement", "Propranolol only without levothyroxine", "Methimazole", "Radioactive iodine"]'::jsonb, 1, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 43-year-old male has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "No antibiotics ever for diverticulitis", "IV thrombolysis", "Appendectomy", "Immediate elective colectomy during this admission for all cases"]'::jsonb, 0, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 57-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Pseudogout (CPPD)", "OA flare", "Septic arthritis only without crystals", "Gout", "Rheumatoid arthritis initial presentation"]'::jsonb, 3, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 57-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["IV antibiotics for pneumonia", "Thrombolysis for all stable patients", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "Observation with repeat imaging in 1 week", "Aspirin monotherapy"]'::jsonb, 2, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 59-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Observation only", "Immediate magnesium-free vaginal delivery without BP control", "Nitroprusside as first-line seizure prophylaxis", "IV magnesium sulfate loading and maintenance", "Oral phenytoin monotherapy"]'::jsonb, 3, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 26-year-old female has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Ignore BI-RADS 4", "Emergency appendectomy", "Antibiotics for mastitis", "Staging workup and multidisciplinary oncologic/surgical planning", "Topical estrogen cream only"]'::jsonb, 3, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 69-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Colonic malignancy as primary cause of SBO", "Incarcerated inguinal hernia", "Primary biliary cholangitis", "Acute appendicitis", "Postoperative adhesions"]'::jsonb, 4, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 62-year-old male has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Antibiotics for mastitis", "Staging workup and multidisciplinary oncologic/surgical planning", "Topical estrogen cream only", "Ignore BI-RADS 4", "Emergency appendectomy"]'::jsonb, 1, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 73-year-old female has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "Acute appendicitis only", "Splenic sequestration benign", "UTI", "GERD"]'::jsonb, 0, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 51-year-old male presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Lumbar puncture first", "Observation only", "High-dose steroids", "Immediate anticoagulation with warfarin"]'::jsonb, 0, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 44-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Pituitary TSHoma only without hyperthyroid labs", "Hashimoto thyroiditis", "Sick euthyroid", "Subclinical hypothyroidism", "Graves disease"]'::jsonb, 4, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 33-year-old male has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ovarian torsion only without pregnancy", "Normal pregnancy", "Threatened abortion with IUP", "Ectopic pregnancy", "PID only"]'::jsonb, 3, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 82-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Interferon-ribavirin only", "Observation without treatment ever", "Cholestyramine", "Direct-acting antiviral regimen for 8\u201312 weeks", "Liver transplant evaluation first-line"]'::jsonb, 3, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 65-year-old male has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Immediate splenectomy", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "ERCP as first step for all RUQ pain", "Observation without antibiotics", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent"]'::jsonb, 1, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 73-year-old female has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Immediate amputation", "Knee arthroscopy", "Anticoagulation only", "No imaging needed", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared"]'::jsonb, 4, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 39-year-old male presents with sudden tearing chest pain radiating to the back. History includes poorly controlled hypertension.

Physical Examination:

Vitals: HR 112 bpm | BP 188/102 mmHg right arm, 156/88 mmHg left arm.
Cardiac: Diastolic decrescendo murmur at right sternal border.
Neuro: Alert but anxious.

Laboratory Results:

Chest X-ray: Widened mediastinum
CT angiogram chest: Intimal flap in ascending aorta with involvement of aortic root


What is the most appropriate immediate medical therapy while arranging definitive care?', '["Aggressive IV fluid bolus", "Immediate thrombolysis", "Sublingual nitroglycerin as monotherapy", "IV esmolol (or labetalol) to target HR <60 and SBP 100\u2013120, then vasodilator if needed", "Oral clopidogrel and aspirin only"]'::jsonb, 3, 'Acute aortic dissection requires heart rate and blood pressure control with IV beta-blockade first to reduce shear stress; vasodilators only after beta-blockade. Nitrates alone can cause reflex tachycardia. Thrombolysis is contraindicated. Antiplatelets do not treat dissection. Fluids may worsen dissection.'),
    (v_topic_id, 'A 77-year-old male postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Appendicitis only", "UTI only without uterine exam", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)", "Normal lochia \u2014 no treatment", "Mastitis"]'::jsonb, 2, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 22-year-old male has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Lactic acidosis primary", "Hyperosmolar hyperglycemic state", "DKA", "Normal variant", "Hypoglycemia"]'::jsonb, 1, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 53-year-old female with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Bone marrow biopsy", "Immediate valve replacement without antibiotics", "Oral amoxicillin and outpatient follow-up", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Rheumatoid factor and ANA panel only"]'::jsonb, 3, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.'),
    (v_topic_id, 'A 24-year-old male has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Propranolol only without levothyroxine", "Radioactive iodine", "Methimazole", "Observation only", "Levothyroxine replacement"]'::jsonb, 4, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 51-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Hashimoto thyroiditis", "Subclinical hypothyroidism", "Sick euthyroid", "Pituitary TSHoma only without hyperthyroid labs", "Graves disease"]'::jsonb, 4, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 81-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Prednisone only", "Penicillin or amoxicillin", "Acyclovir", "Azithromycin first-line always", "No antibiotics for positive rapid strep"]'::jsonb, 1, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 45-year-old male has fever, productive cough, and pleuritic chest pain for 4 days.

Physical Examination:

Vitals: Temp 39.1°C | HR 104 | RR 22 | SpO2 91% RA.
Lungs: Dullness and bronchial breath sounds at right base.

Laboratory Results:

CXR: Right lower lobe consolidation
WBC: 16,200


Best initial outpatient therapy for community-acquired pneumonia without comorbidities?', '["Fluconazole", "Metronidazole only", "Amoxicillin or doxycycline per guidelines", "Ribavirin", "Vancomycin monotherapy"]'::jsonb, 2, 'Healthy outpatient CAP is treated with amoxicillin, doxycycline, or macrolide depending on local resistance. Vancomycin is for MRSA risk inpatients. Antifungals/antivirals are not first-line.'),
    (v_topic_id, 'A 48-year-old female child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["Leukemia", "ITP", "Aplastic anemia all cell lines low", "TTP", "DIC"]'::jsonb, 1, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 67-year-old female was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Diagnostic peritoneal lavage only without resuscitation", "Discharge after normal FAST", "CT abdomen with contrast before any transfusion in unstable patient", "Oral fluids and observation", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock"]'::jsonb, 4, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 76-year-old male is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Immediate thyroidectomy", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Oral rehydration and discharge", "Kayexalate only without steroids", "Observation until outpatient endocrinology visit"]'::jsonb, 1, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 45-year-old male patient on haloperidol develops rigidity, fever 40.1°C, autonomic instability.

Physical Examination:

Vitals: HR 130 | BP 180/100 | Temp 40.1°C.
Muscular: Lead-pipe rigidity.

Laboratory Results:

CK: 9,800 U/L


Diagnosis and treatment?', '["Serotonin syndrome only", "Neuroleptic malignant syndrome \u2014 stop antipsychotic, supportive care, dantrolene/bromocriptine per severity", "Catatonia \u2014 benzodiazepines only without stopping agent", "Meningitis \u2014 antibiotics only", "Continue haloperidol"]'::jsonb, 1, 'NMS: rigidity, hyperthermia, autonomic instability, elevated CK after dopamine blockade — stop offending drug and treat.'),
    (v_topic_id, 'A 55-year-old male has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "Appendectomy", "No antibiotics ever for diverticulitis", "IV thrombolysis", "Immediate elective colectomy during this admission for all cases"]'::jsonb, 0, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 52-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Liver transplant evaluation first-line", "Cholestyramine", "Interferon-ribavirin only", "Observation without treatment ever", "Direct-acting antiviral regimen for 8\u201312 weeks"]'::jsonb, 4, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 48-year-old male is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Single dose dexamethasone and supportive care", "Antibiotics mandatory", "Chest tube", "Racemic epinephrine required for all", "Intubation"]'::jsonb, 0, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 77-year-old male has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Empiric ceftriaxone for ascending cholangitis without imaging", "Immediate appendectomy", "Observation for spontaneous resolution", "Oral ursodiol only and discharge", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy"]'::jsonb, 4, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 28-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Urgent CT pulmonary angiography", "Oral aspirin and discharge with outpatient stress test", "High-dose IV beta-blocker before reperfusion", "Emergent coronary angiography with primary PCI", "Intravenous heparin alone without reperfusion strategy"]'::jsonb, 3, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 83-year-old male elderly with gradual memory loss, getting lost, personality change over 2 years.

Physical Examination:

Vitals: Normal.
Neuro: MMSE 18/30, no focal weakness.

Laboratory Results:

CT head: Hippocampal atrophy, no mass


Most likely diagnosis?', '["ADHD", "Normal aging", "Brief psychotic disorder", "Delirium from infection today only", "Alzheimer disease"]'::jsonb, 4, 'Insidious progressive memory impairment with functional decline = Alzheimer until proven otherwise.'),
    (v_topic_id, 'A 52-year-old female has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["No antibiotics ever for diverticulitis", "IV thrombolysis", "Appendectomy", "Immediate elective colectomy during this admission for all cases", "Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable"]'::jsonb, 4, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 37-year-old female was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Oral fluids and observation", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "Diagnostic peritoneal lavage only without resuscitation", "Discharge after normal FAST", "CT abdomen with contrast before any transfusion in unstable patient"]'::jsonb, 1, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 61-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ovarian torsion only without pregnancy", "PID only", "Ectopic pregnancy", "Threatened abortion with IUP", "Normal pregnancy"]'::jsonb, 2, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 46-year-old female with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Potassium supplementation before any fluids", "Subcutaneous insulin only and oral fluids", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Oral antidiabetic agents and discharge", "Immediate sodium bicarbonate for all patients"]'::jsonb, 2, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 41-year-old male on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Observation only", "Switch to subcutaneous enoxaparin", "Start warfarin immediately", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets"]'::jsonb, 3, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 56-year-old male presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Peptic ulcer perforation", "Alcohol-induced acute pancreatitis", "Acute cholecystitis from cholelithiasis", "Mesenteric ischemia", "Acute hepatitis A"]'::jsonb, 1, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 51-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Desmopressin (dDAVP) administration", "Administration of IV 0.45% (half-normal) saline", "Rapid correction with 5% Dextrose in water (D5W)", "Administration of IV 0.9% (normal) saline", "Administration of IV 3% (hypertonic) saline"]'::jsonb, 1, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 62-year-old female infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Immediate surgery", "No antibiotics needed", "Steroids only"]'::jsonb, 1, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 55-year-old male teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Penicillin or amoxicillin", "Acyclovir", "Azithromycin first-line always", "Prednisone only", "No antibiotics for positive rapid strep"]'::jsonb, 0, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 67-year-old female has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Observation without treatment ever", "Interferon-ribavirin only", "Liver transplant evaluation first-line", "Cholestyramine", "Direct-acting antiviral regimen for 8\u201312 weeks"]'::jsonb, 4, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 60-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["Full-thickness (third-degree)", "First-degree sunburn pattern", "Superficial only", "All burns are partial thickness", "Chemical burn only"]'::jsonb, 0, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 46-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Vitamin B12 alone without checking iron", "Immediate transfuse to Hgb 15", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Phlebotomy", "Oral iron only always sufficient"]'::jsonb, 2, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 78-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Roseola infantum (exanthem subitum due to HHV-6)", "Scarlet fever", "Meningococcemia", "Measles with ongoing high fever", "Kawasaki disease"]'::jsonb, 0, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 58-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Oral iron only always sufficient", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Phlebotomy", "Immediate transfuse to Hgb 15", "Vitamin B12 alone without checking iron"]'::jsonb, 1, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 77-year-old male developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Observation with repeat imaging in 1 week", "Thrombolysis for all stable patients", "Aspirin monotherapy", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "IV antibiotics for pneumonia"]'::jsonb, 3, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 56-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "Immediate surgery", "No antibiotics needed", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Steroids only"]'::jsonb, 3, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 56-year-old male is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Chest CT with contrast", "Incision and drainage of neck", "Immediate intubation for all stridor", "Antibiotics (amoxicillin) as first-line", "Nebulized racemic epinephrine and dexamethasone"]'::jsonb, 4, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 32-year-old male presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Incomplete abortion", "Ectopic pregnancy", "Threatened abortion with closed cervix", "Normal intrauterine pregnancy", "Molar pregnancy only"]'::jsonb, 0, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 46-year-old female has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Colonoscopy first", "Observe without endoscopy", "Upper endoscopy (EGD)", "Barium swallow", "Abdominal MRI as first test"]'::jsonb, 2, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 81-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Septic arthritis only without crystals", "Rheumatoid arthritis initial presentation", "Pseudogout (CPPD)", "Gout", "OA flare"]'::jsonb, 3, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 68-year-old female has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Pseudogout (CPPD)", "Rheumatoid arthritis initial presentation", "Septic arthritis only without crystals", "Gout", "OA flare"]'::jsonb, 3, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 22-year-old male has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Colonoscopy first", "Barium swallow", "Observe without endoscopy", "Abdominal MRI as first test", "Upper endoscopy (EGD)"]'::jsonb, 4, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 71-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Primary biliary cholangitis", "Incarcerated inguinal hernia", "Colonic malignancy as primary cause of SBO", "Postoperative adhesions", "Acute appendicitis"]'::jsonb, 3, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 24-year-old male has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["All burns are partial thickness", "Superficial only", "First-degree sunburn pattern", "Full-thickness (third-degree)", "Chemical burn only"]'::jsonb, 3, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 81-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Roseola infantum (exanthem subitum due to HHV-6)", "Measles with ongoing high fever", "Scarlet fever", "Kawasaki disease", "Meningococcemia"]'::jsonb, 0, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 39-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Subcutaneous insulin only and oral fluids", "Immediate sodium bicarbonate for all patients", "Potassium supplementation before any fluids", "Oral antidiabetic agents and discharge"]'::jsonb, 0, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 77-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Stop all anticoagulation", "Anticoagulation and evaluate for antiphospholipid syndrome", "No workup for thrombophilia", "Only hydroxychloroquine increase", "Platelet transfusion"]'::jsonb, 1, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 37-year-old female has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "Appendectomy", "Immediate elective colectomy during this admission for all cases", "No antibiotics ever for diverticulitis", "IV thrombolysis"]'::jsonb, 0, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 57-year-old male with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Acyclovir IV", "High-dose steroids without antifungals", "Oral metronidazole", "Fluconazole monotherapy for induction", "Amphotericin B plus flucytosine, with careful ICP management"]'::jsonb, 4, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 33-year-old male with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Antibiotics only without bronchodilators", "Immediate intubation for all COPD exacerbations", "Sedation with benzodiazepines for anxiety", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "High-flow oxygen to maintain SpO2 >98% regardless of CO2"]'::jsonb, 3, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 67-year-old male with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Acyclovir IV", "Fluconazole monotherapy for induction", "High-dose steroids without antifungals", "Amphotericin B plus flucytosine, with careful ICP management", "Oral metronidazole"]'::jsonb, 3, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 57-year-old male has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["High-dose opioids only", "Immediate craniotomy", "Antibiotics for meningitis", "Acetazolamide, weight loss, stop offending agents, monitor vision", "No treatment"]'::jsonb, 3, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 69-year-old male is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Calcium channel blockers (amlodipine)", "Short-acting nitrates as monotherapy", "Digoxin as first-line mortality therapy", "Loop diuretics alone", "Beta-blockers (e.g., carvedilol)"]'::jsonb, 4, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 31-year-old male is brought to the Emergency Department by his wife due to confusion and acting strange for the past 24 hours. he has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. he was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 0.45% (half-normal) saline", "Desmopressin (dDAVP) administration", "Administration of IV 0.9% (normal) saline", "Rapid correction with 5% Dextrose in water (D5W)", "Administration of IV 3% (hypertonic) saline"]'::jsonb, 0, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 26-year-old male child 5 years with petechiae, bruising after viral illness, otherwise well.

Physical Examination:

Vitals: Normal.
Skin: Petechiae legs, no hepatosplenomegaly.

Laboratory Results:

Platelets: 12,000/mm³
Rest of counts normal


Most likely diagnosis?', '["ITP", "TTP", "Aplastic anemia all cell lines low", "Leukemia", "DIC"]'::jsonb, 0, 'Isolated thrombocytopenia post-viral in child with normal Hgb/WBC = ITP. Leukemia has other cytopenias/blasts.'),
    (v_topic_id, 'A 24-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Loop diuretics alone", "Beta-blockers (e.g., carvedilol)", "Short-acting nitrates as monotherapy", "Digoxin as first-line mortality therapy", "Calcium channel blockers (amlodipine)"]'::jsonb, 1, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 60-year-old female primigravida at 40 weeks, contractions q3min, cervix 8 cm dilated.

Physical Examination:

Vitals: Normal fetal heart tracing category I.
Cervix: 8/100/-1.

Laboratory Results:

FHR: 140 reactive


Management?', '["Immediate cesarean for all primigravidas", "Forceps before complete dilation", "Discharge home", "Continue active labor management per stage", "Magnesium for seizure prophylaxis"]'::jsonb, 3, 'Active labor with reassuring FHR — expectant management/augment as indicated.'),
    (v_topic_id, 'A 27-year-old female with atrial fibrillation (not anticoagulated) has sudden severe abdominal pain out of proportion to exam.

Physical Examination:

Vitals: Temp 37.2°C | HR 130 bpm (irregular) | BP 94/58 mmHg | RR 22/min.
Abdomen: Soft, mild diffuse tenderness, no peritoneal signs, hypoactive bowel sounds.
Cardiac: Irregularly irregular rhythm.

Laboratory Results:

WBC: 18,000/mm³
Lactate: 6.2 mmol/L (elevated)
ABG: pH 7.28, HCO3 14 mEq/L
CT angiography abdomen: SMA occlusion with bowel wall thickening


What is the most likely diagnosis and urgent management priority?', '["Peptic ulcer disease \u2014 PPI and outpatient follow-up", "Acute mesenteric ischemia \u2014 emergent vascular evaluation and possible revascularization", "Acute diverticulitis \u2014 oral metronidazole", "Irritable bowel syndrome \u2014 antispasmodics", "Constipation \u2014 enema and discharge"]'::jsonb, 1, 'Pain out of proportion, AFib embolic risk, metabolic acidosis, and SMA occlusion indicate acute mesenteric ischemia — a surgical/vascular emergency. Diverticulitis and PUD do not match vascular occlusion. IBS and constipation are not acute ischemic presentations.'),
    (v_topic_id, 'A 40-year-old male has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Myasthenia gravis", "No treatment ever", "Brain tumor first-line", "Stroke"]'::jsonb, 0, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 35-year-old male is a college student with 5 days of decreased sleep, pressured speech, grandiosity, and risky spending. No substances on tox screen.

Physical Examination:

Vitals: HR 98 bpm | BP 138/86 mmHg.
Mental status: Euphoric, flight of ideas, no hallucinations.
Neuro: Nonfocal.

Laboratory Results:

TSH: Normal
Urine drug screen: Negative
CMP: Normal


What is the most appropriate acute pharmacotherapy?', '["Second-generation antipsychotic (e.g., quetiapine or olanzapine) \u00b1 mood stabilizer depending on severity", "SSRI monotherapy as first-line for acute mania", "Donepezil", "No treatment \u2014 mania is self-limited without risk", "Long-acting opioid therapy"]'::jsonb, 0, 'Acute mania is treated with antipsychotics and/or mood stabilizers (lithium, valproate). SSRIs can worsen mania. Opioids and donepezil are inappropriate. Mania carries significant risk and needs treatment.'),
    (v_topic_id, 'A 81-year-old male has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["Gout", "Rheumatoid arthritis initial presentation", "Septic arthritis only without crystals", "OA flare", "Pseudogout (CPPD)"]'::jsonb, 0, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 38-year-old male is a college student with 5 days of decreased sleep, pressured speech, grandiosity, and risky spending. No substances on tox screen.

Physical Examination:

Vitals: HR 98 bpm | BP 138/86 mmHg.
Mental status: Euphoric, flight of ideas, no hallucinations.
Neuro: Nonfocal.

Laboratory Results:

TSH: Normal
Urine drug screen: Negative
CMP: Normal


What is the most appropriate acute pharmacotherapy?', '["No treatment \u2014 mania is self-limited without risk", "SSRI monotherapy as first-line for acute mania", "Long-acting opioid therapy", "Donepezil", "Second-generation antipsychotic (e.g., quetiapine or olanzapine) \u00b1 mood stabilizer depending on severity"]'::jsonb, 4, 'Acute mania is treated with antipsychotics and/or mood stabilizers (lithium, valproate). SSRIs can worsen mania. Opioids and donepezil are inappropriate. Mania carries significant risk and needs treatment.'),
    (v_topic_id, 'A 76-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Chemotherapy", "Antibiotics only", "No repair ever", "Emergent OR for all groin masses", "Elective surgical repair when symptomatic"]'::jsonb, 4, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 57-year-old male has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Scabies", "Dermatomyositis only", "Contact dermatitis only", "Gout", "Systemic lupus erythematosus"]'::jsonb, 4, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 32-year-old male has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Oral NSAIDs", "Warfarin loading", "High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "Discharge without endoscopy"]'::jsonb, 3, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 61-year-old male has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Pheochromocytoma", "Renal cell carcinoma", "Hypothyroidism", "Essential hypertension only", "Primary hyperaldosteronism"]'::jsonb, 4, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 56-year-old female postpartum day 2 has fever, uterine tenderness, foul lochia.

Physical Examination:

Vitals: Temp 39.0°C | HR 110.
Uterus: Tender, subinvoluted.

Laboratory Results:

WBC: 17,000


Diagnosis and treatment?', '["Normal lochia \u2014 no treatment", "Appendicitis only", "UTI only without uterine exam", "Mastitis", "Postpartum endometritis \u2014 broad-spectrum IV antibiotics (e.g., clindamycin + gentamicin)"]'::jsonb, 4, 'Fever + uterine tenderness + foul lochia = endometritis needing IV broad-spectrum antibiotics.'),
    (v_topic_id, 'A 79-year-old male has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Sick euthyroid", "Graves disease", "Pituitary TSHoma only without hyperthyroid labs", "Subclinical hypothyroidism", "Hashimoto thyroiditis"]'::jsonb, 1, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 39-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Racemic epinephrine required for all", "Chest tube", "Single dose dexamethasone and supportive care", "Antibiotics mandatory", "Intubation"]'::jsonb, 2, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 78-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 3% (hypertonic) saline", "Administration of IV 0.9% (normal) saline", "Desmopressin (dDAVP) administration", "Administration of IV 0.45% (half-normal) saline", "Rapid correction with 5% Dextrose in water (D5W)"]'::jsonb, 3, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 57-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Phlebotomy", "Vitamin B12 alone without checking iron", "Oral iron only always sufficient", "Immediate transfuse to Hgb 15", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals"]'::jsonb, 4, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 42-year-old female has burn to arm — white waxy center, no sensation in center, blisters at periphery.

Physical Examination:

Vitals: Stable.
Skin: Full-thickness area 3%, partial 5%.

Laboratory Results:

No labs urgent


Burn depth classification of white anesthetic center?', '["All burns are partial thickness", "First-degree sunburn pattern", "Full-thickness (third-degree)", "Superficial only", "Chemical burn only"]'::jsonb, 2, 'White insensate area indicates full-thickness burn often needing grafting.'),
    (v_topic_id, 'A 29-year-old female has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Elective surgical repair when symptomatic", "Emergent OR for all groin masses", "Antibiotics only", "No repair ever", "Chemotherapy"]'::jsonb, 0, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 39-year-old female with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Immediate sodium bicarbonate for all patients", "Subcutaneous insulin only and oral fluids", "Potassium supplementation before any fluids", "Oral antidiabetic agents and discharge"]'::jsonb, 0, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 82-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Hyperosmolar hyperglycemic state", "Hypoglycemia", "Lactic acidosis primary", "Normal variant", "DKA"]'::jsonb, 0, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 24-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["Lumbar puncture first", "IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Immediate anticoagulation with warfarin", "High-dose steroids", "Observation only"]'::jsonb, 1, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 63-year-old male is a college student with 5 days of decreased sleep, pressured speech, grandiosity, and risky spending. No substances on tox screen.

Physical Examination:

Vitals: HR 98 bpm | BP 138/86 mmHg.
Mental status: Euphoric, flight of ideas, no hallucinations.
Neuro: Nonfocal.

Laboratory Results:

TSH: Normal
Urine drug screen: Negative
CMP: Normal


What is the most appropriate acute pharmacotherapy?', '["Second-generation antipsychotic (e.g., quetiapine or olanzapine) \u00b1 mood stabilizer depending on severity", "No treatment \u2014 mania is self-limited without risk", "Long-acting opioid therapy", "Donepezil", "SSRI monotherapy as first-line for acute mania"]'::jsonb, 0, 'Acute mania is treated with antipsychotics and/or mood stabilizers (lithium, valproate). SSRIs can worsen mania. Opioids and donepezil are inappropriate. Mania carries significant risk and needs treatment.'),
    (v_topic_id, 'A 38-year-old female has palpitations, weight loss, heat intolerance, lid lag.

Physical Examination:

Vitals: HR 118 | BP 148/78.
Thyroid: Diffusely enlarged, bruit.

Laboratory Results:

TSH: <0.01
Free T4/T3: Elevated
TSI: Positive


Most likely diagnosis?', '["Sick euthyroid", "Hashimoto thyroiditis", "Graves disease", "Pituitary TSHoma only without hyperthyroid labs", "Subclinical hypothyroidism"]'::jsonb, 2, 'Diffuse goiter, hyperthyroid labs, positive TSI = Graves. Hashimoto causes hypothyroidism.'),
    (v_topic_id, 'A 80-year-old female was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "CT abdomen with contrast before any transfusion in unstable patient", "Diagnostic peritoneal lavage only without resuscitation", "Oral fluids and observation", "Discharge after normal FAST"]'::jsonb, 0, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 82-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Radioactive iodine", "Observation only", "Propranolol only without levothyroxine", "Methimazole", "Levothyroxine replacement"]'::jsonb, 4, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 38-year-old male with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Only hydroxychloroquine increase", "Anticoagulation and evaluate for antiphospholipid syndrome", "Platelet transfusion", "Stop all anticoagulation", "No workup for thrombophilia"]'::jsonb, 1, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 67-year-old male has acute monoarticular knee pain, erythema, fever after seafood feast.

Physical Examination:

Vitals: Temp 38.6°C.
Knee: Warm, swollen, extremely tender.

Laboratory Results:

Synovial fluid: WBC 80,000, negatively birefringent needle crystals


Diagnosis?', '["OA flare", "Pseudogout (CPPD)", "Rheumatoid arthritis initial presentation", "Septic arthritis only without crystals", "Gout"]'::jsonb, 4, 'Negatively birefringent needles = urate gout. CPPD is positively birefringent rhomboids. Septic arthritis must be considered but crystals support gout; gram stain/culture still important.'),
    (v_topic_id, 'A 65-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Beta-blocker monotherapy first", "Calcium channel blocker only", "Immediate surgery without medical preparation", "High-dose loop diuretics alone", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade"]'::jsonb, 4, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 39-year-old male has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Propranolol only without levothyroxine", "Observation only", "Methimazole", "Levothyroxine replacement", "Radioactive iodine"]'::jsonb, 3, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 45-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Primary hyperaldosteronism", "Pheochromocytoma", "Renal cell carcinoma", "Essential hypertension only", "Hypothyroidism"]'::jsonb, 0, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 72-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Oral aspirin and discharge with outpatient stress test", "Intravenous heparin alone without reperfusion strategy", "High-dose IV beta-blocker before reperfusion", "Emergent coronary angiography with primary PCI", "Urgent CT pulmonary angiography"]'::jsonb, 3, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 59-year-old female has polyuria, polydipsia, glucose 340, anion gap normal, osmolality high.

Physical Examination:

Vitals: HR 100 | BP 100/60.
Mental status: Alert.

Laboratory Results:

Glucose: 340
pH: 7.38
Serum osmolality: 340 mOsm/kg
Ketones: Negative


Diagnosis?', '["Hypoglycemia", "Lactic acidosis primary", "DKA", "Hyperosmolar hyperglycemic state", "Normal variant"]'::jsonb, 3, 'Marked hyperglycemia without significant ketosis/acidosis = HHS, common type 2 diabetes.'),
    (v_topic_id, 'A 29-year-old male has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Scabies", "Dermatomyositis only", "Gout", "Systemic lupus erythematosus", "Contact dermatitis only"]'::jsonb, 3, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 79-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["PID only", "Normal pregnancy", "Threatened abortion with IUP", "Ectopic pregnancy", "Ovarian torsion only without pregnancy"]'::jsonb, 3, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 58-year-old female has sudden unilateral pelvic pain at 6 weeks gestation, dizziness.

Physical Examination:

Vitals: HR 120 | BP 90/60.
Abdomen: RLQ tenderness.

Laboratory Results:

hCG: 3,200
TVUS: No IUP, adnexal mass with free fluid


Most likely diagnosis?', '["Ectopic pregnancy", "PID only", "Threatened abortion with IUP", "Ovarian torsion only without pregnancy", "Normal pregnancy"]'::jsonb, 0, 'Positive hCG without IUP and adnexal mass with free fluid in unstable patient = ectopic until proven otherwise.'),
    (v_topic_id, 'A 29-year-old female has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Acute pericarditis", "GERD only", "Pulmonary embolism only", "Costochondritis only", "STEMI"]'::jsonb, 0, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 56-year-old female has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["GERD", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "UTI", "Splenic sequestration benign", "Acute appendicitis only"]'::jsonb, 1, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 74-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Administration of IV 3% (hypertonic) saline", "Administration of IV 0.9% (normal) saline", "Administration of IV 0.45% (half-normal) saline", "Desmopressin (dDAVP) administration", "Rapid correction with 5% Dextrose in water (D5W)"]'::jsonb, 2, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 55-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Observation with repeat imaging in 1 week", "Aspirin monotherapy", "IV antibiotics for pneumonia", "Thrombolysis for all stable patients", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant"]'::jsonb, 4, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 41-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["No repair ever", "Antibiotics only", "Chemotherapy", "Elective surgical repair when symptomatic", "Emergent OR for all groin masses"]'::jsonb, 3, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 77-year-old male infant 4 months with paroxysmal cough, whoop, post-tussive vomiting.

Physical Examination:

Vitals: Temp 37.2°C.
Lungs: Clear between paroxysms.

Laboratory Results:

WBC: 28,000 with lymphocytosis
PCR: Bordetella pertussis positive


Management includes:', '["Ribavirin", "Immediate surgery", "No antibiotics needed", "Macrolide (azithromycin), supportive care, contact prophylaxis", "Steroids only"]'::jsonb, 3, 'Pertussis treated with macrolide and isolation/prophylaxis of contacts.'),
    (v_topic_id, 'A 35-year-old female teen presents with sore throat, fever, tonsillar exudates, tender anterior cervical nodes.

Physical Examination:

Vitals: Temp 38.9°C.
HEENT: Exudative tonsillitis, no cough.

Laboratory Results:

Rapid strep: Positive


Treatment?', '["Penicillin or amoxicillin", "Prednisone only", "No antibiotics for positive rapid strep", "Acyclovir", "Azithromycin first-line always"]'::jsonb, 0, 'Strep pharyngitis confirmed needs penicillin/amoxicillin (or cephalosporin if allergy).'),
    (v_topic_id, 'A 82-year-old female has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Empiric ceftriaxone for ascending cholangitis without imaging", "Immediate appendectomy", "Observation for spontaneous resolution", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy", "Oral ursodiol only and discharge"]'::jsonb, 3, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 37-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Sedation with benzodiazepines for anxiety", "Immediate intubation for all COPD exacerbations", "Antibiotics only without bronchodilators", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "High-flow oxygen to maintain SpO2 >98% regardless of CO2"]'::jsonb, 3, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 75-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["High-dose steroids", "Immediate anticoagulation with warfarin", "Lumbar puncture first", "Observation only", "IV alteplase evaluation and/or mechanical thrombectomy per protocol"]'::jsonb, 4, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 41-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Immediate splenectomy", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "Observation without antibiotics", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "ERCP as first step for all RUQ pain"]'::jsonb, 1, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 22-year-old male has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["GERD", "Acute appendicitis only", "Splenic sequestration benign", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "UTI"]'::jsonb, 3, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 42-year-old male with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Antibiotics only without bronchodilators", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "Sedation with benzodiazepines for anxiety", "Immediate intubation for all COPD exacerbations"]'::jsonb, 2, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 44-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["Lumbar puncture first", "IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Immediate anticoagulation with warfarin", "Observation only", "High-dose steroids"]'::jsonb, 1, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 80-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Immediate splenectomy", "Observation without antibiotics", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "ERCP as first step for all RUQ pain"]'::jsonb, 2, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 62-year-old female has LLQ pain, fever, and constipation. CT shows colonic diverticula with pericolic fat stranding.

Physical Examination:

Vitals: Temp 38.5°C | HR 96 bpm | BP 130/84 mmHg.
Abdomen: LLQ tenderness, guarding localized to LLQ, no diffuse peritonitis.

Laboratory Results:

WBC: 14,100/mm³
CT: Sigmoid diverticulitis without abscess or free air


What is the most appropriate initial management for uncomplicated diverticulitis?', '["IV thrombolysis", "Appendectomy", "Oral antibiotics (e.g., amoxicillin-clavulanate or metronidazole + fluoroquinolone where appropriate), bowel rest, and outpatient follow-up if stable", "Immediate elective colectomy during this admission for all cases", "No antibiotics ever for diverticulitis"]'::jsonb, 2, 'Uncomplicated diverticulitis in stable outpatients is managed with antibiotics (select cases may be managed without per recent guidelines but exam-style answer remains antibiotics + supportive care), dietary modification, and follow-up. Routine immediate surgery is not indicated. Thrombolysis and appendectomy are irrelevant.'),
    (v_topic_id, 'A 55-year-old female is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Roseola infantum (exanthem subitum due to HHV-6)", "Measles with ongoing high fever", "Scarlet fever", "Kawasaki disease", "Meningococcemia"]'::jsonb, 0, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 37-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Costochondritis only", "Acute pericarditis", "Pulmonary embolism only", "STEMI", "GERD only"]'::jsonb, 1, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 74-year-old female with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Incarcerated inguinal hernia", "Colonic malignancy as primary cause of SBO", "Acute appendicitis", "Primary biliary cholangitis", "Postoperative adhesions"]'::jsonb, 4, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 60-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["Chemotherapy", "No repair ever", "Antibiotics only", "Emergent OR for all groin masses", "Elective surgical repair when symptomatic"]'::jsonb, 4, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 30-year-old male has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Abdominal MRI as first test", "Colonoscopy first", "Barium swallow", "Upper endoscopy (EGD)", "Observe without endoscopy"]'::jsonb, 3, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 57-year-old female has 3 weeks of depressed mood, insomnia, 5-kg weight loss, poor concentration, and passive suicidal ideation without plan.

Physical Examination:

Vitals: Normal.
Mental status: Depressed affect, no psychosis, intact judgment for safety contract discussion.
Physical: Nonfocal neuro exam.

Laboratory Results:

TSH: Normal
CBC, BMP: Normal
Urine tox: Negative


What is the most appropriate initial treatment for this major depressive episode?', '["Haloperidol monotherapy", "Lithium monotherapy as first-line for unipolar depression", "Benzodiazepine monotherapy long-term", "SSRI (e.g., sertraline) plus psychotherapy and safety planning", "No treatment \u2014 watchful waiting only for severe functional impairment"]'::jsonb, 3, 'Moderate–severe MDD without psychosis is first treated with SSRI/SNRI plus therapy and safety assessment. Lithium is for bipolar disorder. Antipsychotic monotherapy is not first-line unipolar depression. Benzos are not antidepressants. Severe functional impairment warrants active treatment.'),
    (v_topic_id, 'A 65-year-old female with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Sedation with benzodiazepines for anxiety", "Immediate intubation for all COPD exacerbations", "Antibiotics only without bronchodilators", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics"]'::jsonb, 4, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 67-year-old female presents with severe epigastric pain radiating to the back, vomiting, and history of heavy alcohol use.

Physical Examination:

Vitals: Temp 38.2°C | HR 118 bpm | BP 100/64 mmHg | RR 24/min.
Abdomen: Epigastric tenderness without rebound; bowel sounds hypoactive.
Skin: No jaundice.

Laboratory Results:

Lipase: 1,840 U/L (4× ULN)
AST/ALT: Mildly elevated
Triglycerides: 180 mg/dL
Abdominal ultrasound: No gallstones


What is the most likely etiology in this patient?', '["Acute cholecystitis from cholelithiasis", "Acute hepatitis A", "Alcohol-induced acute pancreatitis", "Peptic ulcer perforation", "Mesenteric ischemia"]'::jsonb, 2, 'Elevated lipase with epigastric pain and alcohol history supports alcoholic pancreatitis; ultrasound without gallstones makes gallstone etiology less likely. Cholecystitis needs RUQ findings. Mesenteric ischemia has different pain pattern. Perforation has peritoneal signs. Hepatitis does not explain lipase this high as primary diagnosis.'),
    (v_topic_id, 'A 72-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["Oral phenytoin monotherapy", "Nitroprusside as first-line seizure prophylaxis", "IV magnesium sulfate loading and maintenance", "Immediate magnesium-free vaginal delivery without BP control", "Observation only"]'::jsonb, 2, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 37-year-old male with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Vitamin B12 alone without checking iron", "Oral iron only always sufficient", "Immediate transfuse to Hgb 15", "Phlebotomy", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals"]'::jsonb, 4, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 65-year-old female presents to the emergency department with crushing substernal chest pain radiating to the left arm and jaw for 45 minutes, with diaphoresis and nausea.

Physical Examination:

Vitals: Temp 98.4°F | HR 92 bpm | RR 22/min | BP 148/92 mmHg | SpO2 94% on room air.
Cardiac: Diaphoretic, no murmurs. Lungs with bibasilar crackles.
Extremities: No edema.

Laboratory Results:

ECG: ST-segment elevation in leads II, III, and aVF.
Troponin I: 3.8 ng/mL (elevated)
Chest X-ray: Mild pulmonary vascular congestion


Which of the following is the most appropriate immediate management?', '["Oral aspirin and discharge with outpatient stress test", "High-dose IV beta-blocker before reperfusion", "Urgent CT pulmonary angiography", "Emergent coronary angiography with primary PCI", "Intravenous heparin alone without reperfusion strategy"]'::jsonb, 3, 'Inferior STEMI requires immediate reperfusion; primary PCI is preferred when available within guideline time windows. Aspirin is adjunctive but insufficient alone. Anticoagulation without reperfusion is inadequate. CTPA is for PE suspicion. IV beta-blockers are relatively contraindicated in acute inferior MI with possible RV involvement until stabilized.'),
    (v_topic_id, 'A 52-year-old male elderly with gradual memory loss, getting lost, personality change over 2 years.

Physical Examination:

Vitals: Normal.
Neuro: MMSE 18/30, no focal weakness.

Laboratory Results:

CT head: Hippocampal atrophy, no mass


Most likely diagnosis?', '["Normal aging", "ADHD", "Brief psychotic disorder", "Alzheimer disease", "Delirium from infection today only"]'::jsonb, 3, 'Insidious progressive memory impairment with functional decline = Alzheimer until proven otherwise.'),
    (v_topic_id, 'A 45-year-old male has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["GERD", "Acute appendicitis only", "UTI", "Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "Splenic sequestration benign"]'::jsonb, 3, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 24-year-old male has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["Observation without antibiotics", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "ERCP as first step for all RUQ pain", "Immediate splenectomy", "IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)"]'::jsonb, 4, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 80-year-old female is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Antibiotics (amoxicillin) as first-line", "Immediate intubation for all stridor", "Chest CT with contrast", "Nebulized racemic epinephrine and dexamethasone", "Incision and drainage of neck"]'::jsonb, 3, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 71-year-old male is an 8-month-old with 3 days high fever; fever resolved today and now a diffuse rash appeared.

Physical Examination:

Vitals: Temp 37.0°C (afebrile today) | HR 110 bpm | Appears well.
Skin: Maculopapular rash on trunk and neck as fever cleared.
HEENT: Mildly injected pharynx, no exudates.

Laboratory Results:

CBC: WBC normal
Rapid strep: Negative


What is the most likely diagnosis?', '["Roseola infantum (exanthem subitum due to HHV-6)", "Kawasaki disease", "Scarlet fever", "Meningococcemia", "Measles with ongoing high fever"]'::jsonb, 0, 'Classic roseola: high fever several days then defervescence with maculopapular rash in well-appearing infant. Measles has cough/coryza/conjunctivitis and fever with rash. Kawasaki needs prolonged fever plus criteria. Scarlet fever has sandpaper rash with pharyngitis. Meningococcemia is toxic, not well-appearing post-fever rash.'),
    (v_topic_id, 'A 63-year-old male at 28 weeks has a 1-hour glucose challenge test of 162 mg/dL (failed 50 g screen).

Physical Examination:

Vitals: Normal.
Fundal height: Appropriate for dates.
Fetal heart tones: 150 bpm, reactive.

Laboratory Results:

50 g GCT: 162 mg/dL (threshold typically 130–140)
Prior 3-hour OGTT: Not yet performed


What is the most appropriate next step?', '["Reassure \u2014 no further testing needed", "Start metformin and skip diagnostic testing", "Perform diagnostic 3-hour 100 g oral glucose tolerance test (or 2-hour 75 g test per protocol)", "Start insulin immediately without further testing", "Schedule delivery at 28 weeks"]'::jsonb, 2, 'Abnormal screening GCT requires definitive diagnostic OGTT before labeling gestational diabetes. Insulin/metformin follow diagnosis. Early delivery at 28 weeks is inappropriate.'),
    (v_topic_id, 'A 74-year-old female has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Dermatomyositis only", "Scabies", "Systemic lupus erythematosus", "Contact dermatitis only", "Gout"]'::jsonb, 2, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 58-year-old male has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Knee arthroscopy", "No imaging needed", "Immediate amputation", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Anticoagulation only"]'::jsonb, 3, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 71-year-old male with type 1 diabetes presents with polyuria, polydipsia, vomiting, and Kussmaul respirations.

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


What is the most appropriate initial management?', '["Immediate sodium bicarbonate for all patients", "Subcutaneous insulin only and oral fluids", "IV 0.9% saline resuscitation, insulin infusion after potassium check, and potassium replacement when K+ <5.2", "Potassium supplementation before any fluids", "Oral antidiabetic agents and discharge"]'::jsonb, 2, 'DKA requires volume resuscitation with normal saline, insulin after confirming potassium (add K+ to fluids when K+ falls below ~5.2 because insulin drives K+ intracellularly), and monitoring. Bicarbonate is reserved for severe acidemia (pH <6.9). SC insulin alone is inadequate for DKA. Giving K+ before fluids/insulin assessment can be dangerous if hyperkalemic initially.'),
    (v_topic_id, 'A 35-year-old male is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Antibiotics mandatory", "Racemic epinephrine required for all", "Intubation", "Chest tube", "Single dose dexamethasone and supportive care"]'::jsonb, 4, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 38-year-old female with CKD stage 4 has fatigue and Hgb 8.2 g/dL.

Physical Examination:

Vitals: BP 148/88.
No active bleeding.

Laboratory Results:

Ferritin: 120 ng/mL
TSAT: 22%
Creatinine: 3.8 mg/dL


Most appropriate anemia management in CKD?', '["Phlebotomy", "IV iron if iron deficient and ESAs per nephrology guidelines with target Hgb goals", "Vitamin B12 alone without checking iron", "Oral iron only always sufficient", "Immediate transfuse to Hgb 15"]'::jsonb, 1, 'CKD anemia often needs iron repletion and ESA per guidelines; transfusion targets symptom-driven not normalize to 15. B12 if deficient. Phlebotomy worsens anemia.'),
    (v_topic_id, 'A 60-year-old male has chest pain worse lying flat, relieved leaning forward, recent viral URI.

Physical Examination:

Vitals: Temp 37.9°C.
Cardiac: Friction rub.

Laboratory Results:

ECG: Diffuse ST elevation with PR depression
Troponin: Mildly elevated


Diagnosis?', '["Costochondritis only", "Acute pericarditis", "Pulmonary embolism only", "GERD only", "STEMI"]'::jsonb, 1, 'Positional pain, friction rub, diffuse ST elevation with PR depression = pericarditis. STEMI is regional vascular distribution.'),
    (v_topic_id, 'A 73-year-old female reports episodic pounding headaches, palpitations, and sweating. During an episode in clinic, BP is 224/118 mmHg.

Physical Examination:

Vitals between episodes: BP 142/86 mmHg, HR 82 bpm.
General: Anxious during episode, otherwise well.

Laboratory Results:

24-hour urine metanephrines: Markedly elevated
Abdominal CT: 4 cm right adrenal mass


What is essential preoperative management before adrenalectomy?', '["Immediate surgery without medical preparation", "Calcium channel blocker only", "High-dose loop diuretics alone", "Beta-blocker monotherapy first", "Alpha-blockade first (e.g., phenoxybenzamine), then beta-blocker if needed after alpha blockade"]'::jsonb, 4, 'Pheochromocytoma requires alpha-blockade before beta-blockade to prevent unopposed alpha-mediated vasoconstriction and hypertensive crisis. Beta-blockade first is dangerous. Surgery without preparation is life-threatening.'),
    (v_topic_id, 'A 44-year-old male with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics", "Sedation with benzodiazepines for anxiety", "Immediate intubation for all COPD exacerbations", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Antibiotics only without bronchodilators"]'::jsonb, 0, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 62-year-old female has painless jaundice, 5-kg weight loss, and pruritus for 1 month.

Physical Examination:

Vitals: Temp 37.1°C | BP 132/80 mmHg.
Abdomen: Non-tender, palpable non-tender gallbladder (Courvoisier sign).
Sclera: Icteric.

Laboratory Results:

Total bilirubin: 12.4 mg/dL (direct predominant)
ALP: 620 U/L | ALT: 98 U/L
CT abdomen: Mass at head of pancreas compressing distal bile duct


What is the most appropriate next step in management?', '["Immediate appendectomy", "Observation for spontaneous resolution", "Empiric ceftriaxone for ascending cholangitis without imaging", "Oral ursodiol only and discharge", "ERCP or surgical biliary decompression evaluation and staging for pancreatic malignancy"]'::jsonb, 4, 'Painless obstructive jaundice with pancreatic head mass suggests pancreatic cancer causing biliary obstruction; biliary decompression and oncology/surgical staging follow. Empiric antibiotics without obstruction workup miss malignancy. Ursodiol does not relieve malignant obstruction.'),
    (v_topic_id, 'A 71-year-old female has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "Immediate amputation", "Knee arthroscopy", "No imaging needed", "Anticoagulation only"]'::jsonb, 0, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 27-year-old male with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Platelet transfusion", "No workup for thrombophilia", "Anticoagulation and evaluate for antiphospholipid syndrome", "Only hydroxychloroquine increase", "Stop all anticoagulation"]'::jsonb, 2, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 81-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Hypothyroidism", "Renal cell carcinoma", "Essential hypertension only", "Primary hyperaldosteronism", "Pheochromocytoma"]'::jsonb, 3, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 41-year-old male was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Diagnostic peritoneal lavage only without resuscitation", "Discharge after normal FAST", "Oral fluids and observation", "CT abdomen with contrast before any transfusion in unstable patient", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock"]'::jsonb, 4, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 81-year-old female has resistant hypertension, muscle cramps, and weakness.

Physical Examination:

Vitals: BP 168/98 mmHg on three occasions.
Musculoskeletal: Proximal muscle weakness.
Abdomen: No bruits.

Laboratory Results:

Na: 146 mEq/L | K: 2.9 mEq/L
HCO3: 32 mEq/L (metabolic alkalosis)
Aldosterone/renin ratio: 38 (elevated)


What is the most likely diagnosis?', '["Primary hyperaldosteronism", "Essential hypertension only", "Renal cell carcinoma", "Hypothyroidism", "Pheochromocytoma"]'::jsonb, 0, 'Hypertension + hypokalemia + metabolic alkalosis + elevated ARR suggests primary hyperaldosteronism. Pheochromocytoma causes episodic HTN and catecholamine excess, not hypokalemic alkalosis. Essential HTN does not explain hypokalemia. Hypothyroidism does not fit. RCC is unrelated.'),
    (v_topic_id, 'A 40-year-old male has groin bulge increasing with cough, reducible, no overlying skin changes.

Physical Examination:

Vitals: Normal.
Groin: Reducible mass above inguinal ligament.

Laboratory Results:

No acute labs abnormal


Management?', '["No repair ever", "Chemotherapy", "Antibiotics only", "Elective surgical repair when symptomatic", "Emergent OR for all groin masses"]'::jsonb, 3, 'Symptomatic reducible inguinal hernia — elective repair. Emergent if incarcerated/strangulated.'),
    (v_topic_id, 'A 31-year-old female presents at 10 weeks gestation with heavy vaginal bleeding and passage of tissue. Cervical os is open.

Physical Examination:

Vitals: HR 108 bpm | BP 102/68 mmHg.
Abdomen: Mild suprapubic cramping.
Speculum: Open cervical os with tissue at os.

Laboratory Results:

hCG: 2,400 mIU/mL (lower than expected for dates)
Ultrasound: No intrauterine gestational sac; incomplete products in canal


What is the most likely diagnosis?', '["Incomplete abortion", "Ectopic pregnancy", "Threatened abortion with closed cervix", "Normal intrauterine pregnancy", "Molar pregnancy only"]'::jsonb, 0, 'Open cervix with passage of tissue and incomplete products on ultrasound defines incomplete abortion. Ectopic would not show intrauterine products at os typically. Threatened abortion has closed cervix. Normal pregnancy has viable IUP findings.'),
    (v_topic_id, 'A 53-year-old female with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Amphotericin B plus flucytosine, with careful ICP management", "High-dose steroids without antifungals", "Acyclovir IV", "Fluconazole monotherapy for induction", "Oral metronidazole"]'::jsonb, 0, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 66-year-old female is brought to the Emergency Department by her wife due to confusion and acting strange for the past 24 hours. she has a history of Type 2 Diabetes, Hypertension, and Stage 3 Chronic Kidney Disease. she was recently treated with trimethoprim-sulfamethoxazole for a urinary tract infection.

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


Which of the following is the most appropriate next step in the management of this patient''s hypernatremia?', '["Desmopressin (dDAVP) administration", "Administration of IV 0.45% (half-normal) saline", "Administration of IV 0.9% (normal) saline", "Administration of IV 3% (hypertonic) saline", "Rapid correction with 5% Dextrose in water (D5W)"]'::jsonb, 1, 'This is hypernatremia with hypovolemia (dry mucosa, poor turgor, elevated BUN/Cr, high urine osmolality) likely from decreased free water intake plus possible osmotic diuresis after UTI treatment. Correct with hypotonic fluids (0.45% saline or D5W) and correct sodium slowly (≤10–12 mEq/L per 24 h) to avoid osmotic demyelination. Isotonic saline treats hypovolemia but does not correct hypertonicity as effectively; hypertonic saline worsens hypernatremia; rapid D5W risks overcorrection; dDAVP is for central diabetes insipidus, not this presentation.'),
    (v_topic_id, 'A 32-year-old female has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Liver transplant evaluation first-line", "Interferon-ribavirin only", "Cholestyramine", "Observation without treatment ever", "Direct-acting antiviral regimen for 8\u201312 weeks"]'::jsonb, 4, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 71-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Loop diuretics alone", "Short-acting nitrates as monotherapy", "Calcium channel blockers (amlodipine)", "Digoxin as first-line mortality therapy", "Beta-blockers (e.g., carvedilol)"]'::jsonb, 4, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 32-year-old male has ankle injury cannot bear weight after inversion injury.

Physical Examination:

Vitals: Normal.
Ankle: Tenderness at posterior lateral malleolus.

Laboratory Results:

X-ray Ottawa rules positive — fracture at lateral malleolus


Management?', '["Immediate amputation", "Anticoagulation only", "Splint/cast and orthopedic follow-up; not weight-bearing until cleared", "No imaging needed", "Knee arthroscopy"]'::jsonb, 2, 'Ankle fracture by Ottawa criteria needs immobilization and orthopedic care.'),
    (v_topic_id, 'A 66-year-old male has RUQ pain after motor vehicle collision with hypotension.

Physical Examination:

Vitals: HR 128 | BP 86/52.
Abdomen: RUQ tenderness, rebound.

Laboratory Results:

FAST: Fluid in Morrison pouch
Hgb drop 3 points


Most likely injured organ and management?', '["Liver laceration with hemorrhagic shock \u2014 operative or IR embolization", "Splenic sequestration benign", "UTI", "GERD", "Acute appendicitis only"]'::jsonb, 0, 'Trauma hypotension with positive FAST suggests intra-abdominal hemorrhage often liver/spleen — needs intervention.'),
    (v_topic_id, 'A 75-year-old male was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Diagnostic peritoneal lavage only without resuscitation", "Oral fluids and observation", "Discharge after normal FAST", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "CT abdomen with contrast before any transfusion in unstable patient"]'::jsonb, 3, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 25-year-old male with prior appendectomy presents with crampy abdominal pain, bilious vomiting, and no flatus for 36 hours.

Physical Examination:

Vitals: HR 102 bpm | BP 118/74 mmHg | RR 18/min.
Abdomen: Distended, high-pitched bowel sounds, mild diffuse tenderness, no rebound.
Surgical scars: Midline laparotomy scar well healed.

Laboratory Results:

Abdominal X-ray: Dilated small-bowel loops with air-fluid levels, paucity of colonic gas
Lactate: 1.4 mmol/L


What is the most likely cause of this small-bowel obstruction?', '["Primary biliary cholangitis", "Incarcerated inguinal hernia", "Acute appendicitis", "Colonic malignancy as primary cause of SBO", "Postoperative adhesions"]'::jsonb, 4, 'Prior abdominal surgery with SBO radiographic pattern strongly suggests adhesive disease — the most common SBO cause in adults. Incarcerated hernia is second common but no groin findings described. Primary colonic cancer rarely causes isolated SBO without colonic dilation pattern.'),
    (v_topic_id, 'A 76-year-old male has breast lump 2 cm, mobile, age 45, family history mother breast CA age 48.

Physical Examination:

Vitals: Normal.
Breast: 2 cm firm mobile upper outer quadrant mass, no skin changes.

Laboratory Results:

Mammogram: BI-RADS 4
Core biopsy: Invasive ductal carcinoma ER+


Next step in care?', '["Ignore BI-RADS 4", "Antibiotics for mastitis", "Topical estrogen cream only", "Emergency appendectomy", "Staging workup and multidisciplinary oncologic/surgical planning"]'::jsonb, 4, 'BI-RADS 4 with invasive cancer needs staging and treatment planning.'),
    (v_topic_id, 'A 33-year-old female is a 2-year-old with barking cough and stridor only with crying (mild croup).

Physical Examination:

Vitals: Temp 37.8°C | SpO2 99%.
Lungs: Stridor intermittent.

Laboratory Results:

CXR: Normal


Treatment?', '["Racemic epinephrine required for all", "Intubation", "Single dose dexamethasone and supportive care", "Antibiotics mandatory", "Chest tube"]'::jsonb, 2, 'Mild croup is managed with dexamethasone; epinephrine for moderate-severe.'),
    (v_topic_id, 'A 74-year-old female on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)", "Continue heparin and transfuse platelets", "Observation only", "Switch to subcutaneous enoxaparin", "Start warfarin immediately"]'::jsonb, 0, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 58-year-old female is a 6-week-old infant brought for poor feeding, lethargy, and vomiting.

Physical Examination:

Vitals: Temp 35.8°C (hypothermic) | HR 170 bpm | RR 12/min (episodes of apnea) | BP 62/40 mmHg.
General: Lethargic, mottled.
Genitourinary: Ambiguous in exam; neonatal screen pending review.

Laboratory Results:

Glucose: 32 mg/dL
Na: 128 | K: 7.8 mEq/L (critical)
Cortisol: Low
17-hydroxyprogesterone: Markedly elevated (on prior newborn screen)


What is the most appropriate immediate treatment?', '["Kayexalate only without steroids", "IV normal saline bolus, IV hydrocortisone, and correct hypoglycemia \u2014 treat congenital adrenal hyperplasia crisis", "Oral rehydration and discharge", "Immediate thyroidectomy", "Observation until outpatient endocrinology visit"]'::jsonb, 1, 'Neonatal adrenal crisis (CAH) presents with shock, hyponatremia, hyperkalemia, hypoglycemia — requires IV fluids, stress-dose steroids, glucose correction, and electrolyte management. Outpatient management is unsafe. Kayexalate is adjunctive; steroids are critical.'),
    (v_topic_id, 'A 39-year-old male with HIV (CD4 120, not on ART) has 2 weeks of progressive headache, fever, and confusion.

Physical Examination:

Vitals: Temp 38.9°C | HR 102 bpm | BP 124/78 mmHg.
Neuro: Lethargic, neck stiffness, no focal motor deficits.
Lungs: Clear.

Laboratory Results:

LP: Opening pressure 32 cm H2O, lymphocytic pleocytosis, low glucose, elevated protein
India ink: Positive
Cryptococcal antigen (serum): Positive


What is the most appropriate initial therapy?', '["Oral metronidazole", "Amphotericin B plus flucytosine, with careful ICP management", "Fluconazole monotherapy for induction", "Acyclovir IV", "High-dose steroids without antifungals"]'::jsonb, 1, 'Cryptococcal meningitis in advanced HIV requires induction with amphotericin-based regimen plus flucytosine; fluconazole monotherapy is inadequate for induction. Acyclovir treats HSV. Steroids alone are harmful. Metronidazole treats anaerobic infections, not cryptococcus.'),
    (v_topic_id, 'A 81-year-old female was in a high-speed MVC. BP drops to 80/50 after 2 L crystalloid. FAST exam is positive in splenorenal pouch.

Physical Examination:

Vitals: HR 132 bpm | BP 80/50 mmHg | RR 30/min.
Abdomen: Distended, diffuse tenderness.
Extremities: Cool, delayed cap refill.

Laboratory Results:

Hemoglobin: 6.8 g/dL (down from 11 g/dL on arrival)
Lactate: 5.1 mmol/L
Type and screen: O-negative blood available


What is the most appropriate next step?', '["Diagnostic peritoneal lavage only without resuscitation", "Discharge after normal FAST", "Oral fluids and observation", "Activate massive transfusion protocol and emergent operative intervention for hemorrhagic shock", "CT abdomen with contrast before any transfusion in unstable patient"]'::jsonb, 3, 'Unstable trauma with positive FAST and falling hemoglobin indicates intra-abdominal hemorrhage requiring blood products and emergent surgery (damage control). CT delays life-saving intervention in unstable patients. Observation is inappropriate.'),
    (v_topic_id, 'A 80-year-old male has acute severe headache, papilledema, BMI 35, on tetracycline for acne.

Physical Examination:

Vitals: BP 138/88.
Neuro: Papilledema, CN VI palsy.

Laboratory Results:

LP opening pressure: 34 cm H2O, normal cells
MRI: Empty sella, no mass


Treatment?', '["Acetazolamide, weight loss, stop offending agents, monitor vision", "No treatment", "High-dose opioids only", "Immediate craniotomy", "Antibiotics for meningitis"]'::jsonb, 0, 'Idiopathic intracranial hypertension: elevated opening pressure without mass — acetazolamide, weight loss, stop tetracycline.'),
    (v_topic_id, 'A 56-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Observation only", "Radioactive iodine", "Levothyroxine replacement", "Propranolol only without levothyroxine", "Methimazole"]'::jsonb, 2, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 56-year-old female at 32 weeks gestation has severe headache, visual scotomata, and BP 172/108 mmHg on repeat measurements.

Physical Examination:

Vitals: HR 92 bpm | RR 18/min.
Neuro: Hyperreflexia, no seizure activity currently.
Reflexes: 3+ patellar reflexes.

Laboratory Results:

Urinalysis: 3+ protein
Platelets: 98,000/mm³
AST/ALT: Elevated
Creatinine: 1.4 mg/dL


What is the most appropriate immediate intervention to prevent eclampsia?', '["IV magnesium sulfate loading and maintenance", "Immediate magnesium-free vaginal delivery without BP control", "Oral phenytoin monotherapy", "Observation only", "Nitroprusside as first-line seizure prophylaxis"]'::jsonb, 0, 'Preeclampsia with severe features requires magnesium for eclampsia prophylaxis plus BP control and delivery planning. Phenytoin is not standard. Delivery is indicated but magnesium is immediate seizure prevention. Nitroprusside is not seizure prophylaxis.'),
    (v_topic_id, 'A 71-year-old female has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["Brain tumor first-line", "Stroke", "No treatment ever", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Myasthenia gravis"]'::jsonb, 3, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 28-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Loop diuretics alone", "Digoxin as first-line mortality therapy", "Calcium channel blockers (amlodipine)", "Beta-blockers (e.g., carvedilol)", "Short-acting nitrates as monotherapy"]'::jsonb, 3, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 83-year-old male has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["Oral NSAIDs", "High-dose beta-blocker acute bolus only without endoscopy plan", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol", "Discharge without endoscopy", "Warfarin loading"]'::jsonb, 2, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 37-year-old male has rash in sun-exposed areas, oral ulcers, joint pain, positive ANA.

Physical Examination:

Vitals: Normal.
Skin: Malar rash sparing nasolabial folds.
Oral: Palatal ulcers.

Laboratory Results:

ANA positive
Anti-dsDNA elevated
Low C3/C4


Diagnosis?', '["Gout", "Scabies", "Dermatomyositis only", "Systemic lupus erythematosus", "Contact dermatitis only"]'::jsonb, 3, 'Malar rash, oral ulcers, serositis/arthralgia, ANA and anti-dsDNA, low complement = SLE.'),
    (v_topic_id, 'A 79-year-old male has hematemesis, melena, hypotension after NSAID use.

Physical Examination:

Vitals: HR 124 | BP 88/50.
Abdomen: Mild epigastric tenderness.

Laboratory Results:

Hgb: 7.1 g/dL
BUN/Cr ratio elevated


After resuscitation, best diagnostic step?', '["Observe without endoscopy", "Upper endoscopy (EGD)", "Abdominal MRI as first test", "Barium swallow", "Colonoscopy first"]'::jsonb, 1, 'Upper GI bleed after resuscitation needs EGD for diagnosis/therapy. Colonoscopy evaluates lower GI bleed.'),
    (v_topic_id, 'A 51-year-old female has fatigue, cold intolerance, weight gain, bradycardia.

Physical Examination:

Vitals: HR 54 | Temp 36.2°C.
Skin: Dry, coarse hair.

Laboratory Results:

TSH: 28 mIU/L (high)
Free T4: Low


Treatment?', '["Observation only", "Radioactive iodine", "Levothyroxine replacement", "Methimazole", "Propranolol only without levothyroxine"]'::jsonb, 2, 'Primary hypothyroidism: high TSH, low T4 — treat with levothyroxine. Methimazole and RAI are for hyperthyroidism.'),
    (v_topic_id, 'A 29-year-old female patient on haloperidol develops rigidity, fever 40.1°C, autonomic instability.

Physical Examination:

Vitals: HR 130 | BP 180/100 | Temp 40.1°C.
Muscular: Lead-pipe rigidity.

Laboratory Results:

CK: 9,800 U/L


Diagnosis and treatment?', '["Continue haloperidol", "Neuroleptic malignant syndrome \u2014 stop antipsychotic, supportive care, dantrolene/bromocriptine per severity", "Meningitis \u2014 antibiotics only", "Serotonin syndrome only", "Catatonia \u2014 benzodiazepines only without stopping agent"]'::jsonb, 1, 'NMS: rigidity, hyperthermia, autonomic instability, elevated CK after dopamine blockade — stop offending drug and treat.'),
    (v_topic_id, 'A 51-year-old male hears persecutory voices commanding self-harm, poor insight, not eating 2 days.

Physical Examination:

Vitals: Dehydration signs.
Mental status: Psychotic, disorganized, cannot contract for safety.

Laboratory Results:

Urine tox: Positive methamphetamine


Disposition and treatment?', '["Benzodiazepine long-term maintenance only", "Discharge with follow-up in 1 month only", "No safety assessment", "Antidepressant monotherapy", "Hospitalization, antipsychotic treatment, safety precautions, treat stimulant intoxication"]'::jsonb, 4, 'Acute psychosis with command hallucinations and inability to care for self requires inpatient stabilization and antipsychotics.'),
    (v_topic_id, 'A 22-year-old female with SLE on hydroxychloroquine has fever, pleuritic chest pain, and leg swelling unilateral.

Physical Examination:

Vitals: HR 110 | SpO2 92%.
Lungs: Clear.
Leg: Left calf swollen.

Laboratory Results:

D-dimer elevated
CTPA: Segmental PE
Anti-cardiolipin IgG positive


Management should include:', '["Stop all anticoagulation", "Anticoagulation and evaluate for antiphospholipid syndrome", "No workup for thrombophilia", "Platelet transfusion", "Only hydroxychloroquine increase"]'::jsonb, 1, 'PE in setting of APS requires anticoagulation often long-term and APS evaluation. Stopping anticoagulation is harmful.'),
    (v_topic_id, 'A 54-year-old female has RUQ pain, fever, and nausea after a fatty meal. Murphys sign is positive.

Physical Examination:

Vitals: Temp 38.8°C | HR 104 bpm | BP 128/82 mmHg.
Abdomen: RUQ tenderness with inspiratory arrest on palpation.
Sclera: Anicteric.

Laboratory Results:

WBC: 13,400/mm³
RUQ ultrasound: Gallstones, gallbladder wall thickening, pericholecystic fluid


What is the most appropriate management?', '["IV fluids, antibiotics, analgesia, and cholecystectomy (typically during same admission when uncomplicated)", "Oral antibiotics only and elective cholecystectomy in 6 months only if recurrent", "ERCP as first step for all RUQ pain", "Immediate splenectomy", "Observation without antibiotics"]'::jsonb, 0, 'Acute cholecystitis is managed with supportive care, antibiotics, and cholecystectomy (early laparoscopic cholecystectomy is standard for uncomplicated cases). Delaying antibiotics is unsafe. ERCP is for choledocholithiasis/cholangitis, not uncomplicated cholecystitis alone.'),
    (v_topic_id, 'A 33-year-old female has acute unilateral facial weakness including forehead, ear pain, no limb weakness.

Physical Examination:

Vitals: Normal.
Neuro: Cannot close right eye or raise eyebrow; hyperacusis.

Laboratory Results:

No stroke on MRI brain


Diagnosis and treatment?', '["No treatment ever", "Bell palsy \u2014 prednisone within 72 hours \u00b1 antiviral per protocol", "Brain tumor first-line", "Stroke", "Myasthenia gravis"]'::jsonb, 1, 'Forehead-sparing vs involvement: full face including forehead = peripheral Bell palsy; early steroids improve outcomes.'),
    (v_topic_id, 'A 43-year-old female presents with acute focal right arm weakness and aphasia starting 90 minutes ago.

Physical Examination:

Vitals: BP 188/104 | HR 88 | AFib on exam.
Neuro: Left gaze preference, right hemiparesis, expressive aphasia.

Laboratory Results:

CT head: No hemorrhage
CT angiography: Left MCA occlusion


What is the most appropriate next step if within thrombolysis/ thrombectomy window?', '["IV alteplase evaluation and/or mechanical thrombectomy per protocol", "Lumbar puncture first", "High-dose steroids", "Immediate anticoagulation with warfarin", "Observation only"]'::jsonb, 0, 'Acute ischemic stroke within window requires reperfusion assessment (tPA and/or thrombectomy) after excluding hemorrhage. Immediate warfarin is not acute therapy. Observation misses reperfusion opportunity.'),
    (v_topic_id, 'A 36-year-old female is admitted for worsening shortness of breath, orthopnea, and 6-kg weight gain over 2 weeks. History includes ischemic cardiomyopathy.

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


Which medication class has been shown to reduce mortality in this patient''s condition?', '["Calcium channel blockers (amlodipine)", "Digoxin as first-line mortality therapy", "Short-acting nitrates as monotherapy", "Loop diuretics alone", "Beta-blockers (e.g., carvedilol)"]'::jsonb, 4, 'HFrEF mortality benefit is proven for beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors. Loop diuretics relieve congestion but do not reduce mortality. Nitrates and CCBs are not mortality drugs in HFrEF. Digoxin may reduce hospitalizations but is not first-line mortality therapy.'),
    (v_topic_id, 'A 24-year-old male on heparin for DVT develops calf pain on day 6; platelet count fell from 210,000 to 78,000/mm³.

Physical Examination:

Vitals: Temp 37.6°C | HR 104 bpm | BP 130/84 mmHg.
Extremities: Left calf swollen and tender.
Skin: No petechiae.

Laboratory Results:

Platelets: 78,000/mm³
Lower extremity ultrasound: New deep vein thrombosis
4T score: High probability for HIT


What is the most appropriate next step?', '["Observation only", "Start warfarin immediately", "Switch to subcutaneous enoxaparin", "Continue heparin and transfuse platelets", "Stop all heparin products and start a non-heparin anticoagulant (e.g., argatroban)"]'::jsonb, 4, 'Suspected HIT with thrombosis requires stopping heparin (including LMWH) and alternative anticoagulation (direct thrombin inhibitor or fondaparinux). Continuing heparin or LMWH is harmful. Warfarin alone early can cause skin necrosis; warfarin is added later when platelets recover.'),
    (v_topic_id, 'A 33-year-old male is a 3-year-old with barking cough, stridor at rest, and low-grade fever.

Physical Examination:

Vitals: Temp 38.3°C | HR 130 bpm | RR 32/min | SpO2 93% on room air.
HEENT: Inspiratory stridor, no drooling.
Lungs: Mild intercostal retractions.

Laboratory Results:

Neck X-ray: Steeple sign (subglottic narrowing)
WBC: 11,200/mm³


What is the most appropriate initial treatment for moderate croup?', '["Incision and drainage of neck", "Chest CT with contrast", "Antibiotics (amoxicillin) as first-line", "Nebulized racemic epinephrine and dexamethasone", "Immediate intubation for all stridor"]'::jsonb, 3, 'Moderate croup is treated with dexamethasone and nebulized epinephrine if significant stridor/distress. Not all stridor needs intubation. Antibiotics do not treat viral croup. CT and I&D are not indicated.'),
    (v_topic_id, 'A 25-year-old male with COPD presents with increased dyspnea, purulent sputum, and fever for 3 days.

Physical Examination:

Vitals: Temp 38.7°C | HR 110 bpm | RR 28/min | BP 118/76 mmHg | SpO2 86% on room air.
Lungs: Diffuse wheezes, decreased breath sounds at bases.
Mental status: Alert.

Laboratory Results:

ABG on room air: pH 7.32, PaCO2 58 mmHg, PaO2 52 mmHg
WBC: 15,800/mm³
Chest X-ray: Hyperinflation, no infiltrate


What is the most appropriate initial management?', '["Sedation with benzodiazepines for anxiety", "Immediate intubation for all COPD exacerbations", "High-flow oxygen to maintain SpO2 >98% regardless of CO2", "Antibiotics only without bronchodilators", "Supplemental oxygen (target SpO2 88\u201392%), bronchodilators, systemic corticosteroids, and antibiotics"]'::jsonb, 4, 'Acute COPD exacerbation with hypoxemia/hypercapnia needs controlled oxygen (avoid suppressing hypoxic drive excessively), bronchodilators, steroids, and antibiotics when purulent sputum/fever suggest bacterial trigger. High-flow O2 can worsen hypercapnia. Routine sedation is risky. Intubation is for respiratory failure not all exacerbations.'),
    (v_topic_id, 'A 25-year-old female developed sudden pleuritic chest pain and dyspnea 10 days after total knee replacement.

Physical Examination:

Vitals: Temp 37.8°C | HR 118 bpm | RR 26/min | BP 128/82 mmHg | SpO2 89% on room air.
Lungs: Clear.
Extremities: Left calf tender and swollen; right leg post-surgical dressing intact.

Laboratory Results:

ECG: S1Q3T3 pattern
D-dimer: Elevated
CT Pulmonary Angiography: Bilateral segmental filling defects


What is the most appropriate initial treatment?', '["Thrombolysis for all stable patients", "Anticoagulation with heparin/LMWH bridged to oral anticoagulant", "IV antibiotics for pneumonia", "Aspirin monotherapy", "Observation with repeat imaging in 1 week"]'::jsonb, 1, 'Confirmed PE after recent orthopedic surgery warrants anticoagulation unless contraindicated. Aspirin is insufficient. Thrombolysis is reserved for massive PE with instability. Antibiotics treat infection, not PE. Observation delays necessary treatment.'),
    (v_topic_id, 'A 44-year-old male has chronic hepatitis C genotype 1a, treatment-naive, no cirrhosis on FibroScan.

Physical Examination:

Vitals: Normal.
Abdomen: No ascites.
No stigmata of chronic liver disease.

Laboratory Results:

HCV RNA: 2,400,000 IU/mL
ALT: 68 U/L


Most appropriate modern treatment approach?', '["Direct-acting antiviral regimen for 8\u201312 weeks", "Observation without treatment ever", "Interferon-ribavirin only", "Cholestyramine", "Liver transplant evaluation first-line"]'::jsonb, 0, 'Current HCV standard is pangenotypic DAA regimens with high cure rates. Interferon-based therapy is obsolete first-line. Transplant is for decompensated cirrhosis/HCC.'),
    (v_topic_id, 'A 58-year-old female has coffee-ground emesis, cirrhosis history, spider angiomata.

Physical Examination:

Vitals: HR 118 | BP 92/58.
Abdomen: Ascites, splenomegaly.

Laboratory Results:

Hgb: 6.8
INR: 2.1
BUN elevated


After ABCs, key medication to reduce bleeding?', '["High-dose beta-blocker acute bolus only without endoscopy plan", "Oral NSAIDs", "Warfarin loading", "Discharge without endoscopy", "IV octreotide (or terlipressin where available) and antibiotics for SBP prophylaxis per protocol"]'::jsonb, 4, 'Variceal bleed in cirrhosis: octreotide/vasoactive drugs, antibiotics, urgent EGD banding — not NSAIDs/warfarin.'),
    (v_topic_id, 'A 39-year-old male with a history of IV drug use presents with 3 weeks of fever, fatigue, and dyspnea.

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


What is the most appropriate next diagnostic/management step?', '["Bone marrow biopsy", "Oral amoxicillin and outpatient follow-up", "Rheumatoid factor and ANA panel only", "Obtain multiple blood cultures and start empiric IV antibiotics after cultures; schedule echocardiography if not done", "Immediate valve replacement without antibiotics"]'::jsonb, 3, 'Suspected infective endocarditis (fever, IVDU, tricuspid murmur, peripheral stigmata) requires multiple blood cultures before antibiotics when feasible, echocardiography, and empiric IV antibiotics tailored to likely organisms (often staph in IVDU). Outpatient oral therapy is unsafe. Surgery is not first-line without stabilized infection. Autoimmune panels do not replace cultures and echo.');

END $$;
COMMIT;
