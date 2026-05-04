-- Ethics, Law & Health Systems: Patient safety & quality improvement - Complete (Cases 1-50)
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ethics-patient-safety

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-patient-safety' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ethics-patient-safety';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Adverse Event vs. Natural Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Operative Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Operative Bleeding', 'A 65-year-old male undergoes an elective laparoscopic cholecystectomy. Six hours post-operatively, he develops severe abdominal pain and hypotension. He is taken back to the OR, where a clip on the cystic artery is found to have slipped, causing a massive hemoperitoneum.

Vitals: BP 85/50 mmHg, HR 125 bpm, RR 24 bpm, Temp 98.6°F.
Physical Examination: Abdomen is distended, firm, and exquisitely tender.
Laboratory Results: Hemoglobin 7.2 g/dL (pre-op 14.1 g/dL), Lactate 4.2 mmol/L.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male undergoes an elective laparoscopic cholecystectomy. Six hours post-operatively, he develops severe abdominal pain and hypotension. He is taken back to the OR, where a clip on the cystic artery is found to have slipped, causing a massive hemoperitoneum.

Vitals: BP 85/50 mmHg, HR 125 bpm, RR 24 bpm, Temp 98.6°F.
Physical Examination: Abdomen is distended, firm, and exquisitely tender.
Laboratory Results: Hemoglobin 7.2 g/dL (pre-op 14.1 g/dL), Lactate 4.2 mmol/L.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following terms best describes this event?', '["Natural disease progression", "Adverse event", "Near miss", "Non-preventable complication"]', 1, 'An adverse event is harm that results from medical management (in this case, a technical surgical failure) rather than the patient''s underlying disease.'),
    (v_case_id, 'What is the primary distinction between an adverse event and a near miss?', '["The severity of the error", "Whether the error reached the patient and caused harm", "The location of the error", "The person who committed the error"]', 1, 'A near miss is an error that was caught before it reached the patient, whereas an adverse event reached the patient and caused harm.'),
    (v_case_id, 'True or False: All adverse events are the result of medical errors.', '["True", "False"]', 1, 'Adverse events can be preventable (due to error) or non-preventable (e.g., a known drug side effect despite correct dosing and indication).');

    ---------------------------------------------------------------------------
    -- CASE 02: Near Miss - Pharmacy Error
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Vial' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Vial', 'A nurse is preparing to administer insulin to a patient with type 1 diabetes. She reaches into the medication drawer and pulls out a vial of concentrated heparin (10,000 units/mL) instead of the insulin vial, which has a similar label and cap color. Just before drawing it up, she performs a second check and realizes the mistake.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Blood glucose 210 mg/dL.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A nurse is preparing to administer insulin to a patient with type 1 diabetes. She reaches into the medication drawer and pulls out a vial of concentrated heparin (10,000 units/mL) instead of the insulin vial, which has a similar label and cap color. Just before drawing it up, she performs a second check and realizes the mistake.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Blood glucose 210 mg/dL.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This scenario is an example of a:', '["Sentinel event", "Near miss", "Adverse event", "Latent error only"]', 1, 'A near miss (or "close call") is an event that could have resulted in harm but was intercepted before reaching the patient.'),
    (v_case_id, 'What should the nurse''s next step be regarding hospital policy?', '["Keep it quiet to avoid punishment", "Report the near miss through the hospital''s reporting system", "Only report if the patient finds out", "Blame the pharmacy for stocking the drawer wrong"]', 1, 'Reporting near misses is critical for identifying system weaknesses (like look-alike packaging) before they result in actual patient harm.'),
    (v_case_id, 'In this case, the similar packaging and cap color represent which type of failure?', '["Active failure", "Latent error", "Sentinel event", "Human factor engineering success"]', 1, 'Latent errors are "accidents waiting to happen"—system-level flaws (like poor organization or look-alike labeling) that predispose to active errors.');

    ---------------------------------------------------------------------------
    -- CASE 03: Sentinel Event - Wrong Site Surgery
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Knee', 'A 70-year-old female is scheduled for a left total knee arthroplasty. Despite a "time-out," the surgeon begins the incision on the right knee. The error is realized ten minutes into the procedure. The right-side incision is closed, and the correct surgery is performed on the left.

Vitals: Stable.
Physical Examination: Bilateral knee incisions.
Laboratory Results: Normal.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old female is scheduled for a left total knee arthroplasty. Despite a "time-out," the surgeon begins the incision on the right knee. The error is realized ten minutes into the procedure. The right-side incision is closed, and the correct surgery is performed on the left.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The Joint Commission (TJC) would classify this event as a:', '["Near miss", "Sentinel event", "Active failure only", "No-harm event"]', 1, 'Wrong-site surgery is a classic "Never Event" and is classified as a sentinel event because it signals a major system failure and results in unnecessary surgery/harm.'),
    (v_case_id, 'Which process is MANDATED by the Joint Commission following a sentinel event?', '["Immediate firing of the surgeon", "Root Cause Analysis (RCA)", "A public apology in the newspaper", "A lawsuit"]', 1, 'Hospitals are required to perform a Root Cause Analysis (RCA) after a sentinel event to identify systems-level improvements.'),
    (v_case_id, 'What is the primary purpose of the surgical "Time-Out"?', '["To let the anesthesia kick in", "To ensure all team members agree on the patient, site, and procedure", "To check the surgeon''s credentials", "To fill out billing paperwork"]', 1, 'The Time-Out is a standardized communication tool intended to prevent wrong-site, wrong-patient, and wrong-procedure errors.');

    ---------------------------------------------------------------------------
    -- CASE 04: Active vs. Latent Errors
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Medication Drawer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Medication Drawer', 'An overworked resident orders 10mg of morphine for a patient instead of 1mg due to a typo. The pharmacist, busy with a staffing shortage, approves the order. The nurse, distracted by a code in the next room, administers the 10mg. The patient develops respiratory depression.

Vitals: BP 110/60 mmHg, HR 55 bpm, RR 6 bpm, O2 Sat 82% on RA.
Physical Examination: Pinpoint pupils, somnolent.
Laboratory Results: Normal.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An overworked resident orders 10mg of morphine for a patient instead of 1mg due to a typo. The pharmacist, busy with a staffing shortage, approves the order. The nurse, distracted by a code in the next room, administers the 10mg. The patient develops respiratory depression.

Vitals: BP 110/60 mmHg, HR 55 bpm, RR 6 bpm, O2 Sat 82% on RA.
Physical Examination: Pinpoint pupils, somnolent.
Laboratory Results: Normal.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the "Swiss Cheese Model," what do the holes in the cheese represent?', '["Successful safety barriers", "Individual people", "System weaknesses or latent errors", "The patient''s disease"]', 2, 'The holes represent weaknesses in the various layers of defense (barriers). When the holes align, an error reaches the patient.'),
    (v_case_id, 'Which of the following is considered an "active failure" in this case?', '["Staffing shortage", "The nurse administering the wrong dose", "The busy environment", "The lack of an automated dosage alert"]', 1, 'Active failures occur at the "sharp end" (direct contact with the patient), such as the nurse administering the medication.'),
    (v_case_id, 'Which of the following is a "latent error" in this scenario?', '["The resident making a typo", "The nurse''s distraction", "The staffing shortage and pharmacy workload", "The patient''s somnolence"]', 2, 'Latent errors are system-level conditions (e.g., staffing, culture, equipment design) that exist long before the active failure.');

    ---------------------------------------------------------------------------
    -- CASE 05: Preventable Adverse Event
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neglected Prophylaxis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neglected Prophylaxis', 'A 55-year-old obese woman is hospitalized for a hip fracture. She does not receive VTE prophylaxis (heparin or SCDs) during her 4-day stay. On day 5, she develops sudden onset shortness of breath and pleuritic chest pain.

Vitals: BP 110/70 mmHg, HR 118 bpm, RR 28 bpm, O2 Sat 88% on 4L NC.
Physical Examination: Right calf is swollen, warm, and tender. Lungs are clear.
Laboratory Results: CTPA shows a large pulmonary embolism.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old obese woman is hospitalized for a hip fracture. She does not receive VTE prophylaxis (heparin or SCDs) during her 4-day stay. On day 5, she develops sudden onset shortness of breath and pleuritic chest pain.

Vitals: BP 110/70 mmHg, HR 118 bpm, RR 28 bpm, O2 Sat 88% on 4L NC.
Physical Examination: Right calf is swollen, warm, and tender. Lungs are clear.
Laboratory Results: CTPA shows a large pulmonary embolism.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This PE is best classified as a:', '["Non-preventable adverse event", "Preventable adverse event", "Near miss", "Natural history of hip fractures"]', 1, 'Since VTE prophylaxis is a standard of care that was omitted, the resulting harm (PE) is a preventable adverse event.'),
    (v_case_id, 'Which of the following is a "process" measure that could be used to improve safety in this unit?', '["The rate of PEs per 1000 discharges", "The percentage of eligible patients receiving VTE prophylaxis within 24 hours", "The mortality rate of hip fracture patients", "The cost of heparin"]', 1, 'Process measures (Donabedian model) track whether the correct actions (e.g., giving prophylaxis) were taken.'),
    (v_case_id, 'Which of the following would be the most effective "forcing function" to prevent this error?', '["A memo reminding doctors to order heparin", "A mandatory hard-stop in the EHR requiring a VTE prophylaxis order before completing admission", "A lecture on the dangers of PE", "A monthly quiz for nurses"]', 1, 'Forcing functions are the strongest human factors intervention because they make it impossible (or very difficult) to proceed without performing a safety step.');

    ---------------------------------------------------------------------------
    -- CASE 06: Diagnostic Error
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Missing the Appendicitis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Missing the Appendicitis', 'An 18-year-old male presents to the ED with vague periumbilical pain. He is diagnosed with "viral gastroenteritis" and discharged without a physical exam. He returns 24 hours later with diffuse peritonitis and a ruptured appendix.

Vitals: BP 105/65 mmHg, HR 115 bpm, RR 20 bpm, Temp 102.8°F.
Physical Examination: Diffuse rebound tenderness and guarding in all four quadrants.
Laboratory Results: WBC 19.5 x 10³/µL with left shift.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-year-old male presents to the ED with vague periumbilical pain. He is diagnosed with "viral gastroenteritis" and discharged without a physical exam. He returns 24 hours later with diffuse peritonitis and a ruptured appendix.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of medical error occurred in this case?', '["Treatment error", "Diagnostic error", "Preventive error", "Handoff error"]', 1, 'A diagnostic error is a failure to provide an accurate and timely explanation of the patient''s health problem or to communicate that explanation.'),
    (v_case_id, 'Which of the following is a common "cognitive bias" that contributes to diagnostic errors?', '["Availability heuristic", "Anchoring bias", "Premature closure", "All of the above"]', 3, 'Anchoring (fixing on an early diagnosis), availability (diagnosing based on recently seen cases), and premature closure are major causes of diagnostic error.'),
    (v_case_id, 'What is the most appropriate next step for the hospital to investigate this specific error?', '["Wait for the patient to sue", "Perform a Root Cause Analysis (RCA)", "Fire the triage nurse", "Ban the diagnosis of gastroenteritis"]', 1, 'RCA is used to identify why the diagnosis was missed (e.g., lack of supervision, EHR barriers, physical exam omission).');

    ---------------------------------------------------------------------------
    -- CASE 07: Communication Error - The Handoff
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Forgotten Allergy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Forgotten Allergy', 'During shift change, the outgoing nurse tells the incoming nurse, "Mr. Jones in 402 is stable." She forgets to mention he has a severe penicillin allergy. The incoming nurse later administers IV ampicillin for a suspected UTI.

Vitals: BP 70/40 mmHg, HR 140 bpm, RR 32 bpm, O2 Sat 85% on RA.
Physical Examination: Diffuse urticaria, inspiratory stridor, angioedema.
Laboratory Results: Normal.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During shift change, the outgoing nurse tells the incoming nurse, "Mr. Jones in 402 is stable." She forgets to mention he has a severe penicillin allergy. The incoming nurse later administers IV ampicillin for a suspected UTI.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What percentage of serious medical errors are estimated to be caused by communication failures during handoffs?', '["10%", "30%", "50%", "Over 70%"]', 3, 'The Joint Commission estimates that communication failures (especially during handoffs) are the primary root cause of over 70% of sentinel events.'),
    (v_case_id, 'Which standardized mnemonic is recommended to improve the quality of clinical handoffs?', '["APGAR", "I-PASS (Illness severity, Patient summary, Action list, Situation awareness, Synthesis)", "CHADS2", "SAD PERSONS"]', 1, 'I-PASS is a validated, standardized handoff bundle that significantly reduces medical errors.'),
    (v_case_id, 'In the SBAR communication tool, what does the "R" stand for?', '["Review", "Recommendation", "Result", "Reason"]', 1, 'SBAR stands for Situation, Background, Assessment, and Recommendation.');

    ---------------------------------------------------------------------------
    -- CASE 08: Human Factors - Look-Alike Medications
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sound-Alike Confusion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sound-Alike Confusion', 'A physician verbally orders "Zantac" (ranitidine) but the nurse hears "Zyrtec" (cetirizine) and administers it. The patient receives an antihistamine for their GERD symptoms.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician verbally orders "Zantac" (ranitidine) but the nurse hears "Zyrtec" (cetirizine) and administers it. The patient receives an antihistamine for their GERD symptoms.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which strategy is used to distinguish look-alike/sound-alike (LASA) drug names on labels?', '["Bold fonts", "Tall Man lettering (e.g., hydrOXYzine vs. hydrALAzine)", "Using only generic names", "Using different colors for every drug"]', 1, 'Tall Man lettering uses uppercase letters to highlight the differences between similar drug names.'),
    (v_case_id, 'What is the most appropriate way to handle a verbal or telephone order to prevent this error?', '["Write it down", "Read-back and verify", "Ask a second witness to listen", "Never take verbal orders"]', 1, 'The "Read-back" process requires the receiver to write down the order and read it back to the prescriber for confirmation.'),
    (v_case_id, 'True or False: Using "leading zeros" (e.g., 0.5 mg) and avoiding "trailing zeros" (e.g., 5.0 mg) is a standard safety practice.', '["True", "False"]', 0, 'Leading zeros prevent a dose like .5 from being read as 5; avoiding trailing zeros prevents 5.0 from being read as 50.');

    ---------------------------------------------------------------------------
    -- CASE 09: System Failure - The Retained Foreign Body
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Forgotten Sponge' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Forgotten Sponge', 'A patient undergoes an emergency exploratory laparotomy for a gunshot wound. The case is chaotic with heavy bleeding. Two weeks later, the patient presents with abdominal pain and a palpable mass. Imaging shows a retained surgical sponge.

Vitals: BP 130/80 mmHg, HR 90 bpm, Temp 100.2°F.
Physical Examination: Tender, firm mass in the LLQ.
Laboratory Results: WBC 12.0 x 10³/µL.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient undergoes an emergency exploratory laparotomy for a gunshot wound. The case is chaotic with heavy bleeding. Two weeks later, the patient presents with abdominal pain and a palpable mass. Imaging shows a retained surgical sponge.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A retained surgical sponge is a type of:', '["Natural complication", "Never Event", "Near miss", "Non-preventable adverse event"]', 1, 'Never Events are particularly shocking medical errors (like retained items or wrong-site surgery) that should never occur if safety protocols are followed.'),
    (v_case_id, 'Which factor is most strongly associated with retained foreign bodies?', '["Low patient BMI", "Emergency procedures", "Daytime surgeries", "Experienced surgeons"]', 1, 'Emergency procedures, unplanned changes in procedure, and high BMI are known risk factors for retained items.'),
    (v_case_id, 'Which safety layer is designed to prevent this specific error?', '["Manual sponge counts", "Radiopaque markers on sponges", "Post-operative X-rays in high-risk cases", "All of the above"]', 3, 'Standard safety includes manual counts, radiopaque markers, and often radiographic screening in chaotic or high-risk cases.');

    ---------------------------------------------------------------------------
    -- CASE 10: No-Harm Event - Wrong Drug, No Reaction
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Statin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Statin', 'A patient is prescribed Atorvastatin 20mg. Due to a pharmacy error, they are given Simvastatin 20mg instead. The patient takes the medication for three days before the error is discovered. The patient has no symptoms and their liver enzymes are normal.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: AST 22 U/L, ALT 24 U/L.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is prescribed Atorvastatin 20mg. Due to a pharmacy error, they are given Simvastatin 20mg instead. The patient takes the medication for three days before the error is discovered. The patient has no symptoms and their liver enzymes are normal.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This event is best classified as a:', '["Near miss", "No-harm event", "Adverse event", "Sentinel event"]', 1, 'A no-harm event is an error that REACHED the patient but resulted in no discernible harm.'),
    (v_case_id, 'Should this event be disclosed to the patient?', '["No, because no harm occurred", "Yes, professional ethics require disclosure of errors that reach the patient", "Only if the patient asks", "Only if the doctor is feeling guilty"]', 1, 'Ethical standards and most hospital policies require disclosure of errors that reach the patient, regardless of whether harm occurred.'),
    (v_case_id, 'What is the primary benefit of reporting no-harm events?', '["To fire the pharmacist", "To identify system flaws before a high-risk error occurs", "To increase hospital revenue", "There is no benefit"]', 1, 'No-harm events and near misses are "free lessons" that reveal system weaknesses without the cost of patient injury.');

    ---------------------------------------------------------------------------
    -- CASE 11: Root Cause Analysis (RCA) - The Process
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Understanding the "Why"' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Understanding the "Why"', 'After a patient receives the wrong blood type during a transfusion, a multi-disciplinary team is assembled to investigate. They use a "Fishbone" (Ishikawa) diagram to categorize potential causes into People, Process, Equipment, and Environment.

Vitals: Patient has hemolytic reaction.
Physical Examination: Fever, chills, dark urine.
Laboratory Results: Positive Coombs test, hemoglobinuria.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After a patient receives the wrong blood type during a transfusion, a multi-disciplinary team is assembled to investigate. They use a "Fishbone" (Ishikawa) diagram to categorize potential causes into People, Process, Equipment, and Environment.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Root Cause Analysis is primarily designed to identify:', '["Who is most at fault", "The underlying systems failures", "The cost of the error", "The legal liability"]', 1, 'RCA focuses on systems and processes, not individual performance, to prevent recurrence of the error.'),
    (v_case_id, 'Which of the following is a common technique used during RCA to get to the "root" of a problem?', '["The 5 Whys", "The 10 Commands", "The 3 Blames", "The 1 Goal"]', 0, 'The "5 Whys" involves repeatedly asking "why" to peel away layers of symptoms and find the true root cause.'),
    (v_case_id, 'True or False: RCA should be performed by a single administrator to ensure objectivity.', '["True", "False"]', 1, 'RCA should be a multi-disciplinary team process involving those familiar with the process being investigated.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Swiss Cheese Model
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aligned Holes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aligned Holes', 'A patient with a documented penicillin allergy is prescribed amoxicillin. The EHR alert is overridden by the resident. The pharmacist is processing 50 orders an hour and misses the allergy. The nurse is covering two extra patients and does not check the allergy band. The patient develops anaphylaxis.

Vitals: BP 80/40 mmHg, HR 130 bpm.
Physical Examination: Diffuse rash, wheezing.
Laboratory Results: Normal.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a documented penicillin allergy is prescribed amoxicillin. The EHR alert is overridden by the resident. The pharmacist is processing 50 orders an hour and misses the allergy. The nurse is covering two extra patients and does not check the allergy band. The patient develops anaphylaxis.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This scenario perfectly illustrates which safety model?', '["The Hedgehog Concept", "The Swiss Cheese Model", "The Pareto Principle", "The Peter Principle"]', 1, 'The Swiss Cheese Model shows how multiple layers of defense (the cheese) all have flaws (the holes), and an error occurs when they align.'),
    (v_case_id, 'Which of the following is a "latent error" in this case?', '["The resident overriding the alert", "The nurse not checking the band", "The high pharmacist workload and nursing ratios", "The patient''s allergy"]', 2, 'Latent errors are system-level factors (like staffing and workload) that create the conditions for active errors.'),
    (v_case_id, 'How can the "holes" in the Swiss Cheese Model be closed?', '["By firing the people involved", "By adding more redundant layers and improving existing ones", "By ignoring near misses", "By blaming the patient"]', 1, 'Safety is improved by adding layers (redundancy) and making each layer more robust (fewer holes).');

    ---------------------------------------------------------------------------
    -- CASE 13: Human Factors - Standardization
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Standardizing the Central Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Standardizing the Central Line', 'An ICU implements a mandatory "Central Line Bundle" (hand hygiene, maximal barrier precautions, chlorhexidine, optimal site selection, and daily review). CLABSI rates drop by 60%.

Vitals: Stable.
Physical Examination: No signs of infection.
Laboratory Results: Normal.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ICU implements a mandatory "Central Line Bundle" (hand hygiene, maximal barrier precautions, chlorhexidine, optimal site selection, and daily review). CLABSI rates drop by 60%.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This approach is an example of which human factors principle?', '["Standardization", "Complexity", "Individualization", "Autonomy"]', 0, 'Standardization reduces variation and ensures that best practices are followed every time, regardless of who is performing the task.'),
    (v_case_id, 'Why is standardization effective in reducing errors?', '["It makes the job more boring", "It reduces the cognitive load and reliance on memory", "It allows for more creativity", "It increases the number of steps"]', 1, 'By standardizing processes, providers don''t have to "reinvent the wheel" or remember every single step under stress.'),
    (v_case_id, 'A checklist used during central line insertion is a tool for:', '["Standardization", "Simplification", "Both Standardization and Simplification", "Neither"]', 2, 'Checklists both standardize the process and simplify it by providing a clear, step-by-step guide.');

    ---------------------------------------------------------------------------
    -- CASE 14: Human Factors - Simplification
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reducing the Steps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reducing the Steps', 'A hospital finds that nurses have to log into three different systems and click 15 times to document a single medication administration. They implement a bar-coding system that reduces this to a single scan and two clicks.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital finds that nurses have to log into three different systems and click 15 times to document a single medication administration. They implement a bar-coding system that reduces this to a single scan and two clicks.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This intervention is an example of:', '["Standardization", "Simplification", "Redundancy", "Forcing function"]', 1, 'Simplification involves reducing the number of steps in a process to minimize the opportunities for error.'),
    (v_case_id, 'Simplification is particularly important in:', '["Low-stress environments", "High-stress, complex environments (like the ICU or ED)", "Administrative offices", "The hospital cafeteria"]', 1, 'In high-stress environments, complex processes are much more likely to fail.'),
    (v_case_id, 'True or False: Adding more steps to a process usually makes it safer.', '["True", "False"]', 1, 'Adding steps often increases complexity and the "surface area" for potential errors, unless those steps are specific safety redundancies.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cognitive Bias - Anchoring
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stuck on the First Idea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stuck on the First Idea', 'A 50-year-old male with a history of alcohol use disorder presents with epigastric pain. The resident immediately diagnoses "alcoholic gastritis" and does not perform an EKG. The patient actually has an acute inferior MI.

Vitals: BP 110/70 mmHg, HR 95 bpm, RR 18 bpm.
Physical Examination: Mild epigastric tenderness.
Laboratory Results: Troponin I 2.5 ng/mL (later).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with a history of alcohol use disorder presents with epigastric pain. The resident immediately diagnoses "alcoholic gastritis" and does not perform an EKG. The patient actually has an acute inferior MI.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cognitive bias is the resident demonstrating?', '["Availability heuristic", "Anchoring bias", "Confirmation bias", "Blind spot bias"]', 1, 'Anchoring bias is the tendency to fixate on initial information (alcohol use + epigastric pain) and fail to adjust for subsequent or alternative possibilities.'),
    (v_case_id, 'How does anchoring bias contribute to diagnostic error?', '["By causing the doctor to order too many tests", "By preventing the consideration of alternative diagnoses (differential diagnosis)", "By making the doctor too slow", "It doesn''t; it usually helps"]', 1, 'Anchoring prevents "diagnostic flexibility" and often leads to premature closure.'),
    (v_case_id, 'What is a strategy to combat anchoring bias?', '["Relying on \"gut\" instinct", "Systematically considering a broad differential diagnosis for every patient", "Trusting the first impression", "Only seeing one patient at a time"]', 1, 'Deliberate "de-biasing" techniques, like "Metacognition" (thinking about your thinking) and formal differential diagnosis, help mitigate anchoring.');

    ---------------------------------------------------------------------------
    -- CASE 16: Cognitive Bias - Availability Heuristic
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Recent Case Effect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Recent Case Effect', 'A pediatrician just treated a rare case of Kawasaki disease yesterday. Today, a child presents with a fever and a mild rash. The pediatrician immediately suspects Kawasaki again, even though the child has no other criteria and viral exanthem is much more likely.

Vitals: Temp 101.5°F.
Physical Examination: Faint maculopapular rash on trunk.
Laboratory Results: Normal.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pediatrician just treated a rare case of Kawasaki disease yesterday. Today, a child presents with a fever and a mild rash. The pediatrician immediately suspects Kawasaki again, even though the child has no other criteria and viral exanthem is much more likely.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This cognitive bias is known as the:', '["Anchoring bias", "Availability heuristic", "Hindsight bias", "Sunk cost fallacy"]', 1, 'The availability heuristic is the tendency to judge the probability of an event based on how easily examples come to mind (e.g., a recent or dramatic case).'),
    (v_case_id, 'Availability bias is most likely to occur after:', '["A routine, boring case", "A dramatic, rare, or recent case", "Reading a textbook", "Taking a vacation"]', 1, 'Memorable cases are "more available" in the mind, leading clinicians to over-estimate their frequency.'),
    (v_case_id, 'True or False: Cognitive biases are a sign of a "bad" or "unintelligent" doctor.', '["True", "False"]', 1, 'Biases are natural shortcuts the human brain uses to process information. Even highly intelligent and experienced doctors are susceptible to them.');

    ---------------------------------------------------------------------------
    -- CASE 17: Cognitive Bias - Premature Closure
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stopping Too Soon' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stopping Too Soon', 'A 70-year-old woman with a history of COPD presents with worsening dyspnea. The doctor diagnoses "COPD exacerbation" and starts steroids and nebulizers. He does not order a chest X-ray. The patient actually has a large pneumothorax.

Vitals: BP 115/75 mmHg, HR 105 bpm, RR 26 bpm, O2 Sat 88% on 2L.
Physical Examination: Decreased breath sounds on the right.
Laboratory Results: Normal.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old woman with a history of COPD presents with worsening dyspnea. The doctor diagnoses "COPD exacerbation" and starts steroids and nebulizers. He does not order a chest X-ray. The patient actually has a large pneumothorax.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The tendency to accept a diagnosis before it has been fully verified is called:', '["Anchoring", "Premature closure", "Confirmation bias", "Blind obedience"]', 1, 'Premature closure is often cited as the most common reason for diagnostic error—the "when the diagnosis is made, the thinking stops" phenomenon.'),
    (v_case_id, 'What is the most effective way to prevent premature closure?', '["Ask \"What else could this be?\"", "Order every test available", "Trust your first instinct", "Read more textbooks"]', 0, 'Asking "What else could this be?" or "What findings don''t fit this diagnosis?" forces the clinician to keep the diagnostic process open.'),
    (v_case_id, 'True or False: Premature closure is often facilitated by other biases, such as anchoring.', '["True", "False"]', 0, 'Biases often work together; anchoring on a common diagnosis leads to premature closure of the investigation.');

    ---------------------------------------------------------------------------
    -- CASE 18: Medication Reconciliation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gap in the List' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gap in the List', 'A patient is admitted for heart failure. During admission, his chronic warfarin is not included in the medication list because the patient forgot to mention it and it wasn''t in the local pharmacy record. He is started on heparin. He develops a major GI bleed.

Vitals: BP 90/60 mmHg, HR 115 bpm.
Physical Examination: Pale conjunctiva, hematochezia.
Laboratory Results: INR 3.8, Hemoglobin 8.0 g/dL.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is admitted for heart failure. During admission, his chronic warfarin is not included in the medication list because the patient forgot to mention it and it wasn''t in the local pharmacy record. He is started on heparin. He develops a major GI bleed.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The process of creating the most accurate list possible of all medications a patient is taking is called:', '["Medication Reconciliation", "Medication Auditing", "Drug Profiling", "Pharmacovigilance"]', 0, 'Medication reconciliation is a formal process of comparing the patient''s current medications to those ordered during transitions of care.'),
    (v_case_id, 'At which point should medication reconciliation occur?', '["Only at admission", "Only at discharge", "At every transition of care (admission, transfer, discharge)", "Only if the patient asks"]', 2, 'Errors are most common during transitions (e.g., from the ED to the floor, or floor to the SNF).'),
    (v_case_id, 'What is the "Gold Standard" source for medication reconciliation?', '["The patient''s memory", "The local pharmacy database", "A multi-source approach (patient, family, pill bottles, pharmacy, old records)", "The insurance company"]', 2, 'No single source is perfect; a comprehensive approach is required to ensure accuracy.');

    ---------------------------------------------------------------------------
    -- CASE 19: Alarm Fatigue
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Boy Who Cried Wolf' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Boy Who Cried Wolf', 'In a busy telemetry unit, there are hundreds of alarms every hour, 90% of which are "false alarms" (e.g., lead disconnects). A nurse ignores a low-priority beep from Room 12. Ten minutes later, the patient is found in cardiac arrest.

Vitals: 0/0/0.
Physical Examination: Pulseless, unresponsive.
Laboratory Results: EKG shows ventricular fibrillation.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'In a busy telemetry unit, there are hundreds of alarms every hour, 90% of which are "false alarms" (e.g., lead disconnects). A nurse ignores a low-priority beep from Room 12. Ten minutes later, the patient is found in cardiac arrest.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This phenomenon is known as:', '["Burnout", "Alarm Fatigue", "Compassion Fatigue", "Moral Injury"]', 1, 'Alarm fatigue occurs when clinicians are desensitized to safety alerts due to the high volume of clinically insignificant (false) alarms.'),
    (v_case_id, 'What is an effective systems-level strategy to reduce alarm fatigue?', '["Firing nurses who miss alarms", "Increasing the volume of the alarms", "Adjusting alarm thresholds to be more clinically relevant and reducing non-actionable alerts", "Turning off all alarms"]', 2, 'Refining alarm settings so they only trigger for meaningful events is a key safety strategy.'),
    (v_case_id, 'True or False: Alert fatigue can also occur with EHR pop-ups (e.g., drug-drug interaction warnings).', '["True", "False"]', 0, 'Clinicians often "click through" EHR warnings if they are too frequent and mostly irrelevant, leading to missed critical alerts.');

    ---------------------------------------------------------------------------
    -- CASE 20: Equipment Design - Human Factors
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Confusing Ventilator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Confusing Ventilator', 'A hospital purchases a new model of ventilator where the "Increase FiO2" button is located in the same spot where the "Power Off" button was on the old model. An experienced therapist accidentally turns off the machine during a routine adjustment.

Vitals: O2 Sat drops to 70%.
Physical Examination: Patient is cyanotic.
Laboratory Results: Normal.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital purchases a new model of ventilator where the "Increase FiO2" button is located in the same spot where the "Power Off" button was on the old model. An experienced therapist accidentally turns off the machine during a routine adjustment.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is an example of a failure in:', '["Human Factors Engineering", "Medical education", "Staff discipline", "Financial planning"]', 0, 'Human Factors Engineering (or Ergonomics) is the science of designing equipment and systems to fit human capabilities and prevent error.'),
    (v_case_id, 'Which principle was violated in the design of the new ventilator?', '["Standardization/Consistency", "Complexity", "Forcing function", "Redundancy"]', 0, 'By changing the location of a critical button, the design violated the principle of consistency, leading to a "habit-based" error.'),
    (v_case_id, 'What is the best way to prevent such errors when new equipment is introduced?', '["Reading the manual", "Usability testing and rigorous staff training/simulation", "Hiring smarter therapists", "Writing a warning label"]', 1, 'Usability testing identifies potential design flaws before the equipment reaches the patient.');

    ---------------------------------------------------------------------------
    -- CASE 21: Failure Mode and Effects Analysis (FMEA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Finding the Failure Before it Happens' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Finding the Failure Before it Happens', 'A hospital is planning to implement a new robotic-assisted surgery program. Before the first case, a team meets to brainstorm all the possible ways the system could fail (e.g., power outage, software glitch, mechanical failure) and ranks them by severity and probability.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital is planning to implement a new robotic-assisted surgery program. Before the first case, a team meets to brainstorm all the possible ways the system could fail (e.g., power outage, software glitch, mechanical failure) and ranks them by severity and probability.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This proactive process is known as:', '["Root Cause Analysis (RCA)", "Failure Mode and Effects Analysis (FMEA)", "PDSA Cycle", "Lean Six Sigma"]', 1, 'FMEA is a prospective/proactive tool used to identify and prevent potential failures before they occur.'),
    (v_case_id, 'How does FMEA differ from RCA?', '["FMEA is retrospective; RCA is prospective", "FMEA is prospective; RCA is retrospective", "They are identical", "FMEA is for individuals; RCA is for systems"]', 1, 'RCA looks back at an error that already happened; FMEA looks forward to identify potential errors.'),
    (v_case_id, 'Which of the following is a key step in FMEA?', '["Assigning blame to the highest-ranking doctor", "Calculating a Risk Priority Number (RPN) for each failure mode", "Waiting for a sentinel event to occur", "Interviewing the patient''s family"]', 1, 'FMEA uses RPNs (Severity x Probability x Detectability) to prioritize which risks to address first.');

    ---------------------------------------------------------------------------
    -- CASE 22: PDSA Cycle - Plan
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Planning for Change' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Planning for Change', 'The cardiology department wants to reduce the "Door-to-Balloon" time for STEMI patients. They hypothesize that having the ED physician activate the cath lab directly (instead of calling the cardiologist first) will save 15 minutes. They plan to test this for one week.

Vitals: ST-segment elevation on EKG.
Physical Examination: Chest pain, diaphoresis.
Laboratory Results: Elevated troponin.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The cardiology department wants to reduce the "Door-to-Balloon" time for STEMI patients. They hypothesize that having the ED physician activate the cath lab directly (instead of calling the cardiologist first) will save 15 minutes. They plan to test this for one week.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of the PDSA cycle does this represent?', '["Plan", "Do", "Study", "Act"]', 0, 'The "Plan" phase involves identifying the problem, stating the goal, and designing the test/intervention.'),
    (v_case_id, 'A good "Plan" phase should always include:', '["The firing of the person who caused the delay", "A clear hypothesis and measurable objectives", "A permanent change to the hospital bylaws", "A large budget increase"]', 1, 'PDSA is based on the scientific method; you need a hypothesis to test.'),
    (v_case_id, 'True or False: PDSA cycles should ideally be large-scale, hospital-wide implementations from the start.', '["True", "False"]', 1, 'PDSA cycles are intended to be "small-scale" tests of change that can be iterated quickly.');

    ---------------------------------------------------------------------------
    -- CASE 23: PDSA Cycle - Do
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Executing the Test' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Executing the Test', 'The department starts the one-week trial where ED physicians activate the cath lab directly. They collect data on the time of activation, time of balloon inflation, and any unforeseen challenges encountered during the process.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The department starts the one-week trial where ED physicians activate the cath lab directly. They collect data on the time of activation, time of balloon inflation, and any unforeseen challenges encountered during the process.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of the PDSA cycle does this represent?', '["Plan", "Do", "Study", "Act"]', 1, 'The "Do" phase is the actual execution of the small-scale test and the collection of data.'),
    (v_case_id, 'During the "Do" phase, what is the primary focus?', '["Analyzing the results", "Making final decisions", "Executing the plan and observing what happens", "Planning the next cycle"]', 2, 'Execution and observation are the hallmarks of the "Do" phase.'),
    (v_case_id, 'True or False: If something goes wrong during the "Do" phase, the test should be stopped immediately and permanently.', '["True", "False"]', 1, 'Failures during the "Do" phase are valuable data points for the "Study" and "Act" phases.');

    ---------------------------------------------------------------------------
    -- CASE 24: PDSA Cycle - Study
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Analyzing the Data' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Analyzing the Data', 'After the week-long trial, the team analyzes the data. They find that Door-to-Balloon times dropped by 18 minutes. However, they also noticed two "false activations" where the cath lab was called for non-STEMI cases.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After the week-long trial, the team analyzes the data. They find that Door-to-Balloon times dropped by 18 minutes. However, they also noticed two "false activations" where the cath lab was called for non-STEMI cases.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of the PDSA cycle does this represent?', '["Plan", "Do", "Study", "Act"]', 2, 'The "Study" (or Check) phase involves comparing the results to the original hypothesis and learning from any unexpected outcomes.'),
    (v_case_id, 'What is the most important output of the "Study" phase?', '["A list of people to blame", "Learning and insights for the next iteration", "A finalized hospital policy", "A budget report"]', 1, 'The goal is to understand if the change worked and what adjustments are needed.'),
    (v_case_id, 'If the data shows the change was NOT effective, what should the team do?', '["Give up", "Proceed to the \"Act\" phase to figure out why and how to modify the test", "Implement it anyway", "Ignore the data"]', 1, 'Even "failed" tests provide data for the next cycle.');

    ---------------------------------------------------------------------------
    -- CASE 25: PDSA Cycle - Act
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Making the Decision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Making the Decision', 'The team decides to keep the ED-direct activation protocol but adds a mandatory EKG review by the ED attending before activation to reduce false alarms. They plan to test this modified protocol for another week.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The team decides to keep the ED-direct activation protocol but adds a mandatory EKG review by the ED attending before activation to reduce false alarms. They plan to test this modified protocol for another week.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of the PDSA cycle does this represent?', '["Plan", "Do", "Study", "Act"]', 3, 'The "Act" phase involves deciding whether to adopt, adapt, or abandon the change based on the findings from the "Study" phase.'),
    (v_case_id, 'In this case, the team is __________ the change.', '["Adopting", "Adapting", "Abandoning", "Ignoring"]', 1, 'They are adapting the change by adding the EKG review step to improve the process before the next test.'),
    (v_case_id, 'True or False: The end of the "Act" phase often marks the start of a new "Plan" phase.', '["True", "False"]', 0, 'PDSA is a continuous cycle of improvement, not a one-time event.');

    ---------------------------------------------------------------------------
    -- CASE 26: Lean Methodology - Eliminating Waste
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lean Clinic' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lean Clinic', 'An orthopedic clinic notices that patients spend 30 minutes in the waiting room, 10 minutes in the exam room before the doctor arrives, and then have to wait another 20 minutes for X-rays. They re-organize the workflow so X-rays are done BEFORE the doctor visit, reducing total visit time by 45 minutes.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An orthopedic clinic notices that patients spend 30 minutes in the waiting room, 10 minutes in the exam room before the doctor arrives, and then have to wait another 20 minutes for X-rays. They re-organize the workflow so X-rays are done BEFORE the doctor visit, reducing total visit time by 45 minutes.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This approach is a core principle of:', '["Six Sigma", "Lean Methodology", "Root Cause Analysis", "Case-Control Study"]', 1, 'Lean focuses on eliminating waste (Muda) and improving the flow of value to the customer/patient.'),
    (v_case_id, 'In Lean terms, waiting for X-rays is considered:', '["Value-added time", "Waste (Non-value-added time)", "Essential service", "Productivity"]', 1, 'Waiting is one of the classic forms of waste in Lean methodology.'),
    (v_case_id, 'Which of the following is another example of Lean "waste" in medicine?', '["Performing the same blood test twice due to lost results", "Patient walking from one building to another for a pharmacy", "Excessive inventory of expensive supplies that expire", "All of the above"]', 3, 'Lean identifies waste in transportation, inventory, motion, waiting, over-processing, over-production, and defects (TIM WOOD).');

    ---------------------------------------------------------------------------
    -- CASE 27: Six Sigma - Reducing Variation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Standardizing the Dose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Standardizing the Dose', 'A pharmacy finds that the concentration of an extemporaneously compounded pediatric liquid varies by +/- 20% between batches. They implement a standardized automated mixing process that reduces the variation to +/- 0.001%.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pharmacy finds that the concentration of an extemporaneously compounded pediatric liquid varies by +/- 20% between batches. They implement a standardized automated mixing process that reduces the variation to +/- 0.001%.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This approach of reducing variation to near zero is known as:', '["Lean", "Six Sigma", "RCA", "FMEA"]', 1, 'Six Sigma is a data-driven approach focused on reducing variation and defects in a process.'),
    (v_case_id, 'The term "Six Sigma" refers to a process that produces fewer than __________ defects per million opportunities.', '["3.4", "34", "340", "3400"]', 0, 'A Six Sigma process is exceptionally stable and reliable, with a 99.99966% success rate.'),
    (v_case_id, 'While Lean focuses on "Waste," Six Sigma focuses on:', '["Cost", "Variation", "Speed", "Documentation"]', 1, 'The core goal of Six Sigma is to minimize variation so that the outcome is predictable and high-quality every time.');

    ---------------------------------------------------------------------------
    -- CASE 28: Donabedian Model - Structure
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Physical Environment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Physical Environment', 'To reduce infection rates, a hospital installs 500 new hand-sanitizer dispensers next to every patient bed and increases the nurse-to-patient ratio in the ICU from 1:3 to 1:2.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'To reduce infection rates, a hospital installs 500 new hand-sanitizer dispensers next to every patient bed and increases the nurse-to-patient ratio in the ICU from 1:3 to 1:2.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the Donabedian Model, these changes represent:', '["Structure", "Process", "Outcome", "Efficiency"]', 0, 'Structure refers to the context in which care is delivered, including facilities, equipment, staffing, and organizational culture.'),
    (v_case_id, 'Which of the following is an example of a "Structure" measure?', '["The percentage of patients who received a flu shot", "The availability of 24/7 cardiac catheterization capability", "The 30-day readmission rate", "The patient satisfaction score"]', 1, 'Availability of services/equipment is a structural attribute.'),
    (v_case_id, 'True or False: Improving structure automatically guarantees improved outcomes.', '["True", "False"]', 1, 'Good structure is necessary but not sufficient for good outcomes; the processes of care must also be high-quality.');

    ---------------------------------------------------------------------------
    -- CASE 29: Donabedian Model - Process
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steps of Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steps of Care', 'An audit reveals that only 75% of diabetic patients are receiving an annual foot exam as recommended by clinical guidelines. The clinic implements a system where the nurse removes the patient''s shoes at every visit to prompt the exam.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: HbA1c 7.8%.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An audit reveals that only 75% of diabetic patients are receiving an annual foot exam as recommended by clinical guidelines. The clinic implements a system where the nurse removes the patient''s shoes at every visit to prompt the exam.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the Donabedian Model, the "foot exam" is a:', '["Structure measure", "Process measure", "Outcome measure", "Financial measure"]', 1, 'Process refers to the actual interactions and activities between the provider and the patient (what was done).'),
    (v_case_id, 'Why are process measures often preferred over outcome measures for internal QI projects?', '["They are easier to measure and more directly linked to clinician action", "They are more expensive", "They don''t require patient consent", "They are always 100% accurate"]', 0, 'Process measures (like "giving a drug") are easier to track and actionable compared to outcomes (like "mortality") which are influenced by many factors.'),
    (v_case_id, 'True or False: A process measure must be evidence-based (linked to a desired outcome) to be useful.', '["True", "False"]', 0, 'There is no point in measuring a process that doesn''t actually improve patient health.');

    ---------------------------------------------------------------------------
    -- CASE 30: Donabedian Model - Outcome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Final Result' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Final Result', 'A hospital reports that its surgical site infection (SSI) rate for hip replacements has dropped from 2.5% to 0.8% over the last two years following a major quality initiative.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital reports that its surgical site infection (SSI) rate for hip replacements has dropped from 2.5% to 0.8% over the last two years following a major quality initiative.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the Donabedian Model, the "SSI rate" is an:', '["Structure", "Process", "Outcome", "Adverse Event"]', 2, 'Outcomes are the end results of the healthcare process, such as changes in health status, mortality, or complications.'),
    (v_case_id, 'Which of the following is a classic "Outcome" measure?', '["30-day mortality after MI", "Percentage of patients with BP < 140/90", "Patient satisfaction scores", "All of the above"]', 3, 'Outcomes include clinical results, functional status, and patient satisfaction.'),
    (v_case_id, 'What is a major challenge when using outcome measures like mortality to compare different hospitals?', '["They are too easy to calculate", "They must be adjusted for patient \"risk\" (acuity/severity of illness)", "They are not important to patients", "They are too expensive"]', 1, 'Risk adjustment is crucial; a hospital that treats sicker patients will naturally have higher mortality rates regardless of the quality of care.');

    ---------------------------------------------------------------------------
    -- CASE 31: Human Factors - Redundancy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Double Check' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Double Check', 'A hospital implements a policy requiring two nurses to independently verify the patient, drug, dose, and route for all high-alert medications (e.g., insulin, heparin, chemotherapy).

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital implements a policy requiring two nurses to independently verify the patient, drug, dose, and route for all high-alert medications (e.g., insulin, heparin, chemotherapy).', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This safety strategy is known as:', '["Standardization", "Redundancy", "Forcing function", "Simplification"]', 1, 'Redundancy involves building in double-checks or backup systems so that a single failure does not reach the patient.'),
    (v_case_id, 'For redundancy to be effective, the double-check must be:', '["Simultaneous", "Independent", "Done by the same person twice", "Recorded on paper only"]', 1, 'An independent double-check (where the second person does not know the first person''s result) is significantly more effective at catching errors.'),
    (v_case_id, 'True or False: Adding redundancy always improves safety without any downsides.', '["True", "False"]', 1, 'Excessive redundancy can lead to "social loafing" (assuming the other person caught the error) or increased complexity/delay.');

    ---------------------------------------------------------------------------
    -- CASE 32: Forcing Functions - Physical Barriers
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Tubing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Tubing', 'To prevent the accidental administration of IV fluids into a tracheostomy cuff or enteral tube, a hospital switches to tubing connectors that physically cannot be joined together.

Vitals: Normal.
Physical Examination: Tracheostomy in place.
Laboratory Results: Normal.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'To prevent the accidental administration of IV fluids into a tracheostomy cuff or enteral tube, a hospital switches to tubing connectors that physically cannot be joined together.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is an example of a:', '["Standardization", "Simplification", "Forcing function", "Redundancy"]', 2, 'Forcing functions are design features that make it impossible to perform a task incorrectly (e.g., a car that won''t start unless in Park).'),
    (v_case_id, 'Why are forcing functions considered the \"strongest\" human factors intervention?', '["They are the cheapest", "They rely on education", "They do not rely on human memory or vigilance", "They are mandated by law"]', 2, 'By creating a physical or hard-coded barrier, they remove the possibility of human error.'),
    (v_case_id, 'Which of the following is another example of a forcing function?', '["Oxygen and suction wall outlets having different shapes", "An EHR that prevents ordering a drug if a severe allergy is documented", "Both A and B", "Neither"]', 2, 'Both physical and digital "hard stops" are forcing functions.');

    ---------------------------------------------------------------------------
    -- CASE 33: Communication - SBAR
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Calling the Surgeon' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Calling the Surgeon', 'A nurse calls a surgeon at 2 AM to report that a post-op patient has a sudden drop in blood pressure and increased drain output. She says, \"I''m in Room 502. Mr. Smith had a bowel resection. His BP is 80/50. I think he''s bleeding. I need you to come to the bedside now.\"

Vitals: BP 80/50 mmHg, HR 120 bpm.
Physical Examination: Pale, diaphoretic, 500mL bloody output in JP drain.
Laboratory Results: Hemoglobin 6.5 g/dL.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A nurse calls a surgeon at 2 AM to report that a post-op patient has a sudden drop in blood pressure and increased drain output.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The nurse is using which communication tool?', '["SBAR", "I-PASS", "Check-back", "Call-out"]', 0, 'SBAR (Situation, Background, Assessment, Recommendation) provides a structured framework for clear and concise communication.'),
    (v_case_id, 'In the nurse''s call, \"I think he''s bleeding\" represents which part of SBAR?', '["Situation", "Background", "Assessment", "Recommendation"]', 2, 'The assessment (A) is the clinician''s conclusion about what is happening.'),
    (v_case_id, '\"I need you to come to the bedside now\" represents which part of SBAR?', '["Situation", "Background", "Assessment", "Recommendation"]', 3, 'The recommendation (R) is the specific action requested.');

    ---------------------------------------------------------------------------
    -- CASE 34: Communication - Closed-Loop
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Critical Result' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Critical Result', 'A lab technician calls a nurse with a critical potassium value of 7.2 mEq/L. The nurse says, \"Okay, I got it, thank you,\" and hangs up. The lab technician is not sure if the nurse heard the correct value.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Potassium 7.2 mEq/L.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A lab technician calls a nurse with a critical potassium value of 7.2 mEq/L. The nurse says, \"Okay, I got it, thank you,\" and hangs up.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which communication technique should the nurse have used to ensure the message was received correctly?', '["Call-out", "Closed-loop communication (Read-back)", "SBAR", "Handover"]', 1, 'Closed-loop communication involves the receiver repeating the message back to the sender to confirm accuracy.'),
    (v_case_id, 'Closed-loop communication is particularly vital in which settings?', '["High-stakes environments (OR, Code Blue, trauma)", "Routine office visits", "Cafeteria", "Board meetings"]', 0, 'In critical situations, \"hearing\" is not the same as \"understanding,\" and verification is essential.'),
    (v_case_id, 'If the nurse had said, \"I have Mr. X in Room 10, potassium is 7.2, I will notify the doctor,\" she would be completing the __________.', '["Handoff", "Loop", "SBAR", "Assessment"]', 1, 'Repeating the critical information completes the communication loop.');

    ---------------------------------------------------------------------------
    -- CASE 35: The WHO Surgical Safety Checklist
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Before the Knife' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Before the Knife', 'A surgical team is about to start a hernia repair. Before the patient is anesthetized, the nurse asks the patient to state their name and the procedure. Before the incision, the team confirms antibiotics were given. Before the patient leaves the OR, they count the sponges.

Vitals: Stable.
Physical Examination: Left inguinal hernia.
Laboratory Results: Normal.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surgical team is using the WHO Surgical Safety Checklist. They perform checks at three specific points: Sign-in, Time-out, and Sign-out.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The use of the WHO Surgical Safety Checklist has been shown to:', '["Increase the time of surgery by 50%", "Significantly reduce surgical morbidity and mortality", "Have no effect on safety", "Increase the cost of surgery"]', 1, 'Large-scale studies have shown that consistent use of the checklist significantly reduces complications and deaths.'),
    (v_case_id, 'Which phase occurs AFTER the surgery is completed but BEFORE the patient leaves the room?', '["Sign-in", "Time-out", "Sign-out", "Post-op"]', 2, 'The Sign-out phase includes sponge counts, labeling of specimens, and reviewing post-op plans.'),
    (v_case_id, 'True or False: Checklists are only useful for junior staff; experts don''t need them.', '["True", "False"]', 1, 'Checklists are essential for experts because they prevent \"memory lapses\" and ensure standardized performance in complex environments.');

    ---------------------------------------------------------------------------
    -- CASE 36: Handoffs - I-PASS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Improving the Shift Change' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Improving the Shift Change', 'A pediatric residency program implements the I-PASS handoff bundle. Residents now use a standard format for oral handoffs and a synchronized written tool.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pediatric residency program implements the I-PASS handoff bundle.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the \"I\" in I-PASS stand for?', '["Identification", "Illness Severity", "Intervention", "Incident"]', 1, 'I-PASS stands for Illness severity, Patient summary, Action list, Situation awareness/contingency planning, and Synthesis by the receiver.'),
    (v_case_id, 'The \"S\" at the very end of I-PASS (Synthesis) requires the receiver to:', '["Sign the chart", "Summarize what they heard and ask questions", "Start the first task", "Sleep"]', 1, 'Synthesis is the closed-loop part of the handoff where the receiver confirms their understanding.'),
    (v_case_id, 'Which part of I-PASS is designed to handle \"What if?\" scenarios?', '["Patient summary", "Action list", "Situation awareness and contingency planning", "Illness severity"]', 2, 'Contingency planning ensures the night team knows what to do if the patient''s condition changes (e.g., \"If BP drops, give 500mL bolus\").');

    ---------------------------------------------------------------------------
    -- CASE 37: Graded Assertiveness - CUS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Speaking Up' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Speaking Up', 'A medical student notices a senior surgeon is about to cut a structure that looks like the ureter during a hysterectomy. The student is nervous but says, \"I am concerned that might be the ureter. I am uncomfortable proceeding. I think this is a safety issue.\"

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student notices a senior surgeon is about to cut a structure that looks like the ureter. The student uses the \"CUS\" mnemonic.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The \"CUS\" mnemonic stands for:', '["Call, Use, Stop", "Concerned, Uncomfortable, Safety issue", "Check, Understand, Solve", "Critical, Urgent, Serious"]', 1, 'CUS is a graded assertiveness tool that allows any team member to \"stop the line\" when they perceive a threat to patient safety.'),
    (v_case_id, 'Why is a tool like CUS necessary in healthcare?', '["To teach students anatomy", "To overcome the \"hierarchy gradient\" that prevents junior staff from speaking up", "To slow down surgeries", "To generate more paperwork"]', 1, 'The hierarchy gradient (fear of authority) is a major barrier to communication and safety.'),
    (v_case_id, 'What should the surgeon''s response be to a \"CUS\" statement?', '["Ignore the student", "Tell the student to be quiet", "Stop and address the concern immediately", "Wait until after the surgery to discuss"]', 2, 'A \"CUS\" statement is a hard-stop that requires the team to pause and verify the safety of the next step.');

    ---------------------------------------------------------------------------
    -- CASE 38: Just Culture - Human Error vs. Recklessness
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Just Culture Decision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Just Culture Decision', 'Nurse A makes a mistake because she was distracted by a poorly designed alarm system. Nurse B makes a mistake because he intentionally bypassed a mandatory barcode scan to \"save time\" even though he knew the risk.

Vitals: Both patients stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital administrator is evaluating two different medication errors using a \"Just Culture\" framework.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a Just Culture, how should Nurse A (distracted by system flaw) be handled?', '["Fired", "Suspended", "Supported, and the system flaw should be fixed", "Re-trained only"]', 2, 'Just Culture recognizes that human error in a flawed system is a systemic issue, not a personal one.'),
    (v_case_id, 'In a Just Culture, how should Nurse B (intentional bypass of safety rule) be handled?', '["Supported", "Ignored", "Accountability/Disciplinary action", "Give them a promotion"]', 2, 'Just Culture holds individuals accountable for reckless behavior (consciously disregarding a substantial and unjustifiable risk).'),
    (v_case_id, 'What is the primary goal of a Just Culture?', '["To eliminate all discipline", "To create a \"Blame-Free\" culture where no one is responsible", "To balance system learning with individual accountability", "To fire more people"]', 2, 'A Just Culture encourages reporting by not punishing honest errors, while still maintaining accountability for truly reckless behavior.');

    ---------------------------------------------------------------------------
    -- CASE 39: Error Disclosure
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Difficult Conversation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Difficult Conversation', 'A surgeon accidentally nicks the bowel during an appendectomy. He repairs it immediately and the patient recovers, but the hospital stay is extended by two days.

Vitals: Stable.
Physical Examination: Healing surgical incision.
Laboratory Results: Normal.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surgeon must disclose a surgical complication to a patient.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the key elements of a proper error disclosure?', '["Apology, explanation of what happened, and plan to prevent recurrence", "Blaming the equipment, saying \"I''m sorry you feel that way,\" and leaving quickly", "Waiting for the patient''s lawyer to call", "Only telling the truth if the patient is likely to find out"]', 0, 'A full disclosure involves an apology (saying \"I am sorry this happened\"), a factual explanation, and a commitment to fix the system.'),
    (v_case_id, 'Does an apology increase the likelihood of a lawsuit?', '["Yes, always", "No, evidence suggests it often reduces the likelihood of litigation", "Only if the doctor is crying", "It has no effect"]', 1, 'Transparency and an honest apology often maintain the patient''s trust and reduce the desire to sue.'),
    (v_case_id, 'True or False: In many states, a \"partial apology\" (expressing sympathy) is not admissible as evidence of liability.', '["True", "False"]', 0, 'Many states have \"Apology Laws\" that protect clinicians'' expressions of sympathy or regret from being used against them in court.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Second Victim
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hidden Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hidden Trauma', 'An ICU nurse is involved in a medication error that leads to a patient''s death. The nurse is devastated, develops insomnia, and is afraid to return to work.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A nurse is experiencing emotional distress after being involved in a medical error.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The term for a healthcare provider who is traumatized by their involvement in an adverse event is:', '["The Primary Victim", "The Second Victim", "The Latent Failure", "The Active Failure"]', 1, 'The \"Second Victim\" phenomenon recognizes the significant psychological impact on clinicians following medical errors.'),
    (v_case_id, 'Which of the following is a symptom of the Second Victim phenomenon?', '["Guilt and shame", "Anxiety and depression", "Fear of litigation or loss of license", "All of the above"]', 3, 'Clinicians often experience a range of symptoms that can lead to burnout or leaving the profession.'),
    (v_case_id, 'What is the best way for a hospital to support a \"Second Victim\"?', '["Give them a formal reprimand", "Provide emotional support through peer programs or counseling", "Tell them to \"get over it\"", "Ignore them"]', 1, 'Peer support and a non-punitive environment are critical for the well-being of the clinician and the long-term safety of the system.');

    ---------------------------------------------------------------------------
    -- CASE 41: Culture of Safety
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reporting Without Fear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reporting Without Fear', 'A hospital implements an anonymous online reporting system for all incidents, near misses, and safety concerns. In the first year, reports increase by 300%, but actual adverse events decrease by 20%.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital implements an anonymous online reporting system for all incidents.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is an increase in reports often seen as a POSITIVE sign in patient safety?', '["It means more people are making mistakes", "It indicates a \"Culture of Safety\" where staff feel safe to speak up", "It increases hospital revenue", "It makes the hospital look busy"]', 1, 'More reports mean more opportunities to learn and fix system problems before they cause harm.'),
    (v_case_id, 'A \"Culture of Safety\" is characterized by:', '["Psychological safety", "A focus on systems rather than individuals", "Willingness to learn from errors", "All of the above"]', 3, 'In a safety culture, the organization prioritizes safety over productivity and supports its staff in identifying risks.'),
    (v_case_id, 'True or False: Leadership engagement is the most important factor in establishing a culture of safety.', '["True", "False"]', 0, 'Safety culture must be modeled and supported from the top down.');

    ---------------------------------------------------------------------------
    -- CASE 42: Value-Based Care - MACRA and MIPS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paying for Performance' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paying for Performance', 'A family physician receives a \"bonus\" payment from Medicare because her quality scores (e.g., vaccination rates, diabetic control) are in the top 10% nationwide.

Vitals: HbA1c 6.5%.
Physical Examination: Normal.
Laboratory Results: Normal.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician is participating in the Merit-based Incentive Payment System (MIPS).', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The shift from \"Fee-for-Service\" to payments based on quality and cost is called:', '["Capitation", "Value-Based Care", "Indemnity insurance", "Socialized medicine"]', 1, 'Value-based care (like MACRA/MIPS) aims to reward providers for delivering better outcomes at a lower cost.'),
    (v_case_id, 'What is a potential downside of value-based care?', '["It makes care too high quality", "It might discourage physicians from taking on \"high-risk\" or non-compliant patients", "It reduces the number of doctors", "It increases all premiums"]', 1, 'If not risk-adjusted correctly, providers might \"cherry-pick\" easy patients to keep their scores high.'),
    (v_case_id, 'Which of the following is a major goal of the Affordable Care Act (ACA) regarding quality?', '["To pay doctors less", "To transition the system toward value-based purchasing", "To eliminate all private insurance", "To ban specialists"]', 1, 'The ACA introduced several initiatives to link Medicare payments to hospital and physician performance on quality metrics.');

    ---------------------------------------------------------------------------
    -- CASE 43: HCAHPS - The Patient Experience
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient''s Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient''s Voice', 'A hospital receives a lower-than-average score on the \"Communication with Doctors\" section of the national HCAHPS survey. They implement a \"sit-down\" policy where doctors must sit in a chair while talking to the patient.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital is reviewing its HCAHPS survey results.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'HCAHPS is a standardized survey used to measure:', '["Clinical outcomes", "Patient experience of care", "Hospital profitability", "Doctor-to-nurse ratios"]', 1, 'HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) measures patients'' perspectives on their hospital stay.'),
    (v_case_id, 'Why does CMS link HCAHPS scores to hospital reimbursement?', '["To save money", "To incentivize hospitals to improve patient-centeredness and communication", "To punish doctors", "To promote marketing"]', 1, 'Patient experience is considered a key component of healthcare quality.'),
    (v_case_id, 'Which of the following is NOT a domain measured by HCAHPS?', '["Cleanliness of hospital environment", "Pain management communication", "The surgeon''s technical skill in the OR", "Discharge information"]', 2, 'HCAHPS focuses on the patient''s *perception* of communication and environment, not technical surgical competence.');

    ---------------------------------------------------------------------------
    -- CASE 44: Clinical Practice Guidelines
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Evidence-Based Practice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Evidence-Based Practice', 'A hospital system implements a mandatory \"Pneumonia Pathway\" based on IDSA/ATS guidelines. All patients with CAP must receive specific empiric antibiotics within 4 hours.

Vitals: BP 110/70, HR 105, RR 24, Temp 102.1.
Physical Examination: Crackles in the right base.
Laboratory Results: CXR shows RLL infiltrate.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital system implements a clinical practice guideline for community-acquired pneumonia.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The primary purpose of clinical practice guidelines is to:', '["Make doctors obsolete", "Reduce inappropriate variation in care and improve quality", "Increase costs", "Limit patient choice"]', 1, 'Guidelines standardize care based on the best available evidence to improve outcomes and efficiency.'),
    (v_case_id, 'True or False: A doctor can never deviate from a clinical guideline.', '["True", "False"]', 1, 'Guidelines are recommendations; clinicians must use their judgment for individual patients who may have contraindications or unique circumstances.'),
    (v_case_id, 'A \"Clinical Pathway\" differs from a \"Guideline\" in that it:', '["Is purely academic", "Is a site-specific, time-sequenced plan of care for a specific diagnosis", "Is not evidence-based", "Is only for nurses"]', 1, 'Pathways translate general guidelines into specific local workflows (e.g., \"Order X, then do Y on Day 2\").');

    ---------------------------------------------------------------------------
    -- CASE 45: Computerized Physician Order Entry (CPOE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Digital Safety Net' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Digital Safety Net', 'A hospital transitions from paper orders to CPOE. A resident tries to order a 10-fold dose of a pediatric medication, but the system flashes a red warning and prevents the order from being signed.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital is using Computerized Physician Order Entry (CPOE).', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary safety benefit of CPOE?', '["Elimination of handwriting errors", "Automated dose-checking and drug-interaction alerts", "Integration with the pharmacy and lab systems", "All of the above"]', 3, 'CPOE addresses many of the common causes of medication errors seen with paper systems.'),
    (v_case_id, 'Which of the following is a potential \"unintended consequence\" or risk of CPOE?', '["Alert fatigue", "Selection of the wrong patient from a drop-down list", "Over-reliance on the computer", "All of the above"]', 3, 'Electronic systems can introduce new types of errors (e.g., \"copy-paste\" errors or \"click-errors\").'),
    (v_case_id, 'The requirement for hospitals to use EHRs in specific ways to improve care was part of which federal program?', '["The Affordable Care Act", "Meaningful Use (HITECH Act)", "The Stark Law", "The Civil Rights Act"]', 1, 'Meaningful Use provided incentives for hospitals to adopt EHR technology to improve safety and coordination.');

    ---------------------------------------------------------------------------
    -- CASE 46: Patient Engagement in Safety
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient as a Partner' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient as a Partner', 'A hospital puts posters in every room saying, \"It''s OK to ask: Did you wash your hands?\" A patient reminds a visiting specialist to use the sanitizer before touching their incision.

Vitals: Stable.
Physical Examination: Post-op abdominal wound.
Laboratory Results: Normal.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital encourages patient involvement in safety.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Engaging patients in their own safety is an example of:', '["Shifting responsibility to the patient", "Patient-Centered Care", "Redundancy", "Laziness by the staff"]', 1, 'Patient-centered care respects the patient as a partner in the healthcare team.'),
    (v_case_id, 'What is the \"Speak Up\" campaign?', '["A program to help doctors talk louder", "A national initiative to encourage patients to ask questions and report concerns", "A legal defense strategy", "A patient satisfaction survey"]', 1, 'The \"Speak Up\" campaign aims to empower patients to be an active safety layer.'),
    (v_case_id, 'True or False: Most patients are comfortable correcting a doctor who forgets to wash their hands.', '["True", "False"]', 1, 'Studies show many patients feel uncomfortable \"challenging\" authority, which is why hospitals must actively invite them to do so.');

    ---------------------------------------------------------------------------
    -- CASE 47: Handoff - The Discharge Process
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Going Home Safely' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Going Home Safely', 'An elderly man is discharged from the hospital after a stroke. The nurse uses the \"Teach-Back\" method to ensure he understands how to take his new blood thinner.

Vitals: Stable.
Physical Examination: Residual mild R arm weakness.
Laboratory Results: Normal.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is being discharged from the hospital.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Teach-Back\" method?', '["The nurse quizzes the patient", "The patient explains the instructions back in their own words", "The patient reads the manual", "The doctor teaches the nurse"]', 1, 'Teach-back is a validated tool to confirm patient understanding and improve health literacy.'),
    (v_case_id, 'What is the most common cause of readmission within 30 days?', '["Lack of follow-up care and poor understanding of discharge instructions", "Hospital-acquired infections", "Medical malpractice", "Patient choice"]', 0, 'Fragmentation of care during the discharge transition is a major safety risk.'),
    (v_case_id, 'Which element is CRITICAL for a safe discharge summary?', '["A list of all tests performed", "Clear follow-up appointments and a list of medication changes", "The hospital''s billing address", "The surgeon''s home phone number"]', 1, 'Clear instructions on \"What to do next\" are essential for post-discharge safety.');

    ---------------------------------------------------------------------------
    -- CASE 48: High Reliability Organizations (HROs)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Reliability Hospital' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Reliability Hospital', 'A hospital system models its safety culture after the nuclear power and aviation industries. They emphasize \"Preoccupation with failure\" and \"Sensitivity to operations.\"

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital system is striving to become a High Reliability Organization (HRO).', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a \"High Reliability Organization\" (HRO)?', '["A company that makes computers", "An organization that operates in complex, high-hazard domains for extended periods without serious accidents", "A hospital with the highest profits", "A government agency"]', 1, 'HROs (like aircraft carriers) manage to maintain exceptional safety despite operating in highly dangerous environments.'),
    (v_case_id, 'Which of the following is a hallmark of an HRO?', '["Deference to expertise (rather than just rank)", "Reluctance to simplify (looking for deeper causes)", "Commitment to resilience", "All of the above"]', 3, 'HROs value the input of those closest to the \"front line\" and constantly look for potential weaknesses.'),
    (v_case_id, 'In an HRO, \"Sensitivity to operations\" means:', '["Being sensitive to staff feelings", "Maintaining constant awareness of the current state of the system and its risks", "Reducing operating costs", "Using only local suppliers"]', 1, 'It involves \"situational awareness\" across the entire organization at all times.');

    ---------------------------------------------------------------------------
    -- CASE 49: Root Cause Analysis - The Outcome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fixing the System' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fixing the System', 'Following an RCA of a medication error, the team decides to purchase an automated dispensing cabinet (ADC) with bar-code scanning and to move the drug to a \"High Alert\" section of the pharmacy.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An RCA has identified several system failures.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these interventions is considered a \"strong\" safety measure?', '["A memo reminding staff of the error", "Implementing bar-code scanning/automation", "A one-hour training session", "A new warning label on the vial"]', 1, 'Technological solutions and forcing functions are stronger than education or memos because they don''t rely on human memory.'),
    (v_case_id, 'What is the \"Hierarchy of Controls\" in patient safety?', '["A list of hospital administrators", "A framework ranking the effectiveness of different types of safety interventions", "A way to organize the surgical team", "A legal classification of errors"]', 1, 'The hierarchy places physical/design changes at the top (strongest) and education/policy at the bottom (weakest).'),
    (v_case_id, 'Why is \"Education and Training\" considered a \"weak\" intervention on its own?', '["It is too expensive", "It doesn''t change the underlying system and relies on humans to be perfect", "Staff don''t like it", "It is illegal"]', 1, 'Education is necessary but rarely sufficient to prevent error in a poorly designed system.');

    ---------------------------------------------------------------------------
    -- CASE 50: Safety Net Hospitals
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Care for the Vulnerable' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Care for the Vulnerable', 'A large public hospital provides care for a high volume of uninsured and Medicaid patients. They struggle to meet quality benchmarks compared to wealthy private hospitals due to patient factors like homelessness and poor health literacy.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A safety-net hospital is participating in quality improvement programs.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of a \"Safety Net Hospital\"?', '["A hospital with a net on the roof", "A facility that provides care to a significant number of uninsured, Medicaid, and other vulnerable patients", "A hospital that only does emergency care", "A mental health facility"]', 1, 'Safety net hospitals are critical for health equity but often face significant financial and resource challenges.'),
    (v_case_id, 'Which factor is most likely to negatively impact quality scores at a safety net hospital?', '["Poor doctor quality", "Social Determinants of Health (SDoH) impacting patient outcomes and follow-up", "Lack of expensive art in the lobby", "Using generic drugs"]', 1, 'SDoH (e.g., housing instability, food insecurity) significantly influence outcomes like readmission rates.'),
    (v_case_id, 'True or False: Quality measures should be \"sociodemographically adjusted\" to avoid unfairly punishing safety-net providers.', '["True", "False"]', 0, 'Adjusting for social risk factors ensures that providers serving the most vulnerable are not financially penalized for factors outside their control.');

END $$;

COMMIT;
