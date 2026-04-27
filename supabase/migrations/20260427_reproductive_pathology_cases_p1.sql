-- Migration: Reproductive Pathology Cases Part 1 (01-10)
-- Goal: Cover Female Genital System: Vulva, Vagina, Cervix, and Uterus
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

-- 1. Ensure Topic "Reproductive Pathology" exists
INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
VALUES ('Reproductive Pathology', 'reproductive-pathology', 3, 2, 60, NULL)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'reproductive-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10;

    -- CASE 01: Lichen Sclerosus vs Lichen Simplex Chronicus
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Thinning Vulvar Skin', 'A 65-year-old woman presents with intense vulvar itching. On exam, the vulvar skin is thin, white, and has a "parchment-like" appearance. There is no evidence of a mass.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lichen Sclerosus", "Lichen Simplex Chronicus", "Vulvar Squamous Cell Carcinoma", "Extramammary Paget Disease"]', 0, 'Lichen sclerosus is characterized by thinning of the epidermis and fibrosis of the dermis, often described as parchment-like or cigarette paper skin.'),
    (v_case_id, 'What is the long-term risk associated with this condition?', '["No increased risk of cancer", "Increased risk of vulvar squamous cell carcinoma", "Increased risk of melanoma", "Increased risk of basal cell carcinoma"]', 1, 'Lichen sclerosus is associated with a slightly increased risk of developing vulvar squamous cell carcinoma later in life.'),
    (v_case_id, 'How would Lichen Simplex Chronicus differ in presentation?', '["It would show thinning of the skin", "It would show thickened, leathery skin (lichenification) due to chronic scratching", "It is always malignant", "It is caused by HPV"]', 1, 'Lichen simplex chronicus results from chronic irritation and scratching, leading to epidermal hyperplasia and thickened, leathery skin.');

    -- CASE 02: Extramammary Paget Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Red, Pruritic Vulvar Patch', 'A 70-year-old woman presents with an erythematous, pruritic, ulcerated patch on her vulva. Biopsy reveals malignant epithelial cells in the epidermis that stain PAS+, Keratin+, and S100-.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Vulvar Melanoma", "Extramammary Paget Disease", "Basal Cell Carcinoma", "Squamous Cell Carcinoma"]', 1, 'Extramammary Paget disease presents as a red, itchy, crusty patch on the vulva.'),
    (v_case_id, 'How can this condition be distinguished from Melanoma?', '["Melanoma is PAS- and Keratin-", "Paget cells are PAS+, Keratin+, and S100-", "Melanoma is S100+", "All of the above"]', 3, 'Paget cells are epithelial (Keratin+) and contain mucin (PAS+), but lack melanocyte markers (S100-). Melanoma is Keratin-, PAS-, but S100+.'),
    (v_case_id, 'Unlike Paget disease of the breast, what is the significance of vulvar Paget disease regarding underlying malignancy?', '["It almost always indicates an underlying adenocarcinoma", "It is usually NOT associated with an underlying malignancy", "It is always associated with lung cancer", "It is a precursor to cervical cancer"]', 1, 'Paget disease of the breast almost always indicates an underlying ductal carcinoma. Vulvar Paget disease is typically limited to the epidermis and usually lacks an underlying cancer.');

    -- CASE 03: Vagina - Clear Cell Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'DES Exposure', 'A 19-year-old woman presents with vaginal bleeding. Her mother took a medication to prevent miscarriage during pregnancy in the 1970s. Exam reveals a mass in the upper third of the anterior vaginal wall.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What was the medication her mother likely took?', '["Thalidomide", "Diethylstilbestrol (DES)", "Warfarin", "Phenytoin"]', 1, 'DES exposure in utero is a major risk factor for clear cell adenocarcinoma of the vagina.'),
    (v_case_id, 'What benign condition is a precursor to this malignancy?', '["Vaginal Adenosis", "Sarcoma Botryoides", "Gartner Duct Cyst", "Bartholin Cyst"]', 0, 'Vaginal adenosis is the persistence of columnar epithelium in the upper vagina (which should normally be squamous), and it is a precursor to clear cell adenocarcinoma.'),
    (v_case_id, 'What type of cells are found in Sarcoma Botryoides (Embryonal Rhabdomyosarcoma), another vaginal tumor seen in children?', '["Malignant skeletal muscle cells (rhabdomyoblasts)", "Clear cells", "Squamous cells", "Glandular cells"]', 0, 'Sarcoma botryoides is a malignant mesenchymal tumor of skeletal muscle origin, seen in girls < 5 years old, presenting as a "grape-like" mass.');

    -- CASE 04: Cervix - CIN and HPV
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Koilocytes on Pap Smear', 'A 28-year-old woman has a routine Pap smear that shows cells with wrinkled, raisin-like nuclei and perinuclear halos (koilocytes).', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of koilocytes?', '["They indicate fungal infection", "They are a pathognomonic sign of HPV infection", "They indicate low estrogen", "They are normal findings"]', 1, 'Koilocytes are the classic histological hallmark of HPV-infected squamous cells.'),
    (v_case_id, 'High-risk HPV types (16, 18) produce E6 and E7 proteins. What do these proteins inhibit?', '["E6 inhibits p53; E7 inhibits Rb", "E6 inhibits Rb; E7 inhibits p53", "Both inhibit BCL2", "Both inhibit Cyclin D"]', 0, 'Inhibition of these tumor suppressor proteins (p53 and Rb) allows for uncontrolled cell cycle progression.'),
    (v_case_id, 'A biopsy shows dysplasia involving the lower two-thirds of the epithelial thickness. What is the grade?', '["CIN I", "CIN II", "CIN III", "Carcinoma in situ"]', 1, 'CIN I involves the lower 1/3, CIN II involves the lower 2/3, and CIN III involves > 2/3 of the epithelium.');

    -- CASE 05: Uterus - Chronic Endometritis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pelvic Pain and Infertility', 'A 32-year-old woman presents with chronic pelvic pain, irregular bleeding, and difficulty conceiving. She had a history of pelvic inflammatory disease (PID) 5 years ago. Biopsy of the endometrium is performed.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What histological finding is REQUIRED to diagnose chronic endometritis?', '["Neutrophils", "Plasma cells", "Lymphocytes only", "Eosinophils"]', 1, 'While lymphocytes are common in the endometrium, the presence of plasma cells is necessary to confirm chronic endometritis.'),
    (v_case_id, 'Which of the following is a common cause of chronic endometritis?', '["Retained products of conception", "IUD", "PID (Chlamydia/Gonorrhea)", "All of the above"]', 3, 'All these factors can lead to chronic inflammation of the endometrium.'),
    (v_case_id, 'How does Acute Endometritis usually present?', '["Fever, pelvic pain, and foul-smelling vaginal discharge after delivery", "Asymptomatic", "Heavy periods only", "Postmenopausal bleeding"]', 0, 'Acute endometritis is usually a bacterial infection (e.g., Group B Strep) occurring after delivery or miscarriage.');

    -- CASE 06: Endometrial Hyperplasia and Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Postmenopausal Bleeding', 'A 62-year-old obese woman presents with vaginal bleeding. She has never been pregnant and has a history of polycystic ovary syndrome (PCOS).', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying mechanism for her bleeding?', '["Estrogen deficiency", "Unopposed estrogen exposure", "Progesterone excess", "Androgen deficiency"]', 1, 'Obesity, nulliparity, and PCOS all lead to high estrogen levels without the protective effect of progesterone, leading to endometrial hyperplasia and cancer.'),
    (v_case_id, 'Which histological feature of endometrial hyperplasia is the STRONGEST predictor of progression to carcinoma?', '["Gland-to-stroma ratio", "Presence of cellular atypia", "Simple vs complex architecture", "Size of the glands"]', 1, 'Atypical hyperplasia has a ~30% risk of progression to cancer, whereas hyperplasia without atypia has < 5% risk.'),
    (v_case_id, 'If this patient is diagnosed with Endometrioid (Type I) Adenocarcinoma, what is the typical precursor?', '["Endometrial Hyperplasia", "Serous Intraepithelial Carcinoma", "Leiomyoma", "Endometriosis"]', 0, 'Type I (Endometrioid) cancer arises from hyperplasia due to estrogen excess. Type II (Serous) cancer arises from atrophic endometrium in older women and is associated with p53 mutations.');

    -- CASE 07: Leiomyoma vs Leiomyosarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Multiple Uterine Masses', 'A 40-year-old woman presents with heavy menses (menorrhagia) and a feeling of pelvic pressure. Physical exam reveals an enlarged, irregular uterus. Ultrasound shows multiple well-circumscribed, firm, white, whorled masses.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Leiomyoma", "Leiomyosarcoma", "Endometrial Polyp", "Adenomyosis"]', 0, 'Leiomyomas (fibroids) are very common, benign smooth muscle tumors that are often multiple and well-circumscribed.'),
    (v_case_id, 'Which of the following is TRUE regarding Leiomyosarcoma?', '["It arises from a pre-existing leiomyoma", "It arises de novo and is typically a single, bulky mass with necrosis and hemorrhage", "It is always multiple", "It is benign"]', 1, 'Leiomyosarcoma is a malignant tumor that does NOT arise from fibroids. It is usually solitary and shows features of malignancy like necrosis and high mitotic rate.'),
    (v_case_id, 'How do leiomyomas respond to pregnancy?', '["They shrink", "They increase in size due to estrogen sensitivity", "They stay the same", "They turn into cancer"]', 1, 'Leiomyomas are estrogen-sensitive; they enlarge during pregnancy and shrink after menopause.');

    -- CASE 08: Endometriosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cyclic Pelvic Pain', 'A 28-year-old woman presents with severe dysmenorrhea (painful periods) and dyspareunia (painful intercourse). Laparoscopy reveals "gunpowder" lesions on the peritoneum and a large cystic mass on the ovary filled with "chocolate-colored" fluid.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Adenomyosis", "Endometriosis", "Ovarian Serous Cystadenoma", "PID"]', 1, 'Endometriosis is the presence of endometrial glands and stroma outside the uterine cavity.'),
    (v_case_id, 'What is the most common site of involvement for this condition?', '["Lung", "Uterine ligaments", "Ovary", "Pouch of Douglas"]', 2, 'The ovary is the most common site, where it forms an "endometrioma" or chocolate cyst.'),
    (v_case_id, 'What is the most widely accepted theory for the cause of this condition?', '["Metaplastic theory", "Retrograde menstruation theory", "Lymphatic spread theory", "Immunological theory"]', 1, 'Retrograde menstruation (Sampson theory) proposes that menstrual tissue flows backward through the fallopian tubes and implants on pelvic structures.');

    -- CASE 09: Adenomyosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Symmetrically Enlarged, Boggy Uterus', 'A 42-year-old woman presents with heavy, painful periods. On exam, her uterus is enlarged and feels "boggy" and soft. There are no discrete masses.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Leiomyoma", "Adenomyosis", "Endometrial Cancer", "Cervical Cancer"]', 1, 'Adenomyosis is the presence of endometrial glands and stroma within the uterine myometrium.'),
    (v_case_id, 'How does the uterine shape in adenomyosis typically differ from leiomyomas?', '["It is irregular", "It is symmetrically enlarged (globular)", "It is shrunken", "It is not enlarged"]', 1, 'Adenomyosis causes diffuse, symmetrical enlargement of the uterus, whereas fibroids cause an irregular, "lumpy" uterus.'),
    (v_case_id, 'What is the treatment for severe symptoms of adenomyosis in a woman who has completed childbearing?', '["Aspirin", "Hysterectomy", "Antibiotics", "OCPs only"]', 1, 'Hysterectomy is the definitive treatment for symptomatic adenomyosis.');

    -- CASE 10: Endometrial Polyps
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Abnormal Bleeding and Tamoxifen', 'A 55-year-old woman with a history of breast cancer being treated with Tamoxifen presents with intermenstrual bleeding. Hysteroscopy reveals a pedunculated mass protruding into the uterine cavity.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Submucosal Leiomyoma", "Endometrial Polyp", "Endometrial Carcinoma", "Cervical Polyp"]', 1, 'Endometrial polyps are benign protrusions of endometrial stroma and glands.'),
    (v_case_id, 'Why does Tamoxifen increase the risk of this condition and endometrial hyperplasia?', '["It is a pure estrogen agonist in all tissues", "It has pro-estrogenic effects on the uterus while being anti-estrogenic in the breast", "It causes weight gain", "It inhibits progesterone"]', 1, 'Tamoxifen is a SERM (Selective Estrogen Receptor Modulator) that acts as an antagonist in the breast but a partial agonist in the endometrium.'),
    (v_case_id, 'What is the primary histological component of a polyp?', '["Malignant cells", "Hyperplastic glands and stroma with thick-walled blood vessels", "Pure smooth muscle", "Fibrin mesh"]', 1, 'Polyps consist of benign glands and stroma, often with prominent, thick-walled vessels.');

    RAISE NOTICE 'SUCCESS: Reproductive Pathology Cases Part 1 (01-10) registered.';
END $$;

COMMIT;
