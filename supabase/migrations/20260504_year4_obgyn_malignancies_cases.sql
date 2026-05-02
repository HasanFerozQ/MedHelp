BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Gynecological malignancies
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-malignancies" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Cervical Cancer Risk Factors (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Cancer Origins' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Cancer Origins', 'A 35-year-old patient who has not had a Pap smear in 10 years presents for screening. She is a smoker and has had multiple sexual partners.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old patient who has not had a Pap smear in 10 years presents for screening. She is a smoker and has had multiple sexual partners.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary causative agent for cervical cancer?', '["HSV-2", "Human Papillomavirus (HPV)", "Chlamydia", "HIV"]', 1, 'HPV (especially types 16 and 18) is responsible for over 99% of cervical cancers.'),
    (v_case_id, 'Which lifestyle factor significantly increases the risk of SQUAMOUS cell cervical cancer?', '["Alcohol", "Smoking", "Obesity", "Sedentary lifestyle"]', 1, 'Smoking is a major co-factor for squamous cell carcinoma (but not adenocarcinoma) of the cervix.'),
    (v_case_id, 'At what age should routine Pap smear screening begin in an immunocompetent patient?', '["At the onset of sexual activity", "Age 21", "Age 25", "Age 18"]', 1, 'Current guidelines recommend starting at age 21 regardless of sexual history.');

    ---------------------------------------------------------------------------
    -- CASE 02: Abnormal Pap - ASC-US (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Managing ASC-US' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Managing ASC-US', 'A 28-year-old has a Pap smear result of \"Atypical Squamous Cells of Undetermined Significance\" (ASC-US).', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old has a Pap smear result of \"Atypical Squamous Cells of Undetermined Significance\" (ASC-US).', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the preferred next step for ASC-US in a 28-year-old?', '["Immediate Colposcopy", "Reflex HPV testing", "LEEP procedure", "Repeat Pap in 3 years"]', 1, 'Reflex HPV testing is the standard of care for ASC-US.'),
    (v_case_id, 'If the reflex HPV test is POSITIVE, what is the next step?', '["Colposcopy", "Repeat Pap in 1 year", "Hysterectomy", "Antibiotics"]', 0, 'A positive HPV test with any abnormal Pap warrants colposcopy.'),
    (v_case_id, 'If the reflex HPV test is NEGATIVE, what is the next step?', '["Colposcopy", "Return to routine screening (Pap/Co-testing in 3-5 years)", "Repeat Pap in 6 months", "LEEP"]', 1, 'A negative HPV test is very reassuring for ASC-US.');

    ---------------------------------------------------------------------------
    -- CASE 03: Abnormal Pap - LSIL and HSIL (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High-Grade Lesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High-Grade Lesions', 'A 32-year-old patient has a Pap smear showing \"High-Grade Squamous Intraepithelial Lesion\" (HSIL).', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old patient has a Pap smear showing \"High-Grade Squamous Intraepithelial Lesion\" (HSIL).', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next step for a 32-year-old with HSIL?', '["Repeat Pap in 1 year", "Colposcopy (or immediate LEEP in some cases)", "Reflex HPV", "Observation"]', 1, 'HSIL carries a high risk of CIN 2/3 or invasive cancer.'),
    (v_case_id, 'What finding on colposcopy is most suggestive of high-grade disease?', '["Acetowhite epithelium", "Coarse mosaicism and punctation", "Thin leukoplakia", "Yellow discharge"]', 1, 'Coarse vascular patterns (mosaicism/punctation) are concerning for high-grade CIN.'),
    (v_case_id, 'What is \"LSIL\" management in a 22-year-old?', '["Immediate Colposcopy", "Repeat Pap in 1 year", "Hysterectomy", "LEEP"]', 1, 'In young women (21-24), LSIL is often managed conservatively with repeat cytology due to high regression rates.');

    ---------------------------------------------------------------------------
    -- CASE 04: Biopsy Results - CIN Management (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Dysplasia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Dysplasia', 'A colposcopically directed biopsy shows Cervical Intraepithelial Neoplasia Grade 3 (CIN 3).', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A colposcopically directed biopsy shows Cervical Intraepithelial Neoplasia Grade 3 (CIN 3).', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended treatment for CIN 3?', '["Observation", "Ablation or Excision (e.g., LEEP or Cold Knife Cone)", "Hysterectomy as first line", "Antibiotics"]', 1, 'Excision (LEEP/CKC) is mandatory for CIN 3 due to the high risk of progression.'),
    (v_case_id, 'What is \"CIN 1\"?', '["Mild dysplasia involving the lower 1/3 of the epithelium", "Severe dysplasia", "Invasive cancer", "Normal"]', 0, 'CIN 1 is often caused by transient HPV infection and usually regresses.'),
    (v_case_id, 'If a patient is PREGNANT and has CIN 3 on biopsy, what is the management?', '["Immediate LEEP", "Observation with colposcopy and cytology every 12 weeks, with re-evaluation 6 weeks postpartum", "Immediate Hysterectomy", "Termination of pregnancy"]', 1, 'Treatment of CIN in pregnancy is delayed unless invasive cancer is suspected.');

    ---------------------------------------------------------------------------
    -- CASE 05: Invasive Cervical Cancer Staging (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clinical Staging' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clinical Staging', 'A patient is diagnosed with invasive cervical cancer. The tumor is 3 cm and confined to the cervix.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is diagnosed with invasive cervical cancer. The tumor is 3 cm and confined to the cervix.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Unlike endometrial or ovarian cancer, how is cervical cancer staged?', '["Surgically", "Clinically (using physical exam, imaging, and biopsy)", "By hCG levels", "By blood type"]', 1, 'FIGO staging for cervical cancer is primarily clinical.'),
    (v_case_id, 'What constitutes Stage IB cervical cancer?', '["Microscopic invasion < 3mm", "Clinically visible lesion confined to the cervix", "Tumor involving the lower 1/3 of the vagina", "Tumor extending to the pelvic wall"]', 1, 'Visible lesions limited to the cervix are Stage IB.'),
    (v_case_id, 'What is the standard treatment for Stage IB1 cervical cancer?', '["LEEP", "Radical Hysterectomy with pelvic lymphadenectomy", "Simple Hysterectomy", "Chemotherapy only"]', 1, 'Radical surgery (or radiation) is the treatment of choice.');

    ---------------------------------------------------------------------------
    -- CASE 06: Advanced Cervical Cancer (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Metastatic Cervical Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Metastatic Cervical Disease', 'A patient has cervical cancer that has extended to the parametria (Stage IIB).', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has cervical cancer that has extended to the parametria (Stage IIB).', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary treatment for Stage IIB and higher cervical cancer?', '["Surgery (Hysterectomy)", "Primary Chemoradiation (External beam radiation + Brachytherapy + Cisplatin)", "Chemotherapy only", "Wait and see"]', 1, 'Surgery is not effective once the cancer has spread into the parametria.'),
    (v_case_id, 'Which chemotherapy agent is most commonly used as a \"radiosensitizer\" in cervical cancer?', '["Doxorubicin", "Cisplatin", "Paclitaxel", "Methotrexate"]', 1, 'Cisplatin-based chemoradiation is the standard of care.'),
    (v_case_id, 'A patient with advanced cervical cancer presents with kidney failure. What is the likely cause?', '["Direct tumor invasion/compression of the ureters causing hydronephrosis", "Antibiotic toxicity", "Diabetes", "Heart failure"]', 0, 'Ureteral obstruction is a common cause of death in advanced cervical cancer.');

    ---------------------------------------------------------------------------
    -- CASE 07: Endometrial Cancer Risk Factors (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Endometrial Cancer Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Endometrial Cancer Risks', 'A 62-year-old obese, nulliparous woman with Type 2 Diabetes presents with vaginal bleeding.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old obese, nulliparous woman with Type 2 Diabetes presents with vaginal bleeding.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most significant common risk factor for endometrial cancer in this patient?', '["Obesity (leading to excess peripheral conversion of androgens to estrogen)", "Diabetes", "Nulliparity", "Age"]', 0, 'Excess \"unopposed estrogen\" is the driving factor for Type I endometrial cancer.'),
    (v_case_id, 'Which genetic syndrome is strongly associated with endometrial and colorectal cancer?', '["Down Syndrome", "Lynch Syndrome (HNPCC)", "Turner Syndrome", "Li-Fraumeni"]', 1, 'Lynch syndrome patients have a 40-60% lifetime risk of endometrial cancer.'),
    (v_case_id, 'Does use of OCPs (Combined Oral Contraceptive Pills) increase or decrease endometrial cancer risk?', '["Increase", "Decrease", "No effect", "Depends on age"]', 1, 'The progestin in OCPs protects the endometrium.');

    ---------------------------------------------------------------------------
    -- CASE 08: Postmenopausal Bleeding - PMB (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Evaluating PMB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Evaluating PMB', 'A 55-year-old woman reports spotting 3 years after her last period.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old woman reports spotting 3 years after her last period.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the FIRST step in the management of postmenopausal bleeding?', '["Immediate Hysterectomy", "Endometrial Biopsy (EMB) or Transvaginal Ultrasound (TVUS)", "Observation", "Cervical biopsy"]', 1, 'PMB must always be investigated for malignancy.'),
    (v_case_id, 'On TVUS, what endometrial thickness threshold is considered reassuring in a postmenopausal patient?', '["< 10 mm", "< 4 mm", "> 20 mm", "Any thickness is fine"]', 1, 'A stripe < 4mm has a very high negative predictive value for cancer.'),
    (v_case_id, 'If EMB is \"insufficient for diagnosis\" and bleeding continues, what is the next step?', '["Reassure the patient", "Dilation & Curettage (D&C) +/- Hysteroscopy", "Hysterectomy", "Repeat EMB next year"]', 1, 'Persistent bleeding requires a more definitive sample (D&C).');

    ---------------------------------------------------------------------------
    -- CASE 09: Endometrial Hyperplasia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pre-Cancerous Lining' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pre-Cancerous Lining', 'An endometrial biopsy shows \"Complex Hyperplasia with Atypia\".', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An endometrial biopsy shows \"Complex Hyperplasia with Atypia\".', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk that a patient with \"atypical\" hyperplasia already has a concurrent carcinoma?', '["1%", "Up to 30-40%", "100%", "0%"]', 1, 'Atypia is a very high-risk finding.'),
    (v_case_id, 'What is the preferred management for atypical endometrial hyperplasia in a postmenopausal woman?', '["Progestin pills", "Total Hysterectomy", "IUD placement", "Observation"]', 1, 'Hysterectomy is the gold standard for atypia due to the high cancer risk.'),
    (v_case_id, 'How is hyperplasia WITHOUT atypia usually managed in a woman who wants to preserve her uterus?', '["Hysterectomy", "Progestin therapy (pills or Levonorgestrel IUD) with repeat biopsy", "Chemotherapy", "D&C every week"]', 1, 'Progestins thin the lining and counteract estrogen.');

    ---------------------------------------------------------------------------
    -- CASE 10: Endometrial Cancer Staging (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Cancer Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Cancer Surgery', 'A patient is diagnosed with FIGO Grade 1 Endometrioid Adenocarcinoma of the endometrium.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is diagnosed with FIGO Grade 1 Endometrioid Adenocarcinoma of the endometrium.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is endometrial cancer staged?', '["Clinically", "Surgically (Total Hysterectomy, BSO, and Lymph node assessment)", "By ultrasound", "By CA-125 levels"]', 1, 'Unlike cervical cancer, endometrial cancer is surgically staged.'),
    (v_case_id, 'What constitutes Stage IA endometrial cancer?', '["Tumor involving the cervix", "Tumor limited to the endometrium or invading < 50% of the myometrium", "Tumor into the bladder", "Metastatic disease"]', 1, 'Stage IA is limited to the inner half of the myometrium.'),
    (v_case_id, 'Which tumor type is more aggressive and typically NOT associated with estrogen?', '["Type I (Endometrioid)", "Type II (Serous or Clear Cell)", "Type III (Fibroid)", "None"]', 1, 'Type II cancers are high-grade and have a poorer prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 11: Ovarian Cancer Risk & Prevention (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ovarian Cancer Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ovarian Cancer Risks', 'A woman has a strong family history of breast and ovarian cancer.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman has a strong family history of breast and ovarian cancer.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which genetic mutation is most strongly linked to hereditary ovarian cancer?', '["BRCA1 and BRCA2", "HER2/neu", "p53", "APC"]', 0, 'BRCA mutations significantly increase lifetime risk.'),
    (v_case_id, 'What is the \"Incessant Ovulation\" theory?', '["Ovulation is good", "Frequent ovulation (nulliparity, early menarche) increases surface epithelial damage and cancer risk", "Ovulation causes diabetes", "None"]', 1, 'Reducing ovulation cycles reduces risk.'),
    (v_case_id, 'Which of the following reduces the risk of ovarian cancer?', '["Combined Oral Contraceptives (OCPs)", "Breastfeeding", "Tubal ligation/Salpingectomy", "All of the above"]', 3, 'Anything that suppresses ovulation or removes the fallopian tubes (where many serous cancers start) is protective.');

    ---------------------------------------------------------------------------
    -- CASE 12: Adnexal Mass - Premenopausal (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ovarian Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ovarian Cyst', 'A 24-year-old has a 4 cm simple, thin-walled, unilocular cyst on her right ovary discovered on ultrasound.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old has a 4 cm simple, thin-walled, unilocular cyst on her right ovary discovered on ultrasound.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for a simple cyst in a young woman?', '["Serous cystadenocarcinoma", "Functional cyst (e.g., Follicular or Corpus Luteum cyst)", "Dermoid cyst", "Endometrioma"]', 1, 'Functional cysts are very common and benign in reproductive-aged women.'),
    (v_case_id, 'What is the management for a 4 cm simple cyst in an asymptomatic 24-year-old?', '["Immediate surgery", "Observation and repeat ultrasound in 6-12 weeks", "CA-125 level", "Hysterectomy"]', 1, 'Most functional cysts resolve spontaneously.'),
    (v_case_id, 'What ultrasound feature is MOST concerning for malignancy in any adnexal mass?', '["Simple fluid", "Thick septations, solid components, and excrescences (papillary growths)", "Small size", "Posterior acoustic enhancement"]', 1, 'Complex features increase the likelihood of cancer.');

    ---------------------------------------------------------------------------
    -- CASE 13: Adnexal Mass - Postmenopausal (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postmenopausal Adnexal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postmenopausal Adnexal Mass', 'A 65-year-old woman has a new 5 cm complex adnexal mass.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old woman has a new 5 cm complex adnexal mass.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Any palpable adnexal mass in a postmenopausal woman must be:', '["Ignored", "Evaluated thoroughly for malignancy (often requiring surgery)", "Treated with antibiotics", "Observed for 1 year"]', 1, 'Postmenopausal ovaries should be quiescent; a new mass is highly suspicious.'),
    (v_case_id, 'What tumor marker is most commonly used to evaluate epithelial ovarian cancer?', '["AFP", "CA-125", "CEA", "hCG"]', 1, 'CA-125 is the standard marker for epithelial tumors.'),
    (v_case_id, 'Is CA-125 a good SCREENING tool for the general population?', '["Yes", "No, it lacks specificity and can be elevated in benign conditions like endometriosis, menses, or fibroids"]', 1, 'CA-125 is better for monitoring response to therapy in known cancer cases.');

    ---------------------------------------------------------------------------
    -- CASE 14: Epithelial Ovarian Cancer (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bloated Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bloated Patient', 'A 60-year-old presents with increased abdominal girth, vague bloating, and early satiety.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old presents with increased abdominal girth, vague bloating, and early satiety.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common histological type of epithelial ovarian cancer?', '["Mucinous", "Serous cystadenocarcinoma", "Endometrioid", "Brenner tumor"]', 1, 'High-grade serous is the most common and lethal subtype.'),
    (v_case_id, 'What is the hallmark of ovarian cancer spread?', '["Bloodstream spread to brain", "Peritoneal seeding and omental spread (omental cake)", "Direct spread to the bladder", "None"]', 1, 'Ovarian cancer spreads by exfoliating cells into the peritoneal fluid.'),
    (v_case_id, 'What is \"Optimal Cytoreduction\" (Debulking)?', '["Removing the whole ovary", "Surgical removal of all visible tumor (ideally < 1 cm of residual disease)", "Removing the uterus", "None"]', 1, 'The amount of residual tumor after surgery is the strongest prognostic factor.');

    ---------------------------------------------------------------------------
    -- CASE 15: Germ Cell Tumors - Dysgerminoma (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Youthful Ovarian Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Youthful Ovarian Mass', 'An 18-year-old girl has a large, solid ovarian mass.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-year-old girl has a large, solid ovarian mass.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignant germ cell tumor?', '["Yolk sac tumor", "Dysgerminoma", "Immature teratoma", "Choriocarcinoma"]', 1, 'Dysgerminoma is the female equivalent of a male seminoma.'),
    (v_case_id, 'Which tumor marker is characteristically elevated in Dysgerminoma?', '["AFP", "hCG", "LDH (Lactate Dehydrogenase)", "CA-125"]', 2, 'LDH is the classic marker for dysgerminoma.'),
    (v_case_id, 'Germ cell tumors are characteristically:', '["Resistant to chemotherapy", "Very sensitive to chemotherapy and often treated with BEP (Bleomycin, Etoposide, Cisplatin)", "Only found in elderly women", "None"]', 1, 'Germ cell tumors have excellent cure rates even when advanced.');

    ---------------------------------------------------------------------------
    -- CASE 16: Yolk Sac Tumor (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Endodermal Sinus Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Endodermal Sinus Tumor', 'A 15-year-old has an ovarian mass and a very high AFP (Alpha-fetoprotein).', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old has an ovarian mass and a very high AFP (Alpha-fetoprotein).', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Dysgerminoma", "Yolk Sac Tumor (Endodermal Sinus Tumor)", "Granulosa cell tumor", "Serous cancer"]', 1, 'Yolk sac tumors are known for high AFP levels.'),
    (v_case_id, 'What histological feature is pathognomonic for Yolk Sac Tumor?', '["Call-Exner bodies", "Schiller-Duval bodies", "Psammoma bodies", "Reinke crystals"]', 1, 'Schiller-Duval bodies resemble a glomerulus.'),
    (v_case_id, 'Are Yolk Sac tumors usually unilateral or bilateral?', '["Almost always unilateral", "Almost always bilateral", "Always involve the liver", "None"]', 0, 'Most germ cell tumors are unilateral.');

    ---------------------------------------------------------------------------
    -- CASE 17: Granulosa Cell Tumor (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Estrogen-Secreting Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Estrogen-Secreting Tumor', 'A 60-year-old woman has postmenopausal bleeding and a solid adnexal mass. Her endometrium is very thick (hyperplastic).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman has postmenopausal bleeding and a solid adnexal mass. Her endometrium is very thick (hyperplastic).', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Dysgerminoma", "Granulosa Cell Tumor", "Sertoli-Leydig tumor", "Fibroma"]', 1, 'Granulosa cell tumors are sex cord-stromal tumors that secrete large amounts of estrogen.'),
    (v_case_id, 'What tumor marker is used to monitor Granulosa Cell tumors?', '["AFP", "Inhibin (A and B)", "LDH", "hCG"]', 1, 'Inhibin is a product of granulosa cells.'),
    (v_case_id, 'What histological finding is characteristic of Granulosa Cell tumors?', '["Psammoma bodies", "Call-Exner bodies (small fluid-filled spaces)", "Signet ring cells", "None"]', 1, 'Call-Exner bodies are classic.');

    ---------------------------------------------------------------------------
    -- CASE 18: Sertoli-Leydig Cell Tumor (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Virilizing Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Virilizing Tumor', 'A 25-year-old woman presents with rapid-onset facial hair growth, voice deepening, and an adnexal mass.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old woman presents with rapid-onset facial hair growth, voice deepening, and an adnexal mass.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Granulosa cell tumor", "Sertoli-Leydig Cell Tumor (Arrhenoblastoma)", "PCOS", "Teratoma"]', 1, 'These tumors secrete androgens (testosterone).'),
    (v_case_id, 'What is the hallmark clinical presentation of this tumor?', '["Excess estrogen (bleeding)", "Virilization (masculinization)", "High sugar", "Weight loss"]', 1, 'Rapid virilization should always raise concern for a secreting tumor.'),
    (v_case_id, 'Which blood test would be significantly elevated?', '["Estrogen", "Testosterone", "hCG", "CA-125"]', 1, 'Serum testosterone is usually very high.');

    ---------------------------------------------------------------------------
    -- CASE 19: Meigs Syndrome (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ovarian Fibroma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ovarian Fibroma', 'A patient has a solid ovarian mass, ascites, and a right-sided pleural effusion.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a solid ovarian mass, ascites, and a right-sided pleural effusion.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this clinical triad called?', '["HELLP Syndrome", "Meigs Syndrome", "Lynch Syndrome", "PCOS"]', 1, 'Meigs syndrome is associated with benign ovarian fibromas.'),
    (v_case_id, 'What happens to the ascites and effusion after the tumor is removed?', '["They stay forever", "They resolve spontaneously", "They get worse", "Need chemotherapy"]', 1, 'Resolution of the fluid after tumor removal is part of the definition.'),
    (v_case_id, 'Is an ovarian fibroma malignant or benign?', '["Malignant", "Benign"]', 1, 'Fibromas are benign connective tissue tumors.');

    ---------------------------------------------------------------------------
    -- CASE 20: Krukenberg Tumor (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Metastatic Ovarian Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Metastatic Ovarian Cancer', 'A patient has bilateral solid ovarian masses. Biopsy shows \"Signet ring cells\" producing mucin.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has bilateral solid ovarian masses. Biopsy shows \"Signet ring cells\" producing mucin.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely PRIMARY source of this cancer?', '["Ovary", "Stomach (Gastric adenocarcinoma)", "Colon", "Breast"]', 1, 'Krukenberg tumors are metastatic to the ovary, most commonly from the GI tract.'),
    (v_case_id, 'Krukenberg tumors are characteristically:', '["Unilateral", "Bilateral", "Small", "None"]', 1, 'Metastatic disease to the ovaries is typically bilateral.'),
    (v_case_id, 'What is the prognosis for Krukenberg tumors?', '["Excellent", "Poor (implies Stage IV GI cancer)", "Good", "Cured by surgery"]', 1, 'It represents metastatic spread of an underlying malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 21: Complete Hydatidiform Mole (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Molar Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Molar Pregnancy', 'A patient at 10 weeks gestation has vaginal bleeding, severe nausea, and a uterus that is large for dates. Ultrasound shows a \"snowstorm\" or \"cluster of grapes\" appearance and NO fetus.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient at 10 weeks gestation has vaginal bleeding, severe nausea, and a uterus that is large for dates. Ultrasound shows a \"snowstorm\" or \"cluster of grapes\" appearance and NO fetus.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the chromosomal makeup of a COMPLETE mole?', '["46, XX (entirely paternal in origin)", "69, XXY", "45, X", "47, XXY"]', 0, 'Complete moles result from one or two sperm fertilizing an empty egg.'),
    (v_case_id, 'What is the level of hCG typically seen in a complete mole?', '["Normal", "Significantly elevated (often > 100,000)", "Low", "Zero"]', 1, 'Extreme hCG levels cause hyperemesis and theca lutein cysts.'),
    (v_case_id, 'What is the standard treatment for a molar pregnancy?', '["Hysterectomy", "Suction Dilation & Curettage (D&C)", "Chemotherapy only", "Observation"]', 1, 'Suction D&C is the treatment of choice.');

    ---------------------------------------------------------------------------
    -- CASE 22: Partial Hydatidiform Mole (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Triploid Mole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Triploid Mole', 'Ultrasound shows an abnormal placenta with multiple cysts and a small, non-viable fetus with multiple anomalies.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Triploid Mole', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the chromosomal makeup of a PARTIAL mole?', '["46, XX", "69, XXY (Triploid)", "45, X", "46, XY"]', 1, 'Partial moles result from two sperm fertilizing a normal egg.'),
    (v_case_id, 'What is the primary histological difference between partial and complete moles?', '["Complete moles have fetal parts", "Partial moles have fetal parts and mixed hydropic/normal villi", "Partial moles have no vessels", "None"]', 1, 'Fetal tissue is only present in partial moles.'),
    (v_case_id, 'Which mole has a higher risk of progressing to Choriocarcinoma?', '["Complete mole", "Partial mole", "Neither", "Both equal"]', 0, 'Complete moles have a ~15-20% risk of malignant transformation.');

    ---------------------------------------------------------------------------
    -- CASE 23: Choriocarcinoma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Malignant GTN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Malignant GTN', 'Three months after a molar pregnancy, the patient has irregular bleeding and a rising hCG. CXR shows multiple \"cannonball\" lung nodules.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Three months after a molar pregnancy, the patient has irregular bleeding and a rising hCG. CXR shows multiple \"cannonball\" lung nodules.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Choriocarcinoma (Gestational Trophoblastic Neoplasia)", "Lung cancer", "Normal pregnancy"]', 1, 'Choriocarcinoma is highly metastatic, especially to the lungs.'),
    (v_case_id, 'What is the primary treatment for low-risk Choriocarcinoma?', '["Radiation", "Single-agent chemotherapy (e.g., Methotrexate)", "Total Hysterectomy", "None"]', 1, 'GTN is exquisitely sensitive to chemotherapy.'),
    (v_case_id, 'How long should a patient wait to get pregnant again after a molar pregnancy?', '["1 month", "6-12 months of normal hCG levels", "Never", "5 years"]', 1, 'Wait time is needed to ensure hCG does not rise from recurrence (which would look like a new pregnancy).');

    ---------------------------------------------------------------------------
    -- CASE 24: Vulvar Squamous Cell Carcinoma (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Vulvar Itching' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Vulvar Itching', 'A 70-year-old woman has had intense vulvar itching for years. She now has a 2 cm raised, ulcerated lesion on the labia majora.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old woman has had intense vulvar itching for years. She now has a 2 cm raised, ulcerated lesion on the labia majora.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in management of a suspicious vulvar lesion?', '["Steroid cream", "Biopsy", "Cryotherapy", "Antibiotics"]', 1, 'Never treat a vulvar lesion without a biopsy diagnosis.'),
    (v_case_id, 'What is the most common histological type of vulvar cancer?', '["Melanoma", "Squamous Cell Carcinoma", "Basal Cell Carcinoma", "Adenocarcinoma"]', 1, 'SCC accounts for ~90% of vulvar malignancies.'),
    (v_case_id, 'Which precursor condition is associated with SCC of the vulva in older women?', '["Lichen Sclerosus", "Bacterial vaginosis", "Herpes", "PCOS"]', 0, 'Chronic lichen sclerosus can lead to \"differentiated\" VIN and eventually SCC.');

    ---------------------------------------------------------------------------
    -- CASE 25: Lichen Sclerosus (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cigarette Paper Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cigarette Paper Skin', 'A postmenopausal woman presents with white, thin, parchment-like skin on the vulva and perianal area (Figure-of-eight pattern).', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A postmenopausal woman presents with white, thin, parchment-like skin on the vulva and perianal area (Figure-of-eight pattern).', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Lichen Planus", "Lichen Sclerosus", "Vulvar cancer", "Psoriasis"]', 1, 'Lichen sclerosus causes thin, white, atrophic skin.'),
    (v_case_id, 'What is the first-line treatment for Lichen Sclerosus?', '["Estrogen cream", "High-potency topical steroids (e.g., Clobetasol)", "Surgery", "Antifungals"]', 1, 'Steroids are needed to prevent scarring and reduce cancer risk.'),
    (v_case_id, 'What anatomical change is common in severe Lichen Sclerosus?', '["Resorption of the labia minora and narrowing of the vaginal introitus", "Large labia", "Increased hair growth", "None"]', 0, 'Progressive scarring can cause significant architectural changes.');

    ---------------------------------------------------------------------------
    -- CASE 26: Vaginal Cancer - DES Exposure (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The DES Daughter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The DES Daughter', 'An 18-year-old woman is diagnosed with Clear Cell Adenocarcinoma of the vagina.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The DES Daughter', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This rare tumor is linked to in-utero exposure to which medication?', '["Thalidomide", "Diethylstilbestrol (DES)", "Aspirin", "Tetracycline"]', 1, 'DES was used in the mid-20th century to prevent miscarriage.'),
    (v_case_id, 'What structural uterine anomaly is common in \"DES daughters\"?', '["Bicornuate uterus", "T-shaped uterine cavity", "Uterus didelphys", "None"]', 1, 'The T-shaped uterus is a classic DES-associated finding.'),
    (v_case_id, 'Most VAGINAL cancers (NOT clear cell) are of which type?', '["Adenocarcinoma", "Squamous Cell Carcinoma (SCC)", "Sarcoma", "Melanoma"]', 1, 'Like the cervix and vulva, the vagina is mostly lined with squamous cells.');

    ---------------------------------------------------------------------------
    -- CASE 27: Paget''s Disease of the Vulva (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eczematous Vulvar Lesion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eczematous Vulvar Lesion', 'A 65-year-old has a bright red, itchy, \"velvety\" plaque on her vulva that looks like eczema but does not respond to steroids.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old has a bright red, itchy, \"velvety\" plaque on her vulva that looks like eczema but does not respond to steroids.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Vulvar Melanoma", "Extramammary Paget''s Disease", "Fungal infection", "Lichen Sclerosus"]', 1, 'Paget''s presents as a \"cake-icing\" appearance.'),
    (v_case_id, 'What is the risk of an underlying malignancy in Paget''s of the VULVA?', '["100%", "Up to 20-30% (breast, colon, or urogenital)", "0%", "10%"]', 1, 'Vulvar Paget''s can be associated with internal malignancies.'),
    (v_case_id, 'What histological finding is characteristic of Paget''s disease?', '["Large cells with pale cytoplasm (Paget cells) positive for PAS or mucin", "Small blue cells", "Psammoma bodies", "None"]', 0, 'Paget cells are classic.');

    ---------------------------------------------------------------------------
    -- CASE 28: Borderline Ovarian Tumors (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Malignant Potential' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Malignant Potential', 'A 30-year-old has a serous ovarian tumor that shows epithelial proliferation but NO stromal invasion.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old has a serous ovarian tumor that shows epithelial proliferation but NO stromal invasion.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this type of tumor?', '["Malignant", "Borderline tumor (Tumor of Low Malignant Potential)", "Benign", "Fibroma"]', 1, 'Borderline tumors have a much better prognosis than invasive cancer.'),
    (v_case_id, 'How are borderline tumors typically managed in young women who want to keep their fertility?', '["Total Hysterectomy", "Cystectomy or Unilateral Salpingo-oophorectomy", "Chemotherapy only", "None"]', 1, 'Conservative surgery is often possible.'),
    (v_case_id, 'What is the recurrence risk for borderline tumors?', '["Zero", "Low, but they can recur many years later", "100%", "None"]', 1, 'Long-term follow-up is required.');

    ---------------------------------------------------------------------------
    -- CASE 29: Tamoxifen and the Endometrium (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breast Cancer Follow-up' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breast Cancer Follow-up', 'A patient taking Tamoxifen for breast cancer presents with new vaginal spotting.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient taking Tamoxifen for breast cancer presents with new vaginal spotting.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Tamoxifen affect the endometrium?', '["It acts as an antagonist", "It acts as an agonist (estrogenic effect) on the uterus", "No effect", "It makes it disappear"]', 1, 'Tamoxifen is a SERM: antagonist in the breast, agonist in the bone and uterus.'),
    (v_case_id, 'Should asymptomatic women on Tamoxifen have routine ultrasound screening?', '["Yes", "No, only those with abnormal bleeding need evaluation", "Every month", "None"]', 1, 'Routine screening leads to many unnecessary biopsies; wait for symptoms.'),
    (v_case_id, 'What is the increased risk of endometrial cancer with Tamoxifen?', '["2-3 times", "100 times", "No increase", "10 times"]', 0, 'The benefit for breast cancer outweighs the uterine risk for most.');

    ---------------------------------------------------------------------------
    -- CASE 30: Ovarian Torsion vs Cancer (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Adnexal Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Adnexal Pain', 'A patient with a known 8 cm ovarian dermoid presents with sudden, sharp, localized lower abdominal pain and vomiting.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a known 8 cm ovarian dermoid presents with sudden, sharp, localized lower abdominal pain and vomiting.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ruptured cyst", "Ovarian Torsion", "Appendicitis", "Cancer"]', 1, 'Large benign masses (like dermoids) are the most common cause of torsion.'),
    (v_case_id, 'What is the definitive management of torsion?', '["Pain meds only", "Surgical detorsion and assessment of viability", "Hysterectomy", "Antibiotics"]', 1, 'Detorsion and cystectomy are the standard.'),
    (v_case_id, 'Why is a malignant mass LESS likely to torse than a benign one?', '["Malignant masses are smaller", "Malignant masses are often fixed in place by adhesions or invasive growth", "They don''t rotate", "None"]', 1, 'Benign cysts are usually free-floating and \"heavy,\" favoring rotation.');

    ---------------------------------------------------------------------------
    -- CASE 31: Psammoma Bodies (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Microscopic Calcifications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Microscopic Calcifications', 'A pathology report for a serous ovarian cancer mentions \"Psammoma bodies\".', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Microscopic Calcifications', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are Psammoma bodies?', '["Small blue cells", "Laminated, concentric calcifications", "Fungal spores", "None"]', 1, 'They are seen in papillary thyroid cancer, meningiomas, and serous ovarian/uterine cancers.'),
    (v_case_id, 'Psammoma bodies are most characteristic of which ovarian histology?', '["Mucinous", "Serous (especially low-grade)", "Endometrioid", "Brenner"]', 1, 'They are common in serous tumors.'),
    (v_case_id, 'Which uterine cancer type also frequently shows psammoma bodies?', '["Grade 1 Endometrioid", "Uterine Serous Carcinoma", "Leiomyosarcoma", "None"]', 1, 'Type II uterine serous carcinoma behaves like ovarian serous cancer.');

    ---------------------------------------------------------------------------
    -- CASE 32: Teratoma - Mature vs Immature (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tooth in the Ovary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tooth in the Ovary', 'A CT scan shows a 5 cm ovarian mass containing fat, calcifications (teeth), and hair.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A CT scan shows a 5 cm ovarian mass containing fat, calcifications (teeth), and hair.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Serous cystadenoma", "Mature Cystic Teratoma (Dermoid cyst)", "Ovarian cancer", "Follicular cyst"]', 1, 'Dermoids contain tissue from all three germ layers.'),
    (v_case_id, 'What defines an \"IMMATURE\" teratoma?', '["It has no teeth", "It contains primitive neuroepithelium (immature tissue)", "It is found in older women", "None"]', 1, 'Immature teratomas are malignant.'),
    (v_case_id, 'What is \"Struma Ovarii\"?', '["A teratoma with teeth", "A specialized teratoma composed primarily of thyroid tissue", "A brain tumor", "None"]', 1, 'It can cause hyperthyroidism.');

    ---------------------------------------------------------------------------
    -- CASE 33: Leiomyosarcoma (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapidly Growing Fibroid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapidly Growing Fibroid', 'A 50-year-old woman has a uterus that has doubled in size in 3 months. She is not pregnant.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old woman has a uterus that has doubled in size in 3 months. She is not pregnant.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What rare but serious diagnosis must be considered?', '["Simple fibroid", "Leiomyosarcoma", "Adenomyosis", "Endometriosis"]', 1, 'Rapid uterine growth in a postmenopausal woman is highly concerning for sarcoma.'),
    (v_case_id, 'Do most leiomyosarcomas arise from existing benign fibroids?', '["Yes", "No, they typically arise de novo (on their own)", "Always", "None"]', 1, 'Malignant transformation of a benign leiomyoma is extremely rare (< 0.1%).'),
    (v_case_id, 'What is the characteristic histological finding for leiomyosarcoma?', '["High mitotic index, cellular atypia, and coagulative tumor cell necrosis", "Normal smooth muscle", "Glands", "None"]', 0, 'These three criteria define the malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 34: Brenner Tumor (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Walthard Cell Nests' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Walthard Cell Nests', 'An ovarian tumor biopsy shows epithelial cells resembling transitional cells of the bladder.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Walthard Cell Nests', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this tumor?', '["Serous tumor", "Brenner Tumor", "Mucinous tumor", "Dysgerminoma"]', 1, 'Brenner tumors have \"coffee-bean\" nuclei.'),
    (v_case_id, 'Are Brenner tumors usually benign or malignant?', '["Usually Malignant", "Usually Benign", "Always Metastatic", "None"]', 1, 'The vast majority are benign.'),
    (v_case_id, 'What histological term is used for the nuclei in Brenner tumors?', '["Coffee-bean nuclei", "Salt and pepper", "Orphan Annie eyes", "None"]', 0, 'This is a classic pathological description.');

    ---------------------------------------------------------------------------
    -- CASE 35: HPV Vaccine Guidelines (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Preventing Cervical Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Preventing Cervical Cancer', 'A parent asks about the HPV vaccine for their 11-year-old child.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Preventing Cervical Cancer', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the currently available HPV vaccine in the US?', '["Gardasil (4-valent)", "Cervarix (2-valent)", "Gardasil 9 (9-valent)", "None"]', 2, 'Gardasil 9 covers 6, 11, 16, 18, 31, 33, 45, 52, 58.'),
    (v_case_id, 'What is the recommended age for routine vaccination?', '["Age 21", "Age 11-12 (can start at age 9)", "Age 18", "Only after marriage"]', 1, 'Early vaccination provides the best protection before exposure.'),
    (v_case_id, 'Does getting the vaccine mean a woman can skip Pap smears?', '["Yes", "No, screening should continue according to standard guidelines", "Only if she is married", "None"]', 1, 'The vaccine does not cover all high-risk HPV types.');

    ---------------------------------------------------------------------------
    -- CASE 36: Adenocarcinoma of the Cervix (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Glandular Cervical Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Glandular Cervical Cancer', 'A Pap smear shows \"Atypical Glandular Cells\" (AGC).', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Glandular Cervical Cancer', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management of AGC in a 40-year-old?', '["Reflex HPV", "Colposcopy PLUS Endocervical Curettage (ECC) and Endometrial Biopsy (EMB)", "Repeat Pap", "Observation"]', 1, 'AGC can originate from the cervix or the endometrium.'),
    (v_case_id, 'Is adenocarcinoma more or less common than squamous cell carcinoma of the cervix?', '["More common", "Less common (but increasing in incidence)", "Equal", "None"]', 1, 'SCC accounts for ~70-80%, while adenocarcinoma is ~20-25%.'),
    (v_case_id, 'Which precursor lesion is associated with cervical adenocarcinoma?', '["CIN 3", "Adenocarcinoma in situ (AIS)", "LSIL", "None"]', 1, 'AIS is the glandular equivalent of CIN 3.');

    ---------------------------------------------------------------------------
    -- CASE 37: Ovarian Germ Cell - Embryonal Carcinoma (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rare Germ Cell Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rare Germ Cell Cancer', 'A young woman has a mass and both AFP and hCG are elevated.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A young woman has a mass and both AFP and hCG are elevated.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Dysgerminoma", "Embryonal Carcinoma", "Theca lutein cyst", "Normal pregnancy"]', 1, 'Embryonal carcinomas can produce both markers.'),
    (v_case_id, 'Are these tumors aggressive?', '["No", "Yes, they are highly aggressive and fast-growing", "Slow growing", "None"]', 1, 'They require multi-agent chemotherapy.'),
    (v_case_id, 'What is the primary treatment for germ cell tumors in a young woman?', '["Total Hysterectomy BSO", "Unilateral Salpingo-oophorectomy (USO) to preserve fertility", "Radiation", "None"]', 1, 'USO is sufficient if the other ovary is normal.');

    ---------------------------------------------------------------------------
    -- CASE 38: Endometrial Cancer - Serous Type (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High Grade Uterine Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High Grade Uterine Cancer', 'A thin, 75-year-old African American woman has postmenopausal bleeding. Biopsy shows Serous Carcinoma.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'High Grade Uterine Cancer', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What Type of endometrial cancer is this?', '["Type I", "Type II (Estrogen-independent)", "Benign", "Type III"]', 1, 'Type II cancers (serous, clear cell) are high-grade and not driven by estrogen.'),
    (v_case_id, 'What is the typical prognosis for Serous Endometrial Carcinoma?', '["Excellent", "Poor (spreads early like ovarian cancer)", "Good", "None"]', 1, 'It has a much higher propensity for peritoneal spread.'),
    (v_case_id, 'What precursor lesion is associated with this cancer?', '["Endometrial hyperplasia", "Endometrial Intraepithelial Carcinoma (EIC)", "Polyp", "None"]', 1, 'EIC is the precursor for serous type, whereas hyperplasia leads to endometrioid.');

    ---------------------------------------------------------------------------
    -- CASE 39: Mucinous Ovarian Cancer (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Huge Ovarian Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Huge Ovarian Mass', 'A patient has a 30 cm multi-septated ovarian mass.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Huge Ovarian Mass', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of ovarian cancer can grow to massive sizes?', '["Serous", "Mucinous cystadenocarcinoma", "Germ cell", "Granulosa"]', 1, 'Mucinous tumors are the largest adnexal masses.'),
    (v_case_id, 'What is \"Pseudomyxoma Peritonei\"?', '["A brain tumor", "Gelatinous ascites from rupture of a mucinous tumor (often from the appendix)", "Normal fluid", "None"]', 1, 'The belly becomes filled with mucin-secreting cells.'),
    (v_case_id, 'When an ovarian mucinous tumor is found, what organ should always be checked?', '["Brain", "Appendix", "Heart", "Skin"]', 1, 'Many \"ovarian\" mucinous tumors are actually metastatic from a primary appendiceal tumor.');

    ---------------------------------------------------------------------------
    -- CASE 40: Chemotherapy Side Effects (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Complications', 'A patient receiving Carboplatin and Paclitaxel for ovarian cancer develops numbness and tingling in her hands and feet.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Complications', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is most likely responsible for this peripheral neuropathy?', '["Carboplatin", "Paclitaxel", "Doxorubicin", "Cisplatin"]', 1, 'Taxanes are notorious for dose-limiting peripheral neuropathy.'),
    (v_case_id, 'What is the main dose-limiting side effect of Carboplatin?', '["Hearing loss", "Bone marrow suppression (Thrombocytopenia)", "Hair loss", "Vomiting"]', 1, 'Carboplatin is highly myelosuppressive.'),
    (v_case_id, 'Which drug in the BEP regimen (for germ cell tumors) causes pulmonary fibrosis?', '["Bleomycin", "Etoposide", "Cisplatin", "None"]', 0, 'Bleomycin is toxic to the lungs.');

    ---------------------------------------------------------------------------
    -- CASE 41: Pelvic Exenteration (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Recurrent Cervical Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Recurrent Cervical Cancer', 'A patient has central recurrence of cervical cancer after previous radiation.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent Cervical Cancer', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ultra-radical procedure may be an option for central recurrence?', '["Pelvic Exenteration (removal of bladder, rectum, and reproductive organs)", "Chemo alone", "Hysterectomy", "None"]', 0, 'Exenteration is the only potential cure for post-radiation recurrence.'),
    (v_case_id, 'When is exenteration NOT an option?', '["If the tumor is small", "If the tumor has spread to the pelvic side wall", "In a young woman", "None"]', 1, 'Surgery is not possible if the tumor is fixed to the pelvic wall.'),
    (v_case_id, 'What is the quality of life after exenteration?', '["Normal", "Significantly altered (requires urostomy and colostomy)", "Perfect", "None"]', 1, 'It is a massive, life-altering surgery.');

    ---------------------------------------------------------------------------
    -- CASE 42: Ovarian Cancer Presentation (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Killer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Killer', 'A patient presents with Stage III ovarian cancer. She says she felt fine until a month ago.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Silent Killer', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is ovarian cancer often called \"The Silent Killer\"?', '["It has no symptoms", "Symptoms are vague/non-specific (bloating, gas, fullness) and are often ignored until the disease is advanced", "It only affects the quiet", "None"]', 1, '75% of cases are diagnosed at Stage III or IV.'),
    (v_case_id, 'What is a Stage III ovarian cancer?', '["Tumor limited to the ovary", "Tumor with peritoneal implants outside the pelvis (e.g., on the liver surface or omentum)", "Metastasis to brain", "Metastasis to bone"]', 1, 'Extrapelvic peritoneal spread is Stage III.'),
    (v_case_id, 'Where is the most common site of distant metastasis (Stage IV)?', '["Bone", "Parenchymal liver or splenic metastasis or Malignant pleural effusion", "Brain", "Skin"]', 1, 'Stage IV involves spread beyond the abdominal cavity.');

    ---------------------------------------------------------------------------
    -- CASE 43: Endometrial Cancer Surgery - Nodes (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lymph Node Assessment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lymph Node Assessment', 'A surgeon is performing staging for endometrial cancer and is injecting dye into the cervix to find the \"sentinel node\".', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lymph Node Assessment', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a \"Sentinel Lymph Node\"?', '["The biggest node", "The first node to receive lymphatic drainage from the tumor", "The last node", "None"]', 1, 'Sentinel node biopsy reduces the morbidity of full lymphadenectomy.'),
    (v_case_id, 'What is the risk of full pelvic lymphadenectomy?', '["Lymphedema (leg swelling)", "Diabetes", "Heart failure", "None"]', 0, 'Removing many nodes can disrupt lymphatic return.'),
    (v_case_id, 'Which nodes are primarily assessed in endometrial cancer?', '["Axillary", "Pelvic and Para-aortic nodes", "Inguinal only", "None"]', 1, 'Endometrial cancer follows a predictable lymphatic path.');

    ---------------------------------------------------------------------------
    -- CASE 44: Vulvar Melanoma (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pigmented Vulvar Lesion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pigmented Vulvar Lesion', 'A 50-year-old woman has a new dark, irregular, pigmented spot on the vulva.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pigmented Vulvar Lesion', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for a new pigmented vulvar lesion?', '["Vulvar Melanoma", "Moles", "Infection", "Lichen sclerosus"]', 0, 'Melanoma is the second most common vulvar cancer.'),
    (v_case_id, 'Where is vulvar melanoma most commonly located?', '["Labia majora", "Clitoris or labia minora", "Anus", "None"]', 1, 'It often occurs on non-hair-bearing skin.'),
    (v_case_id, 'What is the most important prognostic factor for melanoma?', '["Width", "Depth of invasion (Breslow thickness)", "Color", "Itching"]', 1, 'The thicker the tumor, the worse the prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 45: GTN - Choriocarcinoma Staging (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Staging Molar Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Staging Molar Disease', 'A patient with GTN is undergoing a workup for metastasis.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Staging Molar Disease', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Besides the lungs, where is another common site of choriocarcinoma metastasis?', '["Brain and Liver", "Bone only", "Skin", "Hair"]', 0, 'Brain and liver mets imply a high-risk (Stage IV) disease.'),
    (v_case_id, 'What is a characteristic pelvic finding in choriocarcinoma?', '["Vaginal metastasis (often appearing as purple, vascular nodules)", "Uterine fibroids", "Ovarian dermoids", "None"]', 0, 'Vaginal nodules are highly suspicious for GTN and should NOT be biopsied due to high risk of bleeding.'),
    (v_case_id, 'Why are GTN vaginal nodules dangerous to biopsy?', '["They are painful", "They are highly vascular and can bleed profusely", "They are infectious", "None"]', 1, 'The diagnosis is usually made by hCG and imaging, not biopsy of the met.');

    ---------------------------------------------------------------------------
    -- CASE 46: Cervical Cancer - Microinvasion (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stage IA1 Cervical Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stage IA1 Cervical Cancer', 'A cold knife cone (CKC) biopsy reveals invasive squamous cell carcinoma with < 3 mm of depth and < 7 mm of horizontal spread.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stage IA1 Cervical Cancer', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What FIGO stage is this?', '["Stage IA1", "Stage IB", "Stage II", "CIN 3"]', 0, 'This is the definition of microinvasion.'),
    (v_case_id, 'What is the management of Stage IA1 if the patient wants to keep her uterus?', '["Radical hysterectomy", "Cold knife cone (CKC) with negative margins", "Radiation", "None"]', 1, 'Conization is sufficient for Stage IA1 if margins are clear.'),
    (v_case_id, 'What if she has completed childbearing?', '["Simple Hysterectomy (Extra-fascial)", "Radical Hysterectomy", "Pelvic exenteration", "None"]', 0, 'Simple hysterectomy is the definitive treatment for Stage IA1.');

    ---------------------------------------------------------------------------
    -- CASE 47: Ovarian Cancer Tumor Markers (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Matching Markers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Matching Markers', 'A resident is ordering tumor markers for a suspected ovarian malignancy.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Matching Markers', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which marker is matched with ENDODERMAL SINUS (Yolk Sac) tumor?', '["CA-125", "AFP", "hCG", "LDH"]', 1, 'AFP is high in yolk sac tumors.'),
    (v_case_id, 'Which marker is matched with CHORIOCARCINOMA?', '["AFP", "hCG", "LDH", "Inhibin"]', 1, 'hCG is the marker for trophoblastic tissue.'),
    (v_case_id, 'Which marker is matched with EPITHELIAL SEROUS CANCER?', '["AFP", "hCG", "CA-125", "LDH"]', 2, 'CA-125 is for epithelial tumors.');

    ---------------------------------------------------------------------------
    -- CASE 48: Lynch Syndrome (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Family Cancer Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Family Cancer Syndrome', 'A woman has multiple relatives with colon, endometrial, and ovarian cancer.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Family Cancer Syndrome', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect in Lynch Syndrome?', '["DNA Mismatch Repair (MMR) genes", "p53 mutation", "hCG receptor defect", "None"]', 0, 'Mutations in MLH1, MSH2, MSH6, etc., cause microsatellite instability.'),
    (v_case_id, 'What prophylactic surgery is often recommended for Lynch syndrome women after childbearing?', '["Mastectomy", "Total Hysterectomy and Bilateral Salpingo-oophorectomy", "Appendectomy", "None"]', 1, 'Prophylactic surgery effectively eliminates the risk of endometrial and ovarian cancer.'),
    (v_case_id, 'At what age should endometrial cancer screening begin for Lynch syndrome patients?', '["Age 50", "Age 30-35 (via EMB every 1-2 years)", "Age 21", "None"]', 1, 'Screening should start early due to high risk.');

    ---------------------------------------------------------------------------
    -- CASE 49: Post-operative Lymphedema (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surgical Complications: Leg Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surgical Complications: Leg Swelling', 'A year after staging for endometrial cancer, a patient has chronic, non-pitting edema of the left leg.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Surgical Complications: Leg Swelling', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of the leg swelling?', '["DVT", "Lymphedema from lymph node dissection", "Heart failure", "Renal failure"]', 1, 'Lymphedema is a long-term risk of pelvic lymphadenectomy.'),
    (v_case_id, 'What is the management of lymphedema?', '["Diuretics", "Compression garments, physical therapy, and skin care", "Antibiotics", "More surgery"]', 1, 'Management is supportive and focused on prevention of cellulitis.'),
    (v_case_id, 'Which cancer staging is LEAST likely to cause lymphedema?', '["Ovarian", "Endometrial", "Microinvasive IA1 Cervical cancer (managed with CKC)", "Vulvar cancer (with inguinal node dissection)"]', 2, 'CKC does not involve lymph node removal.');

    ---------------------------------------------------------------------------
    -- CASE 50: Theca Lutein Cysts (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cysts of High hCG' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cysts of High hCG', 'A patient with a complete molar pregnancy has bilateral 8 cm multilocular ovarian cysts.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cysts of High hCG', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for these cysts?', '["Follicular cysts", "Theca Lutein Cysts", "Dermoid cysts", "Endometriomas"]', 1, 'These are caused by high hCG levels stimulating the ovaries.'),
    (v_case_id, 'What is the management of theca lutein cysts in a molar pregnancy?', '["Immediate surgical removal", "Observation; they will resolve once the mole is evacuated and hCG levels fall", "Aspiration", "None"]', 1, 'They are benign and resolve spontaneously.'),
    (v_case_id, 'Theca lutein cysts can also be seen in which other conditions?', '["Multiple gestation (twins/triplets)", "PCOS", "Ectopic pregnancy", "All of the above"]', 0, 'Anything with high hCG can cause them.');

    RAISE NOTICE 'SUCCESS: 50 Gynecological Malignancies Case Blocks registered.';
END $$;

COMMIT;
