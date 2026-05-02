-- Clinical Skills & Diagnostics: ABG Interpretation - Part 2 (Cases 16-30)
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
    -- CASE 16: Lactic Acidosis - Sepsis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Septic Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Septic Shock', 'A 70-year-old female with a UTI becomes hypotensive and confused. ABG: pH 7.25, PaCO2 30 mmHg, HCO3 14 mEq/L. Serum lactate is 6.0 mmol/L.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old female with a UTI becomes hypotensive and confused. ABG: pH 7.25, PaCO2 30 mmHg, HCO3 14 mEq/L. Serum lactate is 6.0 mmol/L.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary acid-base disturbance?', '["HAGMA", "NAGMA", "Respiratory acidosis", "Metabolic alkalosis"]', 0, 'Low pH, low HCO3, and elevated lactate indicate a High Anion Gap Metabolic Acidosis (HAGMA).'),
    (v_case_id, 'What is the "Type A" lactic acidosis seen in this patient caused by?', '["Liver failure", "Metformin toxicity", "Tissue hypoperfusion/hypoxia", "Thiamine deficiency"]', 2, 'Type A lactic acidosis is due to anaerobic metabolism from hypoperfusion (shock).'),
    (v_case_id, 'What is the first priority in managing this patient''s acid-base status?', '["Sodium Bicarbonate infusion", "Fluid resuscitation and treating the infection", "Intubation", "Hemodialysis"]', 1, 'The treatment for lactic acidosis is addressing the underlying cause (perfusion and infection). Bicarbonate is generally not indicated unless pH < 7.1.');

    ---------------------------------------------------------------------------
    -- CASE 17: Uremia - Renal Failure
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'End-Stage Renal Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'End-Stage Renal Disease', 'A patient with ESRD has missed several dialysis sessions. ABG: pH 7.20, PaCO2 28 mmHg, HCO3 11 mEq/L. BUN is 120, Creatinine is 10.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with ESRD has missed several dialysis sessions. ABG: pH 7.20, PaCO2 28 mmHg, HCO3 11 mEq/L. BUN is 120, Creatinine is 10.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the anion gap elevated in uremia?', '["Retention of unmeasured organic acids (sulfates, phosphates)", "Lactic acid production", "Loss of chloride", "Hyperkalemia"]', 0, 'In renal failure, the kidneys cannot excrete fixed acids like sulfates and phosphates.'),
    (v_case_id, 'What is the most definitive treatment for this patient''s acidosis?', '["Bicarbonate drip", "Hemodialysis", "Insulin", "Furosemide"]', 1, 'Dialysis removes the toxic uremic acids and restores acid-base balance.'),
    (v_case_id, 'Which electrolyte abnormality is most likely to accompany this acidosis?', '["Hypokalemia", "Hyperkalemia", "Hypernatremia", "Hypophosphatemia"]', 1, 'Acidemia causes potassium to shift out of cells; combined with decreased renal excretion, hyperkalemia is common.');

    ---------------------------------------------------------------------------
    -- CASE 18: Primary Hyperaldosteronism (Conn''s Syndrome)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypertension and Hypokalemia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypertension and Hypokalemia', 'A 40-year-old with resistant hypertension has a serum potassium of 2.8. ABG shows: pH 7.49, PaCO2 42, HCO3 30.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old with resistant hypertension has a serum potassium of 2.8. ABG shows: pH 7.49, PaCO2 42, HCO3 30.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the acid-base disturbance?', '["Metabolic alkalosis", "Metabolic acidosis", "Respiratory alkalosis", "Normal"]', 0, 'High pH and high HCO3 indicate metabolic alkalosis.'),
    (v_case_id, 'What is the mechanism of alkalosis in hyperaldosteronism?', '["Vomiting", "Increased H+ secretion in the distal tubule (Alpha-intercalated cells)", "Excessive bicarbonate intake", "Kidney failure"]', 1, 'Aldosterone stimulates the H+-ATPase in intercalated cells, leading to H+ loss and HCO3- generation.'),
    (v_case_id, 'This type of metabolic alkalosis is typically:', '["Saline-responsive", "Saline-resistant", "Associated with a high anion gap", "Responsive to Acetazolamide"]', 1, 'Alkalosis from mineralocorticoid excess is saline-resistant (urine Cl- > 20 mEq/L) because it is not due to volume depletion.');

    ---------------------------------------------------------------------------
    -- CASE 19: High Altitude - Respiratory Alkalosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Climbing Mt. Everest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Climbing Mt. Everest', 'A climber at high altitude feels lightheaded. ABG: pH 7.46, PaCO2 28 mmHg, PaO2 50 mmHg, HCO3 19 mEq/L.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A climber at high altitude feels lightheaded. ABG: pH 7.46, PaCO2 28 mmHg, PaO2 50 mmHg, HCO3 19 mEq/L.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary stimulus for the tachypnea?', '["Hypoxia (Low PaO2)", "High PaCO2", "Exercise", "Cold air"]', 0, 'At high altitude, low barometric pressure leads to hypoxia, which stimulates the peripheral chemoreceptors to increase ventilation.'),
    (v_case_id, 'Is the low HCO3 (19) a primary metabolic acidosis or compensation?', '["Primary metabolic acidosis", "Renal compensation for chronic respiratory alkalosis", "Laboratory error", "Due to lactic acid"]', 1, 'The kidneys excrete bicarbonate to compensate for the alkaline pH caused by persistent hyperventilation at altitude.'),
    (v_case_id, 'Which medication can be used to speed up this compensation by inhibiting carbonic anhydrase?', '["Furosemide", "Acetazolamide", "Spironolactone", "Hydrochlorothiazide"]', 1, 'Acetazolamide causes a self-limited NAGMA by inducing renal bicarbonate loss, which stimulates breathing and aids acclimatization.');

    ---------------------------------------------------------------------------
    -- CASE 20: Pregnancy - Respiratory Alkalosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shortness of Breath in Pregnancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shortness of Breath in Pregnancy', 'A healthy pregnant woman in her third trimester has a routine ABG. pH 7.44, PaCO2 30 mmHg, HCO3 20 mEq/L.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy pregnant woman in her third trimester has a routine ABG. pH 7.44, PaCO2 30 mmHg, HCO3 20 mEq/L.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is a normal finding in pregnancy called:', '["Gestational acidosis", "Physiologic respiratory alkalosis of pregnancy", "Amniotic fluid embolism", "Pre-eclampsia"]', 1, 'Progesterone stimulates the respiratory center, leading to a chronic, compensated respiratory alkalosis.'),
    (v_case_id, 'What is the physiological benefit of this change?', '["Increases maternal blood pressure", "Facilitates CO2 transfer from the fetus to the mother", "Prevents leg swelling", "Reduces nausea"]', 1, 'A lower maternal PaCO2 creates a larger gradient for fetal CO2 to move across the placenta.'),
    (v_case_id, 'If this patient''s PaCO2 rose to 40 mmHg, it would suggest:', '["Normal state", "Impending respiratory failure or severe obstruction", "Improved fetal oxygenation", "Successful treatment"]', 1, 'A "normal" PaCO2 in a pregnant woman may actually indicate significant hypoventilation/respiratory distress.');

    ---------------------------------------------------------------------------
    -- CASE 21: Carbon Monoxide Poisoning - The SaO2 Gap
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'House Fire Victim' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'House Fire Victim', 'A patient rescued from a house fire is confused. Pulse oximetry (SpO2) is 98% on room air. ABG: pH 7.30, PaO2 95 mmHg, SaO2 (calculated from PaO2) is 97%. Co-oximetry shows carboxyhemoglobin of 30%.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient rescued from a house fire is confused. Pulse oximetry (SpO2) is 98% on room air. ABG: pH 7.30, PaO2 95 mmHg, SaO2 (calculated from PaO2) is 97%. Co-oximetry shows carboxyhemoglobin of 30%.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the pulse oximetry (SpO2) and calculated SaO2 normal despite severe CO poisoning?', '["The patient is not actually poisoned", "Pulse oximetry cannot distinguish carboxyhemoglobin from oxyhemoglobin", "The oxygen is dissolving in the plasma", "The machine is broken"]', 1, 'Pulse oximeters see carboxyhemoglobin as "bright red" oxyhemoglobin, giving a falsely high reading.'),
    (v_case_id, 'What is the primary treatment for carbon monoxide poisoning?', '["Bicarbonate", "100% High-flow Oxygen", "Albuterol", "Intubation"]', 1, '100% oxygen reduces the half-life of carboxyhemoglobin from ~5 hours to ~90 minutes.'),
    (v_case_id, 'Which acid-base disturbance can be seen in severe CO poisoning?', '["Lactic acidosis (HAGMA)", "Metabolic alkalosis", "Respiratory alkalosis", "NAGMA"]', 0, 'CO inhibits the electron transport chain (Cytochrome c oxidase) and reduces oxygen delivery, leading to anaerobic metabolism and lactic acidosis.');

    ---------------------------------------------------------------------------
    -- CASE 22: Methanol Poisoning - Visual Changes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snowstorm Vision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snowstorm Vision', 'A patient who drinks "moonshine" presents with blurry vision and severe abdominal pain. ABG: pH 7.05, PaCO2 20 mmHg, HCO3 6 mEq/L. AG is 35.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient who drinks "moonshine" presents with blurry vision and severe abdominal pain. ABG: pH 7.05, PaCO2 20 mmHg, HCO3 6 mEq/L. AG is 35.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxic metabolite of methanol?', '["Oxalic acid", "Formic acid", "Acetic acid", "Lactic acid"]', 1, 'Methanol is converted to formaldehyde and then to formic acid, which is toxic to the optic nerve.'),
    (v_case_id, 'What finding on eye exam is classic for methanol poisoning?', '["Retinal hemorrhages", "Optic disc hyperemia/edema", "Cataracts", "Cherry red spot"]', 1, 'Formic acid causes optic papillitis and retinal edema.'),
    (v_case_id, 'In addition to Fomepizole, what is the definitive treatment for severe methanol poisoning (pH < 7.2)?', '["Hemodialysis", "Vitamin C", "IV Saline", "Atropine"]', 0, 'Dialysis effectively removes both methanol and formic acid.');

    ---------------------------------------------------------------------------
    -- CASE 23: Iron Toxicity - HAGMA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pediatric Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pediatric Ingestion', 'A 2-year-old ate a bottle of prenatal vitamins. She has bloody vomiting and severe acidosis. AG is 25.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-year-old ate a bottle of prenatal vitamins. She has bloody vomiting and severe acidosis. AG is 25.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does iron cause a high anion gap metabolic acidosis?', '["It is an acid itself", "It uncouples oxidative phosphorylation and causes mitochondrial damage", "It causes renal failure", "It causes diarrhea"]', 1, 'Free iron is a potent pro-oxidant that damages mitochondria, leading to lactic acidosis.'),
    (v_case_id, 'What is the specific chelator used for iron poisoning?', '["Penicillamine", "Deferoxamine", "EDTA", "Dimercaprol"]', 1, 'Deferoxamine binds free iron and is excreted in the urine (turning it "vin rosé" color).'),
    (v_case_id, 'Iron is one of the causes of HAGMA in which mnemonic?', '["MUDPILES", "CAT MUDPILES", "HARDUPS", "AEIOU"]', 1, 'CAT MUDPILES: Carbon monoxide/Cyanide, Aminoglycosides (rarely)/Arsenic, Toluene, Methanol, Uremia, DKA, Paraldehyde/Phenformin, Iron/INH, Lactate, Ethylene glycol, Salicylates.');

    ---------------------------------------------------------------------------
    -- CASE 24: Diarrhea vs. RTA - Urine Anion Gap
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The NAGMA Dilemma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The NAGMA Dilemma', 'A patient has a Normal Anion Gap Metabolic Acidosis. Urine electrolytes: Na 40, K 20, Cl 80.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a Normal Anion Gap Metabolic Acidosis. Urine electrolytes: Na 40, K 20, Cl 80.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Calculate the Urine Anion Gap (UAG = [Na + K] - Cl).', '["-20", "20", "60", "140"]', 0, 'UAG = (40 + 20) - 80 = -20.'),
    (v_case_id, 'What does a NEGATIVE Urine Anion Gap indicate?', '["Renal loss of bicarbonate (RTA)", "GI loss of bicarbonate (Diarrhea)", "Laboratory error", "Mineralocorticoid excess"]', 1, 'A negative UAG means there is a high concentration of unmeasured cations (like Ammonium, NH4+). This shows the kidneys ARE responding to the acidosis, making GI loss (diarrhea) the likely cause.'),
    (v_case_id, 'A POSITIVE Urine Anion Gap suggests:', '["Diarrhea", "RTA", "Vomiting", "Saline ingestion"]', 1, 'A positive UAG indicates the kidneys cannot excrete NH4Cl properly, pointing toward a renal tubular defect (RTA).');

    ---------------------------------------------------------------------------
    -- CASE 25: Type 4 RTA (Hyperkalemic RTA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Diabetes and High Potassium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Diabetes and High Potassium', 'A diabetic patient with mild CKD is started on an ACE inhibitor. Their potassium rises to 5.8 and they have a persistent NAGMA.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A diabetic patient with mild CKD is started on an ACE inhibitor. Their potassium rises to 5.8 and they have a persistent NAGMA.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Type 1 RTA", "Type 2 RTA", "Type 4 RTA", "Lactic acidosis"]', 2, 'Type 4 RTA is the only RTA associated with hyperkalemia, often seen in diabetic nephropathy (hyporeninemic hypoaldosteronism).'),
    (v_case_id, 'What is the mechanism of acidosis in Type 4 RTA?', '["Bicarbonate wasting", "Impaired distal H+ secretion and decreased ammonia production due to hyperkalemia", "Toxin ingestion", "Proximal tubule damage"]', 1, 'Hyperkalemia inhibits ammonia (NH3) production in the proximal tubule, reducing the kidney''s ability to buffer and excrete H+ ions.'),
    (v_case_id, 'Which of the following medications can CAUSE Type 4 RTA?', '["ACE inhibitors", "Potassium-sparing diuretics", "NSAIDS", "All of the above"]', 3, 'Any drug that interferes with the renin-angiotensin-aldosterone axis can lead to Type 4 RTA.');

    ---------------------------------------------------------------------------
    -- CASE 26: Salicylate Toxicity - Tinnitus and Late Signs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ringing in the Ears' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ringing in the Ears', 'A patient presents with tinnitus, nausea, and rapid breathing after an overdose. ABG shows pH 7.45, PaCO2 25, HCO3 17.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with tinnitus, nausea, and rapid breathing after an overdose. ABG shows pH 7.45, PaCO2 25, HCO3 17.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is tinnitus a common symptom of salicylate toxicity?', '["Direct ototoxicity", "High blood pressure", "Hyperventilation", "Cerebral edema"]', 0, 'Salicylates cause reversible ototoxicity, classically presenting as tinnitus.'),
    (v_case_id, 'As salicylate toxicity progresses to a very severe stage, what happens to the pH?', '["It becomes extremely alkaline", "It shifts to a profound acidemia as the metabolic acidosis dominates", "It stays normal", "It fluctuates wildly"]', 1, 'Initially, respiratory alkalosis dominates, but as metabolic acidosis (HAGMA) worsens and the respiratory drive fatigues, severe acidemia occurs.'),
    (v_case_id, 'What is a dangerous neurological complication of severe salicylate poisoning?', '["Ischemic stroke", "Cerebral edema", "Paralysis", "Blindness"]', 1, 'Salicylates are more likely to cross the blood-brain barrier at low pH, leading to cerebral edema and death.');

    ---------------------------------------------------------------------------
    -- CASE 27: Hypokalemia and Metabolic Alkalosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weakness and Alkalosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weakness and Alkalosis', 'A patient has profound metabolic alkalosis (HCO3 45) and a serum potassium of 2.2.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has profound metabolic alkalosis (HCO3 45) and a serum potassium of 2.2.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does hypokalemia worsen metabolic alkalosis?', '["K+ moves out of cells in exchange for H+ moving IN", "Increased H+ secretion in the distal tubule to reabsorb K+", "Decreased renal blood flow", "Both A and B"]', 3, 'In hypokalemia, H+ shifts into cells, and the distal tubule secretes H+ via the H+/K+-ATPase to try and save potassium.'),
    (v_case_id, 'What is "paradoxical aciduria"?', '["Urine is alkaline during acidosis", "Urine is acidic during metabolic alkalosis", "Urine pH is always 7.0", "Urine contains no ions"]', 1, 'In severe hypokalemia and volume depletion, the kidney secretes H+ (to save K+ and Na+), making the urine acidic even though the body is in an alkaline state.'),
    (v_case_id, 'What is the most important step in correcting this patient''s alkalosis?', '["Giving hydrochloric acid", "Potassium and volume replacement", "Administering bicarbonate", "Inducing vomiting"]', 1, 'Replacing potassium and volume allows the kidney to stop "wasting" H+ and excrete the excess bicarbonate.');

    ---------------------------------------------------------------------------
    -- CASE 28: Acute on Chronic Respiratory Acidosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The COPD Flare' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The COPD Flare', 'A patient with known chronic CO2 retention (baseline PaCO2 55, pH 7.36) presents with a pneumonia. New ABG: pH 7.22, PaCO2 75, HCO3 30.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with known chronic CO2 retention (baseline PaCO2 55, pH 7.36) presents with a pneumonia. New ABG: pH 7.22, PaCO2 75, HCO3 30.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What has happened to this patient?', '["Full compensation", "Acute on chronic respiratory acidosis", "Primary metabolic acidosis", "Normal variant"]', 1, 'The pH has dropped significantly, and the CO2 has risen above baseline. The kidneys haven''t had time to further compensate for the NEW rise in CO2.'),
    (v_case_id, 'Why is the HCO3 30 instead of 24?', '["New metabolic alkalosis", "Pre-existing compensation from the chronic CO2 retention", "Laboratory error", "The pneumonia is producing bicarbonate"]', 1, 'The patient was already "compensated" for their baseline CO2 of 55.'),
    (v_case_id, 'What is a risk of giving too much supplemental oxygen to this patient?', '["Oxygen toxicity to the brain", "Further increase in PaCO2 due to V/Q mismatch and reduced hypoxic drive", "Metabolic alkalosis", "NAGMA"]', 1, 'Excessive O2 can worsen CO2 retention (Haldane effect and reduced ventilation), leading to "CO2 narcosis."');

    ---------------------------------------------------------------------------
    -- CASE 29: Heart Failure - Early Respiratory Alkalosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anxious and Wet Lungs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anxious and Wet Lungs', 'A patient in early congestive heart failure presents with mild dyspnea. ABG: pH 7.48, PaCO2 32, PaO2 70, HCO3 23.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in early congestive heart failure presents with mild dyspnea. ABG: pH 7.48, PaCO2 32, PaO2 70, HCO3 23.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the acid-base disturbance?', '["Respiratory alkalosis", "Respiratory acidosis", "Metabolic alkalosis", "Metabolic acidosis"]', 0, 'High pH and low PaCO2 indicate respiratory alkalosis.'),
    (v_case_id, 'What is the mechanism of this disturbance in early HF?', '["Vomiting from nausea", "Tachypnea triggered by pulmonary congestion and hypoxia", "Diuretic effect", "Liver failure"]', 1, 'Pulmonary edema irritates J-receptors and causes hypoxemia, both of which stimulate tachypnea.'),
    (v_case_id, 'If this patient''s PaCO2 begins to RISE toward 40 or 45, what does it suggest?', '["Improvement", "Impending respiratory fatigue and failure", "Better oxygenation", "Metabolic compensation"]', 1, 'As in asthma or any respiratory distress, a normalizing or rising CO2 in a tachypneic patient is an ominous sign of exhaustion.');

    ---------------------------------------------------------------------------
    -- CASE 30: Sepsis - Triple Disorder
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Complex ABG' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Complex ABG', 'A patient with sepsis (Lactate 10) is also on a ventilator (set rate 28) and has been vomiting. ABG: pH 7.40, PaCO2 25, HCO3 15. AG is 30.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with sepsis (Lactate 10) is also on a ventilator (set rate 28) and has been vomiting. ABG: pH 7.40, PaCO2 25, HCO3 15. AG is 30.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many primary disturbances are likely present?', '["One", "Two", "Three", "None"]', 2, 'This is a triple disorder: 1) HAGMA (AG 30), 2) Metabolic Alkalosis (Delta-Delta > 2), 3) Respiratory Alkalosis (PaCO2 25 is lower than Winters'' expected ~30).'),
    (v_case_id, 'In the setting of sepsis, what is the most likely cause of the HAGMA?', '["Ketoacidosis", "Lactic acidosis", "Uremia", "Salicylates"]', 1, 'Lactic acidosis is the hallmark of tissue hypoperfusion in sepsis.'),
    (v_case_id, 'The respiratory alkalosis in this ventilated patient is likely:', '["Physiologic", "Iatrogenic (ventilator settings)", "Due to pain", "Normal"]', 1, 'A high set respiratory rate on the ventilator can cause iatrogenic respiratory alkalosis.');

END $$;

COMMIT;
