BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for ABG Interpretation
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'abg-interpretation' LIMIT 1;

    -- CASE 01: Normal ABG Values
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Baseline Reading', 'A healthy 25-year-old male is being used as a control for a medical student teaching session. His ABG results are: pH 7.40, pCO2 40 mmHg, pO2 95 mmHg, HCO3 24 mEq/L, and SaO2 98%.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the normal range for arterial pH?', '["7.25 - 7.35", "7.35 - 7.45", "7.45 - 7.55", "7.00 - 7.80"]', 1, 'The body tightly regulates arterial pH between 7.35 and 7.45.'),
    (v_case_id, 'What is the normal range for arterial pCO2?', '["25 - 35 mmHg", "35 - 45 mmHg", "45 - 55 mmHg", "15 - 25 mmHg"]', 1, 'Normal pCO2 is 35-45 mmHg.'),
    (v_case_id, 'What is the normal range for arterial Bicarbonate (HCO3)?', '["12 - 18 mEq/L", "18 - 22 mEq/L", "22 - 28 mEq/L", "28 - 34 mEq/L"]', 2, 'Normal HCO3 is typically 22-28 mEq/L.');

    -- CASE 02: Respiratory Acidosis - COPD Exacerbation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Somnolent Smoker', 'A 70-year-old male with severe COPD presents with increased SOB and confusion. ABG: pH 7.25, pCO2 70 mmHg, pO2 55 mmHg, HCO3 30 mEq/L.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Metabolic Acidosis", "Respiratory Acidosis", "Metabolic Alkalosis", "Respiratory Alkalosis"]', 1, 'Low pH (< 7.35) and high pCO2 (> 45) indicate respiratory acidosis.'),
    (v_case_id, 'The elevated HCO3 (30 mEq/L) represents:', '["A second primary metabolic disorder", "Renal compensation for chronic CO2 retention", "Metabolic alkalosis from diuretics", "Lab error"]', 1, 'In chronic respiratory acidosis, the kidneys retain bicarbonate to buffer the pH.'),
    (v_case_id, 'What is the most likely cause of this patient''s hypoventilation?', '["Panic attack", "Decreased respiratory drive or obstructive air trapping", "Aspirin overdose", "Diarrhea"]', 1, 'COPD causes air trapping and impaired gas exchange, leading to CO2 retention.');

    -- CASE 03: Respiratory Alkalosis - Anxiety
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Panicked Student', 'A 22-year-old medical student presents to the ER with tingling in her hands and around her mouth. She is breathing rapidly. ABG: pH 7.55, pCO2 25 mmHg, pO2 105 mmHg, HCO3 22 mEq/L.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Metabolic Acidosis", "Respiratory Acidosis", "Metabolic Alkalosis", "Respiratory Alkalosis"]', 3, 'High pH (> 7.45) and low pCO2 (< 35) indicate respiratory alkalosis.'),
    (v_case_id, 'Why does hyperventilation cause tingling (paresthesias)?', '["Low CO2 directly irritates nerves", "Respiratory alkalosis causes a decrease in ionized Calcium (hypocalcemia)", "The student is dehydrated", "It increases cerebral blood flow"]', 1, 'Alkalosis causes albumin to bind more calcium, lowering the ionized (active) fraction and causing tetany/paresthesias.'),
    (v_case_id, 'How do the kidneys compensate for persistent respiratory alkalosis?', '["By retaining HCO3", "By excreting HCO3", "By retaining H+", "They do not compensate"]', 1, 'The kidneys excrete bicarbonate to bring the pH back down toward normal.');

    -- CASE 04: Metabolic Acidosis - DKA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thirsty Teenager', 'A 15-year-old male with new-onset Type 1 Diabetes presents with abdominal pain. ABG: pH 7.10, pCO2 20 mmHg, pO2 100 mmHg, HCO3 6 mEq/L. Electrolytes: Na 140, Cl 104, K 5.0.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Metabolic Acidosis", "Respiratory Acidosis", "Metabolic Alkalosis", "Respiratory Alkalosis"]', 0, 'Low pH (< 7.35) and low HCO3 (< 22) indicate metabolic acidosis.'),
    (v_case_id, 'What is the calculated Anion Gap (AG)?', '["10", "20", "30", "40"]', 2, 'AG = Na - (Cl + HCO3) = 140 - (104 + 6) = 30. A normal AG is 10-12.'),
    (v_case_id, 'The low pCO2 (20 mmHg) is a result of:', '["Primary respiratory alkalosis", "Respiratory compensation (Kussmaul breathing)", "Heart failure", "Pain"]', 1, 'The lungs blow off CO2 to compensate for the metabolic acid load.');

    -- CASE 05: Winter''s Formula - Checking Compensation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Is the Compensation Correct?', 'Using the previous case (pH 7.10, pCO2 20, HCO3 6), you want to check if the respiratory compensation is appropriate.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Winter''s Formula for expected pCO2 in metabolic acidosis?', '["pCO2 = 1.5 * [HCO3] + 8 (+/- 2)", "pCO2 = 0.7 * [HCO3] + 20", "pCO2 = [HCO3] + 15", "pCO2 = 40 - [HCO3]"]', 0, 'Winter''s formula: Expected pCO2 = (1.5 * HCO3) + 8 +/- 2.'),
    (v_case_id, 'What is the expected pCO2 for this patient (HCO3 = 6)?', '["12 - 16 mmHg", "15 - 19 mmHg", "20 - 24 mmHg", "24 - 28 mmHg"]', 1, '(1.5 * 6) + 8 = 9 + 8 = 17. Range: 15-19 mmHg.'),
    (v_case_id, 'Since the actual pCO2 (20 mmHg) is slightly higher than expected (17 mmHg), what additional disorder might be present?', '["Concomitant Respiratory Alkalosis", "Concomitant Respiratory Acidosis (Relative hypoventilation)", "Metabolic Alkalosis", "No other disorder"]', 1, 'If actual pCO2 > expected pCO2, the patient is not breathing enough, indicating a secondary respiratory acidosis.');

    -- CASE 06: Metabolic Acidosis - Diarrhea
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dehydrated Patient', 'A 30-year-old male with 3 days of severe watery diarrhea. ABG: pH 7.30, pCO2 32 mmHg, HCO3 16 mEq/L. Electrolytes: Na 140, Cl 114.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the calculated Anion Gap?', '["6", "10", "14", "18"]', 1, 'AG = 140 - (114 + 16) = 140 - 130 = 10. This is a normal anion gap.'),
    (v_case_id, 'What is the most common cause of Normal Anion Gap Metabolic Acidosis (NAGMA)?', '["DKA", "Diarrhea", "Renal failure", "Lactic acidosis"]', 1, 'Diarrhea causes loss of bicarbonate-rich fluid from the GI tract.'),
    (v_case_id, 'What is another name for NAGMA?', '["High anion gap acidosis", "Hyperchloremic metabolic acidosis", "Lactic acidosis", "Respiratory acidosis"]', 1, 'As HCO3 is lost, the kidneys retain Chloride to maintain electrical neutrality, leading to hyperchloremia.');

    -- CASE 07: Metabolic Alkalosis - Vomiting
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Excessive Vomiting', 'A 40-year-old male with a small bowel obstruction has been vomiting for 24 hours. ABG: pH 7.52, pCO2 48 mmHg, HCO3 38 mEq/L. Electrolytes: Na 138, Cl 90, K 3.2.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Metabolic Acidosis", "Respiratory Acidosis", "Metabolic Alkalosis", "Respiratory Alkalosis"]', 2, 'High pH and high HCO3 indicate metabolic alkalosis.'),
    (v_case_id, 'Why does vomiting cause metabolic alkalosis?', '["Loss of CO2", "Loss of gastric HCl", "Loss of bicarbonate in stool", "Retention of potassium"]', 1, 'Vomiting causes loss of Hydrogen and Chloride ions from the stomach.'),
    (v_case_id, 'The pCO2 of 48 mmHg is a result of:', '["Primary respiratory acidosis", "Respiratory compensation (hypoventilation)", "Metabolic compensation", "Pain"]', 1, 'The body slows breathing to retain CO2 and lower the pH.');

    -- CASE 08: Salicylate Poisoning - Mixed Disorder
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Aspirin Overdose', 'A 50-year-old male presents with tinnitus and confusion after ingesting a large bottle of aspirin. ABG: pH 7.42, pCO2 20 mmHg, HCO3 13 mEq/L.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is unique about the pH in this case?', '["It is dangerously low", "It is near-normal despite significant CO2 and HCO3 abnormalities", "It indicates alkalemia", "It indicates acidemia"]', 1, 'A near-normal pH with significantly low CO2 and HCO3 suggests a mixed disorder.'),
    (v_case_id, 'What two primary disorders are present in salicylate poisoning?', '["Metabolic Acidosis and Respiratory Acidosis", "Metabolic Acidosis and Respiratory Alkalosis", "Metabolic Alkalosis and Respiratory Alkalosis", "Two types of Metabolic Acidosis"]', 1, 'Salicylates stimulate the respiratory center (Resp Alk) and interfere with metabolism (High AG Met Acid).'),
    (v_case_id, 'If this were ONLY metabolic acidosis with HCO3 = 13, what would be the expected pCO2 (Winter''s Formula)?', '["20 mmHg", "27-28 mmHg", "35 mmHg", "40 mmHg"]', 1, '(1.5 * 13) + 8 = 19.5 + 8 = 27.5. Since the actual pCO2 (20) is much lower than 27, there is a second primary respiratory alkalosis.');

    -- CASE 09: Mixed Disorder - Delta-Delta Gap
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Complex Mixed Case', 'A patient with chronic vomiting (metabolic alkalosis) develops sepsis and lactic acidosis (high AG metabolic acidosis). Labs: Na 140, Cl 90, HCO3 26, AG 24.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Delta AG" (Actual AG - Normal AG)?', '["4", "8", "12", "16"]', 2, 'Actual AG (24) - Normal AG (12) = 12.'),
    (v_case_id, 'What is the "Delta-Delta" (Delta AG + Actual HCO3)?', '["24", "30", "38", "44"]', 2, 'Delta AG (12) + Actual HCO3 (26) = 38.'),
    (v_case_id, 'Since the Delta-Delta (38) is much higher than a normal HCO3 (24), what hidden disorder is present?', '["NAGMA", "Hidden Metabolic Alkalosis", "Respiratory Acidosis", "No hidden disorder"]', 1, 'A Delta-Delta > 26 indicates a concurrent metabolic alkalosis.');

    -- CASE 10: Chronic Respiratory Acidosis - Compensation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Bloater', 'A 65-year-old male with stable COPD has a baseline ABG: pH 7.36, pCO2 60 mmHg, pO2 65 mmHg, HCO3 34 mEq/L.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rule for HCO3 compensation in CHRONIC respiratory acidosis?', '["HCO3 rises by 1 for every 10 CO2", "HCO3 rises by 4 for every 10 CO2", "HCO3 falls by 2 for every 10 CO2", "No compensation occurs"]', 1, 'In chronic respiratory acidosis, the kidneys are very efficient, increasing HCO3 by about 3.5 to 4 mEq/L for every 10 mmHg rise in pCO2.'),
    (v_case_id, 'Compared to a normal pCO2 of 40, this patient''s pCO2 is elevated by 20. What is the expected HCO3 rise?', '["2 mEq/L", "4 mEq/L", "8 mEq/L", "12 mEq/L"]', 2, '2 * 4 = 8. Normal HCO3 (24) + 8 = 32. The actual 34 is close to expected.'),
    (v_case_id, 'If this were an ACUTE rise in pCO2 (e.g., drug overdose), how much would the HCO3 rise?', '["1 mEq/L per 10 CO2", "4 mEq/L per 10 CO2", "10 mEq/L per 10 CO2", "It wouldn''t rise at all"]', 0, 'In acute respiratory acidosis, the kidneys haven''t had time to act; the small rise in HCO3 (1 per 10) is due to chemical buffering.');

    -- CASE 11: A-a Gradient - Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypoxemia with Fever', 'A 60-year-old male with pneumonia. ABG on room air: pH 7.45, pCO2 30 mmHg, pO2 60 mmHg. (Assume FiO2 = 0.21, Patm = 760, PH2O = 47).', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the Alveolar Oxygen (PAO2) using the simplified equation: PAO2 = [0.21 * (760-47)] - (pCO2 / 0.8).', '["80 mmHg", "90 mmHg", "100 mmHg", "112 mmHg"]', 3, 'PAO2 = 150 - (30/0.8) = 150 - 37.5 = 112.5 mmHg.'),
    (v_case_id, 'What is the A-a Gradient (PAO2 - paO2)?', '["12.5", "32.5", "52.5", "72.5"]', 2, 'PAO2 (112.5) - paO2 (60) = 52.5 mmHg.'),
    (v_case_id, 'Is this A-a gradient normal for a 60-year-old? (Estimate: Age/4 + 4)', '["Yes", "No, it is significantly elevated"]', 1, 'Normal for 60 is (60/4 + 4) = 19. An A-a gradient of 52.5 is high, indicating a V/Q mismatch or shunt (e.g., pneumonia).');

    -- CASE 12: A-a Gradient - Hypoventilation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypoxemia after Surgery', 'A patient is somnolent after receiving morphine. ABG: pH 7.20, pCO2 80 mmHg, pO2 50 mmHg. Calculated PAO2 is 50 mmHg.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the A-a Gradient?', '["0", "20", "40", "60"]', 0, 'PAO2 (50) - paO2 (50) = 0.'),
    (v_case_id, 'A NORMAL A-a gradient in a hypoxic patient indicates:', '["Pneumonia", "Pulmonary Embolism", "Extrapulmonary cause (Hypoventilation or Altitude)", "Heart failure"]', 2, 'If the A-a gradient is normal, the lungs are working fine; the patient just isn''t breathing enough air into the alveoli.'),
    (v_case_id, 'What is the most likely cause of hypoxia in this patient?', '["Atelectasis", "Opiate-induced hypoventilation", "Pulmonary edema", "Shunt"]', 1, 'The morphine overdose caused a high pCO2 and low pO2 with a normal A-a gradient.');

    -- CASE 13: MUDPILES - Methanol
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blind Alcoholic', 'A 45-year-old male presents with severe abdominal pain and blurred vision ("seeing snow"). ABG: pH 7.15, AG 28. Serum Osmolality is 340 mOsm/kg (Calculated Osm: 290).', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely toxic ingestion?', '["Ethanol", "Methanol", "Isopropyl alcohol", "Aspirin"]', 1, 'Methanol causes high AG metabolic acidosis and characteristic visual symptoms.'),
    (v_case_id, 'What is the "Osmolar Gap"?', '["10", "30", "50", "70"]', 2, 'Measured (340) - Calculated (290) = 50. A gap > 10 suggests a small unmeasured osmole (like an alcohol).'),
    (v_case_id, 'What is the toxic metabolite of Methanol?', '["Oxalic acid", "Formic acid", "Acetic acid", "Lactic acid"]', 1, 'Methanol is metabolized to formic acid, which is toxic to the optic nerve.');

    -- CASE 14: Ethylene Glycol
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Antifreeze Ingestion', 'A patient presents with acute renal failure and a high AG metabolic acidosis. Microscopic urinalysis shows envelope-shaped crystals.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely toxin?', '["Methanol", "Ethylene Glycol", "Toluene", "Propylene glycol"]', 1, 'Ethylene glycol (antifreeze) causes renal failure and calcium oxalate crystals in the urine.'),
    (v_case_id, 'What is the shape of Calcium Oxalate monohydrate crystals?', '["Envelopes", "Dumbbells/Needles", "Hexagons", "Coffin lids"]', 1, 'Monohydrate are dumbbells/needles; dihydrate are the classic envelopes.'),
    (v_case_id, 'What medication is used to block alcohol dehydrogenase and prevent the formation of toxic metabolites?', '["Atropine", "Fomepizole", "N-acetylcysteine", "Naloxone"]', 1, 'Fomepizole is the antidote for methanol and ethylene glycol poisoning.');

    -- CASE 15: Metabolic Alkalosis - Chloride Responsive
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vomiting vs. Diuretics', 'A patient has metabolic alkalosis (pH 7.50, HCO3 35). You measure the Urinary Chloride, and it is 5 mEq/L (Low).', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a Low Urinary Chloride (< 10-20 mEq/L) indicate?', '["Chloride-responsive alkalosis", "Chloride-resistant alkalosis", "Primary hyperaldosteronism", "Bartter syndrome"]', 0, 'Low urine Cl suggests the body is holding onto Cl due to volume depletion (e.g., vomiting, remote diuretic use).'),
    (v_case_id, 'What is the most effective initial treatment for this patient?', '["IV Potassium sparing diuretics", "IV Normal Saline", "Hydrochloric acid infusion", "Acetazolamide"]', 1, 'Providing volume and Chloride (Saline) allows the kidneys to excrete the excess bicarbonate.'),
    (v_case_id, 'A HIGH urinary Chloride in the setting of metabolic alkalosis would suggest:', '["Vomiting", "Conn''s Syndrome (Hyperaldosteronism)", "Dehydration", "Laxative abuse"]', 1, 'Chloride-resistant alkalosis (High Urine Cl) is often due to mineralocorticoid excess.');

    -- CASE 16: Lactic Acidosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sepsis and Acidosis', 'A 70-year-old male with a UTI develops hypotension and a high AG metabolic acidosis. Serum Lactate is 8.0 mmol/L.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of lactic acidosis is this (Type A vs. Type B)?', '["Type A", "Type B"]', 0, 'Type A is due to tissue hypoxia/hypoperfusion (e.g., shock).'),
    (v_case_id, 'What is a common cause of Type B lactic acidosis?', '["Hypovolemic shock", "Metformin toxicity", "Heart failure", "Severe anemia"]', 1, 'Type B occurs without overt hypoxia, often due to toxins (Metformin), malignancy, or liver failure.'),
    (v_case_id, 'What is the most important treatment for Type A lactic acidosis?', '["Sodium Bicarbonate infusion", "Restoring tissue perfusion (Fluids/Vasopressors)", "Dialysis", "Antibiotics alone"]', 1, 'The acidosis will clear once oxygen delivery to the tissues is restored.');

    -- CASE 17: Renal Tubular Acidosis - Type 1
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Distal RTA', 'A 25-year-old female with Sjögren''s syndrome has a chronic NAGMA (HCO3 15). Her Urine pH is consistently 6.5 (High).', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which type of RTA is this?', '["Type 1 (Distal)", "Type 2 (Proximal)", "Type 4 (Hyperkalemic)", "None"]', 0, 'Type 1 RTA is characterized by an inability to secrete H+ in the distal tubule, leading to a high urine pH (> 5.5).'),
    (v_case_id, 'What electrolyte abnormality is typically seen in Type 1 and Type 2 RTA?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hyponatremia"]', 1, 'Both distal and proximal RTA usually present with hypokalemia.'),
    (v_case_id, 'What is a common skeletal complication of Type 1 RTA?', '["Bone spurs", "Nephrolithiasis (Calcium phosphate stones)", "Osteoporosis", "Gout"]', 1, 'The alkaline urine and systemic acidosis lead to hypercalciuria and kidney stones.');

    -- CASE 18: Renal Tubular Acidosis - Type 2
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Proximal RTA', 'A patient with Multiple Myeloma has NAGMA, glycosuria, and aminoaciduria despite normal blood sugar levels.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this generalized proximal tubule dysfunction?', '["Bartter Syndrome", "Fanconi Syndrome", "Gitelman Syndrome", "Liddle Syndrome"]', 1, 'Fanconi syndrome involves wasting of glucose, amino acids, phosphate, and bicarbonate.'),
    (v_case_id, 'Which type of RTA is associated with Fanconi syndrome?', '["Type 1", "Type 2", "Type 4", "Type 3"]', 1, 'Type 2 RTA is due to impaired HCO3 reabsorption in the proximal tubule.'),
    (v_case_id, 'What happens to the Urine pH in Type 2 RTA if the serum HCO3 falls below the renal threshold?', '["It stays high (> 6.0)", "It can drop below 5.5", "It becomes neutral (7.0)", "It oscillates"]', 1, 'Once the serum level is low enough, the distal tubule can still acidify the urine, unlike Type 1.');

    -- CASE 19: Renal Tubular Acidosis - Type 4
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperkalemic RTA', 'An elderly diabetic patient with mild renal insufficiency is started on an ACE inhibitor and develops hyperkalemia and a NAGMA.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which type of RTA is this?', '["Type 1", "Type 2", "Type 4", "None"]', 2, 'Type 4 RTA is associated with hypoaldosteronism or aldosterone resistance, causing HYPERkalemia.'),
    (v_case_id, 'What is the primary defect in Type 4 RTA?', '["Bicarbonate wasting", "Failure to secrete H+", "Decreased NH4+ excretion due to low Aldosterone effect", "Excessive H+ reabsorption"]', 2, 'Aldosterone deficiency leads to hyperkalemia and reduced ammonia production in the kidney.'),
    (v_case_id, 'Which of the following drugs can cause a Type 4 RTA?', '["Spironolactone", "Amiloride", "NSAIDs", "All of the above"]', 3, 'Any drug that interferes with the RAAS system or aldosterone action can cause Type 4 RTA.');

    -- CASE 20: Carbon Monoxide Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The House Fire Patient', 'A patient is rescued from a house fire. He is confused and has "cherry-red" skin. ABG: pH 7.30, pCO2 35, pO2 95 mmHg, SaO2 (from ABG) 98%, but Pulse Oximetry is 98% and he is cyanotic.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the pO2 and SaO2 on the ABG normal?', '["The patient is fine", "pO2 measures dissolved oxygen, which is unaffected by CO; SaO2 on ABG is often CALCULATED, not measured", "CO increases oxygen binding", "The lab made a mistake"]', 1, 'CO competes with O2 for hemoglobin; it doesn''t affect dissolved O2 (pO2). Most ABG machines calculate SaO2 from pO2, which will be falsely normal.'),
    (v_case_id, 'What is the most accurate way to measure the oxygen saturation in this patient?', '["Pulse oximetry", "Co-oximetry", "Repeat ABG", "Venous blood gas"]', 1, 'Co-oximetry specifically measures carboxyhemoglobin.'),
    (v_case_id, 'What is the treatment for severe CO poisoning?', '["Low flow oxygen", "100% High flow oxygen or Hyperbaric oxygen", "Fomepizole", "Sodium Bicarbonate"]', 1, '100% O2 competes with CO to displace it from hemoglobin.');

    -- CASE 21: Methemoglobinemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chocolate-Colored Blood', 'A patient develops sudden cyanosis after being given Benzocaine spray for an endoscopy. Her blood appears dark brown, and her pulse oximetry is "stuck" at 85% despite high-flow oxygen.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Carbon monoxide poisoning", "Methemoglobinemia", "Pulmonary embolism", "Heart failure"]', 1, 'Oxidizing agents (like benzocaine or nitrates) convert Fe2+ to Fe3+, forming methemoglobin.'),
    (v_case_id, 'Why does the pulse oximeter read 85%?', '["The patient has 85% oxygen", "Methemoglobin absorbs light at both wavelengths used by the pulse ox, giving a false reading", "The sensor is broken", "The patient is in shock"]', 1, 'Methemoglobin interferes with standard pulse oximetry.'),
    (v_case_id, 'What is the treatment for symptomatic methemoglobinemia?', '["N-acetylcysteine", "Methylene Blue", "Fomepizole", "Atropine"]', 1, 'Methylene blue acts as a cofactor for the enzyme that reduces methemoglobin back to hemoglobin.');

    -- CASE 22: ABG - Quality Control (Venous vs Arterial)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Is this an Artery or a Vein?', 'You draw an ABG from the radial site, but the results come back: pH 7.32, pCO2 50 mmHg, pO2 40 mmHg, Oxygen Saturation 70%.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely explanation for these results?', '["Severe respiratory failure", "The sample is venous blood", "The patient has a large shunt", "The machine is broken"]', 1, 'Low pO2 (~40) and slightly higher pCO2 are typical for a venous sample.'),
    (v_case_id, 'How can you clinically confirm the needle is in the artery during the draw?', '["The blood is dark", "The syringe fills spontaneously with pulsatile, bright red blood", "The patient screams", "The blood is thin"]', 1, 'Arterial blood should be pulsatile and self-filling.'),
    (v_case_id, 'What test should be performed BEFORE a radial artery puncture to ensure collateral circulation?', '["Phalen test", "Allen test", "Adson test", "Tinel test"]', 1, 'The Allen test checks the patency of the ulnar artery.');

    -- CASE 23: Altitude - Respiratory Alkalosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hiking in the Himalayas', 'A healthy 25-year-old hiker at 15,000 feet. ABG: pH 7.48, pCO2 28 mmHg, pO2 55 mmHg, HCO3 20 mEq/L.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["Respiratory Acidosis", "Respiratory Alkalosis", "Metabolic Acidosis", "Metabolic Alkalosis"]', 1, 'Low pCO2 and high pH due to hyperventilation in response to low ambient O2.'),
    (v_case_id, 'What is the A-a gradient in this patient? (Assume PAO2 at this altitude is 60 mmHg)', '["5 mmHg", "25 mmHg", "45 mmHg", "65 mmHg"]', 0, 'PAO2 (60) - paO2 (55) = 5 mmHg. This is a NORMAL A-a gradient.'),
    (v_case_id, 'Why is the A-a gradient normal?', '["The hiker is young", "The hypoxia is due to low inspired oxygen, not a lung problem", "The hiker is taking Diamox", "The calculation is wrong"]', 1, 'At altitude, the problem is low FiO2; the lungs themselves are transferring gas perfectly.');

    -- CASE 24: Pickwickian Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Obesity Hypoventilation', 'A 45-year-old male with a BMI of 55 presents with daytime somnolence. ABG on room air: pH 7.35, pCO2 55 mmHg, pO2 65 mmHg, HCO3 30 mEq/L.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Obesity Hypoventilation Syndrome (Pickwickian)", "COPD", "Pulmonary Fibrosis", "Simple Obesity"]', 0, 'OHS is defined by obesity, daytime hypercapnia, and sleep-disordered breathing in the absence of other causes.'),
    (v_case_id, 'What is the A-a gradient likely to be in this patient?', '["Extremely high", "Normal", "Negative", "Unpredictable"]', 1, 'Simple hypoventilation (like in OHS) characteristically has a normal A-a gradient.'),
    (v_case_id, 'What is the long-term complication of chronic hypoxemia and hypercapnia in OHS?', '["Left heart failure", "Pulmonary hypertension and Cor Pulmonale", "Lung cancer", "Asthma"]', 1, 'Chronic hypoxia causes pulmonary vasoconstriction and right heart failure.');

    -- CASE 25: Triple Disorder
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sickest Patient', 'A patient with chronic vomiting (Met Alk) develops DKA (High AG Met Acid) and pneumonia (Resp Acid). Labs: pH 7.20, pCO2 50, HCO3 20, Na 140, Cl 90.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the calculated Anion Gap?', '["10", "20", "30", "40"]', 2, '140 - (90 + 20) = 30. (High AG Met Acid).'),
    (v_case_id, 'What is the expected pCO2 using Winter''s Formula (for HCO3 20)?', '["38 +/- 2", "30 +/- 2", "45 +/- 2", "20 +/- 2"]', 0, '(1.5 * 20) + 8 = 38 +/- 2.'),
    (v_case_id, 'Since the actual pCO2 is 50 mmHg (much higher than 38), what additional disorder is present?', '["Respiratory Alkalosis", "Respiratory Acidosis", "No additional disorder", "Metabolic Alkalosis"]', 1, 'Actual pCO2 > Expected pCO2 indicates an additional respiratory acidosis.');

    -- CASE 26: Diuretics and Alkalosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Loop Diuretics', 'A patient with CHF is started on high-dose Furosemide. ABG: pH 7.50, HCO3 34, pCO2 45, K 2.8, Cl 85.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Contraction Alkalosis", "Dilutional Acidosis", "Respiratory Acidosis", "NAGMA"]', 0, 'Loss of fluid and chloride causes "contraction" of the extracellular volume around a fixed amount of bicarbonate.'),
    (v_case_id, 'What role does Hypokalemia play in maintaining this alkalosis?', '["It has no role", "It causes H+ to shift into cells in exchange for K+, and increases H+ secretion in the distal tubule", "It causes vomiting", "It decreases pCO2"]', 1, 'Potassium depletion worsens metabolic alkalosis by promoting H+ excretion ("paradoxical aciduria").'),
    (v_case_id, 'Would the urinary chloride be low or high in this patient WHILE taking the diuretic?', '["Low (< 10)", "High (> 20)", "Zero", "Normal"]', 1, 'Active diuretic use causes the kidney to dump chloride (High Urine Cl). If the diuretic is stopped and the patient is volume-depleted, it will become low.');

    -- CASE 27: RTA - The Urinary Anion Gap
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Urine Anion Gap', 'In a patient with NAGMA, you measure the Urinary Anion Gap (UAG = [U_Na + U_K] - U_Cl). The result is +20 (Positive).', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a POSITIVE Urinary Anion Gap suggest in NAGMA?', '["Diarrhea", "Renal Tubular Acidosis (RTA)", "Lactic acidosis", "Aspirin overdose"]', 1, 'A positive UAG suggests the kidney is NOT producing enough NH4+ (ammonium), which is characteristic of RTA. (Diarrhea has a negative UAG).'),
    (v_case_id, 'Why is UAG a surrogate for NH4+?', '["NH4+ is always equal to Na+", "NH4+ is excreted with Cl-; a high U_Cl (making UAG negative) indicates high NH4+ excretion", "It isn''t", "UAG measures pH"]', 1, 'Ammonium (NH4+) is the main way the kidney excretes acid. It is usually excreted with Chloride.'),
    (v_case_id, 'A patient with NAGMA and a NEGATIVE UAG likely has:', '["Type 1 RTA", "Type 4 RTA", "GI loss of bicarbonate (Diarrhea)", "Chronic renal failure"]', 2, 'Negative UAG = High Cl- excretion = High NH4+ excretion = Intact renal acid excretion.');

    -- CASE 28: Compensation - Metabolic Alkalosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Expected pCO2 in Alkalosis', 'A patient has a metabolic alkalosis with an HCO3 of 44 mEq/L (Normal 24).', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rule of thumb for pCO2 compensation in metabolic alkalosis?', '["pCO2 rises by 0.7 for every 1 rise in HCO3", "pCO2 falls by 1.2 for every 1 fall in HCO3", "pCO2 rises by 1.5", "There is no compensation"]', 0, 'For every 1 mEq/L rise in HCO3, the pCO2 should rise by approximately 0.7 mmHg.'),
    (v_case_id, 'The HCO3 has risen by 20. What is the expected rise in pCO2?', '["7 mmHg", "14 mmHg", "21 mmHg", "28 mmHg"]', 1, '20 * 0.7 = 14 mmHg.'),
    (v_case_id, 'What is the expected pCO2 for this patient (Normal 40)?', '["47 mmHg", "54 mmHg", "61 mmHg", "68 mmHg"]', 1, '40 + 14 = 54 mmHg.');

    -- CASE 29: Ventilator Adjustment - High pCO2
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ventilated Patient', 'A patient is on a ventilator. ABG shows: pH 7.28, pCO2 55 mmHg, pO2 80 mmHg. Current settings: Tidal Volume (Vt) 450 mL, Respiratory Rate (RR) 12 bpm.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary goal to improve this ABG?', '["Increase pO2", "Increase minute ventilation to blow off CO2", "Decrease tidal volume", "Increase FiO2"]', 1, 'The patient has respiratory acidosis; minute ventilation (RR * Vt) needs to increase.'),
    (v_case_id, 'Which change would be most appropriate?', '["Decrease RR to 10", "Increase RR to 16", "Decrease Vt to 350", "Decrease FiO2"]', 1, 'Increasing the rate will increase CO2 clearance.'),
    (v_case_id, 'Minute ventilation is defined as:', '["Vt + RR", "Vt * RR", "Vt / RR", "pO2 * pCO2"]', 1, 'Minute ventilation = Tidal Volume * Respiratory Rate.');

    -- CASE 30: Ventilator Adjustment - Low pO2
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory Hypoxemia', 'A patient with ARDS is on a ventilator. ABG: pH 7.40, pCO2 40, pO2 55 mmHg. Current settings: FiO2 60%, PEEP 5 cm H2O.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two primary ways to increase the pO2 on a ventilator?', '["Increase RR or Vt", "Increase FiO2 or PEEP", "Decrease FiO2 or RR", "Increase Vt or PEEP"]', 1, 'Oxygenation is controlled by FiO2 and Mean Airway Pressure (largely PEEP).'),
    (v_case_id, 'What is PEEP (Positive End-Expiratory Pressure)?', '["The pressure during inspiration", "The pressure maintained in the lungs at the end of expiration to keep alveoli open", "The rate of air flow", "The amount of oxygen given"]', 1, 'PEEP prevents alveolar collapse (atelectasis) and improves gas exchange surface area.'),
    (v_case_id, 'If the FiO2 is already at 60%, what is the next best step to improve oxygenation in ARDS?', '["Increase FiO2 to 100%", "Increase PEEP", "Decrease Tidal Volume", "Start antibiotics"]', 1, 'High FiO2 for long periods can be toxic; increasing PEEP is the preferred way to improve oxygenation in ARDS once FiO2 is at 60%.');

    RAISE NOTICE 'SUCCESS: ABG Interpretation Case Blocks (1-30) registered.';
END $$;

COMMIT;
