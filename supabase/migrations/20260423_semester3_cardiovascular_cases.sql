-- Migration: Semester 3 - Cardiovascular Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

-- 1. Create/Ensure Topic "Cardiovascular" for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'Cardiovascular', 'cardiovascular', 50)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiovascular' LIMIT 1;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15) - Ischemia, Valves & Congenital Basics
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Anterior MI
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Crushing Chest Pain and V1-V4 Elevation', 'A 62-year-old male presents with crushing substernal chest pain radiating to the jaw. ECG shows ST-elevation in leads V1–V4.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which coronary artery is most likely occluded?', '["RCA", "LCX", "LAD", "Left main"]', 2, 'ST-elevation in V1-V4 corresponds to the anterior wall, supplied by the Left Anterior Descending (LAD) artery.'),
    (v_case_id, 'Histological finding in infarcted myocardium 24 hours later?', '["Contraction bands", "Extensive coagulative necrosis/neutrophils", "Macrophages/Granulation", "Collagen scar"]', 1, '12-24 hours post-MI shows extensive coagulative necrosis and the beginning of neutrophilic infiltration.'),
    (v_case_id, 'Which biomarker is most sensitive/specific within 4–6 hours?', '["CK-MB", "Myoglobin", "Cardiac Troponin I", "LDH-1"]', 2, 'Troponins (I or T) are the gold standard for MI diagnosis due to high sensitivity and specificity.');

    -- CASE 02: Aortic Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syncope and Crescendo-Decrescendo Murmur', 'A 75-year-old female with progressive dyspnea and syncope. Harsh, crescendo-decrescendo systolic murmur at the RUSB.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mitral regurgitation", "Aortic stenosis", "Pulmonic stenosis", "VSD"]', 1, 'The classic triad of AS is SAD: Syncope, Angina, and Dyspnea.'),
    (v_case_id, 'Most common cause in an elderly patient?', '["Bicuspid valve", "Rheumatic disease", "Age-related calcification", "Syphilis"]', 2, 'Senile dystrophic calcification is the #1 cause in the elderly; bicuspid is #1 in younger patients.');

    -- CASE 03: HCM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Cardiac Death in Athlete', 'A 25-year-old athlete collapses and dies. Father died at age 35. Autopsy shows asymmetrical septal thickening.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Dilated CM", "Hypertrophic CM (HCM)", "Restrictive CM", "Myocarditis"]', 1, 'HCM is the most common cause of sudden death in young athletes.'),
    (v_case_id, 'Histological examination would most likely show:', '["Myocyte disarray", "Lymphocytic infiltrate", "Amyloid", "Fatty replacement"]', 0, 'Myocyte disarray (haphazardly arranged myocytes) is pathognomonic for HCM.'),
    (v_case_id, 'Caused by mutations in genes encoding which of the following?', '["Desmosomal", "Sarcomeric proteins (beta-myosin)", "Dystrophin", "Mitochondrial"]', 1, 'HCM is an autosomal dominant disorder of sarcomeric proteins, most commonly beta-myosin heavy chain.');

    -- CASE 04: Endocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'IVDU and Splinter Hemorrhages', 'A 45-year-old IVDU with high fever, new systolic murmur, and splinter hemorrhages.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rheumatic fever", "Infective endocarditis", "NBTE", "Libman-Sacks"]', 1, 'Fever + Murmur + IVDU = Endocarditis until proven otherwise.'),
    (v_case_id, 'Which valve is most commonly involved in IV drug users?', '["Mitral", "Aortic", "Tricuspid", "Pulmonic"]', 2, 'Tricuspid valve is the most frequent target in IVDU "right-sided" endocarditis.'),
    (v_case_id, 'Most common organism in acute, virulent endocarditis?', '["S. viridans", "Staphylococcus aureus", "S. epidermidis", "E. faecalis"]', 1, 'S. aureus is highly virulent and causes rapid destruction; Viridans is subacute.');

    -- CASE 05: Prinzmetal Angina
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chest Pain at Rest (Early Morning)', 'A 50-year-old with episodic chest pain at rest. ECG shows transient ST-elevation that resolves with nitroglycerin.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Stable", "Unstable", "Prinzmetal angina", "STEMI"]', 2, 'Variant angina occurs at rest due to vasospasm.'),
    (v_case_id, 'Underlying pathophysiology?', '["Fixed plaque", "Coronary artery vasospasm", "Plaque rupture", "Embolization"]', 1, 'Triggers include smoking, cocaine, and triptans; responsive to CCBs and nitrates.');

    -- CASE 06: PDA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Machine-like Continuous Murmur', 'A 4-week-old infant with a machine-like continuous murmur heard at the left infraclavicular area.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ASD", "VSD", "PDA", "Fallot"]', 2, 'The continuous "machinery" murmur is classic for Patent Ductus Arteriosus.'),
    (v_case_id, 'Which medication closes this defect?', '["PGE1", "Indomethacin", "Epinephrine", "Digoxin"]', 1, 'Indomethacin (an NSAID) inhibits PGE2, which is required to keep the ductus patent.');

    -- CASE 07: Aortic Dissection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tearing Chest Pain and High BP', 'A 65-year-old with HTN presents with sudden, tearing chest pain radiating to the back.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MI", "PE", "Aortic dissection", "Pneumothorax"]', 2, 'Sudden "tearing" or "ripping" pain in a hypertensive patient is dissection.'),
    (v_case_id, 'Tearing occurs primarily within which layer?', '["Intima", "Media", "Adventitia", "Vasa vasorum"]', 1, 'Blood enters through an intimal tear and dissects through the media.');

    -- CASE 08: Rheumatic Fever
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Migratory Polyarthritis and Aschoff Bodies', 'A 10-year-old girl with migratory joint pain and a new murmur 3 weeks after a sore throat.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["SLE", "Acute Rheumatic Fever", "RA", "Endocarditis"]', 1, 'Jones criteria: Joint, Oh my heart, Nodules, Erythema marginatum, Sydenham chorea.'),
    (v_case_id, 'Histological hallmark in the heart?', '["Aschoff bodies", "Negri bodies", "Mallory bodies", "Lewy bodies"]', 0, 'Aschoff bodies (granulomas with Anitschkow "caterpillar" cells) are pathognomonic.'),
    (v_case_id, 'Which valve is most commonly affected in chronic phase?', '["Mitral", "Aortic", "Tricuspid", "Pulmonic"]', 0, 'The Mitral valve is almost always involved; "fish-mouth" stenosis is the end stage.');

    -- CASE 09: Dilated Cardiomyopathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alcoholism and Four-Chamber Dilation', 'A 60-year-old alcoholic with orthopnea and peripheral edema. Echo shows EF 25% and 4-chamber enlargement.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hypertrophic", "Dilated CM", "Restrictive", "MI"]', 1, 'Dilated CM presents with systolic failure and eccentric hypertrophy.'),
    (v_case_id, 'Potential cause besides alcohol?', '["Viral myocarditis", "Beriberi", "Doxorubicin", "All of the above"]', 3, 'Alcohol, Wet Beriberi, Coxsackie B, and certain chemo drugs are common causes.');

    -- CASE 10: Tetralogy of Fallot
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tet Spells and Squatting', 'A 2-year-old boy becomes cyanotic while crying and squats to feel better.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Transposition", "Tetralogy of Fallot", "Tricuspid Atresia", "Coarctation"]', 1, 'TOF is the most common cyanotic congenital heart disease.'),
    (v_case_id, 'Which is NOT one of the 4 classic components?', '["Overriding aorta", "RVH", "ASD", "Pulmonic stenosis"]', 2, 'The 4 components are PROVe: Pulmonic stenosis, RVH, Overriding aorta, and VSD.'),
    (v_case_id, 'Squatting improves cyanosis by:', '["Incr SVR/Decr shunt", "Decr heart rate", "Incr venous return", "Closing VSD"]', 0, 'Squatting increases afterload (SVR), which pushes more blood through the pulmonary circuit instead of the VSD shunt.');

    -- CASE 11: Cor Pulmonale
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'COPD and Nutmeg Liver', 'A 68-year-old with COPD has peripheral edema, JVD, and a tender, enlarged liver.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis for this specific type of right heart failure?', '["Left-sided", "Cor pulmonale", "High-output", "Myocarditis"]', 1, 'Cor pulmonale is isolated right heart failure due to primary lung disease.'),
    (v_case_id, 'The "nutmeg liver" appearance is due to:', '["Active hepatitis", "Passive congestion of central veins", "Fatty change", "Hepatic necrosis"]', 1, 'Congestion in the central veins and surrounding sinusoids creates the mottled nutmeg appearance.');

    -- CASE 12: Mitral Valve Prolapse
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mid-systolic Click and Myxomatous Degeneration', 'A 30-year-old female with a mid-systolic click and late systolic murmur at the apex.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mitral stenosis", "Mitral valve prolapse (MVP)", "Aortic regurg", "Tricuspid regurg"]', 1, 'MVP is the most common valvular abnormality.'),
    (v_case_id, 'Often associated with which underlying process?', '["Myxomatous degeneration", "Calcific", "Fibrinous", "Ischemic rupture"]', 0, 'Myxomatous (excess dermatan sulfate) degeneration of the valve/chordae is seen.');

    -- CASE 13: Free Wall Rupture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tamponade Post-MI', 'A patient dies 5 days after a transmural MI. Developed sudden hypotension and muffled heart sounds.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What was the most likely cause of death?', '["V-fib", "LV free wall rupture/tamponade", "Papillary rupture", "Septal rupture"]', 1, 'Free wall rupture leads to hemopericardium and rapid tamponade.'),
    (v_case_id, 'Time frame post-MI with highest risk of rupture?', '["0-24 hrs", "3-14 days", "1 month", "Always equal"]', 1, 'Rupture typically occurs 3-14 days post-MI when macrophages are clearing necrotic tissue but scar has not formed.');

    -- CASE 14: Hyaline vs Hyperplastic Arteriolosclerosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypertension and Onion-skinning', 'A 55-year-old with long-standing HTN has AV nicking. BP spikes to 220/130 with papilledema.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Vascular change in benign (long-standing) hypertension?', '["Hyperplastic (onion-skin)", "Hyaline arteriolosclerosis", "Fibrinoid necrosis", "Monckeberg"]', 1, 'Hyaline deposits (pink glass) are typical of benign HTN.'),
    (v_case_id, 'If BP spikes to malignant levels, pathology shifts to:', '["Hyaline", "Hyperplastic arteriolosclerosis", "Atherosclerosis", "Calcific"]', 1, 'Malignant HTN causes "onion-skin" basement membrane thickening.');

    -- CASE 15: Abdominal Aortic Aneurysm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pulsating Abdominal Mass', 'A 60-year-old male smoker with atherosclerosis has a pulsating abdominal mass.', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Thoracic aneurysm", "Abdominal aortic aneurysm (AAA)", "Dissection", "Renal stenosis"]', 1, 'AAA is usually associated with smoking and atherosclerosis.'),
    (v_case_id, 'Most of these aneurysms are located:', '["Above renal", "Below renal", "Aortic arch", "Iliac"]', 1, 'Most AAAs are infrarenal.'),
    (v_case_id, 'Primary cause for weakening of the aortic wall in AAA?', '["Cystic medial necrosis", "Atherosclerosis/Proteolysis", "Syphilis", "Congenital"]', 1, 'In AAA, atherosclerosis leads to chronic inflammation and media destruction.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 16-30) - Failure, Vasculitis & Murmur Maneuvers
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16: Heart Failure Cells
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Orthopnea and Hemosiderin Macrophages', 'A 72-year-old with orthopnea and nocturnal cough. Crackles at lung bases.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Primary cause of symptoms?', '["Right-sided", "Left-sided failure", "Cor pulmonale", "Pulm HTN"]', 1, 'Left heart failure leads to pulmonary congestion and edema.'),
    (v_case_id, 'Characteristic cells found in the alveoli?', '["Dust cells", "Heart failure cells", "Aschoff", "Langhans"]', 1, 'Heart failure cells are hemosiderin-laden macrophages that have ingested RBCs from micro-hemorrhages.'),
    (v_case_id, 'Most sensitive marker for acute failure?', '["Troponin I", "BNP", "Myoglobin", "CK-MB"]', 1, 'BNP is released by the ventricles in response to stretch.');

    -- CASE 17: Syphilitic Aortitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syphilis and Brassy Cough', 'A 60-year-old with tertiary syphilis and a dilated aortic arch.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AAA", "Syphilitic aneurysm", "Dissection", "Coarctation"]', 1, 'Syphilis (Treponema pallidum) causes obliterative endarteritis of the vasa vasorum.'),
    (v_case_id, 'Caused by inflammatory "endarteritis" of which structure?', '["Intima", "Vasa vasorum", "Adventitia", "Elastic lamina"]', 1, 'Ischemia of the media leads to weakening and "tree-barking" appearance.');

    -- CASE 18: Kawasaki Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Strawberry Tongue and Coronary Aneurysm', 'A 6-year-old with high fever, cracked lips, and strawberry tongue. Erythema of palms/soles.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Scarlet fever", "Kawasaki disease", "PAN", "Measles"]', 1, 'CRASH and Burn: Conjunctivitis, Rash, Adenopathy, Strawberry tongue, Hands/feet erythema, Fever.'),
    (v_case_id, 'Most feared cardiovascular complication?', '["MR", "Coronary artery aneurysm", "Dissection", "MI"]', 1, 'Kawasaki is a medium-vessel vasculitis that targets coronaries.'),
    (v_case_id, 'Standard treatment to prevent complication?', '["Antibiotics", "IVIG and Aspirin", "Warfarin", "Surgery"]', 1, 'High-dose aspirin and IVIG are the standard of care.');

    -- CASE 19: Claudication
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Leg Pain and Atherosclerosis', 'A 55-year-old smoker with claudication and weak pedal pulses.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying pathology?', '["DVT", "Peripheral artery atherosclerosis", "Raynaud", "Buerger"]', 1, 'Peripheral Artery Disease (PAD) is most often caused by atherosclerosis.'),
    (v_case_id, 'Strongest modifiable risk factor?', '["Age", "Sex", "Cigarette smoking", "Family history"]', 2, 'Smoking is the #1 modifiable risk factor for PAD.');

    -- CASE 20: Mitral Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Opening Snap and Atrial Fibrillation', 'A 30-year-old with loud S1, opening snap, and mid-diastolic rumbling murmur.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aortic stenosis", "Mitral stenosis", "Tricuspid regurg", "Pulmonary prolapse"]', 1, 'The "opening snap" is a key indicator of mitral stenosis.'),
    (v_case_id, 'The most common cause of this lesion is:', '["Rheumatic disease", "Endocarditis", "Congenital", "Senile"]', 0, 'Rheumatic heart disease is the overwhelming cause of mitral stenosis.'),
    (v_case_id, 'Patient is at high risk for which rhythm disturbance?', '["V-tach", "Atrial fibrillation", "1st-degree AV block", "WPW"]', 1, 'Left atrial enlargement (from high pressure) predisposes to Atrial Fibrillation.');

    -- CASE 21: Wegener''s Granulomatosis (GPA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis, Hematuria, and c-ANCA', 'A 50-year-old with hemoptysis, hematuria, and positive c-ANCA (PR3-ANCA).', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely vasculitis?', '["Microscopic polyangiitis", "Granulomatosis with polyangiitis", "Churg-Strauss", "PAN"]', 1, 'GPA presents with upper/lower respiratory and renal involvement.'),
    (v_case_id, 'This condition classically involves which "triad"?', '["Heart/Liver/Kidney", "Upper respiratory/Lungs/Kidney", "Skin/Nerve/Muscle", "GI/Heart/Brain"]', 1, 'Nasopharynx (sinusitis), Lung (hemoptysis), and Kidney (RPGN).');

    -- CASE 22: Polyarteritis Nodosa (PAN)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hepatitis B and Rosary Sign', 'A smoker with Hepatitis B, abdominal pain after eating, and "string of pearls" on mesenteric angiography.', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Temporal arteritis", "Polyarteritis nodosa (PAN)", "Takayasu", "Buerger"]', 1, 'PAN is strongly associated with Hep B and spares the lungs.'),
    (v_case_id, 'What type of necrosis is seen in vessel walls?', '["Caseous", "Liquefactive", "Fibrinoid necrosis", "Coagulative"]', 2, 'PAN shows transmural inflammation with fibrinoid necrosis and microaneurysms.');

    -- CASE 23: Transposition of Great Vessels
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Transposition and Cyanosis', 'Newborn with cyanosis not improving with O2. Echo shows aorta from RV and pulmonary artery from LV.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TOF", "Transposition of Great Vessels", "Truncus", "TAPVR"]', 1, 'Two separate, parallel circuits are created.'),
    (v_case_id, 'Communication required for survival?', '["PFO", "PDA", "VSD", "All of the above"]', 3, 'Mixing of blood is mandatory for survival (PGE1 is given to keep PDA open).');

    -- CASE 24: Acute Pericarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'SLE and PR Depression', 'A patient with SLE has friction rub and sharp chest pain relieved by leaning forward.', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute MI", "Acute pericarditis", "Pleurisy", "Aortic dissection"]', 1, 'Pleuritic chest pain relieved by sitting up is classic for pericarditis.'),
    (v_case_id, 'Characteristic ECG finding?', '["ST elevation V1-V4", "Diffuse concave ST elevation/PR depression", "Q waves", "T-wave inversion"]', 1, 'Widespread (diffuse) ST elevation and PR depression are highly characteristic.');

    -- CASE 25: Giant Cell Arteritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Temporal Arteritis and Blindness', 'An 80-year-old with weight loss, jaw claudication, and hard temporal arteries.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Takayasu", "Giant cell arteritis", "PAN", "Wegener''s"]', 1, 'Large vessel vasculitis in the elderly.'),
    (v_case_id, 'Strongly associated with which of the following?', '["Hep C", "Polymyalgia rheumatica", "SLE", "RA"]', 1, 'PMR (muscle pain/stiffness) is seen in ~50% of GCA patients.'),
    (v_case_id, 'Most serious complication if treatment delayed?', '["Renal failure", "Blindness", "Stroke", "Heart attack"]', 1, 'Ophthalmic artery involvement can lead to irreversible blindness; treat with steroids immediately.');

    -- CASE 26: Subclavian Steal Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unequal Arm Blood Pressure', 'Lightheadedness and BP difference of 40 mmHg between arms.', 26)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Coarctation", "Subclavian steal syndrome", "Dissection", "Thoracic outlet"]', 1, 'Narrowing of subclavian causes retrograde flow from vertebral artery.'),
    (v_case_id, 'Stenosis is proximal to the origin of which vessel?', '["Carotid", "Vertebral artery", "Internal mammary", "Axillary"]', 1, 'Retrograde flow through the vertebral artery "steals" blood from the brain.');

    -- CASE 27: Mitral Regurgitation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Holosystolic Murmur and Handgrip', 'A 50-year-old with a "blowing" holosystolic murmur at the apex radiating to the axilla.', 27)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mitral regurgitation", "Aortic regurgitation", "Mitral stenosis", "Tricuspid stenosis"]', 0, 'Holosystolic murmur at apex = MR.'),
    (v_case_id, 'Which maneuver would increase the intensity?', '["Valsalva", "Standing", "Handgrip", "Inspiration"]', 2, 'Handgrip increases afterload, making it harder for blood to exit through the aorta, forcing more back into the atrium.');

    -- CASE 28: Aortic Regurgitation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Decrescendo Murmur and Water-Hammer Pulse', 'Widened pulse pressure (160/60) and diastolic decrescendo murmur at left sternal border.', 28)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aortic stenosis", "Aortic regurgitation", "Mitral regurg", "Pulmonic stenosis"]', 1, 'Wide pulse pressure and Corrigan ("water-hammer") pulse are hallmarks of AR.'),
    (v_case_id, 'Murmur is louder when the patient:', '["Lies flat", "Sits up and leans forward", "Valsalva", "Inhales deeply"]', 1, 'Leaning forward brings the aortic root closer to the chest wall.');

    -- CASE 29: Cardiac Tamponade
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Beck''s Triad and Pulsus Paradoxus', 'Marfan patient with distant heart sounds, JVD, and hypotension. Pulsus paradoxus present.', 29)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MI", "Cardiac tamponade", "Tension pneumothorax", "PE"]', 1, 'Fluid in pericardial sac compressing all 4 chambers.'),
    (v_case_id, 'The triad of muffled sounds, JVD, and hypotension is:', '["Virchow", "Beck''s triad", "Cushing", "Charcot"]', 1, 'Beck''s triad is the clinical hallmark of tamponade.');

    -- CASE 30: Coarctation (Adult)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Notched Ribs and Turner Syndrome', '15-year-old girl with notched ribs on X-ray and BP difference between arms and legs.', 30)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PDA", "Coarctation of the aorta", "VSD", "TOF"]', 1, 'Adult (postductal) coarctation involves collateral circulation through intercostal arteries.'),
    (v_case_id, 'Most commonly associated with which syndrome?', '["Down", "Turner syndrome (45, X)", "Klinefelter", "Marfan"]', 1, 'Turner syndrome patients should be screened for bicuspid aortic valve and coarctation.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 31-45) - HFpEF, Fibromuscular Dysplasia & Tumors
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31: Diastolic Failure (HFpEF)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heart Failure with Preserved EF', 'A 55-year-old with LV hypertrophy and EF 60% develops pulmonary edema.', 31)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Systolic", "Diastolic heart failure (HFpEF)", "Dilated CM", "Mitral stenosis"]', 1, 'Failure with preserved EF is usually due to hypertrophy/stiffness.'),
    (v_case_id, 'Primarily characterized by:', '["Reduced contractility", "Decreased ventricular compliance", "Increased EDV", "Cavitary dilation"]', 1, 'The ventricle is too stiff to fill properly (reduced compliance).');

    -- CASE 32: Fibromuscular Dysplasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'String of Beads and Flank Bruit', 'A 28-year-old female with resistant HTN and "string of beads" appearance of renal artery.', 32)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Atherosclerosis", "Fibromuscular dysplasia", "PAN", "Takayasu"]', 1, 'FMD is a non-inflammatory disease of medium-sized arteries (especially renal and carotid).'),
    (v_case_id, 'Typically affects which layer of the wall?', '["Intima", "Media", "Adventitia", "Elastic lamina"]', 1, 'Medial fibroplasia is the most common histological variant.');

    -- CASE 33: Ruptured AAA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pulsatile Mass and Hypotension', 'Sudden severe abdominal pain, pulsatile mass, and BP 80/40.', 33)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ruptured AAA", "Acute Mesenteric Ischemia", "Dissection", "Nephrolithiasis"]', 0, 'Rupture is a surgical emergency.'),
    (v_case_id, 'Classic "triad" of ruptured AAA?', '["HTN/Bradycardia", "Pain/Hypotension/Pulsatile mass", "Fever/Jaundice/Pain", "Beck''s triad"]', 1, 'The combination of flank pain, shock, and a mass is diagnostic.');

    -- CASE 34: Strawberry Hemangioma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Capillary (Strawberry) Hemangioma', 'A painless, raised, bright red skin lesion in an infant. Histology shows lobulated capillaries.', 34)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Glomus", "Strawberry hemangioma", "Angiosarcoma", "Bacillary angiomatosis"]', 1, 'Also called juvenile hemangioma.'),
    (v_case_id, 'True regarding these lesions in infants?', '["Require surgery", "Spontaneously regress", "Malignancy sign", "HHV-8"]', 1, 'They grow rapidly for a few months and then regress by age 5-8.');

    -- CASE 35: Glomus Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subungual Pain and Glomus Body', 'A very painful, small, blue-red nodule under the fingernail.', 35)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Angiosarcoma", "Glomus tumor", "Kaposi", "Pyogenic"]', 1, 'These are benign but highly painful tumors.'),
    (v_case_id, 'Arise from modified smooth muscle cells involved in:', '["Oxygen sensing", "Thermoregulation", "Glucose transport", "Lymphatic drainage"]', 1, 'The glomus body regulates skin blood flow for temperature control.');

    -- CASE 36: Hepatic Angiosarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'PVC Exposure and Liver Tumor', '65-year-old with 30 years of PVC exposure develops aggressive liver tumor.', 36)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["HCC", "Hepatic angiosarcoma", "Cholangiocarcinoma", "Metastatic"]', 1, 'Angiosarcoma is associated with toxic chemical exposures.'),
    (v_case_id, 'Besides PVC, which other chemical is linked?', '["Asbestos", "Arsenic", "Aflatoxin", "Benzene"]', 1, 'Thorotrast and arsenic are also risk factors.');

    -- CASE 37: Eisenmenger Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shunt Reversal and Eisenmenger', 'Adult ASD patient develops cyanosis and clubbing.', 37)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Reversal of left-to-right to right-to-left is known as:', '["TOF", "Eisenmenger Syndrome", "Ebstein", "Lutembacher"]', 1, 'Eisenmenger is the terminal stage of uncorrected L-to-R shunts.'),
    (v_case_id, 'Underlying cause of the shunt reversal?', '["Pulmonary HTN/RVH", "MI", "Calcification", "Closure"]', 0, 'Chronic high flow leads to pulmonary vascular remodeling and high pressure.');

    -- CASE 38: Mitral Stenosis and Hemosiderin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and Pulmonary Congestion', 'Patient with mitral stenosis has "heart failure cells" in sputum.', 38)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, '"Heart failure cells" are:', '["Neutrophils", "Hemosiderin-laden macrophages", "Plasma cells", "Eosinophils"]', 1, 'They represent previous intra-alveolar hemorrhage.'),
    (v_case_id, 'Why do these form in mitral stenosis?', '["Low BP", "Increased hydrostatic pressure/Micro-hemorrhage", "Viral", "Infarction"]', 1, 'Back pressure from the LA causes pulmonary capillary rupture.');

    -- CASE 39: Libman-Sacks Endocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'SLE and Sterile Vegetations', 'Autopsy shows small, sterile vegetations on both sides of the mitral valve in an SLE patient.', 39)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Rheumatic", "Libman-Sacks Endocarditis", "Infective", "Marantic"]', 1, 'Classic association with systemic lupus.'),
    (v_case_id, 'Marantic (NBTE) endocarditis is more associated with:', '["IVDU", "Advanced malignancy", "HTN", "Strep"]', 1, 'Non-bacterial thrombotic endocarditis is a paraneoplastic sign of adenocarcinoma (Trousseau syndrome).');

    -- CASE 40: Friction Rub
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Viral Pericarditis and Rub', 'Sharp chest pain, worse lying flat, better leaning forward after viral infection.', 40)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely auscultation finding?', '["S3 gallop", "Friction rub", "Muffled sounds", "Opening snap"]', 1, 'A high-pitched scratchy sound heard during all phases of the heart cycle.'),
    (v_case_id, 'Sign expected in "Constrictive Pericarditis"?', '["Pulsus paradoxus", "Kussmaul sign", "Wide pulse pressure", "Systolic click"]', 1, 'Kussmaul sign is the failure of JVP to drop during inspiration.');

    -- CASE 41: Amniotic Fluid Embolism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Partum DIC and Squamous Cells', 'Pregnant woman dies shortly after delivery with DIC. Squamous cells seen in lung vessels.', 41)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Thromboembolism", "Amniotic Fluid Embolism", "Fat Embolism", "Air Embolism"]', 1, 'Amniotic fluid enters maternal circulation via uterine vein rupture.'),
    (v_case_id, 'Presence of squamous cells in lung vessels is pathognomonic for:', '["Lung cancer", "Fetal skin cells in maternal blood", "Smoking", "Pneumonia"]', 1, 'Fetal debris (skin, hair, mucus) is the smoking gun.');

    -- CASE 42: VSD Types
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Holosystolic Murmur at LLSB', '10-year-old boy with a small VSD.', 42)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of VSD?', '["Muscular", "Membranous", "Infundibular", "Supracristal"]', 1, 'The membranous septum is the most frequent site of defects.'),
    (v_case_id, 'Most small VSDs are managed by:', '["Surgery", "Observation/Spontaneous closure", "Transplant", "Anticoagulation"]', 1, 'Most close on their own in childhood.');

    -- CASE 43: Leriche Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Impotence and Absent Femoral Pulses', '70-year-old male with claudication of buttocks/legs and impotence.', 43)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This clinical triad is known as:', '["Virchow", "Leriche Syndrome", "Horner''s", "Dressler"]', 1, 'Aortoiliac occlusive disease.'),
    (v_case_id, 'Level of arterial occlusion?', '["Femoral", "Popliteal", "Aortoiliac bifurcation", "Internal iliac"]', 2, 'Proximal to the iliac branch points.');

    -- CASE 44: Dressler Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Autoimmune Pericarditis Post-MI', 'MI 4 weeks ago; now has fever, pleuritic pain, and friction rub.', 44)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Recurrent MI", "Dressler Syndrome", "Fibrinous pericarditis", "PE"]', 1, 'Late post-MI pericarditis.'),
    (v_case_id, 'Mechanism of this condition?', '["Viral", "Autoimmune", "Rupture", "Bacterial"]', 1, 'Antibodies against myocardial antigens triggered by the previous infarct.');

    -- CASE 45: Malignant Hypertension
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Papilledema and Flea-bitten Kidney', '60-year-old with BP 220/120 and papilledema.', 45)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Benign", "Hypertensive Emergency", "Hyperaldosteronism", "Migraine"]', 1, 'Emergency requires evidence of acute target organ damage.'),
    (v_case_id, 'Which renal pathology is associated?', '["Minimal change", "Flea-bitten kidney", "Polycystic", "Diabetic"]', 1, 'Small petechial hemorrhages due to fibrinoid necrosis and rupture.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 46-60) - Advanced HTN, SVC & Congenital
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46: Onion-skinning
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperplastic Arteriolosclerosis', '210/130 BP, elevated creatinine, and papilledema.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Characteristic vascular finding in renal arterioles?', '["Hyaline", "Hyperplastic (Onion-skinning)", "Monckeberg", "Medial fibroplasia"]', 1, 'Concentric basement membrane duplication.'),
    (v_case_id, 'Patient''s condition is best classified as:', '["Urgency", "Emergency", "Essential", "White-coat"]', 1, 'End-organ damage makes it an emergency.');

    -- CASE 47: SVC Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Facial Plethora and Lung Cancer', 'Heaviness in chest, "collar too tight," facial plethora, distended neck veins.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CHF", "SVC Syndrome", "Tamponade", "Dissection"]', 1, 'Obstruction of SVC drainage.'),
    (v_case_id, 'Most commonly caused by:', '["Aneurysm", "Bronchogenic carcinoma/lymphoma", "Right failure", "TB"]', 1, 'External compression by mediastinal tumors.');

    -- CASE 48: Secondary Raynaud
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blanching Fingers and Scleroderma', 'Episodic blanching, cyanosis, and redness in fingers when exposed to cold.', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Underlying mechanism?', '["Occlusion", "Exaggerated vasomotor response", "Embolism", "Venous insufficiency"]', 1, 'Cold-triggered vasospasm.'),
    (v_case_id, 'If "Secondary", most commonly associated with:', '["RA", "Scleroderma", "OA", "PAN"]', 1, 'Secondary Raynaud is often the first sign of systemic sclerosis.');

    -- CASE 49: AAA Histology
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Infrarenal Aneurysm and Proteolysis', 'Surgeon notes infrarenal aneurysm during surgery.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Primary histological change in the media?', '["Cystic medial necrosis", "Atherosclerosis/Thinning", "Fibrinoid", "Hyaline"]', 1, 'Atherosclerosis leads to degradation of the elastic lamina.'),
    (v_case_id, 'Strongest associated risk factor for expansion?', '["HTN", "Smoking", "Diabetes", "Hypercalcemia"]', 1, 'Cigarette smoking is the most potent predictor of AAA growth.');

    -- CASE 50: Sydenham Chorea
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Purposeless Movements and Rheumatic Fever', 'Child with joint pain and involuntary movements after sore throat.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Name for involuntary movements seen?', '["Hemiballismus", "Sydenham chorea", "Athetosis", "Tics"]', 1, 'Chorea is a key major Jones criterion.'),
    (v_case_id, 'Migratory polyarthritis is characteristic of:', '["Rheumatic Fever", "Juvenile RA", "Septic", "Gonococcal"]', 0, 'Large joints are affected sequentially.');

    -- CASE 51: Concentric Hypertrophy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Concentric vs Eccentric Hypertrophy', 'HTN patient with EF 60% but Thickened LV wall.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Patient''s heart failure is characterized by:', '["Systolic", "Diastolic", "High-output", "Valvular"]', 1, 'Stiff wall prevents filling.'),
    (v_case_id, 'The hypertrophy is described as:', '["Eccentric", "Concentric", "Asymmetrical", "Atrophy"]', 1, 'Pressure overload leads to concentric hypertrophy (parallel sarcomeres).');

    -- CASE 52: Kaposi Sarcoma (HHV-8)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Purple Skin Nodules', 'HIV+ male with purple skin nodules on legs.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bacillary angiomatosis", "Kaposi sarcoma", "Angiosarcoma", "Cherry"]', 1, 'Low-grade vascular malignancy.'),
    (v_case_id, 'Spindle cells are infected with which virus?', '["HHV-6", "HHV-8 (KSHV)", "CMV", "EBV"]', 1, 'Human Herpesvirus 8 causes Kaposi.');

    -- CASE 53: Carcinoid Heart Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Serotonin and Right Heart Plaques', 'Patient with metastatic carcinoid tumor develops new murmur.', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which side of heart is primarily affected?', '["Left", "Right side", "Both", "Coronary"]', 1, 'Serotonin is inactivated in the lung, so only the right heart (tricuspid/pulmonic) is affected.'),
    (v_case_id, 'Endocardial plaques are composed of:', '["Calcium", "Fibrous tissue/Smooth muscle", "Cholesterol", "Thrombi"]', 1, 'Plaques lead to right-sided stenosis/regurgitation.');

    -- CASE 54: Egg-on-a-string Heart
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'TGV and Mediastinal Narrowing', 'Neonate with cyanosis and "egg-on-a-string" heart.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TOF", "Transposition of Great Vessels", "TAPVR", "Ebstein"]', 1, 'TGV is the #1 cause of cyanosis in the first 24 hours.'),
    (v_case_id, 'The "narrow mediastinum" is due to:', '["Small thymus", "Atrophy", "Parallel arrangement of aorta/PA", "Hypoplasia"]', 2, 'The aorta and PA are stacked, making the base look narrow.');

    -- CASE 55: Cor Bovinum (Bovine Heart)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Aortic Stenosis Triad', 'Autopsy shows 800g heart. Aortic valve orifice 0.6 cm2.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Cause of massive heart size?', '["Dilated", "Compensatory hypertrophy/AS", "Amyloid", "Myocarditis"]', 1, 'Extreme pressure overload.'),
    (v_case_id, 'Classic clinical triad?', '["Fever/Anemia/Murmur", "Syncope/Angina/Dyspnea (SAD)", "Beck''s triad", "Hemoptysis/Dyspnea"]', 1, 'SAD symptoms correlate with severe stenosis.');

    -- CASE 56: Stanford Classification
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stanford Type B Dissection', 'Dissection involving descending aorta distal to left subclavian.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Classified by Stanford system as:', '["Type A", "Type B", "Type I", "Type II"]', 1, 'Type A involves the ascending aorta; Type B is distal.'),
    (v_case_id, 'Most important risk factor for dissection?', '["Atherosclerosis", "Hypertension", "Syphilis", "Bicuspid"]', 1, 'HTN is the strongest predictor of aortic dissection.');

    -- CASE 57: Marfan Syndrome Genetics
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fibrillin and MVP', '22-year-old with Marfan has mid-systolic click.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MVP", "AR", "Mitral stenosis", "VSD"]', 0, 'Mitral valve prolapse is common in Marfan.'),
    (v_case_id, 'Marfan is caused by mutation in which gene?', '["COL1A1", "FBN1 (Fibrillin-1)", "FGFR3", "PKD1"]', 1, 'Defect in the structural protein of microfibrils.');

    -- CASE 58: Acute Limb Ischemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Atrial Fibrillation and Limb Embolism', 'Patient with A-fib develops sudden cold, pulseless right foot.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Cause of acute limb ischemia?', '["Plaque rupture", "Arterial embolism", "DVT", "Buerger"]', 1, 'Likely a clot from the left atrial appendage.'),
    (v_case_id, 'Which of the "6 Ps" is demonstrating?', '["Pain/Pallor", "Pulselessness", "Paresthesia/Paralysis", "All of the above"]', 3, 'Pain, Pallor, Pulselessness, Paresthesia, Paralysis, Poikilothermia.');

    -- CASE 59: Atrial Myxoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tumor Plop and Left Atrium', 'Large mobile mass in left atrium. Fever and weight loss.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rhabdomyoma", "Myxoma", "Fibroma", "Lipoma"]', 1, 'Myxoma is the most common primary adult heart tumor.'),
    (v_case_id, 'Classic auscultatory finding?', '["Opening snap", "Tumor plop", "Mid-systolic click", "Friction rub"]', 1, 'The mass swinging through the mitral valve causes a characteristic sound.');

    -- CASE 60 (Final): Down Syndrome Defects
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Endocardial Cushion Defect', 'Heart defect in infant with Down Syndrome.', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most common cardiac defect associated with Down?', '["TOF", "Coarctation", "Endocardial cushion defect", "PDA"]', 2, 'Also called AV canal defect.'),
    (v_case_id, 'Defect results in a large communication between:', '["2 atria", "2 ventricles", "Both atria/Both ventricles", "Aorta/PA"]', 2, 'It creates a large central hole connecting all four chambers.');

    RAISE NOTICE 'SUCCESS: Cardiovascular (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
