BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 4: 181-240 (Instrumental Delivery, PPH details, and Trauma)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: "Metabolic" Acidosis is characterized by low pH, low bicarbonate, and:', '["Normal PCO2", "High PCO2", "High Base Deficit", "None"]', 2, 'Reflects prolonged/chronic hypoxia. (ACOG)'),
    (v_topic_id, '182: A "Mixed" Acidosis has components of both:', '["Respiratory and Metabolic", "Renal and Hepatic", "Infectious and Trauma", "None"]', 0, 'Common in severe fetal distress. (Williams)'),
    (v_topic_id, '183: "Fetal Heart Rate" monitoring in high-risk patients should be:', '["Continuous", "Intermittent", "Once an hour", "None"]', 0, 'Standard practice for high-risk labors. (ACOG)'),
    (v_topic_id, '184: "Baseline" FHR is determined by looking at a _____ minute window.', '["2", "5", "10", "30"]', 2, 'Excluding accelerations and decelerations. (ACOG)'),
    (v_topic_id, '185: "Wandering" baseline? (Slow fluctuation between 110-160)', '["Normal", "Potentially concerning sign of impending fetal compromise", "Sleep", "None"]', 1, 'Often seen before death or severe acidosis. (Williams)'),
    (v_topic_id, '186: "Fetal heart rate" at 20 weeks is normally:', '["110 bpm", "140-160 bpm (Higher than at term)", "100 bpm", "None"]', 1, 'Baseline decreases as the parasympathetic nervous system matures. (Beckmann)'),
    (v_topic_id, '187: "Instrumental Vaginal Delivery" prerequisites?', '["Head engaged", "Ruptured membranes", "Empty bladder", "All of the above"]', 3, 'Must also have informed consent and anesthesia. (ACOG)'),
    (v_topic_id, '188: "Vacuum" - Maximum number of "pop-offs" allowed?', '["1", "2-3 (ACOG suggests 3)", "10", "No limit"]', 1, 'Increases risk of subgaleal hemorrhage. (ACOG)'),
    (v_topic_id, '189: "Vacuum" - "Rule of 15"?', '["15 min of application", "15 pop-offs", "15 cm dilation", "None"]', 0, 'Time limit for application to prevent scalp injury. (Beckmann)'),
    (v_topic_id, '190: "Forceps" - "Simpson" forceps are used for:', '["Molding", "The molded head (long/tapered)", "Round head", "Breech"]', 1, 'Commonly used for outlet/low station. (Williams)'),
    (v_topic_id, '191: "Forceps" - "Piper" forceps are specifically for:', '["The after-coming head of a breech fetus", "Twins", "Rotation", "None"]', 0, 'A specialized instrumental delivery. (Beckmann)'),
    (v_topic_id, '192: "Kielland" forceps are used for:', '["Rotation of the fetal head", "Outlet only", "Breech", "None"]', 0, 'Requires expert training. (Williams)'),
    (v_topic_id, '193: "Mid-pelvic" forceps application is when station is:', '["0 to +2", "At the floor", "Floating", "None"]', 0, 'Higher risk of maternal/fetal trauma than low/outlet. (ACOG)'),
    (v_topic_id, '194: Failure of instrumental delivery is an indication for:', '["Try again", "Immediate Cesarean section", "Wait", "Forceps after vacuum failed (Sequentially)"]', 1, 'Sequential use of instruments is generally discouraged due to trauma risk. (ACOG)'),
    (v_topic_id, '195: "Postpartum Hemorrhage" - "Bakri Balloon" removal?', '["After 1 hour", "After 12-24 hours if bleeding has stopped", "After 1 week", "None"]', 1, 'Tapering or deflation slowly. (Williams)'),
    (v_topic_id, '196: "Methergine" (Methylergonovine) mechanism?', '["Prostaglandin", "Ergot alkaloid that causes tetanic uterine contraction", "Antibiotic", "None"]', 1, 'Works directly on smooth muscle. (Beckmann)'),
    (v_topic_id, '197: "Carbetocin" is:', '["A long-acting oxytocin analogue (used in some countries for prevention)", "A relaxant", "A vacuum part", "None"]', 0, 'Common in international guidelines. (WHO)'),
    (v_topic_id, '198: "TXA" (Tranexamic Acid) for PPH?', '["Antifibrinolytic; should be given early (within 3h) to reduce death from bleeding", "Dangerous", "Only for surgery", "None"]', 0, 'The WOMAN trial proved its benefit. (WHO/ACOG)'),
    (v_topic_id, '199: "Placenta Accreta Spectrum" (PAS) risk is highest in women with:', '["Multiple C-sections AND Placenta Previa", "One C-section only", "Diabetes", "Twins"]', 0, 'Risk is ~40% after 4 C-sections with a previa. (ACOG)'),
    (v_topic_id, '200: "Inverted Uterus" replacement: If the placenta is still attached, you should:', '["Pull it off first", "Replace the uterus first, THEN remove the placenta after it is stable", "Leave it forever", "None"]', 1, 'Removing it first increases hemorrhage risk and prevents replacement. (Williams)'),
    (v_topic_id, '201: "Maternal Trauma" in pregnancy - #1 priority?', '["Check the baby", "Stabilize the mother (ABCDEs)", "C-section", "None"]', 1, 'The best way to save the fetus is to save the mother. (ACOG)'),
    (v_topic_id, '202: "Placental Abruption" after trauma can happen even with "minor" injury.', '["True", "False", "Only if she has HTN", "None"]', 0, 'Uterus is elastic, placenta is not (shear forces). (Beckmann)'),
    (v_topic_id, '203: Minimum period of EFM monitoring after "significant" trauma?', '["1 hour", "4-6 hours", "24 hours", "None"]', 1, 'Must look for contractions or distress. (ACOG)'),
    (v_topic_id, '204: "Kliehauer-Betke" (KB) test in trauma helps determine:', '["If she needs RhoGAM and if a major hemorrhage occurred", "If she has GDM", "Fetal weight", "None"]', 0, 'Standard trauma labs. (Williams)'),
    (v_topic_id, '205: "Perimortem C-section" (PMCD) - Goal time from cardiac arrest to delivery of baby?', '["5 minutes", "15 minutes", "30 minutes", "60 minutes"]', 0, 'The "4-minute rule" to start, "5-minute rule" to finish. (AHA)'),
    (v_topic_id, '206: PMCD improves "maternal" survival by:', '["Reducing the baby''s weight", "Relieving aortocaval compression and improving CPR efficacy", "Stopping bleeding", "None"]', 1, 'Key reason for the procedure even if the fetus is not viable. (AHA)'),
    (v_topic_id, '207: "External Cephalic Version" (ECV) - Success rate?', '["10%", "50-60%", "90%", "0%"]', 1, 'Performed at 37 weeks to turn breech to vertex. (ACOG)'),
    (v_topic_id, '208: "ECV" complication that warrants emergency delivery?', '["Fetal movement", "Persistent bradycardia or abruption", "Hiccups", "None"]', 1, 'A known risk of the procedure. (Williams)'),
    (v_topic_id, '209: "Amniotomy" (AROM) emergency risk?', '["Cord prolapse (especially if head is high)", "Infection", "Abruption", "All of the above"]', 3, 'Must check for cord and fetal station before performing. (Beckmann)'),
    (v_topic_id, '210: "Internal Podalic Version" is:', '["Turning the baby to breech for delivery of the SECOND twin", "Common for everyone", "Dangerous", "None"]', 0, 'Accepted technique for twin B malpresentation. (ACOG)'),
    (v_topic_id, '211: "Shoulder Dystocia" - "Turtle Sign" is seen because:', '["The baby is shy", "The shoulders are impacted, preventing further descent during the recoil", "Contractions stopped", "None"]', 1, 'Physical phenomenon. (Williams)'),
    (v_topic_id, '212: "HELPERR" mnemonic for Shoulder Dystocia - "H" stands for:', '["Help (Call for extra hands, pediatrics, anesthesia)", "Hurry", "Head", "None"]', 0, 'Standard emergency protocol. (ACOG)'),
    (v_topic_id, '213: "HELPERR" - "E" stands for:', '["Episiotomy (to allow more room for internal maneuvers)", "Evaluate", "Emergency", "None"]', 0, 'Note: Episiotomy does not release the bone, but helps with hands. (ACOG)'),
    (v_topic_id, '214: "HELPERR" - "L" stands for:', '["Legs (McRoberts)", "Labor", "Lateral", "None"]', 0, 'Hyperflexion of the thighs. (Beckmann)'),
    (v_topic_id, '215: "HELPERR" - "P" stands for:', '["Pressure (Suprapubic)", "Push", "Position", "None"]', 0, 'Disimpact the shoulder. (Williams)'),
    (v_topic_id, '216: "HELPERR" - "E" (second E) stands for:', '["Enter (Internal maneuvers)", "Exit", "Explain", "None"]', 0, 'Woods and Rubin. (Beckmann)'),
    (v_topic_id, '217: "HELPERR" - "R" stands for:', '["Remove the posterior arm", "Roll the patient (Gaskin)", "Both are options", "None"]', 2, 'Final manual maneuvers. (ACOG)'),
    (v_topic_id, '218: "HELPERR" - Final "R"?', '["Recover", "Report", "Repeat", "None"]', 0, 'Post-delivery care. (Beckmann)'),
    (v_topic_id, '219: "Cord prolapse" while at home? Patient advice?', '["Wait for ambulance", "Knee-chest position or hands-and-knees to reduce pressure", "Push", "None"]', 1, 'Standard pre-hospital advice. (Williams)'),
    (v_topic_id, '220: "Prolonged decelerations" can be caused by "Uterine Hypertonus." Treatment?', '["Oxytocin", "Nitroglycerin or Terbutaline (Tocolysis)", "Wait", "None"]', 1, 'Acute relaxation. (Beckmann)'),
    (v_topic_id, '221: "Fetal scalp" puncture in FSE increases risk of:', '["Hemorrhage (especially if fetus has coagulopathy/thrombocytopenia)", "Infection", "Both", "None"]', 2, 'Use with caution. (Williams)'),
    (v_topic_id, '222: "IUPC" insertion - Sudden bright red bleeding?', '["Normal", "Potential placental abruption or uterine perforation", "Wait", "None"]', 1, 'Withdraw and evaluate. (Beckmann)'),
    (v_topic_id, '223: "Montevideo Units" formula?', '["(Intensity - Baseline) x Duration", "Sum of the intensities above baseline in a 10-minute window", "Peak pressure / 10", "None"]', 1, 'Quantitative labor assessment. (Williams)'),
    (v_topic_id, '224: "Active phase" arrest?', '["Dilation >= 6cm with ROM and NO change for 4h (adequate) or 6h (inadequate)", "No change for 2h", "Slow labor", "None"]', 0, 'Current ACOG/SMFM definition. (ACOG)'),
    (v_topic_id, '225: "Category II" tracing: "Management" is:', '["Immediate C-section", "Continued observation and resuscitation to see if it improves to Cat I", "Ignore", "None"]', 1, 'Majority of tracings in labor are Category II. (ACOG)'),
    (v_topic_id, '226: "Variable" decelerations with "rapid recovery" to baseline and "normal variability" are:', '["Highly concerning", "Generally well tolerated", "Dying", "None"]', 1, 'Indicate good compensation. (Beckmann)'),
    (v_topic_id, '227: "Shoulders" on a variable decel are:', '["Brief accelerations before/after the drop (Compensatory)", "Bad signs", "Infections", "None"]', 0, 'Loss of "shoulders" or "over-shoots" is more concerning. (Williams)'),
    (v_topic_id, '228: "Recurrent" late decelerations with "Absent" variability?', '["Category II", "Category III", "Normal", "None"]', 1, 'Mandate for delivery. (ACOG)'),
    (v_topic_id, '229: "Cord pH" of 6.9 and Base Deficit of 14.', '["Normal", "Severe metabolic acidemia", "Respiratory only", "None"]', 1, 'High risk of neonatal encephalopathy. (ACOG)'),
    (v_topic_id, '230: "Fetal Bradycardia" (< 80 bpm) for > 5 minutes?', '["Wait 10 min", "Prepare for emergency delivery (Rule of 3-6-9-12)", "Normal", "None"]', 1, 'A standard surgical approach for acute bradycardia. (Beckmann)'),
    (v_topic_id, '231: "Rule of 3-6-9-12" for bradycardia? 9 minutes is:', '["Decision", "To the OR", "Delivery", "None"]', 1, 'Ideal timing for emergency response. (Williams)'),
    (v_topic_id, '232: "Uterine Rupture" - Why does the head "recede"?', '["Baby pulls up", "The fetus is expelled into the abdominal cavity", "Contractions stop", "None"]', 1, 'Classic physical exam finding. (Beckmann)'),
    (v_topic_id, '233: "Amniotic Fluid Embolism" - First cardiac sign?', '["Left heart failure", "Acute Right heart failure and Pulmonary Vasoconstriction", "Aortic rupture", "None"]', 1, 'Leads to obstructive shock. (Williams)'),
    (v_topic_id, '234: "PPH" - "Methergine" is an:', '["Oxytocic", "Anticoagulant", "Steroid", "None"]', 0, 'Classified as an ergot alkaloid. (Beckmann)'),
    (v_topic_id, '235: "PPH" - "Hemabate" is which prostaglandin?', '["PGE1", "PGE2", "PGF2-alpha", "None"]', 2, 'Potent uterine constrictor. (ACOG)'),
    (v_topic_id, '236: "PPH" - "Misoprostol" is which prostaglandin?', '["PGE1", "PGE2", "PGF2-alpha", "None"]', 0, 'Used for both induction and PPH. (ACOG)'),
    (v_topic_id, '237: "Transfusion" in PPH? "Massive Transfusion Protocol" (MTP) ratio?', '["1:1:1 (Packed Cells, FFP, Platelets)", "10:1", "Packed cells only", "None"]', 0, 'To prevent dilutional coagulopathy. (ACOG)'),
    (v_topic_id, '238: "Total Uterine Inversion"?', '["Fundus in vagina", "Fundus visible outside the introitus", "Indent", "None"]', 1, 'Requires immediate shock management. (Williams)'),
    (v_topic_id, '239: "Vasa Previa" - If diagnosed prenatally, when is delivery recommended?', '["34-35 weeks (Planned C-section)", "40 weeks", "Wait for labor", "None"]', 0, 'To avoid the risk of spontaneous ROM and fetal death. (ACOG)'),
    (v_topic_id, '240: "Fetal Heart Rate" - "Variability" is the best indicator of:', '["Fetal blood sugar", "Cerebral oxygenation and autonomic stability", "Infection", "Weight"]', 1, 'The "Window into the Brain." (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Fetal Monitoring & Emergencies registered.';
END $$;
COMMIT;
