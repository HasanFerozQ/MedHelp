-- Migration: Year 3 - Pulmonology MCQ Bank (PART 1: 1-80)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pulmonology' LIMIT 1;

    -- SECTION 1: PULMONARY ANATOMY & PHYSIOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: Which cell type in the alveoli is primarily responsible for surfactant production?', '["Type I Pneumocyte", "Type II Pneumocyte", "Alveolar Macrophage", "Goblet Cell"]', 1, 'Type II pneumocytes produce surfactant to reduce surface tension. (Harrison''s Ch. 284)'),
    (v_topic_id, '2: What is the primary anatomical landmark for the bifurcation of the trachea (Carina)?', '["C6 vertebra", "T4/T5 (Sternal angle)", "T7 vertebra", "Xiphoid process"]', 1, 'The trachea bifurcates at the level of the sternal angle of Louis. (Step-Up)'),
    (v_topic_id, '3: Which lung has three lobes and a more vertical primary bronchus?', '["Left Lung", "Right Lung", "Both are symmetrical", "Depends on the individual"]', 1, 'The right lung has 3 lobes; its bronchus is wider and more vertical. (Pocket Medicine)'),
    (v_topic_id, '4: "Dead space" refers to the volume of air that:', '["Participates in gas exchange", "Does not participate in gas exchange", "Is left in the lungs after maximal expiration", "Is inhaled during a normal breath"]', 1, 'Anatomical dead space includes the conducting airways. (Harrison''s Ch. 284)'),
    (v_topic_id, '5: Which nerve provides motor innervation to the diaphragm?', '["Vagus Nerve", "Phrenic Nerve (C3-C5)", "Intercostal Nerves", "Glossopharyngeal Nerve"]', 1, '"C3, 4, 5 keep the diaphragm alive." (Step-Up)'),
    (v_topic_id, '6: What is the primary driver of respiration in a healthy individual?', '["Low O2", "High CO2 (Hypercapnia)", "High pH", "Low Nitrogen"]', 1, 'Central chemoreceptors are primarily sensitive to changes in CO2/pH. (Harrison''s Ch. 284)'),
    (v_topic_id, '7: The "Hypoxic Pulmonary Vasoconstriction" reflex is unique because:', '["It dilates vessels in response to low O2", "It constricts vessels in response to low O2 to shunt blood to better ventilated areas", "It only happens in the heart", "It is controlled by the brain"]', 1, 'This mechanism optimizes ventilation-perfusion (V/Q) matching. (Pocket Medicine)'),
    (v_topic_id, '8: Functional Residual Capacity (FRC) is the sum of:', '["Tidal Volume + IRV", "Expiratory Reserve Volume + Residual Volume", "Vital Capacity + RV", "Inspiratory Capacity + ERV"]', 1, 'FRC is the volume left in lungs after a normal expiration. (Harrison''s Ch. 284)'),
    (v_topic_id, '9: Which zone of the lung (West Zones) has the highest Ventilation-Perfusion (V/Q) ratio?', '["Zone 1 (Apex)", "Zone 2 (Mid)", "Zone 3 (Base)", "They are all equal"]', 0, 'Ventilation and perfusion both increase toward the base, but perfusion increases more. (Harrison''s Ch. 284)'),
    (v_topic_id, '10: A "Right shift" in the Oxygen-Hemoglobin dissociation curve is caused by:', '["Decreased CO2", "Decreased Temperature", "Increased 2,3-BPG", "Increased pH"]', 2, 'Increased 2,3-BPG, CO2, Temp, and H+ (low pH) shift the curve right, favoring O2 unloading. (Step-Up)');

    -- SECTION 2: PULMONARY FUNCTION TESTING (PFTs)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: What is the hallmark PFT finding in OBSTRUCTIVE lung disease?', '["Decreased FVC", "Decreased FEV1/FVC ratio (<0.7)", "Increased FEV1/FVC ratio", "Decreased Total Lung Capacity"]', 1, 'Obstruction slows airflow, disproportionately reducing FEV1. (Harrison''s Ch. 285)'),
    (v_topic_id, '12: In RESTRICTIVE lung disease, the FEV1/FVC ratio is typically:', '["Decreased", "Normal or Increased", "Zero", "Unpredictable"]', 1, 'Both FEV1 and FVC decrease, so the ratio remains normal or high. (Step-Up)'),
    (v_topic_id, '13: Which measurement cannot be determined by simple spirometry?', '["Tidal Volume", "Residual Volume (RV)", "Inspiratory Reserve Volume", "Vital Capacity"]', 1, 'RV and any capacity including it (FRC, TLC) require plethysmography or gas dilution. (Harrison''s Ch. 285)'),
    (v_topic_id, '14: A positive "Bronchodilator Reversibility" test is defined as an increase in FEV1 of:', '[">5% and >100mL", ">12% and >200mL", ">20% and >500mL", ">50%"]', 1, 'This suggests a reversible component, characteristic of asthma. (Pocket Medicine)'),
    (v_topic_id, '15: Diffusion Capacity (DLCO) is characteristically DECREASED in which condition?', '["Asthma", "Emphysema", "Chronic Bronchitis", "Obesity"]', 1, 'Emphysema involves destruction of the alveolar-capillary membrane. (Harrison''s Ch. 285)'),
    (v_topic_id, '16: A "Scooped-out" appearance on the flow-volume loop is characteristic of:', '["Restriction", "Obstruction", "Fixed upper airway obstruction", "Normal variant"]', 1, 'Reflects decreased expiratory flow at lower lung volumes. (Step-Up)'),
    (v_topic_id, '17: Which PFT parameter is the best indicator of early small airway disease?', '["FVC", "FEV1", "FEF 25-75%", "PEF"]', 2, 'Mid-expiratory flow reflects the status of small airways. (Pocket Medicine)'),
    (v_topic_id, '18: An INCREASED Total Lung Capacity (TLC) and Residual Volume (RV) suggests:', '["Fibrosis", "Air trapping/Hyperinflation", "Chest wall deformity", "Neuromuscular weakness"]', 1, 'Seen in obstructive diseases like emphysema. (Harrison''s Ch. 285)'),
    (v_topic_id, '19: Methacholine challenge is used to diagnose:', '["COPD", "Bronchial Hyperreactivity (Asthma)", "Pneumonia", "Lung Cancer"]', 1, 'A 20% drop in FEV1 at low doses is positive. (Step-Up)'),
    (v_topic_id, '20: DLCO is typically INCREASED in:', '["Anemia", "Pulmonary hemorrhage", "Pulmonary embolism", "Idiopathic Pulmonary Fibrosis"]', 1, 'Alveolar blood binds CO, falsely elevating the measured diffusion. (Pocket Medicine)');

    -- SECTION 3: ASTHMA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: Which antibody class is most central to the pathogenesis of Atopic Asthma?', '["IgG", "IgM", "IgE", "IgA"]', 2, 'IgE-mediated mast cell degranulation is the classic pathway. (Harrison''s Ch. 287)'),
    (v_topic_id, '22: "Curschmann spirals" and "Charcot-Leyden crystals" in sputum are suggestive of:', '["COPD", "Asthma", "Tuberculosis", "Bronchiectasis"]', 1, 'Microscopic hallmarks of eosinophilic inflammation in asthma. (Step-Up)'),
    (v_topic_id, '23: What is the preferred "Step 1" controller therapy for mild intermittent asthma in the latest GINA guidelines?', '["SABA as needed", "Low-dose ICS-Formoterol as needed", "Daily high-dose ICS", "Theophylline"]', 1, 'The 2024-2025 guidelines favor as-needed ICS-Formoterol over SABA monotherapy. (Harrison''s Ch. 287)'),
    (v_topic_id, '24: A patient with asthma presents with a "normal" PaCO2 during an acute exacerbation. This is a sign of:', '["Improvement", "Impending respiratory failure", "Effective compensation", "Hyperventilation"]', 1, 'A normal or high PaCO2 suggests the patient is tiring and can no longer blow off CO2. (Pocket Medicine)'),
    (v_topic_id, '25: "Samter''s Triad" includes asthma, nasal polyps, and sensitivity to:', '["Peanuts", "Aspirin/NSAIDs", "Penicillin", "Latex"]', 1, 'Aspirin-exacerbated respiratory disease (AERD). (Step-Up)'),
    (v_topic_id, '26: Which of the following is a long-term side effect of inhaled corticosteroids (ICS)?', '["Weight gain", "Oral Candidiasis (Thrush)", "Liver failure", "Hair loss"]', 1, 'Rinsing the mouth after use reduces the risk. (Pocket Medicine)'),
    (v_topic_id, '27: "Status Asthmaticus" refers to:', '["Mild asthma", "Severe asthma unresponsive to standard bronchodilators", "Occupational asthma", "Exercise-induced asthma"]', 1, 'A medical emergency requiring aggressive management. (Harrison''s Ch. 287)'),
    (v_topic_id, '28: Pulsus paradoxus (>10mmHg drop in SBP on inspiration) in asthma indicates:', '["Mild disease", "Severe airway obstruction", "Pneumothorax", "Normal finding"]', 1, 'Reflects extreme negative intrapleural pressures. (Pocket Medicine)'),
    (v_topic_id, '29: Which biologic agent targets IL-5 and is used for severe eosinophilic asthma?', '["Omalizumab", "Mepolizumab", "Dupilumab", "Rituximab"]', 1, 'Mepolizumab and Benralizumab target the IL-5 pathway. (Harrison''s Ch. 287)'),
    (v_topic_id, '30: Occupational asthma due to isocyanates is common in which industry?', '["Mining", "Spray painting/Auto body", "Baking", "Healthcare"]', 1, 'Isocyanates are a major cause of sensitizer-induced asthma. (Step-Up)');

    -- SECTION 4: COPD (CHRONIC BRONCHITIS & EMPHYSEMA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: Chronic Bronchitis is clinically defined as a productive cough for at least:', '["1 month", "3 months in 2 consecutive years", "6 months", "1 year"]', 1, 'A clinical definition based on mucus hypersecretion. (Harrison''s Ch. 286)'),
    (v_topic_id, '32: "Panacinar emphysema" is classically associated with which condition?', '["Smoking", "Alpha-1 Antitrypsin Deficiency", "Coal workers pneumoconiosis", "Asthma"]', 1, 'Smoking-related emphysema is typically centriacinar (upper lobes). (Step-Up)'),
    (v_topic_id, '33: What is the single most important intervention to slow the progression of COPD?', '["Oxygen therapy", "Smoking cessation", "Inhaled steroids", "Theophylline"]', 1, 'Only smoking cessation and long-term O2 (in specific cases) improve mortality. (Harrison''s Ch. 286)'),
    (v_topic_id, '34: "Pink puffers" (Emphysema) tend to be thin and hyperventilate, while "Blue bloaters" (Bronchitis) tend to have:', '["Weight loss", "Cyanosis and right heart failure (Cor Pulmonale)", "Low hemoglobin", "Clear lungs"]', 1, 'Reflects the difference in V/Q matching and CO2 retention. (Pocket Medicine)'),
    (v_topic_id, '35: What is the criteria for Long-Term Oxygen Therapy (LTOT) in COPD patients?', '["PaO2 < 80 mmHg", "PaO2 <= 55 mmHg or SaO2 <= 88%", "PaO2 < 70 mmHg", "SaO2 < 92%"]', 1, 'Proven mortality benefit for patients meeting these thresholds. (Harrison''s Ch. 286)'),
    (v_topic_id, '36: Which GOLD group (2023-2024 update) includes patients with high symptoms and high risk of exacerbations?', '["Group A", "Group B", "Group E", "Group D"]', 2, 'Group E (Exacerbations) replaced C and D in the latest update. (Pocket Medicine)'),
    (v_topic_id, '37: What is the first-line maintenance therapy for a symptomatic COPD patient (Group B)?', '["LAMA or LABA", "SABA alone", "ICS alone", "Antibiotics"]', 0, 'Long-acting bronchodilators are superior to short-acting ones for maintenance. (Harrison''s Ch. 286)'),
    (v_topic_id, '38: "Barrel chest" on physical exam is due to:', '["Lung fibrosis", "Air trapping and hyperinflation", "Pleural effusion", "Kyphosis"]', 1, 'Increased A-P diameter of the chest wall. (Step-Up)'),
    (v_topic_id, '39: Which bacterium is the most common cause of acute exacerbation of COPD (AECOPD)?', '["S. pneumoniae", "H. influenzae", "M. catarrhalis", "All of the above"]', 3, 'These three are the most frequently isolated pathogens. (Pocket Medicine)'),
    (v_topic_id, '40: The use of inhaled corticosteroids (ICS) in COPD is associated with an increased risk of:', '["Lung cancer", "Pneumonia", "Stroke", "Diabetes"]', 1, 'While they reduce exacerbations, they carry a small pneumonia risk. (Harrison''s Ch. 286)');

    -- SECTION 5: BRONCHIECTASIS & CYSTIC FIBROSIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: Bronchiectasis is characterized by:', '["Reversible airway narrowing", "Permanent dilation and destruction of large bronchi", "Alveolar collapse", "Pleural thickening"]', 1, 'Often due to a cycle of chronic infection and inflammation. (Harrison''s Ch. 288)'),
    (v_topic_id, '42: "Tram track" lines on a Chest X-ray are suggestive of:', '["Pneumonia", "Bronchiectasis", "Pulmonary edema", "Pneumothorax"]', 1, 'Represent thickened walls of dilated bronchi. (Step-Up)'),
    (v_topic_id, '43: What is the gold standard diagnostic test for bronchiectasis?', '["Spirometry", "High-Resolution CT (HRCT)", "Chest X-ray", "Bronchoscopy"]', 1, 'Shows the "signet ring" sign of dilated bronchi. (Harrison''s Ch. 288)'),
    (v_topic_id, '44: Cystic Fibrosis is caused by a mutation in a protein that transports:', '["Sodium", "Chloride", "Calcium", "Potassium"]', 1, 'The CFTR protein is a cAMP-regulated chloride channel. (Step-Up)'),
    (v_topic_id, '45: What is the most common pathogen in the lungs of ADULT patients with Cystic Fibrosis?', '["Staph aureus", "Pseudomonas aeruginosa", "Burkholderia cepacia", "Aspergillus"]', 1, 'Pseudomonas colonization is a hallmark of progressive CF lung disease. (Pocket Medicine)'),
    (v_topic_id, '46: Which diagnostic test is the gold standard for Cystic Fibrosis?', '["Fasting glucose", "Sweat Chloride test (>60 mEq/L)", "Sputum culture", "Chest MRI"]', 1, 'Reflects the inability to reabsorb chloride in sweat ducts. (Harrison''s Ch. 289)'),
    (v_topic_id, '47: "Allergic Bronchopulmonary Aspergillosis" (ABPA) is common in which two conditions?', '["COPD and Cancer", "Asthma and Cystic Fibrosis", "Pneumonia and TB", "Sarcoidosis and IPF"]', 1, 'Hypersensitivity to Aspergillus colonizing the airways. (Harrison''s Ch. 288)'),
    (v_topic_id, '48: Which vitamin deficiencies are common in Cystic Fibrosis due to pancreatic insufficiency?', '["B and C", "A, D, E, and K (Fat soluble)", "Calcium and Magnesium", "Zinc"]', 1, 'Maldigestion of fats leads to loss of fat-soluble vitamins. (Pocket Medicine)'),
    (v_topic_id, '49: "Kartagener Syndrome" includes bronchiectasis, sinusitis, and:', '["Diabetes", "Situs inversus", "Heart failure", "Deafness"]', 1, 'Part of primary ciliary dyskinesia. (Step-Up)'),
    (v_topic_id, '50: What is the primary cause of death in patients with Cystic Fibrosis?', '["Liver failure", "Respiratory failure/Chronic infection", "Pancreatic cancer", "Malnutrition"]', 1, 'Over 90% of mortality is due to lung disease. (Harrison''s Ch. 289)');

    -- SECTION 6: BASIC CLINICAL PRESENTATIONS (PULM)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: "Orthopnea" (shortness of breath when lying flat) is most characteristic of:', '["Asthma", "Left-sided Heart Failure", "Pneumonia", "Anemia"]', 1, 'Redistribution of blood to the lungs increases wedge pressure. (Harrison''s Ch. 33)'),
    (v_topic_id, '52: "Platypnea" refers to dyspnea that is worsened by:', '["Lying flat", "Standing up (Upright position)", "Exercise", "Eating"]', 1, 'Classic for hepatopulmonary syndrome or atrial septal defects. (Pocket Medicine)'),
    (v_topic_id, '53: Digital clubbing is NOT typically seen in:', '["Lung Cancer", "Bronchiectasis", "COPD (uncomplicated)", "Cystic Fibrosis"]', 2, 'Uncomplicated COPD does not cause clubbing; its presence should prompt search for cancer or bronchiectasis. (Harrison''s Ch. 33)'),
    (v_topic_id, '54: Tactile fremitus is DECREASED in:', '["Pneumonia (Consolidation)", "Pleural Effusion", "Lung Abscess", "Pulmonary Edema"]', 1, 'Fluid in the pleural space insulates against vibration. (Step-Up)'),
    (v_topic_id, '55: "Dullness to percussion" is heard in which of the following?', '["Pneumothorax", "Pleural Effusion", "Emphysema", "Asthma"]', 1, 'Fluid or solid tissue is dull; air is resonant/hyperresonant. (Step-Up)'),
    (v_topic_id, '56: "Vesicular" breath sounds are characterized by:', '["Loud, high-pitched blowing", "Soft, low-pitched, heard mostly during inspiration", "Harsh, heard over the trachea", "Bubbling or clicking"]', 1, 'Normal breath sounds over most of the lung fields. (Harrison''s Ch. 284)'),
    (v_topic_id, '57: "Egophony" (E-to-A change) suggests:', '["Pneumothorax", "Lung Consolidation (e.g., Pneumonia)", "Asthma", "Bronchitis"]', 1, 'Sound conduction through fluid-filled alveoli. (Pocket Medicine)'),
    (v_topic_id, '58: Which clinical finding is the most sensitive indicator of respiratory distress in an infant?', '["Cough", "Nasal flaring and grunting", "Fever", "Pale skin"]', 1, 'Signs of increased work of breathing. (Step-Up)'),
    (v_topic_id, '59: Massive hemoptysis is generally defined as more than:', '["50 mL/day", "200-600 mL/24 hours", "1000 mL/day", "5 mL"]', 1, 'Requires urgent management to protect the airway. (Harrison''s Ch. 33)'),
    (v_topic_id, '60: The most common cause of chronic cough (lasting >8 weeks) in a non-smoker is:', '["Lung cancer", "Post-nasal drip (UACS), Asthma, and GERD", "TB", "Heart failure"]', 1, 'This triad accounts for the vast majority of cases. (Pocket Medicine)');

    -- SECTION 7: ADVANCED PHYSIOLOGY & V/Q
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: A "V/Q ratio of zero" represents:', '["Dead space", "Shunt", "Normal lung", "Infinite ventilation"]', 1, 'Perfusion without ventilation (e.g., airway obstruction). (Harrison''s Ch. 284)'),
    (v_topic_id, '62: "Infinite V/Q" represents:', '["Shunt", "Dead space", "High altitude", "Hyperventilation"]', 1, 'Ventilation without perfusion (e.g., Pulmonary Embolism). (Harrison''s Ch. 284)'),
    (v_topic_id, '63: Which of the following causes of hypoxemia has a NORMAL A-a gradient?', '["Pneumonia", "Alveolar Hypoventilation (e.g., Opioid overdose)", "Pulmonary Embolism", "IPF"]', 1, 'Hypoventilation and high altitude have normal gradients because the lung itself is healthy. (Step-Up)'),
    (v_topic_id, '64: Calculation of the A-a gradient requires which of the following?', '["FiO2, PaO2, and PaCO2", "Tidal Volume", "Heart rate", "DLCO"]', 0, 'Uses the Alveolar Gas Equation. (Pocket Medicine)'),
    (v_topic_id, '65: Hypoxemia due to SHUNT is unique because it:', '["Improves with supplemental O2", "Does NOT improve significantly with supplemental O2", "Has a low A-a gradient", "Only happens in smokers"]', 1, 'O2 cannot reach the blood in the shunted (bypassed) areas. (Harrison''s Ch. 284)'),
    (v_topic_id, '66: "Cheyne-Stokes respiration" is a pattern of:', '["Rapid deep breathing (Kussmaul)", "Alternating apnea and crescendo-decrescendo hyperpnea", "Irregularly irregular breathing", "Prolonged inspiration"]', 1, 'Often seen in severe heart failure or brain injury. (Harrison''s Ch. 33)'),
    (v_topic_id, '67: The "Bohr Effect" describes how oxygen binding is affected by:', '["CO2 and pH", "Temperature", "Altitude", "Blood volume"]', 0, 'High CO2/low pH reduces Hb affinity for O2. (Harrison''s)'),
    (v_topic_id, '68: The "Haldane Effect" describes how:', '["O2 binding affects CO2 transport", "CO2 binding affects O2 transport", "Iron binds O2", "None of the above"]', 0, 'Deoxygenated Hb has a higher affinity for CO2. (Harrison''s)'),
    (v_topic_id, '69: Carbon monoxide (CO) poisoning shifts the O2-Hb curve to the:', '["Right", "Left", "Up", "Down"]', 1, 'It increases affinity of remaining sites for O2, preventing unloading at tissues. (Step-Up)'),
    (v_topic_id, '70: Which form of CO2 transport is the most significant in the blood?', '["Dissolved CO2", "Carbaminohemoglobin", "Bicarbonate (HCO3-)", "Carbonic acid"]', 2, 'About 70% of CO2 is transported as bicarbonate. (Harrison''s Ch. 284)');

    -- SECTION 8: CLINICAL PHARMACOLOGY (PULM)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: Which medication class is the "Rescue" bronchodilator of choice?', '["LAMA", "SABA (e.g., Albuterol)", "ICS", "Theophylline"]', 1, 'Short-acting beta-agonists provide rapid relief. (Step-Up)'),
    (v_topic_id, '72: Tiotropium belongs to which class of medications?', '["LABA", "LAMA", "ICS", "Leukotriene modifier"]', 1, 'Long-acting muscarinic antagonist. (Harrison''s Ch. 286)'),
    (v_topic_id, '73: Montelukast works by:', '["Activating beta-receptors", "Inhibiting leukotriene receptors", "Blocking acetylcholine", "Inhibiting IgE"]', 1, 'Used in asthma and allergic rhinitis. (Step-Up)'),
    (v_topic_id, '74: Which side effect is classic for Theophylline toxicity?', '["Hypoglycemia", "Seizures and arrhythmias", "Weight gain", "Sedation"]', 1, 'Narrow therapeutic window; monitor blood levels. (Pocket Medicine)'),
    (v_topic_id, '75: Omalizumab is a monoclonal antibody that targets:', '["IL-5", "IgE", "TNF-alpha", "CD20"]', 1, 'Used for severe allergic asthma. (Harrison''s Ch. 287)'),
    (v_topic_id, '76: Roflumilast is a PDE-4 inhibitor used in COPD to:', '["Dilate bronchi", "Reduce exacerbations", "Cure emphysema", "Treat pneumonia"]', 1, 'Recommended for patients with chronic bronchitis and frequent exacerbations. (Harrison''s Ch. 286)'),
    (v_topic_id, '77: Which drug is a "mast cell stabilizer" used for exercise-induced asthma prophylaxis?', '["Albuterol", "Cromolyn sodium", "Prednisone", "Salmeterol"]', 1, 'Prevents degranulation before the trigger. (Step-Up)'),
    (v_topic_id, '78: Long-acting Beta-Agonists (LABA) should NEVER be used as monotherapy in:', '["COPD", "Asthma", "Both", "None"]', 1, 'Increased risk of asthma-related death; MUST be used with ICS. (Harrison''s Ch. 287)'),
    (v_topic_id, '79: Which inhaled medication is most likely to cause a "bitter taste"?', '["Albuterol", "Ipratropium", "Fluticasone", "Cromolyn"]', 1, 'Common complaint with anticholinergic inhalers. (Pocket Medicine)'),
    (v_topic_id, '80: N-acetylcysteine is used as a mucolytic and also as an antidote for:', '["Aspirin", "Acetaminophen", "Digoxin", "Heparin"]', 1, 'Restores glutathione in the liver. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Pulmonology MCQ Part 1 (1-80) registered.';
END $$;

COMMIT;
