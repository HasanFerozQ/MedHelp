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
    ('121: In the US, which is the MOST common form of permanent contraception chosen by women?', '["Vasectomy", "Tubal Ligation (Sterilization)", "Essure", "None"]', 1, 'Female sterilization is the most common contraceptive method overall in many US demographics. (ACOG; Beckmann)'),
    
    ('122: What is the single most important risk factor for "Regret" after a sterilization procedure?', '["Number of children", "Young age at the time of procedure (< 30 years old)", "Marital status", "Education level"]', 1, 'CREST study confirmed that age at sterilization is the strongest predictor of regret. (ACOG; Williams)'),
    
    ('123: Which tubal ligation technique has the HIGHEST risk of "tuboperitoneal fistula" or "ectopic pregnancy"?', '["Bipolar cautery", "Monopolar cautery", "Pomerooy method", "Filshie clips"]', 1, 'Thermal damage can lead to incomplete occlusion or fistula formation. (Williams; Beckmann)'),
    
    ('124: "Tubal reversal" (Re-anastomosis) is technically easier if the original procedure was:', '["Salpingectomy", "Mechanical (Clips or Rings)", "Bipolar cautery", "None"]', 1, 'Mechanical methods destroy the least amount of tube. (Beckmann; Williams)'),
    
    ('125: For a woman who has had a tubal ligation and now wants a child, what is usually the MORE successful option?', '["Tubal reversal surgery", "In-Vitro Fertilization (IVF)", "Clomiphene", "None"]', 1, 'IVF bypasses the tubes entirely and has higher per-cycle success rates. (ACOG; Williams)'),
    
    ('126: A "Vasectomy" involves the ligation and excision of a segment of the:', '["Epididymis", "Vas Deferens", "Seminal vesicle", "Urethra"]', 1, 'Prevents sperm from entering the ejaculate. (Beckmann)'),
    
    ('127: Which form of female sterilization is done "postpartum" during the same hospital stay as delivery?', '["Laparoscopic clips", "Minilaparotomy with Pomeroy-type tubal ligation", "Hysteroscopic Essure", "None"]', 1, 'Commonly done via a small sub-umbilical incision. (ACOG; Williams)'),
    
    ('128: The "CREST" study followed women for _____ years after sterilization to determine long-term failure rates.', '["1", "5", "10", "20"]', 2, 'Showed a cumulative failure rate of ~1.8% over 10 years. (Williams; Beckmann)'),
    
    ('129: Which permanent method has the lowest overall failure rate after 10 years?', '["Bipolar cautery", "Unipolar cautery", "Spring-loaded clips", "None"]', 1, 'Unipolar cautery had the lowest cumulative failure rate in the CREST study. (Williams)'),
    
    ('130: Does sterilization affect a woman''s "hormone levels" or cause early menopause?', '["Yes", "No, it only disrupts the passage of the egg/sperm; ovarian function remains intact", "Only in smokers", "None"]', 1, 'A common patient concern that should be addressed during counseling. (ACOG; Beckmann)'),
    
    ('131: "Emergency Contraception" (Plan B) is LESS effective in women with a BMI > _____ kg/m2.', '["25", "30", "40", "None"]', 1, 'Obese women may require higher doses or should be steered toward the Copper IUD or Ella. (ACOG)'),
    
    ('132: "Ulipristal" (Ella) remains effective for up to _____ days after unprotected intercourse.', '["3", "5 (120 hours)", "10", "None"]', 1, 'Superior to Levonorgestrel-based EC. (ACOG; Williams)'),
    
    ('133: If a woman takes "Plan B" (LNG), she should resume her regular hormonal method:', '["Immediately", "Wait 5 days", "Wait 1 month", "None"]', 0, 'No interaction; restart immediately and use backup for 7 days. (ACOG; CDC)'),
    
    ('134: A patient on "Depo-Provera" complains of a "new, dull ache" in her pelvis. Ultrasound shows a 3 cm "simple cyst" on the ovary. Management?', '["Surgery", "Reassurance (functional cysts are common and usually resolve spontaneously in DMPA users)", "Stop DMPA", "None"]', 1, 'DMPA suppresses the dominant follicle but allows for smaller functional cysts. (ACOG; Williams)'),
    
    ('135: "DMPA-SC" (Depo-SubQ Provera 104) is injected into the _____ and contains a _____ dose than the IM version.', '["Muscle; higher", "Subcutaneous tissue; lower (104 mg vs 150 mg)", "Vein; equal", "None"]', 1, 'Newer formulation, can be self-administered. (Williams)'),
    
    ('136: The "Symptothermal Method" of fertility awareness combines:', '["Mood and weight", "Cervical mucus monitoring AND Basal Body Temperature (BBT)", "Period dates only", "None"]', 1, 'Most effective behavioral method if used correctly. (Beckmann; Williams)'),
    
    ('137: In the "Symptothermal" method, "Basal Body Temperature" (BBT) _____ by 0.5-1.0°F AFTER ovulation.', '["Drops", "Rises", "Stays same", "None"]', 1, 'Due to the thermogenic effect of Progesterone. (Beckmann; Williams)'),
    
    ('138: "CycleBeads" are used for which method?', '["Standard Days Method", "Billings method", "LAM", "None"]', 0, 'Color-coded beads represent fertile and infertile days. (Beckmann)'),
    
    ('139: "Withdrawal" (Coitus Interruptus) has a TYPICAL use failure rate of about _____%.', '["2", "10", "22", "50"]', 2, 'Low efficacy due to high chance of error and pre-ejaculatory sperm. (CDC; Beckmann)'),
    
    ('140: "Natural Family Planning" (NFP) is Category _____ for women with "irregulal menses" according to USMEC.', '["1", "2", "3", "4"]', 2, 'Category 3; because the method is unreliable in this population. (USMEC; ACOG)'),
    
    ('141: "Amenorrhea" on the Levonorgestrel IUD occurs in about _____% of women by 1 year.', '["5", "20", "50", "90"]', 1, 'Though many more have significantly lighter periods. (ACOG; Beckmann)'),
    
    ('142: "PCOS" patients benefit from COCs primarily through:', '["Increased SHBG (lowers free testosterone)", "Protection from endometrial hyperplasia", "Cycle regularity", "All of the above"]', 3, 'Foundational treatment for PCOS. (Beckmann; Williams)'),
    
    ('143: Does the "Copper IUD" (ParaGard) increase the risk of "Anemia"?', '["No", "Yes, due to increased menstrual blood loss (HMB)", "Only in men", "None"]', 1, 'Patients with baseline heavy menses or anemia may not be good candidates. (ACOG; Williams)'),
    
    ('144: "IUD Expulsion" is most common in:', '["Teens and women who had recent expulsion", "Women > 40", "Thin women", "None"]', 0, 'Risk is ~5-10% overall. (Beckmann; Williams)'),
    
    ('145: A woman with "Actinomyces" on Pap smear and "Pelvic Pain/Fever." Management?', '["Treat as PID; remove IUD and give antibiotics", "Leave IUD", "Treat with cream", "None"]', 0, 'Symptomatic Actinomyces infection is serious and requires treatment. (ACOG; Williams)'),
    
    ('146: "Progestin-Only" methods (POPs/Depo/Implant) are safe for women with a history of "Bariatric Surgery."', '["True", "False", "Only if it was a sleeve", "None"]', 0, 'Category 1; however, oral methods (COCs/POPs) might have reduced absorption in malabsorptive procedures (Category 3). (ACOG; USMEC)'),
    
    ('147: Which IUD has the LONGEST duration of effectiveness?', '["Mirena", "Copper IUD (ParaGard)", "Kyleena", "Skyla"]', 1, 'ParaGard is approved for 10 years. (Beckmann)'),
    
    ('148: What is the "Efficacy" of the "Etonogestrel Implant" (Nexplanon)?', '["95%", "99%", "> 99.9%", "None"]', 2, 'Lowest failure rate of any contraceptive (~0.05%). (CDC; ACOG)'),
    
    ('149: "Levonorgestrel" (Plan B) works primarily by inhibiting the _____ surge.', '["Estrogen", "LH", "Progesterone", "None"]', 1, 'Prevents ovulation. (ACOG)'),
    
    ('150: A patient on COCs for 10 years wants to know if she needs a "Hormone Holiday" (stopping for a few months).', '["Yes, to clean the system", "No, there is no medical reason to take a break; stopping actually increases the risk of unintended pregnancy", "Only if she is tired", "None"]', 1, 'A common but medically unfounded belief. (Beckmann; ACOG)'),
    
    ('151: "Acne" is typically _____ by COCs because they _____ free testosterone.', '["Worsened; increase", "Improved; decrease (by increasing SHBG)", "Unchanged; block", "None"]', 1, 'Estrogen-containing methods are a first-line treatment for hormonal acne. (ACOG; Williams)'),
    
    ('152: Which progestin is known for having a "Higher" risk of VTE in some studies, although the absolute risk remains very low?', '["Levonorgestrel", "Desogestrel / Drospirenone (3rd/4th gen)", "Norethindrone", "None"]', 1, '"Third-generation" progestins. (ACOG; Williams)'),
    
    ('153: Is "Smoking" a contraindication for the "Nexplanon" or "Mirena"?', '["Yes", "No (Category 1)", "Only if > 15 cigs/day", "None"]', 1, 'Smokers should be steered toward LARC/progestin-only methods. (ACOG; USMEC)'),
    
    ('154: A 32-year-old on COCs has a "Liver Hemangioma." Category?', '["1", "2", "3", "4"]', 1, 'Category 2; generally safe but needs caution. (USMEC; ACOG)'),
    
    ('155: A 32-year-old on COCs has "Hepatocellular Adenoma." Category?', '["1", "2", "3", "4"]', 2, 'Category 3; theoretical risk of tumor growth. (USMEC; ACOG)'),
    
    ('156: "Copper IUD" can be used for EC in women of any weight.', '["True", "False", "Only in teens", "None"]', 0, 'Most effective EC regardless of BMI. (ACOG)'),
    
    ('157: "Sterilization" failure: "Bipolar cautery" fails most often due to:', '["Infection", "Inadequate destruction of the tube (needs at least 3 cm)", "Allergy", "None"]', 1, 'Technique-dependent efficacy. (Williams; Beckmann)'),
    
    ('158: "Vasectomy" failure rate is approximately:', '["1 in 10", "1 in 100", "1 in 2,000", "None"]', 2, 'Much more effective than tubal ligation. (Beckmann; Williams)'),
    
    ('159: "Depo-Provera" and "Diabetes": DMPA may slightly _____ insulin resistance.', '["Decrease", "Increase", "Not affect", "None"]', 1, 'Category 2 for uncomplicated DM; Category 3 for DM with vascular disease. (USMEC; ACOG)'),
    
    ('160: A woman on "Nexplanon" has "unpredictable spotting." First-line treatment?', '["Surgery", "Reassurance AND potentially a short course of NSAIDs or Estrogen (if no contraindications)", "Remove it", "None"]', 1, 'Managing side effects is crucial for LARC retention. (ACOG; Williams)'),
    
    ('161: "Combined Hormonal Contraception" is Category _____ for women with a history of "Benign Gestational Trophoblastic Disease" and NORMAL hCG.', '["1", "2", "3", "4"]', 0, 'Safe to use once hCG is negative. (USMEC; ACOG)'),
    
    ('162: "Copper IUD" is Category _____ for "Cervical Cancer" (awaiting treatment).', '["1", "2", "3", "4"]', 3, 'Category 4 for initiation; Category 2 for continuation. (USMEC; ACOG)'),
    
    ('163: "Plan B" (Levonorgestrel) is available over-the-counter for what ages?', '["All ages", "17+", "18+", "Only with prescription"]', 0, 'No age restriction in the US. (FDA; ACOG)'),
    
    ('164: "Ulipristal" (Ella) requires a prescription.', '["True", "False", "Only in California", "None"]', 0, 'Not available OTC. (ACOG)'),
    
    ('165: "Basal Body Temperature" should be measured:', '["Before bed", "Immediately upon waking before any activity (even talking)", "During exercise", "None"]', 1, 'Must be the absolute resting temp. (Beckmann)'),
    
    ('166: "Cervical Mucus" at the time of OVULATION is:', '["Thick and yellow", "Clear, stretchy, and slippery (\"Spinnbarkeit\")", "Bloody", "None"]', 1, 'Facilitates sperm passage. (Beckmann; Williams)'),
    
    ('167: "Breastfeeding" and "Copper IUD": Does it affect milk?', '["Yes", "No", "Only if she eats copper", "None"]', 1, 'Non-hormonal and safe. (ACOG)'),
    
    ('168: A 19-year-old G0 has "Kyleena" placed. The primary goal was to provide LARC with a _____ than Mirena.', '["Higher dose", "Smaller frame (28mm vs 32mm)", "Better color", "None"]', 1, 'More comfortable for some nulliparous patients. (Beckmann)'),
    
    ('169: "Nexplanon" insertion: The rod is placed _____ in the non-dominant arm.', '["Deep in the muscle", "Subcutaneously over the triceps", "In the vein", "None"]', 1, 'Must be palpable under the skin. (Beckmann)'),
    
    ('170: "Nexplanon" removal: If the rod is NOT palpable, next step?', '["Surgery", "Imaging (Ultrasound or X-ray) to locate it", "Wait", "None"]', 1, 'The implant is radiopaque. (ACOG; Williams)'),
    
    ('171: "Progestin-Only" methods: "Secondary" Amenorrhea is a _____ finding.', '["Harmful", "Normal and expected", "Sign of cancer", "None"]', 1, 'Reassurance is important. (Beckmann)'),
    
    ('172: "Estrogen" in COCs is most commonly:', '["Estradiol", "Ethinyl Estradiol (EE)", "Estrone", "None"]', 1, 'Potent synthetic estrogen. (Williams)'),
    
    ('173: "COCs" and "Weight": For which progestin is weight gain slightly MORE commonly reported (though still debated)?', '["Norethindrone", "Levonorgestrel", "Drospirenone", "None"]', 1, 'Older 2nd gen progestins. (Comprehensive Gynecology)'),
    
    ('174: "Plan B" (LNG) dose is usually:', '["0.15 mg", "1.5 mg (single dose or split)", "15 mg", "None"]', 1, 'High-dose progestin. (ACOG)'),
    
    ('175: "Yuzpe Method" of EC involves:', '["A copper wire", "Taking specific doses of regular combined OCPs (rarely used now due to nausea)", "Abstinence", "None"]', 1, 'Historical method. (ACOG; Beckmann)'),
    
    ('176: "Sterilization" counseling: Must inform the patient that it provides NO protection against:', '["Pregnancy", "STIs", "Period pain", "None"]', 1, 'Condoms still needed if at risk. (ACOG)'),
    
    ('177: "Vasectomy" regret is HIGHER if:', '["Done before age 25", "Done after having 5 kids", "The man is wealthy", "None"]', 0, 'Age remains a key factor in both genders. (Williams)'),
    
    ('178: "Endometrial" thinning on COCs is due to:', '["Progestin-induced atrophy", "Estrogen surge", "Lack of blood", "None"]', 0, 'Mechanism for reduced menstrual flow. (Williams; Beckmann)'),
    
    ('179: "Cervical" mucus thickening on COCs is due to:', '["Estrogen", "Progestin", "The plastic", "None"]', 1, 'Blocks sperm from entering the uterus. (Williams; Beckmann)'),
    
    ('180: "Ovarian Cyst" risk is _____ in users of the "Implant" compared to COCs.', '["Lower", "Higher (slightly higher incidence of functional cysts)", "Same", "None"]', 1, 'Incomplete ovulation suppression. (Williams; ACOG)'),
    
    ('181: "IUD" strings should be checked:', '["Daily", "After each menses", "Yearly only", "None"]', 1, 'To ensure the device hasn''t been expelled. (Beckmann)');

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
