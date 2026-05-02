BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Child Abuse Recognition
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-child-abuse" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Mandated Reporting (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Legal Duty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Legal Duty', 'A physician suspects a child''s injury was non-accidental but is not 100% certain and fears a lawsuit from the parents.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Legal Duty', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the legal threshold for a mandated reporter to notify authorities?', '["Proof beyond a reasonable doubt", "Reasonable suspicion", "Witnessing the act", "None"]', 1, 'Physicians are legally required to report when they have a reasonable suspicion of abuse; they do not need proof.'),
    (v_case_id, 'Are mandated reporters protected from civil or criminal liability if they report in good faith?', '["No", "Yes, in almost all jurisdictions", "Only if they are right", "None"]', 1, 'Laws provide immunity for reporters to encourage the protection of children.'),
    (v_case_id, 'Should you confront the parents with your suspicion before reporting?', '["Yes", "No, it is the role of investigators to interview and it may endanger the child", "Always", "None"]', 1, 'Reporting should be done through official channels without jeopardizing the forensic investigation or child safety.');

    ---------------------------------------------------------------------------
    -- CASE 02: Classic Metaphyseal Lesion - CML (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Corner Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Corner Fracture', 'An 4-month-old infant is found to have a small chip of bone at the edge of the distal femur on a skeletal survey.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Corner Fracture', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical significance of a Classic Metaphyseal Lesion (CML)?', '["It is a common sports injury", "It is highly specific for child abuse (Non-Accidental Trauma)", "It is a normal growth plate", "None"]', 1, 'CMLs (corner or bucket-handle fractures) are caused by shearing forces on the growth plate, usually from shaking or pulling/twisting limbs.'),
    (v_case_id, 'What is the mechanism of injury for a CML?', '["A fall from a couch", "Shearing or torsional force (shaking/flailing)", "Bacterial infection", "None"]', 1, 'These are rare in accidental trauma even in severe accidents.'),
    (v_case_id, 'What is the standard imaging workup for suspected abuse in a child < 2 years old?', '["Single X-ray", "Full Skeletal Survey (approx. 20 views)", "Ultrasound", "None"]', 1, 'A skeletal survey is mandatory to look for occult fractures.');

    ---------------------------------------------------------------------------
    -- CASE 03: Posterior Rib Fractures (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chest Wall Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chest Wall Injury', 'X-rays of a 6-month-old reveal multiple posterior rib fractures near the spine.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chest Wall Injury', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are posterior rib fractures highly suspicious for abuse?', '["Babies have weak ribs", "They are caused by squeezing the chest with hands, which leverages the rib against the transverse process", "They happen during CPR", "None"]', 1, 'Accidental falls rarely cause posterior rib fractures.'),
    (v_case_id, 'Can standard CPR cause posterior rib fractures in infants?', '["Yes, frequently", "No, CPR usually causes anterior or lateral fractures if any", "Only in boys", "None"]', 1, 'CPR is a very rare cause of rib fractures in infants, and almost never posterior ones.'),
    (v_case_id, 'What is the next step if rib fractures of different ages (callus formation) are found?', '["Wait", "Urgent report to CPS/Authorities and admission for safety", "Vitamin D test only", "None"]', 1, 'Multiple injuries in different stages of healing indicate chronic/repetitive abuse.');

    ---------------------------------------------------------------------------
    -- CASE 04: Abusive Head Trauma - Shaken Baby (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shaken Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shaken Infant', 'A 3-month-old presents with lethargy, a bulging fontanelle, and vomiting after the father said the baby \"just stopped breathing\".', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shaken Infant', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad seen in Abusive Head Trauma (AHT)?', '["Fever, Rash, Cough", "Subdural hemorrhage, Retinal hemorrhage, and Encephalopathy", "Fracture, Bruise, Burn", "None"]', 1, 'This triad is highly indicative of rotational acceleration-deceleration injury.'),
    (v_case_id, 'What type of retinal hemorrhage is most associated with AHT?', '["Single flame hemorrhage", "Extensive, multilayered hemorrhages reaching the periphery", "None", "None"]', 1, 'Extensive hemorrhages in multiple layers of the retina are pathognomonic for severe acceleration-deceleration force.'),
    (v_case_id, 'What imaging is the first-line for acute AHT diagnosis?', '["MRI", "Non-contrast Head CT", "X-ray", "None"]', 1, 'CT is faster and better at detecting acute intracranial hemorrhage.');

    ---------------------------------------------------------------------------
    -- CASE 05: Bruising Patterns (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Where are the Bruises?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Where are the Bruises?', 'An 8-month-old who is not yet cruising has bruises on his ear and his back.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Where are the Bruises?', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Those who don''t cruise, don''t bruise\" rule?', '["Bruises are always normal", "Bruises in non-ambulatory infants are rare (< 1%) and highly suspicious for abuse", "Babies bruise easily", "None"]', 1, 'Infants who cannot yet pull to a stand or walk should not have bruises from daily activities.'),
    (v_case_id, 'What locations for bruises are suspicious even in older children?', '["Shins and forehead", "Ears, neck, torso, and buttocks", "Knees", "None"]', 1, 'Accidental bruises usually occur over bony prominences (shins, forehead). Soft tissue areas are suspicious.'),
    (v_case_id, 'Can you accurately date a bruise based on its color?', '["Yes", "No, color changes vary significantly and are not reliable for forensic dating", "Always", "None"]', 1, 'Scientific studies show that visual dating of bruises by color is highly inaccurate.');

    ---------------------------------------------------------------------------
    -- CASE 06: Immersion Burns (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hot Water Injuries' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hot Water Injuries', 'A child has burns on both feet that end in a sharp line at the ankles, with sparing of the skin in the deep creases of the groin.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hot Water Injuries', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this burn pattern?', '["Splash burn", "Glove-and-stocking immersion burn", "Sunburn", "None"]', 1, 'This suggests the child was held down in hot water.'),
    (v_case_id, 'Why is the sparing of skin creases (the \"zebra sign\") significant?', '["It is a birthmark", "It indicates the child was flexed/huddled during immersion", "It is an allergy", "None"]', 1, 'Creases are protected from the water when the joints are flexed, which occurs when a child is forced into a tub.'),
    (v_case_id, 'How do accidental splash burns differ from immersion burns?', '["They are more severe", "They have irregular borders and \"satellite\" droplets", "They are symmetrical", "None"]', 1, 'Accidental spills create irregular, asymmetrical patterns with drip marks.');

    ---------------------------------------------------------------------------
    -- CASE 07: Cigarette Burns (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Circular Lesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Circular Lesions', 'A child has multiple 8mm, perfectly circular, deep burns on the palms of his hands.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Circular Lesions', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause?', '["Impetigo", "Cigarette burns", "Chickenpox", "None"]', 1, 'Circular, uniform, punched-out lesions are characteristic of deliberate burns from a cigarette.'),
    (v_case_id, 'What skin infection can mimic cigarette burns?', '["Eczema", "Bullous Impetigo (Ecthyma)", "Warts", "None"]', 1, 'Ecthyma can cause punched-out ulcers but is usually accompanied by other signs of infection.'),
    (v_case_id, 'Are accidental cigarette burns common in children?', '["Yes", "No, they are usually single and shallow \"brush\" marks if accidental", "Always", "None"]', 1, 'Multiple, deep circular burns are rarely accidental.');

    ---------------------------------------------------------------------------
    -- CASE 08: Differential Diagnosis - Mongolian Spots (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blue-Gray Patches' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blue-Gray Patches', 'An Asian infant has large, flat, blue-gray patches on the lower back and buttocks since birth.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Blue-Gray Patches', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the correct term for these lesions?', '["Bruises", "Congenital Dermal Melanocytosis (Mongolian Spots)", "HSP", "None"]', 1, 'These are normal birthmarks common in infants of color.'),
    (v_case_id, 'How do you distinguish these from bruises?', '["They are painful", "They have stable color over time, no swelling, and are present from birth", "They turn yellow", "None"]', 1, 'Mongolian spots do not change color rapidly like healing bruises.'),
    (v_case_id, 'Should Mongolian spots be reported as abuse?', '["Yes", "No, they are benign and normal", "Only if large", "None"]', 1, 'Recognition is important to avoid false accusations.');

    ---------------------------------------------------------------------------
    -- CASE 09: Osteogenesis Imperfecta - OI (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Brittle Bones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Brittle Bones', 'A child with multiple fractures is noted to have blue sclerae.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Brittle Bones', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Abuse", "Osteogenesis Imperfecta (OI)", "Rickets", "None"]', 1, 'OI is a major differential for multiple fractures.'),
    (v_case_id, 'Does a diagnosis of OI rule out the possibility of child abuse?', '["Yes", "No, children with chronic conditions are actually at higher risk for abuse", "Always", "None"]', 1, 'Both can coexist, and the workup must be objective.'),
    (v_case_id, 'What is the defect in OI?', '["Vitamin D", "Type I Collagen mutation", "Calcium", "None"]', 1, 'The bone matrix is weak due to abnormal collagen.');

    ---------------------------------------------------------------------------
    -- CASE 10: Cultural Practices - Coining (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Red Linear Marks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Red Linear Marks', 'A Vietnamese child has symmetrical red linear marks on his back after a fever.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Red Linear Marks', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause?', '["Belt whipping", "Cao Gio (Coining)", "Shingles", "None"]', 1, 'Coining is a traditional healing practice used to \"release wind\" during illness.'),
    (v_case_id, 'How do you distinguish Coining from physical abuse?', '["It is more painful", "The marks are symmetrical, follow rib lines, and the parents openly describe the practice", "None", "None"]', 1, 'The intent is therapeutic, not harmful.'),
    (v_case_id, 'What should the physician do in this case?', '["Report for abuse", "Educate the family on safety and provide reassurance, but it is not usually considered abuse", "Police report", "None"]', 1, 'Cultural competence is required; unless the child is injured severely, it is not abuse.');

    ---------------------------------------------------------------------------
    -- CASE 11: Mandated Reporting - The \"Friend\" (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Social Connections' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Social Connections', 'A physician suspects abuse in the child of a personal friend or a high-profile community member.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Social Connections', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does the status or relationship of the parent change the reporting duty?', '["Yes", "No, mandated reporting is blind to social or professional status", "Maybe", "None"]', 1, 'Abuse occurs across all socioeconomic levels.'),
    (v_case_id, 'What is the danger of assuming a \"nice family\" wouldn''t commit abuse?', '["None", "Implicit bias can lead to missed diagnoses and fatal outcomes", "It is polite", "None"]', 1, 'Assumptions can be deadly for the child.'),
    (v_case_id, 'What should you do if you are unsure if a finding is suspicious enough to report?', '["Wait for more bruises", "Consult a Child Abuse Pediatrician or a specialized multidisciplinary team", "Forget it", "None"]', 1, 'Expert consultation is better than ignoring a subtle sign.');

    ---------------------------------------------------------------------------
    -- CASE 12: Factitious Disorder Imposed on Another (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medical Child Abuse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medical Child Abuse', 'A mother brings her child to the ER for the 10th time this month, claiming the child is having seizures that only she witnesses.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Medical Child Abuse', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this condition?', '["Hypochondriasis", "Factitious Disorder Imposed on Another (Munchausen by Proxy)", "Malingering", "None"]', 1, 'A caregiver fabricates or induces symptoms in a child to meet their own psychological needs.'),
    (v_case_id, 'What is a common clinical red flag for this condition?', '["The child is always sick", "Symptoms only occur when the caregiver is present and resolve when the child is separated", "The mother is a doctor", "None"]', 1, 'Separation from the suspect caregiver often leads to a \"miraculous\" recovery.'),
    (v_case_id, 'What is the physician''s primary responsibility in this case?', '["Confront the mother", "Ensure child safety and report to authorities, as this is a form of abuse", "Refer to psych", "None"]', 1, 'This is a dangerous form of child abuse that can lead to invasive, unnecessary medical procedures.');

    ---------------------------------------------------------------------------
    -- CASE 13: Nutritional Neglect (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Failure to Thrive' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Failure to Thrive', 'A 4-month-old is below the 1st percentile for weight but has a normal birth weight and no chronic illnesses.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Failure to Thrive', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for poor weight gain due to environmental/social factors?', '["Organic FTT", "Non-organic Failure to Thrive (Neglect)", "Celiac", "None"]', 1, 'Most cases of FTT in infancy are non-organic.'),
    (v_case_id, 'What is a common sign of nutritional neglect in an infant?', '["Large head", "Prominent ribs, wasted buttocks, and ravenous appetite when fed by others", "Rash", "None"]', 1, 'If the child gains weight in the hospital under nursery care, the diagnosis of neglect is confirmed.'),
    (v_case_id, 'Is poverty the same as neglect?', '["Yes", "No, neglect requires that resources were available but not provided, or that assistance was not sought", "Always", "None"]', 1, 'Financial hardship alone is not neglect; failure to use available resources (WIC, food banks) may be.');

    ---------------------------------------------------------------------------
    -- CASE 14: Medical Neglect (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Missed Appointments' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Missed Appointments', 'A child with Type 1 Diabetes is admitted in DKA for the 4th time. The parents have not filled the insulin prescription for 3 months.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Missed Appointments', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classification of this situation?', '["Medical Neglect", "Bad luck", "Educational neglect", "None"]', 0, 'Failure to provide necessary medical care that places the child at risk is neglect.'),
    (v_case_id, 'Does a parent''s religious belief exempt them from providing life-saving care to a child?', '["Yes", "No, the state''s interest in protecting the child overrides parental religious freedom in life-threatening cases", "Always", "None"]', 1, 'Courts can order life-saving treatment against parental wishes.'),
    (v_case_id, 'What should the medical team do first?', '["Call the police", "Social work consult to identify barriers to care (e.g., cost, transport, understanding)", "Discharge", "None"]', 1, 'Initial steps focus on removing barriers, but persistent failure to provide care must be reported.');

    ---------------------------------------------------------------------------
    -- CASE 15: Sexual Abuse - STIs (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infections in Children' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infections in Children', 'A 5-year-old girl is found to have a vaginal discharge and a culture positive for Neisseria gonorrhoeae.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infections in Children', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a prepubertal child, what is the clinical significance of a Gonorrhea or Syphilis infection?', '["It was from a toilet seat", "It is diagnostic of sexual abuse until proven otherwise", "It is an allergy", "None"]', 1, 'These infections are essentially always sexually transmitted in this age group.'),
    (v_case_id, 'What about Chlamydia in a child > 3 years old?', '["Normal", "Also highly indicative of sexual abuse", "From the pool", "None"]', 1, 'Perinatal transmission should have cleared by this age.'),
    (v_case_id, 'Are genital warts (HPV) always diagnostic of abuse?', '["Yes", "No, they can be transmitted perinatally or via non-sexual contact (auto-inoculation)", "Never", "None"]', 1, 'HPV is less specific for abuse than Gonorrhea or Syphilis but still warrants evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 16: Sexual Abuse - The Disclosure (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Child Speaks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Child Speaks', 'During a checkup, a 7-year-old says, \"My uncle touches my private parts.\" ', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A Child Speaks', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should the physician do immediately?', '["Cross-examine the child", "Listen supportively, use open-ended questions, and document the child''s EXACT words", "Call the uncle", "None"]', 1, 'Do not perform a forensic interview yourself; just gather enough to report.'),
    (v_case_id, 'Is a normal physical exam common in children who have been sexually abused?', '["No", "Yes, the physical exam is normal in up to 90% of confirmed cases", "Never", "None"]', 1, 'Most sexual abuse does not leave permanent physical trauma.'),
    (v_case_id, 'What is the risk of using leading questions with a child?', '["None", "It can contaminate the child''s memory and make the testimony inadmissible", "It helps", "None"]', 1, 'Forensic interviews are conducted by trained professionals for this reason.');

    ---------------------------------------------------------------------------
    -- CASE 17: Skeletal Survey Indications (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Occult Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Occult Trauma', 'A 10-month-old has a suspicious bruise on his thigh.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Occult Trauma', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is a skeletal survey indicated for a single suspicious bruise in an infant?', '["No", "Yes, for any high suspicion of abuse in a child < 2 years", "Only if it hurts", "None"]', 1, 'Hidden fractures are common in physically abused infants.'),
    (v_case_id, 'What is the recommended age limit for a routine skeletal survey in suspected abuse?', '["Under 1 year", "Under 2 years (standard), consider up to 5 years", "Any age", "None"]', 1, 'After age 5, children are usually vocal enough to identify where they are hurt.'),
    (v_case_id, 'Should you repeat the skeletal survey if the first one is negative?', '["No", "Yes, in 2 weeks (follow-up survey) to look for new callus formation", "Wait", "None"]', 1, 'Some fractures only become visible once they start to heal.');

    ---------------------------------------------------------------------------
    -- CASE 18: Abdominal Trauma (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal Injuries' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal Injuries', 'A toddler presents with severe abdominal pain and distention. There are no bruises on the belly.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Internal Injuries', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can a child have severe internal organ damage without external bruising?', '["No", "Yes, the pliable abdominal wall can transmit force to internal organs without bruising", "Never", "None"]', 1, 'Lack of a bruise does NOT rule out blunt force trauma.'),
    (v_case_id, 'What is a common internal injury from a punch or kick to the abdomen in a child?', '["Liver laceration", "Duodenal hematoma or Pancreatic transection", "Appendicitis", "None"]', 1, 'Blunt trauma can compress organs against the spine.'),
    (v_case_id, 'What lab test can screen for occult abdominal trauma?', '["WBC", "AST/ALT (Liver enzymes) and Amylase/Lipase", "Sugar", "None"]', 1, 'Elevated liver enzymes or lipase in a child with no history of accident is highly suspicious.');

    ---------------------------------------------------------------------------
    -- CASE 19: Evaluation of Siblings (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Home Environment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Home Environment', 'A child is admitted for confirmed physical abuse. He has a 2-year-old sister at home.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Home Environment', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the requirement for evaluating the sibling?', '["Wait and see", "The sibling must be medically evaluated and likely needs a skeletal survey if < 2 years", "Nothing", "None"]', 1, 'Abuse is often directed at multiple children in the home.'),
    (v_case_id, 'What percentage of siblings of abused children are found to have occult injuries?', '["0%", "Approximately 10-20%", "100%", "None"]', 1, 'This highlights the need for systematic screening.'),
    (v_case_id, 'If the sibling seems happy and healthy, do you still report?', '["No", "Yes, the report is for the *household* safety", "Maybe", "None"]', 1, 'The safety of all children in the home is at risk.');

    ---------------------------------------------------------------------------
    -- CASE 20: Intimate Partner Violence - IPV (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Domestic Violence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Domestic Violence', 'A mother comes in with a bruised eye, and her child is noted to be very withdrawn and fearful.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Domestic Violence', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is witnessing domestic violence considered a form of child abuse/neglect?', '["No", "Yes, it is psychological abuse and a major risk factor for physical abuse of the child", "Only if the child is hit", "None"]', 1, 'Exposure to violence in the home is a significant ACE (Adverse Childhood Experience).'),
    (v_case_id, 'What is the overlap between IPV and direct child physical abuse?', '["0%", "30-60%", "100%", "None"]', 1, 'In homes where the mother is hit, the children are frequently hit as well.'),
    (v_case_id, 'What is the safest way to screen the mother for IPV?', '["In front of the father", "In private, away from the partner and children", "Don''t ask", "None"]', 1, 'Privacy is essential for safety and disclosure.');

    ---------------------------------------------------------------------------
    -- CASE 21: Delayed Presentation (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Timing of Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Timing of Care', 'A child is brought in for a severe arm deformity (fracture). The parents say he fell 3 days ago.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Timing of Care', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a delay in seeking medical care for a major injury suspicious?', '["Parents are busy", "It suggests a lack of supervision or an attempt to hide the injury", "It is normal", "None"]', 1, 'Accidental severe fractures are usually so painful that parents seek care immediately.'),
    (v_case_id, 'Does delay in care constitute neglect or abuse?', '["Neglect only", "Both are possible", "Neither", "None"]', 1, 'Failure to seek care for a serious injury is a form of medical neglect.'),
    (v_case_id, 'What is the term for a story that changes over time or between different caregivers?', '["Flexible history", "Inconsistent history", "Forgetfulness", "None"]', 1, 'Inconsistency is a major red flag for non-accidental trauma.');

    ---------------------------------------------------------------------------
    -- CASE 22: Phytophotodermatitis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Limes and Sun' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Limes and Sun', 'A child has hyperpigmented hand-print marks on his legs after a day at a picnic.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Limes and Sun', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this skin reaction called?', '["Abuse", "Phytophotodermatitis", "Eczema", "None"]', 1, 'Exposure to furocoumarins (in limes, celery) plus sunlight causes a phototoxic reaction that mimics bruises.'),
    (v_case_id, 'How do you distinguish this from child abuse?', '["History of outdoor activity/citrus and the lack of pain/tenderness", "It is green", "It never fades", "None"]', 0, 'The marks are often dripping or hand-shaped but are not tender.'),
    (v_case_id, 'Is this a common mimic of physical abuse?', '["No", "Yes, it is a classic board-review differential for suspicious skin marks", "Only in winter", "None"]', 1, 'Awareness prevents a false report.');

    ---------------------------------------------------------------------------
    -- CASE 23: Coagulopathy vs. Abuse (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bleeding Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bleeding Child', 'A child has multiple bruises. The parents claim they \"just appear.\" ', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bleeding Child', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What labs should be checked to rule out a medical cause for bruising?', '["CBC, PT, PTT, and possibly vWF studies", "Sugar", "Thyroid", "None"]', 0, 'Blood disorders like Hemophilia or von Willebrand disease must be ruled out.'),
    (v_case_id, 'If a child has a mild bleeding disorder, can they still be a victim of abuse?', '["No", "Yes", "Always", "None"]', 1, 'Medical conditions do not protect against abuse.'),
    (v_case_id, 'What is the most common bleeding disorder in children?', '["Hemophilia A", "von Willebrand Disease", "ITP", "None"]', 1, 'vWD is very common and can cause easy bruising.');

    ---------------------------------------------------------------------------
    -- CASE 24: Scurvy Mimic (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vitamin C Deficiency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vitamin C Deficiency', 'A child on a very restricted diet (no fruit/veg) has swollen, bleeding gums and subperiosteal hemorrhages on X-ray.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vitamin C Deficiency', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Abuse", "Scurvy", "Leukemia", "None"]', 1, 'Scurvy causes fragile vessels and bone pain, mimicking trauma.'),
    (v_case_id, 'Is this condition still seen today?', '["No", "Yes, in children with severe dietary restrictions or autism with sensory feeding issues", "Only in pirates", "None"]', 1, 'Nutritional deficiencies must be considered in growth failure and easy bleeding.'),
    (v_case_id, 'What is the treatment?', '["Surgery", "Vitamin C supplementation and dietary modification", "Cast", "None"]', 1, 'Symptoms resolve quickly with replacement.');

    ---------------------------------------------------------------------------
    -- CASE 25: Human Trafficking (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hidden Danger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hidden Danger', 'A 15-year-old girl is brought in for a recurrent STI. She is accompanied by an older man who refuses to leave the room.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hidden Danger', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should the clinician suspect?', '["Nothing", "Human Trafficking / Commercial Sexual Exploitation", "Strict parenting", "None"]', 1, 'An overly controlling companion and recurrent STIs are major red flags.'),
    (v_case_id, 'What is the priority in the exam?', '["Calling the police immediately", "Interviewing the patient alone to establish safety and trust", "None", "None"]', 1, 'Finding a way to speak with the patient privately is critical for disclosure.'),
    (v_case_id, 'Is human trafficking only an issue for foreign nationals?', '["Yes", "No, domestic trafficking of US citizens is a widespread problem", "Only in big cities", "None"]', 1, 'Any child can be a victim regardless of background.');

    ---------------------------------------------------------------------------
    -- CASE 26: Toddler''s Fracture - Accidental (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spiral Tibia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spiral Tibia', 'A 2-year-old was running, tripped, and now refuses to bear weight. X-ray shows a non-displaced spiral fracture of the distal tibia.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Spiral Tibia', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this \"Toddler''s Fracture\" usually accidental or abusive?', '["Abusive", "Accidental", "Always both", "None"]', 1, 'A spiral fracture of the *tibia* in a *walking* child from a minor trip is a common accidental injury.'),
    (v_case_id, 'In which group is a spiral fracture highly suspicious for abuse?', '["Walking toddlers", "Non-ambulatory infants (under 1 year)", "Teens", "None"]', 1, 'If the child can''t walk, they can''t create the torque needed for a spiral fracture accidentally.'),
    (v_case_id, 'What is the characteristic clinical presentation of a Toddler''s fracture?', '["Severe swelling", "Refusal to bear weight with minimal outward signs of trauma", "Fever", "None"]', 1, 'The fracture is often subtle and may even be missed on the first X-ray.');

    ---------------------------------------------------------------------------
    -- CASE 27: Intestinal Perforation (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Abdominal Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Abdominal Emergency', 'A child presents in shock with free air under the diaphragm on X-ray.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Abdominal Emergency', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the second leading cause of death from child abuse after head trauma?', '["Burns", "Abdominal trauma", "Neglect", "None"]', 1, 'Blunt force to the abdomen is often fatal due to internal bleeding or peritonitis.'),
    (v_case_id, 'What organ is often injured in a child hit in the stomach?', '["Lungs", "Liver, Spleen, or Duodenum", "Heart", "None"]', 1, 'Solid organ lacerations are common in severe physical abuse.'),
    (v_case_id, 'Should you wait for a positive history of trauma to treat this as an emergency?', '["Yes", "No, treat the surgical emergency immediately and report suspicion simultaneously", "None", "None"]', 1, 'Medical stability is the first priority.');

    ---------------------------------------------------------------------------
    -- CASE 28: Forensic Documentation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clear Records' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clear Records', 'A physician is documenting a case of suspected child abuse.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clear Records', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best way to document injuries?', '["General summary", "Photographs with a scale/ruler and detailed written descriptions of size, shape, and color", "Memory", "None"]', 1, 'Detailed, objective evidence is vital for legal proceedings.'),
    (v_case_id, 'Should you use judgment-loaded terms like \"the abusive father said\" in the chart?', '["Yes", "No, use objective language like \"The father reported that...\"", "Maybe", "None"]', 1, 'Medical records should stick to facts and direct quotes.'),
    (v_case_id, 'Why is drawing the location of injuries on a body map useful?', '["It''s art", "It provides a clear visual summary for investigators and courts", "None", "None"]', 1, 'Body diagrams are standard in forensic documentation.');

    ---------------------------------------------------------------------------
    -- CASE 29: Supervision Neglect (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Home Alone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Home Alone', 'A 4-year-old is brought to the ER after drinking bleach. It is discovered she was left alone while the parent went to a party.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Home Alone', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this constitute neglect?', '["No, kids are curious", "Yes, supervision neglect (failure to provide adequate protection)", "Only if she dies", "None"]', 1, 'Leaving a young child unsupervised is a form of neglect.'),
    (v_case_id, 'What is the age at which a child can be left home alone?', '["5 years", "Varies by law, but generally not before age 10-12 and depending on maturity", "15 years", "None"]', 1, 'Most states have guidelines or laws regarding minimum ages.'),
    (v_case_id, 'What is the leading cause of accidental death in unsupervised toddlers?', '["Bleach", "Drowning or Choking", "Falls", "None"]', 1, 'Water safety is a major concern in neglect cases.');

    ---------------------------------------------------------------------------
    -- CASE 30: Intoxications as Abuse (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sleepy Toddler' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sleepy Toddler', 'A 2-year-old is brought in very lethargic. Toxicology screen is positive for Methadone, which is not prescribed to anyone in the home.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sleepy Toddler', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is an accidental ingestion of a street drug considered neglect?', '["No", "Yes, failure to maintain a safe environment", "Maybe", "None"]', 1, 'Exposing a child to illegal substances or unsecured dangerous meds is neglect.'),
    (v_case_id, 'What is \"Malicious Poisoning\"?', '["Accident", "Deliberately administering substances to a child to cause harm or sedation", "Cooking", "None"]', 1, 'This is a form of physical abuse.'),
    (v_case_id, 'What should you do for any child with an unexplained altered mental status?', '["Wait for them to wake up", "Obtain a comprehensive toxicology screen", "Give juice", "None"]', 1, 'Toxicology is a vital part of the workup for altered mental status.');

    ---------------------------------------------------------------------------
    -- CASE 31: Bone Age vs. Healing (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Healing Callus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Healing Callus', 'An X-ray shows a rib fracture with a thick, well-formed bony callus.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Healing Callus', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Approximately how old is a fracture with a visible callus?', '["1 day", "At least 10-14 days", "1 year", "None"]', 1, 'Callus formation indicates the injury happened weeks ago.'),
    (v_case_id, 'What if the parents say the injury happened yesterday?', '["They are right", "This is an inconsistent history and a major red flag for abuse", "Maybe", "None"]', 1, 'The radiographic evidence contradicts the provided history.'),
    (v_case_id, 'What is the significance of seeing fractures in multiple stages of healing?', '["Strong bones", "Evidence of chronic, repetitive abuse", "Normal", "None"]', 1, 'It proves the trauma was not a single isolated event.');

    ---------------------------------------------------------------------------
    -- CASE 32: Retinal Hemorrhages - The Mimics (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eye Findings' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eye Findings', 'A student asks if anything other than abuse can cause retinal hemorrhages.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Eye Findings', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can birth cause retinal hemorrhages?', '["No", "Yes, but they are usually mild and resolve by 4-6 weeks of age", "Only C-sections", "None"]', 1, 'Birth-related hemorrhages should not be present in a 3-month-old.'),
    (v_case_id, 'Does severe coughing or vomiting cause extensive, multilayered retinal hemorrhages?', '["Yes", "No, this is a common but false claim by defense lawyers; these forces are not high enough", "Always", "None"]', 1, 'Scientific evidence does not support coughing/vomiting as a cause for severe retinal trauma.'),
    (v_case_id, 'Who should perform the definitive eye exam for suspected AHT?', '["Pediatrician", "Pediatric Ophthalmologist", "Nurse", "None"]', 1, 'A specialist should perform an indirect ophthalmoscopic exam through dilated pupils.');

    ---------------------------------------------------------------------------
    -- CASE 33: Intracranial Hemorrhage - Chronic (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Old Blood' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Old Blood', 'A head CT shows both acute (white) and chronic (dark/hypodense) subdural hematomas.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Old Blood', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the presence of both acute and chronic blood indicate?', '["Bleeding disorder", "Repeat trauma over time", "Normal", "None"]', 1, 'It suggests the baby was shaken or injured on more than one occasion.'),
    (v_case_id, 'Where are most abusive subdural hematomas located?', '["Base of brain", "Over the convexities and along the interhemispheric fissure", "None", "None"]', 1, 'The location is consistent with rotational forces.'),
    (v_case_id, 'Is a fall from a couch a likely cause for a subdural hematoma in an infant?', '["Yes", "No, short distance falls rarely cause significant intracranial bleeding in infants", "Always", "None"]', 1, 'Biomechanical studies show that short falls (under 3 feet) do not generate enough force.');

    ---------------------------------------------------------------------------
    -- CASE 34: Abdominal Bruising (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Belly Bruise' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Belly Bruise', 'A toddler has a faint bruise on his abdomen. He is vomiting and has a high lipase.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Belly Bruise', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What organ was likely injured?', '["Spleen", "Pancreas", "Liver", "None"]', 1, 'Elevated lipase indicates traumatic pancreatitis.'),
    (v_case_id, 'Is traumatic pancreatitis common in accidental childhood falls?', '["Yes", "No, it is highly suggestive of focal, high-force impact like a punch or kick", "Maybe", "None"]', 1, 'The pancreas is protected by its retroperitoneal position; it takes significant force to injure it.'),
    (v_case_id, 'What imaging is needed for this child?', '["Abdominal CT with contrast", "X-ray", "Ultrasound", "None"]', 0, 'CT is the gold standard for evaluating solid organ injury in trauma.');

    ---------------------------------------------------------------------------
    -- CASE 35: Long-term Outcomes - ACEs (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Adverse Childhood Experiences' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Adverse Childhood Experiences', 'A physician is discussing the long-term health risks for a child who has been abused.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adverse Childhood Experiences', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a high ACE score (Adverse Childhood Experiences) correlate with in adulthood?', '["Lower intelligence", "Increased risk of chronic diseases (heart disease, cancer), substance use, and early death", "None", "None"]', 1, 'Childhood trauma has a massive impact on life-long physical and mental health.'),
    (v_case_id, 'What is the biological mechanism for this?', '["Toxic stress and dysregulation of the HPA axis", "Genetics only", "Diet", "None"]', 0, 'Chronic stress alters the developing brain and immune system.'),
    (v_case_id, 'Can resilience factors (like a supportive non-offending caregiver) mitigate these risks?', '["No", "Yes, they are the most important protective factors", "Maybe", "None"]', 1, 'Positive relationships can buffer the effects of toxic stress.');

    ---------------------------------------------------------------------------
    -- CASE 36: SANE/SAFE Nursing (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Forensic Nursing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Forensic Nursing', 'A child is brought in for a sexual assault exam.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Forensic Nursing', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a SANE nurse stand for?', '["Super Admin Nurse Expert", "Sexual Assault Nurse Examiner", "None", "None"]', 1, 'They are specialized in forensic evidence collection and trauma-informed exams.'),
    (v_case_id, 'What is the priority during a sexual assault exam?', '["Evidence only", "The child''s physical and emotional comfort and safety", "Police interview", "None"]', 1, 'The medical-forensic exam should not re-traumatize the child.'),
    (v_case_id, 'What is a \"colposcope\" used for in this context?', '["Looking at ears", "Taking magnified, high-quality photos of the genital area for evidence", "Surgery", "None"]', 1, 'Photographic evidence is crucial for forensic analysis.');

    ---------------------------------------------------------------------------
    -- CASE 37: Mandated Reporting - The \"Accidental\" Admission (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Accidental Disclosure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Accidental Disclosure', 'A parent admits during a follow-up visit that they \"got angry and shook the baby a little bit\" last week.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Accidental Disclosure', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this admission require a report even if the baby looks fine today?', '["No", "Yes, any disclosure of harmful actions toward a child must be reported", "Only if there are bruises", "None"]', 1, 'The admission of shaking is a critical safety concern.'),
    (v_case_id, 'Should you continue with the medical evaluation of the baby?', '["No", "Yes, the baby needs a head CT and eye exam immediately", "Wait", "None"]', 1, 'Injuries can be occult even after the parent admits to the act.'),
    (v_case_id, 'What is the most common reason parents give for shaking an infant?', '["Boredom", "Inconsolable crying", "Hunger", "None"]', 1, 'Excessive crying is the most frequent trigger for AHT.');

    ---------------------------------------------------------------------------
    -- CASE 38: Burns - Implement Marks (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Branded' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Branded', 'A child has a burn on his thigh that is shaped exactly like the head of a clothes iron.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Branded', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is this highly suspicious for abuse?', '["It is a large burn", "Accidental contact with an iron usually results in a smear or partial mark, not a perfect stamp/brand", "None", "None"]', 1, 'A clear implement mark suggests the iron was pressed against the skin for several seconds.'),
    (v_case_id, 'What other household items often leave clear implement marks when used for abuse?', '["Curling irons, spoons, and cigarette lighters", "Blankets", "Pillows", "None"]', 0, 'Recognition of the object helps confirm the mechanism of injury.'),
    (v_case_id, 'What is the depth of most deliberate implement burns?', '["Superficial", "Partial-thickness or Full-thickness (Second or Third degree)", "None", "None"]', 1, 'Significant heat and pressure are typically applied.');

    ---------------------------------------------------------------------------
    -- CASE 39: Physical Abuse Risk Factors (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Risk Assessment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Risk Assessment', 'A physician is evaluating a family for child abuse risk factors.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Risk Assessment', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a significant risk factor for child abuse?', '["High income", "Parental substance use or untreated mental illness", "Large backyard", "None"]', 1, 'Stressors and impaired judgment increase the risk of maltreatment.'),
    (v_case_id, 'Are children with disabilities at higher or lower risk for abuse?', '["Lower", "Higher (up to 3-4 times higher risk)", "The same", "None"]', 1, 'Increased caregiving demands can lead to higher levels of parental stress.'),
    (v_case_id, 'What is the significance of a \"non-biological male in the home\" as a risk factor?', '["None", "Statistically, it is a significant risk factor for both physical and sexual abuse", "None", "None"]', 1, 'While many non-biological parents are wonderful, it is a recognized demographic risk factor.');

    ---------------------------------------------------------------------------
    -- CASE 40: Emotional Abuse (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Words that Hurt' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Words that Hurt', 'A father constantly tells his 6-year-old that he is \"worthless,\" \"stupid,\" and that he \"wishes he was never born.\" ', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Words that Hurt', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What form of abuse is this?', '["Neglect", "Psychological / Emotional Abuse", "None", "None"]', 1, 'Pervasive verbal aggression and terrorizing impact a child''s core development.'),
    (v_case_id, 'Is emotional abuse easier or harder to prove legally than physical abuse?', '["Easier", "Much harder", "The same", "None"]', 1, 'Lack of physical evidence makes it difficult for authorities to intervene unless it is extreme.'),
    (v_case_id, 'What is the long-term impact of chronic emotional abuse?', '["High self-esteem", "Severe depression, anxiety, and relationship difficulties", "None", "None"]', 1, 'The \"wounds\" are internal but just as damaging as physical ones.');

    ---------------------------------------------------------------------------
    -- CASE 41: Mandated Reporting - The Teenager (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Teenager Disclosure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Teenager Disclosure', 'A 16-year-old tells you his dad hit him, but begs you not to report it because \"it will make things worse at home.\" ', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Teenager Disclosure', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can you honor the teen''s request and not report?', '["Yes", "No, as a mandated reporter you MUST report suspicion of abuse in any minor (< 18)", "Only if he is safe", "None"]', 1, 'Legal requirements do not allow for exceptions based on patient request.'),
    (v_case_id, 'How should you handle the teenager''s fear of retaliation?', '["Ignore it", "Collaborate with CPS and social work to create a safety plan and explain the process to the teen", "None", "None"]', 1, 'You must maintain the therapeutic relationship while following the law.'),
    (v_case_id, 'What is the age of majority for reporting in most US states?', '["16", "18", "21", "None"]', 1, 'Once they are 18, they are adults and the reporting rules change.');

    ---------------------------------------------------------------------------
    -- CASE 42: Spiral Fractures in Babies (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Twisted Limbs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Twisted Limbs', 'An 5-month-old infant has a spiral fracture of the humerus.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Twisted Limbs', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likelihood of this being accidental?', '["High", "Very low; spiral fractures in non-walking infants are highly suspicious for abuse", "None", "None"]', 1, 'It takes a significant twisting force to create this fracture pattern.'),
    (v_case_id, 'What is the classic mechanism described by perpetrators for this injury?', '["The baby fell", "The limb got stuck in the crib slats (rarely causes this)", "I twisted it", "None"]', 1, 'They often provide a weak explanation that doesn''t match the force required.'),
    (v_case_id, 'What other fracture is often found along with spiral arm fractures?', '["Leg fracture", "Rib fractures", "None", "None"]', 1, 'Occult rib fractures are found in many cases of physical abuse.');

    ---------------------------------------------------------------------------
    -- CASE 43: Scald Burns - The Tap Water (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Water Temperature' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Water Temperature', 'A parent says the baby accidentally turned on the hot water and burned himself.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Water Temperature', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long does it take for 140°F (60°C) water to cause a full-thickness burn?', '["1 hour", "3 to 5 seconds", "10 minutes", "None"]', 1, 'Tap water can be hot enough to cause severe burns almost instantly.'),
    (v_case_id, 'What is the recommended safe setting for a home water heater?', '["140°F", "120°F (49°C)", "100°F", "None"]', 1, 'Lowering the temperature prevents accidental scalds.'),
    (v_case_id, 'Does the parent''s explanation matter if the burn pattern is clearly an immersion pattern?', '["Yes", "No, the objective pattern overrides the subjective history in forensic analysis", "Maybe", "None"]', 1, 'Physical evidence is more reliable than the history in abuse cases.');

    ---------------------------------------------------------------------------
    -- CASE 44: Failure to Thrive - The Hospital Test (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weight Gain in Hospital' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weight Gain in Hospital', 'A child with poor growth is admitted. In the hospital, with standard nursing care, he gains 2 pounds in one week.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weight Gain in Hospital', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does this rapid weight gain prove?', '["The child has a high metabolism", "The cause of FTT was inadequate caloric intake at home (neglect)", "None", "None"]', 1, 'It rules out major organic malabsorption or disease.'),
    (v_case_id, 'Should you still run expensive tests for rare metabolic diseases?', '["Yes", "No, the \"feeding trial\" is the most important diagnostic test", "Maybe", "None"]', 1, 'Rapid gain on standard food is diagnostic of non-organic FTT.'),
    (v_case_id, 'What is the long-term risk for a child with early severe nutritional neglect?', '["Obesity", "Developmental delay and permanent impact on growth and IQ", "None", "None"]', 1, 'Infancy is a critical period for brain and body growth.');

    ---------------------------------------------------------------------------
    -- CASE 45: Mandated Reporting - The Colleague (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Professional Duty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Professional Duty', 'A nurse notices that a doctor is becoming overly aggressive and rough with a crying infant during a procedure.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Professional Duty', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does the nurse have a duty to report this?', '["No, he is a doctor", "Yes, anyone who suspects abuse by ANY caregiver must report", "None", "None"]', 1, 'Abuse can happen in the clinical setting too.'),
    (v_case_id, 'What is the first step when a healthcare worker is suspected of abuse?', '["Wait for it to happen again", "Immediate intervention to remove the child from the person and report to hospital leadership/CPS", "None", "None"]', 1, 'Child safety is the absolute priority.'),
    (v_case_id, 'Can a hospital refuse to report to CPS because of bad publicity?', '["Yes", "No, reporting is a legal individual and institutional requirement", "Maybe", "None"]', 1, 'Institutional liability increases if they fail to report.');

    ---------------------------------------------------------------------------
    -- CASE 46: Sexual Abuse - Behavioral Indicators (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Changes', 'A 5-year-old suddenly becomes obsessed with sexual topics and acts out sexual behaviors with toys.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Changes', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this?', '["Precocious puberty", "Sexualized behavior", "Normal curiosity", "None"]', 1, 'Developmentally inappropriate sexual knowledge or behavior is a red flag for abuse.'),
    (v_case_id, 'Are behavioral changes always present in sexual abuse?', '["Yes", "No, many children show no outward behavioral changes", "Never", "None"]', 1, 'The absence of behavioral changes does not rule out abuse.'),
    (v_case_id, 'What is a common emotional response in abused children?', '["Happiness", "Withdrawal, aggression, or regression (e.g., bedwetting)", "None", "None"]', 1, 'Changes in baseline behavior should always be investigated.');

    ---------------------------------------------------------------------------
    -- CASE 47: Bruising Mimic - Cupping (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Suction Marks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Suction Marks', 'A child has perfectly circular, reddish-purple bruises on his back.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Suction Marks', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause?', '["Punching", "Cupping (Traditional therapy)", "Cancer", "None"]', 1, 'Cupping uses heated jars to create suction on the skin.'),
    (v_case_id, 'How do these differ from abusive bruises?', '["They are more painful", "They are perfectly circular and the family provides a therapeutic history", "None", "None"]', 1, 'Recognition of cultural healing practices is essential.'),
    (v_case_id, 'Is cupping considered abuse?', '["Yes", "No, it is a traditional practice and not intended to harm", "Maybe", "None"]', 1, 'Like coining, it is usually not considered abuse unless it causes severe injury.');

    ---------------------------------------------------------------------------
    -- CASE 48: Intra-abdominal Bleeding (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dropping Hemoglobin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dropping Hemoglobin', 'A child with a history of a \"fall\" has a hemoglobin that drops from 12 to 7 over 4 hours.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dropping Hemoglobin', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should be the top concern?', '["Infection", "Internal hemorrhage (e.g., Liver or Spleen laceration)", "Leukemia", "None"]', 1, 'Rapidly dropping hemoglobin in trauma means active bleeding.'),
    (v_case_id, 'What is the most sensitive test for identifying free fluid in the abdomen?', '["FAST ultrasound or Abdominal CT", "X-ray", "None", "None"]', 0, 'FAST is quick; CT is more definitive.'),
    (v_case_id, 'Can a child die from abdominal abuse without ever having a mark on their skin?', '["No", "Yes", "Never", "None"]', 1, 'Internal trauma is a major cause of death in child abuse.');

    ---------------------------------------------------------------------------
    -- CASE 49: Psychological Impact - Trauma-Informed Care (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Supportive Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Supportive Care', 'A physician is seeing a child who has been removed from an abusive home.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supportive Care', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of \"Trauma-Informed Care\"?', '["To give meds", "To realize the impact of trauma and avoid re-traumatizing the patient", "None", "None"]', 1, 'Care should be sensitive to the child''s history and triggers.'),
    (v_case_id, 'What is a common sign of PTSD in a young child?', '["Talking too much", "Regression, hypervigilance, and repetitive play about the trauma", "None", "None"]', 1, 'Young children \"play out\" their trauma since they lack the words to describe it.'),
    (v_case_id, 'Is the goal of CPS always permanent removal from the parents?', '["Yes", "No, the primary goal is often reunification if a safe environment can be established", "Always", "None"]', 1, 'The first priority is safety; the second is a stable, permanent home.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Skeletal Survey - Technical Quality (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Good Images' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Good Images', 'A physician is ordering a skeletal survey for suspected abuse.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Good Images', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is a \"babygram\" (one big X-ray of the whole body) acceptable for a skeletal survey?', '["Yes", "No, it is sub-diagnostic and can miss up to 50% of fractures", "Always", "None"]', 1, 'A high-quality skeletal survey requires separate views of each bone and joint.'),
    (v_case_id, 'What is the most important joint to visualize clearly in an infant?', '["Wrist", "The ends of the long bones (to see CMLs)", "Spine", "None"]', 1, 'Metaphyseal injuries are the most specific for abuse.'),
    (v_case_id, 'Should you order a skeletal survey for a child > 5 years old?', '["Yes", "Usually no, as older children can report pain and standard X-rays are sufficient", "Always", "None"]', 1, 'The yield of a full survey drops significantly once the child is verbal and ambulatory.');

    RAISE NOTICE 'SUCCESS: 50 Child Abuse Recognition Case Blocks registered.';
END $$;

COMMIT;
