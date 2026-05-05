BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Batch 4: 181-240 (Specialized Groups and Advanced Pharmacology)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: A 15-year-old desires contraception. In most US states, can she consent WITHOUT parental permission?', '["No", "Yes (minor consent laws for reproductive health)", "Only for condoms", "None"]', 1, 'Important legal/ethical concept in adolescent medicine. (ACOG)'),
    (v_topic_id, '182: A patient is on "Anti-epileptic" drugs (e.g., Phenytoin, Carbamazepine). Preferred method?', '["OCPs", "IUD or Depo-Provera (methods not affected by liver enzymes)", "Patch", "None"]', 1, 'Ensures efficacy despite enzyme induction. (ACOG)'),
    (v_topic_id, '183: "Emergency Contraception" - Can it be used if a woman is "Breastfeeding"?', '["No", "Yes, all EC methods are safe during breastfeeding", "Only Plan B", "None"]', 1, 'Progestin-only EC has no effect on milk supply. (CDC)'),
    (v_topic_id, '184: A woman had a "Septic Abortion". When can she get an IUD?', '["Immediately", "After the infection has completely resolved and she is asymptomatic (usually 3 months)", "Never", "None"]', 1, 'High risk of worsening the infection if inserted too early. (ACOG)'),
    (v_topic_id, '185: "Perimenopause" - A woman is 48 and has irregular cycles. Why continue contraception?', '["She can''t get pregnant", "Ovulation can still occur unexpectedly until menopause is confirmed (1 year of amenorrhea)", "None", "Cancer"]', 1, 'Pregnancy in late 40s carries high maternal/fetal risk. (ACOG)'),
    (v_topic_id, '186: "OCPs" - Effect on "SHBG" (Sex Hormone Binding Globulin)?', '["Decreases", "Increases", "No effect", "None"]', 1, 'Estrogen stimulates SHBG production, which lowers free androgens. (Williams)'),
    (v_topic_id, '187: "Progestin-only" methods (DMPA) - Effect on "HDL" cholesterol?', '["Increases", "Slightly decreases", "No effect", "None"]', 1, 'Progestins can have a slightly negative effect on the lipid profile. (Beckmann)'),
    (v_topic_id, '188: "Copper IUD" - Does it contain any hormones?', '["Yes", "No", "Only a little", "None"]', 1, 'Entirely non-hormonal; relies on local inflammation. (ACOG)'),
    (v_topic_id, '189: "Levonorgestrel" (LNG) in IUDs - What is the initial daily release rate of Mirena?', '["2 mcg", "20 mcg", "100 mcg", "None"]', 1, 'Gradually decreases over several years of use. (Williams)'),
    (v_topic_id, '190: "Nexplanon" - If it is not palpable and ultrasound fails, what is the next imaging step?', '["MRI", "CT", "X-ray (it is radio-opaque)", "None"]', 2, 'Localization is mandatory before surgical removal. (Beckmann)'),
    (v_topic_id, '191: "Tubal Ligation" - "Fimbriectomy" is the removal of:', '["The whole tube", "The distal end of the tube (fimbriae)", "The ovary", "None"]', 1, 'Effective but makes reversal almost impossible. (Williams)'),
    (v_topic_id, '192: "Hysteroscopic Sterilization" (Essure) - Why was it removed from the market?', '["Inefficacy", "Adverse events (pain, allergic reactions, migration)", "Cost", "None"]', 1, 'Patient safety concerns led to its withdrawal. (ACOG)'),
    (v_topic_id, '193: "IUD" - A patient has "Endometriosis". Which IUD is preferred?', '["Copper", "LNG-IUD (Mirena)", "None", "Both"]', 1, 'Progestin helps treat endometriosis-associated pain. (ACOG)'),
    (v_topic_id, '194: "IUD" - If a patient has a "Uterine Septum," is an IUD recommended?', '["Yes", "No (distorted cavity is Category 4)", "Only if small", "None"]', 1, 'Anomalies that distort the cavity increase expulsion/perforation risk. (CDC)'),
    (v_topic_id, '195: "Depo-Provera" - Can it be given to a woman with "Current Breast Cancer"?', '["Yes", "No (Category 4)", "Only if small", "None"]', 1, 'All hormonal methods are contraindicated in active breast cancer. (CDC)'),
    (v_topic_id, '196: "OCPs" - If a patient has "Unexplained Vaginal Bleeding", can she start OCPs?', '["Yes", "No (must rule out cancer/pathology first)", "Only if young", "None"]', 1, 'Category 4 until a diagnosis is established. (CDC)'),
    (v_topic_id, '197: "Plan B" - If the patient "vomits" within 2 hours of taking the dose?', '["Wait", "Repeat the dose", "Assume it worked", "None"]', 1, 'Incomplete absorption. (ACOG)'),
    (v_topic_id, '198: "Copper IUD" - Is it effective for "Obese" women for emergency contraception?', '["No", "Yes, efficacy is NOT affected by BMI", "Only if < 25", "None"]', 1, 'Best choice for patients with BMI > 30. (ACOG)'),
    (v_topic_id, '199: "Condoms" - What is the failure rate with "PERFECT" use?', '["0.1%", "2-3%", "10%", "20%"]', 1, 'Reflects breakage or slippage even when used correctly. (CDC)'),
    (v_topic_id, '200: "Vasectomy" - Does it increase the risk of "Prostate Cancer"?', '["Yes", "No (large studies have debunked this link)", "Maybe", "None"]', 1, 'Important to reassure patients during counseling. (ACOG)'),
    (v_topic_id, '201: "Diaphragm" - Should it be used in women with a history of "Toxic Shock Syndrome"?', '["Yes", "No (avoid all barrier methods left in for long periods)", "Only if small", "None"]', 1, 'Safety precaution. (Williams)'),
    (v_topic_id, '202: "Cervical Cap" - Does it provide STI protection?', '["Yes", "No", "Only for HPV", "None"]', 1, 'Like the diaphragm, it is primarily a contraceptive. (CDC)'),
    (v_topic_id, '203: "LAM" (Breastfeeding) - Why does it fail after 6 months even if exclusively breastfeeding?', '["Milk changes", "Introduction of solids or decreased suckling frequency allowing GnRH to rise", "None", "Teething"]', 1, 'Mechanism becomes less reliable over time. (Williams)'),
    (v_topic_id, '204: "OCPs" - If a patient is taking "Griseofulvin" (Antifungal)?', '["No effect", "It may decrease OCP efficacy", "It increases efficacy", "None"]', 1, 'Enzyme-inducing drug. (ACOG)'),
    (v_topic_id, '205: "IUD" - A patient has a "Copper Allergy". Can she get a Mirena?', '["No", "Yes (Mirena contains no copper)", "Only if small", "None"]', 1, 'Hormonal IUDs are safe in copper-allergic patients. (Beckmann)'),
    (v_topic_id, '206: "Sterilization" - The "Hulka-Clemens" clip is:', '["A cautery tool", "A spring-loaded clip used to block the tube", "A ring", "None"]', 1, 'Least destructive method, higher failure rate. (Beckmann)'),
    (v_topic_id, '207: "Sterilization" - The "Falope Ring" (Yoon band) works by:', '["Burning", "Placing a silastic band over a loop of the tube", "Cutting only", "None"]', 1, 'Mechanical occlusion. (Williams)'),
    (v_topic_id, '208: "Nexplanon" - Where is it inserted?', '["The hip", "Subdermally on the non-dominant upper arm (3-4 cm above the medial epicondyle)", "In the uterus", "None"]', 1, 'Standardized anatomical location. (ACOG)'),
    (v_topic_id, '209: "Depo-Provera" - What is the concentration of the IM dose?', '["50 mg", "150 mg", "1000 mg", "None"]', 1, 'Standard 150 mg dose. (Williams)'),
    (v_topic_id, '210: "Depo-Provera" - What is the concentration of the SC dose?', '["150 mg", "104 mg", "50 mg", "None"]', 1, 'Lower dose due to better absorption in sub-q tissue. (Beckmann)'),
    (v_topic_id, '211: "OCPs" - Does it decrease "Cervical Cancer" risk?', '["Yes", "No, it may slightly INCREASE risk (potentially due to increased HPV exposure or hormonal factors)", "No effect", "None"]', 1, 'Only Gyn cancer risk that is not lowered by OCPs. (Williams)'),
    (v_topic_id, '212: "IUD" - Is there an "Age" limit for IUD use?', '["Yes, 40", "No, can be used by any woman of reproductive age (menarche to menopause)", "Only if parous", "None"]', 1, 'Standard of care. (ACOG)'),
    (v_topic_id, '213: "Quick Start" OCPs: If the patient had unprotected sex in the last 5 days?', '["Wait until next cycle", "Give Emergency Contraception (Plan B/Ella) AND start the OCPs today", "Wait 1 month", "None"]', 1, 'Maximizes prevention. (ACOG)'),
    (v_topic_id, '214: "OCPs" - Can they be used to treat "Premenstrual Dysphoric Disorder" (PMDD)?', '["No", "Yes, specifically those containing Drospirenone (e.g., Yaz)", "Only if small", "None"]', 1, 'FDA-approved for this indication. (ACOG)'),
    (v_topic_id, '215: "IUD" - If a patient has a "Current" STI (e.g., Gonorrhea). Should she get an IUD today?', '["Yes", "No, delay insertion until treatment is complete and symptoms are gone", "Wait 1 year", "None"]', 1, 'Active infection is Category 4. (CDC)'),
    (v_topic_id, '216: "OCPs" - If a patient has "Benign Breast Disease" (e.g., fibroadenoma). COC category?', '["1", "2", "3", "4"]', 0, 'No restriction. (CDC)'),
    (v_topic_id, '217: "OCPs" - A patient has "Gallbladder disease" (symptomatic). COC category?', '["1", "2", "3", "4"]', 2, 'Relative contraindication. (CDC)'),
    (v_topic_id, '218: "Emergency Contraception" - Is there a weight limit for the "Copper IUD"?', '["Yes, 200 lbs", "No, it is equally effective regardless of weight", "Only in men", "None"]', 1, 'The most reliable EC for obese women. (ACOG)'),
    (v_topic_id, '219: "IUD" - Does it increase the risk of "Infertility"?', '["Yes", "No (the Dalkon Shield history was specific to that poorly-designed device)", "Only if nulliparous", "None"]', 1, 'Modern IUDs do not affect future fertility. (ACOG)'),
    (v_topic_id, '220: "Nexplanon" - How soon after removal does fertility return?', '["1 year", "Immediately (ovulation usually occurs within weeks)", "Never", "None"]', 1, 'Rapidly reversible. (Williams)'),
    (v_topic_id, '221: "OCPs" - Are they safe for women with "Sickle Cell Trait"?', '["No", "Yes (Category 1)", "Only if small", "None"]', 1, 'Unlike sickle cell disease, there is no restriction. (CDC)'),
    (v_topic_id, '222: "IUD" - Can it be inserted at the time of "C-section"?', '["No", "Yes (Intra-cesarean IUD)", "Wait 6 weeks", "None"]', 1, 'Safe and effective, but expulsion risk is slightly higher (~10%). (ACOG)'),
    (v_topic_id, '223: "Depo-Provera" - If a patient has "severe depression", should DMPA be used?', '["Yes", "Cautiously, as it may worsen mood in some patients", "No", "None"]', 1, 'Clinical monitoring is required. (Beckmann)'),
    (v_topic_id, '224: "OCPs" - Do they cause "depression" in the majority of users?', '["Yes", "No, most studies show no clear causal link in the general population", "Always", "None"]', 1, 'Individual responses vary, but it is not a common side effect. (ACOG)'),
    (v_topic_id, '225: "Patch" - Can it be placed on the "Breast"?', '["Yes", "No (increased absorption and potential irritation)", "Only if small", "None"]', 1, 'Specifically avoided. (Beckmann)'),
    (v_topic_id, '226: "IUD" - Does "Ultrasound" confirmation of placement need to be done for EVERY insertion?', '["Yes", "No, only if the insertion was difficult or strings are not seen", "None", "Always"]', 1, 'Routine ultrasound is not cost-effective. (ACOG)'),
    (v_topic_id, '227: "Nexplanon" - "Migration" of the implant?', '["Always happens", "Extremely rare; if not palpable, it might be deep but rarely travels far unless in a vessel", "Common", "None"]', 1, 'Usually a technique issue during insertion. (Williams)'),
    (v_topic_id, '228: "IUD" - Is "Antibiotic Prophylaxis" needed before insertion?', '["Yes", "No, it does not reduce the risk of post-insertion PID", "Only in teens", "None"]', 1, 'ACOG recommendation. (ACOG)'),
    (v_topic_id, '229: "OCPs" - "First-day start": Start on the first day of menses. Benefit?', '["Faster", "Immediate contraceptive protection (no backup needed)", "No nausea", "None"]', 1, 'Standard instruction for quickest protection. (Beckmann)'),
    (v_topic_id, '230: "OCPs" - "Sunday start": Start on the first Sunday after menses. Benefit?', '["Better hormones", "Usually avoids periods on the weekend", "None", "Faster"]', 1, 'Convenience based. (Williams)'),
    (v_topic_id, '231: "Contraception" - "Dual Method" use refers to:', '["Two pills", "A highly effective method (LARC/OCP) PLUS a condom for STI prevention", "None", "Twins"]', 1, 'The gold standard for sexual health. (CDC)'),
    (v_topic_id, '232: "IUD" - A patient has "Valvular Heart Disease". Is antibiotic prophylaxis for endocarditis needed before insertion?', '["Yes", "No (AHA/ACOG guidelines no longer recommend it for Gyn procedures)", "Only if severe", "None"]', 1, 'Updated safety guidelines. (ACOG)'),
    (v_topic_id, '233: "Plan B" - Is there a "Limit" to how many times it can be used?', '["Yes, 3 times", "No, it can be used as often as needed", "Only once a year", "None"]', 1, 'Better than an unintended pregnancy. (ACOG)'),
    (v_topic_id, '234: "OCPs" - If a patient has a "Breast biopsy" (benign). COC category?', '["1", "2", "3", "4"]', 0, 'No restriction. (CDC)'),
    (v_topic_id, '235: "Nexplanon" - Can it be felt by the patient?', '["No", "Yes, she should be able to feel it under the skin to confirm it is there", "Only if it hurts", "None"]', 1, 'Self-monitoring is encouraged. (Williams)'),
    (v_topic_id, '236: "Depo-Provera" - If the patient gets "Heavy bleeding" after the first shot?', '["Stop it", "Often improves over time; can treat with short-course NSAIDs or Estrogen if persistent", "Hysterectomy", "None"]', 1, 'Management of the most common early side effect. (ACOG)'),
    (v_topic_id, '237: "Vasectomy" - Does it protect against "HIV"?', '["Yes", "No (only condoms provide significant protection)", "Only if nulliparous", "None"]', 1, 'Must still use condoms for STI prevention. (CDC)'),
    (v_topic_id, '238: "IUD" - If a patient is "under 18", do they need a parent to sign for an IUD?', '["Always", "Depends on state law, but many states allow minors to consent to contraception", "None", "No"]', 1, 'Important to know local laws. (ACOG)'),
    (v_topic_id, '239: "Copper IUD" - Can it be used for "heavy periods"?', '["Yes", "No (it usually makes them heavier)", "Only if small", "None"]', 1, 'Worsens bleeding; Mirena is the one that helps. (Beckmann)'),
    (v_topic_id, '240: "Nexplanon" - What is the failure rate?', '["1%", "0.05% (The most effective reversible method)", "5%", "None"]', 1, 'Failure is extremely rare (usually due to improper insertion). (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Contraception registered.';
END $$;
COMMIT;
