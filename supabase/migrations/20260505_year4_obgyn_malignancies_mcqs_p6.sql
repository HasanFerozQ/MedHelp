BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-malignancies not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review and Integration)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A patient has "ASC-H" on Pap. Colposcopy shows a high-grade lesion that is fully visualized. Biopsy confirms CIN 3. Management?', '["LEEP or CKC", "Hysterectomy", "Observation", "None"]', 0, 'High-grade cervical intraepithelial neoplasia requires treatment. (ACOG)'),
    (v_topic_id, '302: A postmenopausal woman has a "Palpable Ovary" on pelvic exam. Next step?', '["Ignore", "Evaluation with Ultrasound (Postmenopausal ovaries should not be palpable)", "Immediate surgery", "Wait 1 year"]', 1, 'A palpable ovary in this age group is suspicious for an adnexal mass. (Beckmann)'),
    (v_topic_id, '303: Which gynecological cancer is most likely to be detected by a "Pap smear" during routine screening?', '["Endometrial", "Ovarian", "Cervical (Squamous Cell)", "Vulvar"]', 2, 'Pap smear is a screening tool specifically for the cervix. (ACOG)'),
    (v_topic_id, '304: "Endometrial Cancer": Which ethnic group has a higher mortality rate and more aggressive histotypes in the US?', '["White", "Black / African American", "Asian", "None"]', 1, 'Significant disparities exist in outcomes and disease aggressive subtypes. (ACOG)'),
    (v_topic_id, '305: A "Complete Mole" that returns with "Rising hCG" after D&C is diagnosed as:', '["Infection", "Gestational Trophoblastic Neoplasia (GTN)", "Normal pregnancy", "None"]', 1, 'Mandates staging (CXR/Labs) and chemotherapy. (Williams)'),
    (v_topic_id, '306: "BRCA1" - Risk of BREAST cancer?', '["10%", "50-80%", "5%", "100%"]', 1, 'High lifetime risk. (ACOG)'),
    (v_topic_id, '307: "Lynch Syndrome" - Screening for Endometrial cancer should start at age:', '["21", "30-35", "50", "None"]', 1, 'Annual EMB is the standard recommendation. (ACOG)'),
    (v_topic_id, '308: "Vulvar Cancer": A patient has a "Black, asymmetrical" lesion on the vulva. Diagnosis?', '["SCC", "Melanoma", "Paget''s", "None"]', 1, 'Melanoma is the second most common vulvar cancer. (Beckmann)'),
    (v_topic_id, '309: "Vaginal Cancer": Most common site for squamous cell carcinoma?', '["Lower 1/3", "Upper 1/3 (Posterior wall)", "Cervix", "None"]', 1, 'Usually spread from the cervix or primary in the vault. (Williams)'),
    (v_topic_id, '310: "Ovarian Cancer" - "CA-125" follow-up interval after remission?', '["Every 10 years", "Every 3 months for 2 years, then every 6 months", "Once a year", "None"]', 1, 'Standard surveillance protocol. (ACOG)'),
    (v_topic_id, '311: "Cervical Cancer" - Can a woman get pregnant after "Radical Trachelectomy"?', '["No", "Yes, but requires a cerclage and C-section for delivery", "Yes, natural birth", "None"]', 1, 'Fertility-sparing option for small Stage I tumors. (Williams)'),
    (v_topic_id, '312: "Endometrial Cancer" - If cancer is found in a "Polyps" alone:', '["It is benign", "It is still treated based on the grade and depth of invasion into the polyp stalk/base", "No treatment", "None"]', 1, 'Malignant polyps are a known presentation. (Beckmann)'),
    (v_topic_id, '313: "Mature Teratoma" (Dermoid) containing thyroid tissue that causes hyperthyroidism is called:', '["Dermoid", "Struma Ovarii", "Brenner", "None"]', 1, 'High-yield monodermal teratoma. (Williams)'),
    (v_topic_id, '314: "Meigs Syndrome": Does the fluid go away after surgery?', '["No", "Yes, it typically resolves spontaneously once the fibroma is removed", "Needs radiation", "None"]', 1, 'Definitive characteristic. (Beckmann)'),
    (v_topic_id, '315: "Cervical Cancer" - "Stage IIA" involves the:', '["Parametria", "Upper 2/3 of the vagina (no parametrial involvement)", "Lower 1/3", "None"]', 1, 'Distinguished from IIB by lack of parametrial spread. (FIGO)'),
    (v_topic_id, '316: "Ovarian Cancer": Which staging group includes "positive peritoneal washings"?', '["IA", "IB", "IC", "II"]', 2, 'Increases the risk of recurrence and upstages from IA/IB. (FIGO)'),
    (v_topic_id, '317: "Choriocarcinoma" can follow:', '["A molar pregnancy", "A miscarriage", "A normal term pregnancy", "All of the above"]', 3, 'Can occur after ANY pregnancy event. (Williams)'),
    (v_topic_id, '318: "Vulvar Paget Disease": Is it usually "invasive" at diagnosis?', '["Yes", "No, it is usually \"in-situ\" (intraepithelial)", "Only in children", "None"]', 1, 'But must be checked for underlying invasion. (Beckmann)'),
    (v_topic_id, '319: "Vaginal Cancer" - FIGO Stage II?', '["Confined to wall", "Invades paravaginal tissue but NOT the pelvic wall", "Nodes positive", "None"]', 1, 'Local extension. (FIGO)'),
    (v_topic_id, '320: "Cervical Cancer" - The "Auscultation" of bowel sounds is important after surgery to check for:', '["Infection", "Postoperative ileus or small bowel obstruction", "Diabetes", "None"]', 1, 'Common surgical complication. (Beckmann)'),
    (v_topic_id, '321: "Endometrial Cancer" - "Uterine Papillary Serous" (UPSC) histology is similar to:', '["Cervical cancer", "High-grade Serous Ovarian cancer", "Skin cancer", "None"]', 1, 'Aggressive behavior and propensity for peritoneal spread. (Williams)'),
    (v_topic_id, '322: "Ovarian Cancer" - "Clear cell" carcinoma is strongly associated with which benign condition?', '["PCOS", "Endometriosis", "Fibroids", "Infection"]', 1, 'One of the two "Endometrioid-like" epithelial cancers. (Beckmann)'),
    (v_topic_id, '323: "Vulvar Cancer": "Sentinel node" mapping uses:', '["Iodine", "Technetium-99 and/or Isosulfan blue dye", "Vinegar", "None"]', 1, 'Standard nuclear/dye mapping technique. (Williams)'),
    (v_topic_id, '324: "GTN" - "hCG" follow-up: If a patient has 3 consecutive weekly zeros, they then get _____ monthly zeros.', '["1", "3", "6", "12"]', 2, 'Standard ACOG monitoring period for low-risk disease. (ACOG)'),
    (v_topic_id, '325: "Cervical Cancer" - "Post-coital bleeding" is the most common symptom. "Intermenstrual" bleeding is:', '["Uncommon", "Also common", "Normal", "None"]', 1, 'Irregular bleeding is a key warning sign. (Beckmann)'),
    (v_topic_id, '326: "Endometrial Cancer" - "Grade" is the single most important prognostic factor in Stage I disease.', '["True", "False, it is the depth of invasion", "Only in obesity", "None"]', 0, 'Grade correlates strongly with node risk and survival. (FIGO)'),
    (v_topic_id, '327: "Ovarian Cancer" - "Borderline" tumors are also called:', '["Malignant", "Atypical Proliferative Tumors", "Benign", "None"]', 1, 'Modern pathology term. (Williams)'),
    (v_topic_id, '328: "Vulvar SCC" - "Inguinal-femoral" lymphadenectomy is performed via:', '["A separate incision from the vulvectomy (Triple incision technique)", "The same incision", "Laparoscopy", "None"]', 0, 'Reduces wound breakdown and infection risk. (Beckmann)'),
    (v_topic_id, '329: "Vaginal Cancer" - If the tumor involves the "Cervix," it is classified as:', '["Vaginal cancer", "Cervical cancer", "Uterine cancer", "None"]', 1, 'Primary vaginal cancer only applies if the cervix is uninvolved. (FIGO)'),
    (v_topic_id, '330: "HPV" - Does "condom" use completely prevent transmission?', '["Yes", "No, it reduces risk but skin-to-skin contact in uncovered areas can still transmit HPV", "Only in men", "None"]', 1, 'Important patient counseling point. (CDC)'),
    (v_topic_id, '331: "Gyn Malignancy": "Lymphedema" is a chronic complication of:', '["Chemo", "Pelvic or inguinal lymph node dissection", "Antibiotics", "None"]', 1, 'Causes swelling of the lower extremities. (Beckmann)'),
    (v_topic_id, '332: "Endometrial Cancer": "Lynch Syndrome" patients have what risk of COLON cancer?', '["10%", "Up to 80%", "5%", "None"]', 1, 'High-yield board association. (Beckmann)'),
    (v_topic_id, '333: "Ovarian Cancer" - "Hereditary Breast and Ovarian Cancer" (HBOC) syndrome involves:', '["BRCA1/2", "MMR genes", "p53", "None"]', 0, 'The most common hereditary ovarian cancer syndrome. (ACOG)'),
    (v_topic_id, '334: "Gestational Trophoblastic Disease" - "Mole" comes from the Latin word for:', '["\"Grapes\"", "\"Mass or False conception\"", "Fetus", "None"]', 1, 'Etymology of the term. (Williams)'),
    (v_topic_id, '335: What is the most important "High-Risk" strategy for reducing Gynecological Cancer mortality?', '["Weight gain", "Screening (where available) and early evaluation of \"Warning Signs\" like postmenopausal or post-coital bleeding", "Induction", "None"]', 1, 'Early detection saves lives. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Gyn Malignancies registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
