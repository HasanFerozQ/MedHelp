BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Common Lab Interpretation
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'common-lab-interpretation' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "common-lab-interpretation" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 31: Hyponatremia & Hyperglycemia (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Confusion and Extreme Hyperglycemia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Confusion and Extreme Hyperglycemia', 'A 65-year-old male with Type 2 DM presents with confusion. Labs: Na 128 mEq/L, Glucose 900 mg/dL, K 4.2 mEq/L.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male with Type 2 DM presents with confusion. Labs: Na 128 mEq/L, Glucose 900 mg/dL, K 4.2 mEq/L.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the corrected sodium level?', '["128 mEq/L", "140.8 mEq/L", "135 mEq/L", "145 mEq/L"]', 1, 'Formula: Na + 1.6 * (Glucose - 100) / 100. Here: 128 + 1.6 * (900-100)/100 = 128 + 12.8 = 140.8.'),
    (v_case_id, 'This condition is known as:', '["SIADH", "Pseudohyponatremia", "Hypertonic hyponatremia", "Hypovolemic hyponatremia"]', 2, 'Hyperglycemia draws water out of cells, diluting the serum sodium. This is a true hypertonic state.'),
    (v_case_id, 'What is the primary initial treatment for the confusion?', '["3% Hypertonic Saline", "Fluid restriction", "Insulin and Normal Saline", "Tolvaptan"]', 2, 'The underlying cause is the hyperosmolar state from glucose; insulin and volume resuscitation are key.');

    ---------------------------------------------------------------------------
    -- CASE 32: Hypernatremia & Polyuria (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thirsty Bipolar Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thirsty Bipolar Patient', 'A 40-year-old female with bipolar disorder on lithium presents with extreme thirst and high urine output. Labs: Na 150 mEq/L, Urine Osm 150 mOsm/kg (Low).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old female with bipolar disorder on lithium presents with extreme thirst and high urine output. Labs: Na 150 mEq/L, Urine Osm 150 mOsm/kg (Low).', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Central Diabetes Insipidus", "Nephrogenic Diabetes Insipidus", "Primary Polydipsia", "SIADH"]', 1, 'Lithium is a classic cause of Nephrogenic DI by interfering with ADH action in the collecting duct.'),
    (v_case_id, 'What test would distinguish Central from Nephrogenic DI?', '["Water deprivation followed by Desmopressin", "Salt loading test", "Glucose tolerance test", "24-hour urine cortisol"]', 0, 'If urine osmolality increases with desmopressin, it is Central DI; if it remains low, it is Nephrogenic DI.'),
    (v_case_id, 'If desmopressin is given and urine Osm remains < 300, the diagnosis is:', '["Central DI", "Nephrogenic DI", "Normal", "Primary Polydipsia"]', 1, 'Failure to respond to ADH analogue (Desmopressin) confirms the kidneys are resistant (Nephrogenic).');

    ---------------------------------------------------------------------------
    -- CASE 33: Refractory Hypokalemia (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stubborn Low Potassium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stubborn Low Potassium', 'A 55-year-old male with chronic alcoholism is admitted for diarrhea. K is 2.8 mEq/L. Despite 80 mEq of KCl over 24 hours, the K only rises to 2.9 mEq/L.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male with chronic alcoholism is admitted for diarrhea. K is 2.8 mEq/L. Despite 80 mEq of KCl over 24 hours, the K only rises to 2.9 mEq/L.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What additional lab should be checked?', '["Sodium", "Calcium", "Magnesium", "Phosphorus"]', 2, 'Hypomagnesemia is a common cause of refractory hypokalemia.'),
    (v_case_id, 'Why does low Magnesium cause low Potassium?', '["It inhibits K+ reabsorption in the distal tubule (ROMK channels)", "It causes secretory diarrhea", "It inhibits insulin release", "It causes renal failure"]', 0, 'Intracellular Mg inhibits ROMK channels; low Mg allows excessive K+ secretion into the urine.'),
    (v_case_id, 'Initial step in correcting the K?', '["Give more K", "Give IV Magnesium", "Give Bicarbonate", "Give Spironolactone"]', 1, 'You must correct the magnesium deficit first to allow potassium levels to normalize.');

    ---------------------------------------------------------------------------
    -- CASE 34: Hypocalcemia & Albumin (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Liver Disease and Low Calcium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Liver Disease and Low Calcium', 'A patient with cirrhosis has a total calcium of 7.5 mg/dL. Albumin is 2.0 g/dL (Normal 4.0).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with cirrhosis has a total calcium of 7.5 mg/dL. Albumin is 2.0 g/dL (Normal 4.0).', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the corrected calcium?', '["7.5 mg/dL", "8.3 mg/dL", "9.1 mg/dL", "10.0 mg/dL"]', 2, 'Corrected Ca = Total Ca + 0.8 * (4.0 - Albumin) = 7.5 + 0.8 * 2 = 9.1.'),
    (v_case_id, 'This patient''s ionized calcium is most likely:', '["Low", "High", "Normal", "Undetectable"]', 2, 'Ionized calcium (the physiologically active form) is usually normal in hypoalbuminemic states.'),
    (v_case_id, 'Which physical sign is most specific for symptomatic hypocalcemia?', '["Asterixis", "Trousseau sign", "Jaundice", "Spider angioma"]', 1, 'Trousseau sign (carpopedal spasm with BP cuff) and Chvostek sign are classic for hypocalcemia.');

    ---------------------------------------------------------------------------
    -- CASE 35: NAGMA & Urine Anion Gap (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acidosis with a Normal Gap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acidosis with a Normal Gap', 'A patient has a pH 7.30, HCO3 15, Cl 115, Na 140. Urine labs: Na 40, K 20, Cl 20.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a pH 7.30, HCO3 15, Cl 115, Na 140. Urine labs: Na 40, K 20, Cl 20.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the serum anion gap.', '["5", "10", "15", "20"]', 1, 'AG = Na - (Cl + HCO3) = 140 - (115 + 15) = 10 (Normal).'),
    (v_case_id, 'Calculate the Urine Anion Gap (UAG = Na + K - Cl).', '["-20", "0", "+40", "+60"]', 2, 'UAG = 40 + 20 - 20 = +40.'),
    (v_case_id, 'A positive UAG in the setting of NAGMA suggests:', '["Diarrhea", "Renal Tubular Acidosis (RTA)", "Addison''s disease", "Lactic acidosis"]', 1, 'A positive UAG indicates the kidney is NOT excreting NH4Cl properly, pointing to RTA.');

    ---------------------------------------------------------------------------
    -- CASE 36: Toxic Alcohol Ingestion (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Osmolar Gap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Osmolar Gap', 'A 45-year-old male is found unresponsive. Labs: pH 7.10, HCO3 8, AG 30. Measured Serum Osm 340, Na 140, Glucose 100, BUN 28.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male is found unresponsive. Labs: pH 7.10, HCO3 8, AG 30. Measured Serum Osm 340, Na 140, Glucose 100, BUN 28.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the calculated osmolality (2*Na + Glucose/18 + BUN/2.8).', '["280", "295", "310", "330"]', 1, '2*140 + 100/18 + 28/2.8 = 280 + 5.5 + 10 = 295.5.'),
    (v_case_id, 'What is the Osmolar Gap?', '["10", "20", "45", "60"]', 2, 'Measured (340) - Calculated (295) = 45.'),
    (v_case_id, 'High AG + High Osmolar Gap + Envelope crystals in urine suggests:', '["Methanol", "Ethylene Glycol", "Isopropyl Alcohol", "Aspirin"]', 1, 'Ethylene glycol is metabolized to oxalic acid, which forms calcium oxalate crystals (envelope-shaped).');

    ---------------------------------------------------------------------------
    -- CASE 37: Salicylate Toxicity (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aspirin Overdose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aspirin Overdose', 'A patient presents with tinnitus and tachypnea. ABG: pH 7.45, PaCO2 20 mmHg, HCO3 14 mEq/L. Serum Anion Gap is 24.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with tinnitus and tachypnea. ABG: pH 7.45, PaCO2 20 mmHg, HCO3 14 mEq/L. Serum Anion Gap is 24.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the acid-base diagnosis?', '["Metabolic acidosis only", "Respiratory alkalosis only", "Mixed respiratory alkalosis and HAGMA", "Compensated metabolic acidosis"]', 2, 'Salicylates directly stimulate the respiratory center (alkalosis) and uncouple oxidative phosphorylation (HAGMA).'),
    (v_case_id, 'Using Winters'' Formula (Expected PaCO2 = 1.5 * HCO3 + 8 +/- 2), which is correct?', '["Appropriate compensation", "Concomitant respiratory alkalosis", "Concomitant respiratory acidosis", "Metabolic alkalosis"]', 1, 'Expected PaCO2 is 29; actual is 20. This indicates a second, primary respiratory alkalosis.'),
    (v_case_id, 'Treatment to enhance salicylate elimination?', '["Acidify the urine", "Alkalinize the urine with NaHCO3", "Dialysis only", "Activated charcoal only"]', 1, 'Alkalinizing the urine traps the salicylate ions (ion trapping), increasing excretion.');

    ---------------------------------------------------------------------------
    -- CASE 38: Metabolic Alkalosis & Urine Chloride (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vomiting and High Bicarbonate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vomiting and High Bicarbonate', 'A patient presents with vomiting. Labs: pH 7.52, HCO3 34 mEq/L, Cl 90 mEq/L. Urine Cl is 5 mEq/L.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with vomiting. Labs: pH 7.52, HCO3 34 mEq/L, Cl 90 mEq/L. Urine Cl is 5 mEq/L.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This metabolic alkalosis is classified as:', '["Saline-responsive", "Saline-resistant", "High anion gap", "Normal anion gap"]', 0, 'A urine chloride < 20 mEq/L indicates volume depletion that will respond to normal saline.'),
    (v_case_id, 'Which condition causes saline-RESISTANT metabolic alkalosis (Urine Cl > 20)?', '["Vomiting", "Remote diuretic use", "Conn''s Syndrome (Primary Hyperaldosteronism)", "Nasogastric suction"]', 2, 'Mineralocorticoid excess causes H+ loss regardless of volume status.'),
    (v_case_id, 'What electrolyte is typically LOW in this patient?', '["Potassium", "Sodium", "Magnesium", "Phosphorus"]', 0, 'Vomiting leads to loss of HCl and secondary hyperaldosteronism, both causing hypokalemia.');

    ---------------------------------------------------------------------------
    -- CASE 39: Anemia of Chronic Disease (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Inflammation and Iron' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Inflammation and Iron', 'A patient with rheumatoid arthritis has Hb 10.2 g/dL. Iron 40 (Low), TIBC 200 (Low), Ferritin 300 (High).', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with rheumatoid arthritis has Hb 10.2 g/dL. Iron 40 (Low), TIBC 200 (Low), Ferritin 300 (High).', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Iron deficiency", "Anemia of Chronic Disease", "Thalassemia", "Sideroblastic anemia"]', 1, 'High ferritin and low TIBC distinguish ACD from iron deficiency.'),
    (v_case_id, 'What protein is upregulated in inflammation and blocks iron release from macrophages?', '["Ferritin", "Transferrin", "Hepcidin", "Erythropoietin"]', 2, 'Hepcidin (produced by the liver) inhibits ferroportin, trapping iron in stores.'),
    (v_case_id, 'What is the MCV typically in this condition?', '["< 70", "80-100", "> 110", "120"]', 1, 'ACD is usually normocytic, though it can become microcytic over time.');

    ---------------------------------------------------------------------------
    -- CASE 40: Sideroblastic Anemia (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The TB Patient with Fatigue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The TB Patient with Fatigue', 'A patient on Isoniazid for TB presents with fatigue. Labs show a microcytic anemia with HIGH serum iron and HIGH ferritin.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on Isoniazid for TB presents with fatigue. Labs show a microcytic anemia with HIGH serum iron and HIGH ferritin.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Iron deficiency", "Lead poisoning", "Sideroblastic anemia", "Folate deficiency"]', 2, 'Impaired heme synthesis with iron overload is characteristic of sideroblastic anemia.'),
    (v_case_id, 'What finding is seen on the bone marrow aspirate (Prussian blue stain)?', '["Hypercellularity", "Ringed sideroblasts", "Megaloblasts", "Auer rods"]', 1, 'Iron-laden mitochondria circle the nucleus of erythroid precursors.'),
    (v_case_id, 'Deficiency of which vitamin often contributes to this condition in patients on INH?', '["B12", "Folate", "B6 (Pyridoxine)", "Vitamin C"]', 2, 'INH inhibits pyridoxine, a necessary cofactor for delta-ALA synthase (the rate-limiting step in heme synthesis).');

    ---------------------------------------------------------------------------
    -- CASE 41: G6PD Deficiency (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fava Bean Reaction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fava Bean Reaction', 'A 22-year-old male eats fava beans and develops dark urine. Labs: Hb 9, Retics 6%. Peripheral smear shows "bite cells".', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old male eats fava beans and develops dark urine. Labs: Hb 9, Retics 6%. Peripheral smear shows "bite cells".', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hereditary Spherocytosis", "G6PD deficiency", "Sickle cell anemia", "AIHA"]', 1, 'Bite cells are caused by splenic macrophages removing Heinz bodies.'),
    (v_case_id, 'What are the inclusions seen in RBCs on crystal violet stain?', '["Howell-Jolly bodies", "Heinz bodies", "Pappenheimer bodies", "Basophilic stippling"]', 1, 'Heinz bodies are clumps of denatured hemoglobin from oxidative stress.'),
    (v_case_id, 'Mode of inheritance?', '["Autosomal dominant", "Autosomal recessive", "X-linked recessive", "Mitochondrial"]', 2, 'G6PD deficiency is X-linked recessive, primarily affecting males.');

    ---------------------------------------------------------------------------
    -- CASE 42: AIHA (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Autoimmune Hemolysis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Autoimmune Hemolysis', 'A 60-year-old with CLL presents with jaundice. Direct Coombs test is positive for IgG.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old with CLL presents with jaundice. Direct Coombs test is positive for IgG.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely type of AIHA?', '["Warm AIHA", "Cold AIHA", "Paroxysmal Nocturnal Hemoglobinuria", "G6PD deficiency"]', 0, 'IgG antibodies bind optimally at body temperature (Warm AIHA).'),
    (v_case_id, 'What is the characteristic RBC shape seen on smear?', '["Schistocytes", "Spherocytes", "Target cells", "Burr cells"]', 1, 'Splenic macrophages "nibble" the antibody-coated RBC membrane, forming spherocytes.'),
    (v_case_id, 'Cold AIHA (IgM) is classically associated with which infection?', '["Strep throat", "Mycoplasma pneumoniae", "Hepatitis B", "Malaria"]', 1, 'IgM-mediated hemolysis is often triggered by Mycoplasma or Mononucleosis.');

    ---------------------------------------------------------------------------
    -- CASE 43: TTP (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever, Confusion, and Low Platelets' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever, Confusion, and Low Platelets', 'A 30-year-old female presents with fever, confusion, and petechiae. Labs: Platelets 20k, Hb 8, Creatinine 2.5. Smear shows schistocytes. PT/PTT are normal.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old female presents with fever, confusion, and petechiae. Labs: Platelets 20k, Hb 8, Creatinine 2.5. Smear shows schistocytes. PT/PTT are normal.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["DIC", "ITP", "TTP (Thrombotic Thrombocytopenic Purpura)", "HUS"]', 2, 'The "Pentad": Fever, Anemia (MAHA), Thrombocytopenia, Neuro symptoms, Renal failure.'),
    (v_case_id, 'Deficiency of which enzyme causes TTP?', '["G6PD", "ADAMTS13", "Factor VIII", "Pyruvate kinase"]', 1, 'ADAMTS13 normally cleaves vWF multimers; deficiency leads to platelet microthrombi.'),
    (v_case_id, 'Why are PT/PTT normal in TTP/HUS but prolonged in DIC?', '["TTP involves platelets only; DIC involves clotting factors", "TTP is an autoimmune disease", "DIC is a liver disease", "Laboratory error"]', 0, 'DIC involves systemic activation of the coagulation cascade; TTP is a platelet-vWF interaction issue.');

    ---------------------------------------------------------------------------
    -- CASE 44: CML vs. Leukemoid (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Extreme Leukocytosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Extreme Leukocytosis', 'A patient has a WBC of 50,000 with a left shift. Splenomegaly is present.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a WBC of 50,000 with a left shift. Splenomegaly is present.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab test can distinguish CML from a leukemoid reaction?', '["ESR", "Leukocyte Alkaline Phosphatase (LAP) score", "CRP", "Ferritin"]', 1, 'LAP measures the activity of mature neutrophils.'),
    (v_case_id, 'In CML, the LAP score is:', '["High", "Low", "Normal", "Undetectable"]', 1, 'Malignant neutrophils in CML lack LAP; in infection (leukemoid reaction), it is high.'),
    (v_case_id, 'What cytogenetic abnormality is diagnostic for CML?', '["t(8;14)", "t(9;22)", "t(15;17)", "t(11;14)"]', 1, 'The Philadelphia chromosome creates the BCR-ABL fusion protein.');

    ---------------------------------------------------------------------------
    -- CASE 45: Infiltrative LFTs (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sarcoidosis and the Liver' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sarcoidosis and the Liver', 'A patient with sarcoidosis has labs: AST 40, ALT 45, Alk Phos 450, GGT 500, Bilirubin 1.1.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with sarcoidosis has labs: AST 40, ALT 45, Alk Phos 450, GGT 500, Bilirubin 1.1.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This pattern is known as:', '["Hepatocellular", "Cholestatic", "Infiltrative", "Isolated hyperbilirubinemia"]', 2, 'Very high alkaline phosphatase with normal bilirubin suggests granulomatous or neoplastic infiltration.'),
    (v_case_id, 'What other condition commonly causes an infiltrative pattern?', '["Tylenol overdose", "Tuberculosis", "Viral hepatitis", "Alcohol"]', 1, 'TB, Sarcoid, and Lymphoma often infiltrate the liver parenchyma.'),
    (v_case_id, 'Next best imaging step to evaluate the biliary tree?', '["CT abdomen", "RUQ Ultrasound", "ERCP", "HIDA scan"]', 1, 'Ultrasound is the first-line test to rule out extrahepatic biliary obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 46: Gilbert Syndrome (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Jaundice During Exams' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Jaundice During Exams', 'A 19-year-old student has mild jaundice during finals week. Labs: Total Bili 2.5, Direct Bili 0.2. AST/ALT/Alk Phos are normal.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old student has mild jaundice during finals week. Labs: Total Bili 2.5, Direct Bili 0.2. AST/ALT/Alk Phos are normal.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Dubin-Johnson", "Gilbert Syndrome", "Crigler-Najjar Type 1", "Viral hepatitis"]', 1, 'Gilbert is common and presents with mild, stress-induced indirect hyperbilirubinemia.'),
    (v_case_id, 'The hyperbilirubinemia is:', '["Conjugated", "Unconjugated", "Both", "Delta-bilirubin"]', 1, 'Total - Direct = 2.3 (Indirect/Unconjugated).'),
    (v_case_id, 'Mechanism?', '["Absent UGT1A1 enzyme", "Reduced activity of UGT1A1 enzyme", "Defect in biliary excretion", "Hemolysis"]', 1, 'Reduced glucuronosyltransferase activity impairs conjugation.');

    ---------------------------------------------------------------------------
    -- CASE 47: Wilson Disease (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tremors and Liver Damage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tremors and Liver Damage', 'A 25-year-old has tremors and elevated LFTs. Eye exam shows brownish rings around the cornea.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old has tremors and elevated LFTs. Eye exam shows brownish rings around the cornea.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab finding is classic for this disease?', '["High ceruloplasmin", "Low ceruloplasmin", "Low urinary copper", "High iron"]', 1, 'Ceruloplasmin (copper carrier) is low in Wilson''s.'),
    (v_case_id, 'These rings are called:', '["Kayser-Fleischer rings", "Lisch nodules", "Bitot spots", "Arcus senilis"]', 0, 'Copper deposition in Descemet''s membrane.'),
    (v_case_id, 'Inheritance pattern?', '["Autosomal dominant", "Autosomal recessive", "X-linked", "Mitochondrial"]', 1, 'Wilson disease is autosomal recessive (ATP7B mutation).');

    ---------------------------------------------------------------------------
    -- CASE 48: Hemochromatosis (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bronze Diabetes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bronze Diabetes', 'A 50-year-old male presents with joint pain and "bronze" skin. Labs: Iron 200, Ferritin 2000, Transferrin Saturation 80%.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male presents with joint pain and "bronze" skin. Labs: Iron 200, Ferritin 2000, Transferrin Saturation 80%.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Wilson Disease", "Hereditary Hemochromatosis", "Alpha-1 antitrypsin deficiency", "Primary Biliary Cholangitis"]', 1, 'Iron overload with classic "bronze" skin and joint involvement.'),
    (v_case_id, 'What is the most common gene mutation involved?', '["ATP7B", "HFE (C282Y)", "SERPINA1", "CFTR"]', 1, 'HFE mutation leads to uncontrolled iron absorption.'),
    (v_case_id, 'Treatment of choice?', '["Phlebotomy", "Penicillamine", "Ursodeoxycholic acid", "Steroids"]', 0, 'Regular phlebotomy removes excess iron stores.');

    ---------------------------------------------------------------------------
    -- CASE 49: BUN/Cr Ratio in GI Bleed (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dark Stools and High BUN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dark Stools and High BUN', 'A patient with dark stools has a BUN of 45 mg/dL and Creatinine of 1.0 mg/dL.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with dark stools has a BUN of 45 mg/dL and Creatinine of 1.0 mg/dL.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'BUN:Cr ratio?', '["15:1", "25:1", "45:1", "10:1"]', 2, 'Ratio = 45.'),
    (v_case_id, 'Why is the BUN elevated in Upper GI bleeding?', '["Renal failure", "Digestion of blood (protein) and absorption of urea", "Liver failure", "Dehydration only"]', 1, 'Intestinal bacteria break down hemoglobin protein into urea, which is then reabsorbed.'),
    (v_case_id, 'This finding is more common in:', '["Upper GI bleed", "Lower GI bleed", "Hemorrhoids", "Colon cancer"]', 0, 'Blood must pass through the small intestine for significant urea absorption.');

    ---------------------------------------------------------------------------
    -- CASE 50: FeUrea on Diuretics (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AKI on Furosemide' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AKI on Furosemide', 'A patient on furosemide for CHF has AKI. FeNa is 2.5% (High). BUN:Cr is 25:1.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on furosemide for CHF has AKI. FeNa is 2.5% (High). BUN:Cr is 25:1.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can FeNa reliably distinguish prerenal from intrinsic AKI in this patient?', '["Yes", "No, because diuretics increase Na excretion", "Yes, if K is normal", "No, because of CHF"]', 1, 'Loop diuretics inhibit Na reabsorption, making FeNa falsely high even in prerenal states.'),
    (v_case_id, 'What is a better test to evaluate for prerenal azotemia in a patient on diuretics?', '["FeK", "FeUrea", "Urine Osm", "Creatinine clearance"]', 1, 'Urea handling is less affected by loop diuretics than sodium handling.'),
    (v_case_id, 'Mechanism of prerenal AKI in CHF?', '["Direct toxic effect of BNP", "Decreased effective circulating volume", "Afferent arteriole constriction", "Efferent arteriole dilation"]', 1, 'Reduced cardiac output leads to renal hypoperfusion.');

    ---------------------------------------------------------------------------
    -- CASE 51: Nephrotic Syndrome (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HBV and Edema' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HBV and Edema', 'A 40-year-old with HBV has severe edema. Labs: 4+ protein in urine, Albumin 1.8 g/dL, Cholesterol 350 mg/dL.', 51) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old with HBV has severe edema. Labs: 4+ protein in urine, Albumin 1.8 g/dL, Cholesterol 350 mg/dL.', "order" = 51 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Minimal Change Disease", "Membranous Nephropathy", "FSGS", "IgA Nephropathy"]', 1, 'Membranous nephropathy is the most common nephrotic syndrome associated with HBV.'),
    (v_case_id, 'What antibody is often positive in primary Membranous Nephropathy?', '["ANA", "anti-PLA2R", "anti-dsDNA", "c-ANCA"]', 1, 'Phospholipase A2 receptor antibodies are highly specific for the primary form.'),
    (v_case_id, 'Why is there hyperlipidemia in nephrotic syndrome?', '["High fat diet", "Liver increases lipoprotein synthesis to compensate for low oncotic pressure", "Kidney cannot filter fats", "Lack of exercise"]', 1, 'The liver overproduces lipids in response to low serum protein.');

    ---------------------------------------------------------------------------
    -- CASE 52: Contrast Nephropathy (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-CT Kidney Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-CT Kidney Failure', 'A patient gets a CT with contrast. 48 hours later, Creatinine rises from 1.0 to 2.2.', 52) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient gets a CT with contrast. 48 hours later, Creatinine rises from 1.0 to 2.2.', "order" = 52 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely cause of AKI?', '["Acute Interstitial Nephritis (AIN)", "Contrast-induced Nephropathy (CIN)", "Post-streptococcal GN", "Prerenal azotemia"]', 1, 'Contrast nephropathy typically presents 24-48 hours after exposure.'),
    (v_case_id, 'AIN (from drugs like NSAIDs/PCN) would typically show what in the urine?', '["RBC casts", "WBC casts and Eosinophils", "Fatty casts", "Granular muddy brown casts"]', 1, 'AIN is an allergic-type reaction in the interstitium.'),
    (v_case_id, 'Muddy brown granular casts suggest:', '["AIN", "Acute Tubular Necrosis (ATN)", "Glomerulonephritis", "Normal finding"]', 1, 'These are sloughed tubular epithelial cells characteristic of ATN.');

    ---------------------------------------------------------------------------
    -- CASE 53: CSF Dissociation (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ascending Paralysis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ascending Paralysis', 'A patient with ascending paralysis has a lumbar puncture. CSF: Protein 150 mg/dL, WBC 2/mm³.', 53) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with ascending paralysis has a lumbar puncture. CSF: Protein 150 mg/dL, WBC 2/mm³.', "order" = 53 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This finding is known as:', '["Bacterial meningitis", "Albuminocytologic dissociation", "Viral meningitis", "Subarachnoid hemorrhage"]', 1, 'High protein with normal cell count.'),
    (v_case_id, 'Most likely diagnosis?', '["Multiple Sclerosis", "Guillain-Barré Syndrome", "Polio", "Botulism"]', 1, 'Classic CSF finding in GBS.'),
    (v_case_id, 'MS would classically show which CSF finding?', '["High WBC", "Oligoclonal bands", "Low glucose", "RBCs"]', 1, 'Oligoclonal bands represent intrathecal IgG production in MS.');

    ---------------------------------------------------------------------------
    -- CASE 54: Ascitic Fluid SAAG (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swollen Abdomen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swollen Abdomen', 'A cirrhotic patient has ascites. Peritoneal fluid Albumin is 1.0 g/dL. Serum Albumin is 2.5 g/dL.', 54) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cirrhotic patient has ascites. Peritoneal fluid Albumin is 1.0 g/dL. Serum Albumin is 2.5 g/dL.', "order" = 54 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the Serum-Ascites Albumin Gradient (SAAG).', '["0.5", "1.0", "1.5", "3.5"]', 2, 'SAAG = 2.5 - 1.0 = 1.5.'),
    (v_case_id, 'A SAAG > 1.1 indicates:', '["Portal hypertension", "Malignancy", "Tuberculosis", "Pancreatitis"]', 0, 'High gradient indicates transudative fluid from portal pressure.'),
    (v_case_id, 'What finding on ascitic fluid would diagnose Spontaneous Bacterial Peritonitis (SBP)?', '["Positive culture only", "PMNs > 250/mm³", "Protein > 2.5", "Glucose < 60"]', 1, 'Absolute neutrophil count (ANC) > 250 is diagnostic.');

    ---------------------------------------------------------------------------
    -- CASE 55: Light''s Criteria & Diuresis (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pleural Effusion Trap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pleural Effusion Trap', 'A CHF patient on Lasix has a pleural effusion. Fluid Protein/Serum Protein = 0.52.', 55) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A CHF patient on Lasix has a pleural effusion. Fluid Protein/Serum Protein = 0.52.', "order" = 55 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on Light''s criteria, this is:', '["Transudate", "Exudate", "Hemorrhagic", "Chylous"]', 1, 'Ratio > 0.5 is an exudate by definition.'),
    (v_case_id, 'Why might a CHF effusion (normally a transudate) look like an exudate after diuresis?', '["Diuresis concentrates the protein in the pleural space", "CHF causes inflammation", "Lasix causes lung damage", "Patient has pneumonia"]', 0, 'Fluid is removed faster than protein, leading to a "pseudoexudate".'),
    (v_case_id, 'What additional test can help clarify if it''s actually a transudate?', '["Fluid-Serum Protein Gradient > 3.1 g/dL", "pH", "Glucose", "Amylase"]', 0, 'A protein gradient > 3.1 suggests the fluid is actually a transudate despite Light''s criteria.');

    ---------------------------------------------------------------------------
    -- CASE 56: Hemophilia vs. vWD (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bleeding Boy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bleeding Boy', 'A boy has a swollen knee (hemarthrosis) after a minor fall. PTT is prolonged, PT is normal.', 56) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A boy has a swollen knee (hemarthrosis) after a minor fall. PTT is prolonged, PT is normal.', "order" = 56 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hemophilia A or B", "vWD", "Vitamin K deficiency", "Liver disease"]', 0, 'Hemarthrosis and isolated PTT prolongation are classic for Hemophilia.'),
    (v_case_id, 'What is the primary defect in von Willebrand Disease (vWD)?', '["Factor VIII deficiency", "Platelet adhesion defect", "Intrinsic pathway failure", "Fibrinogen deficiency"]', 1, 'vWF is needed for platelets to bind to subendothelial collagen.'),
    (v_case_id, 'Bleeding time is prolonged in:', '["Hemophilia A", "vWD", "Hemophilia B", "Factor XI deficiency"]', 1, 'vWD affects platelet function, which is measured by bleeding time.');

    ---------------------------------------------------------------------------
    -- CASE 57: HIT Type II (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Platelets and Heparin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Platelets and Heparin', 'A patient on heparin for 5 days has a platelet count drop from 200k to 80k.', 57) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on heparin for 5 days has a platelet count drop from 200k to 80k.', "order" = 57 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["ITP", "Heparin-Induced Thrombocytopenia (HIT)", "TTP", "DIC"]', 1, 'Drop in platelets by >50% on day 5-10 of heparin.'),
    (v_case_id, 'What is the pathogenetic mechanism?', '["Direct toxic effect of heparin", "Antibodies against PF4-Heparin complexes", "Platelet consumption in clots", "Bone marrow suppression"]', 1, 'Type II HIT is antibody-mediated.'),
    (v_case_id, 'Immediate next step?', '["Stop heparin and start Warfarin", "Stop heparin and start a direct thrombin inhibitor", "Give a platelet transfusion", "Observe and repeat labs"]', 1, 'Warfarin can cause skin necrosis in the acute phase of HIT; use Argatroban or Danaparoid instead.');

    ---------------------------------------------------------------------------
    -- CASE 58: DIC Labs (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bleeding from IV Sites' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bleeding from IV Sites', 'A septic patient is bleeding from IV sites. Labs: Platelets 40k, PT 25s, PTT 60s, Fibrinogen 100 mg/dL (Low), D-dimer 5000 (High).', 58) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A septic patient is bleeding from IV sites. Labs: Platelets 40k, PT 25s, PTT 60s, Fibrinogen 100 mg/dL (Low), D-dimer 5000 (High).', "order" = 58 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["TTP", "DIC (Disseminated Intravascular Coagulation)", "Liver failure", "ITP"]', 1, 'Combined clotting factor and platelet consumption.'),
    (v_case_id, 'Why is Fibrinogen low in DIC?', '["Liver stops making it", "It is consumed in widespread clot formation", "It is lost in urine", "Sepsis inhibits it"]', 1, 'The body uses up all its fibrinogen making microthrombi.'),
    (v_case_id, 'Finding on peripheral smear?', '["Target cells", "Schistocytes", "Bite cells", "Burr cells"]', 1, 'RBCs are fragmented as they pass through fibrin strands.');

    ---------------------------------------------------------------------------
    -- CASE 59: Procalcitonin (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Viral vs Bacterial COPD' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Viral vs Bacterial COPD', 'A patient with COPD has increased cough. Procalcitonin is 0.05 ng/mL (Low). CXR is clear.', 59) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with COPD has increased cough. Procalcitonin is 0.05 ng/mL (Low). CXR is clear.', "order" = 59 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the low procalcitonin suggest?', '["Severe bacterial pneumonia", "Viral infection or non-infectious flare", "Needs ICU admission", "Laboratory error"]', 1, 'Procalcitonin is very low in viral infections.'),
    (v_case_id, 'Procalcitonin is primarily used to guide:', '["Oxygen therapy", "Antibiotic initiation/duration", "Steroid dosing", "Inhaler choice"]', 1, 'Helps avoid unnecessary antibiotic use.'),
    (v_case_id, 'What cytokine suppresses procalcitonin in viral infections?', '["TNF-alpha", "IL-6", "Interferon-gamma", "IL-1"]', 2, 'IFN-gamma (secreted during viral infections) inhibits PCT production.');

    ---------------------------------------------------------------------------
    -- CASE 60: Troponin in Renal Failure (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Asymptomatic Troponin Elevation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Asymptomatic Troponin Elevation', 'A patient with End-Stage Renal Disease (ESRD) has a stable troponin I of 0.08 ng/mL (Elevated). He has no chest pain.', 60) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with End-Stage Renal Disease (ESRD) has a stable troponin I of 0.08 ng/mL (Elevated). He has no chest pain.', "order" = 60 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the troponin chronically elevated?', '["He is having a slow heart attack", "Decreased renal clearance and chronic myocardial strain", "Laboratory error", "Normal finding over age 60"]', 1, 'Troponin is cleared by the kidney and often elevated in stable ESRD due to LVH/strain.'),
    (v_case_id, 'What is the most important way to diagnose an acute MI in this patient?', '["A single high troponin", "Serial troponins showing a rise/fall delta", "EKG only", "Stress test only"]', 1, 'A delta (change) is required to diagnose acute injury on top of chronic elevation.'),
    (v_case_id, 'Which troponin is more frequently elevated in stable ESRD?', '["Troponin T", "Troponin I", "Both equally", "Neither"]', 0, 'Troponin T is more commonly elevated in chronic renal failure than Troponin I.');

    RAISE NOTICE 'SUCCESS: Common Lab Interpretation Case Blocks (31-60) registered.';
END $$;

COMMIT;
