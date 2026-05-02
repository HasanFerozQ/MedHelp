-- Clinical Skills & Diagnostics: ABG Interpretation - Part 1 (Cases 1-15)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: abg-interpretation

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'abg-interpretation' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'abg-interpretation';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: ABG Basics - Normal Ranges
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Learning the Numbers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Learning the Numbers', 'A medical student is reviewing arterial blood gas (ABG) results for a stable patient. The results are: pH 7.40, PaCO2 40 mmHg, HCO3 24 mEq/L.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student is reviewing arterial blood gas (ABG) results for a stable patient. The results are: pH 7.40, PaCO2 40 mmHg, HCO3 24 mEq/L.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the normal range for arterial pH?', '["7.15 - 7.25", "7.35 - 7.45", "7.45 - 7.55", "7.00 - 8.00"]', 1, 'Normal arterial pH is 7.35 to 7.45.'),
    (v_case_id, 'What is the normal range for arterial PaCO2?', '["25 - 35 mmHg", "35 - 45 mmHg", "45 - 55 mmHg", "20 - 30 mmHg"]', 1, 'Normal PaCO2 is 35 to 45 mmHg.'),
    (v_case_id, 'A pH below 7.35 is defined as:', '["Alkalemia", "Acidemia", "Eupnea", "Hypoxemia"]', 1, 'Acidemia is pH < 7.35. Alkalemia is pH > 7.45.');

    ---------------------------------------------------------------------------
    -- CASE 02: Respiratory Acidosis - Acute Opioid Overdose
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unresponsive and Pinpoint Pupils' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unresponsive and Pinpoint Pupils', 'A 24-year-old is brought to the ED unresponsive with a respiratory rate of 6 breaths/minute. ABG: pH 7.22, PaCO2 60 mmHg, HCO3 24 mEq/L.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old is brought to the ED unresponsive with a respiratory rate of 6 breaths/minute. ABG: pH 7.22, PaCO2 60 mmHg, HCO3 24 mEq/L.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Metabolic acidosis", "Respiratory acidosis", "Metabolic alkalosis", "Respiratory alkalosis"]', 1, 'Low pH and high PaCO2 indicate respiratory acidosis.'),
    (v_case_id, 'Is there evidence of renal compensation in this case?', '["Yes, full compensation", "Yes, partial compensation", "No", "Insufficient data"]', 2, 'In acute respiratory acidosis, the HCO3 only increases by ~1 mEq/L for every 10 mmHg increase in PaCO2. A normal HCO3 of 24 suggests an acute process without significant compensation.'),
    (v_case_id, 'What is the immediate next step in management?', '["Bicarbonate infusion", "Bag-valve mask ventilation and Naloxone", "Increase IV fluids", "Albuterol nebulizer"]', 1, 'The patient has severe hypoventilation; immediate airway support and reversal of the opioid effect are required.');

    ---------------------------------------------------------------------------
    -- CASE 03: Respiratory Alkalosis - Panic Attack
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anxiety and Tingling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anxiety and Tingling', 'A 19-year-old college student presents with palpitations and "tingling" around her mouth. She is hyperventilating. ABG: pH 7.52, PaCO2 25 mmHg, HCO3 20 mEq/L.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Anxiety and Tingling', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Respiratory alkalosis", "Metabolic alkalosis", "Respiratory acidosis", "Metabolic acidosis"]', 0, 'High pH and low PaCO2 indicate respiratory alkalosis.'),
    (v_case_id, 'What causes the "tingling" (paresthesias) in this patient?', '["Hypoxia", "Low ionized calcium due to increased binding to albumin", "Hyperkalemia", "Direct effect of low CO2 on nerves"]', 1, 'Alkalosis causes hydrogen ions to dissociate from albumin, allowing more calcium to bind. This reduces free ionized calcium, leading to neuromuscular excitability.'),
    (v_case_id, 'Which of the following would be an appropriate treatment?', '["Intubation", "Encouraging slow, deep breathing (or a paper bag)", "IV Sodium Bicarbonate", "Potassium supplementation"]', 1, 'Treating the underlying anxiety and slowing the respiratory rate will resolve the alkalosis.');

    ---------------------------------------------------------------------------
    -- CASE 04: Metabolic Acidosis - DKA (High Anion Gap)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Nausea and Fruity Breath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Nausea and Fruity Breath', 'A 15-year-old with Type 1 Diabetes presents with vomiting and deep, rapid breathing. ABG: pH 7.10, PaCO2 15 mmHg, HCO3 5 mEq/L. Na 135, Cl 100.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nausea and Fruity Breath', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the serum Anion Gap (AG).', '["10", "20", "30", "40"]', 2, 'AG = Na - (Cl + HCO3). AG = 135 - (100 + 5) = 30. (Normal ~12).'),
    (v_case_id, 'What is the compensatory respiratory pattern seen in this patient called?', '["Cheyne-Stokes breathing", "Kussmaul breathing", "Biot breathing", "Apneusis"]', 1, 'Kussmaul breathing is deep, rapid respiration used to blow off CO2 in severe metabolic acidosis.'),
    (v_case_id, 'Using Winters'' Formula (Expected PaCO2 = 1.5 * [HCO3] + 8 +/- 2), is the respiratory compensation appropriate?', '["Yes, PaCO2 is within expected range", "No, there is a concomitant respiratory acidosis", "No, there is a concomitant respiratory alkalosis", "Compensation is impossible"]', 0, 'Expected PaCO2 = 1.5(5) + 8 = 7.5 + 8 = 15.5 (+/- 2). The patient''s PaCO2 of 15 is within the expected range, indicating appropriate compensation.');

    ---------------------------------------------------------------------------
    -- CASE 05: Metabolic Alkalosis - Severe Vomiting
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Prolonged Emesis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Prolonged Emesis', 'A patient with a bowel obstruction has been vomiting for 48 hours. ABG: pH 7.55, PaCO2 48 mmHg, HCO3 40 mEq/L.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Prolonged Emesis', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Respiratory alkalosis", "Metabolic alkalosis", "Respiratory acidosis", "Metabolic acidosis"]', 1, 'High pH and high HCO3 indicate metabolic alkalosis.'),
    (v_case_id, 'Why is the PaCO2 elevated (48 mmHg)?', '["Concomitant lung disease", "Respiratory compensation (hypoventilation)", "Metabolic compensation", "It is a laboratory error"]', 1, 'The body compensates for metabolic alkalosis by decreasing ventilation to retain CO2 (acid).'),
    (v_case_id, 'This type of metabolic alkalosis (from vomiting) is typically:', '["Saline-responsive (Chloride-depleted)", "Saline-resistant (Mineralocorticoid excess)", "Normal Anion Gap", "Associated with hyperkalemia"]', 0, 'Vomiting causes loss of HCl and volume, leading to "contraction alkalosis" which responds to saline (NaCl) resuscitation.');

    ---------------------------------------------------------------------------
    -- CASE 06: Metabolic Acidosis - Normal Anion Gap (Diarrhea)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Severe Watery Diarrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Severe Watery Diarrhea', 'A patient with cholera has massive watery diarrhea. ABG: pH 7.28, PaCO2 32 mmHg, HCO3 15 mEq/L. Na 140, Cl 113.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Severe Watery Diarrhea', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the Anion Gap.', '["8", "12", "18", "22"]', 1, 'AG = 140 - (113 + 15) = 12. This is a Normal Anion Gap Metabolic Acidosis (NAGMA).'),
    (v_case_id, 'What is the primary mechanism of acidosis in severe diarrhea?', '["Gain of H+ ions", "Loss of HCO3- in the stool", "Renal failure", "Lactic acid production"]', 1, 'Diarrheal fluid is rich in bicarbonate; losing it leads to NAGMA.'),
    (v_case_id, 'Which of the following is another common cause of NAGMA?', '["Diabetic ketoacidosis", "Renal Tubular Acidosis (RTA)", "Salicylate overdose", "Methanol ingestion"]', 1, 'The acronym for NAGMA is HARDUPS: Hyperalimentation, Acetazolamide, Renal tubular acidosis, Diarrhea, Ureteroenteric fistula, Pancreaticoduodenal fistula, Spironolactone/Saline.');

    ---------------------------------------------------------------------------
    -- CASE 07: Salicylate Toxicity (Mixed Disorder)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aspirin Overdose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aspirin Overdose', 'A 30-year-old woman took a large bottle of aspirin. ABG: pH 7.42, PaCO2 20 mmHg, HCO3 13 mEq/L. AG is 22.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Aspirin Overdose', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most accurate description of this acid-base status?', '["Compensated metabolic acidosis", "Compensated respiratory alkalosis", "Mixed HAGMA and respiratory alkalosis", "Normal"]', 2, 'The pH is near normal (7.42), but both PaCO2 and HCO3 are very low. Salicylates stimulate the respiratory center (alkalosis) and uncouple oxidative phosphorylation (HAGMA).'),
    (v_case_id, 'Using Winters'' formula (Expected PaCO2 = 1.5 * 13 + 8 = 27.5), is the PaCO2 appropriate?', '["Yes", "No, it is lower than expected (concomitant resp alkalosis)", "No, it is higher than expected", "Formula does not apply"]', 1, 'The actual PaCO2 (20) is significantly lower than the expected compensatory PaCO2 (27.5), confirming a primary respiratory alkalosis co-existing with the metabolic acidosis.'),
    (v_case_id, 'What is the primary treatment for severe salicylate toxicity to enhance elimination?', '["Acidify the urine", "Alkalinize the urine with Sodium Bicarbonate", "Administer N-acetylcysteine", "Give Furosemide"]', 1, 'Alkalinizing the urine (and blood) traps the salicylate in its ionized form, facilitating renal excretion.');

    ---------------------------------------------------------------------------
    -- CASE 08: Methanol / Ethylene Glycol - The Osmolar Gap
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mysterious Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mysterious Ingestion', 'A patient is found unresponsive with a high anion gap metabolic acidosis. Measured serum osmolality is 330 mOsm/kg. Na 140, Glucose 90, BUN 28.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Mysterious Ingestion', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the Calculated Osmolality (2*Na + Glucose/18 + BUN/2.8).', '["280", "290", "300", "310"]', 2, 'Calc Osm = 2(140) + 90/18 + 28/2.8 = 280 + 5 + 10 = 295. Rounding to 300 is acceptable for quick checks. Actual: 295.'),
    (v_case_id, 'What is the Osmolar Gap (Measured - Calculated)?', '["10", "20", "35", "50"]', 2, 'Gap = 330 - 295 = 35 mOsm/kg. (Normal < 10).'),
    (v_case_id, 'A high anion gap metabolic acidosis WITH a high osmolar gap suggests ingestion of:', '["Aspirin", "Methanol or Ethylene Glycol", "Iron", "Lactic acid"]', 1, 'Small, osmotically active molecules like methanol and ethylene glycol cause both gaps.');

    ---------------------------------------------------------------------------
    -- CASE 09: Renal Tubular Acidosis (RTA) - Type 1 vs 2
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Distal vs Proximal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Distal vs Proximal', 'A patient has a normal anion gap metabolic acidosis. Their urine pH is 6.5 despite systemic acidemia.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Distal vs Proximal', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Type 1 (Distal) RTA", "Type 2 (Proximal) RTA", "Type 4 RTA", "Diarrhea"]', 0, 'In Type 1 RTA, the distal tubule cannot secrete H+ ions, resulting in a high urine pH (> 5.5) despite systemic acidosis.'),
    (v_case_id, 'Which RTA is associated with Fanconi syndrome and impaired HCO3 reabsorption?', '["Type 1", "Type 2", "Type 4", "Type 3"]', 1, 'Type 2 RTA is a defect in proximal bicarbonate reabsorption.'),
    (v_case_id, 'Type 4 RTA is characterized by which electrolyte abnormality?', '["Hypokalemia", "Hyperkalemia", "Hyponatremia", "Hypocalcemia"]', 1, 'Type 4 RTA is due to hypoaldosteronism or aldosterone resistance, leading to hyperkalemia.');

    ---------------------------------------------------------------------------
    -- CASE 10: Chronic Respiratory Acidosis - COPD
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue Bloater' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue Bloater', 'A 70-year-old smoker with severe COPD has a baseline ABG: pH 7.36, PaCO2 60 mmHg, HCO3 34 mEq/L.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blue Bloater', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would you classify this acid-base status?', '["Acute respiratory acidosis", "Compensated chronic respiratory acidosis", "Mixed metabolic alkalosis and respiratory acidosis", "Normal"]', 1, 'The pH is within the low-normal range, and the high HCO3 (34) indicates that the kidneys have had time (days) to compensate for the chronic CO2 retention.'),
    (v_case_id, 'In chronic respiratory acidosis, for every 10 mmHg increase in PaCO2, the HCO3 should increase by approximately:', '["1 mEq/L", "2 mEq/L", "3.5 - 4 mEq/L", "10 mEq/L"]', 2, 'Chronic rule: 3.5 to 4 mEq/L increase in HCO3 per 10 mmHg CO2. (40 to 60 = 20 mmHg increase; 2*4 = 8; 24 + 8 = 32). This fits.'),
    (v_case_id, 'What is the primary stimulus for breathing in this chronic CO2 retainer?', '["High PaCO2", "Low pH", "Low PaO2 (Hypoxic drive)", "High HCO3"]', 2, 'Chronic retainers become desensitized to high CO2; their primary drive becomes hypoxia.');

    ---------------------------------------------------------------------------
    -- CASE 11: Metabolic Alkalosis - Diuretics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Leg Swelling and Meds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Leg Swelling and Meds', 'A patient with heart failure is started on high-dose furosemide. ABG shows: pH 7.50, PaCO2 44 mmHg, HCO3 32 mEq/L. Urine Chloride is 5 mEq/L.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Leg Swelling and Meds', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Contraction alkalosis", "Saline-resistant alkalosis", "Respiratory alkalosis", "NAGMA"]', 0, 'Diuretics cause loss of chloride, volume, and H+ ions, leading to a saline-responsive metabolic alkalosis.'),
    (v_case_id, 'A low urine chloride (< 15-20 mEq/L) suggests the alkalosis is:', '["Chloride-responsive", "Chloride-resistant", "Due to hyperaldosteronism", "Laboratory error"]', 0, 'Low urine chloride indicates the body is avidly retaining chloride and volume, making it "responsive" to saline resuscitation.'),
    (v_case_id, 'Which electrolyte is also typically low in this patient?', '["Sodium", "Potassium", "Magnesium", "All of the above"]', 3, 'Loop diuretics cause loss of Na, K, Mg, and H+.');

    ---------------------------------------------------------------------------
    -- CASE 12: Mixed Disorder - Sepsis and Vomiting
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Septic Vomiter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Septic Vomiter', 'A patient with sepsis (lactic acidosis) is also vomiting. ABG: pH 7.40, PaCO2 40 mmHg, HCO3 24 mEq/L. AG is 28.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Septic Vomiter', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The ABG looks normal, but the AG is 28. What does this indicate?', '["Laboratory error", "The patient is healthy", "Mixed HAGMA and metabolic alkalosis", "Compensated acidosis"]', 2, 'The high AG (28) proves a HAGMA exists. Since the pH and HCO3 are normal, there must be a simultaneous metabolic alkalosis (e.g., from vomiting) "hiding" the low HCO3.'),
    (v_case_id, 'What is the Delta-Delta ( ΔAG / ΔHCO3 ) in this patient? (Assume normal AG 12, normal HCO3 24)', '["0.5", "1.0", " > 2.0", "Negative"]', 2, 'ΔAG = 28 - 12 = 16. ΔHCO3 = 24 - 24 = 0. A ΔAG > ΔHCO3 (ratio > 2) indicates a concurrent metabolic alkalosis.'),
    (v_case_id, 'If the ratio was < 0.4, what would it suggest?', '["Concomitant NAGMA", "Concomitant Metabolic Alkalosis", "Pure HAGMA", "Respiratory Acidosis"]', 0, 'A low Delta-Delta ratio suggests a concomitant normal anion gap metabolic acidosis.');

    ---------------------------------------------------------------------------
    -- CASE 13: Respiratory Alkalosis - Pulmonary Embolism
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Op Dyspnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Op Dyspnea', 'A patient 3 days post-hip surgery has sudden onset shortness of breath. ABG: pH 7.48, PaCO2 30 mmHg, PaO2 60 mmHg (on room air).', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-Op Dyspnea', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the A-a gradient for this patient? (Age 20, PAO2 ≈ 150 - 1.25*PaCO2)', '["10", "25", "52", "100"]', 2, 'PAO2 = 150 - (1.25 * 30) = 150 - 37.5 = 112.5. Gradient = PAO2 - PaO2 = 112.5 - 60 = 52.5. This is highly elevated.'),
    (v_case_id, 'What is the most likely diagnosis?', '["Panic attack", "Pulmonary Embolism", "COPD", "Opiate overdose"]', 1, 'Sudden dyspnea, respiratory alkalosis (tachypnea), and a high A-a gradient (hypoxemia) are classic for PE.'),
    (v_case_id, 'Why is the pH alkaline?', '["Kidneys are losing acid", "Tachypnea causing CO2 washout", "Metabolic compensation", "The patient is taking antacids"]', 1, 'Tachypnea from lung irritation/hypoxia leads to excessive CO2 removal.');

    ---------------------------------------------------------------------------
    -- CASE 14: Metabolic Acidosis - Ethylene Glycol
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Antifreeze Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Antifreeze Ingestion', 'A patient is brought in with severe metabolic acidosis. Urinalysis shows "envelope-shaped" crystals.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Antifreeze Ingestion', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these crystals?', '["Uric acid", "Calcium oxalate", "Cystine", "Struvite"]', 1, 'Ethylene glycol is metabolized to oxalic acid, which precipitates as calcium oxalate crystals.'),
    (v_case_id, 'What is a major organ system complication of this toxicity?', '["Liver failure", "Acute Kidney Injury", "Pancreatitis", "Thyroid storm"]', 1, 'Calcium oxalate crystals cause significant renal tubular damage and AKI.'),
    (v_case_id, 'What is the antidote that inhibits alcohol dehydrogenase?', '["Fomepizole", "N-acetylcysteine", "Glucagon", "Atropine"]', 0, 'Fomepizole prevents the metabolism of ethylene glycol and methanol into their toxic acidic metabolites.');

    ---------------------------------------------------------------------------
    -- CASE 15: Isopropyl Alcohol - The Gap without Acidosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rubbing Alcohol' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rubbing Alcohol', 'A patient presents with altered mental status and a "fruity" smell on their breath. ABG: pH 7.38, PaCO2 40 mmHg, HCO3 24 mEq/L. Anion gap is 10. Osmolar gap is 40.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rubbing Alcohol', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely ingestion?', '["Methanol", "Ethylene glycol", "Isopropyl alcohol", "Ethanol"]', 2, 'Isopropyl alcohol causes a high osmolar gap and ketonemia (acetone - fruity breath) but does NOT cause a metabolic acidosis because its metabolite (acetone) is not an acid.'),
    (v_case_id, 'What is the primary treatment for isopropyl alcohol ingestion?', '["Fomepizole", "Dialysis", "Supportive care", "Bicarbonate"]', 2, 'Isopropyl alcohol toxicity is generally less severe than methanol/ethylene glycol and is treated supportively.'),
    (v_case_id, 'Why is there no metabolic acidosis?', '["It is not absorbed", "The metabolite is acetone, which is a ketone but not an acid", "The kidneys excrete it too fast", "It is an alkaline substance"]', 1, 'Acetone does not contain a carboxylic acid group, unlike formic or glycolic acid.');

END $$;

COMMIT;
