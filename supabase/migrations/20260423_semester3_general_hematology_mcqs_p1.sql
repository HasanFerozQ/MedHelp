-- Migration: Semester 3 - General Hematology MCQ Bank (PART 1: 1-100)
-- Date: 2026-04-23

BEGIN;

-- 1. Ensure Topic "General Hematology" exists for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Hematology', 'general-hematology', 40)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-hematology' LIMIT 1;

    -- SECTION 1: MICROCYTIC & MEGALOBLASTIC ANEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Fatigue and pica. Hb 9, MCV 72, increased RDW. Likely iron study findings?', '["Increased Ferritin, Decreased TIBC", "Decreased Ferritin, Increased TIBC", "Increased Ferritin, Increased TIBC", "Normal Ferritin, Decreased TIBC"]', 1, 'Iron deficiency presents with low ferritin (stored iron) and high TIBC (transferrin hunt).'),
    (v_topic_id, 'Mediterranean male with mild anemia (Hb 10.5), very low MCV (60), normal RBC count. Mentzer < 13. Diagnosis?', '["Iron Deficiency", "Beta-Thalassemia Trait", "Sideroblastic Anemia", "Lead Poisoning"]', 1, 'Thalassemia trait shows disproportionate microcytosis relative to the degree of anemia.'),
    (v_topic_id, 'Alcoholic with macrocytic anemia (MCV 115) and hypersegmented neutrophils. Likely deficiency?', '["Vitamin B12", "Folate", "Iron", "Vitamin B6"]', 1, 'Folate deficiency is common in alcoholics due to poor diet and impaired enterohepatic circulation.'),
    (v_topic_id, 'B12 deficiency (pernicious anemia) elevates which metabolites?', '["Only Homocysteine", "Only Methylmalonic Acid (MMA)", "Both Homocysteine and MMA", "Neither"]', 2, 'B12 is a cofactor for both pathways; folate deficiency only elevates homocysteine.'),
    (v_topic_id, 'Hallmark finding on peripheral smear for Sideroblastic Anemia?', '["Target cells", "Basophilic stippling", "Ringed sideroblasts in marrow", "Heinz bodies"]', 2, 'Iron-laden mitochondria encircling the nucleus of erythroid precursors (Prussian blue).'),
    (v_topic_id, 'Child with irritability/abdominal pain. Microcytic anemia with coarse basophilic stippling:', '["Alpha-Thalassemia", "Lead Poisoning", "Anemia of Chronic Disease", "G6PD"]', 1, 'Lead inhibits ferrochelatase and ALA dehydratase; causes ribosomal RNA degradation.'),
    (v_topic_id, 'Primary cytokine mediator of Anemia of Chronic Disease?', '["IL-1", "IL-6 (inducing Hepcidin)", "TNF-alpha", "Erythropoietin"]', 1, 'IL-6 stimulates liver production of Hepcidin, sequestering iron in macrophages.'),
    (v_topic_id, 'Macrocytic anemia, no hypersegmented neutrophils, history of hypothyroidism:', '["Megaloblastic", "Non-megaloblastic macrocytic", "Microcytic", "Hemolytic"]', 1, 'Non-megaloblastic macrocytosis occurs in hypothyroidism; DNA synthesis is unaffected.'),
    (v_topic_id, 'Schilling test (historic) was designed to differentiate:', '["Iron malabsorption", "B12 malabsorption", "Folate deficiency", "Hemolysis"]', 1, 'Determined if B12 deficiency was due to IF lack or ileal malabsorption.'),
    (v_topic_id, 'Child with "crew-cut" skull X-ray and "chipmunk facies". Transfusion-dependent:', '["Sickle Cell", "Beta-Thalassemia Major", "Hereditary Spherocytosis", "Diamond-Blackfan"]', 1, 'Ineffective erythropoiesis leads to massive marrow expansion into cortical bone.');

    -- SECTION 2: HEMOLYTIC ANEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Dark urine in morning; CD55/CD59 deficiency on flow cytometry. Mechanism?', '["Antibody lysis", "Complement-mediated lysis (no GPI-anchor)", "Oxidative stress", "Trauma"]', 1, 'PNH involves PIGA mutation, increasing complement sensitivity of RBCs.'),
    (v_topic_id, 'Jaundice and dark urine after Nitrofurantoin. Smear: Bite cells and Heinz bodies:', '["G6PD Deficiency", "Pyruvate Kinase", "Autoimmune", "Hereditary Spherocytosis"]', 0, 'Heinz bodies (precipitated Hb) are removed by splenic macrophages, forming bite cells.'),
    (v_topic_id, 'Which is an Intravascular hemolysis finding?', '["Splenomegaly", "Increased Haptoglobin", "Hemoglobinuria and Hemosiderinuria", "Microspherocytes"]', 2, 'Free Hb binds haptoglobin (lowering it) and spills into urine.'),
    (v_topic_id, 'Splenomegaly, increased MCHC, positive osmotic fragility. What is the defect?', '["Hb chain", "RBC membrane (Ankyrin/Spectrin)", "Glycolytic", "Heme synthesis"]', 1, 'Hereditary Spherocytosis results in small, round cells fragile in hypotonic solutions.'),
    (v_topic_id, 'Warm Autoimmune Hemolytic Anemia (WAIHA) is typically mediated by:', '["IgM", "IgG", "IgA", "Complement C3"]', 1, 'IgG-coated RBCs are partially eaten by splenic macrophages (Warm = Great = IgG).'),
    (v_topic_id, 'Cold Agglutinin Disease is associated with which infection?', '["Streptococcus pneumoniae", "Mycoplasma pneumoniae", "Staphylococcus aureus", "E. coli"]', 1, 'IgM antibodies against I-antigen cause agglutination in cold temps.'),
    (v_topic_id, 'Sickle Cell patient risk for "Aplastic Crisis" if infected with:', '["EBV", "Parvovirus B19", "CMV", "Hepatitis B"]', 1, 'Parvovirus B19 infects erythroid precursors; fatal in high-turnover states.'),
    (v_topic_id, 'Most common cause of death in adult Sickle Cell patients?', '["Splenic sequestration", "Acute Chest Syndrome", "Encapsulated infection", "Aplastic crisis"]', 1, 'Acute Chest Syndrome: pulmonary infiltrates, chest pain, and hypoxia.'),
    (v_topic_id, 'Female with MAHA, thrombocytopenia, and acute renal failure diagnosis?', '["TTP", "HUS", "DIC", "ITP"]', 1, 'HUS triad: MAHA, low platelets, and renal failure.'),
    (v_topic_id, 'Primary mutation in Sickle Cell Anemia?', '["Glutamic acid to Valine at position 6", "Glutamic acid to Lysine", "Alpha deletion", "Nonsense beta"]', 0, 'Substitution of hydrophilic acid for hydrophobic valine causes HbS polymerization.');

    -- SECTION 3: WHITE BLOOD CELL DISORDERS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Boy with bone pain, fever, lymphadenopathy. Marrow blasts are TdT-positive:', '["AML", "ALL", "CML", "CLL"]', 1, 'ALL is the most common pediatric cancer; TdT is a pre-lymphoid marker.'),
    (v_topic_id, 'Elderly male incidental 50k WBC; mature lymphocytes and smudge cells:', '["CML", "CLL", "Hairy Cell", "Hodgkin"]', 1, 'CLL involves mature B-cell proliferation; cells are fragile (smudge).'),
    (v_topic_id, 'Philadelphia chromosome t(9;22) is the hallmark of:', '["AML", "CML", "Burkitt", "Follicular"]', 1, 'BCR-ABL fusion protein has constitutive tyrosine kinase activity.'),
    (v_topic_id, 'Acute Promyelocytic Leukemia (APL, M3) complication risk?', '["CNS", "DIC", "Hyperuricemia", "Gum hyperplasia"]', 1, 'Granules in APL blasts contain procoagulants triggering DIC.'),
    (v_topic_id, 'Auer rods are characteristic of:', '["ALL", "AML", "CLL", "CML"]', 1, 'Auer rods are crystallized granules found in myeloblasts.'),
    (v_topic_id, 'Massive splenomegaly, "dry tap", TRAP stain positive:', '["CML", "Hairy Cell Leukemia", "Myelofibrosis", "Multiple Myeloma"]', 1, 'Hairy Cell is a B-cell neoplasm causing marrow fibrosis.'),
    (v_topic_id, 'Lymphoma with t(8;14) and "starry sky" appearance:', '["Follicular", "Mantle Cell", "Burkitt Lymphoma", "Marginal Zone"]', 2, 'C-myc translocation leads to rapid cell turnover; "stars" are macrophages.'),
    (v_topic_id, 'Reed-Sternberg cells (Owl''s eye nuclei) are diagnostic for:', '["Non-Hodgkin", "Hodgkin Lymphoma", "Mono", "Multiple Myeloma"]', 1, 'RS cells are CD15+ and CD30+.'),
    (v_topic_id, 'Elderly with high Calcium, Renal failure, Anemia, Bone lesions. Smear find?', '["Schistocytes", "Rouleaux formation", "Target cells", "Teardrop"]', 1, 'Monoclonal IgG in Myeloma causes RBCs to stack like coins (Rouleaux).'),
    (v_topic_id, 'Follicular Lymphoma translocation (BCL-2 overexpression):', '["t(14;18)", "t(11;14)", "t(8;14)", "t(15;17)"]', 0, 'BCL-2 translocation to Ig heavy chain (14) prevents B-cell apoptosis.');

    -- SECTION 4: HEMOSTASIS & COAGULATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Boy with joint bleeding (hemarthrosis). Normal PT, prolonged PTT:', '["Factor VII", "Factor VIII", "Factor X", "Platelets"]', 1, 'Hemophilia A (VIII) presents with deep tissue bleeding and isolated PTT elevation.'),
    (v_topic_id, 'Bruising/heavy menses. Normal platelets, long bleeding time, slightly elevated PTT:', '["Hemophilia A", "Von Willebrand Disease (vWD)", "ITP", "Bernard-Soulier"]', 1, 'vWF is needed for adhesion and carries Factor VIII.'),
    (v_topic_id, 'Test used for Extrinsic pathway and monitoring Warfarin?', '["PTT", "Bleeding Time", "PT/INR", "Thrombin Time"]', 2, 'Warfarin affects Factor VII (extrinsic) which has the shortest half-life.'),
    (v_topic_id, 'Skin necrosis after starting Warfarin. Which protein deficiency likely?', '["Factor V Leiden", "Antithrombin III", "Protein C", "Factor VIII"]', 2, 'Protein C drops faster than factors II, IX, X, creating transient hypercoagulability.'),
    (v_topic_id, 'Drug used to acutely reverse Heparin effect?', '["Vitamin K", "Protamine Sulfate", "Aminocaproic acid", "FFP"]', 1, 'Positive Protamine neutralizes negative Heparin.'),
    (v_topic_id, 'Platelets fail to aggregate with Ristocetin; normal plasma corrects defect:', '["Bernard-Soulier", "Glanzmann", "Von Willebrand Disease", "ITP"]', 2, 'Correction with normal plasma (vWF source) indicates vWD.'),
    (v_topic_id, 'Bernard-Soulier Syndrome deficiency?', '["GPIIb/IIIa", "GpIb", "vWF", "ADP receptors"]', 1, 'GpIb is the receptor for platelet adhesion (BS = Big Spends = GpIb).'),
    (v_topic_id, 'Glanzmann Thrombasthenia deficiency?', '["GpIb", "GPIIb/IIIa", "Factor V", "Fibrinogen"]', 1, 'GPIIb/IIIa is required for aggregation (fibrinogen binding).'),
    (v_topic_id, 'ICU patient with bleeding, low platelets/fibrinogen, elevated D-dimer:', '["TTP", "ITP", "DIC", "vWD"]', 2, 'DIC involves widespread clotting activation and secondary fibrinolysis.'),
    (v_topic_id, 'Mechanism of Heparin-Induced Thrombocytopenia (HIT)?', '["Toxic effect", "IgG against Heparin-PF4 complexes", "Spleen sequestration", "Megakaryocyte inhibition"]', 1, 'Immune complexes activate platelets, causing paradoxically high thrombosis risk.');

    -- SECTION 5: THROMBOPHILIA & MYELOPROLIFERATIVE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Most common inherited cause of hypercoagulability?', '["Antithrombin III", "Factor V Leiden", "Protein S", "Prothrombin G20210A"]', 1, 'Factor V Leiden is resistant to cleavage by activated Protein C.'),
    (v_topic_id, 'Polycythemia Vera gene mutation?', '["BCR-ABL", "JAK2", "c-MYC", "BCL-2"]', 1, 'JAK2 mutation causes EPO-independent RBC proliferation.'),
    (v_topic_id, 'Classic Polycythemia Vera symptom after hot shower?', '["Vertigo", "Aquagenic pruritus", "Raynaud", "Tinnitus"]', 1, 'Increased mast cell degranulation in response to heat.'),
    (v_topic_id, 'Essential Thrombocythemia characteristic?', '["Low platelets", "Megakaryocyte/Platelet proliferation (>600k)", "Marrow fibrosis", "Philadelphia chromosome"]', 1, 'Myeloproliferative disorder of the platelet lineage.'),
    (v_topic_id, 'Marrow shows teardrop RBCs (dacrocytes) and extensive collagen:', '["Polycythemia", "Primary Myelofibrosis", "CML", "Aplastic"]', 1, 'RBCs are damaged squeezing through fibrotic marrow.'),
    (v_topic_id, 'Differentiates CML from Leukemoid Reaction?', '["WBC count", "Bands", "Low LAP score", "Splenomegaly"]', 2, 'CML neutrophils are abnormal and lack Leukocyte Alkaline Phosphatase.'),
    (v_topic_id, 'Miscarriages and DVT history; prolonged PTT not correcting with mix study:', '["Hemophilia A", "Antiphospholipid Syndrome", "vWD", "Factor XII"]', 1, 'Lupus anticoagulant prolongs PTT in vitro but is pro-thrombotic in vivo.'),
    (v_topic_id, 'Venous thrombosis; Heparin started but PTT does not rise:', '["Protein C", "Protein S", "Antithrombin III", "Factor X"]', 2, 'Heparin requires ATIII to act; deficiency renders heparin ineffective.'),
    (v_topic_id, 'Abciximab target?', '["ADP receptor", "COX-1", "GPIIb/IIIa receptor", "Thrombin"]', 2, 'Prevents aggregation by blocking the fibrinogen receptor.'),
    (v_topic_id, 'Aspirin irreversibly inhibits:', '["Phosphodiesterase", "Cyclooxygenase (COX-1/2)", "Vitamin K reductase", "ATIII"]', 1, 'Prevents Thromboxane A2 (TXA2) formation.');

    -- SECTION 6: TRANSFUSION & IRON
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Fever, chills, flank pain 15 min after transfusion start. Reaction?', '["Febrile non-hemolytic", "Acute Hemolytic", "Delayed Hemolytic", "TRALI"]', 1, 'ABO incompatibility (Type II Hypersensitivity).'),
    (v_topic_id, 'IgA-deficient patient develops anaphylaxis upon receiving blood. Why?', '["Anti-IgA antibodies in patient", "Bacterial contamination", "Histamine release", "Cytokine storm"]', 0, 'Pre-formed IgG against IgA in the recipient.'),
    (v_topic_id, 'Transfusion reaction with non-cardiogenic pulmonary edema:', '["TACO", "TRALI", "Acute Hemolytic", "Urticarial"]', 1, 'Transfusion-Related Acute Lung Injury (donor antibodies against recipient HLA).'),
    (v_topic_id, 'Delayed Hemolytic Transfusion Reactions (days later) most common cause?', '["ABO", "Rh", "Kidd (Jk) antigen", "Duffy"]', 2, 'Kidd antibodies fade over time and cause anamnestic responses.'),
    (v_topic_id, 'Majority of iron absorbed in which GI site?', '["Stomach", "Duodenum", "Terminal Ileum", "Colon"]', 1, 'Duodenum and upper jejunum are primary absorption sites.'),
    (v_topic_id, 'Form of iron absorbed by intestinal enterocytes?', '["Fe3+", "Fe2+", "Heme only", "Ferritin"]', 1, 'Ferric iron must be reduced to ferrous (Fe2+) for absorption via DMT1.'),
    (v_topic_id, 'TACO (circulatory overload) management?', '["Epinephrine", "Diuretics (Furosemide)", "Antihistamines", "Steroids"]', 1, 'TACO is volume overload; diuretics help.'),
    (v_topic_id, 'Most common transfusion-transmitted infection in US today?', '["HIV", "Hepatitis C", "Hepatitis B", "Bacterial contamination"]', 3, 'Platelets stored at room temp increase bacterial risk.'),
    (v_topic_id, 'CKD patient normocytic anemia cause?', '["Iron", "EPO deficiency", "B12", "Hemolysis"]', 1, 'EPO is produced by peritubular cells in the kidney.'),
    (v_topic_id, 'Increases risk of Sickle Cell sickling?', '["High Altitude (Hypoxia)", "Alkalosis", "Hydration", "Hypothermia"]', 0, 'Low oxygen favors the T-state of HbS, leading to polymerization.');

    -- SECTION 7: SPECIFIC SYNDROMES & PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Diamond-Blackfan Anemia characteristic?', '["Pancytopenia", "Pure Red Cell Aplasia with craniofacial anomalies", "Thrombocytopenia only", "Giant platelets"]', 1, 'Intrinsic defect in erythroid progenitor cells.'),
    (v_topic_id, 'Fanconi Anemia defect in:', '["DNA repair", "Heme synthesis", "Iron absorption", "B12 transport"]', 0, 'Leads to marrow failure, thumb anomalies, and AML risk.'),
    (v_topic_id, 'Lead Poisoning lab result:', '["Increased protoporphyrin", "Increased ALA", "Microcytic anemia", "All of the above"]', 3, 'Lead inhibits multiple enzymes in the heme pathway.'),
    (v_topic_id, ' "Bence-Jones proteins" in Multiple Myeloma urine are:', '["Albumin", "Free light chains", "Hemoglobin", "Myoglobin"]', 1, 'Filtered light chains that can cause tubular damage.'),
    (v_topic_id, 'Mycosis Fungoides progressing to blood with "cerebriform" nuclei:', '["Hodgkin", "Sézary Syndrome", "Burkitt", "Hairy Cell"]', 1, 'Leukemic phase of cutaneous T-cell lymphoma.'),
    (v_topic_id, 'Primary treatment for APL (t(15;17))?', '["Imatinib", "All-Trans Retinoic Acid (ATRA)", "Rituximab", "Methotrexate"]', 1, 'ATRA overcomes the differentiation block of PML-RARalpha.'),
    (v_topic_id, 'Waldenström Macroglobulinemia association?', '["Monoclonal IgG", "Monoclonal IgM and Hyperviscosity", "Lytic lesions", "Hypercalcemia"]', 1, 'IgM pentamers lead to hyperviscosity; no lytic lesions.'),
    (v_topic_id, 'Hydrops fetalis (death in utero) Alpha-Thalassemia form?', '["1 deletion", "2 deletion", "3 deletion (HbH)", "4 deletion (Hb Barts)"]', 3, 'Hb Barts (gamma-4) has extremely high O2 affinity (no release).'),
    (v_topic_id, 'Vitamin K role in coagulation?', '["Cleaves Fibrinogen", "Gamma-carboxylation of glutamate", "Activates Antithrombin", "Inhibits Plasmin"]', 1, 'Modification allows factors to bind calcium and phospholipids.'),
    (v_topic_id, ' "D-dimer" is a breakdown product of:', '["Fibrinogen", "Cross-linked fibrin", "Plasminogen", "Platelets"]', 1, 'Indicates clot was formed (Thrombin) and broken down (Plasmin).');

    -- SECTION 8: ADVANCED COAGULATION & LAB
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Prolonged PTT not corrected by mixing study suggests:', '["Factor deficiency", "Coagulation inhibitor", "Heparin", "vWD"]', 1, 'Inhibitors (e.g. Lupus anticoagulant) prevent correction.'),
    (v_topic_id, 'TTP (Thrombotic Thrombocytopenic Purpura) cause?', '["vWF", "ADAMTS13", "Factor VIII", "Protein S"]', 1, 'ADAMTS13 deficiency leads to uncleaved vWF multimers and microthrombi.'),
    (v_topic_id, 'Clopidogrel (Plavix) mechanism?', '["COX-1", "Blocking P2Y12 ADP receptor", "Thrombin inhibition", "Plasminogen activation"]', 1, 'ADP is a key platelet activator.'),
    (v_topic_id, 'Seen in Vitamin K deficiency?', '["Normal PT, long PTT", "Prolonged PT and PTT", "Prolonged PT, normal PTT", "Normal"]', 1, 'Affects both extrinsic (VII) and intrinsic/common pathways.'),
    (v_topic_id, 'Eculizumab treats PNH by targeting:', '["Platelets", "B cells", "Complement protein C5", "Red membranes"]', 2, 'Prevents MAC formation, stopping hemolysis.'),
    (v_topic_id, ' "Target cell" (codocyte) commonly seen in:', '["Thalassemia", "Asplenia", "Liver disease", "All of the above"]', 3, 'Caused by high surface-to-volume ratio.'),
    (v_topic_id, ' "Howell-Jolly bodies" remnants indicate:', '["Iron", "Denatured Hb", "Nuclear DNA remnants (Asplenia)", "Lead"]', 2, 'Nuclear remnants normally pitted out by functional spleen.'),
    (v_topic_id, 'Leukemia associated with Down Syndrome (before age 5)?', '["AML (M7)", "ALL", "CLL", "CML"]', 0, 'M7 (Megakaryoblastic) is highly specific for young Trisomy 21 children.'),
    (v_topic_id, 'Leukemia associated with gum hyperplasia?', '["ALL", "AML (M4/M5 Monocytic)", "CLL", "CML"]', 1, 'Monoblasts infiltrate tissues like gingiva.'),
    (v_topic_id, 'CML progression to >20% blasts:', '["Remission", "Blast Crisis", "Leukemoid", "Myelofibrosis"]', 1, 'Chronic phase evolving into acute leukemia.');

    -- SECTION 9: PEDIATRIC & GENETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, ' "Hemoglobin H" disease result of:', '["1 alpha deletion", "2 alpha deletions", "3 alpha deletions", "4 alpha deletions"]', 2, 'Excess beta-chains form beta-4 tetrads (HbH).'),
    (v_topic_id, 'Primary hemoglobin in fetus?', '["HbA", "HbA2", "HbF (alpha-2 gamma-2)", "HbH"]', 2, 'Fetal Hb has higher O2 affinity to pull from mother.'),
    (v_topic_id, 'Age when HbF switch to HbA occurs (making Beta-Thal/Sickle apparent)?', '["Birth", "6 months", "2 years", "5 years"]', 1, 'Switch happens around 6 months.'),
    (v_topic_id, 'Hydroxyurea mechanism in Sickle Cell?', '["Increases HbA", "Increases HbF", "Decreases platelets", "Direct inhibition"]', 1, 'HbF does not sickle; dilutes HbS.'),
    (v_topic_id, 'Neonate scalp/umbilical bleed likely cause?', '["Hemophilia A", "Vitamin K deficiency", "vWD", "ITP"]', 1, 'Neonates lack K-producing gut bacteria.'),
    (v_topic_id, 'Hereditary Hemorrhagic Telangiectasia presents with:', '["Epistaxis and telangiectasias", "DVT", "Factor VIII", "Splenomegaly"]', 0, 'Autosomal dominant vascular disorder.'),
    (v_topic_id, 'Platelet disorder with "Giant Platelets"?', '["ITP", "Bernard-Soulier Syndrome", "Glanzmann", "vWD"]', 1, 'Hallmark of BSS (GpIb deficiency).'),
    (v_topic_id, 'Most common pediatric thrombocytopenia post-virus?', '["TTP", "ITP", "Leukemia", "Aplastic"]', 1, 'Immune Thrombocytopenic Purpura (Anti-GPIIb/IIIa).'),
    (v_topic_id, ' "Fried-egg" marrow biopsy appearance leukemic cell?', '["Blast", "Basket", "Hairy cell", "Starry-sky"]', 2, 'Hairy cells have a characteristic fried-egg look in biopsy.'),
    (v_topic_id, ' "Negative" acute phase reactant (decreases during inflammation)?', '["Ferritin", "CRP", "Albumin", "Haptoglobin"]', 2, 'Liver prioritizes positive reactants over albumin.');

    -- SECTION 10: CLINICAL FINAL MIX
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Inhibits P2Y12 ADP receptor:', '["Aspirin", "Prasugrel", "Warfarin", "Enoxaparin"]', 1, 'Thienopyridines like Prasugrel/Clopidogrel target this receptor.'),
    (v_topic_id, ' "Dry Tap" on bone marrow aspirate cause?', '["Hairy Cell", "Myelofibrosis", "Aplastic", "All of the above"]', 3, 'Fibrosis or hypocellularity prevents liquid aspiration.'),
    (v_topic_id, '#1 elderly primary bone tumor with monoclonal gammopathy?', '["Osteosarcoma", "Ewing", "Multiple Myeloma", "Chondrosarcoma"]', 2, 'Plasma cell dyscrasia presenting with bone destruction.'),
    (v_topic_id, 'Oral Direct Thrombin Inhibitor?', '["Rivaroxaban", "Dabigatran", "Apixaban", "Fondaparinux"]', 1, 'Dabigatran targets IIa; others listed target Xa.'),
    (v_topic_id, 'High RDW (Anisocytosis) significance?', '["Small RBCs", "Large RBCs", "Variation in RBC size", "Target cells"]', 2, 'Often the first sign of iron deficiency.'),
    (v_topic_id, ' "Heinz bodies" visualization stain?', '["Wright-Giemsa", "Crystal Violet", "Prussian Blue", "H&E"]', 1, 'Requires supravital stain; not seen on standard smears.'),
    (v_topic_id, 'Treatment of choice for TTP?', '["Platelets", "Plasmapheresis", "Heparin", "Aspirin"]', 1, 'Removes ADAMTS13 antibodies; provides enzyme.'),
    (v_topic_id, ' "Leukoerythroblastic" smear (immature WBC/nucleated RBC) suggests:', '["Iron", "Marrow replacement (fibrosis/cancer)", "B12", "Infection"]', 1, 'Suggests space-occupying marrow lesion.'),
    (v_topic_id, 'Coagulation factor with shortest half-life?', '["II", "VII", "IX", "X"]', 1, 'Why PT rises first on Warfarin.'),
    (v_topic_id, 'Sickle Cell vaso-occlusive crisis first-line?', '["Aspirin", "Hydration and Opioids", "Antibiotics", "Transfusion"]', 1, 'Hydration reduces sickling; opioids manage pain.');

    RAISE NOTICE 'SUCCESS: General Hematology MCQ Part 1 (1-100) registered.';
END $$;

COMMIT;
