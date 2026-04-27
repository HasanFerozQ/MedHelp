-- Migration: Hematology Pathology Cases Part 4 (31-40)
-- Goal: Cover Hemostasis (Platelets/Coagulation) and Myeloproliferative Disorders
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40;

    -- CASE 31: Immune Thrombocytopenic Purpura (ITP)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Petechiae in a Child', 'A 6-year-old boy presents with a sudden onset of tiny red spots on his skin (petechiae) and easy bruising two weeks after a viral upper respiratory infection. Labs show a platelet count of 20,000/µL. PT and PTT are normal.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ITP", "TTP", "Hemophilia A", "DIC"]', 0, 'ITP is an autoimmune production of IgG against platelet antigens (like GPIIb/IIIa). In children, it often follows a viral infection and is usually self-limiting.'),
    (v_case_id, 'What would a bone marrow biopsy likely show in this patient?', '["Hypocellularity", "Increased megakaryocytes", "Malignant blasts", "Fibrosis"]', 1, 'The bone marrow compensates for the peripheral destruction of platelets by producing more megakaryocytes.'),
    (v_case_id, 'Where is the primary site of platelet destruction and antibody production in ITP?', '["Liver", "Spleen", "Bone Marrow", "Kidneys"]', 1, 'Splenic macrophages ingest the antibody-coated platelets, and the spleen is also a major site of autoantibody production. Splenectomy is a treatment option for refractory cases.');

    -- CASE 32: Thrombotic Thrombocytopenic Purpura (TTP) - Pathophysiology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Confusion and Anemia', 'A 30-year-old woman presents with confusion, fever, and jaundice. Labs show thrombocytopenia and a microangiopathic hemolytic anemia (MAHA). Coagulation studies (PT/PTT) are normal.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The deficiency of which enzyme is responsible for this condition?', '["Factor VIII", "ADAMTS13", "Antithrombin III", "Protein C"]', 1, 'ADAMTS13 normally cleaves large von Willebrand Factor (vWF) multimers. Deficiency leads to large multimers that trigger spontaneous platelet aggregation.'),
    (v_case_id, 'Why are the PT and PTT normal in TTP (unlike in DIC)?', '["Because the liver is healthy", "Because the coagulation cascade is not activated; it is a primary hemostasis problem", "Because the patient is taking aspirin", "It is a lab error"]', 1, 'TTP involves platelet-rich microthrombi, whereas DIC involves widespread consumption of both platelets AND coagulation factors.'),
    (v_case_id, 'What is the immediate life-saving treatment for TTP?', '["Platelet transfusion", "Plasmapheresis (Plasma exchange)", "Heparin", "Aspirin"]', 1, 'Plasmapheresis removes the autoantibodies against ADAMTS13 and provides the missing enzyme. (Note: Platelet transfusion is contraindicated in TTP as it can worsen the thrombosis).');

    -- CASE 33: Bernard-Soulier Syndrome vs Glanzmann Thrombasthenia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The "Giant Platelet" Disorder', 'A child presents with a lifelong history of nosebleeds and easy bruising. Peripheral smear shows unusually large platelets ("giant platelets"). Platelet aggregation studies show a failure to aggregate with ristocetin, which is NOT corrected by adding normal plasma.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Glanzmann Thrombasthenia", "Bernard-Soulier Syndrome", "von Willebrand Disease", "ITP"]', 1, 'Bernard-Soulier is a defect in the GPIb receptor (platelet-vWF adhesion). It features giant platelets and abnormal ristocetin aggregation.'),
    (v_case_id, 'What is the defect in Glanzmann Thrombasthenia?', '["GPIb deficiency", "GPIIb/IIIa deficiency", "vWF deficiency", "ADAMTS13 deficiency"]', 1, 'Glanzmann involves a defect in the GPIIb/IIIa receptor, which is necessary for platelet-platelet aggregation via fibrinogen.'),
    (v_case_id, 'Which test can distinguish Bernard-Soulier from von Willebrand Disease (vWD)?', '["Platelet count", "Ristocetin aggregation with the addition of normal plasma", "PT", "PTT"]', 1, 'In vWD, adding normal plasma (which contains vWF) CORRECTS the ristocetin aggregation. In Bernard-Soulier, it does NOT correct because the platelet receptor itself is missing.');

    -- CASE 34: Hemophilia A
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Joint Bleeding', 'A 10-year-old boy presents with painful swelling of his knee after a minor fall (hemarthrosis). He has a history of prolonged bleeding after tooth extractions. His maternal uncle has a similar condition.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis and inheritance pattern?', '["Hemophilia A; Autosomal Recessive", "Hemophilia A; X-linked Recessive", "Hemophilia B; Autosomal Dominant", "vWD; X-linked"]', 1, 'Hemophilia A (Factor VIII deficiency) and Hemophilia B (Factor IX deficiency) are both X-linked recessive disorders.'),
    (v_case_id, 'Which lab abnormality would you expect in this patient?', '["Prolonged PT, Normal PTT", "Normal PT, Prolonged PTT", "Prolonged Bleeding Time", "Low platelet count"]', 1, 'Factor VIII is part of the intrinsic pathway, which is measured by the Partial Thromboplastin Time (PTT). PT (extrinsic) is normal.'),
    (v_case_id, 'What is the treatment for Hemophilia A?', '["Desmopressin (DDAVP) or Factor VIII concentrate", "Factor IX concentrate", "Platelet transfusion", "Vitamin K"]', 0, 'DDAVP can stimulate the release of vWF and Factor VIII from Weibel-Palade bodies in mild cases; Factor VIII replacement is used for more severe cases.');

    -- CASE 35: von Willebrand Disease (vWD)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Most Common Bleeding Disorder', 'A 20-year-old woman presents with heavy menstrual bleeding and frequent nosebleeds. Her Bleeding Time is prolonged, and her PTT is slightly elevated. Her platelet count is normal.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two primary functions of von Willebrand Factor?', '["Platelet adhesion and stabilization of Factor VIII", "Platelet aggregation and stabilization of Factor IX", "Fibrin cross-linking and clot retraction", "Inhibition of Antithrombin III"]', 0, 'vWF is essential for platelet adhesion to subendothelial collagen (via GPIb) and acts as a carrier protein for Factor VIII.'),
    (v_case_id, 'What is the typical inheritance of the most common form (Type 1) of vWD?', '["X-linked recessive", "Autosomal Dominant", "Autosomal Recessive", "Mitochondrial"]', 1, 'Type 1 vWD is typically autosomal dominant.'),
    (v_case_id, 'What is the classic test for vWD that assesses platelet adhesion in the lab?', '["Prothrombin Time", "Ristocetin cofactor assay", "Thrombin Time", "Fibrinogen level"]', 1, 'Ristocetin induces vWF-platelet binding. Abnormal aggregation in the ristocetin assay is the hallmark of vWD.');

    -- CASE 36: Disseminated Intravascular Coagulation (DIC)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Oozing from IV Sites', 'A patient in the ICU with Gram-negative sepsis suddenly begins oozing blood from his IV sites and surgical wounds. Labs show prolonged PT and PTT, thrombocytopenia, and very low fibrinogen.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathological event in DIC?', '["Primary failure of the liver", "Widespread activation of the coagulation cascade leading to microthrombi and subsequent consumption of factors", "Autoimmune destruction of platelets", "Vitamin K deficiency"]', 1, 'DIC is a "consumptive coagulopathy" where widespread clotting uses up all the platelets and factors, leading to secondary bleeding.'),
    (v_case_id, 'What is the best laboratory marker for the breakdown of cross-linked fibrin in DIC?', '["Bleeding Time", "D-dimer", "PTT", "Platelet count"]', 1, 'D-dimer measures fibrin split products specifically from cross-linked fibrin (clots), making it a sensitive marker for DIC.'),
    (v_case_id, 'Which of the following is a classic obstetric cause of DIC?', '["Abruptio Placentae", "Preeclampsia", "Normal delivery", "Gestational diabetes"]', 0, 'Tissue factor from the placenta (in abruption) can enter the maternal circulation and trigger DIC.');

    -- CASE 37: Hypercoagulable States (Factor V Leiden)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Recurrent DVT', 'A 25-year-old man presents with his second deep vein thrombosis (DVT) in the past year. He does not smoke and has no other medical conditions. His father also had a DVT at a young age.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common inherited cause of hypercoagulability?', '["Antithrombin III deficiency", "Factor V Leiden mutation", "Protein C deficiency", "Prothrombin gene mutation"]', 1, 'Factor V Leiden is a mutation that makes Factor V resistant to inactivation by Protein C.'),
    (v_case_id, 'How do Protein C and Protein S normally inhibit coagulation?', '["They inhibit thrombin directly", "They inactivate Factors Va and VIIIa", "They activate Antithrombin III", "They promote fibrinolysis"]', 1, 'Activated Protein C (with its cofactor Protein S) degrades the "amplifiers" of the cascade, Factors V and VIII.'),
    (v_case_id, 'Why can initiating warfarin in a patient with Protein C deficiency cause "Warfarin Skin Necrosis"?', '["Warfarin is toxic to the skin", "Protein C has a short half-life and its levels drop faster than Factors II, IX, and X, causing a transient hypercoagulable state", "Warfarin causes massive vasodilation", "It is an allergic reaction"]', 1, 'Since Protein C (the brake) disappears before the pro-coagulant factors (the gas), the patient becomes extremely hypercoagulable for the first 24-48 hours of warfarin therapy.');

    -- CASE 38: Polycythemia Vera
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pruritus After a Hot Shower', 'A 60-year-old man presents with headache, dizziness, and intense itching (pruritus) after taking a hot shower. On exam, he has a ruddy complexion (plethora) and an enlarged spleen. Labs show Hb 20 g/dL and WBC 15,000/µL.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic mutation associated with Polycythemia Vera (and other myeloproliferative disorders)?', '["t(9;22)", "JAK2 kinase mutation (V617F)", "c-MYC mutation", "BCL2 mutation"]', 1, 'JAK2 mutation makes the hematopoietic stem cells hypersensitive to growth factors like EPO.'),
    (v_case_id, 'How can Polycythemia Vera (PV) be distinguished from "Secondary Polycythemia" (e.g., due to lung disease)?', '["PV has high EPO levels", "PV has low/absent EPO levels", "Secondary polycythemia has the JAK2 mutation", "Only PV has an increased RBC mass"]', 1, 'In PV, the RBC production is independent of EPO, so negative feedback causes EPO to be very low. In secondary polycythemia (hypoxia), EPO is high.'),
    (v_case_id, 'What is the most common serious complication of Polycythemia Vera?', '["Acute leukemia", "Thrombosis (due to hyperviscosity)", "Iron deficiency", "Bilirubin stones"]', 1, 'The high hematocrit makes the blood extremely viscous, leading to a high risk of DVT, MI, and stroke.');

    -- CASE 39: Essential Thrombocythemia vs Reactive Thrombocytosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Extremely High Platelet Count', 'A 55-year-old woman is found to have a platelet count of 1.2 million/µL on routine labs. She has no symptoms. Bone marrow biopsy shows increased, large, mature megakaryocytes.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CML", "Essential Thrombocythemia (ET)", "Polycythemia Vera", "ITP"]', 1, 'ET is a myeloproliferative disorder characterized by a massive overproduction of platelets. JAK2 mutation is present in ~50% of cases.'),
    (v_case_id, 'What symptom might occur in ET due to microvascular occlusion in the hands and feet?', '["Gout", "Erythromelalgia (burning pain and redness)", "Paresthesia only", "Raynaud phenomenon"]', 1, 'Erythromelalgia is a classic symptom of ET caused by platelet-induced microthrombi.'),
    (v_case_id, 'How does ET differ from Myelofibrosis regarding marrow findings?', '["ET has massive fibrosis", "ET has minimal to no marrow fibrosis and mature megakaryocytes", "There is no difference", "ET always has Auer rods"]', 1, 'Myelofibrosis is characterized by reactive marrow fibrosis; ET lacks significant fibrosis initially.');

    -- CASE 40: Primary Myelofibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Teardrop RBCs', 'A 65-year-old man presents with fatigue and massive splenomegaly. Peripheral smear shows "teardrop" shaped RBCs (dacrocytes) and immature myeloid cells (leukoerythroblastic smear). Bone marrow aspiration is a "dry tap."', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What causes the marrow fibrosis in this condition?', '["The cancer cells turn into collagen", "Neoplastic megakaryocytes secrete PDGF and TGF-beta, which stimulate fibroblasts", "Chronic inflammation", "Radiation exposure"]', 1, 'The malignant megakaryocytes release growth factors that trigger extensive secondary fibrosis of the bone marrow.'),
    (v_case_id, 'Why does the spleen become massive in myelofibrosis?', '["It is full of cancer cells", "Extramedullary hematopoiesis (the spleen takes over RBC production because the marrow is fibrotic)", "Portal hypertension", "Infection"]', 1, 'With the bone marrow "locked" by fibrosis, the spleen (and liver) revert to their fetal role of hematopoiesis, leading to massive enlargement.'),
    (v_case_id, 'Why are "teardrop RBCs" (dacrocytes) seen in this condition?', '["They are genetically abnormal", "They are damaged as they try to squeeze out of a fibrotic bone marrow", "Splenic macrophages bite them", "Oxidative stress"]', 1, 'The RBCs are mechanically deformed as they exit the scarred, fibrotic marrow space.');

    RAISE NOTICE 'SUCCESS: Hematology Pathology Cases Part 4 (31-40) registered.';
END $$;

COMMIT;
