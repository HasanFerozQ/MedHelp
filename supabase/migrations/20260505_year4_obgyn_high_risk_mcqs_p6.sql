BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-high-risk-pregnancy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-high-risk-pregnancy not found.';
    END IF;

    -- Batch 6: 301-335 (Final Comprehensive Review)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A 35-year-old G1P0 at 36 weeks has a BP of 165/110 and a severe headache. What is the most appropriate medication to prevent a seizure?', '["Diazepam", "Magnesium Sulfate (4-6g IV bolus then 2g/hr)", "Phenobarbital", "Labetalol"]', 1, 'Standard prophylaxis for severe pre-eclampsia. (ACOG)'),
    (v_topic_id, '302: If the same patient in 301 has a respiratory rate of 8 and absent reflexes, what should be given?', '["More Magnesium", "Calcium Gluconate", "Oxygen only", "Normal saline"]', 1, 'Antidote for magnesium toxicity. (Williams)'),
    (v_topic_id, '303: A woman at 30 weeks has "PPROM" and is being managed expectantly. She suddenly develops severe, sharp abdominal pain and the FHR shows a deep variable deceleration. Diagnosis?', '["Abruption or Cord prolapse", "Normal labor", "GDM", "Previa"]', 0, 'Surgical emergencies. (Beckmann)'),
    (v_topic_id, '304: A woman with "Chronic HTN" has a fetus at 34 weeks with a BPP of 2/10. Management?', '["Repeat BPP", "Immediate delivery", "Wait until 37 weeks", "Bed rest"]', 1, 'Very low BPP warrants delivery. (ACOG)'),
    (v_topic_id, '305: "Vasa Previa" is typically diagnosed via:', '["Clinical exam", "Transvaginal ultrasound with color Doppler", "CT scan", "Digital exam"]', 1, 'Look for vessels over the internal os. (Williams)'),
    (v_topic_id, '306: A woman with "GDM" delivers a 4600g baby. The baby is at risk for which "electrolyte" imbalance?', '["Hypercalcemia", "Hypocalcemia and Hypomagnesemia", "Hypernatremia", "None"]', 1, 'Due to delayed parathyroid response in infants of diabetics. (Beckmann)'),
    (v_topic_id, '307: Why is "Magnesium Sulfate" used in a patient with PRETERM LABOR at 28 weeks even if she does NOT have pre-eclampsia?', '["To stop contractions", "For fetal neuroprotection (reduces cerebral palsy risk)", "To treat GDM", "To mature lungs"]', 1, 'Standard practice for birth < 32 weeks. (ACOG)'),
    (v_topic_id, '308: A woman at 18 weeks has a "Cervical length" of 10mm and has lost two prior pregnancies at 20 weeks. Diagnosis?', '["Pre-eclampsia", "Cervical Insufficiency", "Twins", "Normal"]', 1, 'History-indicated for cerclage. (Williams)'),
    (v_topic_id, '309: A patient with "HELLP Syndrome" has a Platelet count of 35,000. She needs an emergency C-section. What should she receive?', '["RBCs", "Platelet transfusion", "FFP", "Cryoprecipitate"]', 1, 'Goal is to maintain platelets > 50,000 for surgery. (ACOG)'),
    (v_topic_id, '310: A "Twin" pregnancy with Twin B significantly larger than Twin A and polyhydramnios in B / oligohydramnios in A. Diagnosis?', '["GDM", "Twin-to-Twin Transfusion Syndrome (TTTS)", "Vanishing twin", "Normal"]', 1, 'Monochorionic twin complication. (Williams)'),
    (v_topic_id, '311: In TTTS, the "Donor" twin is often:', '["Plethoric (red)", "Anemic and dehydrated", "Macrosomic", "Hyperglycemic"]', 1, 'Due to shunting of blood to the other twin. (Beckmann)'),
    (v_topic_id, '312: Maternal "Asthma" is associated with increased risk of:', '["Pre-eclampsia and Preterm Birth", "Diabetes", "Twins", "Post-term"]', 0, 'Especially if poorly controlled. (ACOG)'),
    (v_topic_id, '313: A 39-year-old at 32 weeks has "Painless" bleeding. Ultrasound shows the placenta is 3 cm from the os. Diagnosis?', '["Complete Previa", "Marginal/Low-lying Placenta", "Abruption", "Normal"]', 1, 'If > 2cm, it is not a previa. (ACOG)'),
    (v_topic_id, '314: "Placental Abruption" can cause which type of uterine contraction pattern?', '["Normal", "High-frequency, low-amplitude (Tachysystole)", "No contractions", "Braxton Hicks"]', 1, 'Classic "irritable" uterus. (Williams)'),
    (v_topic_id, '315: The "Kleihauer-Betke" test counts:', '["Fetal RBCs (stained pink) in maternal blood smear", "Antibodies", "WBCs", "Sugar"]', 0, 'Based on the resistance of fetal hemoglobin to acid elution. (Beckmann)'),
    (v_topic_id, '316: A woman with "Chronic HTN" is at 38 weeks. Management?', '["Delivery by 38-39 weeks", "Wait until 41 weeks", "Induction at 37 weeks", "None"]', 0, 'If well-controlled; earlier if complications. (ACOG)'),
    (v_topic_id, '317: A "Post-term" neonate often has "Dysmaturity Syndrome" which includes:', '["Excessive fat", "Loose, peeling skin, long fingernails, and wasted appearance", "Large head", "Small head"]', 1, 'Due to chronic placental insufficiency. (Williams)'),
    (v_topic_id, '318: "Bile acids" in ICP > _____ micromol/L are associated with highest risk of stillbirth.', '["10", "40", "100", "5"]', 2, 'Warrants consideration for delivery at 36 weeks or earlier. (ACOG)'),
    (v_topic_id, '319: Maternal "Cocaine" use is a major risk factor for:', '["GDM", "Placental Abruption", "Twins", "Previa"]', 1, 'Sudden vasoconstriction leads to separation. (Beckmann)'),
    (v_topic_id, '320: Most common cause of maternal "death" in the 1st trimester?', '["Abortion", "Ruptured Ectopic Pregnancy", "Preeclampsia", "Heart failure"]', 1, 'High-yield for early high-risk care. (Williams)'),
    (v_topic_id, '321: "Group B Strep" screening should be done at which weeks?', '["24-28", "36 0/7 to 37 6/7", "40", "Labor only"]', 1, 'To capture as many births as possible within the 5-week window. (CDC)'),
    (v_topic_id, '322: A patient at 28 weeks has "Pre-gestational Diabetes." What is her target A1c?', '["< 8%", "< 6-6.5% (if achievable without hypoglycemia)", "< 10%", "None"]', 1, 'Optimizing outcomes. (ACOG)'),
    (v_topic_id, '323: "Intrauterine Fetal Death" (IUFD) at 36 weeks increases maternal risk of:', '["Diabetes", "DIC (if fetus is retained for > 2-4 weeks)", "Infection", "None"]', 1, 'Due to release of thromboplastin from the dead fetus. (Williams)'),
    (v_topic_id, '324: Management of IUFD at 24 weeks?', '["Immediate surgery", "Induction of labor (preferred) or Dilation and Evacuation", "Wait until 40 weeks", "None"]', 1, 'Induction is usually safer for the mother. (ACOG)'),
    (v_topic_id, '325: "Polyhydramnios" is associated with which maternal complication during labor?', '["Atony (due to overdistension)", "Pre-eclampsia", "GDM", "Both A and C"]', 3, 'GDM causes it, and it causes atony. (Beckmann)'),
    (v_topic_id, '326: A patient has "Factor V Leiden" mutation. She should receive VTE prophylaxis:', '["Always", "Depending on history (often LMWH postpartum for 6 weeks)", "Never", "Only if she has twins"]', 1, 'Risk-stratified management. (ACOG)'),
    (v_topic_id, '327: "Peripartum Cardiomyopathy" (PPCM) usually occurs:', '["In the 1st trimester", "In the peripartum period (last month or 5 months post)", "Before pregnancy", "None"]', 1, 'A high-risk heart condition. (Williams)'),
    (v_topic_id, '328: "Apt test" (fetal hemoglobin) uses which reagent?', '["Acid", "Alkali (NaOH)", "Water", "Alcohol"]', 1, 'Fetal Hb is resistant to alkali; it stays pink. (Beckmann)'),
    (v_topic_id, '329: A patient at 38 weeks has a "Marginal" previa (edge is 1 cm from os). Management?', '["C-section mandatory", "Trial of vaginal delivery (in a facility with emergency surgical capabilities)", "Wait until 42 weeks", "None"]', 1, 'May be attempted if no bleeding. (ACOG)'),
    (v_topic_id, '330: "Umbilical Artery" resistance _____ as pregnancy progresses normally.', '["Increases", "Decreases (allows more flow to fetus)", "Stays same", "None"]', 1, 'Loss of this decrease is seen in IUGR. (Williams)'),
    (v_topic_id, '331: "MCA Doppler" PSV (Peak Systolic Velocity) increases in fetal anemia because:', '["The baby is bigger", "Blood viscosity is lower (thin blood flows faster)", "Fetal BP is high", "None"]', 1, 'Core concept of MCA Doppler. (Beckmann)'),
    (v_topic_id, '332: "Beta-methasone" takes how long to reach peak effect?', '["1 hour", "48 hours from the first dose", "1 week", "None"]', 1, 'Goal is to delay labor for this window. (ACOG)'),
    (v_topic_id, '333: A woman with "Multiple Gestation" (Twins) should have which type of scan every 2 weeks?', '["BPP", "Ultrasound for TTTS (if Monochorionic) and growth", "CT scan", "None"]', 1, 'Starting at 16 weeks for monochorionic twins. (ACOG)'),
    (v_topic_id, '334: "Placenta Percreta" means the placenta has:', '["Attached to myometrium", "Invaded into the myometrium", "Grown THROUGH the uterine wall into surrounding organs", "None"]', 2, 'Highest risk of catastrophic hemorrhage. (Williams)'),
    (v_topic_id, '335: What is the most important "High-Risk" intervention for reducing stillbirth in the 3rd trimester?', '["Bed rest", "Patient education on \"Fetal Kick Counts\" and close monitoring of high-risk conditions", "Induction for everyone", "None"]', 1, 'Empowers the mother to notice changes in fetal well-being. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for High-Risk Pregnancy registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
