-- Clinical Skills & Diagnostics: ECG Interpretation - Part 2 (Cases 14-25)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ecg-interpretation

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ecg-interpretation' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ecg-interpretation';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 14: Left Ventricular Hypertrophy (LVH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypertension and Heart Sounds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypertension and Heart Sounds', 'A 55-year-old male with long-standing hypertension has an ECG showing an S wave in lead V1 of 25 mm and an R wave in lead V5 of 15 mm. He also has ST depressions and T-wave inversions in leads V5, V6, I, and aVL.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male with long-standing hypertension has an ECG showing an S wave in lead V1 of 25 mm and an R wave in lead V5 of 15 mm. He also has ST depressions and T-wave inversions in leads V5, V6, I, and aVL.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on the Sokolow-Lyon criteria (S in V1 + R in V5/V6), what is the threshold for LVH?', '["25 mm", "30 mm", "35 mm", "40 mm"]', 2, 'LVH is diagnosed if S in V1 + R in V5 or V6 is > 35 mm (in adults over 35). Here, 25 + 15 = 40 mm.'),
    (v_case_id, 'What are the associated ST and T wave changes in leads V5-V6 called?', '["Infarction pattern", "Strain pattern", "Ischemic pattern", "Brugada pattern"]', 1, 'LVH with "strain" refers to repolarization abnormalities (ST depression and T-wave inversion) in the lateral leads.'),
    (v_case_id, 'Which physical exam finding is most consistent with LVH?', '["S3 heart sound", "S4 heart sound", "Opening snap", "Mid-systolic click"]', 1, 'An S4 heart sound indicates atrial contraction into a stiff, hypertrophied ventricle.');

    ---------------------------------------------------------------------------
    -- CASE 15: Right Ventricular Hypertrophy (RVH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Lung Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Lung Disease', 'A 60-year-old woman with severe COPD has an ECG showing a tall R wave in lead V1 (R > S), a deep S wave in V6, and right axis deviation.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman with severe COPD has an ECG showing a tall R wave in lead V1 (R > S), a deep S wave in V6, and right axis deviation.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis based on the ECG?', '["LVH", "RVH", "RBBB", "LBBB"]', 1, 'RVH criteria include a tall R wave in V1 (R:S ratio > 1), right axis deviation, and a deep S in V6.'),
    (v_case_id, 'What is a common atrial finding on ECG in patients with chronic lung disease?', '["P-mitrale (notched P waves)", "P-pulmonale (peaked P waves)", "Atrial fibrillation", "A-V dissociation"]', 1, 'P-pulmonale (peaked P waves > 2.5 mm in lead II) indicates right atrial enlargement.'),
    (v_case_id, 'Right heart failure due to primary lung disease is known as:', '["Cor pulmonale", "Tetralogy of Fallot", "Eisenmenger syndrome", "Dressler syndrome"]', 0, 'Cor pulmonale is right-sided heart failure caused by pulmonary hypertension from lung disease.');

    ---------------------------------------------------------------------------
    -- CASE 16: Left Atrial Enlargement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The M-shaped P Wave' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The M-shaped P Wave', 'A 45-year-old woman with a history of mitral stenosis has an ECG showing notched P waves in lead II (width > 120 ms) and a large negative terminal component of the P wave in lead V1.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman with a history of mitral stenosis has an ECG showing notched P waves in lead II (width > 120 ms) and a large negative terminal component of the P wave in lead V1.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this finding called?', '["P-pulmonale", "P-mitrale", "Delta wave", "Epsilon wave"]', 1, 'P-mitrale (notched, wide P wave in lead II) indicates left atrial enlargement, often seen in mitral valve disease.'),
    (v_case_id, 'In lead V1, which component of the P wave represents left atrial activity?', '["The initial positive deflection", "The terminal negative deflection", "The entire P wave", "The PR segment"]', 1, 'In V1, the initial positive part is the right atrium, and the terminal negative part is the left atrium.'),
    (v_case_id, 'Mitral stenosis is most often a long-term complication of:', '["Rheumatic fever", "Endocarditis", "Aortic dissection", "Kawasaki disease"]', 0, 'Rheumatic heart disease is the leading cause of mitral stenosis worldwide.');

    ---------------------------------------------------------------------------
    -- CASE 17: Anterior STEMI
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Crushing Chest Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Crushing Chest Pain', 'A 52-year-old smoker presents with 30 minutes of sub-sternal chest pressure and diaphoresis. His ECG shows 4 mm of ST elevation in leads V1 through V4.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old smoker presents with 30 minutes of sub-sternal chest pressure and diaphoresis. His ECG shows 4 mm of ST elevation in leads V1 through V4.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the infarction located?', '["Inferior wall", "Anterior wall", "Lateral wall", "Posterior wall"]', 1, 'ST elevation in V1-V4 indicates an anterior wall MI.'),
    (v_case_id, 'Which coronary artery is most likely occluded?', '["Right coronary artery (RCA)", "Left circumflex artery (LCx)", "Left anterior descending artery (LAD)", "Left main artery"]', 2, 'The LAD supplies the anterior wall of the left ventricle and the septum.'),
    (v_case_id, 'What is the goal "door-to-balloon" time for primary PCI?', '["30 minutes", "60 minutes", "90 minutes", "120 minutes"]', 2, 'Guidelines recommend a door-to-balloon time of <= 90 minutes for patients with STEMI.');

    ---------------------------------------------------------------------------
    -- CASE 18: Inferior STEMI and RV Involvement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Nausea and Hypotension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Nausea and Hypotension', 'A 68-year-old man presents with epigastric pain and nausea. His ECG shows ST elevation in leads II, III, and aVF. His blood pressure is 85/50 mmHg.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old man presents with epigastric pain and nausea. His ECG shows ST elevation in leads II, III, and aVF. His blood pressure is 85/50 mmHg.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which wall of the heart is infarcted?', '["Anterior", "Inferior", "Lateral", "Septal"]', 1, 'ST elevation in leads II, III, and aVF indicates an inferior wall MI.'),
    (v_case_id, 'Given the hypotension, which additional ECG should be performed?', '["Posterior leads (V7-V9)", "Right-sided leads (V3R-V4R)", "Repeat standard ECG in 10 minutes", "Exercise stress test"]', 1, 'Right-sided leads are used to diagnose Right Ventricular Infarction, which often accompanies inferior MI and causes hypotension.'),
    (v_case_id, 'What is the initial management for hypotension in a suspected RV infarction?', '["Nitroglycerin", "Morphine", "IV fluid bolus", "Furosemide"]', 2, 'RV infarction is preload-dependent. Fluids are the priority; nitrates and diuretics should be avoided as they drop preload further.');

    ---------------------------------------------------------------------------
    -- CASE 19: Lateral STEMI
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lateral Wall Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lateral Wall Changes', 'A patient presents with chest pain. The ECG shows ST elevation in leads I, aVL, V5, and V6.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with chest pain. The ECG shows ST elevation in leads I, aVL, V5, and V6.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which artery is most likely occluded?', '["LAD", "LCx", "RCA", "Small septal branch"]', 1, 'The Left Circumflex (LCx) artery typically supplies the lateral wall of the left ventricle.'),
    (v_case_id, 'Leads I and aVL are often referred to as:', '["High lateral leads", "Low lateral leads", "High septal leads", "High anterior leads"]', 0, 'Leads I and aVL look at the high lateral wall; V5 and V6 look at the low lateral wall.'),
    (v_case_id, 'In an inferior MI, you would expect to see reciprocal ST depression in which leads?', '["V1-V2", "I and aVL", "II and III", "V5-V6"]', 1, 'Reciprocal changes for an inferior MI (II, III, aVF) are typically seen in the lateral leads (I, aVL).');

    ---------------------------------------------------------------------------
    -- CASE 20: Posterior Wall MI
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'ST Depression in V1-V3' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'ST Depression in V1-V3', 'A 60-year-old male has severe chest pain. The standard 12-lead ECG shows deep ST depression and tall R waves in leads V1, V2, and V3.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male has severe chest pain. The standard 12-lead ECG shows deep ST depression and tall R waves in leads V1, V2, and V3.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These findings in V1-V3 are most likely reciprocal changes for which type of MI?', '["Anterior STEMI", "Inferior STEMI", "Posterior STEMI", "Right ventricular MI"]', 2, 'ST depression and tall R waves in V1-V3 represent the "mirror image" of a posterior wall STEMI.'),
    (v_case_id, 'Which additional leads could confirm a posterior MI?', '["V3R, V4R", "V7, V8, V9", "aVR", "Lead III"]', 1, 'Posterior leads V7-V9 (placed on the back) would show ST elevation in a posterior MI.'),
    (v_case_id, 'Which coronary artery is most commonly responsible for a posterior MI?', '["RCA or LCx", "LAD", "Left main", "Small atrial branch"]', 0, 'Posterior MIs can be caused by occlusion of the RCA (if right-dominant) or the LCx.');

    ---------------------------------------------------------------------------
    -- CASE 21: Acute Pericarditis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sharp Pleuritic Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sharp Pleuritic Pain', 'A 24-year-old man presents with sharp chest pain that is worse when lying flat and better when leaning forward. His ECG shows diffuse, concave ST elevation in almost all leads and PR segment depression in lead II.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old man presents with sharp chest pain that is worse when lying flat and better when leaning forward. His ECG shows diffuse, concave ST elevation in almost all leads and PR segment depression in lead II.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["STEMI", "Acute pericarditis", "Prinzmetal angina", "Aortic dissection"]', 1, 'Diffuse ST elevation and PR depression are classic for pericarditis.'),
    (v_case_id, 'Lead aVR typically shows which finding in pericarditis?', '["ST elevation", "PR elevation", "Tall T waves", "Pathologic Q waves"]', 1, 'In pericarditis, aVR often shows reciprocal PR elevation and ST depression.'),
    (v_case_id, 'What is the first-line treatment for idiopathic or viral pericarditis?', '["Thrombolytics", "PCI", "NSAIDs and Colchicine", "Steroids alone"]', 2, 'NSAIDs (like Ibuprofen or Aspirin) plus Colchicine are the standard of care for pericarditis.');

    ---------------------------------------------------------------------------
    -- CASE 22: Pulmonary Embolism (PE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Dyspnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Dyspnea', 'A 40-year-old woman presents with sudden onset shortness of breath and pleuritic chest pain after a long-haul flight. Her ECG shows sinus tachycardia, a large S wave in lead I, and a Q wave and inverted T wave in lead III.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old woman presents with sudden onset shortness of breath and pleuritic chest pain after a long-haul flight. Her ECG shows sinus tachycardia, a large S wave in lead I, and a Q wave and inverted T wave in lead III.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this classic ECG pattern called?', '["Wenckebach", "S1Q3T3", "Ashman phenomenon", "Wellens sign"]', 1, 'The S1Q3T3 pattern is a sign of acute right heart strain, often seen in pulmonary embolism.'),
    (v_case_id, 'What is the most common ECG finding in a patient with a pulmonary embolism?', '["S1Q3T3", "Sinus tachycardia", "New RBBB", "Atrial fibrillation"]', 1, 'While S1Q3T3 is famous, sinus tachycardia is the most frequent ECG finding in PE.'),
    (v_case_id, 'Which of the following would be an expected finding in lead V1 in a large PE?', '["Pathologic Q wave", "Tall R wave and T-wave inversion", "Deep S wave", "Delta wave"]', 1, 'Acute right heart strain can cause RVH-like patterns in the right precordial leads (V1-V3).');

    ---------------------------------------------------------------------------
    -- CASE 23: Hyperkalemia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Renal Failure and ECG Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Renal Failure and ECG Changes', 'A 60-year-old male with end-stage renal disease missed his last dialysis treatment. His ECG shows very tall, narrow, "tented" T waves and a QRS duration of 140 ms.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with end-stage renal disease missed his last dialysis treatment. His ECG shows very tall, narrow, "tented" T waves and a QRS duration of 140 ms.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely electrolyte abnormality?', '["Hypokalemia", "Hyperkalemia", "Hypocalcemia", "Hypercalcemia"]', 1, 'Peaked T waves and QRS widening are classic signs of hyperkalemia.'),
    (v_case_id, 'As this condition worsens, the P waves disappear and the QRS merges with the T wave to form which appearance?', '["Delta wave", "Sine wave", "U wave", "J wave"]', 1, 'Severe hyperkalemia leads to a "sine wave" pattern, which is a pre-terminal rhythm.'),
    (v_case_id, 'Which medication should be given immediately to stabilize the cardiac membrane?', '["Insulin and Glucose", "Calcium gluconate", "Sodium polystyrene sulfonate", "Albuterol"]', 1, 'Calcium gluconate (or chloride) antagonizes the effects of potassium on the myocardium and stabilizes the membrane.');

    ---------------------------------------------------------------------------
    -- CASE 24: Hypokalemia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Muscle Weakness and Diuretics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Muscle Weakness and Diuretics', 'A 50-year-old woman taking high-dose furosemide for heart failure presents with leg cramps. Her ECG shows flattened T waves and a prominent positive wave after the T wave.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old woman taking high-dose furosemide for heart failure presents with leg cramps. Her ECG shows flattened T waves and a prominent positive wave after the T wave.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this extra wave called?', '["Delta wave", "U wave", "J wave", "Osborn wave"]', 1, 'The U wave is a positive wave after the T wave and is characteristic of hypokalemia.'),
    (v_case_id, 'Hypokalemia increases the risk of toxicity from which cardiac medication?', '["Lisinopril", "Digoxin", "Metoprolol", "Amlodipine"]', 1, 'Hypokalemia sensitizes the heart to digoxin, increasing the risk of arrhythmias.'),
    (v_case_id, 'Which of the following is another ECG feature of hypokalemia?', '["Shortened PR interval", "ST segment depression", "Peaked T waves", "Shortened QT interval"]', 1, 'Hypokalemia can cause ST depression, flattened T waves, and prominent U waves.');

    ---------------------------------------------------------------------------
    -- CASE 25: Hypercalcemia vs. Hypocalcemia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shortened QT' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shortened QT', 'A patient with bone metastases from breast cancer presents with confusion. Her ECG shows a remarkably short QT interval.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with bone metastases from breast cancer presents with confusion. Her ECG shows a remarkably short QT interval.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely electrolyte abnormality?', '["Hypercalcemia", "Hypocalcemia", "Hypermagnesemia", "Hypomagnesemia"]', 0, 'Hypercalcemia characteristically shortens the QT interval.'),
    (v_case_id, 'Which of the following would you expect in hypocalcemia?', '["Shortened QT interval", "Prolonged QT interval", "Peaked T waves", "Delta waves"]', 1, 'Hypocalcemia prolongs the QT interval by lengthening the ST segment.'),
    (v_case_id, 'A prolonged QT interval increases the risk for which life-threatening arrhythmia?', '["Atrial fibrillation", "Torsades de Pointes", "First-degree AV block", "SVT"]', 1, 'A long QT interval can lead to the R-on-T phenomenon, triggering polymorphic VT (Torsades de Pointes).');

END $$;

COMMIT;
