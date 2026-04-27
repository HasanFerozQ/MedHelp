-- Migration: Hematology Pathology Cases Part 3 (21-30)
-- Goal: Cover Lymphomas and Plasma Cell Dyscrasias
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30;

    -- CASE 21: Follicular Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Painless Neck Mass', 'A 62-year-old woman presents with painless, enlarging lymph nodes in her neck and axilla. Lymph node biopsy shows small cleaved cells (centrocytes) and large cells (centroblasts) in a nodular pattern.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic translocation in Follicular Lymphoma?', '["t(8;14)", "t(14;18)", "t(11;14)", "t(15;17)"]', 1, 'Follicular lymphoma is associated with t(14;18), which moves the BCL2 gene to the Ig heavy chain locus.'),
    (v_case_id, 'What is the function of the BCL2 gene product?', '["Inhibits apoptosis", "Promotes cell cycle", "Inhibits DNA repair", "Activates tyrosine kinase"]', 0, 'BCL2 is an anti-apoptotic protein. Overexpression prevents the "default" apoptosis of B-cells in the germinal center, leading to lymphoma.'),
    (v_case_id, 'How can follicular lymphoma be distinguished from reactive follicular hyperplasia (in response to infection)?', '["Reactive hyperplasia has BCL2 expression", "Reactive hyperplasia shows tingible body macrophages and lack of BCL2 expression", "Lymphoma shows polyclonal B-cells", "There is no way to distinguish them"]', 1, 'Reactive follicles contain macrophages clearing apoptotic cells (tingible bodies) and do NOT express BCL2. Lymphoma is monoclonal and BCL2+.');

    -- CASE 22: Mantle Cell Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Expanding the Mantle', 'A 60-year-old man presents with generalized lymphadenopathy. Biopsy shows expansion of the mantle zone by small B-cells.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic translocation in Mantle Cell Lymphoma?', '["t(8;14)", "t(11;14)", "t(14;18)", "t(9;22)"]', 1, 'Mantle cell lymphoma is associated with t(11;14), moving Cyclin D1 to the Ig heavy chain locus.'),
    (v_case_id, 'What is the function of Cyclin D1?', '["Inhibits apoptosis", "Promotes G1 to S phase transition", "Activates p53", "Inhibits Rb protein"]', 1, 'Cyclin D1 phosphorylates Rb, allowing the cell to progress from G1 to S phase. Overexpression drives uncontrolled cell growth.'),
    (v_case_id, 'Where is the "mantle zone" located in a lymph node?', '["Directly surrounding the germinal center", "In the paracortex", "In the medulla", "In the subcapsular sinus"]', 0, 'The mantle zone is the area of small B-cells immediately surrounding the germinal center.');

    -- CASE 23: Burkitt Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Jaw Mass', 'A 10-year-old boy from equatorial Africa presents with a large, rapidly growing mass on his jaw. Biopsy shows a "starry-sky" appearance.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What virus is strongly associated with the endemic (African) form of Burkitt Lymphoma?', '["HIV", "EBV", "HTLV-1", "HHV-8"]', 1, 'EBV is found in almost 100% of endemic Burkitt cases.'),
    (v_case_id, 'What is the characteristic translocation and the gene involved?', '["t(11;14); Cyclin D1", "t(8;14); c-MYC", "t(14;18); BCL2", "t(9;22); BCR-ABL"]', 1, 'Burkitt lymphoma involves t(8;14), which moves the c-MYC oncogene to the Ig heavy chain locus.'),
    (v_case_id, 'What causes the "starry-sky" appearance histologically?', '["Brightly colored tumor cells", "Macrophages (stars) consuming apoptotic debris in a sea of dark tumor cells (sky)", "Calcifications", "Presence of eosinophils"]', 1, 'The extremely high mitotic rate leads to frequent apoptosis; macrophages then clean up the debris, creating clear spots in the dense tissue.');

    -- CASE 24: Marginal Zone Lymphoma (MALToma)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chronic Gastritis and Lymphoma', 'A 50-year-old man with a history of chronic H. pylori gastritis is found to have a low-grade B-cell lymphoma in his stomach lining.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this type of lymphoma called?', '["Burkitt Lymphoma", "Mantle Cell Lymphoma", "Marginal Zone Lymphoma (MALToma)", "DLBCL"]', 2, 'Marginal zone lymphomas arise in tissues with chronic inflammation (e.g., MALToma in H. pylori gastritis, or in Sjögren syndrome).'),
    (v_case_id, 'True or False: Treating the H. pylori infection can cause regression of the lymphoma in early stages.', '["True", "False"]', 0, 'Because the lymphoma is driven by the chronic inflammatory stimulus, removing the stimulus (H. pylori) can lead to cure in early cases.'),
    (v_case_id, 'In which autoimmune condition is there an increased risk of Marginal Zone Lymphoma of the salivary gland?', '["Rheumatoid Arthritis", "Sjögren Syndrome", "SLE", "Hashimoto Thyroiditis"]', 1, 'Sjögren syndrome leads to chronic inflammation of the salivary glands, predisposing to marginal zone lymphoma.');

    -- CASE 25: Hodgkin Lymphoma (Nodular Sclerosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Young Woman with an Enlarged Node', 'A 24-year-old woman presents with a single, painless, enlarging lymph node in her neck. Biopsy shows large cells with "owl-eye" nuclei (Reed-Sternberg cells) surrounded by bands of fibrosis.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic immunophenotype of classic Reed-Sternberg (RS) cells?', '["CD19+ and CD20+", "CD15+ and CD30+", "CD3+ and CD4+", "CD10+ and BCL2+"]', 1, 'RS cells in classic Hodgkin lymphoma are CD15+ and CD30+. They are usually negative for CD20.'),
    (v_case_id, 'What is the most common subtype of Hodgkin Lymphoma, especially in young adults?', '["Nodular Sclerosis", "Mixed Cellularity", "Lymphocyte Rich", "Lymphocyte Depleted"]', 0, 'Nodular sclerosis accounts for ~70% of cases and typically presents as a mediastinal mass or cervical node in a young woman.'),
    (v_case_id, 'Why are most of the cells in a Hodgkin lymph node reactive (lymphocytes, plasma cells, eosinophils) rather than malignant?', '["The RS cells are not malignant", "RS cells secrete cytokines (IL-5, etc.) that recruit inflammatory cells", "It is an infection, not a cancer", "The RS cells are being attacked by the immune system"]', 1, 'RS cells represent only ~1-2% of the tumor mass; they survive by recruiting a supportive inflammatory environment via cytokine secretion.');

    -- CASE 26: Multiple Myeloma (CRAB)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Bone Pain and Kidney Failure', 'A 70-year-old man presents with worsening back pain and fatigue. Labs show elevated Calcium: 11.5 mg/dL, Creatinine: 2.2 mg/dL, and a "punched-out" lesion on skull X-ray.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What would serum protein electrophoresis (SPEP) likely show in this patient?', '["Polyclonal gammopathy", "Monoclonal (M) spike", "Decreased albumin only", "Flat gamma region"]', 1, 'Multiple myeloma is a malignant proliferation of plasma cells, which produce a single type of immunoglobulin (usually IgG or IgA).'),
    (v_case_id, 'What is the "CRAB" mnemonic used for in this diagnosis?', '["Cancer, Rash, Anemia, Bleeding", "Calcium elevation, Renal insufficiency, Anemia, Bone lesions", "Cough, Rales, Atelectasis, Breathlessness", "Clotting, Rigor, Acidosis, Bacteremia"]', 1, 'CRAB summarizes the classic clinical features of Multiple Myeloma.'),
    (v_case_id, 'What are "Bence-Jones proteins"?', '["Free immunoglobulin heavy chains in urine", "Free immunoglobulin light chains in urine", "Albumin fragments", "Myoglobin"]', 1, 'Plasma cells produce an excess of light chains, which are small enough to be filtered and excreted in the urine, potentially causing renal damage (Myeloma kidney).');

    -- CASE 27: Waldenström Macroglobulinemia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Blurred Vision and Headache', 'A 65-year-old man presents with generalized lymphadenopathy, blurred vision, and nosebleeds. SPEP shows a large IgM M-spike.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of his symptoms (visual changes, headache)?', '["Hypercalcemia", "Hyperviscosity syndrome", "Bone fractures", "Renal failure"]', 1, 'IgM is a large pentamer. High levels make the blood very "thick" (viscous), leading to impaired blood flow in the brain and eyes.'),
    (v_case_id, 'How does Waldenström Macroglobulinemia differ from Multiple Myeloma?', '["MM has an IgM spike; WM has IgG", "WM has hyperviscosity and lack of bone lesions/hypercalcemia", "MM is always in children", "There is no difference"]', 1, 'WM is a B-cell lymphoma with plasma cell differentiation. It produces IgM and causes hyperviscosity but does NOT typically cause the bone lesions or hypercalcemia seen in MM.'),
    (v_case_id, 'What is the acute treatment for hyperviscosity syndrome in this patient?', '["Chemotherapy", "Plasmapheresis", "Blood transfusion", "Hydration only"]', 1, 'Plasmapheresis rapidly removes the large IgM pentamers from the circulation, relieving the hyperviscosity.');

    -- CASE 28: MGUS (Monoclonal Gammopathy of Undetermined Significance)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Asymptomatic M-Spike', 'An 80-year-old man is found to have a small M-spike (IgG < 3g/dL) on routine labs. He has no bone pain, normal calcium, no anemia, and normal renal function. Bone marrow biopsy shows < 10% plasma cells.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Multiple Myeloma", "MGUS", "Waldenström Macroglobulinemia", "Primary Amyloidosis"]', 1, 'MGUS is common in the elderly and is defined by a monoclonal spike WITHOUT the CRAB symptoms of myeloma.'),
    (v_case_id, 'What is the risk of progression from MGUS to Multiple Myeloma?', '["100%", "Approximately 1% per year", "0%", "50%"]', 1, 'Most patients with MGUS will never develop myeloma, but they require long-term follow-up as the risk of transformation is about 1% annually.'),
    (v_case_id, 'If this patient also had macroglossia and "raccoon eyes" (periorbital purpura), what associated condition should be suspected?', '["Secondary polycythemia", "Primary AL Amyloidosis", "Iron deficiency", "Vitamin C deficiency"]', 1, 'In some plasma cell dyscrasias, light chains can deposit in tissues as amyloid (AL type), causing organ enlargement and fragile vessels.');

    -- CASE 29: Mycosis Fungoides (Sezary Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Rash that mimics Psoriasis', 'A 50-year-old man presents with a chronic, itchy, red skin rash that looks like plaques. Skin biopsy shows a dense infiltrate of lymphocytes with "cerebriform" nuclei in the epidermis (Pautrier microabscesses).', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of lymphoma is Mycosis Fungoides?', '["B-cell lymphoma", "Mature T-cell lymphoma (Cutaneous)", "Myeloid leukemia", "Hodgkin lymphoma"]', 1, 'Mycosis fungoides is a neoplastic proliferation of mature CD4+ T-cells that specifically infiltrate the skin.'),
    (v_case_id, 'What is it called when these malignant T-cells spread into the blood?', '["Burkitt lymphoma", "Sezary Syndrome", "Richter Transformation", "Mantle cell lymphoma"]', 1, 'Sezary syndrome is characterized by skin involvement (erythroderma), lymphadenopathy, and circulating malignant T-cells with cerebriform nuclei (Sezary cells).'),
    (v_case_id, 'What are "Pautrier microabscesses"?', '["Collections of neutrophils", "Aggregates of neoplastic T-cells in the epidermis", "Viral vesicles", "Fungal colonies"]', 1, 'These are characteristic histological findings in Mycosis Fungoides.');

    -- CASE 30: Diffuse Large B-Cell Lymphoma (DLBCL)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rapidly Enlarging Mass', 'A 60-year-old man presents with a rapidly enlarging mass in his groin. Biopsy shows large B-cells with prominent nucleoli growing in a diffuse pattern (not nodular).', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical behavior of DLBCL?', '["Indolent and slow-growing", "Highly aggressive and rapidly fatal without treatment", "Always benign", "Self-limiting"]', 1, 'DLBCL is the most common form of non-Hodgkin lymphoma and is clinically aggressive but potentially curable with intensive chemotherapy (R-CHOP).'),
    (v_case_id, 'Which of the following is a common precursor to DLBCL?', '["Iron deficiency", "Follicular lymphoma or CLL (transformation)", "Vitamin B12 deficiency", "Normal aging"]', 1, 'Low-grade lymphomas like follicular lymphoma or CLL can transform into the more aggressive DLBCL.'),
    (v_case_id, 'What is the significance of "B symptoms" (fever, night sweats, weight loss) in this patient?', '["They indicate a viral infection", "They indicate high tumor burden and systemic involvement", "They are side effects of medications", "They are irrelevant"]', 1, 'B symptoms are common in aggressive lymphomas and Hodgkin lymphoma, indicating cytokine release and systemic disease.');

    RAISE NOTICE 'SUCCESS: Hematology Pathology Cases Part 3 (21-30) registered.';
END $$;

COMMIT;
