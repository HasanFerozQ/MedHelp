BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Neurological Emergencies
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-neurological' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-neurological" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acute Ischemic Stroke - The Window (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Time is Brain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Time is Brain', 'A 65-year-old male presents with sudden right-sided weakness and aphasia starting 2 hours ago. BP is 170/90.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male presents with sudden right-sided weakness and aphasia starting 2 hours ago. BP is 170/90.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard "door-to-needle" time goal for tPA administration?', '["30 minutes", "60 minutes", "90 minutes", "None"]', 1, 'National guidelines aim for tPA administration within 60 minutes of arrival.'),
    (v_case_id, 'The traditional time window for IV Alteplase (tPA) is how many hours from symptom onset?', '["3 hours", "4.5 hours", "6 hours", "None"]', 1, 'The window was extended to 4.5 hours for many patients based on the ECASS III trial.'),
    (v_case_id, 'What is the blood pressure threshold for giving tPA?', '["< 185/110", "< 160/90", "< 220/120", "None"]', 0, 'BP must be below 185/110 to safely administer thrombolytics.');

    ---------------------------------------------------------------------------
    -- CASE 02: Stroke Mimics - Hypoglycemia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Great Mimicker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Great Mimicker', 'A 70-year-old diabetic patient presents with left-sided hemiparesis and confusion.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old diabetic patient presents with left-sided hemiparesis and confusion.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the very first lab test to perform in any suspected stroke?', '["Head CT", "Finger-stick Glucose", "PT/INR", "None"]', 1, 'Hypoglycemia can perfectly mimic focal neurological deficits.'),
    (v_case_id, 'If glucose is 35 mg/dL, what is the next step?', '["Head CT", "Administer 1 amp of D50 (Dextrose)", "Start tPA", "None"]', 1, 'Always correct the glucose first; symptoms may resolve immediately.'),
    (v_case_id, 'Why is correcting glucose before tPA critical?', '["Glucose prevents tPA working", "You might give a dangerous drug (tPA) for a reversible condition", "None", "None"]', 1, 'tPA carries a significant risk of intracranial hemorrhage.');

    ---------------------------------------------------------------------------
    -- CASE 03: Subarachnoid Hemorrhage - SAH (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thunderclap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thunderclap', 'A 45-year-old female presents with the "worst headache of my life," maximal at onset.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female presents with the "worst headache of my life," maximal at onset.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the sensitivity of a non-contrast Head CT for SAH within the first 6 hours?', '["50%", "Nearly 100%", "75%", "None"]', 1, 'Modern CT scanners are extremely sensitive in the early hyperacute phase.'),
    (v_case_id, 'If the CT is negative but clinical suspicion remains high (past 6h), what is the next step?', '["MRI", "Lumbar Puncture (LP) to check for xanthochromia", "Angiography", "None"]', 1, 'LP is the traditional "gold standard" to rule out SAH when CT is negative.'),
    (v_case_id, 'What medication is given to SAH patients to prevent vasospasm?', '["Lisinopril", "Nimodipine", "Heparin", "None"]', 1, 'Nimodipine is a calcium channel blocker that reduces ischemic complications from vasospasm.');

    ---------------------------------------------------------------------------
    -- CASE 04: Status Epilepticus - Step 1 (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Continuous Seizure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Continuous Seizure', 'A patient is brought in actively seizing for 10 minutes. IV access is obtained.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is brought in actively seizing for 10 minutes. IV access is obtained.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Status Epilepticus?', '["Seizure > 2 min", "Seizure > 5 min OR two seizures without regaining consciousness between", "Seizure > 30 min", "None"]', 1, 'The operational definition for starting treatment is 5 minutes.'),
    (v_case_id, 'What is the first-line medication class for stopping an active seizure?', '["Antiepileptics (Phenytoin)", "Benzodiazepines (Lorazepam/Midazolam)", "Barbiturates", "None"]', 1, 'Benzos are the most effective rapid-acting medications.'),
    (v_case_id, 'What is the preferred route for Midazolam if IV access is NOT available?', '["Oral", "Intramuscular (IM)", "Subcutaneous", "None"]', 1, 'IM Midazolam is the preferred "pre-hospital" or "no-IV" treatment for status.');

    ---------------------------------------------------------------------------
    -- CASE 05: Status Epilepticus - Step 2 (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Refractory Seizures' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Refractory Seizures', 'The patient continues to seize after two doses of Lorazepam.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The patient continues to seize after two doses of Lorazepam.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next step (second-line) for the seizing patient?', '["Wait for it to stop", "Long-acting antiepileptic (Fosphenytoin, Levetiracetam, or Valproate)", "Propofol", "None"]', 1, 'These drugs provide longer-term seizure suppression.'),
    (v_case_id, 'Which drug is associated with "Purple Glove Syndrome"?', '["Levetiracetam", "Phenytoin (IV infusion)", "Valproate", "None"]', 1, 'Phenytoin is highly caustic and can cause local tissue necrosis; Fosphenytoin is a safer alternative.'),
    (v_case_id, 'If the patient is still seizing after second-line meds, what is the next priority?', '["EEG", "Rapid Sequence Intubation (RSI) and General Anesthesia (Propofol/Midazolam infusion)", "None", "None"]', 1, 'Refractory status requires definitive control with anesthesia and airway management.');

    ---------------------------------------------------------------------------
    -- CASE 06: Increased ICP - Herniation (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blown Pupil' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blown Pupil', 'A head trauma patient has a fixed, dilated pupil on the left and right-sided hemiparesis.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A head trauma patient has a fixed, dilated pupil on the left and right-sided hemiparesis.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of herniation is most likely occurring?', '["Central", "Uncal (transtentorial)", "Tonsillar", "None"]', 1, 'The uncus of the temporal lobe compresses CN III (blown pupil) and the ipsilateral cerebral peduncle.'),
    (v_case_id, 'What are the components of Cushing''s Triad?', '["Fever, Tachycardia, Rash", "Hypertension, Bradycardia, and Irregular Respirations", "None", "None"]', 1, 'This is a late sign of dangerously high intracranial pressure.'),
    (v_case_id, 'What is an immediate medical intervention to reduce ICP?', '["Steroids", "Osmotherapy (Mannitol or Hypertonic Saline)", "Heparin", "None"]', 1, 'Osmotherapy creates an osmotic gradient to pull water out of brain tissue.');

    ---------------------------------------------------------------------------
    -- CASE 07: Epidural Hematoma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lucid Interval' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lucid Interval', 'A patient was hit in the temple with a baseball. He was briefly unconscious, then woke up and felt fine, but now is rapidly deteriorating.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient was hit in the temple with a baseball. He was briefly unconscious, then woke up and felt fine, but now is rapidly deteriorating.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which vessel is most commonly ruptured in an epidural hematoma?', '["Middle Cerebral Artery", "Middle Meningeal Artery", "Bridging Veins", "None"]', 1, 'Injury to the pterion often shears the middle meningeal artery.'),
    (v_case_id, 'What is the characteristic Head CT appearance of an epidural hematoma?', '["Crescent-shaped", "Biconvex (Lens-shaped) and does not cross suture lines", "None", "None"]', 1, 'This arterial bleed is contained by the dura''s attachments to suture lines.'),
    (v_case_id, 'Is an epidural hematoma typically a surgical emergency?', '["No", "Yes, it requires emergent decompression", "None", "None"]', 1, 'The rapid arterial expansion can cause herniation within minutes.');

    ---------------------------------------------------------------------------
    -- CASE 08: Subdural Hematoma (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crescent Moon' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crescent Moon', 'An 85-year-old on Warfarin presents with gradual onset confusion after a minor fall last week.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old on Warfarin presents with gradual onset confusion after a minor fall last week.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which vessel is responsible for a subdural hematoma?', '["Middle Meningeal Artery", "Bridging Veins", "Basilar Artery", "None"]', 1, 'Shearing of veins as they cross the subdural space, especially in elderly with brain atrophy.'),
    (v_case_id, 'What is the CT appearance of a subdural hematoma?', '["Lens-shaped", "Crescent-shaped (concave) and crosses suture lines", "None", "None"]', 1, 'Venous blood spreads more easily along the brain surface.'),
    (v_case_id, 'How does the density of a "Chronic" subdural appear on CT?', '["Hyperdense (white)", "Hypodense (dark/black)", "Isodense", "None"]', 1, 'As blood ages and breaks down, it becomes less dense than acute blood.');

    ---------------------------------------------------------------------------
    -- CASE 09: Intracerebral Hemorrhage - ICH (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hypertensive Bleed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hypertensive Bleed', 'A patient with long-standing HTN presents with sudden headache, vomiting, and a BP of 220/120. Head CT shows blood in the basal ganglia.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with long-standing HTN presents with sudden headache, vomiting, and a BP of 220/120. Head CT shows blood in the basal ganglia.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of spontaneous ICH?', '["Trauma", "Chronic Hypertension", "Amyloid angiopathy", "None"]', 1, 'HTN causes weakening of small deep arteries (Charcot-Bouchard aneurysms).'),
    (v_case_id, 'What is the target Systolic BP for an acute ICH?', '["< 185", "< 140-160", "< 120", "None"]', 1, 'Aggressive BP control (e.g., with Nicardipine) is used to prevent hematoma expansion.'),
    (v_case_id, 'If the patient is on Warfarin, what is the priority?', '["Wait for labs", "Immediate reversal with PCC (Prothrombin Complex Concentrate) and Vitamin K", "None", "None"]', 1, 'Hematoma expansion is the primary danger; rapid reversal is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 10: TIA - Risk Stratification (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Warning Shot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Warning Shot', 'A patient had 15 minutes of right-arm weakness that has completely resolved. Head CT is negative.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient had 15 minutes of right-arm weakness that has completely resolved. Head CT is negative.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Transient Ischemic Attack (TIA)?', '["A minor stroke", "A transient episode of neuro dysfunction without evidence of acute infarction", "None", "None"]', 1, 'It is defined by the lack of tissue injury, typically resolving within 1 hour.'),
    (v_case_id, 'Which scoring system is used to predict stroke risk after TIA?', '["CHADS2", "ABCD2 score", "NIHSS", "None"]', 1, 'ABCD2 looks at Age, BP, Clinical features, Duration, and Diabetes.'),
    (v_case_id, 'What is the most important "rule out" for a TIA-like presentation?', '["Migraine", "Hypoglycemia", "Seizure", "None"]', 1, 'Hypoglycemia is always the first mimic to exclude.');

    ---------------------------------------------------------------------------
    -- CASE 11: Meningitis - Presentation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever and Stiff Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever and Stiff Neck', 'A 20-year-old college student has fever, headache, photophobia, and a petechial rash.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old college student has fever, headache, photophobia, and a petechial rash.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic physical exam finding for meningeal irritation?', '["Positive Homan''s sign", "Positive Brudzinski and Kernig signs", "None", "None"]', 1, 'Involuntary hip/knee flexion with neck flexion (Brudzinski) or pain with knee extension (Kernig).'),
    (v_case_id, 'What is the most common bacterial cause in this age group?', '["Streptococcus pneumoniae", "Neisseria meningitidis", "Listeria", "None"]', 1, 'Meningococcus is classic for outbreaks in dormitories.'),
    (v_case_id, 'What is the priority in management?', '["Head CT", "Blood cultures and immediate empiric antibiotics (Ceftriaxone + Vancomycin)", "Wait for LP", "None"]', 1, 'Never delay antibiotics for the sake of diagnostic tests if meningitis is suspected.');

    ---------------------------------------------------------------------------
    -- CASE 12: Meningitis - LP Interpretation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spinal Tap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spinal Tap', 'LP results: WBC 2000 (90% Neutrophils), Glucose 20, Protein 250.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'LP results: WBC 2000 (90% Neutrophils), Glucose 20, Protein 250.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of meningitis is this?', '["Viral", "Bacterial", "Fungal", "None"]', 1, 'High neutrophils, very low glucose, and high protein are diagnostic for bacterial meningitis.'),
    (v_case_id, 'Which additional drug is given with the first dose of antibiotics to reduce neurological sequelae?', '["Heparin", "Dexamethasone", "Mannitol", "None"]', 1, 'Steroids reduce the inflammatory response to bacterial lysis, decreasing hearing loss and edema.'),
    (v_case_id, 'When should a CT be done BEFORE an LP?', '["Always", "If there are focal neuro deficits, AMS, papilledema, or history of CNS disease", "None", "None"]', 1, 'These signs suggest a space-occupying lesion that could lead to herniation during LP.');

    ---------------------------------------------------------------------------
    -- CASE 13: Encephalitis (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Altered Fever' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Altered Fever', 'A patient has fever, headache, and is behaving strangely (psychiatric symptoms) followed by a seizure.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has fever, headache, and is behaving strangely (psychiatric symptoms) followed by a seizure.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish encephalitis from meningitis?', '["Rash", "Presence of altered mental status, personality changes, or focal neuro signs", "None", "None"]', 1, 'Encephalitis involves the brain parenchyma itself.'),
    (v_case_id, 'What is the most common cause of sporadic fatal encephalitis?', '["West Nile", "Herpes Simplex Virus (HSV-1)", "Rabies", "None"]', 1, 'HSV encephalitis has a predilection for the temporal lobes.'),
    (v_case_id, 'What treatment must be added empirically if encephalitis is suspected?', '["Fluconazole", "Acyclovir", "Metronidazole", "None"]', 1, 'Early acyclovir significantly improves outcomes.');

    ---------------------------------------------------------------------------
    -- CASE 14: Guillain-Barre Syndrome - GBS (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ascending Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ascending Weakness', 'A 30-year-old male has 2 days of progressive leg weakness following a diarrheal illness.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male has 2 days of progressive leg weakness following a diarrheal illness.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic clinical pattern of GBS?', '["Descending paralysis", "Ascending symmetrical paralysis with loss of deep tendon reflexes", "None", "None"]', 1, 'It is an acute inflammatory demyelinating polyneuropathy.'),
    (v_case_id, 'What is the most important "bedside" test for a patient with GBS?', '["EKG", "Forced Vital Capacity (FVC) and Negative Inspiratory Force (NIF)", "None", "None"]', 1, 'Monitoring for respiratory failure is the priority.'),
    (v_case_id, 'What is found on the LP in GBS?', '["High WBC", "Albuminocytologic dissociation (High protein, normal WBC)", "None", "None"]', 1, 'This is the classic CSF finding.');

    ---------------------------------------------------------------------------
    -- CASE 15: Myasthenia Gravis Crisis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fatigable Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fatigable Weakness', 'A patient with known MG has worsening ptosis, difficulty swallowing, and respiratory distress.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with known MG has worsening ptosis, difficulty swallowing, and respiratory distress.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of Myasthenia Gravis?', '["Demyelination", "Autoantibodies against acetylcholine receptors at the NMJ", "None", "None"]', 1, 'This causes post-synaptic transmission failure.'),
    (v_case_id, 'Which common ED medications can precipitate an MG crisis?', '["Antibiotics (Aminoglycosides/Fluoroquinolones) and Beta-blockers", "Tylenol", "None", "None"]', 0, 'Many drugs can worsen neuromuscular blockade.'),
    (v_case_id, 'What is the definitive treatment for Myasthenic Crisis?', '["Steroids only", "Plasmapheresis or IVIG", "Wait it out", "None"]', 1, 'Rapid removal or neutralization of antibodies is needed.');

    ---------------------------------------------------------------------------
    -- CASE 16: Cauda Equina Syndrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Saddle Anesthesia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Saddle Anesthesia', 'A patient with chronic back pain has sudden urinary incontinence and numbness in the groin area.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with chronic back pain has sudden urinary incontinence and numbness in the groin area.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physical exam triad for Cauda Equina Syndrome?', '["Fever, Back pain, Leg pain", "Saddle anesthesia, Urinary/Fecal incontinence, and Lower extremity weakness", "None", "None"]', 1, 'This is a true surgical emergency.'),
    (v_case_id, 'What is the best "first" objective test for urinary retention?', '["Bladder Scan (Post-void residual > 100-200cc)", "Urine analysis", "CT Abdomen", "None"]', 0, 'Inability to fully empty the bladder is a high-sensitivity sign.'),
    (v_case_id, 'What is the imaging modality of choice?', '["X-ray", "MRI of the Lumbar Spine", "None", "None"]', 1, 'MRI is needed to visualize the compression of the nerve roots.');

    ---------------------------------------------------------------------------
    -- CASE 17: Epidural Abscess (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Back Pain Fever' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Back Pain Fever', 'An IV drug user has severe localized back pain, fever, and new leg weakness.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An IV drug user has severe localized back pain, fever, and new leg weakness.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical triad of Spinal Epidural Abscess (SEA)?', '["Fever, Back pain, Neurological deficit", "Cough, Fever, Chills", "None", "None"]', 0, 'However, the full triad is only present in a minority of cases initially.'),
    (v_case_id, 'What is the most common organism?', '["E. coli", "Staphylococcus aureus", "Streptococcus", "None"]', 1, 'Particularly MRSA in high-risk patients.'),
    (v_case_id, 'What is the primary risk of delaying diagnosis?', '["Pain", "Permanent paralysis due to cord ischemia/compression", "None", "None"]', 1, 'SEA can cause rapid, irreversible damage.');

    ---------------------------------------------------------------------------
    -- CASE 18: Temporal Arteritis - GCA (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scalp Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scalp Pain', 'A 70-year-old female has a new-onset headache, jaw pain when chewing, and a very high ESR.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old female has a new-onset headache, jaw pain when chewing, and a very high ESR.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared complication of Giant Cell Arteritis (GCA)?', '["Stroke", "Permanent vision loss (Anterior Ischemic Optic Neuropathy)", "None", "None"]', 1, 'Inflammation of the ophthalmic artery causes blindness.'),
    (v_case_id, 'What is the "jaw pain when chewing" called?', '["Lockjaw", "Jaw claudication", "TMJ", "None"]', 1, 'This is highly specific for GCA.'),
    (v_case_id, 'What is the management if GCA is suspected?', '["Wait for biopsy", "Immediate high-dose systemic steroids (Prednisone)", "None", "None"]', 1, 'Do not wait for a biopsy; steroids are started immediately to protect vision.');

    ---------------------------------------------------------------------------
    -- CASE 19: Wernicke''s Encephalopathy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Classic Triad' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Classic Triad', 'An alcoholic patient has ataxia, ophthalmoplegia (nystagmus), and confusion.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An alcoholic patient has ataxia, ophthalmoplegia (nystagmus), and confusion.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the deficiency?', '["Vitamin B12", "Thiamine (Vitamin B1)", "Folate", "None"]', 1, 'Thiamine is needed for glucose metabolism in the brain.'),
    (v_case_id, 'Why must you give Thiamine BEFORE Glucose?', '["For absorption", "Glucose can precipitate/worsen the condition in a thiamine-deficient brain", "None", "None"]', 1, 'Glucose uses up the remaining thiamine cofactors.'),
    (v_case_id, 'What is the chronic, irreversible stage of this condition?', '["Delirium", "Korsakoff Syndrome (Amnesia/Confabulation)", "None", "None"]', 1, 'Early treatment of Wernicke''s prevents progression to Korsakoff.');

    ---------------------------------------------------------------------------
    -- CASE 20: Bell''s Palsy (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Facial Droop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Facial Droop', 'A patient has a complete right-sided facial droop, including the forehead.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a complete right-sided facial droop, including the forehead.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish a Peripheral (CN VII) palsy from a Central (Stroke) palsy?', '["Forehead sparing", "Peripheral (Bell''s) involves the forehead; Central (Stroke) spares the forehead", "None", "None"]', 1, 'In a stroke, the forehead receives dual innervation from both hemispheres.'),
    (v_case_id, 'What is the standard treatment for Bell''s Palsy?', '["Antibiotics", "Steroids (Prednisone) +/- Antivirals", "None", "None"]', 1, 'Early steroids improve recovery rates.'),
    (v_case_id, 'What important "eye" precaution must be taken?', '["Glasses", "Lubrication and taping the eye shut at night (to prevent corneal abrasion)", "None", "None"]', 1, 'Patients cannot close their eye, risking drying and injury.');

    ---------------------------------------------------------------------------
    -- CASE 21: Vertigo - Peripheral vs Central (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spinning Room' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spinning Room', 'A patient has constant dizziness and "vertical" nystagmus.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has constant dizziness and "vertical" nystagmus.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is vertical nystagmus a sign of peripheral or central vertigo?', '["Peripheral", "Central (Brainstem or Cerebellum)", "None", "None"]', 1, 'Vertical nystagmus is almost always a concerning central sign.'),
    (v_case_id, 'What is the most common cause of peripheral vertigo?', '["Stroke", "BPPV (Benign Paroxysmal Positional Vertigo)", "None", "None"]', 1, 'BPPV is caused by "otoliths" in the semicircular canals.'),
    (v_case_id, 'What maneuver is both diagnostic and therapeutic for BPPV?', '["Romberg", "Dix-Hallpike (diag) and Epley (treatment)", "None", "None"]', 1, 'These maneuvers move the canaliths out of the sensitive area.');

    ---------------------------------------------------------------------------
    -- CASE 22: Cerebellar Stroke (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Drunken Gait' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Drunken Gait', 'An elderly male has sudden onset vertigo, nausea, and an inability to walk (ataxia).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly male has sudden onset vertigo, nausea, and an inability to walk (ataxia).', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "red flag" for a central cause of vertigo?', '["Transient hearing loss", "Inability to stand or walk", "None", "None"]', 1, 'True truncal ataxia is highly suggestive of a cerebellar lesion.'),
    (v_case_id, 'What is the main danger of a cerebellar hemorrhage or large infarction?', '["Seizure", "Mass effect and obstructive hydrocephalus/herniation", "None", "None"]', 1, 'The posterior fossa is a tight space.'),
    (v_case_id, 'Can a Head CT miss an acute cerebellar stroke?', '["No", "Yes, the posterior fossa is poorly visualized on CT due to bone artifact", "None", "None"]', 1, 'MRI (DWI) is far superior for posterior circulation strokes.');

    ---------------------------------------------------------------------------
    -- CASE 23: AMS - AEIOU TIPS (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Undifferentiated AMS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Undifferentiated AMS', 'A patient is brought in confused and sleepy. No history is available.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is brought in confused and sleepy. No history is available.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "I" in AEIOU TIPS stand for?', '["Infarction", "Insulin (Hypo/Hyperglycemia) and Infection", "None", "None"]', 1, 'Metabolic and infectious causes are common.'),
    (v_case_id, 'What does the "U" in AEIOU TIPS stand for?', '["Ulcer", "Uremia", "Urination", "None"]', 1, 'Renal failure leads to metabolic encephalopathy.'),
    (v_case_id, 'What "cocktail" was traditionally given to all AMS patients (now individualized)?', '["Saline/Heparin", "Dextrose, Thiamine, Naloxone, and Oxygen", "None", "None"]', 1, 'These treat the most common reversible "deadly" causes.');

    ---------------------------------------------------------------------------
    -- CASE 24: Migraine vs. Emergency (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Severe Migraine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Severe Migraine', 'A patient with a history of migraines has a "typical" headache that is not responding to home meds.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a history of migraines has a "typical" headache that is not responding to home meds.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "red flag" for a secondary headache?', '["Nausea", "Sudden onset, new pattern in older patient, or focal neuro signs", "None", "None"]', 1, 'Changes in baseline are concerning.'),
    (v_case_id, 'What is the first-line ED treatment for migraine?', '["Opioids", "IV Fluids and Dopamine Antagonists (e.g., Metoclopramide or Prochlorperazine)", "None", "None"]', 1, 'Opioids are avoided as they increase the risk of recurrence and transition to chronic headache.'),
    (v_case_id, 'What medication is often given to prevent a "rebound" headache?', '["Tylenol", "Dexamethasone", "Caffeine", "None"]', 1, 'A single dose of steroids reduces the rate of headache recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 25: Carbon Monoxide Headache (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Winter Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Winter Headache', 'A whole family presents with dull, global headaches and nausea on a cold day.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A whole family presents with dull, global headaches and nausea on a cold day.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What environmental emergency causes this cluster?', '["Food poisoning", "Carbon Monoxide (CO) toxicity", "None", "None"]', 1, 'CO poisoning often mimics the flu or migraines.'),
    (v_case_id, 'How do you diagnose CO poisoning?', '["Pulse-ox", "Co-oximetry (from ABG or VBG)", "CT Brain", "None"]', 1, 'Standard pulse-ox cannot distinguish CO-Hgb from O2-Hgb.'),
    (v_case_id, 'What is the treatment?', '["Aspirin", "100% Oxygen (or Hyperbaric O2 for severe cases)", "None", "None"]', 1, 'Oxygen speeds up the clearance of CO.');

    ---------------------------------------------------------------------------
    -- CASE 26: Pseudotumor Cerebri (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Young Female Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Young Female Headache', 'An obese 25-year-old female has chronic headache and "whooshing" in her ears.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An obese 25-year-old female has chronic headache and "whooshing" in her ears.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the medical name for this condition?', '["Brain tumor", "Idiopathic Intracranial Hypertension (IIH)", "None", "None"]', 1, 'High ICP without a mass lesion.'),
    (v_case_id, 'What physical exam finding is critical to check for?', '["Pupil size", "Papilledema", "None", "None"]', 1, 'Optic disc swelling confirms increased pressure.'),
    (v_case_id, 'What is both diagnostic and therapeutic?', '["CT", "Lumbar Puncture with Opening Pressure (> 25 cm H2O)", "None", "None"]', 1, 'Removing CSF lowers the pressure and provides immediate relief.');

    ---------------------------------------------------------------------------
    -- CASE 27: Seizure - New Onset (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Fit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Fit', 'A 50-year-old male has a first-time seizure. He is now post-ictal.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male has a first-time seizure. He is now post-ictal.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of new-onset seizure in the elderly?', '["Alcohol", "Stroke or Brain Tumor", "None", "None"]', 1, 'Focal structural lesions become more common with age.'),
    (v_case_id, 'What is the priority diagnostic test for a NEW seizure in the ED?', '["EEG", "Emergent non-contrast Head CT", "MRI", "None"]', 1, 'CT is needed to rule out acute hemorrhage or mass.'),
    (v_case_id, 'Do most "provoked" seizures (e.g., from alcohol withdrawal) require long-term antiepileptic meds?', '["Yes", "No, you treat the underlying cause", "None", "None"]', 1, 'Anti-convulsants are for "unprovoked" epilepsy.');

    ---------------------------------------------------------------------------
    -- CASE 28: Brain Abscess (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ring Enhancing Lesion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ring Enhancing Lesion', 'A patient with chronic sinusitis has a new headache, fever, and focal weakness.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with chronic sinusitis has a new headache, fever, and focal weakness.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the imaging of choice for a brain abscess?', '["Head CT only", "MRI or Contrast-enhanced CT", "None", "None"]', 1, 'Contrast is needed to see the "ring enhancement."'),
    (v_case_id, 'What is a common source of infection for brain abscesses?', '["Lungs", "Direct spread from sinuses, teeth, or ears", "None", "None"]', 1, 'Contiguous spread is a major pathway.'),
    (v_case_id, 'Is an LP safe in a patient with a known brain abscess?', '["Yes", "No, due to risk of herniation from mass effect", "None", "None"]', 1, 'LP is contraindicated if a significant mass lesion is present.');

    ---------------------------------------------------------------------------
    -- CASE 29: Venous Sinus Thrombosis (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Partum Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Partum Headache', 'A 28-year-old female (3 weeks post-partum) has a severe, worsening headache and a seizure.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old female (3 weeks post-partum) has a severe, worsening headache and a seizure.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Eclampsia", "Cerebral Venous Sinus Thrombosis (CVST)", "None", "None"]', 1, 'Hypercoagulable states (like post-partum) increase the risk of CVST.'),
    (v_case_id, 'What is the imaging test of choice?', '["CT Head", "MRV (MR Venography) or CTV", "None", "None"]', 1, 'Standard CT often misses the thrombus in the venous sinuses.'),
    (v_case_id, 'What is the treatment, even if some hemorrhage is present?', '["Aspirin", "Anticoagulation (Heparin)", "None", "None"]', 1, 'Anticoagulation is the standard of care to prevent further clot formation, despite the risk of "venous stroke" hemorrhage.');

    ---------------------------------------------------------------------------
    -- CASE 30: Hypertensive Encephalopathy (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'PRES' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'PRES', 'A patient with severe HTN (240/140) has confusion, vision loss, and seizures.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with severe HTN (240/140) has confusion, vision loss, and seizures.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does PRES stand for?', '["Primary Encephalopathy", "Posterior Reversible Encephalopathy Syndrome", "None", "None"]', 1, 'A syndrome of cerebral edema caused by a failure of BP autoregulation.'),
    (v_case_id, 'What is the target BP reduction in Hypertensive Emergency?', '["Drop to 120/80 immediately", "Reduce Mean Arterial Pressure (MAP) by 20-25% in the first hour", "None", "None"]', 1, 'Rapidly dropping BP to "normal" can cause watershed cerebral ischemia.'),
    (v_case_id, 'What is a characteristic MRI finding in PRES?', '["Anterior infarct", "Vasogenic edema in the posterior parietal/occipital lobes", "None", "None"]', 1, 'This matches the typical clinical presentation of visual disturbances.');

    ---------------------------------------------------------------------------
    -- CASE 31: Normal Pressure Hydrocephalus - NPH (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wet, Wobbly, and Wacky' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wet, Wobbly, and Wacky', 'An elderly patient has progressive urinary incontinence, magnetic gait (feet stuck to floor), and dementia.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient has progressive urinary incontinence, magnetic gait (feet stuck to floor), and dementia.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of NPH?', '["Fever, Cough, Rash", "Urinary Incontinence, Gait Ataxia, and Dementia", "None", "None"]', 1, 'Remembered as "Wet, Wobbly, and Wacky."'),
    (v_case_id, 'What does the CT show?', '["Brain atrophy", "Ventriculomegaly out of proportion to sulcal enlargement", "None", "None"]', 1, 'Large ventricles are the hallmark.'),
    (v_case_id, 'What is the treatment?', '["Meds", "Ventirculoperitoneal (VP) Shunt", "None", "None"]', 1, 'Shunting CSF can often reverse the symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 32: Botulism (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Descending Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Descending Weakness', 'A patient presents with blurry vision, difficulty swallowing, and "descending" muscle weakness.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with blurry vision, difficulty swallowing, and "descending" muscle weakness.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxin mechanism?', '["Blocks receptors", "Inhibits presynaptic acetylcholine release", "None", "None"]', 1, 'Clostridium botulinum toxin prevents signaling at the NMJ.'),
    (v_case_id, 'How is the paralysis different from GBS?', '["Ascending", "Descending (Head down to toes)", "None", "None"]', 1, 'Botulism starts with cranial nerve involvement.'),
    (v_case_id, 'What is the name for infant botulism from honey?', '["Sweet syndrome", "Floppy Baby Syndrome", "None", "None"]', 1, 'Colonization of the gut leads to toxin production.');

    ---------------------------------------------------------------------------
    -- CASE 33: Multiple Sclerosis Flare (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Optic Neuritis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Optic Neuritis', 'A 25-year-old female has sudden painful vision loss in one eye and previously had "numbness that went away."', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old female has sudden painful vision loss in one eye and previously had "numbness that went away."', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected diagnosis?', '["Stroke", "Multiple Sclerosis (MS)", "None", "None"]', 1, 'MS typically presents with lesions "separated in time and space" in young females.'),
    (v_case_id, 'What is the treatment for an acute MS flare in the ED?', '["Antibiotics", "High-dose IV steroids (Methylprednisolone)", "None", "None"]', 1, 'Steroids speed up recovery from the acute episode.'),
    (v_case_id, 'What is "Uhthoff''s phenomenon"?', '["Pain with eye movement", "Worsening of neurological symptoms with heat (e.g., hot shower)", "None", "None"]', 1, 'Heat slows conduction in demyelinated nerves.');

    ---------------------------------------------------------------------------
    -- CASE 34: Coma - GCS (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The GCS Scale' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The GCS Scale', 'A patient is unresponsive. He opens his eyes to pain, moans incomprehensibly, and withdraws from pain.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is unresponsive. He opens his eyes to pain, moans incomprehensibly, and withdraws from pain.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the GCS score?', '["GCS 8 (E2, V2, M4)", "GCS 10", "GCS 6", "None"]', 0, 'Eyes(2) + Voice(2) + Motor(4) = 8.'),
    (v_case_id, 'What is the famous rule for intubation based on GCS?', '["GCS < 12", "GCS < 8, Intubate", "None", "None"]', 1, 'Patients with a score of 8 or less typically cannot protect their own airway.'),
    (v_case_id, 'What is the maximum GCS score?', '["10", "15", "20", "None"]', 1, 'E4 V5 M6 = 15.');

    ---------------------------------------------------------------------------
    -- CASE 35: Brain Death (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Apnea Test' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Apnea Test', 'You are asked to evaluate a patient for brain death after a massive ICH.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are asked to evaluate a patient for brain death after a massive ICH.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the required conditions before testing?', '["Normal vitals", "Normothermia and absence of sedating drugs/neuromuscular blockers", "None", "None"]', 1, 'You must ensure the patient isn''t just "cold or drugged."'),
    (v_case_id, 'What is the "Apnea Test"?', '["Hold breath for 10s", "Disconnect from ventilator and monitor for respiratory effort while PCO2 rises > 60", "None", "None"]', 1, 'Lack of drive to breathe despite high CO2 confirms brainstem death.'),
    (v_case_id, 'Which reflex is typically tested first?', '["Knee jerk", "Brainstem reflexes (Pupillary, Corneal, Oculocephalic)", "None", "None"]', 1, 'Cranial nerve reflexes must be absent.');

    ---------------------------------------------------------------------------
    -- CASE 36: Dizziness - HINTS Exam (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HINTS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HINTS', 'You are using the HINTS exam to evaluate a patient with continuous vertigo.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are using the HINTS exam to evaluate a patient with continuous vertigo.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "HI" stand for?', '["High Intensity", "Head Impulse test", "None", "None"]', 1, 'A normal head impulse in a dizzy patient is actually *concerning* for a central cause.'),
    (v_case_id, 'What does "N" stand for?', '["Nausea", "Nystagmus (direction-changing is central)", "None", "None"]', 1, 'Peripheral nystagmus is usually unidirectional.'),
    (v_case_id, 'What does "TS" stand for?', '["Too Sick", "Test of Skew (vertical misalignment)", "None", "None"]', 1, 'Vertical ocular misalignment is highly suggestive of a central lesion.');

    ---------------------------------------------------------------------------
    -- CASE 37: Spinal Cord Compression (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Malignant Compression' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Malignant Compression', 'A patient with known lung cancer has new, severe mid-back pain and weakness in both legs.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with known lung cancer has new, severe mid-back pain and weakness in both legs.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority medical management?', '["Morphine", "High-dose Dexamethasone", "Chemotherapy", "None"]', 1, 'Steroids reduce edema around the cord and can prevent paralysis.'),
    (v_case_id, 'What is the imaging of choice?', '["CT", "MRI of the entire spine", "None", "None"]', 1, 'Metastases are often present at multiple levels.'),
    (v_case_id, 'How do you differentiate SEA (Abscess) from Malignant Compression?', '["MRI", "Clinical history (IVDU/Fever for SEA vs Cancer/Chronic pain for malignancy)", "None", "None"]', 1, 'History provides the clue, but MRI confirms the pathology.');

    ---------------------------------------------------------------------------
    -- CASE 38: Transient Global Amnesia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Repeating Question' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Repeating Question', 'An elderly patient is suddenly unable to form new memories and keeps asking the same question every 2 minutes.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient is suddenly unable to form new memories and keeps asking the same question every 2 minutes.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this benign but frightening syndrome?', '["Dementia", "Transient Global Amnesia (TGA)", "None", "None"]', 1, 'TGA involves acute anterograde amnesia with preserved identity and alertness.'),
    (v_case_id, 'How long does TGA typically last?', '["Minutes", "Less than 24 hours", "Weeks", "None"]', 1, 'It is a self-limited condition.'),
    (v_case_id, 'Does TGA increase the risk of future stroke?', '["Yes", "No", "Only if hypertensive", "None"]', 1, 'TGA is generally considered a benign condition with a low risk of recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 39: Seizure Mimics - Syncope (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Convulsive Syncope' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Convulsive Syncope', 'A patient passes out after standing up and has 3-4 "jerks" of the limbs. He wakes up immediately and is not confused.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient passes out after standing up and has 3-4 "jerks" of the limbs. He wakes up immediately and is not confused.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish this from a true seizure?', '["Duration", "Lack of a post-ictal state and very brief duration of motor activity", "None", "None"]', 1, 'Convulsive syncope is common and benign; true seizures involve a recovery period.'),
    (v_case_id, 'What is the most likely diagnosis?', '["Epilepsy", "Vasovagal Syncope", "None", "None"]', 1, 'Syncope is a transient loss of consciousness due to global cerebral hypoperfusion.'),
    (v_case_id, 'What is the diagnostic test of choice?', '["CT", "EKG (to rule out arrhythmia)", "None", "None"]', 1, 'Always get an EKG for any loss of consciousness.');

    ---------------------------------------------------------------------------
    -- CASE 40: Carotid Artery Dissection (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neck Pain Stroke' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neck Pain Stroke', 'A young patient has severe neck pain followed by a TIA-like episode and a small pupil on the same side.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A young patient has severe neck pain followed by a TIA-like episode and a small pupil on the same side.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the constellation of a small pupil and ptosis called?', '["Bell''s Palsy", "Horner''s Syndrome", "None", "None"]', 1, 'This results from disruption of the sympathetic fibers traveling with the carotid.'),
    (v_case_id, 'What is the suspected diagnosis?', '["Migraine", "Carotid Artery Dissection", "None", "None"]', 1, 'A common cause of stroke in young/middle-aged adults, often after trauma or manipulation.'),
    (v_case_id, 'What imaging is used to diagnose dissection?', '["X-ray", "CTA (CT Angiography) of the Head and Neck", "None", "None"]', 1, 'CTA can show the "string sign" or the intramural hematoma.');

    ---------------------------------------------------------------------------
    -- CASE 41: Cluster Headache (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Suicide Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Suicide Headache', 'A male patient has 10/10 stabbing pain behind his left eye with tearing and nasal congestion.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A male patient has 10/10 stabbing pain behind his left eye with tearing and nasal congestion.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line ACUTE treatment in the ED?', '["Aspirin", "100% High-flow Oxygen", "None", "None"]', 1, 'Oxygen is remarkably effective for aborting a cluster headache.'),
    (v_case_id, 'Which medication is used for prophylaxis?', '["Tylenol", "Verapamil", "None", "None"]', 1, 'Verapamil is the mainstay of cluster prevention.'),
    (v_case_id, 'How do these differ from migraines?', '["Duration", "Clusters are shorter (15-180 min) and occur multiple times per day", "None", "None"]', 1, 'The autonomic symptoms (tearing, congestion) are also key.');

    ---------------------------------------------------------------------------
    -- CASE 42: Trigeminal Neuralgia (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tic Douloureux' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tic Douloureux', 'A patient has "electric shock" pain in their cheek triggered by brushing their teeth.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has "electric shock" pain in their cheek triggered by brushing their teeth.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is involved?', '["Facial", "Trigeminal (CN V)", "None", "None"]', 1, 'Typically the V2 or V3 distribution.'),
    (v_case_id, 'What is the first-line medication?', '["Ibuprofen", "Carbamazepine", "Morphine", "None"]', 1, 'Carbamazepine is highly effective for neuralgic pain.'),
    (v_case_id, 'If this occurs in a YOUNG patient, what underlying condition should be considered?', '["Stroke", "Multiple Sclerosis", "None", "None"]', 1, 'MS is a cause of trigeminal neuralgia in younger populations.');

    ---------------------------------------------------------------------------
    -- CASE 43: Alcohol-Related Seizures (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Withdrawal Seizure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Withdrawal Seizure', 'A chronic alcoholic stops drinking and has a generalized seizure 24 hours later.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A chronic alcoholic stops drinking and has a generalized seizure 24 hours later.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the treatment for alcohol withdrawal seizures?', '["Phenytoin", "Benzodiazepines", "None", "None"]', 1, 'Phenytoin is NOT effective for withdrawal seizures; benzos are the cure.'),
    (v_case_id, 'What is the typical time frame for withdrawal seizures?', '["1 hour", "6 to 48 hours after the last drink", "None", "None"]', 1, 'They occur early in the withdrawal process.'),
    (v_case_id, 'What condition follows seizures in the withdrawal spectrum?', '["Nausea", "Delirium Tremens (DTs)", "None", "None"]', 1, 'DTs occur 72-96 hours after cessation.');

    ---------------------------------------------------------------------------
    -- CASE 44: Brain Tumor Presentation (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Morning Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Morning Headache', 'A patient has a headache that is worst in the morning and better later in the day, associated with vomiting.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a headache that is worst in the morning and better later in the day, associated with vomiting.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the headache worst in the morning?', '["Dehydration", "Lying flat increases ICP which is maximal after sleep", "None", "None"]', 1, 'This is a classic "red flag" for increased ICP.'),
    (v_case_id, 'What is the most common source of brain tumors in adults?', '["Primary brain", "Metastatic disease (Lung, Breast, Melanoma)", "None", "None"]', 1, 'Metastases are much more common than primary brain tumors.'),
    (v_case_id, 'What is the role of steroids in brain tumors?', '["Kill the tumor", "Reduce vasogenic edema (swelling) around the tumor", "None", "None"]', 1, 'Dexamethasone is used to relieve symptoms of mass effect.');

    ---------------------------------------------------------------------------
    -- CASE 45: Locked-In Syndrome (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Only the Eyes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Only the Eyes', 'A patient is fully conscious but can only move their eyes vertically.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is fully conscious but can only move their eyes vertically.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the lesion?', '["Cerebrum", "Pons (ventral)", "Midbrain", "None"]', 1, 'Damage to the pons spares the reticular activating system and vertical eye movements.'),
    (v_case_id, 'What is the most common cause?', '["Bleed", "Basilar artery occlusion (stroke)", "None", "None"]', 1, 'Basilar artery stroke is a catastrophic event.'),
    (v_case_id, 'Is the patient''s cognitive function preserved?', '["No", "Yes, they are fully aware but paralyzed", "None", "None"]', 1, 'This is a terrifying clinical state.');

    ---------------------------------------------------------------------------
    -- CASE 46: Central Cord Syndrome (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neck Extension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neck Extension', 'An elderly patient with cervical spondylosis has a "hyperextension" injury and now has weakness in their arms but not their legs.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient with cervical spondylosis has a "hyperextension" injury and now has weakness in their arms but not their legs.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this incomplete cord syndrome?', '["Brown-Sequard", "Central Cord Syndrome", "None", "None"]', 1, 'The central part of the cord (carrying arm fibers) is most affected.'),
    (v_case_id, 'What is the characteristic distribution of weakness?', '["Upper > Lower extremity", "Lower > Upper", "None", "None"]', 0, 'This "walking paraplegic" presentation is classic.'),
    (v_case_id, 'What is the imaging of choice?', '["CT", "MRI", "None", "None"]', 1, 'MRI is needed to see the cord edema.');

    ---------------------------------------------------------------------------
    -- CASE 47: Brown-Sequard Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hemisection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hemisection', 'A patient has a stab wound to the spinal cord.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a stab wound to the spinal cord.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the neurological pattern of Brown-Sequard?', '["Complete paralysis", "Ipsilateral loss of motor/vibration and Contralateral loss of pain/temp", "None", "None"]', 1, 'This results from a cord hemisection.'),
    (v_case_id, 'Why is pain/temp loss on the opposite side?', '["Nerve crossover", "The spinothalamic tract crosses early (within 1-2 levels)", "None", "None"]', 1, 'Motor and dorsal columns cross higher up.'),
    (v_case_id, 'Is this a common finding?', '["Yes", "No, pure hemisections are rare", "None", "None"]', 1, 'Usually seen in penetrating trauma.');

    ---------------------------------------------------------------------------
    -- CASE 48: Horner''s Syndrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Miosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Miosis', 'A patient has a small pupil, slight droop of the eyelid, and no sweating on the left side of their face.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a small pupil, slight droop of the eyelid, and no sweating on the left side of their face.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the triad of Horner''s syndrome?', '["Fever, Pain, Rash", "Miosis, Ptosis, and Anhidrosis", "None", "None"]', 1, 'Results from sympathetic chain disruption.'),
    (v_case_id, 'What is a "Pancoast tumor"?', '["Brain tumor", "A lung apex tumor that compresses the sympathetic chain", "None", "None"]', 1, 'A classic non-neurological cause of Horner''s.'),
    (v_case_id, 'What emergency should you worry about if Horner''s is accompanied by neck pain?', '["Meningitis", "Carotid Artery Dissection", "None", "None"]', 1, 'This is a surgical emergency.');

    ---------------------------------------------------------------------------
    -- CASE 49: Brainstem Stroke - Wallenberg (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lateral Medullary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lateral Medullary', 'A patient has vertigo, difficulty swallowing (dysphagia), and loss of pain/temp on the left face but the right body.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has vertigo, difficulty swallowing (dysphagia), and loss of pain/temp on the left face but the right body.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this syndrome?', '["Locked-in", "Wallenberg (Lateral Medullary) Syndrome", "None", "None"]', 1, 'A classic brainstem stroke pattern.'),
    (v_case_id, 'Which artery is usually occluded?', '["MCA", "PICA (Posterior Inferior Cerebellar Artery)", "None", "None"]', 1, 'Or the vertebral artery.'),
    (v_case_id, 'Does Wallenberg cause limb weakness?', '["Yes", "No, it typically spares the corticospinal tracts", "None", "None"]', 1, 'The deficit is sensory and cranial nerve-based.');

    ---------------------------------------------------------------------------
    -- CASE 50: Functional Neurological Disorder (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Non-Organic Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Non-Organic Weakness', 'A patient presents with sudden "paralysis" after a stressful event. Their exam shows "Hoover''s sign."', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents with sudden "paralysis" after a stressful event. Their exam shows "Hoover''s sign."', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Hoover''s sign"?', '["Reflex", "Involuntary extension of the \"paralyzed\" leg when the other leg is flexed against resistance", "None", "None"]', 1, 'This demonstrates that the motor pathways are intact.'),
    (v_case_id, 'What was this formerly called?', '["Stroke", "Conversion Disorder", "None", "None"]', 1, 'Now referred to as Functional Neurological Disorder (FND).'),
    (v_case_id, 'Should you confront the patient aggressively?', '["Yes", "No, use a supportive, multidisciplinary approach", "None", "None"]', 1, 'These symptoms are real to the patient, even if they aren''t organic.');

    RAISE NOTICE 'SUCCESS: 50 Neurological Case Blocks registered.';
END $$;

COMMIT;
