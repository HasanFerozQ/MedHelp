-- Migration: Semester 3 - General Hematology MCQ Bank (PART 2: 101-200)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-hematology' LIMIT 1;

    -- SECTION 11: PORPHYRIAS & O2 CURVE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Female with abdominal pain, port-wine urine, and neuropathy post-sulfonamides. Deficiency?', '["Ferrochelatase", "PBG deaminase", "Uroporphyrinogen decarboxylase", "ALA synthase"]', 1, 'Acute Intermittent Porphyria (AIP) presents with the 5 Ps; precipitated by drugs.'),
    (v_topic_id, 'Photosensitivity and hand blistering, associated with Hep C. Diagnosis?', '["AIP", "Porphyria Cutanea Tarda (PCT)", "Lead poisoning", "EPP"]', 1, 'PCT is the most common porphyria (uroporphyrinogen decarboxylase deficiency).'),
    (v_topic_id, 'Factors responsible for a "Shift to the Right" of the O2-Dissociation curve?', '["Low 2,3-BPG", "Increased H+ (Acidosis)", "Hypothermia", "Low CO2"]', 1, 'Right shift (easier O2 release) is caused by: ACE BAT (Acid, CO2, Exercise, BPG, Temp).'),
    (v_topic_id, 'Anemia form with "macropolycyte" (giant neutrophil)?', '["Iron", "Megaloblastic", "Aplastic", "Sideroblastic"]', 1, 'DNA synthesis impairment affects all lineages in megaloblastic anemia.'),
    (v_topic_id, 'Fanconi Anemia increased risk for:', '["Colorectal", "AML", "Hodgkin", "Multiple Myeloma"]', 1, 'DNA repair defect leads to marrow failure and leukemic transformation.'),
    (v_topic_id, 'Normocytic anemia, low retics (<0.5%), marrow lacks erythroid precursors only:', '["Aplastic", "Pure Red Cell Aplasia (PRCA)", "Myelofibrosis", "MDS"]', 1, 'PRCA is associated with thymomas or Parvovirus B19.'),
    (v_topic_id, 'Lysine for Glutamic acid substitution at position 6 of beta-chain:', '["HbS", "HbC", "HbH", "Hb Barts"]', 1, 'HbC results in crystals on smear and mild hemolysis (LyCine = HbC).'),
    (v_topic_id, 'Positive Ham test (acidified serum lysis) tradition diagnostic for:', '["G6PD", "PNH", "Hereditary Spherocytosis", "Sickle Trait"]', 1, 'PNH cells are sensitive to complement-mediated lysis in acid.'),
    (v_topic_id, 'Metabolite elevated in urine of patient with Lead poisoning?', '["Porphobilinogen", "Coproporphyrin III and delta-ALA", "Bilirubin", "Urobilinogen"]', 1, 'Lead inhibits ALA dehydratase, causing ALA accumulation.'),
    (v_topic_id, 'Elderly "Dry Tap", teardrop cells, high WBC (leukoerythroblastic) diagnosis?', '["Primary Myelofibrosis", "Aplastic Anemia", "Iron Deficiency", "Polycythemia Vera"]', 0, 'Fibroblasts replace marrow secondary to megakaryocyte TGF-beta release.');

    -- SECTION 12: ADVANCED LYMPHOMAS & LEUKEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Hodgkin Lymphoma subtype with best prognosis?', '["Nodular Sclerosis", "Lymphocyte Rich", "Mixed Cellularity", "Lymphocyte Depleted"]', 1, 'Lymphocyte-rich has many reactive lymphocytes and few RS cells.'),
    (v_topic_id, 'Mediastinal mass, cervical lymphadenopathy, "lacunar cells" and collagen bands:', '["Lymphocyte Rich", "Nodular Sclerosis", "Mixed Cellularity", "Depleted"]', 1, 'Nodular Sclerosis is common in young women; most frequent subtype.'),
    (v_topic_id, 'Mantle Cell Lymphoma hallmark translocation?', '["t(11;14)", "t(14;18)", "t(8;14)", "t(11;18)"]', 0, 'Leads to overexpression of Cyclin D1 (G1/S driver).'),
    (v_topic_id, 'Lymphoma associated with H. pylori gastritis?', '["Follicular", "MALToma", "Burkitt", "DLBCL"]', 1, 'Marginal Zone Lymphoma (MALToma) can regress with H. pylori treatment.'),
    (v_topic_id, ' "Cloverleaf" or "Flower cells" in blood and high calcium (HTLV-1):', '["Adult T-cell Leukemia/Lymphoma", "Burkitt", "Multiple Myeloma", "CLL"]', 0, 'ATLL presents with skin lesions and lytic bone lesions.'),
    (v_topic_id, 'Langerhans Cell Histiocytosis EM finding:', '["Auer rods", "Birbeck granules (tennis racket)", "Heinz", "Howell-Jolly"]', 1, 'Tennis-racket shaped granules in CD1a+/S100+ cells.'),
    (v_topic_id, 'Good prognosis AML translocation?', '["t(15;17)", "t(8;21)", "inv(16)", "All of the above"]', 3, 'These three markers associate with better chemo response.'),
    (v_topic_id, 'Marker differentiating B-ALL from T-ALL?', '["TdT", "CD10", "CD3", "PAS"]', 2, 'CD3 is specific to the T-cell lineage.'),
    (v_topic_id, 'Myelodysplastic Syndrome (MDS) primary risk?', '["ALL", "AML", "CML", "Myelofibrosis"]', 1, 'MDS is "pre-leukemia" characterized by cytopenias.'),
    (v_topic_id, 'Most common primary site for Extranodal Non-Hodgkin Lymphoma?', '["Spleen", "Liver", "GI tract (Stomach)", "Skin"]', 2, 'MALTomas and DLBCL are frequent in the GI tract.');

    -- SECTION 13: COMPLEX HEMOSTASIS & PLATELETS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'SLE patient, false positive VDRL, prolonged PTT. Hypercoagulability mechanism?', '["Factor V Leiden", "Antiphospholipid antibodies", "Protein C", "Prothrombin"]', 1, 'Lupus anticoagulant prolongs PTT in lab but causes clots in vivo.'),
    (v_topic_id, 'Inhibits Plasmin to stop fibrinolysis?', '["tPA", "alpha-2 Antiplasmin", "Streptokinase", "Heparin"]', 1, 'Inactivates circulating plasmin to prevent excessive clot breakdown.'),
    (v_topic_id, 'Glutathione reductase deficiency result:', '["Heme synthesis", "Inability to protect RBCs from oxidative stress", "ATP loss", "CO2 loss"]', 1, 'Prevents regeneration of reduced glutathione (H2O2 neutralizer).'),
    (v_topic_id, 'Ristocetin cofactor activity measures function of:', '["Factor VIII", "Von Willebrand Factor (vWF)", "GpIIb/IIIa", "Fibrinogen"]', 1, 'Ristocetin induces vWF binding to platelets.'),
    (v_topic_id, 'Common Pathway: Factor activating Prothrombin to Thrombin?', '["VIIa", "IXa", "Factor Xa", "XIII"]', 2, 'Xa is the enzymatic component of the prothrombinase complex.'),
    (v_topic_id, 'Factor responsible for cross-linking fibrin to stabilize clot?', '["X", "XII", "Factor XIII", "Thrombin"]', 2, 'Factor XIII (Fibrin Stabilizing Factor) is thrombin-activated.'),
    (v_topic_id, 'Hemophilia C factor deficiency?', '["VIII", "IX", "Factor XI", "XII"]', 2, 'Common in Ashkenazi Jews; mild post-op bleeding.'),
    (v_topic_id, 'Uremia (renal failure) effect on platelet function?', '["Low count", "Qualitative defect (adhesion/aggregation)", "High count", "No effect"]', 1, 'Uremic toxins impair platelet adhesion; bleeding time is long.'),
    (v_topic_id, 'Cryoprecipitate content:', '["II, VII, IX, X", "Fibrinogen, vWF, Factor VIII", "Platelets", "Albumin"]', 1, 'Used for fibrinogen deficiency or Hemophilia A/vWD.'),
    (v_topic_id, 'Thrombin Time (TT) evaluates:', '["Extrinsic", "Intrinsic", "Conversion of Fibrinogen to Fibrin", "Adhesion"]', 2, 'Prolonged TT suggests low fibrinogen or heparin interference.');

    -- SECTION 14: HEMATOLOGIC PHARMACOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Low Molecular Weight Heparin (LMWH) example?', '["Fondaparinux", "Enoxaparin", "Warfarin", "Bivalirudin"]', 1, 'LMWHs like Enoxaparin primarily inhibit Factor Xa.'),
    (v_topic_id, 'Rivaroxaban mechanism?', '["Direct Thrombin", "Direct Factor Xa Inhibitor", "Vitamin K antagonist", "ADP blocker"]', 1, 'Memory: Riva-ro-Xa-ban.'),
    (v_topic_id, 'Reverse Warfarin immediately in life-threatening bleed?', '["Vitamin K", "FFP or PCC", "Protamine", "Desmopressin"]', 1, 'Vitamin K takes hours; FFP/PCC provide active factors instantly.'),
    (v_topic_id, 'Desmopressin (DDAVP) role in mild vWD/Hemophilia A?', '["Activates VIII", "Stimulates vWF/Factor VIII release", "Inhibits Plasmin", "Increases platelets"]', 1, 'Releases stored factors from endothelial Weibel-Palade bodies.'),
    (v_topic_id, 'Direct Thrombin Inhibitor from leech saliva?', '["Argatroban", "Lepirudin/Bivalirudin", "Apixaban", "Heparin"]', 1, 'Hirudin derivatives used in HIT.'),
    (v_topic_id, 'Doxorubicin main toxicity?', '["Nephro", "Cardiotoxicity (DCM)", "Pulmonary", "Neuro"]', 1, 'Free radical damage; prevented by Dexrazoxane.'),
    (v_topic_id, 'Vincristine side effect?', '["Marrow suppression", "Peripheral neuropathy", "Hemorrhagic cystitis", "Oto"]', 1, 'Inhibits axonal microtubule formation; marrow-sparing.'),
    (v_topic_id, 'Monoclonal antibody against CD20?', '["Infliximab", "Rituximab", "Trastuzumab", "Abciximab"]', 1, 'Used in B-cell NHL and CLL.'),
    (v_topic_id, 'Imatinib (Gleevec) target?', '["CD20", "BCL-2", "BCR-ABL Tyrosine Kinase", "VEGF"]', 2, 'First-line therapy for CML.'),
    (v_topic_id, 'Cyclophosphamide toxicity and neutralizing agent?', '["Cisplatin/Amifostine", "Cyclophosphamide/Mesna", "Methotrexate/Leucovorin", "5-FU/Thymidine"]', 1, 'Mesna binds toxic acrolein in the bladder.');

    -- SECTION 15: TRANSFUSION & LABS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Washed Red Blood Cells indicated for:', '["Anemia", "IgA-deficient with anaphylaxis risk", "Neonates", "Sickle crisis"]', 1, 'Removes residual plasma proteins (IgA).'),
    (v_topic_id, 'Irradiated blood products purpose?', '["CMV", "Graft-versus-Host Disease (GVHD)", "Hemolysis", "TACO"]', 1, 'Kills donor T-lymphocytes to prevent host attack.'),
    (v_topic_id, 'Universal Donor for Fresh Frozen Plasma (FFP)?', '["O", "Type AB", "A", "B"]', 1, 'AB plasma lacks both Anti-A and Anti-B antibodies.'),
    (v_topic_id, 'Positive test for "Warm" AIHA?', '["Indirect Coombs", "Direct Coombs (DAT)", "Ham", "Osmotic fragility"]', 1, 'Direct Coombs detects antibodies on patient RBCs.'),
    (v_topic_id, 'Leukoreduction primarily reduces risk of:', '["ABO mismatch", "Febrile non-hemolytic reactions", "HIV", "Iron"]', 1, 'Removing WBCs reduces bag cytokine accumulation.'),
    (v_topic_id, 'Expected in Intravascular hemolysis but NOT Extravascular?', '["Jaundice", "LDH", "Hemosiderinuria", "Low Haptoglobin"]', 2, 'Specific to intravascular release of free Hb.'),
    (v_topic_id, 'Leukemoid Reaction LAP score?', '["Low", "High", "Zero", "Normal"]', 1, 'High LAP indicates functional (reactive) neutrophils.'),
    (v_topic_id, 'Anticoagulant in CBC tubes?', '["Citrate", "Heparin", "EDTA", "Oxalate"]', 2, 'EDTA preserves cell morphology for counts.'),
    (v_topic_id, 'Target cells post-splenectomy cause?', '["Hb lack", "Excess cell membrane", "Cytoskeleton damage", "Iron"]', 1, 'Functional spleen normally prunes excess membrane.'),
    (v_topic_id, ' "Hampton''s Hump" on Sickle Cell CXR suggests:', '["Pneumonia", "Pulmonary Infarction", "Effusion", "Fracture"]', 1, 'Wedge-shaped opacity indicating infarction.');

    -- SECTION 16: IRON METABOLISM & STORAGE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Primary iron transporter in blood?', '["Ferritin", "Transferrin", "Hepcidin", "Ferroportin"]', 1, 'Transferrin carries iron; Ferritin stores it.'),
    (v_topic_id, 'Hepcidin mechanism?', '["Stimulates", "Degrading Ferroportin", "Transferrin synthesis", "B12 binding"]', 1, 'Prevents iron egress from enterocytes and macrophages.'),
    (v_topic_id, 'Hereditary Hemochromatosis mutation?', '["HFE gene", "JAK2", "BCR-ABL", "PIGA"]', 0, 'Usually C282Y mutation in HFE.'),
    (v_topic_id, 'Classic triad of Hemochromatosis?', '["Anemia/Jaundice", "Cirrhosis, Diabetes, Skin Pigment", "Fever/Rash", "Renal/Heart failure"]', 1, 'Bronze Diabetes: iron in liver, pancreas, and skin.'),
    (v_topic_id, 'Secondary Hemochromatosis cause?', '["Blood loss", "Chronic blood transfusions", "High fiber", "Alcoholism"]', 1, 'Frequent transfusions lead to iron accumulation.'),
    (v_topic_id, 'TIBC (Total Iron Binding Capacity) indirectly measures:', '["Ferritin", "Transferrin concentration", "Hb", "Myoglobin"]', 1, 'Increases in iron deficiency (liver pumps more transferrin).'),
    (v_topic_id, 'Stain used for iron stores in bone marrow?', '["Wright-Giemsa", "Prussian Blue", "Silver", "PAS"]', 1, 'Stains hemosiderin bright blue.'),
    (v_topic_id, 'Sideroblastic Anemia anti-TB drug side effect?', '["Rifampin", "Isoniazid (INH)", "Ethambutol", "Pyrazinamide"]', 1, 'INH is a B6 antagonist (ALA synthase cofactor).'),
    (v_topic_id, 'Reticulocyte peak after oral iron treatment?', '["24 hrs", "7-10 days", "1 month", "3 months"]', 1, 'Marrow takes a week to ramp up new production.'),
    (v_topic_id, 'Oral iron chelator?', '["Deferoxamine (IV)", "Deferasirox", "Penicillamine", "Dimercaprol"]', 1, 'Deferasirox is oral; Deferoxamine is IV/SC.');

    -- SECTION 17: WHITE CELL ANOMALIES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Pelger-Huët Anomaly characteristic?', '["Hypersegmented", "Hyposegmented (bilobed)", "Large granules", "Absence"]', 1, 'Dumbbell-shaped neutrophils (Pseudo-Pelger seen in MDS).'),
    (v_topic_id, 'Chediak-Higashi Syndrome defect:', '["NADPH Oxidase", "Lysosomal trafficking (LYST)", "Myeloperoxidase", "B-cell maturation"]', 1, 'Giant granules, albinism, and peripheral neuropathy.'),
    (v_topic_id, 'Leukocyte Adhesion Deficiency (LAD) sign:', '["Low WBC", "High WBC, delayed umbilical cord separation", "No B cells", "Thrombocytopenia"]', 1, 'Neutrophils cannot leave blood to form pus.'),
    (v_topic_id, ' "Döhle bodies" in neutrophils found during:', '["Lead", "Severe infection/toxic states", "EBV", "TTP"]', 1, 'Rough ER inclusions seen in stress states.'),
    (v_topic_id, 'Infectious Mononucleosis atypical lymphocytes are:', '["Infected B", "Reactive CD8+ T cells", "Malignant B", "NK"]', 1, 'Cytotoxic T cells reacting to EBV-infected B cells.'),
    (v_topic_id, 'Cytokine stimulant for Eosinophils?', '["IL-1", "IL-5", "IL-8", "EPO"]', 1, 'IL-5 is the specific eosinophil driver.'),
    (v_topic_id, 'Leukemoid Reaction common cause?', '["Stress", "Severe infection (C. diff/Sepsis)", "Radiation", "Iron"]', 1, 'Reactive WBC count can exceed 50k.'),
    (v_topic_id, 'Neutropenia (ANC) threshold for high risk?', '["5000", "3000", "1500", "500"]', 3, 'Severe risk is ANC < 500.'),
    (v_topic_id, 'Basophilia hallmark?', '["Allergy", "Chronic Myeloid Leukemia (CML)", "Parasites", "Viral"]', 1, 'Characteristic of myeloproliferative disorders like CML.'),
    (v_topic_id, 'Hyper-IgE Syndrome (Job Syndrome) triad?', '["Cold abscesses/retained baby teeth", "Viral", "Bleeding", "Macro-thrombo"]', 0, 'STAT3 mutation affecting Th17 cells.');

    -- SECTION 18: MDS & MPN
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ringed sideroblasts in elderly marrow suggests:', '["Iron", "MDS (RARS)", "Lead", "B12"]', 1, 'Subtype of Myelodysplastic Syndrome.'),
    (v_topic_id, '5q- Syndrome is a favorable subtype of:', '["AML", "MDS", "ALL", "CLL"]', 1, 'Responds well to Lenalidomide.'),
    (v_topic_id, 'Primary Myelofibrosis spleen enlargement cause?', '["Sequestration", "Extramedullary hematopoiesis", "Portal HTN", "Infection"]', 1, 'Spleen takes over blood production for fibrotic marrow.'),
    (v_topic_id, 'Distinguishes PV from secondary polycythemia?', '["High Hb", "Low EPO", "High Hct", "Splenomegaly"]', 1, 'EPO is low in PV; high in secondary compensatory cases.'),
    (v_topic_id, 'Essential Thrombocythemia exclusion diagnosis?', '["Iron deficiency", "CML", "Polycythemia", "All of the above"]', 3, 'Exclude reactive and other MPN causes.'),
    (v_topic_id, 'JAK2 inhibitor for Myelofibrosis?', '["Ruxolitinib", "Imatinib", "Rituximab", "Hydroxyurea"]', 0, 'Ruxolitinib is a JAK1/2 inhibitor.'),
    (v_topic_id, 'Leukoerythroblastic smear findings?', '["Small RBC", "Immature WBC and Nucleated RBC", "Hypersegmented", "Only blasts"]', 1, 'Marrow "pushed out" by fibrosis or cancer.'),
    (v_topic_id, 'Myeloproliferative disorder with highest Thrombosis risk?', '["CML", "Polycythemia Vera", "Myelofibrosis", "ALL"]', 1, 'Hyperviscosity sludging (Budd-Chiari risk).'),
    (v_topic_id, 'Most sensitive CML monitoring method?', '["CBC", "Spleen", "PCR for BCR-ABL transcript", "Biopsy"]', 2, 'Molecular monitoring is the standard.'),
    (v_topic_id, 'MLL gene translocation in AML subtype?', '["t(8;21)", "t(11q23)", "t(15;17)", "t(9;22)"]', 1, 'Associated with monocytic AML.');

    -- SECTION 19: PEDIATRICS & NEONATAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Rh incompatibility mother status?', '["Positive", "Negative", "Not relevant", "AB"]', 1, 'Rh-neg mother reacts to Rh-pos fetus.'),
    (v_topic_id, 'Why ABO HDN is usually milder than Rh?', '["ABO IgM don''t cross", "Antigens present on many tissues", "No antigens", "No antibodies"]', 1, 'Dilution effect and IgM vs IgG difference.'),
    (v_topic_id, 'Rho(D) immune globulin (RhoGAM) administration?', '["28 wks and within 72 hrs of birth", "Only birth", "Monthly", "First only"]', 0, 'Prevents sensitization to fetal Rh+ cells.'),
    (v_topic_id, 'Wiskott-Aldrich Syndrome platelet finding?', '["Large", "Small (microthrombocytopenia)", "Normal", "No"]', 1, 'Key diagnostic clue with eczema and infection.'),
    (v_topic_id, 'Juvenile Myelomonocytic Leukemia (JMML) association?', '["Down", "Neurofibromatosis Type 1 (NF1)", "Turner", "Marfan"]', 1, 'Loss of Neurofibromin (Ras-GAP) drives signaling.'),
    (v_topic_id, 'Teenager male, mediastinal mass, CD3+, TdT+ blasts:', '["B-ALL", "T-ALL", "Hodgkin", "Thymoma"]', 1, 'Typical T-ALL presentation.'),
    (v_topic_id, 'Anemia of Prematurity common cause?', '["Iron", "Frequent draws/impaired EPO", "Vitamin E", "Mismatch"]', 1, 'Preterm infants have blunted EPO response.'),
    (v_topic_id, 'Kasabach-Merritt Syndrome involves:', '["Iron", "Hemangioma sequestering platelets", "VIII", "Rupture"]', 1, 'Vascular tumor consumes platelets.'),
    (v_topic_id, 'Griscelli Syndrome additional feature?', '["Albinism (silvery hair)", "Heart", "Kidney", "Blindness"]', 0, 'Pigment and granule trafficking defect.'),
    (v_topic_id, 'TEC (Transient Erythroblastopenia) vs Diamond-Blackfan?', '["TEC congenital", "TEC acquired (post-viral) recovery", "Thumb", "High HbF"]', 1, 'TEC is acquired in older children; recovery is spontaneous.');

    -- SECTION 20: FINAL SCENARIOS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Multiple Myeloma sudden back pain/leg weakness. Next?', '["Calcium", "MRI of spine (rule out cord compression)", "Fluids", "Urine"]', 1, 'Medical emergency (plasmacytoma or vertebral collapse).'),
    (v_topic_id, 'PNH diagnosis flow markers?', '["CD4/8", "CD55 and CD59", "CD19/20", "CD34"]', 1, 'GPI-anchored proteins missing in PNH.'),
    (v_topic_id, 'High Hb and low SaO2 (<92%) polycythemia type:', '["Primary", "Secondary (Appropriate)", "Inappropriate", "Relative"]', 1, 'Body compensates for low oxygen.'),
    (v_topic_id, 'Erythropoietin primary site?', '["Liver", "Renal peritubular cells", "Marrow", "Spleen"]', 1, 'Kidney is the body''s oxygen sensor.'),
    (v_topic_id, 'Direct Factor Xa Inhibitor (DOAC)?', '["Dabigatran", "Apixaban", "Warfarin", "Argatroban"]', 1, 'Apixaban and Rivaroxaban are Xa inhibitors.'),
    (v_topic_id, 'Duffy antigen-negative status resistance?', '["Falciparum", "Plasmodium vivax", "Babesia", "HIV"]', 1, 'P. vivax uses Duffy as an entry receptor.'),
    (v_topic_id, 'Schistocytes seen in:', '["Iron", "Artificial valve or DIC", "B12", "Thalassemia"]', 1, 'Mechanical RBC shearing.'),
    (v_topic_id, 'May-Hegglin Anomaly findings?', '["Hypersegmented", "Large platelets/Döhle-like inclusions", "No B", "Target/Jaundice"]', 1, 'Autosomal dominant MYH9 mutation.'),
    (v_topic_id, '#1 Splenic Infarction cause in US?', '["Malaria", "Sickle Cell Disease/Trait", "Gaucher", "Portal HTN"]', 1, 'Vaso-occlusion in splenic artery.'),
    (v_topic_id, 'Linezolid chronic use anemia type?', '["Hemolytic", "Sideroblastic", "Macrocytic", "Iron"]', 1, 'Mitochondrial toxin inhibiting heme synthesis.');

    RAISE NOTICE 'SUCCESS: General Hematology MCQ Part 2 (101-200) registered.';
END $$;

COMMIT;
