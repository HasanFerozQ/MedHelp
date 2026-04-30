BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pulmonology' LIMIT 1;

    -- CASE 01: Community-Acquired Pneumonia (CAP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Productive Cough', 'A 65-year-old male presents with 3 days of fever, chills, and a cough productive of "rusty" sputum. On exam, he has crackles and increased tactile fremitus at the right lung base. CXR shows a right lower lobe consolidation.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which organism is the most likely cause?', '["Mycoplasma pneumoniae", "Streptococcus pneumoniae", "Legionella pneumophila", "Klebsiella pneumoniae"]', 1, 'S. pneumoniae is the #1 cause of CAP; rusty sputum is a classic hint.'),
    (v_case_id, 'Which scoring system is used to determine if this patient needs hospitalization?', '["Well''s Score", "CURB-65", "Glasgow Coma Scale", "CHADS-VASc"]', 1, 'CURB-65: Confusion, Urea, RR, BP, Age >= 65.'),
    (v_case_id, 'What is the most appropriate outpatient treatment for a healthy adult with CAP?', '["Vancomycin", "Azithromycin or Doxycycline (or Amoxicillin)", "Ciprofloxacin", "Gentamicin"]', 1, 'Macrolides or tetracyclines are standard for uncomplicated CAP, though resistance patterns guide choice.');

    -- CASE 02: COPD Exacerbation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Worsening SOB in a Heavy Smoker', 'A 70-year-old male with a 50-pack-year smoking history and known COPD presents with increased cough, "purulent" sputum, and worsening dyspnea. He is using his rescue inhaler every hour with little relief.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most important initial management step?', '["Inhaled Bronchodilators and Systemic Corticosteroids", "High-flow oxygen", "IV loop diuretics", "Immediate intubation"]', 0, 'Bronchodilators (Albuterol/Ipratropium) and steroids are first-line for exacerbations.'),
    (v_case_id, 'When are antibiotics indicated in a COPD exacerbation?', '["Always", "Increased dyspnea, sputum volume, AND sputum purulence (Anthonisen criteria)", "Only if the fever is > 103 F", "Never"]', 1, 'Antibiotics are indicated for "increased purulence" plus another symptom.'),
    (v_case_id, 'What is the target oxygen saturation range for this patient?', '["98-100%", "88-92%", "94-98%", "> 90%"]', 1, 'High O2 can lead to CO2 retention in some COPD patients (loss of hypoxic drive).');

    -- CASE 03: Acute Asthma Exacerbation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wheezing and Difficulty Speaking', 'A 22-year-old female with a history of asthma presents to the ER with severe wheezing. She is able to speak only in single words and is using accessory muscles to breathe. Her Peak Expiratory Flow (PEF) is 40% of her personal best.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line treatment for an acute asthma attack?', '["Inhaled Salmeterol (LABA)", "Inhaled Albuterol (SABA) and Ipratropium (SAMA)", "Inhaled Fluticasone", "Oral Montelukast"]', 1, 'SABA and SAMA are the primary rescue medications.'),
    (v_case_id, 'An ABG shows a "Normal" PaCO2 in the setting of severe respiratory distress. This is concerning for:', '["Improvement", "Impending respiratory failure (tiring out)", "Good ventilation", "Metabolic alkalosis"]', 1, 'Asthmatics should be hyperventilating (Low CO2). A normal or high CO2 means they are unable to maintain the work of breathing.'),
    (v_case_id, 'Which of the following should be AVOIDED in a patient with a history of asthma?', '["Acetaminophen", "Non-selective Beta-blockers or Aspirin (in some patients)", "Statins", "Vitamin C"]', 1, 'These can trigger bronchoconstriction in susceptible individuals.');

    -- CASE 04: Pulmonary Embolism (PE)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden SOB after Surgery', 'A 60-year-old female presents with sudden-onset pleuritic chest pain and dyspnea 5 days after a total hip replacement. Her HR is 110 bpm and RR is 24. Her lungs are clear to auscultation.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pulmonary Embolism", "Heart Failure", "MI"]', 1, 'Sudden onset + clear lungs + post-op = PE until proven otherwise.'),
    (v_case_id, 'Which diagnostic test is the current gold standard (best initial imaging)?', '["Chest X-ray", "CT Pulmonary Angiography (CTPA)", "D-dimer", "V/Q Scan"]', 1, 'CTPA is highly sensitive and specific for PE.'),
    (v_case_id, 'In an unstable patient (BP 80/40) with a confirmed massive PE, what is the management?', '["Heparin drip only", "Thrombolytics (e.g., tPA) or Embolectomy", "Aspirin", "IV fluids only"]', 1, 'Hemodynamic instability defines "Massive PE" and justifies thrombolysis.');

    -- CASE 05: Pulmonary Tuberculosis (TB)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Cough and Night Sweats', 'A 45-year-old male who recently emigrated from a high-prevalence country presents with 3 months of cough, hemoptysis, night sweats, and a 15 lb weight loss. CXR shows cavitary lesions in the upper lobes.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definitive diagnostic test for active TB?', '["PPD skin test", "IGRA (Quantiferon)", "Sputum AFB smear and culture", "CXR"]', 2, 'Culture is the gold standard, though AFB smear and Nucleic Acid Amplification (NAA) are used for rapid diagnosis.'),
    (v_case_id, 'What is the standard "RIPE" therapy regimen for active TB?', '["Rifampin, Insulin, Penicillin, Ethambutol", "Rifampin, Isoniazid, Pyrazinamide, Ethambutol", "Rocephin, Isoniazid, Piperacillin, Erythromycin", "None"]', 1, 'RIPE therapy for 2 months, followed by 4 months of RI.'),
    (v_case_id, 'Which supplement must be given with Isoniazid to prevent peripheral neuropathy?', '["Vitamin B12", "Vitamin B6 (Pyridoxine)", "Vitamin C", "Folic Acid"]', 1, 'Isoniazid interferes with B6 metabolism.');

    -- CASE 06: Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Chest Pain in a Tall, Thin Man', 'A 20-year-old tall, thin male presents with sudden-onset sharp right-sided chest pain and dyspnea after lifting a heavy box. On exam, breath sounds are absent on the right side and there is hyper-resonance to percussion.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Spontaneous Pneumothorax", "PE", "MI", "Asthma"]', 0, 'Tall, thin young males are at risk for rupture of subpleural blebs.'),
    (v_case_id, 'If the patient develops hypotension and tracheal deviation to the LEFT, what is the diagnosis?', '["Simple pneumothorax", "Tension Pneumothorax", "Hemothorax", "Pericardial effusion"]', 1, 'Tension pneumothorax is a life-threatening emergency.'),
    (v_case_id, 'What is the immediate treatment for a TENSION pneumothorax?', '["Chest X-ray", "Needle Decompression followed by Chest Tube", "Wait for the surgeon", "Oxygen only"]', 1, 'Immediate decompression is required; do NOT wait for an X-ray.');

    -- CASE 07: Pleural Effusion (Exudate vs. Transudate)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dullness at the Lung Bases', 'A 60-year-old male with a history of cirrhosis presents with progressive SOB. Exam shows "stony dullness" to percussion and absent breath sounds at the right lung base.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pleural Effusion", "Pneumothorax", "Atelectasis"]', 1, 'Dullness + absent breath sounds = fluid.'),
    (v_case_id, 'According to Light''s Criteria, an effusion is an EXUDATE if:', '["Pleural fluid protein/Serum protein > 0.5", "Pleural fluid LDH/Serum LDH > 0.6", "Pleural fluid LDH > 2/3 the upper limit of normal serum LDH", "Any of the above"]', 3, 'Light''s criteria distinguish transudates (CHF, Cirrhosis, Nephrotic) from exudates (Pneumonia, Cancer, PE).'),
    (v_case_id, 'This patient''s effusion (due to cirrhosis) is most likely a:', '["Transudate", "Exudate", "Chylothorax", "Hemothorax"]', 0, 'Decreased oncotic pressure (low albumin) and increased portal pressure lead to transudates.');

    -- CASE 08: Obstructive Sleep Apnea (OSA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Daytime Somnolence and Snoring', 'A 50-year-old obese male presents with excessive daytime sleepiness and fatigue. His wife reports loud snoring and episodes where he "stops breathing" at night. He has a history of HTN.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the gold standard diagnostic test?', '["Chest X-ray", "Polysomnography (Sleep Study)", "Spirormetry", "ABG"]', 1, 'Used to calculate the Apnea-Hypopnea Index (AHI).'),
    (v_case_id, 'What is the most effective first-line treatment?', '["Weight loss alone", "CPAP (Continuous Positive Airway Pressure)", "Surgery", "Sedatives"]', 1, 'CPAP acts as a "pneumatic splint" to keep the airway open.'),
    (v_case_id, 'Chronic untreated OSA increases the risk for which condition?', '["Lung cancer", "Pulmonary Hypertension and Right Heart Failure", "Diabetes", "Pneumonia"]', 1, 'Chronic hypoxia leads to pulmonary vasoconstriction.');

    -- CASE 09: Idiopathic Pulmonary Fibrosis (IPF)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dry Cough and "Velcro" Crackles', 'A 70-year-old male presents with 1 year of progressive SOB and a non-productive cough. On exam, he has fine "Velcro-like" end-inspiratory crackles at both lung bases and digital clubbing.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["COPD", "Idiopathic Pulmonary Fibrosis", "Bronchiectasis", "Pneumonia"]', 1, 'Chronic progressive fibrosis presents with dry cough and crackles.'),
    (v_case_id, 'What classic pattern is seen on High-Resolution CT (HRCT)?', '["Hyperinflation", "Honeycomb appearance and reticular opacities", "Bat-wing appearance", "Consolidation"]', 1, 'Honeycombing indicates end-stage fibrosis.'),
    (v_case_id, 'Pulmonary Function Tests (PFTs) in this patient would show:', '["Increased FEV1/FVC ratio and decreased lung volumes", "Decreased FEV1/FVC ratio", "Increased TLC", "Normal DLCO"]', 0, 'Restriction is characterized by reduced lung volumes (TLC, FVC) and a normal or high FEV1/FVC.');

    -- CASE 10: Sarcoidosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dry Cough and Red Bumps on Shins', 'A 32-year-old African American female presents with a dry cough and painful red nodules on her shins. CXR shows prominent bilateral hilar lymphadenopathy.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the red nodules on her shins called?', '["Janeway lesions", "Erythema Nodosum", "Lupus pernio", "Psoriasis"]', 1, 'A common non-specific cutaneous manifestation of sarcoidosis.'),
    (v_case_id, 'What is the characteristic histological finding in sarcoidosis?', '["Caseating granulomas", "Non-caseating granulomas", "Abscesses", "Fibrosis only"]', 1, 'The lack of central necrosis (caseation) distinguishes it from TB.'),
    (v_case_id, 'Which lab value is often elevated in systemic sarcoidosis?', '["Hemoglobin", "Serum Angiotensin-Converting Enzyme (ACE) level", "Amylase", "TSH"]', 1, 'ACE is produced by the granulomas; also look for hypercalcemia.');

    -- CASE 11: Legionella Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pneumonia with Diarrhea and Confusion', 'A 55-year-old male presents with high fever, cough, watery diarrhea, and confusion. Labs show hyponatremia (Na: 128 mEq/L). CXR shows patchy alveolar infiltrates.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. pneumoniae", "Legionella pneumophila", "Mycoplasma", "Chlamydia"]', 1, 'Legionella is famous for the "Pneumonia + Diarrhea + Confusion + Hyponatremia" constellation.'),
    (v_case_id, 'How is this infection commonly acquired?', '["Person-to-person", "Aerosolized water from cooling towers or showers", "Tick bite", "Bird droppings"]', 1, 'It is an environmental organism found in water systems.'),
    (v_case_id, 'What is the best rapid test for diagnosis?', '["Sputum Gram stain", "Urinary Antigen Test", "Blood culture", "PCR of blood"]', 1, 'The urinary antigen test is fast and remains positive after starting antibiotics.');

    -- CASE 12: Mycoplasma Pneumonia ("Walking Pneumonia")
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Insidious Cough in a College Student', 'A 20-year-old college student presents with 2 weeks of dry cough, sore throat, and malaise. He "doesn''t look that sick." CXR shows bilateral patchy infiltrates that look "worse than the patient feels."', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Typical Pneumonia", "Mycoplasma pneumoniae (Atypical)", "TB", "PE"]', 1, 'Most common cause of atypical pneumonia in young adults.'),
    (v_case_id, 'What is a common extrapulmonary manifestation?', '["Meningitis", "Bullous Myringitis (ear pain/blisters)", "Jaundice", "Renal failure"]', 1, 'Blisters on the tympanic membrane are a classic clue.'),
    (v_case_id, 'Why are Beta-lactam antibiotics (e.g., Penicillins) ineffective against Mycoplasma?', '["Mycoplasma is resistant", "Mycoplasma lacks a cell wall", "They cannot enter the cell", "Too expensive"]', 1, 'Beta-lactams target the cell wall, which Mycoplasma doesn''t have.');

    -- CASE 13: Bronchiectasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Copious Foul-Smelling Sputum', 'A 30-year-old female with a history of recurrent childhood lung infections presents with a daily chronic cough productive of "cups" of foul-smelling purulent sputum.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Asthma", "Bronchiectasis", "IPF", "Lung cancer"]', 1, 'Permanent dilation of the bronchi leads to impaired mucus clearance and infection.'),
    (v_case_id, 'In the United States, what is the #1 cause of bronchiectasis?', '["Smoking", "Cystic Fibrosis", "TB", "Asthma"]', 1, 'Impaired mucociliary clearance is the underlying mechanism.'),
    (v_case_id, 'What characteristic sign is seen on High-Resolution CT?', '["Honeycomb", "Signet Ring Sign (bronchus larger than the adjacent artery)", "Air-fluid level", "Atelectasis"]', 1, 'Represents the dilated airways.');

    -- CASE 14: ARDS (Acute Respiratory Distress Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory Hypoxemia after Sepsis', 'A 45-year-old male with severe pancreatitis and sepsis develops sudden respiratory failure. He is intubated, but his PaO2 remains 50 mmHg despite 100% FiO2. CXR shows diffuse bilateral "white-out" opacities. Pulmonary Capillary Wedge Pressure (PCWP) is normal (12 mmHg).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CHF", "ARDS", "Massive Pneumonia", "PE"]', 1, 'Refractory hypoxemia + bilateral opacities + NO evidence of heart failure (low PCWP) = ARDS.'),
    (v_case_id, 'What is the fundamental pathophysiology of ARDS?', '["Increased hydrostatic pressure", "Increased capillary permeability and alveolar edema due to inflammation", "Airway obstruction", "Pulmonary hypertension"]', 1, 'A form of non-cardiogenic pulmonary edema.'),
    (v_case_id, 'What ventilator strategy is proven to reduce mortality in ARDS?', '["High tidal volume", "Low Tidal Volume (6 mL/kg) and High PEEP", "High FiO2 only", "None"]', 1, 'Prevents "volutrauma" to the remaining healthy lung tissue.');

    -- CASE 15: Lung Cancer (Small Cell)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Central Mass and Hyponatremia', 'A 65-year-old male heavy smoker presents with weight loss and a new cough. Labs show a sodium of 124 mEq/L. CXR shows a large central hilar mass.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely histological type of lung cancer?', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Small Cell Lung Cancer", "Large Cell Carcinoma"]', 2, 'Small cell is centrally located, strongly linked to smoking, and often causes SIADH.'),
    (v_case_id, 'Which paraneoplastic syndrome is causing his hyponatremia?', '["Cushing Syndrome", "SIADH", "Hypercalcemia", "Lambert-Eaton"]', 1, 'Ectopic production of ADH.'),
    (v_case_id, 'Small cell lung cancer is generally treated with:', '["Surgical resection", "Chemotherapy and Radiation", "Observation", "Antibiotics"]', 1, 'It is usually disseminated at the time of diagnosis, making it very responsive to chemo but not amenable to surgery.');

    -- CASE 16: Lung Cancer (Squamous Cell)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Central Mass and Hypercalcemia', 'A 60-year-old smoker presents with a cough and a central hilar mass on CXR. His labs show a Calcium of 12.5 mg/dL and a low PTH.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely histological type?', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Small Cell", "Large Cell"]', 1, 'Squamous cell is "S"entally located, linked to "S"moking, and causes hypercalcemia (PTHrP).'),
    (v_case_id, 'What is the paraneoplastic product responsible for the high calcium?', '["PTH", "PTH-related Peptide (PTHrP)", "Vitamin D", "Calcitonin"]', 1, 'Acts on the PTH receptors in the bone and kidney.'),
    (v_case_id, 'Histology of this tumor would show:', '["Small blue cells", "Keratin pearls and intercellular bridges", "Gland formation", "Mucin production"]', 1, 'Characteristic features of squamous differentiation.');

    -- CASE 17: Lung Cancer (Adenocarcinoma)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Peripheral Mass in a Non-Smoker', 'A 50-year-old female non-smoker presents with a incidental 2 cm peripheral nodule on a CXR taken for a rib fracture. She has no symptoms.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely histological type?', '["Small cell", "Squamous cell", "Adenocarcinoma", "Large cell"]', 2, 'Adenocarcinoma is the most common lung cancer overall and the most common in non-smokers; it is usually peripheral.'),
    (v_case_id, 'Which of the following is a classic paraneoplastic manifestation of adenocarcinoma?', '["Hypercalcemia", "Hypertrophic Osteoarthropathy (Clubbing and periostitis)", "SIADH", "Cushing"]', 1, 'Often presents as new-onset finger clubbing.'),
    (v_case_id, 'What is the primary treatment for an early-stage (Stage I) adenocarcinoma?', '["Chemotherapy", "Surgical Resection (Lobectomy)", "Radiation", "Immunotherapy"]', 1, 'Localized non-small cell lung cancer is potentially curable with surgery.');

    -- CASE 18: Pancoast Tumor (Superior Sulcus)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shoulder Pain and a Droopy Eyelid', 'A 60-year-old smoker presents with persistent right shoulder pain and weakness in his right hand. On exam, he has a droopy right eyelid and a constricted right pupil.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rotator cuff tear", "Pancoast Tumor", "Stroke", "Bell''s palsy"]', 1, 'A tumor at the apex of the lung compressing the brachial plexus and sympathetic chain.'),
    (v_case_id, 'What is the eye finding (Ptosis, Miosis, Anhydrosis) called?', '["Horner Syndrome", "Lambert-Eaton", "Myasthenia Gravis", "Argyll Robertson pupil"]', 0, 'Indicates damage to the sympathetic pathway.'),
    (v_case_id, 'Which anatomical structures are typically involved in this syndrome?', '["C1-C4 nerve roots", "C8-T2 nerve roots and the Stellate Ganglion", "Vagus nerve", "Phrenic nerve"]', 1, 'Compression of the inferior brachial plexus (hand weakness) and cervical sympathetic ganglion.');

    -- CASE 19: Superior Vena Cava (SVC) Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Swollen Face and Distended Neck Veins', 'A 55-year-old male with lung cancer presents with a "full feeling" in his head and swelling of his face and arms. On exam, his face is plethoric (red) and he has prominent, non-pulsatile dilated veins over his chest.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Heart Failure", "SVC Syndrome", "Tamponade", "Nephrotic syndrome"]', 1, 'Obstruction of the SVC (usually by a tumor) blocks venous return from the upper body.'),
    (v_case_id, 'What is the most common cause of SVC syndrome today?', '["Syphilis", "Malignancy (Lung cancer or Lymphoma)", "Aortic aneurysm", "Infection"]', 1, 'Malignancy is responsible for > 90% of cases.'),
    (v_case_id, 'What is the most immediate priority in management?', '["Antibiotics", "Maintain airway and consider urgent Radiation or Stenting", "Diuretics", "Digoxin"]', 1, 'Airway obstruction and cerebral edema are the primary life threats.');

    -- CASE 20: Hypersensitivity Pneumonitis ("Farmer''s Lung")
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Cough after Handling Hay', 'A 45-year-old farmer presents with episodes of fever, chills, and SOB that occur 6 hours after he handles moldy hay. The symptoms resolve within 2 days of staying away from the barn.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Hypersensitivity Pneumonitis", "Asthma", "COPD"]', 1, 'An immune-mediated (Type III/IV) reaction to organic dusts.'),
    (v_case_id, 'What is the primary treatment?', '["Antibiotics", "Avoidance of the offending antigen", "Inhaled Albuterol", "Long-term oxygen"]', 1, 'Prevention is key; steroids may be used for severe acute cases.'),
    (v_case_id, 'Chronic exposure to the antigen can lead to:', '["Emphysema", "Irreversible Interstitial Lung Disease/Fibrosis", "Lung cancer", "Asthma"]', 1, 'Repeated inflammation leads to permanent architectural damage.');

    -- CASE 21: Pneumocystis Jirovecii Pneumonia (PJP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dyspnea and Dry Cough in an HIV Patient', 'A 35-year-old male with HIV (CD4 count 50) presents with 2 weeks of worsening dyspnea on exertion and a dry cough. His O2 sat drops significantly when he walks. CXR shows diffuse bilateral perihilar ground-glass opacities.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. pneumoniae", "Pneumocystis jirovecii", "CMV", "Cryptococcus"]', 1, 'A common opportunistic infection when CD4 < 200.'),
    (v_case_id, 'What is the first-line treatment?', '["Azithromycin", "Trimethoprim-Sulfamethoxazole (TMP-SMX)", "Vancomycin", "Fluconazole"]', 1, 'Bactrim is used for both treatment and prophylaxis.'),
    (v_case_id, 'When should adjunctive corticosteroids be added to the treatment?', '["Always", "If PaO2 < 70 mmHg or A-a gradient > 35", "Only if the patient has a fever", "Never"]', 1, 'Steroids reduce the inflammatory response that occurs when the organism dies, improving outcomes in severe cases.');

    -- CASE 22: Pulmonary Hypertension
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive Dyspnea and Loud P2', 'A 30-year-old female presents with progressive exertional dyspnea and near-syncope. On exam, she has a loud second heart sound (P2) and a prominent "a-wave" in her JVP. Echo shows a mean pulmonary artery pressure of 40 mmHg.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Pulmonary Hypertension?', '["Mean PAP > 20 mmHg at rest", "Systolic BP > 140", "Diastolic BP > 90", "Mean PAP < 10"]', 0, 'Measured via right heart catheterization.'),
    (v_case_id, 'Which of the following is a classic cause of Group 1 (Primary) Pulmonary Arterial Hypertension?', '["Heart failure", "COPD", "Connective Tissue Disease (e.g., Scleroderma) or Idiopathic", "Sleep apnea"]', 2, 'Group 1 is the primary disease of the vessels themselves.'),
    (v_case_id, 'What is the definitive diagnostic test?', '["Echo", "Right Heart Catheterization", "CXR", "ECG"]', 1, 'Required to confirm the pressure and calculate the PCWP.');

    -- CASE 23: Chronic Bronchitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Bloater', 'A 60-year-old male smoker presents with a productive cough that has occurred for at least 3 months each year for the last 2 years. He appears cyanotic and has peripheral edema.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical definition of Chronic Bronchitis?', '["Productive cough for 3 months in 2 consecutive years", "FEV1 < 50%", "Productive cough for 1 week", "Weight loss and dyspnea"]', 0, 'This is a clinical diagnosis, unlike emphysema which is pathological.'),
    (v_case_id, 'What is the primary histological change in the airways?', '["Alveolar destruction", "Hyperplasia of mucus-secreting glands (increased Reid Index)", "Granulomas", "Smooth muscle atrophy"]', 1, 'Reid index = thickness of glands / thickness of wall between epithelium and cartilage.'),
    (v_case_id, 'Which of the following is the most effective intervention to slow the decline of FEV1 in this patient?', '["Inhaled steroids", "Smoking cessation", "Antibiotics", "Oxygen"]', 1, 'Only smoking cessation and oxygen (in hypoxic patients) reduce mortality/decline.');

    -- CASE 24: Emphysema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pink Puffer', 'A 65-year-old male with a history of smoking presents with severe dyspnea and a thin, barrel-chested appearance. He is seen breathing through pursed lips. His cough is minimal and non-productive.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathological definition of Emphysema?', '["Mucus gland hyperplasia", "Permanent enlargement of airspaces distal to terminal bronchioles with destruction of walls", "Lung fibrosis", "Chronic infection"]', 1, 'Loss of elastic recoil and surface area for gas exchange.'),
    (v_case_id, 'Why does this patient breathe through pursed lips?', '["To look cool", "To increase airway pressure and prevent collapse of small airways during expiration", "To increase O2 intake", "To cough better"]', 1, 'Helps maintain positive end-expiratory pressure.'),
    (v_case_id, 'What is the characteristic PFT finding in emphysema?', '["Increased FEV1", "Decreased DLCO", "Increased FEV1/FVC", "Decreased TLC"]', 1, 'Loss of alveolar surface area leads to decreased diffusing capacity (DLCO).');

    -- CASE 25: Alpha-1 Antitrypsin Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Emphysema in a Young Non-Smoker', 'A 35-year-old non-smoker presents with dyspnea and wheezing. CXR shows severe emphysematous changes at the LUNG BASES. His brother has liver cirrhosis of unknown cause.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cystic Fibrosis", "Alpha-1 Antitrypsin (AAT) Deficiency", "Asthma", "Primary Ciliary Dyskinesia"]', 1, 'AAT deficiency causes early-onset panacinar emphysema, often at the bases.'),
    (v_case_id, 'What is the role of AAT in the lung?', '["Inhibits Neutrophil Elastase", "Produces mucus", "Promotes surfactant", "Inhibits bacteria"]', 0, 'Without AAT, elastase unchecked destroys the lung elastin.'),
    (v_case_id, 'How does the protein cause liver disease?', '["It is toxic to hepatocytes", "Misfolded protein accumulates in the ER of hepatocytes", "It causes liver infection", "It causes liver cancer directly"]', 1, 'The misfolded Z-protein is not secreted and becomes proteotoxic.');

    -- CASE 26: Silicosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sandblaster with Upper Lobe Nodules', 'A 50-year-old male who worked in sandblasting and rock mining for 20 years presents with progressive SOB. CXR shows small nodules in the upper lobes and eggshell calcification of the hilar lymph nodes.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Asbestosis", "Silicosis", "Berylliosis", "Sarcoidosis"]', 1, 'Sandblasting + eggshell calcification = Silicosis.'),
    (v_case_id, 'Silicosis significantly increases the risk of which infection?', '["Pneumonia", "Tuberculosis", "Flu", "Fungal infection"]', 1, 'Silica impairs macrophage function, making the patient vulnerable to mycobacteria.'),
    (v_case_id, 'Where are the lesions typically located in silicosis?', '["Lower lobes", "Upper lobes", "Hilus only", "Pleura"]', 1, 'Upper lobes are the primary site of involvement.');

    -- CASE 27: Asbestosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shipyard Worker with Lower Lobe Fibrosis', 'A 65-year-old retired shipyard worker presents with progressive dyspnea. CXR shows interstitial fibrosis at the bases and calcified pleural plaques along the diaphragms.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Silicosis", "Asbestosis", "Farmer''s lung", "Asthma"]', 1, 'Shipyard work + calcified pleural plaques = Asbestos exposure.'),
    (v_case_id, 'This patient is at the highest risk for which malignancy?', '["Mesothelioma", "Bronchogenic Carcinoma", "Colon cancer", "Leukemia"]', 1, 'While mesothelioma is the most SPECIFIC cancer for asbestos, bronchogenic carcinoma (lung cancer) is actually more COMMON in these patients, especially if they smoke.'),
    (v_case_id, 'What are the characteristic microscopic findings in the lung tissue?', '["Eggshell calcifications", "Ferruginous bodies (asbestos fibers coated with iron)", "Non-caseating granulomas", "Small blue cells"]', 1, 'Brown, dumbbell-shaped fibers.');

    -- CASE 28: Acute Bronchitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cough after a Viral Infection', 'A 25-year-old healthy female presents with a productive cough for 10 days. She has no fever, no SOB, and her lungs are clear on exam. She had a "head cold" last week.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Acute Bronchitis", "Asthma", "TB"]', 1, 'Acute cough (< 3 weeks) in a healthy person, often following a URI.'),
    (v_case_id, 'What is the primary cause of acute bronchitis?', '["Bacteria (S. pneumoniae)", "Viruses (e.g., Rhinovirus, Influenza)", "Smoking", "Fungi"]', 1, '> 90% of cases are viral.'),
    (v_case_id, 'What is the recommended treatment?', '["Azithromycin", "Symptomatic treatment (fluids, cough suppressants)", "Inhaled steroids", "Chest tube"]', 1, 'Antibiotics are NOT indicated for uncomplicated acute bronchitis.');

    -- CASE 29: Pulmonary Hypertension (Group 2 - Heart Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dyspnea and High PCWP', 'A 75-year-old male with chronic heart failure (LVEF 35%) presents with worsening SOB. Right heart catheterization shows a mean PAP of 35 mmHg and a Pulmonary Capillary Wedge Pressure (PCWP) of 22 mmHg.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classification of his pulmonary hypertension?', '["Group 1 (PAH)", "Group 2 (Left heart disease)", "Group 3 (Lung disease)", "Group 4 (CTEPH)"]', 1, 'High PCWP indicates that the pressure is coming from the left heart (post-capillary).'),
    (v_case_id, 'What is the primary treatment for Group 2 PH?', '["Sildenafil", "Optimization of heart failure management (Diuretics, GDMT)", "Bosentan", "Oxygen"]', 1, 'Treat the underlying heart disease; vasodilator drugs for PAH can actually worsen Group 2 PH.'),
    (v_case_id, 'Chronic Group 2 PH can eventually lead to:', '["Right Ventricular Hypertrophy and Failure", "Normal heart", "Lung cancer", "Anemia"]', 0, 'Persistent high back-pressure eventually damages the right ventricle.');

    -- CASE 30: Lung Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Foul Sputum and Air-Fluid Level', 'A 50-year-old male with chronic alcoholism and poor dentition is found passed out in the street. Two weeks later, he presents with fever and "foul-smelling" sputum. CXR shows a thick-walled cavity with an air-fluid level in the right lower lobe.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["TB", "Lung Abscess", "Squamous cell carcinoma", "Pneumonia"]', 1, 'Foul sputum + air-fluid level + aspiration risk (alcoholism/dentition) = Lung Abscess.'),
    (v_case_id, 'Which organisms are most commonly involved?', '["Anaerobes (from the mouth)", "S. aureus", "Pseudomonas", "Legionella"]', 0, 'Aspiration of oropharyngeal contents.'),
    (v_case_id, 'What is the standard treatment?', '["Surgical drainage", "Prolonged antibiotics (e.g., Clindamycin or Amp-Sulbactam)", "Chest tube", "Inhaled steroids"]', 1, 'Lung abscesses are usually treated with 4-6 weeks of systemic antibiotics.');

    RAISE NOTICE 'SUCCESS: Pulmonology Case Blocks (1-30) registered.';
END $$;

COMMIT;
