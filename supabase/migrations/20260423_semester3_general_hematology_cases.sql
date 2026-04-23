-- Migration: Semester 3 - General Hematology Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

-- 1. Create/Ensure Topic "General Hematology" for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Hematology', 'general-hematology', 40)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-hematology' LIMIT 1;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15) - Foundations & Common Pathogens
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Iron Deficiency Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fatigue and Ice Craving', 'A 25-year-old female presents with fatigue and a craving for ice (pica). Physical exam reveals pale conjunctivae and spoon-shaped nails.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sideroblastic anemia", "Iron deficiency anemia", "Anemia of chronic disease", "Thalassemia minor"]', 1, 'Koilonychia and pica are highly characteristic of iron deficiency.'),
    (v_case_id, 'Which lab profile is characteristic?', '["Low Ferritin, High TIBC, Low Serum Iron", "High Ferritin, Low TIBC, Low Serum Iron", "Normal Ferritin, Normal TIBC, Low Serum Iron", "Low Ferritin, Low TIBC, High Serum Iron"]', 0, 'Iron deficiency is the only state with low ferritin and high TIBC.'),
    (v_case_id, 'Most common cause in an adult female in the US?', '["Nutritional", "Malabsorption", "Chronic occult blood loss (Menorrhagia)", "Pregnancy"]', 2, 'Menstrual blood loss is the leading cause of iron deficiency in premenopausal women.');

    -- CASE 02: Vitamin B12 Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Numbness and Macrocytosis', 'A 60-year-old male with heavy alcohol use presents with fatigue and numbness in his feet. MCV 115 fL and hypersegmented neutrophils.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Folate deficiency", "Vitamin B12 deficiency", "Iron deficiency", "Aplastic anemia"]', 1, 'Hypersegmented neutrophils and neurological symptoms (numbness) point to B12 deficiency.'),
    (v_case_id, 'Which lab finding helps distinguish this from Folate deficiency?', '["Elevated Homocysteine", "Elevated MMA", "Decreased Reticulocytes", "Decreased Haptoglobin"]', 1, 'Methylmalonic acid (MMA) is only elevated in B12 deficiency, not Folate deficiency.');

    -- CASE 03: Sickle Cell Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bone Pain and Autosplenectomy', 'A 10-year-old African American boy presents with severe bone pain following a chest infection.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Osteomyelitis", "Vaso-occlusive crisis (SCD)", "Aplastic crisis", "Leukemia"]', 1, 'Infection often triggers vaso-occlusive crises in SCD.'),
    (v_case_id, 'What is the molecular substitution in the beta-globin chain?', '["Glu to Lys at pos 6", "Glu to Val at pos 6", "Deletion of alpha-gene", "PNH mutation"]', 1, 'Sickle cell is caused by a Glutamic acid to Valine substitution at position 6.'),
    (v_case_id, 'This patient is at high risk of infection from which type of organisms?', '["Anaerobes", "Encapsulated bacteria", "Viruses", "Fungi"]', 1, 'Autosplenectomy in SCD leads to susceptibility to encapsulated organisms like S. pneumoniae.');

    -- CASE 04: ITP
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Easy Bruising and Epistaxis', 'A 45-year-old female presents with easy bruising. Platelet count 20,000/uL. PT/PTT are normal. Marrow shows increased megakaryocytes.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TTP", "ITP", "DIC", "Von Willebrand Disease"]', 1, 'Isolated thrombocytopenia with normal PT/PTT and increased megakaryocytes is ITP.'),
    (v_case_id, 'What is the mechanism of platelet destruction?', '["Consumption in microthrombi", "Anti-GpIIb/IIIa antibodies", "Failure of production", "ADAMTS13 deficiency"]', 1, 'ITP is caused by autoantibodies (IgG) against platelet surface glycoproteins.');

    -- CASE 05: Polycythemia Vera
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pruritus and Low EPO', 'A 65-year-old male with generalized pruritus after a warm shower and a ruddy complexion. Hb 20 g/dL and low EPO.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Secondary polycythemia", "Polycythemia Vera", "Essential Thrombocythemia", "CML"]', 1, 'Primary polycythemia (PV) is characterized by low EPO and increased red cell mass.'),
    (v_case_id, 'This condition is most commonly associated with which mutation?', '["BCR-ABL", "JAK2", "BRAF", "c-MYC"]', 1, 'JAK2 V617F mutation is present in >95% of PV cases.');

    -- CASE 06: Hemophilia A
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemarthrosis After Minor Fall', 'A 5-year-old boy with massive swelling of the knee joint. PTT is prolonged, PT and bleeding time are normal.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hemophilia A", "Von Willebrand Disease", "Vit K deficiency", "Factor VII deficiency"]', 0, 'Hemarthrosis and isolated prolonged PTT in a boy point to X-linked Hemophilia.'),
    (v_case_id, 'Which coagulation factor is deficient?', '["Factor VII", "Factor VIII", "Factor IX", "Factor XI"]', 1, 'Hemophilia A is a deficiency of Factor VIII.');

    -- CASE 07: PNH
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Morning Dark Urine', 'A 30-year-old male with dark urine in the morning. Flow cytometry shows deficiency of CD55 and CD59.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["G6PD deficiency", "PNH", "Autoimmune hemolytic anemia", "Hereditary spherocytosis"]', 1, 'PNH is caused by an acquired PIGA mutation leading to complement-mediated lysis.'),
    (v_case_id, 'What is the primary cause of death in these patients?', '["Acute Leukemia", "Thrombosis", "Iron overload", "Renal failure"]', 1, 'Venous thrombosis (e.g. Budd-Chiari) is the leading cause of death in PNH.');

    -- CASE 08: CML
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Splenomegaly and Philadelphia Chromosome', 'A 70-year-old male with massive splenomegaly and WBC 150,000/uL. Differential shows full myeloid spectrum and increased basophils.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AML", "CML", "Leukemoid Reaction", "Myelofibrosis"]', 1, 'Massive leukocytosis with basophilia and a shift to the left is classic for CML.'),
    (v_case_id, 'What cytogenetic abnormality is the hallmark?', '["t(15;17)", "t(9;22)", "t(8;14)", "t(11;14)"]', 1, 'CML is defined by the t(9;22) Philadelphia chromosome.');

    -- CASE 09: ALL
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pediatric Fever and TdT+', 'A 3-year-old with fever and bone pain. Smear shows cells with high N:C ratios. Cells are TdT positive.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ALL", "AML", "CLL", "Burkitt Lymphoma"]', 0, 'ALL is the most common childhood leukemia; TdT+ is a marker for lymphoblasts.'),
    (v_case_id, 'Which variant is associated with a mediastinal mass in an adolescent?', '["B-ALL", "T-ALL", "CML", "Hodgkin Lymphoma"]', 1, 'T-ALL often presents as a Mediastinal mass (Teenager/Thymic/T-cell).');

    -- CASE 10: Hodgkin Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Reed-Sternberg Cells', 'A 60-year-old male with painless lymphadenopathy. Biopsy shows Reed-Sternberg cells (Owl-eye nuclei).', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular Lymphoma", "Hodgkin Lymphoma", "DLBCL", "Mantle Cell"]', 1, 'Reed-Sternberg cells are the hallmark of Hodgkin lymphoma.'),
    (v_case_id, 'These cells typically express which markers?', '["CD19/20", "CD15/30", "CD3/4", "CD10/BCL-2"]', 1, 'RS cells are characteristically CD15+ and CD30+.');

    -- CASE 11: Multiple Myeloma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Punched-out Lytic Lesions', 'A 68-year-old male with bone pain and "punched out" lytic lesions on skull X-ray. Hypercalcemia and renal insufficiency present.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Metastatic prostate cancer", "Multiple Myeloma", "Paget''s", "Osteosarcoma"]', 1, 'Multiple Myeloma presents with the CRAB triad: Calcium, Renal, Anemia, Bone.'),
    (v_case_id, 'What would you expect to see on a peripheral smear?', '["Schistocytes", "Rouleaux formation", "Target cells", "Tear-drop cells"]', 1, 'High serum protein (M-spike) reduces charge between RBCs, causing stacking (Rouleaux).'),
    (v_case_id, 'What is the name of the light-chain proteins in urine?', '["Bence-Jones", "Albumin", "Tamm-Horsfall", "Myoglobin"]', 0, 'Bence-Jones proteins are light chains excreted in urine.');

    -- CASE 12: Cold Agglutinin Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mycoplasma and Blue Fingers', 'A patient with recent "walking pneumonia" presents with pale fingers that turn blue in the cold.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Warm AIHA", "Cold AIHA", "Raynaud''s Disease", "PNH"]', 1, 'Mycoplasma pneumonia is a classic trigger for Cold Agglutinin Disease.'),
    (v_case_id, 'Which antibody is responsible?', '["IgG", "IgM", "IgE", "IgA"]', 1, 'Cold AIHA is mediated by IgM (Cold is M, Warm is G).');

    -- CASE 13: DIC
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-C-section Bleeding', 'A pregnant woman develops bleeding from IV sites and respiratory distress after emergency C-section. Low Fibrinogen, high D-dimer.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["TTP", "DIC", "HIT", "Factor V Leiden"]', 1, 'Disseminated Intravascular Coagulation involves consumption of factors and platelets.'),
    (v_case_id, 'What is the characteristic finding on a peripheral smear?', '["Spherocytes", "Schistocytes", "Sickle cells", "Heinz bodies"]', 1, 'Fibrin strands in small vessels shear RBCs into schistocytes.');

    -- CASE 14: Factor V Leiden
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent DVT and Factor V', 'A 24-year-old female with her second DVT in two years. Normal PT/PTT.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common inherited hypercoagulable state?', '["Protein C def", "AT III def", "Factor V Leiden", "Prothrombin mutation"]', 2, 'Factor V Leiden is the #1 inherited thrombophilia.'),
    (v_case_id, 'What is the mechanism?', '["Hyper-responsive platelets", "Resistance to Protein C", "Lack of Vit K", "Fibrinogen overproduction"]', 1, 'Mutated Factor V is resistant to degradation by Activated Protein C.');

    -- CASE 15: CLL
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smudge Cells and Lymphocytosis', 'A 60-year-old male with an incidental finding of absolute lymphocyte count 60,000/uL. Smear shows "smudge cells."', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AML", "CLL", "Hairy Cell", "Infectious Mono"]', 1, 'Smudge cells in an elderly patient with lymphocytosis is diagnostic of CLL.'),
    (v_case_id, 'If this patient develops a rapidly enlarging lymph node, it is:', '["Blast Crisis", "Richter Transformation", "Leukemoid Reaction", "MDS"]', 1, 'Richter Transformation is the conversion of CLL into an aggressive DLBCL.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 16-30) - Enzymopathies & Rare Leukemias
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16: Lead Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lead Paint and Basophilic Stippling', 'A 45-year-old with lead-paint exposure history, abdominal pain, and basophilic stippling on smear.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron deficiency", "Sideroblastic anemia", "Megaloblastic", "Alpha-thal"]', 1, 'Lead poisoning causes a form of sideroblastic anemia.'),
    (v_case_id, 'The "ringed sideroblast" represents iron in which organelle?', '["Golgi", "ER", "Mitochondria", "Lysosome"]', 2, 'Iron accumulates in the mitochondria of erythroid precursors.'),
    (v_case_id, 'Which enzyme is inhibited by lead?', '["Ferrochelatase and ALAD", "Vit K reductase", "G6PD", "Pyruvate kinase"]', 0, 'Lead inhibits ALAD and ferrochelatase in the heme pathway.');

    -- CASE 17: TTP
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'TTP Pentad', 'A 40-year-old female with fever, confusion, schistocytes, thrombocytopenia, and renal failure. Normal PT/PTT.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["DIC", "ITP", "TTP", "HUS"]', 2, 'TTP pentad: FAT RN (Fever, Anemia, Thrombocytopenia, Renal, Neuro).'),
    (v_case_id, 'This condition is caused by a deficiency in which enzyme?', '["G6PD", "ADAMTS13", "NADPH oxidase", "MPO"]', 1, 'Deficiency of ADAMTS13 leads to large vWF multimers and platelet shearing.');

    -- CASE 18: G6PD Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bite Cells and Sulfonamides', 'A 28-year-old treated with sulfonamides develops jaundice. Heinz bodies and bite cells seen.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sickle cell", "G6PD deficiency", "Hereditary spherocytosis", "PNH"]', 1, 'Oxidative stress triggers hemolysis in G6PD deficiency.'),
    (v_case_id, 'Which organ removes Heinz bodies to form "bite cells"?', '["Liver", "Spleen", "Kidney", "Bone marrow"]', 1, 'Splenic macrophages bite out the denatured hemoglobin.');

    -- CASE 19: Hairy Cell Leukemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dry Tap and TRAP Positive', 'A 50-year-old with massive splenomegaly and a "dry tap" on marrow aspiration. Cells stain TRAP positive.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["CLL", "Hairy Cell Leukemia", "CML", "Myelofibrosis"]', 1, 'Hairy cell leukemia causes marrow fibrosis (dry tap) and splenomegaly.'),
    (v_case_id, 'What is the treatment of choice?', '["Imatinib", "Cladribine", "Rituximab", "ATRA"]', 1, 'Cladribine (2-CDA) is a highly effective adenosine analog for HCL.');

    -- CASE 20: Anemia of Chronic Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hepcidin and Rheumatoid Arthritis', 'A 60-year-old with RA has microcytic anemia, high iron stores, and low TIBC.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Iron deficiency", "ACD", "Lead poisoning", "Sideroblastic"]', 1, 'Chronic inflammation leads to iron sequestration.'),
    (v_case_id, 'Which molecule is responsible for sequestering iron?', '["Ferritin", "Hepcidin", "Transferrin", "EPO"]', 1, 'Hepcidin (from the liver) inhibits ferroportin, trapping iron in macrophages.');

    -- CASE 21: Von Willebrand Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'vWF and GpIb Bridge', 'A 35-year-old with epistaxis and heavy menses. Prolonged bleeding time, mildly elevated PTT, normal platelets.', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hemophilia A", "vWD", "ITP", "Bernard-Soulier"]', 1, 'vWD is the most common bleeding disorder; affects both platelets and PTT.'),
    (v_case_id, 'vWF acts as a bridge between which platelet receptor and collagen?', '["GpIIb/IIIa", "GpIb", "P2Y12", "TXA2"]', 1, 'GpIb is the receptor for vWF on the platelet surface.');

    -- CASE 22: Clozapine Agranulocytosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'PTU and Sore Throat', 'A patient on PTU develops high fever and sore throat. ANC 200/uL.', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This condition is known as:', '["Leukemoid reaction", "Agranulocytosis", "Neutrophilia", "Pelger-Huet"]', 1, 'Extreme neutropenia due to drugs is agranulocytosis.'),
    (v_case_id, 'Which other drug is notorious for this?', '["Penicillin", "Clozapine", "Aspirin", "Metformin"]', 1, 'Clozapine (antipsychotic) requires regular WBC monitoring.');

    -- CASE 23: Hereditary Spherocytosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Osmotic Fragility and Ankyrin', 'A newborn with jaundice, anemia, and spherocytes. DAT negative, Osmotic Fragility positive.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Autoimmune hemolytic", "Hereditary Spherocytosis", "G6PD", "Sickle cell trait"]', 1, 'Isolated spherocytosis with positive osmotic fragility is HS.'),
    (v_case_id, 'Condition caused by a defect in which protein?', '["Hemoglobin B", "Ankyrin or Spectrin", "Carbonic anhydrase", "Glycophorin"]', 1, 'Defects in the red cell membrane skeleton (Ankyrin/Spectrin) cause loss of surface area.');

    -- CASE 24: APL and ATRA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Auer Rods and t(15;17)', 'A patient with APL [t(15;17)] is being started on treatment.', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Specific risk associated with starting treatment?', '["Hypercalcemia", "DIC", "Aplastic anemia", "Osteosarcoma"]', 1, 'Auer rods release pro-coagulant factors, triggering DIC.'),
    (v_case_id, 'What is the treatment that forces blasts to mature?', '["Methotrexate", "ATRA", "Cyclophosphamide", "Imatinib"]', 1, 'All-trans retinoic acid (ATRA) bypasses the mutated retinoic acid receptor.');

    -- CASE 25: T-ALL
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mediastinal Mass and T-ALL', 'An adolescent with a large mediastinal mass and high WBC count. Cells are TdT+ and CD3+.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["B-ALL", "T-ALL", "Hodgkin", "CML"]', 1, 'T-cell ALL typically presents as a thymic mass in teenagers.'),
    (v_case_id, 'Which age group is most affected?', '["Neonates", "Adolescents (Teenagers)", "Elderly", "Adults"]', 1, 'T-ALL is the "Teenager" variant of ALL.');

    -- CASE 26: Follicular Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'BCL-2 and t(14;18)', 'A 55-year-old with a neck mass. Biopsy shows small cleaved B-cells in a nodular pattern with t(14;18).', 26)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular Lymphoma", "Burkitt", "Mantle Cell", "Marginal Zone"]', 0, 'Nodular (follicular) growth pattern and t(14;18) define this lymphoma.'),
    (v_case_id, 'Which gene is overexpressed?', '["c-MYC", "BCL-2", "BCL-6", "Cyclin D1"]', 1, 'BCL-2 overexpression inhibits apoptosis in the follicles.');

    -- CASE 27: Beta-Thalassemia Major
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chipmunk Facies and Transfusions', 'A 2-year-old of Mediterranean descent with severe anemia and maxillary marrow expansion.', 27)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Beta-thal minor", "Beta-thal major", "Alpha-thal trait", "Iron def"]', 1, 'Cooley''s anemia (Major) presents with severe anemia and skeletal changes.'),
    (v_case_id, 'What treatment leads to secondary hemochromatosis?', '["Iron supplements", "Chronic blood transfusions", "Splenectomy", "Steroids"]', 1, 'Lifelong transfusions lead to systemic iron overload.');

    -- CASE 28: MGUS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'M-spike without CRAB', 'A 70-year-old with an M-spike (IgG) but no lytic lesions, hypercalcemia, or renal failure.', 28)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Multiple Myeloma", "MGUS", "Waldenstrom", "CLL"]', 1, 'Monoclonal Gammopathy of Undetermined Significance.'),
    (v_case_id, 'What is the risk of transformation per year?', '["1%", "10%", "25%", "50%"]', 0, 'The risk is roughly 1% per year.');

    -- CASE 29: Haptoglobin and Schistocytes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mechanical Valve and Helmet Cells', 'A patient with a mechanical heart valve develops fatigue and schistocytes on smear.', 29)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This type of anemia is classified as:', '["Intrinsic", "MAHA", "Macroangiopathic", "Nutritional"]', 2, 'Mechanical shearing is macroangiopathic (extrinsic mechanical).'),
    (v_case_id, 'Which lab value would be decreased?', '["LDH", "Retic count", "Haptoglobin", "Indirect bilirubin"]', 2, 'Haptoglobin is consumed as it binds free hemoglobin from lysed cells.');

    -- CASE 30: Bernard-Soulier
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'GpIb and Ristocetin', 'Recurrent mucosal bleeds. Platelets don''t aggregate with Ristocetin; adding normal plasma doesn''t fix it.', 30)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["vWD", "Bernard-Soulier Syndrome", "Glanzmann", "ITP"]', 1, 'Defect in GpIb (the receptor for vWF).'),
    (v_case_id, 'How to distinguish from Glanzmann?', '["Glanzmann has normal Ristocetin test", "Glanzmann has low platelets", "Glanzmann is T-cell", "No way"]', 0, 'Glanzmann (GpIIb/IIIa defect) aggregates with Ristocetin but not other agents.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 31-45) - Myeloproliferative & Lymphomas
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31: CML vs Leukemoid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'LAP Score and CML', 'A 40-year-old with massive splenomegaly, WBC 120,000/uL, and a very low LAP score.', 31)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Leukemoid reaction", "CML", "PV", "AML"]', 1, 'Splenomegaly + low LAP = CML.'),
    (v_case_id, 'How does a Leukemoid reaction differ?', '["High LAP score", "Philadelphia chromosome", "Increased basophils", "No way"]', 0, 'Leukemoid reaction (infection) has a high LAP score (functional neutrophils).');

    -- CASE 32: Waldenstrom Macroglobulinemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperviscosity and IgM', 'A 60-year-old with sausage-link retinal veins and a massive IgM M-spike. No lytic lesions.', 32)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Multiple Myeloma", "Waldenström Macroglobulinemia", "MGUS", "Follicular"]', 1, 'IgM pentamers cause hyperviscosity symptoms.'),
    (v_case_id, 'The hyperviscosity is primarily due to:', '["High calcium", "Large pentameric structure of IgM", "Bone tumors", "Anemia"]', 1, 'IgM is a massive pentamer that thickens the blood.');

    -- CASE 33: Burkitt Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Starry Sky Jaw Mass', 'A 10-year-old boy from Africa with a rapidly enlarging jaw mass. Biopsy shows "starry sky" appearance.', 33)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic translocation?', '["t(9;22)", "t(14;18)", "t(8;14)", "t(11;14)"]', 2, 'Burkitt is defined by t(8;14) c-myc translocation.'),
    (v_case_id, 'Which gene is overexpressed?', '["BCL-2", "c-MYC", "Cyclin D1", "ABL"]', 1, 'c-MYC promotes rapid cell growth.');

    -- CASE 34: Splenic Marginal Zone Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hepatitis C and Villous Lymphocytes', 'A 55-year-old with chronic Hep C and a palpable notch in his spleen. Smear shows "villous lymphocytes."', 34)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Splenic Marginal Zone Lymphoma", "Hairy Cell", "CML", "Mantle Cell"]', 0, 'Associated with Hep C; features villous projections.'),
    (v_case_id, 'In which part of the lymph node do these originate?', '["Follicle", "Paracortex", "Marginal zone", "Medullary sinus"]', 2, 'As the name suggests, they arise from the marginal zone.');

    -- CASE 35: Acute ITP in Children
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pediatric Post-Viral Petechiae', 'A 4-year-old girl with petechial rash and recent viral illness. Platelets 15,000/uL.', 35)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line management?', '["Splenectomy", "Observation", "Platelet transfusion", "Anticoagulation"]', 1, 'Childhood ITP is usually self-limiting and managed with observation.'),
    (v_case_id, 'If this occurred in an adult woman, what is the most common association?', '["Lupus (SLE)", "Vit C def", "Alcoholism", "Iron def"]', 0, 'Chronic ITP in adults is often associated with SLE or HIV.');

    -- CASE 36: Nodular Sclerosis Hodgkin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lacunar Cells and Young Females', 'A 25-year-old with a painless neck node. Biopsy shows nodular areas and "lacunar" RS cells.', 36)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely subtype of Hodgkin?', '["Mixed cell", "Nodular sclerosis", "L-depleted", "L-rich"]', 1, 'Nodular sclerosis is the most common subtype.'),
    (v_case_id, 'This subtype is most common in which demographic?', '["Young adult females", "Elderly males", "Children", "HIV patients"]', 0, 'Classic for young women.');

    -- CASE 37: Auer Rods
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'MPO and Auer Rods', 'A 50-year-old with bone pain. Marrow biopsy shows "Auer rods" in the cytoplasm.', 37)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["ALL", "AML", "CML", "CLL"]', 1, 'Auer rods are pathognomonic for AML.'),
    (v_case_id, 'Auer rods are composed of crystallized which enzyme?', '["ALP", "MPO", "TdT", "Lysozyme"]', 1, 'Myeloperoxidase is the primary component.');

    -- CASE 38: Secondary Polycythemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smoking and High Hematocrit', 'A 60-year-old smoker with Hct 60%, high EPO, and arterial O2 saturation 85%.', 38)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is an example of:', '["PV", "Primary", "Secondary (appropriate)", "Relative"]', 2, 'High EPO due to hypoxia is appropriate secondary polycythemia.'),
    (v_case_id, 'How to distinguish from PV?', '["PV has low EPO", "PV has high O2 sat", "PV has JAK2 mutation", "All of the above"]', 3, 'PV is an EPO-independent primary marrow disorder.');

    -- CASE 39: HIT
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heparin and PF4 Antibodies', 'A patient on Heparin has a 50% drop in platelets on day 5.', 39)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ITP", "HIT", "TTP", "DIC"]', 1, 'Heparin-Induced Thrombocytopenia.'),
    (v_case_id, 'What is the mechanism?', '["Toxicity", "IgG against PF4-Heparin", "Consumption in lungs", "Marrow suppression"]', 1, 'Antibodies against PF4 complexes trigger platelet activation.');

    -- CASE 40: G6PD Genetics
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fava Beans and Oxidative Stress', 'A 30-year-old with back pain and dark urine after eating fava beans.', 40)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the inheritance pattern?', '["AD", "AR", "X-linked recessive", "Mitochondrial"]', 2, 'G6PD deficiency is X-linked recessive.'),
    (v_case_id, 'Which molecule is the cell unable to regenerate?', '["Vit E", "Reduced glutathione", "ATP", "2,3-BPG"]', 1, 'NADPH from G6PD is needed to reduce glutathione.');

    -- CASE 41: Myelofibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tear-drop Cells and Dry Tap', 'A 65-year-old with "early satiety" and massive spleen. Marrow shows collagen and tear-drop RBCs.', 41)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["PV", "ET", "Primary Myelofibrosis", "CML"]', 2, 'Marrow fibrosis and tear-drop cells define this condition.'),
    (v_case_id, 'The fibrosis is caused by TGF-beta from which cells?', '["Hepatocytes", "Megakaryocytes", "Lymphocytes", "Erythroblasts"]', 1, 'Atypical megakaryocytes release cytokines that stimulate fibroblasts.');

    -- CASE 42: Lupus Anticoagulant
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Prolonged PTT and Thrombosis', 'Patient with recurrent thrombosis. Prolonged PTT that doesn''t correct with mixing study.', 42)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hemophilia A", "Lupus Anticoagulant", "vWD", "Factor XI def"]', 1, 'Antiphospholipid antibodies cause in vitro PTT prolongation but in vivo thrombosis.'),
    (v_case_id, 'What is the clinical effect in vivo?', '["Bleeding", "Arterial/Venous thrombosis", "No effect", "Low platelets"]', 1, 'It is a hypercoagulable state despite the lab PTT value.');

    -- CASE 43: Sickle Cell Trait Hematuria
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Renal Papillary Necrosis and Sickling', 'A 22-year-old with sickle cell trait has sudden flank pain and hematuria.', 43)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of hematuria?', '["RCC", "Renal papillary necrosis", "Stones", "Bladder cancer"]', 1, 'Ischemia in the medulla leads to papillary sloughing.'),
    (v_case_id, 'Why does this occur in sickle cell trait?', '["High O2", "Low O2/Hypertonicity in medulla", "Iron overload", "Infections"]', 1, 'The renal medulla is the most hypoxemic and hypertonic part of the kidney, promoting sickling even in trait.');

    -- CASE 44: Mantle Cell Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cyclin D1 and t(11;14)', 'A biopsy shows cells with a t(11;14) translocation.', 44)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular", "Mantle Cell", "Marginal Zone", "Burkitt"]', 1, 'Mantle cell is defined by t(11;14) cyclin D1 translocation.'),
    (v_case_id, 'Which protein is overexpressed?', '["BCL-2", "BCL-6", "Cyclin D1", "c-MYC"]', 2, 'Cyclin D1 promotes cell cycle progression.');

    -- CASE 45: Myelodysplastic Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pelger-Huet Cells and MDS', 'A 75-year-old with "Pelger-Huet" cells (bi-lobed neutrophils) and <20% blasts.', 45)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AML", "MDS", "CML", "Aplastic Anemia"]', 1, 'Dysplastic marrow findings in an elderly patient.'),
    (v_case_id, 'High risk of transforming into which disease?', '["ALL", "AML", "CML", "Hodgkin"]', 1, 'MDS often progresses to acute myeloid leukemia.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 46-60) - Transfusion & Advanced Markers
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46: Acute Hemolytic Reaction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Hemolytic Transfusion Reaction', 'A 30-year-old develops fever, chills, and back pain minutes after transfusion. Dark red urine.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Febrile non-hemolytic", "Acute hemolytic", "TRALI", "Delayed hemolytic"]', 1, 'Intravascular hemolysis from ABO incompatibility.'),
    (v_case_id, 'Reaction mediated by which mechanism?', '["Anti-HLA", "Type II hypersensitivity (IgM)", "Cytokines", "IgA deficiency"]', 1, 'Preformed host antibodies (IgM) attack donor RBCs.');

    -- CASE 47: Pure Red Cell Aplasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thymoma and PRCA', 'Normocytic anemia, retic 0.1%, absence of erythroid precursors in marrow.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aplastic", "PRCA", "Myelofibrosis", "Fanconi"]', 1, 'Isolated erythroid failure.'),
    (v_case_id, 'Classically associated with which tumor?', '["RCC", "Thymoma", "Teratoma", "Pheo"]', 1, 'PRCA is a well-known paraneoplastic association of thymoma.');

    -- CASE 48: Beta-Thalassemia Minor Labs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'HbA2 and Beta-Thal Minor', 'Female with Hb 9, MCV 72. Hb electrophoresis shows increased HbA2 (5%).', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron def", "Beta-thal minor", "Alpha-thal trait", "Sideroblastic"]', 1, 'Microcytic anemia with elevated HbA2 is diagnostic of beta-thal minor.'),
    (v_case_id, 'Why is HbA2 elevated?', '["Incr beta-chains", "Compensatory incr in delta-chains", "Alpha-chain failure", "HbF persistence"]', 1, 'Reduced beta-globin leads to shift in chain pairing towards delta.');

    -- CASE 49: Aplastic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Clozapine and Pancytopenia', 'Patient on clozapine develops fatigue, sore throat, and pancytopenia.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is a common cause?', '["Metoprolol", "Digoxin", "Clozapine", "Atorvastatin"]', 2, 'Clozapine can cause both isolated agranulocytosis and aplastic anemia.'),
    (v_case_id, 'If all lines are low, the diagnosis is:', '["Aplastic anemia", "Myelophthisic", "ITP", "Pernicious"]', 0, 'Global marrow failure is aplastic anemia.');

    -- CASE 50: GpIb and Bernard-Soulier
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ristocetin and Bernard-Soulier', 'Recurrent bleeds. Normal platelet count, normal PT/PTT. No response to Ristocetin; normal response to ADP.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Glanzmann", "Bernard-Soulier", "vWD", "Hemophilia C"]', 1, 'Bernard-Soulier is a GpIb deficiency.'),
    (v_case_id, 'Characterized by deficiency in which glycoprotein?', '["GpIIb/IIIa", "GpIb", "GpIa/IIa", "P2Y12"]', 1, 'GpIb is necessary for vWF binding.');

    -- CASE 51: Subacute Combined Degeneration
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gastrectomy and B12 Ataxia', 'Post-gastrectomy patient with fatigue and ataxia in the dark.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What would the smear show?', '["Basophilic stippling", "Macrocytosis/Hypersegmented neutrophils", "Spherocytes", "Microcytosis"]', 1, 'B12 deficiency causes megaloblastic anemia.'),
    (v_case_id, 'Neurological symptoms due to degeneration of which tracts?', '["Lateral corticospinal/Dorsal columns", "Spinothalamic", "Anterior horn", "Cerebellum"]', 0, 'SCD involves dorsal columns (vibration/proprioception) and lateral tracts.');

    -- CASE 52: Factor V Leiden Mechanism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Arg506Gln and Coagulation', 'DVT patient with Arginine to Glutamine replacement at position 506 in a factor gene.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["AT III def", "Factor V Leiden", "Protein C def", "Prothrombin mutation"]', 1, 'Classic Factor V Leiden mutation.'),
    (v_case_id, 'Mutation makes factor resistant to cleavage by:', '["AT III", "Activated Protein C", "Plasmin", "Heparin"]', 1, 'APC cannot turn off mutated Factor V.');

    -- CASE 53: APL Urgency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'APL and DIC Risk', 'AML patient with t(15;17).', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This specific subtype is called:', '["Monocytic", "APL", "Erythroid", "Megakaryoblastic"]', 1, 'Promyelocytic variant.'),
    (v_case_id, 'Primary reason for urgent treatment?', '["Intracranial hemorrhage (DIC)", "Renal failure", "Fractures", "Splenomegaly"]', 0, 'DIC is a catastrophic early complication of APL.');

    -- CASE 54: Follicular t(14;18)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'IgH-BCL2 Fusion', 'Painless neck lump. Biopsy shows small cleaved cells in nodular pattern. t(14;18) present.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular", "Mantle Cell", "DLBCL", "Burkitt"]', 0, 'Follicular lymphoma.'),
    (v_case_id, 'Translocation involves fusion of IgH with which oncogene?', '["c-MYC", "BCL-2", "Cyclin D1", "BCL-6"]', 1, 'BCL-2 is placed under the heavy chain promoter.');

    -- CASE 55: TGF-beta and Myelofibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tear-drop RBCs and Fibrosis', 'Splenomegaly, "dry tap," tear-drop RBCs, and nucleated red cells on smear.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Myelofibrosis", "PV", "CML", "Hairy Cell"]', 0, 'Extensive marrow scarring.'),
    (v_case_id, 'Which cytokine is primarily responsible?', '["TNF-alpha", "TGF-beta", "IL-1", "IFN-gamma"]', 1, 'TGF-beta is the primary driver of fibroblast activity.');

    -- CASE 56: Fanconi Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Absent Radii and DNA Repair', 'Child with bruising, absent radii, hyperpigmentation, pancytopenia, and high MCV.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Diamond-Blackfan", "Fanconi anemia", "Aplastic", "Lead"]', 1, 'Classic Fanconi syndrome with physical anomalies.'),
    (v_case_id, 'What is the underlying molecular defect?', '["DNA repair (cross-link)", "Ribosome", "Heme", "G6PD"]', 0, 'Sensitivity to cross-linking agents due to DNA repair failure.');

    -- CASE 57: EPO in CKD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Renal Anemia', 'Chronic kidney disease patient with Hb 8.5.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Primary cause of anemia is deficiency of:', '["Iron", "B12", "EPO", "Folate"]', 2, 'Loss of renal endocrine function.'),
    (v_case_id, 'EPO is normally produced by which cells?', '["Hepatocytes", "Peritubular interstitial cells", "JG cells", "Macula densa"]', 1, 'Interstitial cells sense oxygen and secrete EPO.');

    -- CASE 58: Glutathione and G6PD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bite Cells and Glutathione', 'Jaundice and dark urine after infection. Bite cells and Heinz bodies on smear.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pyruvate kinase", "G6PD deficiency", "HS", "PNH"]', 1, 'G6PD is required to maintain the cell''s antioxidant defense.'),
    (v_case_id, 'Biochemical role of G6PD in RBC?', '["ATP production", "NADP+ to NADPH reduction", "CO2 conversion", "Na-K pump"]', 1, 'NADPH is the cofactor for glutathione reductase.');

    -- CASE 59: Erythromelalgia and PV
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'JAK2 and Burning Pain', '65-year-old smoker with high RBC count, low EPO, and burning pain in hands/feet.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Secondary", "Polycythemia Vera", "ET", "CML"]', 1, 'Low EPO and erythromelalgia point to PV.'),
    (v_case_id, 'The JAK2 mutation leads to:', '["Decreased sensitivity", "Constitutive activity", "Increased EPO production", "Inhibition"]', 1, 'Cells become independent of external growth factor signals.');

    -- CASE 60 (Final): Mantle Cell G1-S
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cyclin D1 and G1-S Phase', 'Generalized lymphadenopathy. Biopsy: t(11;14) translocation.', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Follicular", "Mantle Cell", "Burkitt", "Marginal Zone"]', 1, 'Mantle cell lymphoma.'),
    (v_case_id, 'Overexpression of Cyclin D1 promotes which phase transition?', '["G1 to S", "G2 to M", "Prophase to Metaphase", "S to G2"]', 0, 'Cyclin D1 drives the transition into DNA synthesis.');

    RAISE NOTICE 'SUCCESS: General Hematology (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
