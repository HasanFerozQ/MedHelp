BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for High-risk pregnancy
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-high-risk-pregnancy' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-high-risk-pregnancy" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Pre-eclampsia Without Severe Features (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'New Onset Hypertension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'New Onset Hypertension', 'A 28-year-old G1P0 at 34 weeks gestation presents for a routine visit. Her BP is 145/95. She has no headache or vision changes. Urine dipstick shows 1+ protein.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old G1P0 at 34 weeks gestation presents for a routine visit. Her BP is 145/95. She has no headache or vision changes. Urine dipstick shows 1+ protein.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic threshold for proteinuria in pre-eclampsia?', '["100 mg/24h", "300 mg/24h or Protein/Creatinine ratio >= 0.3", "1000 mg/24h", "Only 3+ on dipstick"]', 1, '300 mg in a 24-hour collection is the gold standard diagnostic criteria.'),
    (v_case_id, 'If BP remains in the 140-150s systolic without severe features, what is the management at 34 weeks?', '["Immediate C-section", "Expectant management with twice-weekly monitoring and delivery at 37 weeks", "Immediate induction of labor", "Bed rest and salt restriction"]', 1, 'Delivery is recommended at 37 0/7 weeks for pre-eclampsia without severe features.'),
    (v_case_id, 'What is the definition of \"Gestational Hypertension\"?', '["BP >= 140/90 after 20 weeks WITHOUT proteinuria or severe features", "BP >= 140/90 before 20 weeks", "High BP only during labor", "Proteinuria without high BP"]', 0, 'Gestational hypertension is a diagnosis of exclusion in the absence of pre-eclampsia markers.');

    ---------------------------------------------------------------------------
    -- CASE 02: Pre-eclampsia With Severe Features (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Severe Preeclampsia Criteria' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Severe Preeclampsia Criteria', 'A 32-year-old at 35 weeks presents with a BP of 165/115 and a severe frontal headache.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old at 35 weeks presents with a BP of 165/115 and a severe frontal headache.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a \"Severe Feature\" of pre-eclampsia?', '["Platelets < 100,000", "Creatinine > 1.1 or doubling", "Elevated Liver Enzymes (2x normal)", "All of the above"]', 3, 'Severe features include thrombocytopenia, renal insufficiency, liver dysfunction, pulmonary edema, and cerebral/visual symptoms.'),
    (v_case_id, 'What is the management of pre-eclampsia with severe features at 35 weeks?', '["Wait until 37 weeks", "Stabilize with Magnesium sulfate and deliver regardless of gestational age", "Steroids and wait 48 hours", "Home monitoring"]', 1, 'Severe pre-eclampsia requires delivery at or after 34 weeks (or earlier if maternal/fetal status is unstable).'),
    (v_case_id, 'What is the primary purpose of Magnesium Sulfate in this patient?', '["To lower blood pressure", "To prevent seizures (seizure prophylaxis)", "To treat infection", "To mature fetal lungs"]', 1, 'Magnesium sulfate is an anticonvulsant, not an antihypertensive.');

    ---------------------------------------------------------------------------
    -- CASE 03: Eclampsia Management (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eclamptic Seizure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eclamptic Seizure', 'A patient with known pre-eclampsia suddenly begins a generalized tonic-clonic seizure.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with known pre-eclampsia suddenly begins a generalized tonic-clonic seizure.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in the management of an active eclamptic seizure?', '["Immediate C-section", "Protect airway, prevent trauma, and give IV Magnesium sulfate bolus", "Give IV Valium", "Check a glucose"]', 1, 'Airway protection and Magnesium are the mainstays. Magnesium is superior to diazepam for eclampsia.'),
    (v_case_id, 'Should you rush the patient to the OR for an emergency C-section DURING the seizure?', '["Yes", "No, wait for maternal stabilization and resolution of fetal bradycardia (which is common during/after seizure)"]', 1, 'Fetal bradycardia during a seizure is usually transient; delivery should occur after the mother is stabilized.'),
    (v_case_id, 'If the patient has another seizure while on a Magnesium drip, what is the next step?', '["Stop Magnesium", "Give another 2g bolus of Magnesium sulfate", "Immediate Hysterectomy", "Intubation"]', 1, 'A recurrent seizure is treated with an additional bolus of Magnesium.');

    ---------------------------------------------------------------------------
    -- CASE 04: HELLP Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HELLP Syndrome Labs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HELLP Syndrome Labs', 'A G2P1 patient at 33 weeks presents with epigastric pain and malaise. Labs: Hgb 9 (low), Platelets 80k (low), LDH 700 (high), ALT 150 (high).', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A G2P1 patient at 33 weeks presents with epigastric pain and malaise. Labs: Hgb 9 (low), Platelets 80k (low), LDH 700 (high), ALT 150 (high).', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the acronym HELLP stand for?', '["Hyper-reflexia, Edema, Lung Liquid, Proteinuria", "Hemolysis, Elevated Liver enzymes, Low Platelets", "Heart failure, Eclampsia, Lung edema, Pain", "None"]', 1, 'HELLP is a severe variant of pre-eclampsia.'),
    (v_case_id, 'Which finding on a peripheral smear is characteristic of HELLP?', '["Target cells", "Schistocytes (fragmented RBCs)", "Auer rods", "Hypersegmented neutrophils"]', 1, 'Microangiopathic hemolytic anemia (MAHA) leads to schistocyte formation.'),
    (v_case_id, 'A patient with HELLP syndrome is at high risk for which hepatic complication?', '["Hepatoma", "Subcapsular liver hematoma/rupture", "Hepatitis A", "Cirrhosis"]', 1, 'Severe RUQ/epigastric pain in HELLP should raise concern for a liver hematoma.');

    ---------------------------------------------------------------------------
    -- CASE 05: GDM Screening (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GDM Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GDM Screening', 'A patient at 26 weeks gestation is undergoing her \"1-hour glucola\" test.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 26 weeks gestation is undergoing her \"1-hour glucola\" test.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is universal screening for GDM typically performed?', '["First trimester", "24-28 weeks gestation", "36 weeks", "Only if the patient is obese"]', 1, '24-28 weeks is the standard window for screening.'),
    (v_case_id, 'What is a typical \"abnormal\" threshold for the 50g 1-hour glucose challenge test?', '["95 mg/dL", "130-140 mg/dL", "200 mg/dL", "100 mg/dL"]', 1, 'Values above 130 or 140 (depending on institutional policy) require a diagnostic 3-hour test.'),
    (v_case_id, 'Does the 1-hour 50g test require the patient to be fasting?', '["Yes", "No"]', 1, 'The 1-hour screening test is \"non-fasting.\"');

    ---------------------------------------------------------------------------
    -- CASE 06: GDM Diagnosis - 3-hour OGTT (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GDM Diagnosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GDM Diagnosis', 'A patient failed her 1-hour screen and just completed her 100g 3-hour OGTT. Her results: Fasting 105 (High), 1-hr 190 (High), 2-hr 160 (High), 3-hr 140 (Normal).', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient failed her 1-hour screen and just completed her 100g 3-hour OGTT. Her results: Fasting 105 (High), 1-hr 190 (High), 2-hr 160 (High), 3-hr 140 (Normal).', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many values must be abnormal on the 3-hour OGTT to diagnose Gestational Diabetes?', '["One", "Two or more", "All four", "Zero"]', 1, 'Carpenter-Coustan or NDDG criteria require at least two abnormal values for diagnosis.'),
    (v_case_id, 'According to Carpenter-Coustan, what is the Fasting threshold?', '["92 mg/dL", "95 mg/dL", "105 mg/dL", "126 mg/dL"]', 1, '95 mg/dL is the threshold for fasting on the 100g test.'),
    (v_case_id, 'Is this patient diagnostic for GDM based on her results?', '["No", "Yes"]', 1, 'She has three abnormal values (Fasting, 1-hr, 2-hr), meeting the criteria.');

    ---------------------------------------------------------------------------
    -- CASE 07: GDM Management (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GDM Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GDM Management', 'A patient with newly diagnosed GDM starts a diabetic diet and exercise. After 1 week, her fasting glucoses are consistently > 100.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with newly diagnosed GDM starts a diabetic diet and exercise. After 1 week, her fasting glucoses are consistently > 100.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal for FASTING blood glucose in a GDM patient?', '["< 70 mg/dL", "< 95 mg/dL", "< 120 mg/dL", "< 140 mg/dL"]', 1, 'Targeting < 95 fasting and < 140 (1-hr postprandial) or < 120 (2-hr postprandial) is standard.'),
    (v_case_id, 'If diet and exercise fail (GDM A2), what is the first-line pharmacologic treatment of choice?', '["Metformin", "Glyburide", "Insulin", "Acarbose"]', 2, 'Insulin remains the gold standard because it does not cross the placenta, though Metformin is increasingly used.'),
    (v_case_id, 'What is the most significant maternal risk of GDM later in life?', '["Chronic Kidney Disease", "Type 2 Diabetes Mellitus", "Hypothyroidism", "Breast cancer"]', 1, 'Up to 50% of GDM patients will develop T2DM within 10-20 years.');

    ---------------------------------------------------------------------------
    -- CASE 08: Placenta Previa (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painless Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painless Bleeding', 'A 32-year-old G3P2 at 29 weeks presents with sudden onset of bright red vaginal bleeding. She denies pain or contractions. Uterus is soft.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old G3P2 at 29 weeks presents with sudden onset of bright red vaginal bleeding. She denies pain or contractions. Uterus is soft.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Golden Rule\" of third-trimester bleeding?', '["Always perform a digital exam immediately", "NEVER perform a digital vaginal exam until placenta previa is ruled out by ultrasound", "Always give antibiotics", "Perform a speculum exam first"]', 1, 'A digital exam can trigger catastrophic hemorrhage if a previa is present.'),
    (v_case_id, 'What is the most likely diagnosis for PAINLESS 3rd trimester bleeding?', '["Placental Abruption", "Placenta Previa", "Vasa Previa", "Cervicitis"]', 1, 'Painless = Previa (usually). Painful = Abruption (usually).'),
    (v_case_id, 'How is placenta previa managed if it persists to term?', '["Vaginal delivery", "Induction of labor", "Scheduled Cesarean section at 36-37 weeks", "Wait for labor to start"]', 2, 'Previa is an absolute indication for C-section.');

    ---------------------------------------------------------------------------
    -- CASE 09: Placental Abruption (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painful Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painful Bleeding', 'A 35-year-old at 36 weeks with hypertension presents with sudden, intense abdominal pain, dark vaginal bleeding, and a firm, tender uterus.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old at 36 weeks with hypertension presents with sudden, intense abdominal pain, dark vaginal bleeding, and a firm, tender uterus.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common risk factor for placental abruption?', '["Diabetes", "Maternal Hypertension/Pre-eclampsia", "Multiple gestation", "Hypothyroidism"]', 1, 'Hypertension is the strongest risk factor. Other risks include Cocaine use, Smoking, and Trauma.'),
    (v_case_id, 'What is a \"Couvelaire Uterus\"?', '["A uterus with a fibroid", "Blood dissecting into the myometrium, giving it a purple/bluish appearance (seen in severe abruption)", "A bicornuate uterus", "A uterus that is inverted"]', 1, 'This occurs when retroplacental blood infiltrates the uterine muscle wall.'),
    (v_case_id, 'What is a life-threatening systemic complication of severe abruption?', '["Diabetes", "Disseminated Intravascular Coagulation (DIC)", "Hyperthyroidism", "Pneumonia"]', 1, 'Abruption triggers the release of tissue factor, which can lead to rapid consumptive coagulopathy.');

    ---------------------------------------------------------------------------
    -- CASE 10: Vasa Previa (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fetal Vessel Rupture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fetal Vessel Rupture', 'Immediately after Artificial Rupture of Membranes (AROM), there is a small amount of vaginal bleeding followed by immediate, persistent fetal bradycardia.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Immediately after Artificial Rupture of Membranes (AROM), there is a small amount of vaginal bleeding followed by immediate, persistent fetal bradycardia.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Placenta Previa", "Placental Abruption", "Vasa Previa", "Uterine Rupture"]', 2, 'Vasa previa occurs when fetal vessels cross the internal os; rupture causes rapid fetal exsanguination.'),
    (v_case_id, 'What is \"Velamentous Cord Insertion\"?', '["The cord inserts into the center of the placenta", "The cord inserts into the membranes, with vessels running unprotected to the placenta", "The cord is too short", "There is only one umbilical artery"]', 1, 'Velamentous insertion is a major risk factor for vasa previa.'),
    (v_case_id, 'What is the definitive management of vasa previa once identified?', '["Vaginal delivery", "Induction of labor at term", "Scheduled C-section at 34-35 weeks (before labor starts)", "Wait and see"]', 2, 'Early C-section is required because labor or ROM will kill the fetus.');

    ---------------------------------------------------------------------------
    -- CASE 11: Rh Alloimmunization (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rh Negative Mother' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rh Negative Mother', 'A 24-year-old G1P0 is O-negative. Her husband is A-positive. She is currently at 28 weeks.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old G1P0 is O-negative. Her husband is A-positive. She is currently at 28 weeks.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When should RhoGAM (anti-D immunoglobulin) be routinely administered to an Rh-negative unsensitized patient?', '["At 12 weeks", "At 28 weeks AND within 72 hours of delivery (if baby is Rh-positive)", "Only after delivery", "Every month"]', 1, '28 weeks and postpartum are the standard times, plus any time bleeding occurs.'),
    (v_case_id, 'Which test is used to measure the amount of fetal-maternal hemorrhage to calculate the RhoGAM dose?', '["Indirect Coombs", "Kleihauer-Betke (KB) test", "Apt test", "HbA1c"]', 1, 'The KB test (acid elution) identifies fetal RBCs in maternal blood.'),
    (v_case_id, 'What is the severe fetal complication of Rh alloimmunization in subsequent pregnancies?', '["Hydrops Fetalis", "Cleft palate", "Gastroschisis", "Spina bifida"]', 0, 'Severe fetal anemia leads to heart failure and generalized edema (hydrops).');

    ---------------------------------------------------------------------------
    -- CASE 12: Fetal Growth Restriction - FGR (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Small for Gestational Age' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Small for Gestational Age', 'At 32 weeks, the fundal height is 28 cm. Ultrasound shows the fetus is in the 5th percentile for weight.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'At 32 weeks, the fundal height is 28 cm. Ultrasound shows the fetus is in the 5th percentile for weight.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of FGR?', '["Weight < 25th percentile", "Weight < 10th percentile for gestational age", "Weight < 2500g", "Small head only"]', 1, 'The 10th percentile is the standard cutoff for FGR.'),
    (v_case_id, 'What is \"Asymmetric\" FGR?', '["The whole body is small", "The head is normal size but the abdomen/body is small", "Only the legs are small", "The baby has only one kidney"]', 1, 'Asymmetric FGR (Head sparing) is usually due to placental insufficiency (e.g., from HTN) later in pregnancy.'),
    (v_case_id, 'What is the most common cause of \"Symmetric\" FGR?', '["Smoking", "Maternal hypertension", "Chromosomal abnormalities or early congenital infection (TORCH)", "Gestational diabetes"]', 2, 'Symmetric FGR implies a global insult early in pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 13: Multiple Gestation - Chorionicity (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Twin Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Twin Pregnancy', 'An ultrasound at 10 weeks shows a \"Twin Peak\" or \"Lambda\" sign at the junction of the twin membranes.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ultrasound at 10 weeks shows a \"Twin Peak\" or \"Lambda\" sign at the junction of the twin membranes.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the \"Lambda sign\" indicate?', '["Monochorionic twins", "Dichorionic twins", "Conjoined twins", "Ectopic pregnancy"]', 1, 'The Lambda sign (thick membrane) confirms two separate placentas (Dichorionic).'),
    (v_case_id, 'What does the \"T-sign\" (thin membrane) indicate?', '["Dichorionic twins", "Monochorionic twins", "Triplet pregnancy", "Normal singleton"]', 1, 'A T-sign indicates a shared placenta (Monochorionic), which carries higher risks.'),
    (v_case_id, 'At what stage of division do \"Monoamniotic-Monochorionic\" (MoMo) twins occur?', '["Days 1-3", "Days 4-8", "Days 8-13", "After Day 13"]', 2, 'Division between 8-13 days results in twins sharing both the placenta and the amniotic sac.');

    ---------------------------------------------------------------------------
    -- CASE 14: Twin-Twin Transfusion Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'TTTS Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'TTTS Complications', 'A monochorionic twin pregnancy shows Twin A with severe oligohydramnios and FGR, and Twin B with polyhydramnios and hydrops.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A monochorionic twin pregnancy shows Twin A with severe oligohydramnios and FGR, and Twin B with polyhydramnios and hydrops.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathophysiology of TTTS?', '["Genetic mutations", "Unbalanced vascular anastomoses (connections) in a shared placenta", "Maternal infection", "Different fathers"]', 1, 'Arterial-venous connections allow one twin (donor) to \"pump\" blood to the other (recipient).'),
    (v_case_id, 'Which twin is at risk for heart failure and hydrops due to volume overload?', '["The Donor twin", "The Recipient twin", "Neither", "Both"]', 1, 'The recipient twin becomes plethoric and fluid-overloaded.'),
    (v_case_id, 'What is the definitive treatment for severe TTTS?', '["Selective reduction", "Fetoscopic Laser Photocoagulation of the anastomoses", "Immediate delivery", "Amnioreduction only"]', 1, 'Laser surgery to \"disconnect\" the vascular sharing is the best management.');

    ---------------------------------------------------------------------------
    -- CASE 15: Chronic Hypertension (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic HTN in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic HTN in Pregnancy', 'A 34-year-old at 10 weeks gestation has a BP of 150/95. She had high BP before she was pregnant.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old at 10 weeks gestation has a BP of 150/95. She had high BP before she was pregnant.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Chronic Hypertension in pregnancy?', '["High BP after 20 weeks", "High BP diagnosed BEFORE pregnancy or BEFORE 20 weeks gestation", "High BP only during office visits", "High BP with protein"]', 1, 'Hypertension early in pregnancy is considered chronic.'),
    (v_case_id, 'Which common antihypertensive medication is CONTRAINDICATED in pregnancy?', '["Labetalol", "Nifedipine", "ACE Inhibitors (e.g., Lisinopril) and ARBs", "Methyldopa"]', 2, 'ACEIs/ARBs are teratogenic (renal dysgenesis, oligohydramnios).'),
    (v_case_id, 'What is \"Superimposed Pre-eclampsia\"?', '["High BP that gets better", "New onset proteinuria or severe features in a patient with known chronic hypertension", "Pre-eclampsia in a teenager", "None of the above"]', 1, 'Chronic HTN patients have a 25% risk of developing pre-eclampsia.');

    ---------------------------------------------------------------------------
    -- CASE 16: Magnesium Toxicity (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Magnesium Overdose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Magnesium Overdose', 'A patient on a Magnesium drip for pre-eclampsia now has loss of deep tendon reflexes (DTRs) and a respiratory rate of 8.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on a Magnesium drip for pre-eclampsia now has loss of deep tendon reflexes (DTRs) and a respiratory rate of 8.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first sign of Magnesium toxicity?', '["Seizures", "Loss of Deep Tendon Reflexes (Patellar)", "Cardiac arrest", "Fever"]', 1, 'Reflexes disappear before respiratory or cardiac depression occurs.'),
    (v_case_id, 'How is Magnesium primarily excreted?', '["Liver", "Kidneys", "Lungs", "Skin"]', 1, 'Magnesium is renal-excreted; patients with high creatinine need lower doses.'),
    (v_case_id, 'What is the antidote for Magnesium toxicity?', '["Naloxone", "Calcium Gluconate", "Protamine Sulfate", "Flumazenil"]', 1, '1 gram of IV Calcium Gluconate is the immediate antidote.');

    ---------------------------------------------------------------------------
    -- CASE 17: Intrahepatic Cholestasis of Pregnancy - ICP (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Itching in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Itching in Pregnancy', 'A patient at 34 weeks reports intense itching, especially on the palms of her hands and soles of her feet. There is no visible rash.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 34 weeks reports intense itching, especially on the palms of her hands and soles of her feet. There is no visible rash.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab test is most specific for diagnosing ICP?', '["ALT/AST", "Bilirubin", "Total Bile Acids (elevated)", "CBC"]', 2, 'Elevated bile acids are diagnostic for ICP.'),
    (v_case_id, 'What is the primary medication used to treat ICP and lower bile acids?', '["Benadryl", "Ursodeoxycholic Acid (Ursodiol)", "Hydrocortisone cream", "Penicillin"]', 1, 'Ursodiol improves bile flow and reduces itching/fetal risk.'),
    (v_case_id, 'What is the main FETAL risk associated with ICP?', '["Cleft lip", "Stillbirth (Intrauterine Fetal Demise)", "Macrosomia", "Limb defects"]', 1, 'ICP is associated with sudden, unexplained stillbirth, leading to early delivery (usually 36-37 weeks).');

    ---------------------------------------------------------------------------
    -- CASE 18: Acute Fatty Liver of Pregnancy - AFLP (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Liver Failure in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Liver Failure in Pregnancy', 'A patient at 36 weeks presents with jaundice, nausea, and vomiting. Labs show low glucose, high ammonia, and prolonged PT/INR.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 36 weeks presents with jaundice, nausea, and vomiting. Labs show low glucose, high ammonia, and prolonged PT/INR.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which lab finding helps distinguish AFLP from HELLP syndrome?', '["High ALT", "Low platelets", "Hypoglycemia (low glucose) and prolonged PT/INR", "High LDH"]', 2, 'AFLP causes true liver FAILURE (low glucose, coagulopathy), which is rare in HELLP.'),
    (v_case_id, 'What is the management of AFLP?', '["Observation", "Immediate delivery", "High-fat diet", "Antibiotics"]', 1, 'AFLP is an obstetric emergency requiring immediate delivery.'),
    (v_case_id, 'AFLP is associated with a deficiency in which enzyme in the fetus?', '["G6PD", "Long-chain 3-hydroxyacyl-CoA dehydrogenase (LCHAD)", "Lactase", "Phenylalanine hydroxylase"]', 1, 'Maternal-fetal fatty acid metabolism defects are implicated.');

    ---------------------------------------------------------------------------
    -- CASE 19: Cervical Insufficiency (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Cervix' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Cervix', 'A patient with a history of two 20-week painless pregnancy losses presents at 14 weeks for evaluation.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of two 20-week painless pregnancy losses presents at 14 weeks for evaluation.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic presentation of cervical insufficiency?', '["Painful contractions", "Painless cervical dilation and second-trimester loss", "Water breaking at 40 weeks", "Heavy bleeding"]', 1, 'Painless dilation is the hallmark.'),
    (v_case_id, 'What procedure is performed to reinforce the cervix?', '["C-section", "Cerclage (e.g., McDonald or Shirodkar procedure)", "Hysterectomy", "D&C"]', 1, 'A cerclage is a \"purse-string\" suture placed around the cervix.'),
    (v_case_id, 'When is a history-indicated cerclage typically placed?', '["6 weeks", "12-14 weeks", "24 weeks", "At delivery"]', 1, 'It is placed in the early second trimester.');

    ---------------------------------------------------------------------------
    -- CASE 20: Preterm Labor - Tocolysis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Preterm Labor Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Preterm Labor Management', 'A patient at 28 weeks presents with regular contractions and a cervix that is 3 cm dilated.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 28 weeks presents with regular contractions and a cervix that is 3 cm dilated.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary goal of \"Tocolytics\" (e.g., Nifedipine, Indomethacin)?', '["To stop labor until 40 weeks", "To delay delivery for 48 hours to allow corticosteroids to work", "To prevent infection", "To mature the placenta"]', 1, 'Tocolysis only buys time for steroid administration and transport to a tertiary center.'),
    (v_case_id, 'Which medication is given for \"Neuroprotection\" of the fetus before 32 weeks?', '["Betamethasone", "Magnesium Sulfate", "Penicillin", "Insulin"]', 1, 'Magnesium sulfate reduces the risk of cerebral palsy in very preterm infants.'),
    (v_case_id, 'What is the purpose of Betamethasone (corticosteroids) in preterm labor?', '["To prevent GBS", "To promote fetal lung maturity (surfactant production)", "To stop contractions", "To lower maternal BP"]', 1, 'Steroids reduce RDS, IVH, and NEC in the neonate.');

    ---------------------------------------------------------------------------
    -- CASE 21: PPROM Management (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Preterm Rupture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Preterm Rupture', 'A patient at 31 weeks has confirmed ROM. She has no contractions, no fever, and a normal FHR.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 31 weeks has confirmed ROM. She has no contractions, no fever, and a normal FHR.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard management for \"stable\" PPROM before 34 weeks?', '["Immediate delivery", "Expectant management, Latency antibiotics, and Steroids", "Strict bed rest for 10 weeks", "Amniopatch"]', 1, 'Antibiotics like Ampicillin and Erythromycin extend the \"latency\" period.'),
    (v_case_id, 'Which medication should be avoided as a tocolytic in PPROM because it can mask a fever?', '["Nifedipine", "Indomethacin", "Terbutaline", "None"]', 1, 'Indomethacin is also usually avoided after 32 weeks due to ductus arteriosus closure risks.'),
    (v_case_id, 'If the patient develops fever and uterine tenderness, what is the diagnosis?', '["Normal labor", "Chorioamnionitis (Intraamniotic infection)", "Abruption", "Previa"]', 1, 'Infection is an indication for delivery regardless of gestational age.');

    ---------------------------------------------------------------------------
    -- CASE 22: Monoamniotic Twin Risks (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'MoMo Twin Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'MoMo Twin Management', 'A pregnancy is confirmed as monochorionic-monoamniotic (MoMo) twins at 12 weeks.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnancy is confirmed as monochorionic-monoamniotic (MoMo) twins at 12 weeks.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the unique, life-threatening risk for MoMo twins?', '["TTTS", "Umbilical cord entanglement", "High blood pressure", "Diabetes"]', 1, 'Sharing one sac allows their cords to knot and entangle.'),
    (v_case_id, 'At what gestational age is a MoMo twin pregnancy typically delivered via Cesarean?', '["32-34 weeks", "37 weeks", "40 weeks", "28 weeks"]', 0, 'Early delivery is required to avoid sudden death from cord accidents.'),
    (v_case_id, 'Can MoMo twins be delivered vaginally?', '["Yes", "No, C-section is required to avoid cord accidents during labor"]', 1, 'Cesarean delivery is standard for MoMo twins.');

    ---------------------------------------------------------------------------
    -- CASE 23: Thyroid Storm in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Thyroid Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Thyroid Emergency', 'A patient with a history of Grave''s disease presents in labor with a fever of 104, tachycardia of 160, and confusion.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of Grave''s disease presents in labor with a fever of 104, tachycardia of 160, and confusion.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Chorioamnionitis", "Thyroid Storm", "Sepsis", "Eclampsia"]', 1, 'Severe hyperthyroid symptoms in pregnancy constitute a thyroid storm.'),
    (v_case_id, 'What is the preferred antithyroid drug in the FIRST trimester?', '["Methimazole", "Propylthiouracil (PTU)", "Amiodarone", "Iodine"]', 1, 'PTU is preferred in the first trimester; Methimazole is associated with aplasia cutis.'),
    (v_case_id, 'What medication is given to control the tachycardia in thyroid storm?', '["Labetalol", "Propranolol", "Nifedipine", "Atropine"]', 1, 'Propranolol is the standard beta-blocker for thyroid storm.');

    ---------------------------------------------------------------------------
    -- CASE 24: Hypothyroidism in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Thyroid Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Thyroid Management', 'A woman on Levothyroxine for Hashimoto''s thyroiditis just found out she is 6 weeks pregnant.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman on Levothyroxine for Hashimoto''s thyroiditis just found out she is 6 weeks pregnant.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the Levothyroxine dose typically change in pregnancy?', '["Decreases", "Increases by ~30-50%", "Stays the same", "Should be stopped"]', 1, 'Demand for thyroid hormone increases early in pregnancy.'),
    (v_case_id, 'What is the fetal risk of untreated maternal hypothyroidism?', '["Large baby", "Impaired neurocognitive development (Cretinism)", "Limb defects", "None"]', 1, 'Fetal brain development depends on maternal T4 in the first trimester.'),
    (v_case_id, 'How often should TSH be monitored in a pregnant hypothyroid patient?', '["Once a trimester", "Every 4-6 weeks", "Only once", "Weekly"]', 1, 'Frequent monitoring is required to adjust dosing.');

    ---------------------------------------------------------------------------
    -- CASE 25: SLE in Pregnancy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lupus Flare vs Preeclampsia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lupus Flare vs Preeclampsia', 'A patient with SLE at 30 weeks has new hypertension, proteinuria, and joint pain.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with SLE at 30 weeks has new hypertension, proteinuria, and joint pain.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which lab test helps distinguish an SLE flare from pre-eclampsia?', '["ALT/AST", "Complement levels (C3, C4) and anti-dsDNA", "CBC", "Urine protein"]', 1, 'Low complement levels suggest a lupus flare (consumption); they are normal in pre-eclampsia.'),
    (v_case_id, 'What neonatal heart condition is associated with maternal Anti-Ro/SSA or Anti-La/SSB antibodies?', '["VSD", "Congenital Heart Block", "Tetralogy of Fallot", "ASD"]', 1, 'Maternal antibodies cross the placenta and damage the fetal AV node.'),
    (v_case_id, 'What is the treatment for a lupus flare in pregnancy?', '["Methotrexate", "Corticosteroids", "High-dose aspirin", "None"]', 1, 'Steroids are used to manage flares.');

    ---------------------------------------------------------------------------
    -- CASE 26: Cardiac Disease - Mitral Stenosis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Valvular Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Valvular Disease', 'A patient with a history of Rheumatic Heart Disease and Mitral Stenosis is in labor.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of Rheumatic Heart Disease and Mitral Stenosis is in labor.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is Mitral Stenosis particularly dangerous in pregnancy?', '["Low heart rate", "Increased blood volume and tachycardia lead to pulmonary edema", "It causes low blood pressure", "It causes diabetes"]', 1, 'The increased volume and heart rate shorten diastolic filling time, causing backlog into the lungs.'),
    (v_case_id, 'What is the most common cause of death in pregnant women with heart disease?', '["Infection", "Heart failure/Pulmonary edema", "Bleeding", "Embolism"]', 1, 'Heart failure due to volume shifts is the primary risk.'),
    (v_case_id, 'The \"danger period\" for heart failure is:', '["First trimester", "Immediately postpartum (due to \"autotransfusion\" of blood from the contracting uterus)", "Before pregnancy", "During sleep"]', 1, 'The sudden volume shift back into circulation after delivery can overwhelm the heart.');

    ---------------------------------------------------------------------------
    -- CASE 27: Peripartum Cardiomyopathy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Heart Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Heart Failure', 'A woman 2 weeks postpartum presents with worsening shortness of breath and edema. Echo shows an Ejection Fraction (EF) of 30%.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman 2 weeks postpartum presents with worsening shortness of breath and edema. Echo shows an Ejection Fraction (EF) of 30%.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Peripartum Cardiomyopathy?', '["Heart failure during the first trimester", "Dilated cardiomyopathy occurring in the last month of pregnancy or first 5 months postpartum", "High BP after delivery", "A heart murmur"]', 1, 'It is a diagnosis of exclusion with specific timing.'),
    (v_case_id, 'If a patient''s EF does not recover, should she get pregnant again?', '["Yes", "No, there is a very high risk of recurrence and death"]', 1, 'Future pregnancy is contraindicated if the EF remains low.'),
    (v_case_id, 'What is the initial management?', '["Diuretics, ACE inhibitors (postpartum only), and Beta-blockers", "Immediate C-section", "Antibiotics", "IV fluids"]', 0, 'Standard heart failure therapy is used.');

    ---------------------------------------------------------------------------
    -- CASE 28: Pyelonephritis in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Kidney Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Kidney Infection', 'A 24-week patient presents with fever, chills, and flank pain.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-week patient presents with fever, chills, and flank pain.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard management for pyelonephritis in a pregnant patient?', '["Oral antibiotics at home", "Inpatient hospitalization and IV antibiotics", "Observation", "C-section"]', 1, 'Pregnancy is an indication for hospitalization due to the risk of ARDS and septic shock.'),
    (v_case_id, 'Which side is more commonly affected by hydronephrosis and pyelonephritis in pregnancy?', '["Left", "Right", "Equal", "Neither"]', 1, 'Dextrorotation of the uterus and the path of the right ovarian vein compress the right ureter more.'),
    (v_case_id, 'Pyelonephritis in pregnancy is a major risk factor for:', '["Diabetes", "Preterm Labor", "Macrosomia", "Placenta Previa"]', 1, 'The systemic inflammatory response often triggers contractions.');

    ---------------------------------------------------------------------------
    -- CASE 29: Asymptomatic Bacteriuria (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Silent UTI' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Silent UTI', 'A routine urine culture at 12 weeks shows > 100,000 CFU of E. coli. The patient has no symptoms.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A routine urine culture at 12 weeks shows > 100,000 CFU of E. coli. The patient has no symptoms.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Do you treat asymptomatic bacteriuria in pregnancy?', '["No", "Yes, always"]', 1, 'Untreated bacteriuria has a 25-40% risk of progressing to pyelonephritis.'),
    (v_case_id, 'Which of these is a safe antibiotic for UTI in the second trimester?', '["Tetracycline", "Nitrofurantoin (Macrobid)", "Ciprofloxacin", "Chloramphenicol"]', 1, 'Nitrofurantoin, Cephalexin, and Amoxicillin are generally safe.'),
    (v_case_id, 'GBS bacteriuria (any count) in pregnancy is an indication for:', '["Immediate delivery", "Intrapartum antibiotic prophylaxis (GBS prophylaxis) during labor", "C-section", "No treatment"]', 1, 'GBS in the urine signifies heavy colonization and requires protection for the baby during labor.');

    ---------------------------------------------------------------------------
    -- CASE 30: HIV in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HIV and Delivery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HIV and Delivery', 'A pregnant patient is HIV-positive and on HAART therapy.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant patient is HIV-positive and on HAART therapy.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the viral load threshold for recommending a Cesarean delivery?', '["< 50 copies", "> 1000 copies/mL", "Always C-section", "Any viral load"]', 1, 'If viral load is > 1000, C-section is recommended at 38 weeks to reduce transmission.'),
    (v_case_id, 'What medication is given IV during labor/delivery to further reduce transmission?', '["Zidovudine (AZT)", "Penicillin", "Acyclovir", "Heparin"]', 0, 'AZT is the standard intrapartum treatment.'),
    (v_case_id, 'Is breastfeeding recommended for HIV-positive mothers in developed countries?', '["Yes", "No, avoid breastfeeding to prevent transmission"]', 1, 'Breastfeeding is a major route of postnatal transmission.');

    ---------------------------------------------------------------------------
    -- CASE 31: HSV in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Herpes in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Herpes in Pregnancy', 'A patient with a history of genital herpes is now 36 weeks pregnant.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of genital herpes is now 36 weeks pregnant.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard management for patients with a history of HSV starting at 36 weeks?', '["C-section", "Daily antiviral suppression (e.g., Acyclovir or Valacyclovir)", "No treatment", "Weekly cultures"]', 1, 'Suppression reduces the risk of active lesions at the time of delivery.'),
    (v_case_id, 'If a patient has ACTIVE genital lesions or prodromal symptoms at the onset of labor, what is the management?', '["Vaginal delivery with soap", "Cesarean delivery", "Give extra Acyclovir and deliver vaginally", "Wait for lesions to heal"]', 1, 'Active lesions carry a high risk of neonatal herpes, a devastating condition.'),
    (v_case_id, 'What if she has a history of HSV but NO active lesions at labor?', '["C-section", "Vaginal delivery is safe", "Induction", "Forceps"]', 1, 'No lesions = Vaginal delivery permitted.');

    ---------------------------------------------------------------------------
    -- CASE 32: Syphilis in Pregnancy (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Syphilis Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Syphilis Screening', 'A patient''s routine RPR is positive, and the treponemal test confirms syphilis.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient''s routine RPR is positive, and the treponemal test confirms syphilis.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ONLY treatment for syphilis in pregnancy?', '["Doxycycline", "Azithromycin", "Penicillin G", "Ceftriaxone"]', 2, 'Only Penicillin crosses the placenta and treats the fetus.'),
    (v_case_id, 'If a pregnant patient is allergic to penicillin, what must be done?', '["Give Doxycycline", "Desensitize the patient to penicillin and then treat with Penicillin G", "Give nothing", "Use Macrolides"]', 1, 'Penicillin is non-negotiable in pregnancy for syphilis.'),
    (v_case_id, 'A patient develops fever, chills, and contractions shortly after Penicillin treatment. What is this?', '["Allergic reaction", "Jarisch-Herxheimer reaction", "Sepsis", "Labor"]', 1, 'This reaction to dying spirochetes can trigger preterm labor.');

    ---------------------------------------------------------------------------
    -- CASE 33: Hepatitis B in Pregnancy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hepatitis B Transmission' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hepatitis B Transmission', 'A pregnant woman is found to be HBsAg positive.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant woman is found to be HBsAg positive.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk of transmission to the baby if the mother is HBeAg positive?', '["10%", "90%", "0%", "50%"]', 1, 'HBeAg signifies high infectivity and viral replication.'),
    (v_case_id, 'What must the newborn receive within 12 hours of birth?', '["Hepatitis B vaccine", "Hepatitis B Immune Globulin (HBIG)", "Both Vaccine and HBIG", "Antibiotics"]', 2, 'Combination of passive and active immunization prevents ~95% of chronic infection.'),
    (v_case_id, 'Is breastfeeding safe in Hep B positive mothers?', '["No", "Yes, if the baby has received the vaccine and HBIG"]', 1, 'Breastfeeding does not add extra risk beyond the birth itself.');

    ---------------------------------------------------------------------------
    -- CASE 34: Rubella in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rubella Immunity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rubella Immunity', 'A pregnant woman is found to be \"Rubella Non-Immune\" at her first visit.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant woman is found to be \"Rubella Non-Immune\" at her first visit.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can you give the MMR vaccine to a pregnant woman?', '["Yes", "No, it is a live virus vaccine and is contraindicated in pregnancy"]', 1, 'Wait until the immediate postpartum period to vaccinate.'),
    (v_case_id, 'What is the \"Classic Triad\" of congenital rubella syndrome?', '["Fever, Rash, Pain", "Cataracts, Deafness, and PDA (Heart defects)", "Small head, Seizures, Jaundice", "Limb defects"]', 1, 'These are the hallmark features of early exposure.'),
    (v_case_id, 'When is the risk to the fetus the highest?', '["First trimester", "Third trimester", "During delivery", "Always equal"]', 0, 'Organogenesis is the most vulnerable period.');

    ---------------------------------------------------------------------------
    -- CASE 35: Varicella in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chickenpox Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chickenpox Risk', 'A pregnant woman who has never had chickenpox is exposed to a child with an active rash.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant woman who has never had chickenpox is exposed to a child with an active rash.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management for a non-immune pregnant woman exposed to varicella?', '["Give MMR", "Give Varicella-Zoster Immune Globulin (VariZIG) within 96 hours", "Do nothing", "Immediate delivery"]', 1, 'VariZIG can prevent or attenuate the infection.'),
    (v_case_id, 'Maternal varicella infection just before or after delivery is dangerous for the baby because:', '["The baby has no antibodies", "It causes limb defects", "It causes deafness", "It doesn''t matter"]', 0, 'Neonatal varicella has a high mortality rate if the mother doesn''t have time to pass antibodies.'),
    (v_case_id, 'Varicella PNEUMONIA in a pregnant woman is:', '["A mild cold", "A life-threatening complication", "Normal", "Rare"]', 1, 'Pregnant women are at high risk for severe respiratory complications from VZV.');

    ---------------------------------------------------------------------------
    -- CASE 36: Parvovirus B19 (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Slapped Cheek Virus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Slapped Cheek Virus', 'A teacher is exposed to Parvovirus B19 (\"Fifth Disease\") at school.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A teacher is exposed to Parvovirus B19 (\"Fifth Disease\") at school.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of fetal damage in Parvovirus B19?', '["Limb defects", "Destruction of RBC precursors leading to severe fetal anemia", "Brain infection", "Heart block"]', 1, 'Parvovirus attacks erythroid progenitor cells.'),
    (v_case_id, 'What ultrasound finding is characteristic of severe fetal anemia?', '["Large head", "Hydrops Fetalis (ascites, effusions, skin edema)", "Short limbs", "Empty bladder"]', 1, 'High-output heart failure from anemia leads to hydrops.'),
    (v_case_id, 'What measurement can screen for fetal anemia non-invasively?', '["Middle Cerebral Artery (MCA) Doppler peak systolic velocity", "Uterine artery Doppler", "Cord blood gas", "Abdominal circumference"]', 0, 'High MCA velocity indicates thin, fast-moving blood (anemia).');

    ---------------------------------------------------------------------------
    -- CASE 37: Toxoplasmosis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cats and Meat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cats and Meat', 'A pregnant patient asks if she can keep her cat and eat her steak rare.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant patient asks if she can keep her cat and eat her steak rare.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is Toxoplasma gondii primarily transmitted?', '["Cat feces (oocysts) and undercooked meat", "Dog saliva", "Mosquitoes", "Airborne"]', 0, 'Cats are the definitive host.'),
    (v_case_id, 'What is the classic \"Intracranial\" finding in congenital toxoplasmosis?', '["Periventricular calcifications", "Diffuse intracranial calcifications", "No calcifications", "Brain tumors"]', 1, 'Toxo causes diffuse calcifications; CMV causes periventricular.'),
    (v_case_id, 'What is the classic triad of congenital toxoplasmosis?', '["Chorioretinitis, Hydrocephalus, and Intracranial calcifications", "PDA, Cataracts, Deafness", "Headache, Fever, Rash", "None"]', 0, 'These three are the hallmark signs.');

    ---------------------------------------------------------------------------
    -- CASE 38: CMV in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'CMV Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'CMV Risks', 'A woman with young children at home is concerned about Cytomegalovirus (CMV).', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman with young children at home is concerned about Cytomegalovirus (CMV).', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common congenital infection?', '["Rubella", "CMV", "HIV", "Syphilis"]', 1, 'CMV is the most frequent TORCH infection.'),
    (v_case_id, 'What is the most common LONG-TERM sequela of congenital CMV?', '["Diabetes", "Sensorineural hearing loss", "Blindness", "Limping"]', 1, 'CMV is a leading cause of non-genetic childhood deafness.'),
    (v_case_id, 'Where are the intracranial calcifications located in CMV?', '["Diffuse", "Periventricular", "Cerebellar", "None"]', 1, 'Periventricular calcifications are classic for CMV.');

    ---------------------------------------------------------------------------
    -- CASE 39: Obesity in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'BMI and Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'BMI and Pregnancy', 'A patient with a BMI of 42 presents for prenatal care.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a BMI of 42 presents for prenatal care.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Obesity increases the risk for which of the following?', '["GDM and Pre-eclampsia", "Macrosomia and C-section", "Neural tube defects", "All of the above"]', 3, 'Obesity is a major risk factor for almost all obstetric complications.'),
    (v_case_id, 'What is the recommended weight gain for an obese patient (BMI > 30)?', '["25-35 lbs", "11-20 lbs", "0 lbs", "50 lbs"]', 1, 'Obese women should gain significantly less than normal-weight women.'),
    (v_case_id, 'Obese women are at higher risk for which POSTPARTUM complication?', '["VTE (clots)", "Wound infection/dehiscence", "PPH", "All of the above"]', 3, 'Post-operative and post-delivery risks are elevated.');

    ---------------------------------------------------------------------------
    -- CASE 40: Advanced Maternal Age - AMA (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AMA Counseling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AMA Counseling', 'A 42-year-old woman is pregnant for the first time.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman is pregnant for the first time.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of AMA?', '["Age 30", "Age 35 at the time of delivery", "Age 40", "Age 45"]', 1, '35 is the historical cutoff where the risk of chromosomal abnormalities outweighs amniocentesis risks.'),
    (v_case_id, 'What is the risk of Down Syndrome at age 35?', '["1 in 1000", "1 in 365", "1 in 10", "1 in 10,000"]', 1, 'The risk increases exponentially after age 35.'),
    (v_case_id, 'AMA also increases the risk of:', '["Pre-eclampsia and GDM", "Stillbirth", "Placental abruption", "All of the above"]', 3, 'Vascular and metabolic risks increase with age.');

    ---------------------------------------------------------------------------
    -- CASE 41: Opioid Use Disorder in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Substance Abuse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Substance Abuse', 'A pregnant patient admits to using heroin daily.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant patient admits to using heroin daily.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended management for Opioid Use Disorder in pregnancy?', '["Abrupt withdrawal (Cold turkey)", "Opioid Agonist Therapy (Methadone or Buprenorphine)", "Lock the patient in a room", "No treatment"]', 1, 'Medication-assisted treatment prevents withdrawal-induced fetal stress and relapse.'),
    (v_case_id, 'What is the syndrome seen in the newborn after delivery?', '["Fetal Alcohol Syndrome", "Neonatal Abstinence Syndrome (NAS)", "Hydrops", "SIDS"]', 1, 'NAS symptoms include irritability, high-pitched cry, tremors, and poor feeding.'),
    (v_case_id, 'Abrupt withdrawal during pregnancy can cause:', '["Fetal distress and fetal demise", "Better health", "Macrosomia", "None"]', 0, 'Withdrawal is highly stressful for the fetus.');

    ---------------------------------------------------------------------------
    -- CASE 42: Fetal Alcohol Syndrome - FAS (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Alcohol Effects' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Alcohol Effects', 'A patient reports drinking \"a few glasses of wine\" throughout her pregnancy.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient reports drinking \"a few glasses of wine\" throughout her pregnancy.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"safe\" amount of alcohol in pregnancy?', '["One glass a day", "None", "Only beer", "Only after 20 weeks"]', 1, 'There is no established safe threshold for alcohol.'),
    (v_case_id, 'Which facial features are characteristic of FAS?', '["Smooth philtrum, thin upper lip, and short palpebral fissures", "Large nose, thick lips", "Cleft palate", "Small ears"]', 0, 'These are the hallmark dysmorphic features.'),
    (v_case_id, 'FAS is the leading cause of:', '["Deafness", "Preventable intellectual disability", "Heart failure", "Blindness"]', 1, 'Alcohol is a potent neuroteratogen.');

    ---------------------------------------------------------------------------
    -- CASE 43: Thrombophilia - Factor V Leiden (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clotting Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clotting Risk', 'A patient with a history of Factor V Leiden mutation is pregnant.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of Factor V Leiden mutation is pregnant.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Factor V Leiden is an example of a:', '["Bleeding disorder", "Inherited thrombophilia", "Autoimmune disease", "Infection"]', 1, 'It causes resistance to activated Protein C.'),
    (v_case_id, 'What is the risk to the pregnancy from thrombophilias?', '["Macrosomia", "VTE (clots) and Placental-mediated complications (Abruption, FGR, Loss)", "Diabetes", "Twins"]', 1, 'Placental thrombosis can lead to growth issues and pregnancy loss.'),
    (v_case_id, 'What is the management for a patient with a prior VTE and Factor V Leiden?', '["Prophylactic or Therapeutic Anticoagulation (LMWH)", "Aspirin only", "Bed rest", "C-section only"]', 0, 'LMWH is the treatment of choice in pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 44: Antiphospholipid Syndrome - APS (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Recurrent Pregnancy Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Recurrent Pregnancy Loss', 'A patient has a history of three consecutive first-trimester losses and one DVT.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a history of three consecutive first-trimester losses and one DVT.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two diagnostic criteria components for APS?', '["Age and weight", "Clinical event (VTE or pregnancy loss) and positive antibodies (Lupus Anticoagulant, Anticardiolipin, Anti-beta2-GPI)", "Fever and rash", "High sugar and high BP"]', 1, 'Diagnosis requires both a clinical event and laboratory evidence.'),
    (v_case_id, 'What is the management of APS during pregnancy?', '["Warfarin", "Combination of low-dose Aspirin and Heparin (LMWH)", "Antibiotics", "Steroids"]', 1, 'This combination significantly improves live birth rates.'),
    (v_case_id, 'Is Warfarin safe in pregnancy?', '["Yes", "No, it is teratogenic (warfarin embryopathy)"]', 1, 'Warfarin crosses the placenta; Heparin/LMWH does not.');

    ---------------------------------------------------------------------------
    -- CASE 45: Trauma in Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Trauma Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Trauma Management', 'A patient at 28 weeks gestation is in a motor vehicle accident.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 28 weeks gestation is in a motor vehicle accident.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who is the priority in the management of a pregnant trauma patient?', '["The baby", "The mother", "Both equally", "The father"]', 1, 'The best way to save the baby is to stabilize the mother.'),
    (v_case_id, 'How long should a stable pregnant patient be monitored on the fetal monitor after trauma?', '["1 hour", "At least 4-6 hours (to rule out abruption)", "10 minutes", "24 hours"]', 1, 'Abruption can manifest several hours after the initial trauma.'),
    (v_case_id, 'What should be given to all Rh-negative trauma patients?', '["RhoGAM", "Antibiotics", "Tetanus shot", "Fluids"]', 0, 'Trauma can cause fetal-maternal hemorrhage, leading to sensitization.');

    ---------------------------------------------------------------------------
    -- CASE 46: Appendicitis in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surgical Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surgical Emergency', 'A pregnant patient at 30 weeks has RUQ pain and fever.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant patient at 30 weeks has RUQ pain and fever.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does appendicitis often present with RUQ pain in late pregnancy?', '["The appendix moves to the other side", "The enlarging uterus displaces the appendix upward and laterally toward the RUQ", "It doesn''t, it is always RLQ", "The liver moves down"]', 1, 'Classic McBurney''s point tenderness is often absent in late pregnancy.'),
    (v_case_id, 'What is the most common non-obstetric surgical emergency in pregnancy?', '["Gallstones", "Appendicitis", "Hernia", "Bowel obstruction"]', 1, 'Appendicitis occurs in ~1 in 1500 pregnancies.'),
    (v_case_id, 'What is the best initial imaging for suspected appendicitis in pregnancy?', '["CT scan", "Ultrasound (graded compression) or MRI", "X-ray", "None"]', 1, 'US/MRI avoids ionizing radiation.');

    ---------------------------------------------------------------------------
    -- CASE 47: Cholelithiasis in Pregnancy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Gallstones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Gallstones', 'A 32-week patient has RUQ pain after eating a fatty meal.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-week patient has RUQ pain after eating a fatty meal.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is pregnancy a \"lithogenic\" (stone-forming) state?', '["High progesterone causes gallbladder stasis and high estrogen increases cholesterol saturation", "The baby eats the bile", "High sugar", "Low fluid intake"]', 0, 'Hormonal changes favor the formation of gallstones.'),
    (v_case_id, 'What is the management for symptomatic cholecystitis?', '["Always immediate surgery", "Conservative management (fluids, antibiotics, diet) first; surgery if it fails", "Deliver the baby", "Ignore it"]', 1, 'Most cases are managed conservatively, but laparoscopic cholecystectomy is safe if needed.'),
    (v_case_id, 'In which trimester is surgery generally safest?', '["First", "Second", "Third", "None"]', 1, 'The second trimester avoids early teratogenesis and the bulky uterus of the third trimester.');

    ---------------------------------------------------------------------------
    -- CASE 48: Polyhydramnios (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Excess Fluid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Excess Fluid', 'A patient at 36 weeks has an Amniotic Fluid Index (AFI) of 28.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 36 weeks has an Amniotic Fluid Index (AFI) of 28.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Polyhydramnios?', '["AFI > 10 cm", "AFI >= 24 cm or Single Deepest Pocket >= 8 cm", "AFI < 5 cm", "None"]', 1, 'AFI >= 24 is the standard definition.'),
    (v_case_id, 'What are common causes of polyhydramnios?', '["Maternal Diabetes", "Fetal GI obstruction (e.g., Duodenal atresia)", "Multiple gestation", "All of the above"]', 3, 'Anything that increases production (diabetes) or decreases swallowing (obstruction) causes polyhydramnios.'),
    (v_case_id, 'What is a risk at the time of Rupture of Membranes with polyhydramnios?', '["Diabetes", "Cord Prolapse", "Macrosomia", "Hypertension"]', 1, 'The large volume of fluid rushing out can carry the cord with it.');

    ---------------------------------------------------------------------------
    -- CASE 49: Oligohydramnios (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Fluid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Fluid', 'A patient at 38 weeks has an AFI of 3 cm.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 38 weeks has an AFI of 3 cm.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Oligohydramnios?', '["AFI < 5 cm or Single Deepest Pocket < 2 cm", "AFI < 10 cm", "AFI > 24 cm", "None"]', 0, 'AFI < 5 is the standard definition.'),
    (v_case_id, 'What is the primary source of amniotic fluid in the second half of pregnancy?', '["Maternal blood", "Fetal urine", "The placenta", "Fetal skin"]', 1, 'Low fluid often implies low fetal urine output (e.g., due to placental insufficiency or renal agenesis).'),
    (v_case_id, 'Oligohydramnios at 38 weeks is an indication for:', '["Bed rest", "Delivery (Induction of labor)", "Water intake", "C-section only"]', 1, 'Isolated oligohydramnios at term is an indication for delivery.');

    ---------------------------------------------------------------------------
    -- CASE 50: Intrauterine Fetal Demise - IUFD (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fetal Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fetal Loss', 'A woman at 32 weeks reports \"no fetal movement\" for 24 hours. Ultrasound confirms no cardiac activity.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman at 32 weeks reports \"no fetal movement\" for 24 hours. Ultrasound confirms no cardiac activity.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management of IUFD?', '["Immediate C-section", "Induction of labor (vaginal delivery is preferred)", "Wait for spontaneous labor", "Antibiotics only"]', 1, 'Vaginal delivery is the safest and preferred route for the mother.'),
    (v_case_id, 'What is a systemic risk to the mother if the dead fetus is retained for several weeks?', '["Diabetes", "DIC (consumptive coagulopathy)", "Liver failure", "Fever"]', 1, 'Release of thromboplastin from the decomposing fetus can trigger DIC.'),
    (v_case_id, 'What workup should be performed to find the cause of IUFD?', '["Fetal autopsy and placental pathology", "Maternal thrombophilia screening", "Kleihauer-Betke test", "All of the above"]', 3, 'A comprehensive workup is needed to counsel for future pregnancies.');

    RAISE NOTICE 'SUCCESS: 50 High-risk pregnancy Case Blocks registered.';
END $$;

COMMIT;
