BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-normal-labor' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-normal-labor not found.';
    END IF;

    -- Batch 3: 121-180 (Puerperium and Physiological Changes)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: The "Puerperium" starts immediately after delivery and typically lasts for:', '["1 week", "2 weeks", "6 weeks", "6 months"]', 2, 'The 6-week period allows most systems to return to pre-pregnancy states. (Beckmann)'),
    (v_topic_id, '122: "Involution" of the uterus refers to:', '["The uterus growing larger", "The uterus returning to its non-pregnant size", "Infection", "Prolapse"]', 1, 'Immediately after birth, it is at the umbilicus. (Williams)'),
    (v_topic_id, '123: At 2 weeks postpartum, where should the uterus be located?', '["At the umbilicus", "Midway between the umbilicus and symphysis", "No longer palpable abdominally", "At the xiphoid"]', 2, 'It should have descended into the true pelvis by 2 weeks. (Beckmann)'),
    (v_topic_id, '124: "Lochia Rubra" consists primarily of:', '["Old blood and serous fluid", "Fresh blood and decidua", "WBCs and mucus", "Pus"]', 1, 'Lasts for the first 3-4 days. (Williams)'),
    (v_topic_id, '125: "Lochia Serosa" is the pinkish-brown discharge that typically lasts until day:', '["3", "10", "24", "42"]', 1, 'Follows rubra and precedes alba. (Beckmann)'),
    (v_topic_id, '126: "Lochia Alba" is a yellowish-white discharge that can last up to _____ weeks postpartum.', '["1", "2", "6-8", "52"]', 2, 'Composed of leukocytes, epithelial cells, and mucus. (Williams)'),
    (v_topic_id, '127: Postpartum "Afterpains" are caused by uterine contractions and are more severe in:', '["Primiparas", "Multiparas and breastfeeding women", "C-section patients", "Teenagers"]', 1, 'Breastfeeding triggers oxytocin release, which causes contractions. (Beckmann)'),
    (v_topic_id, '128: The "Cervix" regains its tone and the external os closes to a "slit" shape by when?', '["Day 1", "End of 1 week", "End of 6 weeks", "1 year"]', 1, 'It will never return to the circular "nulliparous" shape. (Williams)'),
    (v_topic_id, '129: "Postpartum Diuresis" (excessive urination) in the first week is caused by:', '["Diabetes", "Excretion of excess extracellular fluid accumulated during pregnancy", "UTI", "Kidney failure"]', 1, 'Results in significant weight loss (up to 2-3 kg). (Beckmann)'),
    (v_topic_id, '130: Cardiac output remains elevated for _____ after delivery before gradually decreasing.', '["1 hour", "24-48 hours", "1 week", "1 month"]', 1, 'Due to autotransfusion from the contracting uterus and relief of IVC compression. (Williams)'),
    (v_topic_id, '131: How long does it take for the "Hypercoagulable" state of pregnancy to return to normal?', '["3 days", "2 weeks", "6-12 weeks", "Immediately"]', 2, 'Increased risk of VTE persists for at least 6 weeks. (ACOG)'),
    (v_topic_id, '132: In a NON-lactating woman, "Ovulation" can occur as early as _____ weeks postpartum.', '["2", "5", "10", "20"]', 1, 'Contraception should be discussed before discharge. (Beckmann)'),
    (v_topic_id, '133: In a breastfeeding woman, ovulation is suppressed by which hormone?', '["Oxytocin", "Prolactin", "Estrogen", "Progesterone"]', 1, 'High prolactin inhibits GnRH pulsatility. (Williams)'),
    (v_topic_id, '134: "Colostrum" is the first milk. Compared to mature milk, it is higher in:', '["Fat", "Sugar", "Protein and IgA", "Water"]', 2, 'Provides "liquid gold" immunity for the baby. (Beckmann)'),
    (v_topic_id, '135: The "Let-down reflex" (Milk ejection) is mediated by:', '["Prolactin", "Oxytocin", "Cortisol", "Thyroxine"]', 1, 'Stimulated by suckling or even the baby''s cry. (Williams)'),
    (v_topic_id, '136: "Mastitis" is most common in the first _____ weeks of breastfeeding.', '["2-4", "10-12", "20", "52"]', 0, 'Usually unilateral and associated with fever. (Beckmann)'),
    (v_topic_id, '137: The most common causative organism in Mastitis is:', '["E. coli", "Staphylococcus aureus", "Group B Strep", "Candida"]', 1, 'Often enters through cracked nipples. (Williams)'),
    (v_topic_id, '138: Management of Mastitis includes Dicloxacillin and:', '["Stopping breastfeeding on the affected side", "CONTINUED breastfeeding or pumping", "Manual expression only", "Bed rest"]', 1, 'Emptying the breast is essential to prevent abscess. (ACOG)'),
    (v_topic_id, '139: "Breast Engorgement" occurs day 3-5 and is best managed by:', '["Antibiotics", "Frequent nursing and cool compresses", "Binder", "Stopping milk"]', 1, 'Due to vascular congestion and milk accumulation. (Beckmann)'),
    (v_topic_id, '140: If a mother chooses NOT to breastfeed, the best way to suppress lactation is:', '["Bromocriptine", "Ice packs, tight bra, and avoiding nipple stimulation", "Manual pumping", "Estrogen"]', 1, 'Pharmacological suppression is no longer recommended due to side effects. (Williams)'),
    (v_topic_id, '141: "Postpartum Blues" affects what percentage of women?', '["10-20%", "40-80%", "5%", "100%"]', 1, 'Very common; self-limiting within 2 weeks. (ACOG)'),
    (v_topic_id, '142: "Postpartum Depression" is distinguished from "Blues" by:', '["Duration (> 2 weeks) and severity", "Presence of fever", "Occurs only after 6 months", "It is normal"]', 0, 'Requires screening (EPDS) and treatment. (Beckmann)'),
    (v_topic_id, '143: "Postpartum Psychosis" is a medical emergency because of high risk for:', '["Infection", "Infanticide and Suicide", "Seizures", "Hemorrhage"]', 1, 'Requires immediate psychiatric hospitalization. (Williams)'),
    (v_topic_id, '144: "Endometritis" is the most common cause of postpartum fever. It is most strongly associated with:', '["Vaginal delivery", "Cesarean section (especially after prolonged ROM)", "Twins", "Post-term"]', 1, 'Standard treatment is Clindamycin + Gentamicin. (ACOG)'),
    (v_topic_id, '145: A patient with postpartum fever that persists despite broad-spectrum antibiotics for 48-72 hours should be evaluated for:', '["Breast abscess", "Septic Pelvic Thrombophlebitis", "Wound infection", "Pneumonia"]', 1, 'Diagnosis of exclusion; treated with Heparin. (Williams)'),
    (v_topic_id, '146: "Sheehan Syndrome" is:', '["Postpartum psychosis", "Anterior pituitary necrosis after severe PPH/shock", "Uterine inversion", "A type of tear"]', 1, 'Leads to failure to lactate and amenorrhea. (Beckmann)'),
    (v_topic_id, '147: Which "Rh-negative" mothers should receive RhoGAM postpartum?', '["All Rh-negative mothers", "Rh-negative mothers with an Rh-positive baby", "Rh-negative mothers with an Rh-negative baby", "Only if there was bleeding"]', 1, 'Given within 72 hours of delivery. (ACOG)'),
    (v_topic_id, '148: Standard "Postpartum Check-up" for an uncomplicated patient is at:', '["1 week", "2 weeks", "6 weeks (ACOG now recommends a comprehensive visit within 12 weeks)", "1 year"]', 2, 'The 6-week visit is the traditional standard. (ACOG)'),
    (v_topic_id, '149: Sexual intercourse is generally discouraged until:', '["Lochia stops and perineum is healed (usually 4-6 weeks)", "1 week", "3 months", "Never"]', 0, 'To reduce risk of infection and pain. (Beckmann)'),
    (v_topic_id, '150: Which contraceptive method is generally avoided in the first 3 weeks postpartum due to VTE risk?', '["Progestin-only pill", "IUD", "Combined hormonal contraceptives (Pill/Patch/Ring)", "Condoms"]', 2, 'Estrogen increases clotting risk. (CDC MEC)'),
    (v_topic_id, '151: "Progestin-only" methods (Mini-pill, Nexplanon, Depo) are preferred for breastfeeding mothers because they:', '["Stop periods", "Do not affect milk production", "Are more effective", "Prevent STIs"]', 1, 'Estrogen can potentially decrease milk supply. (ACOG)'),
    (v_topic_id, '152: "IUD Insertion" postpartum can be done:', '["Immediately after delivery of placenta", "Only after 6 weeks", "During the period", "Both A and B"]', 3, 'Immediate insertion has a higher expulsion rate but increases uptake. (ACOG)'),
    (v_topic_id, '153: A woman at 3 weeks postpartum has sudden heavy bleeding and "boggy" uterus. Management?', '["Wait and see", "Check for retained products (US) and give uterotonics", "Immediate hysterectomy", "Antibiotics"]', 1, 'Typical presentation of secondary PPH. (Williams)'),
    (v_topic_id, '154: Maternal "Thyroiditis" postpartum often presents initially as:', '["Hypothyroidism", "Hyperthyroidism", "A large goiter", "It never occurs"]', 1, 'Followed by a hypothyroid phase; often resolves. (Beckmann)'),
    (v_topic_id, '155: A "Dural Puncture Headache" (Spinal headache) is classic for being:', '["Better when standing", "Better when lying flat and worse when upright", "Unilateral", "Constant"]', 1, 'Due to CSF leak; treated with caffeine or blood patch. (Williams)'),
    (v_topic_id, '156: "Epidural Blood Patch" involves:', '["Giving a transfusion", "Injecting maternal blood into the epidural space to seal the CSF leak", "Blood in the urine", "C-section"]', 1, 'Highly effective for spinal headaches. (Beckmann)'),
    (v_topic_id, '157: "Pelvic Organ Prolapse" (POP) risk is highest in women with:', '["Multiple vaginal deliveries", "Multiple C-sections", "No children", "Twins only"]', 0, 'Mechanical stress on pelvic fascia and muscles. (Williams)'),
    (v_topic_id, '158: "Kegel Exercises" strengthen which muscles?', '["Abdominals", "Gluteus", "Levator Ani (Pelvic floor)", "Quads"]', 2, 'First-line for stress incontinence. (ACOG)'),
    (v_topic_id, '159: "Episiotomy" breakdown (dehiscence) is most commonly caused by:', '["Exercise", "Infection", "Poor suturing", "Eating"]', 1, 'Requires cleaning and sometimes secondary closure. (Williams)'),
    (v_topic_id, '160: Postpartum "Hair loss" (Telogen Effluvium) occurs at 1-5 months and is:', '["Permanent", "A normal physiological response to falling estrogen", "A sign of iron deficiency", "Sign of syphilis"]', 1, 'Benign and resolves without treatment. (Beckmann)'),
    (v_topic_id, '161: "Stretch marks" (Striae gravidarum) typically:', '["Disappear completely", "Fade to silvery-white (striae albicans) but remain", "Turn black", "Are painful"]', 1, 'A permanent change in connective tissue. (Williams)'),
    (v_topic_id, '162: Maternal "Bonding" is enhanced by:', '["Skin-to-skin contact (Kangaroo care)", "Feeding within the first hour", "Rooming-in", "All of the above"]', 3, 'Standard hospital practices to support attachment. (AAP)'),
    (v_topic_id, '163: "Lactational Amenorrhea Method" (LAM) is >98% effective ONLY if:', '["Mother is exclusively breastfeeding", "Infant is < 6 months", "Mother is amenorrheic", "All of the above"]', 3, 'The "Rule of Three" for LAM. (ACOG)'),
    (v_topic_id, '164: Breastfeeding reduces the mother''s long-term risk of:', '["Breast and Ovarian Cancer", "Lung cancer", "Colon cancer", "Brain tumors"]', 0, 'Significant protective effect. (ACOG)'),
    (v_topic_id, '165: Contraindication to breastfeeding?', '["Maternal Hepatitis B", "Maternal HIV (in developed countries)", "Common cold", "Mastitis"]', 1, 'In countries with safe formula, HIV+ mothers should not breastfeed. (AAP)'),
    (v_topic_id, '166: A breastfeeding mother should avoid which type of medication?', '["Acetaminophen", "Certain drugs like Lithium or Radioactive isotopes", "Prenatal vitamins", "Ibuprofen"]', 1, 'Check LactMed for safety. (AAP)'),
    (v_topic_id, '167: Postpartum "Symphysis Pubis Diastasis" presents with:', '["Back pain", "Extreme difficulty walking and pain over the pubic bone", "Headache", "Fever"]', 1, 'Usually treated conservatively with a pelvic binder and PT. (Williams)'),
    (v_topic_id, '168: "Gestational Diabetes" (GDM) patients should be screened postpartum with a:', '["Random glucose", "75g 2-hour OGTT at 6-12 weeks", "HbA1c only", "No screening"]', 1, 'To detect development of Type 2 Diabetes. (ACOG)'),
    (v_topic_id, '169: "Pre-eclampsia" can develop for the first time in the postpartum period.', '["True, up to 6 weeks postpartum", "False, only during pregnancy", "Only during labor", "Only if she has a C-section"]', 0, 'Patients must be educated on "warning signs" like headache/vision changes. (ACOG)'),
    (v_topic_id, '170: First-line antihypertensive for postpartum HTN (>150/100)?', '["Lisinopril", "Nifedipine or Labetalol", "Aspirin", "Furosemide"]', 1, 'Magnesium may also be needed if signs of pre-eclampsia exist. (ACOG)'),
    (v_topic_id, '171: "Endometritis" after vaginal birth is often:', '["Polymicrobial (anaerobes and aerobes)", "Only Staph", "Only Strep", "Viral"]', 0, 'Ascending infection from the lower tract. (Williams)'),
    (v_topic_id, '172: Most significant risk factor for "Postpartum Depression"?', '["Twins", "History of depression (pre-pregnancy or during)", "C-section", "Advanced age"]', 1, 'The strongest predictor. (ACOG)'),
    (v_topic_id, '173: "Edinburgh Postnatal Depression Scale" (EPDS) score of _____ warrants evaluation.', '["2", "5", ">= 10-12", "1"]', 2, 'Universal screening is recommended. (ACOG)'),
    (v_topic_id, '174: "Perineal care" after delivery includes:', '["Frequent soap and water", "Sitz baths and peri-bottle rinsing", "Alcohol wipes", "Antibiotic ointment"]', 1, 'To keep the area clean and soothe the tissue. (Beckmann)'),
    (v_topic_id, '175: "Hemorrhoids" are common postpartum and are treated with:', '["Surgery", "High fiber, fluids, and topical stool softeners/witch hazel", "Antibiotics", "Wait"]', 1, 'Usually improve within a few weeks. (Williams)'),
    (v_topic_id, '176: A postpartum patient has a red, warm, tender calf. Next step?', '["Massage it", "Duplex Ultrasound to rule out DVT", "Antibiotics", "Wait 2 days"]', 1, 'High index of suspicion for VTE. (ACOG)'),
    (v_topic_id, '177: Which vaccine is routinely given postpartum if the mother is non-immune?', '["MMR (Measles, Mumps, Rubella)", "Flu", "Hep B", "Gardasil"]', 0, 'MMR is live and cannot be given during pregnancy. (ACOG)'),
    (v_topic_id, '178: "Tdap" should be given:', '["After delivery", "During every pregnancy (27-36 weeks) to provide passive immunity to the baby", "Every 10 years only", "Never"]', 1, 'Provides pertussis antibodies to the neonate. (ACOG)'),
    (v_topic_id, '179: "Postpartum Anemia" is defined as Hemoglobin less than:', '["8", "10", "12", "14"]', 1, 'Common after PPH; treat with iron. (WHO)'),
    (v_topic_id, '180: "Post-term" infants (>42 weeks) are at risk for:', '["Macrosomia", "Oligohydramnios", "Meconium aspiration", "All of the above"]', 3, 'Placental function declines after 42 weeks. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Normal Labor registered.';
END $$;
COMMIT;
