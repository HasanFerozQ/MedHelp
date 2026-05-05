BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Batch 2: 61-120 (Combined Hormonal Contraception and Safety Criteria)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Monophasic" pills provide:', '["Varying doses of hormones", "The same dose of estrogen and progestin throughout the pack", "Only estrogen", "None"]', 1, 'Easy to use for skipping periods (continuous use). (Williams Gynecology)'),
    (v_topic_id, '62: "Triphasic" pills provide:', '["One dose", "Varying doses of hormones in three phases during the cycle", "None", "Annual dose"]', 1, 'Designed to mimic the natural hormonal cycle. (Beckmann)'),
    (v_topic_id, '63: Most common reason for "Pill Failure"?', '["Drug interactions", "Inconsistent use (missing pills)", "Exercise", "None"]', 1, 'Typical use failure is ~7%. (ACOG)'),
    (v_topic_id, '64: If a woman misses ONE pill (anywhere in the pack)?', '["Take it as soon as possible and take the next one at the usual time", "Discard the pack", "Emergency contraception", "None"]', 0, 'No backup needed for one missed pill. (CDC)'),
    (v_topic_id, '65: If a woman misses TWO or more consecutive pills?', '["Take the most recent missed pill, discard others, continue the pack, and use BACKUP for 7 days", "Start new pack", "Wait", "None"]', 0, 'Requires 7 days of correct use to restore efficacy. (CDC)'),
    (v_topic_id, '66: If a "NuvaRing" is out of the vagina for > _____ hours, a backup is needed for 7 days.', '["1", "3", "24", "None"]', 1, 'Efficacy decreases if it is out for too long. (ACOG)'),
    (v_topic_id, '67: "Ortho Evra" Patch - If it falls off for > _____ hours, a backup is needed.', '["3", "24", "48", "None"]', 2, 'Requires a new patch and 7 days of backup. (Williams)'),
    (v_topic_id, '68: Estrogen-containing methods are contraindicated in women with active _____ disease.', '["Thyroid", "Liver (due to metabolism of clotting factors)", "Skin", "None"]', 1, 'Category 4 if severely impaired. (CDC)'),
    (v_topic_id, '69: Estrogen in CHCs increases the risk of which benign liver tumor?', '["Hemangioma", "Hepatic Adenoma", "Hepatoma", "None"]', 1, 'Risk is small but established with long-term use. (Beckmann)'),
    (v_topic_id, '70: "OCPs" and Gallstones: Estrogen _____ the risk of gallstone formation.', '["Decreases", "Increases (increases cholesterol secretion into bile)", "No effect", "None"]', 1, 'Important for patients with biliary symptoms. (Williams)'),
    (v_topic_id, '71: Does "OCP" use increase the risk of Breast Cancer significantly?', '["Yes, massively", "Most current data show little to no significant increase in lifetime risk", "No, it is protective", "None"]', 1, 'A nuanced discussion; benefits usually outweigh risks. (ACOG)'),
    (v_topic_id, '72: "OCPs" - Protective effect against Endometrial Cancer lasts for up to _____ years after stopping.', '["5", "10", "20", "None"]', 2, 'Long-term health benefit. (Williams)'),
    (v_topic_id, '73: "OCPs" - Protective effect against Ovarian Cancer _____ with duration of use.', '["Decreases", "Increases", "Stays same", "None"]', 1, 'Longer use = lower risk. (Beckmann)'),
    (v_topic_id, '74: "Ethinyl Estradiol" (EE) is the most common _____ used in CHCs.', '["Progestin", "Estrogen", "Androgen", "None"]', 1, 'Highly potent synthetic estrogen. (Williams)'),
    (v_topic_id, '75: "Progestins" in CHCs are classified by their "Generation." 1st and 2nd gens (e.g., Levonorgestrel) are more:', '["Estrogenic", "Androgenic", "Progestogenic", "None"]', 1, 'May cause more acne and hirsutism. (Beckmann)'),
    (v_topic_id, '76: 3rd and 4th gen progestins (e.g., Norgestimate, Drospirenone) are less:', '["Effective", "Androgenic", "Expensive", "None"]', 1, 'Better for skin but may have slightly higher VTE risk. (Williams)'),
    (v_topic_id, '77: Side effect of Estrogen: "Nausea and Breast Tenderness" usually improve after _____ cycles.', '["1", "3", "6", "None"]', 1, 'Advise patients to take the pill at bedtime. (Beckmann)'),
    (v_topic_id, '78: Side effect of Estrogen: "Chloasma" (Melasma) is:', '["Hair loss", "Hyperpigmentation of the face", "A rash", "None"]', 1, 'Worsened by sun exposure. (ACOG)'),
    (v_topic_id, '79: "Depo-Provera" and "Return to Fertility": Average time after the last injection?', '["1 month", "10 months (can be up to 18 months)", "1 week", "None"]', 1, 'Not recommended for women desiring pregnancy in the very near future. (ACOG)'),
    (v_topic_id, '80: "Depo-Provera" injection window: How many days late can a patient be before needing a pregnancy test?', '["1 day", ">= 14 days", "7 days", "None"]', 1, 'If > 15 weeks since last injection, rule out pregnancy before next dose. (CDC)'),
    (v_topic_id, '81: "Nexplanon" - What is it made of?', '["Copper", "Etonogestrel (Progestin)", "Estrogen", "None"]', 1, 'A single rod inserted under the skin of the upper arm. (Williams)'),
    (v_topic_id, '82: "Nexplanon" is FDA-approved for _____ years.', '["1", "3", "5", "None"]', 1, 'Highly effective with no user effort. (ACOG)'),
    (v_topic_id, '83: "IUD" - Risk of "PID" is slightly increased ONLY during the first _____ days after insertion.', '["1", "20", "60", "None"]', 1, 'Due to introduction of bacteria from the cervix; thereafter, risk is baseline. (ACOG)'),
    (v_topic_id, '84: "IUD" - "Expulsion" rate is highest in which population?', '["Nulliparous", "Immediate postpartum or post-abortion", "Postmenopausal", "None"]', 1, 'But benefits often outweigh risks. (Williams)'),
    (v_topic_id, '85: "IUD" - "Perforation" of the uterus occurs in approximately _____ out of 1000 insertions.', '["1", "10", "100", "None"]', 0, 'Rare complication, usually during the insertion procedure. (Beckmann)'),
    (v_topic_id, '86: A woman with an IUD gets PREGNANT. If the strings are visible and she desires the pregnancy, what should be done?', '["Leave it", "Remove the IUD immediately (reduces miscarriage and infection risk)", "Terminate", "None"]', 1, 'Leaving it increases the risk of septic abortion and preterm birth. (ACOG)'),
    (v_topic_id, '87: "Condoms" (Female) - Can they be used with a male condom?', '["Yes", "No (friction can cause both to break)", "Only with water", "None"]', 1, 'User error. (CDC)'),
    (v_topic_id, '88: "Spermicide" - Does it protect against Chlamydia?', '["Yes", "No", "Only if mixed with water", "None"]', 1, 'Barrier methods (condoms) are superior for STI prevention. (CDC)'),
    (v_topic_id, '89: "Diaphragm" - Must be "fitted" by a clinician and refitted if weight change > _____ lbs.', '["5", "10-20", "50", "None"]', 1, 'Also refit after pregnancy or pelvic surgery. (Williams)'),
    (v_topic_id, '90: "Emergency Contraception" - Does it work if the woman is ALREADY pregnant?', '["Yes", "No (it does not disrupt an existing pregnancy)", "Sometimes", "None"]', 1, 'It is not an abortifacient. (ACOG)'),
    (v_topic_id, '91: "Plan B" primarily works by _____.', '["Inhibiting implantation", "Delaying or inhibiting ovulation", "Killing the fetus", "None"]', 1, 'Must be taken BEFORE the LH surge to be effective. (Williams)'),
    (v_topic_id, '92: "Yuzpe Method" of emergency contraception uses:', '["Only progestin", "High doses of standard COCs", "A copper wire", "None"]', 1, 'Less effective and more nausea/vomiting than dedicated EC. (Beckmann)'),
    (v_topic_id, '93: "Vasectomy" - Complication: "Sperm Granuloma"?', '["Cancer", "A benign lump of leaked sperm causing chronic pain/swelling", "Infection", "None"]', 1, 'Rare but known complication. (Williams)'),
    (v_topic_id, '94: "Tubal Ligation" - Is "Regret" common?', '["No", "Yes, up to 20% in women < 30 years old", "Only in men", "None"]', 1, 'Crucial for pre-op counseling. (ACOG)'),
    (v_topic_id, '95: "Contraceptive Patch" - Standard location?', '["Face", "Buttocks, abdomen, upper outer arm, or upper torso (not breasts)", "Feet", "None"]', 1, 'Rotate sites weekly. (Beckmann)'),
    (v_topic_id, '96: "Contraceptive Ring" - Can it be used continuously to skip periods?', '["No", "Yes, insert a new ring every 3 or 4 weeks without a break", "Only in GDM", "None"]', 1, 'Safe and effective. (ACOG)'),
    (v_topic_id, '97: "MEC" (Medical Eligibility Criteria) Category 4 means:', '["No restriction", "Benefits > Risks", "Risks > Benefits", "Unacceptable health risk (contraindicated)"]', 3, 'CDC/WHO system for contraceptive safety. (CDC)'),
    (v_topic_id, '98: Woman > 35, non-smoker. Is she a candidate for COCs?', '["No", "Yes, age alone is not a contraindication", "Only if nulliparous", "None"]', 1, 'Only smokers > 35 are contraindicated. (ACOG)'),
    (v_topic_id, '99: Woman with "controlled" HTN. Which method is preferred?', '["COCs", "Progestin-only (IUD or Nexplanon)", "Patch", "None"]', 1, 'Estrogen can increase BP. (ACOG)'),
    (v_topic_id, '100: "Postpartum" - When can a woman START COCs after delivery (if no other risk factors)?', '["Day 1", "After 21 days (due to high VTE risk in first 3 weeks)", "6 months", "None"]', 1, 'VTE risk is extremely high in the immediate puerperium. (CDC)'),
    (v_topic_id, '101: "NuvaRing" - If it is removed for intercourse, how long can it be out?', '["10 mins", "Up to 3 hours", "12 hours", "None"]', 1, 'Must be rinsed and reinserted promptly. (Williams)'),
    (v_topic_id, '102: "Progestin-only Pill" (Mini-pill) - If taken _____ hours late, it counts as a "missed pill."', '["1", "3", "12", "24"]', 1, 'Narrower window than COCs due to short half-life. (ACOG)'),
    (v_topic_id, '103: "Copper IUD" - Does it increase the risk of "Ectopic Pregnancy"?', '["Yes", "No, it reduces the ABSOLUTE risk of ectopic pregnancy compared to no contraception", "Only in teens", "None"]', 1, 'It is so effective at preventing all pregnancies that ectopics are rare. (ACOG)'),
    (v_topic_id, '104: If an "IUD" pregnancy is ectopic, it is a failure of the method to _____?', '["Prevent fertilization", "Prevent implantation in the uterus", "Prevent ovulation", "None"]', 1, 'IUDs are better at preventing intrauterine than extrauterine pregnancy. (Williams)'),
    (v_topic_id, '105: "Hormonal IUD" (Mirena) - What percentage of women become "amenorrheic" by 1 year?', '["1%", "20-30%", "100%", "None"]', 1, 'Many more have significantly lighter/scant periods. (ACOG)'),
    (v_topic_id, '106: "Essure" - How was the procedure done?', '["Abdominal surgery", "Hysteroscopic placement of micro-inserts into the tubal ostia", "Vaginal only", "None"]', 1, 'Required a 3-month backup until a confirmation HSG was done. (Beckmann)'),
    (v_topic_id, '107: "Depo-Provera" - Can it be used during "Breastfeeding"?', '["No", "Yes, it is Category 1 (no restriction) immediate postpartum", "Only if formula is used", "None"]', 1, 'Standard of care. (CDC)'),
    (v_topic_id, '108: "Estrogen" in COCs - Effect on "Acne"?', '["Worsens it", "Improves it (by increasing SHBG and decreasing free testosterone)", "No effect", "None"]', 1, 'Specific COCs are FDA-approved for acne. (ACOG)'),
    (v_topic_id, '109: "Breakthrough Bleeding" (BTB) on OCPs is most common during which cycles?', '["First 1-3 cycles", "After 5 years", "Only in smokers", "None"]', 0, 'Encourage patients to continue; it usually resolves. (Williams)'),
    (v_topic_id, '110: "BTB" on OCPs: If it occurs in the LATE part of the pack, what might be needed?', '["Lower estrogen", "Higher progestin dose or different progestin", "Higher estrogen", "None"]', 1, 'Tweak the formulation. (Beckmann)'),
    (v_topic_id, '111: "OCPs" and Surgery: Should OCPs be stopped before a major elective surgery?', '["No", "Yes, ideally 4 weeks before high-risk surgeries to reduce VTE risk", "Only if nulliparous", "None"]', 1, 'Controversial, but often recommended for prolonged immobilization. (ACOG)'),
    (v_topic_id, '112: "IUD" - Can it be inserted "Immediately" after a first-trimester abortion?', '["No", "Yes (Post-abortion IUD)", "Wait 6 months", "None"]', 1, 'Reduces risk of subsequent unintended pregnancy. (ACOG)'),
    (v_topic_id, '113: "IUD" - "Uterine Sound" is used during insertion to measure:', '["Uterine depth", "Cervical width", "Patient pain", "None"]', 0, 'Must be between 6 and 9 cm for safe insertion usually. (Beckmann)'),
    (v_topic_id, '114: "Progestin-Only Pill" - Is there a "placebo" week?', '["Yes", "No, it is taken every day without a break", "Sometimes", "None"]', 1, 'Continuous dosing is required to maintain cervical mucus thickness. (Williams)'),
    (v_topic_id, '115: "Emergency Contraception" - Can it be used "multiple times" in one cycle?', '["No", "Yes, if needed (though not ideal as a primary method)", "Only once a year", "None"]', 1, 'Safe but indicates a need for more effective LARC. (ACOG)'),
    (v_topic_id, '116: "Withdrawal" - Why does it fail even when used "perfectly"?', '["The woman is too fertile", "Sperm may be present in pre-ejaculatory fluid", "Gravity", "None"]', 1, 'Biological risk. (Beckmann)'),
    (v_topic_id, '117: "Male Condoms" - Only _____ condoms protect against HIV.', '["Lambskin", "Latex or Polyurethane", "Silk", "None"]', 1, 'Lambskin has pores large enough for viruses. (CDC)'),
    (v_topic_id, '118: "Diaphragm" and "Cap" - Increase the risk of:', '["UTIs (due to pressure on the urethra)", "Weight gain", "Diabetes", "None"]', 0, 'Especially if the fit is too tight. (Beckmann)'),
    (v_topic_id, '119: "Sterilization" - "Bilateral Salpingectomy" removes:', '["Both ovaries", "Both fallopian tubes entirely", "The cervix", "None"]', 1, 'Permanent and reduces cancer risk. (ACOG)'),
    (v_topic_id, '120: "Nexplanon" - How is the insertion site localized for removal?', '["MRI", "Palpation (it should be palpable under the skin)", "X-ray", "None"]', 1, 'If not palpable, use high-frequency ultrasound. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 2 (61-120) MCQs for Contraception registered.';
END $$;
COMMIT;
