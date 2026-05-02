BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Pediatric Emergencies
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-emergencies-pals' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-emergencies-pals" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The PALS Assessment Triangle (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'First Look' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'First Look', 'A 2-year-old is brought to the ED by ambulance. You perform the Pediatric Assessment Triangle (PAT) from the doorway.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-year-old is brought to the ED by ambulance. You perform the Pediatric Assessment Triangle (PAT) from the doorway.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three components of the Pediatric Assessment Triangle?', '["Airway, Breathing, Circulation", "Appearance, Work of Breathing, Circulation to Skin", "Pulse, Respiration, Blood Pressure", "None"]', 1, 'The PAT is a rapid, visual assessment used to identify the category of illness.'),
    (v_case_id, 'A child with abnormal appearance and increased work of breathing is in:', '["Compensated Shock", "Respiratory Failure", "Respiratory Distress", "None"]', 1, 'If only work of breathing is abnormal, it is distress. If appearance (CNS perfusion) is also affected, it suggests failure.'),
    (v_case_id, 'What does \"Circulation to Skin\" assess in the PAT?', '["Heart rate", "Pallor, mottling, or cyanosis", "Blood pressure", "None"]', 1, 'Skin color is a surrogate for peripheral perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 02: Respiratory Distress vs. Failure (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Crossing the Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Crossing the Line', 'An infant with bronchiolitis has severe retractions, a respiratory rate of 70, and is now becoming lethargic.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An infant with bronchiolitis has severe retractions, a respiratory rate of 70, and is now becoming lethargic.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark difference between respiratory distress and respiratory failure?', '["Fast heart rate", "Impaired oxygenation/ventilation leading to abnormal mental status (lethargy/agitation)", "Cough", "None"]', 1, 'Respiratory failure is defined by the inability to maintain adequate gas exchange.'),
    (v_case_id, 'What is a late and ominous sign of impending respiratory arrest in a child?', '["Tachypnea", "Bradypnea (slow breathing) and decreased effort", "Tachycardia", "None"]', 1, 'As the child tires, the respiratory rate drops, which is a pre-arrest sign.'),
    (v_case_id, 'What is the immediate management for a child in respiratory failure?', '["Oxygen by nasal cannula", "Bag-mask ventilation with 100% oxygen", "Antibiotics", "None"]', 1, 'Assisted ventilation is required if the child cannot maintain their own effort.');

    ---------------------------------------------------------------------------
    -- CASE 03: Upper Airway Obstruction - Croup (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Barking in the Night' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Barking in the Night', 'A 10-month-old has a barking cough and inspiratory stridor at rest.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Barking in the Night', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Asthma", "Croup (Laryngotracheobronchitis)", "Pneumonia", "None"]', 1, 'Barking cough and inspiratory stridor are classic for Croup.'),
    (v_case_id, 'What is the treatment for moderate-to-severe Croup with stridor at rest?', '["Antibiotics", "Nebulized Racemic Epinephrine and Dexamethasone", "Inhaled Albuterol", "None"]', 1, 'Epinephrine reduces subglottic edema rapidly.'),
    (v_case_id, 'Which virus is the most common cause of Croup?', '["RSV", "Parainfluenza virus", "Influenza", "None"]', 1, 'Parainfluenza is the primary causative agent.');

    ---------------------------------------------------------------------------
    -- CASE 04: Lower Airway Obstruction - Asthma (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Chest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Chest', 'A 7-year-old with a known history of asthma presents with extreme respiratory effort but NO wheezing is heard on auscultation.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Silent Chest', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the \"silent chest\" indicate in acute asthma?', '["The child is getting better", "Critical airway obstruction with minimal air movement", "Normal finding", "None"]', 1, 'The absence of wheezing in a struggling child is an emergency sign of near-total obstruction.'),
    (v_case_id, 'What is the first-line medication for an acute asthma exacerbation?', '["Steroids", "Inhaled Albuterol (Beta-2 agonist)", "Antibiotics", "None"]', 1, 'Albuterol provides rapid bronchodilation.'),
    (v_case_id, 'What medication is added for a \"status asthmaticus\" patient who is not responding to Albuterol?', '["Aspirin", "Ipratropium Bromide (Anticholinergic) and Magnesium Sulfate", "Cough syrup", "None"]', 1, 'Ipratropium and Magnesium are used in severe, refractory cases.');

    ---------------------------------------------------------------------------
    -- CASE 05: Hypovolemic Shock (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Severe Dehydration' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Severe Dehydration', 'An 11-month-old with 3 days of vomiting and diarrhea is lethargic, has a capillary refill of 4 seconds, and a weak pulse.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 11-month-old with 3 days of vomiting and diarrhea is lethargic, has a capillary refill of 4 seconds, and a weak pulse.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the initial fluid bolus for a child in hypovolemic shock?', '["5 mL/kg", "20 mL/kg of isotonic crystalloid (NS or LR)", "50 mL/kg", "None"]', 1, 'Isotonic crystalloid is the gold standard for volume expansion.'),
    (v_case_id, 'What is the definition of \"Hypotensive Shock\" in a 1-year-old child?', '["Systolic BP < 90", "Systolic BP < 70 mmHg", "Systolic BP < 100", "None"]', 1, 'For children 1-10 years, hypotension is < 70 + (2 x age). For < 1 year, it is < 70.'),
    (v_case_id, 'If the child remains in shock after 3 boluses (60 mL/kg), what should be considered?', '["Give up", "Ongoing losses, occult hemorrhage, or alternative shock type (e.g., septic/cardiogenic)", "Give water", "None"]', 1, 'Refractory shock requires reassessment and potentially blood or vasopressors.');

    ---------------------------------------------------------------------------
    -- CASE 06: Septic Shock - Distributive (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Febrile Child in Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Febrile Child in Shock', 'A 5-year-old has a high fever, a purpuric rash, and warm, flushed skin but a low blood pressure.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Febrile Child in Shock', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is \"Warm Shock\"?', '["A fever", "Distributive shock where vasodilation leads to warm extremities and flash capillary refill", "Normal state", "None"]', 1, 'Septic shock often presents as warm shock initially in children.'),
    (v_case_id, 'What is the priority after initial fluid resuscitation in septic shock?', '["Aspirin", "Early administration of broad-spectrum antibiotics", "Surgery", "None"]', 1, 'Every hour delay in antibiotics increases mortality.'),
    (v_case_id, 'Which vasopressor is preferred for fluid-refractory \"Cold\" septic shock (poor perfusion, high SVR)?', '["Dopamine", "Epinephrine", "Norepinephrine", "None"]', 1, 'Epinephrine is typically first-line for cold shock in children.');

    ---------------------------------------------------------------------------
    -- CASE 07: Anaphylactic Shock (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Peanut Exposure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Peanut Exposure', 'A child develops hives, wheezing, and a low blood pressure immediately after eating a peanut cookie.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Peanut Exposure', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate, first-line medication for anaphylaxis?', '["Diphenhydramine (Benadryl)", "Intramuscular (IM) Epinephrine", "Steroids", "Albuterol"]', 1, 'Epinephrine is the only life-saving medication for anaphylaxis; antihistamines do not stop the reaction.'),
    (v_case_id, 'Where is the preferred site for IM Epinephrine injection?', '["Gluteus", "Anterolateral Thigh (Vastus Lateralis)", "Deltoid", "None"]', 1, 'Absorption is fastest in the thigh.'),
    (v_case_id, 'Why is a second dose of Epinephrine sometimes needed?', '["The first one didn''t work", "Biphasic reaction or inadequate response to the first dose", "It is for fun", "None"]', 1, 'Up to 20% of patients require a second dose.');

    ---------------------------------------------------------------------------
    -- CASE 08: Bradycardia Algorithm (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Slow Heart Rate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Slow Heart Rate', 'A 3-year-old has a heart rate of 45 bpm and is pale and unresponsive.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Slow Heart Rate', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in the PALS Bradycardia algorithm?', '["Give Epinephrine", "Support ABCs and provide oxygen/ventilation", "Give Atropine", "None"]', 1, 'Most pediatric bradycardia is caused by hypoxia, so oxygenation is the priority.'),
    (v_case_id, 'When should chest compressions be started in a child with bradycardia?', '["HR < 100", "HR < 60 bpm with signs of poor perfusion despite oxygenation and ventilation", "Always", "None"]', 1, 'This is a unique PALS rule: compressions are started for bradycardia if perfusion is poor.'),
    (v_case_id, 'What medication is used if bradycardia persists despite CPR and oxygenation?', '["Aspirin", "Epinephrine", "Adenosine", "None"]', 1, 'Epinephrine is the primary drug for symptomatic bradycardia.');

    ---------------------------------------------------------------------------
    -- CASE 09: SVT vs. Sinus Tachycardia (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Racing Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Racing Heart', 'An infant has a heart rate of 230 bpm. The ECG shows a narrow complex rhythm with NO visible P-waves.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Racing Heart', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely rhythm?', '["Sinus Tachycardia", "Supraventricular Tachycardia (SVT)", "Ventricular Tachycardia", "None"]', 1, 'HR > 220 in infants (or > 180 in children) without P-waves is highly suggestive of SVT.'),
    (v_case_id, 'What is the first-line medication for STABLE SVT?', '["Epinephrine", "Adenosine", "Amiodarone", "None"]', 1, 'Adenosine briefly blocks the AV node to break the re-entry circuit.'),
    (v_case_id, 'What is the immediate treatment for UNSTABLE SVT (hypotension/unresponsive)?', '["Adenosine", "Synchronized Cardioversion (0.5 to 1.0 J/kg)", "Defibrillation", "None"]', 1, 'Unstable tachycardia requires immediate electrical therapy.');

    ---------------------------------------------------------------------------
    -- CASE 10: Cardiac Arrest - Shockable Rhythms (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'VF/Pulseless VT' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'VF/Pulseless VT', 'A child in cardiac arrest is found to have Ventricular Fibrillation (VF) on the monitor.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'VF/Pulseless VT', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority for VF?', '["Chest compressions", "Defibrillation (2 J/kg)", "Epinephrine", "None"]', 1, 'Rapid defibrillation is the most effective treatment for VF.'),
    (v_case_id, 'What is the first dose of Epinephrine during cardiac arrest?', '["0.1 mg/kg", "0.01 mg/kg (0.1 mL/kg of 1:10,000 solution)", "1 mg", "None"]', 1, 'Standard PALS dose is 0.01 mg/kg every 3-5 minutes.'),
    (v_case_id, 'What antiarrhythmic is recommended for refractory VF/pVT?', '["Adenosine", "Amiodarone or Lidocaine", "Atropine", "None"]', 1, 'Amiodarone is used after the second or third shock.');

    ---------------------------------------------------------------------------
    -- CASE 11: Cardiac Arrest - Non-Shockable (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Asystole/PEA' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Asystole/PEA', 'A child is in arrest; the monitor shows a slow, organized rhythm but there is no pulse (PEA).', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Asystole/PEA', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority for a non-shockable rhythm?', '["Defibrillation", "High-quality CPR and early Epinephrine", "Adenosine", "None"]', 1, 'Shocking asystole is not beneficial; focus on CPR and drug therapy.'),
    (v_case_id, 'What are the \"Hs and Ts\" of cardiac arrest?', '["Headache, Heat, Hunger", "Reversible causes (Hypovolemia, Hypoxia, H-ion, Hypo/hyperkalemia, Hypothermia; Tension pneumo, Tamponade, Toxins, Thrombosis)", "Heart, Head, Hand", "None"]', 1, 'Searching for and treating the cause is essential for survival.'),
    (v_case_id, 'How long should CPR be performed between rhythm checks?', '["1 minute", "2 minutes", "5 minutes", "None"]', 1, 'Compressions should only be interrupted every 2 minutes for a brief check.');

    ---------------------------------------------------------------------------
    -- CASE 12: IO Access (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Emergency Access' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Emergency Access', 'In a child with severe shock, three attempts at peripheral IV access have failed.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Emergency Access', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended next step for vascular access?', '["Keep trying the IV", "Intraosseous (IO) access", "Central line", "None"]', 1, 'IO access is the standard when IV access cannot be established rapidly in an emergency.'),
    (v_case_id, 'What is the most common site for IO placement in a child?', '["Proximal Humerus", "Proximal Tibia (just below the tibial tuberosity)", "Femur", "None"]', 1, 'The flat surface of the tibia is the preferred site.'),
    (v_case_id, 'Can any medication given IV be given through an IO?', '["No", "Yes, any IV medication or fluid can be given IO", "Only saline", "None"]', 1, 'The bone marrow acts as a non-collapsible vein.');

    ---------------------------------------------------------------------------
    -- CASE 13: Status Epilepticus (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Continuous Seizure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Continuous Seizure', 'A 4-year-old has been having a generalized tonic-clonic seizure for 10 minutes.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Continuous Seizure', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Status Epilepticus?', '["Any seizure", "A continuous seizure > 5 minutes or recurrent seizures without return to baseline", "A seizure with fever", "None"]', 1, 'Status is an emergency due to potential brain injury.'),
    (v_case_id, 'What is the first-line pharmacological treatment?', '["Phenytoin", "Benzodiazepines (e.g., Lorazepam, Midazolam, or Diazepam)", "Levetiracetam", "None"]', 1, 'Benzos are fast-acting and highly effective for termination.'),
    (v_case_id, 'What is the most common respiratory side effect of benzodiazepines?', '["Fast breathing", "Respiratory depression (Apnea)", "Cough", "None"]', 1, 'Always be prepared to provide bag-mask ventilation when giving IV benzos.');

    ---------------------------------------------------------------------------
    -- CASE 14: Opioid Overdose (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pinpoint Pupils' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pinpoint Pupils', 'A toddler is found with an empty bottle of oxycodone. He is unresponsive with slow, shallow breathing and pinpoint pupils.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pinpoint Pupils', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific antidote for opioid toxicity?', '["Atropine", "Naloxone (Narcan)", "Flumazenil", "None"]', 1, 'Naloxone competitively blocks opioid receptors.'),
    (v_case_id, 'What is the priority while waiting for the antidote?', '["Nothing", "Bag-mask ventilation to manage respiratory failure", "Chest compressions", "None"]', 1, 'Ventilation is the priority in opioid-induced respiratory depression.'),
    (v_case_id, 'Why must the child be monitored for several hours after a dose of Naloxone?', '["It is toxic", "Naloxone has a shorter half-life than many opioids; the child may \"re-narcotize\"", "It causes fever", "None"]', 1, 'The patient may stop breathing again once the Naloxone wears off.');

    ---------------------------------------------------------------------------
    -- CASE 15: Diabetic Ketoacidosis - DKA (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Deep Breathing and Dehydration' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Deep Breathing and Dehydration', 'A 10-year-old with new-onset diabetes is vomiting, has deep/labored breathing (Kussmaul), and a blood glucose of 500.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Deep Breathing and Dehydration', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a life-threatening complication of DKA and its treatment in children?', '["Heart failure", "Cerebral Edema", "Liver failure", "None"]', 1, 'Cerebral edema is the leading cause of DKA-related mortality in kids.'),
    (v_case_id, 'Why should aggressive fluid boluses (beyond initial shock) be avoided in DKA?', '["They cause heart attacks", "Rapid changes in osmolality increase the risk of cerebral edema", "No reason", "None"]', 1, 'Slow, controlled rehydration is preferred.'),
    (v_case_id, 'What electrolyte is often depleted during DKA treatment?', '["Sodium", "Potassium", "Calcium", "None"]', 1, 'Insulin therapy shifts potassium into cells, potentially causing severe hypokalemia.');

    ---------------------------------------------------------------------------
    -- CASE 16: Near Drowning (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Submersion Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Submersion Injury', 'A child is pulled from a swimming pool. He is not breathing.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Submersion Injury', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority for a drowning victim in arrest?', '["Chest compressions", "Ventilation (Rescue breaths)", "Warm blankets", "None"]', 1, 'Drowning is a primary hypoxic arrest; rescue breaths should start as soon as possible.'),
    (v_case_id, 'Why is hypothermia common in drowning?', '["Water is cold", "Water conducts heat away from the body 25 times faster than air", "Both", "None"]', 2, 'Heat loss is rapid in water.'),
    (v_case_id, 'If a child is submerged in ice-cold water, should resuscitation be prolonged?', '["No", "Yes, patients should be \"warm and dead\" before stopping resuscitation", "Only for 5 mins", "None"]', 1, 'Hypothermia can be neuroprotective; resuscitation continues until the patient is rewarmed.');

    ---------------------------------------------------------------------------
    -- CASE 17: Foreign Body Aspiration (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Choking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Choking', 'A 2-year-old is playing with peanuts and suddenly begins to choke and cough violently.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Choking', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management for a conscious, choking child who is coughing forcefully?', '["Heimlich maneuver", "Encourage coughing and monitor closely; do not interfere", "Finger sweep", "None"]', 1, 'As long as the cough is effective, the child may clear it themselves; interference can cause total obstruction.'),
    (v_case_id, 'What is the first step if the child becomes UNRESPONSIVE and stops breathing?', '["Check pulse", "Start CPR (focusing on compressions) and look in the mouth before breaths", "Wait", "None"]', 1, 'Standard PALS/BLS for choking unresponsive victims starts with compressions.'),
    (v_case_id, 'What is a classic X-ray finding for a bronchial foreign body?', '["Ground-glass", "Unilateral hyperinflation (air trapping) on expiratory films", "Large heart", "None"]', 1, 'The object acts as a one-way valve.');

    ---------------------------------------------------------------------------
    -- CASE 18: Head Trauma - PECARN (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'To Scan or Not to Scan' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'To Scan or Not to Scan', 'A 4-year-old fell from a 3-foot bed and has a small hematoma on his forehead but is acting normally.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'To Scan or Not to Scan', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the clinical rule used to decide if a child needs a CT head after trauma?', '["GCS", "PECARN (Pediatric Emergency Care Applied Research Network)", "Apgar", "None"]', 1, 'PECARN identifies children at very low risk for clinically important brain injuries.'),
    (v_case_id, 'Which finding in a child > 2 years is a high-risk indicator for CT?', '["Simple headache", "GCS score of 14 or signs of basilar skull fracture", "One vomit", "None"]', 1, 'GCS < 15 or focal signs warrant imaging.'),
    (v_case_id, 'Why do we avoid CT scans in low-risk children?', '["They are expensive", "High radiation exposure to the developing brain", "They take too long", "None"]', 1, 'The risk of radiation-induced cancer must be balanced against the risk of injury.');

    ---------------------------------------------------------------------------
    -- CASE 19: Burns - Rule of 9s (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pediatric Burn Size' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pediatric Burn Size', 'A 2-year-old was burned by hot tea. His head and entire right arm are involved.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pediatric Burn Size', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the \"Rule of 9s\" differ for a small child vs. an adult?', '["It doesn''t", "The head is relatively larger (18% in infants) and the legs are smaller", "It is for kids only", "None"]', 1, 'Children have a higher surface area of the head.'),
    (v_case_id, 'What is the priority in the first 24 hours for a major burn?', '["Skin graft", "Fluid resuscitation (Parkland formula)", "Antibiotics", "None"]', 1, 'Burn shock due to fluid shifts is the primary threat.'),
    (v_case_id, 'What is a sign of adequate fluid resuscitation?', '["High blood pressure", "Urine output of 1-2 mL/kg/hr", "No pain", "None"]', 1, 'Urine output is the most reliable measure of perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 20: Febrile Seizures (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever and Fit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever and Fit', 'A 2-year-old had a 2-minute generalized seizure during a spike in fever to 103F. He is now back to baseline.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fever and Fit', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of a \"Simple\" febrile seizure?', '["Longer than 15 mins", "Generalized, < 15 minutes, and only once in 24 hours", "A seizure with a rash", "None"]', 1, 'Simple febrile seizures are benign and common.'),
    (v_case_id, 'What is the management for a simple febrile seizure in a child who is back to baseline?', '["MRI and EEG", "Reassurance and treating the source of the fever", "Anti-seizure meds", "None"]', 1, 'No extensive workup is needed if the child is developmentally normal and at baseline.'),
    (v_case_id, 'What is the risk of developing epilepsy after a simple febrile seizure?', '["50%", "Slightly above the general population (~1-2%)", "0%", "None"]', 1, 'The prognosis is excellent.');

    ---------------------------------------------------------------------------
    -- CASE 21: Cardiogenic Shock (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Pump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Pump', 'A 6-year-old with a recent viral illness has an enlarged liver, a gallop rhythm, and crackles in the lungs.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Weak Pump', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Myocarditis (leading to Cardiogenic Shock)", "Dehydration", "None"]', 1, 'Hepatomegaly and rales suggest heart failure and fluid backup.'),
    (v_case_id, 'Why should you be CAUTIOUS with fluid boluses in cardiogenic shock?', '["They are expensive", "The weak heart cannot handle a volume load, which can lead to worsening pulmonary edema", "They don''t work", "None"]', 1, 'Give smaller aliquots (5-10 mL/kg) and monitor closely.'),
    (v_case_id, 'What type of medication is needed to improve heart contractility?', '["Antibiotics", "Inotropes (e.g., Milrinone, Dobutamine)", "Aspirin", "None"]', 1, 'Inotropes strengthen the cardiac squeeze.');

    ---------------------------------------------------------------------------
    -- CASE 22: Obstructive Shock - Ductal Dependent (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Closing Duct' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Closing Duct', 'A 10-day-old infant presents with sudden, severe shock and a grayish skin color.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Closing Duct', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should be suspected in a neonate with sudden shock in the first 2 weeks of life?', '["Sepsis", "Ductal-dependent congenital heart lesion (e.g., HLHS, Coarctation)", "Hunger", "None"]', 1, 'As the PDA closes, systemic or pulmonary flow is cut off.'),
    (v_case_id, 'What medication can keep the ductus arteriosus open?', '["Aspirin", "Prostaglandin E1 (Alprostadil)", "Indomethacin", "None"]', 1, 'PGE1 is a life-saving intervention for these lesions.'),
    (v_case_id, 'What is a common side effect of Prostaglandin E1 that requires monitoring?', '["Tachycardia", "Apnea (requiring intubation)", "Rash", "None"]', 1, 'PGE1 can cause central apnea.');

    ---------------------------------------------------------------------------
    -- CASE 23: Tension Pneumothorax (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Air Under Tension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Air Under Tension', 'A trauma victim has absent breath sounds on the right, tracheal deviation to the left, and severe hypotension.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Air Under Tension', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management?', '["Chest X-ray", "Needle Decompression (Thoracostomy)", "Antibiotics", "None"]', 1, 'Tension pneumothorax is a clinical diagnosis; waiting for an X-ray can be fatal.'),
    (v_case_id, 'Where is the needle placed for decompression?', '["2nd intercostal space, mid-clavicular line", "5th intercostal space, mid-axillary line", "Lower back", "None"]', 0, 'This rapidly relieves the pressure.'),
    (v_case_id, 'How does a tension pneumothorax cause shock?', '["Loss of blood", "Increased intrathoracic pressure compresses the vena cava, reducing venous return and cardiac output", "Pain", "None"]', 1, 'It is a form of obstructive shock.');

    ---------------------------------------------------------------------------
    -- CASE 24: Epiglottitis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Drooling Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Drooling Child', 'A 4-year-old is sitting in the \"tripod\" position, drooling, has a high fever, and appears toxic.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Drooling Child', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Croup", "Epiglottitis", "Asthma", "None"]', 1, 'Tripod position and drooling are red flags for epiglottitis.'),
    (v_case_id, 'What is the MOST IMPORTANT rule in managing suspected epiglottitis?', '["Do a throat swab", "Keep the child calm; do not attempt to visualize the airway until in a controlled setting (OR)", "Give water", "None"]', 1, 'Agitating the child can cause total airway obstruction.'),
    (v_case_id, 'What organism was the most common cause before the vaccine?', '["Staph", "Haemophilus influenzae type b (Hib)", "RSV", "None"]', 1, 'The Hib vaccine has made this condition rare but it still occurs.');

    ---------------------------------------------------------------------------
    -- CASE 25: PALS Fluid Bolus - 20 mL/kg (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Calculating Volume' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Calculating Volume', 'A 15 kg child is in compensated shock.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Calculating Volume', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many mL of Normal Saline should be given in the first bolus?', '["150 mL", "300 mL (20 mL/kg x 15 kg)", "500 mL", "None"]', 1, '20 mL/kg is the standard PALS bolus.'),
    (v_case_id, 'Over what time frame should the bolus be delivered in shock?', '["1 hour", "Rapidly (5-20 minutes)", "6 hours", "None"]', 1, 'Shock requires rapid volume expansion.'),
    (v_case_id, 'If you suspect cardiogenic shock, what volume is used?', '["20 mL/kg", "5-10 mL/kg", "None", "50 mL/kg"]', 1, 'Lower volumes are used for weak hearts to avoid overload.');

    ---------------------------------------------------------------------------
    -- CASE 26: Salicylate Poisoning (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aspirin Overdose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aspirin Overdose', 'A teenager ingested a large amount of aspirin. She has tinnitus (ringing in ears) and is hyperventilating.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Aspirin Overdose', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What acid-base disturbance is classic for salicylate poisoning?', '["Respiratory acidosis", "Mixed Respiratory Alkalosis and Metabolic Acidosis", "Only metabolic alkalosis", "None"]', 1, 'Salicylates stimulate the respiratory center (alkalosis) and interfere with metabolism (acidosis).'),
    (v_case_id, 'What is the treatment to enhance salicylate excretion?', '["Antibiotics", "Urinary alkalinization (IV Sodium Bicarbonate)", "Give juice", "None"]', 1, 'Alkaline urine traps the salicylate ions so they can be excreted.'),
    (v_case_id, 'What is the definitive treatment for severe, life-threatening salicylate toxicity?', '["Vomiting", "Hemodialysis", "Charcoal only", "None"]', 1, 'Dialysis is used for extremely high levels or organ failure.');

    ---------------------------------------------------------------------------
    -- CASE 27: Iron Poisoning (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shiny Pills' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shiny Pills', 'A 3-year-old swallowed his mother''s prenatal vitamins. He is vomiting blood and has severe abdominal pain.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shiny Pills', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is iron poisoning dangerous?', '["It is a heavy metal that causes direct GI damage and mitochondrial toxicity", "It causes fever", "No reason", "None"]', 0, 'Iron is highly corrosive and a systemic toxin.'),
    (v_case_id, 'What is the specific chelator for iron poisoning?', '["N-acetylcysteine", "Deferoxamine", "Atropine", "None"]', 1, 'Deferoxamine binds iron; it can turn urine a \"vin rose\" (pink) color.'),
    (v_case_id, 'What is seen on X-ray in iron ingestion?', '["Nothing", "Radiopaque pills (iron is visible on X-ray)", "Air", "None"]', 1, 'Iron tablets can often be seen in the stomach.');

    ---------------------------------------------------------------------------
    -- CASE 28: Acetaminophen Overdose (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tylenol Toxicity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tylenol Toxicity', 'A child ingested half a bottle of liquid acetaminophen.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tylenol Toxicity', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What organ is primarily damaged by acetaminophen?', '["Heart", "Liver", "Kidney", "Brain"]', 1, 'Hepatotoxicity is the main concern.'),
    (v_case_id, 'What is the specific antidote?', '["Naloxone", "N-acetylcysteine (NAC)", "Bicarb", "None"]', 1, 'NAC restores glutathione stores to detoxify the NAPQI metabolite.'),
    (v_case_id, 'What is used to decide if treatment is needed after an acute ingestion?', '["A guess", "Rumack-Matthew Nomogram", "Apgar", "None"]', 1, 'The nomogram uses the blood level at 4 hours post-ingestion.');

    ---------------------------------------------------------------------------
    -- CASE 29: Near Drowning - Cold Water (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ice Water Victim' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ice Water Victim', 'A child fell through ice into a frozen lake and was submerged for 20 minutes.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Ice Water Victim', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority after ABCs?', '["Giving juice", "Rewarming", "Antibiotics", "None"]', 1, 'Active rewarming is required.'),
    (v_case_id, 'What is the goal core temperature before stopping CPR?', '["30C", "32-35C (Warm and dead rule)", "37C", "None"]', 1, 'Resuscitation continues until the body is no longer profoundly hypothermic.'),
    (v_case_id, 'What is a common complication 24-48 hours after a near-drowning?', '["Broken arm", "Acute Respiratory Distress Syndrome (ARDS)", "Weight gain", "None"]', 1, 'Water in the lungs causes surfactant washout and inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 30: Head Trauma - GCS (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Assessing Consciousness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Assessing Consciousness', 'A child is brought in after a fall. He opens his eyes to pain, makes incomprehensible sounds, and withdraws from pain.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Assessing Consciousness', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the GCS score? (Eyes: 2, Verbal: 2, Motor: 4)', '["5", "8", "12", "None"]', 1, 'GCS < 8 is typically the threshold for intubation.'),
    (v_case_id, 'What is the modified Pediatric GCS used for?', '["To check hearing", "To account for non-verbal infants", "To check height", "None"]', 1, 'Infants have different verbal and motor expectations.'),
    (v_case_id, 'At what GCS score should you \"secure the airway\" (intubate)?', '["15", "8 or less", "12", "None"]', 1, '\"Less than 8, intubate\" is a standard clinical pearl.');

    ---------------------------------------------------------------------------
    -- CASE 31: Tension Pneumothorax - Signs (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clinical Diagnosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clinical Diagnosis', 'A ventilated child suddenly develops high peak pressures, falling oxygen, and absent breath sounds on the left.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clinical Diagnosis', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should you do immediately?', '["Get an X-ray", "Disconnect from ventilator and perform needle decompression on the left", "Give more breaths", "None"]', 1, 'Sudden deterioration in a ventilated patient is often a tension pneumothorax.'),
    (v_case_id, 'Which side would the trachea deviate towards?', '["To the left", "To the right (away from the tension)", "It doesn''t move", "None"]', 1, 'Pressure pushes the midline structures to the opposite side.'),
    (v_case_id, 'What is the definitive treatment after needle decompression?', '["Chest tube placement (Tube thoracostomy)", "Antibiotics", "Aspirin", "None"]', 0, 'The needle is only a temporary measure.');

    ---------------------------------------------------------------------------
    -- CASE 32: Anaphylaxis - Biphasic Reaction (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Return of Symptoms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Return of Symptoms', 'A child was treated for anaphylaxis and improved. 4 hours later, the hives and wheezing return.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Return of Symptoms', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this phenomenon called?', '["A new allergy", "Biphasic Anaphylaxis", "Sepsis", "None"]', 1, 'Symptoms can recur without new exposure to the allergen.'),
    (v_case_id, 'How long should a child with anaphylaxis be observed?', '["1 hour", "4 to 6 hours minimum", "2 days", "None"]', 1, 'Observation is required to catch biphasic reactions.'),
    (v_case_id, 'What medication is given to reduce the likelihood of a late-phase reaction?', '["Epinephrine", "Corticosteroids", "Tylenol", "None"]', 1, 'Steroids have a delayed onset and help prevent the late inflammatory phase.');

    ---------------------------------------------------------------------------
    -- CASE 33: ALTE / BRUE (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Scary Moment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Scary Moment', 'An infant had a 30-second episode of turning blue and going limp, which resolved on its own.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Scary Moment', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current term for this event?', '["SIDS", "Brief Resolved Unexplained Event (BRUE)", "Seizure", "None"]', 1, 'BRUE is the modern term for what was previously called ALTE (Apparent Life-Threatening Event).'),
    (v_case_id, 'What is a criteria for a \"Low Risk\" BRUE?', '["Infant > 60 days, born term, first event, no CPR needed, no concerning history/exam", "Prematurity", "Long event", "None"]', 0, 'Low risk BRUEs often need no extensive workup.'),
    (v_case_id, 'What is the most common cause of a BRUE?', '["Sepsis", "Gastroesophageal reflux (GERD) or Breath-holding", "Brain tumor", "None"]', 1, 'Most are benign, but serious causes like abuse or heart issues must be considered.');

    ---------------------------------------------------------------------------
    -- CASE 34: Intraosseous (IO) vs Intravenous (IV) (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Access Physics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Access Physics', 'A student asks why IO is so fast.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Access Physics', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does the IO space not collapse in shock?', '["It is in bone", "The rigid bony matrix protects the venous plexus from collapsing even when systemic BP is zero", "It is small", "None"]', 1, 'This is why it is preferred in cardiac arrest or severe shock.'),
    (v_case_id, 'How do you confirm correct IO placement?', '["Blood return", "Needle stays upright, marrow is aspirated, or fluid flushes easily without swelling", "X-ray", "None"]', 1, 'Visual and tactile cues are primary.'),
    (v_case_id, 'What is a potential complication of IO?', '["Broken leg", "Osteomyelitis or Compartment Syndrome (if fluid leaks out)", "Growth spurt", "None"]', 1, 'Leakage into the tissues is a serious risk.');

    ---------------------------------------------------------------------------
    -- CASE 35: Cardiogenic Shock - Hepatomegaly (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Large Liver' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Large Liver', 'A child in shock is found to have a liver edge 4 cm below the costal margin.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Large Liver', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does hepatomegaly indicate in a child in shock?', '["Liver cancer", "Right-sided heart failure and venous congestion", "Dehydration", "None"]', 1, 'The liver is very compliant in children and acts as a reservoir for backed-up blood.'),
    (v_case_id, 'Should you give a 20 mL/kg bolus to this child?', '["Yes", "No, give smaller amounts (5-10 mL/kg) and reassess frequently", "Give 50 mL/kg", "None"]', 1, 'Overloading a failing heart is dangerous.'),
    (v_case_id, 'What is a \"gallop\" rhythm (S3)?', '["Fast heart", "An extra heart sound representing rapid ventricular filling into a dilated/failing ventricle", "Slow heart", "None"]', 1, 'A gallop is a sign of heart failure.');

    ---------------------------------------------------------------------------
    -- CASE 36: Near Drowning - Cold Water (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Submersion and Temp' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Submersion and Temp', 'A child is brought in with a core temp of 28C after a drowning event.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Submersion and Temp', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is the heart likely to respond to medications or shocks at 28C?', '["Yes", "No, the \"cold\" heart is often refractory to therapy until warmed to > 30C", "Only to bicarb", "None"]', 1, 'Standard PALS doses are often limited until rewarming is underway.'),
    (v_case_id, 'What is an active internal rewarming technique?', '["Hot shower", "Warm IV fluids and warm humidified oxygen", "Blankets", "None"]', 1, 'External rewarming alone is not enough for severe hypothermia.'),
    (v_case_id, 'When can a hypothermic victim be declared dead?', '["Immediately", "After rewarming to near-normal and failing resuscitation", "After 5 minutes", "None"]', 1, 'You are not dead until you are warm and dead.');

    ---------------------------------------------------------------------------
    -- CASE 37: PALS Airway - Endotracheal Tube Size (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tube Math' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tube Math', 'You need to intubate a 4-year-old.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tube Math', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the formula for calculating an UNCUFFED ETT size?', '["(Age/2) + 12", "(Age/4) + 4", "Age + 5", "None"]', 1, 'Math for un-cuffed tubes.'),
    (v_case_id, 'What is the formula for a CUFFED ETT size?', '["(Age/4) + 3.5", "Age + 1", "Age/2", "None"]', 0, 'Cuffed tubes are slightly smaller to account for the cuff.'),
    (v_case_id, 'Which is generally preferred in modern PALS?', '["Uncuffed", "Cuffed (allows for better seal and lower re-intubation rates)", "No tube", "None"]', 1, 'Cuffed tubes are now favored if used correctly.');

    ---------------------------------------------------------------------------
    -- CASE 38: Pediatric Arrhythmias - Sinus Tachycardia (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fast but Normal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fast but Normal', 'A 2-year-old with a fever and dehydration has a heart rate of 170 bpm.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fast but Normal', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely rhythm?', '["SVT", "Sinus Tachycardia", "VT", "None"]', 1, 'The rate is appropriate for the condition and P-waves are likely present.'),
    (v_case_id, 'How do you treat Sinus Tachycardia?', '["Adenosine", "Treat the underlying cause (e.g., fluids for dehydration, Tylenol for fever)", "Shock", "None"]', 1, 'Sinus tach is a symptom, not a primary rhythm problem.'),
    (v_case_id, 'Does the rate vary with activity in Sinus Tachycardia?', '["No", "Yes", "Only in teens", "None"]', 1, 'SVT is typically a \"fixed\" high rate; sinus tach fluctuates.');

    ---------------------------------------------------------------------------
    -- CASE 39: Obstructive Shock - Cardiac Tamponade (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Muffled Heart Sounds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Muffled Heart Sounds', 'A child with a chest injury has low BP, muffled heart sounds, and distended neck veins.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Muffled Heart Sounds', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this triad?', '["Cushing''s triad", "Beck''s triad", "Virchow''s triad", "None"]', 1, 'Classic signs of cardiac tamponade.'),
    (v_case_id, 'What is the treatment?', '["Chest tube", "Pericardiocentesis (draining fluid from around the heart)", "Antibiotics", "None"]', 1, 'Needle drainage is required to relieve the obstruction.'),
    (v_case_id, 'What is \"Pulsus Paradoxus\"?', '["A fast pulse", "A drop in systolic BP > 10 mmHg during inspiration", "No pulse", "None"]', 1, 'This is a hallmark of tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 40: PALS - Post-Resuscitation Care (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'After ROSC' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'After ROSC', 'A child has Return of Spontaneous Circulation (ROSC) after arrest.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After ROSC', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the target oxygen saturation post-ROSC?', '["100%", "94% to 99% (Avoid hyperoxia)", "80%", "None"]', 1, 'Too much oxygen can increase reperfusion injury.'),
    (v_case_id, 'What is the goal for temperature management?', '["Fever is good", "Maintenance of normothermia (Avoid fever) or Targeted Temperature Management (TTM)", "Ice bath", "None"]', 1, 'Hyperthermia is detrimental to the post-arrest brain.'),
    (v_case_id, 'What is the priority for blood pressure management post-ROSC?', '["Keep it low", "Maintain a BP at or above the 5th percentile for age", "Don''t check it", "None"]', 1, 'Adequate perfusion is critical for recovery.');

    ---------------------------------------------------------------------------
    -- CASE 41: Tet Spell - Hypercyanotic Spell (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue Baby', 'A 6-month-old with Tetralogy of Fallot becomes extremely blue and agitated while crying.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blue Baby', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first physical maneuver to treat a \"Tet Spell\"?', '["CPR", "Knee-to-chest position", "Hold the baby", "None"]', 1, 'This increases systemic vascular resistance, forcing more blood into the lungs.'),
    (v_case_id, 'What medication can be used to calm the child and help the spell?', '["Epinephrine", "Morphine", "Aspirin", "None"]', 1, 'Calming the child reduces the infundibular spasm.'),
    (v_case_id, 'What is the underlying defect causing the spell?', '["A hole", "Right-to-left shunting across the VSD due to infundibular stenosis", "Fast heart", "None"]', 1, 'Deoxygenated blood bypasses the lungs.');

    ---------------------------------------------------------------------------
    -- CASE 42: PALS - Defibrillation Dosing (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dosing the Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dosing the Shock', 'A 10 kg child requires defibrillation.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dosing the Shock', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first energy dose for defibrillation?', '["2 J/kg", "4 J/kg", "10 J/kg", "None"]', 0, 'The initial dose is 2 J/kg.'),
    (v_case_id, 'What is the subsequent dose for the second shock?', '["2 J/kg", "4 J/kg", "No change", "None"]', 1, 'The dose is doubled for the second shock.'),
    (v_case_id, 'What is the maximum dose for pediatric defibrillation?', '["10 J/kg or adult dose", "100 J/kg", "1 J/kg", "None"]', 0, 'Doses can be titrated up to 10 J/kg.');

    ---------------------------------------------------------------------------
    -- CASE 43: Ingested Button Battery (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Small and Dangerous' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Small and Dangerous', 'A 1-year-old is suspected to have swallowed a button battery.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Small and Dangerous', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a button battery in the ESOPHAGUS an emergency?', '["It is a choking hazard only", "It can cause rapid liquefactive necrosis and perforation within 2 hours", "It doesn''t matter", "None"]', 1, 'The battery creates an electrical circuit that burns the tissue.'),
    (v_case_id, 'What is the management if the battery is in the esophagus?', '["Wait for it to pass", "Immediate endoscopic removal", "Give juice", "None"]', 1, 'Removal is urgent.'),
    (v_case_id, 'How do you distinguish a battery from a coin on X-ray?', '["Batteries have a \"double-contour\" or \"step-off\" appearance", "They look the same", "Batteries are smaller", "None"]', 0, 'The halo sign/double ring identifies the battery.');

    ---------------------------------------------------------------------------
    -- CASE 44: Hyperkalemia Emergency (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High Potassium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High Potassium', 'A child with renal failure has a potassium of 7.5 mEq/L and peaked T-waves.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'High Potassium', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What medication is given to STABILIZE the cardiac membrane?', '["Insulin", "Calcium Gluconate or Calcium Chloride", "Albuterol", "None"]', 1, 'Calcium doesn''t lower K but protects the heart from arrest.'),
    (v_case_id, 'What treatments can temporarily shift potassium into cells?', '["Insulin + Glucose, Albuterol, and Sodium Bicarbonate", "Vitamins", "Water", "None"]', 0, 'These buy time while K is physically removed.'),
    (v_case_id, 'What is the definitive way to remove potassium?', '["Sweating", "Hemodialysis or Kayexalate (slower)", "Vomiting", "None"]', 1, 'Dialysis is the most rapid removal method.');

    ---------------------------------------------------------------------------
    -- CASE 45: Child Abuse - Non-Accidental Trauma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Signs of Abuse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Signs of Abuse', 'A 4-month-old is brought in for lethargy. An X-ray shows multiple rib fractures in various stages of healing.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Signs of Abuse', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common intracranial injury in \"Shaken Baby Syndrome\"?', '["Epidural hematoma", "Subdural Hematoma and retinal hemorrhages", "Brain tumor", "None"]', 1, 'Shearing forces cause subdural bleeding.'),
    (v_case_id, 'Which fracture is highly suspicious for child abuse?', '["Simple radius fracture", "Posterior rib fractures or metaphyseal \"corner\" fractures", "Clavicle fracture", "None"]', 1, 'These locations are rare in accidental trauma.'),
    (v_case_id, 'What is your legal obligation if you suspect abuse?', '["Report it to the police only if you have proof", "Mandatory reporting to child protective services", "Ask the parents to stop", "None"]', 1, 'Healthcare workers are mandated reporters.');

    ---------------------------------------------------------------------------
    -- CASE 46: PALS Tachycardia - VT (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wide Complex Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wide Complex Tachycardia', 'A child has a heart rate of 190 bpm. The ECG shows a WIDE complex rhythm.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Wide Complex Tachycardia', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm?', '["SVT", "Ventricular Tachycardia (VT)", "Sinus tach", "None"]', 1, 'Wide complexes mean the rhythm is originating in the ventricles.'),
    (v_case_id, 'What is the treatment for STABLE VT?', '["Adenosine", "Amiodarone or Lidocaine infusion", "Shock", "None"]', 1, 'Antiarrhythmics are used if the child is stable.'),
    (v_case_id, 'What if the VT is UNSTABLE (low BP)?', '["Amiodarone", "Synchronized Cardioversion", "Defibrillation", "None"]', 1, 'Synchronized therapy is used if a pulse is present.');

    ---------------------------------------------------------------------------
    -- CASE 47: PALS - Bag-Mask Ventilation (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'BVM Technique' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'BVM Technique', 'You are performing bag-mask ventilation on an infant.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'BVM Technique', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"E-C Clamp\" technique?', '["A type of med", "Using the thumb and index finger to form a \"C\" to seal the mask, while the other fingers form an \"E\" to lift the jaw", "A knot", "None"]', 1, 'This is the standard way to hold a mask.'),
    (v_case_id, 'How much chest rise should you see?', '["A lot", "Just enough to see visible chest rise", "None", "None"]', 1, 'Avoid over-ventilation, which can cause gastric inflation and lung injury.'),
    (v_case_id, 'Why is a \"jaw thrust\" used instead of \"head tilt\" in trauma?', '["It is easier", "To avoid moving the potentially injured cervical spine", "It looks cooler", "None"]', 1, 'Spinal immobilization is critical.');

    ---------------------------------------------------------------------------
    -- CASE 48: Heat Stroke (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Heat Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Heat Emergency', 'A teen collapses during football practice in 100F weather. His temp is 106F and he is confused.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Heat Emergency', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What distinguishes heat stroke from heat exhaustion?', '["Temperature", "Altered mental status and extreme hyperthermia (> 104F)", "Sweating", "None"]', 1, 'Heat stroke is a CNS emergency.'),
    (v_case_id, 'What is the most rapid cooling method?', '["Fan", "Ice water immersion or evaporative cooling with tepid water and fans", "Drinking water", "None"]', 1, 'Rapidly lowering the core temp is life-saving.'),
    (v_case_id, 'Is Aspirin used to treat the fever in heat stroke?', '["Yes", "No, antipyretics are not effective for environmental heat stroke", "Only for pain", "None"]', 1, 'The fever is not mediated by the hypothalamus; it is pure heat overload.');

    ---------------------------------------------------------------------------
    -- CASE 49: Intussusception - The Emergency Phase (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bowel Obstruction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bowel Obstruction', 'An 18-month-old has episodic screaming and is now lethargic with a \"currant-jelly\" stool.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bowel Obstruction', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Constipation", "Intussusception", "Appendicitis", "None"]', 1, 'Telescoping of the bowel causes ischemia and obstruction.'),
    (v_case_id, 'What is the initial treatment for stable intussusception?', '["Surgery", "Air or Contrast Enema", "Antibiotics", "None"]', 1, 'The pressure from the enema can often reduce the intussusception.'),
    (v_case_id, 'What is a contraindication to an enema?', '["Age", "Signs of perforation or peritonitis", "One vomit", "None"]', 1, 'If the bowel is perforated, an enema is dangerous.');

    ---------------------------------------------------------------------------
    -- CASE 50: PALS - Termination of Resuscitation (PALS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ending the Effort' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ending the Effort', 'A team is resuscitating a child after 30 minutes of asystole.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ending the Effort', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What factors influence the decision to stop?', '["Age", "Etiology of arrest, duration of CPR, and presence of reversible causes", "Gender", "None"]', 1, 'The decision is individualized based on clinical circumstances.'),
    (v_case_id, 'Is a zero ETCO2 after 20 minutes of CPR predictive of poor outcome?', '["No", "Yes, it is a very strong predictor of failure to achieve ROSC", "Only in adults", "None"]', 1, 'End-tidal CO2 reflects cardiac output during CPR.'),
    (v_case_id, 'What is the priority when informing parents after a failed resuscitation?', '["Give them a bill", "Honest, clear communication and support for the grieving process", "Ask them to leave", "None"]', 1, 'Compassionate communication is the final step in the resuscitation process.');

    RAISE NOTICE 'SUCCESS: 50 Pediatric Emergencies Case Blocks registered.';
END $$;

COMMIT;
