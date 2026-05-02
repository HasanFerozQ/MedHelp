BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Procedural Skills
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-procedural-skills" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: RSI - Pre-oxygenation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Airway Prep' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Airway Prep', 'You are preparing to intubate a patient with respiratory failure. You are performing pre-oxygenation.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Airway Prep', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary goal of pre-oxygenation?', '["Increase heart rate", "Replace the nitrogen in the lungs with oxygen (Nitrogen Washout) to extend apnea time", "None", "None"]', 1, 'Denitrogenation of the functional residual capacity provides a buffer against hypoxia during the apnea period of intubation.'),
    (v_case_id, 'How long should a healthy patient breathe 100% oxygen to achieve optimal pre-oxygenation?', '["1 minute", "3 to 5 minutes", "10 minutes", "None"]', 1, '3-5 minutes of tidal volume breathing or 8 vital capacity breaths is standard.'),
    (v_case_id, 'What is "Apneic Oxygenation"?', '["Holding breath", "Providing high-flow nasal cannula oxygen during the apnea period", "None", "None"]', 1, 'This technique can further extend the time until desaturation.');

    ---------------------------------------------------------------------------
    -- CASE 02: RSI Meds - Induction (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Induction Choice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Induction Choice', 'You are selecting induction agents for a patient in septic shock who needs intubation.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Induction Choice', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which induction agent is most hemodynamically neutral?', '["Propofol", "Etomidate", "Midazolam", "None"]', 1, 'Etomidate (0.3 mg/kg) is preferred in shock because it causes minimal hypotension.'),
    (v_case_id, 'Which agent is ideal for a patient with severe asthma or bronchospasm?', '["Etomidate", "Ketamine", "Propofol", "None"]', 1, 'Ketamine has bronchodilatory properties and helps maintain BP.'),
    (v_case_id, 'What is a major side effect of Propofol in a shocked patient?', '["Hypertension", "Profound hypotension and myocardial depression", "None", "None"]', 1, 'Propofol should be avoided or severely dose-reduced in unstable patients.');

    ---------------------------------------------------------------------------
    -- CASE 03: RSI Meds - Paralysis (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Paralytic Choice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Paralytic Choice', 'You are choosing between Succinylcholine and Rocuronium for RSI.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Paralytic Choice', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these is a contraindication to Succinylcholine?', '["Asthma", "Hyperkalemia (or history of crush injury/burns > 48h)", "None", "None"]', 1, 'Succinylcholine causes a transient rise in potassium, which can be lethal in already hyperkalemic patients.'),
    (v_case_id, 'What type of neuromuscular blocker is Rocuronium?', '["Depolarizing", "Non-depolarizing", "None", "None"]', 1, 'Roc competes with acetylcholine at the receptor but does not cause a contraction.'),
    (v_case_id, 'What is the typical duration of action for Succinylcholine?', '["5 to 10 minutes", "30 to 60 minutes", "None", "None"]', 0, 'Its short duration is an advantage if the airway is "failed" but the patient can be ventilated.');

    ---------------------------------------------------------------------------
    -- CASE 04: Difficult Airway - LEMON (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Predicting Difficulty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Predicting Difficulty', 'You are performing a pre-intubation assessment using the LEMON mnemonic.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Predicting Difficulty', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "M" in LEMON stand for?', '["Maxilla", "Mallampati Score", "Mandible", "None"]', 1, 'The Mallampati score relates tongue size to the oral cavity; Class III/IV predict difficulty.'),
    (v_case_id, 'What does the "3-3-2" rule assess?', '["Age", "Anatomical proportions (Mouth opening, Hyoid-mentum, Hyoid-thyroid)", "None", "None"]', 1, 'It predicts how well the laryngeal and pharyngeal axes will align.'),
    (v_case_id, 'What does the "O" stand for?', '["Oxygen", "Obstruction/Obesity", "None", "None"]', 1, 'External obstruction or morbid obesity makes visualization and ventilation harder.');

    ---------------------------------------------------------------------------
    -- CASE 05: Airway Confirmation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Is the Tube In?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Is the Tube In?', 'You have just placed an endotracheal tube. You must confirm its position.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Is the Tube In?', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "gold standard" for confirming ETT placement in the ED?', '["Chest X-ray", "Waveform Capnography (End-tidal CO2)", "Lungs sounds only", "None"]', 1, 'A persistent CO2 waveform over several breaths is the most reliable confirmation of tracheal placement.'),
    (v_case_id, 'Can a chest X-ray distinguish between tracheal and esophageal intubation?', '["Yes", "No, it only shows the depth/level of the tube relative to the carina", "None", "None"]', 1, 'X-ray is for depth; Capnography is for location.'),
    (v_case_id, 'If you hear breath sounds over the STOMACH but not the lungs, what should you do?', '["Wait for X-ray", "Pull the tube immediately and re-oxygenate", "None", "None"]', 1, 'Esophageal intubation must be recognized and corrected immediately.');

    ---------------------------------------------------------------------------
    -- CASE 06: Surgical Airway - Cricothyrotomy (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Can''t Oxygenate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Can''t Oxygenate', 'You are faced with a "Can''t Intubate, Can''t Oxygenate" (CICO) scenario.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Can''t Oxygenate', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomic landmark for a cricothyrotomy?', '["Thyroid notch", "Cricothyroid membrane (between thyroid and cricoid cartilages)", "None", "None"]', 1, 'This is a superficial, relatively bloodless entry point to the airway.'),
    (v_case_id, 'Is a surgical cricothyrotomy indicated in children < 10 years old?', '["Yes", "No, needle cricothyrotomy with jet ventilation is preferred", "None", "None"]', 1, 'Small children have fragile laryngeal structures; surgical cric is risky.'),
    (v_case_id, 'What is the "scalpel-finger-tube" technique?', '["A way to hold the tube", "A rapid surgical method for establishing a cricothyrotomy", "None", "None"]', 1, 'It involves making an incision, using the finger as a guide, and inserting the tube.');

    ---------------------------------------------------------------------------
    -- CASE 07: Central Line - Landmarks (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal Jugular Access' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal Jugular Access', 'You are placing a central venous catheter (CVC) in the right Internal Jugular (IJ) vein.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Internal Jugular Access', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the IJ vein located relative to the carotid artery?', '["Medial", "Lateral", "Posterior", "None"]', 1, 'The vein is typically lateral and slightly anterior to the artery.'),
    (v_case_id, 'What is the "Seldinger Technique"?', '["A type of knot", "A method using a needle, then a guidewire, then the catheter", "None", "None"]', 1, 'This is the standard technique for most vascular access procedures.'),
    (v_case_id, 'Which side is preferred for IJ placement to reduce the risk of thoracic duct injury?', '["Left", "Right", "None", "None"]', 1, 'The thoracic duct enters the venous system on the left side.');

    ---------------------------------------------------------------------------
    -- CASE 08: Central Line - Complications (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-CVC SOB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-CVC SOB', 'A patient becomes short of breath immediately after a subclavian central line attempt.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-CVC SOB', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely complication?', '["Stroke", "Pneumothorax", "Heart failure", "None"]', 1, 'The lung apex is close to the subclavian vein.'),
    (v_case_id, 'What is the imaging of choice to confirm CVC tip location and rule out PTX?', '["Ultrasound", "Upright Chest X-ray", "None", "None"]', 1, 'CXR is the standard post-procedure study.'),
    (v_case_id, 'Where should the tip of a properly placed CVC reside?', '["Right Atrium", "Superior Vena Cava (SVC) near the junction with the right atrium", "None", "None"]', 1, 'Placing the tip too deep (in the atrium) can cause arrhythmias or perforation.');

    ---------------------------------------------------------------------------
    -- CASE 09: Intraosseous (IO) Access (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Emergency Drill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Emergency Drill', 'Peripheral IV access has failed in a critically ill patient.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Emergency Drill', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the preferred site for IO access in an adult?', '["Sternum", "Proximal Tibia or Proximal Humerus", "Femur", "None"]', 1, 'The proximal tibia (flat part 2cm medial to the tuberosity) is the most common site.'),
    (v_case_id, 'Which medications can be given via the IO route?', '["Only saline", "Anything that can be given via a peripheral IV", "None", "None"]', 1, 'The bone marrow acts as a non-collapsible vein.'),
    (v_case_id, 'What is a contraindication to IO placement in a specific limb?', '["Obesity", "Fracture of that bone or prior IO attempt in that same bone", "None", "None"]', 1, 'Fluid will leak out through the fracture site.');

    ---------------------------------------------------------------------------
    -- CASE 10: Chest Tube - Technique (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tube Thoracostomy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tube Thoracostomy', 'You are placing a chest tube for a large traumatic hemothorax.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tube Thoracostomy', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Triangle of Safety" for chest tube insertion?', '["Neck", "Border of Pectoralis Major, Latissimus Dorsi, and the 5th Intercostal Space", "None", "None"]', 1, 'This area minimizes risk to the heart, lungs, and great vessels.'),
    (v_case_id, 'Should you insert the tube over or under the rib?', '["Under the rib", "Over the rib (to avoid the neurovascular bundle)", "None", "None"]', 1, 'The intercostal artery and nerve run along the inferior border of the rib.'),
    (v_case_id, 'What is the first step after making the skin incision?', '["Insert the tube", "Blunt dissection with Kelly clamps and finger exploration of the pleural space", "None", "None"]', 1, 'Finger exploration ensures you are truly in the pleural space and not in the liver/spleen.');

    ---------------------------------------------------------------------------
    -- CASE 11: Needle Decompression (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tension PTX' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tension PTX', 'A trauma patient has absent breath sounds on the right, JVD, and hypotension.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tension PTX', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate action?', '["Chest X-ray", "Needle decompression", "Wait for labs", "None"]', 1, 'Tension PTX is a clinical diagnosis; waiting for an X-ray can be fatal.'),
    (v_case_id, 'What is the preferred site for needle decompression in adults (ATLS 10th ed)?', '["2nd Intercostal space", "4th or 5th Intercostal space, anterior to the midaxillary line", "None", "None"]', 1, 'The lateral approach is now preferred as the chest wall is thinner there.'),
    (v_case_id, 'Is needle decompression definitive treatment?', '["Yes", "No, it must be followed by a formal chest tube", "None", "None"]', 1, 'The needle only relieves the "tension"; the air/blood must still be drained.');

    ---------------------------------------------------------------------------
    -- CASE 12: Lumbar Puncture - Technique (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The LP Procedure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The LP Procedure', 'You are performing an LP on a patient with suspected meningitis.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The LP Procedure', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What anatomical landmark is used to find the L4 interspace?', '["Top of the iliac crests (Tuffier''s line)", "Sacrum", "None", "None"]', 0, 'This line typically crosses the L4 spinous process.'),
    (v_case_id, 'What is the "pop" felt during needle insertion?', '["Skin", "Ligamentum flavum", "Dura", "None"]', 1, 'Passing through the ligamentum flavum often gives a distinct tactile feedback.'),
    (v_case_id, 'In which position must the opening pressure be measured?', '["Sitting up", "Lateral decubitus (lying on side)", "None", "None"]', 1, 'Sitting up gives a falsely high pressure due to gravity.');

    ---------------------------------------------------------------------------
    -- CASE 13: Arthrocentesis (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hot Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hot Joint', 'A patient has a red, swollen, painful knee. You need to aspirate the fluid.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Hot Joint', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary goal of arthrocentesis in the ED?', '["To give steroids", "To rule out septic arthritis", "None", "None"]', 1, 'Septic arthritis is a surgical emergency.'),
    (v_case_id, 'What WBC count in the synovial fluid is concerning for sepsis?', '["1,000", "> 50,000 (with >75% Neutrophils)", "10,000", "None"]', 1, 'High WBC and neutrophil percentage is highly suggestive of infection.'),
    (v_case_id, 'What is the needle approach for a knee aspiration?', '["Anterior", "Superolateral or Mid-patellar", "None", "None"]', 1, 'The space behind the patella is easily accessible from the side.');

    ---------------------------------------------------------------------------
    -- CASE 14: FAST Exam - Ultrasound (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Focused Assessment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Focused Assessment', 'You are performing a FAST exam on a trauma patient.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Focused Assessment', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the 4 standard views of the FAST exam?', '["Head, Neck, Chest, Legs", "Morison''s Pouch (RUQ), Splenorenal (LUQ), Suprapubic (Bladder), and Subxiphoid (Cardiac)", "None", "None"]', 1, 'The exam looks for free intraperitoneal or pericardial fluid.'),
    (v_case_id, 'What is the E-FAST?', '["Extended - includes views of the lungs to look for pneumothorax", "Electronic", "None", "None"]', 0, 'E-FAST adds thoracic views.'),
    (v_case_id, 'Can the FAST exam rule out a retroperitoneal bleed?', '["Yes", "No", "None", "None"]', 1, 'FAST only sees free fluid in the peritoneal cavity, not the retroperitoneum.');

    ---------------------------------------------------------------------------
    -- CASE 15: Nasogastric (NG) Tube (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'NG Tube Placement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'NG Tube Placement', 'A patient with a bowel obstruction needs an NG tube for decompression.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'NG Tube Placement', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you measure the length of the NG tube before insertion?', '["Shoulder to hip", "Tip of nose, to earlobe, to xiphoid process", "None", "None"]', 1, 'NEX (Nose-Ear-Xiphoid) is the standard measurement.'),
    (v_case_id, 'What is the best way to confirm NG tube placement in the ED?', '["Air bolus / auscultation", "Abdominal X-ray", "None", "None"]', 1, 'X-ray is required to ensure the tube isn''t in the lungs before starting feeds or suction.'),
    (v_case_id, 'What is a major contraindication to NG tube placement?', '["Vomiting", "Severe mid-face/basilar skull trauma", "None", "None"]', 1, 'The tube could inadvertently enter the cranial vault.');

    ---------------------------------------------------------------------------
    -- CASE 16: Shoulder Reduction (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dislocated Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dislocated Shoulder', 'A patient has an anterior shoulder dislocation.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Dislocated Shoulder', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is most at risk in an anterior shoulder dislocation?', '["Radial", "Axillary", "Ulnar", "None"]', 1, 'Test sensation over the "sergeant''s patch" area of the deltoid.'),
    (v_case_id, 'What is the "Cunningham" technique?', '["Pulling hard", "A massage-based reduction technique (no traction needed)", "None", "None"]', 1, 'It focuses on relaxing the biceps and shoulder girdle.'),
    (v_case_id, 'What imaging should be done after reduction?', '["None", "Repeat X-rays to confirm placement and check for fractures", "None", "None"]', 1, 'Check for Hill-Sachs or Bankart lesions.');

    ---------------------------------------------------------------------------
    -- CASE 17: Local Anesthesia - Lidocaine (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lidocaine with Epi' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lidocaine with Epi', 'You are suturing a large laceration on the forearm.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lidocaine with Epi', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the maximum dose of Lidocaine WITHOUT epinephrine?', '["1 mg/kg", "4-5 mg/kg (up to ~300mg)", "10 mg/kg", "None"]', 1, 'Epi allows for higher doses (~7mg/kg) because it causes local vasoconstriction and slows absorption.'),
    (v_case_id, 'What is the purpose of adding Epinephrine to local anesthesia?', '["Increase pain", "Reduce bleeding and increase duration of action", "None", "None"]', 1, 'Vasoconstriction keeps the drug local.'),
    (v_case_id, 'Where was it traditionally "forbidden" to use Epinephrine?', '["Chest", "Fingers, toes, nose, and penis", "None", "None"]', 1, 'Modern data suggests it is safer than previously thought, but many still follow this classic rule.');

    ---------------------------------------------------------------------------
    -- CASE 18: Splinting Basics (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Posterior Splint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Posterior Splint', 'You are splinting an ankle fracture.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Posterior Splint', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are splints preferred over casts in the ED?', '["They are cheaper", "To allow for swelling and reduce the risk of compartment syndrome", "None", "None"]', 1, 'Casts are circumferential and don''t expand.'),
    (v_case_id, 'What is the "neutral" position for an ankle splint?', '["Pointed toes", "90 degrees of flexion (dorsiflexion)", "None", "None"]', 1, 'Plantar flexion (pointed toes) can lead to Achilles contracture.'),
    (v_case_id, 'What must be checked before and after splinting?', '["Temperature", "Neurovascular status (Pulse, Sensation, Motor)", "None", "None"]', 1, 'Always document that the "CMS" is intact.');

    ---------------------------------------------------------------------------
    -- CASE 19: Gastric Lavage (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stomach Pumping' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stomach Pumping', 'You are considering gastric lavage for a life-threatening ingestion.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stomach Pumping', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is gastric lavage most effective?', '["Within 1 hour of ingestion", "Within 4 hours", "None", "None"]', 0, 'The benefit decreases rapidly as the drug moves into the small intestine.'),
    (v_case_id, 'What is an absolute contraindication to lavage?', '["Tylenol", "Ingestion of caustics or hydrocarbons", "None", "None"]', 1, 'Lavage can cause further injury or aspiration in these cases.'),
    (v_case_id, 'What must be done for any patient with a reduced mental status before lavage?', '["Wait", "Intubate to protect the airway", "None", "None"]', 1, 'Aspiration risk is extremely high.');

    ---------------------------------------------------------------------------
    -- CASE 20: Paracentesis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ascites Drainage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ascites Drainage', 'A patient with cirrhosis has a very tense, painful abdomen and fever.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ascites Drainage', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary ED indication for paracentesis in this patient?', '["To lose weight", "To rule out Spontaneous Bacterial Peritonitis (SBP)", "None", "None"]', 1, 'SBP has high mortality if untreated.'),
    (v_case_id, 'What is the diagnostic threshold for SBP in the fluid?', '["10 WBC", "> 250 Neutrophils (PMNs)", "None", "None"]', 1, 'PMN count > 250/mm3 is diagnostic.'),
    (v_case_id, 'What should be given if a large volume (> 5L) of fluid is removed?', '["Saline", "IV Albumin (6-8g per liter removed)", "None", "None"]', 1, 'This prevents post-paracentesis circulatory collapse.');

    ---------------------------------------------------------------------------
    -- CASE 21: Cardioversion Technique (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shock Choice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shock Choice', 'You are performing synchronized cardioversion for AFib.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shock Choice', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why must you press the "SYNC" button?', '["To make it faster", "To ensure the shock occurs on the R-wave and not the T-wave", "None", "None"]', 1, 'Synchronization avoids the vulnerable period of repolarization.'),
    (v_case_id, 'What is the typical starting energy for biphasic cardioversion of AFib?', '["10J", "120 to 200 J", "360J", "None"]', 1, 'AFib usually requires more energy than SVT or flutter.'),
    (v_case_id, 'What should you do for the patient before elective cardioversion?', '["Give aspirin", "Sedation and analgesia (e.g., Propofol or Etomidate)", "None", "None"]', 1, 'The procedure is extremely painful.');

    ---------------------------------------------------------------------------
    -- CASE 22: Transcutaneous Pacing (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'External Pacing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'External Pacing', 'A patient has symptomatic bradycardia (HR 30) and Atropine has failed.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'External Pacing', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Electrical Capture"?', '["Feeling a pulse", "A pacer spike followed by a wide QRS complex on the monitor", "None", "None"]', 1, 'Electrical capture does not always mean mechanical capture.'),
    (v_case_id, 'How do you confirm "Mechanical Capture"?', '["Watch the screen", "Feel for a central (femoral) pulse that matches the pacer rate", "None", "None"]', 1, 'Do not rely on the carotid pulse, as the muscle twitching from the pacer can mimic a pulse.'),
    (v_case_id, 'Is transcutaneous pacing a long-term solution?', '["Yes", "No, it is a bridge to transvenous or permanent pacing", "None", "None"]', 1, 'It is very uncomfortable and less reliable than internal pacing.');

    ---------------------------------------------------------------------------
    -- CASE 23: Pericardiocentesis (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Needle to the Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Needle to the Heart', 'You are performing an emergent pericardiocentesis for tamponade.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Needle to the Heart', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Subxiphoid" approach?', '["Through the back", "Needle entered between the xiphoid and left costal margin, aimed at the left shoulder", "None", "None"]', 1, 'This is the traditional blind approach.'),
    (v_case_id, 'What tool is now preferred to guide this procedure?', '["X-ray", "Ultrasound", "CT", "None"]', 1, 'Ultrasound-guided pericardiocentesis is safer and more successful.'),
    (v_case_id, 'What is the EKG sign that your needle is touching the myocardium?', '["T-wave inversion", "ST-segment elevation or \"injury current\"", "None", "None"]', 1, 'Withdraw the needle slightly if this occurs.');

    ---------------------------------------------------------------------------
    -- CASE 24: Bladder Catheterization (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foley Catheter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foley Catheter', 'A patient with urinary retention needs a Foley catheter.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Foley Catheter', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If you meet resistance in an elderly male, what is the most likely cause?', '["Stones", "Benign Prostatic Hyperplasia (BPH)", "None", "None"]', 1, 'Enlarged prostate narrows the urethra.'),
    (v_case_id, 'What type of catheter has a curved tip to bypass an enlarged prostate?', '["Standard Foley", "Coude tip catheter", "Straight cath", "None"]', 1, 'Coude means "elbow" in French; it is designed for BPH.'),
    (v_case_id, 'What is a contraindication to catheterization in a trauma patient?', '["Blood at the meatus or high-riding prostate", "Hematuria", "None", "None"]', 0, 'These are signs of urethral injury; a retrograde urethrogram is needed first.');

    ---------------------------------------------------------------------------
    -- CASE 25: Wound Irrigation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dirty Laceration' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dirty Laceration', 'You are cleaning a dirty wound before suturing.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Dirty Laceration', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important factor in preventing wound infection?', '["Antibiotics", "High-pressure irrigation and debridement", "None", "None"]', 1, '"The solution to pollution is dilution."'),
    (v_case_id, 'What fluid is typically preferred for irrigation?', '["Betadine", "Normal Saline (or even tap water)", "None", "None"]', 1, 'Tap water is as effective as sterile saline for most contaminated wounds.'),
    (v_case_id, 'Why should you avoid putting Betadine INSIDE the wound?', '["It stains", "It is toxic to the healing tissue", "None", "None"]', 1, 'Betadine should only be used on the surrounding skin.');

    ---------------------------------------------------------------------------
    -- CASE 26: Nerve Block - Digital (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Numb Finger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Numb Finger', 'You are performing a digital nerve block for a finger laceration.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Numb Finger', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where do the digital nerves run in the finger?', '["Top and bottom", "Medial and Lateral (sides) along the bone", "None", "None"]', 1, 'Injection is performed at the base of the finger on both sides.'),
    (v_case_id, 'What is a "Ring Block"?', '["A jewelry technique", "Infiltrating anesthesia circumferentially around the base of the digit", "None", "None"]', 1, 'This ensures all small branches are blocked.'),
    (v_case_id, 'How long does it take for Lidocaine to achieve full effect in a digital block?', '["1 minute", "5 to 10 minutes", "None", "None"]', 1, 'Wait for the block to work before starting the procedure.');

    ---------------------------------------------------------------------------
    -- CASE 27: Abscess Incision and Drainage - I&D (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The I&D Procedure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The I&D Procedure', 'You are performing an I&D on a fluctuant abscess.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The I&D Procedure', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines a "fluctuant" mass?', '["Redness", "A palpable wave of fluid suggesting a collection of pus", "None", "None"]', 1, 'Fluctuance indicates that the abscess is ready for drainage.'),
    (v_case_id, 'What is the purpose of "packing" the abscess after drainage?', '["To kill bacteria", "To keep the skin edges open so the cavity can heal from the inside out", "None", "None"]', 1, 'Packing prevents premature skin closure which could lead to re-accumulation.'),
    (v_case_id, 'Which abscesses should NOT be drained by a general ED physician?', '["Buttock", "Those in the \"danger triangle\" of the face or near large vessels", "None", "None"]', 1, 'Facial abscesses can lead to cavernous sinus thrombosis.');

    ---------------------------------------------------------------------------
    -- CASE 28: Intra-aortic Balloon Pump - IABP (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Balloon Support' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Balloon Support', 'A patient in cardiogenic shock is receiving an IABP.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Balloon Support', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When does the IABP balloon inflate?', '["During systole", "During diastole", "None", "None"]', 1, 'Inflation during diastole increases coronary perfusion pressure.'),
    (v_case_id, 'What is the effect of balloon deflation during early systole?', '["Increases workload", "Decreases afterload (creating a vacuum effect)", "None", "None"]', 1, 'This reduces the work the failing heart has to do.'),
    (v_case_id, 'What is a major contraindication to IABP?', '["Heart failure", "Severe Aortic Regurgitation or Aortic Dissection", "None", "None"]', 1, 'Inflating the balloon would worsen the regurgitation into the LV or propagate the dissection.');

    ---------------------------------------------------------------------------
    -- CASE 29: Joint Reduction - Nursemaid''s Elbow (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulled Arm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulled Arm', 'A 2-year-old is brought in refusing to move their arm after being pulled up by the hand.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pulled Arm', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomic injury in Nursemaid''s elbow?', '["Fracture", "Radial head subluxation with entrapment of the annular ligament", "None", "None"]', 1, 'The annular ligament slips into the radiohumeral joint.'),
    (v_case_id, 'What is the reduction maneuver?', '["Pulling", "Supination followed by flexion (or Hyperpronation)", "None", "None"]', 1, 'Hyperpronation is often reported as more successful and less painful.'),
    (v_case_id, 'How do you know the reduction was successful?', '["X-ray", "The child starts using the arm within minutes", "None", "None"]', 1, 'The "click" and return of function are diagnostic.');

    ---------------------------------------------------------------------------
    -- CASE 30: Burn Management - Rule of Nines (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burn Surface Area' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burn Surface Area', 'You are calculating the Total Body Surface Area (TBSA) for a burn patient.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Burn Surface Area', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In an adult, what percentage is assigned to the entire head and neck?', '["4.5%", "9%", "18%", "None"]', 1, 'Front and back of head combined is 9%.'),
    (v_case_id, 'What percentage is assigned to the entire front of the torso?', '["9%", "18%", "36%", "None"]', 1, 'The anterior trunk is 18%.'),
    (v_case_id, 'What is the Parkland Formula for fluid resuscitation in the first 24 hours?', '["1 ml/kg/%TBSA", "4 ml/kg/%TBSA (of Lactated Ringer''s)", "None", "None"]', 1, 'Half of the total is given in the first 8 hours.');

    ---------------------------------------------------------------------------
    -- CASE 31: End-tidal CO2 (EtCO2) Waveforms (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reading the Waves' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reading the Waves', 'You are monitoring the EtCO2 waveform of a ventilated patient.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reading the Waves', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a "shark-fin" EtCO2 waveform indicate?', '["Heart failure", "Bronchospasm (e.g., Asthma/COPD)", "None", "None"]', 1, 'Obstructed airflow causes a prolonged expiratory upstroke.'),
    (v_case_id, 'What does a sudden drop of EtCO2 to near-zero suggest?', '["Fever", "Dislodged tube, circuit disconnection, or cardiac arrest", "None", "None"]', 1, 'Loss of CO2 transport is an emergency.'),
    (v_case_id, 'What happens to EtCO2 during successful CPR (ROSC)?', '["Decreases", "Sudden spike (increase) in EtCO2", "None", "None"]', 1, 'Improved perfusion brings more CO2 to the lungs for elimination.');

    ---------------------------------------------------------------------------
    -- CASE 32: Cricothyrotomy - The "Finger" (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tactile Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tactile Airway', 'You are performing a cricothyrotomy in a bloody field where visualization is impossible.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tactile Airway', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important tactile landmark?', '["Thyroid notch", "Cricothyroid membrane", "None", "None"]', 1, 'The "dip" between the cartilages.'),
    (v_case_id, 'Why is the finger used after the incision?', '["To stop bleeding", "To maintain the tract and confirm tracheal entry", "None", "None"]', 1, 'The finger should never leave the hole until the tube is in.'),
    (v_case_id, 'What size ETT is typically used for a cricothyrotomy?', '["8.0", "6.0 or 6.5", "10.0", "None"]', 1, 'A smaller tube is easier to pass through the cricothyroid membrane.');

    ---------------------------------------------------------------------------
    -- CASE 33: Femoral Line - Landmarks (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The NAVEL' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The NAVEL', 'You are placing a femoral central line.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The NAVEL', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the NAVEL mnemonic stand for (Lateral to Medial)?', '["Nerve, Artery, Vein, Empty space, Lymphatics", "None", "None", "None"]', 0, 'The vein is medial to the femoral artery.'),
    (v_case_id, 'Why is the femoral site less preferred for long-term use?', '["Hard to find", "Highest risk of infection and DVT", "None", "None"]', 1, 'The groin is considered a "dirty" area.'),
    (v_case_id, 'In a cardiac arrest, which central line site is often fastest and easiest?', '["Subclavian", "Femoral", "IJ", "None"]', 1, 'It does not interfere with chest compressions or airway management.');

    ---------------------------------------------------------------------------
    -- CASE 34: Ultrasound - Vessel Identification (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue vs Red' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue vs Red', 'You are using ultrasound to distinguish the carotid artery from the IJ vein.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blue vs Red', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which vessel is easily compressible with the ultrasound probe?', '["Artery", "Vein", "None", "None"]', 1, 'Veins are thin-walled and low-pressure.'),
    (v_case_id, 'Which vessel has a non-pulsatile, varying diameter with respiration?', '["Artery", "Vein", "None", "None"]', 1, 'Arteries have thick walls and distinct pulsations.'),
    (v_case_id, 'What does Color Doppler show in a pulsatile vessel?', '["Static blue", "Phasic or pulsatile color (red/blue depending on direction)", "None", "None"]', 1, 'Doppler detects flow velocity and direction.');

    ---------------------------------------------------------------------------
    -- CASE 35: Retrograde Urethrogram (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Urethral Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Urethral Trauma', 'A trauma patient has blood at the urethral meatus.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Urethral Trauma', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What procedure must be done BEFORE a Foley is placed?', '["CT", "Retrograde Urethrogram (RUG)", "None", "None"]', 1, 'RUG injects contrast into the meatus to check for extravasation (leakage).'),
    (v_case_id, 'What does "extravasation" of contrast mean?', '["Normal", "The urethra is ruptured", "None", "None"]', 1, 'Contrast leaking out confirms a partial or complete tear.'),
    (v_case_id, 'What is the "high-riding prostate" on rectal exam a sign of?', '["Cancer", "Urethral transection/disruption", "None", "None"]', 1, 'The prostate is no longer anchored by the urethra.');

    ---------------------------------------------------------------------------
    -- CASE 36: Gastric Lavage - The Tube (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Large Bore' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Large Bore', 'You are performing gastric lavage for a massive aspirin ingestion.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Large Bore', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of tube is needed for effective lavage?', '["Foley", "Large-bore Orogastric tube (e.g., 36-40 French)", "None", "None"]', 1, 'Small tubes will clog with pill fragments.'),
    (v_case_id, 'What is the volume of fluid used for each "wash" cycle?', '["1 liter", "200 to 300 ml", "None", "None"]', 1, 'Small volumes are used to prevent pushing the drug into the duodenum.'),
    (v_case_id, 'How long do you continue the lavage?', '["1 hour", "Until the return fluid is clear", "None", "None"]', 1, 'Clear return suggests the stomach is empty.');

    ---------------------------------------------------------------------------
    -- CASE 37: Arthrocentesis - Crystals (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Gout vs Pseudogout' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Gout vs Pseudogout', 'You are examining joint fluid under polarized light.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Gout vs Pseudogout', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the finding for Gout?', '["Rhomboid", "Needle-shaped, negatively birefringent crystals", "None", "None"]', 1, 'Monosodium urate crystals are the cause.'),
    (v_case_id, 'What is the finding for Pseudogout (CPPD)?', '["Needle", "Rhomboid-shaped, positively birefringent crystals", "None", "None"]', 1, 'Calcium pyrophosphate crystals.'),
    (v_case_id, 'Can Gout and Septic Arthritis occur at the same time?', '["No", "Yes, \"crystal-proven\" gout does not rule out infection", "None", "None"]', 1, 'Always send the fluid for culture if there is any doubt.');

    ---------------------------------------------------------------------------
    -- CASE 38: Lumbar Puncture - "Traumatic Tap" (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bloody Tube' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bloody Tube', 'During an LP, the first tube is very bloody.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bloody Tube', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish a traumatic tap from a Subarachnoid Hemorrhage (SAH)?', '["Wait", "Check the \"clearing\" of RBCs from tube 1 to tube 4", "None", "None"]', 1, 'RBCs decrease in a traumatic tap but remain constant in SAH.'),
    (v_case_id, 'What is "Xanthochromia"?', '["Yellow skin", "Yellowish appearance of centrifuged CSF due to breakdown of RBCs (bilirubin)", "None", "None"]', 1, 'Xanthochromia suggests blood has been present for hours (confirming true SAH).'),
    (v_case_id, 'Can you use a "corrected" WBC count in a traumatic tap?', '["No", "Yes, typically 1 WBC for every 500-1000 RBCs", "None", "None"]', 1, 'This helps determine if the patient has meningitis despite the traumatic blood.');

    ---------------------------------------------------------------------------
    -- CASE 39: Intraosseous - Humerus vs Tibia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Humerus IO' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Humerus IO', 'You are placing a humeral IO in a patient in cardiac arrest.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Humerus IO', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an advantage of the humerus site over the tibia?', '["Easier to find", "Higher flow rates (closer to the heart)", "None", "None"]', 1, 'Flow rates in the humerus can rival those of central lines.'),
    (v_case_id, 'What is the anatomic landmark for the proximal humerus IO?', '["Mid-arm", "Greater tuberosity (2cm below the acromion)", "None", "None"]', 1, 'The arm must be internally rotated.'),
    (v_case_id, 'Is the humerus IO preferred in an awake patient?', '["Yes", "No, it is often more painful than the tibia", "None", "None"]', 1, 'The tibia is usually the first choice for conscious patients.');

    ---------------------------------------------------------------------------
    -- CASE 40: Chest Tube - Suction vs Water Seal (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pleurovac' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pleurovac', 'You have connected the chest tube to a drainage system.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pleurovac', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of the "Water Seal"?', '["To clean the tube", "To allow air out of the chest but not back in (one-way valve)", "None", "None"]', 1, 'This allows the lung to re-expand.'),
    (v_case_id, 'What does persistent "bubbling" in the water seal chamber indicate?', '["Normal", "An air leak (either from the lung or the tubing)", "None", "None"]', 1, 'Continuous bubbling suggests the lung hasn''t sealed or there is a hole in the system.'),
    (v_case_id, 'What is "Tidaling"?', '["Ocean waves", "The rise and fall of the water level with respiration", "None", "None"]', 1, 'Tidaling confirms the tube is patent and in the pleural space.');

    ---------------------------------------------------------------------------
    -- CASE 41: Laceration Repair - Suture Types (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stitches' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stitches', 'You are choosing sutures for a facial laceration.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stitches', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What size suture is standard for the face?', '["3-0", "6-0", "1-0", "None"]', 1, 'Higher numbers indicate thinner material, which reduces scarring.'),
    (v_case_id, 'What is the difference between Vicryl and Nylon?', '["Vicryl is absorbable; Nylon is non-absorbable", "None", "None", "None"]', 0, 'Vicryl is used for deep (subcutaneous) layers; Nylon for skin.'),
    (v_case_id, 'How long should sutures stay in on the face?', '["14 days", "3 to 5 days", "None", "None"]', 1, 'Early removal on the face prevents "railroad track" scarring.');

    ---------------------------------------------------------------------------
    -- CASE 42: Laceration Repair - Staples (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scalp Cut' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scalp Cut', 'A patient has a 10cm linear scalp laceration.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Scalp Cut', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the fastest way to close this wound?', '["Sutures", "Skin Staples", "Glue", "None"]', 1, 'Staples are very fast and effective for the scalp.'),
    (v_case_id, 'Where should staples NOT be used?', '["Legs", "Face, hands, or feet", "None", "None"]', 1, 'Cosmetic outcomes and patient comfort are better with sutures in these areas.'),
    (v_case_id, 'Do staples have a higher infection rate than sutures?', '["Yes", "No, they are generally equivalent in the scalp", "None", "None"]', 1, 'Proper irrigation is more important than the closure method.');

    ---------------------------------------------------------------------------
    -- CASE 43: Dermabond - Skin Glue (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Liquid Stitches' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Liquid Stitches', 'You are using tissue adhesive (Dermabond) for a small, clean laceration.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Liquid Stitches', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which wounds are best suited for glue?', '["Jagged dirty wounds", "Clean, straight, low-tension wounds", "None", "None"]', 1, 'Glue is not strong enough for wounds under high tension.'),
    (v_case_id, 'Can you put glue INSIDE the wound?', '["Yes", "No, only apply to the apposed skin edges", "None", "None"]', 1, 'Glue inside the wound prevents healing and acts as a foreign body.'),
    (v_case_id, 'Does the patient need to come back for "glue removal"?', '["Yes", "No, it sloughs off on its own in 5-10 days", "None", "None"]', 1, 'This is a major advantage for pediatric patients.');

    ---------------------------------------------------------------------------
    -- CASE 44: I&D - Packing Material (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gauze Strip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gauze Strip', 'You are packing an abscess cavity with Iodoform gauze.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Gauze Strip', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How tightly should the cavity be packed?', '["Extremely tight", "Loosely (to avoid tissue ischemia)", "None", "None"]', 1, 'Over-packing can cause pain and necrotic changes.'),
    (v_case_id, 'What is the purpose of "Iodoform" in the gauze?', '["To numb the pain", "It has mild antiseptic properties", "None", "None"]', 1, 'Though plain gauze is also commonly used.'),
    (v_case_id, 'When should the packing be changed or removed?', '["7 days", "24 to 48 hours", "None", "None"]', 1, 'Abscesses require frequent wound care initially.');

    ---------------------------------------------------------------------------
    -- CASE 45: Pericardiocentesis - Complications (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Needle Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Needle Risk', 'You are performing a subxiphoid pericardiocentesis.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Needle Risk', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common serious complication of this procedure?', '["Pneumonia", "Laceration of the right ventricle or coronary artery", "None", "None"]', 1, 'The RV is the most anterior chamber and easily hit.'),
    (v_case_id, 'What is a "Liver Laceration"?', '["Normal", "A complication of a subxiphoid approach that goes too deep or too inferior", "None", "None"]', 1, 'The needle must stay close to the posterior surface of the xiphoid.'),
    (v_case_id, 'What is the "Bubble Test" (Agitated Saline)?', '["Testing for soap", "Using ultrasound to confirm the needle/catheter is in the pericardial space by injecting bubbles", "None", "None"]', 1, 'This confirms you are in the fluid and not in a heart chamber.');

    ---------------------------------------------------------------------------
    -- CASE 46: Difficult Airway - "Can''t Vent" (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rescue Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rescue Airway', 'Intubation has failed and you cannot provide effective bag-mask ventilation.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rescue Airway', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Supraglottic" rescue device?', '["ETT", "Laryngeal Mask Airway (LMA) or King LT", "None", "None"]', 1, 'These devices are placed blindly and sit above the glottis to provide ventilation.'),
    (v_case_id, 'Does an LMA protect against aspiration?', '["Yes", "No, it is not a definitive airway", "None", "None"]', 1, 'The only definitive airway is a cuffed tube in the trachea.'),
    (v_case_id, 'What is the final step if rescue devices fail?', '["Give more drugs", "Cricothyrotomy", "None", "None"]', 1, 'This is the surgical endpoint of the difficult airway algorithm.');

    ---------------------------------------------------------------------------
    -- CASE 47: Central Line - Ultrasound Technique (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dynamic View' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dynamic View', 'You are placing an IJ CVC using real-time ultrasound guidance.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Dynamic View', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Short Axis" view?', '["Longitudinal", "Transverse (vessels appear as circles)", "None", "None"]', 1, 'Short axis is easiest for identifying landmarks.'),
    (v_case_id, 'What is the "Long Axis" view?', '["Transverse", "Longitudinal (vessel appears as a tube)", "None", "None"]', 1, 'Long axis allows for visualization of the entire needle length.'),
    (v_case_id, 'What does "In-plane" vs "Out-of-plane" refer to?', '["Patient position", "Whether the needle is aligned with the ultrasound beam", "None", "None"]', 1, 'In-plane shows the whole needle; out-of-plane shows only the tip as a dot.');

    ---------------------------------------------------------------------------
    -- CASE 48: Local Anesthesia - Bupivacaine (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Long Acting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Long Acting', 'You are choosing a local anesthetic for a procedure that will take 2 hours.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Long Acting', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a major advantage of Bupivacaine (Marcaine) over Lidocaine?', '["Faster onset", "Much longer duration of action (4-8 hours)", "None", "None"]', 1, 'Bupivacaine is ideal for long procedures and post-op pain control.'),
    (v_case_id, 'What is the onset of action for Bupivacaine?', '["Instant", "Slower than lidocaine (up to 10-20 min)", "None", "None"]', 1, 'Lidocaine works much faster.'),
    (v_case_id, 'What is the most dangerous toxicity of Bupivacaine?', '["Rash", "Cardiotoxicity (refractory arrhythmias/arrest)", "None", "None"]', 1, 'Accidental IV injection of bupivacaine is extremely dangerous.');

    ---------------------------------------------------------------------------
    -- CASE 49: Lumbar Puncture - Positioning (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fetal Position' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fetal Position', 'You are positioning a patient for an LP.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fetal Position', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is "maximal flexion" of the spine required?', '["To hide", "To open the interspinous spaces", "None", "None"]', 1, 'Flexion separates the spinous processes for easier entry.'),
    (v_case_id, 'What should the patient avoid doing during the procedure?', '["Breathing", "Straining or Valsalva (which increases CSF pressure)", "None", "None"]', 1, 'Straining makes the opening pressure reading inaccurate.'),
    (v_case_id, 'Is the "bedside" LP safe in a patient with an artificial heart valve on heparin?', '["Yes", "No, due to risk of spinal hematoma", "None", "None"]', 1, 'Coagulopathy is a major contraindication for LP.');

    ---------------------------------------------------------------------------
    -- CASE 50: Gastric Lavage - Aspiration (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lavage Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lavage Risk', 'You are performing lavage and the patient starts coughing and gagging.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Lavage Risk', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most serious complication of gastric lavage?', '["Nausea", "Aspiration pneumonitis", "None", "None"]', 1, 'Liquid and stomach contents entering the lungs is life-threatening.'),
    (v_case_id, 'What position should the patient be in for lavage?', '["Supine", "Left lateral decubitus with head down (Trendelenburg)", "None", "None"]', 1, 'This position helps prevent aspirated material from entering the trachea.'),
    (v_case_id, 'Is gastric lavage used frequently in modern toxicology?', '["Yes", "No, it is rarely indicated and usually replaced by activated charcoal", "None", "None"]', 1, 'The "standard of care" has shifted away from lavage for most ingestions.');

    RAISE NOTICE 'SUCCESS: 50 Procedural Skill Case Blocks registered.';
END $$;

COMMIT;
