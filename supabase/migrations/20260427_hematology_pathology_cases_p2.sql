-- Migration: Hematology Pathology Cases Part 2 (11-20)
-- Goal: Cover Hemolytic Anemias, WBC Basics, and Acute Leukemias
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20;

    -- CASE 11: Autoimmune Hemolytic Anemia (AIHA)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Anemia and Lupus', 'A 30-year-old woman with Systemic Lupus Erythematosus (SLE) presents with fatigue and yellow eyes. Labs show Hemoglobin: 8 g/dL, increased indirect bilirubin, and spherocytes on peripheral smear. The Direct Coombs test is positive.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of AIHA is most likely in this patient?', '["Warm AIHA (IgG)", "Cold AIHA (IgM)", "Paroxysmal Cold Hemoglobinuria", "Microangiopathic Hemolytic Anemia"]', 0, 'Warm AIHA is associated with IgG antibodies and often occurs in the setting of SLE or CLL. It leads to extravascular hemolysis (spherocytes).'),
    (v_case_id, 'Why are spherocytes formed in this condition?', '["Genetic defect in ankyrin", "Partial phagocytosis of antibody-coated RBC membranes by splenic macrophages", "Direct lysis by complement", "Oxidative damage"]', 1, 'In Warm AIHA, splenic macrophages "bite" off the antibody-coated membrane, reducing the surface area and forcing the RBC into a spherical shape.'),
    (v_case_id, 'Which medication is a common cause of drug-induced Warm AIHA?', '["Penicillin", "Alpha-methyldopa", "Quinidine", "Aspirin"]', 1, 'Alpha-methyldopa can induce the formation of autoantibodies against RBC antigens, leading to Warm AIHA.');

    -- CASE 12: Paroxysmal Nocturnal Hemoglobinuria (PNH)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Dark Urine in the Morning', 'A 35-year-old man presents with episodes of dark-colored urine in the morning. He also reports abdominal pain. Flow cytometry shows a lack of CD55 and CD59 on RBCs.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect in PNH?', '["Autoimmune destruction", "Acquired mutation in the PIGA gene", "Hemoglobin mutation", "Iron deficiency"]', 1, 'PNH is an acquired clonal stem cell mutation in the PIGA gene, which is necessary for anchor proteins (GPI) that attach CD55/CD59 to the membrane.'),
    (v_case_id, 'What is the function of CD55 and CD59?', '["Maintain cell shape", "Protect RBCs from complement-mediated lysis", "Transport iron", "Identify the cell as \"self\""]', 1, 'CD55 (DAF) and CD59 (MIRL) inhibit complement activation on the cell surface. Their absence makes RBCs, WBCs, and platelets sensitive to complement lysis.'),
    (v_case_id, 'What is the most common cause of death in patients with PNH?', '["Iron deficiency", "Thrombosis (often in unusual sites like hepatic veins)", "Infection", "Heart failure"]', 1, 'Thrombosis (e.g., Budd-Chiari syndrome) is the leading cause of death, as complement-induced platelet destruction releases pro-thrombotic factors.');

    -- CASE 13: Infectious Mononucleosis (EBV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sore Throat and Splenomegaly', 'An 18-year-old college student presents with a severe sore throat, high fever, and lymphadenopathy. On exam, he has an enlarged spleen. A Monospot test is positive.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of cells are the "atypical lymphocytes" seen on the peripheral smear?', '["Infected B-cells", "Reactive CD8+ T-cells", "Immature Neutrophils", "Natural Killer cells"]', 1, 'EBV infects B-cells (via CD21), but the atypical lymphocytes seen in the blood are reactive CD8+ T-cells attempting to clear the infection.'),
    (v_case_id, 'Where does the lymphadenopathy primarily occur in this condition?', '["Anterior cervical nodes", "Posterior cervical nodes", "Axillary nodes", "Inguinal nodes"]', 1, 'Posterior cervical lymphadenopathy is classic for Infectious Mononucleosis due to T-cell hyperplasia in the paracortex.'),
    (v_case_id, 'Why should this patient avoid contact sports for 4-6 weeks?', '["Risk of heart attack", "Risk of splenic rupture", "Risk of spreading the virus", "Risk of permanent fatigue"]', 1, 'Splenomegaly is common, and even minor trauma can lead to a life-threatening splenic rupture.');

    -- CASE 14: Acute Lymphoblastic Leukemia (ALL)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Bone Pain in a Child', 'A 4-year-old boy presents with bone pain, fever, and bruising. Labs show a WBC count of 50,000/µL with 80% lymphoblasts. The blasts are TdT positive.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of TdT (Terminal deoxynucleotidyl transferase) positivity?', '["It indicates a myeloid origin", "It is a marker for immature lymphoblasts", "It is a marker for mature B-cells", "It indicates a poor prognosis"]', 1, 'TdT is a DNA polymerase found only in the nucleus of lymphoblasts, not in myeloid blasts or mature lymphocytes.'),
    (v_case_id, 'Which cytogenetic translocation is associated with a GOOD prognosis in B-ALL (common in children)?', '["t(9;22) (Philadelphia chromosome)", "t(12;21)", "t(8;14)", "t(15;17)"]', 1, 't(12;21) is associated with a good prognosis. t(9;22) is more common in adults and carries a poor prognosis.'),
    (v_case_id, 'If this were T-ALL, how would it typically present in an adolescent?', '["Splenomegaly", "Mediastinal (thymic) mass", "Bone pain only", "Skin rash"]', 1, 'T-ALL often presents in teenagers as a mediastinal mass (thymic lymphoma) that can cause SVC syndrome or respiratory distress.');

    -- CASE 15: Acute Myeloid Leukemia (AML)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Auer Rods', 'A 60-year-old man presents with fatigue and gum bleeding. Peripheral smear shows large blasts with delicate cytoplasmic granules and "Auer rods." Flow cytometry is positive for MPO.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "Auer rods"?', '["Nuclear remnants", "Aggregates of myeloperoxidase (MPO)", "Precipitated hemoglobin", "Viral inclusions"]', 1, 'Auer rods are pathognomonic for myeloblasts and represent crystallized MPO granules.'),
    (v_case_id, 'The patient is diagnosed with Acute Promyelocytic Leukemia (APL). What is the characteristic translocation?', '["t(9;22)", "t(15;17)", "t(8;14)", "t(12;21)"]', 1, 'APL involves t(15;17), which disrupts the retinoic acid receptor (RAR).'),
    (v_case_id, 'Why is APL considered a medical emergency?', '["Risk of immediate kidney failure", "Risk of disseminated intravascular coagulation (DIC) due to Auer rod release", "Risk of sudden stroke", "Risk of total blindness"]', 1, 'APL blasts contain numerous Auer rods. When they die or are treated, they release primary granules that can trigger DIC.');

    -- CASE 16: Chronic Myeloid Leukemia (CML)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Massive Splenomegaly', 'A 55-year-old woman presents with abdominal fullness and weight loss. On exam, her spleen is palpable 10 cm below the costal margin. Labs show WBC 150,000/µL with a full spectrum of myeloid cells (neutrophils, metamyelocytes, myelocytes, and basophils).', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic cytogenetic finding in CML?', '["t(15;17)", "t(9;22) (Philadelphia chromosome)", "t(8;14)", "t(11;14)"]', 1, 'CML is driven by the BCR-ABL fusion gene on the Philadelphia chromosome, which produces a constitutively active tyrosine kinase.'),
    (v_case_id, 'How can CML be distinguished from a "Leukemoid Reaction" (reactive neutrophilia)?', '["CML has high LAP (Leukocyte Alkaline Phosphatase) score", "CML has low/absent LAP score and increased basophils", "Leukemoid reaction has the Philadelphia chromosome", "There is no way to distinguish them"]', 1, 'CML cells are malignant and lack LAP. In a leukemoid reaction (infection), neutrophils are functional and have a high LAP score. Basophilia is also highly suggestive of CML.'),
    (v_case_id, 'What is the targeted treatment for this condition?', '["All-trans retinoic acid (ATRA)", "Imatinib (Tyrosine kinase inhibitor)", "Cyclophosphamide", "Rituximab"]', 1, 'Imatinib specifically blocks the BCR-ABL tyrosine kinase activity, revolutionized the treatment of CML.');

    -- CASE 17: Chronic Lymphocytic Leukemia (CLL)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Smudge Cells', 'An 75-year-old man has a routine blood test showing a WBC of 30,000/µL with 90% mature-appearing lymphocytes. Peripheral smear shows "smudge cells." He is currently asymptomatic.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "smudge cells"?', '["Infected cells", "Fragile leukemic lymphocytes that burst during smear preparation", "Precursors of B-cells", "Artifacts of staining"]', 1, 'CLL lymphocytes are fragile and easily crushed during the slide preparation, creating smudge cells.'),
    (v_case_id, 'Which of the following is a common complication of CLL?', '["Hypogammaglobulinemia (leading to infection)", "Hypercalcemia", "Acute renal failure", "Secondary polycythemia"]', 0, 'CLL cells do not produce effective antibodies, leading to low Ig levels and increased risk of bacterial infections (most common cause of death).'),
    (v_case_id, 'What is a "Richter Transformation"?', '["Transformation of CLL into AML", "Transformation of CLL into a high-grade Diffuse Large B-Cell Lymphoma (DLBCL)", "Spontaneous cure of CLL", "Transformation of CLL into Hodgkin Lymphoma"]', 1, 'Richter transformation is the sudden progression of CLL into an aggressive lymphoma, usually signaled by an enlarging lymph node or spleen.');

    -- CASE 18: Hairy Cell Leukemia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The "Dry Tap"', 'A 50-year-old man presents with massive splenomegaly and pancytopenia. A bone marrow aspiration is attempted but results in a "dry tap." Smear shows lymphocytes with hair-like projections.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which special stain is used to identify these "hairy" cells?', '["PAS", "TRAP (Tartrate-Resistant Acid Phosphatase)", "Prussian Blue", "MPO"]', 1, 'Hairy cell leukemia is TRAP positive (though this test is largely replaced by flow cytometry).'),
    (v_case_id, 'Why does a "dry tap" occur in this condition?', '["The marrow is empty", "The leukemic cells induce marrow fibrosis", "The needle is too small", "The patient is dehydrated"]', 1, 'The hairy cells induce a fibrotic response in the bone marrow, making aspiration difficult.'),
    (v_case_id, 'Which drug is a highly effective adenosine deaminase inhibitor used for this condition?', '["ATRA", "Cladribine (2-CdA)", "Imatinib", "Prednisone"]', 1, 'Cladribine is the treatment of choice for hairy cell leukemia.');

    -- CASE 19: Microangiopathic Hemolytic Anemia (MAHA)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Schistocytes and Low Platelets', 'A 24-year-old woman presents with fever, confusion, and petechiae. Labs show a low platelet count, elevated LDH, and fragmented RBCs (schistocytes) on peripheral smear. PT and PTT are normal.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["DIC", "Thrombotic Thrombocytopenic Purpura (TTP)", "ITP", "Hemophilia A"]', 1, 'The pentad of TTP includes fever, anemia (MAHA), thrombocytopenia, renal failure, and neurological symptoms. Normal PT/PTT distinguishes it from DIC.'),
    (v_case_id, 'What is the underlying deficiency in TTP?', '["GPIIb/IIIa", "ADAMTS13 enzyme", "Factor VIII", "Vitamin K"]', 1, 'TTP is caused by a deficiency of ADAMTS13, an enzyme that cleaves large vWF multimers. Lack of cleavage leads to platelet microthrombi.'),
    (v_case_id, 'What are schistocytes?', '["Immature RBCs", "Fragmented RBCs caused by mechanical shearing through fibrin mesh", "RBCs with inclusions", "Target cells"]', 1, 'RBCs are sheared as they pass through the platelet/fibrin thrombi in the small vessels, creating "helmet cells" or schistocytes.');

    -- CASE 20: Malaria
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cyclical Fevers', 'A traveler returning from Africa presents with cyclical fevers and chills every 48 hours. Peripheral smear shows ring forms within RBCs.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which species of Plasmodium causes daily (irregular) fevers and the most severe disease (including cerebral malaria)?', '["P. vivax", "P. falciparum", "P. ovale", "P. malariae"]', 1, 'P. falciparum is the most dangerous species and causes irregular fever patterns.'),
    (v_case_id, 'Which species form "hypnozoites" in the liver, leading to relapses?', '["P. falciparum", "P. vivax and P. ovale", "P. malariae", "All of them"]', 1, 'P. vivax and P. ovale can remain dormant in the liver; primaquine is needed to eradicate these hypnozoites.'),
    (v_case_id, 'Which genetic condition provides some protection against P. falciparum malaria?', '["Sickle Cell Trait", "G6PD Deficiency", "Thalassemia", "All of the above"]', 3, 'Various RBC disorders provide a survival advantage in malaria-endemic regions by making the RBCs less hospitable for the parasite.');

    RAISE NOTICE 'SUCCESS: Hematology Pathology Cases Part 2 (11-20) registered.';
END $$;

COMMIT;
