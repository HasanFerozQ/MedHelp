BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Normal labor, delivery & postpartum care
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-normal-labor' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-normal-labor" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Pre-labor Evaluation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bishop Score Calculation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bishop Score Calculation', 'A 39-week primigravida presents for induction. On exam, her cervix is 2 cm dilated, 50% effaced, -2 station, soft, and mid-position.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 39-week primigravida presents for induction. On exam, her cervix is 2 cm dilated, 50% effaced, -2 station, soft, and mid-position.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary purpose of the Bishop score?', '["To predict fetal weight", "To predict the likelihood of a successful vaginal delivery after induction", "To determine the need for C-section", "To assess fetal maturity"]', 1, 'The Bishop score evaluates cervical "readiness" for induction.'),
    (v_case_id, 'A Bishop score of < 6 generally suggests which management?', '["Immediate Oxytocin", "Cervical ripening (e.g., Prostaglandins or Foley bulb)", "Immediate C-section", "Discharge home"]', 1, 'An \"unripe\" cervix (Bishop < 6) requires ripening agents before oxytocin induction.'),
    (v_case_id, 'Which component of the Bishop score is most heavily weighted for success?', '["Dilation", "Effacement", "Station", "Consistency"]', 0, 'Cervical dilation is the most important predictor of successful induction.');

    ---------------------------------------------------------------------------
    -- CASE 02: The 7 Cardinal Movements (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mechanics of Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mechanics of Labor', 'A fetus is moving through the birth canal. The head just entered the pelvic inlet in the occiput transverse position.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A fetus is moving through the birth canal. The head just entered the pelvic inlet in the occiput transverse position.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first "Cardinal Movement" of labor?', '["Descent", "Engagement", "Flexion", "Internal Rotation"]', 1, 'Engagement is when the biparietal diameter passes through the pelvic inlet.'),
    (v_case_id, 'Which movement allows the smallest diameter of the fetal head to present to the pelvis?', '["Extension", "Flexion", "External Rotation", "Restitution"]', 1, 'Flexion brings the fetal chin to its chest, presenting the suboccipitobregmatic diameter.'),
    (v_case_id, 'What is the final movement before the delivery of the rest of the body?', '["Internal Rotation", "Extension", "Expulsion", "Engagement"]', 2, 'Expulsion is the delivery of the body after the head and shoulders have emerged.');

    ---------------------------------------------------------------------------
    -- CASE 03: Labor Stages - First Stage (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'First Stage Active Phase' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'First Stage Active Phase', 'A G2P1 woman at 40 weeks is 6 cm dilated and having strong contractions every 2-3 minutes.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A G2P1 woman at 40 weeks is 6 cm dilated and having strong contractions every 2-3 minutes.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what cervical dilation does the "Active Phase" of the first stage of labor now typically start according to ACOG?', '["4 cm", "6 cm", "8 cm", "10 cm"]', 1, 'Current guidelines define 6 cm as the start of the active phase to reduce unnecessary C-sections.'),
    (v_case_id, 'What is the definition of "Active Phase Arrest"?', '["No change in 1 hour", "No change in 4 hours with adequate contractions (or 6 hours with inadequate)", "No change in 2 hours", "Fetal heart rate decels"]', 1, 'Arrest requires 4 hours of adequate (200+ MVUs) contractions or 6 hours of oxytocin without progress.'),
    (v_case_id, 'What tool is used to monitor cervical progress over time?', '["Friedman Curve", "Partogram", "Bishop Score", "Apgar Score"]', 1, 'A partogram (or partograph) is a graphical record of labor progress.');

    ---------------------------------------------------------------------------
    -- CASE 04: Monitoring Contractions (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Montevideo Units' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Montevideo Units', 'An Internal Pressure Catheter (IUPC) is placed. Over a 10-minute period, the patient has 3 contractions with peak pressures of 60, 70, and 65 mmHg above baseline.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An Internal Pressure Catheter (IUPC) is placed. Over a 10-minute period, the patient has 3 contractions with peak pressures of 60, 70, and 65 mmHg above baseline.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the total Montevideo Units (MVUs) for this 10-minute window?', '["65 MVUs", "195 MVUs", "250 MVUs", "300 MVUs"]', 1, 'MVUs = Sum of (Peak pressure - Baseline pressure) in 10 minutes. 60+70+65 = 195.'),
    (v_case_id, 'What is generally considered "adequate" uterine activity for labor progress?', '["100 MVUs", "200-250 MVUs", "500 MVUs", "Any regular contractions"]', 1, '200-250 MVUs is the threshold for adequate labor stimulation.'),
    (v_case_id, 'What is the primary advantage of an IUPC over external tocodynamometry?', '["It is non-invasive", "It measures the actual strength/intensity of contractions", "It prevents infection", "It measures fetal heart rate"]', 1, 'External monitoring only shows the timing/frequency; internal monitoring (IUPC) measures the actual pressure.');

    ---------------------------------------------------------------------------
    -- CASE 05: Fetal Heart Rate - Category II (ACOG)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'FHR Category II Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'FHR Category II Logic', 'A fetal heart rate tracing shows moderate variability, a baseline of 140, and occasional variable decelerations.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A fetal heart rate tracing shows moderate variability, a baseline of 140, and occasional variable decelerations.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which FHR Category does this tracing fall into?', '["Category I (Normal)", "Category II (Indeterminate)", "Category III (Abnormal)", "Category IV"]', 1, 'Category II includes everything not in I or III. It requires evaluation and continued monitoring.'),
    (v_case_id, 'What is the definition of "Moderate Variability"?', '["0-5 bpm", "6-25 bpm", "> 25 bpm", "Sinusoidal pattern"]', 1, 'Moderate variability (6-25 bpm) is a highly reliable sign of a non-acidotic fetus.'),
    (v_case_id, 'What is the first step in "Intrauterine Resuscitation" for concerning FHR?', '["Immediate C-section", "Maternal position change (Left lateral), Oxygen, and IV fluids", "Stop Oxytocin", "Scalp stimulation"]', 1, 'Position change (to relieve cord/vessel compression) and fluids are the initial steps.');

    ---------------------------------------------------------------------------
    -- CASE 06: Second Stage of Labor (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Second Stage Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Second Stage Management', 'A primigravida has been pushing (Second Stage) for 3 hours. She has an epidural. The fetal head is at +2 station.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A primigravida has been pushing (Second Stage) for 3 hours. She has an epidural. The fetal head is at +2 station.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ACOG time limit for the second stage in a primigravida with an epidural before it is "prolonged"?', '["1 hour", "2 hours", "3 hours", "4 hours"]', 2, 'For a nullipara with an epidural, 3 hours is the standard limit (2 hours without epidural).'),
    (v_case_id, 'Which maneuver involves hyperflexing the maternal hips to help resolve shoulder dystocia?', '["Zavanelli", "McRoberts", "Ritgen", "Leopold"]', 1, 'McRoberts is the first-line maneuver for shoulder dystocia.'),
    (v_case_id, 'The \"Turtle Sign\" is associated with:', '["Normal delivery", "Shoulder dystocia", "Face presentation", "Breech delivery"]', 1, 'The turtle sign is the retraction of the fetal head against the perineum.');

    ---------------------------------------------------------------------------
    -- CASE 07: Third Stage of Labor (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Placental Delivery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Placental Delivery', 'The infant has been delivered. The physician is waiting for the placenta.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The infant has been delivered. The physician is waiting for the placenta.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three signs of placental separation?', '["Maternal push, Gush of blood, Cord shortening", "Gush of blood, Lengthening of the cord, Rise of the fundus in the abdomen", "Fetal heart rate drop, Maternal pain, Bleeding", "Uterine bogginess, Cord prolapse, Fever"]', 1, 'These signs indicate the placenta has detached from the uterine wall.'),
    (v_case_id, 'What is the management of choice to prevent Postpartum Hemorrhage (PPH) during the 3rd stage?', '["Expectant management", "Active management (Oxytocin + Controlled cord traction)", "Immediate D&C", "Manual removal of everyone''s placenta"]', 1, 'Active management of the 3rd stage significantly reduces PPH risk.'),
    (v_case_id, 'A placenta that has not delivered within 30 minutes is called:', '["Normal", "Retained placenta", "Placenta accreta", "Placenta previa"]', 1, '30 minutes is the clinical threshold for a retained placenta.');

    ---------------------------------------------------------------------------
    -- CASE 08: Perineal Lacerations (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Laceration Classification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Laceration Classification', 'Following delivery, the physician notes a tear that extends through the perineal muscles and into the anal sphincter but does not involve the rectal mucosa.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following delivery, the physician notes a tear that extends through the perineal muscles and into the anal sphincter but does not involve the rectal mucosa.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What degree of laceration is this?', '["1st degree", "2nd degree", "3rd degree", "4th degree"]', 2, '3rd degree involves the anal sphincter complex (IAS/EAS).'),
    (v_case_id, 'A 4th-degree laceration is defined as:', '["Skin only", "Perineal muscles only", "Into the anal sphincter", "Extension through the anal sphincter into the rectal mucosa"]', 3, '4th degree is the most severe and exposes the rectal lumen.'),
    (v_case_id, 'Which degree of tear involves ONLY the vaginal mucosa and perineal skin?', '["1st degree", "2nd degree", "3rd degree", "4th degree"]', 0, '1st degree is superficial and often doesn''t require repair unless bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 09: Postpartum Involution (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Involution' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Involution', 'A 24-hour postpartum woman is being examined. Her fundus is firm and felt at the level of the umbilicus.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-hour postpartum woman is being examined. Her fundus is firm and felt at the level of the umbilicus.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where should the fundus be immediately after delivery of the placenta?', '["At the umbilicus", "Midway between the symphysis and umbilicus", "At the xiphoid", "Non-palpable"]', 1, 'It typically sits halfway between the pubic bone and the belly button right after delivery, then rises to the umbilicus within 24 hours.'),
    (v_case_id, 'By which postpartum day should the uterus be back in the true pelvis (no longer palpable)?', '["Day 3", "Day 7", "Day 14", "Day 42"]', 2, 'The uterus usually becomes a pelvic organ again by the end of the 2nd week.'),
    (v_case_id, 'What hormone is the primary driver of uterine involution and breastfeeding milk let-down?', '["Estrogen", "Progesterone", "Oxytocin", "Prolactin"]', 2, 'Oxytocin causes uterine contractions (involution) and myoepithelial contraction in the breast (let-down).');

    ---------------------------------------------------------------------------
    -- CASE 10: Postpartum Fever (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Endometritis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Endometritis', 'A patient 2 days after a C-section presents with a fever of 101.5F, uterine tenderness, and foul-smelling lochia.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient 2 days after a C-section presents with a fever of 101.5F, uterine tenderness, and foul-smelling lochia.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mastitis", "UTI", "Endometritis", "Wound infection"]', 2, 'Endometritis is the most common cause of postpartum fever, especially after C-section.'),
    (v_case_id, 'What is the gold standard antibiotic regimen for endometritis?', '["Ceftriaxone and Azithromycin", "Gentamicin and Clindamycin", "Oral Amoxicillin", "Vancomycin"]', 1, 'Clindamycin (for anaerobes) + Gentamicin (for gram-negatives) is the standard treatment.'),
    (v_case_id, 'What is the single most important risk factor for postpartum endometritis?', '["Smoking", "Diabetes", "Cesarean section", "Vaginal delivery"]', 2, 'The risk is ~10-30 times higher after C-section compared to vaginal delivery.');

    ---------------------------------------------------------------------------
    -- CASE 11: Operative Vaginal Delivery (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vacuum vs Forceps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vacuum vs Forceps', 'The 2nd stage of labor is prolonged. The fetal head is at +3 station and in the OA position. The physician decides to perform an operative delivery.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The 2nd stage of labor is prolonged. The fetal head is at +3 station and in the OA position. The physician decides to perform an operative delivery.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a REQUIRED condition for operative vaginal delivery?', '["Ruptured membranes", "Fully dilated cervix", "Knowledge of fetal position", "All of the above"]', 3, 'Operative delivery cannot be performed if the cervix is not 10 cm or membranes are intact.'),
    (v_case_id, 'Which neonatal complication is MORE common with vacuum extraction than forceps?', '["Facial nerve palsy", "Cephalohematoma", "Skull fracture", "Corneal abrasion"]', 1, 'Vacuum is associated with higher rates of cephalohematoma and subgaleal hemorrhage.'),
    (v_case_id, 'Which maternal complication is MORE common with forceps than vacuum?', '["Urinary retention", "3rd and 4th degree perineal lacerations", "Uterine atony", "Postpartum blues"]', 1, 'Forceps increase the risk of severe maternal soft tissue trauma.');

    ---------------------------------------------------------------------------
    -- CASE 12: Episiotomy Logic (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Episiotomy Debate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Episiotomy Debate', 'A physician is considering a mediolateral episiotomy during a difficult delivery.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician is considering a mediolateral episiotomy during a difficult delivery.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current ACOG recommendation regarding routine episiotomy?', '["Recommended for all primigravidas", "Recommended only for large babies", "Routine use should be restricted", "Only midline episiotomies should be used"]', 2, 'Routine episiotomy is no longer recommended as it actually increases the risk of 3rd and 4th degree tears.'),
    (v_case_id, 'What is the advantage of a MEDIOLATERAL episiotomy over a midline one?', '["Lower risk of extension into the anal sphincter", "Easier to repair", "Less blood loss", "Better cosmetic result"]', 0, 'Mediolateral tears are less likely to involve the rectum but are more painful to heal.'),
    (v_case_id, 'A midline episiotomy is more likely to cause which complication?', '["Dyspareunia", "Fecal incontinence (due to 4th degree extension)", "Infection", "Prolapsed uterus"]', 1, 'Midline incisions are prone to \"zippering\" straight through the sphincter.');

    ---------------------------------------------------------------------------
    -- CASE 13: Lactation Physiology (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Milk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Milk', 'A woman is breastfeeding for the first time. She notices a thick, yellowish fluid.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman is breastfeeding for the first time. She notices a thick, yellowish fluid.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this initial fluid called?', '["Foremilk", "Hindmilk", "Colostrum", "Transitional milk"]', 2, 'Colostrum is high in protein and IgA antibodies.'),
    (v_case_id, 'Which hormone is responsible for milk PRODUCTION (lactogenesis)?', '["Oxytocin", "Prolactin", "Estrogen", "Progesterone"]', 1, 'Prolactin stimulates the alveolar cells to produce milk.'),
    (v_case_id, 'Why does milk production not occur DURING pregnancy despite high prolactin?', '["Low estrogen", "High progesterone levels inhibit the action of prolactin", "The baby isn''t sucking", "Low calorie intake"]', 1, 'The drop in progesterone after placental delivery is what triggers the \"milk coming in\" (Stage II lactogenesis).');

    ---------------------------------------------------------------------------
    -- CASE 14: Postpartum Contraception (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Safe Contraception Postpartum' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Safe Contraception Postpartum', 'A breastfeeding mother asks for birth control at her 2-week checkup.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A breastfeeding mother asks for birth control at her 2-week checkup.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which contraceptive class is generally avoided in the first 3-6 weeks postpartum due to VTE risk?', '["Progestin-only pills (Mini-pill)", "Combined Hormonal Contraceptives (Estrogen-containing)", "Copper IUD", "Depo-Provera"]', 1, 'Estrogen increases the risk of blood clots, which is already elevated in the immediate postpartum period.'),
    (v_case_id, 'What is a potential side effect of estrogen-containing pills on breastfeeding?', '["It makes the milk toxic", "It can decrease milk supply", "It causes the baby to have early puberty", "It has no effect"]', 1, 'Estrogen can suppress milk production; progestin-only methods are preferred for breastfeeding mothers.'),
    (v_case_id, 'Can an IUD be placed immediately after delivery of the placenta?', '["No, must wait 6 weeks", "Yes, \"immediate post-placental\" insertion is safe and effective", "Only if it is a copper IUD", "Only if she had a C-section"]', 1, 'Immediate IUD insertion is an excellent LARC option, though expulsion rates are slightly higher than at 6 weeks.');

    ---------------------------------------------------------------------------
    -- CASE 15: Meconium Stained Fluid (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Meconium in Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Meconium in Labor', 'Upon rupture of membranes, the fluid is thick and dark green.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Upon rupture of membranes, the fluid is thick and dark green.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the presence of meconium in the amniotic fluid often represent?', '["Normal fetal bowel maturity", "Fetal stress/hypoxia or vagal stimulation", "Fetal infection", "Maternal dehydration"]', 1, 'Meconium passage can be physiological (in post-term) or a sign of acute stress.'),
    (v_case_id, 'What is the most serious neonatal complication associated with meconium?', '["Meconium Aspiration Syndrome (MAS)", "Neonatal jaundice", "Cerebral palsy", "Gastroschisis"]', 0, 'MAS causes severe chemical pneumonitis and airway obstruction.'),
    (v_case_id, 'If a baby is born through meconium fluid and is VIGOROUS (crying and moving), what is the management?', '["Routine care and suctioning of mouth/nose", "Immediate intubation and tracheal suctioning", "Amnioinfusion", "Immediate antibiotics"]', 0, 'Current NRP guidelines do NOT recommend routine intubation for meconium if the baby is vigorous.');

    ---------------------------------------------------------------------------
    -- CASE 16: Preterm Premature Rupture of Membranes (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPROM Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPROM Logic', 'A patient at 30 weeks gestation reports a "gush of fluid" from the vagina. No contractions.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 30 weeks gestation reports a "gush of fluid" from the vagina. No contractions.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the triad of bedside tests used to confirm ROM?', '["pH test, Glucose test, Urine test", "Pooling, Nitrazine (blue pH), and Ferning", "Leopold maneuvers, US, and CBC", "Speculum, Digital, and Rectal exam"]', 1, 'Pooling in the vault, Nitrazine paper turning blue (alkaline fluid), and fern-like crystallization on a slide are diagnostic.'),
    (v_case_id, 'What is the primary management for PPROM at 30 weeks (assuming no infection)?', '["Immediate delivery", "Expectant management, corticosteroids for lung maturity, and \"latency\" antibiotics", "Strict bed rest for 10 weeks", "Amniopatch"]', 1, 'Latency antibiotics (Ampicillin/Erythro) extend the time until labor and reduce infection.'),
    (v_case_id, 'At what gestational age is delivery usually recommended for PPROM if the patient remains stable?', '["32 weeks", "34 weeks", "37 weeks", "39 weeks"]', 1, 'The risk of infection outweighs the benefits of prematurity after 34 weeks.');

    ---------------------------------------------------------------------------
    -- CASE 17: Intrapartum Antibiotic Prophylaxis (ACOG)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GBS and Antibiotics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GBS and Antibiotics', 'A 38-week GBS-positive patient presents in labor. She is allergic to penicillin (hives).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 38-week GBS-positive patient presents in labor. She is allergic to penicillin (hives).', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line antibiotic for GBS prophylaxis?', '["Penicillin G", "Cefazolin", "Clindamycin", "Vancomycin"]', 0, 'Penicillin is the drug of choice.'),
    (v_case_id, 'For a patient with a "low-risk" penicillin allergy (no anaphylaxis), what is the alternative?', '["Clindamycin", "Cefazolin", "Vancomycin", "Ampicillin"]', 1, 'Cefazolin is appropriate for non-anaphylactic penicillin allergies.'),
    (v_case_id, 'When is a patient considered \"adequately treated\" for GBS?', '["1 dose given", "Antibiotics given > 4 hours prior to delivery", "Antibiotics given for 24 hours", "Any amount of antibiotics"]', 1, '4 hours is the window required for adequate fetal protection.');

    ---------------------------------------------------------------------------
    -- CASE 18: Induction of Labor - Prostaglandins (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Ripening Agents' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Ripening Agents', 'A patient with a Bishop score of 3 is being prepared for induction.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a Bishop score of 3 is being prepared for induction.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which prostaglandin E1 analogue is commonly used (either orally or vaginally) for ripening?', '["Dinoprostone (Cervidil)", "Misoprostol (Cytotec)", "Oxytocin", "Methergine"]', 1, 'Misoprostol is highly effective but associated with higher rates of tachysystole.'),
    (v_case_id, 'What is \"Uterine Tachysystole\"?', '["< 2 contractions in 10 minutes", "> 5 contractions in 10 minutes, averaged over 30 minutes", "1 contraction lasting 1 minute", "Fetal heart rate accelerations"]', 1, 'Tachysystole can lead to fetal distress by decreasing placental blood flow.'),
    (v_case_id, 'In a patient with a PREVIOUS C-section, which ripening method is contraindicated?', '["Foley bulb", "Prostaglandins (Misoprostol/Dinoprostone)", "Amniotomy", "Oxytocin"]', 1, 'Prostaglandins significantly increase the risk of uterine rupture in scarred uteri.');

    ---------------------------------------------------------------------------
    -- CASE 19: Amniotomy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Artificial Rupture of Membranes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Artificial Rupture of Membranes', 'The physician decides to perform an amniotomy (AROM) to augment labor.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The physician decides to perform an amniotomy (AROM) to augment labor.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most immediate risk to assess during and after AROM?', '["Maternal fever", "Umbilical cord prolapse", "Uterine atony", "Placenta previa"]', 1, 'If the fetal head is not well-engaged, the cord can wash down with the fluid.'),
    (v_case_id, 'What should the physician monitor IMMEDIATELY after rupturing the membranes?', '["Maternal blood pressure", "Fetal heart rate", "Uterine tone", "Maternal temperature"]', 1, 'A drop in fetal heart rate could signify cord compression or prolapse.'),
    (v_case_id, 'AROM helps labor progress by:', '["Dilating the cervix directly", "Stimulating endogenous prostaglandin and oxytocin release", "Decreasing fetal weight", "Preventing infection"]', 1, 'AROM often intensifies contractions.');

    ---------------------------------------------------------------------------
    -- CASE 20: Postpartum Contraception - Mini-pill (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Progestin-only Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Progestin-only Pill', 'A 6-week postpartum breastfeeding patient starts the "mini-pill" (progestin-only).', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-week postpartum breastfeeding patient starts the "mini-pill" (progestin-only).', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the critical rule for the mini-pill to maintain efficacy?', '["Take it with food", "Take it at the exact same time every day (3-hour window)", "Take it only after sex", "Take it twice a day"]', 1, 'The mini-pill has a very short half-life; a delay of > 3 hours requires backup for 48 hours.'),
    (v_case_id, 'What is the primary mechanism of action of the mini-pill?', '["Suppression of ovulation", "Thickening of cervical mucus", "Thinning the skin", "Increasing uterine motility"]', 1, 'Unlike COCs, the mini-pill relies primarily on mucus thickening (though it suppresses ovulation in some).'),
    (v_case_id, 'Is the mini-pill safe for patients with a history of VTE?', '["No", "Yes"]', 1, 'Progestin-only methods do not carry the same VTE risk as estrogen.');

    ---------------------------------------------------------------------------
    -- CASE 21: Epidural Anesthesia (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Epidural Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Epidural Complications', 'Immediately after receiving an epidural, the patient''s blood pressure drops to 85/50.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Immediately after receiving an epidural, the patient''s blood pressure drops to 85/50.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of hypotension after epidural?', '["Allergic reaction", "Sympathetic blockade leading to vasodilation", "Uterine rupture", "Hemorrhage"]', 1, 'Epidurals block sympathetic nerves, causing venous pooling and decreased preload.'),
    (v_case_id, 'What is the standard preventive measure before epidural placement?', '["Giving a 500-1000 mL fluid bolus", "Giving Epinephrine", "Strict NPO status", "Bed rest"]', 0, 'Pre-loading with fluids helps maintain blood pressure during the sympathetic block.'),
    (v_case_id, 'If hypotension persists despite position change and fluids, what medication is used?', '["Atropine", "Ephedrine or Phenylephrine", "Dopamine", "Magnesium"]', 1, 'Vasopressors are used to counteract the vasodilation.');

    ---------------------------------------------------------------------------
    -- CASE 22: Fetal Malpresentation - Breech (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breech Presentation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breech Presentation', 'At 37 weeks, the fetus is found to be in the "Frank Breech" position (buttocks down, legs extended up).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'At 37 weeks, the fetus is found to be in the "Frank Breech" position (buttocks down, legs extended up).', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is \"Frank Breech\"?', '["Buttocks down, knees flexed", "Buttocks down, knees extended (feet at head)", "One or both feet down", "Head down"]', 1, 'Frank breech is the most common breech type at term.'),
    (v_case_id, 'What is the procedure used to try and turn the baby to a cephalic position?', '["Internal Podalic Version", "External Cephalic Version (ECV)", "McRoberts maneuver", "Leopold version"]', 1, 'ECV is usually offered at 37 weeks to reduce the C-section rate.'),
    (v_case_id, 'Which type of breech is the most dangerous for vaginal delivery due to cord prolapse risk?', '["Frank", "Complete", "Footling (Incomplete)", "Cephalic"]', 2, 'Footling breech allows the cord to slip through the cervix easily.');

    ---------------------------------------------------------------------------
    -- CASE 23: Shoulder Dystocia - Rubin/Woods (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal Maneuvers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal Maneuvers', 'McRoberts maneuver and suprapubic pressure have failed to resolve a shoulder dystocia.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'McRoberts maneuver and suprapubic pressure have failed to resolve a shoulder dystocia.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Woods Screw\" maneuver?', '["Pushing the head back in", "Rotating the posterior shoulder 180 degrees", "Applying pressure to the fundus", "Hyperflexing the legs"]', 1, 'The Woods screw involves rotating the fetus to \"unscrew\" the impacted shoulder.'),
    (v_case_id, 'What nerve injury is a common complication of shoulder dystocia?', '["Radial nerve", "Brachial plexus (Erb''s Palsy)", "Sciatic nerve", "Phrenic nerve"]', 1, 'Erb''s palsy (C5-C6) results in the \"waiter''s tip\" hand position.'),
    (v_case_id, 'The Rubin maneuver involves:', '["Applying pressure to the back of the fetal shoulder to adduct it", "Breaking the clavicle", "Delivering the posterior arm", "Cutting the symphysis"]', 0, 'Rubin maneuver aims to reduce the shoulder-to-shoulder diameter.');

    ---------------------------------------------------------------------------
    -- CASE 24: Vacuum Extraction - Proper Placement (ACOG)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vacuum Safety' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vacuum Safety', 'A vacuum cup is being applied. The physician ensures the "pivot point" is centered.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A vacuum cup is being applied. The physician ensures the "pivot point" is centered.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the maximum number of \"pop-offs\" allowed before abandoning a vacuum delivery?', '["1", "2-3", "5", "Infinite"]', 1, 'Multiple pop-offs increase the risk of neonatal scalp injury significantly.'),
    (v_case_id, 'Vacuum should only be used during:', '["The first stage", "Contractions and maternal pushing", "Rest periods", "Anytime the doctor wants"]', 1, 'Traction must be synchronized with maternal effort.'),
    (v_case_id, 'What is the most dangerous neonatal scalp injury associated with vacuum?', '["Cephalohematoma", "Subgaleal hemorrhage", "Caput succedaneum", "Laceration"]', 1, 'Subgaleal hemorrhage is a large potential space where a newborn can lose their entire blood volume.');

    ---------------------------------------------------------------------------
    -- CASE 25: Postpartum Hemorrhage - Retained Placenta (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Retained Tissue PPH' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Retained Tissue PPH', 'The placenta delivers but appears to be missing a small lobe (Succenturiate lobe). The patient continues to bleed.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The placenta delivers but appears to be missing a small lobe (Succenturiate lobe). The patient continues to bleed.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next best step for a suspected retained placenta causing PPH?', '["Give more Oxytocin", "Manual exploration of the uterus", "Immediate Hysterectomy", "Abdominal CT"]', 1, 'The cavity must be explored to remove the tissue preventing contraction.'),
    (v_case_id, 'A placenta that is morbidly adherent and invades the MYOMETRIUM is called:', '["Placenta accreta", "Placenta increta", "Placenta percreta", "Placenta previa"]', 1, 'Increta invades the muscle; Percreta goes through the wall to other organs.'),
    (v_case_id, 'Which of these is the MOST common type of morbidly adherent placenta?', '["Accreta (80%)", "Increta", "Percreta", "Previa"]', 0, 'Accreta is the most frequent type and is a leading cause of peripartum hysterectomy.');

    ---------------------------------------------------------------------------
    -- CASE 26: Uterine Inversion (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Inversion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Inversion', 'Following delivery of the placenta, a beefy red mass is noted protruding through the cervix. The patient becomes severely hypotensive.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following delivery of the placenta, a beefy red mass is noted protruding through the cervix. The patient becomes severely hypotensive.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of uterine inversion?', '["Weak muscles", "Excessive cord traction on an unseparated placenta", "C-section", "Multiparity alone"]', 1, 'Iatrogenic inversion is usually due to pulling on the cord before separation.'),
    (v_case_id, 'What is the FIRST step in management of uterine inversion?', '["Give Oxytocin", "Immediate manual replacement of the fundus", "Call for a C-section", "Start antibiotics"]', 1, 'The fundus must be replaced immediately before the cervix contracts around it.'),
    (v_case_id, 'Should you give Oxytocin BEFORE or AFTER replacing the uterus?', '["Before", "After", "Doesn''t matter", "Never"]', 1, 'Oxytocin (and other uterotonics) must be HELD until the uterus is back in place; otherwise, it will \"lock\" the inverted fundus.');

    ---------------------------------------------------------------------------
    -- CASE 27: Amniotic Fluid Embolism (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AFE Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AFE Syndrome', 'A patient in active labor suddenly develops respiratory distress, seizures, and cardiovascular collapse, followed by massive bleeding from her IV sites.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in active labor suddenly develops respiratory distress, seizures, and cardiovascular collapse, followed by massive bleeding from her IV sites.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the triad of symptoms in AFE?', '["Fever, Pain, Bleeding", "Hypoxia, Hypotension, and DIC", "Confusion, Rash, Fever", "Seizure, Stroke, Headache"]', 1, 'AFE is an anaphylactoid response to fetal material in maternal circulation.'),
    (v_case_id, 'What is the mortality rate associated with AFE?', '["1%", "10%", "> 60-80%", "0%"]', 2, 'AFE is one of the most fatal complications in obstetrics.'),
    (v_case_id, 'What is the management?', '["Immediate surgery", "Supportive care (A-OK protocol: Atropine, Ondansetron, Ketorolac)", "Antibiotics", "Anticoagulation"]', 1, 'Management is entirely supportive (O2, fluids, blood products).');

    ---------------------------------------------------------------------------
    -- CASE 28: Normal Postpartum - Lochia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lochia Progression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lochia Progression', 'A 10-day postpartum patient is concerned because her vaginal discharge has changed from red to a pinkish-brown color.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-day postpartum patient is concerned because her vaginal discharge has changed from red to a pinkish-brown color.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the correct name for this pinkish-brown discharge?', '["Lochia rubra", "Lochia serosa", "Lochia alba", "Endometritis"]', 1, 'Lochia serosa typically lasts from day 4 to day 10.'),
    (v_case_id, 'What is the final stage of lochia (white/yellowish)?', '["Lochia rubra", "Lochia serosa", "Lochia alba", "Vaginitis"]', 2, 'Lochia alba can last up to 6-8 weeks.'),
    (v_case_id, 'Heavy lochia that requires changing a pad every hour suggests:', '["Normal", "Postpartum Hemorrhage or retained products", "Successful breastfeeding", "Infection"]', 1, 'Excessive bleeding requires evaluation for PPH.');

    ---------------------------------------------------------------------------
    -- CASE 29: Breastfeeding - Engorgement (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breast Engorgement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breast Engorgement', 'On postpartum day 3, a woman complains of bilateral, heavy, painful breasts.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'On postpartum day 3, a woman complains of bilateral, heavy, painful breasts.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this bilateral pain?', '["Mastitis", "Breast abscess", "Physiological engorgement", "Inflammatory cancer"]', 2, 'Bilateral involvement on day 3-5 is usually \"milk coming in\" (engorgement).'),
    (v_case_id, 'What is the best management for engorgement in a breastfeeding woman?', '["Stop breastfeeding", "Warm compresses and frequent expression/nursing", "Cold cabbage leaves and tight bras", "Antibiotics"]', 1, 'Frequent emptying is the key to resolving engorgement.'),
    (v_case_id, 'If she were NOT breastfeeding, what would be the advice?', '["Pump more", "Cold compresses, tight bra, and avoiding nipple stimulation", "Heat and massage", "Metformin"]', 1, 'Suppression requires avoiding any stimulation of the breast.');

    ---------------------------------------------------------------------------
    -- CASE 30: Cervical Laceration (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Laceration PPH' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Laceration PPH', 'A patient has heavy bright-red bleeding after an operative vaginal delivery. The uterus is firm and contracted.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has heavy bright-red bleeding after an operative vaginal delivery. The uterus is firm and contracted.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the uterus is firm but bleeding persists, what is the most likely cause?', '["Atony", "Laceration of the birth canal (cervix/vagina)", "Retained placenta", "DIC"]', 1, 'Bright red bleeding with a firm uterus points to trauma.'),
    (v_case_id, 'Which operative delivery method is most likely to cause a cervical tear?', '["Vacuum", "Forceps", "C-section", "None"]', 1, 'Forceps carry a higher risk of cervical and vaginal trauma.'),
    (v_case_id, 'How is a cervical laceration repaired?', '["Packing only", "Surgical suturing starting just above the apex of the tear", "Immediate Hysterectomy", "It heals itself"]', 1, 'Visualizing and suturing the apex is critical to stop arterial bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 31: Leopold Maneuvers (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Leopold Maneuvers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Leopold Maneuvers', 'A physician performs four maneuvers on a pregnant abdomen to determine fetal position.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician performs four maneuvers on a pregnant abdomen to determine fetal position.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of the FIRST maneuver (palpating the fundus)?', '["To check for twins", "To determine what part of the fetus is in the fundus", "To check the cervix", "To measure the placenta"]', 1, 'If the fundus is firm/round, it is the head; if soft/irregular, it is the buttocks.'),
    (v_case_id, 'The second maneuver helps determine:', '["Fetal weight", "Fetal lie and position of the back", "Cervical dilation", "Fetal station"]', 1, 'Feeling for the smooth back vs the irregular limbs.'),
    (v_case_id, 'The third maneuver (Pawlik''s grip) identifies:', '["Fetal station", "Fetal engagement and the presenting part", "Uterine tone", "Placental location"]', 1, 'Determining if the head is in the lower uterine segment.');

    ---------------------------------------------------------------------------
    -- CASE 32: External Cephalic Version - Prerequisites (ACOG)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'ECV Prerequisites' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'ECV Prerequisites', 'A 37-week patient with a breech baby is being considered for an External Cephalic Version (ECV).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 37-week patient with a breech baby is being considered for an External Cephalic Version (ECV).', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a CONTRAINDICATION to ECV?', '["Previous C-section (relative)", "Placenta previa", "Oligohydramnios", "All of the above"]', 3, 'Previa and low fluid make the procedure dangerous or impossible.'),
    (v_case_id, 'What class of medication is often given to relax the uterus during ECV?', '["Antibiotics", "Tocolytics (e.g., Terbutaline)", "Oxytocin", "NSAIDs"]', 1, 'Tocolytics increase the success rate of version.'),
    (v_case_id, 'What is the success rate of ECV?', '["~10%", "~50-60%", "95%", "0%"]', 1, 'Roughly half to two-thirds of attempts are successful.');

    ---------------------------------------------------------------------------
    -- CASE 33: Pudendal Block (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pudendal Anesthesia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pudendal Anesthesia', 'A patient requires a large laceration repair but does not have an epidural. The physician decides to perform a pudendal block.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient requires a large laceration repair but does not have an epidural. The physician decides to perform a pudendal block.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What landmark is used for a pudendal nerve block?', '["Sacral promontory", "Ischial spines", "Symphysis pubis", "Coccyx"]', 1, 'The nerve is anesthetized near the sacrospinous ligament attachment.'),
    (v_case_id, 'What area does the pudendal block numb?', '["The entire uterus", "The cervix", "The perineum and lower vagina", "The legs"]', 2, 'It provides excellent sensory block for the perineum but does not stop contraction pain.'),
    (v_case_id, 'What is the main risk of the pudendal block?', '["Hypotension", "Accidental intravascular injection (into the pudendal artery)", "Spinal headache", "Uterine rupture"]', 1, 'Aspiration is critical before injection to avoid systemic toxicity.');

    ---------------------------------------------------------------------------
    -- CASE 34: Labor Induction - Amniotomy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Augmenting Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Augmenting Labor', 'Labor has slowed down in the active phase. The patient is 7 cm dilated, but her contractions have decreased in strength.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Labor has slowed down in the active phase. The patient is 7 cm dilated, but her contractions have decreased in strength.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for \"slow\" progress in the active phase?', '["Protraction", "Arrest", "Latent phase", "Normal"]', 0, 'Protraction is progress that is slower than expected (e.g., < 1-2 cm per hour).'),
    (v_case_id, 'What are the two most common ways to augment labor?', '["C-section and Vacuum", "Amniotomy and Oxytocin", "Bed rest and fluids", "Epidural and Walking"]', 1, 'Breaking the water and starting Pitocin are the standard tools.'),
    (v_case_id, 'Why does amniotomy help?', '["It provides more space for the baby", "It allows the fetal head to apply more direct pressure to the cervix", "It reduces pain", "It prevents GBS"]', 1, 'Direct pressure from the head triggers the Ferguson reflex (oxytocin release).');

    ---------------------------------------------------------------------------
    -- CASE 35: Postpartum Hematoma (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vulvar Hematoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vulvar Hematoma', 'A woman 4 hours after a vacuum delivery reports severe, "throbbing" rectal and vaginal pressure. Her bleeding is minimal.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman 4 hours after a vacuum delivery reports severe, "throbbing" rectal and vaginal pressure. Her bleeding is minimal.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should you suspect in a patient with severe pain/pressure but NO visible bleeding?', '["Endometritis", "Vulvar or Vaginal hematoma", "Uterine atony", "Hemorrhoids"]', 1, 'Blood can accumulate in the paravaginal tissues without escaping the vagina.'),
    (v_case_id, 'What is the most likely risk factor in this case?', '["Operative delivery (Vacuum/Forceps)", "Epidural", "Antibiotics", "Smoking"]', 0, 'Operative trauma can rupture vessels in the pelvic floor.'),
    (v_case_id, 'What is the management of a LARGE, expanding hematoma (> 5 cm)?', '["Observation", "Surgical incision, evacuation of clots, and ligation of the bleeding vessel", "Ice packs only", "Hysterectomy"]', 1, 'Large hematomas require surgical repair; small ones can be observed.');

    ---------------------------------------------------------------------------
    -- CASE 36: Uterine Rupture (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Rupture Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Rupture Logic', 'A patient undergoing a Trial of Labor After Cesarean (TOLAC) suddenly has a "popping" sensation, loss of fetal station, and severe abdominal pain.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient undergoing a Trial of Labor After Cesarean (TOLAC) suddenly has a "popping" sensation, loss of fetal station, and severe abdominal pain.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common SIGN of uterine rupture on fetal monitoring?', '["Tachysystole", "Persistent fetal bradycardia or deep late decelerations", "Accelerations", "Moderate variability"]', 1, 'Fetal distress is the most frequent and reliable sign.'),
    (v_case_id, 'The \"loss of fetal station\" (head floating back up) is highly suspicious for:', '["Normal labor", "Uterine rupture", "Placental abruption", "Previa"]', 1, 'When the uterus rips, the baby is no longer pushed down and may even move into the abdomen.'),
    (v_case_id, 'What is the immediate management?', '["Immediate C-section and possible uterine repair/Hysterectomy", "Give more Oxytocin", "Vacuum delivery", "Expectant management"]', 0, 'Uterine rupture is a catastrophic surgical emergency.');

    ---------------------------------------------------------------------------
    -- CASE 37: Cord Prolapse (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Umbilical Cord Prolapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Umbilical Cord Prolapse', 'Upon checking the cervix, the physician feels a pulsating, rope-like structure in front of the fetal head.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Upon checking the cervix, the physician feels a pulsating, rope-like structure in front of the fetal head.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in managing a cord prolapse?', '["Push the cord back in", "Manually elevate the fetal head and prep for emergency C-section", "Wait for delivery", "Rupture membranes"]', 1, 'The goal is to relieve pressure on the cord until the baby can be delivered surgically.'),
    (v_case_id, 'What maternal position can help relieve pressure on a prolapsed cord?', '["Supine", "Knee-chest position or Trendelenburg", "Sitting up", "Walking"]', 1, 'Gravity helps pull the baby away from the cervix.'),
    (v_case_id, 'Risk factors for cord prolapse include:', '["Polyhydramnios (excess fluid)", "Fetal malpresentation (Breech/Transverse)", "Artificial Rupture of Membranes with unengaged head", "All of the above"]', 3, 'Anything that prevents the head from sealing the cervix increases the risk.');

    ---------------------------------------------------------------------------
    -- CASE 38: Retained Products - Delayed PPH (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Delayed Postpartum Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Delayed Postpartum Bleeding', 'A woman 10 days postpartum reports a sudden increase in heavy, bright red vaginal bleeding and cramps.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman 10 days postpartum reports a sudden increase in heavy, bright red vaginal bleeding and cramps.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of \"Secondary\" (delayed) PPH?', '["Uterine atony", "Retained placental fragments or infection", "Vaginal laceration", "Uterine inversion"]', 1, 'Delayed PPH (24 hrs to 12 weeks) is usually tissue or infection related.'),
    (v_case_id, 'What imaging test is used to evaluate for retained products?', '["Pelvic Ultrasound", "CT Abdomen/Pelvis", "MRI", "No imaging needed"]', 0, 'US can show echogenic material remaining in the uterus.'),
    (v_case_id, 'What is the treatment for symptomatic retained products of conception (RPOC)?', '["Dilation and Curettage (D&C)", "High-dose estrogen", "Observation", "Vaginal packing"]', 0, 'D&C is required to remove the tissue and stop the bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 39: Post-term Pregnancy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 42-week Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 42-week Pregnancy', 'A patient is now 41 weeks and 6 days gestation. She has no signs of labor.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is now 41 weeks and 6 days gestation. She has no signs of labor.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of a \"Post-term\" pregnancy?', '["40 weeks", "41 weeks", "42 weeks or greater", "44 weeks"]', 2, 'Post-term is >= 42w 0d.'),
    (v_case_id, 'What is the most common reason for a pregnancy to be labeled \"post-term\"?', '["Fetal defect", "Inaccurate dating (incorrect LMP)", "Maternal obesity", "Placental issue"]', 1, 'Late prenatal care and irregular cycles lead to dating errors.'),
    (v_case_id, 'What is a fetal risk associated with post-term pregnancy?', '["Macrosomia", "Oligohydramnios (low fluid)", "Dysmaturity syndrome", "All of the above"]', 3, 'Placental function begins to decline after 41-42 weeks.');

    ---------------------------------------------------------------------------
    -- CASE 40: Intrapartum Fever - Triple I (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Intrapartum Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Intrapartum Infection', 'During a 24-hour labor, the patient develops a fever of 102.2F and fetal tachycardia (HR 180).', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a 24-hour labor, the patient develops a fever of 102.2F and fetal tachycardia (HR 180).', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the modern ACOG term for chorioamnionitis?', '["Uterine infection", "Triple I (Intrauterine Inflammation or Infection)", "Labor fever", "Amnionitis"]', 1, 'Triple I is the preferred clinical term.'),
    (v_case_id, 'What are the two most common pathogens found in Triple I?', '["Staph and Strep", "Polymicrobial (Anaerobes and Gram-negatives from the vagina)", "Virus", "Yeast"]', 1, 'It is usually an ascending infection of mixed vaginal flora.'),
    (v_case_id, 'Does a diagnosis of Triple I require an immediate C-section?', '["Yes", "No, it is not an indication for C-section itself; labor should continue with antibiotics and antipyretics", "Only if the baby is breech", "Only if she is at term"]', 1, 'Labor should be expedited, but vaginal delivery is preferred unless there are other distress signs.');

    ---------------------------------------------------------------------------
    -- CASE 41: Postpartum Mastitis - The Red Wedge (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mastitis Evaluation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mastitis Evaluation', 'A 3-week postpartum woman has a wedge-shaped area of redness and pain on her right breast and a fever.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-week postpartum woman has a wedge-shaped area of redness and pain on her right breast and a fever.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What distinguishes mastitis from simple engorgement?', '["Bilateral pain", "Fever and systemic symptoms (chills, malaise) with focal tenderness", "Nipple discharge", "It only happens in older women"]', 1, 'Mastitis is focal and systemic; engorgement is bilateral and less severe.'),
    (v_case_id, 'What is the antibiotic of choice for lactational mastitis?', '["Penicillin G", "Dicloxacillin or Cephalexin", "Vancomycin", "Metronidazole"]', 1, 'Dicloxacillin covers the most common pathogen, S. aureus.'),
    (v_case_id, 'What is the most important \"behavioral\" treatment for mastitis?', '["Stop breastfeeding immediately", "Continue frequent breastfeeding or pumping of the affected side", "Heat and massage", "Bed rest"]', 1, 'Stasis of milk is what allowed the infection; emptying is required for cure.');

    ---------------------------------------------------------------------------
    -- CASE 42: Fetal Scalp Electrode (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal FHR Monitoring' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal FHR Monitoring', 'Because the external monitor is not picking up a reliable tracing, the physician decides to place a Fetal Scalp Electrode (FSE).', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Because the external monitor is not picking up a reliable tracing, the physician decides to place a Fetal Scalp Electrode (FSE).', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a contraindication to FSE placement?', '["Maternal HIV or Hepatitis C", "Ruptured membranes", "6 cm dilation", "Fetal station -2"]', 0, 'FSE causes a small break in fetal skin and can increase the risk of vertical transmission.'),
    (v_case_id, 'FSE measures fetal heart rate by:', '["Ultrasound", "Direct EKG of the fetus", "Pressure", "Oxygen levels"]', 1, 'It provides a much more accurate tracing by reading the fetal EKG signal directly.'),
    (v_case_id, 'FSE can ONLY be placed if:', '["The patient is at 40 weeks", "The membranes are ruptured and the cervix is sufficiently dilated", "The baby is breech", "The doctor has permission from the board"]', 1, 'Intact membranes prevent access to the scalp.');

    ---------------------------------------------------------------------------
    -- CASE 43: Nitrazine and Ferning Pitfalls (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'False Positive ROM' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'False Positive ROM', 'A Nitrazine test is positive (turns blue), but the patient had recent intercourse.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A Nitrazine test is positive (turns blue), but the patient had recent intercourse.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What common fluid can cause a false-positive Nitrazine test?', '["Urine", "Semen", "Vaginal mucus", "Blood"]', 1, 'Semen and blood are both alkaline and will turn the paper blue.'),
    (v_case_id, 'What causes the \"ferning\" pattern on a slide?', '["Bacterial growth", "Crystallization of sodium chloride in the amniotic fluid", "Estrogen levels", "Sperm cells"]', 1, 'High salt content in amniotic fluid forms the pattern when dried.'),
    (v_case_id, 'If bedside tests are inconclusive, what is the \"gold standard\" (though invasive) test for ROM?', '["Ultrasound", "Amniocentesis with injection of indigo carmine dye (Amniodye test)", "CT", "MRI"]', 1, 'If the dye appears on a vaginal tampon, ROM is confirmed.');

    ---------------------------------------------------------------------------
    -- CASE 44: Cord pH and Acidosis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Cord Gases' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Cord Gases', 'After a difficult delivery, a sample of blood is taken from the umbilical artery.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After a difficult delivery, a sample of blood is taken from the umbilical artery.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a normal umbilical artery pH?', '["~7.0", "~7.25 - 7.30", "~7.45", "~6.8"]', 1, 'Arterial blood reflects fetal status; venous blood reflects placental status.'),
    (v_case_id, 'A pH < 7.0 and a Base Deficit > 12-16 is diagnostic of:', '["Normal baby", "Severe metabolic acidosis/Birth asphyxia", "Infection", "Respiratory compensation"]', 1, 'These values are thresholds for neonatal encephalopathy risk.'),
    (v_case_id, 'Umbilical ARTERY blood reflects:', '["Maternal status", "Fetal status", "Placental status", "Atmospheric status"]', 1, 'The artery carries blood FROM the fetus TO the placenta.');

    ---------------------------------------------------------------------------
    -- CASE 45: Postpartum Thyroiditis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Thyroid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Thyroid', 'A woman 3 months postpartum reports palpitations and anxiety, followed by profound fatigue and cold intolerance.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman 3 months postpartum reports palpitations and anxiety, followed by profound fatigue and cold intolerance.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis for this biphasic (hyper then hypo) thyroid condition?', '["Grave''s disease", "Postpartum thyroiditis", "Hashimoto''s", "Iodine deficiency"]', 1, 'This is a transient autoimmune destruction of the thyroid that occurs within 1 year of delivery.'),
    (v_case_id, 'During the hyperthyroid phase, will the RAIU (Radioactive Iodine Uptake) be high or low?', '["High", "Low", "Normal", "Undetectable"]', 1, 'Low uptake distinguishes thyroiditis (leakage of pre-formed hormone) from Grave''s (increased production).'),
    (v_case_id, 'What is the standard treatment for the hypothyroid phase?', '["Levothyroxine (if symptomatic)", "PTU", "Methimazole", "Surgery"]', 0, 'Most cases resolve spontaneously within a few months.');

    ---------------------------------------------------------------------------
    -- CASE 46: Shoulder Dystocia - Risk Factors (ACOG)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dystocia Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dystocia Risk', 'A 40-year-old G4P3 with GDM and an estimated fetal weight of 4800g is in labor.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old G4P3 with GDM and an estimated fetal weight of 4800g is in labor.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two biggest risk factors for shoulder dystocia in this patient?', '["Age and Multiparity", "Diabetes and Macrosomia", "Fetal station and position", "Smoking and weight gain"]', 1, 'Maternal diabetes and large baby (macrosomia) are the primary predictors.'),
    (v_case_id, 'Can shoulder dystocia be reliably predicted?', '["Yes", "No, most cases occur in babies of normal weight without risk factors", "Only with MRI", "Only in smokers"]', 1, 'While risk factors help, many cases are unexpected and require rapid reaction.'),
    (v_case_id, 'What weight threshold does ACOG recommend for ELECTIVE C-section to prevent dystocia in a DIABETIC mother?', '["4000g", "4500g", "5000g", "3500g"]', 1, 'For non-diabetic mothers, the threshold is 5000g.');

    ---------------------------------------------------------------------------
    -- CASE 47: The "4 Ts" of PPH (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPH Differential' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPH Differential', 'The delivery team is reviewing the causes of PPH after a major bleed.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The delivery team is reviewing the causes of PPH after a major bleed.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Match the \"T\" to the cause: Tone', '["Retained placenta", "Uterine atony", "Lacerations", "DIC"]', 1, 'Atony is the most common cause.'),
    (v_case_id, 'Match the \"T\" to the cause: Tissue', '["Atony", "Retained placenta/products", "Lacerations", "DIC"]', 1, 'Retained tissue prevents the uterus from contracting fully.'),
    (v_case_id, 'Match the \"T\" to the cause: Thrombin', '["Atony", "Coagulopathy/DIC", "Lacerations", "Retained placenta"]', 1, 'Clotting disorders are a less common but critical cause.');

    ---------------------------------------------------------------------------
    -- CASE 48: Epidural and the Second Stage (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Epidural and Progress' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Epidural and Progress', 'A patient with an epidural has been at 10 cm for 1 hour but has no urge to push.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with an epidural has been at 10 cm for 1 hour but has no urge to push.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The practice of waiting for the baby to descend on its own after full dilation is called:', '["Active pushing", "Laboring down (passive descent)", "Station 0 management", "Neglect"]', 1, '\"Laboring down\" can reduce maternal exhaustion and operative delivery rates.'),
    (v_case_id, 'How does an epidural typically affect the length of the 2nd stage?', '["Shortens it", "Lengthens it by ~1 hour", "Has no effect", "Stops it entirely"]', 1, 'Epidurals decrease the urge to push and can slow descent.'),
    (v_case_id, 'Does an epidural increase the risk of C-section?', '["Yes", "No", "Only if it is too high", "Only for twins"]', 1, 'Current evidence shows epidurals do NOT significantly increase the risk of C-section.');

    ---------------------------------------------------------------------------
    -- CASE 49: Breech Delivery - Mauriceau-Smellie-Veit (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breech Delivery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breech Delivery', 'An emergency vaginal breech delivery is occurring. The body is delivered, but the head is stuck.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An emergency vaginal breech delivery is occurring. The body is delivered, but the head is stuck.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical rule for breech delivery?', '["Pull hard on the legs", "Hands off the breech! (Allow spontaneous delivery to the umbilicus)", "Immediate C-section", "Rotate the body"]', 1, 'Pulling can cause the head to deflex and get stuck.'),
    (v_case_id, 'The Mauriceau-Smellie-Veit maneuver is used to:', '["Deliver the shoulders", "Flex and deliver the after-coming head", "Turn the baby", "Fix a cord prolapse"]', 1, 'It involves putting fingers in the fetal mouth/on the malar bones to flex the head.'),
    (v_case_id, 'The biggest danger of breech vaginal delivery is:', '["Head entrapment (cervix closes around the neck)", "Low birth weight", "Jaundice", "Eye injury"]', 0, 'The body is smaller than the head; the cervix may allow the body through but trap the head.');

    ---------------------------------------------------------------------------
    -- CASE 50: Postpartum Care - The 6-week visit (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 6-week Checkup' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 6-week Checkup', 'A patient presents for her routine 6-week postpartum visit.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents for her routine 6-week postpartum visit.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the critical components of this visit?', '["Contraceptive planning, Mood screening, and Wound/Perineal check", "Starting an exercise plan only", "Measuring height and weight", "Giving a flu shot"]', 0, 'These three are essential for maternal health.'),
    (v_case_id, 'For a patient who had GDM, what test should be performed at the 6-week visit?', '["HbA1c", "75g 2-hour Oral Glucose Tolerance Test (OGTT)", "Fasting glucose only", "None"]', 1, 'GDM patients have a high risk of developing Type 2 diabetes and must be re-screened.'),
    (v_case_id, 'When can most women safely resume sexual intercourse?', '["Immediately", "When the lochia has stopped and the perineum is healed (usually 4-6 weeks)", "1 year", "After the first period"]', 1, 'Waiting allows the cervix to close and tissues to heal to prevent infection/trauma.');

    RAISE NOTICE 'SUCCESS: 50 Normal labor, delivery & postpartum care Case Blocks registered.';
END $$;

COMMIT;
