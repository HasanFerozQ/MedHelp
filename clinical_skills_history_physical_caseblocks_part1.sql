-- Clinical Skills & Diagnostics: History Taking & Physical Examination - Part 1 (Cases 1-15)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: history-physical-exam

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'history-physical-exam' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'history-physical-exam';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Blood Pressure Measurement Technique
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Elevated Reading' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Elevated Reading', 'A 45-year-old male presents for a routine check-up. The medical assistant records a blood pressure of 155/95 mmHg. You notice the patient was sitting with his legs crossed and his arm hanging by his side during the measurement.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male presents for a routine check-up. The medical assistant records a blood pressure of 155/95 mmHg. You notice the patient was sitting with his legs crossed and his arm hanging by his side during the measurement.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following errors is most likely to cause a falsely elevated systolic reading in this patient?', '["Arm positioned below heart level", "Using a cuff that is too large", "Patient resting for 10 minutes before reading", "Arm positioned at heart level"]', 0, 'An arm positioned below heart level leads to a falsely high reading due to added hydrostatic pressure. Crossing legs also increases BP.'),
    (v_case_id, 'What is the correct width for a blood pressure cuff bladder?', '["20% of the arm circumference", "40% of the arm circumference", "60% of the arm circumference", "80% of the arm circumference"]', 1, 'The bladder width should be approximately 40% of the arm circumference, and the length should be 80%.'),
    (v_case_id, 'To confirm a diagnosis of hypertension, what is the next best step after an initial high office reading?', '["Start lisinopril immediately", "Average two or more readings on two or more occasions", "Perform an immediate ECG", "Check home BP once"]', 1, 'Hypertension diagnosis requires multiple elevated readings over time, unless it is a hypertensive emergency.');

    ---------------------------------------------------------------------------
    -- CASE 02: Orthostatic Hypotension
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lightheadedness on Standing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lightheadedness on Standing', 'An 82-year-old female reports feeling dizzy when she gets out of bed in the morning. She is taking several medications for hypertension and heart failure.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 82-year-old female reports feeling dizzy when she gets out of bed in the morning. She is taking several medications for hypertension and heart failure.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines orthostatic hypotension when moving from supine to standing?', '["Drop in systolic BP >= 10 mmHg or diastolic >= 5 mmHg", "Drop in systolic BP >= 20 mmHg or diastolic >= 10 mmHg", "Increase in heart rate >= 10 bpm", "Drop in systolic BP >= 5 mmHg"]', 1, 'Standard definition is a drop in SBP >= 20 or DBP >= 10 within 3 minutes of standing.'),
    (v_case_id, 'How long should the patient remain standing before the final BP reading for orthostatics?', '["10 seconds", "1 minute", "3 minutes", "10 minutes"]', 2, 'Orthostatic BP should be measured at 1 and 3 minutes after standing.'),
    (v_case_id, 'A significant increase in heart rate (>30 bpm) without a major drop in BP upon standing in a younger patient suggests:', '["Vasovagal syncope", "Postural Orthostatic Tachycardia Syndrome (POTS)", "Primary Autonomic Failure", "Dehydration"]', 1, 'POTS is characterized by significant tachycardia upon standing without a drop in BP.');

    ---------------------------------------------------------------------------
    -- CASE 03: Screening for Alcohol Use
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Routine Social History' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Routine Social History', 'During a new patient intake, a 38-year-old man mentions he drinks "a few beers" on the weekend. You decide to screen for alcohol use disorder.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a new patient intake, a 38-year-old man mentions he drinks "a few beers" on the weekend. You decide to screen for alcohol use disorder.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "C" in the CAGE questionnaire stand for?', '["Cravings", "Cut down", "Concern", "Caught"]', 1, 'CAGE: Have you ever felt you should Cut down on your drinking?'),
    (v_case_id, 'How many "Yes" answers on the CAGE questionnaire are generally considered clinically significant?', '["One", "Two", "Three", "Four"]', 1, 'Two or more affirmative answers have high sensitivity and specificity for alcohol use disorder.'),
    (v_case_id, 'The "E" in CAGE refers to an "Eye-opener." What does this specifically screen for?', '["Social drinking", "Binge drinking", "Withdrawal symptoms in the morning", "Liver disease"]', 2, 'An eye-opener (drinking first thing in the morning) is a sign of physical dependence and withdrawal prevention.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Ophthalmoscopic Exam (Fundoscopy)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blurred Vision and Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blurred Vision and Headache', 'A 50-year-old female with long-standing poorly controlled hypertension presents with a headache. You perform a fundoscopic exam.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female with long-standing poorly controlled hypertension presents with a headache. You perform a fundoscopic exam.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which finding is most characteristic of hypertensive retinopathy?', '["Drusen", "AV nicking (arteriovenous crossing changes)", "Neovascularization", "Cherry-red spot"]', 1, 'AV nicking occurs when a thickened arterial wall compresses a vein where they cross.'),
    (v_case_id, 'Swelling of the optic disc with loss of disc margins and blurred cup-to-disc ratio is called:', '["Glaucoma", "Macular degeneration", "Papilledema", "Retinal detachment"]', 2, 'Papilledema indicates increased intracranial pressure.'),
    (v_case_id, 'Where is the fovea located relative to the optic disc?', '["Nasal to the disc", "Temporal to the disc", "Superior to the disc", "Inferior to the disc"]', 1, 'The fovea/macula is located temporal to the optic disc.');

    ---------------------------------------------------------------------------
    -- CASE 05: Thyroid Examination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anterior Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anterior Neck Mass', 'A 32-year-old woman notes a "fullness" in her neck. You perform a thyroid examination.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old woman notes a "fullness" in her neck. You perform a thyroid examination.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When palpating the thyroid gland, what should the patient be asked to do?', '["Cough", "Swallow", "Take a deep breath", "Turn their head"]', 1, 'The thyroid gland, isthmus, and lobes should move upward during swallowing.'),
    (v_case_id, 'The thyroid isthmus usually lies across which tracheal rings?', '["1st and 2nd", "2nd, 3rd, and 4th", "4th and 5th", "Thyroid cartilage"]', 1, 'The isthmus typically spans the 2nd to 4th tracheal rings.'),
    (v_case_id, 'If the thyroid gland is enlarged, which additional step should be performed?', '["Percuss the borders", "Auscultate for a bruit", "Check for a thrill", "Transilluminate"]', 1, 'A bruit may be heard in hyperthyroid states (like Graves'' disease) due to increased vascularity.');

    ---------------------------------------------------------------------------
    -- CASE 06: Lung Auscultation - Breath Sounds
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Productive Cough and Fever' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Productive Cough and Fever', 'A 65-year-old man presents with a 3-day history of fever and a cough productive of rusty sputum. On exam, you hear loud, high-pitched sounds over the right lower lobe with an expiratory phase longer than the inspiratory phase.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old man presents with a 3-day history of fever and a cough productive of rusty sputum. On exam, you hear loud, high-pitched sounds over the right lower lobe with an expiratory phase longer than the inspiratory phase.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these breath sounds called when heard over the lung periphery?', '["Vesicular", "Bronchial", "Bronchovesicular", "Tracheal"]', 1, 'Bronchial sounds are normal over the trachea but indicate consolidation (like pneumonia) if heard over the lung parenchyma.'),
    (v_case_id, 'When the patient says "99," the sound is heard clearly and loudly through the stethoscope. This is known as:', '["Egophony", "Whispered pectoriloquy", "Bronchophony", "Tactile fremitus"]', 2, 'Bronchophony is increased clarity of spoken words during auscultation over consolidated lung.'),
    (v_case_id, 'If the patient says "E" and it sounds like "A," this is:', '["Egophony", "Bronchophony", "Pectoriloquy", "Stridor"]', 0, 'Egophony (E-to-A change) is a classic sign of consolidation.');

    ---------------------------------------------------------------------------
    -- CASE 07: Jugular Venous Pressure (JVP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shortness of Breath and Leg Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shortness of Breath and Leg Swelling', 'A 72-year-old male with a history of heart failure presents with worsening dyspnea. You examine his neck veins with the head of the bed at 45 degrees.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male with a history of heart failure presents with worsening dyspnea. You examine his neck veins with the head of the bed at 45 degrees.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'JVP is measured as the vertical distance above which anatomical landmark?', '["Clavicle", "Sternal angle (Angle of Louis)", "Suprasternal notch", "Cricoid cartilage"]', 1, 'JVP is measured vertically from the sternal angle; it is normally <= 3-4 cm above this point.'),
    (v_case_id, 'If the JVP is 5 cm above the sternal angle, what is the estimated central venous pressure (CVP)?', '["5 cm H2O", "10 cm H2O", "15 cm H2O", "3 cm H2O"]', 1, 'CVP is JVP + 5 cm (the distance from the sternal angle to the right atrium). 5 + 5 = 10 cm H2O.'),
    (v_case_id, 'Which of the following distinguishes the jugular venous pulse from the carotid pulse?', '["Jugular pulse is palpable", "Jugular pulse height varies with respiration", "Jugular pulse has a single outward wave", "Jugular pulse is not affected by pressure at the base of the neck"]', 1, 'JVP is typically non-palpable, has biphasic waves, and changes with respiration and position.');

    ---------------------------------------------------------------------------
    -- CASE 08: Cardiovascular Auscultation - S3 and S4
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Extra Heart Sound' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Extra Heart Sound', 'A 55-year-old male with a history of a large myocardial infarction presents for follow-up. You hear a low-pitched sound in early diastole at the apex using the bell of the stethoscope.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male with a history of a large myocardial infarction presents for follow-up. You hear a low-pitched sound in early diastole at the apex using the bell of the stethoscope.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this early diastolic sound called?', '["S3 (Ventricular gallop)", "S4 (Atrial gallop)", "Opening snap", "Ejection click"]', 0, 'S3 occurs during the rapid ventricular filling phase of diastole and is common in volume overload states (e.g., HF).'),
    (v_case_id, 'Which position best accentuates low-pitched diastolic sounds at the apex?', '["Sitting upright and leaning forward", "Supine", "Left lateral decubitus", "Right lateral decubitus"]', 2, 'The left lateral decubitus position brings the left ventricle closer to the chest wall.'),
    (v_case_id, 'What does an S4 sound indicate?', '["Rapid ventricular filling", "Atrial contraction into a stiff, non-compliant ventricle", "Closure of the aortic valve", "Pericardial friction"]', 1, 'S4 (atrial gallop) is heard in late diastole and indicates reduced ventricular compliance (e.g., LVH).');

    ---------------------------------------------------------------------------
    -- CASE 09: Abdominal Examination - Special Signs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Right Upper Quadrant Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Right Upper Quadrant Pain', 'A 42-year-old overweight woman presents with acute onset right upper quadrant pain that radiates to her right scapula. She has nausea.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old overweight woman presents with acute onset right upper quadrant pain that radiates to her right scapula. She has nausea.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'You ask the patient to take a deep breath while you apply pressure under the right costal margin. She stops inspiration due to pain. This is:', '["McBurney''s sign", "Murphy''s sign", "Rovsing''s sign", "Psoas sign"]', 1, 'Murphy''s sign is highly suggestive of acute cholecystitis.'),
    (v_case_id, 'Pressure in the left lower quadrant causes pain in the right lower quadrant. This is:', '["Murphy''s sign", "Rovsing''s sign", "Obturator sign", "Blumberg''s sign"]', 1, 'Rovsing''s sign is a sign of peritoneal irritation, often in appendicitis.'),
    (v_case_id, 'Pain elicited by extending the right hip while the patient is in the left lateral decubitus position is:', '["Psoas sign", "Obturator sign", "McBurney''s sign", "Murphy''s sign"]', 0, 'The Psoas sign indicates an inflamed appendix irritating the psoas muscle.');

    ---------------------------------------------------------------------------
    -- CASE 10: Assessing for Ascites
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Abdominal Distension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Abdominal Distension', 'A 58-year-old man with chronic hepatitis C presents with increasing abdominal girth.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old man with chronic hepatitis C presents with increasing abdominal girth.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'While the patient is supine, you percuss from the umbilicus toward the flanks. You find tympany centrally and dullness in the flanks. This is called:', '["Fluid wave", "Shifting dullness", "Puddle sign", "Ballottement"]', 1, 'Shifting dullness is a primary test for ascites; the dullness shifts as the patient turns to their side.'),
    (v_case_id, 'Which finding is most specific for large-volume ascites?', '["Presence of caput medusae", "A palpable fluid wave", "Abdominal tympany", "Spider angiomata"]', 1, 'A fluid wave is less sensitive but quite specific for large-volume ascites.'),
    (v_case_id, 'What is the correct order of the abdominal physical examination?', '["Inspection, Palpation, Percussion, Auscultation", "Inspection, Auscultation, Percussion, Palpation", "Inspection, Percussion, Palpation, Auscultation", "Auscultation, Inspection, Palpation, Percussion"]', 1, 'Auscultation is performed second to avoid bowel sound changes caused by percussion/palpation.');

    ---------------------------------------------------------------------------
    -- CASE 11: Peripheral Vascular Exam - Ankle-Brachial Index (ABI)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Leg Pain with Walking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Leg Pain with Walking', 'A 68-year-old smoker reports calf pain that starts after walking two blocks and resolves with rest. You suspect Peripheral Arterial Disease (PAD).', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old smoker reports calf pain that starts after walking two blocks and resolves with rest. You suspect Peripheral Arterial Disease (PAD).', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the Ankle-Brachial Index (ABI) calculated?', '["Highest ankle SBP divided by highest brachial SBP", "Highest ankle SBP divided by lowest brachial SBP", "Lowest ankle SBP divided by highest brachial SBP", "Average ankle SBP divided by average brachial SBP"]', 0, 'ABI = (Highest ankle pressure [PT or DP]) / (Highest brachial pressure [either arm]).'),
    (v_case_id, 'An ABI of 0.6 indicates which of the following?', '["Normal arterial flow", "Mild PAD", "Moderate PAD", "Severe PAD"]', 2, 'ABI 0.9-1.3 is normal; 0.4-0.7 is moderate PAD; <0.4 is severe PAD.'),
    (v_case_id, 'Which physical exam finding is most consistent with chronic arterial insufficiency?', '["Brawny edema", "Hyperpigmentation (hemosiderin staining)", "Dependent rubor and pallor on elevation", "Warm, moist skin"]', 2, 'Arterial insufficiency leads to pallor on elevation and a dusky red color (rubor) when dependent.');

    ---------------------------------------------------------------------------
    -- CASE 12: Shoulder Examination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shoulder Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shoulder Pain', 'A 45-year-old painter presents with pain in his right shoulder, especially when reaching overhead.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old painter presents with pain in his right shoulder, especially when reaching overhead.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'You passively abduct the patient''s arm to 90 degrees and ask him to lower it slowly. The arm drops suddenly. This is a positive:', '["Neer impinging sign", "Hawkins impingement sign", "Drop-arm test", "Empty can test"]', 2, 'A positive drop-arm test suggests a rotator cuff tear (specifically supraspinatus).'),
    (v_case_id, 'Which test involves internal rotation of the shoulder with the arm flexed to 90 degrees and the elbow flexed to 90 degrees?', '["Neer sign", "Hawkins impingement sign", "Apprehension test", "Phalen''s test"]', 1, 'Hawkins sign tests for subacromial impingement.'),
    (v_case_id, 'The "Empty Can" test (Jobe test) primarily assesses which muscle?', '["Infraspinatus", "Supraspinatus", "Subscapularis", "Teres minor"]', 1, 'The empty can test isolates the supraspinatus muscle.');

    ---------------------------------------------------------------------------
    -- CASE 13: Knee Examination - ACL Assessment
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sports Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sports Injury', 'A 19-year-old soccer player felt a "pop" in her knee during a sudden pivot. There is immediate swelling.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old soccer player felt a "pop" in her knee during a sudden pivot. There is immediate swelling.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which test is considered most sensitive for an acute ACL tear?', '["Anterior drawer test", "Lachman test", "Pivot shift test", "McMurray test"]', 1, 'The Lachman test (performed at 20-30 degrees flexion) is more sensitive than the anterior drawer for ACL tears.'),
    (v_case_id, 'A positive McMurray test suggests injury to which structure?', '["ACL", "MCL", "Meniscus", "Patellar tendon"]', 2, 'McMurray test (with rotation and extension) assesses for meniscal tears.'),
    (v_case_id, 'To assess the Medial Collateral Ligament (MCL), which maneuver is used?', '["Valgus stress test", "Varus stress test", "Lachman test", "Posterior drawer test"]', 0, 'Valgus stress (pushing the knee medially) tests the MCL.');

    ---------------------------------------------------------------------------
    -- CASE 14: Mental Status Examination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Confusion in an Elderly Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Confusion in an Elderly Patient', 'An 80-year-old man is brought to the hospital because he is "not himself." He doesn''t know where he is or what the date is.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man is brought to the hospital because he is "not himself." He doesn''t know where he is or what the date is.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Asking a patient to name the current president and recent news events assesses which component of the mental status exam?', '["Orientation", "Attention", "Remote memory", "Orientation to knowledge (General information)"]', 3, 'This assesses general information and fund of knowledge.'),
    (v_case_id, 'Asking a patient to spell "WORLD" backward or serial 7s assesses:', '["Memory", "Attention/Concentration", "Abstract reasoning", "Judgment"]', 1, 'These are standard tests for attention and concentration.'),
    (v_case_id, 'What is the "Mini-Mental State Exam" (MMSE) score out of?', '["10", "20", "30", "50"]', 2, 'The MMSE is a 30-point questionnaire used extensively to screen for cognitive impairment.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cranial Nerve Examination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Facial Droop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Facial Droop', 'A 28-year-old man presents with sudden onset weakness of the entire right side of his face, including the forehead.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old man presents with sudden onset weakness of the entire right side of his face, including the forehead.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cranial nerve is affected in this patient?', '["CN V", "CN VII", "CN IX", "CN XII"]', 1, 'The facial nerve (CN VII) controls facial expression. Involvement of the forehead indicates a Lower Motor Neuron lesion (e.g., Bell''s palsy).'),
    (v_case_id, 'The gag reflex tests which cranial nerves?', '["V and VII", "VII and IX", "IX and X", "X and XII"]', 2, 'The gag reflex has a sensory limb via CN IX and a motor limb via CN X.'),
    (v_case_id, 'Asking the patient to stick out their tongue and looking for deviation assesses:', '["CN IX", "CN X", "CN XI", "CN XII"]', 3, 'The hypoglossal nerve (CN XII) controls tongue movement; the tongue deviates TOWARD the side of the lesion.');

END $$;

COMMIT;
