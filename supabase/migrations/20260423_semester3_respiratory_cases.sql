-- Migration: Semester 3 - Respiratory Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

-- 1. Create/Ensure Topic "Respiratory" for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'Respiratory', 'respiratory', 60)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'respiratory' LIMIT 1;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15) - Obstructive, Restrictive & Cancer Basics
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Emphysema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Barrel Chest and Pursed-lip Breathing', 'A 65-year-old with a 50-pack-year smoking history presents with progressive dyspnea and a "barrel chest."', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Chronic bronchitis", "Emphysema", "Bronchiectasis", "Sarcoidosis"]', 1, 'Barrel chest and pursed-lip breathing are hallmarks of emphysema.'),
    (v_case_id, 'Pathogenesis involves an imbalance between which two types of molecules?', '["Th1/Th2", "Proteases/Anti-proteases", "Oxidants/Antioxidants", "Histamine/Leukotrienes"]', 1, 'Elastase (protease) destroys the alveolar walls while alpha-1-antitrypsin (anti-protease) normally protects them.'),
    (v_case_id, 'If this patient had liver cirrhosis at a young age, which specific pattern is expected?', '["Centriacinar", "Panacinar", "Paraseptal", "Irregular"]', 1, 'Panacinar emphysema is characteristic of alpha-1-antitrypsin deficiency; centriacinar is seen in smokers.');

    -- CASE 02: Chronic Bronchitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Productive Cough and Reid Index', 'A 45-year-old female smoker with a productive cough for 3 months each year for the past 2 years.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Asthma", "Chronic bronchitis", "Emphysema", "Pneumonia"]', 1, 'Chronic bronchitis is defined clinically by a persistent productive cough.'),
    (v_case_id, 'What is the normal Reid Index?', '["< 0.4", "> 0.5", "Exactly 1.0", "0.7"]', 0, 'A normal Reid Index is less than 0.4; an index > 0.5 is diagnostic for chronic bronchitis.');

    -- CASE 03: Asthma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wheezing and Charcot-Leyden Crystals', 'A 12-year-old boy with severe wheezing and a history of atopy.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Charcot-Leyden crystals are derived from the breakdown of which cell type?', '["Neutrophils", "Eosinophils", "Mast cells", "Macrophages"]', 1, 'These crystals are formed from eosinophil membrane proteins (Galectin-10).'),
    (v_case_id, 'Whorled mucous plugs in asthmatic sputum are called:', '["Ferruginous bodies", "Curschmann spirals", "Negri bodies", "Councilman bodies"]', 1, 'Curschmann spirals represent mucus plugs from small airways.');

    -- CASE 04: Bronchiectasis & Kartagener
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Foul-smelling Sputum and Situs Inversus', 'A 55-year-old with persistent foul-smelling sputum and a history of childhood infections and Kartagener syndrome.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lobar pneumonia", "Bronchiectasis", "Lung abscess", "Silicosis"]', 1, 'Bronchiectasis is the permanent dilation of bronchi due to chronic inflammation.'),
    (v_case_id, 'Kartagener syndrome triad includes bronchiectasis, sinusitis, and:', '["Nasal polyps", "Situs inversus", "Infertility", "Both B and C"]', 3, 'Primary ciliary dyskinesia causes the triad of situs inversus, sinusitis, and bronchiectasis, plus infertility due to immotile sperm/cilia.');

    -- CASE 05: Sarcoidosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bilateral Hilar Lymphadenopathy', 'A 40-year-old African American female with dry cough, blurred vision, and hilar lymphadenopathy on X-ray. Elevated ACE and Calcium.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tuberculosis", "Sarcoidosis", "Berylliosis", "Lung cancer"]', 1, 'Sarcoidosis classically presents in young black women with hilar lymphadenopathy.'),
    (v_case_id, 'A biopsy of the lymph node would most likely show:', '["Caseating granulomas", "Non-caseating granulomas/Schaumann bodies", "Small cell", "Charcot-Leyden"]', 1, 'Non-caseating granulomas are the hallmark; Asteroid bodies and Schaumann bodies are often present.');

    -- CASE 06: Silicosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Eggshell Calcification and Sandblasting', 'A retired sandblaster with upper lobe nodules and "eggshell calcification" of hilar nodes.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Asbestosis", "Silicosis", "CWP", "Anthracosis"]', 1, 'Silicosis typically involves the upper lobes and shows eggshell calcifications.'),
    (v_case_id, 'This patient is at increased risk for which infection?', '["Pseudomonas", "Tuberculosis", "Aspergillus", "CMV"]', 1, 'Silica impairs macrophage function (phagolysosome formation), increasing TB susceptibility.');

    -- CASE 07: Pulmonary Embolism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pleuritic Pain and S1Q3T3', 'A 50-year-old male with sudden pleuritic pain 3 days after orthopedic surgery. Tender calf.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MI", "Pulmonary embolism", "Pneumothorax", "Dissection"]', 1, 'PE is a common post-operative complication from DVT.'),
    (v_case_id, 'Classic (rare) ECG finding?', '["ST elevation", "S1Q3T3 pattern", "Delta wave", "Prolonged PR"]', 1, 'S1Q3T3 represents acute right heart strain, though tachycardia is more common.');

    -- CASE 08: Pancoast Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ptosis, Miosis, and Apical Mass', 'A heavy smoker with a persistent cough and new onset of right-sided ptosis and miosis.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Tumor suggests a location in which region?', '["Hilar", "Apex of lung (Pancoast)", "Pleura", "Mediastinum"]', 1, 'Pancoast tumors occur at the lung apex and compress local structures.'),
    (v_case_id, 'Horner syndrome results from tumor involving which structure?', '["Recurrent laryngeal", "Phrenic", "Cervical sympathetic chain", "Vagus"]', 2, 'Compression of the sympathetic chain/stellate ganglion leads to the Horner triad.');

    -- CASE 09: Squamous Cell Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypercalcemia and Keratin Pearls', 'A 70-year-old smoker with central lung mass and Serum Calcium 13.5 mg/dL.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which type of lung cancer is most likely?', '["Adenocarcinoma", "Small cell", "Squamous cell carcinoma", "Large cell"]', 2, 'Squamous cell carcinoma often produces PTHrP, leading to hypercalcemia.'),
    (v_case_id, 'Histology of this tumor would classically show:', '["Keratin pearls", "Glands/Mucin", "Oat-like cells", "Giant pleomorphic cells"]', 0, 'Keratin pearls and intercellular bridges (desmosomes) are characteristic.');

    -- CASE 10: ARDS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diffuse White-out and Hyaline Membranes', 'A 55-year-old with bilateral "white-out" 24 hours after massive trauma. Normal PCWP.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CHF", "ARDS", "Lobar pneumonia", "PE"]', 1, 'Acute Respiratory Distress Syndrome involves non-cardiogenic pulmonary edema.'),
    (v_case_id, 'Histological hallmark of the acute phase?', '["Fibrosis", "Hyaline membranes", "Purulent exudate", "Caseous necrosis"]', 1, 'Hyaline membranes line the alveoli, preventing gas exchange.');

    -- CASE 11: Lobar Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rusty Sputum and Gray Hepatization', 'A 30-year-old with high fever, chills, and "rusty" sputum. Dullness to percussion in RLL.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Klebsiella", "Streptococcus pneumoniae", "Mycoplasma", "Legionella"]', 1, 'S. pneumoniae is the leading cause of lobar pneumonia.'),
    (v_case_id, '"Gray hepatization" stage is characterized by:', '["Congestion", "Neutrophilic/Fibrin exudate", "Macrophage dominance", "Air-filled alveoli"]', 1, 'Gray hepatization involves fibrin and leukocytes; Red involves RBCs/fibrin.');

    -- CASE 12: Asbestosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ferruginous Bodies and Shipyard Worker', 'A shipyard worker with progressive dyspnea and golden-brown, rod-like structures on biopsy.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These structures are known as:', '["Aschoff", "Ferruginous bodies", "Schaumann", "Russell"]', 1, 'Ferruginous (asbestos) bodies are fibers coated with iron and protein.'),
    (v_case_id, 'MOST common malignancy associated with this exposure?', '["Adenocarcinoma", "Bronchogenic carcinoma", "Squamous cell", "Small cell"]', 1, 'Bronchogenic carcinoma is more common than mesothelioma in asbestos exposure.');

    -- CASE 13: Spontaneous Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subpleural Bleb and Tall, Thin Male', 'A 20-year-old tall, thin male with sudden sharp chest pain while resting. Breath sounds absent on one side.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tension", "Spontaneous pneumothorax", "PE", "Pleural effusion"]', 1, 'Primary spontaneous pneumothorax often occurs in young, tall males.'),
    (v_case_id, 'This condition is often caused by rupture of:', '["Plaque", "Subpleural bleb", "Esophagus", "Pulm artery"]', 1, 'Rupture of small air-filled sacs (blebs) at the apex.');

    -- CASE 14: Cannonball Metastases
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cannonball Nodules', 'A 40-year-old with multiple well-circumscribed nodules in both lungs on X-ray.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This radiological finding is highly suggestive of:', '["Primary cancer", "Miliary TB", "Hematogenous metastatic disease", "Sarcoidosis"]', 2, 'Multiple discrete nodules are a classic sign of lung metastases.'),
    (v_case_id, 'Most likely primary source?', '["RCC or Colorectal", "Brain", "Skin", "Gastritis"]', 0, 'Renal cell carcinoma and colon cancer are common origins for lung metastases.');

    -- CASE 15: Small Cell Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'SIADH and Oat-like Cells', 'A smoker with a central mass and hyponatremia.', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This paraneoplastic syndrome is known as:', '["Cushing", "SIADH", "Lambert-Eaton", "Hypercalcemia"]', 1, 'Small cell lung cancer often produces ADH, leading to hyponatremia.'),
    (v_case_id, 'True regarding Small Cell Lung Carcinoma?', '["Peripheral", "Smoking/Neuroendocrine", "Surgical", "Keratin"]', 1, 'Small cell (Oat cell) is highly aggressive, central, and usually metastatic at diagnosis.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 16-30) - Complications & Pediatric Pulm
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16: Cushing Syndrome (SCLC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ectopic ACTH and Moon Face', 'A smoker with weight loss and a "moon face" physical appearance.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which paraneoplastic syndrome is likely?', '["SIADH", "Ectopic ACTH", "Lambert-Eaton", "Hypercalcemia"]', 1, 'Ectopic production of ACTH leads to Cushingoid features.'),
    (v_case_id, 'Which lung malignancy is notoriously associated?', '["Adenocarcinoma", "Squamous cell", "Small cell", "Mesothelioma"]', 2, 'SCLC is a neuroendocrine tumor that can secrete multiple hormones.');

    -- CASE 17: Exudative Pleural Effusion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stony Dullness and High Protein', 'Thoracentesis reveals fluid with protein > 3 g/dL and high LDH.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This pleural fluid is best classified as:', '["Transudate", "Exudate", "Chylothorax", "Hemothorax"]', 1, 'Exudates have high protein/LDH due to inflammation/cancer.'),
    (v_case_id, 'Common cause of exudative effusion?', '["CHF", "Cirrhosis", "Pneumonia or Malignancy", "Nephrotic"]', 2, 'Pneumonia (parapneumonic) and cancer are common exudate causes.');

    -- CASE 18: IRDS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Prematurity and Ground-glass Lungs', 'A neonate born at 28 weeks develops severe distress. X-ray shows ground-glass appearance.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary deficiency?', '["Alpha-1", "Surfactant", "Chloride", "Collagen"]', 1, 'Infant Respiratory Distress Syndrome is caused by surfactant deficiency.'),
    (v_case_id, 'Surfactant is produced by which cells?', '["Type I", "Type II pneumocytes", "Clara", "Goblet"]', 1, 'Type II pneumocytes mature late in gestation.');

    -- CASE 19: Mesothelioma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Calretinin and Pleural Rind', 'Thick "rind-like" mass encasing the lung in an insulation worker.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bronchogenic", "Mesothelioma", "Infarct", "Pleurisy"]', 1, 'Mesothelioma is a primary pleural tumor linked to asbestos.'),
    (v_case_id, 'Calretinin positivity is a marker for:', '["Adeno", "Mesothelioma", "Small cell", "Squamous"]', 1, 'Immunohistochemistry for Calretinin and WT1 helps diagnose mesothelioma.');

    -- CASE 20: Cystic Fibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pseudomonas and Chloride Channels', 'A 19-year-old with CF develops green, foul-smelling sputum.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most common organism in adult CF infections?', '["Staph aureus", "Pseudomonas aeruginosa", "Burkholderia", "Haemophilus"]', 1, 'Pseudomonas becomes the dominant colonizer in older CF patients.'),
    (v_case_id, 'Underlying defect involves a protein functioning as a:', '["Sodium", "ATP-gated Chloride channel", "Glucose", "Calcium"]', 1, 'The CFTR protein is a cAMP-regulated chloride channel.');

    -- CASE 21: Goodpasture Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and Hematuria', 'A 28-year-old with linear IgG deposits on the glomerular basement membrane.', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Wegener''s", "Goodpasture Syndrome", "SLE", "Sarcoidosis"]', 1, 'Goodpasture affects both the lung and kidney (anti-GBM disease).'),
    (v_case_id, 'Antibodies are directed against which specific target?', '["Alpha-3 Type IV collagen", "MPO", "PR3", "dsDNA"]', 0, 'Autoantibodies target the non-collagenous domain of the alpha-3 chain of Type IV collagen.');

    -- CASE 22: Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Non-smoker Peripheral Mass', 'A 60-year-old female non-smoker with a peripheral lung mass.', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Common type of lung cancer in non-smokers and females?', '["Squamous", "Adenocarcinoma", "Small cell", "Large cell"]', 1, 'Adenocarcinoma is the #1 lung cancer in non-smokers.'),
    (v_case_id, 'Histological examination would show:', '["Glands/Mucin", "Keratin pearls", "Small blue cells", "Neuroendocrine"]', 0, 'Gland formation and TTF-1 positivity are typical.');

    -- CASE 23: Legionella
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fountain Exposure and Hyponatremia', 'A convention attendee with fever, confusion, and diarrhea. Non-productive cough.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Mycoplasma", "Legionella pneumophila", "Strep pneu", "Chlamydophila"]', 1, 'Legionnaires'' disease often involves multi-organ symptoms.'),
    (v_case_id, 'Classic laboratory finding?', '["Hyperkalemia", "Hyponatremia", "Hypocalcemia", "Leukopenia"]', 1, 'Hyponatremia is a characteristic lab abnormality in Legionella pneumonia.');

    -- CASE 24: Pleuritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Inspiratory Pain and Friction Rub', 'Sharp chest pain increasing with inspiration. Scratchy sound on auscultation.', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pleuritis", "Pneumothorax", "PE", "MI"]', 0, 'Pleurisy is inflammation of the pleura.'),
    (v_case_id, 'The "scratchy" sound is known as:', '["Pleural friction rub", "S3 gallop", "Wheeze", "Stridor"]', 0, 'The rub occurs as the inflamed layers slide past each other.');

    -- CASE 25: Croup (Pediatric)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Barking Cough and Parainfluenza', 'A 4-year-old with a "barking" cough and inspiratory stridor.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Epiglottitis", "Croup", "Bronchiolitis", "Asthma"]', 1, 'Laryngotracheobronchitis.'),
    (v_case_id, 'Most common causative agent?', '["Hib", "Parainfluenza virus", "RSV", "Diphtheria"]', 1, 'Parainfluenza type 1 is the most common cause.');

    -- CASE 26: IPF
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Honeycomb Lung and UIP', 'A 60-year-old with progressive dyspnea. CT shows "honeycomb" appearance.', 26)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["IPF", "Sarcoidosis", "Hypersensitivity", "DIP"]', 0, 'Idiopathic Pulmonary Fibrosis is a chronic, progressive fibrosing interstitial pneumonia.'),
    (v_case_id, 'Histological pattern associated with this condition?', '["NSIP", "Usual interstitial pneumonia (UIP)", "Organizing", "Diffuse alveolar"]', 1, 'UIP is the histological pattern seen in IPF.');

    -- CASE 27: Klebsiella Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Currant Jelly Sputum and Alcoholism', 'An alcoholic with high fever and "currant jelly" sputum.', 27)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative organism?', '["Strep pneu", "Klebsiella pneumoniae", "Pseudomonas", "Legionella"]', 1, 'Klebsiella is common in alcoholics and chronic lung disease.'),
    (v_case_id, 'This organism is a Gram-negative rod that is:', '["Motile/Lactose", "Non-motile/Lactose", "Non-motile/Non-lactose", "Oxidase+"]', 1, 'Klebsiella is a non-motile, mucoid, lactose fermenter.');

    -- CASE 28: Pulmonary Hypertension
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'BMPR2 and Loud P2', 'A 30-year-old female with loud P2 and signs of right heart failure.', 28)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Left failure", "Primary Pulmonary HTN", "Mitral stenosis", "VSD"]', 1, 'Primary pulmonary hypertension occurs in young females.'),
    (v_case_id, 'Mutations in which gene are associated with familial form?', '["CFTR", "BMPR2", "TGF-beta", "Alpha-1"]', 1, 'BMPR2 mutation leads to proliferation of vascular smooth muscle.');

    -- CASE 29: Post-viral Staph Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Staph aureus and Lung Abscess', 'A patient with a history of viral influenza now has fever and cocci in clusters.', 29)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which pneumonia is most likely following viral influenza?', '["Strep pneu", "Staphylococcus aureus", "Hib", "Moraxella"]', 1, 'S. aureus is a classic "secondary" bacterial pneumonia after the flu.'),
    (v_case_id, 'Which complication is more common with S. aureus?', '["Abscess/Empyema", "Granuloma", "Hyaline", "Pulm HTN"]', 0, 'S. aureus is necrotizing and frequently forms cavities.');

    -- CASE 30: Reactivation TB
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Apical Cavity and Caseous Necrosis', 'Fever, weight loss, and night sweats. X-ray shows apical cavity.', 30)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sarcoidosis", "Secondary (Reactivation) TB", "Primary TB", "Lung abscess"]', 1, 'Reactivation TB targets the oxygen-rich lung apices.'),
    (v_case_id, 'Type of necrosis classically found in granulomas?', '["Coagulative", "Caseous", "Liquefactive", "Fibrinoid"]', 1, 'Caseous ("cheese-like") necrosis is typical of TB.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 31-45) - Pneumothorax, Churg-Strauss & Rarities
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31: Tension Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tracheal Deviation and Tension', 'Sharp pleuritic pain and dyspnea. Decreased breath sounds and hyperresonance on one side.', 31)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Effusion", "Spontaneous pneumothorax", "Lobar pneumonia", "PE"]', 1, 'Simple pneumothorax; if hypotensive, it becomes tension.'),
    (v_case_id, 'Critical finding distinguishing "Tension" from simple?', '["Absence of sounds", "Tracheal deviation away", "Hypotension/JVD", "Both B and C"]', 3, 'Tension pneumothorax is a clinical diagnosis based on shock and mediastinal shift.');

    -- CASE 32: Churg-Strauss (EGPA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asthma, Eosinophilia, and p-ANCA', 'A 50-year-old with asthma and chronic sinusitis has new rash, numbness, and peripheral eosinophilia.', 32)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Wegener''s", "Churg-Strauss (EGPA)", "Goodpasture", "Sarcoidosis"]', 1, 'Eosinophilic granulomatosis with polyangiitis (EGPA) triad: Asthma, Eosinophilia, Vasculitis.'),
    (v_case_id, 'Classic pathological finding?', '["Necrotizing granulomas/Eosinophils", "Linear IgG", "Non-caseating", "Ferruginous"]', 0, 'Granulomatous small-vessel vasculitis with eosinophils.');

    -- CASE 33: Pleural Plaques
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asbestos and Diaphragmatic Plaques', 'Insulation worker with multiple pleural plaques on the diaphragm.', 33)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Pleural plaques are the most common manifestation of which exposure?', '["Silica", "Coal", "Asbestos", "Beryllium"]', 2, 'Plaques are a hallmark of past asbestos exposure.'),
    (v_case_id, 'Malignancy with long, thin microvilli on EM?', '["Adeno", "Mesothelioma", "Small cell", "Large cell"]', 1, 'Electron microscopy shows characteristic long, slender microvilli in mesothelioma.');

    -- CASE 34: Foreign Body Aspiration
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Right Main Bronchus Obstruction', 'A 4-year-old with sudden onset of choking and unilateral wheezing while eating.', 34)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Asthma", "Foreign body aspiration", "Croup", "Epiglottitis"]', 1, 'Sudden choking in a child points to aspiration.'),
    (v_case_id, 'In which part of the tree is the object most likely lodged?', '["Left bronchus", "Right main bronchus", "Trachea", "Terminal"]', 1, 'The right main bronchus is wider, shorter, and more vertical than the left.');

    -- CASE 35: Bronchial Carcinoid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chromogranin and Kulchitsky Cells', 'Hemoptysis. Biopsy reveals small cells in nests; positive for chromogranin and synaptophysin.', 35)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Squamous", "Bronchial Carcinoid", "Small cell", "Adeno"]', 1, 'Carcinoids are low-grade neuroendocrine tumors.'),
    (v_case_id, 'Carcinoid tumors arise from which cell type?', '["Type II", "Neuroendocrine (Kulchitsky) cells", "Goblet", "Basal"]', 1, 'They are derived from the neuroendocrine cells of the bronchial mucosa.');

    -- CASE 36: Bullae vs Blebs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bulla and Pneumothorax Risk', 'Chest X-ray shows a large air-filled space > 1 cm in the parenchyma.', 36)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This structure is known as a:', '["Bleb", "Bulla", "Cavity", "Abscess"]', 1, 'Bullae are larger than 1 cm; blebs are smaller and subpleural.'),
    (v_case_id, 'Rupture of subpleural bleb causes:', '["Primary spontaneous pneumothorax", "Secondary", "Hemothorax", "Chylothorax"]', 0, 'Bleb rupture is the mechanism for primary spontaneous pneumothorax.');

    -- CASE 37: Plexiform Lesions
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pulmonary HTN Histology', 'A 30-year-old with BMPR2 mutation and progressive dyspnea.', 37)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Predisposed to which condition?', '["Emphysema", "Primary Pulmonary HTN", "Sarcoidosis", "CF"]', 1, 'BMPR2 is the classic familial marker.'),
    (v_case_id, 'Hallmark histological lesion?', '["Aschoff", "Plexiform lesion", "Ghon complex", "Lines of Zahn"]', 1, 'Plexiform lesions are characteristic "tufts" of capillaries in advanced pulmonary HTN.');

    -- CASE 38: Submucosal Gland Hypertrophy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Bronchitis Histology', 'Smoker with productive cough for 4 months for the past 3 years.', 38)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Pathology would show an increase in size of:', '["Alveoli", "Submucosal mucous glands", "Smooth muscle", "Cartilage"]', 1, 'Hyperplasia/hypertrophy of glands is the key finding.'),
    (v_case_id, 'Morphological change quantified using:', '["Apgar", "Reid index", "Mentzer", "Tiffeneau"]', 1, 'Reid index = Gland thickness / Wall thickness.');

    -- CASE 39: Hamartoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Coin Lesion and Cartilage', 'Disorganized mass of cartilage, connective tissue, and epithelium on routine X-ray.', 39)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bronchogenic", "Hamartoma", "Metastatic", "Abscess"]', 1, 'Hamartomas are the most common benign lung tumors.'),
    (v_case_id, 'This lesion is best described as:', '["Malignant", "Benign/Tissues normally present", "Pre-malignant", "Granuloma"]', 1, 'A hamartoma is a malformation of native tissue components.');

    -- CASE 40: Uremic Pleuritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'CKD and Sharp Chest Pain', 'Chronic kidney disease patient with sharp pain and friction rub. No infiltrates.', 40)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely cause of pleuritis?', '["Infection", "Uremia", "Infarction", "Connective tissue"]', 1, 'Uremic pleuritis is common in advanced renal failure.'),
    (v_case_id, 'Pleural fluid is typically:', '["Transudate", "Exudate", "Hemorrhagic", "Milky"]', 1, 'Uremic effusion is an exudate, often containing fibrin.');

    -- CASE 41: ABPA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Aspergillus and Brown Mucus Plugs', 'Asthma patient with branching septate hyphae in sputum and brown mucus plugs.', 41)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Invasive", "ABPA", "Aspergilloma", "Histoplasmosis"]', 1, 'Allergic Bronchopulmonary Aspergillosis.'),
    (v_case_id, 'ABPA is associated with which conditions?', '["CF or Asthma", "HIV/AIDS", "Diabetes", "COPD"]', 0, 'Occurs in patients with pre-existing hypersensitivity like asthma or CF.');

    -- CASE 42: SVC Syndrome (SCLC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Facial Swelling and SVC Syndrome', 'Redness/swelling of face and distended neck veins with a central lung mass.', 42)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Presentation known as:', '["Horner", "SVC Syndrome", "Pancoast", "Lambert-Eaton"]', 1, 'SVC obstruction prevents venous return from the head/arms.'),
    (v_case_id, 'SVC syndrome most commonly caused by:', '["Right failure", "Compression by tumor", "Aneurysm", "Massive PE"]', 1, 'Small cell lung cancer is a very common cause.');

    -- CASE 43: Diaphragmatic Hernia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bowel Sounds in the Chest', 'Neonate with scaphoid abdomen and absent breath sounds on the left. Bowel sounds in chest.', 43)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Fistula", "Congenital diaphragmatic hernia", "CCAM", "Sequestration"]', 1, 'Herniation through the Bochdalek foramen.'),
    (v_case_id, 'Most dangerous complication?', '["GI obstruction", "Pulmonary hypoplasia", "Atresia", "Polyhydramnios"]', 1, 'Abdominal organs in the chest prevent lung development.');

    -- CASE 44: Coccidioidomycosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Southwest US and Spherules', 'Fever/cough after travel to SW US. Spherules with endospores on biopsy.', 44)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Histoplasmosis", "Coccidioidomycosis", "Blastomycosis", "Cryptococcosis"]', 1, 'Valley Fever is endemic to the Southwest US.'),
    (v_case_id, 'Associated with which environmental event?', '["Bat droppings", "Earthquakes or dust storms", "Decaying wood", "Bird droppings"]', 1, 'Spores are aerosolized during soil disturbance.');

    -- CASE 45: Dual Blood Supply
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wedge-shaped Opacity (Hampton''s Hump)', 'Sudden hemoptysis/dyspnea in a DVT patient. Wedge-shaped opacity on CT.', 45)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pulmonary infarction", "Lung cancer", "Bronchiectasis"]', 1, 'Hampton''s hump is a sign of peripheral pulmonary infarction.'),
    (v_case_id, 'Why are lung infarctions rare?', '["Low O2 demand", "Dual blood supply", "Anticoagulants", "Large vessels"]', 1, 'The lung is protected by both the pulmonary and bronchial arterial systems.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 46-60) - Advanced Restrictive & Congenital
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46: Berylliosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Electronics Worker and Berylliosis', '20-year electronics manufacturer with non-caseating granulomas.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sarcoidosis", "Berylliosis", "Silicosis", "Asbestosis"]', 1, 'Occupational exposure in aerospace/electronics.'),
    (v_case_id, 'Indistinguishable from which other disease?', '["TB", "Sarcoidosis", "Hypersensitivity", "Anthracosis"]', 1, 'It looks identical to sarcoidosis on histology.');

    -- CASE 47: LAM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tuberous Sclerosis and Chylous Effusion', 'Female with tuberous sclerosis, thin-walled cysts, and chylous effusion.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lymphangioleiomyomatosis (LAM)", "Emphysema", "LCH", "Bronchiectasis"]', 0, 'LAM is a rare lung disease often associated with TSC.'),
    (v_case_id, 'Almost exclusively seen in which demographic?', '["Elderly males", "Females of childbearing age", "Children", "Premature"]', 1, 'Strong association with estrogen.');

    -- CASE 48: Flow-Volume Loop
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Scooped-out Expiration', 'Flow-volume loop shows "scooped-out" appearance and shift to the left.', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This pattern is characteristic of:', '["Restrictive", "Obstructive", "Normal", "Chest wall"]', 1, 'Scooped appearance indicates airway collapse during expiration.'),
    (v_case_id, 'FEV1/FVC ratio would be:', '["Increased", "Decreased (<70%)", "Normal", "1.0"]', 1, 'Obstructive diseases always show a reduced FEV1/FVC ratio.');

    -- CASE 49: Occupational Asthma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Baker''s Asthma', 'Bakery worker whose cough improves on weekends.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Chronic bronchitis", "Occupational asthma", "Hypersensitivity", "Bronchiectasis"]', 1, 'Asthmatic symptoms triggered by work allergens.'),
    (v_case_id, 'Most likely immunological mechanism?', '["Type I Hypersensitivity", "Type II", "Type IV", "Toxic"]', 0, 'IgE-mediated reaction to flour or other allergens.');

    -- CASE 50: Small Cell (Neuroendocrine)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Salt-and-pepper Chromatin', 'Central lung mass with "salt-and-pepper" chromatin and neurosecretory granules.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Adeno", "Small cell lung carcinoma (SCLC)", "Squamous", "Large cell"]', 1, 'Small cell is a high-grade neuroendocrine carcinoma.'),
    (v_case_id, 'Preferred treatment for this specific tumor?', '["Surgical", "Chemotherapy and Radiation", "Observation", "Antibiotics"]', 1, 'SCLC is usually widespread at diagnosis, so chemo/radiation is the mainstay.');

    -- CASE 51: Hypoxic Vasoconstriction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'V/Q Dead Space', 'DVT patient with ventilation without perfusion.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This phenomenon is known as:', '["Shunt", "Dead space", "Diffusion limitation", "Hypoventilation"]', 1, 'Ventilation without perfusion = Dead space; Perfusion without ventilation = Shunt.'),
    (v_case_id, 'Physiological response to localized hypoxia?', '["Vasodilation", "Vasoconstriction", "No change", "Hemorrhage"]', 1, 'The lung shunts blood away from poorly ventilated areas (hypoxic pulmonary vasoconstriction).');

    -- CASE 52: Bird-fancier''s Lung
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypersensitivity Pneumonitis', 'Pet shop owner with "ground-glass" opacities on X-ray.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Psittacosis", "Hypersensitivity pneumonitis", "Silicosis", "Sarcoidosis"]', 1, 'Psittacosis is an infection; Bird-fancier''s is an immune-mediated hypersensitivity.'),
    (v_case_id, 'Primarily involves which parts of the lung?', '["Trachea", "Alveoli and Distal Bronchioles", "Pleura", "Arteries"]', 1, 'It is an interstitial and alveolar inflammatory reaction.');

    -- CASE 53: Acute Epiglottitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tripod Position and Drooling', '3-year-old with stridor, high fever, and drooling. Sitting in tripod position.', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Croup", "Acute Epiglottitis", "Foreign body", "Papilloma"]', 1, 'A pediatric emergency due to risk of airway occlusion.'),
    (v_case_id, 'Most common cause before widespread vaccination?', '["Strep pneu", "Hib", "Staph aureus", "Moraxella"]', 1, 'Haemophilus influenzae type b was the dominant cause.');

    -- CASE 54: Progressive Massive Fibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Caplan Syndrome and PMF', 'Coal miner with blackened upper lobe masses.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Advanced stage of Coal Worker''s Pneumoconiosis?', '["Anthracosis", "Caplan", "Progressive Massive Fibrosis (PMF)", "Silicotuberculosis"]', 2, 'PMF involves large areas of dense fibrosis.'),
    (v_case_id, 'Combination of pneumoconiosis and Rheumatoid Arthritis?', '["Dressler", "Caplan syndrome", "Horner", "Kartagener"]', 1, 'Caplan syndrome features peripheral rheumatoid nodules in the lungs.');

    -- CASE 55: Marfan Spontaneous Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Arachnodactyly and Apical Blebs', 'Tall male with long fingers has spontaneous pneumothorax.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying condition?', '["Ehlers-Danlos", "Marfan syndrome", "CF", "Alpha-1"]', 1, 'Connective tissue disease with pulmonary manifestations.'),
    (v_case_id, 'Pulmonary complication primarily due to:', '["Surfactant lack", "Apical subpleural blebs", "Infection", "Hyperreactivity"]', 1, 'Structural weakness leads to apical bleb formation.');

    -- CASE 56: Lambert-Eaton (SCLC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Voltage-gated Calcium Channels', 'Muscle weakness that improves with repetitive use in a lung cancer patient.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Target of the autoantibodies?', '["ACh receptors", "Pre-synaptic Calcium channels", "AChE", "Sodium"]', 1, 'Antibodies block pre-synaptic Ca2+ entry, preventing ACh release.'),
    (v_case_id, 'Which lung cancer is most associated?', '["Squamous", "Adeno", "Small cell", "Large cell"]', 2, 'SCLC is strongly associated with Lambert-Eaton.');

    -- CASE 57: Chylothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thoracic Duct and Milky Fluid', 'Milky-white pleural effusion with high triglyceride content.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This type of effusion is known as a:', '["Hemothorax", "Chylothorax", "Empyema", "Pseudochylothorax"]', 1, 'Leakage of lymphatic fluid into the pleural space.'),
    (v_case_id, 'Commonly caused by trauma/obstruction of the:', '["Thoracic duct", "Azygos", "Pulm artery", "Esophagus"]', 0, 'The thoracic duct carries chyle from the gut.');

    -- CASE 58: Tracheoesophageal Fistula
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'TEF and Salivation', 'Neonate with excessive salivation and choking during first feeding. NG tube fails.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pyloric", "EA with TEF", "Hernia", "Choanal"]', 1, 'Esophageal atresia with Tracheoesophageal fistula.'),
    (v_case_id, 'The most common type of TEF involves:', '["Blind upper/lower fistula", "Upper fistula", "H-type", "Double"]', 0, 'Blind upper pouch with a fistula from the lower esophagus to the trachea.');

    -- CASE 59: TB Complexes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ghon and Ranke Complexes', 'Acid-fast bacilli in sputum. Combination of parenchymal lesion and hilar node.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Combination of subpleural lesion and hilar node?', '["Ranke", "Ghon complex", "Simon", "Assmann"]', 1, 'The primary lesion plus lymph node involvement.'),
    (v_case_id, 'If Ghon complex undergoes fibrosis and calcification:', '["Ranke complex", "Secondary TB", "Miliary", "Mycetoma"]', 0, 'Ranke complex is the healed/calcified version of the Ghon complex.');

    -- CASE 60 (Final): Lines of Zahn
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lines of Zahn and A-a Gradient', 'Sudden shortness of breath in a breast cancer patient. Segmental filling defect on CT.', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'True regarding the "Lines of Zahn"?', '["Post-mortem", "Platelets/Fibrin/RBC layers", "Veins only", "Fat embolism"]', 1, 'Lines of Zahn indicate a thrombus formed in flowing blood (pre-mortem).'),
    (v_case_id, 'A-a gradient in a patient with large PE?', '["Normal", "Increased", "Decreased", "Zero"]', 1, 'The Alveolar-arterial gradient increases due to V/Q mismatch and shunt.');

    RAISE NOTICE 'SUCCESS: Respiratory (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
