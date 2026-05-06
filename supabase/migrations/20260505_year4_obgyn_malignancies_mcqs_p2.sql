BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-malignancies not found.';
    END IF;

    -- Batch 2: 61-120 (Ovarian Cancer, Germ Cell Tumors, and Epithelial Malignancies)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Ovarian Cancer" has the highest mortality rate of all gynecological cancers because:', '["It is very aggressive", "It is often asymptomatic and diagnosed at an advanced stage (Stage III/IV)", "It occurs in young women", "Treatment is unavailable"]', 1, 'Lack of effective screening and vague symptoms lead to late diagnosis. (ACOG)'),
    (v_topic_id, '62: What is the most significant RISK FACTOR for Epithelial Ovarian Cancer?', '["Smoking", "Increased number of ovulatory cycles (nulliparity, early menarche, late menopause)", "Multiple partners", "OCP use"]', 1, '"Incessant ovulation" theory suggests repeated trauma to the ovarian surface increases cancer risk. (Williams)'),
    (v_topic_id, '63: "Oral Contraceptive Pills" (OCPs) _____ the risk of ovarian cancer.', '["Increase", "Decrease (by ~50% with long-term use)", "Do not affect", "None"]', 1, 'OCPs suppress ovulation, protecting the ovarian surface. (Williams)'),
    (v_topic_id, '64: Which genetic mutations are most strongly associated with hereditary ovarian cancer?', '["BRCA1 and BRCA2", "p53 only", "APC", "KRAS"]', 0, 'BRCA1 lifetime risk is ~40%; BRCA2 is ~15-20%. (ACOG)'),
    (v_topic_id, '65: Women with "BRCA1" mutations should be offered prophylactic "Risk-Reducing Salpingo-Oophorectomy" (RRSO) by age:', '["25", "35-40 (after childbearing is complete)", "60", "None"]', 1, 'Significantly reduces risk of ovarian and breast cancer. (ACOG)'),
    (v_topic_id, '66: Most epithelial ovarian cancers are thought to actually originate in the:', '["Ovarian stroma", "Distal Fallopian Tube (fimbria)", "Uterus", "Bladder"]', 1, 'Serous Tubal Intraepithelial Carcinoma (STIC) is a precursor. (Beckmann)'),
    (v_topic_id, '67: Vague symptoms of Ovarian Cancer often include:', '["Abdominal bloating, pelvic pain, and early satiety", "Fever and rash", "Weight gain", "None"]', 0, 'Patients often think they have GI issues. (Williams)'),
    (v_topic_id, '68: What is the most common histological type of Epithelial Ovarian Cancer?', '["Mucinous", "Serous (High-grade Serous)", "Endometrioid", "Clear cell"]', 1, 'Accounts for the majority of cases. (Beckmann)'),
    (v_topic_id, '69: "CA-125" is a tumor marker primarily used for:', '["Screening the general population", "Monitoring response to treatment and detecting recurrence in epithelial ovarian cancer", "Diagnosing PCOS", "None"]', 1, 'Not useful for screening due to low specificity (can be elevated in menses, endometriosis, etc.). (ACOG)'),
    (v_topic_id, '70: A postmenopausal woman with an adnexal mass and a CA-125 > _____ U/mL has a high risk of malignancy.', '["5", "35", "100", "500"]', 1, 'Higher threshold for concern in postmenopausal women. (Beckmann)'),
    (v_topic_id, '71: "Sister Mary Joseph Nodule" is a sign of metastatic cancer presenting as a palpable mass in the:', '["Axilla", "Umbilicus", "Neck", "Groin"]', 1, 'Often associated with advanced intra-abdominal malignancy. (Williams)'),
    (v_topic_id, '72: "Meigs Syndrome" consists of an ovarian fibroma plus:', '["Fever and rash", "Ascites and Right-sided Hydrothorax (Pleural effusion)", "Diabetes", "HTN"]', 1, 'The effusion and ascites resolve after the benign tumor is removed. (Beckmann)'),
    (v_topic_id, '73: "Ovarian Germ Cell Tumors" are most common in which age group?', '["Adolescents and young women (10-30 years)", "Postmenopausal women", "Infants", "None"]', 0, 'Contrasts with epithelial cancers which occur in older women. (Williams)'),
    (v_topic_id, '74: The most common BENIGN germ cell tumor is the:', '["Dysgerminoma", "Mature Cystic Teratoma (Dermoid Cyst)", "Endodermal Sinus Tumor", "None"]', 1, 'Contains all three germ layers (hair, teeth, sebum). (Beckmann)'),
    (v_topic_id, '75: "Dysgerminoma" is the most common MALIGNANT germ cell tumor and often produces which marker?', '["AFP", "LDH", "hCG", "CA-125"]', 1, 'Highly radiosensitive/chemosensitive. (Williams)'),
    (v_topic_id, '76: "Endodermal Sinus Tumor" (Yolk Sac Tumor) characteristically produces which marker?', '["LDH", "Alpha-fetoprotein (AFP)", "hCG", "None"]', 1, 'Associated with Schiller-Duval bodies on pathology. (Beckmann)'),
    (v_topic_id, '77: "Choriocarcinoma" (Non-gestational) produces high levels of:', '["hCG", "AFP", "LDH", "None"]', 0, 'Highly aggressive germ cell tumor. (Williams)'),
    (v_topic_id, '78: "Struma Ovarii" is a specialized teratoma that contains:', '["Hair", "Thyroid tissue (can cause hyperthyroidism)", "Brain tissue", "None"]', 1, 'Rare cause of thyrotoxicosis. (Beckmann)'),
    (v_topic_id, '79: "Sex Cord-Stromal Tumors" include which of the following?', '["Dysgerminoma", "Granulosa Cell Tumors and Sertoli-Leydig Cell Tumors", "Serous cystadenoma", "None"]', 1, 'Arise from the connective tissue/supporting cells. (Williams)'),
    (v_topic_id, '80: "Granulosa Cell Tumors" often secrete _____ and can cause precocious puberty or postmenopausal bleeding.', '["Androgens", "Estrogen", "Thyroid hormone", "None"]', 1, 'Associated with Call-Exner bodies on histology. (Beckmann)'),
    (v_topic_id, '81: "Sertoli-Leydig Cell Tumors" often secrete _____ and cause virilization.', '["Estrogen", "Androgens (Testosterone)", "Progesterone", "None"]', 1, 'Present with hirsutism and clitoromegaly. (Williams)'),
    (v_topic_id, '82: "Krukenberg Tumor" is a metastatic tumor to the ovary, most commonly from the:', '["Breast", "GI tract (Stomach)", "Lung", "Brain"]', 1, 'Characterized by "signet ring" cells. (Beckmann)'),
    (v_topic_id, '83: Standard surgical management for Ovarian Cancer?', '["Total Hysterectomy, BSO, and Omentectomy with \"cytoreduction\" (debulking)", "Biopsy only", "Ovarian cystectomy", "None"]', 0, 'Goal is to leave no visible tumor > 1cm. (ACOG)'),
    (v_topic_id, '84: "Cytoreduction" in ovarian cancer is important because:', '["It cures the patient", "Remaining small tumor nodules respond better to chemotherapy", "It is cheaper", "None"]', 1, 'Standard of care for Stage III/IV. (Williams)'),
    (v_topic_id, '85: First-line chemotherapy for Epithelial Ovarian Cancer?', '["Doxorubicin", "Carboplatin + Paclitaxel", "Cisplatin + 5-FU", "Methotrexate"]', 1, 'The standard "Platinum-Taxane" doublet. (ACOG)'),
    (v_topic_id, '86: Ovarian cancer staging is:', '["Clinical", "Surgical", "Radiological", "None"]', 1, 'Requires laparotomy and thorough exploration of the peritoneal cavity. (FIGO)'),
    (v_topic_id, '87: "Stage I" Ovarian Cancer:', '["Confined to the ovaries", "Spread to pelvis", "Spread to liver", "None"]', 0, 'Early stage, often incidental finding. (Williams)'),
    (v_topic_id, '88: "Stage II" Ovarian Cancer:', '["Spread to liver", "Pelvic extension (uterus, tubes, or other pelvic tissues)", "Distant mets", "None"]', 1, 'Remains within the true pelvis. (Beckmann)'),
    (v_topic_id, '89: "Stage III" Ovarian Cancer:', '["Spread to liver parenchyma", "Peritoneal implants outside the pelvis and/or positive retroperitoneal lymph nodes", "Lungs", "None"]', 1, 'Most common stage at presentation. (Williams)'),
    (v_topic_id, '90: "Stage IV" Ovarian Cancer involves:', '["Pelvis only", "Distant metastasis (e.g., pleural effusion with positive cytology, or liver/spleen parenchymal mets)", "Uterus", "None"]', 1, 'Advanced disease. (Beckmann)'),
    (v_topic_id, '91: "Mature Teratoma" (Dermoid) is usually:', '["Malignant", "Benign", "Infectious", "None"]', 1, 'But carries a risk of "malignant transformation" (usually SCC) in < 1% of cases. (Williams)'),
    (v_topic_id, '92: "Immature Teratoma" is:', '["Benign", "Malignant", "Infectious", "None"]', 1, 'Graded based on the amount of neural tissue. (Beckmann)'),
    (v_topic_id, '93: "Dysgerminoma" is the female counterpart to the male:', '["Seminoma", "Teratoma", "Yolk sac tumor", "None"]', 0, 'Identical histology and clinical behavior. (Williams)'),
    (v_topic_id, '94: Which tumor marker is useful for "Mucinous" ovarian cancer?', '["hCG", "CEA and CA-19-9", "AFP", "None"]', 1, 'Can also be elevated in GI cancers. (Beckmann)'),
    (v_topic_id, '95: "Pseudomyxoma Peritonei" (Jelly belly) is often associated with which ovarian tumor?', '["Serous", "Mucinous (often originating from the appendix)", "Clear cell", "None"]', 1, 'Massive accumulation of gelatinous ascites. (Williams)'),
    (v_topic_id, '96: "Lynch Syndrome" patients should have which screening starting at age 30-35?', '["Annual EMB and TVUS", "Colonoscopy every 10 years", "None", "Pap smear"]', 0, 'Due to high risk of Endometrial and Ovarian cancer. (ACOG)'),
    (v_topic_id, '97: "Peutz-Jeghers Syndrome" is associated with which rare ovarian tumor?', '["Sertoli-Leydig", "Sex Cord Tumor with Annular Tubules (SCTAT)", "Dysgerminoma", "None"]', 1, 'Also associated with GI polyps and freckling. (Beckmann)'),
    (v_topic_id, '98: "CA-125" is NOT elevated in which of the following?', '["Endometriosis", "Pregnancy", "Fibroids", "It can be elevated in all of these (low specificity)"]', 3, 'Limits its use for screening. (ACOG)'),
    (v_topic_id, '99: Standard screening for Ovarian Cancer in the general population?', '["Annual TVUS", "Annual CA-125", "Pelvic exam only (no recommended routine screening tests)", "Pap smear"]', 2, 'No screening test has been shown to reduce mortality in low-risk women. (ACOG/USPSTF)'),
    (v_topic_id, '100: "Borderline Ovarian Tumors" (Low Malignant Potential) are characterized by:', '["Invasive growth", "Cellular atypia without stromal invasion", "Benign behavior only", "None"]', 1, 'Excellent prognosis; often managed with conservative surgery. (Williams)'),
    (v_topic_id, '101: "Vulvar Cancer" is most common in which age group?', '["Postmenopausal women (average age 65-70)", "Adolescents", "Infants", "None"]', 0, 'Usually squamous cell carcinoma. (Beckmann)'),
    (v_topic_id, '102: Two main pathways for Vulvar SCC?', '["HPV-associated (younger women) and Chronic inflammation/Lichen Sclerosus (older women)", "Smoking only", "Alcohol", "None"]', 0, 'Differentiated VIN is often HPV-negative. (ACOG)'),
    (v_topic_id, '103: A patient has a chronic vulvar itch and a "white, lace-like" or "parchment" appearance. Diagnosis?', '["Cancer", "Lichen Sclerosus", "Yeast infection", "Normal"]', 1, 'Increases risk of vulvar SCC; requires biopsy and topical steroids. (Williams)'),
    (v_topic_id, '104: Most common site for Vulvar Cancer?', '["Clitoris", "Labia Majora", "Anus", "None"]', 1, 'Presents as a mass, plaque, or ulcer. (Beckmann)'),
    (v_topic_id, '105: "Vulvar Paget Disease" presents as:', '["White patch", "Red, eczematous, pruritic lesion", "Black spot", "None"]', 1, 'Associated with an underlying visceral malignancy (colon, breast, etc.) in ~20-30%. (Williams)'),
    (v_topic_id, '106: First step in managing a suspicious vulvar lesion?', '["Steroids", "Biopsy", "Antifungals", "Antibiotics"]', 1, 'Must rule out cancer in persistent lesions. (ACOG)'),
    (v_topic_id, '107: "Vulvar Cancer" staging is:', '["Clinical", "Surgical (based on vulvectomy and lymph node dissection)", "None", "Radiological"]', 1, 'Inguinal lymph node status is the most important prognostic factor. (FIGO)'),
    (v_topic_id, '108: "Sentinel Lymph Node" biopsy in vulvar cancer is used for:', '["All patients", "Early stage (T1/T2) lesions < 4cm to avoid the morbidity of full groin dissection", "Stage IV", "None"]', 1, 'Standard of care to reduce lymphedema risk. (Williams)'),
    (v_topic_id, '109: "Vaginal Cancer" is most commonly metastatic from:', '["Cervix or Endometrium", "Lung", "Brain", "None"]', 0, 'Primary vaginal cancer is rare. (Beckmann)'),
    (v_topic_id, '110: Most common histological type of Primary Vaginal Cancer?', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Melanoma", "Sarcoma"]', 1, 'Also strongly associated with high-risk HPV. (Williams)'),
    (v_topic_id, '111: "Vaginal Intraepithelial Neoplasia" (VaIN) is most common in the:', '["Lower 1/3 of vagina", "Upper 1/3 of vagina", "Mid-vagina", "None"]', 1, 'Often follows or occurs with CIN. (Beckmann)'),
    (v_topic_id, '112: "Sarcoma Botryoides" (Embryonal Rhabdomyosarcoma) presents as:', '["White plaque", "Grape-like mass in the vagina of a young child (< 5 years old)", "Black spot", "None"]', 1, 'Classic presentation of this rare, aggressive tumor. (Williams)'),
    (v_topic_id, '113: "Gestational Trophoblastic Disease" (GTD) includes:', '["Hydatidiform Mole (Partial and Complete)", "Choriocarcinoma", "Placental Site Trophoblastic Tumor", "All of the above"]', 3, 'Spectrum of placental proliferation. (ACOG)'),
    (v_topic_id, '114: "Complete Mole" karyotype is usually:', '["46, XX (all paternal DNA)", "69, XXY", "45, X", "47, XXY"]', 0, 'Egg loses its DNA and is fertilized by one sperm that duplicates. (Beckmann)'),
    (v_topic_id, '115: "Partial Mole" karyotype is usually:', '["46, XX", "69, XXX or XXY (Triploid; 2 sperm + 1 egg)", "45, X", "None"]', 1, 'Fetal parts may be present. (Williams)'),
    (v_topic_id, '116: "Complete Mole" ultrasound appearance?', '["Fetus", "Snowstorm or Grape-like clusters (no fetus)", "Normal", "Empty sac"]', 1, 'Cystic swelling of the chorionic villi. (Beckmann)'),
    (v_topic_id, '117: Classic symptoms of a "Complete Mole"?', '["Painless bleeding", "Uterine size > dates, high hCG (> 100,000), hyperemesis, and early pre-eclampsia", "Normal pregnancy", "None"]', 1, 'Trophoblastic tissue overgrowth. (ACOG)'),
    (v_topic_id, '118: Management of a Hydatidiform Mole?', '["C-section", "Suction Dilation and Curettage (D&C)", "Hysterectomy for everyone", "Antibiotics"]', 1, 'Evacuation of the uterus. (Williams)'),
    (v_topic_id, '119: Following molar evacuation, what is the most important monitoring step?', '["Ultrasound", "Weekly Serum hCG until zero for 3 consecutive weeks, then monthly for 6 months", "Chest X-ray", "Pap smear"]', 1, 'To monitor for Gestational Trophoblastic Neoplasia (GTN). (ACOG)'),
    (v_topic_id, '120: "Theca Lutein Cysts" are associated with moles due to:', '["Infection", "Extreme hCG stimulation of the ovaries", "Low estrogen", "None"]', 1, 'Ovaries can become massively enlarged. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 2 (61-120) MCQs for Gyn Malignancies registered.';
END $$;
COMMIT;
