-- Clinical Skills & Diagnostics: History Taking & Physical Examination - Part 2 (Cases 16-30)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: history-physical-exam

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'history-physical-exam' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'history-physical-exam';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 16: Deep Tendon Reflexes (DTR)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reflex Testing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reflex Testing', 'During a neurological exam, you test a patient''s patellar reflex. The knee extends briskly, and you notice a few beats of clonus.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During a neurological exam, you test a patient''s patellar reflex. The knee extends briskly, and you notice a few beats of clonus.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would you grade a reflex that is very brisk with clonus?', '["1+", "2+", "3+", "4+"]', 3, 'Reflex grading: 0=Absent; 1+=Diminished; 2+=Normal; 3+=Brisk; 4+=Very brisk/Clonus.'),
    (v_case_id, 'The patellar reflex primarily tests which spinal levels?', '["L1, L2", "L3, L4", "L5, S1", "S1, S2"]', 1, 'The "knee jerk" is mediated by the L3 and L4 spinal nerves.'),
    (v_case_id, 'Which maneuver can be used to augment reflexes if they are difficult to elicit?', '["Valsalva maneuver", "Jendrassik maneuver", "Allen''s test", "Phalen maneuver"]', 1, 'The Jendrassik maneuver (e.g., clenching teeth or hooking fingers) provides reinforcement by reducing descending inhibition.');

    ---------------------------------------------------------------------------
    -- CASE 17: Sensory Examination - Dermatomes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Numbness in the Hand' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Numbness in the Hand', 'A patient reports numbness and tingling in their pinky finger and the ulnar side of their ring finger.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient reports numbness and tingling in their pinky finger and the ulnar side of their ring finger.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which dermatome corresponds to the fifth digit (pinky finger)?', '["C5", "C6", "C7", "C8"]', 3, 'C6=Thumb; C7=Middle finger; C8=Pinky finger.'),
    (v_case_id, 'Which dermatome is located at the level of the umbilicus?', '["T4", "T7", "T10", "L1"]', 2, 'T4=Nipples; T10=Umbilicus; L1=Inguinal ligament.'),
    (v_case_id, 'Testing "vibration sense" and "position sense" (proprioception) primarily assesses which spinal tract?', '["Lateral spinothalamic tract", "Anterior spinothalamic tract", "Posterior columns (Dorsal columns)", "Corticospinal tract"]', 2, 'The dorsal columns carry vibration, proprioception, and fine touch.');

    ---------------------------------------------------------------------------
    -- CASE 18: Coordination and Gait
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unsteady Gait' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unsteady Gait', 'A 70-year-old man with a history of vitamin B12 deficiency presents with an unsteady gait. You ask him to stand with his feet together and eyes closed.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old man with a history of vitamin B12 deficiency presents with an unsteady gait. You ask him to stand with his feet together and eyes closed.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'He loses his balance when his eyes are closed. This is a positive:', '["Trendelenburg sign", "Romberg test", "Babinski sign", "Dix-Hallpike maneuver"]', 1, 'A positive Romberg test indicates a loss of proprioception (sensory ataxia), as the patient relies on vision to maintain balance.'),
    (v_case_id, 'Asking the patient to walk "heel-to-toe" in a straight line tests:', '["Tandem gait", "Steppage gait", "Antalgic gait", "Festinating gait"]', 0, 'Tandem gait is a sensitive test for cerebellar function and balance.'),
    (v_case_id, 'Rapidly alternating movements (e.g., tapping the palm then the back of the hand) test for:', '["Dysmetria", "Dysdiadochokinesia", "Ataxia", "Spasticity"]', 1, 'Dysdiadochokinesia is the inability to perform rapid alternating movements, typically seen in cerebellar disease.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Breast Examination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Routine Breast Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Routine Breast Screening', 'A 45-year-old woman presents for her annual physical exam. You perform a clinical breast examination.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman presents for her annual physical exam. You perform a clinical breast examination.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which is the preferred pattern for palpating the breast tissue?', '["Circular pattern", "Wedge pattern", "Vertical strip pattern", "Horizontal pattern"]', 2, 'The vertical strip pattern is considered the most thorough method for clinical breast exams.'),
    (v_case_id, 'Most breast cancers are found in which quadrant of the breast?', '["Upper inner", "Lower inner", "Upper outer", "Lower outer"]', 2, 'The upper outer quadrant (including the Tail of Spence) is the most common site for breast cancer.'),
    (v_case_id, 'Which maneuver is used to look for skin dimpling or retraction during inspection?', '["Patient lying flat", "Patient leaning forward or arms over head", "Patient holding their breath", "Patient coughing"]', 1, 'Leaning forward or raising arms stretches the suspensory ligaments; dimpling suggests an underlying mass/cancer.');

    ---------------------------------------------------------------------------
    -- CASE 20: Pediatric History - Developmental Milestones
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Well-Child Visit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Well-Child Visit', 'A mother brings in her 9-month-old infant. You are assessing the child''s developmental progress.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A mother brings in her 9-month-old infant. You are assessing the child''s developmental progress.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which milestone is expected for a 9-month-old?', '["Walking independently", "Pincer grasp", "Speaking in 2-word sentences", "Climbing stairs"]', 1, 'A pincer grasp (using thumb and index finger) typically develops around 9 months.'),
    (v_case_id, 'At what age should a child typically be able to "sit without support"?', '["2 months", "4 months", "6 months", "12 months"]', 2, 'Sitting unsupported is a 6-month milestone.'),
    (v_case_id, 'The "Moro reflex" (startle reflex) should disappear by what age?', '["2 months", "4-6 months", "1 year", "2 years"]', 1, 'The Moro reflex typically disappears by 4 to 6 months of age.');

    ---------------------------------------------------------------------------
    -- CASE 21: Geriatric Assessment - ADLs and IADLs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Functional Status' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Functional Status', 'An 85-year-old woman is being evaluated for a move to an assisted living facility. You assess her "Activities of Daily Living" (ADLs).', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old woman is being evaluated for a move to an assisted living facility. You assess her "Activities of Daily Living" (ADLs).', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is considered an Instrumental Activity of Daily Living (IADL)?', '["Bathing", "Dressing", "Managing finances", "Feeding oneself"]', 2, 'ADLs are basic self-care (DEATH: Dressing, Eating, Ambulating, Toileting, Hygiene). IADLs are complex skills (SHAFT: Shopping, Housekeeping, Accounting/Finances, Food prep, Telephoning/Transportation).'),
    (v_case_id, 'Which test is a quick screen for fall risk in the elderly?', '["Mini-Cog", "Timed Up and Go (TUG) test", "PHQ-9", "MMSE"]', 1, 'The TUG test assesses mobility and balance.'),
    (v_case_id, 'When assessing a geriatric patient, "polypharmacy" is generally defined as taking more than how many medications?', '["3", "5", "10", "15"]', 1, 'Polypharmacy is often defined as 5 or more daily medications.');

    ---------------------------------------------------------------------------
    -- CASE 22: Skin Examination - Melanoma Screening
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Changing Mole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Changing Mole', 'A 52-year-old fair-skinned man is concerned about a dark spot on his back that seems to be getting larger.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old fair-skinned man is concerned about a dark spot on his back that seems to be getting larger.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the ABCDE mnemonic for melanoma, what does "D" stand for?', '["Depth", "Diameter", "Dermal", "Darkness"]', 1, 'ABCDE: Asymmetry, Border irregularity, Color variegation, Diameter (>6mm), Evolution/Evolving.'),
    (v_case_id, 'Which of the following is the "E" in the current ABCDE criteria?', '["Elevation", "Evolving", "Exudate", "Erythema"]', 1, 'Evolution (change in size, shape, or color) is the most important clinical sign of melanoma.'),
    (v_case_id, 'A "pearly papule with telangiectasias" is most characteristic of:', '["Melanoma", "Squamous cell carcinoma", "Basal cell carcinoma", "Seborrheic keratosis"]', 2, 'Basal cell carcinoma is the most common skin cancer and typically presents this way.');

    ---------------------------------------------------------------------------
    -- CASE 23: Ear Examination - Weber and Rinne Tests
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hearing Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hearing Loss', 'A 60-year-old woman reports decreased hearing in her right ear. You use a 512 Hz tuning fork.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman reports decreased hearing in her right ear. You use a 512 Hz tuning fork.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The Weber test lateralizes to the right ear. The Rinne test shows Bone Conduction > Air Conduction (BC > AC) on the right. This indicates:', '["Right sensorineural hearing loss", "Right conductive hearing loss", "Left sensorineural hearing loss", "Left conductive hearing loss"]', 1, 'In conductive loss, Weber lateralizes to the BAD ear and Rinne is negative (BC > AC).'),
    (v_case_id, 'In sensorineural hearing loss, the Weber test lateralizes to:', '["The affected (bad) ear", "The unaffected (good) ear", "The midline", "Neither ear"]', 1, 'In sensorineural loss, Weber lateralizes to the GOOD ear.'),
    (v_case_id, 'What is the normal result for a Rinne test?', '["BC > AC", "AC > BC", "BC = AC", "No sound heard"]', 1, 'Normally, Air Conduction (AC) is twice as long as Bone Conduction (BC).');

    ---------------------------------------------------------------------------
    -- CASE 24: Radiology Basics - The 5 Densities
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Interpreting a Chest X-ray' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Interpreting a Chest X-ray', 'You are reviewing a chest X-ray and need to identify different structures based on their radiographic density.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are reviewing a chest X-ray and need to identify different structures based on their radiographic density.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following appears most "radiolucent" (blackest) on an X-ray?', '["Bone", "Fat", "Air", "Water/Soft tissue"]', 2, 'Air is the least dense and appears blackest.'),
    (v_case_id, 'Radiographically, blood, muscle, and liver all have the same density as:', '["Fat", "Bone", "Water", "Air"]', 2, 'Soft tissues and fluids all appear as "water density" (grey) on X-ray.'),
    (v_case_id, 'Loss of a normal interface (border) between two structures of similar density is known as:', '["The Silhouette Sign", "The Air Bronchogram", "The Golden S sign", "The Westermark sign"]', 0, 'The Silhouette Sign helps localize pathology (e.g., if the right heart border is lost, the pneumonia is in the Right Middle Lobe).');

    ---------------------------------------------------------------------------
    -- CASE 25: Medical Documentation - SOAP Notes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Writing the Daily Note' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Writing the Daily Note', 'As a medical student on the wards, you are writing a progress note for a patient admitted with pneumonia.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'As a medical student on the wards, you are writing a progress note for a patient admitted with pneumonia.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Under which section of the SOAP note should the patient''s current vital signs be recorded?', '["Subjective", "Objective", "Assessment", "Plan"]', 1, 'Objective (O) includes physical exam findings, vitals, and lab/imaging results.'),
    (v_case_id, 'Where should the patient''s self-reported pain level be documented?', '["Subjective", "Objective", "Assessment", "Plan"]', 0, 'Subjective (S) includes the HPI, ROS, and what the patient tells you.'),
    (v_case_id, 'The "Assessment" (A) portion of the note should primarily include:', '["A list of medications", "The differential diagnosis and summary of the patient''s status", "The plan for discharge", "The physical exam findings"]', 1, 'Assessment is the synthesis of the S and O data into a diagnosis and status update.');

    ---------------------------------------------------------------------------
    -- CASE 26: Ethics - Informed Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Preparing for Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Preparing for Surgery', 'A 60-year-old man is scheduled for an elective cholecystectomy. You are tasked with obtaining informed consent.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old man is scheduled for an elective cholecystectomy. You are tasked with obtaining informed consent.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is NOT a required element of informed consent?', '["Risks of the procedure", "Benefits of the procedure", "Alternatives (including no treatment)", "The cost of the procedure to the hospital"]', 3, 'Consent requires explaining the nature of the procedure, risks, benefits, and alternatives.'),
    (v_case_id, 'If a patient is incapacitated and has no healthcare proxy or family, who usually makes medical decisions in a non-emergency?', '["The attending physician alone", "The hospital administrator", "Two physicians not involved in the case (or a court-appointed guardian)", "The medical student"]', 2, 'Ethics/legal protocols vary, but usually require independent physician sign-off or a legal guardian for non-emergencies.'),
    (v_case_id, 'In an emergency where the patient is unconscious and no family is available, consent is:', '["Waived", "Implied", "Requested from the police", "Delayed until the patient wakes"]', 1, 'Implied consent allows life-saving treatment in emergencies when the patient cannot provide it.');

    ---------------------------------------------------------------------------
    -- CASE 27: Emergency Assessment - The ABCDE Approach
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unresponsive Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unresponsive Patient', 'You are called to the room of a patient who was just found unresponsive by nursing staff.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are called to the room of a patient who was just found unresponsive by nursing staff.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the ABCDE assessment, what is the first priority?', '["Breathing", "Circulation", "Airway", "Disability"]', 2, 'Airway is always the first priority in an acute assessment.'),
    (v_case_id, 'Assessing "Circulation" (C) in an acute setting involves checking:', '["Blood glucose", "Capillary refill, pulse, and blood pressure", "Pupillary response", "Lung sounds"]', 1, 'Circulation focuses on perfusion and hemodynamic stability.'),
    (v_case_id, 'The "D" in ABCDE (Disability) primarily refers to:', '["Physical handicap", "Neurological status/level of consciousness", "Drug allergies", "Dietary restrictions"]', 1, 'Disability focuses on GCS, pupils, and basic neuro status.');

    ---------------------------------------------------------------------------
    -- CASE 28: Male Genitalia - Assessing Hernias
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Groin Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Groin Swelling', 'A 25-year-old man reports a bulge in his groin that appears when he lifts heavy objects.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old man reports a bulge in his groin that appears when he lifts heavy objects.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'You palpate the inguinal canal and feel a bulge hit the TIP of your finger during a cough. This is most likely:', '["Direct inguinal hernia", "Indirect inguinal hernia", "Femoral hernia", "Hydrocele"]', 1, 'Indirect hernias travel through the internal ring and hit the fingertip. Direct hernias hit the side of the finger.'),
    (v_case_id, 'Which hernia is more common in females and has a high risk of strangulation?', '["Indirect inguinal", "Direct inguinal", "Femoral", "Umbilical"]', 2, 'Femoral hernias are more common in women and pass through the femoral canal.'),
    (v_case_id, 'A collection of fluid in the tunica vaginalis that transilluminates is a:', '["Varicocele", "Spermatocele", "Hydrocele", "Epididymitis"]', 2, 'Hydroceles transilluminate brightly; solid masses (like tumors) do not.');

    ---------------------------------------------------------------------------
    -- CASE 29: Female Genitalia - The Bimanual Exam
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvic Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvic Pain', 'A 24-year-old woman presents with pelvic pain and vaginal discharge. You perform a pelvic examination.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman presents with pelvic pain and vaginal discharge. You perform a pelvic examination.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'During the bimanual exam, you move the cervix from side to side, and the patient winces in pain. This is:', '["Murphy''s sign", "Chandelier sign (Cervical motion tenderness)", "Hegar''s sign", "Chadwick''s sign"]', 1, 'Cervical motion tenderness (Chandelier sign) is a classic finding in Pelvic Inflammatory Disease (PID).'),
    (v_case_id, 'What are you primarily assessing when palpating the adnexa?', '["The bladder", "The ovaries and fallopian tubes", "The uterus only", "The rectum"]', 1, 'Adnexal examination targets the ovaries and fallopian tubes.'),
    (v_case_id, 'Which instrument is used to visualize the cervix during a speculum exam?', '["Otoscope", "Ophthalmoscope", "Graves or Pederson speculum", "Laryngoscope"]', 2, 'Graves (wider) or Pederson (narrower) specula are standard for pelvic exams.');

    ---------------------------------------------------------------------------
    -- CASE 30: Hand Examination - Carpal Tunnel Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Numbness in the Thumb and Index Finger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Numbness in the Thumb and Index Finger', 'A 40-year-old office worker reports numbness in her thumb, index, and middle fingers, worse at night.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old office worker reports numbness in her thumb, index, and middle fingers, worse at night.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Tapping over the median nerve at the wrist produces tingling. This is a positive:', '["Phalen''s test", "Tinel''s sign", "Finkelstein''s test", "Allen''s test"]', 1, 'Tinel''s sign is percussion over the nerve to elicit paresthesias.'),
    (v_case_id, 'Holding the wrists in full flexion for 60 seconds reproduces symptoms. This is:', '["Phalen''s test", "Tinel''s sign", "McMurray test", "Lachman test"]', 0, 'Phalen''s test is highly suggestive of Carpal Tunnel Syndrome.'),
    (v_case_id, 'The median nerve provides sensation to which part of the hand?', '["Pinky finger", "Thumb, index, middle, and radial half of the ring finger", "Dorsum of the hand only", "The entire palm"]', 1, 'The median nerve territory includes the first three and a half digits.');

END $$;

COMMIT;
