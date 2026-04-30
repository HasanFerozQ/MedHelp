BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-pregnancy-complications' LIMIT 1;

    -- CASE 01: Spontaneous Abortion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'First Trimester Bleeding and Cramping', 'A 26-year-old G2P1 at 9 weeks presents with vaginal bleeding and cramping. Pelvic exam shows a closed cervical os. Ultrasound shows no fetal cardiac activity. Beta-hCG is 45,000 mIU/mL.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of abortion is this?', '["Threatened abortion", "Inevitable abortion", "Missed abortion", "Incomplete abortion"]', 2, 'Missed abortion: fetal demise without expulsion. The cervical os is CLOSED, there is no cardiac activity, and products of conception are retained.'),
    (v_case_id, 'The most common cause of first-trimester spontaneous abortion is:', '["Uterine anomaly", "Chromosomal abnormality of the embryo", "Maternal infection", "Cervical incompetence"]', 1, 'Chromosomal abnormalities (most commonly trisomies) account for ~50-60% of first-trimester losses.'),
    (v_case_id, 'Management options for a missed abortion include:', '["Expectant management, medical management (misoprostol), or surgical (D&C)", "Immediate hysterectomy", "IV antibiotics only", "Cerclage placement"]', 0, 'All three options are acceptable. Patient preference, gestational age, and hemodynamic stability guide the choice.');

    -- CASE 02: Ectopic Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pelvic Pain and a Positive Pregnancy Test', 'A 28-year-old G1P0 with a history of PID presents with 6 weeks of amenorrhea, vaginal spotting, and sudden severe right lower quadrant pain. BP is 90/60, HR 118. Urine hCG is positive. Transvaginal ultrasound shows no intrauterine pregnancy and free fluid in the pelvis.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Appendicitis", "Ruptured ectopic pregnancy", "Ovarian torsion", "Pelvic inflammatory disease"]', 1, 'Ruptured ectopic = positive hCG + no IUP on US + hemodynamic instability + free fluid (hemoperitoneum). This is a surgical emergency.'),
    (v_case_id, 'What is the strongest risk factor for ectopic pregnancy?', '["Oral contraceptive use", "Prior pelvic inflammatory disease / tubal damage", "Advanced maternal age", "Nulliparity"]', 1, 'PID causes tubal scarring and adhesions, impairing ovum transport. Other risks: prior ectopic, tubal surgery, IUD use.'),
    (v_case_id, 'A hemodynamically STABLE patient with an unruptured ectopic pregnancy (beta-hCG 1,800) may be treated with:', '["Emergency laparotomy", "Methotrexate (MTX) IM injection", "Expectant management only", "Oral misoprostol"]', 1, 'MTX inhibits folic acid metabolism and trophoblastic proliferation. Criteria: hemodynamically stable, no rupture, hCG < 5,000, no fetal cardiac activity, tubal size < 3.5 cm.');

    -- CASE 03: Gestational Diabetes Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shoulder Dystocia at Delivery', 'A 34-year-old G2P1 with gestational diabetes delivers the fetal head, but the shoulders cannot be delivered with gentle downward traction. The baby''s face is pressed against the perineum ("turtle sign").', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What obstetric emergency is this?', '["Compound presentation", "Shoulder dystocia", "Face presentation", "Cord prolapse"]', 1, 'Shoulder dystocia occurs when the anterior fetal shoulder impacts behind the maternal pubic symphysis after delivery of the head.'),
    (v_case_id, 'What is the FIRST maneuver to perform in shoulder dystocia?', '["Woods screw maneuver", "McRoberts maneuver (hyperflexion of maternal thighs) + suprapubic pressure", "Zavanelli maneuver", "Fundal pressure"]', 1, 'McRoberts + suprapubic pressure resolves ~50% of cases. Never apply fundal pressure — it worsens impaction.'),
    (v_case_id, 'Which fetal complication is most commonly associated with shoulder dystocia?', '["Hip dysplasia", "Erb palsy (brachial plexus injury, C5-C6)", "Clavicle fracture of the posterior shoulder", "Fetal cardiac arrhythmia"]', 1, 'Stretching of the brachial plexus during delivery causes Erb palsy — weakness of shoulder abduction and external rotation ("waiter''s tip" posture).');

    -- CASE 04: Intrauterine Growth Restriction (IUGR)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Small Baby on Ultrasound', 'A 30-year-old G2P1 smoker at 32 weeks has an ultrasound showing the fetal abdominal circumference is below the 5th percentile for gestational age. Umbilical artery Doppler shows absent end-diastolic flow.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Small for gestational age (SGA) without pathology", "Fetal Growth Restriction (FGR/IUGR) with uteroplacental insufficiency", "Constitutional small baby", "Fetal infection"]', 1, 'FGR with absent/reversed end-diastolic flow on umbilical Doppler indicates severely compromised placental function and is a sign of fetal jeopardy.'),
    (v_case_id, 'Which is more likely to be associated with absent umbilical artery end-diastolic flow — symmetric or asymmetric IUGR?', '["Symmetric IUGR (early insult, all parameters affected equally)", "Asymmetric IUGR (late placental insufficiency — head sparing)", "Both are equally associated", "Neither"]', 1, 'Asymmetric IUGR from uteroplacental insufficiency: the fetus redistributes blood to the brain ("brain sparing"), so the head is relatively larger than the abdomen.'),
    (v_case_id, 'What is the most common cause of IUGR in developed countries?', '["Chromosomal abnormalities", "Uteroplacental insufficiency (often from hypertension, diabetes, smoking)", "Congenital infection", "Multiple gestation"]', 1, 'Placental dysfunction from maternal vascular disease (HTN, preeclampsia, smoking) is the dominant cause in developed nations.');

    -- CASE 05: Multiple Gestation - Twin Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Twins with a Size Discrepancy', 'A 28-year-old G1P0 with monochorionic-diamniotic twins at 22 weeks is found on ultrasound to have Twin A with polyhydramnios (AFI 28 cm) and Twin B with severe oligohydramnios (AFI 2 cm). Both twins are alive.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Discordant growth", "Twin-to-Twin Transfusion Syndrome (TTTS)", "IUGR of one twin", "Placental insufficiency"]', 1, 'TTTS occurs in monochorionic twins when placental vascular anastomoses allow blood to shunt from the "donor" twin (oligo/small) to the "recipient" twin (poly/large).'),
    (v_case_id, 'What is the primary treatment for severe TTTS?', '["Amniocentesis for fluid reduction only", "Fetoscopic laser photocoagulation of the placental anastomoses", "Selective reduction", "Expectant management"]', 1, 'Laser ablation of the vascular connections between the twins is the definitive treatment, improving survival for both twins.'),
    (v_case_id, 'Monochorionic twins are at higher risk than dichorionic twins because:', '["They are always the same sex", "They share a placenta, allowing vascular connections that can cause TTTS, TAPS, and cord entanglement", "They are always identical", "They always require C-section"]', 1, 'A shared placenta is the root cause of most serious monochorionic twin complications.');

    -- CASE 06: Preeclampsia - Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Managing Severe Preeclampsia at 32 Weeks', 'A 33-year-old G2P1 at 32 weeks develops BP 170/112, severe headache, and 3+ proteinuria. She is admitted and started on magnesium and labetalol.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the role of magnesium sulfate in this patient?', '["Lower blood pressure", "Seizure prophylaxis (prevent eclampsia)", "Promote fetal lung maturity", "Treat the underlying cause"]', 1, 'Mg does NOT lower BP. Its sole OB role is seizure prevention. Antihypertensives (labetalol, nifedipine, hydralazine) are used for BP control.'),
    (v_case_id, 'This patient is at 32 weeks. What is the general management approach?', '["Immediate delivery regardless of gestational age", "Expectant management with close monitoring until 34 weeks, then deliver", "Discharge home with oral antihypertensives", "C-section only"]', 1, 'For severe features at < 34 weeks, guidelines support careful expectant management at a tertiary center to gain gestational age — but only if mother and fetus are stable.'),
    (v_case_id, 'A sign of magnesium TOXICITY that indicates the need to stop the infusion is:', '["Urine output > 30 mL/hr", "Loss of patellar (deep tendon) reflexes", "Serum Mg level of 5 mg/dL", "Patient reports feeling warm"]', 1, 'Loss of DTRs occurs at Mg ~7-10 mg/dL (toxic). Respiratory arrest occurs at > 12-15 mg/dL. Monitor DTRs and urine output hourly.');

    -- CASE 07: Cord Prolapse
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Umbilical Cord in the Vagina', 'During artificial rupture of membranes at 6 cm, the nurse calls out that she can feel the umbilical cord in the vagina. Fetal heart rate drops to 70 bpm. The presenting part is above the cord.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management?', '["Apply cord traction to deliver the baby", "Place patient in knee-chest or Trendelenburg position and manually elevate the presenting part off the cord", "Administer oxygen and wait", "Begin Pitocin to expedite delivery"]', 1, 'The presenting part must be manually held off the cord to relieve compression while preparing for emergency C-section. DO NOT push the cord back in.'),
    (v_case_id, 'Which of the following is a risk factor for cord prolapse?', '["Post-term pregnancy", "Malpresentation (transverse lie, footling breech), PPROM, polyhydramnios", "Macrosomia", "Posterior placenta"]', 1, 'Anything that prevents the presenting part from fitting snugly in the pelvis allows room for the cord to prolapse (malpresentation, poly, preterm, etc.).'),
    (v_case_id, 'Definitive management of cord prolapse is:', '["Vaginal delivery if fully dilated", "Emergency cesarean section (most cases)", "Amnioinfusion", "Tocolysis"]', 1, 'Emergency C-section is performed immediately to prevent fetal asphyxia from cord compression. Vaginal delivery is only attempted if delivery is imminent.');

    -- CASE 08: Oligohydramnios
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Low Amniotic Fluid at 38 Weeks', 'A 39-year-old G3P2 at 38 weeks has a routine BPP. AFI is 3.5 cm. The NST is reactive. She denies leaking fluid.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is oligohydramnios and its AFI threshold?', '["AFI < 8 cm", "AFI < 5 cm (or a single deepest pocket < 2 cm)", "AFI < 10 cm", "AFI < 3 cm only"]', 1, 'Oligohydramnios is AFI < 5 cm. It is associated with post-term pregnancy, IUGR, PPROM, and fetal renal abnormalities.'),
    (v_case_id, 'In the third trimester, fetal urine is the primary source of amniotic fluid. Which fetal organ abnormality would cause severe oligohydramnios?', '["Fetal liver disease", "Fetal renal agenesis (Potter sequence)", "Fetal lung hypoplasia", "Fetal cardiac defects"]', 1, 'Bilateral renal agenesis (Potter sequence) leads to no fetal urine, causing severe oligohydramnios, pulmonary hypoplasia, and characteristic facies.'),
    (v_case_id, 'At 38+ weeks with oligohydramnios and a reactive NST, the recommended management is:', '["Expectant management and weekly BPP", "Amnioinfusion", "Induction of labor", "Amniocentesis"]', 2, 'Isolated oligohydramnios at term with a reactive NST is an indication for induction of labor due to placental insufficiency risk.');

    -- CASE 09: Hyperemesis Gravidarum Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Persistent Vomiting and Neurological Symptoms', 'A 23-year-old G1P0 at 12 weeks has been hospitalized for hyperemesis gravidarum. She has received IV fluids with dextrose but no thiamine. She now presents with confusion, ataxia, and nystagmus.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What complication has developed?', '["Eclampsia", "Wernicke encephalopathy from thiamine (B1) deficiency", "Hypoglycemia", "Hyponatremia"]', 1, 'Wernicke''s encephalopathy (confusion + ataxia + ophthalmoplegia) is caused by thiamine deficiency, precipitated by giving glucose WITHOUT thiamine first.'),
    (v_case_id, 'What is the critical rule when treating malnourished/vomiting patients with IV dextrose?', '["Always give insulin first", "Always give thiamine BEFORE glucose to prevent precipitating Wernicke encephalopathy", "Check blood pressure before giving fluids", "Use normal saline, never dextrose"]', 1, 'Glucose metabolism depletes thiamine. Giving dextrose to a thiamine-deficient patient can precipitate or worsen Wernicke''s. Always give thiamine first.'),
    (v_case_id, 'Which electrolyte is classically low in severe hyperemesis gravidarum due to vomiting?', '["Sodium", "Potassium (hypokalemia)", "Calcium", "Magnesium"]', 1, 'Prolonged vomiting causes loss of HCl and K+, leading to hypokalemic, hypochloremic metabolic alkalosis.');

    -- CASE 10: Anemia in Pregnancy - Folate Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Macrocytic Anemia in a Pregnant Patient', 'A 24-year-old G1P0 at 24 weeks who has been taking no prenatal vitamins presents with fatigue. CBC: Hgb 9.8 g/dL, MCV 108 fL. Peripheral smear shows hypersegmented neutrophils.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron deficiency anemia", "Folate deficiency anemia", "Vitamin B12 deficiency", "Hemolytic anemia"]', 1, 'Macrocytic anemia (high MCV) + hypersegmented neutrophils + pregnancy without prenatal vitamins = folate deficiency anemia.'),
    (v_case_id, 'Which fetal complication is directly caused by folate deficiency in early pregnancy?', '["Cardiac defects", "Neural tube defects (spina bifida, anencephaly)", "Cleft palate", "Club foot"]', 1, 'Folate is essential for neural tube closure, which occurs in weeks 3-4. The NTD is already formed before most women know they are pregnant — hence preconception supplementation is critical.'),
    (v_case_id, 'The recommended daily dose of folic acid for a woman with a PRIOR child with a neural tube defect is:', '["0.4 mg (400 mcg)", "0.8 mg (800 mcg)", "4 mg (4,000 mcg)", "0.1 mg (100 mcg)"]', 2, 'High-risk women (prior NTD-affected pregnancy) need 4 mg/day of folic acid, started 1-3 months before conception.');

    -- CASE 11: Antiphospholipid Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent Pregnancy Loss', 'A 32-year-old G4P0 (4 consecutive first-trimester losses) is being evaluated. Labs show a positive lupus anticoagulant and elevated anti-cardiolipin antibodies (IgG) on two occasions 12 weeks apart.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Thrombophilia from Factor V Leiden", "Antiphospholipid Antibody Syndrome (APS)", "Cervical incompetence", "Balanced chromosomal translocation"]', 1, 'APS clinical criteria: >= 3 consecutive early losses or 1 late loss or thrombosis. Lab criteria: positive antiphospholipid antibodies on 2 occasions >= 12 weeks apart.'),
    (v_case_id, 'What is the recommended treatment during pregnancy for APS to prevent recurrent loss?', '["Warfarin throughout pregnancy", "Low-dose aspirin + prophylactic heparin (LMWH) during pregnancy", "Corticosteroids alone", "Hydroxychloroquine alone"]', 1, 'Aspirin + LMWH significantly reduces the risk of recurrent loss and thrombosis in pregnant APS patients. Warfarin is teratogenic in the first trimester.'),
    (v_case_id, 'Antiphospholipid antibodies cause pregnancy loss primarily through:', '["Chromosomal abnormalities in the embryo", "Placental thrombosis leading to placental infarction and fetal death", "Direct fetal toxicity", "Uterine anomalies"]', 1, 'APS causes thrombosis of placental vessels, leading to placental insufficiency, IUGR, and fetal loss.');

    -- CASE 12: Preterm Premature Rupture - Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'PPROM at 30 Weeks - Management Plan', 'A 27-year-old G1P0 at 30 weeks has confirmed PPROM. She has no contractions, no fever, and the fetal tracing is reassuring.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard management for PPROM at 30 weeks without signs of infection or labor?', '["Immediate delivery to prevent infection", "Expectant management with antenatal corticosteroids, antibiotics, and fetal monitoring", "Amnioinfusion", "Cerclage placement"]', 1, 'Expectant management (allowing fetal maturation) is preferred at < 34 weeks. Give corticosteroids for lung maturity, antibiotics to prolong latency, and Mg for neuroprotection if < 32 weeks.'),
    (v_case_id, 'Which antibiotic regimen is given to prolong the latency period in PPROM?', '["Amoxicillin-clavulanate (Augmentin)", "Ampicillin + Erythromycin IV for 48 hours, then oral amoxicillin + erythromycin for 5 days", "Ceftriaxone IM single dose", "Penicillin G for GBS prophylaxis only"]', 1, 'The ORACLE trial regimen (ampicillin + erythromycin) is standard. Augmentin is avoided due to increased risk of necrotizing enterocolitis in preterm neonates.'),
    (v_case_id, 'What sign of chorioamnionitis would mandate immediate delivery regardless of gestational age?', '["Mild uterine tenderness", "Maternal fever > 38.0°C with uterine tenderness, maternal/fetal tachycardia, and purulent fluid", "WBC of 12,000", "Cervical dilation of 2 cm"]', 1, 'Clinical chorioamnionitis (intra-amniotic infection) requires delivery and IV antibiotics. The infection puts both mother and fetus at risk.');

    -- CASE 13: Gestational Trophoblastic Disease - Molar Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Grapes in the Uterus', 'A 20-year-old G1P0 at 14 weeks presents with vaginal bleeding. Her uterus is larger than expected for dates. Beta-hCG is 450,000 mIU/mL. Ultrasound shows a uterus filled with a "snowstorm" pattern and no fetal parts.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hydropic degeneration of placenta", "Complete hydatidiform mole", "Multiple gestation", "Uterine fibroid"]', 1, 'Complete mole: no fetal tissue, markedly elevated hCG, classic "snowstorm" US pattern. Caused by fertilization of an empty egg by one (then duplicated) or two sperm — 46,XX or 46,XY, entirely paternal.'),
    (v_case_id, 'What is the treatment for a complete molar pregnancy?', '["Methotrexate", "Suction curettage (D&C) followed by serial hCG monitoring", "Hysterectomy always", "Watchful waiting"]', 1, 'Suction D&C evacuates the mole. Serial weekly hCG is monitored until normal for 3 consecutive weeks — then monthly for 6 months to detect persistent GTD or choriocarcinoma.'),
    (v_case_id, 'What is the risk of a complete mole progressing to choriocarcinoma?', '["< 1%", "2-3%", "15-20%", "50%"]', 2, 'Complete moles have ~15-20% risk of persistent GTD and ~2-5% risk of choriocarcinoma. Partial moles have a much lower risk (~0.5-1%).');

    -- CASE 14: Thyroid Storm in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperthyroidism in Pregnancy', 'A 25-year-old G1P0 with undiagnosed Graves'' disease at 22 weeks presents with fever 39.8°C, HR 148, tremor, and agitation. TSH is undetectable, free T4 is critically elevated.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis", "Thyroid storm (thyrotoxic crisis)", "Eclampsia", "Pheochromocytoma"]', 1, 'Thyroid storm = life-threatening thyrotoxicosis with systemic decompensation: fever, tachycardia, CNS dysfunction.'),
    (v_case_id, 'Which medication for hyperthyroidism is preferred in the SECOND and THIRD trimester?', '["Propylthiouracil (PTU) — preferred in 1st trimester", "Methimazole — preferred in 2nd and 3rd trimester", "Radioactive iodine (RAI)", "Propranolol alone"]', 1, 'PTU is preferred in the first trimester to avoid methimazole teratogenicity. After the first trimester, methimazole is preferred due to PTU''s risk of maternal hepatotoxicity.'),
    (v_case_id, 'Which fetal complication can result from maternal Graves'' disease?', '["Fetal hypothyroidism only", "Fetal or neonatal hyperthyroidism from transplacental transfer of TSH-receptor antibodies (TRAb)", "Anencephaly", "Fetal cardiac block"]', 1, 'TRAb (stimulating) antibodies cross the placenta and can cause fetal/neonatal thyrotoxicosis, even after maternal thyroidectomy.');

    -- CASE 15: DVT and Pulmonary Embolism in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Leg Swelling and Chest Pain at 28 Weeks', 'A 30-year-old G2P1 at 28 weeks presents with sudden left calf swelling and redness for 2 days, followed by acute onset pleuritic chest pain and shortness of breath. SpO2 is 93% on room air.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are pregnant women at increased risk for DVT/PE?', '["Decreased activity only", "Virchow triad: hypercoagulability (estrogen), venous stasis (IVC compression by uterus), endothelial injury", "Increased fibrinolysis", "Decreased platelet count"]', 1, 'Pregnancy induces all three elements of Virchow''s triad, increasing VTE risk 5-10 fold compared to non-pregnant women of the same age.'),
    (v_case_id, 'What is the preferred imaging to diagnose DVT in pregnancy?', '["CT venography", "Compression ultrasound of the lower extremity veins", "MRI", "D-dimer level only"]', 1, 'Doppler compression ultrasound is the first-line, non-radiation imaging for DVT. D-dimer is unreliable in pregnancy as it is normally elevated.'),
    (v_case_id, 'What is the treatment of choice for acute DVT/PE in pregnancy?', '["Warfarin throughout pregnancy", "Low Molecular Weight Heparin (LMWH e.g. enoxaparin)", "Aspirin alone", "Rivaroxaban"]', 1, 'LMWH is safe, does NOT cross the placenta, and is the anticoagulant of choice in pregnancy. Warfarin is teratogenic (first trimester) and increases fetal bleeding risk. DOACs lack safety data in pregnancy.');

    RAISE NOTICE 'SUCCESS: OB/GYN Complications Case Blocks Part 1 (1-15) registered.';
END $$;

COMMIT;
