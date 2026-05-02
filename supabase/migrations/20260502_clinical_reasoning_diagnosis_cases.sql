BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Clinical Reasoning & Differential Diagnosis
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-reasoning-diagnosis' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "clinical-reasoning-diagnosis" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 31: Anchoring Bias in Chest Pain (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anchoring Bias in Chest Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anchoring Bias in Chest Pain', 'A 55-year-old male smoker with a history of GERD presents with epigastric burning. The triage note says "GERD flare." He is given an antacid, and his pain improves slightly. Two hours later, he becomes diaphoretic.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male smoker with a history of GERD presents with epigastric burning. The triage note says "GERD flare." He is given an antacid, and his pain improves slightly. Two hours later, he becomes diaphoretic.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cognitive bias is demonstrated by the initial physician sticking to the "GERD" diagnosis?', '["Availability bias", "Anchoring bias", "Framing effect", "Blind spot bias"]', 1, 'Anchoring is the tendency to rely too heavily on the first piece of information offered (the triage note or initial impression).'),
    (v_case_id, 'What is the "Big 5" must-not-miss differential for chest pain in this patient?', '["GERD, Gastritis, Esophagitis, Gallstones, Peptic ulcer", "ACS, PE, Aortic Dissection, Tension Pneumothorax, Esophageal Rupture", "Pneumonia, Bronchitis, Pleurisy, Musculoskeletal pain, Anxiety", "Stable Angina, Pericarditis, Mitral Valve Prolapse, Costochondritis, GERD"]', 1, 'Pocket Medicine emphasizes these five as the critical "must-not-miss" acute causes of chest pain.'),
    (v_case_id, 'The slight improvement with an antacid (the "GI cocktail") is known to be:', '["Diagnostic of a GI cause", "Non-specific and can occur in ACS", "A reason to discharge the patient", "Diagnostic of esophageal spasm"]', 1, 'Studies have shown that pain relief from antacids does NOT reliably distinguish GI pain from myocardial ischemia.');

    ---------------------------------------------------------------------------
    -- CASE 32: Availability Bias during Flu Season (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Availability Bias during Flu Season' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Availability Bias during Flu Season', 'During a peak influenza outbreak, a 70-year-old female presents with fever, cough, and myalgia. The intern diagnoses "Flu" without a full exam. The patient actually has an early murmur and splinter hemorrhages.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a peak influenza outbreak, a 70-year-old female presents with fever, cough, and myalgia. The intern diagnoses "Flu" without a full exam. The patient actually has an early murmur and splinter hemorrhages.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The tendency to over-diagnose a common condition because it is "top of mind" is:', '["Confirmation bias", "Availability bias", "Representativeness heuristic", "Sunk cost fallacy"]', 1, 'Availability bias occurs when we judge the probability of an event based on how easily examples come to mind (e.g., seeing many flu cases lately).'),
    (v_case_id, 'What is the most critical "must-not-miss" diagnosis for this patient with a new murmur and fever?', '["Secondary bacterial pneumonia", "Acute Endocarditis", "Heart failure", "COPD exacerbation"]', 1, 'Fever + New Murmur = Endocarditis until proven otherwise.'),
    (v_case_id, 'What physical exam finding from Bates would most strongly suggest an alternative to influenza?', '["Rhonchi", "Splinter hemorrhages and Janeway lesions", "Wheezing", "Tachypnea"]', 1, 'These peripheral stigmata of endocarditis are critical red flags that influenza does not explain.');

    ---------------------------------------------------------------------------
    -- CASE 33: Premature Closure in the Elderly (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Premature Closure in the Elderly' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Premature Closure in the Elderly', 'An 80-year-old male is admitted for a hip fracture. On day 2, he becomes confused. The team diagnoses "Surgical Delirium" and misses his new-onset hypoxia and tachycardia.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old male is admitted for a hip fracture. On day 2, he becomes confused. The team diagnoses "Surgical Delirium" and misses his new-onset hypoxia and tachycardia.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Stopping the diagnostic workup once a plausible explanation is found is called:', '["Premature closure", "Hindsight bias", "Commission bias", "Omission bias"]', 0, 'Premature closure is the most common diagnostic error; it occurs when a clinician stops searching once a "label" (like delirium) is attached.'),
    (v_case_id, 'According to the "On Call" protocol, what is the first step in managing a new change in mental status?', '["Order a head CT", "Check ABCs and Vital Signs (including SpO2 and Glucose)", "Administer sedation", "Call psychiatry"]', 1, 'The "On Call" approach always prioritizes vital stabilization and ruling out life-threatening metabolic/hypoxic causes before psychiatric ones.'),
    (v_case_id, 'In an elderly post-op patient, what is the most common "silent" cause of new-onset confusion?', '["Stroke", "Hypoxia/PE or Occult Infection", "Alzheimer''s disease", "Schizophrenia"]', 1, 'Delirium is often the presenting sign of hypoxia or infection in the elderly, even without localizing symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 34: Framing Effect (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Framing Effect in Consent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Framing Effect in Consent', 'A surgeon tells a patient, "There is a 90% chance you will survive this procedure." Another surgeon tells the patient, "There is a 10% chance you will die."', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surgeon tells a patient, "There is a 90% chance you will survive this procedure." Another surgeon tells the patient, "There is a 10% chance you will die."', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The patient is more likely to consent to the first surgeon. This is an example of:', '["Base rate neglect", "Framing effect", "Authority bias", "Outcome bias"]', 1, 'The framing effect describes how the presentation of identical information can influence decision-making.'),
    (v_case_id, 'Which reasoning process is most prone to these types of biases?', '["System 1 (Intuitive/Fast)", "System 2 (Analytical/Slow)", "Bayesian reasoning", "Deductive logic"]', 0, 'System 1 is the subconscious, heuristic-driven mode of thinking that is highly susceptible to framing.'),
    (v_case_id, 'How can a clinician best mitigate the framing effect?', '["Only use System 1", "Present data in both positive and negative frames", "Use less data", "Avoid explaining risks"]', 1, 'Providing balanced perspectives (e.g., "9 out of 10 survive, while 1 out of 10 do not") helps the patient make a more rational choice.');

    ---------------------------------------------------------------------------
    -- CASE 35: Bayesian Reasoning - The Rare Disease (EBM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bayesian Reasoning and Prevalence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bayesian Reasoning and Prevalence', 'You are evaluating a test for a rare disease with 99% Sensitivity and 99% Specificity. The disease prevalence is 1 in 10,000.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are evaluating a test for a rare disease with 99% Sensitivity and 99% Specificity. The disease prevalence is 1 in 10,000.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the patient tests positive, is it more likely they have the disease or that it is a false positive?', '["More likely they have the disease", "More likely it is a false positive", "50/50 chance", "Impossible to tell"]', 1, 'In very low prevalence populations, even a highly accurate test will produce more false positives than true positives (the "base rate fallacy").'),
    (v_case_id, 'A high SENSITIVITY test is most useful for:', '["Confirming a diagnosis (SpPin)", "Ruling out a diagnosis (SnNout)", "Identifying the cause", "Monitoring treatment"]', 1, 'SnNout: a test with high SeNsitivity, when Negative, rules OUT the disease.'),
    (v_case_id, 'What value remains stable regardless of the disease prevalence in a population?', '["Positive Predictive Value (PPV)", "Negative Predictive Value (NPV)", "Likelihood Ratio (LR)", "Accuracy"]', 2, 'Likelihood ratios are properties of the test itself and do not change with prevalence, unlike predictive values.');

    ---------------------------------------------------------------------------
    -- CASE 36: Syncope Reasoning (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Syncope in the Young Athlete' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Syncope in the Young Athlete', 'A 25-year-old athlete faints while running. He recovers immediately. No prodrome.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old athlete faints while running. He recovers immediately. No prodrome.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three broad categories of syncope reasoning?', '["Neurological, Psychological, Idiopathic", "Reflex (Vasovagal), Orthostatic, Cardiac", "Hypoglycemic, Hypoxic, Hypercapnic", "Seizure, Stroke, TIA"]', 1, 'Standard differential grouping for syncope focuses on these three pathophysiological buckets.'),
    (v_case_id, 'Sudden syncope DURING exertion without a prodrome strongly suggests:', '["Vasovagal syncope", "Orthostatic hypotension", "Cardiac syncope (Arrhythmia or Structural)", "Micturition syncope"]', 2, 'Exertional syncope is a "red flag" for cardiac causes like HOCM or aortic stenosis.'),
    (v_case_id, 'What EKG finding from First Aid should you look for in this young athlete?', '["Right bundle branch block", "Delta wave (WPW) or deep lateral Q waves (HOCM)", "Sinus bradycardia", "Normal EKG"]', 1, 'WPW and HOCM are two leading causes of sudden death/syncope in young athletes that are detectable on EKG.');

    ---------------------------------------------------------------------------
    -- CASE 37: Acute SOB (Learning Radiology)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SOB: HF vs COPD' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SOB: HF vs COPD', 'A 60-year-old with a history of both HF and COPD presents with worsening SOB. He has wheezing and elevated JVP.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old with a history of both HF and COPD presents with worsening SOB. He has wheezing and elevated JVP.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What lab test is the most useful "reasoning tool" to differentiate HF from COPD in the ER?', '["Troponin", "BNP (B-type Natriuretic Peptide)", "D-dimer", "CRP"]', 1, 'BNP is highly sensitive for heart failure and helps distinguish it from primary lung disease.'),
    (v_case_id, 'If the BNP is < 100, the cause of SOB is very unlikely to be:', '["COPD", "Heart Failure", "Pneumonia", "Pulmonary Embolism"]', 1, 'A low BNP has a very high negative predictive value for acute decompensated heart failure.'),
    (v_case_id, 'According to Learning Radiology, what finding on CXR would most support HF over COPD?', '["Hyperinflation and flattened diaphragms", "Cephalization of vessels and Kerley B lines", "Patchy consolidation", "Clear lung fields"]', 1, 'Vascular redistribution and interstitial edema (Kerley B) are diagnostic of volume overload.');

    ---------------------------------------------------------------------------
    -- CASE 38: Abdominal Pain Reasoning (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'RLQ Pain Reasoning' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'RLQ Pain Reasoning', 'A 22-year-old female presents with sudden onset severe RLQ pain.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old female presents with sudden onset severe RLQ pain.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first "must-rule-out" in any female of childbearing age with abdominal pain?', '["Appendicitis", "Ectopic pregnancy", "Ovarian torsion", "UTI"]', 1, 'Ectopic pregnancy is a life-threatening "must-not-miss" diagnosis that requires an immediate pregnancy test.'),
    (v_case_id, 'Pain that starts in the periumbilical region and migrates to the RLQ is classic for:', '["Cholecystitis", "Appendicitis", "Diverticulitis", "Mesenteric ischemia"]', 1, 'This migration pattern represents the transition from visceral to parietal peritoneal irritation.'),
    (v_case_id, 'What physical exam sign involves pain in the RLQ when the LLQ is palpated?', '["McBurney''s sign", "Rovsing''s sign", "Psoas sign", "Obturator sign"]', 1, 'Rovsing''s sign is a sensitive indicator of peritoneal inflammation in the RLQ.');

    ---------------------------------------------------------------------------
    -- CASE 39: AMS - The MIST Mnemonic (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Altered Mental Status Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Altered Mental Status Logic', 'A 50-year-old diabetic is brought in with "altered mental status."', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old diabetic is brought in with "altered mental status."', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mnemonic "MIST" used for in differential diagnosis of AMS?', '["Metabolic, Infectious, Structural, Toxins", "Meningitis, Insulin, Stroke, Trauma", "Memory, Intellect, Speech, Thought", "Muscle, Immune, Skin, Tendons"]', 0, 'MIST is a systematic way to categorize causes of delirium/AMS.'),
    (v_case_id, 'What is the most immediate, life-saving lab to check in any AMS patient?', '["Head CT", "Fingerstick Glucose", "Ethanol level", "Lumbar puncture"]', 1, 'Hypoglycemia is a rapidly reversible cause of AMS that must be ruled out immediately.'),
    (v_case_id, 'A patient with AMS and "pinpoint pupils" suggests:', '["Cocaine use", "Opioid toxicity", "Anticholinergic toxicity", "Hypoglycemia"]', 1, 'Miosis (pinpoint pupils) is a classic finding in the opioid toxidrome.');

    ---------------------------------------------------------------------------
    -- CASE 40: FUO Reasoning (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever of Unknown Origin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever of Unknown Origin', 'A 35-year-old has had a fever for 4 weeks. Extensive initial labs (CBC, UA, CXR) are negative.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old has had a fever for 4 weeks. Extensive initial labs (CBC, UA, CXR) are negative.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic definition of FUO?', '["Fever > 101F for 1 week", "Fever > 101F for > 3 weeks, with 1 week of workup", "Fever > 100F for 1 month", "Any fever that doesn''t respond to Tylenol"]', 1, 'Petersdorf defined FUO as temperature > 38.3°C (> 101°F) for > 3 weeks that remains undiagnosed after 1 week of investigation.'),
    (v_case_id, 'What are the three most common categories for FUO in adults?', '["Viral, Bacterial, Fungal", "Infection, Malignancy, Autoimmune", "Stress, Dehydration, Exercise", "Drug fever, Factitious fever, Teething"]', 1, 'These three categories account for the majority of confirmed FUO cases.'),
    (v_case_id, 'A "Relative Bradycardia" (high fever but pulse is not high) suggests:', '["Sepsis", "Intracellular pathogens (Legionella, Typhoid)", "Heart block", "Normal response"]', 1, 'Faget''s sign (pulse-temperature dissociation) is a classic reasoning clue for certain infections or factitious fever.');

    ---------------------------------------------------------------------------
    -- CASE 41: Confirmation Bias (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Confirmation Bias in PE' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Confirmation Bias in PE', 'A physician is convinced a patient has a PE. The V/Q scan comes back "Low Probability." The physician says, "The scan is wrong, look at how tachypneic she is!" and orders a CTPA.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician is convinced a patient has a PE. The V/Q scan comes back "Low Probability." The physician says, "The scan is wrong, look at how tachypneic she is!" and orders a CTPA.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Seeking only evidence that supports your existing belief and ignoring contradictory data is:', '["Outcome bias", "Confirmation bias", "Hindsight bias", "Base rate neglect"]', 1, 'Confirmation bias is the tendency to search for, interpret, and favor information that confirms one''s pre-existing hypotheses.'),
    (v_case_id, 'If the pre-test probability (Wells Score) was "High," a "Low Probability" V/Q scan:', '["Rules out PE", "Is non-diagnostic and requires further testing", "Confirms PE", "Should be ignored"]', 1, 'Bayesian reasoning: discordant results (High pre-test + Low test result) are unreliable and require definitive testing.'),
    (v_case_id, 'What is the "Gold Standard" reasoning tool for PE risk stratification?', '["Physician intuition", "Wells Criteria or PERC Rule", "D-dimer for everyone", "Immediate CT for everyone"]', 1, 'Clinical decision rules (CDRs) are designed to overcome subjective biases and standardize risk assessment.');

    ---------------------------------------------------------------------------
    -- CASE 42: Headache Red Flags (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Headache Red Flags' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Headache Red Flags', 'A 50-year-old presents with the "worst headache of my life" that started suddenly while lifting a box.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old presents with the "worst headache of my life" that started suddenly while lifting a box.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What mnemonic is used for headache "red flags"?', '["FAST", "SNOOP", "SOCRATES", "OPQRST"]', 1, 'SNOOP: Systemic signs, Neuro deficits, Onset (sudden), Older age, Progression/Pattern change.'),
    (v_case_id, 'The "Thunderclap" onset (peak intensity in seconds) is most characteristic of:', '["Migraine", "Subarachnoid Hemorrhage", "Tension headache", "Cluster headache"]', 1, 'Sudden, severe "Thunderclap" headache is SAH until proven otherwise.'),
    (v_case_id, 'What is the next best reasoning step if a Head CT is negative in a patient with a suspected SAH?', '["Discharge home", "Lumbar Puncture", "Start Migraine meds", "Repeat CT in 24 hours"]', 1, 'CT can miss early SAH; LP is required to check for xanthochromia (hemoglobin breakdown products).');

    ---------------------------------------------------------------------------
    -- CASE 43: Joint Pain Differential (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mono vs Polyarthritis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mono vs Polyarthritis', 'A 60-year-old presents with a single hot, swollen, painful toe.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old presents with a single hot, swollen, painful toe.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first branch point in the differential diagnosis of joint pain?', '["Acute vs Chronic", "Monoarticular (1) vs Polyarticular (>3)", "Inflammatory vs Non-inflammatory", "Upper vs Lower limb"]', 1, 'Grouping by the number of joints involved is the standard diagnostic entry point.'),
    (v_case_id, 'What is the "must-rule-out" diagnosis for an acute monoarthritis?', '["Gout", "Septic Arthritis", "Osteoarthritis", "Rheumatoid Arthritis"]', 1, 'Septic arthritis is an orthopedic emergency that can destroy a joint in hours.'),
    (v_case_id, 'In a polyarticular, symmetric, small-joint inflammatory pattern, the most likely reasoning is:', '["Gout", "Rheumatoid Arthritis", "Lupus", "Osteoarthritis"]', 1, 'Symmetric small-joint involvement is the hallmark of RA.');

    ---------------------------------------------------------------------------
    -- CASE 44: Hypotension On Call (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Op Hypotension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Op Hypotension', 'A post-op patient''s blood pressure drops to 80/40 mmHg.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-op patient''s blood pressure drops to 80/40 mmHg.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most immediate reasoning priority in an "On Call" hypotension scenario?', '["Find the cause", "Assess perfusion and stabilize ABCs", "Call the family", "Start long-term meds"]', 1, 'The first priority is always "Are they sick?" and stabilizing circulation.'),
    (v_case_id, 'A patient with hypotension, high JVP, and clear lungs likely has:', '["Hypovolemic shock", "Cardiogenic or Obstructive shock", "Septic shock", "Neurogenic shock"]', 1, 'High JVP indicates a "pump" or "blockage" problem (HF, PE, or Tamponade), not a "tank" problem.'),
    (v_case_id, 'What is the first-line reasoning tool (and treatment) for suspected hypovolemic shock?', '["Vasopressors", "Fluid bolus (e.g., 500-1000mL NS)", "Antibiotics", "Head CT"]', 1, 'Fluid resuscitation is both a treatment and a diagnostic test for volume responsiveness.');

    ---------------------------------------------------------------------------
    -- CASE 45: Jaundice Reasoning (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Jaundice Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Jaundice Logic', 'A patient has yellow eyes and dark urine. Direct Bilirubin is 5.0 (High). AST/ALT are normal. Alk Phos is 500 (High).', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has yellow eyes and dark urine. Direct Bilirubin is 5.0 (High). AST/ALT are normal. Alk Phos is 500 (High).', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This pattern of lab findings is:', '["Pre-hepatic", "Intra-hepatic", "Post-hepatic (Obstructive)", "Hemolytic"]', 2, 'High Alk Phos and Direct Bili with normal enzymes point to a biliary obstruction.'),
    (v_case_id, 'Dark urine in a jaundiced patient indicates:', '["Unconjugated hyperbilirubinemia", "Conjugated hyperbilirubinemia", "Hemolysis", "Dehydration"]', 1, 'Direct (conjugated) bilirubin is water-soluble and excreted in urine; indirect bilirubin is not.'),
    (v_case_id, 'What is the most common "painless" cause of post-hepatic jaundice in an elderly patient?', '["Gallstones", "Pancreatic cancer", "Hepatitis A", "Gilbert syndrome"]', 1, 'Painless obstructive jaundice in an older adult is pancreatic malignancy until proven otherwise (Courvoisier''s Law).');

    ---------------------------------------------------------------------------
    -- CASE 46: Unintentional Weight Loss (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unintentional Weight Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unintentional Weight Loss', 'A 65-year-old male smoker reports losing 20 lbs unintentionally over 3 months.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male smoker reports losing 20 lbs unintentionally over 3 months.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Rule of 10" for significant unintentional weight loss?', '["10 lbs in 1 year", "> 10% of body weight in 6-12 months", "5% in 1 month", "2 lbs per week"]', 1, 'Clinical significance is usually defined as > 5-10% of total body weight over 6-12 months.'),
    (v_case_id, 'What are the "Big 3" categories of unintentional weight loss reasoning?', '["Diet, Exercise, Sleep", "Malignancy, Chronic Infection, and Endocrine", "Depression, Poverty, Smoking", "Liver, Kidney, Heart failure"]', 1, 'Infection (TB/HIV), Malignancy, and Endocrine (Hyperthyroidism/Diabetes) are the primary pathologic buckets.'),
    (v_case_id, 'In an elderly smoker with weight loss and new-onset cough, the reasoning points strongly to:', '["Tuberculosis", "Lung Cancer", "COPD", "Depression"]', 1, 'Smoker + Weight Loss + New Cough = Lung Cancer until proven otherwise.');

    ---------------------------------------------------------------------------
    -- CASE 47: Neuro Localization (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neuro Localization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neuro Localization', 'A 40-year-old female presents with bilateral leg weakness and a "level" of numbness at the mid-chest.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old female presents with bilateral leg weakness and a "level" of numbness at the mid-chest.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first priority in neuro reasoning for weakness?', '["UMN vs LMN", "Localization", "Vascular vs Inflammatory", "Left vs Right"]', 1, 'Localizing the lesion (Brain vs Cord vs Nerve vs Muscle) is the first task in clinical neurology.'),
    (v_case_id, 'A "sensory level" (numbness below a certain point) strongly localizes the lesion to the:', '["Brain", "Spinal Cord", "Nerve Roots", "Peripheral nerves"]', 1, 'Sensory levels are pathognomonic for spinal cord pathology (e.g., transverse myelitis or compression).'),
    (v_case_id, 'Which finding from Bates characterizes an Upper Motor Neuron (UMN) lesion?', '["Fasciculations", "Atrophy", "Spasticity and Hyperreflexia", "Flaccidity"]', 2, 'UMN lesions (Brain/Cord) cause increased tone and reflexes; LMN lesions (Nerve/Root) cause decreased tone and fasciculations.');

    ---------------------------------------------------------------------------
    -- CASE 48: Edema Reasoning (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Leg Swelling Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Leg Swelling Logic', 'A patient presents with swelling of the right leg only.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with swelling of the right leg only.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The first reasoning step for edema is:', '["Pitting vs Non-pitting", "Unilateral vs Bilateral", "Acute vs Chronic", "Cardiac vs Renal"]', 1, 'Unilateral swelling suggests local pathology (DVT/Cellulitis); bilateral suggests systemic (HF/Cirrhosis/CKD).'),
    (v_case_id, 'Unilateral leg swelling in a hospitalized patient is:', '["Heart Failure", "DVT", "Cirrhosis", "Lymphedema"]', 1, 'In any patient with immobility, unilateral swelling is a DVT until proven otherwise.'),
    (v_case_id, 'Bilateral leg swelling with high JVP points to:', '["Renal failure", "Heart failure", "Liver failure", "Malnutrition"]', 1, 'High venous pressure (JVP) localized to the legs + neck indicates the "pump" (Heart) is failing.');

    ---------------------------------------------------------------------------
    -- CASE 49: Triage Reasoning (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Triage Priorities' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Triage Priorities', 'You are called to see four patients: (A) Low BP/High Fever, (B) Sore throat/Normal Vitals, (C) Sudden "worst headache"/Normal Vitals, (D) Low Oxygen/Normal BP.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are called to see four patients: (A) Low BP/High Fever, (B) Sore throat/Normal Vitals, (C) Sudden "worst headache"/Normal Vitals, (D) Low Oxygen/Normal BP.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which two patients require IMMEDIATE evaluation based on "On Call" priorities?', '["A and B", "A and D", "B and C", "C and D"]', 1, 'Patient A (Shock/Sepsis) and Patient D (Hypoxia) have life-threatening vital sign derangements.'),
    (v_case_id, 'Patient C (Worst headache) might have a "Must-not-miss" diagnosis. Which one?', '["Migraine", "Subarachnoid Hemorrhage", "Tension headache", "Sinusitis"]', 1, 'Even with normal vitals, a "Thunderclap" headache is a critical neurological emergency.'),
    (v_case_id, 'What is the reasoning principle of "Triage"?', '["See the easiest patient first", "See the most complex first", "Allocate resources based on severity/urgency", "Alphabetical order"]', 2, 'Triage is the process of determining the priority of patients'' treatments based on the severity of their condition.');

    ---------------------------------------------------------------------------
    -- CASE 50: Cognitive Heuristics (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Heuristics and Error' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Heuristics and Error', 'A doctor misses a PE because she thought the patient was "too young and fit" to have one.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor misses a PE because she thought the patient was "too young and fit" to have one.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is an example of which heuristic?', '["Representativeness", "Availability", "Sunk cost", "Gambler''s fallacy"]', 0, 'Representativeness heuristic involves judging a situation based on how similar it is to a typical prototype (the "classic" PE patient).'),
    (v_case_id, 'What is the most effective way to reduce diagnostic errors in a busy clinical environment?', '["Work faster", "Use checklists and clinical decision rules", "Memorize more facts", "Trust your gut"]', 1, 'Externalizing logic via rules (like the Wells score) mitigates subjective cognitive biases.'),
    (v_case_id, 'What is "Hindsight Bias" in clinical reasoning?', '["Predicting the future", "Tendency to see an event as predictable after it occurred", "Looking at old records", "Learning from mistakes"]', 1, 'Hindsight bias (the "I-knew-it-all-along" effect) makes us over-simplify the complexity of a decision once the outcome is known.');

    ---------------------------------------------------------------------------
    -- CASE 51: Hypokalemia Reasoning (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypokalemia: GI vs Renal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypokalemia: GI vs Renal', 'A patient has a serum K of 2.5 mEq/L. Urine K is 40 mEq/L (High).', 51) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a serum K of 2.5 mEq/L. Urine K is 40 mEq/L (High).', "order" = 51 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A high urine potassium in the setting of serum hypokalemia indicates:', '["GI loss (Diarrhea)", "Renal loss", "Inadequate intake", "Shifting into cells"]', 1, 'If the serum K is low, a healthy kidney should hold onto it (Urine K < 15-20). A high urine K proves the kidney is the source of the loss.'),
    (v_case_id, 'Which condition causes RENAL potassium loss?', '["Diarrhea", "Laxative abuse", "Diuretic use or Hyperaldosteronism", "Insulin overdose"]', 2, 'Diuretics and excess aldosterone are common drivers of renal K+ wasting.'),
    (v_case_id, 'What acid-base state is most commonly associated with diuretic-induced hypokalemia?', '["Metabolic Acidosis", "Metabolic Alkalosis", "Respiratory Acidosis", "Respiratory Alkalosis"]', 1, 'The loss of Cl- and H+ along with K+ leads to "contraction alkalosis."');

    ---------------------------------------------------------------------------
    -- CASE 52: Palpitations Logic (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Palpitations Reasoning' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Palpitations Reasoning', 'A 25-year-old student feels "skipped beats" while studying for exams. Pulse is regular.', 52) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old student feels "skipped beats" while studying for exams. Pulse is regular.', "order" = 52 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of palpitations in a healthy young person?', '["WPW syndrome", "PVCs/PACs (Premature beats)", "Atrial Fibrillation", "Ventricular Tachycardia"]', 1, 'Benign premature atrial or ventricular contractions are very common and triggered by caffeine, stress, or lack of sleep.'),
    (v_case_id, 'What "Red Flag" symptom should prompt immediate cardiac workup for palpitations?', '["Anxiety", "Syncope or near-syncope", "Chest tightness after coffee", "Sweating"]', 1, 'Syncope suggests the palpitation is due to a high-risk arrhythmia (like VT) that compromised cerebral perfusion.'),
    (v_case_id, 'An "irregularly irregular" rhythm on exam is classic for:', '["Sinus rhythm", "Atrial Fibrillation", "Mobitz II", "PVCs"]', 1, 'The absence of P waves and random ventricular response define AFib.');

    ---------------------------------------------------------------------------
    -- CASE 53: Chronic Cough Differential (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Cough Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Cough Logic', 'A 45-year-old non-smoker has had a dry cough for 10 weeks. CXR is normal.', 53) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old non-smoker has had a dry cough for 10 weeks. CXR is normal.', "order" = 53 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A cough lasting > 8 weeks is defined as:', '["Acute", "Subacute", "Chronic", "Irritating"]', 2, 'Cough classification: < 3 weeks (Acute), 3-8 weeks (Subacute), > 8 weeks (Chronic).'),
    (v_case_id, 'What are the "Big 3" causes of chronic cough in a non-smoker with a normal CXR?', '["Lung cancer, TB, Sarcoid", "GERD, Asthma, Post-nasal drip (UACS)", "Heart failure, PE, Pneumonia", "ACE inhibitor, Smoking, Anxiety"]', 1, 'Gastroesophageal reflux, Asthma, and Upper Airway Cough Syndrome (PND) account for >90% of chronic cough with normal CXR.'),
    (v_case_id, 'Which medication is a classic cause of dry chronic cough?', '["Beta-blockers", "ACE inhibitors", "Calcium channel blockers", "Statins"]', 1, 'ACE inhibitors lead to accumulation of bradykinin and substance P in the lungs, triggering cough.');

    ---------------------------------------------------------------------------
    -- CASE 54: Anemia Reasoning (First Aid)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reticulocyte Count Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reticulocyte Count Logic', 'A patient has a Hemoglobin of 8.0. Reticulocyte count is 0.5% (Low).', 54) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a Hemoglobin of 8.0. Reticulocyte count is 0.5% (Low).', "order" = 54 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a low reticulocyte count indicate in an anemic patient?', '["Excessive destruction", "Inadequate production by the marrow", "Acute blood loss", "Normal response"]', 1, 'The retic count tells you if the "factory" (marrow) is responding correctly to the anemia.'),
    (v_case_id, 'If the retic count was 5% (High), what would be the reasoning?', '["Bone marrow failure", "Hemolysis or acute blood loss response", "Iron deficiency", "Vitamin B12 deficiency"]', 1, 'A high retic count means the marrow is healthy and trying to replace lost or destroyed RBCs.'),
    (v_case_id, 'In a microcytic anemia with a LOW retic count, the next reasoning step is to check:', '["Bilirubin", "Iron studies (Ferritin)", "LDH", "B12 level"]', 1, 'Low production microcytic anemia is iron deficiency until proven otherwise.');

    ---------------------------------------------------------------------------
    -- CASE 55: D-dimer Pitfalls (EBM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'D-dimer in High Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'D-dimer in High Risk', 'A 70-year-old smoker with a swollen calf and SOB has a negative D-dimer.', 55) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old smoker with a swollen calf and SOB has a negative D-dimer.', "order" = 55 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can a negative D-dimer rule out PE in this HIGH-risk patient?', '["Yes", "No"]', 1, 'D-dimer is used to RULE OUT low-risk patients. In high-risk patients (high Wells score), the test is not reliable enough to change management.'),
    (v_case_id, 'This scenario is an example of why we must consider:', '["Only the test result", "Pre-test probability (Bayesian reasoning)", "The patient''s age", "Cost of testing"]', 1, 'The post-test probability is a function of BOTH the test result and the pre-test probability.'),
    (v_case_id, 'What is the "next step" in reasoning for this patient?', '["Discharge home", "Immediate imaging (CTPA or Leg Ultrasound)", "Repeat D-dimer", "Start antibiotics"]', 1, 'When suspicion is high, go straight to definitive imaging.');

    ---------------------------------------------------------------------------
    -- CASE 56: Delirium vs Dementia (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Confusion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Confusion', 'An 80-year-old with Alzheimer''s is brought in with sudden onset combativeness and "seeing bugs."', 56) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old with Alzheimer''s is brought in with sudden onset combativeness and "seeing bugs."', "order" = 56 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark of Delirium that distinguishes it from Dementia?', '["Memory loss", "Acute onset and fluctuating consciousness/attention", "Hallucinations", "Advanced age"]', 1, 'Dementia is stable and chronic; Delirium is acute and involves fluctuating attention.'),
    (v_case_id, 'What is the most common cause of delirium in the elderly?', '["Progression of dementia", "Underlying medical illness", "New environment", "Lack of sleep"]', 1, 'Delirium is almost always a sign of a physical problem (infection, drug effect, metabolic shift) in the elderly.'),
    (v_case_id, 'The "Confusion Assessment Method" (CAM) is a reasoning tool for:', '["Alzheimer''s", "Delirium", "Stroke", "Depression"]', 1, 'CAM is the gold-standard tool for diagnosing delirium at the bedside.');

    ---------------------------------------------------------------------------
    -- CASE 57: Dysphagia Logic (Pocket Med)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dysphagia Differential' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dysphagia Differential', 'A patient feels food "sticking" in their mid-chest.', 57) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient feels food "sticking" in their mid-chest.', "order" = 57 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the patient has trouble with SOLIDS only, the reasoning points to:', '["Motility disorder", "Mechanical obstruction", "Neurological disorder", "Anxiety"]', 1, 'Mechanical obstruction (like a tumor or ring) allows liquids to pass but traps solids.'),
    (v_case_id, 'Trouble with both SOLIDS and LIQUIDS from the start points to:', '["Mechanical obstruction", "Motility disorder", "GERD", "Esophagitis"]', 1, 'Functional/motility issues (like Achalasia) affect both textures simultaneously.'),
    (v_case_id, 'Dysphagia localized to the NECK (difficulty initiating swallow) is:', '["Esophageal dysphagia", "Oropharyngeal dysphagia", "Globus sensation", "Reflux"]', 1, 'Oropharyngeal (transfer) dysphagia is often due to neuromuscular issues (Stroke/Parkinson''s).');

    ---------------------------------------------------------------------------
    -- CASE 58: Murmur Reasoning (Learning Radiology)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Harsh Systolic Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Harsh Systolic Murmur', 'A 75-year-old has a harsh systolic crescendo-decrescendo murmur at the right upper sternal border.', 58) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old has a harsh systolic crescendo-decrescendo murmur at the right upper sternal border.', "order" = 58 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This murmur is most classic for:', '["Mitral Regurgitation", "Aortic Stenosis", "Tricuspid Regurgitation", "Pulmonic Stenosis"]', 1, 'The location and shape are characteristic of age-related calcific Aortic Stenosis.'),
    (v_case_id, 'What symptom "triad" (SAD) suggests severe Aortic Stenosis reasoning?', '["Syncope, Angina, Dyspnea", "Seizures, Asthma, Diarrhea", "Stroke, Arrhythmia, Death", "Swelling, Ascites, Distension"]', 0, 'SAD symptoms indicate a critical decrease in valve area and high mortality without replacement.'),
    (v_case_id, 'A murmur that gets LOUDER with Valsalva (decreased preload) in a young person is:', '["Aortic Stenosis", "HOCM", "Mitral Valve Prolapse", "Normal"]', 1, 'HOCM and MVP are the only murmurs that get louder when ventricular volume decreases (Valsalva).');

    ---------------------------------------------------------------------------
    -- CASE 59: Pediatric Rash Reasoning (Bates)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pediatric Rash Logic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pediatric Rash Logic', 'A child presents with a "slapped cheek" rash and lacy body rash.', 59) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A child presents with a "slapped cheek" rash and lacy body rash.', "order" = 59 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first branch point in pediatric rash reasoning?', '["Itchy vs Not itchy", "Viral Exanthem vs Other", "Local vs Systemic", "Face vs Body"]', 1, 'Differentiating systemic viral exanthems from local skin conditions is the primary task.'),
    (v_case_id, 'This "slapped cheek" appearance is classic for:', '["Measles", "Erythema Infectiosum", "Rubella", "Roseola"]', 1, 'Fifth disease (Parvovirus B19) presents with the classic malar rash followed by a reticular body rash.'),
    (v_case_id, 'A "non-blanching" petechial rash in a febrile child is:', '["A viral exanthem", "A medical emergency", "Heat rash", "Eczema"]', 1, 'Petechiae/Purpura in a febrile child suggests meningococcemia or severe thrombocytopenia.');

    ---------------------------------------------------------------------------
    -- CASE 60: AKI Framework (On Call)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Prerenal vs ATN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Prerenal vs ATN', 'A patient''s Creatinine rises from 1.0 to 3.0 mg/dL. Urine Na is 10 mEq/L.', 60) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient''s Creatinine rises from 1.0 to 3.0 mg/dL. Urine Na is 10 mEq/L.', "order" = 60 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A Urine Sodium < 20 mEq/L and FeNa < 1% points to:', '["Prerenal Azotemia", "Acute Tubular Necrosis (ATN)", "AIN", "Obstruction"]', 0, 'Low urine sodium proves the kidney is still capable of concentrating salt in response to hypoperfusion.'),
    (v_case_id, 'What is the "On Call" reasoning for a new rise in Creatinine?', '["Give fluids to everyone", "Use the Pre, Intra, Post framework", "Order a biopsy", "Wait and see"]', 1, 'The systematic "Pre (flow), Intra (tissue), Post (plumbing)" framework ensures no category is missed.'),
    (v_case_id, 'If the patient had "muddy brown" casts on UA, the reasoning would shift to:', '["Prerenal", "ATN (Intrinsic)", "Glomerulonephritis", "Normal"]', 1, 'Granular casts represent death of tubular cells, diagnostic of ATN.');

    RAISE NOTICE 'SUCCESS: Clinical Reasoning & Differential Diagnosis Case Blocks (31-60) registered.';
END $$;

COMMIT;
