BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Benign gynecology
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-benign-gynecology" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Leiomyoma Presentation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Heavy Menstrual Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Heavy Menstrual Bleeding', 'A 42-year-old woman presents with worsening heavy menstrual periods requiring her to change pads every 2 hours. On exam, her uterus is firm, irregular, and enlarged to the size of a 14-week pregnancy.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman presents with worsening heavy menstrual periods requiring her to change pads every 2 hours. On exam, her uterus is firm, irregular, and enlarged to the size of a 14-week pregnancy.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Adenomyosis", "Uterine Leiomyomas (Fibroids)", "Endometrial cancer", "Pregnancy"]', 1, 'Firm, irregular, and enlarged uterus is classic for fibroids.'),
    (v_case_id, 'Which type of fibroid is most likely to cause heavy bleeding?', '["Subserosal", "Intramural", "Submucosal", "Pedunculated"]', 2, 'Submucosal fibroids distort the endometrial cavity and are the most common cause of AUB-L.'),
    (v_case_id, 'What is the most common initial imaging modality for suspected fibroids?', '["CT scan", "Transvaginal Ultrasound (TVUS)", "MRI", "X-ray"]', 1, 'TVUS is highly sensitive for identifying and measuring leiomyomas.');

    ---------------------------------------------------------------------------
    -- CASE 02: Fibroid Management - Medical (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Conservative Fibroid Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Conservative Fibroid Care', 'A patient with small symptomatic fibroids wants to avoid surgery.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Conservative Fibroid Care', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medical treatment can reduce menstrual bleeding AND provide contraception?', '["NSAIDs", "Levonorgestrel IUD (Mirena)", "Iron supplements", "Vitamin C"]', 1, 'The Mirena IUD is highly effective for reducing bleeding in fibroid patients without cavity distortion.'),
    (v_case_id, 'How do GnRH agonists (like Leuprolide) work to manage fibroids?', '["They kill the fibroid cells", "They create a temporary hypoestrogenic state that shrinks the fibroids", "They increase blood flow", "None"]', 1, 'GnRH agonists are often used pre-operatively to shrink fibroids and improve anemia.'),
    (v_case_id, 'What is a significant drawback of GnRH agonist therapy?', '["Weight gain", "Rapid regrowth of fibroids once the medication is stopped", "Permanent menopause", "None"]', 1, 'Fibroids usually return to their original size once treatment ends.');

    ---------------------------------------------------------------------------
    -- CASE 03: Fibroid Management - Surgical (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surgical Options for AUB-L' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surgical Options for AUB-L', 'A 32-year-old G0 wishes to maintain her fertility but has severe bulk symptoms from a large intramural fibroid.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old G0 wishes to maintain her fertility but has severe bulk symptoms from a large intramural fibroid.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the preferred surgical procedure for this patient?', '["Hysterectomy", "Myomectomy", "Endometrial ablation", "UAE"]', 1, 'Myomectomy is the procedure of choice for women wishing to preserve fertility.'),
    (v_case_id, 'What is a potential complication of Uterine Artery Embolization (UAE)?', '["Better periods", "Post-embolization syndrome (pain, fever, nausea)", "Instant pregnancy", "None"]', 1, 'Post-embolization syndrome is common due to the infarction of the fibroid tissue.'),
    (v_case_id, 'Is UAE recommended for women desiring future pregnancy?', '["Yes", "No, it is generally avoided due to concerns about placental complications and ovarian reserve"]', 1, 'Myomectomy is preferred over UAE for those wanting to conceive.');

    ---------------------------------------------------------------------------
    -- CASE 04: Endometriosis Presentation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Triad of Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Triad of Pain', 'A 28-year-old woman presents with severe pelvic pain that begins a few days before her period. She also reports pain with deep penetration during intercourse and painful bowel movements during menses.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old woman presents with severe pelvic pain that begins a few days before her period. She also reports pain with deep penetration during intercourse and painful bowel movements during menses.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this classic clinical triad suggestive of?', '["PCOS", "Endometriosis", "Fibroids", "Pelvic Inflammatory Disease"]', 1, 'Dysmenorrhea, Dyspareunia, and Dyschezia is the classic triad for endometriosis.'),
    (v_case_id, 'What is the most common site of endometriosis implants?', '["Lungs", "Ovaries", "Bladder", "Appendix"]', 1, 'The ovaries are the most common site.'),
    (v_case_id, 'What is the \"Gold Standard\" for the definitive diagnosis of endometriosis?', '["Ultrasound", "MRI", "Laparoscopy with biopsy of lesions", "CA-125 level"]', 2, 'Visualization of lesions during surgery is required for a definitive diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 05: Endometrioma (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chocolate Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chocolate Cyst', 'An ultrasound of a patient with pelvic pain shows a 6 cm unilocular ovarian cyst with low-level internal echoes (ground-glass appearance).', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ultrasound of a patient with pelvic pain shows a 6 cm unilocular ovarian cyst with low-level internal echoes (ground-glass appearance).', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Dermoid cyst", "Endometrioma", "Follicular cyst", "Serous cancer"]', 1, 'Endometriomas (chocolate cysts) have a characteristic \"ground-glass\" appearance on US.'),
    (v_case_id, 'Do endometriomas usually respond to medical therapy (like OCPs)?', '["Yes", "No, they typically require surgical excision", "Only if small", "None"]', 1, 'Endometriomas are generally resistant to medical suppression.'),
    (v_case_id, 'What is the risk of a ruptured endometrioma?', '["Nothing", "Severe chemical peritonitis and acute pain", "Diabetes", "Twins"]', 1, 'The old blood is very irritating to the peritoneum.');

    ---------------------------------------------------------------------------
    -- CASE 06: Endometriosis Management (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medical Suppression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medical Suppression', 'A 22-year-old with suspected endometriosis wants to try medical therapy before considering surgery.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Medical Suppression', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line medical therapy for endometriosis-associated pain?', '["NSAIDs and Combined Hormonal Contraceptives (OCPs)", "GnRH agonists", "Surgery", "Antibiotics"]', 0, 'Starting with NSAIDs and OCPs (often used continuously) is the standard approach.'),
    (v_case_id, 'Which medication acts as a \"Medical Oophorectomy\"?', '["Metformin", "GnRH agonists (e.g., Leuprolide/Lupron)", "Progesterone", "Aspirin"]', 1, 'GnRH agonists shut down the HPO axis, leading to very low estrogen levels.'),
    (v_case_id, 'What is \"Add-back\" therapy used for in endometriosis?', '["To increase fertility", "To prevent bone loss and vasomotor symptoms when using GnRH agonists", "To stop bleeding", "None"]', 1, 'Small doses of progestin +/- estrogen can mitigate the side effects of GnRH agonists.');

    ---------------------------------------------------------------------------
    -- CASE 07: Adenomyosis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Boggy Uterus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Boggy Uterus', 'A 45-year-old G3P3 presents with heavy periods and severe dysmenorrhea. On exam, her uterus is symmetrically enlarged, soft, and tender.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Boggy Uterus', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Fibroids", "Adenomyosis", "Endometriosis", "Uterine prolapse"]', 1, 'A symmetrically enlarged, soft (boggy), and tender uterus is the classic exam finding for adenomyosis.'),
    (v_case_id, 'What is the definitive treatment for adenomyosis?', '["Myomectomy", "Hysterectomy", "OCPs", "Antibiotics"]', 1, 'Since the glands are embedded in the muscle, only hysterectomy is truly definitive.'),
    (v_case_id, 'How does adenomyosis differ from endometriosis?', '["Endometriosis is inside the uterus", "Adenomyosis is endometrial tissue WITHIN the myometrium, while endometriosis is OUTSIDE the uterus", "They are the same", "None"]', 1, 'The location of the ectopic tissue defines the condition.');

    ---------------------------------------------------------------------------
    -- CASE 08: PCOS Diagnosis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rotterdam Criteria' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rotterdam Criteria', 'A 24-year-old woman presents with periods every 60-90 days and worsening facial hair.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rotterdam Criteria', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which criteria are used to diagnose PCOS?', '["Rotterdam Criteria (2 of 3: Oligo/anovulation, Hyperandrogenism, Polycystic ovaries on US)", "Jones Criteria", "Light''s Criteria", "None"]', 0, 'Diagnosis requires at least two of the three findings.'),
    (v_case_id, 'What is the characteristic LH to FSH ratio in many PCOS patients?', '["1:1", "3:1 (LH is much higher)", "1:3", "0:1"]', 1, 'Increased LH pulse frequency is a common finding.'),
    (v_case_id, 'What is the most common cause of hyperandrogenism in women?', '["Adrenal tumor", "PCOS", "Cushing Syndrome", "Ovarian cancer"]', 1, 'PCOS accounts for the vast majority of hirsutism cases.');

    ---------------------------------------------------------------------------
    -- CASE 09: PCOS - Management of Hirsutism (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Managing Androgens' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Managing Androgens', 'A patient with PCOS is distressed by her hirsutism.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Managing Androgens', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line medical treatment for hirsutism in PCOS?', '["Metformin", "Combined Oral Contraceptives (OCPs)", "Spironolactone", "Letrozole"]', 1, 'OCPs suppress ovarian androgens and increase sex hormone-binding globulin (SHBG).'),
    (v_case_id, 'Which medication is a potassium-sparing diuretic with anti-androgenic effects?', '["Furosemide", "Spironolactone", "Hydrochlorothiazide", "Propranolol"]', 1, 'Spironolactone blocks the androgen receptor and inhibits 5-alpha reductase.'),
    (v_case_id, 'Why must Spironolactone be used with reliable contraception?', '["It causes twins", "It is highly teratogenic (can feminize a male fetus)", "It stops working", "None"]', 1, 'Reliable contraception (like an OCP) is mandatory when using Spironolactone.');

    ---------------------------------------------------------------------------
    -- CASE 10: PCOS - Metabolic & Cancer Risks (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Long-term PCOS Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Long-term PCOS Risks', 'A physician is counseling a new PCOS patient about her health risks.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Long-term PCOS Risks', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'PCOS patients have an increased risk of which malignancy?', '["Ovarian cancer", "Endometrial cancer (due to unopposed estrogen)", "Cervical cancer", "Breast cancer"]', 1, 'Chronic anovulation leads to unopposed estrogen exposure of the endometrium.'),
    (v_case_id, 'Which metabolic condition is strongly associated with PCOS?', '["Type 1 Diabetes", "Insulin Resistance and Metabolic Syndrome", "Hypothyroidism", "Addison''s disease"]', 1, 'Hyperinsulinemia drives many of the clinical features of PCOS.'),
    (v_case_id, 'What is \"Acanthosis Nigricans\"?', '["A rash", "Velvety, hyperpigmented skin (usually on the neck/axilla) which is a sign of insulin resistance", "A mole", "None"]', 1, 'It is a clinical marker for underlying insulin resistance.');

    ---------------------------------------------------------------------------
    -- CASE 11: PCOS - Infertility (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ovulation Induction in PCOS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ovulation Induction in PCOS', 'A patient with PCOS is trying to conceive.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ovulation Induction in PCOS', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current FIRST-LINE medication for ovulation induction in PCOS?', '["Clomiphene Citrate", "Letrozole (Aromatase inhibitor)", "Metformin", "hCG injections"]', 1, 'Recent evidence shows Letrozole has higher live birth rates in PCOS patients compared to Clomiphene.'),
    (v_case_id, 'What is the role of Metformin in PCOS fertility?', '["It induces ovulation on its own", "It can improve insulin sensitivity and potentially restore regular menses in some patients", "It prevents pregnancy", "None"]', 1, 'While not first-line for ovulation, it helps manage the underlying metabolic defect.'),
    (v_case_id, 'What is the \"ovarian drilling\" procedure?', '["A way to get eggs out", "A laparoscopic surgical treatment to destroy androgen-producing tissue in the ovary", "A biopsy", "None"]', 1, 'It is sometimes used when medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 12: AUB - Polyps (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Intermenstrual Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Intermenstrual Bleeding', 'A 38-year-old woman reports spotting in between her regular periods.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Intermenstrual Bleeding', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the PALM-COEIN system, what is this category of AUB?', '["AUB-L (Leiomyoma)", "AUB-P (Polyp)", "AUB-E (Endometrial)", "AUB-C (Coagulopathy)"]', 1, 'Endometrial polyps often present with intermenstrual bleeding.'),
    (v_case_id, 'What imaging technique is best for visualizing a polyp?', '["CT", "Saline Infusion Sonohysterography (SIS)", "Plain X-ray", "None"]', 1, 'Infusing saline helps outline the polyp within the cavity.'),
    (v_case_id, 'What is the treatment for a symptomatic polyp?', '["Observation", "Surgical removal (Polypectomy) via hysteroscopy", "Hysterectomy", "OCPs"]', 1, 'Hysteroscopic removal is the preferred management.');

    ---------------------------------------------------------------------------
    -- CASE 13: AUB - Coagulopathy (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bleeding since Menarche' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bleeding since Menarche', 'A 15-year-old girl has had extremely heavy periods since her very first cycle. She also reports frequent nosebleeds.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bleeding since Menarche', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What diagnosis should be strongly suspected in a teen with heavy bleeding at menarche?', '["PCOS", "Von Willebrand Disease (vWD)", "Fibroids", "Endometritis"]', 1, 'A significant percentage of teens with heavy menarcheal bleeding have an underlying coagulopathy.'),
    (v_case_id, 'What is the most common inherited bleeding disorder?', '["Hemophilia A", "Von Willebrand Disease", "Factor V Leiden", "Protein C deficiency"]', 1, 'vWD is the most common.'),
    (v_case_id, 'What is the first-line medical management for heavy periods in a teen with vWD?', '["Aspirin", "OCPs or Tranexamic acid (Lysteda)", "Immediate Hysterectomy", "None"]', 1, 'Combined hormonal contraceptives or antifibrinolytics are effective.');

    ---------------------------------------------------------------------------
    -- CASE 14: Ovarian Cyst Rupture (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Onset Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Onset Pain', 'A 24-year-old presents with sudden, sharp, one-sided pelvic pain that began during vigorous exercise. Ultrasound shows some free fluid in the pelvis.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Onset Pain', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ovarian Torsion", "Ruptured Functional Ovarian Cyst", "Appendicitis", "PID"]', 1, 'Sudden onset pain during exercise/intercourse with free fluid is classic for cyst rupture.'),
    (v_case_id, 'What is the management of a simple cyst rupture in a stable patient?', '["Immediate surgery", "Observation and pain management (NSAIDs)", "Antibiotics", "None"]', 1, 'Stable patients can be managed conservatively as the fluid will be reabsorbed.'),
    (v_case_id, 'When is surgery indicated for a ruptured cyst?', '["If the patient is hemodynamically unstable (e.g., signs of hemoperitoneum)", "Always", "Never", "Only if the patient is over 50"]', 0, 'Surgical intervention is needed if there is active internal bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 15: Chronic Pelvic Pain - IC (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painful Bladder Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painful Bladder Syndrome', 'A woman has had pelvic pain for 8 months. She reports the pain is worse when her bladder is full and is relieved by voiding. Urine cultures are consistently negative.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Painful Bladder Syndrome', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Recurrent UTI", "Interstitial Cystitis (IC)", "Endometriosis", "Fibroids"]', 1, 'Pain relieved by voiding (the \"Bladder Pain\" triad) is classic for IC.'),
    (v_case_id, 'What finding on cystoscopy is associated with IC?', '["Tumors", "Hunner''s ulcers (red, friable lesions)", "Stones", "None"]', 1, 'Hunner''s lesions are found in a subset of IC patients.'),
    (v_case_id, 'What is a common dietary trigger for IC pain?', '["Acidic foods, caffeine, and alcohol", "Vegetables", "Water", "None"]', 0, 'Dietary modification is often the first step in management.');

    ---------------------------------------------------------------------------
    -- CASE 16: Atrophic Vaginitis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postmenopausal Dyspareunia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postmenopausal Dyspareunia', 'A 60-year-old woman reports vaginal dryness and pain during intercourse. On exam, the vaginal mucosa is pale, thin, and lacks rugae.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Postmenopausal Dyspareunia', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Yeast infection", "Genitourinary Syndrome of Menopause (Atrophic vaginitis)", "Vulvar cancer", "Herpes"]', 1, 'Low estrogen levels lead to thinning and dryness of the vaginal tissues.'),
    (v_case_id, 'What is the first-line treatment for moderate to severe symptoms?', '["Oral antibiotics", "Low-dose topical vaginal estrogen (cream, ring, or tablet)", "Systemic HRT", "Observation"]', 1, 'Topical estrogen effectively restores the mucosa with minimal systemic absorption.'),
    (v_case_id, 'Does topical vaginal estrogen require \"progestin add-back\" to protect the uterus?', '["Yes", "No, at standard low doses, systemic absorption is negligible and the endometrium is not significantly stimulated"]', 1, 'Unlike systemic HRT, low-dose vaginal estrogen is safe without progestin.');

    ---------------------------------------------------------------------------
    -- CASE 17: Premature Ovarian Insufficiency - POI (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Early Menopause' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Early Menopause', 'A 32-year-old woman has had no periods for 6 months and is experiencing hot flashes. Her FSH level is 50 IU/L (High).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Early Menopause', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of POI?', '["Menopause before age 50", "Menopause before age 40", "Periods every 2 months", "None"]', 1, 'POI is defined as ovarian failure before age 40.'),
    (v_case_id, 'What is a common genetic cause of POI?', '["Down Syndrome", "Fragile X premutation or Turner Syndrome (45,X)", "Cystic fibrosis", "None"]', 1, 'X-chromosome anomalies are frequent causes.'),
    (v_case_id, 'What is the recommended treatment for these young women?', '["Nothing", "Hormone Replacement Therapy (HRT) until at least the age of natural menopause (approx. 51)", "Anti-estrogens", "None"]', 1, 'HRT is needed to prevent osteoporosis and cardiovascular disease in these young patients.');

    ---------------------------------------------------------------------------
    -- CASE 18: HRT - Indications & Risks (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Counseling on HRT' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Counseling on HRT', 'A 51-year-old healthy woman is bothered by 20 hot flashes a day and night sweats.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Counseling on HRT', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the PRIMARY indication for systemic HRT?', '["To prevent wrinkles", "Moderate to severe vasomotor symptoms (hot flashes/night sweats)", "To lose weight", "None"]', 1, 'HRT is the most effective treatment for hot flashes.'),
    (v_case_id, 'In a woman WITH a uterus, what MUST be included in the HRT regimen?', '["Only Estrogen", "Estrogen PLUS Progestin", "Only Progestin", "Testosterone"]', 1, 'Progestin is mandatory to prevent endometrial hyperplasia and cancer caused by estrogen.'),
    (v_case_id, 'What is an absolute contraindication to HRT?', '["History of breast cancer or active DVT/PE", "Diabetes", "Obesity", "Age 50"]', 0, 'Estrogen-sensitive cancers and thromboembolic disease are major contraindications.');

    ---------------------------------------------------------------------------
    -- CASE 19: Osteoporosis Prevention (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bone Health' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bone Health', 'A postmenopausal woman is concerned about her bone density.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bone Health', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age should routine DEXA screening begin for average-risk women?', '["Age 50", "Age 65", "Age 40", "Age 70"]', 1, 'Routine screening for osteoporosis starts at 65.'),
    (v_case_id, 'What is the T-score threshold for the diagnosis of Osteoporosis?', '["T-score > -1.0", "T-score <= -2.5", "T-score between -1 and -2.5", "None"]', 1, 'Osteopenia is -1 to -2.5; Osteoporosis is -2.5 or lower.'),
    (v_case_id, 'What lifestyle measures help prevent bone loss?', '["Weight-bearing exercise, Calcium, and Vitamin D", "Swimming only", "Bed rest", "Smoking"]', 0, 'Mechanical stress and adequate nutrients are vital for bone density.');

    ---------------------------------------------------------------------------
    -- CASE 20: Degenerating Fibroid (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fibroid in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fibroid in Pregnancy', 'A woman at 20 weeks gestation presents with acute, localized uterine pain and a low-grade fever. Ultrasound shows a known 6 cm fibroid that has changed in appearance.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fibroid in Pregnancy', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of this pain?', '["Appendicitis", "Carneous (Red) Degeneration of a fibroid", "Preterm labor", "Placental abruption"]', 1, 'Fibroids can outgrow their blood supply in pregnancy, leading to painful necrosis.'),
    (v_case_id, 'What is the management of a degenerating fibroid in pregnancy?', '["Immediate myomectomy", "Conservative management with NSAIDs and hydration", "Emergency C-section", "None"]', 1, 'Myomectomy is avoided during pregnancy due to high bleeding risk.'),
    (v_case_id, 'Do most fibroids grow or shrink in pregnancy?', '["Most shrink", "Most stay the same or show slight growth due to estrogen, but many actually decrease in size postpartum", "They always triple in size", "None"]', 1, 'Growth is variable but common in the first trimester.');

    ---------------------------------------------------------------------------
    -- CASE 21: Endometriosis and Infertility (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Endometriosis-Associated Infertility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Endometriosis-Associated Infertility', 'A woman with Stage IV endometriosis has been unable to conceive for 2 years.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Endometriosis-Associated Infertility', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does severe endometriosis cause infertility?', '["Anatomic distortion (pelvic adhesions and tubal blockage)", "It makes the woman tired", "It prevents intercourse", "None"]', 0, 'Scarring and adhesions are the primary mechanisms.'),
    (v_case_id, 'Does MEDICAL treatment of endometriosis (like OCPs) improve fertility rates?', '["Yes", "No, medical suppression does not help women conceive; it only treats the pain"]', 1, 'Suppression doesn''t work for fertility; you need surgery or IVF.'),
    (v_case_id, 'What is the most effective way for a woman with Stage IV endometriosis to conceive?', '["More OCPs", "In Vitro Fertilization (IVF)", "Natural timing", "None"]', 1, 'IVF bypasses the distorted pelvic anatomy.');

    ---------------------------------------------------------------------------
    -- CASE 22: Pelvic Congestion Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvic Varicosities' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvic Varicosities', 'A woman reports a dull, aching pelvic pain that is worse at the end of the day after standing and is relieved by lying down.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pelvic Varicosities', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Fibroids", "Pelvic Congestion Syndrome", "Endometriosis", "PID"]', 1, 'Pain that is positional and aching is characteristic of pelvic varices.'),
    (v_case_id, 'Where are the abnormal veins usually located?', '["Legs", "Broad ligament and ovarian veins", "Arms", "Head"]', 1, 'Incompetent valves in the ovarian veins lead to engorgement.'),
    (v_case_id, 'What is a potential treatment for Pelvic Congestion?', '["OCPs", "Ovarian vein embolization", "Hysterectomy", "All of the above"]', 3, 'Both medical and interventional options exist.');

    ---------------------------------------------------------------------------
    -- CASE 23: Post-Ablation Syndrome (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain after Ablation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain after Ablation', 'A woman had an endometrial ablation 2 years ago. She now presents with cyclic, severe, cramping pelvic pain but no bleeding.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pain after Ablation', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Adenomyosis", "Post-ablation Tubal Sterilization Syndrome (PATSS) or hematometra", "Fibroids", "Infection"]', 1, 'Blood can get trapped behind scarred areas in the uterus or tube.'),
    (v_case_id, 'How is this managed?', '["More ablation", "Hysterectomy", "OCPs", "Antibiotics"]', 1, 'Hysterectomy is often required for definitive pain relief.'),
    (v_case_id, 'Ablation should only be performed in women who:', '["Want more babies", "Have completed childbearing", "Are under 20", "None"]', 1, 'Pregnancy after ablation is very dangerous (high risk of accreta).');

    ---------------------------------------------------------------------------
    -- CASE 24: AUB-O - Anovulatory Bleeding (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregular Heavy Cycles' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregular Heavy Cycles', 'An obese 17-year-old has irregular periods that come every 40-60 days and are very heavy.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Irregular Heavy Cycles', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely mechanism of this bleeding?', '["Structural lesion", "Anovulation (AUB-O) leading to estrogen breakthrough bleeding", "Infection", "None"]', 1, 'Without ovulation, there is no progesterone to stabilize the lining.'),
    (v_case_id, 'What is the primary risk of untreated AUB-O in an obese patient?', '["Endometrial hyperplasia/cancer", "Twins", "Pneumonia", "None"]', 0, 'Long-term unopposed estrogen is a major risk factor.'),
    (v_case_id, 'What is the first-line treatment for AUB-O in a teen?', '["Hysterectomy", "Combined Oral Contraceptive Pills (OCPs)", "Aspirin", "Weight loss only"]', 1, 'OCPs regulate the cycle and protect the endometrium.');

    ---------------------------------------------------------------------------
    -- CASE 25: Uterine Prolapse (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvic Organ Prolapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvic Organ Prolapse', 'A 75-year-old G5P5 woman reports a feeling of \"sitting on a ball\" and seeing a bulge protruding from her vagina.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pelvic Organ Prolapse', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Cancer", "Uterine Prolapse", "Hemorrhoids", "Bladder infection"]', 1, 'Multiparous older women are at high risk for prolapse due to pelvic floor weakness.'),
    (v_case_id, 'What is a non-surgical management option for prolapse?', '["Antibiotics", "Vaginal Pessary", "OCPs", "None"]', 1, 'Pessaries are devices that provide structural support.'),
    (v_case_id, 'What is the most common RISK factor for pelvic organ prolapse?', '["Smoking", "Vaginal childbirth (multiparity)", "Asthma", "Diabetes"]', 1, 'Trauma to the pelvic fascia during birth is the leading risk.');

    ---------------------------------------------------------------------------
    -- CASE 26: Rectocele and Constipation (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Posterior Compartment Defect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Posterior Compartment Defect', 'A woman reports needing to push on the back wall of her vagina (splinting) to complete a bowel movement.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Posterior Compartment Defect', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition?', '["Cystocele", "Rectocele", "Uterine prolapse", "None"]', 1, 'Rectocele is a herniation of the rectum into the vagina.'),
    (v_case_id, 'What is a \"Cystocele\"?', '["Bladder protruding into the anterior vaginal wall", "Rectum in vagina", "Uterus out", "None"]', 0, 'Cystocele is the anterior compartment equivalent.'),
    (v_case_id, 'What surgical procedure repairs a rectocele?', '["Anterior colporrhaphy", "Posterior colporrhaphy", "Hysterectomy", "None"]', 1, 'Posterior repair reinforces the rectovaginal septum.');

    ---------------------------------------------------------------------------
    -- CASE 27: Dysmenorrhea - Primary (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painful Periods' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painful Periods', 'A 16-year-old girl has had painful periods since they began. The pain is worst on the first day and she has a normal pelvic exam.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Painful Periods', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Secondary Dysmenorrhea", "Primary Dysmenorrhea", "Endometriosis", "Fibroids"]', 1, 'Primary dysmenorrhea is pain in the absence of pelvic pathology.'),
    (v_case_id, 'What is the primary mediator of pain in primary dysmenorrhea?', '["Estrogen", "Prostaglandins (PGF2-alpha)", "Testosterone", "Infection"]', 1, 'Excess prostaglandins cause uterine contractions and ischemia.'),
    (v_case_id, 'What is the first-line treatment for primary dysmenorrhea?', '["Hysterectomy", "NSAIDs (which inhibit prostaglandin synthesis)", "Antibiotics", "None"]', 1, 'NSAIDs are highly effective if started just before or at the onset of pain.');

    ---------------------------------------------------------------------------
    -- CASE 28: Dysmenorrhea - Secondary (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'New Onset Dysmenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'New Onset Dysmenorrhea', 'A 35-year-old woman who previously had painless periods now develops worsening cyclic pain.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'New Onset Dysmenorrhea', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary Dysmenorrhea", "Secondary Dysmenorrhea", "PMS", "None"]', 1, 'Secondary dysmenorrhea refers to pain caused by an underlying condition (like fibroids or endometriosis).'),
    (v_case_id, 'Which of the following can cause secondary dysmenorrhea?', '["Endometriosis", "Adenomyosis", "Uterine Fibroids", "All of the above"]', 3, 'Structural or inflammatory conditions often lead to secondary pain.'),
    (v_case_id, 'What is the next best step for a woman with new-onset secondary dysmenorrhea?', '["Pelvic ultrasound", "Wait 1 year", "Antibiotics", "None"]', 0, 'Initial evaluation should include imaging to look for structural causes.');

    ---------------------------------------------------------------------------
    -- CASE 29: Ovarian Torsion (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Twisting Ovary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Twisting Ovary', 'A patient with a known 7 cm dermoid cyst presents with sudden, sharp, severe pain and nausea.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Twisting Ovary', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Appendicitis", "Ovarian Torsion", "Ruptured cyst", "PID"]', 1, 'Torsion is a surgical emergency.'),
    (v_case_id, 'What is the imaging study of choice?', '["CT scan", "Ultrasound with Doppler (to check for blood flow)", "MRI", "X-ray"]', 1, 'Absent Doppler flow is highly suggestive, though not 100% sensitive.'),
    (v_case_id, 'What is the current standard of surgical care for torsion?', '["Always remove the ovary", "Detorsion and cystectomy (to save the ovary)", "Hysterectomy", "None"]', 1, 'Ovarian-sparing surgery is preferred, even if the ovary looks dusky.');

    ---------------------------------------------------------------------------
    -- CASE 30: Asherman Syndrome (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Intrauterine Adhesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Intrauterine Adhesions', 'A woman has not had a period since she had a vigorous D&C for a post-delivery hemorrhage.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Intrauterine Adhesions', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PCOS", "Asherman Syndrome", "Menopause", "Pregnancy"]', 1, 'Scarring of the uterine cavity following trauma is Asherman syndrome.'),
    (v_case_id, 'What is the diagnosis/treatment for Asherman syndrome?', '["Hysterectomy", "Hysteroscopic lysis of adhesions", "OCPs", "Antibiotics"]', 1, 'Cutting the scars under direct visualization can restore menses and fertility.'),
    (v_case_id, 'Is Asherman syndrome an endocrine or structural problem?', '["Endocrine", "Structural"]', 1, 'It is a structural problem of the uterine lining, not a hormonal failure.');

    ---------------------------------------------------------------------------
    -- CASE 31: Fibroid Degeneration types (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Changes in Fibroids' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Changes in Fibroids', 'A pathologist is examining a leiomyoma removed from an elderly patient.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Changes in Fibroids', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of degeneration in fibroids?', '["Red", "Hyaline", "Calcific", "Cystic"]', 1, 'Hyaline degeneration (replacement by connective tissue) is the most common.'),
    (v_case_id, 'What type of degeneration is seen on X-ray in postmenopausal women?', '["Red", "Calcific", "Hyaline", "None"]', 1, 'Calcification is common in old, quiescent fibroids.'),
    (v_case_id, 'Which type of degeneration is associated with pregnancy?', '["Red (Carneous) degeneration", "Hyaline", "Calcific", "None"]', 0, 'Red degeneration is acute and painful.');

    ---------------------------------------------------------------------------
    -- CASE 32: Endometriosis - Sampson''s Theory (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'How Endometriosis Happens' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'How Endometriosis Happens', 'A student asks how endometrial tissue gets into the pelvis.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'How Endometriosis Happens', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most widely accepted theory of pathogenesis?', '["Infection", "Retrograde Menstruation (Sampson''s theory)", "Direct contact", "Genetics only"]', 1, 'Retrograde flow through the tubes allows tissue to seed the peritoneum.'),
    (v_case_id, 'What is the theory of \"Coelomic Metaplasia\"?', '["Tissue travels by blood", "Peritoneal cells transform into endometrial-like cells", "Reverse flow", "None"]', 1, 'This theory explains endometriosis in unusual sites (like the lung).'),
    (v_case_id, 'What is the role of ESTROGEN in endometriosis?', '["It kills the lesions", "It stimulates the growth and inflammation of the ectopic tissue", "It has no effect", "None"]', 1, 'Endometriosis is an estrogen-dependent condition.');

    ---------------------------------------------------------------------------
    -- CASE 33: PCOS - Insulin Sensitizers (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PCOS and Metformin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PCOS and Metformin', 'A patient with PCOS and a high BMI is started on Metformin.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'PCOS and Metformin', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Metformin help in PCOS?', '["It blocks testosterone", "It improves insulin sensitivity, reducing hyperinsulinemia and the drive for androgen production", "It stops hair growth", "None"]', 1, 'Reducing insulin levels helps break the feedback loop.'),
    (v_case_id, 'What is a common side effect of Metformin?', '["Rash", "GI upset (diarrhea/nausea)", "Headache", "Weight gain"]', 1, 'GI side effects are very common; starting with a low dose helps.'),
    (v_case_id, 'Is Metformin first-line for PCOS HIRSUTISM?', '["Yes", "No, OCPs are more effective for hair growth"]', 1, 'Metformin is less effective than OCPs for managing androgenic skin symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 34: Chronic Pelvic Pain - Definition (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Defining CPP' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Defining CPP', 'A woman has had non-cyclic pelvic pain for many months.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Defining CPP', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard time threshold for \"Chronic\" Pelvic Pain?', '["1 month", "6 months", "1 year", "2 years"]', 1, 'CPP is defined as pain of at least 6 months duration.'),
    (v_case_id, 'Does the pain have to be cyclic to be CPP?', '["Yes", "No, it can be cyclic or non-cyclic"]', 1, 'CPP encompasses a wide range of pain patterns.'),
    (v_case_id, 'What is a common non-gynecological cause of CPP?', '["Irritable Bowel Syndrome (IBS)", "Diabetes", "Pneumonia", "Heartburn"]', 0, 'GI and urological issues (like IC) are frequent mimics.');

    ---------------------------------------------------------------------------
    -- CASE 35: Premenstrual Syndrome - PMS (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cyclic Mood Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cyclic Mood Changes', 'A patient reports irritability, bloating, and breast tenderness that only occurs in the 7 days before her period.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cyclic Mood Changes', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What phase of the menstrual cycle is associated with PMS symptoms?', '["Follicular phase", "Luteal phase", "Ovulation", "None"]', 1, 'Symptoms occur in the luteal phase and must resolve during or after menses.'),
    (v_case_id, 'What is \"PMDD\" (Premenstrual Dysphoric Disorder)?', '["A mild form of PMS", "A severe form of PMS with significant psychiatric symptoms", "A brain tumor", "None"]', 1, 'PMDD is the most severe end of the spectrum.'),
    (v_case_id, 'What is the first-line pharmacologic treatment for severe PMS/PMDD?', '["Antibiotics", "SSRIs (Selective Serotonin Reuptake Inhibitors)", "Testosterone", "Aspirin"]', 1, 'SSRIs (like Fluoxetine) are highly effective.');

    ---------------------------------------------------------------------------
    -- CASE 36: Uterine Prolapse - Pelvic Floor Exercises (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Strengthening the Floor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Strengthening the Floor', 'A woman with early Stage I prolapse wants to avoid surgery.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Strengthening the Floor', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these exercises called?', '["Planks", "Kegel exercises", "Push-ups", "Crunches"]', 1, 'Kegels strengthen the levator ani muscles.'),
    (v_case_id, 'Do Kegels cure severe (Stage III/IV) prolapse?', '["Yes", "No, they are best for mild symptoms or stress incontinence"]', 1, 'Severe prolapse usually requires a pessary or surgery.'),
    (v_case_id, 'What is a surgical procedure to fix the uterus in place?', '["Sacrospinous ligament fixation", "Mastectomy", "Appendectomy", "None"]', 0, 'Various procedures suspend the vault or uterus to pelvic ligaments.');

    ---------------------------------------------------------------------------
    -- CASE 37: Endometritis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uterine Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uterine Infection', 'Three days after a C-section, a patient has a temperature of 101.5, uterine tenderness, and foul-smelling lochia.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Uterine Infection', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pneumonia", "Postpartum Endometritis", "UTI", "Mastitis"]', 1, 'Endometritis is the most common cause of postpartum fever.'),
    (v_case_id, 'What is the gold standard antibiotic regimen for post-C-section endometritis?', '["Amoxicillin", "Clindamycin and Gentamicin", "Vancomycin", "Azithromycin"]', 1, 'This covers the likely polymicrobial (aerobic and anaerobic) flora.'),
    (v_case_id, 'What is the single most important risk factor for postpartum endometritis?', '["Vaginal delivery", "Cesarean section", "Diabetes", "Age"]', 1, 'C-section increases the risk significantly over vaginal birth.');

    ---------------------------------------------------------------------------
    -- CASE 38: Amenorrhea - Primary (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'No Periods by Age 15' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'No Periods by Age 15', 'A 15-year-old girl with normal breast development and pubic hair has never had a period. On exam, she has a blind vaginal pouch and no uterus is palpable.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'No Periods by Age 15', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis in a girl WITH breasts but NO uterus?', '["Turner Syndrome", "Mullerian Agenesis (Mayer-Rokitansky-Kuster-Hauser syndrome)", "PCOS", "Pregnancy"]', 1, 'MRKH involves failure of the Mullerian ducts to develop.'),
    (v_case_id, 'What is another condition with a blind vaginal pouch but with MALE (46,XY) chromosomes?', '["MRKH", "Androgen Insensitivity Syndrome (AIS)", "Klinefelter Syndrome", "None"]', 1, 'AIS patients have testes and high testosterone but no androgen receptors.'),
    (v_case_id, 'What is the most important evaluation for a patient with primary amenorrhea?', '["Check for the presence or absence of the uterus (via US) and secondary sex characteristics", "Brain MRI", "Skin biopsy", "None"]', 0, 'This bifurcates the diagnostic algorithm.');

    ---------------------------------------------------------------------------
    -- CASE 39: Amenorrhea - Secondary (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Periods Have Stopped' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Periods Have Stopped', 'A 28-year-old who previously had regular cycles has not had a period for 4 months.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Periods Have Stopped', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the FIRST test that MUST be performed?', '["FSH", "Pregnancy test (hCG)", "Prolactin", "TSH"]', 1, 'Pregnancy is the most common cause of secondary amenorrhea.'),
    (v_case_id, 'What are other common causes of secondary amenorrhea?', '["Hyperprolactinemia, Thyroid disease, PCOS, and POI", "Diabetes", "Pneumonia", "None"]', 0, 'A systematic hormonal workup is required if hCG is negative.'),
    (v_case_id, 'What is the \"Progestin Challenge Test\" used for?', '["To induce pregnancy", "To assess for adequate endogenous estrogen and an intact outflow tract", "To treat hair growth", "None"]', 1, 'A withdrawal bleed indicates that the patient has estrogen and a patent uterus.');

    ---------------------------------------------------------------------------
    -- CASE 40: Hyperprolactinemia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Milk from the Breasts' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Milk from the Breasts', 'A non-pregnant woman reports milky nipple discharge and no periods.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Milk from the Breasts', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for milky nipple discharge?', '["Mastitis", "Galactorrhea", "Oligorrhea", "None"]', 1, 'Galactorrhea is often a sign of high prolactin.'),
    (v_case_id, 'What is the most common cause of pathological hyperprolactinemia?', '["PCOS", "Prolactinoma (Pituitary adenoma)", "Liver failure", "Hypoglycemia"]', 1, 'A pituitary tumor secreting prolactin suppresses GnRH.'),
    (v_case_id, 'Which medication class is a common drug-induced cause of hyperprolactinemia?', '["Antibiotics", "Antipsychotics (Dopamine antagonists)", "Aspirin", "Vitamins"]', 1, 'Dopamine normally inhibits prolactin; blocking it causes prolactin to rise.');

    ---------------------------------------------------------------------------
    -- CASE 41: Cervical Polyps (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-coital Spotting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-coital Spotting', 'A woman reports spotting after intercourse. On speculum exam, a small, red, fleshy growth is seen at the cervical os.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-coital Spotting', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Cervical Cancer", "Cervical Polyp", "Herpes", "Ectopic pregnancy"]', 1, 'Cervical polyps are common benign growths that often bleed with contact.'),
    (v_case_id, 'What is the management?', '["Immediate surgery", "Twisting it off in the office (polypectomy)", "OCPs", "Antibiotics"]', 1, 'Most can be easily removed in the office.'),
    (v_case_id, 'What must be done with any removed polyp?', '["Discard it", "Send for pathology to rule out malignancy", "Burn it", "None"]', 1, 'All tissue must be confirmed as benign.');

    ---------------------------------------------------------------------------
    -- CASE 42: Chronic Pelvic Pain - Pelvic Floor Myalgia (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Muscle Pain in the Pelvis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Muscle Pain in the Pelvis', 'A woman has chronic pain. On exam, she has severe tenderness over the levator ani muscles.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Muscle Pain in the Pelvis', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Endometriosis", "Pelvic Floor Myalgia/High-tone pelvic floor dysfunction", "Fibroids", "None"]', 1, 'Chronic muscle tension can cause significant pelvic pain.'),
    (v_case_id, 'What is the first-line treatment?', '["Surgery", "Pelvic Floor Physical Therapy", "Antibiotics", "Hysterectomy"]', 1, 'PT is the mainstay for muscular pain.'),
    (v_case_id, 'Which muscles are most commonly involved?', '["Abdominals", "Levator ani and Obturator internus", "Biceps", "None"]', 1, 'These internal pelvic muscles can develop trigger points.');

    ---------------------------------------------------------------------------
    -- CASE 43: PMS - Lifestyle Management (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PMS First Steps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PMS First Steps', 'A patient wants to try non-drug options for her mild PMS.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'PMS First Steps', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lifestyle changes are recommended for PMS?', '["Exercise, reducing caffeine/alcohol/salt, and complex carbohydrates", "Eating more salt", "Bed rest", "None"]', 0, 'Lifestyle modification is first-line for mild symptoms.'),
    (v_case_id, 'What vitamin/mineral supplement has some evidence for PMS?', '["Vitamin A", "Calcium and Vitamin B6", "Iron", "Vitamin K"]', 1, 'Calcium (1200mg/day) has been shown to reduce symptoms.'),
    (v_case_id, 'Is PMS common?', '["No", "Yes, up to 75-80% of women report some premenstrual symptoms"]', 1, 'It is a very frequent clinical encounter.');

    ---------------------------------------------------------------------------
    -- CASE 44: Fibroids - UAE vs Myomectomy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Choosing a Procedure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Choosing a Procedure', 'A 45-year-old G3P3 has symptomatic fibroids. She has completed her family and wants the shortest recovery time.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Choosing a Procedure', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which procedure offers a shorter recovery time than hysterectomy?', '["Open myomectomy", "Uterine Artery Embolization (UAE)", "Classic C-section", "None"]', 1, 'UAE is a minimally invasive radiological procedure.'),
    (v_case_id, 'Which procedure actually REMOVES the fibroids?', '["UAE", "Myomectomy", "OCPs", "None"]', 1, 'UAE infarctions them, but they remain in place; myomectomy physically removes them.'),
    (v_case_id, 'What is a possible side effect of UAE in a 45-year-old?', '["Early menopause", "Sudden pregnancy", "Taller height", "None"]', 0, 'Embolization can sometimes affect ovarian blood supply, leading to POI.');

    ---------------------------------------------------------------------------
    -- CASE 45: Adenomyosis - Diagnosis on MRI (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Imaging Adenomyosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Imaging Adenomyosis', 'A physician is ordering an MRI to differentiate fibroids from adenomyosis.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Imaging Adenomyosis', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a classic MRI finding for adenomyosis?', '["Well-circumscribed mass", "Thickened junctional zone (> 12 mm)", "Liquid fluid", "None"]', 1, 'The junctional zone is the area between the endometrium and myometrium.'),
    (v_case_id, 'How do fibroids look different on MRI?', '["They don''t", "They are well-circumscribed and typically low signal intensity on T2", "They are fuzzy", "None"]', 1, 'Fibroids have a clear \"pseudocapsule,\" unlike adenomyosis.'),
    (v_case_id, 'Can both conditions exist in the same uterus?', '["Yes", "No", "Only in twins", "None"]', 0, 'Co-existence is very common.');

    ---------------------------------------------------------------------------
    -- CASE 46: Atrophic Vaginitis - Lubricants vs Estrogen (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dryness Relief' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dryness Relief', 'A patient with mild vaginal dryness prefers not to use hormones.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dryness Relief', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the difference between a lubricant and a moisturizer?', '["None", "Lubricants are for intercourse; moisturizers are for long-term hydration", "One is for the skin", "None"]', 1, 'Vaginal moisturizers (like Replens) are used 2-3 times a week regardless of sexual activity.'),
    (v_case_id, 'Which one is first-line for MILD atrophic symptoms?', '["Estrogen cream", "Non-hormonal lubricants and moisturizers", "Hysterectomy", "Antibiotics"]', 1, 'Start with non-hormonal options for mild cases.'),
    (v_case_id, 'If non-hormonal options fail, what is the next step?', '["Vaginal Estrogen", "Systemic HRT", "Give up", "Surgery"]', 0, 'Topical estrogen is the gold standard for symptomatic GSM.');

    ---------------------------------------------------------------------------
    -- CASE 47: PCOS - Hirsutism Score (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ferriman-Gallwey Score' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ferriman-Gallwey Score', 'A physician is assessing a patient for hirsutism.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Ferriman-Gallwey Score', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the scoring system for hirsutism?', '["Ferriman-Gallwey score", "Glasgow Coma Scale", "Apgar score", "None"]', 0, 'It assesses hair growth in 9 androgen-sensitive body areas.'),
    (v_case_id, 'What score is generally considered \"hirsute\" in most populations?', '["1", "8 or higher", "50", "None"]', 1, 'A score >= 8 is standard, though cutoffs vary by ethnicity.'),
    (v_case_id, 'Does the score include hair on the lower legs or forearms?', '["Yes", "No, those are not androgen-sensitive areas", "Only in men", "None"]', 1, 'Terminal hair on the chin, chest, and upper abdomen is more significant.');

    ---------------------------------------------------------------------------
    -- CASE 48: Menopause - Timing (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When Periods End' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When Periods End', 'A 52-year-old woman hasn''t had a period for 13 months.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'When Periods End', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of menopause?', '["FSH > 10", "12 consecutive months of amenorrhea in a woman > 45", "Periods every 6 months", "None"]', 1, 'It is a retrospective diagnosis based on clinical history.'),
    (v_case_id, 'What is the average age of menopause in the US?', '["45", "51", "55", "40"]', 1, 'Age 51 is the mean.'),
    (v_case_id, 'What is \"Perimenopause\"?', '["After menopause", "The transition period of irregular cycles and symptoms leading up to menopause", "Puberty", "None"]', 1, 'Perimenopause can last several years.');

    ---------------------------------------------------------------------------
    -- CASE 49: Adenomyosis - Definitive Diagnosis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Confirming Adenomyosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Confirming Adenomyosis', 'A woman has a hysterectomy for suspected adenomyosis.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Confirming Adenomyosis', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the diagnosis of adenomyosis finally confirmed?', '["Ultrasound", "Pathological examination of the uterus after hysterectomy", "CA-125", "None"]', 1, 'Like endometriosis, a definitive diagnosis is pathologic.'),
    (v_case_id, 'What is the pathological hallmark of adenomyosis?', '["Myometrial invasion by endometrial glands and stroma > 2.5mm from the basalis", "Muscle tumors", "Cancers", "None"]', 0, 'This is the histological definition.'),
    (v_case_id, 'Is adenomyosis malignant?', '["Yes", "No, it is a benign condition", "Always", "None"]', 1, 'It is benign but can cause significant morbidity.');

    ---------------------------------------------------------------------------
    -- CASE 50: Pelvic Pain - Red Flags (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When Pain is Urgent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When Pain is Urgent', 'A patient presents with acute pelvic pain.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'When Pain is Urgent', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which finding is a \"red flag\" for a surgical emergency?', '["Mild cramping", "Fever, peritoneal signs (rebound/guarding), and hemodynamic instability", "Regular periods", "None"]', 1, 'These indicate potential rupture, torsion, or abscess.'),
    (v_case_id, 'What is the most common gynecological emergency involving an adnexal mass?', '["PCOS", "Ovarian Torsion", "Fibroids", "Endometrioma"]', 1, 'Torsion must be ruled out immediately to save the ovary.'),
    (v_case_id, 'What is the most important first test in ANY woman of reproductive age with pelvic pain?', '["CT scan", "Pregnancy test (hCG)", "MRI", "CA-125"]', 1, 'Ectopic pregnancy is the most life-threatening differential.');

    RAISE NOTICE 'SUCCESS: 50 Benign Gynecology Case Blocks registered.';
END $$;

COMMIT;
