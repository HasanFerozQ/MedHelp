-- Migration: Year 3 - Hematology/Oncology MCQ Bank (PART 4: 264-350)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-oncology' LIMIT 1;

    -- SECTION 25: SKIN & SOFT TISSUE CANCERS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '264: What is the most common type of skin cancer?', '["Squamous Cell", "Basal Cell Carcinoma", "Melanoma", "Merkel Cell"]', 1, 'Presents as a pearly papule with telangiectasias. (Harrison''s Ch. 110)'),
    (v_topic_id, '265: Which skin cancer is most likely to metastasize and cause death?', '["Basal Cell", "Malignant Melanoma", "Squamous Cell", "Actinic Keratosis"]', 1, 'Prognosis depends on the "Breslow depth" (thickness). (Step-Up)'),
    (v_topic_id, '266: The "ABCD" of melanoma screening stands for Asymmetry, Border irregularity, Color variegation, and:', '["Depth", "Diameter > 6mm", "Density", "Duration"]', 1, 'Helps identify suspicious lesions. (Pocket Medicine)'),
    (v_topic_id, '267: "Squamous Cell Carcinoma" of the skin is most common in sun-exposed areas and often arises from:', '["Mols", "Actinic Keratoses", "Scars", "None"]', 1, 'Actinic Keratosis is a pre-cancerous lesion. (Harrison''s Ch. 110)'),
    (v_topic_id, '268: "Kaposi Sarcoma" is associated with which virus?', '["EBV", "HHV-8", "HIV alone", "HPV"]', 1, 'Presents as purple/red nodules in immunocompromised patients. (Step-Up)'),
    (v_topic_id, '269: "Angiosarcoma" of the arm is a rare but classic complication after chronic lymphedema (e.g., post-mastectomy), known as:', '["Stewart-Treves Syndrome", "Marjolin ulcer", "Gardner syndrome", "None"]', 0, 'Aggressive vascular tumor. (Pocket Medicine)'),
    (v_topic_id, '270: "Osteosarcoma" classically presents with which radiographic finding?', '["Onion skinning", "Sunburst pattern / Codman triangle", "Lytic holes", "None"]', 1, 'Most common primary bone tumor in young adults. (Harrison''s Ch. 110)'),
    (v_topic_id, '271: "Ewing Sarcoma" is associated with the t(11;22) translocation and which X-ray finding?', '["Sunburst", "Onion-skin periosteal reaction", "Soap bubble", "None"]', 1, 'Small round blue cell tumor. (Step-Up)'),
    (v_topic_id, '272: "Li-Fraumeni Syndrome" is due to a germline mutation in ____ and leads to early-onset sarcomas and breast cancer.', '["p53", "Rb", "APC", "WT1"]', 0, 'Guardian of the genome. (Pocket Medicine)'),
    (v_topic_id, '273: "Retinoblastoma" is associated with a mutation in the ____ gene.', '["p53", "RB1", "NF1", "VHL"]', 1, 'Classic example of the "Two-hit hypothesis." (Harrison''s Ch. 110)');

    -- SECTION 26: TARGETED & IMMUNOTHERAPY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '274: "Rituximab" is a monoclonal antibody that targets:', '["HER2", "CD20", "VEGF", "PD-1"]', 1, 'Used in B-cell lymphomas and CLL. (Step-Up)'),
    (v_topic_id, '275: "Bevacizumab" (Avastin) works by inhibiting:', '["Tyrosine kinase", "VEGF (angiogenesis)", "mTOR", "Proteasome"]', 1, 'Can cause side effects like hypertension and bleeding. (Pocket Medicine)'),
    (v_topic_id, '276: "Pembrolizumab" and "Nivolumab" are checkpoint inhibitors that target:', '["CD20", "PD-1 / PD-L1", "CTLA-4", "HER2"]', 1, 'Releases the "brakes" on the immune system to attack cancer. (Harrison''s Ch. 110)'),
    (v_topic_id, '277: "Imatinib" (Gleevec) targets which fusion protein?', '["p53", "BCR-ABL", "c-MYC", "None"]', 1, 'Selective tyrosine kinase inhibitor. (Step-Up)'),
    (v_topic_id, '278: "Bortezomib" is a ____ inhibitor used to treat Multiple Myeloma.', '["Tyrosine kinase", "Proteasome", "VEGF", "Checkpoint"]', 1, 'Inhibits degradation of pro-apoptotic proteins. (Pocket Medicine)'),
    (v_topic_id, '279: "Erlotinib" and "Gefitinib" are used in lung cancer patients with ____ mutations.', '["ALK", "EGFR", "KRAS", "BRAF"]', 1, 'More common in non-smokers and women. (Harrison''s Ch. 110)'),
    (v_topic_id, '280: "Vemurafenib" is used for advanced melanoma with which mutation?', '["NRAS", "BRAF V600E", "p53", "None"]', 1, 'Specific for the mutated kinase. (Step-Up)'),
    (v_topic_id, '281: Immune-related side effects of checkpoint inhibitors (like colitis or pneumonitis) are treated with:', '["More chemo", "Glucocorticoids (Steroids)", "Antibiotics", "None"]', 1, 'Required to suppress the overactive immune response. (Pocket Medicine)'),
    (v_topic_id, '282: "Lapatinib" is a dual inhibitor of HER2 and ____.', '["VEGF", "EGFR", "ALK", "PD-1"]', 1, 'Used in breast cancer. (Harrison''s Ch. 110)'),
    (v_topic_id, '283: "Denosumab" (Xgeva) is used in oncology to prevent:', '["Infection", "Skeletal-related events (fractures) from bone metastases", "Nausea", "None"]', 1, 'Blocks RANK Ligand. (Step-Up)');

    -- SECTION 27: HEMATOLOGY CLINICAL SPRINT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '284: "Kallmann Syndrome" = ?', '["Anosmia + Hypogonadism", "Blindness", "Deafness", "None"]', 0, 'Failure of GnRH neurons to migrate. (Pocket Medicine)'),
    (v_topic_id, '285: "Fanconi Anemia" = ?', '["Short stature + Thumb defects + Aplastic Anemia", "Long limbs", "Large ears", "None"]', 0, 'DNA repair defect. (Harrison''s Ch. 98)'),
    (v_topic_id, '286: "Diamond-Blackfan Anemia" = ?', '["Pancytopenia", "Pure Red Cell Aplasia in an infant", "Iron overload", "None"]', 1, 'Congenital erythroid failure. (Step-Up)'),
    (v_topic_id, '287: "Schwabach test" compares bone conduction of the patient to:', '["The examiner", "Air conduction", "A computer", "None"]', 0, 'Old audiometric test. (Pocket Medicine)'),
    (v_topic_id, '288: "Wiskott-Aldrich Syndrome" triad: Eczema, Immunodeficiency, and:', '["Large platelets", "Small platelets (Thrombocytopenia)", "Anemia", "None"]', 1, '"TIE" = Thrombocytopenia, Infections, Eczema. (Harrison''s Ch. 110)'),
    (v_topic_id, '289: "Job Syndrome" (Hyper-IgE) presents with "cold" abscesses and:', '["High IgG", "High IgE and Eosinophilia", "High IgA", "None"]', 1, '"FATED" = Facies, Abscesses, Teeth, IgE, Dermatological. (Step-Up)'),
    (v_topic_id, '290: "DiGeorge Syndrome" (22q11.2 deletion) involves which branchial pouches?', '["1st and 2nd", "3rd and 4th", "5th", "None"]', 1, '"CATCH-22" = Cardiac, Abnormal facies, Thymic hypoplasia, Cleft palate, Hypocalcemia. (Pocket Medicine)'),
    (v_topic_id, '291: "Bruton Agammaglobulinemia" is a deficiency of which enzyme?', '["ADA", "BTK (Bruton Tyrosine Kinase)", "G6PD", "None"]', 1, 'X-linked; failure of B-cell maturation. (Harrison''s Ch. 110)'),
    (v_topic_id, '292: "Chronic Granulomatous Disease" (CGD) is a defect in ____, leading to infections with catalase-positive organisms.', '["Antibodies", "NADPH oxidase (oxidative burst)", "Complement", "T-cells"]', 1, 'Diagnosed with DHR flow cytometry. (Step-Up)'),
    (v_topic_id, '293: "Catalase-positive" organisms include S. aureus, Aspergillus, and ____.', '["Streptococcus", "Serratia and Burkholderia", "E. coli only", "None"]', 1, 'Important for CGD patients. (Pocket Medicine)');

    -- SECTION 28: FINAL BOARD ASSOCIATION MARATHON (350)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '294: "Auer rods" = ?', '["AML", "ALL", "CLL", "CML"]', 0, 'Myeloblast granules. (Harrison''s Ch. 110)'),
    (v_topic_id, '295: "Smudge cells" = ?', '["ALL", "CLL", "CML", "AML"]', 1, 'Fragile CLL lymphocytes. (Step-Up)'),
    (v_topic_id, '296: "Reed-Sternberg cells" = ?', '["NHL", "Hodgkin Lymphoma", "MM", "None"]', 1, 'Pathognomonic B-cells. (Pocket Medicine)'),
    (v_topic_id, '297: "Philadelphia chromosome" t(9;22) = ?', '["AML", "CML", "ALL", "None"]', 1, 'BCR-ABL fusion. (Harrison''s Ch. 110)'),
    (v_topic_id, '298: "t(15;17)" = ?', '["Burkitt", "APL (AML M3)", "Follicular", "Mantle"]', 1, 'Responds to ATRA. (Step-Up)'),
    (v_topic_id, '299: "t(8;14)" = ?', '["Burkitt Lymphoma", "Follicular", "Mantle", "None"]', 0, 'c-MYC activation. (Pocket Medicine)'),
    (v_topic_id, '300: "t(14;18)" = ?', '["Burkitt", "Follicular Lymphoma", "Mantle", "None"]', 1, 'BCL-2 activation. (Harrison''s Ch. 110)'),
    (v_topic_id, '301: "t(11;14)" = ?', '["Follicular", "Mantle Cell Lymphoma", "Burkitt", "None"]', 1, 'Cyclin D1 activation. (Step-Up)'),
    (v_topic_id, '302: "JAK2 V617F" = ?', '["CML", "Polycythemia Vera / ET / Myelofibrosis", "AML", "None"]', 1, 'Myeloproliferative marker. (Pocket Medicine)'),
    (v_topic_id, '303: "BRAF V600E" = ?', '["Colon CA", "Melanoma", "Lung CA", "None"]', 1, 'Target for Vemurafenib. (Harrison''s Ch. 110)'),
    (v_topic_id, '304: "HER2/neu" = ?', '["Ovarian CA", "Breast Cancer", "Colon CA", "None"]', 1, 'Target for Trastuzumab. (Step-Up)'),
    (v_topic_id, '305: "ALK" translocation = ?', '["Breast CA", "Non-Small Cell Lung Cancer (Adeno)", "Prostate", "None"]', 1, 'Target for Crizotinib. (Pocket Medicine)'),
    (v_topic_id, '306: "S-100" = ?', '["Lung", "Melanoma", "Prostate", "None"]', 1, 'Neural crest marker. (Harrison''s Ch. 110)'),
    (v_topic_id, '307: "TRAP positive" = ?', '["CLL", "Hairy Cell Leukemia", "ALL", "None"]', 1, 'Tartrate-resistant acid phosphatase. (Step-Up)'),
    (v_topic_id, '308: "TdT positive" = ?', '["AML", "ALL", "CML", "None"]', 1, 'Lymphoblast marker. (Pocket Medicine)'),
    (v_topic_id, '309: "CD15 and CD30" = ?', '["NHL", "Hodgkin Lymphoma", "CLL", "None"]', 1, 'Classic HL markers. (Harrison''s Ch. 110)'),
    (v_topic_id, '310: "CD19 and CD20" = ?', '["T-cells", "B-cells", "Platelets", "None"]', 1, 'B-cell lineage markers. (Step-Up)'),
    (v_topic_id, '311: "CD3 and CD4/CD8" = ?', '["B-cells", "T-cells", "Neutrophils", "None"]', 1, 'T-cell lineage markers. (Pocket Medicine)'),
    (v_topic_id, '312: "Hypersegmented neutrophils" = ?', '["Iron deficiency", "B12 / Folate deficiency", "Lead poisoning", "None"]', 1, 'Megaloblastic anemia. (Harrison''s Ch. 95)'),
    (v_topic_id, '313: "Schistocytes" = ?', '["Sickle cell", "MAHA (TTP/HUS/DIC)", "Spherocytosis", "None"]', 1, 'Mechanical fragmentation. (Step-Up)'),
    (v_topic_id, '314: "Bite cells" = ?', '["Thalassemia", "G6PD Deficiency", "Sickle cell", "None"]', 1, 'Splenic pitting of Heinz bodies. (Pocket Medicine)'),
    (v_topic_id, '315: "Target cells" = ?', '["HALT: HbC, Asplenia, Liver disease, Thalassemia", "Iron deficiency only", "Leukemia", "None"]', 0, 'Classic mnemonic for target cells. (Harrison''s Ch. 94)'),
    (v_topic_id, '316: "Basophilic stippling" = ?', '["B12 deficiency", "Lead Poisoning", "Hemolysis", "None"]', 1, 'Ribosome aggregation. (Step-Up)'),
    (v_topic_id, '317: "Howell-Jolly bodies" = ?', '["Functional / Surgical Asplenia", "Iron deficiency", "None", "None"]', 0, 'Nuclear remnants. (Pocket Medicine)'),
    (v_topic_id, '318: "Spherocytes" + "Positive Coombs" = ?', '["Hereditary Spherocytosis", "AIHA", "G6PD", "None"]', 1, 'Immune destruction. (Harrison''s Ch. 94)'),
    (v_topic_id, '319: "Spherocytes" + "Negative Coombs" = ?', '["AIHA", "Hereditary Spherocytosis", "Thalassemia", "None"]', 1, 'Intrinsic membrane defect. (Step-Up)'),
    (v_topic_id, '320: "Ringed sideroblasts" = ?', '["Iron deficiency", "Sideroblastic Anemia / MDS", "B12 deficiency", "None"]', 1, 'Marrow finding. (Pocket Medicine)'),
    (v_topic_id, '321: "Crumpled tissue paper" cytoplasm = ?', '["MM", "Gaucher Disease", "Leukemia", "None"]', 1, 'Macrophage overload. (Harrison''s Ch. 110)'),
    (v_topic_id, '322: "Psammoma bodies" = ?', '["Papillary Thyroid / Serous Ovarian CA", "Small cell lung", "MM", "None"]', 0, 'Calcifications. (Step-Up)'),
    (v_topic_id, '323: "Starry sky" histology = ?', '["Follicular", "Burkitt Lymphoma", "Hodgkin", "None"]', 1, 'Macrophages and apoptosis. (Pocket Medicine)'),
    (v_topic_id, '324: "Apple-core" lesion on imaging = ?', '["Stomach CA", "Colorectal Cancer", "Lung CA", "None"]', 1, 'Annular mass. (Harrison''s Ch. 110)'),
    (v_topic_id, '325: "Sister Mary Joseph Nodule" = ?', '["Breast CA", "Gastric / Abdominal Adenocarcinoma", "Skin CA", "None"]', 1, 'Umbilical met. (Step-Up)'),
    (v_topic_id, '326: "Virchow''s node" = ?', '["Lung CA", "Gastric Adenocarcinoma", "Breast CA", "None"]', 1, 'Left supraclavicular node. (Pocket Medicine)'),
    (v_topic_id, '327: "Krukenberg tumor" = ?', '["Lung met to brain", "Gastric Adenocarcinoma met to Ovary", "Breast met to bone", "None"]', 1, 'Signet ring cells in ovary. (Harrison''s Ch. 110)'),
    (v_topic_id, '328: "Blumer''s shelf" = ?', '["Lung mass", "Palpable mass in rectovesical/rectouterine pouch (GI met)", "Bone tumor", "None"]', 1, 'Sign of peritoneal seeding. (Step-Up)'),
    (v_topic_id, '329: "Pancoast tumor" = ?', '["Lung apex tumor + Horner Syndrome", "Brain tumor", "Liver mass", "None"]', 0, 'Superior sulcus tumor. (Pocket Medicine)'),
    (v_topic_id, '330: "Lambert-Eaton" = ?', '["Small Cell Lung Cancer", "Breast CA", "Colon CA", "None"]', 0, 'Pre-synaptic Ca channel antibodies. (Harrison''s Ch. 110)'),
    (v_topic_id, '331: "PTHrP" secretion = ?', '["Small cell lung", "Squamous Cell Lung Cancer", "Adeno lung", "None"]', 1, 'Leads to hypercalcemia. (Step-Up)'),
    (v_topic_id, '332: "SIADH" or "ACTH" secretion = ?', '["Squamous lung", "Small Cell Lung Cancer", "Large cell lung", "None"]', 1, 'Paraneoplastic endocrine syndromes. (Pocket Medicine)'),
    (v_topic_id, '333: "SVC Syndrome" = ?', '["Lung Cancer (especially Small Cell) / Lymphoma", "Heart failure only", "Pneumonia", "None"]', 0, 'Vessel compression. (Harrison''s Ch. 110)'),
    (v_topic_id, '334: "AFP" high = ?', '["Colon CA", "Hepatocellular CA / Yolk sac tumor", "Prostate", "None"]', 1, 'Liver/Germ cell marker. (Step-Up)'),
    (v_topic_id, '335: "CA-125" high = ?', '["Breast", "Ovarian Cancer", "Cervical", "None"]', 1, 'Serous ovarian marker. (Pocket Medicine)'),
    (v_topic_id, '336: "CEA" high = ?', '["Lung", "Colorectal Cancer", "Prostate", "None"]', 1, 'GI marker for monitoring. (Harrison''s Ch. 110)'),
    (v_topic_id, '337: "CA-19-9" high = ?', '["Liver", "Pancreatic Cancer", "Stomach", "None"]', 1, 'Pancreatic/Biliary marker. (Step-Up)'),
    (v_topic_id, '338: "PSA" high = ?', '["Bladder", "Prostate Cancer", "Kidney", "None"]', 1, 'Prostate marker. (Pocket Medicine)'),
    (v_topic_id, '339: "Bence-Jones" protein = ?', '["Lupus", "Multiple Myeloma", "Diabetes", "None"]', 1, 'Light chain proteinuria. (Harrison''s Ch. 111)'),
    (v_topic_id, '340: "M-protein" spike = ?', '["Infection", "Multiple Myeloma / MGUS / Waldenstrom", "Anemia", "None"]', 1, 'Monoclonal gammopathy. (Step-Up)'),
    (v_topic_id, '341: "Doxorubicin" side effect = ?', '["Kidney", "Cardiotoxicity (Heart failure)", "Lung", "None"]', 1, 'Check ECHO first. (Pocket Medicine)'),
    (v_topic_id, '342: "Bleomycin" side effect = ?', '["Heart", "Pulmonary Fibrosis", "Liver", "None"]', 1, 'Check PFTs first. (Harrison''s Ch. 110)'),
    (v_topic_id, '343: "Cisplatin" side effect = ?', '["Hearing loss + Kidney damage", "Vision loss", "Heart failure", "None"]', 0, 'Needs aggressive hydration. (Step-Up)'),
    (v_topic_id, '344: "Vincristine" side effect = ?', '["Diarrhea", "Peripheral Neuropathy", "Lung", "None"]', 1, 'Microtubule inhibition. (Pocket Medicine)'),
    (v_topic_id, '345: "Cyclophosphamide" side effect = ?', '["Kidney", "Hemorrhagic Cystitis (Bladder)", "Liver", "None"]', 1, 'Acrolein metabolite is toxic. (Harrison''s Ch. 110)'),
    (v_topic_id, '346: "Tamoxifen" side effect = ?', '["Bone loss", "Endometrial CA / Clots", "Brain fog", "None"]', 1, 'Partial agonist in uterus. (Step-Up)'),
    (v_topic_id, '347: "Trastuzumab" side effect = ?', '["Lung", "Cardiotoxicity (Reversible)", "Kidney", "None"]', 1, 'Check ECHO frequently. (Pocket Medicine)'),
    (v_topic_id, '348: "5-FU" side effect = ?', '["Rash", "Hand-Foot Syndrome / Mucositis", "Hearing loss", "None"]', 1, 'Palmar-plantar erythrodysesthesia. (Harrison''s Ch. 110)'),
    (v_topic_id, '349: "L-asparaginase" side effect = ?', '["Lung", "Pancreatitis / Clots", "Kidney", "None"]', 1, 'Used in ALL treatment. (Step-Up)'),
    (v_topic_id, '350: What is the most common primary BONE tumor in adults (not counting MM)?', '["Osteosarcoma", "Chondrosarcoma", "Ewing Sarcoma", "None"]', 1, 'Arises from cartilage. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Hematology/Oncology MCQ Part 4 (264-350) registered.';
END $$;

COMMIT;
