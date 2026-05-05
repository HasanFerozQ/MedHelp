BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-normal-labor' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-normal-labor not found.';
    END IF;

    -- Batch 4: 181-240 (Fetal Monitoring, Special Delivery Situations)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: In a "Category I" fetal heart rate tracing, which of the following is REQUIRED?', '["Accelerations", "Moderate Variability", "Late decelerations", "Early decelerations"]', 1, 'Category I = 110-160 bpm, moderate variability, NO late/variable decels. (ACOG)'),
    (v_topic_id, '182: A "Category III" tracing is defined by absent variability AND:', '["Accelerations", "Recurrent late or variable decelerations or bradycardia", "Early decelerations", "Contractions"]', 1, 'Predictive of abnormal fetal acid-base status. (ACOG)'),
    (v_topic_id, '183: What is the defining feature of "Accelerations" for a fetus > 32 weeks?', '["Increase of 10 bpm for 10 sec", "Increase of 15 bpm for 15 sec", "Increase of 20 bpm for 20 sec", "Any increase"]', 1, 'The "15 by 15" rule. (ACOG)'),
    (v_topic_id, '184: For a fetus < 32 weeks, accelerations are defined as:', '["15 by 15", "10 by 10", "5 by 5", "None"]', 1, 'Immature CNS leads to smaller accelerations. (ACOG)'),
    (v_topic_id, '185: "Moderate" variability is defined as a range of:', '["0-5 bpm", "6-25 bpm", "> 25 bpm", "Absent"]', 1, 'Reflects an intact and oxygenated CNS. (ACOG)'),
    (v_topic_id, '186: "Marked" variability (> 25 bpm) is often seen:', '["During fetal sleep", "During acute fetal stress or hypoxia", "After narcotics", "Normal"]', 1, 'May be a precursor to more severe decelerations. (Williams)'),
    (v_topic_id, '187: Fetal "Tachycardia" (> 160 bpm) can be caused by:', '["Maternal fever/infection", "Fetal anemia", "Maternal hyperthyroidism", "All of the above"]', 3, 'Infection is the most common cause. (Beckmann)'),
    (v_topic_id, '188: Fetal "Bradycardia" (< 110 bpm) that is sudden and prolonged suggests:', '["Umbilical cord prolapse or uterine rupture", "Fetal sleep", "Infection", "Oxytocin"]', 0, 'Surgical emergency if it doesn''t recover. (Williams)'),
    (v_topic_id, '189: "Amniotomy" (AROM) in a patient with a high station (-3 or -4) head is a risk for:', '["Cord prolapse", "Rapid labor", "Bleeding", "Pain"]', 0, 'The head must be "well-applied" to the cervix. (Beckmann)'),
    (v_topic_id, '190: If a "Cord Prolapse" occurs, the first step is to:', '["Try to push the cord back in", "Elevate the fetal head manually and prepare for immediate C-section", "Wait for the next contraction", "Give O2"]', 1, 'Manual elevation prevents the head from compressing the cord. (ACOG)'),
    (v_topic_id, '191: "Operative Vaginal Delivery" (Forceps/Vacuum) should ONLY be performed when:', '["The head is engaged and at least at +2 station", "The cervix is 8 cm", "The patient is tired", "The baby is breech"]', 0, 'Mid-forceps/vacuum (above +2) is generally avoided. (ACOG)'),
    (v_topic_id, '192: A contraindication to "Vacuum Extraction" is:', '["Head at +3 station", "Fetal malpresentation (e.g., face, breech)", "Maternal exhaustion", "Epidural"]', 1, 'You cannot apply a vacuum to a face or breech. (Williams)'),
    (v_topic_id, '193: "Fetal Scalp Electrode" (FSE) is used to:', '["Measure fetal pH", "Monitor the fetal ECG directly for more accurate heart rate", "Stimulate the baby", "Inject medicine"]', 1, 'Used when external monitoring is difficult (e.g., obesity). (Beckmann)'),
    (v_topic_id, '194: "Vasa Previa" is associated with which placental anomaly?', '["Succenturiate lobe or Velamentous cord insertion", "Placenta accreta", "Placenta previa", "None"]', 0, 'Vessels run through the membranes. (Williams)'),
    (v_topic_id, '195: "Placental Abruption" during labor often presents with:', '["Painless bleeding", "Painful bleeding, uterine tenderness, and high-frequency contractions", "No bleeding", "Low BP only"]', 1, 'Abruption is a clinical diagnosis. (Beckmann)'),
    (v_topic_id, '196: Which "Mode of Delivery" is preferred for a "Double Footling Breech" at term?', '["Vaginal delivery", "Cesarean section", "Forceps", "Vacuum"]', 1, 'High risk of cord prolapse and head entrapment in footling breech. (ACOG)'),
    (v_topic_id, '197: "External Cephalic Version" (ECV) success rate is approximately:', '["10%", "50-60%", "90%", "100%"]', 1, 'Higher success in multiparas with plenty of fluid. (Williams)'),
    (v_topic_id, '198: "Internal Podalic Version" is a technique used primarily for:', '["Breech babies", "Delivery of a second twin in non-vertex presentation", "Shoulder dystocia", "Face presentation"]', 1, 'Reaching into the uterus to grab the feet of the second twin. (ACOG)'),
    (v_topic_id, '199: A "Twin" pregnancy with Twin A in Vertex and Twin B in Vertex presentation:', '["Must be C-section", "Can be a trial of vaginal delivery", "Is always premature", "Requires immediate surgery"]', 1, 'Vertex/Vertex is the most common and favorable twin presentation. (Beckmann)'),
    (v_topic_id, '200: "Pre-eclampsia with Severe Features" in labor requires seizure prophylaxis with:', '["Labetalol", "Magnesium Sulfate", "Phenobarbital", "Nifedipine"]', 1, 'Magnesium is for neuroprotection/seizure prevention, not BP. (ACOG)'),
    (v_topic_id, '201: The loading dose of "Magnesium Sulfate" for eclampsia prophylaxis is typically:', '["2 g IV", "4-6 g IV", "10 g IM", "1 g/hr"]', 1, 'Followed by 1-2 g/hr infusion. (Williams)'),
    (v_topic_id, '202: Clinical signs of "Magnesium Toxicity" include:', '["Loss of deep tendon reflexes and respiratory depression", "Hypertension", "Seizures", "Hyperreflexia"]', 0, 'DTRs are lost at 7-10 mEq/L. (Beckmann)'),
    (v_topic_id, '203: "Preterm Labor" is defined as regular contractions with cervical change before _____ weeks.', '["32", "34", "37", "40"]', 2, 'Birth before 37 0/7 weeks. (ACOG)'),
    (v_topic_id, '204: "Betamethasone" (steroids) are given in preterm labor primarily to:', '["Stop contractions", "Prevent Respiratory Distress Syndrome (RDS) by maturing lungs", "Treat infection", "Increase weight"]', 1, 'Also reduces Intraventricular Hemorrhage (IVH) and NEC. (ACOG)'),
    (v_topic_id, '205: "Indomethacin" (Tocolytic) is usually avoided after 32 weeks because of:', '["Maternal HTN", "Premature closure of the fetal Ductus Arteriosus", "Renal failure", "Liver failure"]', 1, 'Also can cause oligohydramnios. (Williams)'),
    (v_topic_id, '206: "Nifedipine" (Tocolytic) mechanism of action?', '["Oxytocin antagonist", "Calcium Channel Blocker", "Prostaglandin inhibitor", "Beta-agonist"]', 1, 'Relaxes uterine smooth muscle. (Beckmann)'),
    (v_topic_id, '207: "Group B Strep" (GBS) prophylaxis in labor consists of:', '["Oral Amoxicillin", "IV Penicillin G or Ampicillin", "Ceftriaxone", "Vancomycin only"]', 1, 'Given if positive culture at 36 weeks or unknown GBS with risks. (CDC)'),
    (v_topic_id, '208: Risk factors for GBS sepsis in the neonate include ROM > _____ hours.', '["4", "12", "18", "24"]', 2, 'Prolonged ROM increases bacterial ascent. (CDC)'),
    (v_topic_id, '209: "Active Phase" of labor typically progresses at a rate of _____ in a nullipara.', '["0.5 cm/hr", "1.2 cm/hr (Friedman) or slower (Zhang)", "5 cm/hr", "No progress"]', 1, 'Modern studies show slower progress is often normal. (ACOG)'),
    (v_topic_id, '210: "Stage 2" of labor is considered "Prolonged" in a nullipara with an epidural after how many hours of pushing?', '["1 hour", "2 hours", "3 hours", "6 hours"]', 2, '2 hours without epidural, 3 hours with. (ACOG)'),
    (v_topic_id, '211: "Atony" is most common in cases of:', '["Small babies", "Uterine overdistension (multiples, polyhydramnios) and prolonged labor", "Quick labor", "Young mothers"]', 1, 'The muscle becomes "fatigued." (Williams)'),
    (v_topic_id, '212: "Uterine Rupture" is a rare but catastrophic event most common in:', '["Primiparas", "Women with prior uterine scars (C-section/Myomectomy)", "Teens", "Multiparas with no scars"]', 1, 'Presents with sudden FHR bradycardia and loss of station. (Beckmann)'),
    (v_topic_id, '213: If "Uterine Rupture" is suspected, the next step is:', '["Wait for more signs", "Immediate laparotomy and C-section", "Oxytocin", "Forceps"]', 1, 'Life-threatening for both. (ACOG)'),
    (v_topic_id, '214: "Meconium Aspiration Syndrome" is prevented by:', '["Suctioning the head on the perineum (deprecated)", "Routine intubation (deprecated)", "Prompt delivery and monitoring", "Cleaning the baby"]', 2, 'Suctioning on the perineum is no longer recommended. (AAP/ACOG)'),
    (v_topic_id, '215: "Nuchal Cord" (cord around the neck) is found in what percentage of deliveries?', '["1%", "5%", "20-30%", "80%"]', 2, 'Usually loose and not a cause for concern. (Williams)'),
    (v_topic_id, '216: If a "Nuchal Cord" is found during delivery, the provider should:', '["Cut it immediately", "Attempt to slip it over the head or deliver the baby through the loop", "Push the head back", "Forceps"]', 1, 'Only cut if too tight to slip or deliver through. (Beckmann)'),
    (v_topic_id, '217: "Placenta Accreta" is suspected when:', '["The baby is large", "The placenta fails to separate and there is a history of prior C-section/previa", "The mother has twins", "No bleeding"]', 1, 'Can lead to massive hemorrhage requiring hysterectomy. (ACOG)'),
    (v_topic_id, '218: "DIC" (Disseminated Intravascular Coagulation) in obstetrics is most commonly triggered by:', '["Abruption", "Amniotic Fluid Embolism", "Severe PPH", "All of the above"]', 3, 'Release of thromboplastin into maternal circulation. (Williams)'),
    (v_topic_id, '219: Maternal "Positioning" in Stage 2 labor:', '["Must be lithotomy (on back)", "Can be any position the mother finds comfortable (squatting, side-lying, hands/knees)", "Only on the left side", "Sitting"]', 1, 'Upright positions may use gravity to assist descent. (Beckmann)'),
    (v_topic_id, '220: "Delayed Pushing" (Laboring down) involves:', '["Not pushing at 10cm until the mother feels the urge", "Stopping contractions", "Pushing early", "Using forceps"]', 0, 'May reduce maternal exhaustion. (Williams)'),
    (v_topic_id, '221: "Nitrous Oxide" use in labor:', '["Provides total pain relief", "Is a safe, self-administered gas that reduces anxiety and pain perception", "Is dangerous for the baby", "Causes paralysis"]', 1, 'Increasingly popular "middle ground" option. (ACOG)'),
    (v_topic_id, '222: "Combined Spinal-Epidural" (CSE) advantage?', '["No pain at all", "Rapid onset from the spinal portion and continuous relief from the epidural", "Lower cost", "No needle"]', 1, 'Also called "Walking Epidural." (Beckmann)'),
    (v_topic_id, '223: Maternal "Fever" in labor (Chorioamnionitis) requires:', '["Stopping labor", "IV Antibiotics (Amp/Gent) and delivery", "C-section only", "Wait until birth"]', 1, 'Continue labor; infection is not a mandate for C-section. (ACOG)'),
    (v_topic_id, '224: "Fetal Tachycardia" + Maternal Fever =', '["Normal labor", "Chorioamnionitis", "Fetal sleep", "GDM"]', 1, 'Classic clinical picture. (Williams)'),
    (v_topic_id, '225: "Velamentous Cord Insertion" is where:', '["The cord is short", "The cord inserts into the membranes rather than the placenta", "The cord is in the middle", "The cord is missing"]', 1, 'Risk for vasa previa and vessel rupture. (Beckmann)'),
    (v_topic_id, '226: "Succenturiate Lobe" is:', '["A small baby", "An accessory lobe of the placenta connected by fetal vessels", "A type of tumor", "Three placentas"]', 1, 'Risk of retained lobe or vasa previa. (Williams)'),
    (v_topic_id, '227: "Placenta Circumvallate" is associated with:', '["Large babies", "Increased risk of abruption and preterm labor", "Normal pregnancy", "Twins"]', 1, 'The membranes double back over the placenta edges. (Beckmann)'),
    (v_topic_id, '228: "True Knot" in the umbilical cord:', '["Always kills the baby", "Is usually insignificant unless pulled tight", "Requires C-section", "Is a genetic defect"]', 1, 'Found in ~1% of deliveries. (Williams)'),
    (v_topic_id, '229: "Two-Vessel Cord" (Single Umbilical Artery) should prompt evaluation for:', '["Diabetes", "Fetal renal or cardiac anomalies", "Lung disease", "None"]', 1, 'Often isolated, but screening US is warranted. (Beckmann)'),
    (v_topic_id, '230: "Hydrops" can be caused by Parvovirus B19 infection.', '["True", "False", "Only in the 3rd trimester", "Only if mother is immune"]', 0, 'Causes fetal anemia via suppression of erythropoiesis. (Williams)'),
    (v_topic_id, '231: "Naegele''s Rule" for EDD calculation?', '["LMP + 1 year", "LMP + 7 days - 3 months + 1 year", "LMP + 9 months", "US only"]', 1, 'Standard dating tool. (Beckmann)'),
    (v_topic_id, '232: Best time to determine "Gestational Age" by ultrasound?', '["1st trimester (CRL)", "2nd trimester", "3rd trimester", "Birth"]', 0, 'Crown-Rump Length is the most accurate. (ACOG)'),
    (v_topic_id, '233: "Quickening" (first fetal movement felt) usually occurs at _____ weeks in a primigravida.', '["10-12", "18-20", "24-26", "30"]', 1, 'Occurs earlier (16-18) in multiparas. (Beckmann)'),
    (v_topic_id, '234: "Goodell Sign" is:', '["Softening of the cervix", "Blue cervix", "Softening of the lower uterine segment", "Breast tenderness"]', 0, 'Sign of early pregnancy. (Williams)'),
    (v_topic_id, '235: "Chadwick Sign" is:', '["Nausea", "Bluish discoloration of the cervix/vagina", "Fetal movement", "Soft cervix"]', 1, 'Due to increased pelvic vascularity. (Beckmann)'),
    (v_topic_id, '236: "Hegar Sign" is:', '["Softening of the lower uterine segment (isthmus)", "Fundal height", "Headache", "Pigmentation"]', 0, 'Felt on bimanual exam. (Williams)'),
    (v_topic_id, '237: "Linea Nigra" is:', '["A stretch mark", "Dark vertical line appearing on the abdomen", "A rash", "Nipple change"]', 1, 'Due to melanocyte-stimulating hormone. (Beckmann)'),
    (v_topic_id, '238: "Chloasma" (Melasma) is also known as:', '["The mask of pregnancy", "A fungus", "Sunburn", "Acne"]', 0, 'Hyperpigmentation of the face. (Williams)'),
    (v_topic_id, '239: Maternal "Weight Gain" for a normal BMI patient should be:', '["5-10 lbs", "25-35 lbs", "50 lbs", "None"]', 1, 'Varies by starting BMI. (IOM)'),
    (v_topic_id, '240: "Leukorrhea" of pregnancy is:', '["A serious infection", "Thick, white, odorless vaginal discharge", "Bloody discharge", "Pus"]', 1, 'Due to increased estrogen; normal. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Normal Labor registered.';
END $$;
COMMIT;
