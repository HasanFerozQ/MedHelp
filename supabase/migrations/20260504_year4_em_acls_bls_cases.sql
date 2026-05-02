BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for ACLS & BLS Protocols
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-acls-bls' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-acls-bls" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: High-Quality CPR (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foundation of Survival' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foundation of Survival', 'A 60-year-old male collapses in the ER waiting room. He is unresponsive and pulseless.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male collapses in the ER waiting room. He is unresponsive and pulseless.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended compression rate for high-quality adult CPR?', '["60-80/min", "100-120/min", "140-160/min", "None"]', 1, 'The AHA recommends a rate of 100-120 compressions per minute for optimal cardiac output.'),
    (v_case_id, 'What is the target compression depth for an adult?', '["At least 1 inch", "At least 2 inches (5 cm) but no more than 2.4 inches (6 cm)", "3 inches", "None"]', 1, 'Deep compressions are necessary to generate adequate perfusion pressure.'),
    (v_case_id, 'Why is complete chest recoil important?', '["It looks better", "It allows the heart to refill with blood (maximizing preload)", "It prevents rib fractures", "None"]', 1, 'Incomplete recoil increases intrathoracic pressure and decreases coronary perfusion pressure.');

    ---------------------------------------------------------------------------
    -- CASE 02: Ventricular Fibrillation - VF (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shockable Rhythm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shockable Rhythm', 'The monitor shows a chaotic, irregular, wavy baseline with no identifiable P waves or QRS complexes in a pulseless patient.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Shockable Rhythm', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority for this rhythm?', '["Epinephrine", "Defibrillation (unsynchronized shock)", "Intubation", "None"]', 1, 'VF/pVT are shockable rhythms; early defibrillation is the single most important intervention.'),
    (v_case_id, 'What should be done immediately AFTER the shock is delivered?', '["Check pulse", "Resume high-quality CPR starting with chest compressions", "Give Amiodarone", "None"]', 1, 'Do not pause for a pulse check immediately after a shock; resume compressions for 2 minutes.'),
    (v_case_id, 'What is the initial energy dose for a biphasic defibrillator?', '["50 J", "120-200 J (or manufacturer''s recommendation)", "360 J", "None"]', 1, 'Biphasic shocks are more efficient than monophasic ones at lower energies.');

    ---------------------------------------------------------------------------
    -- CASE 03: Asystole (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flat Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flat Line', 'A patient in cardiac arrest shows a flat line on the monitor in two leads.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Flat Line', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is asystole a shockable rhythm?', '["Yes", "No", "Only if it is \"fine\" VF", "None"]', 1, 'Defibrillating asystole is not beneficial and may cause further myocardial damage.'),
    (v_case_id, 'When should the first dose of Epinephrine be given in asystole/PEA?', '["After 3 shocks", "As soon as possible", "After 10 minutes", "None"]', 1, 'Early epinephrine in non-shockable rhythms is associated with better outcomes.'),
    (v_case_id, 'What should you do to confirm true asystole?', '["Check for a pulse again", "Check leads, power, and gain settings", "Nothing", "None"]', 1, 'Ensure the flat line isn''t just a disconnected lead or low gain setting.');

    ---------------------------------------------------------------------------
    -- CASE 04: PEA - Pulseless Electrical Activity (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Electrical-Mechanical Mismatch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Electrical-Mechanical Mismatch', 'The monitor shows organized Sinus Bradycardia at 40 bpm, but the patient has no palpable pulse.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Electrical-Mechanical Mismatch', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Asystole", "Pulseless Electrical Activity (PEA)", "Severe Bradycardia", "None"]', 1, 'PEA is defined as organized electrical activity on the monitor without a mechanical pulse.'),
    (v_case_id, 'What is the priority when managing PEA?', '["Shocking", "High-quality CPR and identifying reversible causes (H''s and T''s)", "Pacing", "None"]', 1, 'The key to treating PEA is finding and fixing the underlying cause.'),
    (v_case_id, 'What is the most common cause of PEA?', '["Tamponade", "Hypovolemia", "Hyperkalemia", "None"]', 1, 'Severe volume loss is a frequent driver of PEA.');

    ---------------------------------------------------------------------------
    -- CASE 05: Reversible Causes - Tension Pneumothorax (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Traumatic PEA' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Traumatic PEA', 'A trauma patient in cardiac arrest has distended neck veins and absent breath sounds on the right.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Traumatic PEA', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the \"T''s\" is likely causing the arrest?', '["Toxins", "Tension Pneumothorax", "Tamponade", "None"]', 1, 'The classic signs of tension pneumothorax during arrest are difficult ventilation and clinical signs of obstructive shock.'),
    (v_case_id, 'What is the immediate treatment for a suspected tension pneumothorax in arrest?', '["Chest X-ray", "Needle decompression or Finger thoracostomy", "Intubation", "None"]', 1, 'This must be done clinically without waiting for imaging.'),
    (v_case_id, 'Where is the current recommended site for needle decompression?', '["2nd intercostal space", "4th or 5th intercostal space at the anterior axillary line", "None", "None"]', 1, 'Modern guidelines favor the lateral approach due to thinner chest walls and better success rates.');

    ---------------------------------------------------------------------------
    -- CASE 06: Reversible Causes - Hyperkalemia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Renal Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Renal Patient', 'A dialysis patient collapses. The monitor shows wide, bizarre QRS complexes that look like a sine wave.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Renal Patient', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the \"H''s\" should be suspected?', '["Hypoxia", "Hyperkalemia", "Hypovolemia", "None"]', 1, 'Wide QRS progressing to a sine wave is a classic ECG sign of life-threatening hyperkalemia.'),
    (v_case_id, 'What medication should be given to STABILIZE the cardiac membrane?', '["Insulin", "Calcium Gluconate or Calcium Chloride", "Sodium Bicarbonate", "None"]', 1, 'Calcium antagonizes the effects of potassium on the heart but does not lower the K level.'),
    (v_case_id, 'What is the role of Sodium Bicarbonate in this arrest?', '["Increases K", "Shifts K into the cells (especially if acidosis is present)", "None", "None"]', 1, 'Bicarbonate helps drive K intracellularly.');

    ---------------------------------------------------------------------------
    -- CASE 07: Tachycardia - Unstable (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shock and Speed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shock and Speed', 'A 70-year-old female has a heart rate of 180 bpm, blood pressure 70/40, and is confused.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Shock and Speed', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this patient stable or unstable?', '["Stable", "Unstable", "Neither", "None"]', 1, 'Hypotension and altered mental status in the presence of tachycardia define instability.'),
    (v_case_id, 'What is the immediate treatment of choice for unstable tachycardia with a pulse?', '["Amiodarone", "Synchronized Cardioversion", "Adenosine", "None"]', 1, 'Electricity is the first-line for unstable patients.'),
    (v_case_id, 'Why is the \"Sync\" mode critical in this patient?', '["It uses more power", "It prevents the shock from falling on the T-wave (R-on-T) which could cause VF", "It is easier", "None"]', 1, 'Synchronization ensures the energy is delivered during the R-wave.');

    ---------------------------------------------------------------------------
    -- CASE 08: Supraventricular Tachycardia - SVT (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Palpitations and a Narrow QRS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Palpitations and a Narrow QRS', 'A 25-year-old male has sudden palpitations. HR 170 bpm, narrow QRS, regular, stable BP.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Palpitations and a Narrow QRS', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first non-pharmacological step for stable SVT?', '["Shock", "Vagal maneuvers (e.g., Valsalva, Carotid sinus massage)", "Atropine", "None"]', 1, 'Vagal maneuvers can often terminate SVT by increasing parasympathetic tone.'),
    (v_case_id, 'What is the first-line drug for stable SVT if vagal maneuvers fail?', '["Amiodarone", "Adenosine", "Diltiazem", "None"]', 1, 'Adenosine blocks conduction through the AV node temporarily.'),
    (v_case_id, 'What is the initial dose of Adenosine?', '["1 mg", "6 mg (rapid IV push followed by flush)", "12 mg", "None"]', 1, 'The half-life of adenosine is seconds; it must be pushed extremely fast.');

    ---------------------------------------------------------------------------
    -- CASE 09: Bradycardia - Symptomatic (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Slow and Low' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Slow and Low', 'An 80-year-old has a heart rate of 35 bpm, chest pain, and lightheadedness.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Slow and Low', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line medication for symptomatic bradycardia?', '["Dopamine", "Atropine (1 mg)", "Lidocaine", "None"]', 1, 'Atropine increases the heart rate by blocking the vagus nerve.'),
    (v_case_id, 'If Atropine is ineffective, what is the next step for a symptomatic patient?', '["Adenosine", "Transcutaneous Pacing (TCP)", "Vasopressin", "None"]', 1, 'Pacing should be initiated without delay if meds fail or the patient is unstable.'),
    (v_case_id, 'What chronotropic infusions can be considered if pacing is not available?', '["Insulin", "Dopamine or Epinephrine infusion", "None", "None"]', 1, 'Both are effective for increasing heart rate and blood pressure.');

    ---------------------------------------------------------------------------
    -- CASE 10: Torsades de Pointes (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Twisting of the Points' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Twisting of the Points', 'A pulseless patient shows Polymorphic Ventricular Tachycardia on the monitor.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Twisting of the Points', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific medication indicated for Torsades de Pointes?', '["Calcium", "Magnesium Sulfate (1-2g IV)", "Amiodarone", "None"]', 1, 'Magnesium is the drug of choice for managing polymorphic VT associated with a long QT interval.'),
    (v_case_id, 'Should you defibrillate a patient in pulseless Torsades?', '["No", "Yes, it is treated like VF/pVT", "Only if stable", "None"]', 1, 'Any pulseless VT requires immediate unsynchronized shock.'),
    (v_case_id, 'What is a common risk factor for developing Torsades?', '["Caffeine", "Drugs that prolong the QT interval (e.g., certain antibiotics, antipsychotics)", "Running", "None"]', 1, 'QT prolongation increases the risk of this lethal arrhythmia.');

    ---------------------------------------------------------------------------
    -- CASE 11: Targeted Temperature Management - TTM (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Protecting the Brain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Protecting the Brain', 'A patient achieves ROSC after VF arrest but remains comatose and does not follow commands.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Protecting the Brain', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of TTM in post-arrest care?', '["Cure the heart", "Improve neurological outcomes by cooling the body", "Lower BP", "None"]', 1, 'TTM helps prevent secondary brain injury after reperfusion.'),
    (v_case_id, 'What is the recommended temperature range for TTM?', '["28-30°C", "32-36°C", "37-39°C", "None"]', 1, 'Maintaining a constant temperature within this range for 24 hours is standard.'),
    (v_case_id, 'Which patients are eligible for TTM?', '["Everyone", "Adults who achieve ROSC but are unresponsive", "Only children", "None"]', 1, 'Comatose ROSC patients benefit most.');

    ---------------------------------------------------------------------------
    -- CASE 12: Quantitative Waveform Capnography (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Monitor for CPR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Monitor for CPR', 'A patient is intubated during cardiac arrest. The ETCO2 is consistently 8 mmHg.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Monitor for CPR', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does an ETCO2 < 10 mmHg indicate during CPR?', '["Hyperventilation", "Poor cardiac output / inadequate compressions", "ROSC", "None"]', 1, 'If ETCO2 is low, the team should focus on improving compression depth and rate.'),
    (v_case_id, 'A sudden jump in ETCO2 to 40 mmHg during arrest suggests what?', '["Tube dislodged", "Return of Spontaneous Circulation (ROSC)", "Acidosis", "None"]', 1, 'A sudden spike in CO2 indicates the heart has started pumping effectively again.'),
    (v_case_id, 'Besides monitoring CPR quality, what is the primary role of capnography?', '["Checking sugar", "Confirming and monitoring correct ET tube placement", "None", "None"]', 1, 'It is the most reliable way to ensure the tube is in the trachea.');

    ---------------------------------------------------------------------------
    -- CASE 13: PEA - Cardiac Tamponade (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Squeezed Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Squeezed Heart', 'A patient in PEA has distended neck veins and a recent history of metastatic lung cancer.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Squeezed Heart', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the \"T''s\" is the likely cause?', '["Toxins", "Cardiac Tamponade", "Thrombosis", "None"]', 1, 'Pericardial effusion/tamponade is a common cause of obstructive shock and PEA.'),
    (v_case_id, 'What are the components of Beck''s Triad (though often absent in arrest)?', '["Fever, Rash, Pain", "Hypotension, JVD, and Muffled heart sounds", "None", "None"]', 1, 'These are the classic signs of tamponade in a breathing patient.'),
    (v_case_id, 'What is the emergency treatment for tamponade in cardiac arrest?', '["Aspirin", "Pericardiocentesis", "Chest tube", "None"]', 1, 'Removing even a small amount of fluid can restore cardiac output.');

    ---------------------------------------------------------------------------
    -- CASE 14: Opioid-Associated Emergency (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pinpoint Pupils' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pinpoint Pupils', 'A young adult is found unresponsive in a bathroom. Respiratory rate is 4, pupils are pinpoint.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pinpoint Pupils', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority?', '["Chest compressions", "Bag-mask ventilation and Naloxone administration", "Blood test", "None"]', 1, 'If the patient has a pulse, focus on reversing the respiratory depression.'),
    (v_case_id, 'If the patient is pulseless, what comes first?', '["Naloxone", "Standard CPR / ACLS", "None", "None"]', 1, 'In cardiac arrest, standard ACLS (compressions/shocks) takes priority over specific antidotes.'),
    (v_case_id, 'Why must you continue to monitor the patient after giving Naloxone?', '["It is expensive", "The half-life of Naloxone is shorter than many opioids (re-sedation risk)", "None", "None"]', 1, 'The patient may slide back into respiratory arrest as the Naloxone wears off.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cardiac Arrest in Pregnancy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Two Patients at Once' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Two Patients at Once', 'A pregnant woman at 30 weeks gestation collapses and goes into cardiac arrest.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Two Patients at Once', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the essential modification for chest compressions in late pregnancy?', '["Softer compressions", "Manual left uterine displacement (LUD)", "Turning her on her side", "None"]', 1, 'LUD moves the uterus off the inferior vena cava to allow for venous return.'),
    (v_case_id, 'If ROSC is not achieved within 5 minutes, what procedure should be performed?', '["MRI", "Perimortem Cesarean Delivery (PMCD)", "X-ray", "None"]', 1, 'PMCD is done to improve the chances of maternal ROSC by relieving aortocaval compression.'),
    (v_case_id, 'Should you use the AED on a pregnant woman?', '["No", "Yes, standard AED protocols apply", "Maybe", "None"]', 1, 'The shock does not harm the fetus and is vital for maternal survival.');

    ---------------------------------------------------------------------------
    -- CASE 16: Anaphylaxis in Arrest (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bee Sting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bee Sting', 'A patient collapses after a bee sting. He has severe wheezing and then goes pulseless.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bee Sting', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What drug is the cornerstone of therapy for anaphylaxis?', '["Diphenhydramine", "Epinephrine", "Steroids", "None"]', 1, 'Epinephrine reverses vasodilation and bronchoconstriction.'),
    (v_case_id, 'How does the dose of Epinephrine change in cardiac arrest?', '["It is lower", "Standard ACLS dose (1mg IV) is used", "None", "None"]', 1, 'Once in arrest, follow the standard 1mg IV every 3-5 minutes protocol.'),
    (v_case_id, 'What is a major challenge during the arrest of an anaphylaxis patient?', '["Low BP only", "Difficult airway management due to laryngeal edema", "None", "None"]', 1, 'Early advanced airway management may be necessary before the swelling closes the airway.');

    ---------------------------------------------------------------------------
    -- CASE 17: Post-ROSC Hemodynamics (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Maintaining the Pressure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Maintaining the Pressure', 'After ROSC, a patient''s blood pressure is 80/50 mmHg.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Maintaining the Pressure', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the target Mean Arterial Pressure (MAP) post-ROSC?', '["At least 50", "At least 65 mmHg", "100", "None"]', 1, 'Maintaining adequate perfusion pressure is vital for organ and brain recovery.'),
    (v_case_id, 'What is the first step in treating post-ROSC hypotension?', '["Vasopressors", "IV Fluid boluses (1-2 L of Saline/LR)", "None", "None"]', 1, 'Volume expansion is the initial step for hypotension.'),
    (v_case_id, 'If fluids fail to raise the BP, what infusions are used?', '["Dopamine, Epinephrine, or Norepinephrine", "Amiodarone", "None", "None"]', 0, 'Vasopressor infusions are titrated to the target MAP.');

    ---------------------------------------------------------------------------
    -- CASE 18: Hypothermia in Arrest (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Frozen Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Frozen Heart', 'A patient is found submerged in a cold lake. Body temperature is 28°C (82°F).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Frozen Heart', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical rule regarding death and hypothermia?', '["They are dead", "A patient is not dead until they are warm and dead (usually > 32°C)", "None", "None"]', 1, 'Hypothermia is neuroprotective, and resuscitation should continue during rewarming.'),
    (v_case_id, 'How should drug administration be modified in severe hypothermia (< 30°C)?', '["Double the dose", "Withhold or space out drug administration as metabolism is slow", "None", "None"]', 1, 'Drug toxicity is a concern; focus on rewarming and defibrillation.'),
    (v_case_id, 'What is an effective internal rewarming method for cardiac arrest?', '["Warm blankets", "Warmed IV fluids and warmed humidified oxygen", "None", "None"]', 1, 'Active internal rewarming is needed for severe hypothermia.');

    ---------------------------------------------------------------------------
    -- CASE 19: Pulseless VT (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fast and Pulseless' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fast and Pulseless', 'The monitor shows a wide, regular QRS complex at 200 bpm. The patient has no pulse.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fast and Pulseless', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is pulseless VT (pVT) treated in the ACLS algorithm?', '["Like SVT", "Exactly like Ventricular Fibrillation (VF)", "With Atropine", "None"]', 1, 'pVT and VF are the two shockable rhythms in the cardiac arrest algorithm.'),
    (v_case_id, 'Should you synchronize the shock for pVT?', '["Yes", "No, it must be an unsynchronized high-energy shock", "Only if it is slow", "None"]', 1, 'If there is no pulse, do not wait for the machine to synchronize; deliver the shock immediately.'),
    (v_case_id, 'If pVT persists after 2 shocks and Epinephrine, what drug is added?', '["Magnesium", "Amiodarone or Lidocaine", "None", "None"]', 1, 'Antiarrhythmics are given after the second or third shock.');

    ---------------------------------------------------------------------------
    -- CASE 20: Amiodarone in Arrest (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Antiarrhythmic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Antiarrhythmic', 'A patient is in refractory VF after 3 shocks.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Antiarrhythmic', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first dose of Amiodarone in cardiac arrest?', '["150 mg", "300 mg IV bolus", "1 mg", "None"]', 1, 'The initial arrest dose is 300mg.'),
    (v_case_id, 'What is the second dose of Amiodarone if VF persists?', '["300 mg", "150 mg IV bolus", "None", "None"]', 1, 'The second dose is half the first.'),
    (v_case_id, 'What is an alternative to Amiodarone in the shockable algorithm?', '["Atropine", "Lidocaine (1-1.5 mg/kg)", "None", "None"]', 1, 'Lidocaine is now considered equivalent to Amiodarone for VF/pVT.');

    ---------------------------------------------------------------------------
    -- CASE 21: Epinephrine Mechanism (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Vasopressor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Vasopressor', 'A student asks why Epinephrine is used in cardiac arrest.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Vasopressor', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary beneficial effect of Epinephrine during CPR?', '["It starts the heart", "Alpha-adrenergic vasoconstriction, which increases coronary perfusion pressure", "It lowers pH", "None"]', 1, 'By narrowing peripheral vessels, it shunts blood back toward the heart and brain.'),
    (v_case_id, 'What is the beta-adrenergic effect of Epinephrine?', '["Increases HR and contractility", "Slows the heart", "Vasodilation", "None"]', 0, 'While this exists, it may increase myocardial oxygen demand during arrest.'),
    (v_case_id, 'What is the standard dose and frequency of Epinephrine in ACLS?', '["1 mg every minute", "1 mg every 3 to 5 minutes", "None", "None"]', 1, 'Consistency in timing is important for maintaining levels.');

    ---------------------------------------------------------------------------
    -- CASE 22: Second-Degree Heart Block Type II (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dangerous Block' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dangerous Block', 'The ECG shows a constant PR interval with sudden dropped QRS complexes. HR 45 bpm.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Dangerous Block', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz I (Wenckebach)", "Mobitz II", "3rd Degree Block", "None"]', 1, 'Mobitz II is characterized by sudden drops without PR lengthening.'),
    (v_case_id, 'Why is Atropine often ineffective for Mobitz II or 3rd-degree blocks?', '["The dose is too low", "The block is typically at or below the Bundle of His (infra-nodal)", "None", "None"]', 1, 'Atropine works at the SA/AV nodes; it doesn''t help if the block is lower in the conduction system.'),
    (v_case_id, 'What is the definitive treatment for Mobitz II with symptoms?', '["Adenosine", "Transvenous or Permanent Pacing", "None", "None"]', 1, 'Mobitz II is high-risk for progressing to complete heart block.');

    ---------------------------------------------------------------------------
    -- CASE 23: Vagal Maneuvers - The Modified Valsalva (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The REVERT Trial' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The REVERT Trial', 'You are performing a vagal maneuver on a stable SVT patient.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The REVERT Trial', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Modified Valsalva\" technique?', '["Squeezing the nose", "Blowing into a syringe while sitting, then laying flat and raising legs", "None", "None"]', 1, 'This technique (REVERT trial) significantly increases the success rate of terminating SVT.'),
    (v_case_id, 'What is a contraindication to carotid sinus massage?', '["Fever", "History of TIA, stroke, or carotid bruits", "Age > 20", "None"]', 1, 'It could dislodge a plaque and cause a stroke.'),
    (v_case_id, 'Where exactly is the carotid sinus located?', '["At the collarbone", "At the level of the thyroid cartilage (C4) below the angle of the jaw", "None", "None"]', 1, 'Massaging the correct anatomical spot is necessary for effectiveness.');

    ---------------------------------------------------------------------------
    -- CASE 24: Atrial Fibrillation with RVR (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregularly Irregular' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregularly Irregular', 'A 65-year-old has an irregularly irregular narrow QRS rhythm at 150 bpm. Stable BP.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Irregularly Irregular', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["SVT", "Atrial Fibrillation with Rapid Ventricular Response (RVR)", "Flutter", "None"]', 1, 'The lack of P waves and irregular rhythm is classic for A-Fib.'),
    (v_case_id, 'What is the goal of management for a stable A-Fib with RVR patient in the ED?', '["Immediate conversion to sinus", "Rate control (e.g., with Diltiazem or Beta-blockers)", "None", "None"]', 1, 'Controlling the heart rate is the initial priority.'),
    (v_case_id, 'When is synchronized cardioversion indicated for A-Fib?', '["Always", "If the patient becomes unstable (hypotension, heart failure, ischemia)", "Never", "None"]', 1, 'Unstable patients need electricity, but there is a risk of thromboembolism if the A-fib is old.');

    ---------------------------------------------------------------------------
    -- CASE 25: Procainamide in Tachycardia (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stable Wide-Complex Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stable Wide-Complex Tachycardia', 'A stable patient has Monomorphic VT at 160 bpm.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stable Wide-Complex Tachycardia', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What drug is recommended for stable Monomorphic VT?', '["Adenosine", "Procainamide (20-50 mg/min)", "Atropine", "None"]', 1, 'Procainamide is often preferred over Amiodarone for stable VT.'),
    (v_case_id, 'What is an endpoint for stopping the Procainamide infusion?', '["Patient falls asleep", "Hypotension, QRS widening > 50%, or arrhythmia suppression", "None", "None"]', 1, 'The infusion must be monitored closely for toxicity.'),
    (v_case_id, 'What is a major contraindication to Procainamide?', '["Fever", "Prolonged QT interval or CHF", "None", "None"]', 1, 'Procainamide can further prolong the QT interval.');

    ---------------------------------------------------------------------------
    -- CASE 26: ROSC - Post-Cardiac Arrest Care (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The ROSC Bundle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The ROSC Bundle', 'You have achieved ROSC in a patient after a 10-minute arrest.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The ROSC Bundle', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the target SpO2 post-ROSC?', '["100%", "92% to 98%", "85%", "None"]', 1, 'Avoiding hyperoxia is important to minimize oxidative stress on the brain.'),
    (v_case_id, 'What is the target PaCO2 post-ROSC?', '["20-30 mmHg", "35-45 mmHg (normocapnia)", "60 mmHg", "None"]', 1, 'Avoiding hypocapnia prevents cerebral vasoconstriction.'),
    (v_case_id, 'If the initial ECG shows ST-elevation post-ROSC, where should the patient go?', '["Home", "Cardiac Catheterization Lab (Emergent PCI)", "ICU only", "None"]', 1, 'Coronary artery occlusion is a common cause of arrest and must be treated.');

    ---------------------------------------------------------------------------
    -- CASE 27: Atropine Limits (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Maxing Out Atropine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Maxing Out Atropine', 'You are giving repeated doses of Atropine to a bradycardic patient.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Maxing Out Atropine', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the maximum total dose of Atropine for bradycardia?', '["1 mg", "3 mg", "10 mg", "None"]', 1, '3 mg is considered the full vagolytic dose.'),
    (v_case_id, 'What happens if you give a dose of Atropine that is too small (< 0.5 mg)?', '["Nothing", "Paradoxical slowing of the heart rate", "Heart attack", "None"]', 1, 'Small doses can have a central vagomimetic effect.'),
    (v_case_id, 'Why does Atropine not work in heart transplant patients?', '["They are too sick", "The transplanted heart is denervated (no vagal nerve connection)", "None", "None"]', 1, 'The vagal-blocking mechanism of Atropine has no effect on a heart without vagal input.');

    ---------------------------------------------------------------------------
    -- CASE 28: Sodium Bicarbonate Indications (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Alkalinization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Alkalinization', 'A pulseless patient has a history of tricyclic antidepressant (TCA) overdose.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Alkalinization', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific indication for Sodium Bicarbonate in this arrest?', '["To treat acidosis", "TCA overdose (to overcome sodium channel blockade)", "None", "None"]', 1, 'Bicarbonate helps displace the TCA from the cardiac sodium channels.'),
    (v_case_id, 'Should Bicarbonate be used routinely in all cardiac arrests?', '["Yes", "No, it is only for specific indications (Hyperkalemia, TCA, known pre-existing metabolic acidosis)", "None", "None"]', 1, 'Routine use can cause paradoxical intracellular acidosis and is not recommended.'),
    (v_case_id, 'What is a risk of giving too much Sodium Bicarbonate?', '["Low Sodium", "Hypernatremia and Alkalosis", "None", "None"]', 1, 'It is a hypertonic sodium solution.');

    ---------------------------------------------------------------------------
    -- CASE 29: Transcutaneous Pacing - TCP (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'External Pacing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'External Pacing', 'You are starting TCP on a patient with 3rd-degree heart block.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'External Pacing', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you confirm \"Electrical Capture\" during TCP?', '["Patient wakes up", "A pacer spike followed by a wide QRS complex on the monitor", "None", "None"]', 1, 'You must see the pacer stimulus trigger a ventricular response.'),
    (v_case_id, 'How do you confirm \"Mechanical Capture\"?', '["Blood pressure", "A palpable pulse that matches the pacer rate", "None", "None"]', 1, 'Electrical capture does not always mean the heart is contracting effectively.'),
    (v_case_id, 'What is a common reason for failure of TCP?', '["Battery dead", "Large patient body habitus or electrode placement issues", "None", "None"]', 1, 'High impedance can prevent current from reaching the heart.');

    ---------------------------------------------------------------------------
    -- CASE 30: Lidocaine vs. Amiodarone (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Refractory VF' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Refractory VF', 'A patient remains in VF after Epinephrine and multiple shocks.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Refractory VF', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antiarrhythmic is now preferred according to latest evidence?', '["Amiodarone", "Lidocaine", "Neither (they are considered equivalent)", "None"]', 2, 'Recent trials (e.g., ROC ALPS) showed no significant difference between the two for survival to hospital discharge.'),
    (v_case_id, 'What is the dose of Lidocaine for refractory VF?', '["1 mg", "1.0 to 1.5 mg/kg IV bolus", "None", "None"]', 1, 'Weight-based dosing is used for lidocaine.'),
    (v_case_id, 'When is the second dose of Lidocaine given?', '["After 2 mins", "After another round of CPR/Shock (0.5 to 0.75 mg/kg)", "None", "None"]', 1, 'Maintenance of therapeutic levels requires a second, smaller dose.');

    ---------------------------------------------------------------------------
    -- CASE 31: Drowning - ACLS (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Submersion Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Submersion Injury', 'A patient is pulled from a pool, pulseless and apneic.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Submersion Injury', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of cardiac arrest in drowning?', '["Heart attack", "Hypoxia (asphyxiation)", "Cold", "None"]', 1, 'The lack of oxygen is the driver; therefore, ventilation is critical.'),
    (v_case_id, 'In drowning BLS, what is the recommended sequence modification?', '["C-A-B", "A-B-C (give rescue breaths early)", "None", "None"]', 1, 'Because drowning is a primary hypoxic arrest, early ventilation is prioritized.'),
    (v_case_id, 'Should you try to drain water from the lungs (Heimlich maneuver)?', '["Yes", "No, it delays CPR and increases the risk of aspiration", "None", "None"]', 1, 'Most drowning victims aspirate only a small amount of water; do not waste time trying to remove it.');

    ---------------------------------------------------------------------------
    -- CASE 32: Calcium Chloride vs. Gluconate (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Calcium for Hyperkalemia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Calcium for Hyperkalemia', 'You are treating a patient with hyperkalemic sine waves.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Calcium for Hyperkalemia', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which form of calcium contains more elemental calcium per volume?', '["Calcium Gluconate", "Calcium Chloride (3x more calcium)", "None", "None"]', 1, 'Calcium Chloride is more potent but also more caustic to veins.'),
    (v_case_id, 'Why is Calcium Gluconate often preferred for peripheral IV use?', '["It is faster", "It is less likely to cause tissue necrosis if it extravasates", "None", "None"]', 1, 'Calcium chloride should ideally be given through a central line.'),
    (v_case_id, 'How quickly does calcium work to stabilize the heart?', '["1 hour", "Within 1 to 3 minutes", "10 minutes", "None"]', 1, 'The effect is rapid but short-lived (30-60 minutes).');

    ---------------------------------------------------------------------------
    -- CASE 33: Tachycardia - Stable Monomorphic VT (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wide Complex and Stable' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wide Complex and Stable', 'A 50-year-old male has regular Monomorphic VT. BP 120/80, no symptoms.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Wide Complex and Stable', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If you are unsure if a wide-complex rhythm is SVT with aberrancy or VT, how should you treat it?', '["As SVT", "As Ventricular Tachycardia (VT)", "None", "None"]', 1, 'In the ED, any wide-complex tachycardia is VT until proven otherwise.'),
    (v_case_id, 'What medication can be used for stable monomorphic VT according to ACLS?', '["Procainamide, Amiodarone, or Sotalol", "Adenosine", "Atropine", "None"]', 0, 'Multiple options exist for pharmacological cardioversion.'),
    (v_case_id, 'What should you have ready in case the patient becomes unstable during the drug infusion?', '["Suction", "Synchronized Cardioverter", "Food", "None"]', 1, 'Always be prepared for electrical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 34: PEA - Hypovolemia (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Empty Tank' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Empty Tank', 'A patient with severe GI bleeding collapses into PEA.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Empty Tank', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary treatment for PEA caused by hypovolemia?', '["Epinephrine only", "Rapid volume replacement (blood/fluids)", "Shock", "None"]', 1, 'The heart is trying to pump but has no fluid to move.'),
    (v_case_id, 'What is the characteristic look of the heart on ultrasound in hypovolemic PEA?', '["Large/dilated", "Hyperdynamic and \"empty\" (collapsing) ventricles", "None", "None"]', 1, 'Bedside ultrasound (POCUS) is vital for identifying this cause.'),
    (v_case_id, 'Will chest compressions be effective in severe hypovolemic arrest without fluid?', '["Yes", "No, they will be minimally effective as there is no preload", "Maybe", "None"]', 1, 'Circulation requires volume.');

    ---------------------------------------------------------------------------
    -- CASE 35: Asystole - Termination of Resuscitation (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When to Stop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When to Stop', 'You have been resuscitating a patient in asystole for 30 minutes. All reversible causes have been addressed.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'When to Stop', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the general guideline for terminating resuscitation in out-of-hospital arrest?', '["1 hour", "Unwitnessed arrest, no shocks, and no ROSC after 20 mins of high-quality CPR", "None", "None"]', 1, 'The prognosis for asystole after 20 minutes of ACLS is extremely poor.'),
    (v_case_id, 'Is the absence of a pupillary reflex a reliable indicator for stopping CPR in the first 5 mins?', '["Yes", "No, it is not reliable during the acute resuscitation phase", "None", "None"]', 1, 'Many factors, including meds, can affect pupil reactivity.'),
    (v_case_id, 'What should the physician do before officially calling the time of death?', '["Check the clock", "Perform a \"final pulse check\" and pause to ensure everyone on the team agrees", "None", "None"]', 1, 'Team communication is key for ethical and professional closure.');

    ---------------------------------------------------------------------------
    -- CASE 36: Tachycardia - Stable Atrial Flutter (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sawtooth Pattern' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sawtooth Pattern', 'The monitor shows a regular narrow-complex rhythm at 150 bpm with \"sawtooth\" waves between QRS complexes.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sawtooth Pattern', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["SVT", "Atrial Flutter", "A-fib", "None"]', 1, 'The sawtooth pattern is pathognomonic for Atrial Flutter.'),
    (v_case_id, 'Atrial flutter with a ventricular rate of exactly 150 bpm often indicates what ratio of conduction?', '["1:1", "2:1", "4:1", "None"]', 1, 'The atrial rate in flutter is usually ~300; 2:1 conduction results in a ventricular rate of 150.'),
    (v_case_id, 'What is the treatment for stable Atrial Flutter?', '["Shock", "Rate control (e.g., Diltiazem) and anticoagulation assessment", "None", "None"]', 1, 'Manage it similarly to Atrial Fibrillation.');

    ---------------------------------------------------------------------------
    -- CASE 37: ACLS - ET Tube Placement (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Securing the Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Securing the Airway', 'You have successfully intubated a patient in arrest. You hear breath sounds on the right but not on the left.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Securing the Airway', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely reason for asymmetrical breath sounds after intubation?', '["Pneumothorax", "Right mainstem bronchus intubation", "Tube in esophagus", "None"]', 1, 'The right bronchus is more vertical; tubes often slide down into it.'),
    (v_case_id, 'What is the immediate corrective action?', '["Remove the tube", "Deflate cuff and pull the tube back slightly (1-2 cm) then re-auscultate", "None", "None"]', 1, 'The tube should sit about 2-3 cm above the carina.'),
    (v_case_id, 'Once the airway is secured, how often should breaths be given?', '["Every 2 seconds", "1 breath every 6 seconds (10 breaths/min) with continuous compressions", "None", "None"]', 1, 'Do not synchronize ventilations once an advanced airway is in place.');

    ---------------------------------------------------------------------------
    -- CASE 38: PEA - Pulmonary Embolism (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Massive Clot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Massive Clot', 'A patient post-op from hip surgery collapses into PEA. Lung sounds are clear.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Massive Clot', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the \"T''s\" is most likely?', '["Tension Pneumo", "Thrombosis (Pulmonary)", "Tamponade", "None"]', 1, 'Massive PE is a common cause of sudden PEA arrest, especially in surgical patients.'),
    (v_case_id, 'What drug is sometimes considered in PEA arrest with high suspicion of PE?', '["Insulin", "Thrombolytics (e.g., tPA)", "None", "None"]', 1, 'While controversial, tPA is used in \"crashing\" PE cases.'),
    (v_case_id, 'What is seen on bedside ECHO in massive PE?', '["Small RV", "Right Ventricular (RV) strain/dilation and D-sign", "None", "None"]', 1, 'The RV is overloaded because it cannot pump past the clot.');

    ---------------------------------------------------------------------------
    -- CASE 39: Bradycardia - Atropine Side Effects (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Atropine Flush' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Atropine Flush', 'You have given Atropine and the patient''s HR increases, but they are now confused and their skin is hot/dry.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Atropine Flush', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of these new symptoms?', '["Sepsis", "Anticholinergic toxicity (side effect of Atropine)", "None", "None"]', 1, 'Atropine is an anticholinergic; the mnemonic is \"Mad as a hatter, red as a beet, dry as a bone...\"'),
    (v_case_id, 'What should you do?', '["Give more Atropine", "Monitor only (it is transient and expected at high doses)", "Give antibiotics", "None"]', 1, 'Reassurance and monitoring are usually sufficient.'),
    (v_case_id, 'Does Atropine work on 3rd-degree heart blocks with wide QRS?', '["Yes", "Rarely, as the block is below the AV node", "None", "None"]', 1, 'Wide-complex blocks are usually infra-nodal.');

    ---------------------------------------------------------------------------
    -- CASE 40: Tachycardia - Cardioversion Sedation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Comfort for the Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Comfort for the Shock', 'A patient with stable SVT has failed meds and you are preparing for elective synchronized cardioversion.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Comfort for the Shock', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important preparatory step for elective cardioversion?', '["Food", "Sedation and analgesia (if the patient is stable enough)", "None", "None"]', 1, 'Electric shocks are extremely painful; procedural sedation is required if time permits.'),
    (v_case_id, 'If the patient is severely unstable (unconscious), should you wait for sedation?', '["Yes", "No, deliver the shock immediately", "None", "None"]', 1, 'Do not delay life-saving treatment for sedation in an emergency.'),
    (v_case_id, 'What is a common drug used for rapid sedation during cardioversion?', '["Tylenol", "Etomidate or Propofol", "None", "None"]', 1, 'Short-acting agents are ideal for this procedure.');

    ---------------------------------------------------------------------------
    -- CASE 41: Asystole - Hypothermia (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cold Arrest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cold Arrest', 'A patient is in arrest with a core temperature of 29°C.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Cold Arrest', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should you give Epinephrine 1mg every 3 minutes in this patient?', '["Yes", "No, increase the interval (e.g., every 6-10 minutes) to avoid toxicity", "None", "None"]', 1, 'The body cannot clear the drug at this temperature.'),
    (v_case_id, 'How many times should you try to shock a heart that is < 30°C?', '["Unlimited", "Limit to 1-3 attempts until the patient is rewarmed", "None", "None"]', 1, 'The \"cold\" heart is often refractory to electrical therapy.'),
    (v_case_id, 'When can you resume standard ACLS drug intervals?', '["Immediately", "When the core temperature reaches > 30°C", "None", "None"]', 1, 'As the patient warms, metabolism speeds up.');

    ---------------------------------------------------------------------------
    -- CASE 42: VF - Fine vs. Coarse (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Interpreting the Wave' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Interpreting the Wave', 'The monitor shows very low-amplitude, barely visible irregular waves.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Interpreting the Wave', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this rhythm called?', '["Asystole", "Fine Ventricular Fibrillation", "PEA", "None"]', 1, 'Fine VF can look like asystole and may respond to a shock.'),
    (v_case_id, 'What makes VF \"coarse\"?', '["Large waves (> 3mm)", "Slow heart rate", "None", "None"]', 0, 'Coarse VF suggests more recent arrest and better chance of successful defibrillation.'),
    (v_case_id, 'Is the treatment for Fine VF different from Coarse VF?', '["Yes", "No, both are shockable rhythms", "None", "None"]', 1, 'The algorithm remains the same.');

    ---------------------------------------------------------------------------
    -- CASE 43: ACLS - ET Tube vs. Supraglottic (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Airway Choices' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Airway Choices', 'A student asks if an ET tube is mandatory in all arrests.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Airway Choices', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is a supraglottic airway (e.g., King LT, LMA) acceptable in ACLS?', '["No", "Yes, it is often faster and just as effective as intubation in the arrest setting", "None", "None"]', 1, 'Minimize pauses in compressions by choosing the fastest reliable airway.'),
    (v_case_id, 'What is the main disadvantage of a bag-mask ventilation (BMV) compared to an advanced airway?', '["It is too slow", "Risk of gastric insufflation and aspiration", "None", "None"]', 1, 'Air is pushed into the stomach, increasing the risk of vomiting.'),
    (v_case_id, 'Should you stop compressions to intubate?', '["Yes", "No, intubation should be performed with minimal or no interruption of chest compressions", "None", "None"]', 1, 'If intubation takes too long, resume compressions and use a bag-mask.');

    ---------------------------------------------------------------------------
    -- CASE 44: ACLS - Adenosine in Wide Complex (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wide but Stable' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wide but Stable', 'You have a stable patient with a wide-complex regular rhythm that you suspect is SVT with aberrancy.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Wide but Stable', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can Adenosine be used for a wide-complex regular tachycardia?', '["No", "Yes, only if it is regular and monomorphic", "None", "None"]', 1, 'Adenosine can be both diagnostic and therapeutic if it is SVT with aberrancy.'),
    (v_case_id, 'When is Adenosine CONTRAINDICATED in a wide-complex rhythm?', '["If regular", "If irregular (e.g., A-fib with WPW) or polymorphic", "None", "None"]', 1, 'Giving adenosine to an irregular wide tachycardia can cause VF.'),
    (v_case_id, 'What should the patient be warned about before getting Adenosine?', '["They will sleep", "They will feel a sense of \"impending doom\" or chest pressure", "None", "None"]', 1, 'The drug causes a brief period of asystole which is very uncomfortable.');

    ---------------------------------------------------------------------------
    -- CASE 45: Targeted Temperature Management - Shivering (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-ROSC Shivering' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-ROSC Shivering', 'A patient undergoing TTM begins to shiver.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-ROSC Shivering', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is shivering harmful during TTM?', '["It makes noise", "It increases metabolic rate and heat production, defeating the purpose of cooling", "None", "None"]', 1, 'Shivering generates massive amounts of internal heat.'),
    (v_case_id, 'How should shivering be managed?', '["Turning off the cooler", "Sedation and possibly neuromuscular blockers (paralytics)", "Blankets", "None"]', 1, 'Suppressing the shiver response is necessary for maintaining the target temp.'),
    (v_case_id, 'What is the role of Buspirone or Meperidine in TTM?', '["Treat pain", "They lower the shivering threshold", "None", "None"]', 1, 'These non-sedating options can help reduce the need for paralytics.');

    ---------------------------------------------------------------------------
    -- CASE 46: ACLS - Vasopressin (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Alternative Vasopressors' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Alternative Vasopressors', 'A student asks if Vasopressin can be used instead of Epinephrine.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Alternative Vasopressors', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is Vasopressin currently in the AHA ACLS algorithm?', '["Yes", "No, it was removed as it provided no advantage over Epinephrine alone", "Only for PEA", "None"]', 1, 'ACLS has been simplified to focus on Epinephrine.'),
    (v_case_id, 'What was the theoretical benefit of Vasopressin?', '["Slows the heart", "Peripheral vasoconstriction without the beta-effects of Epinephrine", "None", "None"]', 1, 'It works on V1 receptors rather than adrenergic ones.'),
    (v_case_id, 'Can Vasopressin still be used for post-ROSC shock?', '["No", "Yes, as an adjunct vasopressor infusion", "None", "None"]', 1, 'It remains useful for distributive shock states post-arrest.');

    ---------------------------------------------------------------------------
    -- CASE 47: ACLS - Right Ventricular Infarction (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Right Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Right Heart', 'A patient with an inferior MI develops bradycardia and severe hypotension.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Right Heart', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should you suspect in inferior MI with hypotension?', '["Heart failure", "Right Ventricular Infarction", "Tamponade", "None"]', 1, 'RV infarction is highly preload-dependent.'),
    (v_case_id, 'What medication is CONTRAINDICATED in RV infarction?', '["Aspirin", "Nitroglycerin and Morphine", "Fluids", "None"]', 1, 'Nitrates decrease preload, which can cause profound hypotension in these patients.'),
    (v_case_id, 'What is the treatment for hypotension in RV infarction?', '["Vasopressors", "Fluid boluses (Aggressive volume expansion)", "None", "None"]', 1, 'The RV needs higher filling pressures to push blood through to the left heart.');

    ---------------------------------------------------------------------------
    -- CASE 48: ACLS - TTM Re-warming (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Coming Out of the Cold' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Coming Out of the Cold', 'A patient has completed 24 hours of TTM at 33°C.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Coming Out of the Cold', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How fast should a patient be rewarmed after TTM?', '["Instantly", "Slowly (approx. 0.25 to 0.5°C per hour)", "None", "None"]', 1, 'Rapid rewarming can cause electrolyte shifts and hemodynamic instability.'),
    (v_case_id, 'What electrolyte shift often occurs during rewarming?', '["Hypercalcemia", "Hyperkalemia (K shifts back OUT of cells)", "Hyponatremia", "None"]', 1, 'Monitor K levels closely during the rewarming phase.'),
    (v_case_id, 'What is the goal for the next 24-48 hours after rewarming?', '["Heat them up", "Maintenance of normothermia (avoiding any fever)", "None", "None"]', 1, 'Fever post-arrest is associated with poor outcomes.');

    ---------------------------------------------------------------------------
    -- CASE 49: ACLS - Procainamide endpoints (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dosing Procainamide' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dosing Procainamide', 'You are administering Procainamide for stable VT.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dosing Procainamide', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the maximum total dose of Procainamide?', '["300 mg", "17 mg/kg", "1000 mg", "None"]', 1, 'The dose is quite large and titrated to effect or toxicity.'),
    (v_case_id, 'What is the maintenance infusion rate after conversion?', '["1 mg/min", "1 to 4 mg/min", "10 mg/min", "None"]', 1, 'Ongoing suppression of the arrhythmia is needed.'),
    (v_case_id, 'Why is it important to monitor the QRS complex during administration?', '["For fun", "Widening suggests sodium channel toxicity", "None", "None"]', 1, 'If the QRS widens > 50%, stop the infusion.');

    ---------------------------------------------------------------------------
    -- CASE 50: ACLS - Lightning Strike (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bolt from the Blue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bolt from the Blue', 'A patient is struck by lightning and goes into cardiac arrest.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bolt from the Blue', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary rhythm seen in lightning-induced arrest?', '["VF", "Asystole (instantaneous depolarization of the entire heart)", "PEA", "None"]', 1, 'The electrical current acts like a massive DC shock.'),
    (v_case_id, 'Why is prolonged resuscitation often successful in lightning strikes?', '["It isn''t", "The heart often restarts spontaneously, but apnea persists longer; if ventilated, the heart may survive", "None", "None"]', 1, 'The respiratory center remains paralyzed longer than the heart.'),
    (v_case_id, 'What is the Triage Rule for mass casualty lightning strikes?', '["Red tags first", "Resuscitate the \"dead\" (pulseless/apneic) first (\"Reverse Triage\")", "None", "None"]', 1, 'Normally, you skip the dead in mass casualty, but lightning victims have such good recovery rates with brief ventilation that they are prioritized.');

    RAISE NOTICE 'SUCCESS: 50 ACLS & BLS Case Blocks registered.';
END $$;

COMMIT;
