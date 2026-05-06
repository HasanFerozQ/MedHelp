BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- Check if topic exists, otherwise create it
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    
    -- Cleanup: Safely merge any existing caseblocks/MCQs from the duplicate topic before removing it
    UPDATE mcqs 
    SET topic_id = (SELECT id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1)
    WHERE topic_id = (SELECT id FROM topics WHERE slug = 'obgyn-contraception-family-planning' LIMIT 1)
    AND EXISTS (SELECT 1 FROM topics WHERE slug = 'obgyn-contraception');

    DELETE FROM topics WHERE slug = 'obgyn-contraception-family-planning';

    IF v_topic_id IS NULL THEN
        INSERT INTO topics (title, slug, section, year_id) 
        VALUES ('Contraception & Family Planning', 'obgyn-contraception', 'Obstetrics & Gynecology', 4)
        RETURNING id INTO v_topic_id;
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates without a global constraint
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('1: Which of the following is the MOST effective form of reversible contraception (Tier 1)?', '["Male Condom", "Combined Oral Contraceptive Pill", "LARC (IUD or Implant)", "Diaphragm"]', 2, 'Long-Acting Reversible Contraception (LARC) has < 1% failure rate with typical use. (ACOG; Beckmann)'),
    
    ('2: What is the "Pearl Index"?', '["A measure of infant mortality", "The number of unintended pregnancies per 100 woman-years of exposure", "The cost of contraception", "None"]', 1, 'Standard method for comparing the efficacy of contraceptive methods. (Williams; Beckmann)'),
    
    ('3: For the "Lactational Amenorrhea Method" (LAM) to be effective, which three criteria must be met?', '["Exclusive breastfeeding, amenorrhea, and < 6 months postpartum", "Feeding every 12 hours, period returned, < 1 year postpartum", "Any breastfeeding, no period, < 2 years", "None"]', 0, 'High efficacy (~98%) if all three criteria are strictly followed. (ACOG; Williams)'),
    
    ('4: The "Standard Days Method" of fertility awareness is appropriate for women with cycles lasting:', '["20-25 days", "26-32 days", "35-45 days", "Any length"]', 1, 'Specifically designed for women with regular cycles in this range. (Beckmann; Williams)'),
    
    ('5: Which contraceptive method provides the BEST protection against STIs (including HIV)?', '["IUD", "Male Latex Condom", "OCPs", "Diaphragm"]', 1, 'Condoms are the only method proven to significantly reduce STI transmission. (ACOG; Blueprints)'),
    
    ('6: "Spermicides" (e.g., Nonoxynol-9) work primarily by:', '["Blocking sperm", "Disrupting the sperm cell membrane", "Killing the egg", "None"]', 1, 'Often used in conjunction with barrier methods. (Beckmann)'),
    
    ('7: A patient using a "Diaphragm" should be counseled to leave it in place for at least _____ hours after intercourse.', '["1", "6", "12", "24"]', 1, 'Must remain for 6 hours but no more than 24 hours (risk of TSS). (Beckmann; Blueprints)'),
    
    ('8: Which barrier method MUST be fitted by a healthcare provider and refitted after a 10-lb weight change or pregnancy?', '["Male condom", "Diaphragm", "Spermicide", "None"]', 1, 'Proper fit is essential for efficacy. (Beckmann; Williams)'),
    
    ('9: The "Cervical Cap" (e.g., FemCap) differs from the diaphragm in that it:', '["Is larger", "Fits snugly over the cervix itself and can be left for 48 hours", "Does not need spermicide", "None"]', 1, 'Smaller and provides a tighter seal. (Williams)'),
    
    ('10: Which of the following is a potential risk associated with leaving a diaphragm or cervical cap in for > 24-48 hours?', '["Infertility", "Toxic Shock Syndrome (TSS)", "Ectopic pregnancy", "None"]', 1, 'Related to prolonged presence of the device and bacteria (S. aureus). (Beckmann)'),
    
    ('11: What is the PRIMARY mechanism of action of Combined Oral Contraceptives (COCs)?', '["Thickening cervical mucus", "Suppression of ovulation via inhibition of LH and FSH", "Thinning the endometrium", "Blocking the tubes"]', 1, 'Prevents the mid-cycle LH surge. (ACOG; Beckmann)'),
    
    ('12: "Estrogen" in COCs primarily serves to:', '["Prevent ovulation by suppressing FSH and provide cycle control", "Increase libido", "Prevent STIs", "None"]', 0, 'FSH suppression prevents follicle recruitment. (Williams; Beckmann)'),
    
    ('13: "Progestin" in COCs contributes to efficacy by:', '["Thickening cervical mucus (sperm barrier)", "Altering endometrial receptivity", "Suppressing the LH surge", "All of the above"]', 3, 'Progestins provide multi-modal protection. (Williams; Blueprints)'),
    
    ('14: Which of the following is a "Category 4" (absolute contraindication) for Estrogen-containing contraceptives according to USMEC?', '["Age > 35 and smoking < 15 cigarettes/day", "Current breast cancer", "Controlled hypertension", "Diabetes without vascular disease"]', 1, 'Estrogen-sensitive tumor. (ACOG; USMEC)'),
    
    ('15: A 37-year-old woman smokes 20 cigarettes per day. Which method is ABSOLUTELY contraindicated?', '["Copper IUD", "Nexplanon", "Combined Hormonal Patch (Xulane)", "Depo-Provera"]', 2, 'Women > 35 who smoke >= 15 cigs/day should not use estrogen due to high VTE/stroke risk. (ACOG; USMEC)'),
    
    ('16: Which of the following is a Category 4 contraindication for COCs?', '["Migraine WITH aura at any age", "Migraine WITHOUT aura, age < 35", "Family history of VTE", "Breastfeeding at 6 months"]', 0, 'Increased risk of ischemic stroke. (ACOG; USMEC)'),
    
    ('17: A patient on COCs for 2 years has high blood pressure (165/105) on two separate visits. Next step?', '["Increase COC dose", "Discontinue COCs and switch to a progestin-only or non-hormonal method", "Add blood pressure meds and continue COCs", "None"]', 1, 'Hypertension > 160/100 is a Category 4 for estrogen. (ACOG; Williams)'),
    
    ('18: Which COC "progestin" has mineralocorticoid-blocking properties (similar to spironolactone) and can cause hyperkalemia?', '["Levonorgestrel", "Norethindrone", "Drospirenone", "Desogestrel"]', 2, 'Found in Yaz/Yasmin; check K+ if on other K-sparing drugs. (Williams; Beckmann)'),
    
    ('19: "Breakthrough bleeding" (BTB) on COCs is most common in:', '["The first 3 months of use", "After 5 years", "During pregnancy", "None"]', 0, 'Usually resolves as the endometrium adjusts; counsel patients to wait. (Beckmann; ACOG)'),
    
    ('20: If a patient misses ONE "active" pill of her COC, what is the recommended advice?', '["Take it as soon as noticed and the next one as scheduled; no backup needed", "Wait until next cycle", "Take 2 today, 2 tomorrow; use backup for 7 days", "Emergency contraception now"]', 0, 'One missed pill (even if taking two at once) does not significantly reduce efficacy. (ACOG; CDC)'),
    
    ('21: If a patient misses TWO or more "active" pills of her COC (in weeks 1 or 2), what is the advice?', '["Take the most recent missed pill, discard others, continue pack, and use BACKUP for 7 days", "Restart the whole pack", "Take all missed pills at once", "None"]', 0, 'Backup is required after 48 hours of no hormones. (ACOG; CDC)'),
    
    ('22: Which of the following drugs can DECREASE the effectiveness of COCs by inducing hepatic enzymes (CYP3A4)?', '["Rifampin", "Anticonvulsants (e.g., Carbamazepine, Phenytoin)", "St. John''s Wort", "All of the above"]', 3, 'Requires counseling on alternative methods. (Williams; Beckmann)'),
    
    ('23: Does the use of "broad-spectrum antibiotics" (e.g., Amoxicillin) significantly reduce the efficacy of COCs?', '["Yes, always use backup", "No, evidence does not support a clinical interaction for most antibiotics (except Rifampin)", "Only in the first week", "None"]', 1, 'A common clinical misconception; backup is generally not required unless GI upset occurs. (ACOG; CDC)'),
    
    ('24: Which "Combined Hormonal" method is a weekly transdermal patch?', '["NuvaRing", "Xulane / Twirla", "Depo-Provera", "Nexplanon"]', 1, 'Applied for 3 weeks, followed by a patch-free week. (Beckmann)'),
    
    ('25: The "Combined Hormonal Patch" has a higher risk of _____ compared to COCs because of higher steady-state estrogen levels.', '["Weight gain", "Venous Thromboembolism (VTE)", "Acne", "Infertility"]', 1, 'FDA warning regarding total estrogen exposure. (ACOG; Williams)'),
    
    ('26: In which patient population is the contraceptive "Patch" LESS effective?', '["Women > 35", "Women weighing > 90 kg (198 lbs)", "Smokers", "Teens"]', 1, 'Decreased efficacy in obese patients. (Beckmann; Blueprints)'),
    
    ('27: The "Vaginal Ring" (NuvaRing) is left in the vagina for _____ weeks and removed for _____ weeks.', '["1; 1", "3; 1", "4; 0", "None"]', 1, 'Allows for a withdrawal bleed. (Beckmann)'),
    
    ('28: If the vaginal ring (NuvaRing) is out of the vagina for > _____ hours, a backup method is needed for 7 days.', '["1", "3", "24", "48"]', 1, 'If < 3 hours, just rinse and reinsert. (ACOG; CDC)'),
    
    ('29: "Non-contraceptive benefits" of COCs include a SIGNIFICANT reduction in the risk of which cancers?', '["Ovarian and Endometrial cancer", "Cervical cancer", "Breast cancer", "None"]', 0, 'Risk reduction persists for years after stopping. (ACOG; Williams)'),
    
    ('30: COCs reduce "Ovarian Cancer" risk by approximately _____ after 10 years of use.', '["10%", "30%", "50%", "80%"]', 2, 'One of the most significant protective effects. (Beckmann)'),
    
    ('31: Why are COCs protective against "Endometrial Cancer"?', '["They kill cancer cells", "Progestin causes endometrial atrophy and prevents hyperplasia", "They block estrogen receptors", "None"]', 1, 'Consistent progestin exposure prevents "unopposed" estrogen. (Williams; Beckmann)'),
    
    ('32: A woman on COCs has a reduction in which menstrual symptom?', '["Menorrhagia (heavy flow)", "Dysmenorrhea (pain)", "PMS/PMDD symptoms", "All of the above"]', 3, 'Highly effective for managing menstrual disorders. (Beckmann; Blueprints)'),
    
    ('33: Is "weight gain" a proven side effect of Combined Oral Contraceptives?', '["Yes, average 10 lbs", "No, large meta-analyses show no significant weight gain for most users", "Only in the first month", "None"]', 1, 'A common myth, though individual perception varies. (ACOG; Cochrane Review)'),
    
    ('34: "Progestin-Only Pills" (POPs / Minipills) are often preferred for:', '["Women who are breastfeeding", "Women with contraindications to estrogen", "Smokers > 35", "All of the above"]', 3, 'Estrogen-free options have fewer cardiovascular risks. (ACOG; Beckmann)'),
    
    ('35: What is the CRITICAL counseling point for "Progestin-Only Pills" (Norethindrone)?', '["They must be taken at the EXACT same time every day (within 3 hours)", "They cause weight gain", "You must skip menses", "None"]', 0, 'Short half-life; if > 3 hours late, backup is needed for 48 hours. (Beckmann; ACOG)'),
    
    ('36: Mechanism of "Progestin-Only Pills" (Minipills)?', '["Always suppress ovulation", "Primarily thicken cervical mucus and thin the endometrium (ovulation occurs in ~40% of cycles)", "Block the tubes", "None"]', 1, 'Less reliable at ovulation suppression than COCs. (Williams; Beckmann)'),
    
    ('37: "Depo-Provera" (DMPA) is an injectable progestin given every _____ weeks.', '["4", "8", "12-13", "24"]', 2, 'Highly effective Tier 2 method. (Beckmann)'),
    
    ('38: A common and often bothersome side effect of "Depo-Provera" in the first 6 months is:', '["Heavy bleeding", "Irregular spotting or unscheduled bleeding", "Hair loss", "None"]', 1, 'Counseling is key to prevent discontinuation. (ACOG; Blueprints)'),
    
    ('39: After 1 year of "Depo-Provera" use, approximately 50% of women experience:', '["Permanent infertility", "Amenorrhea (complete absence of menses)", "Weight loss", "Heavy cycles"]', 1, 'Often perceived as a benefit by users. (Beckmann; Williams)'),
    
    ('40: "Depo-Provera" has an FDA black box warning regarding:', '["Liver failure", "Reversible decrease in Bone Mineral Density (BMD)", "Cancer", "None"]', 1, 'Generally not a reason to limit use to < 2 years in healthy women. (ACOG)'),
    
    ('41: What is the typical delay in return to fertility after DISCONTINUING "Depo-Provera"?', '["1 month", "Average 9-10 months (up to 18 months)", "Immediately", "Never"]', 1, 'Important counseling for women planning pregnancy soon. (Beckmann; ACOG)'),
    
    ('42: "Nexplanon" is a single-rod contraceptive implant containing which progestin?', '["Levonorgestrel", "Etonogestrel", "Norethindrone", "None"]', 1, 'The most effective reversible method available. (Beckmann)'),
    
    ('43: How long is the "Nexplanon" implant FDA-approved for?', '["1 year", "3 years", "5 years", "10 years"]', 1, 'Though data suggests it may be effective for longer. (ACOG)'),
    
    ('44: Which of the following is TRUE regarding the "Copper IUD" (ParaGard)?', '["It is hormonal", "It is 100% non-hormonal and highly effective for 10 years", "It prevents ovulation", "None"]', 1, 'Copper ions are spermicidal. (Beckmann; Williams)'),
    
    ('45: A common side effect of the "Copper IUD" that leads to discontinuation is:', '["Amenorrhea", "Increased menstrual bleeding and cramping (dysmenorrhea)", "Weight gain", "Acne"]', 1, 'Unlike hormonal IUDs which reduce flow. (Blueprints; Beckmann)'),
    
    ('46: "Levonorgestrel IUDs" (e.g., Mirena, Kyleena) are approved for how long?', '["1 year", "3-8 years (depending on the specific device)", "10 years", "None"]', 1, 'Mirena is now approved for up to 8 years for contraception. (ACOG; FDA)'),
    
    ('47: Mechanism of the "Levonorgestrel IUD"?', '["Primarily thickens cervical mucus and causes endometrial decidualization/atrophy", "Always stops ovulation", "Blocks the tubes with plastic", "None"]', 0, 'Most users still ovulate. (Beckmann; Williams)'),
    
    ('48: Which IUD is specifically FDA-approved for the treatment of Heavy Menstrual Bleeding (HMB)?', '["ParaGard", "Mirena", "Skyla", "None"]', 1, 'Reduces menstrual blood loss by ~90%. (ACOG; Beckmann)'),
    
    ('49: Risk of "uterine perforation" during IUD insertion is approximately:', '["1 in 10", "1 in 100", "1 in 1,000", "1 in 10,000"]', 2, 'Higher in the immediate postpartum/breastfeeding period. (ACOG; Williams)'),
    
    ('50: Does the IUD increase the overall risk of Pelvic Inflammatory Disease (PID)?', '["Yes, 10-fold", "No, the risk is only slightly increased in the first 20 days post-insertion; after that, it matches the general population", "Only in virgins", "None"]', 1, 'The IUD itself is not a risk factor for PID. (ACOG; CDC)'),
    
    ('51: If a woman becomes pregnant with an IUD in place, she is at increased risk for:', '["Twins", "Ectopic pregnancy (relative risk)", "Placenta previa", "None"]', 1, 'While the IUD prevents most pregnancies, if it fails, a higher proportion are ectopic. (ACOG; Williams)'),
    
    ('52: What is the management of a pregnant woman found to have an IUD with "visible strings" in the first trimester?', '["Leave it", "Remove the IUD immediately to reduce the risk of miscarriage and infection", "Terminate pregnancy", "None"]', 1, 'Reduces risk of septic abortion. (ACOG; CDC)'),
    
    ('53: "Emergency Contraception" (EC) works by:', '["Causing an abortion", "Delaying or inhibiting ovulation", "Blocking implantation", "None"]', 1, 'EC does NOT disrupt an established pregnancy. (ACOG)'),
    
    ('54: "Plan B" (Levonorgestrel 1.5 mg) is most effective when taken within _____ hours of intercourse.', '["24", "72", "120", "None"]', 1, 'Available over-the-counter. (Beckmann)'),
    
    ('55: "Ulipristal acetate" (Ella) is an EC method that is more effective than Plan B, especially in women with:', '["High BMI", "Regular cycles", "Teens", "None"]', 0, 'Effective up to 120 hours (5 days). (ACOG)'),
    
    ('56: What is the MOST effective form of emergency contraception overall?', '["Plan B", "Copper IUD insertion within 5 days", "Ella", "High-dose OCPs"]', 1, 'Failure rate < 0.1%. (ACOG; Williams)'),
    
    ('57: "Sterilization" (Tubal Ligation) should be considered _____ and _____ in all cases.', '["Temporary; reversible", "Permanent; irreversible", "Hormonal; surgical", "None"]', 1, 'Crucial patient counseling. (Beckmann)'),
    
    ('58: Which tubal sterilization technique involves removing the entire fallopian tube?', '["Essure", "Bilateral Salpingectomy", "Pomerooy method", "Filshie clips"]', 1, 'Preferred now as it also reduces the risk of ovarian cancer. (ACOG; Williams)'),
    
    ('59: "Vasectomy" is _____ and has a _____ failure rate than tubal ligation.', '["Easier; lower", "Harder; higher", "More dangerous; higher", "None"]', 0, 'Preferred method for permanent family planning in couples. (Beckmann)'),
    
    ('60: A man is NOT sterile immediately after vasectomy. He should use backup until he has _____ azoospermic semen analyses.', '["1", "2 (usually after 3 months or 20 ejaculations)", "5", "None"]', 1, 'Must confirm success before stopping other methods. (Beckmann; Williams)');

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
