BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-normal-labor' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-normal-labor not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review, Puerperium, and Ethics)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A 25-year-old G1P1 delivered a 3500g baby via C-section 3 days ago. She has a fever of 101.5F, midline uterine tenderness, and foul-smelling lochia. Lungs are clear, no calf tenderness. Diagnosis?', '["Atelectasis", "Postpartum Endometritis", "Mastitis", "UTI"]', 1, 'Classic presentation of endometritis after C-section. (Williams)'),
    (v_topic_id, '302: Which of the following is the most effective way to prevent Postpartum Endometritis during a C-section?', '["Vaginal prep with povidone-iodine and pre-operative IV antibiotics", "Douching", "Speed of the procedure", "No prophylaxis needed"]', 0, 'Standard evidence-based prevention. (ACOG)'),
    (v_topic_id, '303: A breastfeeding mother has a painful lump in her breast. She is afebrile and the lump is not red. Management?', '["Antibiotics", "Warm compresses and frequent nursing (Plugged duct)", "Fine needle aspiration", "Incision and drainage"]', 1, 'Likely a plugged milk duct; nursing helps clear it. (Beckmann)'),
    (v_topic_id, '304: If the same mother develops a "Fluctuant" (liquid-filled) mass that is red and very painful, and she has a high fever. Diagnosis?', '["Simple mastitis", "Breast Abscess", "Galactocele", "Fibroadenoma"]', 1, 'Abscess requires drainage and antibiotics. (Williams)'),
    (v_topic_id, '305: "Galactocele" is:', '["An infection", "A milk-retention cyst (non-infected)", "A tumor", "A blood clot"]', 1, 'Usually painless; may require aspiration if large. (Beckmann)'),
    (v_topic_id, '306: A woman at 1 week postpartum is "weepy," has difficulty sleeping, and feels overwhelmed, but is still caring for the baby well. Diagnosis?', '["Postpartum Psychosis", "Postpartum Blues", "Postpartum Depression", "Normal"]', 1, 'Symptoms resolve within 2 weeks. (ACOG)'),
    (v_topic_id, '307: Which medication is often first-line for moderate to severe "Postpartum Depression"?', '["Sertraline (SSRI)", "Diazepam", "Lithium", "St. John''s Wort"]', 0, 'Sertraline is generally considered safe for breastfeeding. (Beckmann)'),
    (v_topic_id, '308: A woman who believes her baby is "evil" or has "special powers" and is hearing voices is most likely experiencing:', '["Severe Blues", "Depression", "Postpartum Psychosis", "Sleep deprivation"]', 2, 'Psychosis is a true emergency. (Williams)'),
    (v_topic_id, '309: What is the recurrence risk of Postpartum Psychosis in a subsequent pregnancy?', '["0%", "5%", "Up to 50%", "100%"]', 2, 'High risk of recurrence; requires close monitoring. (Beckmann)'),
    (v_topic_id, '310: A "Bishop Score" of 0-4 indicates the cervix is:', '["Ripe", "Unripe (unfavorable for induction)", "Partially dilated", "Soft"]', 1, 'Induction with oxytocin alone is likely to fail. (ACOG)'),
    (v_topic_id, '311: "Active Management of Labor" (O''Driscoll) focuses on early diagnosis of slow labor and use of high-dose:', '["Magnesium", "Oxytocin", "Antibiotics", "Fluids"]', 1, 'Aim is to prevent prolonged labor. (Williams)'),
    (v_topic_id, '312: What is the term for when the fetal head is "fixed" in the pelvis but is NOT yet engaged?', '["Floating", "Dipping", "Crowing", "Molding"]', 1, 'Intermediate stage before engagement. (Beckmann)'),
    (v_topic_id, '313: "Laboring Down" is another name for:', '["Induction", "Delayed pushing in the second stage", "Forceps", "Quick labor"]', 1, 'Allows the head to descend further without maternal effort. (Williams)'),
    (v_topic_id, '314: "Physiological" neonatal jaundice usually starts after:', '["Birth (within 24 hours)", "24 hours", "1 week", "1 month"]', 1, 'Jaundice in the first 24 hours is always pathologic. (Beckmann)'),
    (v_topic_id, '315: "Breast Milk Jaundice" typically occurs when?', '["Day 1", "Day 3-5", "Week 2-3", "Day 100"]', 2, 'Due to factors in the milk that interfere with bilirubin conjugation. (Williams)'),
    (v_topic_id, '316: A woman with "Chorioamnionitis" is undergoing labor. What is the preferred "Mode of Delivery"?', '["Immediate C-section", "Vaginal delivery (continue induction/augmentation)", "Forceps", "Vacuum"]', 1, 'Vaginal delivery is preferred unless there is another obstetric indication for C-section. (ACOG)'),
    (v_topic_id, '317: "Subinvolution" of the placental site is a cause of:', '["Early PPH", "Delayed PPH (weeks later)", "Infertility", "Pain"]', 1, 'Failure of the uterine spiral arteries to constrict. (Williams)'),
    (v_topic_id, '318: "Lichen Sclerosus" of the vulva (thin, white skin) should be treated with:', '["Antifungals", "High-potency topical steroids (e.g., Clobetasol)", "Surgery", "Estrogen"]', 1, 'Prevents scarring and reduces SCC risk. (Beckmann)'),
    (v_topic_id, '319: Maternal "Mortality" in the US is highest among which racial/ethnic group?', '["Caucasian", "Black/African American", "Asian", "Hispanic"]', 1, 'Significant health disparity; Black women are 3-4x more likely to die. (CDC)'),
    (v_topic_id, '320: Which "Pelvic Diameter" is the shortest and most likely to cause cephalopelvic disproportion (CPD)?', '["Obstetric Conjugate", "Transverse diameter", "Interspinous diameter", "Diagonal conjugate"]', 0, 'Measured from the sacral promontory to the posterior symphysis. (Williams)'),
    (v_topic_id, '321: "Interspinous Diameter" of less than _____ cm suggests a narrow midpelvis.', '["5", "8", "10", "15"]', 2, 'Distance between the ischial spines. (Beckmann)'),
    (v_topic_id, '322: "Inlet Contraction" is suspected when the "Diagonal Conjugate" is less than:', '["8 cm", "11.5 cm", "13 cm", "15 cm"]', 1, 'The only inlet diameter that can be measured clinically. (Williams)'),
    (v_topic_id, '323: "Pelvimetry" via X-ray is:', '["Highly accurate for predicting delivery success", "Rarely used now as clinical trial of labor is more predictive", "Standard for everyone", "Dangerous"]', 1, 'The "Trial of Labor" is the gold standard for testing CPD. (Beckmann)'),
    (v_topic_id, '324: "Vaginal Birth After Cesarean" (VBAC) success rate for a woman with a prior low transverse incision is approximately:', '["10-20%", "60-80%", "95%", "100%"]', 1, 'High success rate for most appropriate candidates. (ACOG)'),
    (v_topic_id, '325: The most significant risk of VBAC is:', '["Hemorrhage", "Uterine Rupture (risk ~0.5-0.9%)", "Infection", "Pain"]', 1, 'Must be performed in a facility capable of "emergency" C-section. (ACOG)'),
    (v_topic_id, '326: Which medication should be AVOIDED for induction/augmentation in a woman attempting VBAC?', '["Oxytocin", "Misoprostol (Prostaglandins)", "Epidural", "Antibiotics"]', 1, 'Prostaglandins significantly increase the risk of uterine rupture in a scarred uterus. (ACOG)'),
    (v_topic_id, '327: "Shoulder Dystocia" recurrence risk is approximately:', '["1%", "10-15%", "50%", "90%"]', 1, 'Mothers should be counseled on the option of C-section for subsequent babies. (Williams)'),
    (v_topic_id, '328: A "Molar Pregnancy" (Hydatidiform mole) is NOT a "Normal Labor" topic, but "Theca Lutein Cysts" found in mole may cause:', '["Ovarian Torsion", "Hyperemesis and high hCG", "Infection", "Nothing"]', 1, 'Due to extreme hCG stimulation. (Beckmann)'),
    (v_topic_id, '329: "Choriocarcinoma" is a malignant tumor that can follow:', '["Normal pregnancy", "Molar pregnancy", "Miscarriage", "All of the above"]', 3, 'Always check hCG if a woman has persistent postpartum bleeding and negative US for tissue. (Williams)'),
    (v_topic_id, '330: "Fertilization" typically occurs in which part of the fallopian tube?', '["Fimbria", "Ampulla", "Isthmus", "Uterus"]', 1, 'The widest part of the tube. (Beckmann)'),
    (v_topic_id, '331: "Implantation" occurs how many days after fertilization?', '["1-2", "6-7", "14", "20"]', 1, 'The blastocyst burrows into the decidua. (Williams)'),
    (v_topic_id, '332: "hCG" (Human Chorionic Gonadotropin) is produced by:', '["The fetus", "Syncytiotrophoblast of the placenta", "The ovary", "The mother''s brain"]', 1, 'Maintains the corpus luteum in early pregnancy. (Beckmann)'),
    (v_topic_id, '333: Maternal "Physiological Anemia" is caused by:', '["Blood loss", "Plasma volume increasing more than RBC mass (dilutional)", "Iron deficiency", "B12 deficiency"]', 1, 'Plasma volume increases by ~50%, RBCs by ~20-30%. (Williams)'),
    (v_topic_id, '334: Maternal "Alkalosis" in pregnancy is caused by:', '["Vomiting", "Progesterone-induced hyperventilation (chronic respiratory alkalosis)", "Eating", "Kidney failure"]', 1, 'Helps the fetus clear CO2 more easily. (Beckmann)'),
    (v_topic_id, '335: "Urinary Frequency" in the 1st trimester is due to:', '["Infection", "Hormonal changes and the enlarging uterus pressing on the bladder", "Drinking more water", "None"]', 1, 'Recurs in the 3rd trimester as the head engages. (Williams)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Normal Labor registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
