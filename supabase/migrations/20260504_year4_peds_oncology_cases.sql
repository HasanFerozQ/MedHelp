BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Pediatric Oncology Essentials
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-oncology' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-oncology" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acute Lymphoblastic Leukemia - ALL (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Most Common Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Most Common Cancer', 'A 4-year-old child presents with persistent fever, pallor, easy bruising, and refusal to walk due to leg pain.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old child presents with persistent fever, pallor, easy bruising, and refusal to walk due to leg pain.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignancy in childhood?', '["Neuroblastoma", "Acute Lymphoblastic Leukemia (ALL)", "Wilms Tumor", "Brain Tumor"]', 1, 'ALL accounts for approximately 25-30% of all childhood cancers.'),
    (v_case_id, 'What is the hallmark finding on a peripheral blood smear in ALL?', '["Auer rods", "Lymphoblasts", "Reed-Sternberg cells", "None"]', 1, 'The presence of blasts in the blood or marrow is diagnostic.'),
    (v_case_id, 'Why does the child have leg pain?', '["Growing pains", "Bone marrow expansion and leukemic infiltration of the periosteum", "Arthritis", "None"]', 1, 'Bone pain is a frequent presenting symptom of leukemia due to the crowded marrow.');

    ---------------------------------------------------------------------------
    -- CASE 02: ALL - Prognostic Factors (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Risk Stratification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Risk Stratification', 'A newly diagnosed ALL patient is being categorized into a risk group.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Risk Stratification', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which age group has the BEST prognosis for ALL?', '["< 1 year", "1 to 9 years", "> 10 years", "None"]', 1, 'Children between 1 and 9 years old have significantly better outcomes than infants or adolescents.'),
    (v_case_id, 'What initial White Blood Cell (WBC) count is a favorable prognostic factor?', '["< 50,000/mm3", "> 100,000/mm3", "> 200,000/mm3", "None"]', 0, 'Lower WBC count at diagnosis is associated with better response to therapy.'),
    (v_case_id, 'Which cytogenetic finding is associated with an excellent prognosis in ALL?', '["Philadelphia chromosome t(9;22)", "Trisomy 4 and 10 or t(12;21)", "Hypodiploidy", "None"]', 1, 'Hyperdiploidy and t(12;21) [TEL-AML1] carry a very good prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 03: ALL - Sanctuary Sites (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hiding Places' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hiding Places', 'A child in remission from ALL is receiving prophylactic treatment to prevent relapse.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hiding Places', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two primary \"sanctuary sites\" for leukemic cells in ALL?', '["Lungs and Liver", "Central Nervous System (CNS) and Testes", "Bones and Skin", "None"]', 1, 'Systemic chemotherapy often has poor penetration into these areas, requiring specific prophylactic treatment.'),
    (v_case_id, 'How is CNS prophylaxis typically administered?', '["Oral pills", "Intrathecal (IT) chemotherapy (e.g., Methotrexate)", "Radiation only", "None"]', 1, 'Chemotherapy is injected directly into the CSF via lumbar puncture.'),
    (v_case_id, 'What physical exam finding should be checked in boys during ALL follow-up?', '["Lump in neck", "Painless testicular enlargement", "Rash", "None"]', 1, 'Testicular relapse presents as hard, painless swelling.');

    ---------------------------------------------------------------------------
    -- CASE 04: Acute Myeloid Leukemia - AML (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Myeloid Blasts' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Myeloid Blasts', 'A 10-year-old with down syndrome presents with bleeding gums and fatigue.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Myeloid Blasts', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathognomonic finding within the cytoplasm of AML blasts?', '["Reed-Sternberg cells", "Auer rods", "Heinz bodies", "None"]', 1, 'Auer rods are crystalized granules seen in myeloid leukemia.'),
    (v_case_id, 'Which type of AML (FAB classification) is specifically associated with infants and children with Down Syndrome?', '["M1", "M7 (Megakaryoblastic)", "M3 (Promyelocytic)", "None"]', 1, 'Down syndrome patients have an increased risk of AML-M7 and a very good response to therapy in that context.'),
    (v_case_id, 'What is a life-threatening complication associated with AML-M3 (Promyelocytic)?', '["Liver failure", "Disseminated Intravascular Coagulation (DIC)", "Asthma", "None"]', 1, 'The release of procoagulants from promyelocytes triggers DIC.');

    ---------------------------------------------------------------------------
    -- CASE 05: Tumor Lysis Syndrome - TLS (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Metabolic Collapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Metabolic Collapse', 'A child with a high-burden lymphoma begins chemotherapy and develops sudden renal failure.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Metabolic Collapse', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What electrolyte abnormalities define Tumor Lysis Syndrome?', '["Low K, Low P, High Ca", "Hyperkalemia, Hyperphosphatemia, Hyperuricemia, and Hypocalcemia", "Normal labs", "None"]', 1, 'Rapid cell breakdown releases K, P, and nucleic acids (uric acid); P binds Ca, causing low levels.'),
    (v_case_id, 'What is the primary cause of renal failure in TLS?', '["Dehydration", "Precipitation of uric acid and calcium-phosphate crystals in the renal tubules", "Infection", "None"]', 1, 'Crystal nephropathy blocks the kidneys.'),
    (v_case_id, 'What medication is used to rapidly lower extremely high uric acid levels?', '["Allopurinol", "Rasburicase (Recombinant Urate Oxidase)", "Aspirin", "None"]', 1, 'Rasburicase converts uric acid into allantoin, which is highly soluble and easily excreted.');

    ---------------------------------------------------------------------------
    -- CASE 06: Wilms Tumor - Nephroblastoma (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flank Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flank Mass', 'A 3-year-old is noted by her mother to have a firm, painless mass on the right side of her abdomen.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-year-old is noted by her mother to have a firm, painless mass on the right side of her abdomen.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does a Wilms Tumor typically cross the midline?', '["Yes", "No, it is usually a localized flank mass that does not cross the midline", "Always", "None"]', 1, 'This is a key clinical distinction from neuroblastoma.'),
    (v_case_id, 'What is the most common associated physical finding in Wilms Tumor?', '["Diarrhea", "Hypertension (due to renin production or renal artery compression)", "Rash", "None"]', 1, 'Up to 25% of patients have elevated blood pressure.'),
    (v_case_id, 'What is the \"W\" in the WAGR syndrome associated with Wilms?', '["Weight loss", "Wilms Tumor (the others are Aniridia, Genitourinary anomalies, and Range of developmental delay)", "Water", "None"]', 1, 'WAGR is a microdeletion syndrome involving the WT1 gene.');

    ---------------------------------------------------------------------------
    -- CASE 07: Neuroblastoma (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Midline Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Midline Mass', 'An 18-month-old has a firm, irregular abdominal mass that crosses the midline and \"dancing eyes/dancing feet\" (opsoclonus-myoclonus).', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-month-old has a firm, irregular abdominal mass that crosses the midline and \"dancing eyes/dancing feet\" (opsoclonus-myoclonus).', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What tissue does Neuroblastoma arise from?', '["Kidney", "Neural Crest cells (Sympathetic nervous system)", "Muscle", "None"]', 1, 'It can occur anywhere along the sympathetic chain, most commonly the adrenal gland.'),
    (v_case_id, 'What urinary markers are used to screen for and monitor Neuroblastoma?', '["Glucose", "Catecholamine metabolites (VMA and HVA)", "Protein", "None"]', 1, 'Most neuroblastomas secrete vanillylmandelic acid (VMA) and homovanillic acid (HVA).'),
    (v_case_id, 'What imaging finding is classic for Neuroblastoma on CT?', '["Cystic mass", "Stippled calcifications", "Clear borders", "None"]', 1, 'Calcifications are present in about 80-90% of cases.');

    ---------------------------------------------------------------------------
    -- CASE 08: Hodgkin Lymphoma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painless Adenopathy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painless Adenopathy', 'A 15-year-old male has a firm, painless lump in his neck and has been having night sweats and weight loss.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Painless Adenopathy', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are \"B symptoms\" in lymphoma?', '["Bruising, Bleeding, Bone pain", "Fever, Night sweats, and Weight loss (> 10%)", "Big belly, Big head", "None"]', 1, 'B symptoms indicate a more systemic disease and carry a different prognosis.'),
    (v_case_id, 'What is the characteristic cell seen on biopsy in Hodgkin Lymphoma?', '["Blast", "Reed-Sternberg cell (\"Owl''s eye\" appearance)", "Auer rod", "None"]', 1, 'These are malignant B-cells with two nuclei.'),
    (v_case_id, 'Which virus is frequently associated with Hodgkin Lymphoma?', '["RSV", "Epstein-Barr Virus (EBV)", "HPV", "None"]', 1, 'EBV genome is found in the RS cells of many patients.');

    ---------------------------------------------------------------------------
    -- CASE 09: Burkitt Lymphoma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fastest Growing Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fastest Growing Tumor', 'A child presents with a massive, rapidly growing jaw mass (African type) or abdominal mass (Sporadic type).', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fastest Growing Tumor', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic microscopic appearance of Burkitt Lymphoma?', '["Clear cells", "\"Starry sky\" pattern", "Glandular", "None"]', 1, 'The pattern is created by pale macrophages (the stars) against a background of dark malignant B-cells (the sky).'),
    (v_case_id, 'What chromosomal translocation is diagnostic for Burkitt?', '["t(9;22)", "t(8;14) involving the c-myc oncogene", "t(11;22)", "None"]', 1, 'Overexpression of c-myc drives extremely rapid cell division.'),
    (v_case_id, 'Why is this patient at extreme risk for Tumor Lysis Syndrome?', '["The tumor is small", "Very high cell turnover and rapid response to chemotherapy", "No reason", "None"]', 1, 'Massive numbers of cells die simultaneously, releasing their contents.');

    ---------------------------------------------------------------------------
    -- CASE 10: Retinoblastoma (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The White Reflex' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The White Reflex', 'A mother notices a white glow in her child''s eye in a flash photograph.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The White Reflex', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the medical term for a white pupillary reflex?', '["Myopia", "Leukocoria", "Strabismus", "None"]', 1, 'Leukocoria is the most common presenting sign of retinoblastoma.'),
    (v_case_id, 'What gene is mutated in this condition?', '["p53", "RB1 (Tumor suppressor gene)", "WT1", "None"]', 1, 'Retinoblastoma is the classic model for Knudson''s \"two-hit\" hypothesis.'),
    (v_case_id, 'Patients with the HEREDITARY (bilateral) form are at high risk for what secondary cancer later in life?', '["Leukemia", "Osteosarcoma", "Colon cancer", "None"]', 1, 'The RB1 mutation is present in all cells, increasing the risk of other tumors, particularly bone tumors.');

    ---------------------------------------------------------------------------
    -- CASE 11: Medulloblastoma (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infratentorial Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infratentorial Mass', 'A 6-year-old has morning headaches, vomiting, and new-onset ataxia (unsteadiness).', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infratentorial Mass', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where are the majority of pediatric brain tumors located?', '["Supratentorial", "Infratentorial (Posterior fossa)", "Spinal cord", "None"]', 1, 'Unlike adults, 60-70% of pediatric brain tumors are in the posterior fossa.'),
    (v_case_id, 'What is the most common malignant brain tumor in children?', '["Astrocytoma", "Medulloblastoma", "Ependymoma", "None"]', 1, 'It arises in the cerebellum and can obstruct the 4th ventricle.'),
    (v_case_id, 'What is \"drop metastasis\" in medulloblastoma?', '["Falling down", "Spread of tumor cells through the CSF to the spinal cord", "Ear infection", "None"]', 1, 'Complete staging requires MRI of the entire neuraxis (brain and spine).');

    ---------------------------------------------------------------------------
    -- CASE 12: Pilocytic Astrocytoma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Most Common Brain Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Most Common Brain Tumor', 'An MRI shows a cystic lesion with a bright mural nodule in the cerebellum.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Most Common Brain Tumor', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Medulloblastoma", "Pilocytic Astrocytoma", "Glioblastoma", "None"]', 1, 'This is the most common brain tumor overall in children and is typically WHO Grade I (benign).'),
    (v_case_id, 'What is the hallmark finding on biopsy?', '["Auer rods", "Rosenthal fibers (corkscrew-shaped eosinophilic bundles)", "Reed-Sternberg", "None"]', 1, 'Rosenthal fibers are characteristic of pilocytic astrocytoma.'),
    (v_case_id, 'What is the prognosis for a completely resected cerebellar astrocytoma?', '["Poor", "Excellent (often curative)", "Average", "None"]', 1, 'Low-grade astrocytomas have a very high survival rate.');

    ---------------------------------------------------------------------------
    -- CASE 13: Craniopharyngioma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Suprasellar Issues' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Suprasellar Issues', 'A child has short stature, polyuria/polydipsia, and a bitemporal hemianopsia (loss of outer vision).', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Suprasellar Issues', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is this tumor located?', '["Posterior fossa", "Suprasellar region (above the pituitary)", "Liver", "None"]', 1, 'It arises from remnants of Rathke''s pouch.'),
    (v_case_id, 'What classic imaging finding is seen in craniopharyngioma?', '["No calcification", "Calcifications (often with cystic and solid components)", "Clear fluid", "None"]', 1, 'Calcification is a very strong clue in a suprasellar pediatric mass.'),
    (v_case_id, 'Why does the child have vision loss?', '["Eye infection", "Compression of the optic chiasm", "Brain swelling", "None"]', 1, 'Pressure on the chiasm causes the classic field defect.');

    ---------------------------------------------------------------------------
    -- CASE 14: Osteosarcoma (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sunburst Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sunburst Bone', 'A 14-year-old has localized bone pain at the distal femur and an X-ray shows a \"sunburst\" pattern of bone formation.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sunburst Bone', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Ewing Sarcoma", "Osteosarcoma", "Growing pains", "None"]', 1, 'Osteosarcoma is the most common primary bone tumor in adolescents.'),
    (v_case_id, 'What is the \"Codman Triangle\"?', '["A shape in the bone", "Elevation of the periosteum by the tumor, creating a triangular shape at the edge", "A break", "None"]', 1, 'It is a sign of an aggressive, rapidly growing bone lesion.'),
    (v_case_id, 'Where does Osteosarcoma most commonly occur?', '["Mid-shaft", "Metaphysis of long bones (near the growth plate)", "Spine", "None"]', 1, 'The distal femur and proximal tibia (around the knee) are the most frequent sites.');

    ---------------------------------------------------------------------------
    -- CASE 15: Ewing Sarcoma (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Onion Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Onion Skin', 'A 10-year-old has bone pain, fever, and a mid-shaft femoral lesion with \"onion-skin\" periosteal reaction.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Onion Skin', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic chromosomal translocation for Ewing Sarcoma?', '["t(9;22)", "t(11;22) [EWS-FLI1]", "t(8;14)", "None"]', 1, 'This translocation is found in nearly all cases.'),
    (v_case_id, 'Where in the bone does Ewing Sarcoma typically arise?', '["Metaphysis", "Diaphysis (Mid-shaft)", "Epiphysis", "None"]', 1, 'Unlike osteosarcoma, it favors the long bone shafts and flat bones (pelvis).'),
    (v_case_id, 'What is the \"onion-skinning\" appearance?', '["Crystals", "Multilayered periosteal reaction", "Bleeding", "None"]', 1, 'It represents the body''s attempt to contain the expanding tumor.');

    ---------------------------------------------------------------------------
    -- CASE 16: Febrile Neutropenia (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Oncology Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Oncology Emergency', 'A child on chemotherapy has a temperature of 101.5F and an Absolute Neutrophil Count (ANC) of 200.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Oncology Emergency', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the ANC calculated?', '["WBC x 100", "WBC x (% Neutrophils + % Bands)", "WBC / 2", "None"]', 1, 'The ANC represents the real number of infection-fighting cells.'),
    (v_case_id, 'What is the immediate priority for a patient with febrile neutropenia?', '["Wait for cultures", "Broad-spectrum IV antibiotics within 60 minutes", "Aspirin", "None"]', 1, 'Infection in a neutropenic patient can progress to septic shock very rapidly.'),
    (v_case_id, 'What antibiotic coverage must be included?', '["Antiviral", "Anti-pseudomonal coverage (e.g., Cefepime, Ceftazidime, or Piperacillin-Tazobactam)", "Antifungal", "None"]', 1, 'Pseudomonas is a high-risk pathogen in this population.');

    ---------------------------------------------------------------------------
    -- CASE 17: Rhabdomyosarcoma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Soft Tissue Sarcoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Soft Tissue Sarcoma', 'A 5-year-old has a painless, enlarging mass in the orbit or a \"cluster of grapes\" mass protruding from the vagina (Sarcoma botryoides).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Soft Tissue Sarcoma', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common soft tissue sarcoma in children?', '["Osteosarcoma", "Rhabdomyosarcoma", "Lipoma", "None"]', 1, 'It arises from mesenchymal cells that normally form striated muscle.'),
    (v_case_id, 'What are the two main histological types?', '["Small and Big", "Embryonal and Alveolar", "Clear and Dark", "None"]', 1, 'Embryonal is more common and generally carries a better prognosis.'),
    (v_case_id, 'What is the most common location for Rhabdomyosarcoma?', '["Legs", "Head and Neck (Orbit, nasopharynx)", "Brain", "None"]', 1, 'The orbit and GU tract are also frequent sites.');

    ---------------------------------------------------------------------------
    -- CASE 18: Anthracycline Toxicity (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Heart', 'A patient receiving Doxorubicin is undergoing regular echocardiograms.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Heart', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific toxicity of Anthracyclines (e.g., Doxorubicin, Daunorubicin)?', '["Liver failure", "Dose-dependent Cardiotoxicity (dilated cardiomyopathy)", "Lung scarring", "None"]', 1, 'They can cause permanent damage to the heart muscle.'),
    (v_case_id, 'What is the key factor in the risk of heart damage?', '["Age", "Cumulative lifetime dose", "Gender", "None"]', 1, 'The risk increases significantly as the total amount of drug given increases.'),
    (v_case_id, 'What medication can be given to protect the heart during anthracycline therapy?', '["Aspirin", "Dexrazoxane", "Digoxin", "None"]', 1, 'It is an iron chelator that reduces free-radical-induced cardiac damage.');

    ---------------------------------------------------------------------------
    -- CASE 19: Vincristine Toxicity (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Nerve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Nerve', 'A child on vincristine develops constipation and difficulty walking (foot drop).', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Nerve', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic toxicity of Vincristine?', '["Heart failure", "Peripheral and Autonomic Neuropathy", "Bone marrow suppression", "None"]', 1, 'Vincristine is \"marrow sparing\" but is very toxic to nerves.'),
    (v_case_id, 'What is a common autonomic nervous system side effect?', '["Diarrhea", "Adynamic ileus (severe constipation)", "Fever", "None"]', 1, 'Constipation is almost universal and can progress to ileus.'),
    (v_case_id, 'What is the mechanism of action of vinca alkaloids?', '["DNA binding", "Microtubule inhibition (arresting mitosis in metaphase)", "Folic acid block", "None"]', 1, 'They prevent the formation of the mitotic spindle.');

    ---------------------------------------------------------------------------
    -- CASE 20: Cyclophosphamide Toxicity (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Bladder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Bladder', 'A child receiving high-dose cyclophosphamide has blood in their urine.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Bladder', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific toxicity of Cyclophosphamide?', '["Kidney failure", "Hemorrhagic Cystitis", "Bladder cancer only", "None"]', 1, 'The metabolite acrolein irritates the bladder lining, causing bleeding.'),
    (v_case_id, 'What medication is given with cyclophosphamide to prevent this?', '["Epinephrine", "MESNA (2-mercaptoethane sulfonate sodium)", "Tylenol", "None"]', 1, 'MESNA binds to acrolein in the bladder and neutralizes it.'),
    (v_case_id, 'Besides MESNA, what else is required during high-dose therapy?', '["Sugar", "Aggressive hydration to flush the bladder", "Nothing", "None"]', 1, 'Diluting the urine reduces the concentration of the irritating metabolite.');

    ---------------------------------------------------------------------------
    -- CASE 21: Langerhans Cell Histiocytosis - LCH (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bone Hole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bone Hole', 'A child has a painful lump on the skull; X-ray shows a well-defined \"punched-out\" lytic lesion. He also has a seborrheic-like rash on the scalp.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bone Hole', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Osteosarcoma", "Langerhans Cell Histiocytosis (LCH)", "Eczema", "None"]', 1, 'LCH is a proliferation of abnormal histiocytes.'),
    (v_case_id, 'What are the characteristic electron microscopy findings in LCH?', '["Auer rods", "Birbeck granules (\"Tennis racket\" shape)", "Ribosomes", "None"]', 1, 'Birbeck granules are pathognomonic.'),
    (v_case_id, 'What is the classic triad of Hand-Schüller-Christian disease (a form of LCH)?', '["Fever, Rash, Cough", "Bone lesions, Exophthalmos, and Diabetes Insipidus", "Small, Blue, Limp", "None"]', 1, 'Involvement of the pituitary stalk causes DI.');

    ---------------------------------------------------------------------------
    -- CASE 22: Hepatoblastoma (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Liver Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Liver Mass', 'A 2-year-old has an enlarging upper abdominal mass and a very high Alpha-Fetoprotein (AFP).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Liver Mass', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Wilms", "Hepatoblastoma", "Neuroblastoma", "None"]', 1, 'Hepatoblastoma is the most common primary liver tumor in children.'),
    (v_case_id, 'What overgrowth syndrome is associated with Hepatoblastoma?', '["Down", "Beckwith-Wiedemann Syndrome", "Turner", "None"]', 1, 'Patients with BWS (macroglossia, hemihyperplasia) require regular AFP screening.'),
    (v_case_id, 'What other abdominal cancer are BWS patients at risk for?', '["Neuroblastoma", "Wilms Tumor", "Burkitt", "None"]', 1, 'The screening protocol for BWS covers both Wilms and Hepatoblastoma.');

    ---------------------------------------------------------------------------
    -- CASE 23: Superior Mediastinal Syndrome - SMS (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chest Compression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chest Compression', 'A 10-year-old with a new mediastinal mass presents with facial swelling, difficulty breathing, and stridor.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chest Compression', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate concern?', '["Infection", "Airway and SVC compression (Superior Mediastinal Syndrome)", "Dehydration", "None"]', 1, 'Large masses (often T-cell ALL or Lymphoma) can compress the trachea and superior vena cava.'),
    (v_case_id, 'Why is sedation/anesthesia extremely dangerous for these patients?', '["They get sleepy", "Loss of muscle tone can lead to complete airway collapse by the mass", "No reason", "None"]', 1, 'Always avoid supine positioning and sedation if possible.'),
    (v_case_id, 'What type of lymphoma most commonly causes an anterior mediastinal mass in an adolescent?', '["Burkitt", "T-cell Lymphoblastic Lymphoma", "Hodgkin", "None"]', 1, 'T-cell lymphoma presents in the thymus (anterior mediastinum).');

    ---------------------------------------------------------------------------
    -- CASE 24: Spinal Cord Compression (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Weakness', 'A child with metastatic neuroblastoma has new-onset back pain, leg weakness, and urinary incontinence.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Weakness', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Polio", "Spinal Cord Compression", "Growing pains", "None"]', 1, 'This is a neurological emergency requiring immediate action to prevent permanent paralysis.'),
    (v_case_id, 'What is the initial medical management to reduce cord edema?', '["Aspirin", "High-dose Dexamethasone", "Antibiotics", "None"]', 1, 'Steroids provide temporary decompression of the spinal cord.'),
    (v_case_id, 'What is the gold standard imaging test for suspected cord compression?', '["X-ray", "MRI of the entire spine", "CT brain", "None"]', 1, 'MRI provides the best visualization of the spinal canal and tumor interface.');

    ---------------------------------------------------------------------------
    -- CASE 25: Nausea and Vomiting (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Supportive Care - GI' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Supportive Care - GI', 'A child is receiving highly emetogenic chemotherapy (e.g., Cisplatin).', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supportive Care - GI', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line class of antiemetics for chemotherapy-induced nausea?', '["Antacids", "5-HT3 Receptor Antagonists (e.g., Ondansetron)", "Antibiotics", "None"]', 1, 'Zofran and similar drugs are highly effective.'),
    (v_case_id, 'What is \"Anticipatory Emesis\"?', '["Vomiting after chemo", "Nausea/vomiting that occurs BEFORE chemo due to psychological conditioning", "Hunger", "None"]', 1, 'Patients can vomit just by seeing the hospital or the nurse.'),
    (v_case_id, 'Which drug class is often added to Ondansetron for refractory vomiting?', '["Steroids (e.g., Dexamethasone)", "Vitamins", "Water", "None"]', 0, 'Steroids have a synergistic antiemetic effect.');

    ---------------------------------------------------------------------------
    -- CASE 26: L-Asparaginase Toxicity (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Enzymes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Enzymes', 'A patient on ALL therapy develops sudden-onset abdominal pain and a low fibrinogen.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Enzymes', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two major toxicities of L-Asparaginase?', '["Heart and Lung", "Pancreatitis and Thrombosis (due to low Antithrombin III)", "Kidney and Liver", "None"]', 1, 'It depletes asparagine, which affects protein synthesis in the pancreas and liver.'),
    (v_case_id, 'What is a common allergic side effect of this drug?', '["Fever", "Anaphylaxis", "Itch", "None"]', 1, 'Hypersensitivity reactions are frequent, as the enzyme is often derived from bacteria (E. coli).'),
    (v_case_id, 'Why is thrombosis a risk?', '["Too many platelets", "Decrease in pro-coagulant and anti-coagulant proteins (like Protein C/S and ATIII)", "No reason", "None"]', 1, 'The drug impairs the liver''s ability to produce clotting and anti-clotting factors.');

    ---------------------------------------------------------------------------
    -- CASE 27: Cisplatin Toxicity (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Hearing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Hearing', 'A child is being treated for medulloblastoma with Cisplatin.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Hearing', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two primary toxicities of Cisplatin?', '["Heart and Gut", "Ototoxicity (hearing loss) and Nephrotoxicity", "Skin and Hair", "None"]', 1, 'Cisplatin can cause permanent high-frequency hearing loss and kidney damage.'),
    (v_case_id, 'What screening is required for these patients?', '["Eye exam", "Audiometry and regular Renal function tests (BUN/Cr)", "Liver labs", "None"]', 1, 'Monitoring hearing is essential to adjust therapy if loss occurs.'),
    (v_case_id, 'What electrolyte abnormality is common with Cisplatin?', '["Hyperkalemia", "Hypomagnesemia", "High Sodium", "None"]', 1, 'Renal wasting of magnesium is a classic side effect.');

    ---------------------------------------------------------------------------
    -- CASE 28: Methotrexate Toxicity (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chemo Side Effects - Folate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chemo Side Effects - Folate', 'A patient receiving high-dose methotrexate has severe painful mouth sores.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chemo Side Effects - Folate', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Methotrexate?', '["DNA binding", "Dihydrofolate reductase (DHFR) inhibitor", "Cell wall block", "None"]', 1, 'It prevents the recycling of folate needed for DNA synthesis.'),
    (v_case_id, 'What is the term for the mouth sores?', '["Croup", "Mucositis", "Rash", "None"]', 1, 'Rapidly dividing cells in the GI tract are killed by methotrexate.'),
    (v_case_id, 'What medication is used as \"rescue\" therapy after high-dose methotrexate?', '["Folic acid", "Leucovorin (Folinic Acid)", "MESNA", "None"]', 1, 'Leucovorin provides a bypass for the blocked DHFR enzyme to save normal cells.');

    ---------------------------------------------------------------------------
    -- CASE 29: Germ Cell Tumors - Sacrococcygeal Teratoma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Mass', 'A neonate is born with a large mass protruding from the tailbone area.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neonatal Mass', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lipoma", "Sacrococcygeal Teratoma", "Spina Bifida", "None"]', 1, 'This is the most common germ cell tumor of the newborn.'),
    (v_case_id, 'Are most neonatal teratomas benign or malignant?', '["Malignant", "Usually Benign (Mature)", "Both", "None"]', 1, 'The majority found at birth are benign, but the risk of malignancy increases with age at diagnosis.'),
    (v_case_id, 'What is the treatment?', '["Pills", "Complete surgical resection including the coccyx", "None", "Wait"]', 1, 'Removal of the coccyx is required to prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 30: Li-Fraumeni Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cancer Family' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cancer Family', 'A child has an osteosarcoma; his mother had breast cancer at 25 and his uncle had a brain tumor at 30.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cancer Family', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What syndrome is likely in this family?', '["Down", "Li-Fraumeni Syndrome", "Turner", "None"]', 1, 'A hereditary cancer predisposition syndrome.'),
    (v_case_id, 'What gene is mutated in Li-Fraumeni?', '["RB1", "TP53 (The guardian of the genome)", "WT1", "None"]', 1, 'Loss of p53 function allows multiple different types of tumors to develop.'),
    (v_case_id, 'What are the classic tumors associated with this syndrome?', '["SBLA (Sarcoma, Breast, Leukemia, Adrenal gland)", "None", "Colon only", "None"]', 0, 'SBLA is a helpful mnemonic for Li-Fraumeni tumors.');

    ---------------------------------------------------------------------------
    -- CASE 31: Neurofibromatosis Type 1 - NF1 (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Café-au-lait Spots' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Café-au-lait Spots', 'A child has multiple brown birthmarks and freckling in the armpits.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Café-au-lait Spots', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What specific tumor of the visual system is associated with NF1?', '["Retinoblastoma", "Optic Pathway Glioma", "Cataract", "None"]', 1, 'Optic gliomas occur in about 15% of NF1 patients.'),
    (v_case_id, 'What is the characteristic iris finding in NF1?', '["Blue eyes", "Lisch nodules (hamartomas)", "Hole", "None"]', 1, 'Lisch nodules are benign but helpful for diagnosis.'),
    (v_case_id, 'What type of malignant soft tissue tumor are NF1 patients at risk for?', '["Osteosarcoma", "Malignant Peripheral Nerve Sheath Tumor (MPNST)", "Wilms", "None"]', 1, 'Benign neurofibromas can undergo malignant transformation.');

    ---------------------------------------------------------------------------
    -- CASE 32: Platelet Transfusion Thresholds (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Supportive Care - Heme' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Supportive Care - Heme', 'A child with ALL has a platelet count of 8,000/mm3.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supportive Care - Heme', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the typical threshold for prophylactic platelet transfusion in stable oncology patients?', '["< 50,000", "< 10,000 to 20,000", "< 100,000", "None"]', 1, 'Transfusion is usually indicated if the count is below 10k to prevent spontaneous hemorrhage.'),
    (v_case_id, 'When might you transfuse at a higher threshold (e.g., 50,000)?', '["Fever", "Before a lumbar puncture or minor surgery", "Always", "None"]', 1, 'Procedures require higher counts for safety.'),
    (v_case_id, 'What is a risk of frequent transfusions?', '["Obesity", "Alloimmunization (developing antibodies to platelets)", "Better hair", "None"]', 1, 'Alloimmunization can make future transfusions less effective.');

    ---------------------------------------------------------------------------
    -- CASE 33: Hyperleukocytosis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Too Many Blasts' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Too Many Blasts', 'A newly diagnosed AML patient has a WBC count of 250,000 and is confused.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Too Many Blasts', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for symptoms caused by extremely high WBC counts?', '["TLS", "Leukostasis (Hyperviscosity syndrome)", "Sepsis", "None"]', 1, 'The thick blood causes sludging in small vessels, especially in the brain and lungs.'),
    (v_case_id, 'Which leukemia has a higher risk of leukostasis at lower WBC counts?', '["ALL", "AML (because myeloid blasts are larger and stickier than lymphoblasts)", "CML", "None"]', 1, 'AML blasts are physically more obstructive.'),
    (v_case_id, 'What is an emergency treatment to rapidly reduce the WBC count?', '["Wait", "Leukapheresis or Exchange transfusion", "Antibiotics", "None"]', 1, 'Physically removing the cells can relieve the obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 34: Late Effects of Treatment (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Life After Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Life After Cancer', 'A 20-year-old survivor of childhood ALL is being seen in a survivorship clinic.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Life After Cancer', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a common endocrine late effect of cranial radiation?', '["Diabetes", "Growth Hormone Deficiency", "Weight loss", "None"]', 1, 'Radiation to the pituitary/hypothalamus often leads to growth failure.'),
    (v_case_id, 'What is the risk for female survivors who received abdominal/pelvic radiation?', '["Early Menopause / Infertility", "Better periods", "None", "None"]', 0, 'Radiation can damage the ovaries.'),
    (v_case_id, 'Survivors of childhood cancer have a significantly higher risk of:', '["Secondary malignancies", "Infection only", "Better health", "None"]', 0, 'Chemotherapy and radiation can cause new, different cancers later in life.');

    ---------------------------------------------------------------------------
    -- CASE 35: Ependymoma (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 4th Ventricle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 4th Ventricle', 'A brain tumor is seen arising from the lining of the 4th ventricle and extending through the foramina.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The 4th Ventricle', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Medulloblastoma", "Ependymoma", "Astrocytoma", "None"]', 1, 'Ependymomas arise from ependymal cells lining the ventricles.'),
    (v_case_id, 'What is the classic histological finding in ependymoma?', '["Reed-Sternberg", "Perivascular Pseudorosettes", "Auer rods", "None"]', 1, 'Cells arranged around a blood vessel.'),
    (v_case_id, 'Why does this tumor often cause hydrocephalus?', '["It is big", "Obstruction of the outflow of Cerebrospinal Fluid (CSF)", "It eats brain", "None"]', 1, 'Its location in the ventricle blocks normal fluid flow.');

    ---------------------------------------------------------------------------
    -- CASE 36: Bone Marrow Transplant - GVHD (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Transplant Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Transplant Complications', 'A child who received an allogeneic bone marrow transplant develops a skin rash and diarrhea 3 weeks later.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Transplant Complications', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Infection", "Graft-versus-Host Disease (GVHD)", "Allergy", "None"]', 1, 'Donor T-cells are attacking the recipient''s tissues.'),
    (v_case_id, 'What are the three primary organs affected by ACUTE GVHD?', '["Heart, Lung, Kidney", "Skin, Liver, and GI tract", "Brain, Bone, Blood", "None"]', 1, 'Rash, jaundice (liver), and diarrhea (gut) are the triad.'),
    (v_case_id, 'What is the first-line treatment for acute GVHD?', '["Antibiotics", "Corticosteroids", "Chemo", "None"]', 1, 'Steroids help suppress the donor immune response.');

    ---------------------------------------------------------------------------
    -- CASE 37: Osteosarcoma - Secondary Causes (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Beyond Primary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Beyond Primary', 'A teen has bone pain in a limb that was previously irradiated for a different cancer.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Beyond Primary', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a major risk factor for secondary osteosarcoma?', '["Diet", "Prior Radiation therapy", "Exercise", "None"]', 1, 'Radiation is a known mutagen for bone.'),
    (v_case_id, 'Besides radiation, what genetic syndrome has the strongest link to Osteosarcoma?', '["Down", "Hereditary Retinoblastoma", "Turner", "None"]', 1, 'Survivors of bilateral retinoblastoma have a very high risk of bone tumors.'),
    (v_case_id, 'What is the first step in staging a bone tumor?', '["Blood test", "MRI of the primary site and Chest CT (to check for lung mets)", "Wait", "None"]', 1, 'Osteosarcoma almost always metastasizes to the lungs first.');

    ---------------------------------------------------------------------------
    -- CASE 38: Pediatric Brain Tumors - Morning Vomiting (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Signs of ICP' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Signs of ICP', 'A child wakes up with a headache that goes away after he vomits.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Signs of ICP', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does morning vomiting suggest?', '["Reflux", "Increased Intracranial Pressure (ICP)", "Hunger", "None"]', 1, 'ICP is highest at night/early morning due to supine positioning and relative hypoventilation.'),
    (v_case_id, 'What physical exam finding confirms increased ICP?', '["Red throat", "Papilledema", "Rash", "None"]', 1, 'Swelling of the optic disc is a direct sign of pressure.'),
    (v_case_id, 'In an infant, what is a sign of increased ICP?', '["Cough", "Bulging fontanelle and rapidly increasing head circumference", "None", "None"]', 1, 'Open sutures allow the head to expand.');

    ---------------------------------------------------------------------------
    -- CASE 39: Leukemia - Bone Marrow Biopsy (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Definitive Test' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Definitive Test', 'A child has a WBC of 2,000, Hemoglobin of 7, and Platelets of 20,000.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Definitive Test', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for all three cell lines being low?', '["Anemia", "Pancytopenia", "Leukopenia", "None"]', 1, 'Pancytopenia in a child should always raise suspicion for leukemia or aplastic anemia.'),
    (v_case_id, 'What percentage of blasts in the bone marrow is generally required for a diagnosis of leukemia?', '["5%", "> 20-25%", "100%", "None"]', 1, 'Normal marrow has < 5% blasts.'),
    (v_case_id, 'What is the purpose of Flow Cytometry on the marrow sample?', '["Check count", "To determine the immunophenotype (e.g., B-cell vs T-cell)", "None", "None"]', 1, 'Flow identifies the specific proteins on the surface of the blasts.');

    ---------------------------------------------------------------------------
    -- CASE 40: Retinoblastoma - Genetics (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Family Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Family Screening', 'A father who had bilateral retinoblastoma now has a newborn daughter.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Family Screening', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk that the daughter carries the RB1 mutation?', '["0%", "50% (Autosomal Dominant inheritance)", "100%", "None"]', 1, 'Hereditary retinoblastoma is passed from parent to child.'),
    (v_case_id, 'How should the daughter be managed?', '["Wait for symptoms", "Regular ophthalmologic exams starting in the first weeks of life", "None", "None"]', 1, 'Early detection allows for vision-sparing treatment.'),
    (v_case_id, 'Are most cases of retinoblastoma hereditary or sporadic?', '["Hereditary", "Sporadic (about 60%)", "Both", "None"]', 1, 'Most cases are one-off mutations in a single eye.');

    ---------------------------------------------------------------------------
    -- CASE 41: Brainstem Glioma - DIPG (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Inoperable Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Inoperable Tumor', 'A child has multiple cranial nerve palsies and long-tract signs (weakness). MRI shows a diffuse expansion of the pons.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Inoperable Tumor', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Astrocytoma", "Diffuse Intrinsic Pontine Glioma (DIPG)", "Medulloblastoma", "None"]', 1, 'DIPG is a devastating, highly aggressive tumor of the brainstem.'),
    (v_case_id, 'Why is surgery not an option for DIPG?', '["The tumor is small", "It is diffusely infiltrative in a vital area (the pons)", "No reason", "None"]', 1, 'Biopsy is sometimes done, but resection is impossible.'),
    (v_case_id, 'What is the prognosis for DIPG?', '["Excellent", "Poor (nearly always fatal within 1-2 years)", "Average", "None"]', 1, 'It remains one of the most difficult pediatric cancers to treat.');

    ---------------------------------------------------------------------------
    -- CASE 42: Palliative Care (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Quality of Life' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Quality of Life', 'A child with refractory neuroblastoma is transitioning to end-of-life care.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Quality of Life', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of pediatric palliative care?', '["To cure the disease", "To optimize quality of life and minimize suffering for the child and family", "To stop therapy", "None"]', 1, 'It focuses on comfort and support.'),
    (v_case_id, 'Can palliative care be provided alongside curative-intent therapy?', '["No", "Yes, it should be integrated early in the course of any life-threatening illness", "Only at the end", "None"]', 1, 'Concurrent care is standard in modern oncology.'),
    (v_case_id, 'What is a common myth about morphine in palliative care?', '["It causes pain", "It will cause the child to stop breathing immediately", "It is a vitamin", "None"]', 1, 'Used correctly, morphine safely manages pain and air hunger.');

    ---------------------------------------------------------------------------
    -- CASE 43: Langerhans Cell Histiocytosis - Skin (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stubborn Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stubborn Rash', 'An infant has a crusty, brown rash in the groin and armpits that doesn''t respond to antifungal or steroid creams.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stubborn Rash', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What malignancy should be considered?', '["Leukemia", "Langerhans Cell Histiocytosis (LCH)", "Lymphoma", "None"]', 1, 'A \"seborrheic\" rash that fails treatment is a red flag for LCH.'),
    (v_case_id, 'What other organ systems can be involved in multi-system LCH?', '["Liver, Spleen, and Bone Marrow", "Only skin", "Heart only", "None"]', 0, 'Multi-system involvement (especially \"risk organs\" like the marrow) has a poorer prognosis.'),
    (v_case_id, 'How is skin-only LCH treated?', '["Always chemo", "Often topical therapy or observation; some resolve spontaneously", "Surgery", "None"]', 1, 'Limited disease may be managed conservatively.');

    ---------------------------------------------------------------------------
    -- CASE 44: Down Syndrome & Leukemia (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Trisomy 21 and Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Trisomy 21 and Cancer', 'A child with Down Syndrome is noted to have a very high risk of blood cancers.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Trisomy 21 and Cancer', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk of leukemia in Down Syndrome compared to the general population?', '["Same", "10-20 times higher", "Lower", "None"]', 1, 'Trisomy 21 predisposes to both ALL and AML.'),
    (v_case_id, 'What unique neonatal condition in Down Syndrome mimics leukemia but often resolves on its own?', '["Sepsis", "Transient Myeloproliferative Disorder (TMD)", "Rash", "None"]', 1, 'TMD (or Transient Abnormal Myelopoiesis) involves GATA1 mutations.'),
    (v_case_id, 'Do Down Syndrome children with AML-M7 have better or worse outcomes than others?', '["Worse", "Better (they are exquisitely sensitive to Ara-C)", "Average", "None"]', 1, 'The specific biology in DS makes the tumor easier to kill.');

    ---------------------------------------------------------------------------
    -- CASE 45: Bone Tumors - Pain (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Red Flag Bone Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Red Flag Bone Pain', 'A teen complains of knee pain that is worse at night and wakes him up.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Red Flag Bone Pain', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is night-time bone pain a red flag?', '["Growing pains only happen at night", "Pathological pain (like from a tumor) is often independent of activity and persistent at rest", "No reason", "None"]', 1, 'Growing pains are real but they shouldn''t cause focal, persistent, or systemic symptoms.'),
    (v_case_id, 'Should you ever attribute persistent limb pain to \"growing pains\" without an exam?', '["Yes", "No, it is a diagnosis of exclusion", "Always", "None"]', 1, 'Never ignore persistent, localized musculoskeletal pain in an adolescent.'),
    (v_case_id, 'What is a common trigger for the medical visit in a child with a bone tumor?', '["Nothing", "A minor injury that draws attention to the pre-existing mass (Pathologic fracture)", "Fever", "None"]', 1, 'The tumor weakens the bone until it breaks or hurts with a minor bump.');

    ---------------------------------------------------------------------------
    -- CASE 46: Hodgkin - Reed-Sternberg Cell (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Owl Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Owl Eye', 'A pathologist is looking at a lymph node biopsy.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Owl Eye', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the surface marker typically found on classic Reed-Sternberg cells?', '["CD20", "CD15 and CD30", "CD4", "None"]', 1, 'These are the diagnostic markers for classic Hodgkin lymphoma.'),
    (v_case_id, 'Does Hodgkin lymphoma usually spread in a predictable or random fashion?', '["Random", "Orderly spread to contiguous lymph node groups", "Through blood", "None"]', 1, 'This orderly spread is a hallmark of Hodgkin vs non-Hodgkin.'),
    (v_case_id, 'What is the survival rate for childhood Hodgkin Lymphoma?', '["Poor", "Very High (> 90%)", "50%", "None"]', 1, 'It is one of the most curable pediatric malignancies.');

    ---------------------------------------------------------------------------
    -- CASE 47: Neuroblastoma - Stage 4S (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Special Stage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Special Stage', 'An infant under 1 year has a small primary tumor and spread ONLY to the liver, skin, and bone marrow.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Special Stage', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this special stage called?', '["Terminal", "Stage 4S (Special)", "Stage 1", "None"]', 1, 'A unique phenomenon in infant neuroblastoma.'),
    (v_case_id, 'What is the typical outcome for Stage 4S?', '["Death", "Excellent; it often undergoes spontaneous regression", "Requires heavy chemo", "None"]', 1, 'These tumors are famous for \"melting away\" without aggressive treatment.'),
    (v_case_id, 'What molecular finding is a poor prognostic factor in ALL stages of Neuroblastoma?', '["N-myc amplification", "RB1 mutation", "t(9;22)", "None"]', 0, 'Extra copies of N-myc signal an aggressive, high-risk tumor.');

    ---------------------------------------------------------------------------
    -- CASE 48: Wilms Tumor - Surgery (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Operating on the Kidney' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Operating on the Kidney', 'A child with Wilms tumor is scheduled for a nephrectomy.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Operating on the Kidney', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority during Wilms tumor surgery?', '["Speed", "Careful handling to avoid tumor rupture/spillage", "Blood loss", "None"]', 1, 'Spillage during surgery upstages the tumor and requires more intensive therapy.'),
    (v_case_id, 'Why must the other kidney be explored?', '["To see if it''s there", "Risk of synchronous bilateral Wilms (up to 5-10%)", "No reason", "None"]', 1, 'Both kidneys must be evaluated for involvement.'),
    (v_case_id, 'Is biopsy usually done BEFORE surgery in North America?', '["Yes", "No, surgical resection is usually the first step for diagnosis and staging", "Only if small", "None"]', 1, 'Surgery provides the best tissue and definitive initial management.');

    ---------------------------------------------------------------------------
    -- CASE 49: Brain Tumors - Ependymoma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ventricle Lining' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ventricle Lining', 'A 3-year-old has obstructive hydrocephalus and a posterior fossa mass.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Ventricle Lining', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are \"Perivascular Pseudorosettes\"?', '["A skin rash", "Tumor cells arranged around a central blood vessel (hallmark of ependymoma)", "Eye spots", "None"]', 1, 'A classic pathology description.'),
    (v_case_id, 'Where is the most common location for ependymoma in children?', '["Spinal cord", "Fourth Ventricle", "Frontal lobe", "None"]', 1, 'The posterior fossa is the primary site in kids.'),
    (v_case_id, 'What is the primary treatment for ependymoma?', '["Chemo only", "Maximal surgical resection and radiation", "Antibiotics", "None"]', 1, 'Complete surgical removal is the strongest prognostic factor.');

    ---------------------------------------------------------------------------
    -- CASE 50: Tumor Lysis Syndrome - Prevention (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Avoiding the Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Avoiding the Crash', 'A patient with high-risk leukemia is being prepped for chemo.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Avoiding the Crash', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical preventative measure for TLS?', '["Bed rest", "Aggressive IV hydration (2-3 times maintenance)", "High fat diet", "None"]', 1, 'Maintaining high urine flow helps flush the metabolites.'),
    (v_case_id, 'Should you add Potassium to the IV fluids for these patients?', '["Yes", "No, there is a massive risk of hyperkalemia as cells break down", "Only if low", "None"]', 1, 'Never add K to the maintenance fluids of a patient at risk for TLS.'),
    (v_case_id, 'What is the role of Allopurinol?', '["Kills cancer", "Prevents the formation of NEW uric acid (Xanthine oxidase inhibitor)", "Neutralizes acid", "None"]', 1, 'It is prophylactic; it doesn''t lower existing uric acid levels.');

    RAISE NOTICE 'SUCCESS: 50 Pediatric Oncology Case Blocks registered.';
END $$;

COMMIT;
