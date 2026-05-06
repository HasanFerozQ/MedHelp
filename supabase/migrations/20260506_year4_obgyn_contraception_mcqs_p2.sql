BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('65: Which contraceptive method is most likely to cause "weight gain" as a clinically significant side effect in some users?', '["Copper IUD", "Combined Oral Contraceptives", "Depo-Provera (DMPA)", "Nexplanon"]', 2, 'DMPA is the only method with a consistent association with weight gain (~2-3 kg/year) in a subset of users. (ACOG; Williams)'),
    
    ('66: A 16-year-old requesting contraception without parental consent. What is the standard ethical/legal approach?', '["Must notify parents", "Provide confidential care and counseling; LARCs are recommended as first-line", "Refuse treatment", "None"]', 1, 'Adolescents can consent to contraceptive services in most jurisdictions. (ACOG; AAP)'),
    
    ('67: What is the "Quick Start" method for initiating contraception?', '["Start on the first day of next period", "Start the method immediately (today) if pregnancy is reasonably excluded", "Wait until marriage", "None"]', 1, 'Increases compliance and reduces the "unprotected" window. (ACOG; CDC)'),
    
    ('68: If a patient starts COCs using the "Quick Start" method (and it is NOT day 1-5 of menses), how long should she use backup?', '["24 hours", "7 days", "14 days", "One full cycle"]', 1, 'Standard 7-day rule for all hormonal methods started mid-cycle. (ACOG; CDC)'),
    
    ('69: A postpartum woman who is "Exclusive Breastfeeding" should wait _____ before starting "Combined" OCPs.', '["24 hours", "3 weeks", "6 weeks (Category 3/4 before this due to VTE and breastfeeding impact)", "None"]', 2, 'Estrogen can interfere with milk production and increases VTE risk in the early puerperium. (ACOG; USMEC)'),
    
    ('70: A postpartum woman who is NOT breastfeeding can start "Combined" OCPs at _____ weeks if she has no other VTE risk factors.', '["1", "3", "6", "12"]', 1, 'Category 2 after 3 weeks; Category 1 after 6 weeks. (ACOG; USMEC)'),
    
    ('71: When can a "Progestin-Only" method (e.g., Nexplanon or POPs) be started postpartum?', '["Immediately (Category 1 or 2)", "Wait 6 weeks", "Wait 6 months", "None"]', 0, 'Does not significantly affect milk supply or VTE risk. (ACOG; Williams)'),
    
    ('72: "Postpartum" insertion of an IUD (within 10 minutes of placental delivery) has a higher risk of _____ compared to delayed insertion.', '["Infection", "Expulsion", "Perforation", "None"]', 1, 'Expulsion rates are ~10-25% vs ~5% for delayed insertion. (ACOG; Williams)'),
    
    ('73: Which anticonvulsant does NOT interact with hormonal contraception (i.e., is NOT an enzyme inducer)?', '["Phenytoin", "Valproic Acid / Levetiracetam / Lamotrigine", "Carbamazepine", "Phenobarbital"]', 1, 'Safe to use with any hormonal method. (ACOG; USMEC)'),
    
    ('74: Caution: "Lamotrigine" (Lamictal) levels can be SIGNIFICANTLY _____ by the estrogen in COCs.', '["Increased", "Decreased (by ~50%)", "Unchanged", "None"]', 1, 'May lead to loss of seizure control; avoid estrogen or adjust dose. (ACOG; Williams)'),
    
    ('75: A patient with "Wilson Disease" (copper metabolism disorder) should avoid:', '["Mirena IUD", "Copper IUD (ParaGard)", "Nexplanon", "None"]', 1, 'Category 4 for Copper IUD. (ACOG; USMEC)'),
    
    ('76: A woman with "Active Viral Hepatitis" or "Decompensated Cirrhosis" should avoid:', '["Condoms", "Combined Hormonal Contraceptives", "Copper IUD", "None"]', 1, 'The liver cannot metabolize the hormones effectively. (ACOG; USMEC)'),
    
    ('77: Which IUD is best for a woman who wants to keep her regular periods and avoid hormones?', '["Mirena", "Copper IUD", "Kyleena", "Skyla"]', 1, 'Non-hormonal. (Beckmann)'),
    
    ('78: A woman on "Depo-Provera" complains of "hair loss" and "mood changes." Management?', '["Reassurance", "Switch to another method (these are recognized potential side effects)", "Double the dose", "None"]', 1, 'Switching is often necessary if side effects are intolerable. (Beckmann)'),
    
    ('79: "String loss" of an IUD is first investigated with:', '["Immediate surgery", "Transvaginal Ultrasound or \"string check\" with a cytobrush", "Abdominal X-ray", "None"]', 1, 'Exclude expulsion or perforation. (ACOG; Williams)'),
    
    ('80: If IUD strings are NOT visible and ultrasound shows the IUD is "outside the uterus" in the abdomen, next step?', '["Leave it", "Laparoscopic removal", "D&C", "None"]', 1, 'Required to prevent bowel/bladder injury and adhesions. (ACOG; Williams)'),
    
    ('81: Does the "Nexplanon" implant require any laboratory testing before insertion?', '["Yes, CBC", "No, only a negative pregnancy test (if not in menses)", "Yes, Liver enzymes", "None"]', 1, 'Simple office-based procedure. (Beckmann)'),
    
    ('82: A woman with a "Bicornuate Uterus" or significant uterine distortion should AVOID:', '["Nexplanon", "Any IUD", "OCPs", "Depo-Provera"]', 1, 'Distorted cavity is a Category 4 for IUDs due to high risk of failure/expulsion. (ACOG; USMEC)'),
    
    ('83: A patient has "Actinomyces" found on a routine Pap smear. She has a Mirena IUD and is ASYMPTOMATIC. Management?', '["Remove IUD immediately", "Expectant management (leave IUD, no antibiotics if asymptomatic)", "Treat with Penicillin", "None"]', 1, 'Actinomyces is a common commensal in IUD users; treatment is only for symptomatic Pelvic Actinomycosis. (ACOG; Williams)'),
    
    ('84: "Mirena" (52mg LNG) is approved for HMB. "Kyleena" (19.5mg LNG) is primarily for:', '["HMB", "Contraception (smaller size and lower dose)", "Menopause", "None"]', 1, 'Designed for nulliparous women with smaller uteri. (Beckmann)'),
    
    ('85: A woman on COCs develops "Chloasma" (hyperpigmentation of the face). What is the cause?', '["Progesterone", "Estrogen stimulation of melanocytes", "Vitamin deficiency", "Infection"]', 1, 'Commonly known as the "mask of pregnancy." (Beckmann; Williams)'),
    
    ('86: Which COC progestin is "Least" androgenic?', '["Levonorgestrel", "Norgestimate / Desogestrel / Drospirenone", "Norethindrone", "None"]', 1, 'Third and fourth-generation progestins have fewer androgenic side effects (e.g., less acne). (Williams; Beckmann)'),
    
    ('87: "Levonorgestrel" (1st/2nd gen) is the _____ androgenic progestin.', '["Least", "Most", "Only", "None"]', 1, 'Often used in older or low-cost formulations; good for cycle control but may cause more acne. (Beckmann)'),
    
    ('88: A woman with "Diabetes Mellitus" and "Vascular Disease" (e.g., nephropathy) should AVOID:', '["Progestin-only methods", "Combined Hormonal Contraception", "Copper IUD", "None"]', 1, 'Category 3 or 4 due to high risk of cardiovascular events. (ACOG; USMEC)'),
    
    ('89: Is a "Pelvic Exam" or "Pap Smear" REQUIRED before starting COCs in a healthy 20-year-old?', '["Yes", "No, they are not necessary to safely initiate hormonal contraception", "Only if she is a virgin", "None"]', 1, 'Reduces barriers to access. (ACOG; CDC)'),
    
    ('90: What IS required before starting COCs?', '["Blood pressure measurement", "Pelvic exam", "Breast exam", "Blood tests"]', 0, 'BP is the only essential screening test. (ACOG; CDC)'),
    
    ('91: A 42-year-old healthy non-smoker with irregular menses. Can she continue COCs until menopause?', '["No, stop at 35", "Yes, healthy non-smokers can use COCs until age 50-55 to manage symptoms and provide contraception", "Only if she gets a hysterectomy", "None"]', 1, 'Beneficial for perimenopausal symptom management. (ACOG; Beckmann)'),
    
    ('92: "Combined Hormonal Contraception" decreases the risk of "Benign Breast Disease" (e.g., fibroadenomas).', '["True", "False", "Only in men", "None"]', 0, 'Protective effect on the breast tissue. (Williams; Beckmann)'),
    
    ('93: Does the IUD increase the risk of "Ectopic Pregnancy" compared to NO contraception?', '["Yes", "No, the absolute risk is MUCH lower than in women using no contraception because it is so effective at preventing all pregnancies", "Only if it falls out", "None"]', 1, 'Important to clarify the difference between relative and absolute risk. (ACOG; Williams)'),
    
    ('94: A woman on "Depo-Provera" misses her appointment and is now at 16 weeks since her last shot. Management?', '["Give shot now", "Rule out pregnancy first; then give shot and use backup for 7 days", "Wait 1 month", "None"]', 1, 'Injection is "late" if > 15 weeks since last dose. (ACOG; CDC)'),
    
    ('95: Which progestin-only method is associated with the FASTEST return to fertility?', '["Depo-Provera", "Nexplanon or Progestin-only Pills", "Mirena", "Both B and C"]', 3, 'Ovulation returns within weeks of removal/stopping. (Beckmann; ACOG)'),
    
    ('96: "Dysmenorrhea" (painful periods) is typically _____ by hormonal IUDs and _____ by the copper IUD.', '["Improved; Improved", "Improved; Worsened", "Worsened; Improved", "None"]', 1, 'Hormonal IUDs are a common treatment for dysmenorrhea. (Beckmann; Williams)'),
    
    ('97: A woman with "Endometrial Hyperplasia" without atypia. Which contraceptive could also serve as treatment?', '["Combined Patch", "Levonorgestrel IUD (Mirena)", "Copper IUD", "None"]', 1, 'High-dose local progestin reverses hyperplasia. (ACOG; Williams)'),
    
    ('98: "Emergency Contraception" (Plan B) should NOT be used as regular contraception because:', '["It causes cancer", "It is less effective than regular methods and has more side effects (nausea/spotting)", "It is too expensive", "None"]', 1, 'Back-up only. (ACOG)'),
    
    ('99: Does "Plan B" (Levonorgestrel) work if the LH surge has ALREADY occurred?', '["Yes", "No, it is primarily effective by DELAYING the LH surge; if ovulation has happened, it is likely ineffective", "Only if taken with aspirin", "None"]', 1, 'Time is of the essence. (ACOG; Williams)'),
    
    ('100: "Ulipristal" (Ella) can inhibit ovulation even AFTER the LH surge has started but before the peak.', '["True", "False", "Only in animals", "None"]', 0, 'This is why it is more effective than Plan B in the "danger window." (ACOG)'),
    
    ('101: After taking "Ulipristal" (Ella), how long should a patient WAIT before starting/restarting hormonal contraception?', '["No wait", "5 days (as hormonal methods can interfere with Ella''s mechanism)", "1 month", "None"]', 1, 'Specific counseling point for Ella. (ACOG; CDC)'),
    
    ('102: "Vasectomy" is technically simpler than "Tubal Ligation" because:', '["It is done under general anesthesia", "The vas deferens is extra-abdominal and easily accessible under local anesthesia", "It has no risks", "None"]', 1, 'Less morbidity and faster recovery. (Beckmann)'),
    
    ('103: What is the most common reason for "Tubal Ligation" failure?', '["Clip fell off", "Luteal phase pregnancy (pregnant at the time of surgery) or tuboperitoneal fistula", "Infection", "None"]', 1, 'Must rule out pregnancy before surgery. (Williams)'),
    
    ('104: A patient on COCs has persistent "spotting" in the FIRST half of the cycle. Likely cause?', '["Too much progesterone", "Insufficient estrogen (to stabilize the endometrium)", "Cancer", "None"]', 1, 'May need a higher estrogen dose. (Beckmann; Blueprints)'),
    
    ('105: A patient on COCs has "spotting" in the SECOND half of the cycle. Likely cause?', '["Too much estrogen", "Insufficient progestin", "Infection", "None"]', 1, 'May need a different progestin type or dose. (Beckmann; Blueprints)'),
    
    ('106: "Essure" was a permanent sterilization method that worked by:', '["Cutting the tubes", "Hysteroscopic placement of micro-inserts into the tubes, causing occlusion", "Freezing the tubes", "None"]', 1, 'Withdrawn from the market in 2018 due to safety concerns. (ACOG)'),
    
    ('107: "Bilateral Salpingectomy" for sterilization is increasingly preferred because:', '["It is faster", "It significantly reduces the risk of Epithelial Ovarian Cancer (which often starts in the tubes)", "It is reversible", "None"]', 1, 'Current standard of care when performing tubal sterilization. (ACOG; Williams)'),
    
    ('108: A patient with "Gestational Trophoblastic Disease" (Molar Pregnancy) should AVOID which contraceptive until hCG is zero?', '["OCPs", "IUD (risk of perforation and hemorrhage)", "Condoms", "None"]', 1, 'Hormonal methods (OCPs/Depo) are safe and preferred. (ACOG)'),
    
    ('109: "Levonorgestrel" IUDs are Category _____ in women with "Breast Cancer" in the last 5 years.', '["1", "2", "3", "4"]', 3, 'Theoretical risk of hormone-sensitive tumor stimulation. (USMEC; ACOG)'),
    
    ('110: A woman with "Endometriosis" requesting contraception. Which is a particularly good choice?', '["Copper IUD", "Combined Hormonal Contraception or Progestin-only (DMPA/IUD)", "Condoms only", "None"]', 1, 'Hormonal methods treat the underlying disease. (Beckmann; ACOG)'),
    
    ('111: "Contraceptive Vaginal Ring" (NuvaRing) is kept at _____ by the pharmacy but can be at _____ for 4 months.', '["Room temp; Fridge", "Fridge; Room temp", "Freezer; Fridge", "None"]', 1, 'Important storage instructions. (Beckmann)'),
    
    ('112: "Twirla" is a newer patch. It differs from "Xulane" in that it:', '["Is larger", "Has a lower dose of estrogen and different progestin (Levonorgestrel)", "Is daily", "None"]', 1, 'Newer formulation. (ACOG)'),
    
    ('113: A patient with "Tension Headaches" (no aura) wants COCs. Category?', '["1", "2", "3", "4"]', 0, 'Category 1; safe to use. (USMEC; ACOG)'),
    
    ('114: A patient with "Migraine WITH Aura" wants COCs. Category?', '["1", "2", "3", "4"]', 3, 'Category 4; absolutely avoided. (USMEC; ACOG)'),
    
    ('115: "Emergency Contraception" is NOT an "Abortifacient." This means:', '["It is a lie", "It prevents fertilization or ovulation; it does NOT harm an implanted embryo", "It only works in cows", "None"]', 1, 'Medical and legal distinction. (ACOG)'),
    
    ('116: "Copper IUD" for EC is _____ effective than Plan B.', '["Less", "Equally", "Significantly MORE", "None"]', 2, 'Failure rate of ~0.1% vs ~1-2% for Plan B. (ACOG; Williams)'),
    
    ('117: Which hormone is in the "Nexplanon" implant?', '["Levonorgestrel", "Etonogestrel", "Medroxyprogesterone", "None"]', 1, 'Active metabolite of desogestrel. (Beckmann)'),
    
    ('118: Is "Obesity" a contraindication to IUD use?', '["Yes", "No (Category 1)", "Only for copper", "None"]', 1, 'Excellent choice for obese women to avoid estrogen. (ACOG; USMEC)'),
    
    ('119: A 38-year-old on COCs has a "Gallbladder" stone. Management?', '["Continue", "Consider switching (estrogen increases biliary cholesterol secretion and gallstone risk)", "Surgery only", "None"]', 1, 'Estrogen is Category 3 for active gallbladder disease. (ACOG; Williams)'),
    
    ('120: "Progestin" only methods are safe for women with a history of "Benign" liver tumors.', '["True", "False (Category 3)", "Only in men", "None"]', 1, 'Both estrogen and progestin are Category 3 for hepatic adenoma/hepatoma. (USMEC; ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
