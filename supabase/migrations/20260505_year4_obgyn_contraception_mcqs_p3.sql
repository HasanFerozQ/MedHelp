BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Batch 3: 121-180 (MEC Criteria, Specialized Scenarios, and Sterilization Nuances)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "MEC" Category 3 means:', '["No restriction", "Benefits outweigh risks", "Theoretical or proven risks usually outweigh benefits", "Contraindicated"]', 2, 'Clinical judgment and careful follow-up required. (CDC)'),
    (v_topic_id, '122: "Migraine WITHOUT aura" in a woman < 35. COC category?', '["1", "2", "3", "4"]', 1, 'Benefits generally outweigh risks. (CDC)'),
    (v_topic_id, '123: "Migraine WITHOUT aura" in a woman > 35. COC category?', '["1", "2", "3", "4"]', 2, 'Relative contraindication due to increased baseline stroke risk. (CDC)'),
    (v_topic_id, '124: "Breast Cancer" (current). All hormonal methods are category:', '["1", "2", "3", "4"]', 3, 'Avoid all hormones if breast cancer is active. (CDC)'),
    (v_topic_id, '125: "Systemic Lupus Erythematosus" (SLE) with "Positive Antiphospholipid Antibodies". COC category?', '["1", "2", "3", "4"]', 3, 'Extremely high risk of thrombosis. (CDC)'),
    (v_topic_id, '126: "Postpartum" (0-21 days). COC category?', '["1", "2", "3", "4"]', 3, 'Regardless of breastfeeding status, VTE risk is too high. (CDC)'),
    (v_topic_id, '127: "Postpartum" (21-42 days) WITH other VTE risk factors. COC category?', '["1", "2", "3", "4"]', 2, 'Relative contraindication. (CDC)'),
    (v_topic_id, '128: "Diabetes" with "Vascular disease" (Nephropathy/Retinopathy). COC category?', '["1", "2", "3 or 4", "None"]', 2, 'Increased risk of cardiovascular events. (CDC)'),
    (v_topic_id, '129: "IUD" - A woman has a "distorted uterine cavity" (e.g., large fibroids). IUD category?', '["1", "2", "4", "None"]', 2, 'Contraindicated due to high expulsion risk and insertion difficulty. (ACOG)'),
    (v_topic_id, '130: A woman has "Endometrial Cancer". IUD category (for initiation)?', '["1", "2", "4", "None"]', 2, 'Category 4 for initiation. (CDC)'),
    (v_topic_id, '131: "Obesity" (BMI > 30). Is any contraceptive method contraindicated based on BMI alone?', '["Yes, COCs", "No, but some may be less effective (e.g., the Patch)", "Yes, Depo", "None"]', 1, 'Category 1 or 2 for most, but counseling on efficacy is needed. (ACOG)'),
    (v_topic_id, '132: A patient has "Heavy Menstrual Bleeding" (HMB) and wants contraception. Best choice?', '["Copper IUD", "LNG-IUD (Mirena)", "Patch", "None"]', 1, 'Actually FDA-approved for the treatment of HMB. (ACOG)'),
    (v_topic_id, '133: A patient has "Dysmenorrhea" and wants to skip her periods entirely. Best approach?', '["Cyclic COCs", "Continuous use of Monophasic OCPs, Ring, or Patch", "Copper IUD", "None"]', 1, 'Prevents the withdrawal bleed and associated pain. (Beckmann)'),
    (v_topic_id, '134: "Tubal Ligation" - "Pomeroy" technique involves:', '["Crushing", "Tying a loop of tube and cutting off the top", "Bipolar cautery", "None"]', 1, 'A classic and effective method. (Williams)'),
    (v_topic_id, '135: "Tubal Ligation" - "Irving" technique is:', '["Ligation only", "Burying the proximal end of the tube in the myometrium to prevent re-canalization", "Burning", "None"]', 1, 'Very low failure rate but more complex surgery. (Beckmann)'),
    (v_topic_id, '136: "Bipolar Cautery" for tubal ligation requires cauterizing at least _____ cm of the tube.', '["1", "3", "10", "None"]', 1, 'To ensure permanent destruction. (ACOG)'),
    (v_topic_id, '137: "Post-Tubal Ligation Syndrome" (PTLS) is:', '["Proven and common", "A controversial/unproven theory that ligation causes hormonal changes or HMB", "Cancer", "None"]', 1, 'Most studies do not support its existence. (ACOG)'),
    (v_topic_id, '138: "Vasectomy" - The "Vas deferens" is reached through an incision in the:', '["Penis", "Scrotum", "Groin", "None"]', 1, 'Simple office procedure. (Beckmann)'),
    (v_topic_id, '139: "Barrier Methods" - Typical failure rate for "Withdrawal"?', '["1%", "4%", "22%", "50%"]', 2, 'Reflects the high user-dependency. (CDC)'),
    (v_topic_id, '140: "Spermicide" - Primary active ingredient in the US?', '["Vinegar", "Nonoxynol-9", "Penicillin", "None"]', 1, 'A surfactant that disrupts the sperm cell membrane. (Williams)'),
    (v_topic_id, '141: "Emergency Contraception" - "Ella" (Ulipristal) requires a _____ because it is not OTC.', '["Nurse", "Prescription", "Parent", "None"]', 1, 'Unlike Plan B, it is not available over the counter in many places. (ACOG)'),
    (v_topic_id, '142: "IUD" - A patient has "Ovarian Cysts" on ultrasound. Should the IUD be removed?', '["Yes", "No, they are often functional "disappearing" cysts and the IUD is not the cause", "Only if large", "None"]', 1, 'Functional cysts are common and usually resolve. (Beckmann)'),
    (v_topic_id, '143: "IUD" - "Intermenstrual spotting" on Mirena usually resolves within _____ months.', '["1", "3-6", "12", "None"]', 1, 'Important counseling point for the "adjustment phase." (ACOG)'),
    (v_topic_id, '144: "Nexplanon" - Is it radio-opaque?', '["No", "Yes (since 2010), so it can be seen on X-ray if not palpable", "Only in men", "None"]', 1, 'Allows for localization if it migrates or is inserted too deep. (Williams)'),
    (v_topic_id, '145: "Depo-Provera" - If the patient is < 15 weeks since last injection, can she get the next one?', '["No", "Yes, the window is 13 weeks + 2 weeks (up to 15 weeks total)", "Wait", "None"]', 1, 'The 2-week grace period. (CDC)'),
    (v_topic_id, '146: "Progestin-only" methods are preferred in patients with "Sickle Cell Disease" because:', '["They cure it", "They may reduce the frequency of sickle cell crises", "They stop bleeding", "None"]', 1, 'Mechanism not fully understood, but documented benefit. (ACOG)'),
    (v_topic_id, '147: "OCPs" and "Bone Mineral Density" (BMD)?', '["Decrease it", "May protect or increase BMD in perimenopausal women", "No effect", "None"]', 1, 'By maintaining estrogen levels. (Williams)'),
    (v_topic_id, '148: "Birth Control" and "Weight Gain": Which is the ONLY method proven to cause it?', '["Pills", "Depo-Provera (DMPA)", "IUD", "Patch"]', 1, 'Others may have anecdotal reports, but only DMPA shows a consistent link. (ACOG)'),
    (v_topic_id, '149: A 17-year-old wants an IUD but is "nulliparous" (never had kids). Can she get one?', '["No", "Yes, LARC is recommended as first-line for adolescents by ACOG", "Wait until 21", "None"]', 1, 'Nulliparity is no longer a contraindication. (ACOG)'),
    (v_topic_id, '150: "IUD" - A patient has a "Positive Chlamydia" test but is asymptomatic. Should the IUD be removed?', '["Yes", "No, treat the Chlamydia with the IUD in place", "Wait", "None"]', 1, 'Removing the IUD does not improve outcomes for the infection. (ACOG)'),
    (v_topic_id, '151: "Bilateral Tubal Ligation" - Is it "reversible"?', '["Yes, easily", "Technically yes (Tubal re-anastomosis), but it is difficult, expensive, and not guaranteed to work", "No", "None"]', 1, 'IVF is often preferred over reversal. (Beckmann)'),
    (v_topic_id, '152: "Ectopic Pregnancy" - If a patient has an IUD and an ectopic pregnancy, what is the treatment?', '["Remove IUD and observe", "Same as any other ectopic (Methotrexate or Surgery)", "Antibiotics", "None"]', 1, 'The IUD does not change the management of the ectopic itself. (ACOG)'),
    (v_topic_id, '153: "OCPs" - If a patient gets "nausea," what is the best advice?', '["Stop the pill", "Take it with food or at bedtime", "Take two", "None"]', 1, 'Helps the patient tolerate the initial cycles. (Beckmann)'),
    (v_topic_id, '154: "Breakthrough Bleeding" - If it occurs in the EARLY part of the pack, it suggests:', '["Too much estrogen", "Insufficient estrogen", "High progestin", "None"]', 1, 'May need to increase the estrogen dose. (Williams)'),
    (v_topic_id, '155: "VTE Risk" - Which progestin is associated with the highest risk (though absolute risk is still low)?', '["Levonorgestrel", "Desogestrel or Drospirenone (3rd/4th gen)", "Norethindrone", "None"]', 1, 'The "3rd generation" pill controversy. (ACOG)'),
    (v_topic_id, '156: "Copper IUD" - Does it protect against "PID"?', '["Yes", "No, and unlike COCs, it does not thin the mucus to potentially block bacteria", "Maybe", "None"]', 1, 'But it does not *increase* the long-term risk of PID either. (Williams)'),
    (v_topic_id, '157: "Vasectomy" - Failure rate compared to Tubal Ligation?', '["Higher", "Lower (Vasectomy is the most effective form of sterilization)", "Same", "None"]', 1, 'Vasectomy is ~0.15% vs Tubal ~0.5%. (ACOG)'),
    (v_topic_id, '158: "Diaphragm" - Can it be used during menses?', '["Yes", "No (risk of TSS)", "Only if small", "None"]', 1, 'Advise against use during the period. (Beckmann)'),
    (v_topic_id, '159: "Cervical Cap" - Typical use failure rate is _____ in parous women compared to nulliparous.', '["Lower", "Higher (due to changes in cervical shape after birth)", "Same", "None"]', 1, 'Fit is less reliable after vaginal delivery. (Williams)'),
    (v_topic_id, '160: "Nexplanon" - How many milligrams of etonogestrel does it contain?', '["68 mg", "10 mg", "500 mg", "None"]', 0, 'Sustained release over 3 years. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Contraception registered.';
END $$;
COMMIT;
