-- Migration: Year 3 - Pulmonology MCQ Bank (PART 2: 81-160)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pulmonology' LIMIT 1;

    -- SECTION 9: INTERSTITIAL LUNG DISEASE (ILD) - GENERAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '81: What is the most common presenting symptom of Interstitial Lung Disease?', '["Cough with green sputum", "Progressive exertional dyspnea and dry cough", "Chest pain", "Hemoptysis"]', 1, 'Classic presentation of insidious-onset restrictive lung disease. (Harrison''s Ch. 291)'),
    (v_topic_id, '82: "Velcro-like" inspiratory crackles on auscultation are characteristic of:', '["Asthma", "Idiopathic Pulmonary Fibrosis (IPF)", "Pneumonia", "Pleural effusion"]', 1, 'Fine, dry crackles heard best at the bases. (Step-Up)'),
    (v_topic_id, '83: What is the hallmark PFT finding in ILD?', '["FEV1/FVC < 0.7", "Reduced Total Lung Capacity (TLC) and FVC", "Increased DLCO", "Increased RV"]', 1, 'Reflects the restrictive physiology of scarred/stiff lungs. (Harrison''s Ch. 285)'),
    (v_topic_id, '84: DLCO in most Interstitial Lung Diseases is:', '["Increased", "Decreased", "Normal", "Unchanged by disease"]', 1, 'Due to thickening of the alveolar-capillary membrane and loss of surface area. (Pocket Medicine)'),
    (v_topic_id, '85: A "Honeycombing" pattern on HRCT scan suggests:', '["Acute bronchitis", "End-stage pulmonary fibrosis", "Sarcoidosis", "Early pneumonia"]', 1, 'Represents irreversible architectural destruction. (Harrison''s Ch. 291)'),
    (v_topic_id, '86: Which medication class is generally AVOIDED in the treatment of Idiopathic Pulmonary Fibrosis (IPF)?', '["Antifibrotics", "Corticosteroids", "Nintedanib", "Pirfenidone"]', 1, 'The PANTHER-IPF trial showed harm with immunosuppressives in IPF. (Harrison''s Ch. 291)'),
    (v_topic_id, '87: Which antifibrotic agent is a tyrosine kinase inhibitor used in IPF?', '["Pirfenidone", "Nintedanib", "Azathioprine", "Cyclophosphamide"]', 1, 'Both Nintedanib and Pirfenidone slow the rate of FEV1 decline. (Pocket Medicine)'),
    (v_topic_id, '88: "Usual Interstitial Pneumonia" (UIP) is the histological pattern of:', '["Sarcoidosis", "Idiopathic Pulmonary Fibrosis", "Asbestosis", "Hypersensitivity Pneumonitis"]', 1, 'UIP is the pathological hallmark of IPF. (Harrison''s Ch. 291)'),
    (v_topic_id, '89: Which ILD is characteristically associated with "Smoking"?', '["Desquamative Interstitial Pneumonia (DIP)", "Sarcoidosis", "Silicosis", "Hypersensitivity Pneumonitis"]', 0, 'DIP and RB-ILD are almost exclusively seen in smokers. (Step-Up)'),
    (v_topic_id, '90: ILD associated with Rheumatoid Arthritis often presents with which pattern?', '["UIP", "NSIP (Non-specific Interstitial Pneumonia)", "Both A and B", "Granulomatous"]', 2, 'UIP and NSIP are the most common patterns in CTD-ILD. (Harrison''s Ch. 292)');

    -- SECTION 10: SARCOIDOSIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '91: Sarcoidosis is characterized histologically by:', '["Caseating granulomas", "Non-caseating granulomas", "Eosinophilic infiltrates", "Abscesses"]', 1, 'TB causes caseating (necrotic) granulomas; Sarcoid is non-caseating. (Harrison''s Ch. 366)'),
    (v_topic_id, '92: Bilateral hilar lymphadenopathy on Chest X-ray is classic for:', '["Lung cancer", "Sarcoidosis (Stage 1)", "Pneumonia", "COPD"]', 1, 'Often an incidental finding in asymptomatic patients. (Step-Up)'),
    (v_topic_id, '93: "Lofgren Syndrome" includes bilateral hilar adenopathy, erythema nodosum, and:', '["Fever and Polyarthritis", "Hemoptysis", "Blindness", "Weight loss"]', 0, 'A highly specific and often self-limiting form of sarcoidosis. (Harrison''s Ch. 366)'),
    (v_topic_id, '94: Which serum enzyme is often elevated in patients with sarcoidosis?', '["Amylase", "Angiotensin-Converting Enzyme (ACE)", "Troponin", "Lipase"]', 1, 'Produced by the epithelioid cells within granulomas; non-specific but helpful. (Pocket Medicine)'),
    (v_topic_id, '95: Why do patients with sarcoidosis sometimes develop hypercalcemia?', '["Bone destruction", "Increased Vitamin D activation (1,25-dihydroxyvitamin D) by macrophages", "Renal failure", "High intake"]', 1, 'Granulomas contain 1-alpha-hydroxylase. (Harrison''s Ch. 366)'),
    (v_topic_id, '96: "Heerfordt Syndrome" (Uveoparotid Fever) includes parotid gland enlargement, facial nerve palsy, and:', '["Uveitis", "Hearing loss", "Splenomegaly", "Diabetes"]', 0, 'A rare presentation of sarcoidosis. (Step-Up)'),
    (v_topic_id, '97: What is the first-line treatment for symptomatic sarcoidosis?', '["Antibiotics", "Corticosteroids", "Methotrexate", "Observation"]', 1, 'Immunosuppression is the mainstay for organ-threatening disease. (Harrison''s Ch. 366)'),
    (v_topic_id, '98: Which organ system, besides the lungs, is most commonly affected in sarcoidosis?', '["Liver", "Skin and Eyes", "Heart", "Kidneys"]', 1, 'Uveitis and skin lesions (lupus pernio) are frequent. (Pocket Medicine)'),
    (v_topic_id, '99: "Lupus pernio" in sarcoidosis refers to:', '["A type of SLE", "Violaceous skin lesions on the nose/cheeks", "Joint pain", "Chest pain"]', 1, 'Characteristic skin finding of sarcoidosis. (Step-Up)'),
    (v_topic_id, '100: Scadding Stages of Sarcoidosis are based on:', '["Symptoms", "Chest X-ray findings", "Biopsy", "ACE levels"]', 1, 'Stage 0 (Normal) to Stage IV (Fibrosis). (Harrison''s Ch. 366)');

    -- SECTION 11: OCCUPATIONAL LUNG DISEASES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '101: Which occupation is most associated with "Asbestosis"?', '["Coal mining", "Sandblasting", "Shipbuilding and Insulation", "Baking"]', 2, 'Historical exposure in construction and shipyard workers. (Harrison''s Ch. 290)'),
    (v_topic_id, '102: "Eggshell calcification" of hilar lymph nodes is a classic finding in:', '["Asbestosis", "Silicosis", "Berylliosis", "Sarcoidosis"]', 1, 'Seen in workers exposed to silica (quarrying, sandblasting). (Step-Up)'),
    (v_topic_id, '103: Asbestos exposure increases the risk of which highly aggressive pleural cancer?', '["Adenocarcinoma", "Mesothelioma", "Small Cell Carcinoma", "Squamous Cell"]', 1, 'Mesothelioma is almost exclusively linked to asbestos. (Pocket Medicine)'),
    (v_topic_id, '104: Pleural plaques on Chest X-ray are a hallmark of:', '["Smoking", "Asbestos exposure", "TB", "Heart failure"]', 1, 'Circumscribed areas of fibrous thickening. (Harrison''s Ch. 290)'),
    (v_topic_id, '105: "Caplan Syndrome" is the combination of rheumatoid arthritis and:', '["Asbestosis", "Coal Workers'' Pneumoconiosis (CWP)", "Silicosis", "Berylliosis"]', 1, 'Presents as large pulmonary nodules. (Step-Up)'),
    (v_topic_id, '106: Which mineral exposure mimics Sarcoidosis (non-caseating granulomas)?', '["Silica", "Asbestos", "Beryllium", "Iron"]', 2, 'Berylliosis is common in aerospace and electronics workers. (Harrison''s Ch. 290)'),
    (v_topic_id, '107: "Monday Morning Blues" (Byssinosis) is caused by exposure to:', '["Cotton dust", "Sugar cane (Bagassosis)", "Moldy hay", "Bird droppings"]', 0, 'Symptoms are worse on the first day back at work. (Pocket Medicine)'),
    (v_topic_id, '108: Silicosis primarily affects which part of the lungs?', '["Lower lobes", "Upper lobes", "Hila only", "Pleura"]', 1, 'Contrast with asbestosis which is lower-lobe predominant. (Step-Up)'),
    (v_topic_id, '109: "Ivory white" pleural plaques are associated with:', '["Coal", "Asbestos", "Silica", "Gold"]', 1, 'Classic description of calcified asbestos plaques. (Harrison''s)'),
    (v_topic_id, '110: Asbestos exposure PLUS smoking synergistically increases the risk of:', '["Mesothelioma", "Bronchogenic Carcinoma (Lung Cancer)", "Emphysema", "Pneumonia"]', 1, 'Smoking does NOT increase the risk of mesothelioma, but it multiplies the risk of lung cancer in asbestos workers. (Harrison''s Ch. 290)');

    -- SECTION 12: HYPERSENSITIVITY PNEUMONITIS (HP)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '111: "Farmer''s Lung" is a form of HP caused by:', '["Pollen", "Thermophilic actinomycetes in moldy hay", "Pesticides", "CO2"]', 1, 'Immunological response to inhaled organic antigens. (Harrison''s Ch. 290)'),
    (v_topic_id, '112: "Bird Fancier''s Lung" is caused by:', '["Bird flu", "Avian proteins in droppings or feathers", "Ticks", "Insects"]', 1, 'A common form of hypersensitivity pneumonitis. (Step-Up)'),
    (v_topic_id, '113: The acute form of HP typically presents how long after exposure?', '["Minutes", "4-8 hours", "Weeks", "Years"]', 1, 'Presents with fever, chills, and dyspnea. (Pocket Medicine)'),
    (v_topic_id, '114: "Ground glass opacities" and "Mosaic attenuation" on HRCT are features of:', '["IPF", "Hypersensitivity Pneumonitis", "Pulmonary Embolism", "Asthma"]', 1, 'Mosaicism reflects air trapping and inflammation. (Harrison''s Ch. 290)'),
    (v_topic_id, '115: What is the most important treatment for Hypersensitivity Pneumonitis?', '["Antibiotics", "Antifungals", "Removal of the offending antigen", "Chemotherapy"]', 2, 'Avoiding the trigger is essential for prevention of fibrosis. (Step-Up)'),
    (v_topic_id, '116: "Bagassosis" is an occupational HP seen in workers processing:', '["Wood", "Sugar cane", "Coffee", "Grain"]', 1, 'Due to moldy sugar cane fibers. (Harrison''s)'),
    (v_topic_id, '117: Which antibody class is typically elevated in the serum of patients with HP (though not diagnostic)?', '["IgE", "IgG (Precipitating antibodies)", "IgM", "IgA"]', 1, 'Reflects prior exposure to the antigen. (Pocket Medicine)'),
    (v_topic_id, '118: Chronic HP can lead to permanent:', '["Lung cancer", "Lung fibrosis", "Pneumothorax", "Pleural effusion"]', 1, 'If the trigger is not removed, it progresses to a restrictive lung disease. (Step-Up)'),
    (v_topic_id, '119: Unlike Asthma, HP involves inflammation of the:', '["Large bronchi", "Alveoli and small airways", "Trachea", "Diaphragm"]', 1, 'It is a parenchymal/interstitial disease. (Harrison''s Ch. 290)'),
    (v_topic_id, '120: "Hot Tub Lung" is caused by:', '["Chlorine", "Mycobacterium avium complex (MAC)", "Hot water burns", "Legionella"]', 1, 'Hypersensitivity response to aerosolized MAC. (Pocket Medicine)');

    -- SECTION 13: VASCULITIS & RARE LUNG DISEASES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "Granulomatosis with Polyangiitis" (GPA/Wegener''s) is most strongly associated with:', '["p-ANCA", "c-ANCA (anti-PR3)", "ANA", "Anti-dsDNA"]', 1, 'Triad of upper/lower respiratory and renal involvement. (Harrison''s Ch. 363)'),
    (v_topic_id, '122: "Eosinophilic Granulomatosis with Polyangiitis" (EGPA) was formerly known as:', '["Goodpasture Syndrome", "Churg-Strauss Syndrome", "Wegener''s", "Behcet''s"]', 1, 'Associated with asthma, eosinophilia, and p-ANCA (anti-MPO). (Step-Up)'),
    (v_topic_id, '123: "Goodpasture Syndrome" involves autoantibodies against:', '["DNA", "Type IV Collagen (Glomerular and Alveolar Basement Membrane)", "Mitochondria", "Platelets"]', 1, 'Causes the classic pulmonary-renal syndrome (hemoptysis + hematuria). (Harrison''s Ch. 292)'),
    (v_topic_id, '124: "Pulmonary Langerhans Cell Histiocytosis" (PLCH) is a rare ILD seen almost exclusively in:', '["Children", "Smokers", "Elderly", "Farmers"]', 1, 'Stopping smoking can lead to resolution. (Harrison''s Ch. 291)'),
    (v_topic_id, '125: "Lymphangioleiomyomatosis" (LAM) is a rare lung disease that affects:', '["Young men", "Women of childbearing age", "Infants", "Smokers"]', 1, 'Characterized by cystic lung destruction and associated with Tuberous Sclerosis. (Pocket Medicine)'),
    (v_topic_id, '126: A patient with LAM is at significantly increased risk for:', '["Pneumonia", "Pneumothorax", "Lung cancer", "TB"]', 1, 'Rupture of cysts causes recurrent pneumothoraces. (Harrison''s Ch. 291)'),
    (v_topic_id, '127: "Alveolar Proteinosis" is caused by an accumulation of:', '["Fluid", "Surfactant (Lipoproteinaceous material)", "Pus", "Blood"]', 1, 'Often due to anti-GM-CSF antibodies. (Pocket Medicine)'),
    (v_topic_id, '128: What is the treatment of choice for severe Alveolar Proteinosis?', '["Steroids", "Whole Lung Lavage", "Antibiotics", "Lung transplant"]', 1, 'Physically washing the material out of the lungs. (Harrison''s Ch. 291)'),
    (v_topic_id, '129: "Cryptogenic Organizing Pneumonia" (COP) presents with:', '["Slow onset", "Subacute flu-like illness (weeks) and patchy opacities on CT", "Acute shock", "Chronic clubbing"]', 1, 'Formerly known as BOOP. (Step-Up)'),
    (v_topic_id, '130: Which medication is highly effective for COP?', '["Corticosteroids", "Vancomycin", "Amlodipine", "Albuterol"]', 0, 'Most patients respond rapidly to steroids. (Pocket Medicine)');

    -- SECTION 14: CHEST WALL & PLEURAL RESTRICTION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '131: "Kyphoscoliosis" causes restrictive lung disease by:', '["Scarring the lung", "Mechanical deformity reducing thoracic volume", "Paralyzing the diaphragm", "Blocking airways"]', 1, 'Extrapulmonary restriction. (Step-Up)'),
    (v_topic_id, '132: In morbid obesity, the most significantly reduced PFT parameter is:', '["FEV1", "Functional Residual Capacity (FRC)", "TLC", "DLCO"]', 1, 'Mass effect on the chest wall and abdomen reduces FRC. (Harrison''s Ch. 285)'),
    (v_topic_id, '133: "Pickwickian Syndrome" is another name for:', '["Sleep apnea", "Obesity Hypoventilation Syndrome", "COPD", "Narcolepsy"]', 1, 'Obesity + Sleep apnea + daytime hypercapnia. (Pocket Medicine)'),
    (v_topic_id, '134: Bilateral diaphragm paralysis presents with:', '["Normal breathing", "Orthopnea and paradoxical abdominal wall motion", "Cough", "Fever"]', 1, 'The abdomen moves in on inspiration. (Step-Up)'),
    (v_topic_id, '135: "Ankylosing Spondylitis" causes respiratory restriction by:', '["Lung fibrosis", "Fixing the ribs and spine (Chest wall rigidity)", "Pleural effusion", "Muscle weakness"]', 1, 'Limited chest expansion. (Harrison''s Ch. 361)'),
    (v_topic_id, '136: Which neuromuscular disease causes progressive respiratory failure starting from the legs (ascending)?', '["Myasthenia Gravis", "Guillain-Barré Syndrome", "ALS", "Polio"]', 1, 'Requires monitoring of Vital Capacity (VC) and NIF. (Step-Up)'),
    (v_topic_id, '137: "Myasthenic Crisis" involves respiratory failure due to weakness at the:', '["Diaphragm", "Neuromuscular junction", "Brainstem", "Spinal cord"]', 1, 'Often triggered by infection or surgery. (Pocket Medicine)'),
    (v_topic_id, '138: "Pectus excavatum" refers to:', '["Hollowed-out chest", "Protruding chest", "Barrel chest", "Curved spine"]', 0, 'Funnel chest; can cause mild restriction. (Step-Up)'),
    (v_topic_id, '139: Chronic pleural thickening ("Pleural Peel") can be a sequel of:', '["Untreated empyema or hemothorax", "Pneumothorax", "Asthma", "Smoking"]', 0, 'Causes trapped lung and restriction. (Pocket Medicine)'),
    (v_topic_id, '140: What is the primary PFT change in "Aging" lungs?', '["Increased FVC", "Decreased FEV1 and loss of elastic recoil", "Increased DLCO", "None"]', 1, 'Natural decline in airflow and elasticity. (Harrison''s Ch. 284)');

    -- SECTION 15: IMAGING IN RESTRICTIVE DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '141: "Ground glass" opacities on CT generally represent:', '["Active inflammation or edema", "Dense fibrosis", "Air trapping", "Cancer"]', 0, 'Hazy opacity that does not obscure underlying vessels. (Harrison''s Ch. 285)'),
    (v_topic_id, '142: "Traction bronchiectasis" in ILD is a sign of:', '["Chronic infection", "Dense fibrosis pulling airways open", "Asthma", "COPD"]', 1, 'Irreversible architectural change due to scarring. (Step-Up)'),
    (v_topic_id, '143: "Crazy paving" on CT (Ground glass + thickened septa) is classic for:', '["IPF", "Alveolar Proteinosis", "Silicosis", "Pneumonia"]', 1, 'Highly suggestive of PAP. (Pocket Medicine)'),
    (v_topic_id, '144: "Upper lobe" predominant fibrosis is seen in:', '["IPF", "Silicosis and Sarcoidosis", "Asbestosis", "Scleroderma"]', 1, 'Helps narrow the differential for ILD. (Harrison''s Ch. 291)'),
    (v_topic_id, '145: "Lower lobe" predominant fibrosis is seen in:', '["Asbestosis and IPF", "Silicosis", "Farmer''s Lung", "Berylliosis"]', 0, 'Classic for most idiopathic and connective tissue diseases. (Step-Up)'),
    (v_topic_id, '146: Which imaging modality is best for evaluating mediastinal lymph nodes?', '["Chest X-ray", "CT with Contrast", "Ultrasound", "Bronchoscopy"]', 1, 'Allows visualization of adenopathy. (Harrison''s)'),
    (v_topic_id, '147: PET scan is most useful in pulmonology for:', '["Diagnosing Asthma", "Staging lung cancer and evaluating solitary nodules", "Confirming COPD", "Checking for PE"]', 1, 'Measures metabolic activity (FDG uptake). (Pocket Medicine)'),
    (v_topic_id, '148: "Fleischner Society Guidelines" are used for the management of:', '["Asthma attacks", "Incidental pulmonary nodules", "COPD exacerbations", "Pneumonia"]', 1, 'Based on size and risk factors. (Pocket Medicine)'),
    (v_topic_id, '149: "Tree-in-bud" opacities on CT suggest:', '["Fibrosis", "Small airway inflammation/infection (e.g., Bronchiolitis)", "Pulmonary edema", "Emphysema"]', 1, 'Reflects bronchiolar impaction. (Harrison''s Ch. 285)'),
    (v_topic_id, '150: A "Water bottle" heart silhouette on Chest X-ray suggests:', '["Heart failure", "Large Pericardial Effusion", "Lung Cancer", "COPD"]', 1, 'Globular appearance due to fluid. (Step-Up)');

    -- SECTION 16: MISC RESTRICTIVE & IDIOPATHIC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: "Desquamative Interstitial Pneumonia" (DIP) is effectively treated by:', '["Antibiotics", "Smoking cessation", "Lung resection", "Nothing"]', 1, 'Highly responsive to quitting smoking. (Harrison''s Ch. 291)'),
    (v_topic_id, '152: Which connective tissue disease is most strongly linked to ILD and Pulmonary HTN?', '["SLE", "Systemic Sclerosis (Scleroderma)", "Osteoarthritis", "Gout"]', 1, 'ILD is a leading cause of death in scleroderma. (Step-Up)'),
    (v_topic_id, '153: "Anti-synthetase syndrome" includes ILD, Raynaud''s, and:', '["Diabetes", "Mechanic''s hands", "Blindness", "Obesity"]', 1, 'Associated with Jo-1 antibodies. (Harrison''s Ch. 362)'),
    (v_topic_id, '154: Which drug can cause both acute and chronic pulmonary toxicity/fibrosis?', '["Amlodipine", "Amiodarone", "Metformin", "Atorvastatin"]', 1, 'Dose-dependent toxicity; monitor for new symptoms. (Pocket Medicine)'),
    (v_topic_id, '155: Nitrofurantoin (an antibiotic) is a known cause of:', '["Lung cancer", "Drug-induced Interstitial Lung Disease", "COPD", "Asthma"]', 1, 'Can cause acute hypersensitivity or chronic fibrosis. (Step-Up)'),
    (v_topic_id, '156: Methotrexate toxicity in the lung usually presents as:', '["Pneumonia", "Acute hypersensitivity pneumonitis", "Cancer", "Nodule"]', 1, 'Must be distinguished from infection. (Harrison''s Ch. 292)'),
    (v_topic_id, '157: "Radiation Pneumonitis" typically occurs how long after radiotherapy?', '["Immediately", "4-12 weeks", "1 year", "10 years"]', 1, 'Followed by chronic radiation fibrosis. (Pocket Medicine)'),
    (v_topic_id, '158: Which cell is the primary driver of fibrosis in the lung?', '["Lymphocyte", "Fibroblast/Myofibroblast", "Macrophage", "Eosinophil"]', 1, 'Responsible for excess collagen deposition. (Harrison''s Ch. 291)'),
    (v_topic_id, '159: "Bronchoalveolar Lavage" (BAL) with >25% eosinophils suggests:', '["Sarcoidosis", "Acute Eosinophilic Pneumonia", "TB", "Heart failure"]', 1, 'Helpful for diagnosing specific ILDs. (Harrison''s Ch. 291)'),
    (v_topic_id, '160: A BAL CD4/CD8 ratio of >3.5 is suggestive of:', '["HIV", "Sarcoidosis", "Silicosis", "Asbestosis"]', 1, 'High ratio points toward sarcoidosis. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Pulmonology MCQ Part 2 (81-160) registered.';
END $$;

COMMIT;
