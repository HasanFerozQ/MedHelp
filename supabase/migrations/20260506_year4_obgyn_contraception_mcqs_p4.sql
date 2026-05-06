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
    ('182: A woman with "Systemic Lupus Erythematosus" (SLE) with NO antiphospholipid antibodies and stable disease wants COCs. Category?', '["1", "2", "3", "4"]', 1, 'Category 2; generally safe but requires monitoring. If APLA positive, it is Category 4. (USMEC; ACOG)'),
    
    ('183: A woman undergoing "Solid Organ Transplant" (uncomplicated) wants an IUD. Category?', '["1", "2", "3", "4"]', 1, 'Category 2 for initiation; Category 1 for continuation. (USMEC; ACOG)'),
    
    ('184: "Cervical Shock" during IUD insertion is caused by:', '["Pain", "Vasovagal response due to cervical manipulation, leading to bradycardia and hypotension", "Blood loss", "Allergy"]', 1, 'Can be managed with atropine if severe, but usually self-resolves with stopping the procedure. (Williams; Comprehensive Gynecology)'),
    
    ('185: A woman with "Bariatric Surgery" (Malabsorptive, e.g., Roux-en-Y) should AVOID which contraceptive due to decreased absorption?', '["IUD", "Oral Contraceptives (COCs and POPs)", "Patch", "Nexplanon"]', 1, 'Category 3; the bypass of the small intestine reduces drug levels. (USMEC; ACOG)'),
    
    ('186: "Depo-Provera" (DMPA) is associated with a "reversible" decrease in BMD. Which population warrants the most caution?', '["Postmenopausal women", "Adolescents (during peak bone mass accumulation) and perimenopausal women", "Athletes", "None"]', 1, 'BMD usually recovers after stopping DMPA. (ACOG; Williams)'),
    
    ('187: Does "DMPA" use increase the risk of "Bone Fractures"?', '["Yes, 5-fold", "No, large studies have not shown an increased risk of clinical fractures", "Only in men", "None"]', 1, 'ACOG supports the use of DMPA beyond 2 years in most healthy women. (ACOG)'),
    
    ('188: A woman with "Endometrial Cancer" (awaiting surgery) wants an IUD. Category?', '["1", "2", "3", "4"]', 3, 'Category 4 for initiation; any distorting or malignant intrauterine condition precludes IUD placement. (USMEC; ACOG)'),
    
    ('189: A woman with "Active Pelvic Tuberculosis" wants an IUD. Category?', '["1", "2", "3", "4"]', 3, 'Category 4; risk of worsening infection. (USMEC; ACOG)'),
    
    ('190: "Combined Hormonal Contraception" is Category _____ for women with a history of "Benign Ovarian Teratoma."', '["1", "2", "3", "4"]', 0, 'Safe to use; may even reduce the risk of future functional cysts. (USMEC; ACOG)'),
    
    ('191: A woman on "Nexplanon" has a "lost" (non-palpable) implant. Ultrasound is negative. What lab can confirm the presence of the rod in the body?', '["hCG", "Serum Etonogestrel level", "LH", "FSH"]', 1, 'Confirmation of systemic hormone levels can help determine if the rod is present but deep or truly not inserted. (ACOG; Williams)'),
    
    ('192: A "Lost IUD" that is NOT seen on US or X-ray but the patient did not notice an expulsion is likely:', '["Dissolved", "Expelled (silent expulsion)", "Migrated to the brain", "None"]', 1, 'Silent expulsion is more common than intra-abdominal migration. (Beckmann; Williams)'),
    
    ('193: "Perfect Use" failure rate for COCs is _____% while "Typical Use" is _____%', '["0.1; 0.1", "0.3; 7-9", "5; 20", "None"]', 1, 'Difference is due to human error (missed pills). (CDC; Beckmann)'),
    
    ('194: "IUD strings" that were previously visible are now missing. The most common reason is:', '["Perforation", "Pregnancy causing uterine enlargement and string retraction", "Strings curled up into the cervical canal", "None"]', 2, 'Often found with a cytobrush or ultrasound. (Williams; Beckmann)'),
    
    ('195: A woman with a "Copper IUD" and "Severe Anemia" (Hgb 7.0). Category?', '["1", "2", "3", "4"]', 1, 'Category 2; must weigh the benefit against the risk of increased blood loss. (USMEC; ACOG)'),
    
    ('196: Which progestin-only method is most appropriate for a woman with a history of "Bipolar Disorder" on multiple medications?', '["OCPs", "IUD or Implant (avoids GI absorption issues and many drug-drug interactions)", "Condoms", "None"]', 1, 'Non-oral methods are generally safer with complex polypharmacy. (ACOG; Williams)'),
    
    ('197: Does "Combined Oral Contraception" cause "Birth Defects" if taken accidentally during early pregnancy?', '["Yes", "No, large epidemiologic studies show no increased risk of major malformations", "Only if taken for 9 months", "None"]', 1, 'Reassure the patient who inadvertently took the pill before a positive test. (ACOG; Williams)'),
    
    ('198: A woman on "Depo-Provera" wants to switch to "Nexplanon." When can she have it inserted?', '["Wait 3 months", "Immediately (within the DMPA window) or any time if pregnancy is ruled out", "Wait for menses", "None"]', 1, 'Quick start applies. (ACOG; CDC)'),
    
    ('199: "Levonorgestrel" (Plan B) is MOST effective if taken within _____ hours.', '["12", "72", "120", "None"]', 1, 'Efficacy decreases with time. (ACOG)'),
    
    ('200: A woman with "Active Migraine WITHOUT Aura" starts COCs. Her headaches worsen in frequency and severity. Management?', '["Continue", "Discontinue COCs and switch to a progestin-only method (worsening migraine can be a red flag)", "Increase dose", "None"]', 1, 'Clinical judgment is required if symptoms change significantly. (ACOG; Williams)'),
    
    ('201: "Combined Hormonal Contraception" and "Gallbladder" disease: Estrogen _____ the saturation of bile with cholesterol.', '["Decreases", "Increases", "Does not affect", "None"]', 1, 'Mechanism for increased lithogenicity. (Williams)'),
    
    ('202: A woman with "Cystic Fibrosis" wants contraception. Which is generally preferred?', '["OCPs", "LARC (due to frequent antibiotics and potential for malabsorption)", "NFP", "None"]', 1, 'Maximizes effectiveness in a medically complex patient. (ACOG)'),
    
    ('203: "Barrier" methods (condoms) have a typical use failure rate of about _____%', '["2", "13-18", "30", "50"]', 1, 'Much higher than hormonal methods due to inconsistent use/breakage. (CDC; Beckmann)'),
    
    ('204: A woman has an IUD and develops "PID." The CDC recommends:', '["Immediate IUD removal", "Antibiotics; leave the IUD in place and re-evaluate in 48-72 hours (remove ONLY if no improvement)", "Surgery", "None"]', 1, 'IUD removal does not hasten clinical recovery from PID. (ACOG; CDC)'),
    
    ('205: "Nexplanon" side effect: "Unscheduled bleeding" is the most common reason for removal. What percentage of women remove it for this reason within 1 year?', '["1%", "10-15%", "50%", "None"]', 1, 'Requires thorough pre-insertion counseling. (Beckmann; Williams)'),
    
    ('206: A woman with "Factor V Leiden" (heterozygous) and NO history of VTE. Category for COCs?', '["1", "2", "3", "4"]', 3, 'Category 4; known thrombogenic mutation even without a prior event. (USMEC; ACOG)'),
    
    ('207: "Copper IUD" and "MRI": Is it safe?', '["No", "Yes, most modern IUDs are MRI-conditional (check specific device instructions)", "Only at 0.5T", "None"]', 1, 'Standard copper and hormonal IUDs are safe in typical MRI settings. (Williams)'),
    
    ('208: "Progestin-Only" injectable (DMPA) and "Weight Gain": Which group is at highest risk for significant gain?', '["Women with low baseline BMI", "Women who gain > 5% of their body weight in the first 6 months of use", "Athletes", "None"]', 1, '"Early gainers" are likely to continue gaining. (ACOG; Williams)'),
    
    ('209: "Levonorgestrel" (Mirena) IUD and "Ectopic Pregnancy" risk: If a woman gets pregnant with the IUD in place, the probability of it being ectopic is _____%', '["1%", "10%", "~50%", "100%"]', 2, 'High relative risk, though absolute risk is very low. (ACOG; Williams)'),
    
    ('210: "Tubal Ligation" reduces the risk of "Ovarian Cancer" by approximately:', '["0%", "10%", "30-50%", "None"]', 2, 'Known protective effect, especially with salpingectomy. (ACOG; Williams)'),
    
    ('211: "Spermicide" (Nonoxynol-9) may _____ the risk of HIV transmission if used multiple times a day.', '["Decrease", "Increase (due to vaginal/rectal irritation/epithelial disruption)", "Not affect", "None"]', 1, 'Not recommended for women at high risk for HIV. (ACOG; CDC)'),
    
    ('212: A woman with "History of Breast Cancer" > 5 years ago and currently disease-free. Category for COCs?', '["1", "2", "3", "4"]', 2, 'Category 3; progestin-only is also Category 3. (USMEC; ACOG)'),
    
    ('213: A woman with "Cervical Cancer" (initiation of IUD). Category?', '["1", "2", "3", "4"]', 3, 'Category 4. (USMEC; ACOG)'),
    
    ('214: "DMPA" and "Efficacy": Does a high BMI reduce its effectiveness?', '["Yes", "No, DMPA efficacy is not affected by BMI", "Only in men", "None"]', 1, 'Reliable for obese patients. (ACOG; Williams)'),
    
    ('215: "Hysteroscopic" sterilization (Essure) required a follow-up "HSG" at _____ months.', '["1", "3", "6", "12"]', 1, 'To confirm complete tubal occlusion. (ACOG)'),
    
    ('216: "Pomerooy Method" of tubal ligation involves:', '["A clip", "A tie and cut (excision of a knuckle of tube)", "Burning", "None"]', 1, 'Classic "mid-ampullary" technique. (Williams; Beckmann)'),
    
    ('217: "Irving Method" of tubal ligation involves:', '["Bipolar", "Burying the proximal tube stump into the myometrium", "Removing the ovary", "None"]', 1, 'High efficacy but technically more complex. (Williams)'),
    
    ('218: "Uchida Method" of tubal ligation involves:', '["Subserosal dissection", "Burying the stump in the broad ligament", "Neither", "None"]', 1, 'Very low failure rate. (Williams)'),
    
    ('219: A patient has an IUD and wants it removed. She has had intercourse in the last 5 days. Management?', '["Remove now", "Consider emergency contraception or delaying removal until menses (sperm can live 5 days and lead to pregnancy after IUD is out)", "Remove and pray", "None"]', 1, 'Crucial safety step in removal. (ACOG; Williams)'),
    
    ('220: "Nexplanon" is radiopaque. This means:', '["It glows in the dark", "It can be seen on an X-ray", "It is made of glass", "None"]', 1, 'Helps in locating deep/lost implants. (Beckmann)'),
    
    ('221: "Pelvic Congestion Syndrome" may have worsening pain with which method?', '["IUD", "COCs", "Condoms", "None"]', 0, 'Uterine device might exacerbate chronic pelvic pain. (Comprehensive Gynecology)'),
    
    ('222: "Copper IUD" and "Menses": Expected change?', '["Lighter", "Heavier and longer", "Amenorrhea", "None"]', 1, 'Most common reason for removal of ParaGard. (Beckmann)'),
    
    ('223: "IUD" and "Nulliparity": Is nulliparity a contraindication?', '["Yes", "No, IUDs are safe and highly recommended for nulliparous women", "Only for Mirena", "None"]', 1, 'The "nulliparous woman is high risk" idea is obsolete. (ACOG)'),
    
    ('224: "Progestin-Only" pills (Minipills) are _____ effective than COCs with "Typical Use."', '["More", "Less (due to strict timing requirements)", "Equally", "None"]', 1, 'Failure rates are higher if pills are missed by > 3 hours. (Beckmann; ACOG)'),
    
    ('225: "Combined Hormonal Contraception" risk of VTE is _____ than the risk of VTE in pregnancy.', '["Higher", "Lower", "Equal", "None"]', 1, 'Pregnancy is a MUCH higher pro-thrombotic state than any COC. (ACOG; Williams)'),
    
    ('226: "Estrogen" type in most modern COCs is _____ and the dose is _____ than in the 1960s.', '["Estradiol; higher", "Ethinyl Estradiol; lower (20-35 mcg vs 50+ mcg)", "Estrone; higher", "None"]', 1, '"Low-dose" pills have improved the safety profile. (Williams)'),
    
    ('227: A woman on COCs has a "Withdrawal Bleed." This is NOT a "Period" because:', '["It is fake", "It is caused by the drop in hormones during the placebo week, not the natural HPO axis", "It is only water", "None"]', 1, 'Physiological distinction. (Beckmann; Williams)'),
    
    ('228: "Extended Cycle" COCs (e.g., Seasonique) provide how many withdrawal bleeds per year?', '["12", "4", "0", "None"]', 1, 'Pills taken for 84 days followed by a week break. (Beckmann)'),
    
    ('229: "Continuous" COC use (no placebo week) is safe.', '["True", "False", "Only in athletes", "None"]', 0, 'Highly effective for endometriosis and PMDD. (ACOG)'),
    
    ('230: A woman with "Anorexia Nervosa" on COCs. Will the "Estrogen" protect her bone density?', '["Yes", "No, COCs do NOT restore bone density in anorexic patients and may mask the amenorrhea", "Only if she eats", "None"]', 1, 'Treatment must address the underlying nutritional deficit. (ACOG; Williams)'),
    
    ('231: "IUD" strings: If strings are too long and causing "partner''s discomfort", management?', '["Remove IUD", "Trim strings shorter or tuck them into the cervical canal", "Tell partner to deal with it", "None"]', 1, 'Simple office adjustment. (Beckmann)'),
    
    ('232: "Copper" IUD acts as a "Spermicide" by:', '["Stabbing the sperm", "Copper ions being toxic to sperm and causing an inflammatory reaction in the uterus", "Blocking the door", "None"]', 1, 'Primary mechanism. (Williams)'),
    
    ('233: A woman has an IUD and becomes pregnant. "Ectopic" pregnancy is ruled out. If she keeps the pregnancy, she is at increased risk for:', '["Birth defects", "Septic abortion and Preterm delivery", "Twins", "None"]', 1, 'Removal is recommended if strings are visible. (ACOG; Williams)'),
    
    ('234: "Sterilization" Regret: Is it more common in women or men?', '["Men", "Women (especially if done under age 30)", "Equal", "None"]', 1, 'Reflected in the CREST study data. (Williams)'),
    
    ('235: A woman with "PCOS" and "Hirsutism" on COCs. How long until she sees a reduction in hair growth?', '["1 week", "1 month", "6-12 months (due to the hair growth cycle)", "Never"]', 2, 'Patience is required for anti-androgenic effects. (Beckmann; Williams)'),
    
    ('236: "Depo-Provera" (DMPA) and "Acne": Does it help?', '["Yes", "No, DMPA (a progestin-only method) may actually WORSEN acne in some users", "Only in teens", "None"]', 1, 'Unlike COCs which improve it. (Beckmann)'),
    
    ('237: A woman with "Sickle Cell Trait." Category for COCs?', '["1", "2", "3", "4"]', 0, 'Category 1; trait is not a contraindication. (USMEC; ACOG)'),
    
    ('238: "Nexplanon" and "Surgery": Does it need to be removed before elective surgery?', '["Yes", "No", "Only for brain surgery", "None"]', 1, 'No increased VTE risk compared to general population. (ACOG)'),
    
    ('239: "IUD" and "Nulliparity": "Pain" at insertion is often _____ than in multiparous women.', '["Lower", "Higher (may benefit from NSAIDs or paracervical block)", "Same", "None"]', 1, 'Cervical stenosis may be a factor. (ACOG)'),
    
    ('240: "Emergency Contraception" (Plan B) can be taken _____ during a single cycle if needed.', '["Only once", "Multiple times (though regular contraception is preferred)", "Once a year", "None"]', 1, 'No medical limit. (ACOG)');

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
