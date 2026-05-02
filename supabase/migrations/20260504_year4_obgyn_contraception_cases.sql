BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Contraception & family planning
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-contraception" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Contraceptive Effectiveness (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tiered Counseling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tiered Counseling', 'A 24-year-old woman is seeking the most effective reversible contraceptive method available.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman is seeking the most effective reversible contraceptive method available.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is considered a Long-Acting Reversible Contraceptive (LARC)?', '["OCPs", "Depo-Provera", "Intrauterine Device (IUD) and Nexplanon implant", "Condoms"]', 2, 'LARC methods are the most effective reversible options because they do not rely on patient adherence.'),
    (v_case_id, 'What is the \"Pearl Index\"?', '["A measure of fertility", "The number of pregnancies per 100 woman-years of use of a contraceptive method", "The cost of contraception", "None"]', 1, 'The Pearl Index is the standard way to report contraceptive failure rates.'),
    (v_case_id, 'What is the failure rate of LARC methods with typical use?', '["5%", "10%", "< 1%", "20%"]', 2, 'LARC methods have failure rates similar to sterilization (< 1%).');

    ---------------------------------------------------------------------------
    -- CASE 02: COC Contraindications (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Safety of Combined Pills' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Safety of Combined Pills', 'A 36-year-old woman who smokes 1 pack of cigarettes a day requests combined oral contraceptive pills (COCs).', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 36-year-old woman who smokes 1 pack of cigarettes a day requests combined oral contraceptive pills (COCs).', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this patient a candidate for COCs?', '["Yes", "No, smoking > 15 cigarettes/day and age >= 35 is a Category 4 (absolute) contraindication", "Only if she takes a low dose", "None"]', 1, 'The risk of myocardial infarction and stroke is significantly elevated in this population.'),
    (v_case_id, 'Which of the following is another absolute contraindication to estrogen-containing contraception?', '["Diabetes without complications", "Migraine WITH aura", "Obesity", "Family history of twins"]', 1, 'Estrogen increases stroke risk in patients with focal neurological symptoms (aura).'),
    (v_case_id, 'A patient with well-controlled hypertension (130/80) wants COCs. What is the CDC Medical Eligibility category?', '["Category 1 (No restriction)", "Category 3 (Risks usually outweigh benefits)", "Category 4", "None"]', 1, 'Hypertension (even controlled) usually warrants progestin-only or non-hormonal methods (Category 3).');

    ---------------------------------------------------------------------------
    -- CASE 03: COC Benefits (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Non-Contraceptive Benefits' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Non-Contraceptive Benefits', 'A patient with heavy periods and a family history of ovarian cancer is considering COCs.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with heavy periods and a family history of ovarian cancer is considering COCs.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Combined pills reduce the risk of which two gynecological cancers?', '["Cervical and Vaginal", "Endometrial and Ovarian", "Breast and Vulvar", "None"]', 1, 'The risk reduction is significant and persists even after stopping the pills.'),
    (v_case_id, 'How do COCs help with dysmenorrhea?', '["They thin the lining and suppress ovulation, reducing prostaglandin production", "They act as pain meds", "They increase blood flow", "None"]', 0, 'Suppression of the cycle reduces uterine cramping.'),
    (v_case_id, 'COCs are also an effective first-line treatment for:', '["Acne and Hirsutism", "Hypothyroidism", "Weight loss", "None"]', 0, 'By suppressing ovarian androgens and increasing SHBG, they improve skin symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 04: Missed COC Management (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Forgotten Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Forgotten Pill', 'A patient on a 21-day COC pack realizes she forgot to take her pill yesterday.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on a 21-day COC pack realizes she forgot to take her pill yesterday.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should she do if she missed only ONE active pill?', '["Take the missed pill as soon as possible, take the next pill at the usual time (even if it means 2 pills in one day), and no backup is needed", "Throw the pack away", "Take 4 pills", "Wait for her period"]', 0, 'Missing one pill (< 48 hours since last dose) carries low risk.'),
    (v_case_id, 'If she misses TWO OR MORE active pills in the second or third week, what is the recommendation?', '["Take the most recent missed pill, discard other missed pills, continue the pack, and use backup (condoms) for 7 days", "Immediate C-section", "None", "Double the dose for a month"]', 0, 'Backup is required for 7 days after missing 2+ pills.'),
    (v_case_id, 'When is the risk of pregnancy highest when missing pills?', '["In the middle of the pack", "At the beginning or end of the active pill cycle (extending the pill-free interval)", "During the placebo week", "None"]', 1, 'Extending the hormone-free interval allows FSH to rise and potentially trigger ovulation.');

    ---------------------------------------------------------------------------
    -- CASE 05: Progestin-Only Pill - POP (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mini-Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mini-Pill', 'A breastfeeding mother is prescribed progestin-only pills (POPs).', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Mini-Pill', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of action of POPs?', '["Killing sperm", "Thickening cervical mucus", "Stopping periods", "None"]', 1, 'POPs primarily work by making cervical mucus impermeable to sperm; they do not consistently inhibit ovulation.'),
    (v_case_id, 'How sensitive is the timing for taking a POP (Norethindrone)?', '["Can be taken anytime", "Must be taken within a 3-hour window every day", "Weekly is fine", "None"]', 1, 'If a POP is more than 3 hours late, backup contraception is required for 48 hours.'),
    (v_case_id, 'Which patient population is the ideal candidate for POPs?', '["Women with contraindications to estrogen (e.g., breastfeeding, high VTE risk)", "Women who want to skip periods", "Teenagers", "None"]', 0, 'POPs are a safe alternative when estrogen is unsafe.');

    ---------------------------------------------------------------------------
    -- CASE 06: Depo-Provera (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Injectable' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Injectable', 'A patient is considering Medroxyprogesterone acetate (Depo-Provera).', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Injectable', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How often is the Depo-Provera injection administered?', '["Monthly", "Every 3 months (12-13 weeks)", "Yearly", "Every 6 months"]', 1, 'It is a long-acting injectable progestin.'),
    (v_case_id, 'What is a common side effect of Depo-Provera?', '["Weight gain", "Irregular spotting initially, progressing to amenorrhea", "Reversible decrease in bone mineral density", "All of the above"]', 3, 'Depo is the only contraceptive significantly associated with weight gain.'),
    (v_case_id, 'What is the \"Black Box Warning\" for Depo-Provera?', '["Heart attack", "Bone mineral density loss with long-term use", "Cancer", "Blindness"]', 1, 'The loss is generally reversible after discontinuation.');

    ---------------------------------------------------------------------------
    -- CASE 07: Nexplanon Implant (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Subdermal Implant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Subdermal Implant', 'A patient has a Nexplanon (Etonogestrel) implant placed in her upper arm.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Subdermal Implant', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long is the Nexplanon implant FDA-approved for?', '["1 year", "3 years", "5 years", "10 years"]', 1, 'It is a highly effective 3-year method.'),
    (v_case_id, 'What is the most common reason for early removal of the implant?', '["Pain", "Unpredictable/Irregular vaginal bleeding", "Infection", "Weight gain"]', 1, 'Irregular bleeding is the #1 side effect; counseling is essential.'),
    (v_case_id, 'What is the primary MOA of the Nexplanon?', '["Inhibition of ovulation", "Killing eggs", "Uterine scarring", "None"]', 0, 'Unlike POPs, the implant consistently suppresses ovulation.');

    ---------------------------------------------------------------------------
    -- CASE 08: Copper IUD - Paragard (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Non-Hormonal LARC' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Non-Hormonal LARC', 'A woman wants a long-term method but does not want any hormones.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Non-Hormonal LARC', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long can the Copper IUD (Paragard) remain in place?', '["3 years", "5 years", "10 years", "20 years"]', 2, 'It is the longest-lasting reversible method.'),
    (v_case_id, 'What is a common side effect of the Copper IUD?', '["Amenorrhea", "Increased menstrual bleeding and cramping", "Weight gain", "Acne"]', 1, 'Copper causes a sterile inflammatory response that can increase flow.'),
    (v_case_id, 'What is the MOA of the Copper IUD?', '["Hormonal suppression", "Copper ions are toxic to sperm (spermicidal)", "Stopping ovulation", "None"]', 1, 'It prevents fertilization by interfering with sperm motility.');

    ---------------------------------------------------------------------------
    -- CASE 09: Levonorgestrel IUD - Mirena (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hormonal IUD' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hormonal IUD', 'A patient with heavy periods (menorrhagia) is considering an IUD.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hormonal IUD', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the Mirena IUD affect menstrual bleeding?', '["Increases it", "Significantly decreases it (often leading to amenorrhea)", "No effect", "None"]', 1, 'It is FDA-approved for the treatment of heavy menstrual bleeding.'),
    (v_case_id, 'What is the primary MOA of the LNG-IUD?', '["Thickening cervical mucus and thinning the endometrium", "Systemic suppression of ovulation", "Killing the ovaries", "None"]', 0, 'While some women stop ovulating, the primary effect is local.'),
    (v_case_id, 'What is a rare but serious risk during IUD insertion?', '["Uterine perforation (usually < 1 in 1000)", "Immediate heart attack", "Death", "None"]', 0, 'Perforation risk is slightly higher in breastfeeding women.');

    ---------------------------------------------------------------------------
    -- CASE 10: Emergency Contraception - Plan B (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Morning After' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Morning After', 'A patient had unprotected intercourse 24 hours ago and wants emergency contraception (EC).', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Morning After', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most commonly used over-the-counter EC pill?', '["Ella", "Levonorgestrel 1.5mg (Plan B One-Step)", "Aspirin", "Combined OCPs"]', 1, 'Plan B is available without a prescription.'),
    (v_case_id, 'What is the time limit for taking Plan B for maximum effectiveness?', '["24 hours", "72 hours (though can be used up to 120h with lower efficacy)", "1 week", "None"]', 1, 'Effectiveness decreases as the time from intercourse increases.'),
    (v_case_id, 'How does Plan B work?', '["It is an abortifacient", "It delays or inhibits ovulation", "It prevents implantation", "None"]', 1, 'It does NOT work if ovulation has already occurred.');

    ---------------------------------------------------------------------------
    -- CASE 11: Emergency Contraception - Ella (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Advanced EC' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Advanced EC', 'A patient had unprotected intercourse 4 days (96 hours) ago.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Advanced EC', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which prescription EC pill is effective up to 120 hours (5 days) after intercourse?', '["Plan B", "Ulipristal acetate (Ella)", "Mifepristone", "None"]', 1, 'Ella maintains its efficacy better than Plan B over the 5-day window.'),
    (v_case_id, 'What is the MOA of Ulipristal?', '["Progestin", "Selective Progesterone Receptor Modulator (SPRM) that delays ovulation", "Antibiotic", "None"]', 1, 'It can delay ovulation even after the LH surge has started.'),
    (v_case_id, 'Which EC method is the MOST effective overall?', '["Plan B", "Ella", "Copper IUD insertion within 5 days", "Combined pills"]', 2, 'The Copper IUD has a failure rate of < 0.1% when used as EC.');

    ---------------------------------------------------------------------------
    -- CASE 12: Tubal Ligation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Female Sterilization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Female Sterilization', 'A 40-year-old G4P4 desires permanent contraception.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Female Sterilization', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If a patient becomes pregnant after a tubal ligation, what is the most likely location of the pregnancy?', '["Intrauterine", "Ectopic (Tubal)", "Cervical", "None"]', 1, 'Failure of sterilization carries a very high risk of ectopic pregnancy.'),
    (v_case_id, 'Which type of sterilization is currently preferred for reducing ovarian cancer risk?', '["Tubal ligation (clips)", "Bilateral Salpingectomy (removal of the tubes)", "Hysterectomy", "None"]', 1, 'Many serous ovarian cancers originate in the fimbriated end of the tube.'),
    (v_case_id, 'Is tubal ligation immediately effective?', '["No, wait 3 months", "Yes, it is effective immediately", "Depends on age", "None"]', 1, 'Unlike vasectomy, female sterilization is effective as soon as the procedure is finished.');

    ---------------------------------------------------------------------------
    -- CASE 13: Vasectomy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Male Sterilization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Male Sterilization', 'A couple is choosing between tubal ligation and vasectomy.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Male Sterilization', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which procedure is generally safer, cheaper, and has a lower failure rate?', '["Tubal ligation", "Vasectomy", "They are equal", "None"]', 1, 'Vasectomy is a minor office procedure with fewer complications.'),
    (v_case_id, 'Is a vasectomy immediately effective?', '["Yes", "No, backup contraception is needed until a follow-up semen analysis confirms azoospermia (usually 3 months or 20 ejaculations later)", "Depends on the doctor", "None"]', 1, 'Sperm remains in the vas deferens downstream from the site of ligation.'),
    (v_case_id, 'Does vasectomy affect sexual function or testosterone levels?', '["Yes", "No", "Only in older men", "None"]', 1, 'It only blocks the passage of sperm; it does not affect hormonal or erectile function.');

    ---------------------------------------------------------------------------
    -- CASE 14: Barrier Methods (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Condoms and Diaphragms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Condoms and Diaphragms', 'A patient wants protection against both pregnancy and STIs.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Condoms and Diaphragms', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which method provides the best protection against STIs?', '["IUD", "Pills", "Male Latex Condoms", "Diaphragm"]', 2, 'Condoms are the only method that provides dual protection.'),
    (v_case_id, 'What is a significant risk of leaving a diaphragm or sponge in for too long (> 24 hours)?', '["Pregnancy", "Toxic Shock Syndrome (TSS)", "Infertility", "None"]', 1, 'Prolonged retention of barrier devices increases the risk of S. aureus overgrowth.'),
    (v_case_id, 'What must be used with a diaphragm to ensure effectiveness?', '["Antibiotics", "Spermicide", "Water", "None"]', 1, 'Spermicidal jelly is applied to the rim and cup.');

    ---------------------------------------------------------------------------
    -- CASE 15: Medical Abortion - Mifepristone (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Abortion Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Abortion Pill', 'A patient at 7 weeks gestation chooses a medical abortion.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Abortion Pill', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the MOA of Mifepristone?', '["Progesterone antagonist (causes decidual breakdown)", "Prostaglandin", "Fetal toxin", "None"]', 0, 'Mifepristone blocks the progesterone needed to maintain the pregnancy.'),
    (v_case_id, 'Which medication is given 24-48 hours after Mifepristone to induce contractions?', '["Oxytocin", "Misoprostol (Prostaglandin E1)", "Methergine", "Aspirin"]', 1, 'Misoprostol causes cervical ripening and uterine contractions.'),
    (v_case_id, 'Up to how many weeks of gestation is medical abortion generally FDA-approved?', '["6 weeks", "10-11 weeks", "15 weeks", "20 weeks"]', 1, 'Effectiveness is highest in the first trimester.');

    ---------------------------------------------------------------------------
    -- CASE 16: Surgical Abortion (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aspiration Procedures' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aspiration Procedures', 'A patient at 9 weeks gestation undergoes a surgical termination.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Aspiration Procedures', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common first-trimester surgical method?', '["Manual or Electric Vacuum Aspiration (MVA/EVA)", "Dilation and Evacuation (D&E)", "Hysterectomy", "None"]', 0, 'Suction aspiration is the standard for early termination.'),
    (v_case_id, 'What is a common complication of surgical abortion?', '["Hemorrhage, infection, or retained products of conception", "Twins", "Diabetes", "None"]', 0, 'Complication rates are low but significant.'),
    (v_case_id, 'What is used to dilate the cervix prior to a second-trimester D&E?', '["Antibiotics", "Osmotic dilators (e.g., Laminaria)", "Water", "None"]', 1, 'Laminaria sticks absorb moisture and slowly expand the cervix.');

    ---------------------------------------------------------------------------
    -- CASE 17: Post-Abortion RhoGAM (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rh Sensitization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rh Sensitization', 'An Rh-negative patient has a miscarriage or termination.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rh Sensitization', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must be given to any Rh-negative woman undergoing an abortion or experiencing a miscarriage?', '["Antibiotics", "Rho(D) Immune Globulin (RhoGAM)", "Iron", "Vitamins"]', 1, 'This prevents Rh isoimmunization in future pregnancies.'),
    (v_case_id, 'What is the risk if RhoGAM is NOT given?', '["Maternal death", "Hemolytic Disease of the Fetus/Newborn (HDFN) in the NEXT pregnancy", "Infertility", "None"]', 1, 'The mother will form antibodies that cross the placenta in subsequent pregnancies.'),
    (v_case_id, 'Is RhoGAM needed for an early medical abortion?', '["No", "Yes, even early gestations can cause sensitization"]', 1, 'Current guidelines recommend RhoGAM for any pregnancy loss in an Rh-negative woman.');

    ---------------------------------------------------------------------------
    -- CASE 18: Infertility Workup Timing (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Defining Infertility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Defining Infertility', 'A 28-year-old couple has been trying to conceive for 6 months.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Defining Infertility', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard definition of infertility for a woman < 35?', '["6 months of unprotected intercourse", "12 months of regular, unprotected intercourse", "2 years", "None"]', 1, 'Evaluation usually begins after 1 year for younger couples.'),
    (v_case_id, 'When should evaluation begin for a woman >= 35?', '["After 1 year", "After 6 months", "Immediately", "None"]', 1, 'Evaluation is accelerated due to the rapid decline in ovarian reserve.'),
    (v_case_id, 'What percentage of infertility is due to male factors?', '["0%", "40-50%", "100%", "10%"]', 1, 'Male factors (sperm count/motility) are common and must be tested first.');

    ---------------------------------------------------------------------------
    -- CASE 19: Semen Analysis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Male Factor Infertility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Male Factor Infertility', 'The first step in an infertility workup is a semen analysis.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Male Factor Infertility', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for no sperm in the ejaculate?', '["Oligospermia", "Azoospermia", "Asthenospermia", "None"]', 1, 'Azoospermia can be obstructive or non-obstructive.'),
    (v_case_id, 'What is \"Asthenospermia\"?', '["Low count", "Poor motility", "Abnormal morphology", "None"]', 1, 'Sperm must be able to swim to reach the egg.'),
    (v_case_id, 'Why is semen analysis done twice (at least 1 month apart)?', '["To make more money", "Because sperm takes ~70 days to mature and a single sample may be affected by recent illness/stress", "It is not needed twice", "None"]', 1, 'Wait for a full spermatogenic cycle for an accurate baseline.');

    ---------------------------------------------------------------------------
    -- CASE 20: Hysterosalpingogram - HSG (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tubal Patency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tubal Patency', 'A woman is undergoing a workup for secondary infertility.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tubal Patency', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does an HSG test?', '["Ovarian reserve", "Tubal patency and uterine cavity contour", "Blood sugar", "None"]', 1, 'Radio-opaque dye is injected into the uterus and followed through the tubes.'),
    (v_case_id, 'What finding on HSG indicates patent tubes?', '["Dye stays in the uterus", "Spillage of dye into the peritoneal cavity", "Dye enters the bladder", "None"]', 1, 'Spillage confirms the tubes are open.'),
    (v_case_id, 'What is a \"Hydrosalpinx\"?', '["A healthy tube", "A fluid-filled, dilated, blocked fallopian tube", "A tumor", "None"]', 1, 'Hydrosalpinges significantly reduce IVF success rates and often require removal.');

    ---------------------------------------------------------------------------
    -- CASE 21: Post-Vasectomy Pregnancy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vasectomy Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vasectomy Failure', 'A woman becomes pregnant 1 month after her husband''s vasectomy.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vasectomy Failure', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of this failure?', '["Regrowth of the vas", "Unprotected intercourse before the confirmational semen analysis (clearing of stored sperm)", "Poor surgery", "None"]', 1, 'Sperm can persist for weeks/months after the procedure.'),
    (v_case_id, 'How many months of backup are usually required?', '["1 month", "3 months", "6 months", "None"]', 1, 'Three months is the standard waiting period.'),
    (v_case_id, 'Is recanalization (spontaneous regrowth) common?', '["Yes", "No, it is extremely rare (approx 1 in 2000)", "Always", "None"]', 1, 'Vasectomy is a very reliable permanent method.');

    ---------------------------------------------------------------------------
    -- CASE 22: Lactational Amenorrhea Method - LAM (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breastfeeding as Contraception' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breastfeeding as Contraception', 'A postpartum mother wants to use breastfeeding as her only form of birth control.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Breastfeeding as Contraception', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the criteria for LAM to be effective?', '["Exclusive breastfeeding, baby < 6 months old, and mother remains amenorrheic", "Any breastfeeding", "Partial breastfeeding", "None"]', 0, 'All three conditions must be met for high efficacy.'),
    (v_case_id, 'Does supplemental formula feeding affect LAM?', '["No", "Yes, any supplementation reduces the sucking stimulus and increases the risk of ovulation"]', 1, 'LAM requires 24/7 exclusive breastfeeding.'),
    (v_case_id, 'Is LAM recommended for long-term use?', '["Yes", "No, it is only reliable for the first 6 months postpartum", "Only in older women", "None"]', 1, 'After 6 months, the risk of ovulation increases significantly.');

    ---------------------------------------------------------------------------
    -- CASE 23: Natural Family Planning - NFP (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rhythm Method' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rhythm Method', 'A couple wants to use the \"Standard Days Method\".', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhythm Method', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Fertile Window\" in a typical 28-day cycle?', '["Day 1-5", "Day 8 to Day 19", "Day 25-28", "None"]', 1, 'Sperm can live for 5 days and the egg for 24 hours.'),
    (v_case_id, 'What happens to Basal Body Temperature (BBT) after ovulation?', '["It drops", "It rises by ~0.5 to 1.0 degree F (due to progesterone)", "No change", "None"]', 1, 'BBT rise confirms ovulation has ALREADY occurred.'),
    (v_case_id, 'What happens to cervical mucus during the fertile window?', '["It becomes dry", "It becomes clear, thin, and stretchy (Spinnbarkeit)", "It turns green", "None"]', 1, 'Fertile mucus facilitates sperm passage.');

    ---------------------------------------------------------------------------
    -- CASE 24: Contraceptive Patch - Ortho Evra (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Transdermal Patch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Transdermal Patch', 'A patient is starting the contraceptive patch.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Transdermal Patch', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How often is the patch changed?', '["Daily", "Weekly (for 3 weeks, followed by a patch-free week)", "Monthly", "None"]', 1, 'It is a once-a-week method.'),
    (v_case_id, 'In which group of patients is the patch LESS effective?', '["Smokers", "Women weighing > 90 kg (198 lbs)", "Teenagers", "None"]', 1, 'Increased body mass can reduce the systemic concentration of the hormones.'),
    (v_case_id, 'What is a specific risk of the patch compared to pills?', '["Slightly higher systemic estrogen exposure (which may increase VTE risk)", "Lower estrogen", "Hair loss", "None"]', 0, 'The patch delivers continuous estrogen without the \"first-pass\" metabolism of a pill.');

    ---------------------------------------------------------------------------
    -- CASE 25: Vaginal Ring - NuvaRing (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Vaginal Ring' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Vaginal Ring', 'A patient is using the NuvaRing.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Vaginal Ring', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long is the ring left in the vagina?', '["1 week", "3 weeks (followed by a 1-week ring-free period)", "1 month", "None"]', 1, 'It is a monthly method with a week for withdrawal bleeding.'),
    (v_case_id, 'If the ring falls out, how long can it be out before backup is needed?', '["10 minutes", "Up to 3 hours", "24 hours", "None"]', 1, 'If out for > 3 hours, backup is required for 7 days.'),
    (v_case_id, 'Does the ring need to be in a specific position in the vagina?', '["Yes, around the cervix", "No, it just needs to be in contact with the vaginal wall for absorption", "Only at the top", "None"]', 1, 'Positioning is flexible as long as it is comfortable.');

    ---------------------------------------------------------------------------
    -- CASE 26: Contraception and Sickle Cell (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sickle Cell Choices' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sickle Cell Choices', 'A patient with Sickle Cell Disease needs contraception.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sickle Cell Choices', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which contraceptive method is often RECOMMENDED for patients with Sickle Cell?', '["COCs", "Depo-Provera (may reduce the frequency of sickle cell crises)", "Copper IUD", "None"]', 1, 'Depo may stabilize the red cell membrane.'),
    (v_case_id, 'Can sickle cell patients take estrogen?', '["Yes", "Generally avoided as they are already at high risk for VTE and stroke", "Only if stable", "None"]', 1, 'Estrogen-containing methods are usually Category 3 or 4.'),
    (v_case_id, 'What is the best LARC for a sickle cell patient?', '["Mirena IUD or Nexplanon", "Copper IUD", "None", "Depo"]', 0, 'Progestin-only LARCs are safe and effective.');

    ---------------------------------------------------------------------------
    -- CASE 27: Contraception and Epilepsy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Seizure Med Interactions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Seizure Med Interactions', 'A patient taking Phenytoin (Dilantin) needs birth control.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Seizure Med Interactions', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the issue with many anti-seizure meds and OCPs?', '["They cause seizures", "They induce liver enzymes (P450) which lowers the effective level of the hormones and increases pill failure", "They cause bleeding", "None"]', 1, 'Enzyme inducers significantly reduce COC effectiveness.'),
    (v_case_id, 'Which method is NOT affected by enzyme-inducing anti-epileptic drugs?', '["OCPs", "Copper IUD and LNG-IUD", "Patch", "Ring"]', 1, 'IUDs provide local or non-hormonal action and avoid liver metabolism.'),
    (v_case_id, 'Depo-Provera is sometimes used in epilepsy because:', '["It is cheap", "It may raise the seizure threshold", "It stops hair growth", "None"]', 1, 'High doses of progestin may have some anticonvulsant properties.');

    ---------------------------------------------------------------------------
    -- CASE 28: Postpartum - Estrogen Timing (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Estrogen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Estrogen', 'A patient just delivered and wants to start her pills immediately.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Postpartum Estrogen', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long should a woman wait to start combined (estrogen-containing) methods after delivery?', '["1 week", "At least 3 weeks (21 days) to 6 weeks depending on VTE risk factors", "1 year", "None"]', 1, 'Postpartum is a state of hypercoagulability; adding estrogen increases VTE risk.'),
    (v_case_id, 'Can progestin-only methods (like POPs or Depo) be started immediately?', '["No", "Yes, they do not carry the same VTE risk as estrogen", "Only if bottle-feeding", "None"]', 1, 'POPs can be started on Day 1.'),
    (v_case_id, 'Can an IUD be placed immediately after delivery of the placenta?', '["No", "Yes, within 10 minutes of placental delivery (Post-placental insertion)", "Only after 1 year", "None"]', 1, 'While expulsion risk is slightly higher, it is a very effective strategy.');

    ---------------------------------------------------------------------------
    -- CASE 29: Breastfeeding and Contraception (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Contraception for the Nursing Mother' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Contraception for the Nursing Mother', 'A breastfeeding mother is worried that birth control will dry up her milk.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Contraception for the Nursing Mother', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hormone is known to potentially decrease milk supply?', '["Progesterone", "Estrogen", "Testosterone", "Insulin"]', 1, 'Estrogen can suppress milk production.'),
    (v_case_id, 'Which contraceptive class is generally preferred for breastfeeding mothers?', '["Combined pills", "Progestin-only methods (POPs, Depo, IUD, Implant)", "Only condoms", "None"]', 1, 'Progestins do not affect milk supply or quality.'),
    (v_case_id, 'What is the risk of using COCs while breastfeeding?', '["Milk becomes toxic", "Decreased milk volume and shortened duration of breastfeeding", "Baby grows too fast", "None"]', 1, 'Estrogen is usually avoided until 6 months or until the baby is well-established on solids.');

    ---------------------------------------------------------------------------
    -- CASE 30: Confidentiality in Adolescents (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Teen Contraceptive Access' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Teen Contraceptive Access', 'A 16-year-old girl requests birth control but does not want her parents to know.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Teen Contraceptive Access', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In most US states, can minors consent to contraceptive services without parental permission?', '["Yes", "No", "Only if married", "Only if they have a job"]', 0, 'Providing confidential access reduces unintended pregnancies.'),
    (v_case_id, 'What is the most effective contraceptive option for an adolescent?', '["Pills", "LARC (IUD or Implant)", "Withdrawal", "Condoms only"]', 1, 'ACOG recommends LARC as first-line for teens because they remove the need for daily adherence.'),
    (v_case_id, 'What is a legal obligation that overrides confidentiality in minor care?', '["Smoking", "Suspected sexual abuse or child abuse", "Poor grades", "None"]', 1, 'Safety and reporting requirements take priority.');

    ---------------------------------------------------------------------------
    -- CASE 31: Sperm Life Span (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Survival of Sperm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Survival of Sperm', 'A patient is curious how long sperm can live in the female reproductive tract.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Survival of Sperm', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long can sperm survive and remain fertile after ejaculation?', '["1 hour", "3 to 5 days", "10 days", "24 hours"]', 1, 'Sperm survival in cervical mucus is the basis for the fertile window.'),
    (v_case_id, 'How long is an unfertilized EGG viable after ovulation?', '["1 hour", "12 to 24 hours", "3 days", "None"]', 1, 'The egg has a much shorter window of viability than the sperm.'),
    (v_case_id, 'Pregnancy can occur from intercourse up to how many days BEFORE ovulation?', '["1 day", "5 days", "10 days", "None"]', 1, 'Sperm deposited early can "wait" in the fallopian tubes.');

    ---------------------------------------------------------------------------
    -- CASE 32: Tubal Ligation - Failure Location (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sterilization Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sterilization Failure', 'A patient had a bilateral tubal ligation 2 years ago and now has a positive pregnancy test and right-sided pain.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sterilization Failure', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely location of the pregnancy?', '["Intrauterine", "Fallopian tube (Ectopic)", "Ovary", "None"]', 1, 'Any pregnancy after tubal ligation is an ectopic until proven otherwise.'),
    (v_case_id, 'What is the lifetime failure rate of tubal ligation?', '["0%", "Approx. 1.8% over 10 years", "5%", "10%"]', 1, 'It is very effective but not 100%.'),
    (v_case_id, 'Which age group is most likely to experience a failure of tubal ligation?', '["Women over 40", "Young women (under 30) at the time of procedure", "Postmenopausal women", "None"]', 1, 'Younger women have many years of remaining fertility and a higher chance of recanalization.');

    ---------------------------------------------------------------------------
    -- CASE 33: Medical Abortion - Follow-up (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Confirming the Abortion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Confirming the Abortion', 'A patient has completed her medical abortion at home.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Confirming the Abortion', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the completion of a medical abortion usually confirmed?', '["Patient just feels it", "Follow-up ultrasound or serial hCG levels (showing a > 80% drop)", "Urine dipstick", "None"]', 1, 'Ensuring the pregnancy is fully expelled prevents complications like infection.'),
    (v_case_id, 'What is a warning sign of an INCOMPLETE medical abortion?', '["No bleeding", "Excessively heavy bleeding (soaking 2 pads/hour for 2 hours) or fever", "Normal periods", "None"]', 1, 'Heavy bleeding warrants immediate evaluation.'),
    (v_case_id, 'When can a patient start a new contraceptive method after a medical abortion?', '["Wait 1 year", "Immediately (e.g., on the day she takes Misoprostol or shortly after)", "Wait 1 month", "None"]', 1, 'Ovulation can occur as early as 8-10 days after termination.');

    ---------------------------------------------------------------------------
    -- CASE 34: Infertility - Ovarian Reserve (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Checking the Eggs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Checking the Eggs', 'A 38-year-old woman is concerned about her egg supply.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Checking the Eggs', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What blood test is a reliable marker for ovarian reserve?', '["Estrogen", "Anti-Mullerian Hormone (AMH)", "Testosterone", "hCG"]', 1, 'AMH is produced by the small follicles and is stable throughout the cycle.'),
    (v_case_id, 'What is the \"Antral Follicle Count\" (AFC)?', '["A blood test", "A transvaginal ultrasound to count small follicles (2-10 mm) at the start of the cycle", "A skin test", "None"]', 1, 'Higher AFC correlates with better ovarian response.'),
    (v_case_id, 'What happens to FSH as ovarian reserve declines?', '["It drops", "It rises (as the body tries harder to stimulate the ovaries)", "No change", "None"]', 1, 'High Day 3 FSH is a sign of diminished reserve.');

    ---------------------------------------------------------------------------
    -- CASE 35: Hysterectomy vs Sterilization (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Definitive Permanent Method' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Definitive Permanent Method', 'A patient asks if she can have a hysterectomy just for sterilization.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Definitive Permanent Method', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is hysterectomy a recommended method for sterilization alone?', '["Yes", "No, it is major surgery with significantly higher risks than tubal ligation or vasectomy", "Only in smokers", "None"]', 1, 'Hysterectomy should only be done for specific gynecological indications.'),
    (v_case_id, 'What is the benefit of salpingectomy over tubal ligation?', '["Cheaper", "Decreases the risk of future ovarian cancer", "Faster", "None"]', 1, 'Total removal of the tube is now becoming the standard of care.'),
    (v_case_id, 'What is \"Essure\"?', '["A pill", "A historical method of hysteroscopic sterilization (no longer available in the US)", "A type of condom", "None"]', 1, 'Essure was removed from the market due to chronic pain and other complications.');

    ---------------------------------------------------------------------------
    -- CASE 36: IUD - Actinomyces on Pap (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'IUD Findings' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'IUD Findings', 'A patient with an IUD has \"Actinomyces-like organisms\" noted on her routine Pap smear.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'IUD Findings', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management if the patient is ASYMPTOMATIC?', '["Immediate IUD removal and antibiotics", "No treatment needed; the IUD can stay in place", "Hysterectomy", "D&C"]', 1, 'Actinomyces is a normal colonizer and does not require treatment unless there are signs of infection (pelvic pain/fever).'),
    (v_case_id, 'If the patient with Actinomyces HAS pelvic pain, what is the management?', '["Remove IUD and treat with Penicillin", "Just antibiotics", "Just remove IUD", "None"]', 0, 'Symptomatic infection (Pelvic Inflammatory Disease) requires treatment.'),
    (v_case_id, 'What are \"IUD strings\"?', '["The device itself", "Monofilament tails that protrude through the cervix to allow for removal and confirm placement", "Parts of the uterus", "None"]', 1, 'Checking strings confirms the IUD has not been expelled.');

    ---------------------------------------------------------------------------
    -- CASE 37: Spermicide Risks (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemical Barriers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemical Barriers', 'A patient is using Nonoxynol-9 (spermicide) frequently.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemical Barriers', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a significant downside of frequent spermicide use?', '["It causes cancer", "It can cause vaginal irritation and small ulcers, potentially INCREASING the risk of HIV transmission", "It smells bad", "None"]', 1, 'Disruption of the vaginal mucosa is a major risk factor for infection.'),
    (v_case_id, 'How effective is spermicide when used ALONE?', '["99%", "Relatively low (approx 70-80%)", "50%", "None"]', 1, 'It should ideally be used in combination with a barrier method.'),
    (v_case_id, 'What is the MOA of Nonoxynol-9?', '["Hormonal", "It is a surfactant that destroys the sperm cell membrane", "Stops ovulation", "None"]', 1, 'It is a chemical detergent.');

    ---------------------------------------------------------------------------
    -- CASE 38: Infertility - Luteal Phase Defect (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Progesterone Problems' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Progesterone Problems', 'A woman has very short cycles and a low Day 21 progesterone level.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Progesterone Problems', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely issue?', '["Ovulation didn''t happen", "Luteal Phase Defect (inadequate progesterone production by the corpus luteum)", "Uterine scar", "None"]', 1, 'Progesterone is required to maintain the lining for implantation.'),
    (v_case_id, 'What is the \"Day 21 Progesterone\" test used for?', '["To check for eggs", "To confirm that ovulation HAS occurred", "To check for twins", "None"]', 1, 'A level > 3 ng/mL generally indicates ovulation.'),
    (v_case_id, 'How is luteal phase defect often treated in women trying to conceive?', '["Hormone replacement", "Progesterone supplementation (pills or vaginal suppositories) during the luteal phase", "More sugar", "None"]', 1, 'Supporting the luteal phase can help maintain early pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 39: Contraception and Migraines (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neurological Symptoms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neurological Symptoms', 'A patient reports severe headaches with flashing lights and blind spots.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neurological Symptoms', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this type of headache called?', '["Tension headache", "Migraine with Aura", "Cluster headache", "None"]', 1, 'Visual disturbances are classic for an aura.'),
    (v_case_id, 'Is estrogen safe for this patient?', '["Yes", "No, absolute contraindication due to significantly increased risk of ischemic stroke", "Only if taken with food", "None"]', 1, 'Stroke risk is 2-4 times higher in migraineurs taking estrogen.'),
    (v_case_id, 'What is a safe contraceptive option for a patient with migraine with aura?', '["Copper IUD or Levonorgestrel IUD", "Nexplanon", "Depo-Provera", "All of the above"]', 3, 'Any progestin-only or non-hormonal method is acceptable.');

    ---------------------------------------------------------------------------
    -- CASE 40: Contraception and Breast Cancer (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hormone Sensitive Cancers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hormone Sensitive Cancers', 'A patient with a current diagnosis of breast cancer needs birth control.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hormone Sensitive Cancers', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Are hormonal methods (even progestin-only) safe for this patient?', '["Yes", "No, hormonal contraception is a Category 4 (absolute) contraindication in current breast cancer", "Only if it is an IUD", "None"]', 1, 'Many breast cancers are sensitive to both estrogen and progesterone.'),
    (v_case_id, 'What is the ONLY highly effective method recommended for a patient with current breast cancer?', '["Condoms", "Copper IUD", "Vasectomy", "None"]', 1, 'The Copper IUD is the only hormone-free LARC.'),
    (v_case_id, 'Why is the Mirena (LNG-IUD) avoided in current breast cancer?', '["It is too big", "It releases local and small amounts of systemic progestin which could theoretically stimulate cancer cells", "It causes bleeding", "None"]', 1, 'Mirena is Category 4 for current breast cancer.');

    ---------------------------------------------------------------------------
    -- CASE 41: Post-abortion Complications - RPOC (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Retained Products' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Retained Products', 'A patient has heavy bleeding and cramping 1 week after a surgical abortion.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Retained Products', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Infection", "Retained Products of Conception (RPOC)", "Uterine rupture", "None"]', 1, 'Residual tissue keeps the uterus from contracting and causes bleeding.'),
    (v_case_id, 'How is RPOC diagnosed on ultrasound?', '["Looking for a fetus", "Looking for a thickened, irregular endometrial stripe with vascular flow (on Doppler)", "Looking for fluid", "None"]', 1, 'Vascular flow in the endometrial stripe confirms retained tissue.'),
    (v_case_id, 'What is the treatment for RPOC?', '["Antibiotics only", "Repeat aspiration (D&C)", "Observation", "None"]', 1, 'The tissue must be removed surgically.');

    ---------------------------------------------------------------------------
    -- CASE 42: Septic Abortion (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infected Termination' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infected Termination', 'A patient presents with fever, chills, abdominal pain, and foul-smelling vaginal discharge 2 days after an abortion.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infected Termination', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Normal recovery", "Septic Abortion", "UTI", "Appendicitis"]', 1, 'This is a life-threatening emergency.'),
    (v_case_id, 'What is the management of septic abortion?', '["Antibiotics only", "IV Broad-spectrum antibiotics AND immediate surgical evacuation of the uterus", "Observation", "None"]', 1, 'Removing the source of infection is critical for resuscitation.'),
    (v_case_id, 'What is a rare but serious long-term consequence of a septic abortion?', '["Asherman syndrome (uterine scarring)", "Twins", "Diabetes", "None"]', 0, 'Severe infection can damage the basalis layer of the endometrium.');

    ---------------------------------------------------------------------------
    -- CASE 43: Contraception and Liver Disease (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hepatobiliary Safety' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hepatobiliary Safety', 'A patient with active Hepatitis or Cirrhosis needs birth control.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hepatobiliary Safety', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is estrogen safe in patients with active liver disease?', '["Yes", "No, it is generally contraindicated as it is metabolized by the liver", "Only in low doses", "None"]', 1, 'COCs are Category 3 or 4 for active liver disease.'),
    (v_case_id, 'What is a safe choice for a patient with Cirrhosis?', '["Copper IUD", "Nexplanon", "OCPs", "None"]', 0, 'Non-hormonal methods avoid hepatic metabolic pathways.'),
    (v_case_id, 'Can hormonal methods be used once liver enzymes have normalized?', '["No", "Yes, in many cases", "Only after 10 years", "None"]', 1, 'Wait for resolution of acute flare-ups.');

    ---------------------------------------------------------------------------
    -- CASE 44: Diaphragm and UTIs (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fitting Method' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fitting Method', 'A patient using a diaphragm reports frequent urinary tract infections.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fitting Method', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does a diaphragm increase UTI risk?', '["It carries bacteria", "The rim can press against the urethra, causing stasis, and spermicide can alter vaginal flora", "It doesn''t", "None"]', 1, 'Both mechanical and chemical factors contribute.'),
    (v_case_id, 'What is the management?', '["Antibiotics forever", "Try a different size or a different contraceptive method", "Hysterectomy", "None"]', 1, 'Changing methods is often necessary if UTIs recur.'),
    (v_case_id, 'How long must a diaphragm remain in place after intercourse?', '["6 minutes", "At least 6 hours", "1 week", "None"]', 1, 'Premature removal increases pregnancy risk.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vasectomy follow-up (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clearing the Pipes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clearing the Pipes', 'A man is impatient after his vasectomy.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clearing the Pipes', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many ejaculations are typically needed to clear the remaining sperm?', '["One", "Approx. 20 ejaculations", "100", "None"]', 1, 'This is a rough clinical guideline used alongside the 3-month wait.'),
    (v_case_id, 'What happens if sperm are seen on the first follow-up analysis?', '["Try again in 1-2 months and continue backup", "The surgery failed", "It is fine", "None"]', 0, 'Persistence of motile sperm warrants further follow-up.'),
    (v_case_id, 'What is the success rate of vasectomy reversal?', '["100%", "Variable (approx 50-70% for patency, but lower for pregnancy)", "0%", "None"]', 1, 'While reversible, success is not guaranteed and it should be treated as permanent.');

    ---------------------------------------------------------------------------
    -- CASE 46: Emergency Contraception and BMI (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'EC Effectiveness and Weight' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'EC Effectiveness and Weight', 'A patient with a BMI of 32 requests emergency contraception.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'EC Effectiveness and Weight', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which EC pill may have reduced efficacy in women with high BMI?', '["Plan B (Levonorgestrel)", "Ella (Ulipristal)", "Both", "None"]', 0, 'Plan B effectiveness drops significantly in women weighing > 165 lbs.'),
    (v_case_id, 'Which EC method is the best choice for an obese patient?', '["Copper IUD", "Two packs of Plan B", "Water", "None"]', 0, 'The Copper IUD is the gold standard for all weights.'),
    (v_case_id, 'If an IUD is not an option, which PILL is preferred for a BMI > 30?', '["Plan B", "Ella", "Nothing", "None"]', 1, 'Ella is more effective than Plan B in overweight and obese individuals.');

    ---------------------------------------------------------------------------
    -- CASE 47: Medical Abortion - Contraindications (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medical Abortion Safety' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medical Abortion Safety', 'A patient with a suspected ectopic pregnancy wants an abortion pill.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Medical Abortion Safety', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can medical abortion (Mifepristone) be used for an ectopic pregnancy?', '["Yes", "No, it is not an effective treatment for extra-uterine pregnancy", "Only if small", "None"]', 1, 'Ectopic pregnancy is a contraindication to medical abortion.'),
    (v_case_id, 'Which condition is a contraindication to Misoprostol?', '["Diabetes", "Known allergy to prostaglandins", "Age 40", "None"]', 1, 'Allergy is a clear contraindication.'),
    (v_case_id, 'Is chronic steroid use a contraindication to Mifepristone?', '["No", "Yes (it is a glucocorticoid antagonist)", "Only if high dose", "None"]', 1, 'Mifepristone blocks the action of steroids.');

    ---------------------------------------------------------------------------
    -- CASE 48: Hysterosalpingogram - Risks (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HSG Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HSG Complications', 'A patient is scheduled for an HSG.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'HSG Complications', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must be ruled out before performing an HSG?', '["Pregnancy and active Pelvic Inflammatory Disease (PID)", "Diabetes", "Obesity", "None"]', 0, 'You cannot perform the test if she is pregnant or has an active infection.'),
    (v_case_id, 'What is a common but benign side effect during HSG?', '["Severe hemorrhage", "Cramping and lightheadedness (vasovagal response)", "Hair loss", "None"]', 1, 'Uterine distension causes cramping.'),
    (v_case_id, 'What should be given if a patient has a history of PID or a hydrosalpinx is seen on HSG?', '["Pain meds only", "Prophylactic antibiotics (e.g., Doxycycline)", "Surgery", "None"]', 1, 'This prevents a flare-up of infection.');

    ---------------------------------------------------------------------------
    -- CASE 49: Combined Pills and Gallstones (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'COCs and the Gallbladder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'COCs and the Gallbladder', 'A patient with a history of cholelithiasis (gallstones) wants OCPs.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'COCs and the Gallbladder', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does estrogen affect the gallbladder?', '["It shrinks stones", "It increases cholesterol saturation in bile, potentially increasing the risk of stone formation", "No effect", "None"]', 1, 'Estrogen is a known risk factor for gallstones.'),
    (v_case_id, 'Is active gallbladder disease a contraindication to COCs?', '["No", "Yes (Category 3 or 4)", "Only in men", "None"]', 1, 'Wait for surgical or medical resolution.'),
    (v_case_id, 'Does estrogen affect liver tumors?', '["No", "Yes, it is associated with Benign Hepatic Adenomas", "It prevents them", "None"]', 1, 'While rare, hepatic adenomas are a known complication.');

    ---------------------------------------------------------------------------
    -- CASE 50: Infertility - Clomiphene Citrate (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ovulation Induction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ovulation Induction', 'A woman with anovulation is started on Clomiphene Citrate (Clomid).', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ovulation Induction', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Clomiphene work?', '["It is a progestin", "It is a SERM that blocks estrogen receptors in the hypothalamus, tricking the brain into making more GnRH/FSH", "It is a steroid", "None"]', 1, 'It induces the "blind" hypothalamus to stimulate the ovaries.'),
    (v_case_id, 'What is a significant risk of Clomiphene therapy?', '["Cancer", "Multiple gestation (twins) - approx 8-10% risk", "Weight loss", "None"]', 1, 'Hyperstimulation can release more than one egg.'),
    (v_case_id, 'What is the limit for the number of Clomiphene cycles generally recommended?', '["1 cycle", "6 cycles", "100 cycles", "Unlimited"]', 1, 'If no pregnancy occurs after 6 cycles, further evaluation or different therapy is needed.');

    RAISE NOTICE 'SUCCESS: 50 Contraception & Family Planning Case Blocks registered.';
END $$;

COMMIT;
