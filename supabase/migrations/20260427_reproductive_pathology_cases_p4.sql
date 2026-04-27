-- Migration: Reproductive Pathology Cases Part 4 (31-40)
-- Goal: Cover Breast Pathology: Inflammatory, Benign, and Malignant
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'reproductive-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40;

    -- CASE 31: Acute Mastitis vs Inflammatory Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Nursing and Breast Pain', 'A 28-year-old woman who is breastfeeding her 3-week-old infant presents with a warm, red, tender area on her left breast. She has a low-grade fever.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Mastitis", "Fat Necrosis", "Fibroadenoma", "Inflammatory Breast Cancer"]', 0, 'Acute mastitis is a bacterial infection (usually S. aureus) associated with breastfeeding/cracked nipples.'),
    (v_case_id, 'What is the recommended treatment while continuing breastfeeding?', '["Antibiotics and drainage (continue nursing)", "Stop nursing and take aspirin", "Surgery immediately", "Chemotherapy"]', 0, 'Treatment includes dicloxacillin and continued expression of milk (nursing) to prevent abscess formation.'),
    (v_case_id, 'If the breast was red and swollen but NOT painful, and there was no response to antibiotics, what malignancy should be suspected?', '["DCIS", "Inflammatory Breast Cancer", "Phyllodes tumor", "Paget Disease"]', 1, 'Inflammatory breast cancer mimics infection but is caused by tumor cells blocking dermal lymphatics. It features "peau d''orange" (skin of an orange) appearance.');

    -- CASE 32: Fat Necrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Seatbelt Injury', 'A 45-year-old woman presents with a firm, fixed mass in her breast. She remembers hitting her chest against the steering wheel in a car accident 2 months ago. Mammography shows calcifications.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Invasive Ductal Carcinoma", "Fat Necrosis", "Fibrocystic change", "Sclerosing Adenosis"]', 1, 'Fat necrosis often follows trauma and presents as a firm mass that can mimic cancer on exam and mammography.'),
    (v_case_id, 'What would a biopsy of this mass show?', '["Malignant glands", "Necrotic fat, foamy macrophages (foamy histiocytes), and calcifications", "Cystic spaces", "Dense fibrous tissue only"]', 1, 'The hallmark of fat necrosis is the presence of necrotic adipocytes and macrophages clearing the debris.'),
    (v_case_id, 'What process leads to the calcifications seen on mammography in this condition?', '["Metastatic calcification", "Saponification", "Dystrophic calcification", "Both B and C"]', 3, 'Fatty acids released by necrotic cells bind calcium, a process called saponification, which is a form of dystrophic calcification.');

    -- CASE 33: Fibroadenoma vs Phyllodes Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Rubbery, Mobile Mass', 'A 22-year-old woman presents with a 2 cm, firm, rubbery, highly mobile mass in her right breast. It is non-tender.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Phyllodes Tumor", "Fibroadenoma", "Intraductal Papilloma", "DCIS"]', 1, 'Fibroadenoma is the most common benign tumor in young women. It is "rubbery" and "marble-like" in mobility.'),
    (v_case_id, 'How does a Phyllodes Tumor differ from a Fibroadenoma?', '["It is smaller", "It occurs in older women and shows leaf-like projections on histology with high cellularity", "It is always malignant", "It is caused by infection"]', 1, 'Phyllodes tumors are larger, occur in postmenopausal women, and have "leaf-like" (phyllodes) growths of the stroma.'),
    (v_case_id, 'Is a simple fibroadenoma associated with an increased risk of cancer?', '["Yes", "No", "Only if it is > 5 cm", "Only in smokers"]', 1, 'Simple fibroadenomas are benign and do not carry an increased risk for breast cancer.');

    -- CASE 34: Intraductal Papilloma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Bloody Nipple Discharge', 'A 40-year-old woman presents with a bloody discharge from her right nipple. There is no palpable mass or skin changes.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Fibroadenoma", "Intraductal Papilloma", "Invasive Lobular Carcinoma", "Fat Necrosis"]', 1, 'Intraductal papilloma is the most common cause of bloody nipple discharge in premenopausal women.'),
    (v_case_id, 'What histological feature distinguishes a benign papilloma from a malignant papillary carcinoma?', '["Size", "Presence of a myoepithelial cell layer", "Presence of blood", "Location in the breast"]', 1, 'Benign papillomas have two cell layers (luminal and myoepithelial). Malignant papillary tumors lack the myoepithelial layer.'),
    (v_case_id, 'Where in the ductal system do these typically arise?', '["Terminal duct lobular unit (TDLU)", "Large lactiferous ducts near the nipple", "Fatty tissue", "Cooper ligaments"]', 1, 'Papillomas typically arise in the large, subareolar ducts.');

    -- CASE 35: Fibrocystic Changes
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, '"Lumpy" Breasts', 'A 35-year-old woman reports that her breasts feel "lumpy" and tender, especially in the week before her period. The symptoms improve after menstruation.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common "blue dome" cyst finding in this condition?', '["Simple Cyst", "Apocrine Metaplasia", "Fat Necrosis", "Papilloma"]', 1, 'Apocrine metaplasia and cystic change often have a blue-ish hue on gross exam, but they do NOT increase the risk of cancer.'),
    (v_case_id, 'Which of the following fibrocystic changes is associated with a 2x increased risk of cancer?', '["Fibrosis", "Sclerosing Adenosis and Ductal Hyperplasia", "Atypical Hyperplasia", "Apocrine Metaplasia"]', 1, 'Sclerosing adenosis (calcified) and ductal hyperplasia (without atypia) carry a 2x risk. Atypical hyperplasia carries a 5x risk.'),
    (v_case_id, 'Atypical hyperplasia (ductal or lobular) increases the risk for cancer in which breast?', '["Only the affected breast", "Both breasts (increased risk in the contralateral breast as well)", "Only the nipple", "No risk"]', 1, 'Atypical hyperplasia is a marker for increased risk across both breasts.');

    -- CASE 36: Ductal Carcinoma In Situ (DCIS)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Calcifications on Mammography', 'An asymptomatic 50-year-old woman is found to have linear, branching calcifications on her routine mammogram. There is no palpable mass.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Fibroadenoma", "DCIS", "Invasive Lobular Carcinoma", "Acute Mastitis"]', 1, 'DCIS often presents as calcifications without a mass, as the malignant cells are confined to the ducts.'),
    (v_case_id, 'What is the "Comedo" subtype of DCIS characterized by?', '["Bands of fibrosis", "Central necrosis and calcification within the ducts", "Leaf-like structures", "Cerebriform nuclei"]', 1, 'Comedocarcinoma features high-grade cells with central necrosis (which then calcifies).'),
    (v_case_id, 'What is Paget Disease of the Nipple?', '["An infection of the skin", "DCIS that has spread up the lactiferous ducts to involve the skin of the nipple", "A benign rash", "A fungal infection"]', 1, 'Paget disease presents as nipple ulceration/erythema. Unlike Paget of the vulva, it almost always signals an underlying breast carcinoma.');

    -- CASE 37: Invasive Ductal Carcinoma (IDC)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Fixed Mass and Nipple Retraction', 'A 55-year-old woman presents with a hard, irregular mass in the upper outer quadrant of her left breast. On exam, the nipple is retracted and the skin over the mass is dimpled.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of invasive breast cancer?', '["Invasive Lobular Carcinoma", "Invasive Ductal Carcinoma (No Special Type)", "Medullary Carcinoma", "Mucinous Carcinoma"]', 1, 'IDC accounts for ~80% of all invasive breast cancers.'),
    (v_case_id, 'Why does IDC cause skin dimpling or nipple retraction?', '["It releases toxic gas", "The tumor invades and pulls on the Cooper ligaments (suspensory ligaments)", "It causes massive edema", "It is an allergic reaction"]', 1, 'Infiltration of the suspensory Cooper ligaments leads to skin contraction and deformity.'),
    (v_case_id, 'Which IDC subtype is associated with a softer consistency, older women, and a "jelly-like" appearance?', '["Tubular", "Mucinous (Colloid)", "Medullary", "Inflammatory"]', 1, 'Mucinous carcinoma features tumor cells floating in pools of mucus and typically has a better prognosis.');

    -- CASE 38: Invasive Lobular Carcinoma (ILC)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, '"Single File" Cells', 'A 50-year-old woman presents with an area of thickening in her breast, but no discrete mass. Biopsy shows small, uniform cells growing in "single-file" lines.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Invasive Ductal Carcinoma", "Invasive Lobular Carcinoma", "Medullary Carcinoma", "Phyllodes Tumor"]', 1, 'The "single-file" pattern is the classic histological hallmark of invasive lobular carcinoma.'),
    (v_case_id, 'Loss of which adhesion molecule is responsible for the single-file growth pattern and the lack of mass formation?', '["HER2", "E-cadherin", "ER/PR", "p53"]', 1, 'ILC cells lack E-cadherin, so they do not cluster together to form a discrete lump.'),
    (v_case_id, 'What is a common clinical feature of ILC regarding its distribution?', '["It is always solitary", "It is frequently bilateral and multicentric", "It only affects the nipple", "It is only seen in men"]', 1, 'Due to the diffuse growth pattern, ILC is often bilateral and found in multiple locations within the same breast.');

    -- CASE 39: Medullary Carcinoma and Triple Negative
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'High-Grade Cancer with Lymphocytic Infiltrate', 'A 45-year-old woman with a BRCA1 mutation is diagnosed with a high-grade breast cancer. Histology shows large, pleomorphic cells with a prominent lymphocytic background.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What subtype of IDC is this?', '["Tubular", "Medullary Carcinoma", "Mucinous", "Papillary"]', 1, 'Medullary carcinoma is characterized by high-grade cells, lymphocytic infiltrate, and an association with BRCA1.'),
    (v_case_id, 'What does "Triple Negative" breast cancer mean?', '["Negative for ER, PR, and HER2/neu", "Negative for Cancer, Infection, and Trauma", "The patient has 3 tumors", "None of the above"]', 0, 'Triple negative cancers lack estrogen receptor (ER), progesterone receptor (PR), and HER2 amplification, making them more aggressive and harder to treat.'),
    (v_case_id, 'What is the targeted treatment for HER2-positive breast cancers?', '["Tamoxifen", "Trastuzumab (Herceptin)", "Methotrexate", "Aromatase inhibitors"]', 1, 'Trastuzumab is a monoclonal antibody that targets the HER2/neu receptor.');

    -- CASE 40: Male Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Subareolar Mass in a Man', 'A 65-year-old man presents with a hard, subareolar mass and nipple discharge.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of breast cancer in men?', '["Invasive Lobular Carcinoma", "Invasive Ductal Carcinoma", "Medullary", "Phyllodes"]', 1, 'IDC is the most common, as male breasts contain ducts but very few lobules.'),
    (v_case_id, 'Which gene mutation is most strongly associated with male breast cancer?', '["BRCA1", "BRCA2", "p53", "Rb"]', 1, 'While BRCA1 is associated with female breast/ovarian cancer, BRCA2 is the strongest risk factor for male breast cancer.'),
    (v_case_id, 'What is Klinefelter Syndrome (47,XXY) associated with in the context of male breast pathology?', '["Decreased risk", "Increased risk of gynecomastia and breast cancer", "No change", "It is not associated"]', 1, 'Klinefelter syndrome involves higher estrogen levels relative to testosterone, increasing the risk of both gynecomastia and cancer.');

    RAISE NOTICE 'SUCCESS: Reproductive Pathology Cases Part 4 (31-40) registered.';
END $$;

COMMIT;
