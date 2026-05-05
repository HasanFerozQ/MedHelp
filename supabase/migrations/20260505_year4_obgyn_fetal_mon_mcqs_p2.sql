BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 2: 61-120 (Advanced Monitoring, ACOG Categories, and Resuscitation)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Auscultation" (using a Fetoscope or handheld Doppler) is an acceptable alternative to EFM in:', '["Low-risk pregnancies", "High-risk pregnancies", "Twins", "Post-term"]', 0, 'Must be performed at specific intervals (e.g., every 15-30 min in 1st stage). (ACOG)'),
    (v_topic_id, '62: "Fetal Pulse Oximetry" has been shown to:', '["Significantly reduce C-section rates", "Not be superior to EFM alone for improving outcomes", "Replace IUPC", "Be dangerous"]', 1, 'Not currently recommended for clinical use. (Williams)'),
    (v_topic_id, '63: Which of the following is a "Category III" FHR pattern?', '["Recurrent late decelerations with minimal variability", "Sinusoidal pattern", "Absent variability with recurrent variable decelerations", "All of the above"]', 3, 'Indicates abnormal acid-base status. (ACOG)'),
    (v_topic_id, '64: A "Modified BPP" consists of:', '["NST and Amniotic Fluid Index (AFI)", "Movement and Breathing", "Tone and AFI", "None"]', 0, 'Efficient and predictive for fetal well-being. (Beckmann)'),
    (v_topic_id, '65: An "AFI" of 4 cm is considered:', '["Normal", "Oligohydramnios (AFI < 5 cm)", "Polyhydramnios", "Equivocal"]', 1, 'Increases risk of cord compression. (ACOG)'),
    (v_topic_id, '66: A "Non-Stress Test" (NST) is "Reactive" if there are:', '["1 acceleration in 10 min", "2 accelerations (15x15) in 20 min", "No decels", "Minimal variability"]', 1, 'Baseline must be normal. (Williams)'),
    (v_topic_id, '67: "Fetal Heart Rate" is regulated primarily by the:', '["Kidneys", "Autonomic Nervous System (Sympathetic and Parasympathetic)", "Lungs", "Liver"]', 1, 'Core physiology of FHR interpretation. (Beckmann)'),
    (v_topic_id, '68: Parasympathetic (Vagal) stimulation _____ the heart rate.', '["Increases", "Decreases", "Stays same", "Fluctuates"]', 1, 'Sympathetic increases it. (Williams)'),
    (v_topic_id, '69: Loss of variability is a sign of central nervous system:', '["Arousal", "Depression (hypoxia, acidosis, or drugs)", "Stimulation", "Infection"]', 1, 'CNS cannot regulate the heart rate variations. (ACOG)'),
    (v_topic_id, '70: "Episodic" FHR changes are those that:', '["Occur with contractions", "Are NOT associated with contractions", "Are always bad", "Are always good"]', 1, 'Periodic changes happen *with* contractions. (Beckmann)'),
    (v_topic_id, '71: Accelerations that happen with contractions are called:', '["Variable decels", "Periodic accelerations", "Early decels", "None"]', 1, 'Often benign. (Williams)'),
    (v_topic_id, '72: "Saltatory" variability is a term sometimes used for:', '["Marked variability", "Absent variability", "Sinusoidal", "Normal"]', 0, 'Looks "jumpy." (ACOG)'),
    (v_topic_id, '73: Management of "Late Decelerations" (Recurrent)?', '["Lateral position, IVF, O2, Stop Pitocin, and check BP/Cervix", "Wait", "C-section immediately for everyone", "Antibiotics"]', 0, 'Standard intrauterine resuscitation. (ACOG)'),
    (v_topic_id, '74: If Category II tracing does not improve with resuscitation, the next step is often:', '["Continue forever", "Fetal Scalp Stimulation (to assess for acidosis)", "Immediate forceps", "Manual rotation"]', 1, 'Helps determine if the fetus is already acidotic. (Beckmann)'),
    (v_topic_id, '75: "Fetal Scalp Blood Sampling" for pH is:', '["Standard of care", "Rarely used now due to technical difficulty and availability of VAS/Scalp stim", "Dangerous", "None"]', 1, 'Traditional gold standard, but replaced by simpler tests. (Williams)'),
    (v_topic_id, '76: A fetal scalp pH of < _____ is indicative of significant acidosis.', '["7.35", "7.25", "7.20", "7.00"]', 2, 'Requires immediate delivery. (ACOG)'),
    (v_topic_id, '77: "Shoulder Dystocia" Risk Factors include:', '["Maternal Diabetes", "Maternal Obesity", "Post-term pregnancy", "All of the above"]', 3, 'Clinical suspicion is key. (ACOG)'),
    (v_topic_id, '78: The "Turtle Sign" is:', '["Baby swimming", "Retraction of the fetal head against the perineum after delivery", "Slow labor", "High BP"]', 1, 'Pathognomonic for shoulder dystocia. (Williams)'),
    (v_topic_id, '79: "McRoberts Maneuver" works by:', '["Straightening the sacrum and rotating the symphysis cephalad", "Breaking the arm", "Pushing on the head", "None"]', 0, 'Increases the space for the anterior shoulder. (Beckmann)'),
    (v_topic_id, '80: "Woods Screw Maneuver" involves:', '["Pulling the head", "Rotating the posterior shoulder 180 degrees", "Delivering the legs", "Fracturing the clavicle"]', 1, 'To turn the shoulders into an oblique diameter. (Williams)'),
    (v_topic_id, '81: "Rubin Maneuver" involves:', '["Applying pressure to the posterior surface of the anterior shoulder to adduct it", "Pushing the head back", "Suction", "None"]', 0, 'Adduction reduces the shoulder-to-shoulder diameter. (Beckmann)'),
    (v_topic_id, '82: "Delivery of the Posterior Arm" can resolve up to _____ of shoulder dystocias.', '["10%", "50%", "85%", "100%"]', 2, 'Highly effective technique. (Williams)'),
    (v_topic_id, '83: "Gaskin Maneuver" (All-fours position) is:', '["Contraindicated", "An alternative maneuver that may resolve dystocia by changing pelvic diameters", "Only for home births", "None"]', 1, 'Evidence-based option in mobile patients. (ACOG)'),
    (v_topic_id, '84: Neonatal complications of Shoulder Dystocia?', '["Erb-Duchenne Palsy (C5-C6 injury)", "Clavicle fracture", "Hypoxic-Ischemic Encephalopathy (HIE)", "All of the above"]', 3, 'Requires prompt resolution to prevent permanent injury. (ACOG)'),
    (v_topic_id, '85: "Erb-Duchenne Palsy" presents as the "Waiters Tip" position:', '["Arm adducted, internally rotated, and forearm extended", "Arm in the air", "Hand in a fist", "None"]', 0, 'Most cases resolve within 6-12 months. (Beckmann)'),
    (v_topic_id, '86: "Klumpke Palsy" (C8-T1) results in:', '["Claw hand", "Waiters tip", "Blindness", "None"]', 0, 'Less common than Erb''s. (Williams)'),
    (v_topic_id, '87: "Umbilical Cord Prolapse" is a surgical emergency because:', '["The baby falls out", "The presenting part compresses the cord, cutting off fetal blood supply", "It causes infection", "None"]', 1, 'Fetal bradycardia is immediate and profound. (ACOG)'),
    (v_topic_id, '88: While waiting for C-section in Cord Prolapse, the provider should:', '["Pull the cord", "Keep a hand in the vagina and manually elevate the presenting part off the cord", "Put the cord back in", "Wait outside"]', 1, 'Do NOT remove the hand until the surgeon is ready. (Williams)'),
    (v_topic_id, '89: "Uterine Rupture" often presents with "recession of the presenting part" and:', '["Fetal tachycardia", "Severe abdominal pain and Category II/III tracing", "No symptoms", "Fever"]', 1, 'May also see maternal shock. (Beckmann)'),
    (v_topic_id, '90: Risk of rupture in a patient with a "prior low-transverse" C-section undergoing TOLAC?', '["~0.5-0.9%", "~5-10%", "~20%", "0%"]', 0, 'Generally considered safe for most patients. (ACOG)'),
    (v_topic_id, '91: "Amniotic Fluid Embolism" mortality rate is approximately:', '["1%", "10%", "Up to 60-80%", "100%"]', 2, 'Remains one of the most feared obstetric events. (Williams)'),
    (v_topic_id, '92: AFE survivors often have permanent:', '["Diabetes", "Neurological impairment", "Renal failure", "Blindness"]', 1, 'Due to prolonged hypoxia during the arrest. (ACOG)'),
    (v_topic_id, '93: "Uterine Inversion" classification: "Complete" inversion means:', '["The fundus is in the cervix", "The fundus has passed through the cervix and is in the vagina or beyond", "Small indentation", "None"]', 1, 'Medical emergency due to neurogenic shock and bleeding. (Beckmann)'),
    (v_topic_id, '94: First step in managing Uterine Inversion?', '["Call for help and start IV fluids/blood", "Pull the cord harder", "Give oxytocin immediately", "C-section"]', 0, 'Shock can be out of proportion to blood loss. (Williams)'),
    (v_topic_id, '95: "Johnson Maneuver" is:', '["Breaking the arm", "Manual replacement of the inverted uterus by pushing the fundus back through the cervix", "Suction", "None"]', 1, 'Requires a relaxed uterus. (Beckmann)'),
    (v_topic_id, '96: "Placental Abruption" (Grade 3) is associated with:', '["Mild pain", "Fetal death, maternal DIC, and board-like uterus", "No bleeding", "None"]', 1, 'Severe placental separation. (Williams)'),
    (v_topic_id, '97: "Couvelaire Uterus" management?', '["Immediate hysterectomy for everyone", "Aggressive management of atony; hysterectomy only if hemorrhage is uncontrollable", "Wait", "None"]', 1, 'The uterus can often still contract. (ACOG)'),
    (v_topic_id, '98: "Postpartum Hemorrhage": Atony is the failure of the myometrium to:', '["Relax", "Contract and compress the spiral arteries", "Infect", "Bleed"]', 1, 'Basic pathophysiology of atony. (Beckmann)'),
    (v_topic_id, '99: "Bimanual Uterine Compression" is:', '["Dangerous", "A physical maneuver to compress the uterus between a hand in the vagina and a hand on the abdomen", "Only for twins", "None"]', 1, 'Effective temporary measure for atony. (Williams)'),
    (v_topic_id, '100: A "Genital Tract Hematoma" presents with:', '["Painless mass", "Severe perineal/rectal pain and a palpable fluctuant mass", "Bleeding from the os", "Fever"]', 1, 'May require incision and drainage. (Beckmann)'),
    (v_topic_id, '101: "Active Management" of the 3rd stage of labor reduces PPH risk. It includes:', '["Fundal massage and Oxytocin after delivery of the baby", "Wait 1 hour", "Pulling the cord immediately", "None"]', 0, 'Standard of care to prevent atony. (ACOG)'),
    (v_topic_id, '102: "Retained Placenta" is defined as placenta not delivered within:', '["5 minutes", "30 minutes", "2 hours", "12 hours"]', 1, 'Requires manual removal. (Williams)'),
    (v_topic_id, '103: "Manual Removal" of the placenta carries an increased risk of:', '["Diabetes", "Infection (Endometritis)", "Twins", "None"]', 1, 'Requires antibiotic prophylaxis. (ACOG)'),
    (v_topic_id, '104: "Fetal Distress" on EFM is a term now replaced by:', '["Normal tracing", "Non-reassuring or Category II/III fetal heart rate pattern", "Fetal death", "None"]', 1, 'More precise terminology. (ACOG)'),
    (v_topic_id, '105: "Amnioinfusion" (instilling saline into the uterus) is used to treat:', '["Late decelerations", "Recurrent variable decelerations (by relieving cord compression)", "Tachycardia", "Infection"]', 1, 'Can also be used for thick meconium. (ACOG)'),
    (v_topic_id, '106: "Internal" toco (IUPC) is more accurate than external toco because it is NOT affected by:', '["Fetal movement", "Maternal habitus (obesity) or position", "Fluid", "None"]', 1, 'Measures true intra-amniotic pressure. (Beckmann)'),
    (v_topic_id, '107: Montevideo Units (MVUs) > _____ are generally considered adequate for labor progression.', '["100", "200-250", "400", "50"]', 1, 'Assists in deciding whether to add oxytocin. (Williams)'),
    (v_topic_id, '108: "Fetal Scalp Stimulation" is only reliable when:', '["The baby is sleeping", "Performed during a period of baseline (not during a decel)", "The mother is awake", "None"]', 1, 'Standard protocol. (ACOG)'),
    (v_topic_id, '109: "Accelerations" reflect a pH of at least:', '["7.10", "7.15", "7.19-7.20", "7.40"]', 2, 'Reliable rule out of acidemia. (Beckmann)'),
    (v_topic_id, '110: "Variable" decelerations that are "Severe" are defined by:', '["Drop < 70 bpm for > 60 seconds", "Any drop", "Only if there are 2", "None"]', 0, 'Traditional definition of concerning variables. (Williams)'),
    (v_topic_id, '111: "Over-shoots" (accelerations immediately following a variable decel) are:', '["Good signs", "A potential sign of fetal stress or autonomic instability", "Normal", "None"]', 1, 'Contrasted with "shoulders" which are usually benign. (Beckmann)'),
    (v_topic_id, '112: Fetal "Bradycardia" management?', '["Deliver immediately always", "Resuscitate; if it does not recover within 5-10 min, prepare for delivery (C-section)", "Wait 1 hour", "None"]', 1, 'Depends on the suspected cause (e.g., cord prolapse vs epidural). (ACOG)'),
    (v_topic_id, '113: Which of the following is NOT a severity criterion for Variable Decelerations?', '["Depth", "Duration", "Presence of accelerations before/after (shoulders)", "Contraction strength"]', 3, 'Characteristics of the decel itself matter most. (Williams)'),
    (v_topic_id, '114: "Meconium" passage in utero is more common in:', '["Preterm fetuses", "Post-term fetuses and cases of acute stress", "Healthy babies", "None"]', 1, 'Maturity of the GI tract. (Beckmann)'),
    (v_topic_id, '115: "Chorioamnionitis" (Infection) classically causes which FHR change?', '["Bradycardia", "Persistent Tachycardia and Loss of Variability", "Early decels", "None"]', 1, 'Fetal inflammatory response. (ACOG)'),
    (v_topic_id, '116: "Fetal Scalp Electrode" (FSE) measures the:', '["Heart rate using Doppler", "R-R interval of the fetal EKG", "Pressure", "Oxygen"]', 1, 'Provides a very accurate and continuous heart rate. (Williams)'),
    (v_topic_id, '117: "Prolonged decelerations" are often associated with:', '["Vaginal exams", "Epidural placement", "Cord prolapse", "All of the above"]', 3, 'Must identify and treat the underlying cause. (Beckmann)'),
    (v_topic_id, '118: "Fetal Resuscitation": Why turn the mother on her LEFT side?', '["Comfort", "To relieve IVC compression and improve venous return/cardiac output", "To help the baby rotate", "None"]', 1, 'The "Left Lateral" position. (ACOG)'),
    (v_topic_id, '119: "Oxygen" administration to the mother (8-10 L/min) for fetal distress is:', '["Standard of care, though benefits for mild distress are debated", "Mandatory for everyone", "Dangerous", "None"]', 0, 'Aims to increase the oxygen gradient to the fetus. (ACOG)'),
    (v_topic_id, '120: "Tachysystole" management?', '["Increase Pitocin", "Decrease or stop Pitocin and give fluids/reposition", "C-section only", "None"]', 1, 'Excessive contractions reduce placental recovery time. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 2 (61-120) MCQs for Fetal Monitoring & Emergencies registered.';
END $$;
COMMIT;
