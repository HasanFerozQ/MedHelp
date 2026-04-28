-- Migration: Year 3 - Hematology/Oncology MCQ Bank (PART 2: 89-176)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-oncology' LIMIT 1;

    -- SECTION 10: ACUTE LEUKEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '89: Acute Myeloid Leukemia (AML) is characterized by a rapid proliferation of ____ in the bone marrow.', '["Mature neutrophils", "Myeloblasts (>20%)", "Lymphocytes", "Platelets"]', 1, 'Crowds out normal hematopoiesis. (Harrison''s Ch. 110)'),
    (v_topic_id, '90: "Auer rods" on a bone marrow aspirate are pathognomonic for:', '["ALL", "AML (especially M3 sub-type)", "CLL", "CML"]', 1, 'Needle-like cytoplasmic inclusions. (Step-Up)'),
    (v_topic_id, '91: "Acute Promyelocytic Leukemia" (APL / M3) is associated with which translocation?', '["t(9;22)", "t(15;17)", "t(8;14)", "t(12;21)"]', 1, 'Involves the RAR-alpha gene. (Pocket Medicine)'),
    (v_topic_id, '92: APL is a medical emergency due to the high risk of:', '["Infection", "Disseminated Intravascular Coagulation (DIC)", "Brain tumor", "Liver failure"]', 1, 'Release of pro-coagulants from granules. (Harrison''s Ch. 110)'),
    (v_topic_id, '93: The treatment of choice for APL includes ____, which forces the blasts to differentiate.', '["Cytarabine", "All-Trans Retinoic Acid (ATRA)", "Methotrexate", "Imatinib"]', 1, 'Can also use arsenic trioxide. (Step-Up)'),
    (v_topic_id, '94: "Acute Lymphoblastic Leukemia" (ALL) is the most common malignancy in:', '["Elderly", "Children", "Teens", "Men"]', 1, 'Presents with bone pain, fever, and bruising. (Pocket Medicine)'),
    (v_topic_id, '95: "Terminal Deoxynucleotidyl Transferase" (TdT) is a positive marker for:', '["AML", "ALL", "CLL", "CML"]', 1, 'A DNA polymerase found in lymphoblasts. (Harrison''s Ch. 110)'),
    (v_topic_id, '96: ALL has a high propensity to spread to which "sanctuary" sites?', '["Liver and Spleen", "CNS and Testes", "Bones", "Lungs"]', 1, 'Requires intrathecal chemotherapy. (Step-Up)'),
    (v_topic_id, '97: Which translocation in childhood ALL is associated with a GOOD prognosis?', '["t(9;22)", "t(12;21)", "t(4;11)", "None"]', 1, 'Common in B-cell ALL. (Pocket Medicine)'),
    (v_topic_id, '98: "Tumor Lysis Syndrome" (TLS) after starting chemo for leukemia involves high levels of:', '["Sugar", "Uric acid, Potassium, and Phosphate", "Calcium", "Sodium"]', 1, 'Massive release of intracellular contents. (Harrison''s Ch. 110)');

    -- SECTION 11: CHRONIC LEUKEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '99: "Chronic Myeloid Leukemia" (CML) is defined by the ____ chromosome, t(9;22).', '["Philadelphia", "New York", "London", "Tokyo"]', 0, 'Creates the BCR-ABL fusion protein (a tyrosine kinase). (Harrison''s Ch. 110)'),
    (v_topic_id, '100: What is the first-line treatment for CML?', '["Chemotherapy", "Tyrosine Kinase Inhibitors (e.g., Imatinib)", "Radiation", "Surgery"]', 1, 'Revolutionized the prognosis of CML. (Step-Up)'),
    (v_topic_id, '101: "Leukocyte Alkaline Phosphatase" (LAP) score is ____ in CML and ____ in a leukemoid reaction.', '["High; Low", "Low; High", "Normal; Normal", "None"]', 1, 'LAP is low in CML because the cells are malignant/dysfunctional. (Pocket Medicine)'),
    (v_topic_id, '102: CML can progress to which life-threatening phase?', '["Chronic phase", "Blast Crisis (AML or ALL)", "Remission", "None"]', 1, 'Requires immediate aggressive therapy. (Harrison''s Ch. 110)'),
    (v_topic_id, '103: "Chronic Lymphocytic Leukemia" (CLL) is characterized by the accumulation of mature-appearing ____.', '["Neutrophils", "B-cells", "T-cells", "Plasma cells"]', 1, 'The most common leukemia in adults in the West. (Step-Up)'),
    (v_topic_id, '104: "Smudge cells" on a peripheral smear are characteristic of:', '["AML", "CLL", "CML", "ALL"]', 1, 'Fragile lymphocytes burst during the smear preparation. (Pocket Medicine)'),
    (v_topic_id, '105: "Richter Transformation" refers to CLL progressing into:', '["AML", "Diffuse Large B-cell Lymphoma (DLBCL)", "Hodgkin Lymphoma", "None"]', 1, 'Presents with sudden lymph node enlargement and fever. (Harrison''s Ch. 110)'),
    (v_topic_id, '106: "Hairy Cell Leukemia" is a mature B-cell neoplasm that presents with massive splenomegaly and ____.', '["High WBC", "Pancytopenia (dry tap on marrow)", "High platelets", "Cough"]', 1, 'Cells have "hairy" projections and are TRAP-positive. (Step-Up)'),
    (v_topic_id, '107: What is the treatment of choice for Hairy Cell Leukemia?', '["Imatinib", "Cladribine (2-CdA)", "Steroids", "Rituximab only"]', 1, 'Very high response rates. (Pocket Medicine)'),
    (v_topic_id, '108: Most patients with CLL are diagnosed ____ on routine blood work.', '["After severe bleeding", "Incidentally (asymptomatic lymphocytosis)", "After bone fractures", "None"]', 1, 'Often managed with "watchful waiting" if asymptomatic. (Harrison''s Ch. 110)');

    -- SECTION 12: MYELOPROLIFERATIVE NEOPLASMS (MPN)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '109: "Polycythemia Vera" (PV) is caused by a mutation in ____ in >95% of cases.', '["BCR-ABL", "JAK2 (V617F)", "BRAF", "c-MYC"]', 1, 'Leads to uncontrolled RBC production. (Harrison''s Ch. 110)'),
    (v_topic_id, '110: "Aquagenic pruritus" (itching after a hot shower) is a classic symptom of:', '["Liver disease", "Polycythemia Vera", "Diabetes", "Cancer"]', 1, 'Due to mast cell degranulation. (Step-Up)'),
    (v_topic_id, '111: "Essential Thrombocythemia" (ET) is characterized by isolated ____.', '["Anemia", "Thrombocytosis (high platelets)", "Leukopenia", "High RBCs"]', 1, 'Also often associated with JAK2 mutations. (Pocket Medicine)'),
    (v_topic_id, '112: "Primary Myelofibrosis" is characterized by marrow fibrosis and ____ cells on peripheral smear.', '["Bite", "Tear-drop RBCs (Dacrocytes)", "Target", "Smudge"]', 1, '"Cells crying because the marrow is scarred." (Harrison''s Ch. 110)'),
    (v_topic_id, '113: Erythropoietin (EPO) levels in Polycythemia Vera are typically:', '["High", "Low", "Normal", "Variable"]', 1, 'The production is autonomous, suppressing EPO. (Step-Up)'),
    (v_topic_id, '114: "Secondary Polycythemia" (high RBCs but high EPO) can be caused by:', '["Smoking/Hypoxia", "Renal Cell Carcinoma (EPO-secreting)", "Sleep Apnea", "All of the above"]', 3, 'The kidney thinks it needs more oxygen capacity. (Pocket Medicine)'),
    (v_topic_id, '115: What is the first-line treatment for Polycythemia Vera?', '["Chemotherapy", "Phlebotomy and Aspirin", "Radiation", "Surgery"]', 1, 'Hydroxyurea is added for high-risk patients. (Harrison''s Ch. 110)'),
    (v_topic_id, '116: ET and Myelofibrosis also carry an increased risk of transformation to:', '["CML", "Acute Myeloid Leukemia (AML)", "Lymphoma", "None"]', 1, 'Known as "spent phase." (Step-Up)'),
    (v_topic_id, '117: "Hyperviscosity Syndrome" (headache, blurred vision) in MPNs is due to:', '["High sugar", "High cell counts (high Hct or Platelets)", "Infection", "None"]', 1, 'Blood is too "thick" to flow smoothly. (Pocket Medicine)'),
    (v_topic_id, '118: "Erythromelalgia" (burning pain and redness in hands/feet) is a feature of ET and PV, treated with:', '["Steroids", "Aspirin", "Antibiotics", "Water"]', 1, 'Due to microvascular occlusion. (Harrison''s Ch. 110)');

    -- SECTION 13: PLASMA CELL DYSCRASIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '119: "Multiple Myeloma" (MM) is a malignancy of which cell type?', '["B-cells", "Plasma cells", "T-cells", "Stem cells"]', 1, 'Produces a monoclonal (M) protein. (Harrison''s Ch. 111)'),
    (v_topic_id, '120: The "CRAB" criteria for Multiple Myeloma stand for Calcium (high), Renal failure, Anemia, and:', '["Brain tumor", "Bone lesions (lytic)", "Bleeding", "Bronchospasm"]', 1, 'Lytic lesions caused by osteoclast activation. (Step-Up)'),
    (v_topic_id, '121: "Rouleaux formation" (RBCs stacked like coins) on a smear suggests:', '["Iron deficiency", "Multiple Myeloma", "Sickle cell", "Dehydration"]', 1, 'Due to high serum protein/paraproteins. (Pocket Medicine)'),
    (v_topic_id, '122: "Bence-Jones proteins" found in the urine are actually:', '["Albumin", "Monoclonal Free Light Chains", "Sugar", "Hemoglobin"]', 1, 'They are too small to be detected by standard dipstick (which checks for albumin). (Harrison''s Ch. 111)'),
    (v_topic_id, '123: "Monoclonal Gammopathy of Undetermined Significance" (MGUS) is defined by M-protein < 3g and marrow plasma cells < ____ %.', '["5", "10", "20", "50"]', 1, 'Requires monitoring as it can progress to MM. (Step-Up)'),
    (v_topic_id, '124: "Waldenstrom Macroglobulinemia" is a plasma cell disorder that exclusively produces which antibody?', '["IgG", "IgM", "IgA", "IgE"]', 1, 'Large IgM pentamers cause severe hyperviscosity. (Pocket Medicine)'),
    (v_topic_id, '125: Multiple Myeloma bone lesions are "lytic" and therefore do NOT show up on which imaging test?', '["X-ray", "Bone Scan (Nuclear medicine)", "CT", "MRI"]', 1, 'Bone scans detect osteoblastic activity; use Skeletal Survey (X-ray) instead. (Harrison''s Ch. 111)'),
    (v_topic_id, '126: "Amyloidosis (AL)" in MM is due to the deposition of:', '["Sugar", "Misfolded Light Chains", "Fibrin", "Collagen"]', 1, 'Can cause macroglossia, heart failure, and nephrotic syndrome. (Step-Up)'),
    (v_topic_id, '127: Renal failure in Multiple Myeloma is often due to "Myeloma Kidney," which is:', '["Infection", "Light Chain Cast Nephropathy", "Stones", "Diabetes"]', 1, 'Light chains are toxic to renal tubules. (Pocket Medicine)'),
    (v_topic_id, '128: What is the definitive treatment for fit patients with Multiple Myeloma?', '["Chemotherapy only", "Autologous Stem Cell Transplant", "Surgery", "Wait and watch"]', 1, 'Preceded by induction therapy (e.g., VRd). (Harrison''s Ch. 111)');

    -- SECTION 14: MYELODYSPLASTIC SYNDROME (MDS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '129: Myelodysplastic Syndrome (MDS) is a group of clonal disorders characterized by ____ hematopoiesis.', '["Overactive", "Ineffective/Dysplastic", "Normal", "Fast"]', 1, 'Common in elderly; "pre-leukemia." (Step-Up)'),
    (v_topic_id, '130: "Pseudo-Pelger-Huet anomaly" (bilobed neutrophils) is a classic finding in:', '["CLL", "MDS", "AML", "B12 deficiency"]', 1, 'Sign of myeloid dysplasia. (Pocket Medicine)'),
    (v_topic_id, '131: "5q- Syndrome" is a sub-type of MDS that typically responds well to:', '["Insulin", "Lenalidomide", "Chemotherapy", "Iron"]', 1, 'Unique genetic association. (Harrison''s Ch. 110)'),
    (v_topic_id, '132: The most serious risk of MDS is progression to:', '["Lymphoma", "Acute Myeloid Leukemia (AML)", "Myelofibrosis", "None"]', 1, 'Requires monitoring of blast percentage. (Step-Up)'),
    (v_topic_id, '133: "Ringed sideroblasts" in MDS suggest which sub-type?', '["MDS with excess blasts", "MDS with ring sideroblasts (MDS-RS)", "Del(5q)", "None"]', 1, 'Often associated with SF3B1 mutations. (Pocket Medicine)'),
    (v_topic_id, '134: MDS typically presents as macrocytic anemia and ____ in an elderly patient.', '["Weight gain", "Pancytopenia", "High WBC", "High sugar"]', 1, 'The marrow is cellular but the cells don''t make it out. (Harrison''s Ch. 110)'),
    (v_topic_id, '135: "Azacitidine" and "Decitabine" are used in MDS and work as:', '["Antibiotics", "Hypomethylating agents", "Hormones", "None"]', 1, 'Standard therapy for higher-risk MDS. (Step-Up)'),
    (v_topic_id, '136: A "dry tap" on bone marrow biopsy is common in Myelofibrosis and ____.', '["ALL", "Hairy Cell Leukemia", "CLL", "None"]', 1, 'Marrow is either too fibrotic or too packed. (Pocket Medicine)');

    -- SECTION 15: HEMATOLOGY REVIEW (LEUKOCYTES)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '137: "Neutrophilia" (High neutrophils) with a "Left Shift" (bands) is classic for:', '["Viral infection", "Bacterial infection", "Parasites", "Allergy"]', 1, 'The marrow is releasing immature cells to fight. (Step-Up)'),
    (v_topic_id, '138: "Eosinophilia" is a hallmark of "NAACP": Neoplasm, Allergy, Addison''s, Collagen vascular, and:', '["Parasites", "Pregnancy", "Pneumonia", "Pain"]', 0, 'High-yield mnemonic for eosinophilia. (Harrison''s Ch. 110)'),
    (v_topic_id, '139: "Atypical Lymphocytes" (Downey cells) are classic for:', '["Bacterial sepsis", "Infectious Mononucleosis (EBV)", "CLL", "Iron deficiency"]', 1, 'Reactive T-cells fighting the B-cell infection. (Pocket Medicine)'),
    (v_topic_id, '140: "Basophilia" is rare and should raise suspicion for a myeloproliferative disorder like:', '["ALL", "CML", "Anemia", "ITP"]', 1, 'Classic finding in the chronic phase of CML. (Step-Up)'),
    (v_topic_id, '141: "Dohle bodies" in neutrophils are signs of:', '["Cancer", "Severe infection or inflammation", "B12 deficiency", "Normal aging"]', 1, 'Blue, oval inclusions in the cytoplasm. (Pocket Medicine)'),
    (v_topic_id, '142: "Hypersegmented Neutrophils" = ?', '["Iron deficiency", "Megaloblastic Anemia (B12/Folate)", "Leukemia", "None"]', 1, 'Pathognomonic for impaired DNA synthesis. (Harrison''s Ch. 95)'),
    (v_topic_id, '143: "Leukopenia" + "Anemia" + "Thrombocytopenia" = ?', '["Hemolysis", "Pancytopenia (e.g., Aplastic anemia, Marrow infiltration)", "Infection", "None"]', 1, 'Requires bone marrow evaluation. (Step-Up)'),
    (v_topic_id, '144: "Bence-Jones" protein in urine = ?', '["Diabetes", "Multiple Myeloma", "Stones", "Normal"]', 1, 'Monoclonal light chains. (Pocket Medicine)'),
    (v_topic_id, '145: "Philadelphia chromosome" t(9;22) = ?', '["AML", "CML", "CLL", "ALL"]', 1, 'Also found in some ALL cases (bad prognosis). (Harrison''s Ch. 110)'),
    (v_topic_id, '146: "JAK2" mutation = ?', '["CML", "Myeloproliferative Neoplasms (PV, ET, MF)", "Lymphoma", "None"]', 1, 'Constitutive activation of tyrosine kinase. (Step-Up)'),
    (v_topic_id, '147: "Smudge cells" = ?', '["ALL", "CLL", "CML", "AML"]', 1, 'Fragile CLL lymphocytes. (Pocket Medicine)'),
    (v_topic_id, '148: "Auer rods" = ?', '["ALL", "AML", "CML", "CLL"]', 1, 'Myeloblast granules. (Harrison''s Ch. 110)'),
    (v_topic_id, '149: "t(15;17)" = ?', '["ALL", "APL (AML M3)", "Burkitt", "Follicular"]', 1, 'APL with high risk of DIC. (Step-Up)'),
    (v_topic_id, '150: "Starry sky" pattern on biopsy = ?', '["Follicular", "Burkitt Lymphoma", "Hodgkin", "None"]', 1, 'Macrophages eating apoptotic cells. (Pocket Medicine)');

    -- SECTION 16: HEMATOLOGY POTPOURRI (176)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: "Aplastic Anemia" is defined by pancytopenia and ____ marrow.', '["Hypercellular", "Hypocellular (Fatty replacement)", "Fibrotic", "Bloody"]', 1, 'Often idiopathic or drug-induced. (Harrison''s Ch. 98)'),
    (v_topic_id, '152: Which medication is a common cause of drug-induced aplastic anemia?', '["Aspirin", "Chloramphenicol", "Penicillin", "Insulin"]', 1, 'Classic board association. (Step-Up)'),
    (v_topic_id, '153: "Fanconi Anemia" is an inherited form of aplastic anemia associated with:', '["Short stature and thumb abnormalities", "Vision loss", "Heart failure", "None"]', 0, 'Risk of progression to AML. (Pocket Medicine)'),
    (v_topic_id, '154: "Pure Red Cell Aplasia" (PRCA) is an isolated drop in RBCs often associated with:', '["Lung cancer", "Thymoma", "Liver failure", "Kidney failure"]', 1, 'RBC production stops; can also be caused by Parvovirus B19. (Harrison''s Ch. 98)'),
    (v_topic_id, '155: "Hemochromatosis" is iron overload. Primary type is due to mutations in:', '["HFE gene", "CFTR", "ATP7B", "None"]', 0, 'Autosomal recessive; leads to "Bronze Diabetes." (Step-Up)'),
    (v_topic_id, '156: "Phlebotomy" is the treatment of choice for:', '["Anemia", "Hemochromatosis and Polycythemia Vera", "Leukemia", "None"]', 1, 'Removes excess iron/RBCs. (Pocket Medicine)'),
    (v_topic_id, '157: "Wilson Disease" is a disorder of ____ metabolism, not iron.', '["Zinc", "Copper", "Magnesium", "Calcium"]', 1, 'Associated with Kayser-Fleischer rings. (Harrison''s Ch. 339)'),
    (v_topic_id, '158: "Gaucher Disease" is a lysosomal storage disorder that presents with splenomegaly and ____ cells.', '["Target", "Crumpled tissue paper (Gaucher cells)", "Heinz", "None"]', 1, 'Due to glucocerebrosidase deficiency. (Step-Up)'),
    (v_topic_id, '159: "Porphyria Cutanea Tarda" (PCT) is the most common porphyria and presents with:', '["Abdominal pain only", "Skin blisters on sun-exposed areas", "Blindness", "None"]', 1, 'Associated with Hepatitis C and iron overload. (Pocket Medicine)'),
    (v_topic_id, '160: "Acute Intermittent Porphyria" (AIP) presents with the "5 Ps": Painful abdomen, Polyneuropathy, Psychosis, Pink urine, and:', '["Pneumonia", "Precipitated by drugs (e.g., P450 inducers)", "Palpitations", "None"]', 1, 'Due to deficiency of porphobilinogen deaminase. (Harrison''s Ch. 415)'),
    (v_topic_id, '161: "Splenomegaly" is a hallmark of Myelofibrosis and which leukemia?', '["CML", "ALL", "CLL", "AML"]', 0, 'The spleen takes over hematopoiesis (extramedullary). (Step-Up)'),
    (v_topic_id, '162: "Pruritus after showering" = ?', '["Lupus", "Polycythemia Vera", "Diabetes", "Liver failure"]', 1, 'Classic PV symptom. (Pocket Medicine)'),
    (v_topic_id, '163: "Lytic bone lesions" + "Hypercalcemia" = ?', '["Bone cancer", "Multiple Myeloma", "Hypoparathyroidism", "None"]', 1, 'Standard MM presentation. (Harrison''s Ch. 111)'),
    (v_topic_id, '164: "Low LAP score" = ?', '["Leukemoid reaction", "Chronic Myeloid Leukemia (CML)", "Infection", "None"]', 1, 'Distinguishes CML from reactive high WBC. (Step-Up)'),
    (v_topic_id, '165: "High LAP score" = ?', '["CML", "Leukemoid Reaction (infection/stress)", "AML", "None"]', 1, 'Mature neutrophils are functional. (Pocket Medicine)'),
    (v_topic_id, '166: "Target cells" are seen in Thalassemia, Liver disease, and ____.', '["Sickle Cell and Asplenia", "Iron deficiency", "B12 deficiency", "None"]', 0, 'Excess membrane relative to volume. (Harrison''s Ch. 94)'),
    (v_topic_id, '167: "Spherocytes" + "Positive Coombs" = ?', '["Hereditary Spherocytosis", "Autoimmune Hemolytic Anemia (AIHA)", "G6PD", "None"]', 1, 'Antibodies are coating the cells. (Step-Up)'),
    (v_topic_id, '168: "Spherocytes" + "Negative Coombs" = ?', '["AIHA", "Hereditary Spherocytosis", "Thalassemia", "None"]', 1, 'Intrinsic membrane defect. (Pocket Medicine)'),
    (v_topic_id, '169: "Schistocytes" = ?', '["MAHA (TTP/HUS/DIC)", "Sickle cell", "Target cells", "None"]', 0, 'Fragmented RBCs. (Harrison''s Ch. 122)'),
    (v_topic_id, '170: "Bite cells" = ?', '["Spherocytosis", "G6PD Deficiency", "Leukemia", "None"]', 1, 'Due to splenic "pitting" of Heinz bodies. (Step-Up)'),
    (v_topic_id, '171: "Basophilic stippling" = ?', '["Lead Poisoning and Thalassemias", "Iron deficiency", "B12", "None"]', 0, 'Aggregated ribosomes. (Pocket Medicine)'),
    (v_topic_id, '172: "Howell-Jolly bodies" = ?', '["Splenectomy or Functional Asplenia", "Iron deficiency", "Lead poisoning", "None"]', 0, 'Nuclear remnants. (Harrison''s Ch. 110)'),
    (v_topic_id, '173: "Teardrop cells" = ?', '["Multiple Myeloma", "Myelofibrosis", "Iron deficiency", "None"]', 1, 'RBCs squeezed out of fibrotic marrow. (Step-Up)'),
    (v_topic_id, '174: "Pappenheimer bodies" = ?', '["Lead poisoning", "Sideroblastic Anemia", "B12", "None"]', 1, 'Iron-containing granules. (Pocket Medicine)'),
    (v_topic_id, '175: "Rouleaux" = ?', '["Sickle cell", "Multiple Myeloma", "Spherocytosis", "None"]', 1, 'Coin-stack appearance. (Harrison''s Ch. 111)'),
    (v_topic_id, '176: "Acanthocytes" (Spur cells) = ?', '["Diabetes", "Liver disease (Cirrhosis) or Abetalipoproteinemia", "Iron deficiency", "None"]', 1, 'Irregular thorny projections. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Hematology/Oncology MCQ Part 2 (89-176) registered.';
END $$;

COMMIT;
