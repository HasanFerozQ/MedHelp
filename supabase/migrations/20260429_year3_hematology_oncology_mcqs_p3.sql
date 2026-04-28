-- Migration: Year 3 - Hematology/Oncology MCQ Bank (PART 3: 177-263)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-oncology' LIMIT 1;

    -- SECTION 17: HODGKIN LYMPHOMA (HL)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '177: Hodgkin Lymphoma is characterized by the presence of which pathognomonic cell?', '["Blast cells", "Reed-Sternberg cells (Owl''s eye nuclei)", "Smudge cells", "Auer rods"]', 1, 'Large, multi-nucleated B-cells. (Harrison''s Ch. 110)'),
    (v_topic_id, '178: Which markers are typically positive on Reed-Sternberg cells in classic HL?', '["CD19 and CD20", "CD15 and CD30", "CD3 and CD4", "CD10"]', 1, 'Helps distinguish it from Non-Hodgkin Lymphoma. (Step-Up)'),
    (v_topic_id, '179: "Pel-Ebstein fever" in HL refers to fever that:', '["Never goes away", "Cycles (high for days, low for days)", "Occurs only at night", "None"]', 1, 'A rare but classic board association. (Pocket Medicine)'),
    (v_topic_id, '180: What is the most common subtype of Hodgkin Lymphoma?', '["Lymphocyte-rich", "Nodular Sclerosis", "Mixed cellularity", "Lymphocyte-depleted"]', 1, 'Common in young women; presents with a mediastinal mass. (Harrison''s Ch. 110)'),
    (v_topic_id, '181: HL typically spreads in a/an ____ fashion, while NHL is more ____.', '["Random; Linear", "Contiguous (node-to-node); Non-contiguous/disseminated", "Slow; Fast", "None"]', 1, 'HL is usually localized to a single group of nodes initially. (Step-Up)'),
    (v_topic_id, '182: "B symptoms" in lymphoma include weight loss, drenching night sweats, and:', '["Fever > 38C", "Rash", "Cough", "Diarrhea"]', 0, 'Indicate a worse prognosis and higher tumor burden. (Pocket Medicine)'),
    (v_topic_id, '183: Hodgkin Lymphoma has a strong association with which virus in some subtypes?', '["HIV", "Epstein-Barr Virus (EBV)", "HPV", "Hepatitis B"]', 1, 'Especially in the mixed cellularity and lymphocyte-depleted types. (Harrison''s Ch. 110)'),
    (v_topic_id, '184: A patient with HL who experiences "pain in lymph nodes after drinking alcohol" likely has:', '["Allergy", "Classic (though rare) sign of Hodgkin Lymphoma", "Liver failure", "None"]', 1, 'High-yield clinical pearl. (Step-Up)'),
    (v_topic_id, '185: What is the standard chemotherapy regimen for Hodgkin Lymphoma?', '["CHOP", "ABVD (Adriamycin, Bleomycin, Vinblastine, Dacarbazine)", "R-CHOP", "7+3"]', 1, 'Cure rates are high even in advanced stages. (Pocket Medicine)'),
    (v_topic_id, '186: Which HL subtype has the BEST prognosis?', '["Lymphocyte-depleted", "Lymphocyte-rich", "Mixed cellularity", "Nodular sclerosis"]', 1, 'Characterized by many mature lymphocytes and rare RS cells. (Harrison''s Ch. 110)');

    -- SECTION 18: NON-HODGKIN LYMPHOMA (NHL)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '187: What is the most common subtype of Non-Hodgkin Lymphoma?', '["Follicular", "Diffuse Large B-Cell Lymphoma (DLBCL)", "Burkitt", "Mantle Cell"]', 1, 'Aggressive but potentially curable. (Step-Up)'),
    (v_topic_id, '188: "Follicular Lymphoma" is characterized by the t(14;18) translocation involving which gene?', '["c-MYC", "BCL-2", "BCR-ABL", "Cyclin D1"]', 1, 'BCL-2 overexpression inhibits apoptosis. (Pocket Medicine)'),
    (v_topic_id, '189: "Burkitt Lymphoma" is characterized by the t(8;14) translocation involving which gene?', '["BCL-2", "c-MYC", "BCL-6", "RAR-alpha"]', 1, 'Promotes rapid cell growth. (Harrison''s Ch. 110)'),
    (v_topic_id, '190: The endemic (African) form of Burkitt Lymphoma usually presents as a mass in the:', '["Abdomen", "Jaw/Face", "Neck", "Groin"]', 1, 'Strongly associated with EBV. (Step-Up)'),
    (v_topic_id, '191: "Mantle Cell Lymphoma" is characterized by the t(11;14) translocation involving:', '["c-MYC", "Cyclin D1", "BCL-2", "None"]', 1, 'Usually has a poor prognosis. (Pocket Medicine)'),
    (v_topic_id, '192: "Marginal Zone Lymphoma" (MALToma) of the stomach is strongly associated with:', '["H. pylori infection", "Smoking", "Alcohol", "NSAIDs"]', 0, 'Can often be treated with H. pylori eradication alone. (Harrison''s Ch. 110)'),
    (v_topic_id, '193: "Mycosis Fungoides" is a T-cell lymphoma that primarily affects the:', '["Liver", "Skin", "Bones", "Lungs"]', 1, 'Presents with patches, plaques, and "Sezary cells" in the blood. (Step-Up)'),
    (v_topic_id, '194: What is the standard chemotherapy regimen for most B-cell Non-Hodgkin Lymphomas?', '["ABVD", "R-CHOP (Rituximab, Cyclophosphamide, Doxorubicin, Vincristine, Prednisone)", "BEACOPP", "None"]', 1, 'Rituximab is a CD20 antibody. (Pocket Medicine)'),
    (v_topic_id, '195: "Indolent" lymphomas (like Follicular) are generally:', '["Curable with chemo", "Not curable but have long survival (years/decades)", "Fast growing", "Painful"]', 1, 'Often managed with "watchful waiting" until symptoms develop. (Harrison''s Ch. 110)'),
    (v_topic_id, '196: Which lymphoma presents with "painless lymphadenopathy" that waxes and wanes?', '["Burkitt", "Follicular Lymphoma", "DLBCL", "Anaplastic Large Cell"]', 1, 'Classic description of an indolent B-cell lymphoma. (Step-Up)');

    -- SECTION 19: LUNG CANCER
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '197: What is the single most important risk factor for lung cancer?', '["Asbestos", "Cigarette Smoking", "Radon", "Air pollution"]', 1, 'Responsible for ~80-90% of cases. (Harrison''s Ch. 110)'),
    (v_topic_id, '198: Which type of lung cancer is the most common in BOTH smokers and non-smokers?', '["Squamous cell", "Adenocarcinoma", "Small cell", "Large cell"]', 1, 'Usually peripheral in location. (Pocket Medicine)'),
    (v_topic_id, '199: "Squamous Cell Carcinoma" of the lung is classically associated with:', '["Peripheral location", "Central location and Hypercalcemia (PTHrP)", "Non-smokers", "None"]', 1, '"S"quamous, "S"moking, "S"entally located, "S"ecretes PTHrP. (Step-Up)'),
    (v_topic_id, '200: "Small Cell Lung Cancer" (SCLC) is highly aggressive and often presents with:', '["Paraneoplastic syndromes (SIADH, ACTH, Lambert-Eaton)", "Surgery as first-line", "Peripheral nodules", "None"]', 0, 'Rarely treatable by surgery; usually managed with chemo/rad. (Harrison''s Ch. 110)'),
    (v_topic_id, '201: "Pancoast Tumor" (Superior Sulcus Tumor) can cause Horner Syndrome by compressing which structure?', '["Vagus nerve", "Sympathetic Chain/Ganglion", "Phrenic nerve", "Trachea"]', 1, 'Presents with ptosis, miosis, and anhidrosis. (Pocket Medicine)'),
    (v_topic_id, '202: "Superior Vena Cava (SVC) Syndrome" (facial swelling, distended neck veins) is a medical emergency often caused by:', '["Pneumonia", "Lung Cancer (especially Small Cell)", "Asthma", "Heart failure"]', 1, 'Requires urgent diagnosis and treatment (often radiation). (Step-Up)'),
    (v_topic_id, '203: "Lambert-Eaton Myasthenic Syndrome" presents with proximal muscle weakness that ____ with repetitive use.', '["Worsens", "Improves", "Stays the same", "None"]', 1, 'Autoantibodies against presynaptic calcium channels. (Harrison''s Ch. 110)'),
    (v_topic_id, '204: Lung cancer screening with annual Low-Dose CT (LDCT) is recommended for high-risk smokers starting at age:', '["40", "50", "60", "65"]', 1, 'Includes adults aged 50-80 with a 20 pack-year history. (Pocket Medicine)'),
    (v_topic_id, '205: "Mesothelioma" is a rare cancer of the pleura strongly associated with exposure to:', '["Silica", "Asbestos", "Coal dust", "Smoking alone"]', 1, 'Smoking does NOT increase the risk of mesothelioma (unlike lung CA). (Step-Up)'),
    (v_topic_id, '206: "Bronchioloalveolar carcinoma" (now Adenocarcinoma in situ) classically presents on X-ray as a/an:', '["Solid mass", "Hazy infiltrate resembling pneumonia", "Cavity", "Nodule"]', 1, 'Presents with copious watery sputum (bronchorrhea). (Harrison''s Ch. 110)');

    -- SECTION 20: BREAST CANCER
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '207: What is the most common type of invasive breast cancer?', '["Lobular", "Infiltrating Ductal Carcinoma (IDC)", "Medullary", "Mucinous"]', 1, 'Presents as a hard, painless, non-mobile lump. (Step-Up)'),
    (v_topic_id, '208: BRCA1 and BRCA2 mutations increase the risk of breast cancer and which other cancer?', '["Colon", "Ovarian", "Lung", "Skin"]', 1, 'Also increases risk of male breast cancer (especially BRCA2). (Pocket Medicine)'),
    (v_topic_id, '209: "Paget Disease of the Breast" presents with nipple eczematous changes and suggests underlying:', '["Infection", "Ductal Carcinoma (DCIS or invasive)", "Allergy", "Fungus"]', 1, 'Must biopsy the nipple/areola. (Harrison''s Ch. 110)'),
    (v_topic_id, '210: "Inflammatory Breast Cancer" is a clinical diagnosis characterized by breast redness, warmth, and:', '["Fever", "Peau d''orange (skin like an orange peel)", "Discharge", "None"]', 1, 'Due to lymphatic invasion; very aggressive. (Step-Up)'),
    (v_topic_id, '211: "Tamoxifen" is used for ER-positive breast cancer and increases the risk of:', '["Lung cancer", "Endometrial cancer and Thromboembolism", "Bone loss", "Dementia"]', 1, 'Acts as an estrogen agonist in the uterus. (Pocket Medicine)'),
    (v_topic_id, '212: "Trastuzumab" (Herceptin) is used for breast cancers that overexpress:', '["Estrogen", "HER2/neu", "Progesterone", "Ki-67"]', 1, 'Can cause cardiotoxicity (requires monitoring ECHO). (Harrison''s Ch. 110)'),
    (v_topic_id, '213: "Sentinel Lymph Node Biopsy" is used to determine if breast cancer has spread to the ____ nodes.', '["Supraclavicular", "Axillary", "Inguinal", "Cervical"]', 1, 'Avoids the morbidity of full axillary dissection if negative. (Step-Up)'),
    (v_topic_id, '214: "Aromatase Inhibitors" (e.g., Anastrozole) are preferred over Tamoxifen for breast cancer in which population?', '["Pre-menopausal", "Post-menopausal", "Men", "Children"]', 1, 'They only block peripheral estrogen synthesis. (Pocket Medicine)'),
    (v_topic_id, '215: Breast cancer screening with mammography is generally recommended every 1-2 years starting at age:', '["30", "40-50", "65", "Never"]', 1, 'Guidelines vary (40 vs 50); individualize based on risk. (Harrison''s Ch. 110)'),
    (v_topic_id, '216: A "Triple Negative" breast cancer lacks ER, PR, and HER2, making it:', '["Easy to treat", "More aggressive with fewer targeted therapy options", "Benign", "None"]', 1, 'Requires standard chemotherapy. (Step-Up)');

    -- SECTION 21: GI CANCERS (COLORECTAL)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '217: What is the most common type of colorectal cancer?', '["Squamous", "Adenocarcinoma", "Lymphoma", "Sarcoma"]', 1, 'Arises from adenomatous polyps. (Pocket Medicine)'),
    (v_topic_id, '218: Standard colorectal cancer screening for average-risk individuals now starts at age:', '["35", "45", "50", "60"]', 1, 'Updated recently due to rising rates in younger adults. (Harrison''s Ch. 110)'),
    (v_topic_id, '219: "Familial Adenomatous Polyposis" (FAP) is caused by a mutation in the ____ gene and carries a 100% risk of cancer.', '["p53", "APC", "KRAS", "BRAF"]', 1, 'Requires prophylactic colectomy. (Step-Up)'),
    (v_topic_id, '220: "Lynch Syndrome" (HNPCC) is due to a defect in ____ repair genes.', '["DNA mismatch", "Base excision", "Hormone", "None"]', 0, 'Increases risk of colon, endometrial, and ovarian cancers. (Pocket Medicine)'),
    (v_topic_id, '221: Left-sided colon cancers (descending/sigmoid) often present with:', E'["Anemia only", "Change in bowel habits or \\"pencil-thin\\" stools", "Weight gain", "None"]', 1, 'Due to narrower lumen and more solid stool. (Harrison''s Ch. 110)'),
    (v_topic_id, '222: Right-sided colon cancers (cecum/ascending) often present with:', '["Obstruction", "Iron deficiency anemia (occult bleeding)", "Pain", "None"]', 1, 'Lumen is larger, so tumors can grow big without obstructing. (Step-Up)'),
    (v_topic_id, '223: Which tumor marker is used to MONITOR for recurrence in colorectal cancer?', '["PSA", "CEA (Carcinoembryonic Antigen)", "AFP", "CA-125"]', 1, 'Not for screening; only for monitoring. (Pocket Medicine)'),
    (v_topic_id, '224: "Apple-core lesion" on barium enema is a classic sign of:', '["Infection", "Annular Colorectal Cancer", "Ulcer", "Diverticulitis"]', 1, 'Indicates a constricting mass. (Harrison''s Ch. 110)'),
    (v_topic_id, '225: Colorectal cancer most commonly metastasizes to which organ?', '["Bone", "Liver", "Brain", "Skin"]', 1, 'Via the portal venous system. (Step-Up)'),
    (v_topic_id, '226: "Streptococcus gallolyticus" (formerly S. bovis) bacteremia is strongly associated with underlying:', '["Diabetes", "Colon Cancer", "Lung cancer", "Heart attack"]', 1, 'Any patient with S. bovis endocarditis/bacteremia needs a colonoscopy. (Pocket Medicine)');

    -- SECTION 22: OTHER GI & GENITOURINARY CANCERS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '227: "Sister Mary Joseph Nodule" is a periumbilical metastasis from which type of cancer?', '["Lung", "Gastric (Stomach)", "Skin", "Breast"]', 1, 'Classic sign of advanced intra-abdominal malignancy. (Harrison''s Ch. 110)'),
    (v_topic_id, '228: "Virchow''s Node" is a palpable left ____ lymph node suggesting abdominal cancer.', '["Axillary", "Supraclavicular", "Inguinal", "Cervical"]', 1, 'Also known as the "Troisier sign." (Step-Up)'),
    (v_topic_id, '229: What is the most common risk factor for Bladder Cancer?', '["Coffee", "Smoking", "Alcohol", "Spicy food"]', 1, 'Also occupational exposure to aniline dyes. (Pocket Medicine)'),
    (v_topic_id, '230: "Painless hematuria" in an older male smoker is ____ until proven otherwise.', '["Kidney stone", "Bladder Cancer", "UTI", "Prostatitis"]', 1, 'Requires cystoscopy and imaging. (Harrison''s Ch. 110)'),
    (v_topic_id, '231: "Renal Cell Carcinoma" (RCC) often presents with the triad of flank pain, hematuria, and:', '["Fever", "Palpable abdominal mass", "Weight gain", "Cough"]', 1, 'Classic but only seen in <10% of cases. (Step-Up)'),
    (v_topic_id, '232: "Prostate Cancer" screening is performed using DRE and ____.', '["AFP", "PSA (Prostate Specific Antigen)", "CEA", "CA-19-9"]', 1, 'Controversial due to overdiagnosis; discuss risks/benefits. (Pocket Medicine)'),
    (v_topic_id, '233: Prostate cancer classically metastasizes to bone, causing ____ lesions.', '["Lytic (holes)", "Blastic (bone forming)", "Mixed", "None"]', 1, 'Shows up as "hot spots" on bone scan. (Harrison''s Ch. 110)'),
    (v_topic_id, '234: "Testicular Cancer" is most common in young men and often presents as a:', '["Painful rash", "Painless solid scrotal mass", "Fever", "Hydrocele"]', 1, 'Must NOT be biopsied transscrotally (risk of seeding). (Step-Up)'),
    (v_topic_id, '235: "AFP" and "Beta-hCG" are markers for which type of cancer?', '["Prostate", "Germ Cell Tumors (Testicular/Ovarian)", "Colon", "Lung"]', 1, 'Useful for diagnosis and monitoring. (Pocket Medicine)'),
    (v_topic_id, '236: "CA-125" is a tumor marker used primarily for which cancer?', '["Breast", "Ovarian Cancer", "Lung", "Cervical"]', 1, 'Useful for monitoring response to therapy. (Harrison''s Ch. 110)');

    -- SECTION 23: ONCOLOGY PRINCIPLES & EMERGENCIES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '237: "Stage IV" cancer generally means the cancer has:', '["Stayed in place", "Spread to distant organs (metastasized)", "Only hit lymph nodes", "None"]', 1, 'Indicates advanced disease. (Step-Up)'),
    (v_topic_id, '238: "Performance Status" (e.g., ECOG or Karnofsky) is used to assess a patient''s:', '["Intelligence", "Ability to tolerate treatment (functional status)", "Genetic risk", "Social support"]', 1, 'Key factor in deciding between aggressive vs palliative care. (Pocket Medicine)'),
    (v_topic_id, '239: "Neutropenic Fever" is a medical emergency in oncology defined as a single temp > 38.3C and ANC < ____.', '["100", "500", "1500", "5000"]', 1, 'Requires immediate broad-spectrum IV antibiotics (e.g., Cefepime). (Harrison''s Ch. 110)'),
    (v_topic_id, '240: "Spinal Cord Compression" from metastasis presents with back pain and neurological deficits; the first step is:', '["Surgery", "High-dose IV Dexamethasone", "Radiation", "Aspirin"]', 1, 'Prevents permanent paralysis while awaiting definitive imaging (MRI). (Step-Up)'),
    (v_topic_id, '241: "Tumor Lysis Syndrome" treatment includes aggressive hydration and:', '["Insulin", "Allopurinol or Rasburicase", "Calcium", "Antibiotics"]', 1, 'To prevent uric acid-induced kidney injury. (Pocket Medicine)'),
    (v_topic_id, '242: "Hypercalcemia of Malignancy" is most commonly due to secretion of:', '["PTH", "PTHrP (PTH-related Protein)", "Vitamin D", "Calcitonin"]', 1, 'Common in squamous cell lung CA and breast CA. (Harrison''s Ch. 110)'),
    (v_topic_id, '243: "Adjuvant" therapy is given ____ primary surgery to kill micrometastases.', '["Before", "After", "During", "Instead of"]', 1, 'To reduce the risk of recurrence. (Step-Up)'),
    (v_topic_id, '244: "Neoadjuvant" therapy is given ____ primary surgery to shrink the tumor.', '["Before", "After", "During", "Never"]', 0, 'Often used in breast or rectal cancer. (Pocket Medicine)'),
    (v_topic_id, '245: "Palliative Care" aims to:', '["Cure the cancer", "Improve quality of life and manage symptoms", "Extend life at any cost", "None"]', 1, 'Appropriate at any stage of a serious illness. (Harrison''s Ch. 110)'),
    (v_topic_id, '246: "Anthracyclines" (e.g., Doxorubicin) are known for causing which specific toxicity?', '["Kidney failure", "Cardiotoxicity (dilated cardiomyopathy)", "Lung fibrosis", "Hearing loss"]', 1, 'Dose-dependent irreversible damage. (Step-Up)');

    -- SECTION 24: ONCOLOGY MIXED BOARD REVIEW
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '247: "Acanthosis nigricans" (sudden onset in elderly) = ?', '["Diabetes", "Gastric Adenocarcinoma", "Hypothyroid", "None"]', 1, 'Paraneoplastic sign. (Pocket Medicine)'),
    (v_topic_id, '248: "Leser-Trelat sign" (sudden eruptive seborrheic keratoses) = ?', '["Aging", "Internal Malignancy (e.g., GI)", "Infection", "None"]', 1, 'Sign of an underlying cancer. (Harrison''s Ch. 110)'),
    (v_topic_id, '249: "Dermatomyositis" in an adult = ?', '["Muscle overuse", "Associated with occult malignancy (Lung, Ovary, GI)", "Vitamin deficiency", "None"]', 1, 'Paraneoplastic inflammatory myopathy. (Step-Up)'),
    (v_topic_id, '250: "Trousseau Syndrome" (migratory thrombophlebitis) = ?', '["Varicose veins", "Pancreatic Cancer", "Lung cancer", "None"]', 1, 'Hypercoagulable state of malignancy. (Pocket Medicine)'),
    (v_topic_id, '251: "Psammoma bodies" = ?', '["Papillary Thyroid CA, Serous Ovarian CA, Meningioma", "Small cell lung", "MM", "None"]', 0, 'Laminated calcified concretions. (Harrison''s Ch. 110)'),
    (v_topic_id, '252: "AFP" high = ?', '["Prostate CA", "Hepatocellular CA or Germ cell tumor", "Colon CA", "None"]', 1, 'Liver cancer or yolk sac tumor. (Step-Up)'),
    (v_topic_id, '253: "CA-19-9" = ?', '["Breast", "Pancreatic Cancer", "Lung", "None"]', 1, 'Used to monitor pancreatic cancer therapy. (Pocket Medicine)'),
    (v_topic_id, '254: "CEA" = ?', '["Ovary", "Colorectal Cancer", "Prostate", "None"]', 1, 'Used to monitor colon cancer. (Harrison''s Ch. 110)'),
    (v_topic_id, '255: "PSA" = ?', '["Bladder", "Prostate Cancer", "Kidney", "None"]', 1, 'Prostate specific antigen. (Step-Up)'),
    (v_topic_id, '256: "Bleomycin" toxicity = ?', '["Heart", "Pulmonary Fibrosis", "Kidney", "Nerves"]', 1, 'Check PFTs before use. (Pocket Medicine)'),
    (v_topic_id, '257: "Cisplatin" toxicity = ?', '["Ototoxicity and Nephrotoxicity", "Liver", "Lungs", "None"]', 0, 'Prevent kidney damage with fluids/amifostine. (Harrison''s Ch. 110)'),
    (v_topic_id, '258: "Vincristine" toxicity = ?', '["Diarrhea", "Peripheral Neuropathy", "Heart failure", "None"]', 1, '"V"incristine = "V"ery bad for nerves. (Step-Up)'),
    (v_topic_id, '259: "Cyclophosphamide" toxicity = ?', '["Lung", "Hemorrhagic Cystitis", "Liver", "None"]', 1, 'Prevent with MESNA and hydration. (Pocket Medicine)'),
    (v_topic_id, '260: "5-FU" and "Methotrexate" side effect = ?', '["Bone fracture", "Mucositis/Stomatitis", "Rash", "None"]', 1, 'Oral ulcers and GI upset. (Harrison''s Ch. 110)'),
    (v_topic_id, '261: "S-100" marker = ?', '["Melanoma", "Colon CA", "Lung CA", "None"]', 0, 'Marker for neural crest-derived cells. (Step-Up)'),
    (v_topic_id, '262: "Etoposide" side effect = ?', '["Alopecia", "Second Malignancies (AML)", "Heart failure", "None"]', 1, 'Risk of topoisomerase inhibitor therapy. (Pocket Medicine)'),
    (v_topic_id, '263: "Paclitaxel" toxicity = ?', '["Hypersensitivity and Peripheral neuropathy", "Liver", "Kidney", "None"]', 0, 'Requires premedication with steroids/antihistamines. (Harrison''s Ch. 110)');

    RAISE NOTICE 'SUCCESS: Hematology/Oncology MCQ Part 3 (177-263) registered.';
END $$;

COMMIT;
