BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-prenatal-care' LIMIT 1;

    -- CASE 01: First Prenatal Visit
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The First Prenatal Visit', 'A 26-year-old G1P0 woman presents at 8 weeks gestation for her first prenatal visit. LMP was 8 weeks ago. She has no significant medical history.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is gestational age calculated?', '["From the date of conception", "From the first day of the last menstrual period (LMP)", "From the date of implantation", "From the first positive pregnancy test"]', 1, 'Gestational age is counted from the first day of the LMP, even though conception occurs ~2 weeks later.'),
    (v_case_id, 'Which of the following is a routine first trimester screening test?', '["Group B Strep culture", "Glucose tolerance test", "Cell-free fetal DNA (cfDNA) or First-trimester combined screening", "Amniocentesis"]', 2, 'First trimester screening includes nuchal translucency ultrasound + serum PAPP-A and beta-hCG, or cfDNA.'),
    (v_case_id, 'Which supplement is most critical to start BEFORE conception or in the first trimester to prevent neural tube defects?', '["Iron", "Folic Acid (400-800 mcg/day)", "Calcium", "Vitamin B12"]', 1, 'Folic acid reduces the risk of anencephaly and spina bifida when taken periconceptionally.');

    -- CASE 02: Naegele's Rule
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Calculating the Due Date', 'A patient''s LMP was October 10th. She wants to know her estimated due date (EDD).', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Using Naegele''s Rule, what is the EDD?', '["June 17th", "July 17th", "August 10th", "September 10th"]', 1, 'Naegele''s Rule: LMP + 7 days, then subtract 3 months. Oct 10 + 7 = Oct 17, minus 3 months = July 17.'),
    (v_case_id, 'A normal full-term pregnancy lasts how many weeks?', '["36-38 weeks", "37-42 weeks", "40-44 weeks", "38-40 weeks exactly"]', 1, 'Term is defined as 37 0/7 to 41 6/7 weeks. 40 weeks is the average.'),
    (v_case_id, 'Which imaging is the gold standard for confirming gestational age in the first trimester?', '["Abdominal X-ray", "Transvaginal ultrasound (crown-rump length)", "MRI pelvis", "CT abdomen"]', 1, 'Crown-rump length by US is most accurate in the first trimester for dating.');

    -- CASE 03: Normal Physiological Changes in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Normal Changes of Pregnancy', 'A 28-year-old woman at 20 weeks gestation is concerned about dizziness when standing and mild shortness of breath. Exam and vitals are otherwise normal.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cardiovascular change is normal in pregnancy?', '["Increased SVR and decreased CO", "Decreased SVR and increased cardiac output", "Decreased heart rate", "Increased blood pressure"]', 1, 'Pregnancy causes decreased SVR (due to progesterone) and increased CO by up to 50%. BP typically falls in mid-pregnancy.'),
    (v_case_id, 'What causes the physiological shortness of breath in pregnancy?', '["Pulmonary embolism", "Elevation of the diaphragm and increased tidal volume (hyperventilation of pregnancy)", "Pulmonary edema", "Anemia exclusively"]', 1, 'The gravid uterus elevates the diaphragm; progesterone increases respiratory drive, causing a mild compensated respiratory alkalosis.'),
    (v_case_id, 'Supine hypotension syndrome occurs when the gravid uterus compresses which vessel?', '["Aorta", "Inferior vena cava", "Portal vein", "Renal artery"]', 1, 'Compression of the IVC reduces venous return, causing dizziness/syncope when supine. Treatment: left lateral decubitus position.');

    -- CASE 04: Prenatal Labs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Routine Prenatal Bloodwork', 'A 30-year-old woman at 10 weeks is getting her initial prenatal labs. She is Rh-negative.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is NOT part of the standard initial prenatal panel?', '["Blood type and Rh factor", "Rubella immunity", "HIV testing", "HbA1c"]', 3, 'Standard initial labs: CBC, blood type/Rh, antibody screen, rubella, RPR, hepatitis B, HIV, urine culture. HbA1c is not routine unless diabetic.'),
    (v_case_id, 'This Rh-negative patient''s partner is Rh-positive. When should she receive Rho(D) immunoglobulin (RhoGAM)?', '["Only at delivery", "At 28 weeks and within 72 hours of delivery", "At every prenatal visit", "Only if the baby is Rh-positive"]', 1, 'Rho(D) Ig at 28 weeks and postpartum (if baby is Rh+) prevents Rh sensitization and hemolytic disease of the newborn.'),
    (v_case_id, 'Which test screens for Down syndrome and trisomies using maternal blood in the first trimester?', '["AFP (maternal serum)", "Cell-free fetal DNA (NIPT)", "Amniocentesis", "Chorionic villus sampling"]', 1, 'NIPT analyzes fetal DNA fragments in maternal blood and is the most sensitive non-invasive screen for trisomy 21, 18, and 13.');

    -- CASE 05: Morning Sickness and Hyperemesis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nausea and Vomiting in Pregnancy', 'A 22-year-old G1P0 at 9 weeks presents with severe nausea and vomiting. She is unable to keep any food down. She has lost 8 lbs since her last visit. Labs show hypokalemia and ketonuria.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Morning sickness", "Hyperemesis gravidarum", "Peptic ulcer disease", "Appendicitis"]', 1, 'Hyperemesis gravidarum is defined as severe vomiting with > 5% weight loss, dehydration, and electrolyte abnormalities.'),
    (v_case_id, 'Which hormone is most associated with the nausea and vomiting of pregnancy?', '["Progesterone", "Estrogen", "hCG (human chorionic gonadotropin)", "Prolactin"]', 2, 'hCG peaks at 8-10 weeks, which correlates with the peak of nausea/vomiting.'),
    (v_case_id, 'What is the first-line treatment for hyperemesis gravidarum in a patient who cannot tolerate oral medications?', '["Ondansetron only", "IV fluids with thiamine, antiemetics, and electrolyte replacement", "Total parenteral nutrition immediately", "Emergency delivery"]', 1, 'IV hydration, thiamine (to prevent Wernicke''s encephalopathy), and antiemetics are the mainstay of inpatient treatment.');

    -- CASE 06: Prenatal Genetic Screening
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Genetic Counseling in Pregnancy', 'A 38-year-old G1P0 presents for her first prenatal visit at 10 weeks. She is concerned about the risk of chromosomal abnormalities.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most significant risk factor for fetal Down syndrome (Trisomy 21)?', '["Paternal age", "Advanced maternal age (AMA, >= 35)", "Maternal alcohol use", "Twin pregnancy"]', 1, 'Non-disjunction becomes more common with increasing maternal age.'),
    (v_case_id, 'Chorionic Villus Sampling (CVS) is performed at what gestational age, and what is its advantage over amniocentesis?', '["16-20 weeks; no risk", "10-13 weeks; can be performed earlier than amniocentesis", "20-24 weeks; more accurate", "8-10 weeks; no discomfort"]', 1, 'CVS can provide a definitive karyotype in the first trimester, but carries a slightly higher risk of miscarriage (~1%) than amniocentesis.'),
    (v_case_id, 'The maternal serum quad screen (AFP, hCG, estriol, inhibin A) is performed at what gestational age?', '["8-10 weeks", "15-20 weeks", "24-28 weeks", "32-36 weeks"]', 1, 'The quad screen is a second-trimester test. Low AFP + high hCG + low estriol + high inhibin A suggests Down syndrome.');

    -- CASE 07: Fetal Movement and Kick Counts
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Decreased Fetal Movement', 'A 32-year-old G2P1 at 32 weeks gestation calls your office reporting that she has felt less fetal movement than usual over the past day.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What test is the most appropriate first response to assess fetal well-being?', '["Amniocentesis", "Biophysical Profile (BPP) or Non-stress test (NST)", "Immediate C-section", "Doppler of umbilical artery"]', 1, 'A non-stress test (NST) is the first-line test for evaluating fetal well-being in the third trimester.'),
    (v_case_id, 'What is a "reactive" NST?', '["No fetal heart rate accelerations", "At least two fetal heart rate accelerations of >= 15 bpm for >= 15 seconds within 20 minutes", "Decelerations with uterine contractions", "A heart rate < 110 bpm"]', 1, 'A reactive NST is reassuring and indicates adequate fetal oxygenation and neurological function.'),
    (v_case_id, 'The BPP (Biophysical Profile) assesses five components. What are they?', '["Heart rate, BP, movement, tone, amniotic fluid", "NST reactivity, fetal breathing, movement, tone, and amniotic fluid volume", "Placental grade, cervical length, fetal size, heart rate, reflexes", "Doppler flow, NST, fetal position, BP, contractions"]', 1, 'Each BPP component scores 0 or 2; a score of 8-10 is normal, < 6 is concerning.');

    -- CASE 08: Group B Streptococcus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The GBS Swab', 'A 28-year-old G1P0 is at 36 weeks gestation. Her vaginal-rectal swab culture returns positive for Group B Streptococcus (GBS).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary risk of maternal GBS colonization?', '["Preterm labor", "Neonatal sepsis, meningitis, and pneumonia", "Placenta previa", "Maternal stroke"]', 1, 'GBS is a leading cause of early-onset neonatal sepsis and meningitis.'),
    (v_case_id, 'What is the standard intrapartum prophylaxis for a GBS-positive patient?', '["Oral amoxicillin started at 36 weeks", "IV Penicillin G during active labor", "IM Ceftriaxone once at delivery", "No treatment needed if C-section is planned"]', 1, 'IV Penicillin G is given during labor to prevent vertical transmission. Clindamycin or Vancomycin are alternatives if penicillin-allergic.'),
    (v_case_id, 'In which of the following scenarios should GBS prophylaxis be given REGARDLESS of culture result?', '["Elective C-section with intact membranes", "A prior infant with GBS disease", "Gestational age > 39 weeks", "Epidural anesthesia"]', 1, 'Risk factors mandating prophylaxis regardless of culture: prior infant with GBS disease, GBS bacteriuria this pregnancy, or unknown status with delivery < 37 weeks.');

    -- CASE 09: Anatomy Ultrasound
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The 20-Week Anatomy Scan', 'A 25-year-old G1P0 undergoes her routine anatomy ultrasound at 20 weeks. The technician reports the placenta appears to cover the internal cervical os.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the finding called?', '["Placenta accreta", "Placenta previa", "Vasa previa", "Placental abruption"]', 1, 'Placenta previa is when the placenta implants over or near the internal os of the cervix.'),
    (v_case_id, 'What is the classic presentation of placenta previa?', '["Painful vaginal bleeding with a firm uterus", "Painless, bright red vaginal bleeding in the third trimester", "Preterm labor with painful contractions", "Absent fetal heart tones"]', 1, 'Painless bleeding is the hallmark. Digital vaginal exam is CONTRAINDICATED.'),
    (v_case_id, 'Most low-lying placentas found at 20 weeks will do what by term?', '["Remain in place and require C-section", "Resolve or migrate away from the os as the uterus grows", "Cause fetal growth restriction", "Lead to placenta accreta"]', 1, 'Placental \"migration\" (due to uterine growth) resolves most early low-lying placentas. Repeat ultrasound at 32-34 weeks is needed.');

    -- CASE 10: Gestational Diabetes Screening
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Glucose Challenge Test', 'A 32-year-old G2P1 with a BMI of 32 presents at 26 weeks. Her 1-hour 50g glucose challenge test (GCT) result is 158 mg/dL.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next appropriate step?', '["Diagnose gestational diabetes and start insulin", "Perform a 3-hour 100g oral glucose tolerance test (OGTT)", "Repeat the 1-hour GCT in 4 weeks", "No further testing needed"]', 1, 'A 1-hr GCT >= 135-140 mg/dL is abnormal and requires confirmation with a 3-hour OGTT.'),
    (v_case_id, 'The 3-hour OGTT is positive for gestational diabetes if how many values are abnormal?', '["One or more values exceed the threshold", "Two or more values exceed the threshold", "All four values must be elevated", "Only the fasting value matters"]', 1, 'GDM is diagnosed by the Carpenter-Coustan criteria when >= 2 of 4 values are met or exceeded (Fasting >= 95, 1-hr >= 180, 2-hr >= 155, 3-hr >= 140).'),
    (v_case_id, 'What is the most significant neonatal complication of poorly controlled gestational diabetes?', '["Microcephaly", "Macrosomia (large for gestational age) leading to birth trauma", "Turner syndrome", "Preterm respiratory distress"]', 1, 'Fetal hyperglycemia drives fetal hyperinsulinemia and excess growth, particularly of insulin-sensitive tissues (shoulder, abdomen).');

    -- CASE 11: Preterm Labor Definition
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Contractions at 32 Weeks', 'A 24-year-old G2P1 at 32 weeks presents with regular uterine contractions every 5 minutes for 2 hours. Cervical exam shows 2 cm dilation and 80% effacement.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of preterm labor?', '["Contractions before 40 weeks", "Regular contractions with cervical change before 37 0/7 weeks", "Any cervical dilation before term", "Contractions before 34 weeks only"]', 1, 'PTL is defined as regular contractions + cervical dilation/effacement between 20 0/7 and 36 6/7 weeks.'),
    (v_case_id, 'What medication is given to accelerate fetal lung maturity between 24-34 weeks?', '["Magnesium sulfate", "Betamethasone (corticosteroids)", "Indomethacin", "Oxytocin"]', 1, 'Antenatal corticosteroids (betamethasone or dexamethasone) reduce RDS, IVH, and neonatal mortality in preterm births.'),
    (v_case_id, 'At 32 weeks, which medication is given for fetal neuroprotection?', '["Antibiotics", "Magnesium sulfate", "Terbutaline", "Progesterone"]', 1, 'Magnesium sulfate given to the mother before 32-week delivery provides neuroprotection and reduces the risk of cerebral palsy.');

    -- CASE 12: PROM vs PPROM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Gush of Fluid', 'A 29-year-old G1P0 at 34 weeks reports a sudden gush of clear fluid from her vagina. She is not having contractions.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What term describes this clinical situation?', '["PROM (Premature Rupture of Membranes - at term)", "PPROM (Preterm Premature Rupture of Membranes)", "Bloody show", "Urinary incontinence"]', 1, 'PPROM is rupture of membranes before 37 weeks WITHOUT labor. It is a major cause of preterm birth.'),
    (v_case_id, 'Which test can confirm rupture of membranes by detecting amniotic fluid in the vaginal vault?', '["Urinalysis", "Ferning pattern on microscopy, pooling of fluid, and positive AmniSure/AmnioQuick (IGFBP-1 test)", "Cervical swab culture", "Doppler ultrasound"]', 1, 'The classic triad is: pooling, ferning, and nitrazine test (turns blue in alkaline amniotic fluid). Newer immunoassay tests are more accurate.'),
    (v_case_id, 'What is the primary risk of PPROM?', '["Pre-eclampsia", "Chorioamnionitis (infection of membranes) and cord prolapse", "Gestational diabetes", "Polyhydramnios"]', 1, 'Loss of the protective amniotic membranes exposes the fetus and mother to ascending infection and umbilical cord prolapse.');

    -- CASE 13: Rh Isoimmunization
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sensitized Rh-Negative Mother', 'A 35-year-old G3P2 who is Rh-negative presents. She never received RhoGAM with her prior pregnancies. Her antibody screen is positive for anti-D antibodies. The current fetus is Rh-positive.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk to this fetus?', '["Preterm birth", "Hemolytic disease of the fetus and newborn (HDFN) causing fetal anemia and hydrops", "Gestational diabetes", "Neural tube defect"]', 1, 'Maternal anti-D IgG antibodies cross the placenta, attack fetal RBCs, cause hemolysis, fetal anemia, heart failure (hydrops fetalis).'),
    (v_case_id, 'How is fetal anemia monitored non-invasively in a sensitized pregnancy?', '["Weekly amniocentesis", "Doppler measurement of peak systolic velocity in the Middle Cerebral Artery (MCA-PSV)", "Weekly biophysical profiles", "Serial maternal hemoglobin levels"]', 1, 'An elevated MCA-PSV indicates fetal anemia because anemic blood flows faster. This is now the standard for non-invasive fetal anemia assessment.'),
    (v_case_id, 'RhoGAM (Rho(D) immunoglobulin) works by:', '["Stimulating the mother to produce anti-D antibodies", "Clearing fetal Rh-positive cells from maternal circulation before sensitization occurs", "Directly treating fetal anemia", "Preventing placental transfer of antibodies"]', 1, 'RhoGAM is passive immunization — it clears fetal RBCs from maternal blood before the immune system can form its own antibodies.');

    -- CASE 14: Iron Deficiency Anemia in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pale, Tired Pregnant Patient', 'A 23-year-old G2P1 at 28 weeks presents with fatigue. CBC: Hgb 9.5 g/dL, MCV 72 fL. Serum ferritin is low. The patient has been eating poorly.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Folate deficiency anemia (macrocytic)", "Iron deficiency anemia (microcytic, hypochromic)", "Anemia of chronic disease", "Sickle cell anemia"]', 1, 'Low MCV + low ferritin in a pregnant woman with poor diet = iron deficiency anemia, the most common anemia in pregnancy.'),
    (v_case_id, 'What is the normal physiological fall in hemoglobin during pregnancy?', '["No fall is normal", "A fall due to plasma expansion exceeding red cell mass increase (physiological anemia of pregnancy)", "Hgb drops due to increased destruction", "Hgb drops due to fetal use of iron only"]', 1, 'Plasma volume increases ~50%; RBC mass increases ~25%; net result is a dilutional drop in Hgb — the physiological anemia of pregnancy.'),
    (v_case_id, 'What is the treatment?', '["Blood transfusion immediately", "Oral elemental iron supplementation (150-200 mg/day)", "Folate supplementation only", "Dietary advice and recheck in 4 weeks"]', 1, 'Oral iron is first line. IV iron is used if oral is not tolerated or response is insufficient.');

    -- CASE 15: Postterm Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Going Past the Due Date', 'A 30-year-old G1P0 is now at 41 weeks and 2 days gestation. The fetal NST is reactive. AFI (amniotic fluid index) is 6 cm (low normal). Cervix is 1 cm dilated, 50% effaced.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A pregnancy beyond how many weeks is defined as "post-term"?', '["40 weeks", "41 weeks", "42 weeks (>= 42 0/7 weeks)", "43 weeks"]', 2, 'Post-term is defined as >= 42 0/7 weeks gestation. Current guidelines recommend delivery no later than 41 0/7 weeks.'),
    (v_case_id, 'What is the primary risk of post-term pregnancy for the fetus?', '["Macrosomia leading to C-section", "Uteroplacental insufficiency, oligohydramnios, and meconium aspiration", "Down syndrome", "Rh sensitization"]', 1, 'Aging placenta leads to decreased perfusion, fetal distress, passage of meconium, and stillbirth risk — all increase after 41-42 weeks.'),
    (v_case_id, 'What is the standard management at 41 0/7 weeks?', '["Expectant management until 43 weeks", "Induction of labor at 41 0/7 weeks (ARRIVE trial evidence)", "Immediate C-section", "Amniocentesis to confirm lung maturity"]', 1, 'ACOG recommends offering induction at 41 0/7 weeks; many experts recommend at 39-40 weeks for low-risk patients with favorable cervix.');

    RAISE NOTICE 'SUCCESS: OB/GYN Prenatal Care Case Blocks Part 1 (1-15) registered.';
END $$;

COMMIT;
