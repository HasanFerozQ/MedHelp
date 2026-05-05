BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-high-risk-pregnancy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-high-risk-pregnancy not found.';
    END IF;

    -- Batch 5: 241-300 (Advanced Scenarios and Final Review)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: A 28-year-old at 35 weeks with pre-gestational diabetes has a FHR tracing with recurrent late decelerations and minimal variability. Next step?', '["Wait and see", "Stabilize (O2, IV, position) and if no improvement, prepare for delivery", "Oxytocin", "Glucose"]', 1, 'Non-reassuring tracing warrants intervention. (ACOG)'),
    (v_topic_id, '242: "Postpartum Hemorrhage" in a diabetic woman with a 4800g baby. Most likely cause?', '["Laceration", "Uterine Atony (due to macrosomia/overdistension)", "Pre-eclampsia", "GBS"]', 1, 'Macrosomia is a major risk factor for atony. (Williams)'),
    (v_topic_id, '243: A woman with "Lupus" (SLE) has positive Anti-Ro (SSA) and Anti-La (SSB) antibodies. What is the fetus at risk for?', '["Cleft lip", "Congenital heart block (permanent bradycardia)", "Limb defects", "Diabetes"]', 1, 'Antibodies cross the placenta and damage the fetal conduction system. (ACOG)'),
    (v_topic_id, '244: A pregnant woman has "Acute Appendicitis" suspected. She is at 28 weeks. Why might her pain be in the RUQ?', '["Referred pain", "Upward displacement of the appendix by the enlarging uterus", "It is always in the RLQ", "None"]', 1, 'Classic anatomical shift in pregnancy. (Beckmann)'),
    (v_topic_id, '245: A woman at 32 weeks has sudden, intense RUQ pain, nausea, and a BP of 165/110. LFTs are 3x normal, Platelets 60k. Diagnosis?', '["Gallstones", "HELLP Syndrome", "Acute Fatty Liver of Pregnancy", "Gastritis"]', 1, 'Criteria for HELLP (Hemolysis, Elevated LFTs, Low Platelets). (Williams)'),
    (v_topic_id, '246: "Amnioreduction" (draining excess fluid) is a treatment used in:', '["Oligohydramnios", "Severe Polyhydramnios (for maternal comfort or to prevent PPROM)", "IUGR", "Twins"]', 1, 'Removes excess volume. (ACOG)'),
    (v_topic_id, '247: "Laser ablation" of communicating vessels is the preferred treatment for:', '["Placenta previa", "Twin-to-Twin Transfusion Syndrome (TTTS)", "IUGR", "PPROM"]', 1, 'Targeted treatment for monochorionic twin vascular issues. (Williams)'),
    (v_topic_id, '248: A woman at 34 weeks has "PPROM." She develops a fever of 102F and fetal tachycardia. Diagnosis?', '["Normal labor", "Chorioamnionitis (Triple I)", "PPH", "GDM"]', 1, 'Infection of the membranes/fluid. (Beckmann)'),
    (v_topic_id, '249: Management of "Chorioamnionitis" at 34 weeks?', '["Immediate delivery and IV Antibiotics", "Wait until 37 weeks", "Steroids only", "Bed rest"]', 0, 'Infection outweighs prematurity risk. (ACOG)'),
    (v_topic_id, '250: "Septic Pelvic Thrombophlebitis" is typically a "Diagnosis of Exclusion" when:', '["Fever disappears", "Postpartum fever persists despite broad-spectrum antibiotics", "Patient has a rash", "BP is high"]', 1, 'Treated with Heparin/anticoagulation and continued antibiotics. (Williams)'),
    (v_topic_id, '251: Which "Rh" antibody titer is NOT associated with HDFN (because it is usually IgM)?', '["Anti-D", "Anti-Lewis (Lewis lives, Kell kills)", "Anti-Kell", "Anti-c"]', 1, 'Anti-Lewis antibodies do not cross the placenta. (Beckmann)'),
    (v_topic_id, '252: A woman is "Rh-negative" and her partner is also "Rh-negative." Risk of Rh-alloimmunization?', '["High", "Zero (baby will also be Rh-negative)", "50%", "10%"]', 1, 'Autosomal recessive inheritance. (ACOG)'),
    (v_topic_id, '253: Maternal "Thrombophilia" (e.g., Factor V Leiden) increases the risk of:', '["Venous Thromboembolism (VTE)", "Pre-eclampsia", "Placental abruption", "All of the above"]', 3, 'Pregnancy is a pro-thrombotic state. (Williams)'),
    (v_topic_id, '254: In a woman with "Chronic Hypertension," which lab value helps distinguish it from superimposed pre-eclampsia?', '["Low creatinine", "Elevated Uric Acid and worsening Proteinuria", "High Hemoglobin", "Low Glucose"]', 1, 'Uric acid is often used as a marker for pre-eclampsia. (ACOG)'),
    (v_topic_id, '255: A 41-year-old at 39 weeks has a "Post-term" pregnancy if she reaches _____ weeks.', '["40", "41", "42", "43"]', 2, 'Still defined as 42 weeks regardless of age. (ACOG)'),
    (v_topic_id, '256: "Meconium Aspiration Syndrome" is most common in:', '["Preterm infants", "Post-term infants", "Twins", "GDM"]', 1, 'Incidence of meconium-stained fluid increases with gestational age. (Williams)'),
    (v_topic_id, '257: A woman with "GDM" should have her baby monitored with which test starting at 32-36 weeks?', '["NST or BPP (twice weekly)", "Daily Ultrasound", "Blood tests", "None"]', 0, 'To monitor for placental insufficiency. (ACOG)'),
    (v_topic_id, '258: "Betamethasone" reduces the risk of which neonatal condition in preterm birth?', '["Respiratory Distress Syndrome (RDS)", "Intraventricular Hemorrhage (IVH)", "Necrotizing Enterocolitis (NEC)", "All of the above"]', 3, 'Significant multi-organ benefits. (ACOG)'),
    (v_topic_id, '259: How many doses of "Betamethasone" are in a standard course?', '["1", "2 (12mg IM every 24h)", "4", "Continuous"]', 1, 'Standard regimen. (Williams)'),
    (v_topic_id, '260: "Rescue" dose of steroids is considered if the first dose was given > _____ days ago and the patient is < 34 weeks.', '["1", "7", "14", "30"]', 1, 'May be repeated once. (ACOG)'),
    (v_topic_id, '261: Maternal "Cardiac Output" increases by _____ in a normal pregnancy.', '["10%", "30-50%", "100%", "None"]', 1, 'Reaches its peak in the early 3rd trimester. (Beckmann)'),
    (v_topic_id, '262: The most significant hemodynamic "stress" for a mother with heart disease occurs:', '["In the 1st trimester", "Immediately postpartum (due to autotransfusion)", "During sleep", "At 20 weeks"]', 1, 'Blood from the contracting uterus and fluid shift back into circulation. (Williams)'),
    (v_topic_id, '263: "Eisenmenger Syndrome" is characterized by:', '["Left-to-right shunt", "Right-to-left shunt due to pulmonary HTN", "Valve failure", "Normal heart"]', 1, 'Extremely high mortality in pregnancy. (ACOG)'),
    (v_topic_id, '264: Preferred "antihypertensive" in pregnancy for chronic management?', '["Labetalol, Nifedipine, or Methyldopa", "Lisinopril", "Spironolactone", "Furosemide"]', 0, 'Safe for the fetus. (ACOG)'),
    (v_topic_id, '265: "Methyldopa" (Aldomet) works as a:', '["Beta blocker", "Central alpha-2 agonist", "Calcium channel blocker", "Diuretic"]', 1, 'Long-standing safety profile in pregnancy. (Beckmann)'),
    (v_topic_id, '266: "AFLP" (Acute Fatty Liver) is managed by:', '["Wait and see", "Stabilize mother and IMMEDIATE delivery (regardless of gestational age)", "Antibiotics", "Liver transplant only"]', 1, 'Condition only improves once the baby is out. (ACOG)'),
    (v_topic_id, '267: A woman has "Pre-eclampsia with Severe Features" at 29 weeks. Management?', '["Immediate delivery", "Expectant management in the hospital (to gain time for the fetus) if mother and baby are stable", "Home rest", "Wait until 40 weeks"]', 1, 'Expectant management of severe pre-eclampsia is allowed < 34 weeks in select stable cases. (ACOG)'),
    (v_topic_id, '268: Indications to ABANDON expectant management of severe pre-eclampsia?', '["Uncontrolled HTN", "Non-reassuring fetal status", "Placental abruption", "All of the above"]', 3, 'Delivery is always the cure for pre-eclampsia. (Williams)'),
    (v_topic_id, '269: "Platelet transfusion" in HELLP is usually reserved for counts less than:', '["100,000", "50,000 (or < 20,000 if not in labor)", "150,000", "None"]', 1, 'Depends on whether surgery is planned. (ACOG)'),
    (v_topic_id, '270: "Vaginal delivery" is generally preferred even in "Abruption" if the mother is stable and the fetal tracing is reassuring.', '["True", "False", "Only in twins", "Only if she has GDM"]', 0, 'C-section is not mandatory for abruption unless distress or obstetric reasons exist. (Beckmann)'),
    (v_topic_id, '271: Most common complication of "PPROM"?', '["Abruption", "Preterm Labor", "Chorioamnionitis", "Cord prolapse"]', 1, 'Most women go into labor within a week. (ACOG)'),
    (v_topic_id, '272: "Progesterone" for PTB prevention works by:', '["Stopping contractions", "Maintaining uterine quiescence and cervical integrity", "Increasing baby weight", "None"]', 1, 'Reduces inflammatory mediators. (Williams)'),
    (v_topic_id, '273: "Incompetent Cervix" is now more accurately called:', '["Short cervix", "Cervical Insufficiency", "Weak cervix", "None"]', 1, 'Standard medical term. (ACOG)'),
    (v_topic_id, '274: "McDonald Cerclage" involves:', '["Permanent suture", "A purse-string suture around the cervix", "Surgery on the uterus", "None"]', 1, 'The most common type of cerclage. (Beckmann)'),
    (v_topic_id, '275: "Shirodkar Cerclage" is placed:', '["In the office", "Submucosally (requires dissection)", "On the abdomen", "None"]', 1, 'Less commonly used than McDonald. (Williams)'),
    (v_topic_id, '276: "Transabdominal Cerclage" (TAC) is indicated for:', '["First time short cervix", "Failed vaginal cerclage or extremely short/scarred cervix", "Twins", "Everyone"]', 1, 'Requires C-section for delivery. (ACOG)'),
    (v_topic_id, '277: "Fetal Fibronectin" (fFN) is:', '["A hormone", "A biological \"glue\" found between the chorion and decidua", "A blood test", "A sugar"]', 1, 'Presence after 22 weeks suggests disruption of the interface. (Beckmann)'),
    (v_topic_id, '278: GDM screening: If the 1-hour GCT result is > _____ mg/dL, GDM is often diagnosed without the 3-hour test.', '["140", "180", "200", "150"]', 2, 'Values this high are diagnostic. (ACOG)'),
    (v_topic_id, '279: "Shoulder Dystocia" risk is higher in diabetic patients because of "Asymmetric Macrosomia" (Large trunk vs head).', '["True", "False", "Only in Type 2", "Only in obesity"]', 0, 'Insulin-sensitive tissues (shoulders/liver) grow more than the brain. (Williams)'),
    (v_topic_id, '280: "Oligohydramnios" in a post-term pregnancy is defined as a maximum vertical pocket (MVP) less than:', '["1 cm", "2 cm", "5 cm", "8 cm"]', 1, 'Criterion for delivery in post-term. (ACOG)'),
    (v_topic_id, '281: "NST" is considered "Non-reactive" if:', '["It takes 5 minutes", "There are fewer than 2 accelerations in 40 minutes (after stimulation)", "The baby is sleeping", "There are early decels"]', 1, 'Further testing (BPP) is needed. (Beckmann)'),
    (v_topic_id, '282: "Fetal Lung Maturity" can be induced by giving the mother which of the following before 34 weeks?', '["Betamethasone", "Oxytocin", "Magnesium", "Insulin"]', 0, 'Steroids stimulate type II pneumocyte development. (ACOG)'),
    (v_topic_id, '283: A woman at 39 weeks has "Pre-eclampsia with Severe Features." First-line management?', '["Wait for labor", "Stabilize and INDUCE labor (Vaginal delivery is preferred)", "C-section only", "Bed rest"]', 1, 'Induction is the goal unless there are other C-section indications. (ACOG)'),
    (v_topic_id, '284: Which condition is associated with a "Board-like, tender uterus"?', '["Previa", "Abruption", "Rupture", "Infection"]', 1, 'Classic physical finding. (Williams)'),
    (v_topic_id, '285: "Placenta Previa" bleeding is usually:', '["Painful", "Painless", "Foul smelling", "Black"]', 1, 'Bright red and painless. (Beckmann)'),
    (v_topic_id, '286: "Chorioamnionitis" (Triple I) is usually treated with which antibiotics?', '["Ampicillin and Gentamicin", "Vancomycin", "Ciprofloxacin", "Metronidazole"]', 0, 'Provides broad coverage for vaginal flora. (ACOG)'),
    (v_topic_id, '287: A patient with "Eclampsia" who has a second seizure while on Magnesium should receive:', '["More Magnesium (2g bolus) or Midazolam/Phenytoin", "C-section", "Wait", "None"]', 0, 'Standard protocol for refractory seizures. (ACOG)'),
    (v_topic_id, '288: "Postpartum Hypertension" (> 150/100) should be treated to prevent:', '["Hemorrhage", "Stroke", "Diabetes", "Twins"]', 1, 'Maternal safety is the priority. (ACOG)'),
    (v_topic_id, '289: "Gestational Diabetes" (A2GDM) refers to GDM that:', '["Is diet-controlled", "Requires medication (Insulin or oral agents)", "Is diagnosed before 12 weeks", "Is in twins"]', 1, 'A1GDM is diet-controlled. (ACOG)'),
    (v_topic_id, '290: GDM is associated with increased risk of which "maternal" condition later in life?', '["Breast cancer", "Metabolic syndrome and cardiovascular disease", "Osteoporosis", "Lung disease"]', 1, 'Pregnancy is a "stress test" for future health. (Williams)'),
    (v_topic_id, '291: "RhoGAM" provides passive immunity by:', '["Killing the baby''s blood", "Clearing fetal Rh+ cells from maternal circulation before the mother can mount an immune response", "Destroying antibodies", "None"]', 1, 'Prevents active sensitization. (ACOG)'),
    (v_topic_id, '292: "Anti-D" titer is monitored throughout pregnancy in Rh-negative women.', '["True", "False, only if she is already sensitized", "Only in twins", "Every day"]', 1, 'Once sensitized (positive antibody screen), the titer is monitored. If negative, she gets RhoGAM. (ACOG)'),
    (v_topic_id, '293: "Fetal Anemia" on MCA Doppler is indicated by a velocity > _____ MoM (Multiples of the Median).', '["1.0", "1.5", "2.0", "0.5"]', 1, 'Threshold for performing IUT. (Williams)'),
    (v_topic_id, '294: "Umbilical Cord Prolapse" is a surgical emergency. Risk factors include:', '["Malpresentation (Breech, Transverse)", "Polyhydramnios", "High station with ROM", "All of the above"]', 3, 'Anything that leaves space for the cord to slip past the head. (Beckmann)'),
    (v_topic_id, '295: A patient at 26 weeks has "Short Cervix" (15mm). No prior PTB. Next step?', '["Vaginal Progesterone", "Cerclage", "Bed rest", "C-section"]', 0, 'Current ACOG guideline for asymptomatic short cervix. (ACOG)'),
    (v_topic_id, '296: "Cerclage" is usually contraindicated if there is evidence of:', '["Twins", "Infection (chorioamnionitis) or labor", "Short cervix", "None"]', 1, 'Placing a suture in an infected or active uterus is dangerous. (Williams)'),
    (v_topic_id, '297: A woman with "Chronic HTN" has a fetus at 32 weeks with EFW at the 4th percentile. Diagnosis?', '["Normal", "IUGR (Growth restriction)", "Pre-eclampsia", "GDM"]', 1, 'Growth restriction is a common complication of HTN. (ACOG)'),
    (v_topic_id, '298: "IUGR" increases the risk of which neonatal complication?', '["Hypothermia, Hypoglycemia, and Polycythemia", "Macrosomia", "Hyperglycemia", "None"]', 0, 'Poor placental reserves. (Williams)'),
    (v_topic_id, '299: "Polycythemia" in IUGR is a response to:', '["High sugar", "Chronic fetal hypoxia stimulating erythropoietin", "Infection", "Dehydration"]', 1, 'Baby makes more RBCs to carry limited oxygen. (Beckmann)'),
    (v_topic_id, '300: What is the most common maternal cause of "IUGR"?', '["Obesity", "Hypertension and smoking", "Diabetes", "Exercise"]', 1, 'Conditions that impair placental blood flow. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for High-Risk Pregnancy registered.';
END $$;
COMMIT;
