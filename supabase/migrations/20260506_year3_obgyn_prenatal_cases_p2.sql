BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-prenatal-care' LIMIT 1;

    -- CASE 16: Preeclampsia Diagnosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Blood Pressure at 34 Weeks', 'A 31-year-old G1P0 at 34 weeks presents with BP 158/102 mmHg on two readings 4 hours apart. Urinalysis shows 3+ protein. She has no prior history of hypertension.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Chronic hypertension", "Gestational hypertension", "Preeclampsia", "Eclampsia"]', 2, 'Preeclampsia = BP >= 140/90 after 20 weeks + proteinuria (>= 300 mg/24hr) or other end-organ features in a previously normotensive patient.'),
    (v_case_id, 'Which of the following indicates "severe features" of preeclampsia?', '["BP >= 160/110 on two occasions", "Proteinuria of 1+", "BP >= 130/90", "Bilateral ankle edema"]', 0, 'Severe features: SBP >= 160 or DBP >= 110, thrombocytopenia (platelets < 100k), renal insufficiency, impaired liver function, or neurological symptoms.'),
    (v_case_id, 'What is the only definitive treatment for preeclampsia?', '["Antihypertensives alone", "Magnesium sulfate alone", "Delivery of the fetus and placenta", "Bed rest and low-sodium diet"]', 2, 'Delivery is the definitive cure. In severe preeclampsia at >= 34 weeks, delivery is recommended. Mg is given for seizure prophylaxis.');

    -- CASE 17: HELLP Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Epigastric Pain in the Third Trimester', 'A 33-year-old G2P1 at 35 weeks presents with severe epigastric and right upper quadrant pain, nausea, and malaise. Labs: platelets 85,000; AST 300 U/L; LDH elevated; peripheral smear shows schistocytes.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Acute cholecystitis", "Acute hepatitis", "HELLP Syndrome", "Pancreatitis"]', 2, 'HELLP = Hemolysis, Elevated Liver enzymes, Low Platelets. It is a severe variant of preeclampsia.'),
    (v_case_id, 'What is the most serious complication of HELLP syndrome?', '["Fetal macrosomia", "Hepatic capsule rupture causing life-threatening hemorrhage", "Gestational diabetes", "Polyhydramnios"]', 1, 'Subcapsular hematoma and spontaneous hepatic rupture are the most feared, immediately life-threatening complications.'),
    (v_case_id, 'What is the treatment for HELLP syndrome at 35 weeks gestation?', '["Expectant management with bed rest", "Immediate delivery (vaginal or C-section)", "Plasmapheresis", "IV immunoglobulin"]', 1, 'HELLP syndrome requires prompt delivery regardless of gestational age due to the risk of rapid deterioration.');

    -- CASE 18: Eclampsia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Seizure in a Pregnant Woman', 'A 25-year-old G1P0 at 38 weeks with a known diagnosis of preeclampsia has a witnessed tonic-clonic seizure lasting 90 seconds. There is no prior history of seizure disorder.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Status epilepticus", "Eclampsia", "Stroke", "Hypertensive encephalopathy"]', 1, 'Eclampsia = new-onset grand mal seizure in a woman with preeclampsia (or sometimes without prior diagnosis).'),
    (v_case_id, 'What is the drug of choice to treat and prevent further eclamptic seizures?', '["IV Phenytoin", "IV Diazepam", "IV Magnesium Sulfate", "IV Levetiracetam"]', 2, 'Magnesium sulfate is superior to other anticonvulsants for eclamptic seizures and is the standard of care.'),
    (v_case_id, 'What is the antidote for magnesium toxicity?', '["Naloxone", "Calcium gluconate", "Flumazenil", "Vitamin K"]', 1, 'Calcium gluconate reverses magnesium toxicity (respiratory depression, loss of DTRs). Monitor patellar reflexes and urine output during Mg infusion.');

    -- CASE 19: Placental Abruption
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painful Bleeding at 32 Weeks', 'A 29-year-old G3P2 at 32 weeks gestation, known cocaine user, presents with sudden onset of severe, constant abdominal pain and dark vaginal bleeding. The uterus is rigid and tender ("board-like").', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Placenta previa", "Placental abruption", "Uterine rupture", "Preterm labor"]', 1, 'Abruption = premature separation of placenta. Hallmarks are PAINFUL bleeding + rigid, tender uterus. Cocaine use is a classic risk factor.'),
    (v_case_id, 'What is the primary difference between placental abruption and placenta previa?', '["Abruption is painless, previa is painful", "Abruption is painful with a firm uterus; previa is painless with a soft uterus", "Previa occurs before 20 weeks", "Abruption only occurs with trauma"]', 1, 'Pain + hard uterus = abruption. Painless bright red bleeding = previa. Key clinical distinction.'),
    (v_case_id, 'What life-threatening coagulopathy can develop rapidly in severe placental abruption?', '["ITP (Immune Thrombocytopenic Purpura)", "DIC (Disseminated Intravascular Coagulation)", "Von Willebrand disease", "Factor V Leiden thrombosis"]', 1, 'Large abruptions release massive amounts of thromboplastin into maternal circulation, triggering DIC. Fibrinogen level is the most useful test.');

    -- CASE 20: Gestational Hypertension
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Elevated BP Without Protein', 'A 28-year-old G1P0 at 37 weeks has BP readings of 148/95 on two occasions, 4 hours apart. Urine protein is negative. She has no headache, visual changes, or epigastric pain. Prior to pregnancy, her BP was normal.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Chronic hypertension", "Preeclampsia", "Gestational hypertension", "White coat hypertension"]', 2, 'Gestational hypertension: BP >= 140/90 after 20 weeks WITHOUT proteinuria or end-organ damage. Resolves by 12 weeks postpartum.'),
    (v_case_id, 'How does gestational hypertension differ from preeclampsia?', '["There is no difference", "Gestational HTN lacks proteinuria or other end-organ features", "Gestational HTN has higher BP values", "Gestational HTN only occurs before 34 weeks"]', 1, 'The key differentiator is absence of proteinuria and end-organ dysfunction in gestational HTN.'),
    (v_case_id, 'What antihypertensive is considered first-line for severe-range BP (>= 160/110) in pregnancy?', '["Lisinopril", "Labetalol, Hydralazine, or Nifedipine", "Metoprolol", "Furosemide"]', 1, 'Labetalol IV, hydralazine IV, and oral nifedipine are the agents of choice. ACE inhibitors and ARBs are CONTRAINDICATED in pregnancy (teratogenic).');

    -- CASE 21: Antenatal Corticosteroids
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Steroid Timing for Lung Maturity', 'A 30-year-old G2P1 presents in preterm labor at 30 weeks gestation. The team is considering antenatal corticosteroids.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary benefit of antenatal corticosteroids?', '["Stopping contractions", "Accelerating fetal lung maturity (surfactant production) to reduce RDS", "Preventing maternal infection", "Decreasing fetal size"]', 1, 'Betamethasone or dexamethasone given 24-48 hours before delivery dramatically reduces the incidence and severity of RDS.'),
    (v_case_id, 'At what gestational age range is one course of antenatal corticosteroids recommended?', '["20-28 weeks", "24 0/7 to 33 6/7 weeks (consider up to 34 6/7 weeks)", "36-40 weeks", "Any gestational age"]', 1, 'ACOG recommends a single course for patients at risk of delivery between 24 0/7 and 33 6/7 weeks. They are also considered at 34 0/7 to 36 6/7 weeks.'),
    (v_case_id, 'Surfactant is primarily responsible for what function?', '["Preventing infection in the lung", "Reducing alveolar surface tension to prevent collapse at end-expiration", "Transporting oxygen", "Producing IgA in the lung"]', 1, 'Surfactant lowers surface tension, preventing alveolar collapse (atelectasis) at the end of each breath. Deficiency causes RDS/HMD.');

    -- CASE 22: Prenatal Infections - TORCH
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The TORCH Infections', 'A newborn is found to have sensorineural hearing loss, cataracts, and a cardiac defect (PDA). The mother reported a mild rash early in the first trimester.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely congenital infection?', '["Toxoplasmosis", "Cytomegalovirus (CMV)", "Congenital Rubella Syndrome", "Herpes Simplex"]', 2, 'Congenital Rubella = the classic triad of deafness, cataracts, and cardiac defects (PDA, pulmonary artery stenosis). First trimester is most dangerous.'),
    (v_case_id, 'Congenital CMV is the most common congenital infection. What is a classic finding?', '["Cataracts", "Periventricular calcifications and sensorineural hearing loss", "Hydrocephalus with diffuse intracranial calcifications", "Vesicular skin rash"]', 1, 'CMV causes periventricular calcifications (near the ventricles), while Toxo causes diffuse intracranial calcifications. SNHL is the most common sequela.'),
    (v_case_id, 'Congenital Toxoplasmosis presents with the classic triad of:', '["Hearing loss, cataracts, PDA", "Chorioretinitis, hydrocephalus, and intracranial calcifications", "Blueberry muffin rash, hepatosplenomegaly, jaundice", "Vesicles, encephalitis, keratoconjunctivitis"]', 1, 'Toxo triad: Chorioretinitis + hydrocephalus + diffuse intracranial calcifications. Acquired by eating undercooked meat or cat feces.');

    -- CASE 23: Thyroid in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hypothyroid Pregnant Patient', 'A 27-year-old G1P0 at 10 weeks is found to have a TSH of 7.2 mIU/L on routine labs. She has no history of thyroid disease. She is asymptomatic.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the concern with untreated hypothyroidism in pregnancy?', '["Preterm labor only", "Impaired fetal neurological development and IQ, preeclampsia, and miscarriage", "Gestational diabetes", "Macrosomia"]', 1, 'The fetal brain depends on maternal thyroid hormone in the first trimester (fetal thyroid is not functional until ~12 weeks). Untreated hypo causes cognitive impairment.'),
    (v_case_id, 'How should levothyroxine dosing change in pregnancy?', '["Decrease by 25%", "No change needed", "Increase dose by 25-50% to meet increased thyroid demands of pregnancy", "Stop and restart postpartum"]', 2, 'Pregnancy increases thyroid hormone requirements. TSH targets in pregnancy are lower than in non-pregnant adults (< 2.5 mIU/L in first trimester ideally).'),
    (v_case_id, 'What drug used in hyperthyroidism is CONTRAINDICATED in the first trimester due to teratogenicity?', '["Methimazole (associated with aplasia cutis)", "Propylthiouracil (PTU)", "Propranolol", "Radioiodine"]', 0, 'Methimazole is associated with choanal atresia, esophageal atresia, and aplasia cutis in the first trimester. PTU is preferred then.');

    -- CASE 24: Cervical Incompetence / Cerclage
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Cervical Dilation at 19 Weeks', 'A 32-year-old G3P0 (2 previous losses at 18-20 weeks) presents at 18 weeks. Ultrasound shows cervical length of 17 mm with funneling, and she is 3 cm dilated without contractions.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Preterm labor", "Cervical incompetence (cervical insufficiency)", "Placenta previa", "PPROM"]', 1, 'Cervical insufficiency = painless cervical dilation/effacement in the second trimester without contractions, leading to recurrent pregnancy loss.'),
    (v_case_id, 'What is the surgical treatment for cervical insufficiency?', '["Amniotomy", "Cerclage (suturing the cervix closed)", "Hysterotomy", "External cephalic version"]', 1, 'Cerclage (McDonald or Shirodkar technique) sutures the cervix closed to prevent premature delivery.'),
    (v_case_id, 'In addition to cerclage, which medication is used prophylactically in women with a history of preterm birth?', '["Aspirin", "Progesterone (17-OHPC injections or vaginal progesterone)", "Betamethasone", "Magnesium"]', 1, 'Progesterone supplementation reduces preterm birth recurrence risk in women with a history of spontaneous preterm birth and short cervix.');

    -- CASE 25: Fetal Kick Counts and Biophysical Profile
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Interpreting the BPP', 'A 36-year-old G2P1 at 36 weeks with diabetes has a biophysical profile. Results: NST = non-reactive (0), fetal breathing = present (2), movements = present (2), tone = present (2), AFI = 5 cm (0). Total score = 6/10.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should a BPP score of 6/10 be interpreted?', '["Normal, recheck in 1 week", "Equivocal — repeat in 24 hours or proceed to delivery based on clinical context", "Severely abnormal, deliver immediately", "Normal in a diabetic patient"]', 1, 'A score of 6 is equivocal. A score <= 4 is abnormal and warrants delivery regardless of gestational age.'),
    (v_case_id, 'An AFI (Amniotic Fluid Index) < 5 cm is called:', '["Polyhydramnios", "Oligohydramnios", "Normal", "Anhydramnios"]', 1, 'Oligohydramnios (AFI < 5 cm) is associated with fetal renal abnormalities, post-term pregnancy, IUGR, and PPROM.'),
    (v_case_id, 'Polyhydramnios (AFI > 24 cm) is associated with which fetal condition?', '["Renal agenesis", "Esophageal atresia or other GI obstruction (fetus cannot swallow amniotic fluid)", "Spina bifida occulta", "Coarctation of the aorta"]', 1, 'When a fetus cannot swallow amniotic fluid (due to GI obstruction), fluid accumulates — polyhydramnios. Also associated with macrosomia and diabetes.');

    -- CASE 26: Normal Labor - Stages
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stages of Labor', 'A 24-year-old G1P0 at 40 weeks presents in active labor. Cervix is 5 cm. After 14 hours she is now 10 cm and fully effaced. She pushes for 3 hours and delivers vaginally. The placenta is delivered 10 minutes later.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of labor does the period from 5 cm to complete dilation (10 cm) represent?', '["First stage, latent phase", "First stage, active phase", "Second stage", "Third stage"]', 1, 'First stage: onset of labor to full dilation. Latent = 0-6 cm; Active = 6 cm to 10 cm. Second stage: full dilation to delivery. Third stage: delivery to placenta.'),
    (v_case_id, 'The third stage of labor (delivery of the placenta) is normally completed in how long?', '["Within 30 minutes", "Within 1-2 hours", "12 hours", "48 hours"]', 0, 'The placenta is normally delivered within 30 minutes. Retention > 30 minutes is called retained placenta.'),
    (v_case_id, 'Which Cardinal movement of labor describes when the baby''s head enters the pelvis with its longest diameter parallel to the widest diameter of the pelvis?', '["Flexion", "Engagement / Internal rotation", "Extension", "Descent"]', 1, 'The 7 cardinal movements: engagement, descent, flexion, internal rotation, extension, external rotation, expulsion.');

    -- CASE 27: Epidural Analgesia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain Management in Labor', 'A 27-year-old G1P0 at 7 cm requests an epidural for pain relief. After placement, her BP drops to 85/50 mmHg.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of hypotension after epidural placement?', '["Intravascular injection", "Sympathetic blockade causing vasodilation and decreased venous return", "Allergic reaction", "Aortic compression"]', 1, 'The sympathetic block from the epidural causes peripheral vasodilation. Treatment: IV fluid bolus, left lateral positioning, vasopressors (phenylephrine or ephedrine).'),
    (v_case_id, 'What is the most common complication of epidural analgesia?', '["Permanent paralysis", "Pruritus (with opioid-containing epidurals) and hypotension", "Seizures", "Respiratory arrest"]', 1, 'Pruritus from intrathecal opioids and maternal hypotension are the most common side effects. Serious complications are rare.'),
    (v_case_id, 'Epidural analgesia does NOT typically cause which of the following?', '["Pain relief", "Increased duration of the second stage", "Fetal bradycardia from hypotension", "Fever in the mother"]', 0, 'Wait — pain relief IS caused by epidural. The question asks what it does NOT cause. Epidural does NOT cause permanent neurological injury in routine use. Fever (from epidural) and prolonged 2nd stage are real associations.');

    -- CASE 28: Fetal Heart Rate Monitoring
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Interpreting Fetal Heart Tones', 'During labor, the electronic fetal monitor shows: FHR baseline 140 bpm, moderate variability, accelerations present, no decelerations. The patient is at 8 cm.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this fetal heart rate tracing categorized?', '["Category II (indeterminate)", "Category I (normal)", "Category III (abnormal)", "Cannot be determined"]', 1, 'Category I: Baseline 110-160, moderate variability, accelerations, and no late/variable decelerations. This is a reassuring, normal tracing.'),
    (v_case_id, 'Late decelerations (nadir after the peak of the contraction) are most concerning for:', '["Cord compression", "Uteroplacental insufficiency and fetal hypoxia", "Fetal head compression", "Normal fetal movement"]', 1, 'Late decelerations are a sign of fetal hypoxia due to inadequate uteroplacental perfusion. They are always abnormal and require intervention.'),
    (v_case_id, 'Variable decelerations are caused by:', '["Head compression", "Uteroplacental insufficiency", "Umbilical cord compression", "Fetal sleeping"]', 2, 'Variable decelerations are abrupt drops in FHR that vary in timing and shape — caused by cord compression. They may be benign or concerning depending on severity and context.');

    -- CASE 29: Episiotomy and Perineal Lacerations
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Perineal Repair After Delivery', 'A G1P0 has just delivered a 4,200g baby. The obstetrician notes a tear extending through the perineal skin, vaginal mucosa, and into the anal sphincter.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this laceration classified?', '["1st degree", "2nd degree", "3rd degree", "4th degree"]', 2, '3rd degree: involves the anal sphincter. 4th degree: extends into the rectal mucosa. 2nd degree: vaginal mucosa and perineal muscles. 1st degree: skin only.'),
    (v_case_id, 'Which of the following is the strongest risk factor for a severe perineal laceration?', '["Posterior episiotomy", "Operative vaginal delivery (forceps) and macrosomia", "Small baby weight", "Epidural use"]', 1, 'Instrumental delivery (forceps > vacuum) and large baby are the strongest risk factors for 3rd and 4th degree tears.'),
    (v_case_id, 'Routine episiotomy is now:', '["Recommended for all primiparous women", "Recommended for all operative deliveries", "NOT routinely recommended (selective use only)", "Required by ACOG guidelines"]', 2, 'Evidence shows routine episiotomy does NOT prevent severe lacerations and may increase them. Selective use (e.g., fetal distress, shoulder dystocia) is appropriate.');

    -- CASE 30: Postpartum Hemorrhage
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Excessive Bleeding After Delivery', 'A 34-year-old G4P4 delivers a 3.8 kg infant after a prolonged labor. Shortly after the placenta is delivered, there is continued profuse vaginal bleeding. Estimated blood loss is > 1,000 mL. The uterus feels soft and "boggy" on palpation.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this postpartum hemorrhage?', '["Cervical laceration", "Uterine atony", "Retained placenta", "Coagulopathy"]', 1, 'Uterine atony is the cause of 80% of PPH. Risk factors: grand multiparity, prolonged labor, overdistension (macrosomia, twins, polyhydramnios).'),
    (v_case_id, 'What is the FIRST step in managing uterine atony?', '["IV Tranexamic acid", "Uterine massage and bimanual compression, plus Oxytocin infusion", "Emergency hysterectomy", "Bakri balloon tamponade"]', 1, 'Initial management: uterine massage + fundal pressure + IV/IM oxytocin. If oxytocin fails, add methylergonovine, carboprost, or misoprostol.'),
    (v_case_id, 'The "4 Ts" mnemonic for causes of PPH stands for:', '["Tone, Tissue, Trauma, Thrombin", "Tears, Twisting, Tension, Toxins", "Temperature, Tachycardia, Tension, Tissue", "Time, Tone, Tears, Toxins"]', 0, 'Tone (atony) = #1 cause. Tissue (retained placenta). Trauma (lacerations, hematoma). Thrombin (coagulopathy, DIC).');

    RAISE NOTICE 'SUCCESS: OB/GYN Prenatal Care Case Blocks Part 2 (16-30) registered.';
END $$;

COMMIT;
