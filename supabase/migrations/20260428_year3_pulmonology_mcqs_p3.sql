-- Migration: Year 3 - Pulmonology MCQ Bank (PART 3: 161-240)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pulmonology' LIMIT 1;

    -- SECTION 17: COMMUNITY-ACQUIRED PNEUMONIA (CAP)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '161: What is the most common causative organism of Community-Acquired Pneumonia (CAP)?', '["Staphylococcus aureus", "Streptococcus pneumoniae", "Mycoplasma pneumoniae", "Haemophilus influenzae"]', 1, 'S. pneumoniae remains the #1 cause worldwide. (Harrison''s Ch. 134)'),
    (v_topic_id, '162: "Rusty" sputum is classic for pneumonia caused by:', '["Klebsiella", "Streptococcus pneumoniae", "Pseudomonas", "Legionella"]', 1, 'A classic clinical association. (Step-Up)'),
    (v_topic_id, '163: "Currant jelly" sputum is characteristic of which pathogen, often in alcoholics?', '["S. pneumoniae", "Klebsiella pneumoniae", "Mycoplasma", "Legionella"]', 1, 'Thick, bloody mucus seen in Klebsiella infections. (Pocket Medicine)'),
    (v_topic_id, '164: Which pathogen is the most common cause of "Atypical" (walking) pneumonia in young adults?', '["S. aureus", "Mycoplasma pneumoniae", "Chlamydia pneumoniae", "Legionella"]', 1, 'Often presents with low-grade fever and non-productive cough. (Harrison''s Ch. 134)'),
    (v_topic_id, '165: The CURB-65 score is used to decide:', '["Which antibiotic to use", "Whether to admit a patient with CAP", "The type of oxygen needed", "Risk of lung cancer"]', 1, 'Confusion, Urea, RR, BP, and Age > 65. (Step-Up)'),
    (v_topic_id, '166: A patient with CAP who also has diarrhea, hyponatremia, and high fever should be suspected of:', '["S. pneumoniae", "Legionella pneumophila", "Mycoplasma", "Influenza"]', 1, 'Legionella often presents with multi-system symptoms. (Pocket Medicine)'),
    (v_topic_id, '167: What is the preferred treatment for an outpatient with CAP and NO comorbidities?', '["Amoxicillin or Doxycycline or Macrolide", "Vancomycin", "Ciprofloxacin", "Gentamicin"]', 0, 'First-line options for uncomplicated CAP. (Harrison''s Ch. 134)'),
    (v_topic_id, '168: Pneumonia following an influenza infection is most likely caused by:', '["Mycoplasma", "Staphylococcus aureus", "Legionella", "Klebsiella"]', 1, 'S. aureus (often MRSA) is a classic post-viral invader. (Pocket Medicine)'),
    (v_topic_id, '169: "Air bronchograms" on a Chest X-ray are a sign of:', '["Asthma", "Consolidation (Pneumonia)", "Pneumothorax", "Pleural effusion"]', 1, 'Visible air-filled bronchi within opaque (fluid-filled) lung. (Step-Up)'),
    (v_topic_id, '170: Hospital-Acquired Pneumonia (HAP) is defined as occurring how long after admission?', '["6 hours", "12 hours", ">= 48 hours", "1 week"]', 2, 'Distinguished from CAP by time of onset. (Harrison''s Ch. 134)');

    -- SECTION 18: TUBERCULOSIS (TB)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '171: Mycobacterium tuberculosis is best visualized using which stain?', '["Gram stain", "Ziehl-Neelsen (Acid-Fast) stain", "Silver stain", "Giemsa stain"]', 1, 'Due to the high lipid (mycolic acid) content of the cell wall. (Harrison''s Ch. 182)'),
    (v_topic_id, '172: "Ghon complex" in primary TB consists of a peripheral calcified nodule and:', '["Hilar lymph node calcification", "Cavity in the apex", "Pleural effusion", "Liver abscess"]', 0, 'Sign of initial infection. (Step-Up)'),
    (v_topic_id, '173: Reactivation (Secondary) TB typically affects which part of the lung?', '["Lower lobes", "Apical/Posterior segments of the Upper Lobes", "Middle lobe", "Hila"]', 1, 'High O2 tension in the apices favors TB growth. (Pocket Medicine)'),
    (v_topic_id, '174: A positive PPD (Mantoux) test in a healthy individual with NO risk factors is defined as induration >=:', '["5 mm", "10 mm", "15 mm", "20 mm"]', 2, 'Thresholds vary by risk group (5mm for HIV+, 10mm for healthcare workers). (Step-Up)'),
    (v_topic_id, '175: What is the "standard" 4-drug regimen for active TB (RIPE)?', '["Rifampin, Insulin, Penicillin, Ethambutol", "Rifampin, Isoniazid, Pyrazinamide, Ethambutol", "Rifampin, Isoniazid, Penicillin, Erythromycin", "None"]', 1, 'The foundational RIPE regimen. (Harrison''s Ch. 182)'),
    (v_topic_id, '176: Which TB medication can cause orange/red discoloration of bodily fluids?', '["Isoniazid", "Rifampin", "Pyrazinamide", "Ethambutol"]', 1, 'A harmless but alarming side effect. (Pocket Medicine)'),
    (v_topic_id, '177: Vitamin B6 (Pyridoxine) is given with Isoniazid to prevent:', '["Liver failure", "Peripheral neuropathy", "Blindness", "Kidney stones"]', 1, 'Isoniazid promotes excretion of B6. (Step-Up)'),
    (v_topic_id, '178: Which TB medication is most associated with optic neuritis and red-green color blindness?', '["Rifampin", "Isoniazid", "Pyrazinamide", "Ethambutol"]', 3, '"E" for "Eyes." Requires baseline and serial vision checks. (Pocket Medicine)'),
    (v_topic_id, '179: "Miliary TB" refers to:', '["TB of the bone", "Hematogenous spread of TB resulting in small grain-like seeds throughout the body", "TB of the skin", "Multidrug resistant TB"]', 1, 'A severe, disseminated form. (Harrison''s Ch. 182)'),
    (v_topic_id, '180: "Pott''s Disease" is TB affecting the:', '["Kidneys", "Spine", "Adrenals", "Brain"]', 1, 'Tuberculous spondylitis. (Step-Up)');

    -- SECTION 19: LUNG CANCER
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: What is the leading cause of cancer-related death in both men and women?', '["Breast Cancer", "Prostate Cancer", "Lung Cancer", "Colon Cancer"]', 2, 'Lung cancer remains the #1 killer among malignancies. (Harrison''s Ch. 86)'),
    (v_topic_id, '182: Which type of lung cancer is most common in NON-smokers and women?', '["Squamous Cell Carcinoma", "Adenocarcinoma", "Small Cell Carcinoma", "Large Cell"]', 1, 'Adenocarcinoma is now the most frequent overall type. (Step-Up)'),
    (v_topic_id, '183: Which type of lung cancer is most strongly associated with smoking and central (hilar) location?', '["Adenocarcinoma", "Small Cell and Squamous Cell", "Large Cell", "Mesothelioma"]', 1, '"S" for Smoking, Central, and Squamous/Small Cell. (Pocket Medicine)'),
    (v_topic_id, '184: "Pancoast tumors" are apical lung cancers that can cause:', '["Horner Syndrome", "Hoarseness", "Diaphragm paralysis", "All of the above"]', 3, 'Due to local invasion of sympathetic chain, laryngeal nerve, and phrenic nerve. (Step-Up)'),
    (v_topic_id, '185: "Small Cell Lung Cancer" (SCLC) is unique because it is usually treated with:', '["Surgery alone", "Chemotherapy and Radiation (not surgery)", "Observation", "Antibiotics"]', 1, 'SCLC is almost always metastatic at diagnosis and highly chemo-sensitive. (Harrison''s Ch. 86)'),
    (v_topic_id, '186: "Lambert-Eaton Myasthenic Syndrome" is a paraneoplastic syndrome associated with:', '["Squamous Cell", "Small Cell Lung Cancer", "Adenocarcinoma", "Large Cell"]', 1, 'Autoantibodies against presynaptic voltage-gated calcium channels. (Pocket Medicine)'),
    (v_topic_id, '187: Hypercalcemia (due to PTHrP production) is most common in which lung cancer?', '["Small Cell", "Squamous Cell Carcinoma", "Adenocarcinoma", "Carcinoid"]', 1, '"S"quamous for "S"tones (Hypercalcemia). (Step-Up)'),
    (v_topic_id, '188: "SIADH" and "Cushing Syndrome" (ectopic ACTH) are paraneoplastic syndromes of:', '["Squamous Cell", "Small Cell Lung Cancer", "Adenocarcinoma", "Mesothelioma"]', 1, 'SCLC is a neuroendocrine tumor that secretes various hormones. (Harrison''s Ch. 86)'),
    (v_topic_id, '189: A "Solitary Pulmonary Nodule" is defined as a lesion <:', '["1 cm", "3 cm", "5 cm", "10 cm"]', 1, 'Lesions > 3cm are called "masses" and are more likely malignant. (Pocket Medicine)'),
    (v_topic_id, '190: What is the current screening recommendation for lung cancer in high-risk smokers?', '["Yearly Chest X-ray", "Yearly Low-Dose CT (LDCT)", "Sputum cytology", "None"]', 1, 'For ages 50-80 with a 20+ pack-year history. (Harrison''s Ch. 86)');

    -- SECTION 20: PLEURAL EFFUSION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '191: "Light''s Criteria" are used to distinguish between:', '["Cancer and Infection", "Transudate and Exudate", "Pneumonia and TB", "Asthma and COPD"]', 1, 'Based on protein and LDH levels in the pleural fluid. (Harrison''s Ch. 293)'),
    (v_topic_id, '192: Which of the following is a classic cause of TRANSUDATIVE pleural effusion?', '["Pneumonia", "Heart Failure", "Lung Cancer", "Pulmonary Embolism"]', 1, 'Due to changes in hydrostatic or oncotic pressure. (Step-Up)'),
    (v_topic_id, '193: According to Light''s Criteria, an EXUDATE has a fluid-to-serum protein ratio of >:', '["0.1", "0.2", "0.5", "0.9"]', 2, 'Also fluid LDH > 2/3 the upper limit of normal serum LDH. (Pocket Medicine)'),
    (v_topic_id, '194: "Empyema" is defined as:', '["Clear pleural fluid", "Pus in the pleural space", "Blood in the pleural space", "Air in the pleural space"]', 1, 'Requires drainage for effective treatment. (Harrison''s Ch. 293)'),
    (v_topic_id, '195: A "pleural fluid pH < 7.2" is an indication for:', '["Urgent thoracostomy (Chest tube)", "Observation", "Wait for culture", "High-dose steroids"]', 0, 'Indicates a complicated parapneumonic effusion likely to loculate. (Pocket Medicine)'),
    (v_topic_id, '196: Chylothorax (milky fluid) is caused by leakage from the:', '["Thoracic duct", "Aorta", "Pulmonary vein", "Bronchus"]', 0, 'High triglyceride levels (>110 mg/dL). (Step-Up)'),
    (v_topic_id, '197: Hemothorax is defined by a pleural fluid hematocrit >:', '["10% of serum", "50% of serum", "100% of serum", "5% of serum"]', 1, 'Usually due to trauma. (Harrison''s Ch. 293)'),
    (v_topic_id, '198: The most common cause of EXUDATIVE pleural effusion worldwide is:', '["Heart failure", "Pneumonia", "Malignancy", "Tuberculosis"]', 1, 'Malignancy and TB are other major causes. (Pocket Medicine)'),
    (v_topic_id, '199: "Pleurodesis" (using talc or doxycycline) is used to:', '["Drain fluid", "Obliterate the pleural space to prevent recurrent effusions", "Inject antibiotics", "None"]', 1, 'Often used for malignant effusions. (Step-Up)'),
    (v_topic_id, '200: "Meniscus sign" on a Chest X-ray is characteristic of:', '["Pneumothorax", "Pleural Effusion", "Pneumonia", "Lung Cancer"]', 1, 'The upward-curving border of fluid against the lung. (Harrison''s Ch. 285)');

    -- SECTION 21: PNEUMOTHORAX
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '201: "Primary spontaneous pneumothorax" is most common in:', '["Elderly smokers", "Tall, thin young males", "Infants", "Women during menses"]', 1, 'Often due to rupture of subpleural apical blebs. (Step-Up)'),
    (v_topic_id, '202: "Tension pneumothorax" is a medical emergency because it causes:', '["Severe pain", "Mediastinal shift and obstruction of venous return to the heart", "Fever", "Coughing up blood"]', 1, 'Leads to rapid obstructive shock. (Harrison''s Ch. 293)'),
    (v_topic_id, '203: What is the immediate treatment for a suspected TENSION pneumothorax?', '["Wait for Chest X-ray", "Needle decompression (2nd ICS, MCL)", "Intubation", "Antibiotics"]', 1, 'Followed by a formal chest tube. (Pocket Medicine)'),
    (v_topic_id, '204: A "Catamenial pneumothorax" is associated with:', '["Smoking", "Endometriosis of the pleura", "Trauma", "Diving"]', 1, 'Occurs in conjunction with the menstrual cycle. (Harrison''s Ch. 293)'),
    (v_topic_id, '205: "Deep sulcus sign" on a supine Chest X-ray is a sign of:', '["Pneumonia", "Pneumothorax", "Heart failure", "Liver disease"]', 1, 'Air accumulating in the costophrenic angle. (Step-Up)'),
    (v_topic_id, '206: "Secondary spontaneous pneumothorax" is most often due to:', '["COPD/Emphysema", "Pneumonia", "Cancer", "Asthma"]', 0, 'Rupture of bullae in diseased lung. (Harrison''s Ch. 293)'),
    (v_topic_id, '207: Which procedure can be used to prevent recurrent pneumothorax?', '["VATS with pleurodesis/bullectomy", "Thoracentesis", "Bronchoscopy", "Steroids"]', 0, 'Recommended after a second episode or first tension episode. (Pocket Medicine)'),
    (v_topic_id, '208: "Iatrogenic pneumothorax" can be caused by:', '["Central line placement", "Thoracentesis", "Positive pressure ventilation", "All of the above"]', 3, 'Complication of various medical interventions. (Step-Up)'),
    (v_topic_id, '209: On physical exam, a pneumothorax will show:', '["Dullness to percussion", "Hyperresonance to percussion and absent breath sounds", "Increased fremitus", "Crackles"]', 1, 'Air in the pleural space increases resonance. (Step-Up)'),
    (v_topic_id, '210: Spontaneous pneumomediastinum is often associated with:', '["Smoking", "Severe vomiting (Boerhaave) or Valsalva", "Pneumonia", "Lung cancer"]', 1, 'Air escaping from the lung into the mediastinum. (Pocket Medicine)');

    -- SECTION 22: OPPORTUNISTIC & FUNGAL INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '211: "Pneumocystis jirovecii" pneumonia (PCP) is most common in patients with:', '["COPD", "HIV/AIDS (CD4 < 200)", "Diabetes", "Old age"]', 1, 'An AIDS-defining illness. (Harrison''s Ch. 210)'),
    (v_topic_id, '212: What is the first-line treatment for PCP?', '["Vancomycin", "Trimethoprim-Sulfamethoxazole (TMP-SMX)", "Fluconazole", "Ceftriaxone"]', 1, 'Bactrim is the mainstay. (Step-Up)'),
    (v_topic_id, '213: "Fungus ball" (Aspergilloma) typically develops in:', '["Healthy lungs", "Pre-existing lung cavities (e.g., from old TB)", "Upper airways", "Pleural space"]', 1, 'Colonization of a pre-existing space. (Harrison''s Ch. 211)'),
    (v_topic_id, '214: Which fungal infection is endemic to the Ohio and Mississippi River Valleys?', '["Coccidioidomycosis", "Histoplasmosis", "Blastomycosis", "Cryptococcosis"]', 1, 'Associated with bird and bat droppings. (Step-Up)'),
    (v_topic_id, '215: "Valley Fever" is another name for:', '["Histoplasmosis", "Coccidioidomycosis", "Blastomycosis", "TB"]', 1, 'Endemic to the Southwestern US. (Pocket Medicine)'),
    (v_topic_id, '216: Which fungal infection is associated with broad-based budding yeast?', '["Histoplasma", "Blastomycosis", "Coccidioides", "Aspergillus"]', 1, '"B" for "B"road-based "B"udding "B"lasto. (Harrison''s Ch. 209)'),
    (v_topic_id, '217: "Halo sign" on Chest CT in an immunocompromised patient is classic for:', '["Bacterial pneumonia", "Invasive Pulmonary Aspergillosis", "Lung cancer", "PE"]', 1, 'Represents hemorrhage surrounding a nodule. (Harrison''s Ch. 211)'),
    (v_topic_id, '218: Cryptococcosis is most commonly diagnosed using:', '["Gram stain", "Serum/CSF Cryptococcal Antigen", "Urine culture", "Stool test"]', 1, 'Highly sensitive and specific. (Step-Up)'),
    (v_topic_id, '219: What is the preferred treatment for severe systemic fungal infections?', '["Fluconazole", "Amphotericin B", "Amoxicillin", "Metronidazole"]', 1, 'Often followed by azole "step-down" therapy. (Pocket Medicine)'),
    (v_topic_id, '220: Pneumonia in a transplant patient occurring in the first month is usually:', '["Opportunistic", "Bacterial (similar to post-op CAP/HAP)", "CMV", "Fungal"]', 1, 'The type of infection depends on the time since transplant. (Harrison''s Ch. 134)');

    -- SECTION 23: VIRAL PNEUMONIAS & MISC INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '221: Which virus is the most common cause of bronchiolitis in children?', '["Influenza", "Respiratory Syncytial Virus (RSV)", "Adenovirus", "Rhinovirus"]', 1, 'Major cause of respiratory hospitalization in infants. (Step-Up)'),
    (v_topic_id, '222: "CMV Pneumonitis" is a major concern in which population?', '["Smokers", "Post-transplant patients", "Diabetes", "Pregnant women"]', 1, 'Characterized by "owl''s eye" inclusions on pathology. (Harrison''s Ch. 134)'),
    (v_topic_id, '223: What is the most common complication of Influenza?', '["Liver failure", "Secondary bacterial pneumonia", "Diabetes", "Deafness"]', 1, 'Often caused by S. pneumoniae or S. aureus. (Pocket Medicine)'),
    (v_topic_id, '224: "Hantavirus Pulmonary Syndrome" is transmitted via:', '["Mosquitoes", "Rodent droppings/urine", "Birds", "Water"]', 1, 'Causes rapid-onset ARDS. (Harrison''s Ch. 195)'),
    (v_topic_id, '225: "Legionnaires'' Disease" is famously transmitted via:', '["Aerosolized water (e.g., AC systems, showers)", "Tick bites", "Food", "Blood"]', 0, 'Gram-negative rod that thrives in warm water. (Step-Up)'),
    (v_topic_id, '226: "Psittacosis" (Parrot Fever) is caused by:', '["Chlamydia psittaci", "Mycoplasma", "Mycobacterium", "RSV"]', 0, 'History of exposure to birds is the key. (Harrison''s Ch. 134)'),
    (v_topic_id, '227: What is the best initial test for suspected pulmonary TB?', '["Sputum AFB smear and culture", "Chest X-ray", "PPD test", "Blood culture"]', 1, 'Usually the first step to look for infiltrates or cavities. (Pocket Medicine)'),
    (v_topic_id, '228: "Nucleic Acid Amplification Test" (NAAT) for TB is helpful because it:', '["Is cheaper than smear", "Can rapidly identify M. tb and rifampin resistance", "Replaces culture", "Is a blood test"]', 1, 'Provides results in hours instead of weeks. (Harrison''s Ch. 182)'),
    (v_topic_id, '229: Sputum induction using nebulized saline is used when:', '["The patient is coughing too much", "The patient cannot produce enough sputum for testing", "To treat asthma", "None"]', 1, 'Necessary for diagnosing TB or PCP in some patients. (Step-Up)'),
    (v_topic_id, '230: Which antibiotic should be added to CAP coverage if MRSA is suspected?', '["Ceftriaxone", "Vancomycin or Linezolid", "Azithromycin", "Levofloxacin"]', 1, 'Standard CAP coverage does not include MRSA. (Pocket Medicine)');

    -- SECTION 24: LUNG ABSCESS & ANAEROBES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '231: Lung abscesses are most commonly caused by:', '["Viruses", "Aspiration of anaerobic oral flora", "TB", "Cancer"]', 1, 'Often seen in patients with poor dentition or altered consciousness. (Harrison''s Ch. 134)'),
    (v_topic_id, '232: An "Air-fluid level" on a Chest X-ray is the hallmark of:', '["Asthma", "Lung Abscess", "Pleural effusion", "Atelectasis"]', 1, 'Indicates a cavity containing both pus and gas. (Step-Up)'),
    (v_topic_id, '233: Lung abscesses due to aspiration are most often found in which part of the lung?', '["Apices", "Superior segment of the lower lobe (when supine)", "Middle lobe", "Anterior upper lobe"]', 1, 'Depends on the patient''s position during the aspiration event. (Pocket Medicine)'),
    (v_topic_id, '234: What is the preferred antibiotic treatment for a lung abscess?', '["Ceftriaxone", "Clindamycin or Ampicillin-Sulbactam (Unasyn)", "Ciprofloxacin", "Azithromycin"]', 1, 'Requires coverage for oral anaerobes. (Harrison''s Ch. 134)'),
    (v_topic_id, '235: Aspiration pneumonia differs from aspiration pneumonitis because it involves:', '["Acid burn", "Bacterial infection", "Foreign body", "Tumor"]', 1, 'Pneumonitis is chemical; pneumonia is infectious. (Step-Up)'),
    (v_topic_id, '236: "Lemierre Syndrome" involves septic thrombophlebitis of the jugular vein and metastatic abscesses in the:', '["Brain", "Lungs", "Liver", "Spleen"]', 1, 'Usually caused by Fusobacterium necrophorum. (Harrison''s Ch. 134)'),
    (v_topic_id, '237: Chronic lung abscesses can sometimes mimic:', '["Asthma", "Lung Cancer (Cavitary)", "Heart failure", "PE"]', 1, 'Both can present with a thick-walled cavity on imaging. (Pocket Medicine)'),
    (v_topic_id, '238: What is the most common reason for a "foul-smelling" sputum?', '["S. pneumoniae", "Anaerobic infection", "Viral infection", "TB"]', 1, 'Characteristic feature of anaerobic lung infections. (Harrison''s Ch. 33)'),
    (v_topic_id, '239: Percutaneous drainage of a lung abscess is:', '["Always required", "Rarely required and usually avoided (unlike empyema)", "The first-line treatment", "Dangerous"]', 1, 'Most respond well to prolonged antibiotics alone. (Pocket Medicine)'),
    (v_topic_id, '240: "Broncholithiasis" refers to:', '["Stone in the bronchus (usually a calcified lymph node eroding into the airway)", "A type of cancer", "Pneumonia", "Asthma"]', 0, 'Can cause obstructive symptoms and hemoptysis. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Pulmonology MCQ Part 3 (161-240) registered.';
END $$;

COMMIT;
