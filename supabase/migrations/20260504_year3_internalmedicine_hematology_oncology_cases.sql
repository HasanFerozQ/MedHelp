BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-oncology' LIMIT 1;

    -- CASE 01: Iron Deficiency Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fatigue and Pica in an Elderly Male', 'A 70-year-old male presents with fatigue and says he has started chewing on ice cubes. His Hemoglobin is 9.0 g/dL, MCV is 72 fL (Low). Stool guaiac is positive.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["B12 Deficiency", "Iron Deficiency Anemia", "Anemia of Chronic Disease", "Thalassemia"]', 1, 'Microcytic anemia + Pica + GI blood loss is classic for iron deficiency.'),
    (v_case_id, 'What is the most important next step in management for this patient?', '["Start oral iron", "Colonoscopy", "Bone marrow biopsy", "Blood transfusion"]', 1, 'Iron deficiency in an elderly male is colon cancer until proven otherwise.'),
    (v_case_id, 'What lab pattern is characteristic of iron deficiency?', '["Low Ferritin, High TIBC", "High Ferritin, Low TIBC", "Low Ferritin, Low TIBC", "Normal Ferritin"]', 0, 'Ferritin is the storage form; TIBC (Total Iron Binding Capacity) increases to "search" for more iron.');

    -- CASE 02: Vitamin B12 Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Macrocytic Anemia and Neuropathy', 'A 60-year-old female with a history of hypothyroidism presents with numbness and tingling in her feet and an unsteady gait. Hemoglobin 8.5, MCV 115 (High). Peripheral smear shows hypersegmented neutrophils.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Folate Deficiency", "Vitamin B12 Deficiency", "Iron Deficiency", "Lead poisoning"]', 1, 'Macrocytic anemia + neurological symptoms = B12 deficiency (Folate deficiency does NOT cause neuropathy).'),
    (v_case_id, 'What is the specific neurological finding in B12 deficiency called?', '["Subacute Combined Degeneration", "Guillain-Barre", "Multiple Sclerosis", "Tabes dorsalis"]', 0, 'Demyelination of the dorsal columns and lateral corticospinal tracts.'),
    (v_case_id, 'Which lab value is elevated in B12 deficiency but NORMAL in folate deficiency?', '["Homocysteine", "Methylmalonic Acid (MMA)", "Bilirubin", "LDH"]', 1, 'Both have high homocysteine, but only B12 deficiency has high MMA.');

    -- CASE 03: Sickle Cell Disease (Vaso-occlusive Crisis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Bone Pain in a Young African American', 'A 20-year-old male with known Sickle Cell Disease presents with agonizing pain in his legs and back. He has no fever and his chest is clear.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important initial management?', '["Antibiotics", "Aggressive Hydration and Pain Control (Opioids)", "Exchange transfusion", "Oxygen only"]', 1, 'Hydration and analgesia are the cornerstones of crisis management.'),
    (v_case_id, 'Which organism is the most common cause of osteomyelitis in sickle cell patients?', '["Staph aureus", "Salmonella", "Pseudomonas", "E. coli"]', 1, 'Salmonella is uniquely common in this population, though Staph is still a major cause.'),
    (v_case_id, 'What medication is used to increase fetal hemoglobin (HbF) and reduce the frequency of crises?', '["Aspirin", "Hydroxyurea", "Folic Acid", "Prednisone"]', 1, 'HbF interferes with the polymerization of HbS.');

    -- CASE 04: Immune Thrombocytopenic Purpura (ITP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Isolated Thrombocytopenia after a Viral URI', 'A 25-year-old female presents with easy bruising and "tiny red spots" (petechiae) on her legs. She had a cold 2 weeks ago. Labs: Platelets 15,000; WBC and Hb are normal. Peripheral smear shows few but large platelets.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TTP", "ITP", "DIC", "Aplastic Anemia"]', 1, 'Isolated thrombocytopenia following a viral trigger is characteristic of ITP.'),
    (v_case_id, 'What is the underlying pathophysiology?', '["Decreased platelet production", "Anti-platelet antibodies leading to splenic destruction", "Platelet consumption by clots", "Bone marrow failure"]', 1, 'Autoantibodies (usually against GPIIb/IIIa) coat platelets, which are then cleared by splenic macrophages.'),
    (v_case_id, 'What is the first-line treatment for ITP with a platelet count < 30,000?', '["Platelet transfusion", "Corticosteroids or IVIG", "Splenectomy", "Aspirin"]', 1, 'Steroids/IVIG reduce antibody production and splenic clearance.');

    -- CASE 05: Thrombotic Thrombocytopenic Purpura (TTP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Schistocytes and Fever', 'A 35-year-old female presents with confusion, fever, and petechiae. Labs: Platelets 20,000, Hb 8.0, elevated LDH, low haptoglobin. Smear shows "helmet cells" (schistocytes). PT/PTT are normal.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ITP", "TTP", "DIC", "Hereditary Spherocytosis"]', 1, 'Microangiopathic Hemolytic Anemia (MAHA) + Thrombocytopenia = TTP (the "Pentad" includes fever, renal failure, and neuro symptoms).'),
    (v_case_id, 'What is the underlying enzyme deficiency?', '["G6PD", "ADAMTS13", "Pyruvate Kinase", "Factor V"]', 1, 'ADAMTS13 normally cleaves large VWF multimers; its deficiency leads to microthrombi.'),
    (v_case_id, 'What is the most important life-saving treatment?', '["Platelet transfusion", "Emergent Plasma Exchange (Plasmapheresis)", "Steroids only", "Heparin"]', 1, 'Plasmapheresis removes the autoantibody and replaces the missing enzyme. Platelet transfusion is CONTRAINDICATED (it fuels the fire).');

    -- CASE 06: Disseminated Intravascular Coagulation (DIC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Oozing from IV Sites in Sepsis', 'A patient with gram-negative sepsis is noted to have oozing blood from her IV sites and surgical wounds. Labs: Low platelets, low fibrinogen, elevated PT/PTT, and high D-dimer.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TTP", "ITP", "DIC", "Factor VIII deficiency"]', 2, 'DIC is characterized by widespread activation of clotting and fibrinolysis, leading to consumption of factors (prolonged PT/PTT) and platelets.'),
    (v_case_id, 'Which lab finding is most specific for DIC in this context?', '["Low platelets", "Low Fibrinogen and High D-dimer", "High WBC", "Normal PT"]', 1, 'Consumption of fibrinogen and production of fibrin degradation products (D-dimer).'),
    (v_case_id, 'What is the most important step in managing DIC?', '["Heparin", "Treat the underlying cause (e.g., Sepsis)", "Give only platelets", "Give only FFP"]', 1, 'The DIC will not stop until the trigger (sepsis, trauma, malignancy) is addressed.');

    -- CASE 07: Multiple Myeloma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Back Pain, Hypercalcemia, and Renal Failure', 'A 70-year-old male presents with persistent lower back pain. Labs: Hb 10 (Anemia), Ca 11.5 (High), Creatinine 2.2 (High). Serum protein electrophoresis (SPEP) shows a large "M-spike."', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Prostate cancer", "Multiple Myeloma", "Lupus", "Paget disease"]', 1, 'The "CRAB" criteria: Calcium, Renal failure, Anemia, Bone lesions.'),
    (v_case_id, 'What would you expect to see on a skeletal survey (X-ray)?', '["Blastic (white) lesions", "Punch-out lytic lesions", "Normal bones", "Fractures only"]', 1, 'Plasma cell infiltration activates osteoclasts.'),
    (v_case_id, 'What is the characteristic finding on a peripheral smear?', '["Schistocytes", "Rouleaux formation (stacks of RBCs)", "Auer rods", "Target cells"]', 1, 'High protein levels reduce the repulsive charge between RBCs, causing them to stack.');

    -- CASE 08: Chronic Myeloid Leukemia (CML)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Massive Splenomegaly and Leukocytosis', 'A 55-year-old male presents with "fullness" in his abdomen. On exam, he has a massive spleen. Labs: WBC 150,000 with a full spectrum of myeloid cells (myelocytes, metamyelocytes, bands). Basophils are increased.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic cytogenetic abnormality?', '["t(8;14)", "t(9;22) (Philadelphia Chromosome)", "t(15;17)", "t(11;14)"]', 1, 'The BCR-ABL fusion gene.'),
    (v_case_id, 'What is the first-line treatment for chronic phase CML?', '["Chemotherapy", "Tyrosine Kinase Inhibitors (e.g., Imatinib)", "Splenectomy", "Bone marrow transplant immediately"]', 1, 'Imatinib specifically targets the BCR-ABL tyrosine kinase.'),
    (v_case_id, 'What lab value helps distinguish CML from a "Leukemoid Reaction"?', '["WBC count", "Leukocyte Alkaline Phosphatase (LAP) score", "Platelet count", "Hemoglobin"]', 1, 'LAP score is LOW in CML (abnormal cells) and HIGH in a leukemoid reaction (normal response to infection).');

    -- CASE 09: Acute Promyelocytic Leukemia (APL - M3)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pancytopenia and Bleeding (DIC)', 'A 40-year-old female presents with fatigue and bleeding gums. Labs show pancytopenia and evidence of DIC. Bone marrow shows blasts with numerous "Auer rods."', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AML, M3 subtype (APL)", "CML", "CLL", "ALL"]', 0, 'APL is famous for its association with DIC and Auer rods.'),
    (v_case_id, 'What is the characteristic translocation?', '["t(9;22)", "t(15;17)", "t(8;14)", "t(14;18)"]', 1, 'Involves the RAR-alpha gene.'),
    (v_case_id, 'What is the specific life-saving medication used in APL?', '["Imatinib", "All-Trans Retinoic Acid (ATRA)", "Rituximab", "Prednisone"]', 1, 'ATRA forces the promyelocytes to differentiate, stopping the DIC.');

    -- CASE 10: Chronic Lymphocytic Leukemia (CLL)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Elderly Male with Isolated Lymphocytosis', 'An 80-year-old male has a routine blood draw. Labs: WBC 40,000 with 90% mature-appearing lymphocytes. He feels completely fine and has no lymphadenopathy.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ALL", "CLL", "Infectious Mononucleosis", "Lymphoma"]', 1, 'Most common leukemia in the elderly; often an incidental finding.'),
    (v_case_id, 'What characteristic finding is seen on the peripheral smear?', '["Auer rods", "Smudge cells (fragile lymphocytes)", "Schistocytes", "Target cells"]', 1, 'Fragile CLL cells rupture during smear preparation.'),
    (v_case_id, 'What is the most common management for early-stage asymptomatic CLL?', '["Aggressive chemotherapy", "Observation (Watch and Wait)", "Splenectomy", "Radiation"]', 1, 'Treatment does not improve survival in early asymptomatic disease.');

    -- CASE 11: Hodgkin Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Lymphadenopathy and "B" Symptoms', 'A 22-year-old male presents with a painless, firm lump in his neck. He also reports night sweats and a 15 lb weight loss over 2 months. He mentions the lump hurts when he drinks alcohol.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Non-Hodgkin Lymphoma", "Hodgkin Lymphoma", "Mononucleosis", "Sarcoidosis"]', 1, 'Young age + painless nodes + "B" symptoms (fever, sweats, weight loss) + alcohol-induced pain is classic.'),
    (v_case_id, 'What is the pathognomonic cell seen on biopsy?', '["Auer rod", "Reed-Sternberg cell (Owl''s eye)", "Smudge cell", "Blast"]', 1, 'A large, multinucleated B-cell.'),
    (v_case_id, 'Which virus is strongly associated with Hodgkin Lymphoma?', '["HIV", "Epstein-Barr Virus (EBV)", "Hepatitis B", "HPV"]', 1, 'EBV is found in many cases, especially the mixed-cellularity subtype.');

    -- CASE 12: Non-Hodgkin Lymphoma (Burkitt)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rapidly Growing Jaw Mass', 'An 8-year-old boy in Equatorial Africa presents with a massive, rapidly growing tumor on his jaw. Biopsy shows a "starry-sky" appearance.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Burkitt Lymphoma", "Follicular Lymphoma", "Diffuse Large B-cell Lymphoma", "ALL"]', 0, 'The endemic (African) form involves the jaw; the sporadic form involves the abdomen.'),
    (v_case_id, 'What is the characteristic translocation and gene?', '["t(15;17); RAR", "t(8;14); c-myc", "t(9;22); BCR-ABL", "t(14;18); BCL2"]', 1, 'c-myc is a powerful transcription factor that drives rapid cell division.'),
    (v_case_id, 'What does the "starry sky" appearance represent?', '["White cells in blood", "Tingible body macrophages (the stars) in a sea of dark B-cells (the sky)", "Crystals", "None"]', 1, 'High turnover leads to many apoptotic cells cleared by macrophages.');

    -- CASE 13: Von Willebrand Disease (VWD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Easy Bruising and Heavy Periods', 'A 15-year-old female presents with heavy menstrual periods and frequent nosebleeds. Her father also has bleeding issues. Labs: Platelets normal, PT normal, PTT slightly prolonged, Bleeding time prolonged.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common inherited bleeding disorder?', '["Hemophilia A", "Von Willebrand Disease", "Factor V Leiden", "ITP"]', 1, 'Autosomal dominant inheritance.'),
    (v_case_id, 'What is the dual function of Von Willebrand Factor?', '["Platelet adhesion and carrying Factor VIII", "Platelet aggregation and carrying Factor IX", "Fibrinolysis", "Anti-coagulation"]', 0, 'VWF links platelets to collagen and protects Factor VIII from degradation.'),
    (v_case_id, 'What is the initial treatment for mild VWD bleeding?', '["Factor VIII concentrate", "Desmopressin (dDAVP)", "FFP", "Platelets"]', 1, 'dDAVP stimulates the release of VWF from endothelial cells (Weibel-Palade bodies).');

    -- CASE 14: Hemophilia A
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemarthrosis in a Male Child', 'A 5-year-old boy presents with severe pain and swelling in his knee after a minor fall. He has a history of prolonged bleeding after a circumcision. Labs: PT normal, PTT prolonged.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the deficiency?', '["Factor IX", "Factor VIII", "Factor VII", "Factor XI"]', 1, 'Hemophilia A is Factor VIII deficiency; Hemophilia B is Factor IX deficiency.'),
    (v_case_id, 'What is the inheritance pattern?', '["Autosomal dominant", "X-linked recessive", "Autosomal recessive", "Mitochondrial"]', 1, 'Almost exclusively affects males.'),
    (v_case_id, 'A "mixing study" is performed (mixing patient plasma with normal plasma) and the PTT corrects to normal. What does this indicate?', '["Factor deficiency", "Factor inhibitor (antibody)", "Normal patient", "Lab error"]', 0, 'Correction means there is a missing factor; failure to correct means there is an inhibitor (antibody).');

    -- CASE 15: Factor V Leiden
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent DVT in a Young Male', 'A 25-year-old male presents with his second deep vein thrombosis (DVT). He does not smoke and has no recent surgeries. His family has a history of "clots."', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common inherited hypercoagulable state?', '["Protein C deficiency", "Factor V Leiden", "Antithrombin III deficiency", "Antiphospholipid syndrome"]', 1, 'Caused by a mutation that makes Factor V resistant to inactivation by Protein C.'),
    (v_case_id, 'What is the mechanism of Factor V Leiden?', '["Overproduction of thrombin", "Resistance to Activated Protein C (APC)", "Low platelets", "High fibrinogen"]', 1, 'Factor V remains active longer, promoting clotting.'),
    (v_case_id, 'What is the recommended management for a first-time DVT in a patient with Factor V Leiden?', '["Life-long warfarin", "Standard 3-6 months of anticoagulation", "Aspirin only", "No treatment"]', 1, 'Life-long treatment is usually reserved for recurrent or life-threatening clots.');

    -- CASE 16: Polycythemia Vera
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pruritus after a Hot Shower', 'A 60-year-old male presents with headaches and severe itching after taking a hot shower. On exam, his face is "ruddy" and he has a large spleen. Hct 60%, WBC 15,000, Platelets 500,000.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Secondary polycythemia", "Polycythemia Vera", "CML", "Myelofibrosis"]', 1, 'A myeloproliferative disorder involving all three cell lines.'),
    (v_case_id, 'What is the pathognomonic mutation?', '["BCR-ABL", "JAK2 mutation", "BRAF", "p53"]', 1, 'Found in > 95% of patients; makes hematopoietic cells hypersensitive to growth factors.'),
    (v_case_id, 'What is the first-line treatment to reduce the risk of thrombosis?', '["Aspirin only", "Therapeutic Phlebotomy and low-dose aspirin", "Chemotherapy", "Splenectomy"]', 1, 'The goal is to keep the Hematocrit < 45%.');

    -- CASE 17: G6PD Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemolysis after Fava Beans or Antibiotics', 'A 20-year-old African American male presents with dark urine and jaundice 2 days after starting Nitrofurantoin for a UTI. Smear shows "Bite cells" and "Heinz bodies."', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect?', '["Unstable hemoglobin", "G6PD Deficiency", "Pyruvate kinase deficiency", "Spherocytosis"]', 1, 'Reduced ability to handle oxidative stress in RBCs.'),
    (v_case_id, 'What are Heinz bodies?', '["Iron deposits", "Precipitated hemoglobin", "Nuclear remnants", "Mitochondria"]', 1, 'Denatured hemoglobin due to oxidation.'),
    (v_case_id, 'What is the inheritance pattern of G6PD deficiency?', '["Autosomal dominant", "X-linked recessive", "Autosomal recessive", "Mitochondrial"]', 1, 'Most common in males of African, Mediterranean, or Asian descent.');

    -- CASE 18: Hereditary Spherocytosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Spherocytes and Splenomegaly', 'A 15-year-old boy presents with jaundice and a large spleen. His MCHC (Mean Corpuscular Hemoglobin Concentration) is elevated. Smear shows small, round red cells with no central pallor.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect?', '["Enzyme deficiency", "Defect in RBC membrane proteins (e.g., Spectrin/Ankyrin)", "Hemoglobin defect", "Antibody"]', 1, 'Leads to loss of membrane surface area, forcing cells into a spherical shape.'),
    (v_case_id, 'What is the classic diagnostic test?', '["Coombs test", "Osmotic Fragility Test", "Ham test", "Mixing study"]', 1, 'Spherocytes are fragile and burst easily in hypotonic solutions.'),
    (v_case_id, 'What is the definitive treatment to stop the hemolysis?', '["Steroids", "Splenectomy", "Blood transfusion", "Folic acid only"]', 1, 'The spleen is the site of destruction; removing it cures the anemia (though spherocytes remain).');

    -- CASE 19: Autoimmune Hemolytic Anemia (Warm)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Positive Coombs Test and Spherocytes', 'A 40-year-old female with Lupus presents with fatigue and jaundice. Smear shows spherocytes. Direct Coombs test is positive for IgG.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hereditary Spherocytosis", "Warm Autoimmune Hemolytic Anemia (AIHA)", "Cold Agglutinin Disease", "G6PD deficiency"]', 1, 'IgG-mediated destruction at body temperature.'),
    (v_case_id, 'How is this distinguished from Hereditary Spherocytosis?', '["HS has a positive Coombs test", "AIHA has a positive Direct Coombs test; HS is negative", "AIHA has low MCHC", "None"]', 1, 'Coombs test detects antibodies on the RBC surface.'),
    (v_case_id, 'What is the first-line treatment for Warm AIHA?', '["Splenectomy", "Corticosteroids", "Warfarin", "Avoid cold"]', 1, 'Steroids reduce antibody production and splenic clearance.');

    -- CASE 20: Cold Agglutinin Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blue Fingers and Hemolysis in the Winter', 'A 70-year-old male with a history of Mycoplasma pneumonia presents with painful, blue fingers when he goes outside. Direct Coombs is positive for C3 (complement) but negative for IgG.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Warm AIHA", "Cold Agglutinin Disease", "Raynaud disease only", "Cryoglobulinemia"]', 1, 'IgM-mediated hemolysis that occurs at cold temperatures.'),
    (v_case_id, 'What is the primary treatment?', '["Steroids", "Avoiding cold and Rituximab", "Splenectomy", "Aspirin"]', 1, 'Cold agglutinin (IgM) does not respond well to steroids or splenectomy because destruction is mediated by complement in the liver.'),
    (v_case_id, 'Which infection is a classic trigger for transient cold agglutinins?', '["Staph aureus", "Mycoplasma pneumoniae or EBV", "HIV", "Malaria"]', 1, 'Often resolves once the infection is treated.');

    -- CASE 21: Aplastic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pancytopenia and an "Empty" Bone Marrow', 'A 25-year-old male presents with fatigue, easy bruising, and recurrent infections. Labs: WBC 1,000, Hb 7.0, Platelets 10,000. Bone marrow biopsy shows "hypocellularity with increased fat.".', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Leukemia", "Aplastic Anemia", "Myelofibrosis", "B12 deficiency"]', 1, 'Failure of all three cell lines due to marrow destruction.'),
    (v_case_id, 'What is the most common cause of acquired aplastic anemia?', '["Drugs", "Idiopathic/Autoimmune (T-cell mediated)", "Radiation", "Parvovirus B19"]', 1, 'The body''s own T-cells attack the stem cells.'),
    (v_case_id, 'What is the definitive treatment for a young patient with severe aplastic anemia?', '["Transfusions only", "Allogeneic Bone Marrow Transplant", "Erythropoietin", "Splenectomy"]', 1, 'Standard of care for fit, young patients with a donor.');

    -- CASE 22: Paroxysmal Nocturnal Hemoglobinuria (PNH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dark Urine in the Morning and Clots', 'A 30-year-old male presents with dark urine when he wakes up and a new clot in his hepatic vein (Budd-Chiari syndrome). Labs show Coombs-negative hemolytic anemia and pancytopenia.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect?', '["Enzyme", "Acquired mutation in the PIGA gene (loss of GPI anchor)", "Factor deficiency", "Antibody"]', 1, 'Loss of GPI anchor prevents CD55/CD59 (complement inhibitors) from binding to RBCs.'),
    (v_case_id, 'What is the gold standard diagnostic test?', '["Ham test", "Flow cytometry for CD55 and CD59", "Coombs test", "Bilirubin"]', 1, 'Shows absence of these protective proteins on the cell surface.'),
    (v_case_id, 'What is the major cause of death in PNH?', '["Anemia", "Venous Thrombosis (often in unusual locations)", "Infection", "Kidney failure"]', 1, 'Clots in the portal, hepatic, or cerebral veins.');

    -- CASE 23: Myelodysplastic Syndrome (MDS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pancytopenia and Ringed Sideroblasts', 'A 75-year-old male presents with worsening fatigue. Labs: WBC 2,000, Hb 8.5, Platelets 50,000. Bone marrow shows hypercellularity with "dysplastic" changes and 10% blasts. Iron stain shows "ringed sideroblasts."', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["AML", "Myelodysplastic Syndrome (MDS)", "Aplastic Anemia", "B12 deficiency"]', 1, 'MDS is "pre-leukemia"; ineffective hematopoiesis in the elderly.'),
    (v_case_id, 'What is the most feared complication of MDS?', '["Transformation to Acute Myeloid Leukemia (AML)", "Transformation to ALL", "Heart failure", "Stones"]', 0, 'Occurs when the blast count exceeds 20%.'),
    (v_case_id, 'Ringed sideroblasts represent iron trapped in which organelle?', '["Nucleus", "Mitochondria", "Lysosome", "ER"]', 1, 'Due to defective heme synthesis.');

    -- CASE 24: Myelofibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Dry Tap" and Teardrop Cells', 'A 65-year-old male presents with massive splenomegaly. Bone marrow aspiration is unsuccessful (a "dry tap"). Peripheral smear shows "teardrop-shaped" RBCs and immature myeloid cells.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CML", "Primary Myelofibrosis", "Leukemia", "Lymphoma"]', 1, 'Replacement of bone marrow with fibrous tissue (collagen).'),
    (v_case_id, 'What are teardrop cells (dacrocytes) a sign of?', '["Iron deficiency", "Marrow fibrosis/infiltration", "Liver disease", "Hemolysis"]', 1, 'RBCs are damaged as they squeeze through the fibrotic marrow.'),
    (v_case_id, 'Why is the spleen so large?', '["It is infected", "Extramedullary hematopoiesis (the spleen takes over blood production)", "It is storing iron", "None"]', 1, 'The spleen and liver try to compensate for the failed bone marrow.');

    -- CASE 25: Heparin-Induced Thrombocytopenia (HIT)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Platelet Drop and New Clots on Heparin', 'A 60-year-old hospitalized for a PE is started on a Heparin drip. On day 6, his platelet count drops from 200,000 to 80,000, and he develops a new DVT in his leg.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["ITP", "HIT (Type II)", "DIC", "TTP"]', 1, 'Antibodies against Heparin-Platelet Factor 4 (PF4) complexes.'),
    (v_case_id, 'What is the most important first step?', '["Give more heparin", "Stop all heparin and start a non-heparin anticoagulant (e.g., Argatroban)", "Platelet transfusion", "Aspirin"]', 1, 'Continuing heparin is dangerous; must use a Direct Thrombin Inhibitor.'),
    (v_case_id, 'What is the paradox of HIT?', '["Bleeding with low platelets", "Clotting with low platelets", "High WBC", "None"]', 1, 'The antibodies actually activate platelets, leading to thrombosis despite the low count.');

    -- CASE 26: Antiphospholipid Syndrome (APS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent Miscarriages and a Clot', 'A 30-year-old female with Lupus presents with a DVT. She has a history of 3 miscarriages before 10 weeks of gestation. Her PTT is paradoxically prolonged, but her bleeding time is normal.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Factor V Leiden", "Antiphospholipid Syndrome", "VWD", "Hemophilia"]', 1, 'Autoimmune hypercoagulable state.'),
    (v_case_id, 'Which lab test is used for diagnosis?', '["ANA", "Lupus Anticoagulant or Anti-cardiolipin antibodies", "PTT only", "Platelets"]', 1, 'Lupus anticoagulant causes a false prolongation of PTT in vitro but causes clotting in vivo.'),
    (v_case_id, 'What is the long-term management for a patient with APS and a clot?', '["Aspirin", "Life-long Warfarin", "Standard heparin", "Steroids"]', 1, 'High risk of recurrence necessitates long-term anticoagulation.');

    -- CASE 27: Waldenström Macroglobulinemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperviscosity and IgM M-Spike', 'A 70-year-old male presents with blurry vision and headaches. Labs show a massive IgM M-spike on SPEP. There are no lytic bone lesions or hypercalcemia. Fundoscopic exam shows dilated, "sausage-link" retinal veins.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Multiple Myeloma", "Waldenström Macroglobulinemia", "CLL", "Lymphoma"]', 1, 'A lymphoplasmacytic lymphoma that secretes IgM (a large pentamer), causing "thick blood."'),
    (v_case_id, 'What is the immediate treatment for severe hyperviscosity symptoms (stroke/blindness)?', '["Chemotherapy", "Plasmapheresis", "Blood transfusion", "Aspirin"]', 1, 'Urgent removal of the IgM pentamers.'),
    (v_case_id, 'How is this distinguished from Multiple Myeloma?', '["MM has IgM spike", "MM has IgG/IgA spikes and bone lesions; Waldenström has IgM and NO bone lesions", "Both are the same", "None"]', 1, 'Waldenström is a lymphoma, Myeloma is a plasma cell dyscrasia.');

    -- CASE 28: Tumor Lysis Syndrome (TLS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Renal Failure after First Dose of Chemo', 'A patient with high-grade lymphoma is started on chemotherapy. 24 hours later, his creatinine rises, and labs show high Potassium, high Uric Acid, high Phosphorus, and LOW Calcium.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Septic shock", "Tumor Lysis Syndrome", "ATN from chemo", "Hypercalcemia of malignancy"]', 1, 'Massive release of intracellular contents from dying tumor cells.'),
    (v_case_id, 'Which electrolyte is LOW in TLS?', '["Potassium", "Phosphorus", "Calcium", "Uric Acid"]', 2, 'Calcium drops because it binds to the massive amounts of released phosphorus (forming calcium phosphate crystals).'),
    (v_case_id, 'What medication is given to prevent TLS by inhibiting uric acid production?', '["Rasburicase", "Allopurinol", "Furosemide", "Bicarbonate"]', 1, 'Allopurinol blocks xanthine oxidase; Rasburicase breaks down existing uric acid.');

    -- CASE 29: Essential Thrombocythemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Platelets > 1 Million and Burning Hands', 'A 50-year-old female presents with "burning pain" in her hands (erythromelalgia). Her Platelet count is 1.2 million. WBC and Hb are normal. Bone marrow shows increased large megakaryocytes.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CML", "Essential Thrombocythemia", "Iron deficiency", "Polycythemia Vera"]', 1, 'Myeloproliferative disorder of the megakaryocytic line.'),
    (v_case_id, 'What is the primary risk for these patients?', '["Bleeding", "Thrombosis or Hemorrhage (paradoxical)", "Infection", "Liver failure"]', 1, 'Both clotting and bleeding (due to acquired VWD from high platelet count) are risks.'),
    (v_case_id, 'What mutation is found in about 50% of ET patients?', '["BCR-ABL", "JAK2", "BRAF", "RET"]', 1, 'Similar to Polycythemia Vera.');

    -- CASE 30: Febrile Neutropenia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Low WBC after Chemo', 'A patient receiving chemotherapy for breast cancer presents with a temperature of 102\u00b0F. Her Absolute Neutrophil Count (ANC) is 300 cells/mm3.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis", "Febrile Neutropenia", "Common cold", "Drug fever"]', 1, 'A medical emergency defined by fever + ANC < 500.'),
    (v_case_id, 'What is the most appropriate initial management?', '["Wait for cultures", "Immediate broad-spectrum IV antibiotics (e.g., Cefepime or Pip-Tazo)", "Acetaminophen only", "G-CSF only"]', 1, 'Must cover Pseudomonas and other gram-negatives immediately.'),
    (v_case_id, 'Why are these patients at such high risk?', '["They have no immune defense", "They are old", "The chemo is toxic", "None"]', 0, 'Neutrophils are the first line of defense against bacteria and fungi.');

    RAISE NOTICE 'SUCCESS: Hematology/Oncology Case Blocks (1-30) registered.';
END $$;

COMMIT;
