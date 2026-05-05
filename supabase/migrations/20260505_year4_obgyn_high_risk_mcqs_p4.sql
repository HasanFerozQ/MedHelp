BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-high-risk-pregnancy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-high-risk-pregnancy not found.';
    END IF;

    -- Batch 4: 181-240 (Infections, Advanced Management, and Monitoring)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: "TORCH" acronym stands for:', '["Toxoplasmosis, Other, Rubella, CMV, Herpes", "Tetanus, Obesity, Renal, Cardiac, Hepatic", "Toxins, Oxygen, Radiation, Chemicals, Heat", "None"]', 0, 'The classic group of congenital infections. (Williams)'),
    (v_topic_id, '182: Most common congenital infection in the US?', '["Toxoplasmosis", "Cytomegalovirus (CMV)", "Rubella", "HIV"]', 1, 'Affects ~1% of all live births. (Beckmann)'),
    (v_topic_id, '183: "Congenital CMV" is the leading non-genetic cause of:', '["Heart defects", "Sensorineural hearing loss", "Limb loss", "Blindness"]', 1, 'Also causes microcephaly and periventricular calcifications. (ACOG)'),
    (v_topic_id, '184: "Toxoplasmosis" transmission risk to the fetus is highest in which trimester?', '["1st", "2nd", "3rd", "Labor"]', 2, 'Risk increases with gestational age, but severity is highest in the 1st trimester. (Williams)'),
    (v_topic_id, '185: Maternal "Primary" Herpes (HSV) infection during labor warrants:', '["Vaginal delivery", "Cesarean delivery", "Wait for lesions to heal", "Antibiotics"]', 1, 'High risk (50%) of neonatal transmission. (ACOG)'),
    (v_topic_id, '186: Mothers with a history of recurrent HSV should receive which prophylaxis starting at 36 weeks?', '["Acyclovir or Valacyclovir", "Penicillin", "Steroids", "Vaccine"]', 0, 'Reduces the risk of an outbreak at delivery. (ACOG)'),
    (v_topic_id, '187: "Syphilis" in pregnancy is screened for with:', '["RPR or VDRL", "Ultrasound", "Glucose test", "Amniocentesis"]', 0, 'If positive, must be confirmed with a treponemal-specific test (e.g., FTA-ABS). (CDC)'),
    (v_topic_id, '188: Only effective treatment for Syphilis in pregnancy?', '["Doxycycline", "Penicillin G (Benzathine)", "Ceftriaxone", "Azithromycin"]', 1, 'Patients with PCN allergy must be desensitized. (CDC)'),
    (v_topic_id, '189: "Jarisch-Herxheimer" reaction during syphilis treatment can cause:', '["Preterm labor or fetal distress", "Diabetes", "Twins", "Nothing"]', 0, 'Due to massive release of treponemal antigens. (Williams)'),
    (v_topic_id, '190: "Congenital Syphilis" signs?', '["Hutchinson teeth, Saddle nose, and Saber shins", "Big head", "Club foot", "Macrosomia"]', 0, 'Also includes hepatosplenomegaly and snuffles (rhinitis). (Beckmann)'),
    (v_topic_id, '191: "Hepatitis B" positive mothers: The newborn should receive:', '["HBV Vaccine only", "HBV Vaccine and Hepatitis B Immune Globulin (HBIG) within 12 hours", "Antibiotics", "Nothing"]', 1, 'Significantly reduces vertical transmission. (CDC)'),
    (v_topic_id, '192: "Hepatitis C" in pregnancy:', '["Is always treated", "Treatment is generally deferred until after pregnancy due to lack of safety data for DAAs", "Requires C-section", "None"]', 1, 'Viral load does not correlate perfectly with transmission risk. (ACOG)'),
    (v_topic_id, '193: "Zika Virus" infection in pregnancy is associated with:', '["Macrosomia", "Severe microcephaly and intracranial calcifications", "Heart defects", "Limb loss"]', 1, 'Avoid travel to endemic areas. (CDC)'),
    (v_topic_id, '194: "Chorioamnionitis" (Triple I) diagnostic criteria?', '["Maternal fever >= 39.0C (or 38.0C with another sign)", "Maternal/fetal tachycardia", "Uterine tenderness or foul fluid", "All of the above"]', 3, 'Intra-amniotic infection or inflammation. (ACOG)'),
    (v_topic_id, '195: A patient at 36 weeks has "Pre-eclampsia with Severe Features." She is undergoing induction. Suddenly, she has a grand-mal seizure. First step?', '["Immediate C-section", "Protect airway and administer Magnesium Sulfate", "Push harder", "IV Fluids only"]', 1, 'Management of Eclampsia. (ACOG)'),
    (v_topic_id, '196: During an eclamptic seizure, the FHR often shows:', '["Accelerations", "Prolonged deceleration (bradycardia) that recovers as the mother is stabilized", "Tachycardia", "Sinusoidal pattern"]', 1, 'Expectant management of the tracing during the seizure is key. (Williams)'),
    (v_topic_id, '197: "Placental Abruption" can lead to "DIC." The most sensitive lab marker for DIC in pregnancy is:', '["High PT/PTT", "Low Fibrinogen (< 200 mg/dL)", "High Platelets", "Low Glucose"]', 1, 'Fibrinogen is normally high in pregnancy; a "normal" level (e.g., 200) indicates consumption. (ACOG)'),
    (v_topic_id, '198: "Fetal Hydrops" on ultrasound shows:', '["Skin edema, Ascites, Pleural/Pericardial effusion", "Large brain", "Small bladder", "No stomach"]', 0, 'Accumulation of fluid in >= 2 spaces. (Beckmann)'),
    (v_topic_id, '199: Non-immune causes of Hydrops?', '["Fetal arrhythmias", "Chromosomal issues (Turner, Down)", "Congenital infections (TORCH)", "All of the above"]', 3, 'Rh-disease is "Immune Hydrops." (Williams)'),
    (v_topic_id, '200: Management of "Chronic Hypertension" with superimposed pre-eclampsia at 34 weeks?', '["Deliver", "Wait until 37 weeks", "Wait until 39 weeks", "Bed rest"]', 0, 'Same as pre-eclampsia with severe features. (ACOG)'),
    (v_topic_id, '201: A patient with "Gestational Diabetes" has been on Insulin. What is her increased risk of developing Type 2 Diabetes within 10 years?', '["0%", "5%", "Up to 50%", "100%"]', 2, 'Significant metabolic risk. (ACOG)'),
    (v_topic_id, '202: What is the primary fetal benefit of treating maternal Gestational Diabetes?', '["Preventing heart defects", "Reducing risk of macrosomia and birth trauma", "Preventing Down syndrome", "Reducing twins"]', 1, 'Treatment doesn''t prevent organ defects as they occur early. (Beckmann)'),
    (v_topic_id, '203: "Velamentous Cord Insertion" is a risk factor for:', '["Placenta Previa", "Vasa Previa", "Abruption", "Atony"]', 1, 'Vessels run unprotected through the membranes. (Williams)'),
    (v_topic_id, '204: A patient with "Dichorionic/Diamniotic" (Di-Di) twins should be delivered at:', '["32 weeks", "34 weeks", "38 weeks", "40 weeks"]', 2, 'Di-Di twins have the lowest risk profile. (ACOG)'),
    (v_topic_id, '205: "Monochorionic/Diamniotic" (Mo-Di) twins should be delivered at:', '["32-34 weeks", "34-37 weeks (usually 36)", "39 weeks", "41 weeks"]', 1, 'Increased risk of stillbirth if carried to term. (ACOG)'),
    (v_topic_id, '206: "Monochorionic/Monoamniotic" (Mo-Mo) twins should be delivered at:', '["32-34 weeks (via C-section)", "36 weeks", "38 weeks", "Vaginal delivery at term"]', 0, 'Risk of cord entanglement is too high for later delivery or vaginal birth. (ACOG)'),
    (v_topic_id, '207: "Vanishing Twin" in the 1st trimester does NOT typically affect the remaining twin.', '["True", "False", "Only if it is Mo-Di", "Only in obesity"]', 0, 'The survivor usually develops normally. (Williams)'),
    (v_topic_id, '208: "Fetal Growth Restriction" (FGR) with "Absent End-Diastolic Flow" on Umbilical Artery Doppler at 34 weeks warrants:', '["Repeat Doppler in 1 month", "Delivery", "Wait until 37 weeks", "More calories"]', 1, 'Indicates significant placental compromise. (ACOG)'),
    (v_topic_id, '209: "Reversed End-Diastolic Flow" (REDF) is:', '["Normal", "More severe than Absent flow; warrants immediate delivery (usually after steroids)", "A sleep cycle sign", "None"]', 1, 'Critical finding. (Williams)'),
    (v_topic_id, '210: Maternal "Smoking" is associated with a birth weight reduction of approximately:', '["100g", "200-300g", "1kg", "No reduction"]', 1, 'Dose-dependent effect. (ACOG)'),
    (v_topic_id, '211: "Aspirin" (81 mg) reduces pre-eclampsia risk by improving:', '["Blood sugar", "Placental perfusion and endothelial function", "Maternal mood", "Fetal size"]', 1, 'Mechanism involves thromboxane/prostacyclin balance. (Williams)'),
    (v_topic_id, '212: A Bishop score of 2 in a woman with pre-eclampsia at 37 weeks. Best step?', '["C-section", "Cervical ripening (Prostaglandins or Foley)", "Oxytocin only", "Wait 1 week"]', 1, 'Ripening is needed for an unfavorable cervix. (ACOG)'),
    (v_topic_id, '213: A patient with "Placenta Previa" presents with painless bleeding. You must avoid:', '["Digital exam", "Speculum exam", "Both digital and speculum exams until previa is ruled out", "Ultrasound"]', 2, 'Transvaginal ultrasound is actually safer than digital exam for diagnosis. (Williams)'),
    (v_topic_id, '214: "Placenta Accreta" management includes having which consult ready?', '["Urology and Gyn-Onc", "Dermatology", "Psychiatry", "None"]', 0, 'Potential for bladder involvement and complex surgical needs. (ACOG)'),
    (v_topic_id, '215: "Amniotic Fluid Embolism" (AFE) is a clinical diagnosis characterized by:', '["Fever and cough", "Sudden hypoxia, hypotension, and DIC", "Rash and itching", "Seizures only"]', 1, 'Rapidly fatal in many cases. (Beckmann)'),
    (v_topic_id, '216: In AFE, "DIC" develops in what percentage of patients?', '["10%", "50%", "> 80%", "0%"]', 2, 'One of the most profound coagulopathies in medicine. (Williams)'),
    (v_topic_id, '217: "Postpartum Hemorrhage" (PPH) in a woman with Twins is usually due to:', '["Lacerations", "Uterine Atony (due to overdistension)", "Placental issues", "Thrombin deficiency"]', 1, 'The uterus is "stretched" too far to contract effectively. (ACOG)'),
    (v_topic_id, '218: "B-Lynch" suture is used to treat:', '["Tears", "Uterine Atony (refractory to meds)", "Infection", "Cervical cancer"]', 1, 'Compresses the uterus during C-section. (Beckmann)'),
    (v_topic_id, '219: A "Dural Puncture" headache after epidural is treated with:', '["Antibiotics", "Epidural Blood Patch", "Bed rest and fluids only", "Aspirin"]', 1, 'Closes the CSF leak. (Williams)'),
    (v_topic_id, '220: "Magnesium" is cleared via:', '["Liver", "Kidneys", "Lungs", "Bile"]', 1, 'Oliguria increases the risk of magnesium toxicity. (ACOG)'),
    (v_topic_id, '221: "Group B Strep" (GBS) positive mother at 32 weeks with preterm labor. Management?', '["Wait until 36 weeks to treat", "Start IV Penicillin immediately", "Treat after delivery", "No treatment needed"]', 1, 'GBS prophylaxis is indicated if labor is occurring or ROM. (CDC)'),
    (v_topic_id, '222: If GBS status is UNKNOWN at term, treat with Penicillin if:', '["Maternal fever >= 38.0C", "ROM >= 18 hours", "Previous infant with GBS sepsis", "All of the above"]', 3, 'Criteria for empiric treatment. (CDC)'),
    (v_topic_id, '223: "Indomethacin" for tocolysis is usually limited to how many hours/days?', '["48 hours", "1 week", "1 month", "Whole pregnancy"]', 0, 'To minimize risk of ductal closure and oligohydramnios. (ACOG)'),
    (v_topic_id, '224: "Nifedipine" side effects?', '["Tachycardia, flushing, and headache", "Hypertension", "Seizures", "Rash"]', 0, 'Due to peripheral vasodilation. (Beckmann)'),
    (v_topic_id, '225: "Terbutaline" (beta-agonist) for tocolysis side effect?', '["Hypotension", "Maternal Tachycardia and Pulmonary Edema", "Weight gain", "Diabetes"]', 1, 'Used less frequently now for long-term tocolysis. (Williams)'),
    (v_topic_id, '226: A patient with "Mitral Stenosis" in labor should be kept in which position?', '["Flat on back", "Semi-upright or Lateral (to reduce venous return and preload)", "Squatting", "None"]', 1, 'To prevent pulmonary congestion. (Williams)'),
    (v_topic_id, '227: Management of "Endometritis"?', '["Oral Amoxicillin", "IV Clindamycin + Gentamicin", "IV Vancomycin", "Wait for it to pass"]', 1, 'The "Gold Standard" regimen. (ACOG)'),
    (v_topic_id, '228: Risk factor for "Uterine Rupture"?', '["First baby", "Prior classical C-section or myomectomy involving the cavity", "Twins", "GDM"]', 1, 'Classical scars have a 4-10% rupture risk. (Williams)'),
    (v_topic_id, '229: "Painless" third-trimester bleeding + Fetal bradycardia after ROM?', '["Previa", "Vasa Previa rupture", "Abruption", "Atony"]', 1, 'Broughton-Chance test/Apt test can confirm fetal blood. (Beckmann)'),
    (v_topic_id, '230: "Cervical Cerclage" is usually removed at which week?', '["34", "36-37", "40", "Only during labor"]', 1, 'To allow for spontaneous labor or induction. (ACOG)'),
    (v_topic_id, '231: "Rh-negative" mothers who have a miscarriage or abortion at 8 weeks should:', '["Wait until next pregnancy", "Receive mini-dose (50mcg) or full dose (300mcg) of RhoGAM", "Receive nothing", "Test the partner"]', 1, 'Sensitization can occur as early as 6-8 weeks. (ACOG)'),
    (v_topic_id, '232: "Fetal Lung Maturity" is accelerated by which maternal condition?', '["Diabetes", "Chronic Hypertension and Pre-eclampsia (due to stress)", "Obesity", "None"]', 1, 'Chronic stress increases fetal cortisol. (Williams)'),
    (v_topic_id, '233: "Fetal Lung Maturity" is DELAYED by which condition?', '["Hypertension", "Maternal Diabetes", "Post-term", "Smoking"]', 1, 'Insulin can antagonize the effect of cortisol on surfactant production. (Beckmann)'),
    (v_topic_id, '234: "Nitrazine" false positives?', '["Blood, Semen, or Antiseptics", "Urine", "Sugar", "None"]', 0, 'Anything alkaline will turn the paper blue. (Williams)'),
    (v_topic_id, '235: "IUGR" vs "SGA" (Small for Gestational Age)?', '["SGA is EFW < 10th percentile; IUGR implies a pathologic process", "They are the same", "SGA is 5th percentile", "None"]', 0, 'SGA can be "constitutionally small." (ACOG)'),
    (v_topic_id, '236: "BPP" of 6/10 at 36 weeks. Next step?', '["Repeat in 24h or deliver if at term", "Deliver immediately", "C-section only", "Wait 1 week"]', 0, 'Equivocal score. (Williams)'),
    (v_topic_id, '237: "Fetal Tachycardia" is defined as baseline FHR > _____ bpm.', '["140", "150", "160", "180"]', 2, 'For at least 10 minutes. (ACOG)'),
    (v_topic_id, '238: "Fetal Bradycardia" is defined as baseline FHR < _____ bpm.', '["110", "120", "130", "100"]', 0, 'Can be normal if baseline is steady (e.g., 105). (Beckmann)'),
    (v_topic_id, '239: Most common complication of "Multiple Gestation"?', '["Diabetes", "Preterm Birth", "Abruption", "Hydrops"]', 1, 'Increased uterine distension triggers labor early. (ACOG)'),
    (v_topic_id, '240: "TTTS" Stage 1 is characterized by:', '["Absent bladder in donor", "Polyhydramnios/Oligohydramnios sequence with visible bladders", "Hydrops", "Fetal death"]', 1, 'Quintero staging system. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for High-Risk Pregnancy registered.';
END $$;
COMMIT;
