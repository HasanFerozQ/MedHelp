BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Surgical Oncology Basics
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'surgical-oncology-basics' LIMIT 1;

    -- CASE 01: Biopsy Techniques
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Choosing the Right Biopsy', 'A 50-year-old male has a 3 cm suspicious soft tissue mass in his thigh. You need to obtain tissue for a diagnosis.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary disadvantage of Fine Needle Aspiration (FNA) compared to Core Needle Biopsy?', '["It is more painful", "It provides only cytology (individual cells) rather than tissue architecture", "It requires general anesthesia", "It has more complications"]', 1, 'FNA is great for cells but cannot show patterns of invasion or tissue structure.'),
    (v_case_id, 'For a large soft tissue sarcoma, which biopsy technique is generally preferred to maintain the ability for later definitive resection?', '["Excisional biopsy", "Longitudinal incisional biopsy", "Transverse incisional biopsy", "FNA"]', 1, 'Incisional biopsies for extremity sarcomas must be longitudinal so the entire biopsy tract can be easily resected during the definitive surgery.'),
    (v_case_id, 'What is an "Excisional Biopsy"?', '["Removing a small piece of the tumor", "Removing the entire suspicious lesion", "Taking cells with a needle", "Using a brush"]', 1, 'Excisional biopsy is used for small lesions where the whole thing can be removed safely.');

    -- CASE 02: Resection Margins
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Defining the Resection', 'A pathology report for a colon cancer resection states: "Tumor is present at the inked surgical margin." ', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would this resection be classified?', '["R0", "R1", "R2", "Rx"]', 1, 'R0 = Microscopically negative margins. R1 = Microscopically positive margins. R2 = Macroscopically positive (gross tumor left behind).'),
    (v_case_id, 'What is the clinical significance of an R1 resection?', '["The patient is cured", "High risk of local recurrence", "No significance", "Chemotherapy is not needed"]', 1, 'Positive margins mean cancer was left in the patient, necessitating further surgery or radiation.'),
    (v_case_id, 'In surgical oncology, what is the "Margin of Safety"?', '["The distance between the tumor and the surgeon", "The amount of normal-appearing tissue removed around the tumor to ensure no microscopic disease remains", "The time of surgery", "The number of nodes removed"]', 1, 'Margin width varies by tumor type (e.g., 2 cm for melanoma vs 1-2 mm for breast).');

    -- CASE 03: Neoadjuvant vs. Adjuvant
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Timing the Therapy', 'A patient with a large rectal cancer is given chemotherapy and radiation BEFORE his surgery to shrink the tumor.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for therapy given BEFORE the primary surgical intervention?', '["Adjuvant therapy", "Neoadjuvant therapy", "Palliative therapy", "Maintenance therapy"]', 1, 'Neoadjuvant therapy aims to "downstage" the tumor to make surgery easier or more successful.'),
    (v_case_id, 'What is "Adjuvant" therapy?', '["Therapy given after the primary surgery to eliminate potential microscopic disease", "Therapy given instead of surgery", "Therapy for pain", "Therapy for terminal patients"]', 0, 'Adjuvant therapy is "insurance" against systemic recurrence.'),
    (v_case_id, 'Which of the following is a potential benefit of neoadjuvant therapy?', '["It always cures the cancer", "It can convert an unresectable tumor into a resectable one", "It has no side effects", "It makes surgery longer"]', 1, 'Downstaging is the primary goal.');

    -- CASE 04: Melanoma - Breslow Thickness
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pigmented Lesion', 'A 40-year-old female has an irregular, dark mole removed from her back. The pathology shows Malignant Melanoma.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important prognostic factor for a localized primary melanoma?', '["Tumor diameter", "Breslow Thickness (depth of invasion in mm)", "Patient age", "Color of the lesion"]', 1, 'Breslow thickness is the single most important predictor of survival and nodal spread.'),
    (v_case_id, 'A melanoma that is 1.5 mm thick requires what margin for wide local excision?', '["1 mm", "1 cm", "2 cm", "5 cm"]', 2, 'Melanomas 1-2 mm thick typically require a 2 cm margin.'),
    (v_case_id, 'What is "Clark''s Level" (historically used)?', '["Thickness in mm", "Anatomic level of invasion (e.g., into the papillary vs reticular dermis)", "Number of mitoses", "Patient''s name"]', 1, 'Clark''s levels describe which layer of the skin the tumor has reached, but Breslow thickness (exact measurement) has replaced it in staging.');

    -- CASE 05: Soft Tissue Sarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Deep Mass', 'A 50-year-old male presents with a painless, 10 cm mass deep in the muscles of his thigh. It is firm and fixed.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'True or False: Any soft tissue mass that is > 5 cm or deep to the fascia should be considered a sarcoma until proven otherwise.', '["True", "False"]', 0, 'True. Size and depth are red flags for malignancy.'),
    (v_case_id, 'What is the most common site of distant metastasis for most soft tissue sarcomas?', '["Liver", "Lungs", "Brain", "Bone"]', 1, 'Sarcomas primarily spread hematogenously to the lungs.'),
    (v_case_id, 'What is the primary treatment for localized soft tissue sarcoma?', '["Chemotherapy alone", "Radiation alone", "Wide local excision (often with adjuvant radiation)", "Amputation only"]', 2, 'Surgery with negative margins is the cornerstone of treatment.');

    -- CASE 06: Basal Cell vs. Squamous Cell
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pearly Papule', 'A 70-year-old male has a small, pearly-appearing bump on his nose with telangiectasias (small blood vessels) on the surface.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Basal Cell Carcinoma (BCC)", "Squamous Cell Carcinoma (SCC)", "Melanoma", "Seborrheic keratosis"]', 0, 'The "pearly" appearance with telangiectasias is classic for BCC.'),
    (v_case_id, 'Which of these (BCC vs SCC) has a higher risk of metastasis?', '["BCC", "SCC"]', 1, 'BCC is locally invasive but almost never metastasizes; SCC has a small but real risk of nodal spread.'),
    (v_case_id, 'What is "Mohs Micrographic Surgery"?', '["A type of radiation", "A technique involving serial excision and immediate microscopic margin mapping to minimize tissue loss", "Surgery with a laser", "General anesthesia surgery"]', 1, 'Mohs is ideal for high-risk areas (face/nose) where tissue conservation is critical.');

    -- CASE 07: Thyroid Nodule Workup
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thyroid Lump', 'A 35-year-old woman is found to have a 1.5 cm firm nodule in her right thyroid lobe. Her TSH is normal.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next best step in management for a > 1 cm nodule with a normal TSH?', '["Thyroid scan (RAIU)", "Fine Needle Aspiration (FNA)", "Immediate surgery", "Observation"]', 1, 'FNA is the gold standard for evaluating thyroid nodules for malignancy.'),
    (v_case_id, 'What is the "Bethesda System" used for?', '["Staging colon cancer", "Classifying thyroid FNA cytology results", "Grading breast cancer", "Measuring liver function"]', 1, 'Bethesda categories (I-VI) determine the risk of malignancy and the next clinical step.'),
    (v_case_id, 'If the TSH were LOW (hyperthyroid), what would be the preferred next test?', '["FNA", "Thyroid Scintigraphy (Radioiodine Scan)", "CT scan", "Ultrasound"]', 1, 'A "hot" (functioning) nodule is almost never malignant, so a scan is done first to see if the nodule is the cause of the hyperthyroidism.');

    -- CASE 08: Papillary Thyroid Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Orphan Annie Eyes', 'A biopsy of a thyroid nodule shows cells with large, clear nuclei and "Psammoma bodies."', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular Cancer", "Papillary Thyroid Cancer", "Medullary Cancer", "Anaplastic Cancer"]', 1, 'Papillary is the most common thyroid cancer and has these characteristic histologic features.'),
    (v_case_id, 'What is the primary mode of spread for Papillary thyroid cancer?', '["Hematogenous (Blood)", "Lymphatic", "Direct invasion only", "It doesn''t spread"]', 1, 'Papillary cancer frequently spreads to the cervical lymph nodes.'),
    (v_case_id, 'What is the general prognosis for Papillary thyroid cancer in a young patient?', '["Very poor", "Excellent (10-year survival > 95%)", "Moderate", "Always fatal"]', 1, 'It is one of the most "curable" malignancies in medicine.');

    -- CASE 09: Medullary Thyroid Cancer (MTC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Parafollicular Cells', 'A patient is diagnosed with Medullary Thyroid Cancer. Calcitonin levels are high.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'From which cells does MTC originate?', '["Follicular cells", "Parafollicular (C) cells", "Lymphocytes", "Hurthle cells"]', 1, 'C-cells produce calcitonin, which is used as a tumor marker for MTC.'),
    (v_case_id, 'Which mutation should be tested for in all patients with MTC?', '["BRAF", "RET proto-oncogene", "p53", "BRCA1"]', 1, 'RET mutations are associated with familial MTC and MEN 2 syndromes.'),
    (v_case_id, 'If a patient has a RET mutation, what other condition should be ruled out before thyroid surgery?', '["Pituitary adenoma", "Pheochromocytoma", "Gastrinoma", "Lung cancer"]', 1, 'In MEN 2, a pheochromocytoma must be diagnosed and managed first to avoid a hypertensive crisis during surgery.');

    -- CASE 10: Pheochromocytoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Adrenal Crisis', 'A 40-year-old presents with "spells" of pounding headaches, palpitations, and diaphoresis (sweating). His BP is 210/110 during an episode.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most sensitive screening test for pheochromocytoma?', '["CT scan", "Plasma free metanephrines or 24-hour urinary metanephrines", "Serum potassium", "Renin levels"]', 1, 'Metanephrines are breakdown products of catecholamines.'),
    (v_case_id, 'In what order should medications be started before surgery for pheochromocytoma?', '["Beta-blocker first, then Alpha-blocker", "Alpha-blocker first (e.g., Phenoxybenzamine), then Beta-blocker", "Aspirin only", "Diuretics"]', 1, '"Alpha before Beta" is critical to avoid unopposed alpha-adrenergic stimulation and hypertensive crisis.'),
    (v_case_id, 'What is the "Rule of 10s" for pheochromocytoma?', '["10% malignant, 10% bilateral, 10% extra-adrenal, 10% familial", "10 cm size, 10 years old, 10 symptoms", "10 blood tests, 10 scans", "10% cure rate"]', 0, 'This rule summarizes the common characteristics of the tumor.');

    -- CASE 11: Parathyroid Adenoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bones, Stones, and Groans', 'A 55-year-old woman has recurrent kidney stones and a high Calcium (11.2 mg/dL). Her PTH is also elevated.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary Hyperparathyroidism (usually an adenoma)", "Secondary Hyperparathyroidism", "Cancer of the bone", "Vitamin D deficiency"]', 0, 'High calcium with an inappropriately high PTH is primary hyperparathyroidism.'),
    (v_case_id, 'What imaging test is used to LOCALIZE a parathyroid adenoma before surgery?', '["CT neck", "SestaMIBI scan", "MRI", "PET scan"]', 1, 'SestaMIBI is a nuclear medicine scan that is selectively taken up by overactive parathyroid tissue.'),
    (v_case_id, 'What is the definitive treatment?', '["Low calcium diet", "Surgical excision of the offending gland(s)", "Calcimimetics only", "Radiation"]', 1, 'Surgery is the only cure for primary hyperparathyroidism.');

    -- CASE 12: GIST (Gastrointestinal Stromal Tumor)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Submucosal Gastric Mass', 'A patient is found to have a 4 cm mass in the wall of the stomach during endoscopy for anemia. Biopsy shows spindle cells that are positive for CD117 (c-kit).', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Gastric Adenocarcinoma", "GIST", "Lymphoma", "Leiomyoma"]', 1, 'CD117 positivity is the hallmark of GIST.'),
    (v_case_id, 'GIST tumors arise from which specific cells?', '["G-cells", "Interstitial Cells of Cajal (the \"pacemaker\" cells of the gut)", "Squamous cells", "Chief cells"]', 1, 'These cells coordinate gut motility.'),
    (v_case_id, 'What targeted therapy is used for metastatic or high-risk GIST?', '["Tamoxifen", "Imatinib (Gleevec)", "Trastuzumab", "Rituximab"]', 1, 'Imatinib is a tyrosine kinase inhibitor that targets the c-kit mutation.');

    -- CASE 13: Carcinoid of the Appendix
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Incidental Appendix Finding', 'After an appendectomy for appendicitis, the pathologist finds a 0.8 cm carcinoid tumor at the tip of the appendix.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate management for this patient?', '["Right hemicolectomy", "Appendectomy is sufficient (no further surgery)", "Chemotherapy", "Radiation"]', 1, 'For appendiceal carcinoids < 1 cm at the tip, appendectomy is curative.'),
    (v_case_id, 'At what size does an appendiceal carcinoid generally warrant a formal right hemicolectomy?', '["> 0.5 cm", "> 2 cm", "> 5 cm", "Always"]', 1, 'Tumors > 2 cm have a higher risk of nodal spread.'),
    (v_case_id, 'What is the most common site of carcinoid tumors overall?', '["Lungs", "Gastrointestinal tract (especially appendix and small bowel)", "Liver", "Spleen"]', 1, 'The GI tract is the most frequent location.');

    -- CASE 14: Tumor Markers - General
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Matching the Marker', 'A patient is being monitored after treatment for various cancers. Match the marker to the cancer.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which marker is used for monitoring Colorectal Cancer recurrence?', '["PSA", "CEA", "AFP", "CA-125"]', 1, 'Carcinoembryonic antigen (CEA) is the standard marker for CRC.'),
    (v_case_id, 'Which marker is used for Ovarian Cancer?', '["CEA", "CA-125", "AFP", "hCG"]', 1, 'CA-125 is used to monitor response to therapy in epithelial ovarian cancer.'),
    (v_case_id, 'True or False: Most tumor markers are good for general population screening.', '["True", "False"]', 1, 'False. Most have poor specificity; they are primarily used for monitoring recurrence or response to treatment.');

    -- CASE 15: Lynch Syndrome (HNPCC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Family History of Multiple Cancers', 'A 40-year-old male is diagnosed with colon cancer. His father had colon cancer at 45, and his sister had endometrial cancer at 38.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely hereditary syndrome?', '["FAP", "Lynch Syndrome", "Li-Fraumeni", "Peutz-Jeghers"]', 1, 'Lynch syndrome is characterized by early-onset colon cancer and various extracolonic cancers (endometrial is most common).'),
    (v_case_id, 'What is the underlying molecular defect in Lynch syndrome?', '["APC mutation", "DNA Mismatch Repair (MMR) gene mutation (leads to Microsatellite Instability)", "p53 mutation", "RET mutation"]', 1, 'Mutations in MLH1, MSH2, MSH6, or PMS2 cause defective DNA repair.'),
    (v_case_id, 'Where in the colon do Lynch syndrome cancers typically occur?', '["Rectum", "Right-sided (proximal to the splenic flexure)", "Sigmoid", "Anus"]', 1, 'They are predominantly right-sided.');

    -- CASE 16: Familial Adenomatous Polyposis (FAP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hundreds of Polyps', 'During a screening colonoscopy of a 15-year-old with a family history of colon cancer, the physician finds > 1000 small polyps covering the entire colon.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Lynch Syndrome", "FAP", "IBS", "Ulcerative Colitis"]', 1, 'FAP is characterized by thousands of adenomatous polyps.'),
    (v_case_id, 'What is the lifetime risk of colon cancer in an untreated FAP patient?', '["10%", "50%", "100%", "Same as average"]', 2, 'Cancer is inevitable in FAP; prophylactic proctocolectomy is required.'),
    (v_case_id, 'Which gene is mutated in FAP?', '["MMR", "APC", "KRAS", "DCC"]', 1, 'The Adenomatous Polyposis Coli (APC) gene is a tumor suppressor.');

    -- CASE 17: Li-Fraumeni Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "S" Cancers', 'A family history reveals multiple members with Sarcomas, Breast cancer, Brain tumors, and Adrenal cortical carcinomas at young ages.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely syndrome?', '["MEN 1", "Li-Fraumeni Syndrome", "Lynch", "FAP"]', 1, 'Li-Fraumeni is a highly penetrant cancer predisposition syndrome.'),
    (v_case_id, 'Which gene is mutated in Li-Fraumeni?', '["RET", "TP53", "BRCA1", "PTEN"]', 1, 'TP53 is the "guardian of the genome" and is a critical tumor suppressor.'),
    (v_case_id, 'What is the inheritance pattern?', '["Autosomal recessive", "Autosomal dominant", "X-linked", "Mitochondrial"]', 1, 'Most hereditary cancer syndromes (FAP, Lynch, Li-Fraumeni, BRCA) are autosomal dominant.');

    -- CASE 18: Palliative Surgery
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Surgery for Quality of Life', 'A patient with unresectable, metastatic pancreatic cancer presents with a complete gastric outlet obstruction and cannot eat.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary goal of surgery in this case?', '["Cure", "Palliation (symptom relief and improvement in quality of life)", "To prolong life by years", "Research"]', 1, 'Palliative surgery focuses on relieving obstruction, pain, or bleeding.'),
    (v_case_id, 'Which of the following is a palliative option for this patient?', '["Total pancreatectomy", "Gastrojejunostomy (surgical bypass) or duodenal stenting", "Radiation only", "Whipple procedure"]', 1, 'Bypass allow the patient to eat without attempting to remove the incurable tumor.'),
    (v_case_id, 'True or False: Palliative surgery should only be offered to patients expected to live more than 1 year.', '["True", "False"]', 1, 'False. Palliative decisions are based on the balance of surgical risk vs. the potential for immediate symptom relief.');

    -- CASE 19: Paraneoplastic Syndromes - Hypercalcemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cancer and High Calcium', 'A smoker with a large lung mass presents with confusion and a Calcium of 14 mg/dL. His PTH is low.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common mechanism of humoral hypercalcemia of malignancy?', '["Secretion of PTH", "Secretion of PTH-related protein (PTHrP)", "Excessive Vitamin D", "Direct bone destruction"]', 1, 'PTHrP mimics the action of PTH on the bone and kidney but is not detected by standard PTH assays.'),
    (v_case_id, 'Which lung cancer type is most commonly associated with PTHrP production?', '["Small cell", "Squamous cell carcinoma", "Adenocarcinoma", "Large cell"]', 1, 'Squamous cell carcinoma is the classic cause of PTHrP-mediated hypercalcemia.'),
    (v_case_id, 'Small cell lung cancer is more commonly associated with which other paraneoplastic syndrome?', '["Hypercalcemia", "SIADH or Cushing''s (ACTH production)", "Hyperthyroidism", "Gout"]', 1, 'Small cell is a neuroendocrine tumor that frequently secretes hormones.');

    -- CASE 20: Principles of Radiation Therapy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Energy vs. Cancer', 'A patient is receiving radiation therapy for a rectal tumor.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Brachytherapy"?', '["High-dose external beam", "Placement of radioactive sources directly into or next to the tumor", "Oral radiation", "Low-dose whole body radiation"]', 1, 'Brachytherapy provides very localized, high-dose radiation.'),
    (v_case_id, 'What is the primary way that radiation kills cancer cells?', '["Heat", "Generating free radicals that cause DNA damage (especially double-strand breaks)", "Blocking blood flow", "Stimulating the immune system"]', 1, 'Radiation targets the DNA of rapidly dividing cells.'),
    (v_case_id, 'A chronic, late side effect of radiation to the abdomen is:', '["Hair loss", "Radiation enteritis and strictures (due to endarteritis obliterans)", "Nausea", "Fever"]', 1, 'Radiation causes long-term vascular damage to the small bowel.');

    -- CASE 21: Principles of Chemotherapy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cell Cycle Specificity', 'A patient is undergoing chemotherapy with a combination of drugs.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which class of chemotherapy drugs acts by cross-linking DNA and is NOT cell-cycle specific?', '["Antimetabolites (e.g., 5-FU)", "Alkylating agents (e.g., Cyclophosphamide)", "Taxanes", "Vinca alkaloids"]', 1, 'Alkylating agents kill cells in any phase of the cycle.'),
    (v_case_id, 'Which phase of the cell cycle is targeted by antimetabolites like Methotrexate or 5-FU?', '["G1", "S phase (DNA synthesis)", "M phase (mitosis)", "G0"]', 1, 'These drugs interfere with the building blocks of DNA.'),
    (v_case_id, 'Vinca alkaloids and Taxanes target which part of the cell machinery?', '["DNA", "Microtubules / Mitotic spindle", "Cell membrane", "Mitochondria"]', 1, 'They prevent successful mitosis.');

    -- CASE 22: Cancer Cachexia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wasting Away', 'A patient with advanced cancer has lost 40 lbs, has profound muscle wasting, and reports no appetite.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mediator of cancer cachexia?', '["Lack of calories", "Cytokines (e.g., TNF-alpha / Cachectin)", "Pain", "Depression"]', 1, 'Cachexia is a metabolic syndrome driven by systemic inflammation, not just starvation.'),
    (v_case_id, 'True or False: Aggressive nutritional support (TPN) can usually reverse cancer cachexia.', '["True", "False"]', 1, 'False. Unlike simple starvation, cachexia involves a metabolic shift that is rarely fully reversed by calories alone.'),
    (v_case_id, 'Which medication can sometimes be used to stimulate appetite in cachectic patients?', '["Aspirin", "Megestrol acetate (Megace) or Dexamethasone", "Metformin", "Lisinopril"]', 1, 'Appetite stimulants can provide temporary improvement.');

    -- CASE 23: Surgical Margin - R2 Resection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gross Disease Left Behind', 'During surgery for a large retroperitoneal sarcoma, the surgeon finds the tumor is wrapped around the aorta and cannot be safely removed entirely. He removes as much as possible but leaves 2 cm of gross tumor on the vessel.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the margin status of this resection?', '["R0", "R1", "R2", "Rx"]', 2, 'R2 indicates macroscopic (visible) residual disease.'),
    (v_case_id, 'What is the goal of such a "debulking" surgery if it cannot be curative?', '["To make the CT scan look better", "To reduce tumor burden to improve the efficacy of subsequent therapies or relieve symptoms", "There is no goal", "To cure the patient"]', 1, 'Debulking is sometimes performed if the remaining disease can be effectively treated with other modalities.'),
    (v_case_id, 'For which gynecological cancer is debulking surgery a standard part of management?', '["Cervical", "Ovarian", "Uterine", "Vaginal"]', 1, 'Ovarian cancer is uniquely sensitive to debulking followed by chemotherapy.');

    -- CASE 24: Sentinel Node Mapping - Technique
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Trail', 'A surgeon is performing a sentinel node biopsy for a breast cancer.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two common tracers used for sentinel node mapping?', '["Red dye and Iodine", "Isosulfan Blue (or Methylene Blue) and Technetium-99m sulfur colloid", "Fluorescein and Carbon", "Water and Air"]', 1, 'The combination of dye and radio-tracer provides the highest identification rate.'),
    (v_case_id, 'Where is the tracer typically injected?', '["Into the tumor", "Peritumoral or subareolar (dermal/parenchymal)", "Intravenously", "Into the bone"]', 1, 'The tracers follow the natural lymphatic drainage of the breast tissue.'),
    (v_case_id, 'A "hot and blue" node refers to:', '["An infected node", "A node that has taken up both the radioactive tracer and the dye", "A node with cancer", "A normal node"]', 1, 'This is the most likely node to be the sentinel node.');

    -- CASE 25: Adrenal Incidentaloma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Surprise on the CT', 'A patient has a CT scan for a suspected kidney stone. It shows a normal kidney but an incidental 2 cm mass in the left adrenal gland.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two key questions to answer for any adrenal incidentaloma?', '["Is it painful and is it big?", "Is it functional (producing hormones) and is it malignant?", "Is it on the right or left?", "Does the patient smoke?"]', 1, 'Evaluation focuses on hormone production and cancer risk.'),
    (v_case_id, 'At what size does an adrenal incidentaloma generally warrant surgical removal regardless of function?', '["> 1 cm", "> 4 cm", "> 10 cm", "Always"]', 1, 'Masses > 4 cm (some say 6 cm) have a higher risk of adrenocortical carcinoma.'),
    (v_case_id, 'Which of the following is NOT part of the standard functional workup for an incidentaloma?', '["Low-dose dexamethasone suppression test", "Plasma metanephrines", "Renin/Aldosterone (if hypertensive)", "Serum insulin"]', 3, 'Adrenal tumors do not produce insulin.');

    -- CASE 26: Desmoid Tumors
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Aggressive Fibromatosis', 'A patient with FAP develops a large, firm mass in the abdominal wall. Biopsy shows a benign-appearing but highly infiltrative proliferation of fibrous tissue.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this tumor called?', '["Fibrosarcoma", "Desmoid Tumor", "Lipoma", "Hemangioma"]', 1, 'Desmoid tumors are locally aggressive but do not metastasize.'),
    (v_case_id, 'Desmoid tumors are a common extra-colonic manifestation of which syndrome?', '["Lynch", "FAP (especially Gardner Syndrome variant)", "MEN 2", "Li-Fraumeni"]', 1, 'Gardner syndrome includes FAP, desmoids, osteomas, and sebaceous cysts.'),
    (v_case_id, 'What is the primary management for a desmoid tumor that is causing symptoms?', '["Chemotherapy", "Wide local excision (though recurrence is high)", "Radiation", "Aspirin"]', 1, 'Surgical excision is the mainstay, but they are difficult to fully remove due to their infiltrative nature.');

    -- CASE 27: Melanoma - Lymph Node Dissection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Positive Sentinel Node', 'A patient with a 2 mm thick melanoma has a positive sentinel node biopsy (micro-metastasis).', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Historically, what was the next step for a positive SLNB?', '["Observation", "Completion Lymph Node Dissection (CLND)", "Mastectomy", "Chemotherapy only"]', 1, 'Removing all the remaining nodes in the basin was the traditional next step.'),
    (v_case_id, 'Recent trials (e.g., MSLT-II) have shown that in patients with a positive SLNB, CLND improves:', '["Overall survival", "Local nodal basin control, but not overall survival", "Nothing", "Cosmetic results"]', 1, 'Because CLND doesn''t improve overall survival, many patients are now managed with close nodal observation (ultrasound) instead.'),
    (v_case_id, 'What is the "In-transit" metastasis in melanoma?', '["Spread to the lungs", "Tumor deposits in the lymphatics between the primary site and the regional nodal basin", "Spread to the brain", "Cancer in the blood"]', 1, 'In-transit disease indicates a poor prognosis.');

    -- CASE 28: Immunotherapy - Checkpoint Inhibitors
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unleashing the Immune System', 'A patient with metastatic melanoma is started on Nivolumab or Pembrolizumab.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of "Checkpoint Inhibitors"?', '["Kill cancer cells directly", "Block the "off switch" on T-cells (e.g., PD-1 or CTLA-4), allowing the immune system to attack the cancer", "Boost the liver", "Kill bacteria"]', 1, 'They "release the brakes" on the body''s natural immune response.'),
    (v_case_id, 'Which of the following is a potential side effect of immunotherapy?', '["Hair loss", "Immune-related adverse events (e.g., colitis, pneumonitis, thyroiditis)", "Nausea", "Anemia"]', 1, 'An overactive immune system can attack the patient''s own organs.'),
    (v_case_id, 'True or False: Immunotherapy has significantly improved the prognosis for metastatic melanoma.', '["True", "False"]', 0, 'True. It has revolutionized the treatment of advanced melanoma.');

    -- CASE 29: Paraneoplastic Syndromes - Myasthenia Gravis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Drooping Eyelid', 'A patient is found to have a mass in the anterior mediastinum on a CXR for "weakness." He has ptosis (drooping eyelids) that worsens throughout the day.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis of the anterior mediastinal mass?', '["Lung cancer", "Thymoma", "Goiter", "Lymphoma"]', 1, 'Thymoma is strongly associated with Myasthenia Gravis (MG).'),
    (v_case_id, 'What percentage of patients with Thymoma have MG?', '["5%", "30-50%", "100%", "0%"]', 1, 'A large portion of thymoma patients have MG symptoms.'),
    (v_case_id, 'Will surgical removal of the thymus (Thymectomy) cure the Myasthenia Gravis?', '["Yes, always", "It improves symptoms in many patients, even if no tumor is present", "No", "It makes it worse"]', 1, 'Thymectomy is a standard treatment for MG, especially if a thymoma is present.');

    -- CASE 30: Bone Sarcoma - Osteosarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sunburst on X-ray', 'A 15-year-old boy presents with knee pain. X-ray shows a mass in the distal femur with a "sunburst" periosteal reaction and "Codman''s triangle."', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Ewing Sarcoma", "Osteosarcoma", "Osteomyelitis", "Growing pains"]', 1, 'Osteosarcoma is the most common primary bone malignancy in adolescents.'),
    (v_case_id, 'Which bone cancer is characterized by an "onion-skin" appearance on X-ray and a (11;22) translocation?', '["Osteosarcoma", "Ewing Sarcoma", "Chondrosarcoma", "Multiple Myeloma"]', 1, 'Ewing''s is a small round blue cell tumor.'),
    (v_case_id, 'What is the standard treatment for Osteosarcoma?', '["Amputation only", "Neoadjuvant chemotherapy followed by limb-sparing surgery and more chemotherapy", "Radiation only", "Antibiotics"]', 1, 'Chemotherapy is vital because microscopic lung metastases are almost always present at diagnosis.');

    RAISE NOTICE 'SUCCESS: Surgical Oncology Basics Case Blocks (1-30) registered.';
END $$;

COMMIT;
