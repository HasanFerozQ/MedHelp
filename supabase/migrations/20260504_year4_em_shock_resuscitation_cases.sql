BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Shock & Resuscitation
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-shock-resuscitation' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-shock-resuscitation" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Defining Shock (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'More Than Just Hypotension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'More Than Just Hypotension', 'A patient presents with a normal blood pressure but is confused, has cold extremities, and a lactate of 6.0 mmol/L.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with a normal blood pressure but is confused, has cold extremities, and a lactate of 6.0 mmol/L.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most accurate definition of shock?', '["Blood pressure < 90/60", "Global tissue hypoxia due to oxygen supply/demand mismatch", "High heart rate", "None"]', 1, 'Shock is a cellular-level failure of perfusion, not just a blood pressure reading.'),
    (v_case_id, 'What is "Occult Shock"?', '["Shock with no symptoms", "Compensated shock where the BP is maintained despite poor tissue perfusion", "None", "None"]', 1, 'In early shock, compensatory mechanisms (vasoconstriction/tachycardia) can maintain BP while organs are still suffering.'),
    (v_case_id, 'Why is lactate measured in shock?', '["To check sugar", "It is a marker of anaerobic metabolism due to tissue hypoxia", "None", "None"]', 1, 'Elevated lactate levels correlate with the severity of the oxygen debt.');

    ---------------------------------------------------------------------------
    -- CASE 02: Septic Shock - The 1-Hour Bundle (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sepsis Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sepsis Emergency', 'A 75-year-old with a UTI is febrile, tachycardic, and has a MAP of 55 mmHg.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sepsis Emergency', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the initial fluid resuscitation target for sepsis?', '["500 mL bolus", "30 mL/kg of crystalloid", "2 liters for everyone", "None"]', 1, 'Surviving Sepsis guidelines recommend 30 mL/kg of crystalloid within the first 3 hours.'),
    (v_case_id, 'Which vasopressor is first-line for septic shock refractory to fluids?', '["Dopamine", "Norepinephrine (Levophed)", "Epinephrine", "None"]', 1, 'Norepinephrine is preferred due to its potent alpha-1 and mild beta-1 effects with lower arrhythmic risk.'),
    (v_case_id, 'When should broad-spectrum antibiotics be started in septic shock?', '["After cultures return", "Within the first hour of recognition", "After the first liter of fluid", "None"]', 1, 'Early antibiotic administration is the single most important prognostic factor in sepsis.');

    ---------------------------------------------------------------------------
    -- CASE 03: Hemorrhagic Shock Classification (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Classifying Blood Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Classifying Blood Loss', 'A trauma patient has a heart rate of 125, BP 85/50, and is very anxious.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Classifying Blood Loss', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What class of hemorrhagic shock is this?', '["Class I", "Class II", "Class III", "Class IV"]', 2, 'Class III shock involves a drop in systolic BP and significant tachycardia.'),
    (v_case_id, 'Approximately how much blood volume has been lost in Class III shock?', '["< 15%", "15-30%", "30-40%", "> 40%"]', 2, 'Class III usually corresponds to 1.5 - 2 liters of blood loss in an adult.'),
    (v_case_id, 'What is the initial preferred resuscitation fluid for Class III/IV shock?', '["Normal Saline", "Blood products (1:1:1 ratio of RBC:Plasma:Platelets)", "None", "None"]', 1, 'Early use of blood products improves outcomes over massive crystalloid infusions.');

    ---------------------------------------------------------------------------
    -- CASE 04: Cardiogenic Shock (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Failed Pump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Failed Pump', 'A patient with an acute STEMI has crackles halfway up both lungs, cold skin, and a BP of 80/40.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Failed Pump', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathophysiology of cardiogenic shock?', '["Low volume", "Primary pump failure causing low cardiac output and high filling pressures", "Vasodilation", "None"]', 1, 'The heart cannot pump the blood it receives, leading to pulmonary congestion.'),
    (v_case_id, 'Should you give large fluid boluses to this patient?', '["Yes", "No, it may worsen pulmonary edema; cautious small boluses only if preload is low", "None", "None"]', 1, 'Excess fluid can overwhelm the already failing left ventricle.'),
    (v_case_id, 'Which inotrope is commonly used to increase contractility in cardiogenic shock?', '["Atropine", "Dobutamine", "Adenosine", "None"]', 1, 'Dobutamine is a beta-1 agonist that increases cardiac output.');

    ---------------------------------------------------------------------------
    -- CASE 05: Anaphylactic Shock (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Systemic Reaction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Systemic Reaction', 'A patient collapses after eating peanuts. He has diffuse hives, wheezing, and a BP of 70/30.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Systemic Reaction', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate first-line treatment for anaphylactic shock?', '["Diphenhydramine (Benadryl) IV", "Epinephrine 0.3-0.5 mg IM", "Steroids", "None"]', 1, 'Epinephrine is life-saving; IM is preferred over IV in non-arrested patients to avoid arrhythmias.'),
    (v_case_id, 'Why is Epinephrine the drug of choice?', '["Alpha-1 vasoconstriction, Beta-1 inotropy, and Beta-2 bronchodilation", "It blocks histamine", "None", "None"]', 0, 'It addresses all the major physiological failures of anaphylaxis.'),
    (v_case_id, 'If the patient is on a Beta-blocker and not responding to Epinephrine, what is the next drug?', '["Norepinephrine", "Glucagon", "Atropine", "None"]', 1, 'Glucagon bypasses the blocked beta-receptors to increase cAMP and cardiac output.');

    ---------------------------------------------------------------------------
    -- CASE 06: Neurogenic Shock (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Loss of Sympathetic Tone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Loss of Sympathetic Tone', 'A patient with a T2 spinal cord injury has a BP of 80/40 and a HR of 55 bpm. Skin is warm and dry.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Loss of Sympathetic Tone', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish neurogenic shock from hypovolemic shock?', '["Neurogenic has tachycardia", "Neurogenic has bradycardia (or lack of tachycardia) and warm/flushed skin", "None", "None"]', 1, 'Loss of sympathetic outflow above T6 prevents tachycardia and causing systemic vasodilation.'),
    (v_case_id, 'Is "Spinal Shock" the same as neurogenic shock?', '["Yes", "No, spinal shock is the loss of reflexes/motor function after injury; neurogenic shock is hemodynamic", "None", "None"]', 1, 'Spinal shock is neurological; neurogenic shock is circulatory.'),
    (v_case_id, 'What is the primary management for neurogenic shock?', '["IV fluids and vasopressors (e.g., Norepinephrine)", "Ice", "Antibiotics", "None"]', 0, 'Initial fluid boluses followed by vasopressors are needed to maintain spinal cord perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 07: Obstructive Shock - Tension Pneumothorax (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pressure in the Chest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pressure in the Chest', 'A patient on a ventilator suddenly becomes hypotensive. The high-pressure alarm is sounding.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pressure in the Chest', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of shock?', '["Sepsis", "Tension Pneumothorax", "Hypovolemia", "None"]', 1, 'Positive pressure ventilation increases the risk of tension pneumothorax.'),
    (v_case_id, 'What is the physiological mechanism of shock in tension pneumothorax?', '["Blood loss", "Impaired venous return (decreased preload) due to high intrathoracic pressure", "None", "None"]', 1, 'The pressure shifts the mediastinum and kinking the vena cava.'),
    (v_case_id, 'What is the immediate treatment?', '["Chest X-ray", "Needle decompression or Finger thoracostomy", "Increase O2", "None"]', 1, 'This is a surgical emergency; do not wait for imaging.');

    ---------------------------------------------------------------------------
    -- CASE 08: Obstructive Shock - Cardiac Tamponade (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fluid-Filled Sac' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fluid-Filled Sac', 'A patient with breast cancer has JVD, muffled heart sounds, and hypotension.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fluid-Filled Sac', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this classic triad?', '["Cushing''s", "Beck''s Triad", "Virchow''s", "None"]', 1, 'Beck''s triad: Hypotension, JVD, and Muffled heart sounds.'),
    (v_case_id, 'What is "Pulsus Paradoxus"?', '["High BP", "A drop in systolic BP > 10 mmHg during inspiration", "None", "None"]', 1, 'This occurs because the RV and LV must compete for space within the fixed pericardium.'),
    (v_case_id, 'What bedside imaging is used for rapid confirmation?', '["X-ray", "Bedside Ultrasound (FAST/Pericardial window)", "CT", "None"]', 1, 'Ultrasound is highly sensitive for pericardial effusion.');

    ---------------------------------------------------------------------------
    -- CASE 09: Obstructive Shock - Massive PE (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Large Clot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Large Clot', 'A patient post-op has sudden shortness of breath and a BP of 80/40. ECG shows a right bundle branch block.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Large Clot', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A "Massive" PE is defined by which clinical finding?', '["Large clot on CT", "Hemodynamic instability / hypotension", "Severe pain", "None"]', 1, '"Massive" refers to the impact on BP, not just the size of the clot.'),
    (v_case_id, 'What does an ECHO show in massive PE?', '["Small RV", "Right Ventricular (RV) dilation and strain", "None", "None"]', 1, 'The RV is overwhelmed by the high pressure in the pulmonary circuit.'),
    (v_case_id, 'What is the preferred definitive treatment for massive PE?', '["Heparin only", "Systemic thrombolytics (tPA) or mechanical thrombectomy", "Aspirin", "None"]', 1, 'Aggressive treatment is needed to resolve the obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 10: Bedside Ultrasound - The RUSH Exam (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rapid Ultrasound for Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rapid Ultrasound for Shock', 'A patient is in undifferentiated shock. You perform a RUSH exam.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rapid Ultrasound for Shock', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three components of the RUSH exam?', '["Head, Neck, Legs", "The Pump (Heart), The Tank (Volume/E-FAST), and The Pipes (Aorta/DVT)", "None", "None"]', 1, 'This structured approach helps narrow down the etiology of shock.'),
    (v_case_id, 'In hypovolemic shock, what would you expect to see in "The Tank" (IVC)?', '["Distended IVC", "Collapsing or \"flat\" IVC", "None", "None"]', 1, 'A narrow, collapsing IVC suggests low central venous pressure.'),
    (v_case_id, 'What does a hyperdynamic heart ("The Pump") suggest?', '["Cardiogenic shock", "Distributive or Hypovolemic shock", "None", "None"]', 1, 'A heart pumping vigorously is trying to compensate for low volume or low resistance.');

    ---------------------------------------------------------------------------
    -- CASE 11: Passive Leg Raise - PLR (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing Fluid Responsiveness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing Fluid Responsiveness', 'You are unsure if the patient needs more fluid. You perform a Passive Leg Raise.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Testing Fluid Responsiveness', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of the PLR test?', '["To treat edema", "To assess if the stroke volume increases with an internal \"fluid bolus\" from the legs", "None", "None"]', 1, 'PLR is a transient, reversible way to test if a patient will benefit from actual IV fluids.'),
    (v_case_id, 'How do you measure a positive PLR response?', '["Look for skin color change", "Increase in cardiac output or stroke volume by > 10-15% (measured by echo or arterial line)", "None", "None"]', 1, 'BP changes alone are less reliable than cardiac output changes.'),
    (v_case_id, 'What is an advantage of PLR over a 500 mL fluid bolus?', '["It is faster", "It is reversible and avoids fluid overload in \"non-responders\"", "None", "None"]', 1, 'If the test is negative, the patient is not burdened with extra fluid.');

    ---------------------------------------------------------------------------
    -- CASE 12: Permissive Hypotension in Trauma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tolerating Low BP' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tolerating Low BP', 'A patient has a gunshot wound to the abdomen. He is awake but hypotensive (BP 85/50).', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tolerating Low BP', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of "Permissive Hypotension"?', '["To let the patient die", "To maintain just enough perfusion to vital organs without \"popping the clot\" or diluting factors before surgical control", "None", "None"]', 1, 'Aggressive fluid resuscitation before surgery can worsen internal bleeding.'),
    (v_case_id, 'What is the target systolic BP in this strategy?', '["60", "Approx. 80-90 mmHg (or just enough for a palpable radial pulse)", "120", "None"]', 1, 'Keep it low until the surgeon controls the hemorrhage.'),
    (v_case_id, 'In which trauma group is permissive hypotension CONTRAINDICATED?', '["Abdominal trauma", "Traumatic Brain Injury (TBI)", "None", "None"]', 1, 'The brain requires a higher MAP (usually > 60-70) to maintain cerebral perfusion pressure.');

    ---------------------------------------------------------------------------
    -- CASE 13: Tranexamic Acid - TXA (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Antifibrinolytic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Antifibrinolytic', 'A patient with severe internal bleeding is within 2 hours of his injury.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Antifibrinolytic', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of TXA?', '["Replaces blood", "Inhibits plasminogen activation (blocks fibrinolysis)", "None", "None"]', 1, 'TXA helps stabilize existing clots.'),
    (v_case_id, 'What is the crucial time window for TXA administration in trauma?', '["Within 24 hours", "Within 3 hours of injury", "None", "None"]', 1, 'Giving TXA after 3 hours may actually increase mortality according to the CRASH-2 trial.'),
    (v_case_id, 'What is the standard loading dose?', '["10 mg", "1 gram IV over 10 minutes", "None", "None"]', 1, 'Usually followed by another 1 gram over the next 8 hours.');

    ---------------------------------------------------------------------------
    -- CASE 14: Intraosseous Access - IO (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bone Access' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bone Access', 'You cannot obtain peripheral IV access in a crashing patient after two attempts.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bone Access', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next step for emergency access?', '["Keep trying IV", "Intraosseous (IO) access", "Central line", "None"]', 1, 'IO is faster and more successful than a central line in an emergency.'),
    (v_case_id, 'What is the most common adult site for IO insertion?', '["Skull", "Proximal Tibia or Proximal Humerus", "Sternum only", "None"]', 1, 'The humerus site often provides higher flow rates.'),
    (v_case_id, 'What medications can be given through an IO?', '["Fluids only", "Anything that can be given via IV", "None", "None"]', 1, 'The bone marrow functions as a non-collapsible vein.');

    ---------------------------------------------------------------------------
    -- CASE 15: Adrenal Crisis (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Adrenal Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Adrenal Failure', 'A patient with a history of long-term steroid use presents with refractory shock and abdominal pain after stopping his meds.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Adrenal Failure', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Sepsis", "Adrenal Crisis (Acute Adrenal Insufficiency)", "MI", "None"]', 1, 'Refractory shock in a steroid-dependent patient suggests adrenal failure.'),
    (v_case_id, 'What electrolyte pattern is common in primary adrenal crisis?', '["Hypernatremia/Hypokalemia", "Hyponatremia/Hyperkalemia", "None", "None"]', 1, 'Due to loss of aldosterone.'),
    (v_case_id, 'What is the immediate treatment?', '["Insulin", "High-dose Hydrocortisone (100 mg IV)", "Antibiotics", "None"]', 1, 'Replacing the glucocorticoids is necessary to restore vascular tone.');

    ---------------------------------------------------------------------------
    -- CASE 16: Vasoactive - Phenylephrine (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pure Alpha Agonist' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pure Alpha Agonist', 'A patient with neurogenic shock is hypotensive but has a HR of 100.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pure Alpha Agonist', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of Phenylephrine?', '["Beta-agonist", "Pure Alpha-1 agonist (pure vasoconstriction)", "None", "None"]', 1, 'It increases systemic vascular resistance without affecting heart rate.'),
    (v_case_id, 'What is a common side effect of Phenylephrine?', '["Tachycardia", "Reflex Bradycardia", "None", "None"]', 1, 'The increase in BP can trigger a baroreceptor reflex that slows the heart.'),
    (v_case_id, 'When is Phenylephrine particularly useful?', '["Cardiogenic shock", "Shock with existing tachycardia where you want to avoid further chronotropy", "None", "None"]', 1, 'It provides "pure" pressure.');

    ---------------------------------------------------------------------------
    -- CASE 17: Vasoactive - Vasopressin (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Adjunct Vasopressor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Adjunct Vasopressor', 'A patient in septic shock is on high-dose Norepinephrine but remains hypotensive.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Adjunct Vasopressor', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the role of Vasopressin in septic shock?', '["First-line", "Second-line / adjunct to reduce the dose of Norepinephrine", "None", "None"]', 1, 'It works on V1 receptors, providing a different pathway for vasoconstriction.'),
    (v_case_id, 'What is the standard fixed dose for Vasopressin in sepsis?', '["0.01 to 0.03 units/min", "10 units", "None", "None"]', 0, 'Unlike other pressors, it is usually not titrated.'),
    (v_case_id, 'Does Vasopressin work better in acidic environments than catecholamines?', '["No", "Yes", "None", "None"]', 1, 'Catecholamine receptors are less responsive in severe acidosis; Vasopressin retains its effect.');

    ---------------------------------------------------------------------------
    -- CASE 18: RV Infarction Resuscitation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Preload Dependency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Preload Dependency', 'An inferior MI patient becomes severely hypotensive after taking a Nitroglycerin tablet.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Preload Dependency', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why did the Nitroglycerin cause hypotension?', '["Heart attack progressed", "It decreased preload, and the infarcted RV requires high preload to function", "None", "None"]', 1, 'RV shock is extremely sensitive to nitrates and diuretics.'),
    (v_case_id, 'What is the immediate treatment?', '["Vasopressors", "Rapid IV Fluid boluses to increase RV filling pressure", "None", "None"]', 1, 'Volume is the primary management for RV failure.'),
    (v_case_id, 'What is a physical exam sign of RV failure?', '["Crackles", "JVD and clear lungs", "None", "None"]', 1, 'The fluid backs up into the systemic circulation, not the lungs.');

    ---------------------------------------------------------------------------
    -- CASE 19: Fluid Choice - Saline vs. Balanced (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Salt and Acid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Salt and Acid', 'You are resuscitating a patient with 6 liters of Normal Saline.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Salt and Acid', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What acid-base disturbance can occur from massive Normal Saline infusion?', '["Metabolic alkalosis", "Hyperchloremic metabolic acidosis", "None", "None"]', 1, 'High chloride levels from 0.9% NaCl lead to a non-gap acidosis.'),
    (v_case_id, 'What are "Balanced Crystalloids"?', '["Sugar water", "Lactated Ringer''s or Plasma-Lyte (closer to physiological pH and electrolytes)", "None", "None"]', 1, 'These are increasingly preferred for large-volume resuscitation.'),
    (v_case_id, 'Which fluid is safer for a patient with severe kidney injury?', '["Saline", "Balanced Crystalloids (associated with fewer kidney complications)", "None", "None"]', 1, 'The SALT-ED and SMART trials suggest benefits for balanced solutions.');

    ---------------------------------------------------------------------------
    -- CASE 20: Shock in the Elderly (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blunted Response' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blunted Response', 'An 85-year-old on Beta-blockers has a BP of 95/60 and a HR of 70 after a large GI bleed.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blunted Response', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this patient stable?', '["Yes, vital signs are near normal", "No, this likely represents severe shock masked by medications and age", "None", "None"]', 1, 'The elderly cannot mount the same tachycardic response to hemorrhage.'),
    (v_case_id, 'What is "Normal" BP for a patient with chronic hypertension (baseline 160/90)?', '["120/80", "A \"normal\" 120/80 may actually be significant hypotension for them", "None", "None"]', 1, 'Always evaluate BP relative to the patient''s baseline.'),
    (v_case_id, 'What is the risk of under-resuscitating the elderly?', '["None", "Higher risk of rapid multi-organ failure", "None", "None"]', 1, 'Their physiological reserve is very low.');

    ---------------------------------------------------------------------------
    -- CASE 21: Toxicological Shock - CCB Overdose (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Calcium Channel Blocker Toxicity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Calcium Channel Blocker Toxicity', 'A patient presents with severe hypotension and bradycardia after an overdose of Verapamil.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Calcium Channel Blocker Toxicity', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Besides Calcium, what is a primary therapy for severe CCB shock?', '["Atropine", "High-dose Insulin (Hyperinsulinemia-Euglycemia Therapy)", "Antibiotics", "None"]', 1, 'Insulin at high doses works as a potent inotrope by improving myocardial fuel use.'),
    (v_case_id, 'Why is Insulin used?', '["To lower sugar", "It helps the heart use glucose as an energy source during shock", "None", "None"]', 1, 'In shock, the heart becomes \"glucose-dependent.\"'),
    (v_case_id, 'What is a common blood sugar finding in CCB overdose?', '["Hypoglycemia", "Hyperglycemia (due to inhibition of insulin release)", "None", "None"]', 1, 'CCBs block the calcium channels in the pancreas required for insulin secretion.');

    ---------------------------------------------------------------------------
    -- CASE 22: Heat Stroke as Shock (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Environmental Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Environmental Shock', 'A marathon runner collapses. Temp is 41°C (106°F), BP 80/40, and he is confused.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Environmental Shock', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority treatment for heat stroke?', '["Aspirin", "Immediate rapid cooling (e.g., evaporative or ice-water immersion)", "Fluids only", "None"]', 1, 'Hyperthermia is the driver of the shock state and must be reversed.'),
    (v_case_id, 'What type of distributive shock is this?', '["Sepsis", "Vasodilation due to extreme heat and systemic inflammatory response", "None", "None"]', 1, 'Extreme heat causes widespread endothelial damage and vasodilation.'),
    (v_case_id, 'Are antipyretics (like Tylenol) effective for heat stroke?', '["Yes", "No, the fever is not hypothalamic; cooling is the only effective method", "None", "None"]', 1, 'Antipyretics do not work on heat stroke and may cause liver/platelet harm.');

    ---------------------------------------------------------------------------
    -- CASE 23: Shock and Intubation (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Peri-Intubation Collapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Peri-Intubation Collapse', 'You are about to intubate a patient in septic shock.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Peri-Intubation Collapse', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is intubation dangerous in a patient in shock?', '["Pain", "Sedatives cause vasodilation and positive pressure ventilation decreases venous return", "None", "None"]', 1, 'The combination can lead to immediate post-intubation cardiac arrest.'),
    (v_case_id, 'How can you mitigate this risk?', '["Wait longer", "Fluid resuscitation and starting vasopressors BEFORE \"induction\"", "None", "None"]', 1, 'Hemodynamic optimization prior to the "induction" is critical.'),
    (v_case_id, 'Which induction agent is often preferred in shock for its relative stability?', '["Propofol", "Etomidate or Ketamine", "None", "None"]', 1, 'Propofol is a potent vasodilator and should be avoided in unstable shock.');

    ---------------------------------------------------------------------------
    -- CASE 24: End-points of Resuscitation (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'How Much is Enough?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'How Much is Enough?', 'You have given 4 liters of fluid to a septic patient.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'How Much is Enough?', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal for urine output in a resuscitated adult?', '["0.1 mL/kg/hr", "0.5 mL/kg/hr", "2.0 mL/kg/hr", "None"]', 1, 'Adequate urine output is a proxy for renal perfusion.'),
    (v_case_id, 'What is "Lactate Clearance"?', '["Peeing out lactate", "The serial reduction in lactate over time during resuscitation", "None", "None"]', 1, 'A decreasing lactate indicates improving global perfusion.'),
    (v_case_id, 'Should you keep giving fluids until the CVP is 15?', '["Yes", "No, CVP is a poor predictor of fluid responsiveness", "None", "None"]', 1, 'Static measurements like CVP have been largely replaced by dynamic measures (PLR, IVC ultrasound).');

    ---------------------------------------------------------------------------
    -- CASE 25: Albumin in Resuscitation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Colloids vs. Crystalloids' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Colloids vs. Crystalloids', 'You are choosing between Saline and Albumin for a septic patient.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Colloids vs. Crystalloids', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When might Albumin be considered in septic shock?', '["Every patient", "In patients who have already received large volumes of crystalloid", "None", "None"]', 1, 'ALBIOS trial suggested some benefit in sepsis after initial crystalloid load.'),
    (v_case_id, 'What is the primary disadvantage of Albumin?', '["It is toxic", "It is expensive and has no survival benefit over crystalloids in general shock", "None", "None"]', 1, 'Cost and lack of clear superiority make crystalloids the standard.'),
    (v_case_id, 'In which condition is Albumin/Colloid strictly CONTRAINDICATED?', '["Sepsis", "Traumatic Brain Injury (increased ICP/mortality)", "None", "None"]', 1, 'The SAFE trial showed worse outcomes with albumin in TBI patients.');

    ---------------------------------------------------------------------------
    -- CASE 26: Vasoactive - Dopamine (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Variable Pressor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Variable Pressor', 'You are using Dopamine for a patient with bradycardia and hypotension.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Variable Pressor', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What dose of Dopamine provides primarily alpha-adrenergic vasoconstriction?', '["2 mcg/kg/min", "10-20 mcg/kg/min", "None", "None"]', 1, 'Higher doses are needed for the alpha effect.'),
    (v_case_id, 'Is there a "renal dose" of dopamine that protects the kidneys?', '["Yes", "No, low-dose dopamine does not prevent renal failure", "None", "None"]', 1, 'This is a persistent medical myth.'),
    (v_case_id, 'Why is Dopamine no longer first-line for septic shock?', '["It is slow", "Increased risk of tachycardia and arrhythmias compared to Norepinephrine", "None", "None"]', 1, 'A major trial showed higher mortality in cardiogenic shock and more arrhythmias in sepsis with Dopamine.');

    ---------------------------------------------------------------------------
    -- CASE 27: Vasoactive - Dobutamine (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Inodilator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Inodilator', 'You are starting Dobutamine on a patient with heart failure.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Inodilator', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two primary effects of Dobutamine?', '["Vasoconstriction/Bradycardia", "Positive Inotropy (Beta-1) and Vasodilation (Beta-2)", "None", "None"]', 1, 'It increases pump strength but lowers resistance.'),
    (v_case_id, 'What happens to the BP if you give Dobutamine to a severely hypovolemic patient?', '["It goes up", "It may plummet due to vasodilation without enough volume", "None", "None"]', 1, 'Patients must be "tanked up" before starting Dobutamine.'),
    (v_case_id, 'When is Dobutamine typically added in septic shock?', '["Early", "Only if there is evidence of low cardiac output despite adequate MAP", "None", "None"]', 1, 'It is an adjunct for "cold" sepsis with cardiac dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 28: Passive Leg Raise - Technique (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Doing the PLR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Doing the PLR', 'You are performing a Passive Leg Raise on a hypotensive patient.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Doing the PLR', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the correct starting position for a PLR test?', '["Flat on back", "Semi-recumbent (head of bed at 45°)", "None", "None"]', 1, 'Start at 45°, then drop the head and raise the legs to 45°.'),
    (v_case_id, 'Why should you not just lift the legs from a flat position?', '["It''s hard", "The change from 45° head-up to 45° legs-up provides a larger volume shift", "None", "None"]', 1, 'This maximizes the \"internal bolus\" effect.'),
    (v_case_id, 'How long do the hemodynamic effects of PLR last?', '["30 minutes", "Only 1 to 2 minutes", "None", "None"]', 1, 'The measurement must be taken quickly.');

    ---------------------------------------------------------------------------
    -- CASE 29: Dynamic Air Trapping - Obstructive (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Asthma Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Asthma Crash', 'A severely asthmatic patient is intubated and immediately becomes pulseless.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Asthma Crash', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of shock/arrest?', '["Allergy", "Dynamic Hyperinflation (Auto-PEEP) causing obstructive shock", "None", "None"]', 1, 'Inability to exhale fully leads to pressure buildup that stops venous return.'),
    (v_case_id, 'What is the immediate management?', '["Give Albuterol", "Disconnect the ventilator and compress the chest to allow exhalation", "Increase rate", "None"]', 1, 'Allowing the \"breath\" to escape restores cardiac filling.'),
    (v_case_id, 'How do you prevent this on the ventilator?', '["High rate", "Slow rate and long expiratory (I:E) time", "None", "None"]', 1, 'Patients need time to push air out through narrow airways.');

    ---------------------------------------------------------------------------
    -- CASE 30: Multi-System Clinical Vignettes (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mixed Shock Pattern' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mixed Shock Pattern', 'An elderly patient with urosepsis develops chest pain and a new 4 cm ST elevation.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mixed Shock Pattern', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of shock is this patient likely experiencing?', '["Sepsis only", "Mixed Distributive (Sepsis) and Cardiogenic (MI) shock", "None", "None"]', 1, 'Critical illness often involves multiple shock mechanisms.'),
    (v_case_id, 'How does this complicate resuscitation?', '["It doesn''t", "The fluid needed for sepsis may worsen the heart failure from the MI", "None", "None"]', 1, 'This requires very careful titration of fluids and pressors/inotropy.'),
    (v_case_id, 'What is \"Type 2 MI\" in the context of shock?', '["A blockage", "Ischemia due to increased demand and low supply (no acute clot)", "None", "None"]', 1, 'Tachycardia and hypotension during sepsis can cause "demand" ischemia.');

    ---------------------------------------------------------------------------
    -- CASE 31: Damage Control Resuscitation (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Balanced Resus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Balanced Resus', 'A patient has life-threatening internal bleeding.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Balanced Resus', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of "Damage Control Resuscitation"?', '["Give 5L saline", "To prevent the lethal triad of acidosis, coagulopathy, and hypothermia", "None", "None"]', 1, 'Resuscitation must prioritize blood products and temperature control.'),
    (v_case_id, 'What is the recommended ratio of PRBCs, Plasma, and Platelets?', '["1:1:1", "10:1:1", "4:2:1", "None"]', 0, 'This \"reconstituted whole blood\" approach is the current standard of care.'),
    (v_case_id, 'Why is plasma given early?', '["For energy", "To replace clotting factors and prevent coagulopathy", "None", "None"]', 1, 'Dilutional coagulopathy occurs if only RBCs and saline are given.');

    ---------------------------------------------------------------------------
    -- CASE 32: REBOA - Advanced Resus (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aortic Occlusion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aortic Occlusion', 'You are in a Level 1 Trauma center and a patient has non-compressible torso hemorrhage.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Aortic Occlusion', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does REBOA stand for?', '["Real-time Bolus", "Resuscitative Endovascular Balloon Occlusion of the Aorta", "None", "None"]', 1, 'A balloon is inflated in the aorta to stop distal bleeding and preserve proximal perfusion.'),
    (v_case_id, 'Where is the REBOA catheter typically inserted?', '["Brachial", "Common Femoral Artery", "Jugular", "None"]', 1, 'Femoral access is used to thread the balloon up into the aorta.'),
    (v_case_id, 'What is the \"Zone 1\" position for REBOA?', '["At the pelvis", "In the descending thoracic aorta (above the celiac trunk)", "None", "None"]', 1, 'Zone 1 is used for abdominal or pelvic bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 33: Pediatric Resuscitation - Broselow (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weight and Color' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weight and Color', 'A child is in shock and you do not know the weight.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weight and Color', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Broselow tape used for?', '["Measure height only", "To estimate weight and provide pre-calculated drug doses/equipment sizes based on height", "None", "None"]', 1, 'It standardizes pediatric resuscitation to reduce errors.'),
    (v_case_id, 'What is the initial fluid bolus for a pediatric patient in shock?', '["10 mL/kg", "20 mL/kg of isotonic crystalloid", "500 mL", "None"]', 1, 'Weight-based resuscitation is mandatory in children.'),
    (v_case_id, 'After how many crystalloid boluses should you consider blood in pediatric trauma?', '["1", "2 to 3 (or 40-60 mL/kg total)", "5", "None"]', 1, 'Persistent shock after 2-3 boluses indicates the need for PRBCs.');

    ---------------------------------------------------------------------------
    -- CASE 34: Central Venous Pressure - CVP (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pressure Myth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pressure Myth', 'A resident wants to give fluid until the CVP is 12 mmHg.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pressure Myth', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does a single low CVP measurement always mean the patient needs fluid?', '["Yes", "No, a low CVP doesn''t guarantee responsiveness, and a high CVP doesn''t rule it out", "None", "None"]', 1, 'CVP is a static measure that is notoriously unreliable for predicting fluid response.'),
    (v_case_id, 'What is a better use for a central line in shock management?', '["Measuring CVP", "Safe administration of vasopressors and monitoring SvO2", "None", "None"]', 1, 'Vasopressors should ideally be given through central access to avoid extravasation injury.'),
    (v_case_id, 'What is SvO2 (ScvO2)?', '["Oxygen in the air", "Central Venous Oxygen Saturation (marker of global oxygen delivery/consumption balance)", "None", "None"]', 1, 'A low SvO2 suggests the tissues are extracting more oxygen because delivery is low.');

    ---------------------------------------------------------------------------
    -- CASE 35: Ethics of Resuscitation (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crashing DNR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crashing DNR', 'A patient with end-stage cancer is in shock but has a "Do Not Resuscitate" (DNR) order.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Crashing DNR', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does a DNR order mean "Do Not Treat" shock?', '["Yes", "No, it specifically applies to cardiac/respiratory arrest (no CPR/shocks/intubation)", "None", "None"]', 1, 'You should still treat reversible shock unless the patient has a \"DNI\" or specific comfort-care-only order.'),
    (v_case_id, 'What if a DNI (Do Not Intubate) patient needs a ventilator for shock?', '["Intubate anyway", "Respect the order and use other methods (BiPAP if appropriate) or comfort care", "None", "None"]', 1, 'Autonomy is a core ethical principle.'),
    (v_case_id, 'When is resuscitation considered "futile"?', '["When the doctor is tired", "When there is no physiological hope of benefit or recovery of quality of life", "None", "None"]', 1, 'This requires a complex clinical and ethical judgment.');

    ---------------------------------------------------------------------------
    -- CASE 36: Shock and the Kidneys (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Tubular Necrosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Tubular Necrosis', 'A patient survived 24 hours of septic shock but is now oliguric with rising creatinine.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Tubular Necrosis', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of kidney failure after shock?', '["Kidney stones", "Ischemic Acute Tubular Necrosis (ATN)", "None", "None"]', 1, 'Prolonged hypoperfusion leads to tubular cell death.'),
    (v_case_id, 'Will diuretics (like Lasix) "save" the kidneys in this patient?', '["Yes", "No, they may increase urine output but do not improve survival or renal recovery", "None", "None"]', 1, 'Diuretics should only be used for volume overload, not to "force" the kidneys to work.'),
    (v_case_id, 'What is the \"Prerenal\" vs \"Intrinsic\" pattern?', '["Low BUN", "Prerenal has low urine sodium (< 20); ATN has high urine sodium (> 40)", "None", "None"]', 1, 'The kidneys lose the ability to concentrate urine in ATN.');

    ---------------------------------------------------------------------------
    -- CASE 37: Intra-abdominal Hypertension (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tense Abdomen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tense Abdomen', 'A trauma patient has received 15 liters of fluid. His abdomen is tense, and he has a new oliguria and high peak airway pressures.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tense Abdomen', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely complication?', '["Bowel obstruction", "Abdominal Compartment Syndrome", "None", "None"]', 1, 'Massive fluid resuscitation causes bowel edema and high intra-abdominal pressure.'),
    (v_case_id, 'How do you measure intra-abdominal pressure?', '["Pushing on the belly", "Bladder pressure measurement (via Foley catheter)", "None", "None"]', 1, 'Bladder pressure is the standard indirect measure.'),
    (v_case_id, 'What is the definitive treatment for Abdominal Compartment Syndrome?', '["Giving more fluids", "Decompressive Laparotomy (opening the abdomen)", "None", "None"]', 1, 'Pressure must be surgically relieved to restore organ perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 38: Hypovolemic vs Cardiogenic - The Swan (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Swan-Ganz Data' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Swan-Ganz Data', 'A patient in shock has a Pulmonary Capillary Wedge Pressure (PCWP) of 25 mmHg and a low cardiac index.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Swan-Ganz Data', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of shock does this PCWP suggest?', '["Hypovolemic", "Cardiogenic", "None", "None"]', 1, 'High filling pressures (PCWP > 18) and low output are diagnostic of cardiogenic shock.'),
    (v_case_id, 'What would the PCWP be in hypovolemic shock?', '["High", "Low (usually < 8-10 mmHg)", "None", "None"]', 1, 'Hypovolemia is characterized by "empty" filling pressures.'),
    (v_case_id, 'Why is the Swan-Ganz (\"PAC\") less commonly used today?', '["It doesn''t work", "It is invasive and trials showed no survival benefit over less invasive monitoring", "None", "None"]', 1, 'Risk/benefit favors non-invasive methods in most cases.');

    ---------------------------------------------------------------------------
    -- CASE 39: Anaphylaxis - Bi-phasic Reaction (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Second Wave' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Second Wave', 'A patient successfully treated for anaphylaxis is ready for discharge.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Second Wave', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a \"Biphasic\" reaction?', '["Two allergies", "A recurrence of symptoms hours after the initial reaction has resolved", "None", "None"]', 1, 'Biphasic reactions can occur in up to 20% of cases.'),
    (v_case_id, 'What is the recommended observation period after severe anaphylaxis?', '["1 hour", "4 to 8 hours (or longer if severe)", "None", "None"]', 1, 'Monitoring for the biphasic wave is essential.'),
    (v_case_id, 'What medication is prescribed to every patient discharged after anaphylaxis?', '["Steroids", "Epinephrine Auto-injector (EpiPen)", "None", "None"]', 1, 'They must have the ability to self-treat if it recurs.');

    ---------------------------------------------------------------------------
    -- CASE 40: Vasoactive Extravasation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pressor Leak' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pressor Leak', 'Norepinephrine was running through a peripheral IV, which has now infiltrated. The skin is pale and cold.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pressor Leak', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the danger of pressor extravasation?', '["Infection", "Severe local vasoconstriction and tissue necrosis", "None", "None"]', 1, 'The potent vasoconstriction can "starve" the skin of blood.'),
    (v_case_id, 'What is the specific antidote for catecholamine extravasation?', '["Calcium", "Phentolamine (alpha-blocker)", "None", "None"]', 1, 'Phentolamine helps reverse the local vasoconstriction.'),
    (v_case_id, 'If Phentolamine is not available, what is a topical alternative?', '["Ice", "Nitroglycerin paste", "None", "None"]', 1, 'Topical nitrates can promote local vasodilation.');

    ---------------------------------------------------------------------------
    -- CASE 41: Shock in Pregnancy - Normal Vitals (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pregnancy Physiology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pregnancy Physiology', 'A 32-week pregnant woman has a BP of 110/70 and a HR of 95 after a trauma.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pregnancy Physiology', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a \"normal\" blood pressure reassuring but potentially deceptive in pregnancy?', '["It isn''t", "Blood volume increases by 50% in pregnancy, so she can lose 1.5L before the BP drops", "None", "None"]', 1, 'Pregnant women can mask massive hemorrhage until it is near-fatal.'),
    (v_case_id, 'What is the impact of supine positioning on BP in late pregnancy?', '["None", "The uterus compresses the IVC, decreasing preload and causing hypotension", "None", "None"]', 1, 'Supine hypotensive syndrome can worsen any shock state.'),
    (v_case_id, 'What is the priority in maternal shock?', '["Save the baby", "Aggressive maternal resuscitation (resuscitating the mother is the best way to resuscite the fetus)", "None", "None"]', 1, 'Maternal stability is the prerequisite for fetal survival.');

    ---------------------------------------------------------------------------
    -- CASE 42: MODS - Multi-Organ Dysfunction (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Systemic Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Systemic Failure', 'A patient is in the ICU with shock, now has ARDS, AKI, and DIC.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Systemic Failure', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this progressive failure of multiple organs?', '["Sepsis", "Multi-Organ Dysfunction Syndrome (MODS)", "None", "None"]', 1, 'MODS is the end-result of uncontrolled systemic inflammation and hypoperfusion.'),
    (v_case_id, 'What is the mortality rate of MODS involving 3 or more organs?', '["10%", "Approx. 70-100%", "None", "None"]', 1, 'The prognosis becomes extremely poor as more systems fail.'),
    (v_case_id, 'What is the primary goal of treatment in MODS?', '["Give more pressors", "Support individual organs while identifying and treating the original trigger", "None", "None"]', 1, 'Management is supportive (ventilation, dialysis, pressors).');

    ---------------------------------------------------------------------------
    -- CASE 43: Fluid Responsiveness - IVC (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Measuring the Tank' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Measuring the Tank', 'You are measuring the IVC diameter during the respiratory cycle.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Measuring the Tank', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a high \"Caval Index\" (> 50% collapse with inspiration) suggest?', '["Fluid overload", "Fluid responsiveness / Low CVP", "None", "None"]', 1, 'In a spontaneously breathing patient, a large collapse suggests they need more volume.'),
    (v_case_id, 'Does a plethoric (\"fat\"), non-collapsing IVC guarantee the patient is fluid overloaded?', '["Yes", "No, it just means they are unlikely to respond to more fluid", "None", "None"]', 1, 'It could also be caused by tamponade or PE (obstructive causes).'),
    (v_case_id, 'How do the IVC changes differ in a patient on a ventilator?', '["The same", "The IVC expands with inspiration (positive pressure), rather than collapsing", "None", "None"]', 1, 'The physiology of breathing is reversed on a vent.');

    ---------------------------------------------------------------------------
    -- CASE 44: Vasopressin in Cardiac Arrest (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vasopressin History' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vasopressin History', 'A student asks if Vasopressin is used in the ACLS arrest algorithm.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vasopressin History', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is Vasopressin currently recommended by AHA for cardiac arrest?', '["Yes", "No, it was removed because it showed no benefit over Epinephrine alone", "None", "None"]', 1, 'ACLS focus is on simple, effective interventions.'),
    (v_case_id, 'What was the previous dose used in arrest?', '["1 mg", "40 units IV (replacing the 1st or 2nd dose of Epi)", "None", "None"]', 1, 'It was used as a one-time replacement for epinephrine.'),
    (v_case_id, 'Is it still used in post-arrest shock?', '["No", "Yes, as an adjunct infusion", "None", "None"]', 1, 'It remains a useful pressor for hypotension after the heart is restarted.');

    ---------------------------------------------------------------------------
    -- CASE 45: Occult Shock - Lactate (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Lactate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Lactate', 'A patient with a normal BP of 120/80 has a lactate of 5.5 mmol/L.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The High Lactate', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should be your clinical suspicion?', '["He is fine", "He is in occult shock and needs aggressive resuscitation", "None", "None"]', 1, 'A high lactate with normal BP is a sign of impending decompensation.'),
    (v_case_id, 'What is the \"Sepsis-3\" definition requirement for septic shock?', '["Low BP only", "Vasopressor requirement for MAP > 65 AND Lactate > 2.0 mmol/L", "None", "None"]', 1, 'The presence of high lactate identifies a higher-risk subgroup.'),
    (v_case_id, 'Can Albuterol cause a false elevation in lactate?', '["No", "Yes, it can cause a mild \"Type B\" lactic acidosis", "None", "None"]', 1, 'Beta-2 stimulation can increase glycolysis and lactate production.');

    ---------------------------------------------------------------------------
    -- CASE 46: Shock in the Young Athlete (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Young and Strong' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Young and Strong', 'A 20-year-old athlete has lost 1 liter of blood but has a BP of 110/70 and a HR of 100.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Young and Strong', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the BP still normal?', '["He isn''t bleeding", "Excellent compensatory mechanisms (vigorous vasoconstriction)", "None", "None"]', 1, 'Healthy young people can maintain BP until they have lost ~30-40% of their volume.'),
    (v_case_id, 'What is the \"Shock Index\"?', '["BP x HR", "Heart Rate divided by Systolic BP", "None", "None"]', 1, 'A shock index > 0.9 is a sensitive marker for early shock, even if vitals look "normal."'),
    (v_case_id, 'What happens when this patient finally decompensates?', '["Slow decline", "Sudden and catastrophic \"fall off the cliff\"", "None", "None"]', 1, 'Once they "fall off the cliff," they decline very rapidly.');

    ---------------------------------------------------------------------------
    -- CASE 47: Central vs. Peripheral Pressors (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pressor Route' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pressor Route', 'You need to start Norepinephrine but have no central line yet.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pressor Route', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is it safe to start a pressor through a peripheral IV?', '["Never", "Yes, temporarily (usually < 4-6 hours) through a large-bore, proximal IV (e.g., AC)", "None", "None"]', 1, 'Do not delay life-saving pressors for a central line, but monitor the site closely.'),
    (v_case_id, 'What is the risk of peripheral pressors?', '["Infection", "Extravasation and local tissue necrosis", "None", "None"]', 1, 'This is why they should be moved to a central line as soon as possible.'),
    (v_case_id, 'Which pressor is safest for peripheral use?', '["Norepinephrine", "Phenylephrine (less likely to cause severe necrosis than others)", "None", "None"]', 1, 'Though all carry risks, some protocols favor dilute phenylephrine for brief peripheral use.');

    ---------------------------------------------------------------------------
    -- CASE 48: Targeted Temperature Management - Cooling (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-ROSC Cooling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-ROSC Cooling', 'You have achieved ROSC but the patient is comatose.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-ROSC Cooling', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of TTM in post-arrest shock?', '["Fix the heart", "Mitigate reperfusion injury and improve neurological recovery", "None", "None"]', 1, 'Hypothermia slows the brain''s metabolic rate and reduces inflammation.'),
    (v_case_id, 'What temperature is currently recommended for TTM?', '["28°C", "32°C to 36°C", "37°C", "None"]', 1, 'The TTM-2 trial showed similar outcomes between 33°C and targeted normothermia (avoiding fever).'),
    (v_case_id, 'What is the most important part of TTM?', '["Cooling fast", "Avoiding fever / temperature consistency", "None", "None"]', 1, 'Spikes in temperature (fever) are very harmful post-arrest.');

    ---------------------------------------------------------------------------
    -- CASE 49: Adrenal Crisis - Refractory Shock (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Refractory Septic Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Refractory Septic Shock', 'A patient in septic shock is failing high-dose pressors.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Refractory Septic Shock', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When should steroids be added in septic shock?', '["To everyone", "In patients who remain hemodynamically unstable despite fluids and vasopressors", "None", "None"]', 1, 'Steroids (Hydrocortisone 200mg/day) help restore vascular responsiveness to pressors.'),
    (v_case_id, 'What is the \"Relative Adrenal Insufficiency\" of critical illness?', '["No steroids", "A state where the body cannot produce enough cortisol to meet the massive stress of shock", "None", "None"]', 1, 'The hypothalamic-pituitary-adrenal axis becomes overwhelmed.'),
    (v_case_id, 'Should you do a Cosyntropin stimulation test in the ED for these patients?', '["Yes", "No, it is unreliable in acute shock; treat empirically if indicated", "None", "None"]', 1, 'Testing delays care and doesn''t change the decision to treat in the acute phase.');

    ---------------------------------------------------------------------------
    -- CASE 50: Shock - The End Point of Life (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irreversible Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irreversible Shock', 'A patient has failed max doses of 4 pressors, is on a ventilator, and has a pH of 6.8.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Irreversible Shock', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What stage of shock is this?', '["Compensated", "Decompensated", "Irreversible (Refractory)", "None"]', 2, 'At this stage, cell death is widespread and recovery is physiologically impossible.'),
    (v_case_id, 'What is the ethical responsibility of the physician at this point?', '["Keep going", "Communicate with the family about the prognosis and pivot to palliative/comfort care if appropriate", "None", "None"]', 1, 'Recognizing when resuscitation is futile is a vital clinical skill.'),
    (v_case_id, 'Why does the BP eventually stop responding to pressors?', '["Tolerance", "Severe metabolic acidosis and hypoxia desensitize the adrenergic receptors", "None", "None"]', 1, 'The underlying cellular machinery has completely failed.');

    RAISE NOTICE 'SUCCESS: 50 Shock Types & Resuscitation Case Blocks registered.';
END $$;

COMMIT;
