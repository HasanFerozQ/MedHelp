BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Breast Surgery
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'breast-surgery' LIMIT 1;

    -- CASE 01: Fibroadenoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rubbery Lump', 'A 22-year-old female presents with a painless, firm, mobile, and "rubbery" 2 cm mass in her left breast. She noticed it 3 months ago and it has not changed with her menstrual cycle.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Breast Cancer", "Fibroadenoma", "Fibrocystic Change", "Fat Necrosis"]', 1, 'Fibroadenoma is the most common benign breast tumor in young women; its "rubbery" and mobile nature is classic.'),
    (v_case_id, 'What is the first-line imaging modality for a breast mass in a woman under 30?', '["Mammography", "Ultrasound", "MRI", "PET Scan"]', 1, 'In younger women with dense breast tissue, ultrasound is preferred over mammography.'),
    (v_case_id, 'What is the management for a biopsy-proven, asymptomatic fibroadenoma?', '["Immediate mastectomy", "Excision or observation", "Radiation", "Chemotherapy"]', 1, 'Small, asymptomatic fibroadenomas can be safely observed.');

    -- CASE 02: Fibrocystic Change
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cyclical Breast Pain', 'A 35-year-old female presents with bilateral breast pain and "lumpiness" that worsens just before her period and improves after menstruation starts.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Inflammatory Breast Cancer", "Fibrocystic Change", "Mastitis", "Phyllodes Tumor"]', 1, 'Fibrocystic changes are common in premenopausal women and are characterized by cyclical pain and fluctuating size.'),
    (v_case_id, 'On ultrasound, what is a characteristic finding of fibrocystic change?', '["Spiculated mass", "Simple or clustered cysts", "Dense calcifications", "High vascularity"]', 1, 'Simple cysts are a hallmark of fibrocystic changes.'),
    (v_case_id, 'Does simple fibrocystic change significantly increase the risk of breast cancer?', '["Yes, 10-fold increase", "No significant increase", "Only if she smokes", "Only in men"]', 1, 'Simple fibrocystic change without atypia does not significantly increase cancer risk.');

    -- CASE 03: Intraductal Papilloma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Nipple Discharge', 'A 45-year-old woman presents with spontaneous, bloody discharge from a single duct in her right nipple. There is no palpable mass.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of spontaneous, bloody nipple discharge?', '["Invasive Ductal Carcinoma", "Intraductal Papilloma", "Mastitis", "Fibroadenoma"]', 1, 'Intraductal papilloma is the #1 cause of bloody discharge, although malignancy must be ruled out.'),
    (v_case_id, 'What is the definitive diagnostic and therapeutic step for this patient?', '["Mammography alone", "Subareolar duct excision (Microdochectomy)", "Antibiotics", "Aspirin"]', 1, 'Excision of the involved duct provides both a diagnosis and resolves the discharge.'),
    (v_case_id, 'If the discharge were bilateral and milky (galactorrhea), what should be investigated?', '["Breast cancer", "Prolactin levels / Pituitary adenoma", "Fibroadenoma", "Mastitis"]', 1, 'Bilateral milky discharge is usually a systemic/hormonal issue, not a primary breast problem.');

    -- CASE 04: Lactational Mastitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Nursing Mother with Fever', 'A 28-year-old female who is 3 weeks postpartum and breastfeeding presents with a red, painful, swollen segment of her right breast and a fever of 102°F.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mastitis", "Breast Abscess", "Inflammatory Cancer", "Fibrocystic change"]', 0, 'Lactational mastitis is common in the first few weeks of breastfeeding.'),
    (v_case_id, 'What is the most common causative organism?', '["E. coli", "Staphylococcus aureus", "Bacteroides", "Streptococcus pyogenes"]', 1, 'Staph aureus (often from the infant''s oropharynx) is the leading cause.'),
    (v_case_id, 'What is the most important advice regarding breastfeeding for this patient?', '["Stop breastfeeding immediately", "Continue breastfeeding or pumping to ensure drainage of the affected segment", "Switch to formula", "Only feed from the unaffected side"]', 1, 'Stopping breastfeeding increases the risk of progression to an abscess due to milk stasis.');

    -- CASE 05: Breast Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fluctuant Mass', 'A patient with mastitis has been on antibiotics for 48 hours but her symptoms are worsening. She now has a 3 cm area of fluctuance and skin thinning.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What has the mastitis likely progressed to?', '["Inflammatory cancer", "Breast Abscess", "Phyllodes tumor", "Fat necrosis"]', 1, 'Failure to improve on antibiotics and the presence of fluctuance indicate an abscess.'),
    (v_case_id, 'What is the preferred management for a breast abscess?', '["Stronger antibiotics only", "Ultrasound-guided needle aspiration or I&D", "Mastectomy", "Mammography"]', 1, 'Drainage (by needle or incision) is necessary for resolution.'),
    (v_case_id, 'In a NON-lactating woman with a recurring periareolar abscess, what habit is strongly associated?', '["High sugar diet", "Smoking", "Alcohol", "Lack of exercise"]', 1, 'Smoking is a major risk factor for periductal mastitis and recurrent subareolar abscesses.');

    -- CASE 06: Fat Necrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hard Lump After a Seatbelt Injury', 'A 50-year-old woman presents with a firm, irregular mass in her breast. She remembers a significant bruise in that area after a car accident 2 months ago.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Invasive carcinoma", "Fat Necrosis", "Fibroadenoma", "Lipoma"]', 1, 'Fat necrosis often follows trauma or surgery and can mimic cancer clinically (hard/irregular).'),
    (v_case_id, 'What is the classic radiographic finding of fat necrosis on mammography?', '["Spiculated mass", "Oil cyst or eggshell calcifications", "Microcalcifications", "Skin thickening"]', 1, 'Oil cysts are pathognomonic for fat necrosis.'),
    (v_case_id, 'What is seen on histology in fat necrosis?', '["Malignant cells", "Necrotic fat cells, lipid-laden macrophages (foam cells), and multinucleated giant cells", "Leaf-like stroma", "Cysts"]', 1, 'The histologic appearance reflects the inflammatory response to the released lipids.');

    -- CASE 07: Phyllodes Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Growing Large Mass', 'A 45-year-old woman presents with a very large (8 cm), painless mass that has grown rapidly over the last 6 months. On exam, the skin is stretched and shiny but not red.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Fibroadenoma", "Phyllodes Tumor", "Mastitis", "Lipoma"]', 1, 'Phyllodes tumors are fibroepithelial lesions that can grow very large and rapidly.'),
    (v_case_id, 'What is the characteristic histologic feature of a phyllodes tumor?', '["Bird''s eye view", "Leaf-like (phyllodes) stromal architecture", "Small blue cells", "Glandular structures"]', 1, '"Phyllodes" is Greek for "leaf-like."'),
    (v_case_id, 'How are phyllodes tumors treated?', '["Mastectomy always", "Wide local excision with a 1 cm margin (due to high risk of local recurrence)", "Chemotherapy only", "Observation"]', 1, 'Even "benign" phyllodes tumors can recur locally if not removed with adequate margins.');

    -- CASE 08: Gynecomastia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Male Breast Enlargement', 'A 15-year-old boy presents with bilateral, tender breast enlargement. He has no other medical problems.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause in this patient?', '["Male breast cancer", "Pubertal physiologic gynecomastia", "Liver failure", "Drug use"]', 1, 'Pubertal gynecomastia is common and usually resolves spontaneously within 1-2 years.'),
    (v_case_id, 'Which of the following medications is a common cause of drug-induced gynecomastia?', '["Aspirin", "Spironolactone", "Metformin", "Lisinopril"]', 1, 'Spironolactone has anti-androgenic effects and frequently causes gynecomastia.'),
    (v_case_id, 'What is the primary hormonal imbalance in gynecomastia?', '["Too much testosterone", "Increased estrogen-to-androgen ratio", "Low prolactin", "High cortisol"]', 1, 'Relative or absolute excess of estrogen (or deficiency of androgens) leads to glandular proliferation.');

    -- CASE 09: Breast Cancer Risk Factors
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Family History and BRCA', 'A 30-year-old woman is concerned about her breast cancer risk. Her mother was diagnosed at age 40 and her maternal aunt at age 35.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which mutation is most likely given the strong family history of early-onset breast cancer?', '["APC", "BRCA1 or BRCA2", "p53", "KRAS"]', 1, 'BRCA mutations significantly increase the lifetime risk of breast and ovarian cancer.'),
    (v_case_id, 'Besides female sex and age, what is the single most important risk factor for breast cancer?', '["Diet", "Family history (first-degree relatives)", "Smoking", "Caffeine"]', 1, 'First-degree family history is a major risk factor.'),
    (v_case_id, 'Which of the following decreases the lifetime risk of breast cancer?', '["Nulliparity", "Early menarche", "Early first pregnancy (< 20 years old)", "Late menopause"]', 2, 'Increased lifetime exposure to estrogen (late first pregnancy, nulliparity, early menarche) increases risk.');

    -- CASE 10: Screening Mammography - BI-RADS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Understanding the Report', 'A 50-year-old woman receives her screening mammogram report. It is classified as BI-RADS 4.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a BI-RADS 4 classification mean?', '["Normal", "Benign", "Suspicious abnormality; biopsy should be considered", "Highly suggestive of malignancy"]', 2, 'BI-RADS 4 indicates a suspicious finding requiring tissue diagnosis.'),
    (v_case_id, 'What is the meaning of BI-RADS 0?', '["No cancer", "Incomplete; further imaging (ultrasound/spot views) is needed", "Malignant", "Follow-up in 6 months"]', 1, 'BI-RADS 0 is an incomplete assessment.'),
    (v_case_id, 'At what age does the ACS generally recommend starting annual screening mammograms for average-risk women?', '["30", "40-45", "55", "65"]', 1, 'Guidelines vary, but age 40-45 is the standard starting point for most.');

    -- CASE 11: Ductual Carcinoma In Situ (DCIS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Non-Palpable Cancer', 'A mammogram shows a 1 cm cluster of pleomorphic microcalcifications. A core needle biopsy reveals malignant cells that are confined within the basement membrane of the ducts.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Invasive Ductal Carcinoma", "Ductual Carcinoma In Situ (DCIS)", "Atypical Ductal Hyperplasia", "Fibroadenoma"]', 1, 'DCIS is "Stage 0" cancer, where the cells have not yet invaded the stroma.'),
    (v_case_id, 'What is the primary goal of treating DCIS?', '["To prevent systemic spread (metastasis)", "To prevent progression to invasive ductal carcinoma", "To reduce breast pain", "To improve cosmetic appearance"]', 1, 'DCIS itself cannot metastasize, but it is a precursor to invasive cancer.'),
    (v_case_id, 'Which histologic subtype of DCIS is the most aggressive and characterized by central necrosis?', '["Cribriform", "Comedo", "Papillary", "Micropapillary"]', 1, 'Comedocarcinoma is a high-grade DCIS subtype.');

    -- CASE 12: Invasive Ductal Carcinoma (IDC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Spiculated Mass', 'A 60-year-old woman has a hard, fixed mass in the upper outer quadrant of her breast. Mammogram shows a spiculated mass with architectural distortion.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common histological type of invasive breast cancer?', '["Invasive Lobular Carcinoma", "Invasive Ductal Carcinoma (IDC)", "Medullary Carcinoma", "Mucinous Carcinoma"]', 1, 'IDC accounts for ~80% of all invasive breast cancers.'),
    (v_case_id, 'Where is the most common location for a breast cancer to be found?', '["Upper Inner Quadrant", "Upper Outer Quadrant", "Lower Inner Quadrant", "Nipple"]', 1, 'The upper outer quadrant contains the most breast tissue (axillary tail of Spence).'),
    (v_case_id, 'What is "dimpling" of the skin over a breast mass a sign of?', '["Infection", "Invasion and shortening of Cooper''s ligaments", "Fluid accumulation", "Muscle pull"]', 1, 'Suspensory ligaments of the breast (Cooper''s) are pulled by the tumor, causing skin retraction.');

    -- CASE 13: Invasive Lobular Carcinoma (ILC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Single File" Cancer', 'A biopsy of a vague thickening in the breast reveals small, uniform malignant cells that are growing in a "single file" pattern and lack E-cadherin.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["IDC", "Invasive Lobular Carcinoma (ILC)", "Medullary", "DCIS"]', 1, 'The single-file (Indian file) pattern and loss of E-cadherin are diagnostic for ILC.'),
    (v_case_id, 'ILC is more likely than IDC to be:', '["Easily seen on mammogram", "Bilateral and multifocal", "Associated with fever", "Infected"]', 1, 'Lobular carcinoma is notoriously difficult to see on imaging and is often bilateral.'),
    (v_case_id, 'What is the clinical hallmark of ILC?', '["A stony hard lump", "A vague thickening or \"fullness\" rather than a discrete mass", "Bloody discharge", "Skin redness"]', 1, 'Its diffuse growth pattern often results in subtle physical findings.');

    -- CASE 14: Inflammatory Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red, Heavy Breast', 'A 50-year-old woman presents with rapid-onset redness, warmth, and edema of the skin over her entire left breast. The skin looks like an orange peel (peau d''orange).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mastitis", "Inflammatory Breast Cancer", "Breast Abscess", "Lymphoma"]', 1, 'Inflammatory cancer mimics mastitis but does not respond to antibiotics.'),
    (v_case_id, 'What causes the "peau d''orange" appearance?', '["Infection of the skin", "Lymphatic obstruction by tumor emboli in the dermal lymphatics", "Allergy", "Dehydration"]', 1, 'Blocked lymphatics cause the skin to swell around the tethered hair follicles.'),
    (v_case_id, 'What is the T stage of inflammatory breast cancer regardless of tumor size?', '["T1", "T2", "T3", "T4d"]', 3, 'Inflammatory cancer is automatically Stage III/IV disease (T4d).');

    -- CASE 15: Paget Disease of the Nipple
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crusty Nipple', 'A 65-year-old woman has a persistent, eczematous, scaly rash on her right nipple that has failed to respond to topical steroids for 3 months.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Eczema", "Paget Disease of the Nipple", "Psoriasis", "Nipple thrush"]', 1, 'Paget''s of the nipple is almost always associated with an underlying DCIS or invasive cancer.'),
    (v_case_id, 'What are "Paget cells"?', '["Bacteria", "Large, pale, malignant cells within the epidermis", "White blood cells", "Normal skin cells"]', 1, 'The presence of these cells is diagnostic.'),
    (v_case_id, 'How do you distinguish Paget''s from simple eczema of the nipple?', '["Paget''s involves the nipple and the areola", "Paget''s usually starts on the nipple and spreads to the areola; eczema often spares the nipple", "Eczema is only in children", "There is no way to tell"]', 1, 'The clinical progression helps differentiate the two.');

    -- CASE 16: Breast Cancer - Biomarkers
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Receptors and Treatment', 'A patient''s breast cancer biopsy is reported as ER (+), PR (+), and HER2/neu (-).', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medication would be an appropriate targeted therapy for this patient?', '["Trastuzumab", "Tamoxifen", "Vincristine", "Imatinib"]', 1, 'Tamoxifen blocks the Estrogen Receptor (ER) and is used in ER-positive cancers.'),
    (v_case_id, 'What does "Triple Negative" breast cancer mean?', '["It has 3 tumors", "It lacks ER, PR, and HER2 receptors", "It is stage 3", "It is 3 times as fast"]', 1, 'Triple negative cancers are often more aggressive and lack specific targeted therapies.'),
    (v_case_id, 'Overexpression of which receptor allows for treatment with Trastuzumab (Herceptin)?', '["ER", "PR", "HER2/neu", "Androgen Receptor"]', 2, 'HER2 is a growth factor receptor that can be targeted by specific monoclonal antibodies.');

    -- CASE 17: Sentinel Lymph Node Biopsy (SLNB)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Checking the Nodes', 'During a lumpectomy, the surgeon injects a blue dye and a radioactive tracer into the breast to identify the first lymph node that drains the tumor site.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this node called?', '["The main node", "The Sentinel Lymph Node", "Virchow node", "Sister Mary Joseph node"]', 1, 'The sentinel node is the first node "downstream" from the tumor.'),
    (v_case_id, 'If the sentinel node is NEGATIVE for cancer, what is the next step?', '["Remove all axillary nodes", "No further axillary surgery is required", "Perform a mastectomy", "Give radiation to the armpit"]', 1, 'A negative SLNB accurately predicts that the rest of the nodes are also negative, avoiding a full dissection.'),
    (v_case_id, 'What is the major long-term complication avoided by performing SLNB instead of full axillary dissection?', '["Bleeding", "Lymphedema (arm swelling)", "Infection", "Pain"]', 1, 'Removing all the nodes and lymphatics from the axilla can lead to chronic arm swelling.');

    -- CASE 18: Breast Conserving Surgery (BCS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lumpectomy vs. Mastectomy', 'A 55-year-old woman has a 1.5 cm tumor. She is choosing between a lumpectomy (BCS) and a total mastectomy.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'For early-stage cancer, how does the survival of BCS compare to mastectomy?', '["Mastectomy is much better", "Survival is equivalent when BCS is followed by radiation", "BCS is better", "Only mastectomy is curative"]', 1, 'Large trials have shown no difference in overall survival between the two approaches for appropriate candidates.'),
    (v_case_id, 'Which of the following is an absolute contraindication to BCS?', '["Large tumor size", "Pregnancy (if radiation would be needed during pregnancy)", "Small breasts", "Age > 70"]', 1, 'Since BCS *requires* post-op radiation, any contraindication to radiation (like pregnancy or prior radiation) makes mastectomy the only option.'),
    (v_case_id, 'What is a "Simple (Total) Mastectomy"?', '["Removing the tumor only", "Removing the entire breast including the fascia of the pectoralis, but NOT the axillary nodes", "Removing the breast and the pectoral muscles", "Removing only the skin"]', 1, 'It differs from a "Modified Radical Mastectomy," which includes axillary node dissection.');

    -- CASE 19: Hormone Therapy Side Effects
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Risks of Tamoxifen', 'A postmenopausal woman on Tamoxifen for 2 years develops abnormal vaginal bleeding.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Tamoxifen is a SERM. What does this mean?', '["Systemic Estrogen Replacement Marker", "Selective Estrogen Receptor Modulator", "Small Estrogen Receptor Molecule", "Selective Enzyme Replacement Marker"]', 1, 'It acts as an antagonist in the breast but an agonist in the uterus and bone.'),
    (v_case_id, 'Which serious condition is associated with Tamoxifen use in postmenopausal women?', '["Endometrial (Uterine) Cancer", "Osteoporosis", "Liver failure", "Kidney stones"]', 0, 'Tamoxifen''s estrogenic effect on the uterus increases the risk of endometrial cancer.'),
    (v_case_id, 'What is another major risk associated with Tamoxifen?', '["Bleeding", "Thromboembolism (DVT/PE)", "Hypotension", "Weight loss"]', 1, 'Tamoxifen increases the risk of blood clots.');

    -- CASE 20: Aromatase Inhibitors (AIs)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Switching from Tamoxifen', 'A postmenopausal woman is prescribed Anastrozole instead of Tamoxifen.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do AIs like Anastrozole work?', '["Block estrogen receptors", "Inhibit the conversion of androgens to estrogen in peripheral tissues", "Lower testosterone", "Increase progesterone"]', 1, 'AIs stop the production of estrogen rather than just blocking its receptor.'),
    (v_case_id, 'Why are AIs ONLY effective in postmenopausal women?', '["Premenopausal women have too many receptors", "They cannot overcome the high levels of estrogen produced by the ovaries in premenopausal women", "They are too toxic", "They cause weight gain"]', 1, 'In premenopausal women, the ovaries are the main source of estrogen, which AIs do not block effectively.'),
    (v_case_id, 'What is a common side effect of AIs?', '["Uterine cancer", "Bone loss (Osteoporosis) and joint pain (arthralgias)", "Blood clots", "Thick hair"]', 1, 'Lack of estrogen leads to accelerated bone loss.');

    -- CASE 21: Nipple Discharge Workup
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pathologic vs. Physiologic', 'Compare Patient A (Green, bilateral discharge from multiple ducts when squeezed) and Patient B (Bloody, spontaneous, unilateral discharge from a single duct).', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which patient has "pathologic" nipple discharge?', '["Patient A", "Patient B"]', 1, 'Spontaneous, unilateral, and bloody discharge from a single duct is highly suspicious.'),
    (v_case_id, 'What is the term for the discharge in Patient A (common in duct ectasia)?', '["Galactorrhea", "Physiologic or benign discharge", "Pus", "Malignant"]', 1, 'Multi-duct, multi-color (green/brown) discharge elicited only by expression is usually benign.'),
    (v_case_id, 'What is "Duct Ectasia"?', '["A tumor", "Inflammation and dilation of the subareolar ducts", "A skin rash", "A type of cancer"]', 1, 'Duct ectasia is a common cause of nipple discharge in perimenopausal women.');

    -- CASE 22: Male Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cancer in a Man', 'A 70-year-old male presents with a hard mass under his left nipple. He has a family history of breast cancer in his sister.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which genetic mutation is most strongly associated with MALE breast cancer?', '["BRCA1", "BRCA2", "TP53", "APC"]', 1, 'While both increase risk, BRCA2 is more frequently linked to male breast cancer.'),
    (v_case_id, 'What is the most common histological type of male breast cancer?', '["Invasive Lobular", "Invasive Ductal", "Medullary", "Mucinous"]', 1, 'IDC is the most common because males lack lobules.'),
    (v_case_id, 'How is the prognosis for male breast cancer compared to female breast cancer?', '["It is better", "It is often worse, largely due to late presentation and early invasion of the chest wall", "It is the same", "It isn''t cancer"]', 1, 'Lack of breast tissue allows the tumor to reach the skin and fascia more quickly.');

    -- CASE 23: Mastitis - Non-Lactational
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Smoker''s Breast Problem', 'A 40-year-old heavy smoker presents with recurrent redness and pain around her nipple. She has had three abscesses drained in the last year.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying condition?', '["Ductal cancer", "Periductal Mastitis (Zuska''s disease)", "Fibroadenoma", "Mastodynia"]', 1, 'Smoking causes squamous metaplasia of the lactiferous ducts, leading to obstruction and recurrent infection.'),
    (v_case_id, 'What is the definitive treatment for recurrent subareolar abscesses?', '["Infinite antibiotics", "Excision of the involved ductal system and abscess cavity", "Mastectomy", "Quitting smoking only"]', 1, 'While quitting smoking helps, surgical excision of the diseased ducts is usually necessary.'),
    (v_case_id, 'True or False: Periductal mastitis is usually caused by breastfeeding.', '["True", "False"]', 1, 'False. This is a non-lactational inflammatory condition.');

    -- CASE 24: Mammography - Spiculated Mass
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Star-Shaped Finding', 'A screening mammogram shows a 1.2 cm mass with "spiculated" (star-like) margins.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a spiculated margin on mammography typically indicate?', '["A benign cyst", "Invasive malignancy (cancer cells infiltrating the stroma)", "A fibroadenoma", "A normal lymph node"]', 1, 'Spiculation is a highly suspicious finding for invasive cancer.'),
    (v_case_id, 'What benign condition can occasionally mimic a spiculated mass?', '["Fat necrosis or a Radial Scar", "Simple cyst", "Galactocele", "Mastitis"]', 0, 'Radial scars and fat necrosis are the classic "mimics."'),
    (v_case_id, 'If a mass is wider than it is tall on ultrasound, it is more likely to be:', '["Malignant", "Benign", "A cyst", "An abscess"]', 1, 'Benign lesions like fibroadenomas tend to be "wider than tall" (parallel to the skin), while cancers are often "taller than wide" (crossing tissue planes).');

    -- CASE 25: Breast Cancer Staging - TNM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Staging the Tumor', 'A patient has a 2.5 cm tumor, two positive axillary nodes, and no evidence of distant metastasis.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is her T stage?', '["T1 (< 2 cm)", "T2 (2 - 5 cm)", "T3 (> 5 cm)", "T4 (skin/wall invasion)"]', 1, '2.5 cm falls into the T2 category.'),
    (v_case_id, 'Positive axillary nodes indicate which N stage?', '["N0", "N1", "N2", "N3"]', 1, 'N1 generally indicates mobile ipsilateral axillary node involvement.'),
    (v_case_id, 'Which component of the TNM system is the most important predictor of survival?', '["Tumor size (T)", "Nodal status (N)", "Grade", "Patient age"]', 1, 'The number of positive nodes is a very strong prognostic factor.');

    -- CASE 26: Medullary Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Soft Cancer', 'A 45-year-old woman with a BRCA1 mutation has a soft, well-circumscribed breast mass. Biopsy shows high-grade cells with a prominent lymphocytic infiltrate.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely histologic subtype?', '["Mucinous", "Medullary Carcinoma", "Lobular", "Papillary"]', 1, 'Medullary carcinoma is soft, associated with BRCA1, and has a dense lymphocytic infiltrate.'),
    (v_case_id, 'Despite being high-grade, how is the prognosis of medullary carcinoma?', '["Very poor", "Generally better than IDC", "The same as IDC", "Always fatal"]', 1, 'It has a surprisingly favorable prognosis compared to standard IDC.'),
    (v_case_id, 'What does the term "triple negative" often mean for these specific tumors?', '["They are ER-, PR-, and HER2-", "They are ER+, PR+, and HER2+", "They have 3 layers", "They don''t respond to anything"]', 0, 'Medullary cancers are often triple negative.');

    -- CASE 27: Triple Negative Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lack of Targets', 'A 40-year-old woman is diagnosed with an invasive ductal carcinoma that is ER negative, PR negative, and HER2 negative.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary systemic treatment for triple-negative breast cancer?', '["Tamoxifen", "Trastuzumab", "Chemotherapy", "Anastrozole"]', 2, 'Because there are no hormonal or HER2 targets, chemotherapy is the mainstay of systemic treatment.'),
    (v_case_id, 'In which demographic group is triple-negative breast cancer more common?', '["Elderly white women", "Younger African American women and BRCA1 carriers", "Men", "Postmenopausal women"]', 1, 'It is known to be more prevalent in these groups.'),
    (v_case_id, 'What is the general prognosis for triple-negative disease?', '["Excellent", "More aggressive with a higher risk of early recurrence", "Indolent", "Same as ER-positive"]', 1, 'It tends to have a more aggressive clinical course.');

    -- CASE 28: Breast Cancer - Bone Metastasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Back Pain in a Cancer Patient', 'A woman who was treated for breast cancer 3 years ago presents with worsening mid-back pain.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning diagnosis?', '["Muscle strain", "Bone metastasis", "Osteoporosis", "Disc herniation"]', 1, 'Breast cancer frequently metastasizes to the bone (spine, pelvis, ribs).'),
    (v_case_id, 'What type of bone lesions does breast cancer typically cause?', '["Purely blastic (bone building)", "Purely lytic (bone destroying)", "Mixed lytic and blastic", "No bone changes"]', 2, 'Unlike prostate cancer (blastic) or myeloma (lytic), breast cancer is usually mixed.'),
    (v_case_id, 'Which medication can be used to reduce the risk of skeletal-related events (fractures) in bone mets?', '["Bisphosphonates (e.g., Zoledronic acid)", "Aspirin", "Antibiotics", "Tamoxifen"]', 0, 'Bisphosphonates and Denosumab help stabilize the bone.');

    -- CASE 29: Breast Reconstruction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Restoring the Form', 'A woman undergoing mastectomy for cancer discusses reconstruction options.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "TRAM flap"?', '["A type of implant", "Transverse Rectus Abdominis Myocutaneous flap (using tummy tissue)", "A muscle from the back", "A silicone bag"]', 1, 'TRAM is a common autologous reconstruction technique.'),
    (v_case_id, 'What is an "expander"?', '["A permanent implant", "A temporary balloon-like device used to stretch the skin before a permanent implant is placed", "A surgical tool", "A type of medication"]', 1, 'Expanders are used in "two-stage" reconstruction.'),
    (v_case_id, 'What is the primary benefit of autologous (own tissue) reconstruction over implants?', '["It is a shorter surgery", "It looks and feels more natural and is more durable over time", "It is cheaper", "It has no risks"]', 1, 'Using the patient''s own tissue generally yields a better long-term cosmetic result.');

    -- CASE 30: Pregnancy-Associated Breast Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cancer During Pregnancy', 'A 32-year-old woman who is 20 weeks pregnant finds a 2 cm hard mass in her breast.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can a biopsy be safely performed during pregnancy?', '["No", "Yes, core needle biopsy is the gold standard and is safe"]', 1, 'Diagnosis should not be delayed; biopsy is safe.'),
    (v_case_id, 'Which treatment is generally CONTRAINDICATED during pregnancy?', '["Surgery (Mastectomy)", "Radiation therapy", "Chemotherapy (in the 2nd/3rd trimester)", "Ultrasound"]', 1, 'Radiation is avoided due to the high risk of fetal malformation/death.'),
    (v_case_id, 'Is abortion typically recommended to improve breast cancer survival?', '["Yes", "No, termination of pregnancy does not improve breast cancer prognosis"]', 1, 'Studies have not shown a survival benefit from therapeutic abortion.');

    RAISE NOTICE 'SUCCESS: Breast Surgery Case Blocks (1-30) registered.';
END $$;

COMMIT;
