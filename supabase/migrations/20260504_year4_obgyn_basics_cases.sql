BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Ensure the Topic exists in Year 4
    INSERT INTO topics (title, slug, year_id, section, "order")
    VALUES ('Obstetrics & Gynecology Basics', 'obgyn-basics', 4, 'Obstetrics & Gynecology', 395)
    ON CONFLICT (slug) DO UPDATE SET 
        title = EXCLUDED.title,
        year_id = EXCLUDED.year_id,
        section = EXCLUDED.section
    RETURNING id INTO v_topic_id;

    -- If no insert happened (topic existed), fetch the ID
    IF v_topic_id IS NULL THEN
        SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-basics' LIMIT 1;
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Menstrual Cycle (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Normal Menstrual Physiology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Normal Menstrual Physiology', 'A 24-year-old woman tracks her cycle. She notices clear, stretchy cervical mucus and a slight rise in basal body temperature.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman tracks her cycle. She notices clear, stretchy cervical mucus and a slight rise in basal body temperature.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary hormone responsible for the clear, "egg-white" cervical mucus?', '["Progesterone", "Estrogen", "LH", "FSH"]', 1, 'Estrogen peaks just before ovulation, causing the cervical mucus to become thin, clear, and stretchy (spinnbarkeit).'),
    (v_case_id, 'The rise in basal body temperature (BBT) is caused by which hormone?', '["Estrogen", "Progesterone", "hCG", "Prolactin"]', 1, 'Progesterone, produced by the corpus luteum, has a thermogenic effect and raises the BBT by 0.5-1.0°F.'),
    (v_case_id, 'Which event triggers the onset of menses?', '["LH surge", "Estrogen peak", "Withdrawal of progesterone and estrogen", "FSH rise"]', 2, 'The regression of the corpus luteum leads to a sharp drop in progesterone and estrogen, causing endometrial sloughing.');

    ---------------------------------------------------------------------------
    -- CASE 02: Primary Amenorrhea (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Primary Amenorrhea - Turner Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Primary Amenorrhea - Turner Syndrome', 'A 16-year-old girl presents because she has never had a period. She has short stature, a webbed neck, and no secondary sexual characteristics.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl presents because she has never had a period. She has short stature, a webbed neck, and no secondary sexual characteristics.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely karyotype for this patient?', '["46,XX", "45,X", "47,XXY", "46,XY"]', 1, 'Turner syndrome (45,X) is a common cause of primary amenorrhea due to streak ovaries and hypergonadotropic hypogonadism.'),
    (v_case_id, 'What would the FSH levels likely show in this patient?', '["Low", "Normal", "High", "Undetectable"]', 2, 'High FSH indicates primary ovarian failure (the pituitary is trying to stimulate non-responsive ovaries).'),
    (v_case_id, 'What is the most common cardiac anomaly associated with this condition?', '["VSD", "Bicuspid aortic valve", "Mitral stenosis", "PDA"]', 1, 'Bicuspid aortic valve and coarctation of the aorta are common in Turner syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 03: Secondary Amenorrhea (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Secondary Amenorrhea - Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Secondary Amenorrhea - Pregnancy', 'A 28-year-old woman with regular cycles for 10 years presents with 2 months of absent menses.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old woman with regular cycles for 10 years presents with 2 months of absent menses.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the VERY FIRST test that must be performed in any woman with secondary amenorrhea?', '["Serum Prolactin", "FSH/LH", "Urine hCG", "TSH"]', 2, 'Pregnancy is the most common cause of secondary amenorrhea and must always be ruled out first.'),
    (v_case_id, 'If the pregnancy test is negative, and the patient has milky nipple discharge, what is the next step?', '["Mammogram", "Serum Prolactin level", "Progesterone challenge", "Brain MRI"]', 1, 'Galactorrhea in the setting of amenorrhea suggests hyperprolactinemia.'),
    (v_case_id, 'Which medication class is a common cause of drug-induced hyperprolactinemia?', '["Beta-blockers", "Antipsychotics (D2 antagonists)", "NSAIDs", "Statins"]', 1, 'Dopamine inhibits prolactin; D2 antagonists (like haloperidol or risperidone) block this inhibition.');

    ---------------------------------------------------------------------------
    -- CASE 04: Contraception - Combined Hormonal (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Contraceptive Counseling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Contraceptive Counseling', 'A 35-year-old woman who smokes 1 pack of cigarettes per day requests "the pill" for contraception.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old woman who smokes 1 pack of cigarettes per day requests "the pill" for contraception.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is Combined Oral Contraceptive (COC) use contraindicated in this patient?', '["No, it is safe", "Yes, due to her age and smoking status", "Only if she has hypertension", "Only if she has a family history of clots"]', 1, 'Women > 35 who smoke > 15 cigarettes/day have a significantly increased risk of MI and stroke with COCs (Category 4 contraindication).'),
    (v_case_id, 'What is the primary mechanism of action of the progestin component in COCs?', '["Thickening cervical mucus and inhibiting ovulation", "Thinning the endometrial lining only", "Destroying sperm", "Blocking the fallopian tubes"]', 0, 'Progestins thicken cervical mucus to block sperm and suppress LH to inhibit ovulation.'),
    (v_case_id, 'Which of the following is a NON-contraceptive benefit of COCs?', '["Decreased risk of breast cancer", "Decreased risk of ovarian and endometrial cancer", "Increased bone density", "Decreased risk of STIs"]', 1, 'COCs are known to reduce the risk of ovarian and endometrial cancers by about 50%.');

    ---------------------------------------------------------------------------
    -- CASE 05: Emergency Contraception (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Emergency Contraception' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Emergency Contraception', 'A 22-year-old woman presents 48 hours after unprotected intercourse requesting emergency contraception.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old woman presents 48 hours after unprotected intercourse requesting emergency contraception.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most effective method of emergency contraception if used within 5 days?', '["Levonorgestrel (Plan B)", "Copper IUD", "Ulipristal acetate (Ella)", "High-dose COCs (Yuzpe)"]', 1, 'The Copper IUD is >99% effective as emergency contraception and provides long-term protection.'),
    (v_case_id, 'What is the time window for the levonorgestrel (Plan B) emergency contraceptive pill?', '["24 hours", "72 hours (though somewhat effective up to 120)", "1 week", "10 days"]', 1, 'Plan B is most effective within 72 hours but can be used up to 120 hours.'),
    (v_case_id, 'How does levonorgestrel work as emergency contraception?', '["It causes an abortion", "It prevents fertilization and delays ovulation", "It prevents implantation of a fertilized egg", "It destroys the corpus luteum"]', 1, 'Plan B works primarily by delaying or inhibiting ovulation; it does not disrupt an existing pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 06: Polycystic Ovary Syndrome (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PCOS Diagnosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PCOS Diagnosis', 'A 22-year-old obese woman presents with irregular periods (4 per year), facial hair, and acne.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old obese woman presents with irregular periods (4 per year), facial hair, and acne.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Rotterdam criteria, what 3 findings are used for diagnosis? (Patient needs 2/3)', '["Obesity, Hirsutism, Acne", "Polycystic ovaries, Oligo/Anovulation, Clinical/Biochemical Hyperandrogenism", "High FSH, Low Estrogen, Amenorrhea", "Normal LH, Low Prolactin, Hirsutism"]', 1, 'The Rotterdam criteria require 2 of 3: Polycystic ovaries on US, Ovulatory dysfunction, and Hyperandrogenism.'),
    (v_case_id, 'What is the long-term risk of untreated chronic anovulation in PCOS?', '["Cervical cancer", "Endometrial cancer", "Ovarian cancer", "Breast cancer"]', 1, 'Unopposed estrogen (due to lack of progesterone from ovulation) leads to endometrial hyperplasia and a higher risk of endometrial carcinoma.'),
    (v_case_id, 'What is the first-line treatment for hirsutism in this patient if she does not want to conceive?', '["Metformin", "Combined Oral Contraceptives", "Clomiphene", "Spironolactone alone"]', 1, 'COCs suppress ovarian androgen production and increase Sex Hormone Binding Globulin (SHBG), which lowers free testosterone.');

    ---------------------------------------------------------------------------
    -- CASE 07: Physiological Changes in Pregnancy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pregnancy Physiology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pregnancy Physiology', 'A healthy 24-year-old G1P0 is in her 2nd trimester. Her blood pressure is 105/65 (lower than her pre-pregnancy 120/80), and her heart rate is slightly elevated.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy 24-year-old G1P0 is in her 2nd trimester. Her blood pressure is 105/65 (lower than her pre-pregnancy 120/80), and her heart rate is slightly elevated.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What happens to Systemic Vascular Resistance (SVR) during a normal pregnancy?', '["Increases", "Decreases", "Stays the same", "Doubles"]', 1, 'Progesterone causes systemic vasodilation, leading to a decrease in SVR and a compensatory increase in cardiac output.'),
    (v_case_id, 'Pregnancy is considered a "hypercoagulable" state. Which of the following is true?', '["Platelet count increases", "Protein S levels decrease", "Clotting factors II, VII, and X decrease", "Fibrinogen decreases"]', 1, 'Pregnancy involves an increase in many clotting factors and a decrease in natural anticoagulants like Protein S.'),
    (v_case_id, 'What change is expected in Renal Blood Flow (RBF) and GFR during pregnancy?', '["Both decrease by 50%", "Both increase by 50%", "RBF increases but GFR decreases", "GFR stays normal"]', 1, 'Both RBF and GFR increase significantly (up to 50%), leading to lower baseline serum creatinine levels.');

    ---------------------------------------------------------------------------
    -- CASE 08: Prenatal Screening (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aneuploidy Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aneuploidy Screening', 'A 38-year-old woman is in her 11th week of pregnancy. She is concerned about the risk of Down syndrome due to her age.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 38-year-old woman is in her 11th week of pregnancy. She is concerned about the risk of Down syndrome due to her age.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which 1st-trimester screen involves ultrasound and maternal serum markers?', '["Quad Screen", "Combined Screen (NT + PAPP-A + hCG)", "Cell-free DNA", "Amniocentesis"]', 1, 'The 1st-trimester combined screen (10-13 weeks) uses Nuchal Translucency (NT) US and serum PAPP-A/hCG.'),
    (v_case_id, 'Which test provides the most accurate NON-INVASIVE screening for Trisomy 21?', '["Quad Screen", "Cell-free DNA (cfDNA)", "Integrated screen", "Ultrasound alone"]', 1, 'cfDNA has a detection rate >99% for Trisomy 21 and can be performed as early as 10 weeks.'),
    (v_case_id, 'If a screening test is positive, which of the following is a DEFINITIVE diagnostic test?', '["Anatomy scan", "Repeat cfDNA", "Chorionic Villus Sampling (CVS) or Amniocentesis", "Fetal MRI"]', 2, 'CVS (10-13 weeks) and Amniocentesis (>15 weeks) are invasive diagnostic tests that provide a karyotype.');

    ---------------------------------------------------------------------------
    -- CASE 09: Normal Labor - The Stages (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stages of Labor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stages of Labor', 'A primigravida presents in labor. She is 4 cm dilated, and her contractions are every 3 minutes. Four hours later, she is 7 cm dilated.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A primigravida presents in labor. She is 4 cm dilated, and her contractions are every 3 minutes. Four hours later, she is 7 cm dilated.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage and phase of labor is this patient currently in?', '["First stage, Latent phase", "First stage, Active phase", "Second stage", "Third stage"]', 1, 'The 1st stage is from the onset of labor to full dilation. The active phase generally starts at 6 cm dilation (previously 4 cm).'),
    (v_case_id, 'What defines the "Second Stage" of labor?', '["Onset of contractions to 10 cm dilation", "10 cm dilation to delivery of the infant", "Delivery of the infant to delivery of the placenta", "The first hour postpartum"]', 1, 'The 2nd stage is the stage of expulsion of the fetus.'),
    (v_case_id, 'What is the upper limit of "normal" for the 3rd stage of labor?', '["10 minutes", "30 minutes", "60 minutes", "2 hours"]', 1, 'The 3rd stage (delivery of placenta) is considered prolonged if it exceeds 30 minutes.');

    ---------------------------------------------------------------------------
    -- CASE 10: Vaginitis Differential (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Common Vaginitis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Common Vaginitis', 'A 24-year-old woman presents with a "fishy" vaginal odor and thin gray-white discharge. Her vaginal pH is 5.0.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman presents with a "fishy" vaginal odor and thin gray-white discharge. Her vaginal pH is 5.0.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Candidiasis", "Bacterial Vaginosis (BV)", "Trichomoniasis", "Atrophic vaginitis"]', 1, 'BV is characterized by a fishy odor, thin gray discharge, pH > 4.5, and clue cells.'),
    (v_case_id, 'What finding on microscopy is pathognomonic for this condition?', '["Pseudohyphae", "Clue cells (epithelial cells covered in bacteria)", "Motile flagellated organisms", "WBCs > 10 per HPF"]', 1, 'Clue cells are the hallmark of BV on a saline wet mount.'),
    (v_case_id, 'What is the recommended treatment for symptomatic BV in a non-pregnant woman?', '["Oral Fluconazole", "Oral or Vaginal Metronidazole", "Oral Azithromycin", "IM Ceftriaxone"]', 1, 'Metronidazole or Clindamycin are the treatments of choice for BV.');

    ---------------------------------------------------------------------------
    -- CASE 11: Endometriosis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Endometriosis Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Endometriosis Management', 'A 26-year-old woman presents with severe dysmenorrhea, dyspareunia, and cyclic pelvic pain.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 26-year-old woman presents with severe dysmenorrhea, dyspareunia, and cyclic pelvic pain.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definitive "Gold Standard" for diagnosing endometriosis?', '["Pelvic Ultrasound", "CA-125 level", "Laparoscopy with direct visualization", "Pelvic MRI"]', 2, 'Laparoscopy allows for direct visualization of "powder-burn" lesions and biopsy confirmation.'),
    (v_case_id, 'A "chocolate cyst" on ultrasound refers to which condition?', '["Follicular cyst", "Endometrioma", "Dermoid cyst", "Corpus luteum cyst"]', 1, 'Endometriomas are cysts in the ovary filled with old, dark, "chocolate-like" blood from endometriosis.'),
    (v_case_id, 'What is the first-line MEDICAL management for endometriosis-related pain?', '["GnRH agonists (Leuprolide)", "NSAIDs and Combined Hormonal Contraceptives", "Laparoscopic ablation", "Hysterectomy"]', 1, 'NSAIDs and COCs are the initial management to suppress endometrial tissue growth.');

    ---------------------------------------------------------------------------
    -- CASE 12: Ectopic Pregnancy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ectopic Pregnancy Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ectopic Pregnancy Logic', 'A 24-year-old presents with amenorrhea, vaginal spotting, and RLQ pain. Her hCG is 2500 mIU/mL. Transvaginal US shows an empty uterus and a right adnexal mass.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old presents with amenorrhea, vaginal spotting, and RLQ pain. Her hCG is 2500 mIU/mL. Transvaginal US shows an empty uterus and a right adnexal mass.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "discriminatory zone" for hCG above which an intrauterine pregnancy should be visible on TVUS?', '["500", "1500-2000", "5000", "10000"]', 1, 'At an hCG of 1500-2000, a gestational sac should be visible in the uterus. If not, suspicion for ectopic pregnancy is high.'),
    (v_case_id, 'What is the most common site for an ectopic pregnancy?', '["Ovary", "Cervix", "Ampulla of the fallopian tube", "Cornua/Interstitial"]', 2, 'The ampulla is the most frequent site of ectopic implantation.'),
    (v_case_id, 'If this patient is hemodynamically stable and the adnexal mass is < 4 cm with no fetal heart tones, what is a medical treatment option?', '["Dilation and Curettage", "IM Methotrexate", "Laparoscopic Salpingectomy", "Observation only"]', 1, 'Methotrexate is a folate antagonist used to treat stable, small ectopic pregnancies medically.');

    ---------------------------------------------------------------------------
    -- CASE 13: Abnormal Uterine Bleeding (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AUB-PALM-COEIN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AUB-PALM-COEIN', 'A 48-year-old woman presents with increasingly heavy and prolonged periods. She has a large, irregularly shaped uterus on exam.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 48-year-old woman presents with increasingly heavy and prolonged periods. She has a large, irregularly shaped uterus on exam.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on the PALM-COEIN classification, what is the most likely structural cause?', '["Polyp", "Adenomyosis", "Leiomyoma (Fibroids)", "Malignancy"]', 2, 'Leiomyomas (fibroids) typically cause heavy bleeding (menorrhagia) and an enlarged, irregular uterus.'),
    (v_case_id, 'A patient with heavy bleeding since menarche and easy bruising might have which non-structural cause?', '["Coagulopathy (e.g., von Willebrand disease)", "Ovulatory dysfunction", "Endometrial issue", "Iatrogenic"]', 0, 'Coagulopathies, particularly vWD, are common causes of AUB in young women.'),
    (v_case_id, 'What is the "next step" in evaluation for a 48-year-old with AUB?', '["Immediate Hysterectomy", "Endometrial Biopsy", "Oral contraceptives only", "Uterine artery embolization"]', 1, 'Any woman > 45 with AUB (or younger with risk factors) must have an endometrial biopsy to rule out hyperplasia or cancer.');

    ---------------------------------------------------------------------------
    -- CASE 14: Menopause Basics (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Menopause Physiology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Menopause Physiology', 'A 52-year-old woman reports 12 months of amenorrhea, hot flashes, and vaginal dryness.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old woman reports 12 months of amenorrhea, hot flashes, and vaginal dryness.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic lab finding for menopause?', '["High Estrogen, High FSH", "Low Estrogen, High FSH (> 40 IU/L)", "Low Estrogen, Low FSH", "High Progesterone"]', 1, 'As ovaries stop producing estrogen, the feedback loop causes a significant rise in FSH.'),
    (v_case_id, 'What is the primary risk of using Estrogen-only hormone therapy in a woman with an intact uterus?', '["Breast cancer", "Endometrial cancer", "Blood clots", "Gallstones"]', 1, 'Unopposed estrogen increases the risk of endometrial hyperplasia/cancer; she must also take progestin.'),
    (v_case_id, 'What is the most effective treatment for moderate-to-severe vasomotor symptoms (hot flashes)?', '["Soy isoflavones", "Hormone Replacement Therapy (HRT)", "SSRIs", "Black Cohosh"]', 1, 'HRT remains the most effective treatment for vasomotor symptoms of menopause.');

    ---------------------------------------------------------------------------
    -- CASE 15: Pelvic Inflammatory Disease (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PID Diagnosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PID Diagnosis', 'A 19-year-old woman presents with lower abdominal pain, fever, and purulent vaginal discharge. On exam, she has exquisite Cervical Motion Tenderness (CMT).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old woman presents with lower abdominal pain, fever, and purulent vaginal discharge. On exam, she has exquisite Cervical Motion Tenderness (CMT).', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The finding of Cervical Motion Tenderness is commonly referred to as:', '["Murphy sign", "Chandelier sign", "Rovsing sign", "Kehr sign"]', 1, 'The "chandelier sign" refers to the patient reaching for the ceiling/chandelier due to the pain of CMT.'),
    (v_case_id, 'What are the two most common pathogens responsible for PID?', '["E. coli and S. aureus", "N. gonorrhoeae and C. trachomatis", "Mycoplasma and Ureaplasma", "Gardnerella and Candida"]', 1, 'Gonorrhea and Chlamydia are the primary culprits in sexually transmitted PID.'),
    (v_case_id, 'What is a serious long-term complication of recurrent PID?', '["Cervical cancer", "Infertility due to tubal scarring", "Ovarian failure", "Uterine fibroids"]', 1, 'Tubal damage from PID is a major cause of both tubal factor infertility and future ectopic pregnancies.');

    ---------------------------------------------------------------------------
    -- CASE 16: Breast Mass Evaluation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breast Mass Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breast Mass Logic', 'A 22-year-old woman finds a firm, painless, highly mobile 2 cm mass in her right breast.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old woman finds a firm, painless, highly mobile 2 cm mass in her right breast.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis in this young woman?', '["Fibrocystic change", "Fibroadenoma", "Breast cancer", "Intraductal papilloma"]', 1, 'Fibroadenomas are the most common benign breast tumors in women under 30.'),
    (v_case_id, 'What is the preferred initial imaging modality for a breast mass in a woman under 30?', '["Mammogram", "Ultrasound", "MRI", "PET scan"]', 1, 'US is preferred in young women due to dense breast tissue and to avoid radiation.'),
    (v_case_id, 'In a woman > 35, what is the standard "Triple Test" for a breast mass?', '["US, Mammogram, MRI", "Clinical Exam, Imaging (Mammogram/US), and Fine Needle Aspiration/Core Biopsy", "BRCA testing, Mammogram, and Biopsy", "Physical exam, Blood work, and CT"]', 1, 'The triple test uses clinical, radiological, and pathological assessment to rule out malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 17: Mastitis vs Abscess (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Mastitis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Mastitis', 'A 2-week postpartum breastfeeding mother has a painful, red, swollen area on her left breast and a fever of 102F.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-week postpartum breastfeeding mother has a painful, red, swollen area on her left breast and a fever of 102F.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common organism causing lactational mastitis?', '["E. coli", "Staphylococcus aureus", "Group B Strep", "Bacteroides"]', 1, 'S. aureus from the infant''s oropharynx is the most common cause.'),
    (v_case_id, 'Should the mother continue breastfeeding from the affected breast?', '["No, it will infect the baby", "Yes, to help drain the breast and prevent abscess", "Only if the baby is on antibiotics", "Stop breastfeeding entirely"]', 1, 'Continued emptying of the breast is critical for resolution and does not harm the infant.'),
    (v_case_id, 'If a fluctuant mass is felt despite antibiotic therapy, what should be suspected?', '["Inflammatory breast cancer", "Breast abscess", "Galactocele", "Ductal ectasia"]', 1, 'A fluctuant area suggests an abscess, which requires drainage (usually needle aspiration or I&D).');

    ---------------------------------------------------------------------------
    -- CASE 18: Infertility Evaluation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infertility Workup' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infertility Workup', 'A 32-year-old couple has been trying to conceive for 14 months without success.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old couple has been trying to conceive for 14 months without success.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of "Infertility" in a woman under 35?', '["Failure to conceive after 6 months", "Failure to conceive after 12 months of unprotected intercourse", "Irregular periods", "Inability to have an orgasm"]', 1, 'For women > 35, the definition changes to 6 months of trying.'),
    (v_case_id, 'What is the most important INITIAL test for the male partner?', '["Serum Testosterone", "Semen Analysis", "Scrotal Ultrasound", "Genetic testing"]', 1, 'Male factor accounts for 40% of infertility; semen analysis is non-invasive and high-yield.'),
    (v_case_id, 'Which test evaluates the patency of the fallopian tubes?', '["Hysterosalpingogram (HSG)", "Pelvic Ultrasound", "Endometrial biopsy", "Laparoscopy alone"]', 0, 'HSG involves injecting dye into the uterus and filming it as it passes through the tubes.');

    ---------------------------------------------------------------------------
    -- CASE 19: Cervical Cancer Screening (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pap Smear Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pap Smear Logic', 'A 25-year-old woman has a Pap smear result of "LSIL" (Low-grade Squamous Intraepithelial Lesion).', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old woman has a Pap smear result of "LSIL" (Low-grade Squamous Intraepithelial Lesion).', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next step for a 25-year-old with LSIL?', '["Repeat Pap in 1 year", "Colposcopy", "Immediate LEEP", "HPV testing only"]', 1, 'In the 25-29 age group, LSIL usually requires colposcopy. (Note: in 21-24, repeat Pap is preferred due to high regression rates).'),
    (v_case_id, 'Which HPV types are most strongly associated with cervical cancer?', '["6 and 11", "16 and 18", "1 and 2", "31 and 33"]', 1, 'HPV 16 and 18 cause ~70% of cervical cancers; 6 and 11 cause genital warts.'),
    (v_case_id, 'What is the recommended screening interval for a 35-year-old with normal Paps?', '["Every year", "Every 3 years with Pap alone, or every 5 years with Co-testing (Pap + HPV)", "Every 10 years", "Stop screening"]', 1, 'ASCCP guidelines recommend cotesting every 5 years for women 30-65.');

    ---------------------------------------------------------------------------
    -- CASE 20: Vulvovaginal Health (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lichen Sclerosus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lichen Sclerosus', 'A 60-year-old postmenopausal woman presents with intense vulvar itching. On exam, the skin is thin, white, and crinkled like "parchment" in a figure-eight pattern.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old postmenopausal woman presents with intense vulvar itching. On exam, the skin is thin, white, and crinkled like "parchment" in a figure-eight pattern.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Vulvar Candidiasis", "Lichen Sclerosus", "Vulvar Cancer", "Atrophic vulvitis"]', 1, 'The "parchment-like" or "cigarette paper" appearance is classic for Lichen Sclerosus.'),
    (v_case_id, 'What is the primary treatment for Lichen Sclerosus?', '["Topical Estrogen", "High-potency topical corticosteroids (e.g., Clobetasol)", "Antifungal cream", "Surgical excision"]', 1, 'Ultra-potent steroids are required to control inflammation and prevent scarring/fusion.'),
    (v_case_id, 'There is a slightly increased risk of which cancer in women with this condition?', '["Endometrial cancer", "Squamous cell carcinoma of the vulva", "Melanoma", "Ovarian cancer"]', 1, 'Lichen Sclerosus is associated with a 3-5% risk of developing vulvar SCC.');

    ---------------------------------------------------------------------------
    -- CASE 21: Ovarian Torsion (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Adnexal Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Adnexal Pain', 'A 24-year-old woman presents with sudden onset of severe, colicky left-sided pelvic pain and nausea.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman presents with sudden onset of severe, colicky left-sided pelvic pain and nausea.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ruptured ectopic", "Ovarian torsion", "Pelvic Inflammatory Disease", "Appendicitis"]', 1, 'Sudden, severe, unilateral colicky pain + nausea is the classic presentation of torsion.'),
    (v_case_id, 'What is the most common predisposing factor for torsion?', '["Pregnancy", "An ovarian mass (e.g., dermoid cyst)", "Recent intercourse", "Endometriosis"]', 1, 'A mass (usually >5cm) acts as a fulcrum for the ovary to twist around the suspensory ligament.'),
    (v_case_id, 'What is the next best diagnostic step?', '["Abdominal CT", "Doppler Ultrasound of the adnexa", "Laparoscopy", "MRI"]', 1, 'US with Doppler is the initial test; decreased or absent flow supports the diagnosis, though normal flow does not rule it out.'),
    (v_case_id, 'What is the definitive treatment?', '["IV Antibiotics", "Observation", "Surgical detorsion and assessment of viability", "Methotrexate"]', 2, 'Torsion is a surgical emergency to save the ovary.');

    ---------------------------------------------------------------------------
    -- CASE 22: Fetal Monitoring Basics (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fetal Heart Rate Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fetal Heart Rate Logic', 'A patient in labor has a fetal heart rate (FHR) tracing showing "Early Decelerations" that mirror the contractions.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in labor has a fetal heart rate (FHR) tracing showing "Early Decelerations" that mirror the contractions.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiological cause of EARLY decelerations?', '["Uteroplacental insufficiency", "Fetal head compression", "Umbilical cord compression", "Fetal sleep cycle"]', 1, 'Early decels are a benign vagal reflex caused by head compression during contractions.'),
    (v_case_id, 'What do VARIABLE decelerations usually represent?', '["Uteroplacental insufficiency", "Umbilical cord compression", "Fetal anemia", "Maternal hypotension"]', 1, 'Variables are sharp drops that are not necessarily linked to contractions; they signify cord compression.'),
    (v_case_id, 'LATE decelerations (starting after the contraction peak) are a sign of:', '["Normal labor", "Uteroplacental insufficiency (hypoxia)", "Fetal head compression", "Vagal reflex"]', 1, 'Late decels are always concerning for fetal hypoxia/acidosis and represent "placental reserve" issues.');

    ---------------------------------------------------------------------------
    -- CASE 23: Postpartum Hemorrhage (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PPH Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PPH Management', 'Immediately following a vaginal delivery of a 9 lb infant, the mother has heavy vaginal bleeding. Her uterus feels soft and "boggy" above the umbilicus.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Immediately following a vaginal delivery of a 9 lb infant, the mother has heavy vaginal bleeding. Her uterus feels soft and "boggy" above the umbilicus.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this hemorrhage (the "4 Ts")?', '["Trauma", "Tissue (retained placenta)", "Tone (Uterine Atony)", "Thrombin (coagulopathy)"]', 2, 'Uterine atony (lack of tone) is the cause of ~80% of PPH; the "boggy" uterus is the key clue.'),
    (v_case_id, 'What is the first-line medication for uterine atony?', '["Methergine", "Oxytocin", "Hemabate", "Misoprostol"]', 1, 'Oxytocin (Pitocin) is the gold standard for prevention and initial treatment of atony.'),
    (v_case_id, 'Which medication is CONTRAINDICATED in a patient with hypertension?', '["Oxytocin", "Methylergonovine (Methergine)", "Carboprost (Hemabate)", "Misoprostol"]', 1, 'Methergine is an ergot alkaloid that can cause severe peripheral vasoconstriction and hypertensive crisis.'),
    (v_case_id, 'Which medication is CONTRAINDICATED in a patient with asthma?', '["Oxytocin", "Methergine", "Carboprost (Hemabate)", "Misoprostol"]', 2, 'Hemabate is a prostaglandin (PGF2-alpha) that can cause bronchoconstriction.');

    ---------------------------------------------------------------------------
    -- CASE 24: Pre-eclampsia Basics (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pre-eclampsia Definition' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pre-eclampsia Definition', 'A 28-year-old at 34 weeks gestation has a blood pressure of 150/95 and 2+ protein on urine dipstick.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old at 34 weeks gestation has a blood pressure of 150/95 and 2+ protein on urine dipstick.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic definition of Pre-eclampsia?', '["BP > 140/90 after 20 weeks + Proteinuria", "BP > 140/90 before 20 weeks", "Proteinuria alone", "Edema alone"]', 0, 'Pre-eclampsia is new-onset HTN and proteinuria (or end-organ damage) after 20 weeks.'),
    (v_case_id, 'Which "Severe Feature" would change the diagnosis to "Pre-eclampsia with Severe Features"?', '["Platelets < 100,000", "Bilateral pedal edema", "hCG > 100,000", "Gestational diabetes"]', 0, 'Severe features include: BP > 160/110, Thrombocytopenia, elevated LFTs, renal insufficiency, pulmonary edema, or new-onset cerebral/visual symptoms.'),
    (v_case_id, 'What medication is given for seizure prophylaxis in pre-eclampsia?', '["Phenytoin", "Magnesium Sulfate", "Diazepam", "Labetalol"]', 1, 'Magnesium is the drug of choice for preventing and treating eclamptic seizures.');

    ---------------------------------------------------------------------------
    -- CASE 25: HELLP Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HELLP Syndrome Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HELLP Syndrome Logic', 'A patient at 36 weeks presents with RUQ pain, nausea, and vomiting. Labs show AST 150, Platelets 80,000, and Schistocytes on smear.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 36 weeks presents with RUQ pain, nausea, and vomiting. Labs show AST 150, Platelets 80,000, and Schistocytes on smear.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the HELLP acronym stand for?', '["Hyperemesis, Edema, Low Liver, Pregnancy", "Hemolysis, Elevated Liver enzymes, Low Platelets", "Hypertension, Edema, Labs, Low Protein", "None of the above"]', 1, 'HELLP is a severe variant of pre-eclampsia.'),
    (v_case_id, 'What is the cause of RUQ pain in HELLP?', '["Gallstones", "Stretching of the liver capsule (Glisson''s capsule)", "Appendicitis", "Pneumonia"]', 1, 'Liver swelling due to ischemia/hemorrhage stretches the capsule, causing severe RUQ or epigastric pain.'),
    (v_case_id, 'What is the definitive treatment for HELLP syndrome?', '["High-dose steroids", "IV Antibiotics", "Delivery of the fetus", "Plasmapheresis"]', 2, 'Like all severe pre-eclampsia, delivery is the only definitive cure.');

    ---------------------------------------------------------------------------
    -- CASE 26: Shoulder Dystocia (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shoulder Dystocia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shoulder Dystocia', 'During delivery, the fetal head emerges but then retracts back against the perineum (the "turtle sign").', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a delivery, the fetal head emerges but then retracts back against the perineum (the "turtle sign").', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in management after recognizing shoulder dystocia?', '["Call for help and perform McRoberts maneuver", "Apply fundal pressure", "Perform an immediate C-section", "Wait for the next contraction"]', 0, 'McRoberts (hyperflexion of maternal hips) is the most effective first-line maneuver.'),
    (v_case_id, 'Which maneuver is ABSOLUTELY CONTRAINDICATED in shoulder dystocia?', '["Suprapubic pressure", "Fundal pressure", "Internal rotation (Rubin/Wood)", "Posterior arm delivery"]', 1, 'Fundal pressure can lead to uterine rupture and further impaction of the shoulder.'),
    (v_case_id, 'What is the term for pushing the fetal head back into the uterus for an emergency C-section?', '["McRoberts maneuver", "Zavanelli maneuver", "Gaskin maneuver", "Wood screw maneuver"]', 1, 'The Zavanelli maneuver is a last-resort option for catastrophic dystocia.');

    ---------------------------------------------------------------------------
    -- CASE 27: Gestational Diabetes (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GDM Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GDM Screening', 'A patient is at 26 weeks gestation. She is being screened for gestational diabetes.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is at 26 weeks gestation. She is being screened for gestational diabetes.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is universal screening for GDM typically performed?', '["1st trimester", "24-28 weeks", "32-36 weeks", "At delivery"]', 1, 'The 24-28 week window is when placental hormones (like Human Placental Lactogen) cause maximal insulin resistance.'),
    (v_case_id, 'What hormone is primarily responsible for the insulin resistance of pregnancy?', '["Estrogen", "Progesterone", "Human Placental Lactogen (hPL)", "Cortisol"]', 2, 'hPL is the main driver of the "diabetogenic" state of pregnancy to ensure glucose supply to the fetus.'),
    (v_case_id, 'What is the primary fetal risk of poorly controlled GDM?', '["Fetal growth restriction", "Macrosomia and Shoulder Dystocia", "Congenital heart defects", "Microcephaly"]', 1, 'High maternal glucose leads to fetal hyperinsulinemia, which acts as a growth hormone causing macrosomia.');

    ---------------------------------------------------------------------------
    -- CASE 28: Cervical Insufficiency (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Insufficiency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Insufficiency', 'A 24-year-old at 18 weeks presents with "pelvic pressure." US shows a short cervix (15mm) and "funneling" of the membranes.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old at 18 weeks presents with "pelvic pressure." US shows a short cervix (15mm) and "funneling" of the membranes.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark of cervical insufficiency?', '["Painful contractions", "Painless cervical dilation in the 2nd trimester", "Vaginal bleeding", "High fever"]', 1, 'Incompetence of the cervix leads to dilation without the usual pain of labor.'),
    (v_case_id, 'What is the primary treatment for this condition?', '["Bed rest", "Cervical Cerclage", "Tericillin antibiotics", "Indomethacin"]', 1, 'A cerclage (stitch) is used to mechanically keep the cervix closed until term.'),
    (v_case_id, 'A previous "LEEP" or cone biopsy is a risk factor for this condition. Why?', '["It causes infections", "It weakens the structural integrity of the cervix", "It increases estrogen", "It causes scarring"]', 1, 'Excisional procedures on the cervix can shorten it or remove critical connective tissue.');

    ---------------------------------------------------------------------------
    -- CASE 29: Placenta Previa (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Placenta Previa Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Placenta Previa Logic', 'A 32-year-old at 30 weeks presents with "painless" bright red vaginal bleeding.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old at 30 weeks presents with "painless" bright red vaginal bleeding.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Painless 3rd-trimester bleeding is the hallmark of:', '["Placental Abruption", "Placenta Previa", "Uterine Rupture", "Vasa Previa"]', 1, 'Previa (placenta covering the OS) typically bleeds without pain.'),
    (v_case_id, 'Which physical exam step is CONTRAINDICATED until Previa is ruled out?', '["Abdominal palpation", "Digital cervical exam", "Speculum exam", "Ultrasound"]', 1, 'A finger can poke directly into the placenta through the OS, causing catastrophic hemorrhage.'),
    (v_case_id, 'What is the most significant risk factor for placenta previa?', '["Smoking", "Prior C-section or uterine surgery", "Hypertension", "Gestational diabetes"]', 1, 'Scarring from previous surgeries can influence where the placenta implants.');

    ---------------------------------------------------------------------------
    -- CASE 30: Placental Abruption (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Placental Abruption Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Placental Abruption Logic', 'A 30-year-old smoker with chronic HTN at 34 weeks presents with sudden, SEVERE abdominal pain and dark vaginal bleeding. Her uterus is rigid and tender.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old smoker with chronic HTN at 34 weeks presents with sudden, SEVERE abdominal pain and dark vaginal bleeding. Her uterus is rigid and tender.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'PAINFUL 3rd-trimester bleeding is the hallmark of:', '["Placenta Previa", "Placental Abruption", "Cervical cancer", "Normal labor"]', 1, 'Abruption (premature separation) causes pain and uterine hypertonicity/tenderness.'),
    (v_case_id, 'What is the most common risk factor for placental abruption?', '["Diabetes", "Maternal Hypertension", "Multiparity", "Prior C-section"]', 1, 'HTN (chronic or pre-eclamptic) and cocaine use are major drivers of abruption.'),
    (v_case_id, 'What serious coagulopathy is a known complication of severe abruption?', '["vWD", "DIC (Disseminated Intravascular Coagulation)", "Protein S deficiency", "Hemophilia"]', 1, 'Release of tissue factor from the placental site can trigger widespread clotting and subsequent bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 31: Normal Postpartum (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Physiology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Physiology', 'A 2-day postpartum patient has "lochia rubra" and a mildly elevated temperature (99.5F). She is breastfeeding well.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-day postpartum patient has "lochia rubra" and a mildly elevated temperature (99.5F). She is breastfeeding well.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Lochia Rubra"?', '["Postpartum infection", "Normal vaginal discharge of blood and decidua in the first 3-4 days", "A sign of retained placenta", "Breast milk letdown"]', 1, 'Lochia transitions from rubra (red) to serosa (pink/brown) to alba (white) over ~6 weeks.'),
    (v_case_id, 'Wait, is a temperature of 99.5F in the first 24 hours always a sign of infection?', '["Yes", "No, mild elevation is common due to dehydration and engorgement", "Only if she is breastfeeding", "Only if she had a C-section"]', 1, 'Isolated, mild temperature rise (< 100.4) is often physiological.'),
    (v_case_id, 'When does the uterus typically return to its non-pregnant size (involution)?', '["1 week", "6 weeks", "3 months", "Never"]', 1, 'By 6 weeks postpartum, the uterus has returned to the pelvis and its normal size.');

    ---------------------------------------------------------------------------
    -- CASE 32: Postpartum Blues vs Depression (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Mood' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Mood', 'A new mother is tearful and anxious 4 days after delivery but is still bonding well with her infant.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A new mother is tearful and anxious 4 days after delivery but is still bonding well with her infant.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for mood changes peaking at day 3-5 and resolving by day 10?', '["Postpartum Depression", "Postpartum Blues", "Postpartum Psychosis", "Normal variant"]', 1, 'Postpartum "Blues" affect up to 80% of mothers and are self-limiting.'),
    (v_case_id, 'If symptoms persist beyond 2 weeks and she loses interest in the baby, the diagnosis is:', '["Still the Blues", "Postpartum Depression", "Postpartum Psychosis", "Bipolar disorder"]', 1, 'Depression requires broader symptoms (SIGECAPS) and persistence beyond 14 days.'),
    (v_case_id, 'Postpartum Psychosis is a medical emergency. What is the biggest risk?', '["Weight loss", "Infanticide or suicide", "Sleep walking", "Lactation failure"]', 1, 'Delusions and command hallucinations in psychosis pose a high risk to both the mother and the infant.');

    ---------------------------------------------------------------------------
    -- CASE 33: Contraceptive Options - LARC (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'LARC Counseling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'LARC Counseling', 'A 20-year-old woman wants the "most effective" reversible contraception that she doesn''t have to think about every day.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old woman wants the "most effective" reversible contraception that she doesn''t have to think about every day.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does LARC stand for?', '["Long-Acting Reversible Contraception", "Low-Administered Rate Contraceptive", "Late-Acting Reproductive Control", "None"]', 0, 'LARC includes IUDs and the Nexplanon implant.'),
    (v_case_id, 'Which LARC has the lowest failure rate (most effective)?', '["Copper IUD", "Levonorgestrel IUD", "Subdermal Progestin Implant (Nexplanon)", "Oral Pills"]', 2, 'The implant is slightly more effective than the IUD, with a failure rate of ~0.05%.'),
    (v_case_id, 'A common side effect of the Copper IUD is:', '["Amenorrhea", "Increased menstrual bleeding and cramping", "Weight gain", "Acne"]', 1, 'Non-hormonal IUDs can cause heavier or more painful periods, unlike hormonal ones which usually cause amenorrhea.');

    ---------------------------------------------------------------------------
    -- CASE 34: Amenorrhea - Asherman Syndrome (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Asherman Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Asherman Syndrome', 'A woman presents with secondary amenorrhea. She had a vigorous D&C for a postpartum hemorrhage 6 months ago.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman presents with secondary amenorrhea. She had a vigorous D&C for a postpartum hemorrhage 6 months ago.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of her amenorrhea?', '["Pituitary failure", "Endometrial synechiae (scarring)", "Ovarian failure", "Cervical stenosis"]', 1, 'Asherman syndrome is the formation of intrauterine adhesions following trauma (usually D&C).'),
    (v_case_id, 'In Asherman syndrome, will the patient have a withdrawal bleed after a Progesterone Challenge?', '["Yes", "No", "Only if she takes Estrogen too", "Only if she is pregnant"]', 1, 'Since the "outflow tract" is scarred shut or the lining is gone, they will not bleed even with hormones.'),
    (v_case_id, 'What is the preferred diagnostic and therapeutic procedure?', '["Ultrasound", "Hysteroscopy", "MRI", "Laparoscopy"]', 1, 'Hysteroscopy allows the surgeon to see and cut the adhesions.');

    ---------------------------------------------------------------------------
    -- CASE 35: PCOS and Metabolic Risk (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PCOS Metabolic Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PCOS Metabolic Screening', 'A patient with PCOS has a BMI of 32 and dark, velvety patches on her neck (acanthosis nigricans).', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with PCOS has a BMI of 32 and dark, velvety patches on her neck (acanthosis nigricans).', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does Acanthosis Nigricans represent?', '["Skin infection", "Insulin resistance", "Excess androgen", "Fungal overgrowth"]', 1, 'Insulin resistance is a core feature of PCOS.'),
    (v_case_id, 'What screening test should be performed on all obese women with PCOS?', '["Fasting glucose", "Oral Glucose Tolerance Test (OGTT)", "Thyroid panel", "Liver enzymes"]', 1, 'OGTT is more sensitive for detecting impaired glucose tolerance in PCOS than HbA1c or fasting glucose.'),
    (v_case_id, 'Which medication can help restore ovulation and improve insulin sensitivity in PCOS?', '["Spironolactone", "Metformin", "Provera", "Aspirin"]', 1, 'Metformin is often used off-label to improve insulin resistance and can help restore normal cycles.');

    ---------------------------------------------------------------------------
    -- CASE 36: Syphilis in Pregnancy (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Syphilis Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Syphilis Screening', 'A pregnant woman has a positive RPR screen at her first prenatal visit.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pregnant woman has a positive RPR screen at her first prenatal visit.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Gold Standard" treatment for Syphilis in pregnancy?', '["Oral Doxycycline", "Intramuscular Benzathine Penicillin G", "Oral Azithromycin", "IM Ceftriaxone"]', 1, 'Penicillin is the only proven treatment for prevent fetal/congenital syphilis.'),
    (v_case_id, 'What if the patient is allergic to penicillin?', '["Give Doxycycline instead", "Desensitize her to penicillin and then treat", "Use Erythromycin", "No treatment needed"]', 1, 'Doxycycline is contraindicated in pregnancy; desensitization is mandatory to allow penicillin treatment.'),
    (v_case_id, 'What is a common "reaction" seen within 24 hours of starting penicillin for syphilis?', '["Anaphylaxis", "Jarisch-Herxheimer reaction (fever, chills, headache)", "Stevens-Johnson syndrome", "Red man syndrome"]', 1, 'The JH reaction is due to the massive release of endotoxins from dying spirochetes.');

    ---------------------------------------------------------------------------
    -- CASE 37: Rh Alloimmunization (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rh Negative Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rh Negative Logic', 'A 24-year-old G1P0 is found to be A-negative (Rh-negative). Her husband is Rh-positive.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old G1P0 is found to be A-negative (Rh-negative). Her husband is Rh-positive.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is RhoGAM (Anti-D immune globulin) routinely administered?', '["1st trimester", "28 weeks gestation and within 72 hours of delivery (if baby is Rh+)", "Only after delivery", "Every month"]', 1, 'Standard prevention includes a dose at 28 weeks and postpartum.'),
    (v_case_id, 'Besides 28 weeks and delivery, when else must RhoGAM be given?', '["After any potential fetomaternal hemorrhage (e.g., CVS, Amnio, Trauma, Spotting)", "Only if she gets the flu", "Only for C-sections", "None"]', 0, 'Any event that could mix fetal (+) and maternal (-) blood requires protection.'),
    (v_case_id, 'What test is used to calculate the specific dose of RhoGAM needed after a major hemorrhage?', '["Coombs test", "Kleihauer-Betke (KB) test", "RPR", "Hemoglobin electrophoresis"]', 1, 'The KB test quantifies the amount of fetal hemoglobin in the maternal circulation.');

    ---------------------------------------------------------------------------
    -- CASE 38: Cervical Dysplasia - LEEP (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'LEEP and CIN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'LEEP and CIN', 'A colposcopy biopsy reveals CIN-2 (Cervical Intraepithelial Neoplasia, grade 2). The patient is 30 years old.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A colposcopy biopsy reveals CIN-2 (Cervical Intraepithelial Neoplasia, grade 2). The patient is 30 years old.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard treatment for persistent CIN-2 or CIN-3 in a non-pregnant adult?', '["Repeat Pap in 6 months", "Loop Electrosurgical Excision Procedure (LEEP) or Cold Knife Cone", "Hysterectomy", "Topical antibiotics"]', 1, 'Excisional procedures remove the transformation zone where dysplasia occurs.'),
    (v_case_id, 'What is a possible complication of LEEP for future pregnancies?', '["Infertility", "Cervical insufficiency or preterm birth", "Placenta previa", "GDM"]', 1, 'Removal of cervical tissue can weaken the cervix.'),
    (v_case_id, 'What is the classification of CIN-3?', '["Low-grade", "High-grade (HSIL)", "Carcinoma in situ", "Invasive cancer"]', 1, 'CIN-2 and CIN-3 are categorized as High-grade Squamous Intraepithelial Lesions (HSIL).');

    ---------------------------------------------------------------------------
    -- CASE 39: Puberty - The Sequence (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Normal Pubertal Sequence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Normal Pubertal Sequence', 'A 10-year-old girl is brought in for a well-check. Her mother asks about the "normal order" of changes.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old girl is brought in for a well-check. Her mother asks about the "normal order" of changes.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is typically the FIRST sign of puberty in girls?', '["Menarche (periods)", "Thelarche (breast budding)", "Adrenarche (pubic hair)", "Growth spurt"]', 1, 'Breast development (Thelarche) is usually the first visible sign, followed by pubic hair (Adrenarche).'),
    (v_case_id, 'When does Menarche usually occur relative to the start of puberty?', '["6 months after", "2-2.5 years after thelarche", "Immediately", "5 years after"]', 1, 'Menarche is a late event in the pubertal sequence.'),
    (v_case_id, 'What is the definition of PRECOCIOUS puberty?', '["Before age 10", "Before age 8", "Before age 12", "Anytime the mother is worried"]', 1, 'Development of secondary sexual characteristics before age 8 in girls requires evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 40: Urinary Incontinence (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Incontinence Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Incontinence Logic', 'A 60-year-old woman leaks urine when she coughs, sneezes, or laughs.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman leaks urine when she coughs, sneezes, or laughs.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of incontinence is this?', '["Urge incontinence", "Stress incontinence", "Overflow incontinence", "Functional incontinence"]', 1, 'Stress incontinence is caused by urethral hypermobility or sphincter deficiency under pressure.'),
    (v_case_id, 'A woman who has a sudden, overwhelming need to void and cannot reach the bathroom in time has:', '["Stress incontinence", "Urge incontinence (Overactive bladder)", "Overflow", "UTI only"]', 1, 'Urge incontinence is due to detrusor overactivity.'),
    (v_case_id, 'What is the first-line management for Stress Incontinence?', '["Anticholinergics (Oxybutynin)", "Pelvic floor exercises (Kegels) and lifestyle changes", "Surgical sling (TVT/TOT)", "Intermittent catheterization"]', 1, 'Kegels are the initial recommendation; surgery is reserved for failures.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vulvar Vaginal Atrophy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Genitourinary Syndrome of Menopause' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Genitourinary Syndrome of Menopause', 'A 65-year-old woman reports painful intercourse (dyspareunia) and vaginal dryness. On exam, the mucosa is pale and thin.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old woman reports painful intercourse (dyspareunia) and vaginal dryness. On exam, the mucosa is pale and thin.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of these symptoms?', '["Infection", "Estrogen deficiency", "Progesterone excess", "Cancer"]', 1, 'Loss of estrogen leads to thinning of the vaginal epithelium and loss of lubrication.'),
    (v_case_id, 'What is the preferred treatment for isolated vaginal atrophy (without systemic hot flashes)?', '["Oral Estrogen", "Low-dose vaginal Estrogen (cream, ring, or tablet)", "Oral Testosterone", "Lubricants only"]', 1, 'Local estrogen provides relief with minimal systemic absorption.'),
    (v_case_id, 'Vaginal pH in atrophic vaginitis is typically:', '["< 4.5", "> 4.5 (usually 5.0-7.0)", "Extremely acidic", "Normal"]', 1, 'Lack of estrogen reduces glycogen and lactobacilli, causing the pH to rise.');

    ---------------------------------------------------------------------------
    -- CASE 42: Group B Strep (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GBS Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GBS Screening', 'A patient is at 36 weeks gestation. A rectovaginal swab is performed for GBS screening.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is at 36 weeks gestation. A rectovaginal swab is performed for GBS screening.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is universal GBS screening performed?', '["28 weeks", "36-37 weeks", "At delivery", "1st trimester"]', 1, 'Screening at 36-37 weeks predicts colonization at the time of delivery.'),
    (v_case_id, 'If the GBS culture is positive, what is the management during labor?', '["C-section", "Intrapartum IV Penicillin (or Ampicillin)", "Oral antibiotics", "No treatment unless she has a fever"]', 1, 'IV antibiotics during labor significantly reduce neonatal GBS sepsis.'),
    (v_case_id, 'Which patient should receive intrapartum antibiotics WITHOUT needing a culture?', '["History of GBS in a previous pregnancy", "GBS bacteriuria during the current pregnancy", "Previous C-section", "Gestational diabetes"]', 1, 'Anyone with GBS in their urine during the current pregnancy or a previous infant with GBS disease should be treated automatically.');

    ---------------------------------------------------------------------------
    -- CASE 43: Normal Newborn Care (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Resuscitation Basics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Resuscitation Basics', 'An infant is delivered. He is crying, has good tone, and is pinking up.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An infant is delivered. He is crying, has good tone, and is pinking up.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three routine medications/treatments given to all newborns?', '["Vitamin K, Erythromycin eye ointment, Hepatitis B vaccine", "Vitamin D, Iron, Polio vaccine", "Penicillin, Vitamin K, Aspirin", "None"]', 0, 'Vitamin K prevents hemorrhagic disease; Erythromycin prevents gonococcal ophthalmia.'),
    (v_case_id, 'What is the "Apgar" score used for?', '["Predicting long-term IQ", "Assessing the immediate need for resuscitation and adaptation to extrauterine life", "Diagnosing genetic defects", "Calculating birth weight"]', 1, 'Apgar scores are recorded at 1 and 5 minutes.'),
    (v_case_id, 'If an infant has a heart rate < 100 and is not breathing well after drying and stimulating, what is the next step?', '["Chest compressions", "Positive Pressure Ventilation (PPV)", "Intubation", "IM Epinephrine"]', 1, 'PPV is the most important step in neonatal resuscitation when the HR is < 100.');

    ---------------------------------------------------------------------------
    -- CASE 44: Chorioamnionitis (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Intra-amniotic Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Intra-amniotic Infection', 'A patient in labor for 18 hours has a temperature of 102.2F, maternal tachycardia, and foul-smelling amniotic fluid.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in labor for 18 hours has a temperature of 102.2F, maternal tachycardia, and foul-smelling amniotic fluid.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Endometritis", "Chorioamnionitis", "Pneumonia", "Pyelonephritis"]', 1, 'Chorioamnionitis (triple I) is an infection of the membranes/fluid during labor.'),
    (v_case_id, 'What is the most significant risk factor for chorioamnionitis?', '["Smoking", "Prolonged rupture of membranes (> 18 hours)", "C-section", "Diabetes"]', 1, 'Ascending infection from the vagina occurs after the protective barrier of the membranes is gone.'),
    (v_case_id, 'What is the management?', '["Immediate C-section", "IV Antibiotics (Ampicillin + Gentamicin) and continue with vaginal delivery", "Wait for the fever to break", "Oral antibiotics only"]', 1, 'Delivery should be expedited, but C-section is not mandatory unless there are obstetric indications.');

    ---------------------------------------------------------------------------
    -- CASE 45: Contraceptive Failure (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Missed Pill"' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Missed Pill"', 'A patient forgets to take her combined oral contraceptive pill for 2 days in a row.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient forgets to take her combined oral contraceptive pill for 2 days in a row.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should she do according to standard guidelines?', '["Stop the pack and wait for menses", "Take the most recent missed pill, discard others, and use backup for 7 days", "Take all missed pills at once", "Switch to an IUD immediately"]', 1, 'Missing 2 or more active pills requires backup contraception for 7 days.'),
    (v_case_id, 'Which "missed pill" is most dangerous for breakthrough ovulation?', '["Mid-pack pills", "Pills at the beginning of the pack (following the placebo week)", "Placebo pills", "End of the pack"]', 1, 'Missing pills at the start of a pack extends the hormone-free interval beyond 7 days, allowing FSH/LH to escape suppression.'),
    (v_case_id, 'If a patient has vomiting or severe diarrhea within 2 hours of taking a pill, what should be done?', '["Nothing", "Consider it a missed pill and follow missed pill protocols", "Double the next dose", "Wait 1 month"]', 1, 'Malabsorption is equivalent to a missed dose.');

    ---------------------------------------------------------------------------
    -- CASE 46: Dysmenorrhea (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Primary Dysmenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Primary Dysmenorrhea', 'An 18-year-old presents with cramping lower abdominal pain that starts on the first day of her period and lasts 48 hours.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-year-old presents with cramping lower abdominal pain that starts on the first day of her period and lasts 48 hours.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of "Primary" dysmenorrhea?', '["Endometriosis", "Excessive Prostaglandin (PGF2-alpha) production in the endometrium", "Uterine fibroids", "Cervical stenosis"]', 1, 'PGF2-alpha causes uterine contractions and ischemia, leading to pain.'),
    (v_case_id, 'What is the first-line treatment?', '["Opioids", "NSAIDs (Prostaglandin synthetase inhibitors)", "Hysterectomy", "Broad-spectrum antibiotics"]', 1, 'NSAIDs block the production of prostaglandins at the source.'),
    (v_case_id, 'If a patient has "Secondary" dysmenorrhea, what does that mean?', '["It started when she was a teen", "Pain is due to an underlying pathology like endometriosis or fibroids", "The pain is psychological", "It only happens every other month"]', 1, 'Secondary means there is a physical "second" cause beyond normal physiology.');

    ---------------------------------------------------------------------------
    -- CASE 47: Toxic Shock Syndrome (Toy / Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Menstrual TSS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Menstrual TSS', 'A 22-year-old woman using high-absorbency tampons presents with high fever (104F), hypotension, and a diffuse "sunburn-like" rash that includes the palms and soles.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old woman using high-absorbency tampons presents with high fever (104F), hypotension, and a diffuse "sunburn-like" rash that includes the palms and soles.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism and toxin?', '["S. pyogenes; Streptolysin", "S. aureus; TSST-1", "E. coli; Enterotoxin", "C. difficile; Toxin B"]', 1, 'TSST-1 is a superantigen that causes massive T-cell activation and cytokine release.'),
    (v_case_id, 'What is a characteristic late-stage finding of the TSS rash?', '["Scarring", "Desquamation (peeling), especially of the palms and soles", "Vesicles", "Hyperpigmentation"]', 1, 'Peeling of the skin occurs 1-2 weeks after the acute illness.'),
    (v_case_id, 'What is the immediate management?', '["Remove the tampon, IV fluids, and Clindamycin + Vancomycin", "Wait for culture results", "Oral penicillin", "Topical steroids"]', 0, 'Aggressive fluid resuscitation and source removal are vital; Clindamycin helps by suppressing toxin production.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Pap smear - AGC (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Atypical Glandular Cells' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Atypical Glandular Cells', 'A 42-year-old woman has a Pap smear result of "AGC" (Atypical Glandular Cells).', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman has a Pap smear result of "AGC" (Atypical Glandular Cells).', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is an "AGC" result more concerning than an "ASC-US" result?', '["It is more common", "It is associated with a much higher risk of high-grade disease or adenocarcinoma", "It means she has an infection", "It is always invasive cancer"]', 1, 'AGC can represent abnormalities in the endocervix or the endometrium.'),
    (v_case_id, 'What is the standard workup for AGC in a woman > 35?', '["Repeat Pap in 1 year", "Colposcopy, Endocervical Curettage (ECC), AND Endometrial Biopsy", "LEEP only", "US only"]', 1, 'Because AGC can come from the uterus, the endometrium must be sampled in addition to the cervix.'),
    (v_case_id, 'Glandular cells come from which part of the cervix?', '["Ectocervix (Squamous)", "Endocervix (Columnar)", "Vagina", "Vulva"]', 1, 'Squamous cells are on the outside; glandular cells line the canal.');

    ---------------------------------------------------------------------------
    -- CASE 49: Postmenopausal Bleeding (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Horses" of PMB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Horses" of PMB', 'A 60-year-old woman reports a small amount of spotting 10 years after her last period.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman reports a small amount of spotting 10 years after her last period.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Postmenopausal bleeding (PMB) is ________ until proven otherwise.', '["Normal", "Endometrial cancer", "Due to atrophy", "Infection"]', 1, 'While atrophy is more common, cancer is the "must-not-miss" that must be ruled out.'),
    (v_case_id, 'What is the most common cause of PMB?', '["Endometrial cancer", "Atrophy of the endometrium or vagina", "Polyps", "Fibroids"]', 1, 'Atrophy accounts for ~60-80% of cases, but evaluation is still mandatory.'),
    (v_case_id, 'What endometrial thickness on Ultrasound is considered "low risk" for cancer?', '["< 4 mm", "> 10 mm", "5-8 mm", "Anything is risky"]', 0, 'An endometrial stripe < 4 mm has a high negative predictive value for cancer.');

    ---------------------------------------------------------------------------
    -- CASE 50: Pelvic Organ Prolapse (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvic Floor Support' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvic Floor Support', 'A 65-year-old multiparous woman feels a "bulge" or "pressure" in her vagina that is worse at the end of the day or when straining.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old multiparous woman feels a "bulge" or "pressure" in her vagina that is worse at the end of the day or when straining.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the bladder bulging into the anterior vaginal wall?', '["Rectocele", "Cystocele", "Enterocele", "Uterine prolapse"]', 1, 'Cystocele is an anterior compartment defect.'),
    (v_case_id, 'What is the most significant risk factor for pelvic organ prolapse (POP)?', '["Obesity", "Vaginal childbirth", "Chronic cough", "Smoking"]', 1, 'Trauma to the levator ani muscles and endopelvic fascia during birth is the leading cause.'),
    (v_case_id, 'What is a non-surgical management option for POP?', '["Pessary", "Sling", "Oral estrogen", "Laser therapy"]', 0, 'A pessary is a removable device placed in the vagina to support the organs.');

    RAISE NOTICE 'SUCCESS: 50 Obstetrics & Gynecology Basics Case Blocks registered.';
END $$;

COMMIT;
