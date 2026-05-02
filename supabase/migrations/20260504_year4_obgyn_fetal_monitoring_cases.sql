BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Fetal monitoring & obstetric emergencies
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-fetal-monitoring" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: FHR Baseline (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fetal Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fetal Tachycardia', 'A patient in active labor at 39 weeks has a fetal heart rate (FHR) baseline of 175 bpm for the last 15 minutes. Maternal temperature is 101.2 F.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in active labor at 39 weeks has a fetal heart rate (FHR) baseline of 175 bpm for the last 15 minutes. Maternal temperature is 101.2 F.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of fetal tachycardia?', '["Baseline > 140 bpm", "Baseline > 160 bpm for > 10 minutes", "Baseline > 180 bpm", "Baseline > 150 bpm"]', 1, 'FHR > 160 for at least 10 minutes is defined as tachycardia.'),
    (v_case_id, 'What is the most common cause of fetal tachycardia in this scenario?', '["Fetal hypoxia", "Maternal fever/infection (Chorioamnionitis)", "Fetal heart block", "Maternal hypothyroidism"]', 1, 'Maternal fever is a very common cause of increased fetal baseline.'),
    (v_case_id, 'What is the definition of fetal bradycardia?', '["Baseline < 110 bpm for > 10 minutes", "Baseline < 120 bpm", "Baseline < 100 bpm", "Baseline < 90 bpm"]', 0, 'Baseline < 110 for at least 10 minutes is bradycardia.');

    ---------------------------------------------------------------------------
    -- CASE 02: FHR Variability (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Understanding Variability' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Understanding Variability', 'The FHR tracing shows fluctuations in the baseline that are consistently between 6 and 25 bpm.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The FHR tracing shows fluctuations in the baseline that are consistently between 6 and 25 bpm.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this level of variability categorized?', '["Absent", "Minimal", "Moderate", "Marked"]', 2, 'Moderate variability (6-25 bpm) is a highly reliable sign of an oxygenated, non-acidotic fetus.'),
    (v_case_id, 'What is \"Minimal\" variability?', '["Undetectable", "Amplitude <= 5 bpm", "Amplitude > 25 bpm", "None"]', 1, 'Minimal variability is defined as a range of 1 to 5 bpm.'),
    (v_case_id, 'Which of the following can cause temporary minimal variability that is NOT pathological?', '["Maternal smoking", "Fetal sleep cycle (usually < 20-40 minutes)", "Fetal death", "Placental abruption"]', 1, 'Fetal sleep is a common reason for temporary loss of moderate variability.');

    ---------------------------------------------------------------------------
    -- CASE 03: Accelerations (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reactive Tracing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reactive Tracing', 'A patient at 38 weeks is undergoing a Non-Stress Test (NST). The tracing shows two increases in FHR of 15 bpm above baseline, lasting 15 seconds each, within a 20-minute window.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 38 weeks is undergoing a Non-Stress Test (NST). The tracing shows two increases in FHR of 15 bpm above baseline, lasting 15 seconds each, within a 20-minute window.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this NST reactive or non-reactive?', '["Reactive", "Non-reactive", "Indeterminate", "Unsatisfactory"]', 0, 'For fetuses > 32 weeks, 15x15 accelerations define a reactive NST.'),
    (v_case_id, 'What is the criteria for accelerations in a fetus < 32 weeks?', '["15 bpm for 15 seconds", "10 bpm for 10 seconds", "5 bpm for 5 seconds", "No accelerations allowed"]', 1, 'Premature fetuses use the 10x10 rule.'),
    (v_case_id, 'What should be done if an NST is non-reactive after 40 minutes of monitoring?', '["Immediate C-section", "Proceed to further testing (e.g., Biophysical Profile or CST)", "Discharge home", "Repeat in 1 week"]', 1, 'A non-reactive NST requires backup testing to assess fetal well-being.');

    ---------------------------------------------------------------------------
    -- CASE 04: Early Decelerations (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Head Compression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Head Compression', 'A patient is 9 cm dilated. The FHR shows gradual decreases that mirror the contractions exactly, starting with the contraction and returning to baseline when the contraction ends.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is 9 cm dilated. The FHR shows gradual decreases that mirror the contractions exactly, starting with the contraction and returning to baseline when the contraction ends.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this FHR pattern?', '["Late decelerations", "Early decelerations", "Variable decelerations", "Sinusoidal"]', 1, 'Early decelerations are \"synchronous\" with contractions.'),
    (v_case_id, 'What is the physiological cause of early decelerations?', '["Uteroplacental insufficiency", "Umbilical cord compression", "Fetal head compression (vagal response)", "Fetal anemia"]', 2, 'Head compression is benign and does not indicate fetal distress.'),
    (v_case_id, 'What is the management of early decelerations?', '["Oxygen and IV fluids", "Change maternal position", "None (observation only)", "Immediate C-section"]', 2, 'No intervention is needed for early decelerations.');

    ---------------------------------------------------------------------------
    -- CASE 05: Variable Decelerations (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cord Compression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cord Compression', 'The FHR shows abrupt decreases (>= 15 bpm) that vary in timing relative to contractions, often looking like a \"V\" shape.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The FHR shows abrupt decreases (>= 15 bpm) that vary in timing relative to contractions, often looking like a \"V\" shape.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of variable decelerations?', '["Head compression", "Umbilical cord compression", "Placental insufficiency", "Maternal fever"]', 1, 'Variable = Cord compression.'),
    (v_case_id, 'What is the first-line management for recurrent variable decelerations?', '["Maternal position change (e.g., left lateral)", "Amnioinfusion (if due to oligohydramnios)", "Oxygen", "Both A and B"]', 3, 'Position changes and amnioinfusion (replacing fluid around the cord) are standard treatments.'),
    (v_case_id, 'Variable decelerations that are deep, long, and associated with poor variability are called:', '["Early", "Late", "Atypical or Severe variables", "Normal"]', 2, 'Severe variables are concerning for fetal acidemia.');

    ---------------------------------------------------------------------------
    -- CASE 06: Late Decelerations (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Placental Insufficiency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Placental Insufficiency', 'A patient with pre-eclampsia has FHR decelerations that begin AFTER the peak of the contraction and return to baseline only after the contraction is over.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with pre-eclampsia has FHR decelerations that begin AFTER the peak of the contraction and return to baseline only after the contraction is over.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this FHR pattern?', '["Early decelerations", "Late decelerations", "Variable decelerations", "Prolonged decelerations"]', 1, 'Late decelerations are \"delayed\" relative to the contraction.'),
    (v_case_id, 'What is the pathophysiology behind late decelerations?', '["Head compression", "Uteroplacental insufficiency (hypoxia)", "Cord prolapse", "Fetal sleep"]', 1, 'Late decelerations indicate the fetus is struggling to maintain oxygenation during the stress of a contraction.'),
    (v_case_id, 'Which of the following is part of \"Intrauterine Resuscitation\" for late decelerations?', '["Stop Oxytocin (Pitocin)", "IV fluid bolus and Maternal Left Lateral position", "Oxygen administration", "All of the above"]', 3, 'Resuscitation aims to maximize uterine blood flow and oxygen delivery.');

    ---------------------------------------------------------------------------
    -- CASE 07: Sinusoidal Pattern (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sinusoidal Fetal Heart Rate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sinusoidal Fetal Heart Rate', 'The FHR monitor shows a smooth, sine-wave-like undulating pattern at 140 bpm with 0 variability.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The FHR monitor shows a smooth, sine-wave-like undulating pattern at 140 bpm with 0 variability.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning association with a sinusoidal FHR pattern?', '["Fetal sleep", "Severe fetal anemia (e.g., from Rh alloimmunization or abruption)", "Maternal sedation", "Normal labor"]', 1, 'A true sinusoidal pattern is a Category III tracing and often means the fetus is severely anemic or acidotic.'),
    (v_case_id, 'What is a \"Pseudo-sinusoidal\" pattern often caused by?', '["Narcotic administration (e.g., Stadol or Morphine)", "Fetal anemia", "Twins", "Head compression"]', 0, 'Narcotics can cause a temporary, benign undulating pattern.'),
    (v_case_id, 'A sinusoidal pattern is classified as which NICHD Category?', '["Category I", "Category II", "Category III", "Category IV"]', 2, 'It is an abnormal (Category III) tracing.');

    ---------------------------------------------------------------------------
    -- CASE 08: NICHD Categories (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'EFM Categorization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'EFM Categorization', 'A tracing shows: Baseline 140, Moderate variability, Accelerations present, NO late or variable decelerations.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A tracing shows: Baseline 140, Moderate variability, Accelerations present, NO late or variable decelerations.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this tracing categorized?', '["Category I (Normal)", "Category II (Indeterminate)", "Category III (Abnormal)", "Uninterpretable"]', 0, 'Category I requires baseline 110-160, moderate variability, and no concerning decelerations.'),
    (v_case_id, 'What is the definition of a Category III tracing?', '["Minimal variability", "Absent variability PLUS either recurrent lates, recurrent variables, or bradycardia", "Tachycardia only", "Occasional early decelerations"]', 1, 'Category III implies a high risk of fetal acidemia.'),
    (v_case_id, 'Where do the vast majority of intrapartum tracings fall?', '["Category I", "Category II", "Category III", "Category IV"]', 1, 'Category II is the largest group and requires ongoing evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 09: Fetal Scalp Stimulation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing Fetal Reserve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing Fetal Reserve', 'A Category II tracing shows minimal variability. The physician performs a digital exam and tickles the fetal scalp.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A Category II tracing shows minimal variability. The physician performs a digital exam and tickles the fetal scalp.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a reassuring response to fetal scalp stimulation?', '["A deceleration", "A fetal heart rate acceleration", "Fetal movement only", "No response"]', 1, 'An acceleration in response to scalp stim (or acoustic stim) rules out fetal metabolic acidemia.'),
    (v_case_id, 'If the fetus accelerates after scalp stim, what is the predicted fetal pH?', '["< 7.00", "> 7.20", "Exactly 7.40", "Unpredictable"]', 1, 'Scalp stim is a great non-invasive way to confirm the fetus is not acidotic.'),
    (v_case_id, 'When is fetal scalp stimulation CONTRAINDICATED?', '["Placenta previa", "Active vaginal bleeding", "Unruptured membranes (you can use acoustic stim instead)", "All of the above"]', 3, 'You cannot stimulate the scalp if you cannot touch it safely.');

    ---------------------------------------------------------------------------
    -- CASE 10: Biophysical Profile - BPP (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'BPP Scoring' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'BPP Scoring', 'A BPP is performed. The fetus has: Reactive NST (2 points), 3 gross body movements (2 points), 1 episode of 30s breathing (2 points), and Flexion/Extension of limbs (2 points). AFI is 4 cm (0 points).', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A BPP is performed. The fetus has: Reactive NST (2 points), 3 gross body movements (2 points), 1 episode of 30s breathing (2 points), and Flexion/Extension of limbs (2 points). AFI is 4 cm (0 points).', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the total BPP score for this fetus?', '["6/10", "8/10", "10/10", "4/10"]', 1, 'The score is 8/10 because of the low amniotic fluid (oligohydramnios).'),
    (v_case_id, 'What are the 5 components of a BPP?', '["NST, Breathing, Movement, Tone, and Amniotic Fluid Volume", "NST, HR, BP, Glucose, Fluid", "Weight, Length, Movement, Tone, HR", "None"]', 0, 'Each component is worth 2 points (all or none).'),
    (v_case_id, 'What is the management for a BPP score of 4/10 at 38 weeks?', '["Repeat in 1 week", "Discharge", "Delivery (Induction of labor)", "Strict bed rest"]', 2, 'A score of 4 or less is concerning for chronic hypoxia and usually warrants delivery.');

    ---------------------------------------------------------------------------
    -- CASE 11: Shoulder Dystocia - Initial Steps (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Turtle Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Turtle Sign', 'During delivery of the head, it retracts back against the perineum (Turtle Sign). The shoulders do not deliver with gentle traction.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During delivery of the head, it retracts back against the perineum (Turtle Sign). The shoulders do not deliver with gentle traction.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the very FIRST thing the provider should do once shoulder dystocia is identified?', '["Pull harder", "Stop pushing, call for help, and perform McRoberts maneuver", "Immediately perform Zavanelli", "Cut an episiotomy"]', 1, 'Stopping maternal pushing prevents further impaction while maneuvers are prepared.'),
    (v_case_id, 'What does the McRoberts maneuver involve?', '["Pushing on the fundus", "Hyperflexion of the maternal hips against the abdomen", "Pushing on the pubic bone", "Turning the mother over"]', 1, 'McRoberts flattens the sacral promontory and rotates the symphysis pubis cephalad.'),
    (v_case_id, 'Should FUNDAL pressure be used in shoulder dystocia?', '["Yes, to help push the baby out", "No, it is strictly contraindicated as it further impacts the shoulder against the pubic bone"]', 1, 'Fundal pressure is dangerous in shoulder dystocia and can lead to uterine rupture.');

    ---------------------------------------------------------------------------
    -- CASE 12: Shoulder Dystocia - Maneuvers (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Freeing the Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Freeing the Shoulder', 'McRoberts and suprapubic pressure have failed. The provider now places fingers behind the fetal shoulder to rotate it.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'McRoberts and suprapubic pressure have failed. The provider now places fingers behind the fetal shoulder to rotate it.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Woods Screw\" maneuver?', '["Rotating the posterior shoulder 180 degrees", "Pushing on the anterior shoulder", "Breaking the clavicle", "Pushing the head back in"]', 0, 'This rotates the fetus like a screw to find a wider pelvic diameter.'),
    (v_case_id, 'What is a Rubin II maneuver?', '["Pressure on the posterior surface of the anterior shoulder to ADDUCT the shoulders", "Pressure on the pubic bone", "Pulling the arm", "None"]', 0, 'Adduction of the shoulders reduces the bisacromial diameter.'),
    (v_case_id, 'What is the most common maternal complication of shoulder dystocia?', '["Diabetes", "Postpartum Hemorrhage (PPH)", "Heart failure", "Pneumonia"]', 1, 'PPH occurs in ~11% of cases due to uterine atony or trauma.');

    ---------------------------------------------------------------------------
    -- CASE 13: Shoulder Dystocia - Last Resort (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Extreme Measures' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Extreme Measures', 'All internal maneuvers have failed. The fetal heart rate is dropping. The provider decides to push the fetal head back into the vagina for C-section.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'All internal maneuvers have failed. The fetal heart rate is dropping. The provider decides to push the fetal head back into the vagina for C-section.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this maneuver called?', '["Woods screw", "Zavanelli maneuver", "McRoberts", "Rubin I"]', 1, 'The Zavanelli is a high-risk last resort for shoulder dystocia.'),
    (v_case_id, 'What is the most significant FETAL risk of shoulder dystocia?', '["Macrosomia", "Brachial Plexus injury (e.g., Erb''s palsy)", "Cleft lip", "Diabetes"]', 1, 'Stretching of the C5-C6 roots can lead to permanent paralysis.'),
    (v_case_id, 'Which fetal bone is most commonly intentionally fractured to resolve dystocia?', '["Femur", "Clavicle", "Humerus", "Skull"]', 1, 'Deliberate fracture of the clavicle can reduce the shoulder diameter.');

    ---------------------------------------------------------------------------
    -- CASE 14: Umbilical Cord Prolapse (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Emergency: Cord Prolapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Emergency: Cord Prolapse', 'Following spontaneous rupture of membranes, a loop of cord is felt in the vagina. The FHR baseline drops to 60 bpm.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following spontaneous rupture of membranes, a loop of cord is felt in the vagina. The FHR baseline drops to 60 bpm.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management?', '["Pull on the cord", "Place hand in vagina, elevate the presenting part off the cord, and call for emergency C-section", "Wait for labor", "Give oxygen only"]', 1, 'Manual elevation of the head must be maintained all the way to the OR.'),
    (v_case_id, 'Which fetal presentation is a major risk factor for cord prolapse?', '["Cephalic", "Footling Breech or Transverse lie", "Face presentation", "None"]', 1, 'Malpresentations do not "plug" the cervix, allowing the cord to slip through.'),
    (v_case_id, 'What maternal position can help gravity keep the head off the cord while waiting for surgery?', '["Trendelenburg or Knee-chest position", "Prone", "Sitting up", "Walking"]', 0, 'These positions use gravity to help relieve cord compression.');

    ---------------------------------------------------------------------------
    -- CASE 15: Uterine Rupture (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Catastrophic Uterine Rupture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Catastrophic Uterine Rupture', 'A patient undergoing a trial of labor after cesarean (TOLAC) suddenly has intense abdominal pain. The fetal head, which was at 0 station, is now no longer palpable on exam.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient undergoing a trial of labor after cesarean (TOLAC) suddenly has intense abdominal pain. The fetal head, which was at 0 station, is now no longer palpable on exam.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common clinical sign of uterine rupture?', '["Pain", "Abnormal fetal heart rate tracing (e.g., prolonged deceleration)", "Vaginal bleeding", "Fever"]', 1, 'FHR changes are the most sensitive sign of rupture.'),
    (v_case_id, 'What is the sign where the presenting part \"recedes\" back into the pelvis/abdomen?', '["Turtle sign", "Loss of station", "Lightning", "Chadwick sign"]', 1, 'Recession of the presenting part is a classic finding of complete rupture.'),
    (v_case_id, 'What is the most significant risk factor for uterine rupture?', '["Prior Cesarean section or uterine surgery (e.g., myomectomy)", "Diabetes", "Twins", "Smoking"]', 0, 'A scarred uterus is the primary risk factor.');

    ---------------------------------------------------------------------------
    -- CASE 16: PPH - Uterine Atony (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Hemorrhage: Tone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Hemorrhage: Tone', 'A G5P5 patient just delivered. She has heavy vaginal bleeding. On exam, the uterus feels \"boggy\" and is located above the umbilicus.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A G5P5 patient just delivered. She has heavy vaginal bleeding. On exam, the uterus feels \"boggy\" and is located above the umbilicus.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of PPH?', '["Tissue (retained placenta)", "Trauma (lacerations)", "Tone (uterine atony)", "Thrombin (coagulopathy)"]', 2, 'Atony (failure of the uterus to contract) causes ~70-80% of PPH.'),
    (v_case_id, 'What is the immediate FIRST step in management?', '["Give blood", "Bimanual uterine massage and IV Oxytocin", "Call for hysterectomy", "D&C"]', 1, 'Massage and uterotonics are the first line for atony.'),
    (v_case_id, 'Why is multiparity a risk factor for atony?', '["The uterus is tired and overdistended", "The mother is older", "It is not a risk factor", "None"]', 0, 'Grand multiparity and overdistension (twins, polyhydramnios) increase atony risk.');

    ---------------------------------------------------------------------------
    -- CASE 17: PPH - Methergine Contraindication (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterotonic Safety' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterotonic Safety', 'A patient with chronic hypertension and pre-eclampsia is having a PPH due to atony. Oxytocin has not stopped the bleeding.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with chronic hypertension and pre-eclampsia is having a PPH due to atony. Oxytocin has not stopped the bleeding.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medication is CONTRAINDICATED in this hypertensive patient?', '["Misoprostol (Cytotec)", "Methylergonovine (Methergine)", "Carboprost (Hemabate)", "Oxytocin"]', 1, 'Methergine is an ergot alkaloid that causes vasoconstriction and can trigger a hypertensive crisis or stroke.'),
    (v_case_id, 'What is the route of administration for Methergine?', '["IV bolus", "Intramuscular (IM)", "Oral only", "Rectal"]', 1, 'Methergine should NEVER be given IV as it causes sudden severe hypertension.'),
    (v_case_id, 'How does Methergine work?', '["Uterine relaxation", "Sustained tetanic uterine contraction", "Blood thinning", "Lowering heart rate"]', 1, 'It induces a strong, continuous contraction of the myometrium.');

    ---------------------------------------------------------------------------
    -- CASE 18: PPH - Hemabate Contraindication (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Asthma and Hemorrhage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Asthma and Hemorrhage', 'A patient with severe persistent asthma is having a PPH. Bimanual massage is ongoing.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with severe persistent asthma is having a PPH. Bimanual massage is ongoing.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medication is CONTRAINDICATED in this asthmatic patient?', '["Methylergonovine (Methergine)", "Carboprost (Hemabate/PGF2-alpha)", "Misoprostol (Cytotec)", "Oxytocin"]', 1, 'Hemabate (a prostaglandin) can cause significant bronchoconstriction.'),
    (v_case_id, 'What is a very common (though non-harmful) side effect of Hemabate?', '["Rash", "Severe diarrhea", "Hair loss", "Deafness"]', 1, 'Diarrhea is extremely common with prostaglandin uterotonics.'),
    (v_case_id, 'Which uterotonic can be given rectally for PPH?', '["Oxytocin", "Methergine", "Misoprostol (Cytotec)", "Hemabate"]', 2, 'Misoprostol is often given rectally (800-1000 mcg) in emergency PPH.');

    ---------------------------------------------------------------------------
    -- CASE 19: Amniotic Fluid Embolism - AFE (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Collapse in Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Collapse in Labor', 'During active labor, a patient suddenly becomes dyspneic, cyanotic, and hypotensive. This is rapidly followed by generalized seizures and profuse bleeding from IV sites.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During active labor, a patient suddenly becomes dyspneic, cyanotic, and hypotensive. This is rapidly followed by generalized seizures and profuse bleeding from IV sites.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic \"triad\" of AFE?', '["Fever, Rash, Pain", "Hypoxia, Hypotension, and Coagulopathy (DIC)", "High BP, Seizures, Edema", "Nausea, Vomiting, Headache"]', 1, 'AFE is an anaphylactoid-like reaction to amniotic fluid entering maternal circulation.'),
    (v_case_id, 'What is the mortality rate for maternal AFE?', '["1%", "Up to 60-80%", "0%", "10%"]', 1, 'AFE is one of the deadliest conditions in obstetrics.'),
    (v_case_id, 'What is the primary treatment for AFE?', '["Antibiotics", "Aggressive supportive care (A-OK protocol: Atropine, Ondansetron, Ketorolac)", "Immediate delivery", "Antivirals"]', 1, 'Management is purely supportive of hemodynamics and coagulation.');

    ---------------------------------------------------------------------------
    -- CASE 20: Inverted Uterus (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-delivery Inversion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-delivery Inversion', 'Following the delivery of the placenta with strong cord traction, a large, beefy red mass is noted protruding from the vagina. The fundus is not palpable.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following the delivery of the placenta with strong cord traction, a large, beefy red mass is noted protruding from the vagina. The fundus is not palpable.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Placenta previa", "Uterine Inversion", "Cervical cancer", "Prolapsed fibroid"]', 1, 'Inversion is often caused by excessive traction on the umbilical cord before placental separation.'),
    (v_case_id, 'What is the FIRST step in management?', '["Remove the placenta immediately", "Attempt manual replacement of the uterus (Johnson maneuver) BEFORE removing the placenta", "Give Methergine", "Do nothing"]', 1, 'Removing the placenta first will cause catastrophic hemorrhage; the uterus must be replaced first.'),
    (v_case_id, 'Which medication may be needed to RELAX the uterus for replacement?', '["Oxytocin", "Nitroglycerin or Terbutaline", "Methergine", "Hemabate"]', 1, 'Uterine relaxants are needed to get the "doughnut" of the cervix to open so the fundus can be pushed back through.');

    ---------------------------------------------------------------------------
    -- CASE 21: Placenta Accreta Spectrum (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Morbidly Adherent Placenta' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Morbidly Adherent Placenta', 'Following a vaginal delivery, the placenta has not delivered after 30 minutes despite traction and massage. Attempts at manual removal find no plane of cleavage.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following a vaginal delivery, the placenta has not delivered after 30 minutes despite traction and massage. Attempts at manual removal find no plane of cleavage.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Placenta Accreta?', '["Placenta attached to the decidua", "Placenta attached directly to the myometrium (absent Nitabuch''s layer)", "Placenta through the myometrium", "Placenta through the serosa"]', 1, 'Accreta is the most common of the spectrum.'),
    (v_case_id, 'What is \"Placenta Percreta\"?', '["Villi invade through the serosa into adjacent organs (e.g., bladder)", "Villi into the myometrium", "Normal placenta", "Small placenta"]', 0, 'Percreta is the most severe form.'),
    (v_case_id, 'What is the primary risk factor for accreta?', '["Prior C-section + current placenta previa", "Smoking", "Age", "Diabetes"]', 0, 'A prior scar with a previa over it has a very high risk of accreta.');

    ---------------------------------------------------------------------------
    -- CASE 22: Vacuum Extraction Complications (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Instrumental Delivery Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Instrumental Delivery Risks', 'A vacuum extraction is performed. The newborn has a soft, fluctuant mass on the head that CROSSES the suture lines.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A vacuum extraction is performed. The newborn has a soft, fluctuant mass on the head that CROSSES the suture lines.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning diagnosis for a mass crossing suture lines?', '["Cephalohematoma", "Subgaleal hemorrhage", "Caput succedaneum", "Skull fracture"]', 1, 'Subgaleal hemorrhage is an emergency as the baby can bleed their entire blood volume into that space.'),
    (v_case_id, 'What is a \"Cephalohematoma\"?', '["Bleeding under the periosteum that does NOT cross suture lines", "Bleeding under the skin", "A brain tumor", "None"]', 0, 'Cephalohematomas are limited by the periosteum of the individual skull bones.'),
    (v_case_id, 'What is a common maternal complication of operative vaginal delivery?', '["3rd or 4th degree perineal lacerations", "Diabetes", "Heart failure", "Twins"]', 0, 'Lacerations are much more common with vacuum and forceps.');

    ---------------------------------------------------------------------------
    -- CASE 23: Forceps-Assisted Delivery (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Forceps Prerequisites' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Forceps Prerequisites', 'The physician is preparing to apply forceps for a prolonged second stage of labor.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The physician is preparing to apply forceps for a prolonged second stage of labor.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a prerequisite for any instrumental delivery?', '["Cervix fully dilated", "Ruptured membranes", "Engaged head (station at least 0 or +2)", "All of the above"]', 3, 'The mnemonic FORCEPS (Fetus, OS, Rupture, Cephalic, Engagement, Position, Sophisticated provider) is often used.'),
    (v_case_id, 'What is a specific FETAL complication of forceps use?', '["Facial nerve (CN VII) palsy", "Leg fracture", "Cleft palate", "Clubfoot"]', 0, 'Pressure on the facial nerve can lead to temporary weakness.'),
    (v_case_id, 'When should an operative delivery be abandoned?', '["After 1 pull", "If the instrument dislodges (pop-off) or there is no descent with traction", "If the mother asks", "Never"]', 1, 'Continuing to pull when unsuccessful leads to trauma.');

    ---------------------------------------------------------------------------
    -- CASE 24: PPH - Bakri Balloon (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Tamponade' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Tamponade', 'Pharmacologic measures and bimanual massage have failed to stop a PPH. The provider inserts a balloon device into the uterus.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pharmacologic measures and bimanual massage have failed to stop a PPH. The provider inserts a balloon device into the uterus.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this device?', '["Bakri Balloon", "Foley catheter", "IV bag", "Pessary"]', 0, 'The Bakri balloon provides internal pressure against the bleeding sinuses.'),
    (v_case_id, 'How is the Bakri balloon usually filled?', '["Air", "Normal Saline", "Blood", "Carbon dioxide"]', 1, 'It is filled with up to 500mL of saline.'),
    (v_case_id, 'If the bleeding stops with the balloon (a positive \"tamponade test\"), what does this mean?', '["She needs a hysterectomy", "The hemorrhage is successfully controlled and surgery may be avoided", "The baby is fine", "None"]', 1, 'The balloon can buy time or prevent surgery entirely.');

    ---------------------------------------------------------------------------
    -- CASE 25: Perimortem Cesarean - PMCD (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cardiac Arrest in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cardiac Arrest in Pregnancy', 'A pregnant patient at 32 weeks suffers a cardiac arrest. ACLS is in progress.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant patient at 32 weeks suffers a cardiac arrest. ACLS is in progress.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If ROSC (Return of Spontaneous Circulation) is not achieved within 4 minutes, what should be performed?', '["Stop CPR", "Perimortem Cesarean Delivery (PMCD)", "Give more epinephrine", "Call the family"]', 1, 'Emptying the uterus relieves aortocaval compression, significantly improving the chances of maternal resuscitation.'),
    (v_case_id, 'Where should the C-section be performed in this emergency?', '["OR only", "At the bedside (wherever CPR is happening)", "In the elevator", "Nowhere"]', 1, 'Do not delay for transport; PMCD is a resuscitative procedure for the mother.'),
    (v_case_id, 'What is the goal timing for delivery of the fetus?', '["4 minutes", "5 minutes", "10 minutes", "30 minutes"]', 1, 'The goal is to have the baby OUT by 5 minutes of arrest.');

    ---------------------------------------------------------------------------
    -- CASE 26: Uterine Tachysystole (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Too Many Contractions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Too Many Contractions', 'A patient on high-dose Pitocin has 6 contractions in a 10-minute window. The FHR shows late decelerations.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on high-dose Pitocin has 6 contractions in a 10-minute window. The FHR shows late decelerations.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of tachysystole?', '["> 3 contractions in 10 minutes", "> 5 contractions in 10 minutes (averaged over 30 mins)", "> 10 contractions in an hour", "Continuous pain"]', 1, 'Tachysystole can compromise fetal oxygenation.'),
    (v_case_id, 'What is the immediate management if tachysystole occurs with EFM changes?', '["Increase Pitocin", "Decrease or discontinue Pitocin and consider a tocolytic (e.g., Terbutaline)", "Immediate C-section", "None"]', 1, 'Reducing contraction frequency allows the placenta to recover.'),
    (v_case_id, 'What is the risk of prolonged tachysystole?', '["Macrosomia", "Fetal acidemia", "Diabetes", "Twins"]', 1, 'Too many contractions mean the placenta never gets a "rest" to re-oxygenate.');

    ---------------------------------------------------------------------------
    -- CASE 27: Chorioamnionitis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infection in Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infection in Labor', 'A patient in labor at 40 weeks has a temperature of 102.2, maternal tachycardia, and uterine tenderness.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in labor at 40 weeks has a temperature of 102.2, maternal tachycardia, and uterine tenderness.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard antibiotic regimen for chorioamnionitis?', '["Penicillin and Gentamicin", "Ampicillin and Gentamicin (often with Clindamycin or Metronidazole for C-section)", "Vancomycin", "Azithromycin"]', 1, 'Broad-spectrum coverage for both aerobic and anaerobic organisms is required.'),
    (v_case_id, 'Is chorioamnionitis an absolute indication for immediate Cesarean section?', '["Yes", "No, vaginal delivery is generally preferred unless there are obstetric indications for C-section"]', 1, 'Speeding up labor with Pitocin is the goal; C-section should only be done for usual reasons.'),
    (v_case_id, 'What is the risk to the NEONATE from chorioamnionitis?', '["Cleft palate", "Neonatal sepsis and pneumonia", "Gastroschisis", "None"]', 1, 'The baby is being born into an infected environment.');

    ---------------------------------------------------------------------------
    -- CASE 28: Breech Presentation Emergency (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Breech Delivery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Breech Delivery', 'A patient arrives at the hospital fully dilated with the baby''s buttocks crowning. The body delivers, but the head is trapped.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient arrives at the hospital fully dilated with the baby''s buttocks crowning. The body delivers, but the head is trapped.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Mauriceau-Smellie-Veit maneuver?', '["Pulling the legs", "Placing fingers in the fetal mouth and on the malar bones to flex the head during delivery", "A C-section", "None"]', 1, 'Flexing the head reduces the diameter and facilitates delivery.'),
    (v_case_id, 'What is the most dangerous type of breech for cord prolapse?', '["Frank breech", "Footling breech", "Complete breech", "Cephalic"]', 1, 'Footling breech has the most space for the cord to slip through.'),
    (v_case_id, 'What is the standard management for a breech fetus at 37 weeks?', '["Always C-section", "Offer External Cephalic Version (ECV)", "Wait and see", "Induction"]', 1, 'ECV can sometimes turn the baby to cephalic to allow vaginal delivery.');

    ---------------------------------------------------------------------------
    -- CASE 29: Cord Blood Gases (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Interpreting Cord Gas' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Interpreting Cord Gas', 'A baby is born with low Apgars. Cord gas: pH 6.9, pCO2 100 (High), Bicarbonate 20 (Normal), Base Excess -4 (Normal).', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A baby is born with low Apgars. Cord gas: pH 6.9, pCO2 100 (High), Bicarbonate 20 (Normal), Base Excess -4 (Normal).', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of acidosis is this?', '["Metabolic Acidosis", "Respiratory Acidosis", "Mixed Acidosis", "Normal"]', 1, 'High CO2 with normal base/bicarb indicates respiratory acidosis, usually due to acute cord compression.'),
    (v_case_id, 'What type of acidosis is most concerning for long-term brain injury?', '["Metabolic Acidosis (pH < 7.0 and Base Excess < -12)", "Respiratory Acidosis", "None", "Alkalosis"]', 0, 'Metabolic acidemia implies prolonged tissue hypoxia.'),
    (v_case_id, 'Which vessel provides the best information about FETAL status?', '["Umbilical Vein (going TO the baby)", "Umbilical Artery (coming FROM the baby)", "Maternal vein", "None"]', 1, 'The artery represents what was happening in the fetus.');

    ---------------------------------------------------------------------------
    -- CASE 30: B-Lynch Suture (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surgical PPH Control' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surgical PPH Control', 'During a C-section, the uterus is severely atonic and bleeding despite medications. The surgeon performs a specialized compression suture.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a C-section, the uterus is severely atonic and bleeding despite medications. The surgeon performs a specialized compression suture.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this suture technique?', '["B-Lynch suture", "Purse-string", "Running suture", "Mattress suture"]', 0, 'The B-Lynch "suspenders" compress the uterus to stop bleeding.'),
    (v_case_id, 'What is the main benefit of the B-Lynch suture?', '["It removes the uterus", "It preserves fertility by avoiding a hysterectomy", "It treats infection", "It fixes the bladder"]', 1, 'It is a fertility-sparing surgical intervention.'),
    (v_case_id, 'If surgical sutures and arterial ligation fail, what is the definitive last step?', '["Another Bakri balloon", "Peripartum Hysterectomy", "More Pitocin", "Wait 24 hours"]', 1, 'Hysterectomy is the final life-saving measure.');

    -- [CASES 31-50 omitted for brevity in this block, but I will ensure the full 50 are in the file]
    -- (I will generate the rest now in the same high-quality format)

    ---------------------------------------------------------------------------
    -- CASE 31: PPH - Thrombin/Coagulopathy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPH: Thrombin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPH: Thrombin', 'A patient with a massive abruption is now oozing blood from her gums and surgical incision.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a massive abruption is now oozing blood from her gums and surgical incision.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of this systemic bleeding?', '["Retained placenta", "Laceration", "DIC (Disseminated Intravascular Coagulation)", "Uterine atony"]', 2, 'DIC is a failure of the "Thrombin" (4th T of PPH).'),
    (v_case_id, 'Which blood product is best for replacing Fibrinogen in DIC?', '["Packed Red Blood Cells", "Fresh Frozen Plasma (FFP)", "Cryoprecipitate", "Platelets"]', 2, 'Cryo is rich in Fibrinogen and Factor VIII/XIII.'),
    (v_case_id, 'What is the typical ratio of blood products in a Massive Transfusion Protocol (MTP)?', '["1:1:1 (RBC:FFP:Platelets)", "10:1:1", "1:5:10", "Only RBCs"]', 0, 'Balanced transfusion mimics whole blood.');

    ---------------------------------------------------------------------------
    -- CASE 32: External Cephalic Version - ECV (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Turning the Fetus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Turning the Fetus', 'At 37 weeks, a fetus is in frank breech. The patient wants to try to turn the baby.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'At 37 weeks, a fetus is in frank breech. The patient wants to try to turn the baby.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the prerequisites for ECV?', '["Reactive NST", "Engaged presenting part", "Adequate amniotic fluid", "Both A and C"]', 3, 'You need a healthy fetus and enough fluid to move them.'),
    (v_case_id, 'What is a common complication of ECV that warrants immediate C-section?', '["Fetal death", "Placental abruption or fetal distress", "Maternal fever", "Leg cramp"]', 1, 'Manipulation can trigger an abruption.'),
    (v_case_id, 'What should be given to an Rh-negative mother after an ECV attempt?', '["Antibiotics", "RhoGAM", "Iron", "Oxygen"]', 1, 'Any manipulation carries a risk of fetal-maternal hemorrhage.');

    ---------------------------------------------------------------------------
    -- CASE 33: Internal Iliac Artery Ligation (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vascular PPH Control' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vascular PPH Control', 'The B-Lynch suture failed. The surgeon decides to ligate the internal iliac arteries.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The B-Lynch suture failed. The surgeon decides to ligate the internal iliac arteries.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is another name for the internal iliac artery?', '["Femoral artery", "Hypogastric artery", "Aorta", "Uterine artery"]', 1, 'Hypogastric artery ligation reduces pelvic blood pressure.'),
    (v_case_id, 'Does this procedure always stop the bleeding?', '["Yes", "No, it only works in ~40-50% of cases due to extensive collateral circulation"]', 1, 'Collateral flow is very robust in the female pelvis.'),
    (v_case_id, 'What is the risk of this procedure?', '["Accidental ligation of the ureter or external iliac artery (leading to leg ischemia)", "Diabetes", "Heart failure", "None"]', 0, 'Anatomical precision is required to avoid major complications.');

    ---------------------------------------------------------------------------
    -- CASE 34: Amniotomy - AROM (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breaking the Bag' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breaking the Bag', 'A physician is about to perform an artificial rupture of membranes (AROM).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician is about to perform an artificial rupture of membranes (AROM).', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must be checked IMMEDIATELY after AROM?', '["Maternal temperature", "Fetal heart rate", "Maternal BP", "Glucose"]', 1, 'Check for cord prolapse or sudden bradycardia.'),
    (v_case_id, 'What is an absolute contraindication to AROM?', '["The baby is in the OR", "Unengaged presenting part (high station)", "Twins", "Normal labor"]', 1, 'A high head allows the cord to slip past when the fluid rushes out.'),
    (v_case_id, 'AROM is often done to:', '["Augment labor", "Place internal monitors (IUPC/FSE)", "Check for meconium", "All of the above"]', 3, 'It is a common procedure for multiple reasons.');

    ---------------------------------------------------------------------------
    -- CASE 35: Meconium-Stained Fluid (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Green Fluid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Green Fluid', 'Upon AROM, thick, pea-soup meconium is noted.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Upon AROM, thick, pea-soup meconium is noted.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current recommendation for a VIGOROUS baby born with meconium?', '["Immediate intubation and suctioning", "Routine care (warm, dry, stimulate)", "Give oxygen", "Antibiotics"]', 1, 'If the baby is vigorous, no special suctioning is required.'),
    (v_case_id, 'What is the risk of meconium aspiration?', '["Pneumothorax", "Persistent Pulmonary Hypertension of the Newborn (PPHN)", "Chemical pneumonitis", "All of the above"]', 3, 'Meconium is very irritating to the lungs.'),
    (v_case_id, 'Meconium passage in utero is often a sign of:', '["Fetal maturity", "Fetal stress/hypoxia", "Post-term pregnancy", "All of the above"]', 3, 'It can be a normal finding in term/post-term babies or a sign of acute stress.');

    ---------------------------------------------------------------------------
    -- CASE 36: Fetal Scalp Electrode - FSE (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal Monitoring' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal Monitoring', 'The external FHR tracing is difficult to maintain due to maternal obesity.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The external FHR tracing is difficult to maintain due to maternal obesity.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the benefit of an FSE?', '["It measures contraction strength", "It provides a continuous, accurate R-R interval for FHR", "It treats infection", "It speeds up labor"]', 1, 'It is much more accurate than an external Doppler.'),
    (v_case_id, 'What is an absolute contraindication to FSE?', '["Maternal Hepatitis B/C or HIV", "Obesity", "Twins", "Diabetes"]', 0, 'Avoid breaking fetal skin in the presence of bloodborne pathogens.'),
    (v_case_id, 'Can you use an FSE if membranes are intact?', '["Yes", "No, membranes must be ruptured"]', 1, 'The electrode must be attached directly to the fetal scalp.');

    ---------------------------------------------------------------------------
    -- CASE 37: IUPC - Contraction Measurement (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pressure Catheter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pressure Catheter', 'An Intrauterine Pressure Catheter (IUPC) is placed to assess labor progress.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An Intrauterine Pressure Catheter (IUPC) is placed to assess labor progress.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What unit is used to measure contraction strength with an IUPC?', '["mmHg", "Montevideo Units (MVU)", "PSI", "Newtons"]', 1, 'MVUs are the sum of the peak pressures above baseline in a 10-minute window.'),
    (v_case_id, 'What is considered \"adequate\" labor in MVUs?', '["100 MVU", "200-250 MVUs", "500 MVUs", "50 MVUs"]', 1, 'Adequate labor is generally > 200 MVUs.'),
    (v_case_id, 'What is a rare but serious complication of IUPC placement?', '["Placental abruption or uterine perforation", "Diabetes", "Headache", "Twins"]', 0, 'Any internal device carries a small risk of trauma.');

    ---------------------------------------------------------------------------
    -- CASE 38: Amnioinfusion (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fluid Replacement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fluid Replacement', 'A patient with oligohydramnios has recurrent variable decelerations. An IUPC is in place.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with oligohydramnios has recurrent variable decelerations. An IUPC is in place.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of amnioinfusion?', '["To treat infection", "To cushion the umbilical cord and reduce variable decelerations", "To wash the baby", "To induce labor"]', 1, 'It adds fluid back to the uterine cavity.'),
    (v_case_id, 'What type of fluid is used for amnioinfusion?', '["Distilled water", "Warm Normal Saline or Lactated Ringers", "Blood", "Sugar water"]', 1, 'Isotonic, warm fluid is used.'),
    (v_case_id, 'Is amnioinfusion used for LATE decelerations?', '["Yes", "No, it is only effective for variables (cord compression)"]', 1, 'Late decelerations are due to placental issues, not cord compression.');

    ---------------------------------------------------------------------------
    -- CASE 39: Post-term Fetal Monitoring (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Overdue Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Overdue Baby', 'A patient is at 41 weeks and 4 days. She is awaiting induction.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is at 41 weeks and 4 days. She is awaiting induction.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning risk of post-term pregnancy?', '["Large baby only", "Placental senescence (aging) leading to fetal demise", "It is safer", "None"]', 1, 'The placenta begins to fail after 41-42 weeks.'),
    (v_case_id, 'What happens to amniotic fluid volume in post-term pregnancy?', '["It increases", "It decreases (Oligohydramnios)", "It stays the same", "It turns purple"]', 1, 'Oligohydramnios is common and increases the risk of cord compression.'),
    (v_case_id, 'At what gestational age is induction usually MANDATORY?', '["40 weeks", "42 weeks (Post-term)", "39 weeks", "43 weeks"]', 1, 'Most providers induce by 41 to 42 weeks to avoid stillbirth.');

    ---------------------------------------------------------------------------
    -- CASE 40: Contraction Stress Test - CST (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stress Testing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stress Testing', 'A patient has a non-reactive NST. A CST is performed using nipple stimulation to achieve 3 contractions in 10 minutes.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a non-reactive NST. A CST is performed using nipple stimulation to achieve 3 contractions in 10 minutes.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a \"Positive\" CST?', '["No decelerations", "Late decelerations occurring with > 50% of contractions", "Accelerations present", "Only 1 contraction"]', 1, 'A POSITIVE CST is a BAD sign (ominous).'),
    (v_case_id, 'What is a \"Negative\" CST?', '["Decelerations present", "No late or significant variable decelerations", "No contractions", "Accelerations only"]', 1, 'A NEGATIVE CST is a GOOD sign (reassuring).'),
    (v_case_id, 'When is a CST CONTRAINDICATED?', '["Placenta previa, history of classical C-section, or risk of preterm labor", "Diabetes", "Obesity", "Twins"]', 0, 'You should not induce contractions if vaginal delivery is contraindicated.');

    ---------------------------------------------------------------------------
    -- CASE 41: Cervical Lacerations (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPH: Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPH: Trauma', 'Following an operative vaginal delivery, there is profuse bright red bleeding. The uterus is firm and well-contracted.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following an operative vaginal delivery, there is profuse bright red bleeding. The uterus is firm and well-contracted.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the uterus is firm but bleeding is heavy, what is the most likely cause?', '["Atony", "Laceration (Trauma)", "Retained placenta", "DIC"]', 1, 'A firm uterus rules out atony; look for a tear.'),
    (v_case_id, 'Where should a suspected cervical laceration be repaired?', '["In the hallway", "In the OR under good light with adequate assistance", "It doesn''t need repair", "Wait 2 days"]', 1, 'Cervical tears can bleed massively and need careful visualization.'),
    (v_case_id, 'Lacerations are more common after:', '["Preterm labor", "Operative vaginal delivery (Forceps/Vacuum) or precipitous labor", "Walking", "Epidural"]', 1, 'Rapid or assisted delivery increases trauma risk.');

    ---------------------------------------------------------------------------
    -- CASE 42: Retained Placental Fragments (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPH: Tissue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPH: Tissue', 'A PPH is occurring. Inspection of the delivered placenta shows a missing cotyledon.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A PPH is occurring. Inspection of the delivered placenta shows a missing cotyledon.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management?', '["Massage only", "Manual exploration of the uterus or D&C", "Antibiotics only", "None"]', 1, 'Retained tissue prevents the uterus from contracting fully.'),
    (v_case_id, 'What is an \"Accessory Lobe\" (Succenturiate lobe)?', '["A second placenta", "A small extra lobe connected by vessels, which can be left behind during delivery", "A tumor", "None"]', 1, 'Accessory lobes are a common cause of retained tissue.'),
    (v_case_id, 'Retained tissue is a risk for both PPH and:', '["Postpartum infection/Endometritis", "Diabetes", "Hypothyroidism", "Twins"]', 0, 'Dead tissue acts as a nidus for bacteria.');

    ---------------------------------------------------------------------------
    -- CASE 43: PPH - Pelvic Artery Embolization (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Radiological Intervention' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Radiological Intervention', 'A stable but persistently bleeding PPH patient is taken to Interventional Radiology.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A stable but persistently bleeding PPH patient is taken to Interventional Radiology.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the procedure called?', '["X-ray", "Uterine Artery Embolization (UAE)", "Laparoscopy", "MRI"]', 1, 'UAE can selectively block bleeding vessels.'),
    (v_case_id, 'When is UAE preferred over surgery?', '["If the patient is hemodynamically stable and wants to preserve fertility", "In an emergency collapse", "Never", "Always"]', 0, 'It requires time and a stable patient to move to the IR suite.'),
    (v_case_id, 'What is used to embolize the vessels?', '["Glue", "Gelfoam, coils, or particles", "Water", "Air"]', 1, 'Gelfoam provides temporary occlusion.');

    ---------------------------------------------------------------------------
    -- CASE 44: DIC Workup (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Coagulopathy Labs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Coagulopathy Labs', 'A patient is suspected of having DIC following an abruption.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is suspected of having DIC following an abruption.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab findings are characteristic of DIC?', '["Low Fibrinogen, Low Platelets, High PT/PTT, High D-Dimer", "High Fibrinogen", "Normal labs", "High Platelets"]', 0, 'DIC is a consumptive process.'),
    (v_case_id, 'What is the most important management step in DIC?', '["Give Heparin", "Identify and treat/remove the underlying trigger (e.g., deliver the baby, treat sepsis)", "Give Aspirin", "None"]', 1, 'You must "stop the leak" by treating the primary cause.'),
    (v_case_id, 'What is the risk of giving only crystalloid (NS/LR) in a massive hemorrhage?', '["Better blood flow", "Dilutional coagulopathy", "Higher BP", "None"]', 1, 'Too much fluid without clotting factors makes the bleeding worse.');

    ---------------------------------------------------------------------------
    -- CASE 45: Shoulder Dystocia - Maneuver Sequence (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HELPERR Mnemonic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HELPERR Mnemonic', 'A resident is trying to remember the steps for shoulder dystocia.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A resident is trying to remember the steps for shoulder dystocia.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the \"E\" in HELPERR stand for?', '["Emergency C-section", "Evaluate for Episiotomy (to give the provider more room for internal maneuvers)", "Epinephrine", "Epidural"]', 1, 'An episiotomy does not resolve the bone-on-bone impaction but gives the provider room for their hands.'),
    (v_case_id, 'What does the first \"R\" stand for?', '["Run", "Roll the patient (Gaskin maneuver - onto all fours)", "Rest", "Reflexes"]', 1, 'The Gaskin maneuver can increase pelvic diameters.'),
    (v_case_id, 'Is there a strictly required order for these maneuvers?', '["Yes", "No, they can be performed in any sequence based on clinical judgment"]', 1, 'Flexibility is key, although McRoberts/Suprapubic are usually first.');

    ---------------------------------------------------------------------------
    -- CASE 46: Cord Gases - Metabolic Acidemia (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Severe Fetal Distress' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Severe Fetal Distress', 'A baby is born depressed. Cord gas: pH 6.8, pCO2 50 (Normal), Base Excess -18 (Severe).', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Severe Fetal Distress', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of acidemia is this?', '["Respiratory", "Metabolic (lactic acidosis)", "Mixed", "None"]', 1, 'Severe negative base excess with normal CO2 indicates prolonged anaerobic metabolism.'),
    (v_case_id, 'A pH < 7.0 and Base Excess < -12 is associated with an increased risk of:', '["Cerebral Palsy and Neonatal Encephalopathy", "Large baby", "Fast growth", "None"]', 0, 'This is the definition of significant metabolic acidemia.'),
    (v_case_id, 'Why is the pH low in metabolic acidemia?', '["Too much CO2", "Accumulation of lactic acid due to oxygen deprivation", "Too much sugar", "None"]', 1, 'The fetus has switched to anaerobic metabolism.');

    ---------------------------------------------------------------------------
    -- CASE 47: Vacuum "Pop-offs" (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vacuum Safety Cutoffs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vacuum Safety Cutoffs', 'A physician is performing a vacuum delivery. The vacuum has dislodged from the head twice.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician is performing a vacuum delivery. The vacuum has dislodged from the head twice.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many \"pop-offs\" are generally considered the maximum before abandoning the procedure?', '["One", "Three", "Ten", "Unlimited"]', 1, 'Three pop-offs is the standard safety cutoff to prevent intracranial trauma.'),
    (v_case_id, 'What is the maximum time a vacuum cup should be applied?', '["5 minutes", "20-30 minutes", "1 hour", "Unlimited"]', 1, 'Prolonged application increases the risk of scalp injury.'),
    (v_case_id, 'What is the next step if vacuum fails?', '["Try forceps", "Cesarean delivery", "Wait 4 hours", "None"]', 1, '\"Sequential\" use of instruments (vacuum then forceps) is generally discouraged due to high injury risk.');

    ---------------------------------------------------------------------------
    -- CASE 48: Category III Management (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Abnormal Tracing Protocol' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Abnormal Tracing Protocol', 'A patient has absent variability and recurrent late decelerations despite all resuscitative measures.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has absent variability and recurrent late decelerations despite all resuscitative measures.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate management for a Category III tracing that does not improve?', '["Continue monitoring for 2 hours", "Prompt delivery (usually by Cesarean)", "Send the patient home", "Check a maternal temperature"]', 1, 'Category III is predictive of abnormal fetal acid-base status.'),
    (v_case_id, 'What is the \"30-minute rule\" in obstetrics?', '["Decision to incision for emergency C-section should ideally be < 30 minutes", "Labor should last 30 hours", "Check BP every 30 mins", "None"]', 0, 'This is a quality standard for emergency response.'),
    (v_case_id, 'Absent variability signifies:', '["Fetal sleep", "Potential neurological injury or severe acidemia", "Normal", "None"]', 1, 'Absent variability is the most concerning variability finding.');

    ---------------------------------------------------------------------------
    -- CASE 49: Amniotic Fluid Index - AFI (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fluid Measurement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fluid Measurement', 'A resident is measuring the AFI on ultrasound.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A resident is measuring the AFI on ultrasound.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the AFI calculated?', '["Measuring one pocket", "Sum of the deepest vertical pocket in each of the four quadrants", "Eyeballing it", "None"]', 1, 'The 4-quadrant sum is a semi-quantitative measure.'),
    (v_case_id, 'What is a normal AFI range?', '["< 5 cm", "5 cm to 24 cm", "> 24 cm", "Exactly 10 cm"]', 1, 'Values within this range are considered normal.'),
    (v_case_id, 'What is a \"Modified BPP\"?', '["NST + AFI", "AFI + Weight", "BPP minus the NST", "None"]', 0, 'The modified BPP is a quicker screen that is as effective as the full BPP.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vagal Response (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Physiology of Decels' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Physiology of Decels', 'A student asks why head compression causes a drop in heart rate.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Physiology of Decels', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What nerve mediates the FHR drop in response to head compression?', '["Phrenic nerve", "Vagus nerve (Cranial Nerve X)", "Sciatic nerve", "None"]', 1, 'Pressure on the head triggers a parasympathetic (vagal) response.'),
    (v_case_id, 'This is a form of which reflex?', '["Baroreceptor reflex", "Chemoreceptor reflex", "Moro reflex", "None"]', 0, 'Dural pressure/head compression triggers baroreceptors.'),
    (v_case_id, 'Which decelerations are mediated by CHEMORECEPTORS in response to low oxygen?', '["Early", "Late", "Sinusoidal", "None"]', 1, 'Late decelerations are a reflex response to fetal hypoxemia.');

    RAISE NOTICE 'SUCCESS: 50 Fetal monitoring & emergencies Case Blocks registered.';
END $$;

COMMIT;
