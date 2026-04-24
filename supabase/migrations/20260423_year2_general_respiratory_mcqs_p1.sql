-- Migration: Year 2 - General Respiratory MCQ Bank (PART 1: 1-50)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Register/Find the Topic
    INSERT INTO topics (title, slug, semester_id, year_id, "order")
    VALUES ('General Respiratory', 'general-respiratory', 3, 2, 20)
    ON CONFLICT (slug) DO UPDATE SET year_id = 2, semester_id = 3
    RETURNING id INTO v_topic_id;

    -- 2. Insert MCQs (1-50)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Chronic smoker, 4 months productive cough for 3 years. Likely Reid Index?', '["< 0.2", "0.3", "> 0.5", "0.1"]', 2, 'Reid Index > 0.5 indicates gland hypertrophy in chronic bronchitis.'),
    (v_topic_id, 'Asthmatic sputum: crystallized enzymes from eosinophil membranes?', '["Curschmann spirals", "Charcot-Leyden crystals", "Ferruginous bodies", "Councilman bodies"]', 1, 'Charcot-Leyden crystals are eosinophil-derived; Curschmann spirals are mucus plugs.'),
    (v_topic_id, 'Non-smoker, panacinar emphysema, and liver cirrhosis. Genetic deficiency?', '["CFTR protein", "Alpha-1 antitrypsin", "NADPH oxidase", "Phenylalanine hydroxylase"]', 1, 'AAT deficiency causes panacinar emphysema and liver protein accumulation.'),
    (v_topic_id, 'Sandblaster with "eggshell" calcification of hilar nodes. Increased risk for?', '["Mesothelioma", "Bronchogenic carcinoma", "Tuberculosis", "Sarcoidosis"]', 2, 'Silicosis impairs macrophages, significantly increasing TB risk.'),
    (v_topic_id, 'Former shipyard worker with pleural mass, calretinin positivity. Diagnosis?', '["Small cell carcinoma", "Squamous cell carcinoma", "Mesothelioma", "Adenocarcinoma"]', 2, 'Mesothelioma is linked to asbestos and is calretinin positive.'),
    (v_topic_id, 'Alcohol use disorder, "currant jelly" sputum, bulging fissure on X-ray?', '["S. pneumoniae", "Klebsiella pneumoniae", "Mycoplasma pneumoniae", "Legionella"]', 1, 'Klebsiella is common in aspiration pneumonia/alcoholics; thick capsule = currant jelly.'),
    (v_topic_id, 'Walking pneumonia, cold agglutinins at 4°C. Treatment?', '["Penicillin", "Azithromycin", "Ceftriaxone", "Vancomycin"]', 1, 'Mycoplasma lacks cell wall; treat with macrolides like Azithromycin.'),
    (v_topic_id, 'HIV, CD4 < 200, "cup-shaped" cysts on silver stain?', '["Aspergillus", "Pneumocystis jirovecii", "Cryptococcus", "Histoplasma"]', 1, 'PCP is an AIDS-defining illness visualized with GMS silver stain.'),
    (v_topic_id, 'Cytokine essential for caseating granuloma formation in TB?', '["IL-4", "IL-10", "IFN-gamma", "IL-5"]', 2, 'Th1 cells secrete IFN-gamma to activate macrophages into epithelioid cells.'),
    (v_topic_id, 'Child with "barking" cough and "steeple sign" on X-ray. Virus?', '["RSV", "Parainfluenza virus", "Adenovirus", "Rhinovirus"]', 1, 'Croup (laryngotracheobronchitis) is caused by Parainfluenza.'),
    (v_topic_id, 'Smoker, central lung mass, Calcium 12.5 mg/dL. Paraneoplastic syndrome?', '["ACTH", "SIADH", "PTHrP secretion", "Lambert-Eaton"]', 2, 'Squamous cell carcinoma often secretes PTHrP leading to hypercalcemia.'),
    (v_topic_id, 'Female non-smoker, peripheral lung nodule, gland formation?', '["Squamous", "Small cell", "Adenocarcinoma", "Large cell"]', 2, 'Adenocarcinoma is most common in non-smokers and is peripheral.'),
    (v_topic_id, 'Ptosis, miosis, anhidrosis (Horner) + shoulder pain. Tumor location?', '["Central bronchus", "Lung apex (Superior sulcus)", "Mediastinum", "Diaphragm"]', 1, 'Pancoast tumor in superior sulcus can compress sympathetic chain.'),
    (v_topic_id, 'Small cell lung carcinoma origin cell type?', '["Pneumocyte II", "Goblet", "Neuroendocrine (Kulchitsky) cells", "Basal"]', 2, 'SCLC is a high-grade neuroendocrine tumor.'),
    (v_topic_id, 'Sudden chest pain post-hip surgery, high A-a gradient. Most likely?', '["Pneumonia", "Pulmonary embolism", "Pneumothorax", "Dissection"]', 1, 'Virchow triad (stasis) increases DVT/PE risk.'),
    (v_topic_id, 'Highest Ventilation/Perfusion (V/Q) ratio in standing lung?', '["Base", "Middle", "Apex", "Hilar"]', 2, 'Apex has lower Q relative to V, so V/Q ratio is highest (~3.0).'),
    (v_topic_id, 'Normal PaO2 but decreased total oxygen content. Likely cause?', '["High altitude", "Hypoventilation", "Carbon monoxide poisoning", "Shunt"]', 2, 'CO binds Hb with high affinity but doesn''t change dissolved O2 (PaO2).'),
    (v_topic_id, 'Bohr effect description?', '["CO2 increases affinity", "H+ and CO2 shift curve RIGHT", "O2 promotes CO2 dissociation", "Low BPG shifts right"]', 1, 'High H+/CO2 facilitates O2 unloading by shifting curve right.'),
    (v_topic_id, 'Preemie with NRDS (L/S ratio 1.2). Primary deficiency?', '["Type I", "Macrophages", "Dipalmitoylphosphatidylcholine", "AAT"]', 2, 'NRDS is caused by lack of surfactant (Lecithin/DPPC).'),
    (v_topic_id, 'Tall, thin male, sudden pleuritic pain, hyperresonance on one side?', '["Tension", "Spontaneous pneumothorax", "Effusion", "Consolidation"]', 1, 'Spontaneous pneumothorax from subpleural bleb rupture.'),
    (v_topic_id, 'Chronic sinusitis, hemoptysis, hematuria, c-ANCA positive?', '["p-ANCA", "c-ANCA (PR3-ANCA)", "Anti-GBM", "ANA"]', 1, 'Granulomatosis with polyangiitis (Wegener) is c-ANCA positive.'),
    (v_topic_id, 'Asthma, eosinophilia, p-ANCA, foot drop. Likely diagnosis?', '["c-ANCA", "p-ANCA", "Anti-Smith", "Anti-Scl-70"]', 1, 'Churg-Strauss (EGPA) features asthma, eosinophilia, and p-ANCA.'),
    (v_topic_id, 'Cystic Fibrosis (CF) defective channel type?', '["Na+", "ATP-gated Cl- channel", "K+", "Aquaporin"]', 1, 'CF is caused by CFTR gene mutation (ATP-gated Cl- channel).'),
    (v_topic_id, 'Cause of infertility in adult male with CF?', '["Azoospermia (absent vas deferens)", "Dynein", "Cryptorchidism", "Low T"]', 0, 'CBAVD is classic in CF males.'),
    (v_topic_id, 'Situs inversus, bronchiectasis, sinusitis. Defect location?', '["CFTR", "Dynein arms", "AAT", "NADPH oxidase"]', 1, 'Kartagener syndrome results from immobile cilia (dynein defect).'),
    (v_topic_id, 'Asthma medication that inhibits 5-lipoxygenase?', '["Montelukast", "Zileuton", "Albuterol", "Ipratropium"]', 1, 'Zileuton blocks 5-LOX; lukasts block receptors.'),
    (v_topic_id, 'PAH treatment: endothelin-1 receptor antagonist?', '["Sildenafil", "Bosentan", "Epoprostenol", "Alprostadil"]', 1, 'Bosentan competitively antagonizes endothelin receptors.'),
    (v_topic_id, 'Theophylline toxicity when adding which antibiotic (CYP inhibitor)?', '["Cef-induced", "Ciprofloxacin", "CNS stimulus", "Theo increase"]', 1, 'Ciprofloxacin inhibits CYP450, raising theophylline to toxic levels.'),
    (v_topic_id, 'Cough suppressant: NMDA receptor antagonist?', '["Guaifenesin", "Dextromethorphan", "Codeine", "Benzonatate"]', 1, 'Dextromethorphan is a synthetic opioid derivative/NMDA antagonist.'),
    (v_topic_id, 'Monoclonal antibody binding serum IgE for asthma?', '["Mepolizumab", "Omalizumab", "Dupilumab", "Fluticasone"]', 1, 'Omalizumab prevents IgE from binding to mast cells.'),
    (v_topic_id, 'ABG at high altitude (hyperventilation)?', '["pH Up, PCO2 Down, HCO3 Down", "pH Down", "Mixed", "Normal"]', 0, 'Respiratory alkalosis with renal compensation.'),
    (v_topic_id, 'Heroin overdose acid-base disturbance?', '["Metabolic Acidosis", "Respiratory Alkalosis", "Respiratory Acidosis", "Metabolic Alkalosis"]', 2, 'Opioids cause hypoventilation/CO2 retention.'),
    (v_topic_id, 'Which factor INCREASES diffusing capacity (DLCO)?', '["Emphysema", "Fibrosis", "Exercise", "PE"]', 2, 'Exercise recruits more capillaries, increasing surface area.'),
    (v_topic_id, 'PaO2 60, PCO2 80, PAO2 50. Normal A-a gradient (<15) indicates:', '["V/Q mismatch", "Shunt", "Hypoventilation purely", "Fibrosis"]', 2, 'A normal gradient with hypoxia means the issue is the air getting in (hypoventilation).'),
    (v_topic_id, 'CO poisoning effect on O2-dissociation curve?', '["Right/Lower", "Left shift and lower plateau", "Left/Raise", "No shift"]', 1, 'CO increases O2 affinity (Left shift) and lowers capacity (plateau).'),
    (v_topic_id, 'Supine patient aspirates peanut. Most likely segment?', '["RLL superior", "LLL basal", "RUL posterior", "Lingula"]', 0, 'Gravity favors RLL superior segment when supine.'),
    (v_topic_id, '"Honeycomb lung" on CT + clubbing?', '["Sarcoidosis", "Idiopathic Pulmonary Fibrosis (IPF)", "Bronchiectasis", "SCLC"]', 1, 'Honeycomb lung is end-stage fibrosis.'),
    (v_topic_id, 'Which cell acts as stem cell to replace damaged alveoli?', '["Type I", "Type II Pneumocyte", "Macrophage", "Club"]', 1, 'Type II cells secrete surfactant and replace damaged Type I cells.'),
    (v_topic_id, 'Tactile fremitus is DECREASED in:', '["Lobar Pneumonia", "Edema", "Pleural Effusion", "Abscess"]', 2, 'Fluid/air outside lung blocks vibration transmission.'),
    (v_topic_id, 'Non-caseating granuloma, high ACE, bilateral hilar lymphadenopathy?', '["Wedge", "Bilateral hilar lymphadenopathy", "Thickening", "Fluid"]', 1, 'Classic Sarcoidosis findings.'),
    (v_topic_id, 'Southwest US, dust storm, spherules with endospores?', '["Histoplasmosis", "Coccidioidomycosis", "Blastomycosis", "Paracocci"]', 1, 'Coccidioides immitis is endemic to the SW US.'),
    (v_topic_id, 'CF patient, Pseudomonas, green pigment. Toxin mechanism?', '["Shiga", "Exotoxin A (EF-2 inactivation)", "Alpha", "Edema factor"]', 1, 'Pseudomonas Exotoxin A works like Diphtheria toxin.'),
    (v_topic_id, 'Most common cause of bronchiolitis in infants < 2y?', '["Adenovirus", "Influenza", "RSV", "Parainfluenza"]', 2, 'Respiratory Syncytial Virus is the top cause.'),
    (v_topic_id, 'Positive PPD (15mm) but negative Chest X-ray?', '["RIPE", "Latent TB treatment (e.g. INH)", "Repeat", "None"]', 1, 'Positive screen with negative imaging = Latent TB.'),
    (v_topic_id, 'Acid-fast bacterium, bird fancier, AIDS complication?', '["Psittaci", "Mycobacterium avium-intracellulare", "Crypto", "Legionella"]', 1, 'MAC is acid-fast and common in advanced HIV/bird exposure.'),
    (v_topic_id, 'SVC Syndrome (tumor compression) symptoms?', '["Leg edema", "Facial swelling and distended neck veins", "Jaundice", "Low BP"]', 1, 'Blocked return from head/arms leads to plethora/swelling.'),
    (v_topic_id, 'D-Dimer test value is its high:', '["Specificity", "Sensitivity", "PPV", "Accuracy"]', 1, 'Highly sensitive (rules out PE if negative), but low specificity.'),
    (v_topic_id, 'Primary stimulus for breathing in healthy person?', '["O2 < 60", "Arterial PCO2", "Hb", "BP"]', 1, 'Central chemoreceptors respond to pH changes from PCO2.'),
    (v_topic_id, 'ARDS characteristic finding on pathology?', '["Granulomas", "Hyaline membranes", "Spirals", "Bodies"]', 1, 'Diffuse alveolar damage leads to proteinaceous hyaline membranes.'),
    (v_topic_id, 'TB drug causing orange discoloration of body fluids?', '["Isoniazid", "Rifampin", "Pyrazinamide", "Ethambutol"]', 1, 'Rifampin turns tears/urine orange.');

    RAISE NOTICE 'SUCCESS: General Respiratory Part 1 (1-50) registered.';
END $$;

COMMIT;
