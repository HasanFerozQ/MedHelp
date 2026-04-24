-- Migration: Year 2 - General Respiratory MCQ Bank (PART 2: 51-100)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-respiratory' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "general-respiratory" not found. Please run Part 1 first.';
    END IF;

    -- 2. Insert MCQs (51-100)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ethambutol side effect monitoring?', '["Nerve", "Uric acid", "Optic neuritis (red-green color blindness)", "Liver"]', 2, 'Ethambutol can cause decreased acuity and red-green blindness.'),
    (v_topic_id, 'Cough medication causing constipation?', '["Guaifenesin", "Codeine", "Benzonatate", "Acetylcysteine"]', 1, 'Codeine is an opioid antitussive; side effects include constipation.'),
    (v_topic_id, 'Drug used to liquefy CF mucus by cleaving disulfide bonds?', '["Dornase", "Acetylcysteine", "Saline", "Albuterol"]', 1, 'N-acetylcysteine breaks disulfide bonds in mucoproteins.'),
    (v_topic_id, 'Cherry-red skin and headache after house fire. Mechanism?', '["AChE inhibition", "Competitive inhibition of O2 binding to Hb", "Cytochrome inhibition", "MetHb"]', 1, 'Carbon monoxide (CO) competes with O2 for hemoglobin binding.'),
    (v_topic_id, 'Asthma medication: inhibits mast cell degranulation (prophylaxis)?', '["Salmeterol", "Cromolyn sodium", "Prednisone", "Tiotropium"]', 1, 'Cromolyn/Nedocromil stabilize mast cells; not for acute attacks.'),
    (v_topic_id, 'Catalyst for CO2 + H2O <-> H2CO3 in lungs/RBCs?', '["Carbonic anhydrase", "Hemoglobin", "BPG", "P450"]', 0, 'Carbonic anhydrase is the primary catalyst for this reaction.'),
    (v_topic_id, 'Severe diarrhea acid-base disturbance?', '["Normal anion gap metabolic acidosis", "High gap", "Alkalosis", "Respiratory"]', 0, 'Loss of HCO3- in stool leads to hyperchloremic metabolic acidosis.'),
    (v_topic_id, 'Which factor SHIFTS O2-Hb curve to the LEFT (Higher affinity)?', '["High CO2", "High Temp", "High BPG", "Decreased H+ (Alkalosis)"]', 3, 'Alkalosis and low temp/BPG shift the curve left (Hb holds O2 tighter).'),
    (v_topic_id, 'Haldane effect description?', '["O2 unloading", "O2 displacement of CO2 from Hb in lungs", "CO2 displacement", "pH effect"]', 1, 'High PO2 in lungs facilitates CO2 dissociation from Hb.'),
    (v_topic_id, 'Expected PCO2 for HCO3 14 (Winters Formula)?', '["25", "29", "40", "35"]', 1, 'Winters Formula: PCO2 = (1.5 * HCO3) + 8 +/- 2. (21+8=29).'),
    (v_topic_id, 'Lung development stage where surfactant starts?', '["Embryonic", "Pseudoglandular", "Canalicular", "Saccular"]', 3, 'Surfactant production starts in the Saccular stage (~week 26).'),
    (v_topic_id, 'Newborn, scaphoid abdomen, respiratory distress, absent left breath sounds?', '["Fistula", "Congenital diaphragmatic hernia", "Hypoplasia", "Laryngomalacia"]', 1, 'CDH allows abdominal contents to enter the chest (usually left).'),
    (v_topic_id, 'Embryological origin of respiratory epithelial lining?', '["Ectoderm", "Mesoderm", "Endoderm", "Neural crest"]', 2, 'Respiratory epithelium is endodermal.'),
    (v_topic_id, 'Most common TEF type (coughing/choking feeds, air in stomach)?', '["Pure EA", "Esophageal atresia with distal TEF", "H-type", "Proximal TEF"]', 1, 'EA with distal TEF is the most common (85%).'),
    (v_topic_id, 'Pulmonary hypoplasia association?', '["Polyhydramnios", "Oligohydramnios (Potter sequence)", "Diabetes", "Trisomy 21"]', 1, 'Lack of amniotic fluid prevents lung expansion.'),
    (v_topic_id, 'African American female, dry cough, uveitis, non-caseating granulomas?', '["TB", "Sarcoidosis", "Berylliosis", "Silicosis"]', 1, 'Sarcoidosis is a multisystem granulomatous disease.'),
    (v_topic_id, 'Aerospace worker, dyspnea, hilar nodes, non-caseating granulomas?', '["Asbestos", "Silica", "Beryllium", "Coal"]', 2, 'Berylliosis mirrors sarcoidosis in aerospace/electronics workers.'),
    (v_topic_id, 'Caplan syndrome components?', '["RA + Asbestosis", "RA + Silicosis", "RA + Coal Worker''s Pneumoconiosis", "RA + Sarcoid"]', 2, 'Caplan is RA + pneumoconiosis nodules.'),
    (v_topic_id, 'Restrictive disease with ivory-white calcified pleural plaques?', '["Asbestosis", "Silicosis", "Hypersensitivity", "Goodpasture"]', 0, 'Pleural plaques are pathognomonic for asbestos exposure.'),
    (v_topic_id, 'Farmer''s Lung (Hypersensitivity pneumonitis) reaction types?', '["Type I", "Type II", "Type III and IV", "Type IV"]', 2, 'Involves both immune complex and delayed hypersensitivity.'),
    (v_topic_id, 'Hypotension in massive PE shock type?', '["Left HF", "Obstructive shock", "Hypovolemic", "Septic"]', 1, 'Large emboli block flow to left heart, causing obstructive shock.'),
    (v_topic_id, 'Gold standard diagnostic for PE?', '["D-Dimer", "X-ray", "CT Pulmonary Angiography", "V/Q Scan"]', 2, 'CTPA is the first-line gold standard.'),
    (v_topic_id, 'Cor Pulmonale heart change?', '["LVH", "Right Ventricular Hypertrophy", "MS", "AR"]', 1, 'RV hypertrophy/failure due to chronic lung pressure.'),
    (v_topic_id, 'Fat embolism syndrome triad (post-fracture)?', '["Fever/Jaundice", "Dyspnea, Neurological symptoms, Petechial rash", "Hemo", "Cough"]', 1, 'Classic triad: Respiratory distress, confusion, and petechial rash.'),
    (v_topic_id, 'ARDS PaO2/FiO2 ratio threshold?', '[" > 400", "300 - 400", "<= 300", "500"]', 2, 'Berlin criteria defines ARDS as <= 300.'),
    (v_topic_id, 'Child, drooling, high fever, "thumbprint sign" on X-ray?', '["Strep", "Haemophilus influenzae type b", "Staph", "Moraxella"]', 1, 'Epiglottitis is most commonly HiB (medical emergency).'),
    (v_topic_id, 'Pertussis paroxysmal stage toxin causing lymphocytosis?', '["Tracheal", "Pertussis toxin", "Adenylate", "Dermonecrotic"]', 1, 'Pertussis toxin inhibits Gi, keeping lymphocytes in the blood.'),
    (v_topic_id, 'Wide-angled, non-septate hyphae in diabetic DKA?', '["Aspergillus", "Mucor", "Candida", "Histoplasma"]', 1, 'Mucormycosis thrives in acidic/high-glucose environments.'),
    (v_topic_id, 'What does a positive QuantiFERON-TB Gold test mean?', '["Active only", "Latent only", "Exposure and cell-mediated immunity", "BCG vaccine"]', 2, 'IGRAs indicate exposure/immunity; not affected by BCG.'),
    (v_topic_id, 'Legionella pneumophila visualization?', '["Gram", "Silver stain (Dieterle)", "India ink", "Giemsa"]', 1, 'Legionella stains poorly on Gram; use silver stain or BCYE agar.'),
    (v_topic_id, 'Structure at level of sternal angle (T4/T5)?', '["Thyroid", "Bifurcation of the trachea (Carina)", "Diaphragm", "Xiphoid"]', 1, 'Angle of Louis marks the tracheal bifurcation.'),
    (v_topic_id, 'Right lung lobes and fissures?', '["2L/1F", "3 lobes, 2 fissures", "3L/1F", "2L/2F"]', 1, 'Right: Superior, Middle, Inferior; Horizontal and Oblique fissures.'),
    (v_topic_id, '"Sail sign" on pediatric X-ray?', '["Pneumonia", "Normal thymus", "Effusion", "Pneumothorax"]', 1, 'Normal large thymus in infants appears as a sail.'),
    (v_topic_id, 'Intercostal neurovascular bundle rib position?', '["Superior", "Inferior to the rib (costal groove)", "Medial", "Lateral"]', 1, 'Needles go ABOVE the rib to avoid the bundle.'),
    (v_topic_id, 'Diaphragm motor innervation nerve?', '["Vagus", "Phrenic nerve", "Recurrent", "Intercostal"]', 1, 'C3, 4, 5 (Phrenic) keep the diaphragm alive.'),
    (v_topic_id, 'Hemoptysis, hematuria, linear IgG on GBM?', '["Wegener", "Goodpasture syndrome", "Alport", "SLE"]', 1, 'Goodpasture involves anti-GBM Type IV collagen antibodies.'),
    (v_topic_id, '"Small blue cells" and neuroendocrine origin?', '["Adeno", "Squamous", "Small cell carcinoma", "Large"]', 2, 'SCLC is a high-grade neuroendocrine tumor.'),
    (v_topic_id, 'Bronchiectasis characteristic?', '["Permanent dilation of bronchi", "Narrowing", "Destruction", "Fluid"]', 0, 'Chronic infection causes permanent airway dilation.'),
    (v_topic_id, '"Cold abscess" of spine or lung?', '["Staph", "Mycobacterium tuberculosis", "Actinomyces", "Nocardia"]', 1, 'TB causes caseating necrosis (Pott disease in spine).'),
    (v_topic_id, 'COPD effect on TLC and RV?', '["Decrease", "Both increase", "TLC Up, RV Down", "TLC Down, RV Up"]', 1, 'Air trapping increases both Residual Volume and Total Lung Capacity.'),
    (v_topic_id, 'Restrictive disease FEV1/FVC ratio?', '["Decreases", "Remains normal or increases", "Zero", "Significantly down"]', 1, 'Ratio is normal (>70%) because both FEV1 and FVC drop proportionally.'),
    (v_topic_id, 'Extrinsic restrictive disease example?', '["IPF", "Obesity", "Sarcoid", "Asbestos"]', 1, 'Obesity/chest wall issues cause extrinsic restriction.'),
    (v_topic_id, '"Tall, narrow" flow-volume loop shifted to right?', '["Asthma", "COPD", "Restrictive lung disease", "Obstruction"]', 2, 'Restrictive loops are narrow and shifted toward lower TLC.'),
    (v_topic_id, 'Smoking-related emphysema primary histological site?', '["Centriacinar destruction", "Panacinar", "Fibrosis", "Goblet"]', 0, 'Smoking typically causes centriacinar (upper lobe) damage.'),
    (v_topic_id, 'Which obstructive disease is reversible with bronchodilators?', '["Emphysema", "Bronchitis", "Asthma", "Bronchiectasis"]', 2, 'Asthmatic bronchoconstriction is the classic reversible obstruction.'),
    (v_topic_id, 'Mediastinal shift AWAY from side of lesion?', '["Atelectasis", "Tension pneumothorax", "Large effusion", "Both B and C"]', 3, 'Tension and effusion push away; collapse pulls toward.'),
    (v_topic_id, 'Ferruginous bodies (asbestos fibers) appearance?', '["Asteroid", "Iron-coated dumbbell shape", "Schaumann", "Negri"]', 1, 'Ferruginous bodies are iron-coated asbestos fibers.'),
    (v_topic_id, 'Starling force change in pulmonary edema?', '["Hydro down", "Increased capillary hydrostatic pressure", "Oncotic up", "Permeability down"]', 1, 'Left heart backup raises hydrostatic pressure in lungs.'),
    (v_topic_id, 'Central lung tumor with "keratin pearls"?', '["Small cell", "Adeno", "Squamous cell carcinoma", "Bronchiolo"]', 2, 'Squamous cell: Central, Cigarettes, Calcium, Keratin pearls.'),
    (v_topic_id, '"Strawberry Gingivitis" and c-ANCA positivity?', '["c-ANCA (Wegener''s)", "p-ANCA", "ANA", "Anti-dsDNA"]', 0, 'Granulomatosis with polyangiitis (Wegener) features c-ANCA and strawberry gingiva.');

    RAISE NOTICE 'SUCCESS: General Respiratory Part 2 (51-100) registered.';
END $$;

COMMIT;
