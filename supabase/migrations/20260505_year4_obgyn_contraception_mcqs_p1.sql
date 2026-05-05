BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Batch 1: 1-60 (LARC, Pearl Index, and General Principles)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What does the "Pearl Index" measure?', '["Cost of contraception", "Number of pregnancies per 100 woman-years of use", "Drug half-life", "None"]', 1, 'A lower Pearl Index indicates higher contraceptive efficacy. (ACOG)'),
    (v_topic_id, '2: Which of the following is considered "Tier 1" (most effective) contraception?', '["Condoms", "LARC (IUDs and Implants) and Sterilization", "OCPs", "Withdrawal"]', 1, 'Typical use failure rates are < 1%. (ACOG)'),
    (v_topic_id, '3: What is the primary mechanism of action of the "Copper IUD" (ParaGard)?', '["Inhibiting ovulation", "Creating a sterile inflammatory response in the uterus that is toxic to sperm", "Thinning the endometrium", "None"]', 1, 'Highly effective non-hormonal method. (Williams Obstetrics)'),
    (v_topic_id, '4: The Copper IUD is FDA-approved for up to how many years of use?', '["3", "5", "10", "12"]', 2, 'Though some evidence supports use up to 12 years. (ACOG)'),
    (v_topic_id, '5: Primary mechanism of "Levonorgestrel IUDs" (e.g., Mirena, Kyleena)?', '["Systemic ovulation suppression", "Thickening cervical mucus and thinning the endometrium", "Blocking the tubes", "None"]', 1, 'While some ovulation is suppressed, the local effect is primary. (Beckmann)'),
    (v_topic_id, '6: "Nexplanon" (Progestin implant) is primarily effective by:', '["Inhibiting ovulation", "Copper toxicity", "Barrier effect", "None"]', 0, 'Suppresses the LH surge. (ACOG)'),
    (v_topic_id, '7: Most common side effect of the Nexplanon implant leading to discontinuation?', '["Weight gain", "Unscheduled/irregular vaginal bleeding", "Acne", "Headache"]', 1, 'Crucial for pre-insertion counseling. (Beckmann)'),
    (v_topic_id, '8: What is the most effective method of EMERGENCY contraception?', '["Plan B (Levonorgestrel)", "Copper IUD (if inserted within 5 days)", "Ella (Ulipristal)", "Yuzpe method"]', 1, 'Failure rate is < 0.1%. (ACOG)'),
    (v_topic_id, '9: "Plan B One-Step" (Levonorgestrel 1.5mg) is most effective when taken within _____ hours of unprotected intercourse.', '["24", "72", "120", "None"]', 1, 'Efficacy decreases as time increases, but can be used up to 120 hours. (ACOG)'),
    (v_topic_id, '10: "Ella" (Ulipristal acetate) is a/an _____ and is more effective than Plan B in women with a BMI > 30.', '["Estrogen agonist", "Selective Progesterone Receptor Modulator (SPRM)", "Androgen", "None"]', 1, 'Effective up to 120 hours. (Beckmann)'),
    (v_topic_id, '11: Contraindication for the use of ALL IUDs?', '["Nulliparity", "Current pelvic infection (PID or purulent cervicitis)", "History of ectopic pregnancy", "Smoking"]', 1, 'Wait 3 months after PID resolution for insertion. (ACOG)'),
    (v_topic_id, '12: Copper IUD (ParaGard) is contraindicated in patients with:', '["HTN", "Wilson''s disease or unexplained vaginal bleeding", "Obesity", "None"]', 1, 'Also avoid in patients with copper allergy. (Williams)'),
    (v_topic_id, '13: "Levonorgestrel IUD" is an excellent treatment for which condition?', '["PID", "Heavy Menstrual Bleeding (Menorrhagia)", "Endometrial cancer", "None"]', 1, 'Reduces menstrual blood loss by ~90%. (ACOG)'),
    (v_topic_id, '14: A patient has "Actinomyces" seen on a routine Pap smear. She has an IUD and is ASYMPTOMATIC. Next step?', '["Remove IUD and give penicillin", "Leave IUD in and do nothing", "Remove IUD only", "None"]', 1, 'Common incidental finding; no treatment needed unless symptomatic. (ACOG)'),
    (v_topic_id, '15: "IUD strings" are not visible on exam. First step?', '["Immediate surgery", "Pregnancy test and Ultrasound to locate the IUD", "Assume it fell out", "None"]', 1, 'Rule out expulsion or uterine perforation. (Beckmann)'),
    (v_topic_id, '16: If an IUD is seen outside the uterus in the abdominal cavity on X-ray/Ultrasound?', '["Leave it", "Surgical removal (usually laparoscopic)", "Wait for it to pass", "None"]', 1, 'Risk of bowel/bladder injury. (Williams)'),
    (v_topic_id, '17: Most common side effect of the "Copper IUD"?', '["Amenorrhea", "Increased menstrual bleeding and dysmenorrhea", "Weight gain", "None"]', 1, 'Contrast with hormonal IUDs. (Beckmann)'),
    (v_topic_id, '18: "Tier 2" contraception (Typical failure 4-7%) includes:', '["IUDs", "OCPs, Patch, Ring, and Depo-Provera", "Condoms", "None"]', 1, 'Efficacy depends on user adherence. (ACOG)'),
    (v_topic_id, '19: "Tier 3" contraception (Typical failure > 10%) includes:', '["OCPs", "Condoms, Diaphragm, Withdrawal, and Natural Family Planning", "Nexplanon", "None"]', 1, 'Highest failure rates. (Beckmann)'),
    (v_topic_id, '20: Combined Oral Contraceptives (COCs) contain:', '["Estrogen only", "Estrogen and Progestin", "Progestin only", "None"]', 1, 'Standard "pill." (Williams)'),
    (v_topic_id, '21: Primary mechanism of COCs?', '["Thickening mucus only", "Suppression of ovulation (via FSH/LH inhibition)", "Killing sperm", "None"]', 1, 'Highly effective when taken daily. (ACOG)'),
    (v_topic_id, '22: The "Estrogen" component of COCs primarily suppresses _____ release.', '["LH", "FSH (inhibiting follicle recruitment)", "TSH", "None"]', 1, 'Also stabilizes the endometrium. (Beckmann)'),
    (v_topic_id, '23: The "Progestin" component of COCs primarily suppresses _____ release.', '["FSH", "LH (inhibiting the LH surge and ovulation)", "Oxytocin", "None"]', 1, 'Also thickens cervical mucus. (Williams)'),
    (v_topic_id, '24: Most significant health risk of COCs?', '["Breast cancer", "Venous Thromboembolism (VTE)", "Infertility", "Weight gain"]', 1, 'Estrogen increases production of clotting factors in the liver. (ACOG)'),
    (v_topic_id, '25: Absolute contraindication for Estrogen-containing contraceptives?', '["Age > 35 and smoking >= 15 cigarettes/day", "History of VTE or Stroke", "Migraine with Aura", "All of the above"]', 3, 'Safety criteria (MEC) Category 4. (CDC)'),
    (v_topic_id, '26: "Migraine WITH Aura" + Estrogen = increased risk of:', '["Heart attack", "Ischemic Stroke", "Lung cancer", "None"]', 1, 'Aura indicates a specific neurological vulnerability. (ACOG)'),
    (v_topic_id, '27: Benefit of COCs besides pregnancy prevention?', '["Reduced risk of Endometrial and Ovarian cancer", "Reduced dysmenorrhea and HMB", "Improved acne", "All of the above"]', 3, 'Non-contraceptive benefits are substantial. (Williams)'),
    (v_topic_id, '28: "Depo-Provera" (DMPA) is given as an IM or SC injection every _____ months.', '["1", "2", "3", "6"]', 2, 'Every 13 weeks. (Beckmann)'),
    (v_topic_id, '29: "Depo-Provera" black box warning regarding long-term use?', '["Cancer", "Reversible Bone Mineral Density (BMD) loss", "Diabetes", "None"]', 1, 'Due to low estrogen levels. (ACOG)'),
    (v_topic_id, '30: Most common side effect of Depo-Provera?', '["Bleeding", "Weight gain (average 5 lbs) and irregular spotting/amenorrhea", "Acne", "None"]', 1, 'Only contraceptive method definitively linked to weight gain. (Beckmann)'),
    (v_topic_id, '31: "NuvaRing" is a vaginal ring that is left in for _____ weeks and then removed for _____ week.', '["1 / 3", "3 / 1", "4 / 0", "None"]', 1, 'Provides a steady release of estrogen and progestin. (Williams)'),
    (v_topic_id, '32: "Ortho Evra" (The Patch) is changed every:', '["Day", "Week (for 3 weeks, then 1 week off)", "Month", "None"]', 1, 'Transdermal delivery. (Beckmann)'),
    (v_topic_id, '33: The Patch is LESS effective in women weighing > _____ kg.', '["70", "90", "120", "None"]', 1, 'Due to altered absorption in adipose tissue. (ACOG)'),
    (v_topic_id, '34: "Progestin-Only Pill" (POP / Mini-pill) primary mechanism?', '["Inhibiting ovulation only", "Thickening cervical mucus (ovulation is only suppressed in 50%)", "Copper toxicity", "None"]', 1, 'Must be taken at the SAME time every day (3-hour window). (Williams)'),
    (v_topic_id, '35: Best contraceptive choice for a breastfeeding woman (immediate postpartum)?', '["COCs", "Progestin-only methods (POP, IUD, Nexplanon)", "None", "Patch"]', 1, 'Estrogen can decrease milk supply and increases VTE risk early postpartum. (ACOG)'),
    (v_topic_id, '36: "Diaphragm" use requires _____ to be effective.', '["Water", "Spermicide", "Pills", "None"]', 1, 'Acts as a reservoir for spermicide. (Beckmann)'),
    (v_topic_id, '37: Diaphragm should be left in for at least _____ hours after intercourse.', '["1", "6", "24", "None"]', 1, 'Must not be left in > 24 hours (risk of TSS). (Williams)'),
    (v_topic_id, '38: "Natural Family Planning" (Calendar method) - When is the "fertile window"?', '["First day of menses", "Day 10-17 of a 28-day cycle", "Last day of menses", "None"]', 1, 'Based on sperm longevity and oocyte lifespan. (Beckmann)'),
    (v_topic_id, '39: "Bilateral Tubal Ligation" (BTL) failure rate?', '["0%", "< 1% (but higher than IUD/Nexplanon)", "10%", "None"]', 1, 'Permanent but not 100% fail-safe (CREST study). (ACOG)'),
    (v_topic_id, '40: If a patient gets pregnant AFTER a tubal ligation, what is the most likely location?', '["Intrauterine", "Ectopic (up to 30%)", "Abdominal", "None"]', 1, 'Requires high suspicion. (Williams)'),
    (v_topic_id, '41: "Vasectomy" is _____ effective and _____ risky than tubal ligation.', '["Less / More", "More / Less", "Same", "None"]', 1, 'A safer and cheaper permanent method. (ACOG)'),
    (v_topic_id, '42: "Vasectomy" is NOT immediately effective. It requires follow-up at _____ months to confirm azoospermia.', '["1", "3", "6", "None"]', 1, 'Or after ~20 ejaculations. (Beckmann)'),
    (v_topic_id, '43: "Ulipristal" (Ella) can be taken up to how many days after intercourse?', '["3", "5", "10", "None"]', 1, 'Maintains efficacy throughout the 120-hour window. (ACOG)'),
    (v_topic_id, '44: "Lactational Amenorrhea Method" (LAM) is reliable ONLY if:', '["Exclusively breastfeeding, amenorrheic, and < 6 months postpartum", "Supplementing with formula", "The baby is 1 year old", "None"]', 0, 'Suckling suppresses GnRH. (Williams)'),
    (v_topic_id, '45: "Quick Start" method for contraception means:', '["Wait for menses", "Starting the method immediately regardless of cycle day (if pregnancy is ruled out)", "Start on Sunday", "None"]', 1, 'Improves adherence and uptake. (ACOG)'),
    (v_topic_id, '46: If starting contraception NOT on Day 1 of menses, "Backup" (condoms) should be used for _____ days.', '["1", "7", "14", "None"]', 1, 'Standard "7-day rule." (Beckmann)'),
    (v_topic_id, '47: Most common progestin in COCs that has "anti-mineralocorticoid" properties?', '["Levonorgestrel", "Drospirenone (Yaz/Yasmin)", "Norethindrone", "None"]', 1, 'Good for acne and bloating; monitor potassium if on ACE-I. (Williams)'),
    (v_topic_id, '48: "Rifampin" and certain anti-seizure meds _____ the efficacy of COCs.', '["Increase", "Decrease (via liver enzyme induction)", "Do not affect", "None"]', 1, 'Increases metabolism of contraceptive hormones. (ACOG)'),
    (v_topic_id, '49: Does "Common Antibiotics" (like Amoxicillin) decrease pill efficacy?', '["Yes", "No (only Rifampin is proven to do so)", "Maybe", "None"]', 1, 'A common myth. (ACOG)'),
    (v_topic_id, '50: "Essure" was a permanent method that involved:', '["Surgery", "Hysteroscopic placement of coils in the tubes (no longer on the market)", "Pills", "None"]', 1, 'Recalled due to adverse events. (Beckmann)'),
    (v_topic_id, '51: "Condoms" (Male) provide protection against:', '["Pregnancy only", "Pregnancy and most STIs (including HIV)", "None", "Acne"]', 1, 'Only Tier 3 method with significant STI protection. (CDC)'),
    (v_topic_id, '52: "IUD" insertion: "Vasovagal" response is common. Treatment?', '["CPR", "Trendelenburg position and reassurance", "Antibiotics", "None"]', 1, 'Management of fainting/dizziness during the procedure. (Williams)'),
    (v_topic_id, '53: "Copper IUD" can be used as emergency contraception up to _____ days after intercourse.', '["3", "5", "7", "None"]', 1, 'The most effective EC method. (ACOG)'),
    (v_topic_id, '54: "Plan B" is less effective in women with a BMI > _____ kg/m².', '["20", "25", "30", "None"]', 2, 'Ulipristal or IUD is preferred for obese patients. (ACOG)'),
    (v_topic_id, '55: "Withdrawal" (Pulling out) typical failure rate?', '["1%", "10%", "18-22%", "100%"]', 2, 'High failure due to pre-ejaculate and poor timing. (CDC)'),
    (v_topic_id, '56: "Postpartum" Tubal Ligation is often performed at the time of _____ or within 24 hours of vaginal delivery.', '["Appy", "C-section", "None", "Chole"]', 1, 'Convenient timing while the fundus is high. (Williams)'),
    (v_topic_id, '57: "Salpingectomy" (full tube removal) is now often preferred over ligation because:', '["It is easier", "It significantly reduces the risk of Ovarian Cancer", "It is reversible", "None"]', 1, 'Opportunistic salpingectomy is the current trend. (ACOG)'),
    (v_topic_id, '58: "Spermicide" (Nonoxynol-9) can increase the risk of _____ if used multiple times a day.', '["Cancer", "HIV transmission (due to vaginal irritation/micro-abrasions)", "Infertility", "None"]', 1, 'Not recommended for high-risk populations. (CDC)'),
    (v_topic_id, '59: "Cervical Cap" (FemCap) requires _____ for efficacy.', '["Water", "Spermicide", "Surgery", "None"]', 1, 'Similar to the diaphragm. (Beckmann)'),
    (v_topic_id, '60: "Progestin-only" methods are preferred for women with a history of _____ cancer.', '["Endometrial", "Migraine with aura or VTE risk", "Lung", "None"]', 1, 'Safe alternatives to estrogen. (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Contraception registered.';
END $$;
COMMIT;
