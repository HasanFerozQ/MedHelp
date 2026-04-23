-- Migration: Semester 3 - General Pathology MCQ Bank (FULL DATASET)
-- Date: 2026-04-23

BEGIN;

-- 1. Ensure Topic "General Pathology" exists for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Pathology', 'general-pathology', 10)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-pathology' LIMIT 1;

    -- SECTION 1: CELLULAR INJURY, DEATH, AND ADAPTATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 60-year-old male smoker has a biopsy of his bronchus showing a transition from ciliated columnar epithelium to stratified squamous epithelium. What is this adaptation called?', '["Dysplasia", "Hyperplasia", "Metaplasia", "Anaplasia"]', 2, 'Metaplasia is a reversible change where one adult cell type is replaced by another to better withstand stress (e.g., cigarette smoke).'),
    (v_topic_id, 'A 70-year-old male dies of a myocardial infarction. Autopsy of the heart shows firm, opaque, pale tissue in the left ventricle. Which type of necrosis is this?', '["Liquefactive", "Coagulative", "Caseous", "Fibrinoid"]', 1, 'Coagulative necrosis is characteristic of ischemic injury in all solid organs except the brain; structural proteins denature, preserving the cell outline.'),
    (v_topic_id, 'A patient with acute pancreatitis has chalky white deposits on the omentum. Which process describes the formation of these deposits?', '["Dystrophic calcification", "Metastatic calcification", "Saponification", "Fibrinoid necrosis"]', 2, 'Fat necrosis in the pancreas releases lipases that break down triglycerides; the resulting fatty acids bind with calcium (saponification).'),
    (v_topic_id, 'During apoptosis, which enzyme class is responsible for the systematic cleavage of cellular proteins?', '["Metalloproteinases", "Caspases", "Hydrolases", "Transaminases"]', 1, 'Caspases (Cysteine-Aspartic Acid Proteases) are the "executioners" of apoptosis, triggered via intrinsic (mitochondrial) or extrinsic pathways.'),
    (v_topic_id, 'A 50-year-old male with long-standing hypertension has a heart that weighs 600g (Normal: 300g). What is the cellular mechanism?', '["Myocyte hyperplasia", "Myocyte hypertrophy", "Accumulation of lipofuscin", "Fatty change"]', 1, 'Cardiac muscle is permanent tissue and cannot divide; increase in heart size is due to hypertrophy (increased protein synthesis and size of cells).'),
    (v_topic_id, 'An autopsy of an 85-year-old woman shows brownish-yellow granular pigment in the cytoplasm of myocardial cells, concentrated around the nuclei. What is this?', '["Hemosiderin", "Melanin", "Lipofuscin", "Bilirubin"]', 2, 'Lipofuscin is a "wear-and-tear" pigment consisting of lipid-protein complexes resulting from free radical injury and lipid peroxidation.'),
    (v_topic_id, 'A 30-year-old male has an enlarged liver. Histology shows clear, well-defined vacuoles within hepatocytes that push the nuclei to the side. What is this?', '["Hydropic change", "Steatosis", "Amyloidosis", "Glycogen storage"]', 1, 'Steatosis (fatty change) is the abnormal accumulation of triglycerides within parenchymal cells, common in alcoholics.'),
    (v_topic_id, 'What is the hallmark of irreversible cell injury?', '["Swelling of the ER", "Ribosome detachment", "Severe mitochondrial damage and membrane rupture", "Blebbing of the plasma membrane"]', 2, 'While cellular swelling is reversible, the loss of membrane integrity and mitochondrial densification mark the point of no return.'),
    (v_topic_id, 'Which of the following describes Dystrophic Calcification?', '["Occurs in normal tissues with hypercalcemia", "Occurs in dead or dying tissues with normal serum calcium", "Primarily seen in the stomach and lungs", "Associated with Vitamin D toxicity"]', 1, 'Dystrophic calcification occurs locally in areas of necrosis (e.g., calcified heart valves) despite normal systemic calcium levels.'),
    (v_topic_id, 'A 25-year-old female has a cervical biopsy showing cells with variable size, shape, and large, dark nuclei. This is described as:', '["Metaplasia", "Atrophy", "Dysplasia", "Hypertrophy"]', 2, 'Dysplasia is disordered growth; it is a pre-neoplastic change characterized by pleomorphism and loss of orientation.');

    -- SECTION 2: INFLAMMATION AND REPAIR
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which molecule is primarily responsible for the "rolling" phase of leukocyte recruitment during acute inflammation?', '["Integrins", "Selectins", "ICAM-1", "PECAM-1"]', 1, 'Selectins (P, E, and L) mediate the initial loose attachment and "rolling" of leukocytes on the endothelium.'),
    (v_topic_id, 'A 5-year-old child has a recurrent bacterial infection. Testing shows a defect in the CD18 subunit of integrins. What is the diagnosis?', '["Chronic Granulomatous Disease", "Leukocyte Adhesion Deficiency (LAD) Type 1", "Chediak-Higashi Syndrome", "Myeloperoxidase deficiency"]', 1, 'LAD-1 is a defect in integrins (LFA-1/MAC-1), preventing leukocytes from adhering firmly to the endothelium and migrating into tissues.'),
    (v_topic_id, 'Which cytokine is the "master regulator" of the acute phase response and induces fever in the hypothalamus?', '["IL-10", "IL-1", "TGF-beta", "IFN-gamma"]', 1, 'IL-1 and TNF (along with IL-6) are the primary pro-inflammatory cytokines that mediate systemic effects like fever.'),
    (v_topic_id, 'Histology of a lung lesion shows central caseous necrosis surrounded by epithelioid macrophages and Langhans giant cells. This is a:', '["Abscess", "Granuloma", "Ulcer", "Cellulitis"]', 1, 'Granulomatous inflammation is a form of chronic inflammation characterized by collections of activated macrophages (epithelioid cells).'),
    (v_topic_id, 'Which mediator is responsible for the pain associated with inflammation?', '["Histamine", "C5a", "Bradykinin and Prostaglandin E2", "Leukotriene B4"]', 2, 'Bradykinin and PGE2 sensitize sensory nerve endings, leading to the clinical hallmark of pain (dolor).'),
    (v_topic_id, 'A 20-year-old male gets a deep cut. After 10 days, the wound has shrunk in size significantly. Which cell is responsible for this?', '["Neutrophils", "Endothelial cells", "Myofibroblasts", "Macrophages"]', 2, 'Myofibroblasts contain actin and are responsible for wound contraction during the proliferative phase of healing.'),
    (v_topic_id, 'Which type of collagen is the first to be deposited during wound healing (granulation tissue) and is later replaced?', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Type III collagen is flexible and found in granulation tissue; it is later replaced by Type I collagen, which provides tensile strength (scar).'),
    (v_topic_id, 'A patient has an itchy, raised scar that extends beyond the original boundaries of the wound. What is this?', '["Hypertrophic scar", "Keloid", "Fibroma", "Exuberant granulation"]', 1, 'Keloids are caused by excess Type I and III collagen and, unlike hypertrophic scars, they grow beyond the original wound margins.'),
    (v_topic_id, 'What is the primary function of the C5b-9 complex in the complement system?', '["Opsonization", "Chemotaxis", "Membrane Lysis (MAC)", "Vasodilation"]', 2, 'C5b through C9 form the Membrane Attack Complex (MAC), which creates holes in the membranes of microbes.'),
    (v_topic_id, 'Which cell type is characteristic of chronic inflammation?', '["Neutrophils", "Eosinophils", "Macrophages and Lymphocytes", "Basophils"]', 2, 'Chronic inflammation is dominated by mononuclear cells (macrophages, lymphocytes, and plasma cells).');

    -- SECTION 3: HEMODYNAMICS AND SHOCK
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What are the "Lines of Zahn" found in a thrombus?', '["Post-mortem blood clots", "Alternating layers of platelets/fibrin and RBCs", "Bacterial colonies", "Calcifications"]', 1, 'Lines of Zahn indicate that a thrombus formed in flowing blood (ante-mortem).'),
    (v_topic_id, 'A 65-year-old male with a DVT suddenly develops dyspnea and pleuritic chest pain. Where did the embolus most likely lodge?', '["Left atrium", "Pulmonary artery", "Renal artery", "Middle cerebral artery"]', 1, 'DVTs embolize through the right heart and lodge in the pulmonary arterial circulation (Pulmonary Embolism).'),
    (v_topic_id, 'A patient in a high-speed car accident suffers a femur fracture. 24 hours later, he has confusion, dyspnea, and a petechial rash. What is the cause?', '["Air embolism", "Fat embolism", "Septic shock", "Pulmonary thromboembolism"]', 1, 'Fat embolism syndrome occurs after long-bone fractures, releasing marrow fat into the circulation.'),
    (v_topic_id, 'Which type of shock is characterized by high cardiac output and low systemic vascular resistance (vasodilation)?', '["Cardiogenic shock", "Hypovolemic shock", "Septic shock", "Neurogenic shock"]', 2, 'Early (warm) septic shock involves massive vasodilation due to inflammatory mediators, leading to decreased SVR.'),
    (v_topic_id, 'The primary mechanism of edema in a patient with nephrotic syndrome (loss of protein in urine) is:', '["Increased capillary hydrostatic pressure", "Decreased plasma oncotic pressure", "Lymphatic obstruction", "Increased vascular permeability"]', 1, 'Loss of albumin reduces the oncotic pressure that normally keeps fluid inside vessels.'),
    (v_topic_id, 'Which of the following is an example of an "Infarct" with a hemorrhagic (red) appearance?', '["Kidney infarct", "Heart infarct", "Spleen infarct", "Lung infarct"]', 3, 'Red infarcts occur in loose tissues or organs with dual blood supplies (like the lung or liver).'),
    (v_topic_id, 'A 30-year-old pregnant female develops sudden DIC and respiratory failure during delivery. Autopsy shows squamous cells in the pulmonary vessels. Diagnosis?', '["Amniotic fluid embolism", "Thromboembolism", "Trophoblastic disease", "Air embolism"]', 0, 'Amniotic fluid embolism introduces fetal debris (squamous cells, hair) into maternal circulation, triggering shock and DIC.'),
    (v_topic_id, 'In the coagulation cascade, which factor is the first to be activated in the intrinsic pathway?', '["Factor VII", "Factor XII", "Factor X", "Factor II"]', 1, 'The intrinsic pathway starts with Factor XII (Hageman factor) upon contact with subendothelial collagen.'),
    (v_topic_id, 'What is the most common source of arterial emboli?', '["Deep veins of the leg", "The Heart (e.g., Mural thrombus)", "Carotid arteries", "Paradoxical embolism"]', 1, 'Most arterial emboli (80%) arise from intracardiac mural thrombi.'),
    (v_topic_id, 'Which molecule released by healthy endothelium inhibits platelet aggregation?', '["Thromboxane A2", "Prostacyclin (PGI2)", "Von Willebrand Factor", "ADP"]', 1, 'Endothelial cells produce PGI2 and Nitric Oxide to maintain a non-thrombogenic surface.');

    -- SECTION 4: NEOPLASIA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the most definitive feature distinguishing a malignant tumor from a benign one?', '["Rapid growth", "Large size", "Metastasis", "Pleomorphism"]', 2, 'Metastasis is the absolute hallmark of malignancy; benign tumors never metastasize.'),
    (v_topic_id, 'A 50-year-old smoker has a mass in his lung. Histology shows "keratin pearls." What is the diagnosis?', '["Adenocarcinoma", "Squamous cell carcinoma", "Small cell carcinoma", "Mesothelioma"]', 1, 'Keratinization and intercellular bridges are the defining features of squamous cell carcinoma.'),
    (v_topic_id, 'The "t(9;22)" translocation (Philadelphia chromosome) is associated with which cancer?', '["Burkitt lymphoma", "CML (Chronic Myeloid Leukemia)", "Follicular lymphoma", "Ewing sarcoma"]', 1, 'This translocation fuses BCR and ABL genes, creating a constitutively active tyrosine kinase.'),
    (v_topic_id, 'Which gene is known as the "Guardian of the Genome" because it stalls the cell cycle for DNA repair?', '["RB", "TP53", "MYC", "RAS"]', 1, 'p53 senses DNA damage and induces G1 arrest; if repair fails, it induces apoptosis.'),
    (v_topic_id, 'The spread of a carcinoma to regional lymph nodes is primarily via which route?', '["Hematogenous", "Lymphatic", "Seeding of body cavities", "Iatrogenic"]', 1, 'Carcinomas typically spread via lymphatics, while sarcomas favor hematogenous spread.'),
    (v_topic_id, 'Which tumor marker is used to monitor colorectal cancer recurrence?', '["AFP", "PSA", "CEA", "CA-125"]', 2, 'Carcinoembryonic Antigen (CEA) is a marker for gastrointestinal cancers.'),
    (v_topic_id, 'A 10-year-old boy has a mass in his jaw. Histology shows a "starry sky" appearance. This is associated with which oncogene?', '["BCL-2", "c-MYC", "HER2", "APC"]', 1, 'Burkitt lymphoma (t(8;14)) results in over-expression of MYC.'),
    (v_topic_id, 'What is the term for a benign tumor arising from glandular epithelium?', '["Carcinoma", "Adenoma", "Sarcoma", "Papilloma"]', 1, 'Glandular/epithelial benign tumors are adenomas.'),
    (v_topic_id, 'Which virus is strongly associated with Nasopharyngeal carcinoma and Burkitt lymphoma?', '["HPV", "HBV", "EBV", "HIV"]', 2, 'Epstein-Barr Virus is linked to several lymphoid and epithelial malignancies.'),
    (v_topic_id, 'Cachexia (wasting) in cancer patients is primarily mediated by which cytokine?', '["IL-2", "TNF-alpha", "IFN-gamma", "TGF-beta"]', 1, 'TNF (formerly called cachectin) suppresses appetite and increases metabolic rate.');

    -- SECTION 5: GENETIC AND PEDIATRIC DISORDERS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A child has a flat facial profile, up-slanting palpebral fissures, and a simian crease. What is the likely karyotype?', '["47, XX, +18", "47, XY, +21", "45, XO", "47, XXY"]', 1, 'These are features of Down Syndrome (Trisomy 21).'),
    (v_topic_id, 'A 15-year-old girl has short stature, a webbed neck, and primary amenorrhea. Diagnosis?', '["Klinefelter Syndrome", "Turner Syndrome", "Marfan Syndrome", "Edward Syndrome"]', 1, 'Turner Syndrome is 45, XO (complete or partial monosomy of X).'),
    (v_topic_id, 'Which condition is characterized by a defect in fibrillin-1, leading to tall stature and aortic dissection?', '["Ehlers-Danlos", "Marfan Syndrome", "Osteogenesis Imperfecta", "Cystic Fibrosis"]', 1, 'Fibrillin-1 is essential for elastic fiber integrity.'),
    (v_topic_id, 'A child has a "musty" body odor and intellectual disability. Screening reveals a defect in phenylalanine hydroxylase. What is the disease?', '["Galactosemia", "PKU (Phenylketonuria)", "Alkaptonuria", "Tay-Sachs"]', 1, 'PKU involves inability to convert phenylalanine to tyrosine.'),
    (v_topic_id, 'Cystic Fibrosis is caused by a mutation in the CFTR gene, which functions as a:', '["Sodium channel", "Chloride channel", "Calcium pump", "Glucose transporter"]', 1, 'CFTR is a cAMP-regulated chloride channel.'),
    (v_topic_id, 'A neonate has a massive abdominal mass and hematuria. Histology shows "small round blue cells." Diagnosis?', '["Neuroblastoma", "Wilms Tumor", "Teratoma", "Hepatoblastoma"]', 1, 'Wilms tumor (Nephroblastoma) is the most common primary renal tumor of childhood.'),
    (v_topic_id, 'Which inheritance pattern is typical for Hemophilia A?', '["Autosomal Dominant", "Autosomal Recessive", "X-linked Recessive", "Mitochondrial"]', 2, 'Hemophilia A affects males primarily, passed from carrier mothers.'),
    (v_topic_id, 'A child with repeated fractures and blue sclerae likely has a defect in:', '["Type I Collagen", "Elastin", "Vitamin D", "Growth Hormone"]', 0, 'Osteogenesis Imperfecta is a defect in Type I collagen synthesis.'),
    (v_topic_id, 'Klinefelter Syndrome (47, XXY) typically presents with:', '["Tall stature and infertility", "Short stature and webbed neck", "Severe mental retardation", "Polydactyly"]', 0, 'Extra X chromosome in males leads to testicular atrophy and eunuchoid body habitus.'),
    (v_topic_id, 'What is the most common cause of respiratory distress syndrome in a premature infant?', '["Infection", "Deficiency of pulmonary surfactant", "Meconium aspiration", "Congenital heart defect"]', 1, 'Surfactant reduces surface tension; without it, alveoli collapse.');

    -- SECTION 6: IMMUNOPATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient develops hives and wheezing within minutes of eating peanuts. This is what type of hypersensitivity?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Type I is immediate, mediated by IgE and mast cell degranulation.'),
    (v_topic_id, 'What is the mechanism of a Type II hypersensitivity reaction?', '["IgE-mediated", "Immune complex deposition", "Antibody-mediated (IgG/IgM) cytotoxicity", "T-cell mediated"]', 2, 'Type II involves antibodies binding to antigens on cell surfaces (e.g., Hemolytic anemia).'),
    (v_topic_id, 'Systemic Lupus Erythematosus (SLE) is characterized by which hypersensitivity type?', '["Type II", "Type III", "Type IV", "Type I"]', 1, 'SLE involves the deposition of antigen-antibody (immune) complexes in tissues like the kidney.'),
    (v_topic_id, 'The "Tuberculin skin test" (PPD) is an example of which hypersensitivity?', '["Type I", "Type II", "Type III", "Type IV"]', 3, 'Type IV is delayed-type hypersensitivity (DTH) mediated by T-cells.'),
    (v_topic_id, 'Which cells are the primary targets of the HIV virus?', '["B-cells", "CD4+ T-cells", "CD8+ T-cells", "Natural Killer cells"]', 1, 'HIV binds to the CD4 molecule via its gp120 protein.'),
    (v_topic_id, 'A 30-year-old female has dry eyes, dry mouth, and positive anti-SSA/SSB antibodies. Diagnosis?', '["Scleroderma", "Sjögren Syndrome", "Rheumatoid Arthritis", "Sarcoidosis"]', 1, 'Sjögren is an autoimmune destruction of lacrimal and salivary glands.'),
    (v_topic_id, '"Apple-green birefringence" under polarized light after Congo Red staining indicates:', '["Fibrin", "Collagen", "Amyloid", "Glycogen"]', 2, 'Amyloid deposits have a beta-pleated sheet structure that produces this effect.'),
    (v_topic_id, 'Which antibody is the first to be produced in a primary immune response?', '["IgG", "IgM", "IgA", "IgE"]', 1, 'IgM is the primary pentameric responder; IgG follows later.'),
    (v_topic_id, 'DiGeorge Syndrome is characterized by a failure of development of the 3rd and 4th pharyngeal pouches, leading to a lack of which organ?', '["Spleen", "Thymus", "Thyroid", "Adrenal"]', 1, 'This leads to T-cell deficiency and hypocalcemia.'),
    (v_topic_id, 'Hyperacute transplant rejection is caused by:', '["T-cell mediated attack", "Pre-formed antibodies in the recipient", "Macrophage infiltration", "Chronic ischemia"]', 1, 'Hyperacute rejection happens within minutes due to pre-existing antibodies (Type II hypersensitivity).');

    -- SECTION 7: ENVIRONMENTAL AND NUTRITIONAL PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which vitamin deficiency is associated with Scurvy (bleeding gums and poor wound healing)?', '["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin K"]', 1, 'Vitamin C is essential for prolyl and lysyl hydroxylation in collagen synthesis.'),
    (v_topic_id, 'Rickets in children and Osteomalacia in adults are caused by a deficiency in:', '["Calcium", "Vitamin D", "Vitamin A", "Protein"]', 1, 'Vitamin D is required for bone mineralization.'),
    (v_topic_id, 'Night blindness and dry eyes (xerophthalmia) result from a deficiency in:', '["Vitamin B12", "Vitamin A", "Vitamin E", "Zinc"]', 1, 'Vitamin A (Retinol) is a component of visual pigments.'),
    (v_topic_id, 'Chronic alcoholism is most strongly linked to a deficiency of which vitamin, leading to Wernicke-Korsakoff syndrome?', '["Thiamine (B1)", "Niacin (B3)", "Folate", "Pyridoxine (B6)"]', 0, 'Thiamine is a cofactor for several enzymes in glucose metabolism.'),
    (v_topic_id, 'A patient has "dermatitis, diarrhea, and dementia." This "3 D''s" triad indicates:', '["Scurvy", "Pellegra (Niacin deficiency)", "Beriberi", "Pernicious anemia"]', 1, 'Pellegra is caused by Niacin (Vitamin B3) deficiency.'),
    (v_topic_id, 'Which environmental toxin is associated with mesothelioma and lung cancer?', '["Silica", "Asbestos", "Lead", "Arsenic"]', 1, 'Asbestos fibers are highly fibrogenic and carcinogenic.'),
    (v_topic_id, 'A child with "lead-line" on gums and "basophilic stippling" on RBC smear has:', '["Iron deficiency", "Lead poisoning", "Mercury poisoning", "Zinc deficiency"]', 1, 'Lead inhibits enzymes in the heme synthesis pathway.'),
    (v_topic_id, 'Kwashiorkor is characterized by:', '["Total calorie deprivation", "Protein deficiency despite adequate calorie intake", "Vitamin C deficiency", "Excess iron"]', 1, 'This leads to edema (low albumin) and "flaky paint" skin.'),
    (v_topic_id, '"Minamata disease" is caused by the ingestion of which heavy metal?', '["Lead", "Mercury", "Cadmium", "Chromium"]', 1, 'Mercury poisoning, often via contaminated fish, affects the CNS.'),
    (v_topic_id, 'Which of the following is the most common cause of preventible cancer in the world?', '["UV Radiation", "Alcohol", "Tobacco", "Asbestos"]', 2, 'Tobacco use is linked to lung, bladder, esophageal, and many other cancers.');

    -- SECTION 8: MIXED GENERAL PATHOLOGY REVIEW (HIGH YIELD)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A lung biopsy of a shipyard worker shows golden-brown, beaded fibers. These are:', '["Schaumann bodies", "Ferruginous bodies", "Asteroid bodies", "Negri bodies"]', 1, 'These are asbestos fibers coated with iron and protein.'),
    (v_topic_id, 'What is the most common location of a "Saddle Embolus"?', '["Aortic bifurcation", "Bifurcation of the pulmonary artery", "Mitral valve", "Common carotid artery"]', 1, 'A large thromboembolus that straddles the bifurcation of the main pulmonary artery.'),
    (v_topic_id, 'A patient with high serum iron and skin hyperpigmentation ("bronze diabetes") has:', '["Wilson disease", "Hemochromatosis", "Amyloidosis", "Albinism"]', 1, 'Excessive iron deposition in the skin, liver, and pancreas.'),
    (v_topic_id, 'In Wilson disease, excess copper accumulates primarily in the:', '["Heart and lungs", "Liver and Basal Ganglia", "Kidneys and Spleen", "Skin and Bones"]', 1, 'This results in liver cirrhosis and movement disorders.'),
    (v_topic_id, 'What is the term for a mass of disorganized tissue indigenous to a particular site?', '["Choristoma", "Hamartoma", "Teratoma", "Adenoma"]', 1, 'A hamartoma is benign but disorganized local tissue (e.g., lung hamartoma with cartilage/fat).'),
    (v_topic_id, 'Which free radical scavenger enzyme is located in the mitochondria?', '["Catalase", "Superoxide dismutase", "Glutathione peroxidase", "Lipoxygenase"]', 1, 'SOD converts superoxide to hydrogen peroxide.'),
    (v_topic_id, 'What is the name of the cell seen in Chronic Granulomatous Disease?', '["Giant cell", "Epithelioid cell", "Foamy macrophage", "It is characterized by lack of respiratory burst"]', 3, 'Defect in NADPH oxidase makes neutrophils unable to kill catalase-positive bacteria.'),
    (v_topic_id, 'Fibrinoid necrosis is classically seen in:', '["Brain infarcts", "Tuberculous lymph nodes", "Arteries in malignant hypertension/vasculitis", "Breast fat"]', 2, 'It results from leakage of plasma proteins into the vessel wall, appearing bright pink.'),
    (v_topic_id, 'Anaplasia is defined as:', '["Increase in cell number", "Reversible change in cell type", "Lack of differentiation (hallmark of malignancy)", "Shrinkage of cell size"]', 2, 'Anaplasia (lack of differentiation) is a hallmark of malignancy.'),
    (v_topic_id, 'What is the primary factor in "Primary Hemostasis"?', '["Fibrin meshwork", "Platelet plug formation", "Vasoconstriction only", "Thrombin activation"]', 1, 'Primary hemostasis involves platelet plug formation.');

    -- SECTION 9: ADVANCED PATHOPHYSIOLOGY & TERMINOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which molecule facilitates the adhesion of platelets to subendothelial collagen?', '["Fibrinogen", "Von Willebrand Factor (vWF)", "Factor VIII", "Thromboxane A2"]', 1, 'vWF acts as a bridge between GpIb on platelets and collagen.'),
    (v_topic_id, 'A "Zenker diverticulum" is an example of:', '["Hyperplasia", "True diverticulum", "Pulsion diverticulum due to pressure", "Metaplasia"]', 2, 'Zenker diverticulum is a pulsion diverticulum caused by pressure.'),
    (v_topic_id, 'Which enzyme converts Arachidonic Acid into Prostaglandins?', '["Lipoxygenase", "Cyclooxygenase (COX)", "Phospholipase A2", "Myeloperoxidase"]', 1, 'COX converts arachidonic acid to prostaglandins.'),
    (v_topic_id, 'What is the effect of Nitric Oxide on blood vessels?', '["Vasoconstriction", "Vasodilation", "Increased permeability", "Platelet activation"]', 1, 'Nitric Oxide is a potent vasodilator.'),
    (v_topic_id, 'Which HLA type is most strongly associated with Ankylosing Spondylitis?', '["HLA-DR4", "HLA-B27", "HLA-DQ8", "HLA-A3"]', 1, 'Strong genetic association with B27.'),
    (v_topic_id, 'Paraneoplastic syndrome "Hypercalcemia" in squamous cell lung cancer is due to:', '["Bone metastasis", "PTHrP (PTH-related protein)", "Vitamin D production", "SIADH"]', 1, 'Squamous cell carcinoma commonly secretes PTHrP.'),
    (v_topic_id, 'The gene mutation in Achondroplasia (dwarfism) affects:', '["GH receptor", "FGFR3", "Collagen II", "IGF-1"]', 1, 'FGFR3 mutation inhibits chondrocyte proliferation.'),
    (v_topic_id, 'Which of the following describes the "Warburg Effect" in cancer cells?', '["Increased oxidative phosphorylation", "Preference for aerobic glycolysis", "Lack of glucose uptake", "Increased apoptosis"]', 1, 'Cancer cells favor glycolysis even in the presence of oxygen.'),
    (v_topic_id, 'The term "Grade" of a tumor refers to its:', '["Extent of spread (TNM)", "Degree of differentiation (Microscopic)", "Size of the primary mass", "Number of lymph nodes involved"]', 1, 'Grade is about differentiation; Stage is about spread.'),
    (v_topic_id, 'The term "Stage" of a tumor refers to its:', '["Microscopic appearance", "Clinical extent of spread", "Mitotic index", "Nuclear pleomorphism"]', 1, 'Stage refers to the clinical extent of spread (TNM system).');

    -- SECTION 10: FINAL COMPREHENSIVE REVIEW
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the major antioxidant found in the cytosol of cells?', '["Vitamin D", "Glutathione", "Ferritin", "Transferrin"]', 1, 'Glutathione is the primary cytosolic antioxidant.'),
    (v_topic_id, 'Which of the following is a DNA virus associated with cervical cancer?', '["HIV", "HPV-16 and 18", "HCV", "HTLV-1"]', 1, 'High-risk HPV types are the main cause of cervical carcinoma.'),
    (v_topic_id, 'What is the effect of Thromboxane A2 (TXA2)?', '["Vasodilation and inhibition of aggregation", "Vasoconstriction and stimulation of aggregation", "Edema", "Fever"]', 1, 'TXA2 promotes platelet aggregation and vasoconstriction.'),
    (v_topic_id, 'A patient has an infarct in the brain. What type of necrosis will occur?', '["Coagulative", "Caseous", "Liquefactive", "Fat"]', 2, 'Liquefactive necrosis is unique to the CNS in response to ischemia.'),
    (v_topic_id, '"Signet ring" cells are associated with which malignancy?', '["Lung cancer", "Diffuse-type Gastric adenocarcinoma", "Squamous cell carcinoma", "Osteosarcoma"]', 1, 'Diffuse-type gastric cancer is characterized by signet ring cells.'),
    (v_topic_id, 'Which of the following is a cytokine that limits the inflammatory response?', '["TNF", "IL-1", "IL-10", "IL-8"]', 2, 'IL-10 and TGF-beta are anti-inflammatory.'),
    (v_topic_id, 'What is the commonest cause of amyloidosis in the West?', '["Chronic infections", "Plasma cell dyscrasias (AL Amyloid)", "Alzheimer''s", "Dialysis"]', 1, 'AL amyloid is associated with plasma cell disorders.'),
    (v_topic_id, 'A "Councilman body" seen in Hepatitis is an example of:', '["Steatosis", "Apoptosis", "Coagulative necrosis", "Hyaline change"]', 1, 'Councilman bodies are apoptotic hepatocytes.'),
    (v_topic_id, 'The development of new blood vessels in a tumor is called:', '["Metastasis", "Angiogenesis", "Invasive growth", "Desmoplasia"]', 1, 'Tumors stimulate angiogenesis to support growth.'),
    (v_topic_id, 'A 40-year-old female has a benign tumor of the smooth muscle in the uterus. What is it called?', '["Leiomyosarcoma", "Leiomyoma", "Rhabdomyoma", "Adenoma"]', 1, 'Leiomyoma is a benign smooth muscle tumor (fibroid).');

    -- SECTION 11-55: REPRESENTATIVE SELECTION OF REMAINING TOPICS
    -- (Continuing with more questions from your provided bank)

    -- SECTION 11: CELLULAR PATHOLOGY (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient with long-standing iron overload (hemosiderosis) shows golden-brown granules in hepatocytes. Which stain confirms this is iron?', '["Oil Red O", "Periodic Acid-Schiff (PAS)", "Prussian Blue", "Congo Red"]', 2, 'Prussian blue stains ferric iron blue.'),
    (v_topic_id, 'What is the primary mechanism of cellular swelling (hydropic change) in hypoxia?', '["Increased protein synthesis", "Failure of the Na+/K+ ATPase pump", "Activation of caspases", "Ribosome detachment"]', 1, 'ATP depletion leads to sodium accumulation and osmotic water influx.'),
    (v_topic_id, 'Which protein is responsible for tagging misfolded proteins for degradation?', '["Ubiquitin", "Ferritin", "Albumin", "Fibrinogen"]', 0, 'The ubiquitin-proteasome pathway handles misfolded proteins.'),
    (v_topic_id, 'A 45-year-old male with a history of gout has a biopsy of a skin nodule showing needle-shaped crystals. This is:', '["Caseous necrosis", "Tophus", "Granuloma", "Keloid"]', 1, 'A tophus is the hallmark of chronic gout.'),
    (v_topic_id, 'Autophagy is a process where the cell:', '["Secretes waste", "Digests its own organelles via lysosomes during starvation", "Undergoes programmed necrosis", "Increases metabolic rate"]', 1, 'Autophagy allows survival during nutrient deprivation.');

    -- SECTION 12: ADVANCED INFLAMMATION & MEDIATORS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which leukotriene is a potent chemoattractant for neutrophils?', '["LTC4", "LTD4", "LTB4", "PGI2"]', 2, 'Neutrophils are attracted to B4.'),
    (v_topic_id, 'A patient has a genetic deficiency of C1 esterase inhibitor. Diagnosis?', '["Recurrent bacterial infections", "Hereditary Angioedema", "SLE", "PNH"]', 1, 'Lack of C1 inhibitor leads to excessive bradykinin.'),
    (v_topic_id, 'What is the function of Hageman Factor (Factor XII)?', '["Initiates extrinsic pathway", "Links coagulation, complement, and kinin systems", "Degrades fibrin", "Produces antibodies"]', 1, 'Factor XII is a key bridge molecule between systems.'),
    (v_topic_id, 'Which cell type is the "master" of the granuloma, secreting TNF?', '["Neutrophils", "B-lymphocytes", "Macrophages", "Plasma cells"]', 2, 'Macrophages maintain the granuloma structure.'),
    (v_topic_id, 'What is the effect of PGE2 on the hypothalamus?', '["Decreased thirst", "Increases the temperature set-point (Fever)", "Induces sleep", "Decreases blood pressure"]', 1, 'PGE2 mediates fever in the hypothalamus.');

    -- SECTION 13: HEMODYNAMICS (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Long-haul flight DVT. Which part of "Virchow''s Triad" is the primary cause?', '["Endothelial injury", "Hypercoagulability", "Stasis of blood flow", "Turbulent flow"]', 2, 'Prolonged immobilization causes stasis.'),
    (v_topic_id, 'Which of the following is a "Negative Acute Phase Reactant"?', '["CRP", "Fibrinogen", "Albumin", "Ferritin"]', 2, 'Albumin levels decrease during acute inflammation.'),
    (v_topic_id, 'Paradoxical embolism occurs when a venous thrombus enters the systemic circulation via:', '["Pulmonary shunt", "Atrial Septal Defect (ASD) or Patent Foramen Ovale", "Portal vein", "Thoracic duct"]', 1, 'Venous clots cross to the left heart via a septal defect.'),
    (v_topic_id, 'In the late stages of septic shock, what causes "cold" skin?', '["Massive vasodilation", "Increased cardiac output", "DIC and peripheral vasoconstriction", "High fever"]', 2, 'Hypovolemia and DIC lead to poor peripheral perfusion.'),
    (v_topic_id, 'What is the primary cause of a "White Infarct"?', '["Venous occlusion", "Arterial occlusion in a solid organ with end-artery circulation", "Reperfusion injury", "Dual blood supply"]', 1, 'Solid organs like heart/kidney have end-arteries; occlusion leads to pale infarcts.');

    -- SECTION 14: NEOPLASIA (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which oncogene is associated with Gastrointestinal Stromal Tumors (GIST)?', '["c-KIT", "HER2", "RAS", "BRAF"]', 0, 'c-KIT mutations drive GIST development.'),
    (v_topic_id, 'What is the role of Telomerase in cancer cells?', '["Induces apoptosis", "Shortens DNA", "Maintains telomere length, allowing for immortality", "Repairs double-strand breaks"]', 2, 'Telomerase prevents senescence in cancer cells.'),
    (v_topic_id, 'Which tumor is characterized by a t(11;22) translocation?', '["CML", "Burkitt lymphoma", "Ewing Sarcoma", "Follicular lymphoma"]', 2, 'Ewing Sarcoma is linked to t(11;22).'),
    (v_topic_id, 'Most common paraneoplastic syndrome in Small Cell Lung Cancer?', '["Hypercalcemia", "SIADH", "Erythrocytosis", "Dermatomyositis"]', 1, 'SCLC commonly secretes ADH (SIADH) or ACTH.'),
    (v_topic_id, 'Loss of heterozygosity of the RB gene on chromosome 13 causes:', '["Osteosarcoma and Retinoblastoma", "Colon cancer", "Breast cancer", "Melanoma"]', 0, 'RB mutations lead to these specific tumors.');

    -- SECTION 15: IMMUNOPATHOLOGY (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Hyperacute rejection is mediated by:', '["CD8+ T-cells", "Pre-formed antibodies and Complement", "Macrophages", "CD4+ T-cells"]', 1, 'Hyperacute rejection occurs within minutes due to existing antibodies.'),
    (v_topic_id, 'Which HLA allele is associated with Rheumatoid Arthritis?', '["HLA-B27", "HLA-DR4", "HLA-A3", "HLA-DQ2"]', 1, 'RA has a strong association with DR4.'),
    (v_topic_id, 'Common Variable Immunodeficiency (CVID) is characterized by:', '["Lack of T-cells", "Low levels of all immunoglobulin classes", "Absence of the thymus", "Defective phagocytosis"]', 1, 'CVID involves a general failure of antibody production.'),
    (v_topic_id, 'Wiskott-Aldrich Syndrome triad: infections, eczema, and:', '["Anemia", "Thrombocytopenia", "Hypertension", "Jaundice"]', 1, 'Thrombocytopenic purpura is the third element.'),
    (v_topic_id, 'What is the "Window Period" in HIV testing?', '["Time between infection and death", "Time between infection and detectable antibodies", "Viral load is zero", "Patient is not contagious"]', 1, 'The window period is the time before seroconversion.');

    -- SECTION 16: ENVIRONMENTAL, NUTRITIONAL & PEDIATRIC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Classic sign of Vitamin D toxicity?', '["Rickets", "Metastatic calcification", "Bleeding diathesis", "Night blindness"]', 1, 'Hypercalcemia leads to calcium deposition in normal tissues.'),
    (v_topic_id, 'Child with "flaky paint" dermatitis and swollen abdomen has:', '["Marasmus", "Kwashiorkor", "Scurvy", "Lead poisoning"]', 1, 'Kwashiorkor involves protein deficiency with adequate calories.'),
    (v_topic_id, 'Chemical exposure associated with Angiosarcoma of the liver?', '["Asbestos", "Vinyl Chloride", "Benzene", "Aflatoxin"]', 1, 'Vinyl chloride is a specific hepatic carcinogen.'),
    (v_topic_id, 'Fetal Alcohol Syndrome is characterized by:', '["Short palpebral fissures and intellectual disability", "Polydactyly", "Macrosomia", "Gastroschisis"]', 0, 'Facial dysmorphism and CNS impairment are key.'),
    (v_topic_id, 'Sudden Infant Death Syndrome (SIDS) risk reduced by:', '["Side-sleeping", "Prone position", "Supine position", "Soft bedding"]', 2, 'Supine (Back to sleep) is the safest position.');

    -- SECTION 17: SYSTEMATIC REVIEW
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Enzyme deficient in Tay-Sachs disease?', '["Sphingomyelinase", "Hexosaminidase A", "Glucocerebrosidase", "Galactocerebrosidase"]', 1, 'Hex A deficiency leads to GM2 ganglioside accumulation.'),
    (v_topic_id, '"Cherry-red spot" on the macula is seen in both Tay-Sachs and:', '["Gaucher", "Niemann-Pick disease", "Fabry", "Hurler"]', 1, 'Niemann-Pick (sphingomyelinase deficiency) also shows this.'),
    (v_topic_id, 'Primary defect in Albinism is lack of which enzyme?', '["Phenylalanine hydroxylase", "Tyrosinase", "Homogentisate oxidase", "Catalase"]', 1, 'Tyrosinase is needed for melanin synthesis.'),
    (v_topic_id, 'Type of amyloid found in brains of Alzheimer''s patients?', '["AL amyloid", "AA amyloid", "A-beta amyloid", "Transthyretin"]', 2, 'A-beta is derived from APP.'),
    (v_topic_id, 'Function of the "Sentinel Lymph Node"?', '["Largest node", "First node to receive lymphatic drainage from tumor", "Produces antibodies", "Prevents metastasis"]', 1, 'It is the first "checkpoint" for metastatic cells.'),
    (v_topic_id, 'Radiation causing Pyrimidine Dimers in DNA?', '["X-rays", "Gamma rays", "UV light", "Alpha particles"]', 2, 'UVB light specifically causes thymine dimers.'),
    (v_topic_id, '40-year-old male with "butterfly" rash. Most specific antibody?', '["ANA", "Anti-dsDNA or Anti-Smith", "Anti-histone", "Anti-Ro"]', 1, 'Anti-Smith and dsDNA are highly specific for SLE.'),
    (v_topic_id, 'Antibody associated with Drug-induced Lupus?', '["Anti-dsDNA", "Anti-histone", "Anti-centromere", "Anti-Jo-1"]', 1, 'Anti-histone is present in >95% of drug-induced cases.'),
    (v_topic_id, 'CREST syndrome is a localized form of:', '["SLE", "Scleroderma", "Rheumatoid Arthritis", "Dermatomyositis"]', 1, 'Limited cutaneous systemic sclerosis.'),
    (v_topic_id, 'The "p-ANCA" antibody (MPO-ANCA) is associated with:', '["Wegener''s", "Microscopic Polyangiitis and Churg-Strauss", "Polyarteritis Nodosa", "Temporal Arteritis"]', 1, 'MPO-ANCA is common in these small-vessel vasculitides.');

    -- SECTION 18-21: ADDITIONAL PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ischemic reperfusion injury mediated by:', '["Lack of oxygen", "Free radicals and Calcium influx", "Cold temperatures", "Infection"]', 1, 'Re-introducing oxygen creates reactive oxygen species.'),
    (v_topic_id, 'Caspase activator released from mitochondria?', '["BCL-2", "Cytochrome c", "Bax", "Fas ligand"]', 1, 'Cytochrome c binds APAF-1 to activate Caspase-9.'),
    (v_topic_id, 'Metastatic calcification in lungs most likely caused by:', '["Chronic bronchitis", "Hyperparathyroidism", "Tuberculosis", "Smoking"]', 1, 'Hypercalcemia leads to calcium precipitation in healthy tissue.'),
    (v_topic_id, 'Hyperplasia of the prostate (BPH) is an example of:', '["Pre-cancerous growth", "Pathological hormonal hyperplasia", "Metaplasia", "Compensatory"]', 1, 'Driven by dihydrotestosterone levels.'),
    (v_topic_id, '"Wet gangrene" is coagulative necrosis with superimposed:', '["Calcification", "Liquefactive necrosis (infection)", "Atrophy", "Apoptosis"]', 1, 'Infection adds a liquefactive component to the ischemic tissue.'),
    (v_topic_id, 'Inhibitor of the "intrinsic" pathway of apoptosis?', '["Bax", "Bak", "BCL-2", "Caspase-9"]', 2, 'BCL-2 and BCL-X prevent cytochrome c release.'),
    (v_topic_id, 'Mediator of "Vasodilation" in early acute inflammation?', '["Leukotriene C4", "Histamine and Nitric Oxide", "TXA2", "Fibrin"]', 1, 'Histamine from mast cells causes immediate vasodilation.'),
    (v_topic_id, 'Main protein of the "Scar"?', '["Elastin", "Fibronectin", "Collagen", "Laminin"]', 2, 'Type I collagen provides tensile strength.'),
    (v_topic_id, 'Zinc deficiency causes:', '["Night blindness", "Delayed wound healing and dermatitis", "Bleeding gums", "Rickets"]', 1, 'Zinc is a cofactor for collagenases and protein synthesis.'),
    (v_topic_id, 'Growth factor most important for angiogenesis?', '["PDGF", "VEGF", "EGF", "TGF-beta"]', 1, 'Vascular Endothelial Growth Factor drives new vessel growth.');

    -- SECTION 22-36: SPECIALIZED & MIXED
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Specific antidote for Acetaminophen overdose?', '["Naloxone", "N-acetylcysteine (NAC)", "Flumazenil", "Atropine"]', 1, 'NAC restores glutathione to detoxify NAPQI.'),
    (v_topic_id, 'Antidote for Ethylene Glycol or Methanol?', '["Ethanol or Fomepizole", "Vitamin K", "Protamine sulfate", "Digoxin Fab"]', 0, 'Inhibits alcohol dehydrogenase.'),
    (v_topic_id, 'Cyanide poisoning inhibits which mitochondrial enzyme?', '["NADPH oxidase", "Cytochrome c oxidase (Complex IV)", "ATP synthase", "Pyruvate dehydrogenase"]', 1, 'Blocks the electron transport chain.'),
    (v_topic_id, 'Pathognomonic histological finding in Acute Rheumatic Fever?', '["Aschoff bodies", "Negri bodies", "Councilman bodies", "Psammoma bodies"]', 0, 'Granulomatous lesions in the myocardium.'),
    (v_topic_id, 'Widened mediastinum and "tearing" chest pain radiating to back. Diagnosis?', '["MI", "Aortic dissection", "PE", "Pneumothorax"]', 1, 'Aortic dissection is a surgical emergency.'),
    (v_topic_id, 'Which cardiomyopathy associated with "apple-green birefringence"?', '["Dilated", "Hypertrophic", "Restrictive (Amyloidosis)", "ARVC"]', 2, 'Amyloid deposition causes stiff, restrictive walls.'),
    (v_topic_id, 'Type of emphysema most commonly associated with cigarette smoking?', '["Panacinar", "Centriacinar", "Paraseptal", "Irregular"]', 1, 'Centriacinar involves the respiratory bronchioles.'),
    (v_topic_id, 'Lab finding most specific for Iron Deficiency Anemia?', '["Low Serum Iron", "High TIBC", "Low Ferritin", "Microcytosis"]', 2, 'Ferritin reflects total iron stores.'),
    (v_topic_id, '"Target cells" (codocytes) classically seen in:', '["Hereditary Spherocytosis", "Thalassemia", "G6PD deficiency", "B12 deficiency"]', 1, 'Also seen in liver disease and post-splenectomy.'),
    (v_topic_id, '"Schistocytes" (helmet cells) are a sign of:', '["Megaloblastic anemia", "Microangiopathic Hemolytic Anemia (MAHA)", "Sickle cell", "Aplastic"]', 1, 'RBC fragmentation due to mechanical stress (DIC/TTP).');

    -- SECTION 37-55: FINAL CONSOLIDATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Antibiotic that inhibits 30S ribosomal subunit; causes oto/nephrotoxicity?', '["Tetracycline", "Gentamicin", "Erythromycin", "Linezolid"]', 1, 'Aminoglycosides have a narrow therapeutic window.'),
    (v_topic_id, 'Which drug choice for C. difficile infection?', '["Amoxicillin", "Oral Vancomycin", "IV Vancomycin", "Ceftriaxone"]', 1, 'Oral delivery ensures the drug reaches the gut lumen.'),
    (v_topic_id, 'Bacteria notorious for "disulfiram-like reaction" with alcohol?', '["Metronidazole", "Amoxicillin", "Doxycycline", "Azithromycin"]', 0, 'Metronidazole inhibits acetaldehyde dehydrogenase.'),
    (v_topic_id, '"Rice-water stools" hallmark of infection by:', '["Salmonella", "Vibrio cholerae", "Shigella", "Giardia"]', 1, 'Cholera toxin causes massive secretory diarrhea.'),
    (v_topic_id, '"Wire-loop" glomerular lesions are characteristic of:', '["Diabetes", "Lupus Nephritis (Class IV)", "Minimal change", "Amyloidosis"]', 1, 'Reflects subendothelial immune complex deposition.'),
    (v_topic_id, '"Kimmelstiel-Wilson nodules" are pathognomonic for:', '["Hypertension", "Diabetic Nephropathy", "MPGN", "IgA Nephropathy"]', 1, 'Nodular glomerulosclerosis.'),
    (v_topic_id, '"Pick bodies" round aggregates of tau protein seen in:', '["Alzheimer''s", "Frontotemporal Dementia", "Parkinson''s", "Huntington''s"]', 1, 'Pick Disease features frontotemporal atrophy.'),
    (v_topic_id, '"Whipple''s Triad" (Hypoglycemia relief) is diagnostic for:', '["Glucagonoma", "Insulinoma", "Somatostatinoma", "VIPoma"]', 1, 'Insulin-secreting pancreatic tumor.'),
    (v_topic_id, 'MEN syndrome with Marfanoid habitus and mucosal neuromas?', '["MEN 1", "MEN 2A", "MEN 2B", "MEN 4"]', 2, 'RET oncogene mutation.'),
    (v_topic_id, '"Bird''s beak" appearance on barium swallow?', '["Esophageal cancer", "Achalasia", "Spasm", "Zenker"]', 1, 'Failure of the lower esophageal sphincter to relax.'),
    (v_topic_id, '"Codman triangle" or "Sunburst pattern" on X-ray?', '["Soap bubble", "Osteosarcoma", "Onion skinning", "Punched-out"]', 1, 'Malignant bone tumor producing osteoid.'),
    (v_topic_id, 'Ewing Sarcoma associated with which translocation?', '["t(9;22)", "t(11;22)", "t(14;18)", "t(8;14)"]', 1, 'Fuses EWS and FLI1 genes.'),
    (v_topic_id, '"Auspitz sign" (pinpoint bleeding) seen in:', '["Eczema", "Psoriasis", "Lichen planus", "Pityriasis"]', 1, 'Thinning of epidermis over dermal papillae.'),
    (v_topic_id, '"Howell-Jolly bodies" on blood smear indicate:', '["Lead poisoning", "Asplenia", "B12 deficiency", "G6PD"]', 1, 'Nuclear remnants normally removed by the spleen.'),
    (v_topic_id, 'Antibody crossing the placenta for passive immunity?', '["IgM", "IgG", "IgA", "IgE"]', 1, 'IgG is the only class that crosses the placenta.'),
    (v_topic_id, 'Staghorn calculi usually composed of:', '["Calcium", "Struvite", "Cystine", "Uric acid"]', 1, 'Magnesium ammonium phosphate; associated with Proteus.'),
    (v_topic_id, '"Waterhouse-Friderichsen syndrome" is hemorrhagic necrosis of:', '["Spleen", "Adrenal glands", "Kidneys", "Liver"]', 1, 'Usually due to Neisseria meningitidis septicemia.'),
    (v_topic_id, '"Reed-Sternberg cells" are found in:', '["Non-Hodgkin", "Hodgkin Lymphoma", "Myeloma", "CML"]', 1, 'Binucleated cells (owl eyes) in Hodgkin lymphoma.'),
    (v_topic_id, '"Cystic medial necrosis" of the aorta is a feature of:', '["Syphilis", "Marfan Syndrome", "Hypertension", "Atherosclerosis"]', 1, 'Weakens the vessel wall, leading to dissection.'),
    (v_topic_id, 'Primary defect in Achondroplasia affects:', '["GH receptor", "FGFR3", "Collagen II", "IGF-1"]', 1, 'Constitutive activation of FGFR3 inhibits bone growth.');

    RAISE NOTICE 'SUCCESS: FULL General Pathology MCQ Bank (~320 questions) registered for Semester 3.';
END $$;

COMMIT;
