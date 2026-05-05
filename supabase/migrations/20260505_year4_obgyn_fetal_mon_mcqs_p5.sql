BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 5: 241-300 (Advanced Clinical Scenarios and Emergency Management)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: A 32-year-old at 39 weeks has a "Category II" tracing with minimal variability and occasional late decelerations. Maternal BP is 90/50 after an epidural. Next step?', '["Immediate C-section", "Lateral positioning, IV bolus, and Ephedrine", "Wait for labor", "Oxytocin"]', 1, 'Hypotension-induced placental insufficiency should be corrected before assuming fetal distress. (Beckmann)'),
    (v_topic_id, '242: A "Prolonged Deceleration" (lasting 4 minutes) occurs. Which of the following is NOT an appropriate immediate action?', '["Vaginal exam to check for cord or station", "Lateral positioning and O2", "Increase the Pitocin", "Check maternal pulse"]', 2, 'Never increase Pitocin during a prolonged deceleration. (ACOG)'),
    (v_topic_id, '243: "Fetal Tachycardia" (170 bpm) with "Moderate" variability. Management?', '["Emergency C-section", "Identify and treat cause (e.g., Maternal fever, dehydration, or drugs)", "Wait", "Forceps"]', 1, 'Category II tracing. Moderate variability is reassuring even with tachycardia. (Beckmann)'),
    (v_topic_id, '244: "Category III" tracing: A patient has "Sinusoidal" rhythm at 34 weeks. No known trauma. Next step?', '["Wait 24h", "Immediate C-section and evaluate for fetal anemia (Hemorrhage or Rh)", "Antibiotics", "Glucose"]', 1, 'Sinusoidal is a severe finding. (Williams)'),
    (v_topic_id, '245: A woman with "Shoulder Dystocia" - The head is delivered and McRoberts fails. What is the next most appropriate internal maneuver?', '["Zavanelli", "Posterior arm delivery or Rubin maneuver", "Wait for next contraction", "Push on fundus"]', 1, 'Sequential progression of maneuvers. (ACOG)'),
    (v_topic_id, '246: "Uterine Inversion" occurs. The patient is hemorrhaging. Why is "manual replacement" done BEFORE the placenta is removed?', '["It is easier", "To prevent further massive hemorrhage and allow the uterus to be placed correctly", "It doesn''t matter", "None"]', 1, 'Placenta removal opens the spiral arteries further. (Williams)'),
    (v_topic_id, '247: "Amniotic Fluid Embolism" (AFE): What is the most common "coagulopathy" associated with it?', '["Hemophilia", "Disseminated Intravascular Coagulation (DIC)", "Thrombocytopenia only", "None"]', 1, 'Usually profound fibrinogen consumption. (ACOG)'),
    (v_topic_id, '248: "Postpartum Hemorrhage" (PPH) - "Tone" (Atony) is the most common cause. Which of the following is a risk factor for Atony?', '["Chorioamnionitis", "Large baby (macrosomia)", "Prolonged oxytocin use", "All of the above"]', 3, 'Muscle exhaustion. (Beckmann)'),
    (v_topic_id, '249: A patient at 28 weeks has "Variable" decelerations with every contraction. Membranes are ruptured. Management?', '["Immediate C-section", "Amnioinfusion via IUPC", "Wait", "Antibiotics"]', 1, 'Standard treatment for recurrent variables due to oligohydramnios. (ACOG)'),
    (v_topic_id, '250: "Fetal Heart Rate" - "Variability" - "Minimal" (<= 5 bpm) is Category:', '["I", "II", "III", "None"]', 1, 'Indeterminate. (ACOG)'),
    (v_topic_id, '251: "Fetal Heart Rate" - "Absent" variability WITH late decels is Category:', '["I", "II", "III", "None"]', 2, 'Abnormal. (ACOG)'),
    (v_topic_id, '252: "Early" decelerations are Category:', '["I", "II", "III", "None"]', 0, 'Normal (if baseline and variability are also normal). (ACOG)'),
    (v_topic_id, '253: "Variable" decelerations with moderate variability are Category:', '["I", "II", "III", "None"]', 1, 'Very common in labor. (ACOG)'),
    (v_topic_id, '254: "Baseline" FHR of 165 bpm (Tachycardia) is Category:', '["I", "II", "III", "None"]', 1, 'Requires investigation. (ACOG)'),
    (v_topic_id, '255: "Amniotomy" (AROM) - What MUST be checked before performing it?', '["Cervical dilation", "Fetal station (should be engaged) and absence of cord on palpation", "Maternal BP", "None"]', 1, 'To prevent cord prolapse. (Beckmann)'),
    (v_topic_id, '256: "Internal Scalp Electrode" (FSE) provides the most accurate measurement of:', '["Contractions", "Fetal heart rate (beat-to-beat variability)", "Oxygen", "Sugar"]', 1, 'Superior to Doppler ultrasound for variability detail. (Williams)'),
    (v_topic_id, '257: "Montevideo Units" calculation window?', '["1 minute", "5 minutes", "10 minutes", "30 minutes"]', 2, 'The sum of peaks minus baseline in 10 min. (ACOG)'),
    (v_topic_id, '258: A patient has 4 contractions in 10 minutes, each at 60 mmHg (baseline 10 mmHg). MVUs?', '["240", "200", "40", "None"]', 1, '(60-10) x 4 = 200. (Williams)'),
    (v_topic_id, '259: "Oxytocin" (Pitocin) should be adjusted based on:', '["Nurses choice", "Contraction frequency and FHR tracing", "Every hour", "None"]', 1, 'Aims for "adequate" labor (e.g., 200-250 MVUs) without tachysystole. (ACOG)'),
    (v_topic_id, '260: "Meconium" - If a vigorous infant is born with meconium-stained fluid, what is the next step?', '["Suction the mouth and nose with a bulb syringe and continue routine care", "Intubate", "Antibiotics", "None"]', 0, 'Standard NRP. (AAP)'),
    (v_topic_id, '261: "Umbilical Cord Prolapse" - Why is "Knee-Chest" position recommended?', '["For comfort", "Gravity helps pull the presenting part away from the pelvis and cord", "To stop bleeding", "None"]', 1, 'Temporary relief while preparing for OR. (Beckmann)'),
    (v_topic_id, '262: "Uterine Rupture" - Most common sign?', '["Hemorrhage", "Abnormal FHR tracing (usually bradycardia or prolonged decels)", "Pain", "Fever"]', 1, 'EFM changes are seen in 70% of cases. (Williams)'),
    (v_topic_id, '263: "Postpartum Hemorrhage" - "Hemabate" (PGF2-alpha) is given:', '["IV", "IM (Intramuscular) or directly into the myometrium", "Rectally", "None"]', 1, 'Never given IV as it can cause sudden pulmonary HTN. (ACOG)'),
    (v_topic_id, '264: "Methergine" (Methylergonovine) dose?', '["0.2 mg IM every 2-4 hours", "1 mg IV", "10 mg", "None"]', 0, 'Standard ergot dose. (Beckmann)'),
    (v_topic_id, '265: "Bakri Balloon" - If it is "pushed out" of the uterus by contractions:', '["Replace it immediately", "It has failed; move to surgical management", "Leave it in the vagina", "None"]', 1, 'Indicates failure to control the cavity. (Williams)'),
    (v_topic_id, '266: "B-Lynch Suture" - What does it do?', '["Ties the arteries", "Compresses the uterus like a \"suspenders\" suture", "Closes the cervix", "None"]', 1, 'Surgical compression for atony. (ACOG)'),
    (v_topic_id, '267: "Placenta Accreta" - Best diagnostic tool?', '["CT", "Ultrasound (with Doppler looking for lacunae and hypervascularity)", "Blood test", "None"]', 1, 'Prenatal diagnosis allows for planned C-hyst. (Williams)'),
    (v_topic_id, '268: "Amnioreduction" is used to treat:', '["Oligohydramnios", "Severe Polyhydramnios", "PPROM", "None"]', 1, 'For relief of maternal respiratory distress or pain. (Beckmann)'),
    (v_topic_id, '269: "Fetal Heart Rate" - "Accelerations" rule out:', '["Diabetes", "Metabolic acidemia (pH < 7.20)", "Twins", "None"]', 1, 'Standard interpretation. (ACOG)'),
    (v_topic_id, '270: "Prolonged decelerations" are those lasting more than:', '["30 seconds", "2 minutes", "10 minutes", "None"]', 1, 'Must differentiate from variables and baseline change. (ACOG)'),
    (v_topic_id, '271: "Category III" - "Absent" variability + "Bradycardia"?', '["Yes", "No", "Category II", "None"]', 0, 'A classic Category III finding. (ACOG)'),
    (v_topic_id, '272: "Variable" decelerations - What is the "umbilical" cause?', '["Artery compression", "Vein compression followed by artery compression", "Head compression", "None"]', 1, 'Two-step physiologic response. (Beckmann)'),
    (v_topic_id, '273: "Late" decelerations - What is the "oxygen" cause?', '["Too much O2", "Decrease in O2 partial pressure below the fetal critical threshold", "CO2 build up", "None"]', 1, 'Chemoreceptor reflex response. (Williams)'),
    (v_topic_id, '274: "Amnioinfusion" - Potential complication?', '["Polyhydramnios", "Uterine hypertonus or infection", "Diabetes", "None"]', 1, 'Requires monitoring of resting tone via IUPC. (ACOG)'),
    (v_topic_id, '275: "Fetal Scalp Electrode" (FSE) - Can you place it on a breech baby?', '["No", "Yes, on the buttocks (avoiding the anus/genitalia)", "Only if she has an epidural", "None"]', 1, 'Technically possible. (Williams)'),
    (v_topic_id, '276: "IUPC" - Can you use it to infuse fluid?', '["No", "Yes (Amnioinfusion)", "Only for oxytocin", "None"]', 1, 'Dual-purpose catheter. (ACOG)'),
    (v_topic_id, '277: "Montevideo Units" - If MVUs are 150 and dilation is NOT progressing, next step?', '["C-section", "Increase Oxytocin to achieve 200-250 MVUs", "Wait 4h", "None"]', 1, 'Augmentation of "inadequate" labor. (Beckmann)'),
    (v_topic_id, '278: "Shoulder Dystocia" - "Zavanelli Maneuver" - Why is "Terbutaline" given?', '["To deliver faster", "To relax the uterus to facilitate head replacement", "To stop bleeding", "None"]', 1, 'Mandatory for the maneuver. (Williams)'),
    (v_topic_id, '279: "Postpartum Hemorrhage" - "Lacerations" are the second most common cause. When should you suspect them?', '["When the uterus is firm/contracted but bleeding persists", "When the uterus is boggy", "When there is no bleeding", "None"]', 0, 'Atony vs Trauma. (ACOG)'),
    (v_topic_id, '280: "Cervical Laceration" - Most common location?', '["3 and 9 o''clock", "12 o''clock", "Posterior only", "None"]', 0, 'Due to stretching and tearing during rapid delivery. (Beckmann)'),
    (v_topic_id, '281: "Uterine Inversion" - If replacement fails manually, what is the next surgical step?', '["Hysterectomy", "Huntington or Haultain procedure (surgical replacement)", "Wait", "None"]', 1, 'Using instruments to pull the fundus up. (Williams)'),
    (v_topic_id, '282: "Amniotic Fluid Embolism" - "Survival" depends on:', '["Meds", "Early recognition and aggressive cardiovascular support", "Antibiotics", "None"]', 1, 'Multidisciplinary ICU care. (ACOG)'),
    (v_topic_id, '283: "Meconium" - "Meconium Stained Fluid" (MSF) occurs in what percentage of term births?', '["1%", "5%", "10-20%", "50%"]', 2, 'Increases as gestation passes 40 weeks. (Beckmann)'),
    (v_topic_id, '284: "Cord pH" - A "Respiratory" Acidemia is usually:', '["Dangerous long-term", "Acute and transient with good prognosis if ROSC is quick", "Genetic", "None"]', 1, 'Rapid clearing of CO2 once breathing starts. (ACOG)'),
    (v_topic_id, '285: "Fetal Heart Rate" - "Variability" - "Moderate" range in bpm?', '["0-2", "3-5", "6-25", "> 25"]', 2, 'Core definition. (ACOG)'),
    (v_topic_id, '286: "Fetal Heart Rate" - "Variability" - "Minimal" range in bpm?', '["0-2", "1-5", "6-10", "None"]', 1, 'Suggests sleep or mild depression. (ACOG)'),
    (v_topic_id, '287: "Fetal Heart Rate" - "Variability" - "Absent" means?', '["Amplitude undetectable", "Flat line", "Both", "None"]', 2, 'Highly non-reassuring. (ACOG)'),
    (v_topic_id, '288: "Early" Decelerations: The "Nadir" (lowest point) of the decel occurs:', '["At the same time as the peak of the contraction", "After the peak", "Before the peak", "None"]', 0, 'Reflects the "mirror" image. (Beckmann)'),
    (v_topic_id, '289: "Late" Decelerations: The "Nadir" occurs:', '["At the same time as the peak", "After the peak of the contraction", "Before the peak", "None"]', 1, 'Reflects the delay in oxygen debt. (Williams)'),
    (v_topic_id, '290: "Variable" Decelerations: The "Nadir" occurs:', '["Abruptly (< 30 sec)", "Gradually", "After 1 minute", "None"]', 0, 'Defined by the speed of the drop. (ACOG)'),
    (v_topic_id, '291: "Fetal Scalp Stimulation" - Duration of stimulus?', '["1 sec", "15 sec", "1 min", "None"]', 1, 'Enough to wake the baby. (Beckmann)'),
    (v_topic_id, '292: "Vibroacoustic Stimulation" - Max number of attempts?', '["1", "3 (each lasting up to 3 sec)", "10", "None"]', 1, 'Standard protocol. (ACOG)'),
    (v_topic_id, '293: "FHR Pattern" - "Check-mark" sign? (Brief accelerations in a variable decel)', '["Good", "Indicate cord compression and compensation", "Infection", "None"]', 1, 'Common and benign. (Williams)'),
    (v_topic_id, '294: "FHR Pattern" - "Shoulders"?', '["Brief accelerations before and after a variable decel", "Bad", "Infections", "None"]', 0, 'Reassuring sign that the fetus is compensating for cord compression. (Beckmann)'),
    (v_topic_id, '295: "FHR Pattern" - "Lambda"? (Mixed acceleration/deceleration)', '["Normal", "Benign periodic change", "Dying", "None"]', 1, 'Looks like the Greek letter. (Williams)'),
    (v_topic_id, '296: "Fetal Resuscitation" - "Oxygen" (10L mask) should be used:', '["Forever", "Only during the resuscitative period (to avoid maternal oxidative stress)", "Every hour", "None"]', 1, 'Standard of care. (ACOG)'),
    (v_topic_id, '297: "Fetal Resuscitation" - "Fluids" (NS or LR) bolus amount?', '["10 mL", "500-1000 mL", "100 mL", "None"]', 1, 'To increase blood volume and uterine perfusion. (Beckmann)'),
    (v_topic_id, '298: "Post-term" Monitoring - If AFI is < 5 cm, management?', '["Wait 1 week", "Delivery (Induction)", "Home rest", "None"]', 1, 'Indication for birth in post-term pregnancy. (ACOG)'),
    (v_topic_id, '299: "BPP" - "Tone" is scored as 2 if:', '["Baby is moving", "At least one episode of active extension with return to flexion of limb/trunk", "Baby is sleeping", "None"]', 1, 'Specific ultrasound criteria. (Williams)'),
    (v_topic_id, '300: "BPP" - "Movement" is scored as 2 if:', '["Baby moves once", "At least 3 discrete body/limb movements in 30 minutes", "10 moves", "None"]', 1, 'Standard criteria. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for Fetal Monitoring & Emergencies registered.';
END $$;
COMMIT;
