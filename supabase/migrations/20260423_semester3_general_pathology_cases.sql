-- Migration: Semester 3 - General Pathology Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Create/Ensure Topic "General Pathology" for Semester 3
    INSERT INTO topics (semester_id, title, slug, "order")
    VALUES (3, 'General Pathology', 'general-pathology', 10)
    ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3
    RETURNING id INTO v_topic_id;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15)
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Lung Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Cough and Hemoptysis', 'A 55-year-old smoker presents with chronic cough, weight loss, and hemoptysis.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Tuberculosis", "Lung carcinoma", "Bronchiectasis", "Pneumonia"]', 1, 'Smoker with weight loss and hemoptysis is classic for malignancy.'),
    (v_case_id, 'Most common histological type in smokers?', '["Adenocarcinoma", "Squamous cell carcinoma", "Small cell carcinoma", "Large cell carcinoma"]', 1, 'Squamous cell carcinoma is centrally located and linked to smoking.'),
    (v_case_id, 'Mechanism of hypercalcemia in this condition?', '["Bone metastasis", "PTHrP secretion", "Vitamin D excess", "Renal failure"]', 1, 'PTHrP is a classic paraneoplastic feature of Squamous cell carcinoma.');

    -- CASE 02: Iron Deficiency Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fatigue and Spoon Nails', 'A 30-year-old woman presents with fatigue, pallor, and spoon-shaped nails.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Aplastic anemia", "Iron deficiency anemia", "Hemolytic anemia", "Megaloblastic anemia"]', 1, 'Koilonychia (spoon nails) is pathognomonic for iron deficiency.'),
    (v_case_id, 'Lab finding?', '["Increased MCV", "Decreased ferritin", "Increased B12", "Increased reticulocytes"]', 1, 'Low ferritin reflects depleted iron stores.'),
    (v_case_id, 'Underlying mechanism?', '["Decreased production", "Increased destruction", "Blood loss", "Genetic defect"]', 2, 'Chronic blood loss (e.g., menstruation) is the #1 cause in this demographic.');

    -- CASE 03: Chronic Inflammation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Non-healing Diabetic Ulcer', 'A diabetic patient presents with non-healing foot ulcer.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Main pathological process?', '["Acute inflammation", "Chronic inflammation", "Granuloma formation", "Fibrosis"]', 1, 'Non-healing ulcers represent chronic inflammatory states.'),
    (v_case_id, 'Major contributing factor?', '["Hyperoxia", "Neuropathy", "Increased immunity", "Increased angiogenesis"]', 1, 'Diabetic neuropathy leads to unnoticed trauma and poor healing.'),
    (v_case_id, 'Key cellular component?', '["Neutrophils", "Macrophages", "Eosinophils", "Basophils"]', 1, 'Macrophages are the hallmark of chronic inflammation.');

    -- CASE 04: BPH
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Difficulty Urinating', 'A 65-year-old male has difficulty urinating and enlarged prostate.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Prostatitis", "Prostate cancer", "Benign prostatic hyperplasia", "Urethral stricture"]', 2, 'BPH is the most common cause of obstructive symptoms in older men.'),
    (v_case_id, 'Type of cellular adaptation?', '["Hyperplasia", "Hypertrophy", "Metaplasia", "Dysplasia"]', 0, 'BPH involves an increase in the number of glandular and stromal cells.'),
    (v_case_id, 'Hormonal driver?', '["Estrogen", "Testosterone", "DHT", "Progesterone"]', 2, 'Dihydrotestosterone (DHT) is the primary mediator of prostatic growth.');

    -- CASE 05: Acute Inflammation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Signs of Injury', 'A patient develops fever, redness, and swelling after injury.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Type of inflammation?', '["Chronic", "Acute", "Granulomatous", "Autoimmune"]', 1, 'Sudden onset redness/swelling indicates acute inflammation.'),
    (v_case_id, 'First cells to arrive?', '["Lymphocytes", "Macrophages", "Neutrophils", "Plasma cells"]', 2, 'Neutrophils are the first responders in acute inflammation.'),
    (v_case_id, 'Mediator of vasodilation?', '["Histamine", "Complement", "Antibodies", "Fibrin"]', 0, 'Histamine release causes rapid vasodilation and increased permeability.');

    -- CASE 06: Tuberculosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Caseating Granulomas', 'A patient presents with caseating granulomas in lungs.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Sarcoidosis", "Tuberculosis", "Pneumonia", "Asthma"]', 1, 'Caseating (cheesy) necrosis is characteristic of TB.'),
    (v_case_id, 'Key cell type?', '["Neutrophils", "Epithelioid macrophages", "RBCs", "Platelets"]', 1, 'Epithelioid macrophages and Langhans giant cells form granulomas.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV"]', 3, 'TB triggers a delayed-type (T-cell mediated) hypersensitivity.');

    -- CASE 07: Nephrotic Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Edema and Proteinuria', 'A patient has edema, proteinuria, and hypoalbuminemia.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely condition?', '["Nephritic syndrome", "Nephrotic syndrome", "UTI", "AKI"]', 1, 'The triad of massive proteinuria, hypoalbuminemia, and edema defines Nephrotic syndrome.'),
    (v_case_id, 'Mechanism of edema?', '["Increased hydrostatic pressure", "Decreased oncotic pressure", "Increased lymph flow", "Vasodilation"]', 1, 'Loss of albumin lowers plasma oncotic pressure, leading to fluid shift.'),
    (v_case_id, 'Protein lost?', '["Hemoglobin", "Albumin", "Globulin", "Fibrinogen"]', 1, 'Albumin is the smallest and most abundant protein lost in urine.');

    -- CASE 08: Liver Cirrhosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alcoholic Liver', 'A 40-year-old alcoholic presents with liver cirrhosis.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Key pathological feature?', '["Necrosis only", "Fibrosis and nodules", "Hyperplasia", "Atrophy"]', 1, 'Cirrhosis is defined by diffuse fibrosis and regenerative nodules.'),
    (v_case_id, 'Main cell causing fibrosis?', '["Kupffer cells", "Stellate cells", "Hepatocytes", "RBCs"]', 1, 'Activated stellate (Ito) cells are the primary source of collagen.'),
    (v_case_id, 'Complication?', '["Portal hypertension", "Hypotension", "Bradycardia", "Polycythemia"]', 0, 'Fibrosis increases vascular resistance leading to portal hypertension.');

    -- CASE 09: Myocardial Infarction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Cardiac Death', 'A patient develops sudden chest pain and dies.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely cause?', '["Stroke", "Myocardial infarction", "Pneumonia", "Asthma"]', 1, 'Sudden chest pain in adults is most commonly MI.'),
    (v_case_id, 'Type of necrosis?', '["Liquefactive", "Caseous", "Coagulative", "Fat"]', 2, 'MI results in coagulative necrosis (except in the brain).'),
    (v_case_id, 'Early marker?', '["CK-MB", "Troponin", "LDH", "AST"]', 1, 'Troponins (I and T) are the most sensitive and specific early markers.');

    -- CASE 10: Allergic Reaction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pediatric Anaphylaxis', 'A child presents with severe allergic reaction.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Allergies are Type I (Immediate) hypersensitivity.'),
    (v_case_id, 'Key mediator?', '["IgG", "IgM", "IgE", "IgA"]', 2, 'IgE binds to mast cells and triggers degranulation.'),
    (v_case_id, 'Main cell involved?', '["Neutrophil", "Mast cell", "RBC", "Platelet"]', 1, 'Mast cells release histamine upon cross-linking of IgE.');

    -- CASE 11: Malignancy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Abnormal Mitotic Figures', 'A patient has tumor with abnormal mitotic figures.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Feature of malignancy?', '["Encapsulation", "Differentiation", "Anaplasia", "Slow growth"]', 2, 'Anaplasia (lack of differentiation) and atypical mitoses indicate malignancy.'),
    (v_case_id, 'Ability to spread?', '["Hyperplasia", "Metastasis", "Hypertrophy", "Dysplasia"]', 1, 'Metastasis is the most definitive feature of malignancy.'),
    (v_case_id, 'Loss of control due to?', '["DNA repair", "Cell cycle dysregulation", "Apoptosis increase", "Immunity"]', 1, 'Oncogene activation and tumor suppressor loss lead to dysregulated cycle.');

    -- CASE 12: Septic Shock
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypotension and Infection', 'A patient with infection develops septic shock.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Type of shock?', '["Hypovolemic", "Cardiogenic", "Septic", "Neurogenic"]', 2, 'Shock secondary to systemic infection is septic shock.'),
    (v_case_id, 'Main mediator?', '["Cytokines", "RBCs", "Platelets", "Hemoglobin"]', 0, 'Pro-inflammatory cytokines (TNF, IL-1) drive the systemic response.'),
    (v_case_id, 'Blood pressure?', '["Increased", "Decreased", "Normal", "Fluctuating"]', 1, 'Shock is defined by inadequate perfusion and low BP.');

    -- CASE 13: Apoptosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Programmed Cell Death', 'A patient shows apoptosis in tissue biopsy.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Feature of apoptosis?', '["Cell swelling", "Membrane rupture", "Cell shrinkage", "Inflammation"]', 2, 'Apoptosis involves cell shrinkage and chromatin condensation.'),
    (v_case_id, 'Key enzyme?', '["Protease", "Caspase", "Lipase", "Amylase"]', 1, 'Caspases are the executioners of apoptosis.'),
    (v_case_id, 'Outcome?', '["Inflammation", "No inflammation", "Necrosis", "Fibrosis"]', 1, 'Apoptosis does not trigger an inflammatory response.');

    -- CASE 14: Asbestosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asbestos Exposure', 'A patient exposed to asbestos develops lung disease.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Type of disease?', '["Obstructive", "Restrictive", "Infectious", "Allergic"]', 1, 'Pneumoconioses (like asbestosis) cause restrictive lung disease.'),
    (v_case_id, 'Pathological change?', '["Fibrosis", "Hyperplasia", "Necrosis", "Edema"]', 0, 'Chronic asbestos exposure leads to interstitial fibrosis.'),
    (v_case_id, 'Risk increases for?', '["Tuberculosis", "Mesothelioma", "Asthma", "Pneumonia"]', 1, 'Asbestos is the only known risk factor for mesothelioma.');

    -- CASE 15: Type III Hypersensitivity
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Immune Complex Disease', 'A patient has fever, joint pain, and immune complex deposition.', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Immune complex deposition is Type III.'),
    (v_case_id, 'Mechanism?', '["IgE mediated", "Antibody against cells", "Immune complex deposition", "T-cell mediated"]', 2, 'Deposition of complexes in tissues/vessels causes damage.'),
    (v_case_id, 'Example disease?', '["Asthma", "SLE", "Diabetes", "TB"]', 1, 'SLE is a classic Type III hypersensitivity.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 1-15 - CNS, Necrosis, etc.)
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16: CNS Necrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stroke and Brain Death', 'A 65-year-old male with a history of poorly controlled hypertension presents with sudden onset weakness on the right side of his body. Imaging reveals a localized area of brain tissue death.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which pattern of necrosis is most likely to be seen in this patient''s brain tissue?', '["Coagulative necrosis", "Liquefactive necrosis", "Caseous necrosis", "Fat necrosis"]', 1, 'Brain ischemia leads to liquefactive necrosis.'),
    (v_case_id, 'What is the primary reason for this specific pattern of necrosis in the CNS?', '["Denaturation of structural proteins", "High lipid content and release of lysosomal enzymes", "Recruitment of granulomatous cells", "Saponification of fatty acids"]', 1, 'High lipid content and lack of structural matrix favor liquefaction.');

    -- CASE 17: Acute Pancreatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Epigastric Pain', 'A 45-year-old female experiences severe epigastric pain radiating to the back. Laboratory tests show significantly elevated serum amylase and lipase.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The chalky white deposits found on the omentum represent which process?', '["Fibrinoid necrosis", "Liquefactive necrosis", "Fat necrosis", "Apoptosis"]', 2, 'Pancreatic enzymes leak and digest peripancreatic fat.'),
    (v_case_id, 'The formation of these deposits involves the reaction of fatty acids with which ion?', '["Sodium", "Potassium", "Calcium", "Magnesium"]', 2, 'Calcium + Fatty Acids = Saponification (Soap formation).');

    -- CASE 18: Acute Inflammation (Neutrophils)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Purulent Forearm Swelling', 'A 24-year-old male presents with a large, fluctuant swelling on his forearm following a puncture wound. Red, warm, and painful with purulent exudate.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cell type is the primary component of this acute inflammatory infiltrate?', '["Lymphocytes", "Macrophages", "Neutrophils", "Plasma cells"]', 2, 'Pus consists primarily of dead neutrophils and debris.'),
    (v_case_id, 'Which molecule is primarily responsible for the "rolling" phase along the endothelium?', '["ICAM-1", "Selectins", "PECAM-1", "Integrins"]', 1, 'Selectins mediate weak, transient interactions (rolling).');

    -- CASE 19: Metaplasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smoker''s Cough and Biopsy', 'A 50-year-old chronic smoker presents with a persistent cough. Biopsy shows a shift from columnar ciliated cells to stratified squamous epithelium.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This cellular adaptation is known as:', '["Hyperplasia", "Hypertrophy", "Metaplasia", "Dysplasia"]', 2, 'Conversion of one adult cell type to another is metaplasia.'),
    (v_case_id, 'While reversible, what is the long-term risk if smoking continues?', '["Atrophy", "Malignant transformation", "Aplasia", "Physiological hypertrophy"]', 1, 'Chronic metaplasia can progress to dysplasia and then cancer.');

    -- CASE 20: Lipofuscin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wear-and-Tear Pigment', 'An 80-year-old female dies of natural causes. Autopsy heart shows myocardial cells with brownish-yellow granular pigment around nuclei.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this "wear-and-tear" pigment?', '["Hemosiderin", "Melanin", "Lipofuscin", "Bilirubin"]', 2, 'Lipofuscin is the hallmark of aging and cellular wear.'),
    (v_case_id, 'This pigment is a tell-tale sign of which cellular process?', '["Free radical injury and lipid peroxidation", "Iron overload", "Glycogen storage disease", "Acute viral infection"]', 0, 'Lipofuscin results from incomplete digestion of polyunsaturated lipids.');

    -- CASE 21: Pyogenic Granuloma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pregnancy Gingival Lump', 'A 28-year-old pregnant female notices a small, red, fast-growing lump on her gingiva. Highly vascularized with inflammatory cells.', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Squamous cell carcinoma", "Pyogenic granuloma", "Fibroma", "Hemangiopericytoma"]', 1, 'Pyogenic granulomas are common in pregnancy (hormonal influence).'),
    (v_case_id, 'This lesion is a classic example of which type of inflammation?', '["Chronic granulomatous inflammation", "Granulation tissue formation", "Serous inflammation", "Fibrinous inflammation"]', 1, 'It is effectively exuberant granulation tissue.');

    -- CASE 22: CGD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent Bacterial Infections', 'A 4-year-old boy presents with recurrent bacterial infections. Defect in NADPH oxidase preventing "respiratory burst."', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Chediak-Higashi syndrome", "Chronic Granulomatous Disease (CGD)", "Leukocyte Adhesion Deficiency", "Myeloperoxidase deficiency"]', 1, 'CGD results from NADPH oxidase deficiency.'),
    (v_case_id, 'Which organism is this patient particularly susceptible to?', '["Streptococcus pneumoniae", "Staphylococcus aureus (Catalase-positive)", "Mycoplasma pneumoniae", "Giardia lamblia"]', 1, 'Catalase-positive organisms neutralize their own H2O2, leaving neutrophils with no ROS.');

    -- CASE 23: Caseous Necrosis (TB)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'TB and Ghon Complex', 'A 60-year-old male with tuberculosis shows a "Ghon complex." Biopsy shows central soft, friable, "cheese-like" debris.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of necrosis is described?', '["Coagulative", "Caseous", "Gangrenous", "Fibrinoid"]', 1, 'Caseous necrosis is characteristic of TB.'),
    (v_case_id, 'What is the hallmark histological feature surrounding this area?', '["Neutrophilic abscess", "Granuloma with Langhans giant cells", "Fibrous scar tissue only", "Massive hemorrhage"]', 1, 'TB causes granulomatous inflammation.');

    -- CASE 24: Pulmonary Embolism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Saddle Embolus', 'A 55-year-old male with DVT suddenly develops chest pain and dies. Autopsy reveals a "Saddle Embolus."', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common source of this embolus?', '["Internal jugular vein", "Deep veins of the lower extremity", "Right atrium", "Hepatic vein"]', 1, 'Most PE arise from proximal DVT (Popliteal/Femoral/Iliac).'),
    (v_case_id, 'What are the microscopic lines of pale platelets/fibrin and dark RBCs found in the thrombus called?', '["Lines of Zahn", "Aschoff bodies", "Councilman bodies", "Negri bodies"]', 0, 'Lines of Zahn prove the thrombus formed before death (with blood flow).');

    -- CASE 25: Fibrinoid Necrosis (SLE)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'SLE Kidney Biopsy', 'A 35-year-old female with SLE undergoes a kidney biopsy. Small arteries show pink, amorphous "smudged" appearance.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This vascular appearance is characteristic of:', '["Caseous necrosis", "Fibrinoid necrosis", "Liquefactive necrosis", "Monckeberg medial sclerosis"]', 1, 'Fibrinoid necrosis is seen in vasculitis and malignant HTN.'),
    (v_case_id, 'This pattern is usually associated with which of the following?', '["Ischemic stroke", "Immune complex deposition (Type III hypersensitivity)", "Bacterial abscess", "Heavy smoking"]', 1, 'Immune complex deposition is the #1 cause of fibrinoid necrosis.');

    -- CASE 26: Leiomyoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Uterine Mass Biopsy', 'Biopsy of a uterine mass in a 45-year-old woman shows well-differentiated smooth muscle cells with low mitotic activity. Well-circumscribed.', 26)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the correct terminology for this benign tumor?', '["Leiomyosarcoma", "Leiomyoma", "Rhabdomyoma", "Adenoma"]', 1, 'Leiomyoma is a benign smooth muscle tumor.'),
    (v_case_id, 'Which feature most reliably distinguishes a malignant tumor from a benign one?', '["Rapid growth", "Large size", "Metastasis", "Presence of necrosis"]', 2, 'Metastasis is the absolute proof of malignancy.');

    -- CASE 27: Keloid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thick Raised Scar', 'An African American male develops a thick, raised, itchy scar that extends beyond the boundaries of his original surgical incision.', 27)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hypertrophic scar", "Keloid", "Fibroma", "Exuberant granulation"]', 1, 'Keloids extend beyond the original borders.'),
    (v_case_id, 'Which collagen type is predominantly found in excess in this lesion?', '["Type I and III", "Type IV", "Type VII", "Type X"]', 0, 'Keloids feature massive deposition of Type I and III collagen.');

    -- CASE 28: Osteosarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bone Mass Sunburst Pattern', 'A 19-year-old male presents with a "sunburst" pattern on X-ray of the distal femur and a Codman triangle.', 28)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Osteoid osteoma", "Osteosarcoma", "Ewing sarcoma", "Chondrosarcoma"]', 1, 'Sunburst and Codman triangle in a teen are classic for osteosarcoma.'),
    (v_case_id, 'The "Codman triangle" is formed by:', '["The tumor itself", "Reactive new bone under the displaced periosteum", "Calcified cartilage", "Hemorrhage into the muscle"]', 1, 'Periosteal elevation leads to new bone formation.');

    -- CASE 29: Apoptosis Execution
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cell Shrinkage and Blebbing', 'During a planned cell death process in embryogenesis, a cell shrinks, its chromatin condenses, and the membrane blebs without inflammation.', 29)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This process is known as:', '["Necrosis", "Apoptosis", "Autophagy", "Necroptosis"]', 1, 'This describes programmed cell death.'),
    (v_case_id, 'Which family of proteases is the "executioner" of this process?', '["Metalloproteinases", "Caspases", "Cathepsins", "Elastases"]', 1, 'Caspases are the primary mediators.');

    -- CASE 30: Squamous Cell Lung Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lung Mass and Keratin Pearls', 'A 65-year-old male with a history of smoking and weight loss presents with a mass in his lung. Histology shows "keratin pearls" and "intercellular bridges."', 30)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Small cell carcinoma", "Adenocarcinoma", "Squamous cell carcinoma", "Large cell carcinoma"]', 2, 'Keratin pearls are pathognomonic for squamous differentiation.'),
    (v_case_id, 'The presence of keratin pearls is an indicator of:', '["High-grade dysplasia", "Functional differentiation", "Anaplasia", "Metastatic potential"]', 1, 'Pearls represent the cell''s ability to produce keratin (differentiation).');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 16-30 - Hypersensitivity, Karyotypes, etc.)
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31: Anaphylaxis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bee Sting and Shock', 'A 12-year-old boy presents with severe swelling of the lips and eyelids after being stung by a bee. Wheezing, BP 80/40.', 31)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of hypersensitivity reaction is occurring?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Bee stings cause Type I immediate hypersensitivity.'),
    (v_case_id, 'Which antibody is primarily responsible?', '["IgG", "IgM", "IgA", "IgE"]', 3, 'IgE is the primary antibody in allergy.'),
    (v_case_id, 'Which mediator is the primary cause of vasodilation?', '["Interleukin-2", "Histamine", "Interferon-gamma", "Complement C5b-9"]', 1, 'Histamine release triggers rapid shock.');

    -- CASE 32: SLE
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Butterfly Rash and Joint Pain', 'A 30-year-old female with butterfly rash and joint pain. Positive ANA and anti-dsDNA.', 32)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rheumatoid Arthritis", "Systemic Lupus Erythematosus (SLE)", "Scleroderma", "Dermatomyositis"]', 1, 'Malar rash + positive anti-dsDNA = SLE.'),
    (v_case_id, 'The renal damage is caused by which mechanism?', '["Direct T-cell cytotoxicity", "Type III Hypersensitivity", "Type II Hypersensitivity", "Granulomatous inflammation"]', 1, 'Lupus nephritis is an immune-complex mediated disease.');

    -- CASE 33: Amyloidosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Congo Red Positive Rectal Biopsy', 'A 70-year-old male with rheumatoid arthritis. Rectal biopsy shows tissue that stains with Congo Red and exhibits apple-green birefringence.', 33)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Dystrophic calcification", "Amyloidosis", "Hyaline arteriolosclerosis", "Steatosis"]', 1, 'Apple-green birefringence is pathognomonic for amyloid.'),
    (v_case_id, 'In chronic inflammation, which precursor protein is responsible?', '["Transthyretin", "Serum Amyloid Associated (SAA)", "Immunoglobulin Light Chain (AL)", "Beta-amyloid"]', 1, 'SAA is the precursor in secondary (AA) amyloidosis.');

    -- CASE 34: Osteogenesis Imperfecta
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blue Sclerae and Fractures', 'A 2-year-old girl with frequent fractures from minor trauma, blue sclerae, and hearing loss.', 34)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Marfan Syndrome", "Ehlers-Danlos Syndrome", "Osteogenesis Imperfecta", "Achondroplasia"]', 2, 'The triad of fractures, blue sclerae, and hearing loss is classic.'),
    (v_case_id, 'This condition results from a defect in which protein?', '["Fibrillin-1", "Type I Collagen", "Type III Collagen", "Elastin"]', 1, 'OI is a defect in Type I collagen synthesis.');

    -- CASE 35: Steatosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alcoholic Fatty Liver', 'A 55-year-old male alcoholic presents with an enlarged, firm liver. Histology reveals clear vacuoles in hepatocytes.', 35)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This finding is characteristic of:', '["Hypertrophy", "Steatosis (Fatty change)", "Anthracosis", "Hemosiderosis"]', 1, 'Vacuoles represent lipid accumulation.'),
    (v_case_id, 'What is the most common mechanism in an alcoholic patient?', '["Increased mobilization", "Decreased oxidation", "Increased alpha-glycerophosphate", "All of the above"]', 3, 'Alcohol affects multiple points in lipid metabolism.');

    -- CASE 36: Down Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flat Face and Simian Crease', 'An infant born to a 42-year-old mother. Flat face, epicanthal folds, simian crease.', 36)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cytogenetic abnormality?', '["Trisomy 13", "Trisomy 18", "Trisomy 21", "45, XO"]', 2, 'This describes Down syndrome.'),
    (v_case_id, 'Increased risk of which malignancy later in life?', '["Osteosarcoma", "Acute Lymphoblastic Leukemia (ALL)", "Wilms Tumor", "Retinoblastoma"]', 1, 'Down syndrome patients have a 10-20x risk of ALL.');

    -- CASE 37: Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pleomorphic Glands in Colon', 'A 60-year-old male with persistent change in bowel habits. Sigmoid mass shows pleomorphic cells forming irregular glands.', 37)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The term "pleomorphism" refers to variation in:', '["Cell size and shape", "Number of organelles", "Speed of blood flow", "Response to antibiotics"]', 0, 'Pleomorphism means "many forms" in cell/nuclear size.'),
    (v_case_id, 'The formation of irregular glands classifies it as an:', '["Adenoma", "Adenocarcinoma", "Squamous cell carcinoma", "Sarcoma"]', 1, 'Glandular malignancy is adenocarcinoma.');

    -- CASE 38: Asbestosis and Mesothelioma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shipyard Worker with Ferruginous Bodies', 'A 45-year-old shipyard worker with progressive dyspnea. Ferruginous bodies (iron-coated fibers) found.', 38)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Silicosis", "Asbestosis", "Coal Worker''s Pneumoconiosis", "Sarcoidosis"]', 1, 'Ferruginous bodies are pathognomonic for asbestosis.'),
    (v_case_id, 'Highest risk for which specific malignancy?', '["Bronchogenic carcinoma", "Mesothelioma", "Small cell carcinoma", "Hamartoma"]', 1, 'Asbestos is the primary risk factor for mesothelioma.');

    -- CASE 39: Acute Osteomyelitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pediatric Bone Pain', 'A 10-year-old boy with high fever, localized bone pain, and elevated ESR. Culture grows S. aureus.', 39)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Ewing Sarcoma", "Acute Osteomyelitis", "Osteoid Osteoma", "Enchondroma"]', 1, 'Fever + localized pain + S. aureus = Osteomyelitis.'),
    (v_case_id, 'The necrotic bone that drops into the marrow cavity is called a:', '["Sequestrum", "Involucrum", "Cloaca", "Nidius"]', 0, 'Sequestrum is dead bone; Involucrum is new bone sheath.');

    -- CASE 40: Virchow''s Node
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Left Supraclavicular Node', 'A patient with advanced gastric cancer presents with an enlarged left supraclavicular lymph node.', 40)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This node is clinically referred to as:', '["Sister Mary Joseph node", "Virchow''s node", "Sentinel node", "Delphian node"]', 1, 'Virchow''s node is the first sign of abdominal malignancy.'),
    (v_case_id, 'What is the most common route of metastasis for carcinomas?', '["Hematogenous", "Lymphatic", "Seeding of body cavities", "Iatrogenic"]', 1, 'Carcinomas typically spread via lymphatics.');

    -- CASE 41: Curling Ulcer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematemesis After Severe Burns', 'A 25-year-old male with 40% burns develops massive hematemesis on day 3.', 41)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of the gastric bleeding?', '["Cushing ulcer", "Curling ulcer", "Dieulafoy lesion", "Mallory-Weiss tear"]', 1, 'Stress ulcers in burn patients are called Curling ulcers.'),
    (v_case_id, 'What is the underlying pathology?', '["Increased ICP", "Hypovolemia leading to mucosal ischemia", "Chronic H. pylori", "Excessive NSAID use"]', 1, 'Reduced blood flow to the mucosa leads to ulceration.');

    -- CASE 42: Breast Cancer (Peau d''orange)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Peau d''orange Breast Mass', 'A 65-year-old female with a hard breast lump fixed to the chest wall. peaud''orange skin changes.', 42)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The "peau d''orange" appearance is caused by:', '["Direct skin invasion", "Lymphatic obstruction and edema", "Cooper''s ligament traction", "Fat necrosis"]', 1, 'Dermal lymphatic obstruction causes skin thickening and pitting.'),
    (v_case_id, 'Which gene mutation is most strongly associated?', '["APC", "BRCA1", "RB1", "WT1"]', 1, 'BRCA1 is the leading hereditary breast cancer gene.');

    -- CASE 43: Cardiac Hypertrophy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thickened Left Ventricle', 'Autopsy shows the left ventricular wall thickness is 2.2 cm (normal < 1.5 cm). History of HTN.', 43)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This change is an example of:', '["Hyperplasia", "Hypertrophy", "Metaplasia", "Dysplasia"]', 1, 'Cardiac muscle cells cannot divide; they only grow in size.'),
    (v_case_id, 'What is the primary stimulus at the molecular level?', '["Increased DNA synthesis", "Increased protein synthesis and assembly of myofilaments", "Recruitment of stem cells", "Decreased apoptosis"]', 1, 'Hypertrophy involves increased production of structural proteins.');

    -- CASE 44: NF1
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cafe-au-lait Spots and Fleshy Tumors', 'A 30-year-old male with multiple cafe-au-lait spots, axillary freckling, and soft skin tumors.', 44)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Neurofibromatosis Type 1 (NF1)", "Tuberous Sclerosis", "Von Hippel-Lindau", "Li-Fraumeni Syndrome"]', 0, 'This classic triad defines NF1.'),
    (v_case_id, 'The NF1 gene product (neurofibromin) functions as a:', '["DNA repair protein", "Tumor suppressor (GAP for RAS)", "Growth factor receptor", "Transcriptional activator"]', 1, 'Neurofibromin inhibits RAS activity.');

    -- CASE 45: Turner Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Webbed Neck and Broad Chest', 'A 15-year-old girl with primary amenorrhea, short stature, webbed neck, and broad "shield" chest.', 45)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely karyotype?', '["47, XXY", "45, X", "47, XXX", "47, XYY"]', 1, '45, X is pathognomonic for Turner syndrome.'),
    (v_case_id, 'Which cardiac abnormality is commonly associated?', '["Mitral valve prolapse", "Bicuspid aortic valve / Coarctation", "Ventricular septal defect", "Tetralogy of Fallot"]', 1, 'Bicuspid aortic valve and coarctation are hallmarks.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 31-45 - Nutmeg Liver, Burkitt, etc.)
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46: Nutmeg Liver
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nutmeg Liver and COPD', 'A 62-year-old male smoker with COPD. Tender liver, jugular venous distention, leg swelling.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The liver findings are described macroscopically as:', '["Sago spleen", "Nutmeg liver", "Bread and butter liver", "Lardaceous liver"]', 1, 'The mottled appearance of congestion/necrosis looks like nutmeg.'),
    (v_case_id, 'Which zone is most susceptible to centrilobular necrosis?', '["Zone 1", "Zone 2", "Zone 3", "All zones"]', 2, 'Zone 3 is furthest from arterial supply and first to suffer in congestion.'),
    (v_case_id, 'Primary hemodynamic mechanism of edema?', '["Decreased oncotic", "Increased hydrostatic", "Lymphatic obstruction", "Increased permeability"]', 1, 'Right heart failure increases venous pressure (hydrostatic).');

    -- CASE 47: Esophageal Varices
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alcoholic Hematemesis', 'A 50-year-old male alcoholic with cirrhosis. Vomiting of bright red blood.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The most likely source of the bleeding is:', '["Esophageal varices", "Mallory-Weiss tear", "Gastric adenocarcinoma", "Peptic ulcer disease"]', 0, 'Portal HTN leads to variceal formation and rupture.'),
    (v_case_id, 'Conversion of smooth liver to nodular surface is due to activation of:', '["Hepatocytes", "Kupffer cells", "Stellate (Ito) cells", "Endothelial cells"]', 2, 'Stellate cells are the "myofibroblasts" of the liver.');

    -- CASE 48: Burkitt Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Starry Sky Jaw Mass', 'A 6-year-old child with a rapidly growing mass in jaw. Biopsy shows "starry sky" appearance.', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hodgkin lymphoma", "Burkitt lymphoma", "Follicular lymphoma", "Marginal zone lymphoma"]', 1, 'Rapid growth + Starry Sky = Burkitt.'),
    (v_case_id, 'Strongly associated with translocation of which oncogene?', '["BCL-2", "c-MYC", "Cyclin D1", "ABL"]', 1, 't(8;14) involving c-myc is the hallmark.'),
    (v_case_id, 'Which virus is frequently associated with the African form?', '["HPV", "EBV", "HIV", "HTLV-1"]', 1, 'EBV is nearly 100% associated with endemic Burkitt.');

    -- CASE 49: Sjogren Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dry Eyes and Dry Mouth', 'A 48-year-old female with dry eyes and dry mouth. Minor salivary gland biopsy shows lymphocytic infiltration.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sarcoidosis", "Sjögren Syndrome", "Mikulicz syndrome", "Amyloidosis"]', 1, 'Keratoconjunctivitis sicca and xerostomia define Sjögren.'),
    (v_case_id, 'Increased risk for which complication?', '["Squamous cell carcinoma", "B-cell MALT lymphoma", "Salivary gland stone", "Systemic sclerosis"]', 1, 'Chronic lymphocytic stimulation leads to MALToma.');

    -- CASE 50: Fat Embolism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Confused After Bone Fractures', 'A 22-year-old male with multiple fractures after MVA. 12h later becomes confused, develops dyspnea and petechial rash.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Air embolism", "Fat embolism syndrome", "Amniotic fluid embolism", "Septic shock"]', 1, 'Long bone fractures release marrow fat into circulation.'),
    (v_case_id, 'The petechial rash is primarily caused by:', '["Thrombocytopenia and fat globule occlusion", "Bacterial toxins", "Vitamin C deficiency", "IgE-mediated reaction"]', 0, 'Fat globules cause microvascular occlusion.');

    -- CASE 51: RCC
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematuria and Clear Cell Mass', 'A 55-year-old male with persistent hematuria. CT shows mass in right kidney. Histology shows clear cytoplasm.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Wilms tumor", "Renal cell carcinoma (Clear cell)", "Transitional cell carcinoma", "Oncocytoma"]', 1, 'Clear cell RCC is the most common kidney cancer.'),
    (v_case_id, 'Majority of sporadic cases involve mutation of which gene?', '["VHL", "WT1", "RB1", "TP53"]', 0, 'VHL loss (3p) is the key driver.');

    -- CASE 52: Chaperones
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cellular Stress and Misfolded Proteins', 'Protein that binds to misfolded proteins and attempts to refold them.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These proteins are known as:', '["Caspases", "Chaperones (HSP)", "Selectins", "Integrins"]', 1, 'HSPs (like HSP70) help fold proteins.'),
    (v_case_id, 'If cannot be refolded, it is tagged with which molecule for destruction?', '["Glutathione", "Ubiquitin", "Ferritin", "Myoglobin"]', 1, 'Ubiquitination targets proteins to the proteasome.');

    -- CASE 53: Fibroadenoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rubbery Breast Lump', 'A 25-year-old female with a painless, mobile, "rubbery" breast lump.', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Fibrocystic change", "Fibroadenoma", "Phyllodes tumor", "Intraductal papilloma"]', 1, 'Most common benign breast tumor in young women.'),
    (v_case_id, 'Which feature differentiates this from a Phyllodes tumor?', '["Lack of leaf-like architecture", "Presence of necrosis", "Younger age", "Absence of glands"]', 0, 'Phyllodes has high stromal cellularity and "leaf-like" appearance.');

    -- CASE 54: Buerger Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smoker with Gangrenous Toes', 'A 35-year-old male heavy smoker with gangrene of toes. Angiography shows "corkscrew" collaterals.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Polyarteritis nodosa", "Wegener granulomatosis", "Buerger disease", "Temporal arteritis"]', 2, 'Thromboangiitis obliterans is strongly linked to smoking.'),
    (v_case_id, 'Most effective initial treatment?', '["Corticosteroids", "Cyclophosphamide", "Smoking cessation", "Anticoagulation"]', 2, 'Smoking cessation is the ONLY effective treatment.');

    -- CASE 55: Horseshoe Kidney
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fused Lower Poles', 'Autopsy reveals a "horseshoe kidney" in a victim of a car accident.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This anomaly is caused by the fusion of which poles?', '["Upper poles", "Lower poles", "Medial borders", "Entire kidneys fused"]', 1, 'Lower poles fuse in the midline.'),
    (v_case_id, 'Ascent is restricted by which artery?', '["Celiac trunk", "SMA", "IMA", "Common iliac"]', 2, 'The Inferior Mesenteric Artery traps the kidney.');

    -- CASE 56: Barrett Esophagus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Reflux and Epithelial Shift', 'A 60-year-old male with chronic reflux. Transition from squamous to columnar epithelium found.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Achalasia", "Barrett Esophagus", "Mallory-Weiss", "Esophageal web"]', 1, 'Intestinal metaplasia in the esophagus.'),
    (v_case_id, 'Presence of which specific cell type is required for diagnosis?', '["Squamous cells", "Parietal cells", "Goblet cells", "Chief cells"]', 2, 'Goblet cells prove intestinal metaplasia.');

    -- CASE 57: Acute Rheumatic Fever
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Aschoff Bodies in Heart Valve', 'Biopsy of heart valve shows "Aschoff bodies" and "Anitschkow cells" following a sore throat.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Infective endocarditis", "Acute Rheumatic Fever", "Libman-Sacks", "NBTE"]', 1, 'Aschoff bodies are pathognomonic for ARF.'),
    (v_case_id, 'Complication of infection by which organism?', '["Staph aureus", "Group A Strep", "Viridans strep", "Coxsackie B"]', 1, 'GAS (S. pyogenes) antigens cross-react with heart tissue.');

    -- CASE 58: Kaposi Sarcoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Purple Plaques in AIDS', 'A 40-year-old male with AIDS presents with purple-red raised skin plaques.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Bacillary angiomatosis", "Kaposi Sarcoma", "Hemangioma", "Angiosarcoma"]', 1, 'Spindle cells + RBC slits in AIDS = KS.'),
    (v_case_id, 'Malignancy is caused by infection with which virus?', '["HHV-6", "HHV-8", "CMV", "EBV"]', 1, 'Human Herpesvirus 8 is the causative agent.');

    -- CASE 59: Wilms Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pediatric Abdominal Mass', 'A 4-year-old boy with a massive abdominal mass and hematuria. Histology shows blastemal and stromal elements.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Neuroblastoma", "Wilms tumor", "Hepatoblastoma", "Teratoma"]', 1, 'Triphasic morphology is classic for nephroblastoma.'),
    (v_case_id, 'WAGR syndrome includes Wilms, Aniridia, GU anomalies, and:', '["Retinal detachment", "Range of motion", "Retardation", "Renal stones"]', 2, 'Intellectual disability (R) is the final piece of WAGR.');

    -- CASE 60: Leukocytoclastic Vasculitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Small Vessel Vasculitis After Drug', 'Patient develops vasculitis after new drug. Biopsy shows fragmented neutrophilic nuclei (leukocytoclasis).', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This condition is known as:', '["Churg-Strauss", "Microscopic polyangiitis", "Leukocytoclastic vasculitis", "Kawasaki"]', 2, 'Hypersensitivity vasculitis.'),
    (v_case_id, 'This is an example of which hypersensitivity reaction?', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Immune-complex mediated small vessel damage.');

    RAISE NOTICE 'SUCCESS: General Pathology (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
