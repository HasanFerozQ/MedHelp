BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Cardiac Emergencies
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-cardiac-emergencies" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: STEMI - The Door-to-Balloon Goal (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Crushing Chest Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Crushing Chest Pain', 'A 55-year-old male presents with retrosternal chest pain and ST-segment elevation in leads II, III, and aVF.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male presents with retrosternal chest pain and ST-segment elevation in leads II, III, and aVF.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal "Door-to-Balloon" time for primary PCI?', '["60 minutes", "90 minutes", "120 minutes", "None"]', 1, 'The standard of care for STEMI is reperfusion via PCI within 90 minutes of hospital arrival.'),
    (v_case_id, 'If PCI is not available within 120 minutes, what is the alternative?', '["Wait for transfer", "Systemic Fibrinolytics (e.g., Tenecteplase)", "None", "None"]', 1, 'Thrombolytics should be given within 30 minutes if PCI is delayed.'),
    (v_case_id, 'Which coronary artery is likely occluded in an inferior STEMI?', '["Left Anterior Descending (LAD)", "Right Coronary Artery (RCA)", "Circumflex", "None"]', 1, 'The RCA supplies the inferior wall in most people.');

    ---------------------------------------------------------------------------
    -- CASE 02: Inferior STEMI - Right Ventricular Involvement (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Right Heart Threat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Right Heart Threat', 'The patient with the inferior STEMI is now hypotensive (BP 80/40) with clear lung sounds.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The patient with the inferior STEMI is now hypotensive (BP 80/40) with clear lung sounds.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Heart failure", "Right Ventricular (RV) Infarction", "Aortic dissection", "None"]', 1, 'Hypotension + Inferior MI + Clear lungs = RV Infarction until proven otherwise.'),
    (v_case_id, 'What is the first-line treatment for hypotension in RV Infarction?', '["Nitroglycerin", "Aggressive IV Fluid boluses (preload dependency)", "Furosemide", "None"]', 1, 'RV infarctions are preload dependent; Nitrates and Diuretics can be lethal.'),
    (v_case_id, 'Which ECG modification is used to confirm this?', '["Posterior leads", "Right-sided leads (e.g., V4R)", "None", "None"]', 1, 'ST elevation in V4R is highly sensitive for RV involvement.');

    ---------------------------------------------------------------------------
    -- CASE 03: Acute Decompensated Heart Failure (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Flash Pulmonary Edema' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Flash Pulmonary Edema', 'A patient presents with severe shortness of breath, rales halfway up the chest, and pink frothy sputum.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with severe shortness of breath, rales halfway up the chest, and pink frothy sputum.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most immediate respiratory intervention?', '["Intubate", "Non-invasive positive pressure ventilation (BiPAP/CPAP)", "Nasal cannula", "None"]', 1, 'NIPPV reduces work of breathing and improves preload/afterload by increasing intrathoracic pressure.'),
    (v_case_id, 'Which medication is the mainstay for afterload reduction in hypertensive HF?', '["Morphine", "Nitroglycerin (High-dose IV)", "Furosemide", "None"]', 1, 'Nitrates decrease both preload and afterload, helping "push" fluid out of the lungs.'),
    (v_case_id, 'What is the classic mnemonic for acute HF management?', '["MONA", "LMNOP (Lasix, Morphine, Nitrates, Oxygen, Position/Positive Pressure)", "None", "None"]', 1, 'Though Morphine is now less emphasized, the mnemonic remains a common teaching tool.');

    ---------------------------------------------------------------------------
    -- CASE 04: Aortic Dissection - Presentation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tearing Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tearing Pain', 'A 60-year-old male with severe HTN has sudden "tearing" chest pain radiating to the back.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with severe HTN has sudden "tearing" chest pain radiating to the back.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most sensitive diagnostic imaging for aortic dissection in the ED?', '["CXR", "CT Angiography (CTA)", "Transthoracic Echo", "None"]', 1, 'CTA of the chest/abdomen/pelvis is the gold standard.'),
    (v_case_id, 'What is a "Stanford Type A" dissection?', '["Involves only the descending aorta", "Involves the ascending aorta", "None", "None"]', 1, 'Type A involves the ascending aorta and is a surgical emergency.'),
    (v_case_id, 'What is a classic physical exam finding in dissection?', '["Loud S1", "Blood pressure or pulse differential between arms (> 20 mmHg)", "None", "None"]', 1, 'This suggests the dissection flap is compromising a subclavian artery.');

    ---------------------------------------------------------------------------
    -- CASE 05: Aortic Dissection - Management (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Controlling the Shear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Controlling the Shear', 'You are managing a confirmed Stanford Type B aortic dissection.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Controlling the Shear', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal Heart Rate for an acute dissection?', '["< 100 bpm", "< 60 bpm", "< 80 bpm", "None"]', 1, 'Beta-blockade (e.g., Esmolol) is used to reduce "shear stress" on the aortic wall.'),
    (v_case_id, 'Why must you give a Beta-blocker BEFORE a vasodilator (like Nitroprusside)?', '["To prevent tachycardia", "To prevent reflex tachycardia which increases dP/dt (shear stress)", "None", "None"]', 1, 'Vasodilators alone can cause a compensatory increase in heart rate, worsening the dissection.'),
    (v_case_id, 'What is the goal Systolic BP?', '["< 140", "< 100-120", "< 160", "None"]', 1, 'Maintaining a low-normal BP reduces the risk of propagation or rupture.');

    ---------------------------------------------------------------------------
    -- CASE 06: Pulmonary Embolism - Diagnosis (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Breathless Leg' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Breathless Leg', 'A woman on oral contraceptives presents with pleuritic chest pain and a swollen right calf.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman on oral contraceptives presents with pleuritic chest pain and a swollen right calf.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What clinical scoring system helps decide if a D-dimer is appropriate?', '["CHADS2", "Wells Criteria", "Glasgow", "None"]', 1, 'Wells criteria determine the probability of PE; if low/moderate, a D-dimer can be used to "rule out."'),
    (v_case_id, 'What is the "PERC" rule used for?', '["To diagnose PE", "To rule out PE in very low-risk patients without needing any labs", "None", "None"]', 1, 'If a patient is "PERC negative," the risk of PE is < 2%.'),
    (v_case_id, 'What is the most common ECG finding in PE?', '["S1Q3T3", "Sinus Tachycardia", "Right bundle branch block", "None"]', 1, 'While S1Q3T3 is classic, simple tachycardia is the most common finding.');

    ---------------------------------------------------------------------------
    -- CASE 07: Massive PE - The Unstable Patient (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Obstructive Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Obstructive Shock', 'A patient with suspected PE becomes hypotensive (BP 70/40) with distended neck veins.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with suspected PE becomes hypotensive (BP 70/40) with distended neck veins.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines a "Massive" PE?', '["Large clot on CT", "PE with sustained hypotension (SBP < 90)", "PE with RV strain on Echo", "None"]', 1, 'Severity is defined by hemodynamic stability, not clot size.'),
    (v_case_id, 'What is the treatment of choice for Massive PE?', '["Heparin only", "Systemic Thrombolytics (e.g., Alteplase) or embolectomy", "Aspirin", "None"]', 1, 'Thrombolytics are indicated for PE with hemodynamic collapse.'),
    (v_case_id, 'What is a "Sub-massive" PE?', '["Small clot", "Hemodynamically stable PE but with evidence of RV strain (Echo/Biomarkers)", "None", "None"]', 1, 'Sub-massive PE management is controversial and often involves heparin vs. catheter-directed therapy.');

    ---------------------------------------------------------------------------
    -- CASE 08: Cardiac Tamponade (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Muffled Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Muffled Heart', 'A patient with lung cancer presents with hypotension, JVD, and muffled heart sounds.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with lung cancer presents with hypotension, JVD, and muffled heart sounds.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this classic clinical triad called?', '["Cushing''s Triad", "Beck''s Triad", "Virchow''s Triad", "None"]', 1, 'Hypotension, JVD, and muffled heart sounds are the hallmarks of tamponade.'),
    (v_case_id, 'What is "Pulsus Paradoxus"?', '["Irregular pulse", "A drop in SBP > 10 mmHg during inspiration", "None", "None"]', 1, 'This occurs because the rigid pericardium causes the RV to compress the LV during inspiration.'),
    (v_case_id, 'What is the definitive emergency treatment for tamponade?', '["Fluids", "Pericardiocentesis", "Nitroglycerin", "None"]', 1, 'Removing even a small amount of fluid can dramatically improve hemodynamics.');

    ---------------------------------------------------------------------------
    -- CASE 09: Pericarditis (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Position-Dependent Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Position-Dependent Pain', 'A young male has sharp chest pain that is worse when lying flat and better when leaning forward.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A young male has sharp chest pain that is worse when lying flat and better when leaning forward.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic ECG finding in acute pericarditis?', '["Focal ST elevation", "Diffuse ST-segment elevation and PR-segment depression", "None", "None"]', 1, 'Diffuse changes distinguish it from the focal changes of an MI.'),
    (v_case_id, 'What is the first-line treatment for viral pericarditis?', '["Antibiotics", "NSAIDs and Colchicine", "Steroids", "None"]', 1, 'NSAIDs treat the inflammation; Colchicine reduces the risk of recurrence.'),
    (v_case_id, 'What is a "Pericardial Friction Rub"?', '["A lung sound", "A scratchy, high-pitched heart sound heard best at end-expiration", "None", "None"]', 1, 'It is the classic physical exam finding of pericarditis.');

    ---------------------------------------------------------------------------
    -- CASE 10: SVT Management (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Racing Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Racing Heart', 'A 25-year-old female has sudden palpitations. ECG shows a narrow-complex regular tachycardia at 180 bpm.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old female has sudden palpitations. ECG shows a narrow-complex regular tachycardia at 180 bpm.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line non-pharmacological intervention?', '["Precordial thump", "Vagal maneuvers (e.g., Valsalva, carotid massage)", "None", "None"]', 1, 'Vagal stimulation can break re-entrant circuits.'),
    (v_case_id, 'What is the first-line medication for stable SVT?', '["Amiodarone", "Adenosine (6mg rapid IV bolus)", "Lidocaine", "None"]', 1, 'Adenosine briefly stops the AV node, allowing the heart to reset.'),
    (v_case_id, 'If the patient with SVT becomes hypotensive and altered, what is the next step?', '["More Adenosine", "Synchronized Cardioversion", "Defibrillation", "None"]', 1, 'Unstable tachyarrhythmias require immediate electricity.');

    ---------------------------------------------------------------------------
    -- CASE 11: Atrial Fibrillation - Rate vs Rhythm (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregularly Irregular' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregularly Irregular', 'An elderly patient has palpitations and an ECG showing AFib with a ventricular rate of 140 bpm.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient has palpitations and an ECG showing AFib with a ventricular rate of 140 bpm.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal for a patient with stable AFib with RVR?', '["Convert to sinus", "Rate control (e.g., Diltiazem or Metoprolol)", "None", "None"]', 1, 'In the ED, rate control is usually prioritized over rhythm control for stable AFib.'),
    (v_case_id, 'If the duration of AFib is > 48 hours or unknown, what is the risk of cardioversion?', '["Heart block", "Thromboembolism (Stroke)", "None", "None"]', 1, 'Converting a patient with a potential left atrial clot can cause an embolic stroke.'),
    (v_case_id, 'Which score is used to determine the need for long-term anticoagulation in AFib?', '["Wells Score", "CHA2DS2-VASc Score", "None", "None"]', 1, 'This scores risk factors like CHF, HTN, Age, DM, and prior Stroke.');

    ---------------------------------------------------------------------------
    -- CASE 12: Ventricular Tachycardia - VT (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wide Complex' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wide Complex', 'A patient with a history of MI has a regular, wide-complex tachycardia at 160 bpm.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of MI has a regular, wide-complex tachycardia at 160 bpm.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should you assume any regular wide-complex tachycardia is until proven otherwise?', '["SVT with aberrancy", "Ventricular Tachycardia (VT)", "None", "None"]', 1, 'Treating VT as SVT can be dangerous; assume the most lethal possibility.'),
    (v_case_id, 'What is the treatment for stable, monomorphic VT?', '["Adenosine", "Procainamide or Amiodarone", "None", "None"]', 1, 'Procainamide is often preferred for terminating stable VT in the ED.'),
    (v_case_id, 'If VT is pulseless, what is the management?', '["Cardioversion", "Defibrillation (Unsynchronized shock)", "None", "None"]', 1, 'Pulseless VT is treated exactly like Ventricular Fibrillation.');

    ---------------------------------------------------------------------------
    -- CASE 13: Torsades de Pointes (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Twisting Peaks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Twisting Peaks', 'A patient on Sotalol has a polymorphic VT that appears to "twist" around the isoelectric line.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Twisting Peaks', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of Torsades?', '["Hyperkalemia", "Prolonged QT interval", "None", "None"]', 1, 'Hypomagnesemia and QT-prolonging drugs are common triggers.'),
    (v_case_id, 'What is the first-line medication for Torsades de Pointes?', '["Amiodarone", "Magnesium Sulfate (2g IV)", "Lidocaine", "None"]', 1, 'Magnesium stabilizes the cardiac membrane.'),
    (v_case_id, 'If Magnesium fails and the patient is stable, what pacing technique can be used?', '["Slow pacing", "Overdrive pacing (at a rate faster than the Torsades)", "None", "None"]', 1, 'Increasing the base rate shortens the QT interval.');

    ---------------------------------------------------------------------------
    -- CASE 14: Bradycardia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Pulse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Pulse', 'A patient presents with a HR of 35 and lightheadedness. ECG shows a 3rd-degree heart block.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with a HR of 35 and lightheadedness. ECG shows a 3rd-degree heart block.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line medication for symptomatic bradycardia?', '["Epinephrine", "Atropine", "Dopamine", "None"]', 1, 'Atropine (0.5-1mg) is the starting point for unstable bradycardia.'),
    (v_case_id, 'If Atropine fails in 3rd-degree block, what is the next step?', '["More Atropine", "Transcutaneous Pacing", "Synchronized Cardioversion", "None"]', 1, 'High-degree blocks often do not respond to atropine; pacing is required.'),
    (v_case_id, 'What is a "3rd-degree" (complete) heart block?', '["Long PR", "Complete dissociation between P-waves and QRS complexes", "None", "None"]', 1, 'The atria and ventricles are beating independently.');

    ---------------------------------------------------------------------------
    -- CASE 15: WPW and AFib (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Delta Wave Danger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Delta Wave Danger', 'A patient with Wolf-Parkinson-White (WPW) presents in AFib with a very rapid ventricular response (HR 220).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Delta Wave Danger', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medications are CONTRAINDICATED in WPW with AFib?', '["Amiodarone", "AV nodal blockers (Adenosine, Beta-blockers, CCBs, Digoxin)", "None", "None"]', 1, 'Blocking the AV node forces all impulses through the accessory pathway, potentially causing VFib.'),
    (v_case_id, 'What is the treatment of choice for stable WPW with AFib?', '["Diltiazem", "Procainamide", "Metoprolol", "None"]', 1, 'Procainamide slows conduction in the accessory pathway.'),
    (v_case_id, 'What is the classic ECG finding of WPW in sinus rhythm?', '["Short PR and a Delta wave", "Wide QRS", "None", "None"]', 0, 'The delta wave represents pre-excitation.');

    ---------------------------------------------------------------------------
    -- CASE 16: Cocaine-Induced Chest Pain (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Party Chest Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Party Chest Pain', 'A 25-year-old male presents with severe chest pain and tachycardia after snorting cocaine.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male presents with severe chest pain and tachycardia after snorting cocaine.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of cocaine-induced MI?', '["Clot only", "Coronary vasospasm and increased myocardial oxygen demand", "None", "None"]', 1, 'Cocaine causes a massive surge in catecholamines.'),
    (v_case_id, 'Which class of drugs should be AVOIDED in cocaine chest pain?', '["Benzodiazepines", "Beta-blockers (due to \"unopposed alpha\" stimulation)", "Nitrates", "None"]', 1, 'Blocking beta receptors while alpha is stimulated can cause severe hypertension and coronary spasm.'),
    (v_case_id, 'What is the first-line treatment for cocaine-induced hypertension and agitation?', '["Haloperidol", "Benzodiazepines (e.g., Lorazepam)", "Labetalol", "None"]', 1, 'Benzos reduce the sympathetic outflow from the brain.');

    ---------------------------------------------------------------------------
    -- CASE 17: Hyperkalemia and the Heart (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Peaked T-waves' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Peaked T-waves', 'A dialysis patient has an ECG with peaked T-waves and a wide QRS.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A dialysis patient has an ECG with peaked T-waves and a wide QRS.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate first step in managing hyperkalemia with ECG changes?', '["Insulin/Glucose", "Calcium (Gluconate or Chloride) to stabilize the cardiac membrane", "Dialysis", "None"]', 1, 'Calcium does not lower potassium, but it prevents the heart from going into VFib.'),
    (v_case_id, 'Which treatment actually REMOVES potassium from the body?', '["Albuterol", "Furosemide or Hemodialysis", "Insulin", "None"]', 1, 'Insulin and Albuterol only shift K+ into cells temporarily.'),
    (v_case_id, 'What is the "Sine Wave" ECG pattern indicative of?', '["Heart block", "Imminent cardiac arrest from severe hyperkalemia", "None", "None"]', 1, 'As the QRS widens and merges with the T-wave, a sine-wave pattern develops.');

    ---------------------------------------------------------------------------
    -- CASE 18: Brugada Syndrome (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Death Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Death Risk', 'A 30-year-old Asian male presents with syncope. ECG shows ST elevation in V1-V3 with a "coved" appearance.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old Asian male presents with syncope. ECG shows ST elevation in V1-V3 with a "coved" appearance.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["STEMI", "Brugada Syndrome", "Early repolarization", "None"]', 1, 'Brugada is a genetic sodium channelopathy that predisposes to sudden cardiac death.'),
    (v_case_id, 'What is the definitive treatment for symptomatic Brugada?', '["Beta-blockers", "Implantable Cardioverter-Defibrillator (ICD)", "Aspirin", "None"]', 1, 'Medications are generally ineffective; an ICD is required.'),
    (v_case_id, 'What common condition can "unmask" a Brugada pattern?', '["Exercise", "Fever", "Sleep", "None"]', 1, 'Febrile illnesses are notorious for triggering Brugada-related arrhythmias.');

    ---------------------------------------------------------------------------
    -- CASE 19: Hypertrophic Cardiomyopathy - HCM (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Young Athlete Syncope' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Young Athlete Syncope', 'A 17-year-old basketball player passes out during a game. He has a systolic murmur that increases with Valsalva.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 17-year-old basketball player passes out during a game. He has a systolic murmur that increases with Valsalva.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Mitral Valve Prolapse", "Hypertrophic Cardiomyopathy (HCM)", "Dehydration", "None"]', 1, 'HCM is a leading cause of sudden cardiac death in young athletes.'),
    (v_case_id, 'Why does Valsalva increase the murmur in HCM?', '["Increases blood flow", "Decreases preload, making the LV chamber smaller and worsening the obstruction", "None", "None"]', 1, 'Less volume in the ventricle allows the thickened septum to obstruct the outflow tract more easily.'),
    (v_case_id, 'What ECG finding is common in HCM?', '["ST depression", "LVH and deep \"dagger\" Q-waves in lateral leads", "None", "None"]', 1, 'High voltages and narrow deep Q-waves are clues.');

    ---------------------------------------------------------------------------
    -- CASE 20: Wellens Syndrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Impending LAD Infarct' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Impending LAD Infarct', 'A patient is now pain-free after chest pain, but their ECG shows deep, symmetric T-wave inversions in V2-V3.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is now pain-free after chest pain, but their ECG shows deep, symmetric T-wave inversions in V2-V3.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does Wellens Syndrome represent?', '["Benign finding", "High-grade proximal LAD stenosis", "Old MI", "None"]', 1, 'Wellens is a "pre-infarction" state with a high risk of massive anterior STEMI.'),
    (v_case_id, 'Should this patient undergo a stress test?', '["Yes", "No, it may precipitate a fatal MI; they need urgent angiography", "None", "None"]', 1, 'Stress testing is contraindicated in suspected Wellens.'),
    (v_case_id, 'Does the patient typically have pain when these ECG changes are seen?', '["Yes", "No, they are often in a pain-free interval", "None", "None"]', 1, 'The T-wave changes appear when the artery has briefly re-opened.');

    ---------------------------------------------------------------------------
    -- CASE 21: Acute Mitral Regurgitation (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-MI Dyspnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-MI Dyspnea', '3 days after an inferior MI, a patient develops sudden severe respiratory distress and a new systolic murmur.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '3 days after an inferior MI, a patient develops sudden severe respiratory distress and a new systolic murmur.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely complication?', '["VSD", "Papillary muscle rupture leading to acute Mitral Regurgitation", "PE", "None"]', 1, 'This is a mechanical complication of MI that causes flash pulmonary edema.'),
    (v_case_id, 'What is the definitive treatment?', '["Meds only", "Emergent surgical repair", "None", "None"]', 1, 'Acute mechanical defects require surgery.'),
    (v_case_id, 'Why is it more common in inferior MI?', '["RCA supplies it", "The posteromedial papillary muscle usually has a single blood supply (RCA)", "None", "None"]', 1, 'The anterolateral muscle has a dual supply.');

    ---------------------------------------------------------------------------
    -- CASE 22: Ventricular Septal Defect - VSD (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The New Thrill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The New Thrill', 'A post-MI patient has a new harsh holosystolic murmur at the lower left sternal border and a palpable thrill.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-MI patient has a new harsh holosystolic murmur at the lower left sternal border and a palpable thrill.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish VSD from Mitral Regurgitation clinically?', '["Murmur site", "VSD is heard best at the left sternal border; MR at the apex radiating to the axilla", "None", "None"]', 1, 'Location is key for mechanical complication diagnosis.'),
    (v_case_id, 'What is the management?', '["Nitrates", "Surgical repair and potentially Intra-Aortic Balloon Pump (IABP) for stabilization", "None", "None"]', 1, 'IABP can reduce afterload and improve forward flow.'),
    (v_case_id, 'Does a VSD cause pulmonary edema?', '["No", "Yes, due to left-to-right shunting increasing pulmonary flow", "None", "None"]', 1, 'Acute VSD leads to rapid heart failure.');

    ---------------------------------------------------------------------------
    -- CASE 23: Myocardial Rupture (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Death' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Death', 'A post-MI patient suddenly loses consciousness. Monitor shows pulseless electrical activity (PEA). Bedside ultrasound shows a massive pericardial effusion.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-MI patient suddenly loses consciousness. Monitor shows pulseless electrical activity (PEA). Bedside ultrasound shows a massive pericardial effusion.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Repeat MI", "Left Ventricular Free Wall Rupture", "None", "None"]', 1, 'This leads to rapid tamponade and PEA arrest.'),
    (v_case_id, 'What is the time frame for this complication?', '["1 hour", "Typically 2-7 days after MI", "None", "None"]', 1, 'It occurs as the infarcted tissue is at its weakest during remodeling.'),
    (v_case_id, 'What is the survival rate?', '["High", "Very low (catastrophic)", "None", "None"]', 1, 'Most cases are fatal before surgical intervention is possible.');

    ---------------------------------------------------------------------------
    -- CASE 24: Myocarditis (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sick Young Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sick Young Heart', 'A 20-year-old male presents with chest pain and heart failure symptoms two weeks after a "flu-like" illness.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old male presents with chest pain and heart failure symptoms two weeks after a "flu-like" illness.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Angina", "Acute Myocarditis", "Pneumonia", "None"]', 1, 'Inflammation of the myocardium following a viral infection.'),
    (v_case_id, 'Will Troponin be elevated in myocarditis?', '["No", "Yes, it can be significantly elevated", "None", "None"]', 1, 'Inflammation causes myocardial cell damage and enzyme release.'),
    (v_case_id, 'What is the gold standard for diagnosis?', '["Echo", "Endomyocardial Biopsy", "MRI", "None"]', 1, 'Cardiac MRI is also highly useful non-invasively.');

    ---------------------------------------------------------------------------
    -- CASE 25: Infective Endocarditis (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever and a Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever and a Murmur', 'An IV drug user has fever, a new murmur, and small, painless red spots on their palms.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An IV drug user has fever, a new murmur, and small, painless red spots on their palms.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the spots on the palms called?', '["Osler nodes", "Janeway lesions", "Petechiae", "None"]', 1, 'Janeway lesions are painless; Osler nodes are painful.'),
    (v_case_id, 'What is the most common valve involved in IV drug users?', '["Mitral", "Tricuspid", "Aortic", "None"]', 1, 'Right-sided endocarditis is common in this population.'),
    (v_case_id, 'What is the first-line diagnostic test?', '["Blood cultures (3 sets) and Echo (TEE preferred)", "X-ray", "None", "None"]', 0, 'Duke Criteria are used for diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 26: Digoxin Toxicity - Cardiac (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scoop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scoop', 'A patient on Digoxin has an ECG with "scooped" ST segments and frequent PVCs.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on Digoxin has an ECG with "scooped" ST segments and frequent PVCs.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does the "scooped" ST segment indicate toxicity?', '["Yes", "No, it just indicates \"digoxin effect\" (therapeutic use)", "None", "None"]', 1, 'The "Salvadore Dali" scoop is a normal finding in users.'),
    (v_case_id, 'What rhythm is considered highly specific for Digoxin toxicity?', '["AFib", "Bidirectional VT or PAT with 2:1 block", "None", "None"]', 1, 'Digoxin increases automaticity and slows conduction.'),
    (v_case_id, 'What electrolyte abnormality increases the risk of Digoxin toxicity?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "None"]', 1, 'K+ and Digoxin compete for the same binding site on the Na+/K+ ATPase pump.');

    ---------------------------------------------------------------------------
    -- CASE 27: Hypertensive Emergency (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Target Organ Damage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Target Organ Damage', 'A patient has a BP of 230/130 and is complaining of blurry vision and headache.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a BP of 230/130 and is complaining of blurry vision and headache.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines a Hypertensive "Emergency" vs "Urgency"?', '["The BP number", "The presence of acute target organ damage", "None", "None"]', 1, 'Urgency is a high BP without symptoms/damage.'),
    (v_case_id, 'What is the goal of treatment in the first hour?', '["Drop to 120/80", "Reduce MAP by no more than 20-25%", "None", "None"]', 1, 'Over-correction can lead to watershed cerebral or renal ischemia.'),
    (v_case_id, 'Which IV medication is commonly used for rapid, titratable BP control?', '["Lisinopril", "Nicardipine or Labetalol", "None", "None"]', 1, 'These have short half-lives and are easily titrated in an ICU/ED setting.');

    ---------------------------------------------------------------------------
    -- CASE 28: Mobitz I vs II (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Second-Degree Block' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Second-Degree Block', 'You see a PR interval that progressively lengthens until a QRS is dropped.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You see a PR interval that progressively lengthens until a QRS is dropped.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this rhythm?', '["Mobitz I (Wenckebach)", "Mobitz II", "3rd Degree", "None"]', 0, '"Longer, longer, longer, drop... now you have a Wenckebach."'),
    (v_case_id, 'Which second-degree block is more dangerous and often requires a pacemaker?', '["Mobitz I", "Mobitz II", "None", "None"]', 1, 'Mobitz II occurs below the AV node and has a high risk of progressing to 3rd-degree block.'),
    (v_case_id, 'What is Mobitz II?', '["Long PR", "Fixed PR interval with random dropped QRS complexes", "None", "None"]', 1, 'There is no lengthening of the PR interval.');

    ---------------------------------------------------------------------------
    -- CASE 29: PACs and PVCs (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ectopic Beats' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ectopic Beats', 'A healthy 20-year-old complains of "skipped beats" after drinking too much coffee.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy 20-year-old complains of "skipped beats" after drinking too much coffee.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of these symptoms?', '["Heart failure", "Premature Atrial or Ventricular Contractions (PACs/PVCs)", "None", "None"]', 1, 'These are usually benign and exacerbated by stimulants.'),
    (v_case_id, 'When are PVCs concerning in the ED?', '["Always", "When they are frequent (> 6/min), multifocal, or occur during an acute MI", "None", "None"]', 1, 'Frequent PVCs in a diseased heart can trigger VT.'),
    (v_case_id, 'What is "Bigeminy"?', '["Two heart beats", "Every other beat is a PVC", "None", "None"]', 1, 'This is a specific pattern of ectopy.');

    ---------------------------------------------------------------------------
    -- CASE 30: Cardioversion vs Defibrillation (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Synchronized vs Not' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Synchronized vs Not', 'You are preparing to shock a patient in stable VT.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are preparing to shock a patient in stable VT.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should you use synchronized or unsynchronized shock?', '["Unsynchronized", "Synchronized (Cardioversion)", "None", "None"]', 1, 'Synchronization prevents the shock from falling on the T-wave (R-on-T phenomenon).'),
    (v_case_id, 'What happens if you shock the T-wave?', '["Nothing", "You can precipitate Ventricular Fibrillation", "None", "None"]', 1, 'The T-wave is a vulnerable period of repolarization.'),
    (v_case_id, 'When do you use UNSYNCHRONIZED shocks (Defibrillation)?', '["Stable VT", "VFib and Pulseless VT", "AFib", "None"]', 1, 'If there is no R-wave to sync to, you must "defib."');

    ---------------------------------------------------------------------------
    -- CASE 31: Heart Block - 1st Degree (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Long PR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Long PR', 'A healthy marathon runner has an ECG with a PR interval of 240 ms.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy marathon runner has an ECG with a PR interval of 240 ms.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of 1st-degree heart block?', '["Dropped QRS", "PR interval > 200 ms (0.2s)", "None", "None"]', 1, 'It is a delay, not a block.'),
    (v_case_id, 'What is the management of asymptomatic 1st-degree block?', '["Pacemaker", "Observation/Reassurance", "Atropine", "None"]', 1, 'It is usually a benign finding, often due to high vagal tone.'),
    (v_case_id, 'Can medications cause this?', '["Yes", "No", "None", "None"]', 0, 'Beta-blockers, CCBs, and Digoxin can all prolong the PR interval.');

    ---------------------------------------------------------------------------
    -- CASE 32: Heart Failure - B-Type Natriuretic Peptide (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The BNP Clue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The BNP Clue', 'A patient with COPD and CHF presents with shortness of breath. You are unsure if it is a COPD flare or CHF flare.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with COPD and CHF presents with shortness of breath. You are unsure if it is a COPD flare or CHF flare.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab test can help distinguish the two?', '["Troponin", "BNP (B-type Natriuretic Peptide)", "D-dimer", "None"]', 1, 'BNP is released by the ventricles in response to stretch (volume/pressure overload).'),
    (v_case_id, 'A BNP < 100 pg/mL has what value?', '["Confirms CHF", "High negative predictive value for CHF", "None", "None"]', 1, 'If the BNP is low, the cause of dyspnea is unlikely to be heart failure.'),
    (v_case_id, 'What can cause a falsely elevated BNP?', '["Anemia", "Renal failure", "Liver failure", "None"]', 1, 'Renal failure reduces the clearance of BNP.');

    ---------------------------------------------------------------------------
    -- CASE 33: Aortic Stenosis and Chest Pain (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Narrow Exit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Narrow Exit', 'An elderly patient with known Aortic Stenosis presents with syncope and angina.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient with known Aortic Stenosis presents with syncope and angina.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of symptomatic Aortic Stenosis?', '["Fever, Pain, Rash", "Angina, Syncope, and Heart Failure (SAD mnemonic)", "None", "None"]', 1, 'Once these symptoms appear, the prognosis is poor without valve replacement.'),
    (v_case_id, 'What is the characteristic murmur?', '["Diastolic", "Crescendo-decrescendo systolic murmur at the right upper sternal border", "None", "None"]', 1, 'It often radiates to the carotids.'),
    (v_case_id, 'Why are Nitrates dangerous in severe Aortic Stenosis?', '["They cause MI", "They reduce preload in a patient who is preload-dependent to maintain flow across the stenotic valve", "None", "None"]', 1, 'This can cause a catastrophic drop in cardiac output.');

    ---------------------------------------------------------------------------
    -- CASE 34: Pulmonary Hypertension (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loud S2' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loud S2', 'A patient with scleroderma has progressive SOB and a loud, palpable P2.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with scleroderma has progressive SOB and a loud, palpable P2.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Heart failure", "Pulmonary Hypertension", "Asthma", "None"]', 1, 'High pressure in the pulmonary circuit.'),
    (v_case_id, 'What does the ECG show in severe cases?', '["LVH", "RVH and Right Axis Deviation", "None", "None"]', 1, 'The right heart struggles against the high pulmonary pressure.'),
    (v_case_id, 'What is Cor Pulmonale?', '["Lung cancer", "Right heart failure caused by primary lung disease", "None", "None"]', 1, 'Right heart failure due to high pulmonary resistance.');

    ---------------------------------------------------------------------------
    -- CASE 35: SVT in Infants (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fussy Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fussy Baby', 'A 2-month-old infant is fussy and not feeding. HR is 250 bpm.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant is fussy and not feeding. HR is 250 bpm.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely rhythm?', '["Sinus Tach", "Supraventricular Tachycardia (SVT)", "None", "None"]', 1, 'In infants, SVT typically has a rate > 220 bpm.'),
    (v_case_id, 'What is the first-line vagal maneuver for an infant?', '["Carotid massage", "Application of ice to the face (Diving Reflex)", "None", "None"]', 1, 'Ice water immersion or ice pack to the face can trigger the diving reflex.'),
    (v_case_id, 'What is the dose of Adenosine for a pediatric patient?', '["6 mg", "0.1 mg/kg", "12 mg", "None"]', 1, 'Weight-based dosing is critical.');

    ---------------------------------------------------------------------------
    -- CASE 36: Dressler Syndrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Late Post-MI Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Late Post-MI Pain', '2 weeks after an MI, a patient has new-onset pleuritic chest pain and a low-grade fever.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '2 weeks after an MI, a patient has new-onset pleuritic chest pain and a low-grade fever.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this late autoimmune pericarditis?', '["Angina", "Dressler Syndrome", "MI recurrence", "None"]', 1, 'It is a delayed inflammatory response to myocardial injury.'),
    (v_case_id, 'How do you treat it?', '["Heparin", "NSAIDs or Aspirin", "None", "None"]', 1, 'Anti-inflammatories are the mainstay of treatment.'),
    (v_case_id, 'Does it require re-catheterization?', '["Yes", "No, unless new ischemia is suspected", "None", "None"]', 1, 'It is a clinical diagnosis of pericarditis.');

    ---------------------------------------------------------------------------
    -- CASE 37: Atrial Flutter (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sawtooth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sawtooth', 'An ECG shows a regular narrow-complex tachycardia at 150 bpm with "sawtooth" waves in leads II, III, and aVF.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ECG shows a regular narrow-complex tachycardia at 150 bpm with "sawtooth" waves in leads II, III, and aVF.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm?', '["AFib", "Atrial Flutter", "SVT", "None"]', 1, 'Flutter is a macro-reentrant atrial circuit.'),
    (v_case_id, 'What is the most common ratio of atrial to ventricular conduction?', '["1:1", "2:1 (Atrial 300 : Ventricular 150)", "None", "None"]', 1, 'A regular rate of exactly 150 should always make you look for flutter waves.'),
    (v_case_id, 'Is the management similar to AFib?', '["Yes", "No", "None", "None"]', 0, 'Yes, rate control and anticoagulation are the priorities.');

    ---------------------------------------------------------------------------
    -- CASE 38: Multifocal Atrial Tachycardia - MAT (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'COPD and Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'COPD and Tachycardia', 'A patient with a severe COPD flare has an irregular tachycardia with at least 3 different P-wave morphologies.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a severe COPD flare has an irregular tachycardia with at least 3 different P-wave morphologies.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["AFib", "Multifocal Atrial Tachycardia (MAT)", "Wandering pacemaker", "None"]', 1, 'MAT is strongly associated with pulmonary disease and hypoxia.'),
    (v_case_id, 'Is cardioversion effective for MAT?', '["Yes", "No, management should focus on treating the underlying lung disease", "None", "None"]', 1, 'Electricity does not fix MAT; oxygen and bronchodilators do.'),
    (v_case_id, 'Which drug should be avoided in MAT/COPD?', '["CCBs", "Beta-blockers (may worsen bronchospasm)", "None", "None"]', 1, 'Verapamil or Diltiazem are better for rate control in MAT.');

    ---------------------------------------------------------------------------
    -- CASE 39: Biventricular Pacemaker (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Paced Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Paced Heart', 'A patient with a pacemaker presents after being struck in the chest. ECG shows "spikes" but no following QRS complexes.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a pacemaker presents after being struck in the chest. ECG shows "spikes" but no following QRS complexes.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this phenomenon called?', '["Failure to fire", "Failure to capture", "None", "None"]', 1, 'The pacemaker sends the signal, but the heart doesn''t respond.'),
    (v_case_id, 'What can cause failure to capture?', '["Battery failure", "Lead displacement or myocardial scarring", "None", "None"]', 1, 'Trauma can dislodge leads.'),
    (v_case_id, 'What is "failure to sense"?', '["No spikes", "Pacemaker spikes occurring randomly without regard to the intrinsic rhythm", "None", "None"]', 1, 'The device doesn''t "see" the heart''s own beats.');

    ---------------------------------------------------------------------------
    -- CASE 40: Left Bundle Branch Block - LBBB (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The New LBBB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The New LBBB', 'A patient has chest pain and an ECG with a QRS > 120ms and deep S-waves in V1-V3.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has chest pain and an ECG with a QRS > 120ms and deep S-waves in V1-V3.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is a "new" LBBB considered a STEMI equivalent?', '["Always", "Traditional teaching says yes in the setting of chest pain; modern guidance uses Sgarbossa criteria", "None", "None"]', 1, 'New LBBB makes diagnosing ischemia difficult.'),
    (v_case_id, 'What are "Sgarbossa Criteria"?', '["Stroke score", "Rules to identify acute MI in the presence of an existing LBBB", "None", "None"]', 1, 'They look for concordant ST elevation or excessive discordance.'),
    (v_case_id, 'What is the QRS morphology in V6 for LBBB?', '["Deep S", "Broad, notched (M-shaped) R-wave", "None", "None"]', 1, 'The "WiLLiaM MaRRoW" mnemonic is common.');

    ---------------------------------------------------------------------------
    -- CASE 41: RV Infarct and Nitrates (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nitrate Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nitrate Crash', 'You give sublingual Nitroglycerin to a patient with chest pain. Their BP immediately drops from 130/80 to 70/40.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You give sublingual Nitroglycerin to a patient with chest pain. Their BP immediately drops from 130/80 to 70/40.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should you suspect?', '["Anaphylaxis", "Right Ventricular MI", "None", "None"]', 1, 'RV MI is preload dependent; nitrates drop preload and cause profound hypotension.'),
    (v_case_id, 'How do you treat this iatrogenic hypotension?', '["Give more nitrates", "Aggressive IV Fluid bolus", "Vasopressors", "None"]', 1, 'Fluid resuscitation restores the preload needed for RV output.'),
    (v_case_id, 'What other medication should be checked for in the history?', '["Aspirin", "Phosphodiesterase inhibitors (e.g., Viagra) within 24-48 hours", "None", "None"]', 1, 'Sildenafil + Nitrates causes extreme, refractory hypotension.');

    ---------------------------------------------------------------------------
    -- CASE 42: Aortic Aneurysm Rupture (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulsatile Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulsatile Mass', 'An elderly male smoker presents with sudden onset back pain and hypotension. On exam, you feel a pulsatile abdominal mass.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly male smoker presents with sudden onset back pain and hypotension. On exam, you feel a pulsatile abdominal mass.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Kidney stones", "Ruptured Abdominal Aortic Aneurysm (AAA)", "None", "None"]', 1, 'The triad of pain, hypotension, and a pulsatile mass is classic.'),
    (v_case_id, 'If the patient is unstable, what is the priority?', '["Wait for CT", "Emergent surgical or endovascular repair", "None", "None"]', 1, 'A bedside ultrasound can confirm the aneurysm; do not delay surgery for a CT in an unstable patient.'),
    (v_case_id, 'What is the mortality rate for ruptured AAA?', '["10%", "80-90% (most die before hospital)", "None", "None"]', 1, 'It is a catastrophic emergency.');

    ---------------------------------------------------------------------------
    -- CASE 43: DeWinter T-waves (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Deep Upsloping' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Deep Upsloping', 'A patient with chest pain has ST-segment depression in V1-V4 with tall, symmetrical, peaked T-waves.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with chest pain has ST-segment depression in V1-V4 with tall, symmetrical, peaked T-waves.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this pattern called?', '["Wellens", "DeWinter T-waves", "None", "None"]', 1, 'Another STEMI equivalent indicating proximal LAD occlusion.'),
    (v_case_id, 'How do these differ from hyperkalemia?', '["They don''t", "DeWinter waves are preceded by ST depression and occur in the setting of chest pain", "None", "None"]', 1, 'Clinical context and the ST-segment are key.'),
    (v_case_id, 'What is the management?', '["Obs", "Immediate Cardiac Cath", "None", "None"]', 1, 'This is an acute occlusion pattern.');

    ---------------------------------------------------------------------------
    -- CASE 44: Myocardial Contusion (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blunt Heart Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blunt Heart Trauma', 'A patient was in a high-speed MVC with steering wheel impact to the chest. They are now having frequent PVCs.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient was in a high-speed MVC with steering wheel impact to the chest. They are now having frequent PVCs.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Pneumothorax", "Myocardial Contusion (Blunt Cardiac Injury)", "None", "None"]', 1, 'Bruising of the heart muscle causes electrical instability.'),
    (v_case_id, 'What is the most sensitive screening test?', '["Troponin", "ECG (serial)", "None", "None"]', 1, 'A normal ECG at presentation and 6 hours significantly reduces the likelihood of serious injury.'),
    (v_case_id, 'What is the most feared arrhythmia from blunt trauma?', '["AFib", "Ventricular Tachycardia/Fibrillation", "None", "None"]', 1, 'Sudden impact can cause "Commotio Cordis" leading to arrest.');

    ---------------------------------------------------------------------------
    -- CASE 45: Pericardial Effusion - Electrical Alternans (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swinging Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swinging Heart', 'An ECG shows QRS complexes that vary in height from beat to beat.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ECG shows QRS complexes that vary in height from beat to beat.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this finding called?', '["Pulsus paradoxus", "Electrical Alternans", "None", "None"]', 1, 'Alternating QRS voltage due to the heart swinging back and forth in a large effusion.'),
    (v_case_id, 'What does it suggest?', '["Heart block", "Large Pericardial Effusion (potentially Tamponade)", "None", "None"]', 1, 'It is a specific but not very sensitive sign.'),
    (v_case_id, 'What is the next step?', '["Labs", "Bedside Ultrasound (POCUS)", "None", "None"]', 1, 'Visualize the fluid immediately.');

    ---------------------------------------------------------------------------
    -- CASE 46: Aortic Dissection - Neurological Symptoms (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stroke-Pain Link' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stroke-Pain Link', 'A patient presents with chest pain followed by sudden leg weakness and numbness.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with chest pain followed by sudden leg weakness and numbness.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does aortic dissection cause neurological symptoms?', '["Brain bleed", "The dissection flap can occlude spinal or carotid arteries", "None", "None"]', 1, 'Occlusion of the Great Radicular Artery (Adamkiewicz) can cause paraplegia.'),
    (v_case_id, 'Is tPA safe if you suspect a dissection?', '["Yes", "No, it is a catastrophic contraindication", "None", "None"]', 1, 'Giving tPA to an aortic dissection patient will likely cause fatal hemorrhage.'),
    (v_case_id, 'What "pain" characteristic is most predictive of dissection?', '["Dull", "Sudden onset of maximal intensity", "None", "None"]', 1, '"Thunderclap" chest pain is very high risk.');

    ---------------------------------------------------------------------------
    -- CASE 47: Right Bundle Branch Block - RBBB (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rabbit Ears' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rabbit Ears', 'An ECG shows a QRS > 120ms with an rsR'' pattern in V1-V3.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ECG shows a QRS > 120ms with an rsR'' pattern in V1-V3.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this rhythm?', '["LBBB", "Right Bundle Branch Block (RBBB)", "None", "None"]', 1, 'The rsR'' is the classic "rabbit ears" pattern.'),
    (v_case_id, 'Is a NEW RBBB concerning for a specific pulmonary emergency?', '["Asthma", "Acute PE causing right heart strain", "None", "None"]', 1, 'Sudden RV pressure overload can cause a temporary RBBB.'),
    (v_case_id, 'Can you still diagnose a STEMI in the presence of RBBB?', '["No", "Yes, RBBB does not obscure the ST segment like LBBB does", "None", "None"]', 1, 'Unlike LBBB, RBBB allows for standard ST-segment interpretation.');

    ---------------------------------------------------------------------------
    -- CASE 48: Atropine Dosing (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dosing Danger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dosing Danger', 'You are giving Atropine for bradycardia.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Dosing Danger', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What happens if you give a dose of Atropine that is TOO LOW (e.g., < 0.5 mg)?', '["Nothing", "Paradoxical bradycardia", "None", "None"]', 1, 'Small doses of atropine can actually slow the heart further by blocking presynaptic inhibitory receptors.'),
    (v_case_id, 'What is the maximum cumulative dose of Atropine for bradycardia?', '["1 mg", "3 mg", "5 mg", "None"]', 1, 'Total vagal blockade is usually achieved at around 3mg.'),
    (v_case_id, 'What is the standard ACLS single dose?', '["0.1 mg", "1 mg (formerly 0.5mg)", "None", "None"]', 1, 'The dose was recently increased in some guidelines to 1mg.');

    ---------------------------------------------------------------------------
    -- CASE 49: Cardiac Arrest - Reversible Causes (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'H''s and T''s' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'H''s and T''s', 'A patient is in PEA arrest. You are working through the reversible causes.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is in PEA arrest. You are working through the reversible causes.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these is NOT one of the 5 H''s?', '["Hypovolemia", "Hypernatremia", "Hypoxia", "Hydrogen ion (Acidosis)"]', 1, 'The 5 H''s are: Hypovolemia, Hypoxia, Hydrogen ion, Hypo/Hyperkalemia, Hypothermia.'),
    (v_case_id, 'Which of these is NOT one of the 5 T''s?', '["Tension pneumothorax", "Tamponade", "Tetanus", "Thrombosis (MI/PE)"]', 2, 'The 5 T''s are: Tension pneumothorax, Tamponade, Toxins, Thrombosis (Pulmonary), Thrombosis (Coronary).'),
    (v_case_id, 'What is the most useful tool for diagnosing H''s and T''s during a code?', '["X-ray", "POCUS (Point-of-Care Ultrasound)", "None", "None"]', 1, 'Ultrasound can see tamponade, PE (clot), and pneumothorax instantly.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Post-ROSC Patient (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Aftermath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Aftermath', 'You have achieved ROSC (Return of Spontaneous Circulation) in a cardiac arrest patient.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You have achieved ROSC (Return of Spontaneous Circulation) in a cardiac arrest patient.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the target SpO2 for a post-ROSC patient?', '["100%", "92-98%", "None", "None"]', 1, 'Avoid hyperoxia, as excess oxygen can worsen reperfusion injury to the brain.'),
    (v_case_id, 'What is "Targeted Temperature Management" (TTM)?', '["Fever prevention", "Maintaining body temperature between 32-36°C for 24h to improve neuro outcomes", "None", "None"]', 1, 'TTM is indicated for comatose survivors of cardiac arrest.'),
    (v_case_id, 'If the post-ROSC ECG shows STEMI, what is the next step?', '["Wait for labs", "Emergent Cardiac Cath", "None", "None"]', 1, 'The primary cause of arrest was likely MI; fix the occlusion immediately.');

    RAISE NOTICE 'SUCCESS: 50 Cardiac Emergency Case Blocks registered.';
END $$;

COMMIT;
