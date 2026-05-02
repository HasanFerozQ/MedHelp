BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Medical Ethics & Autonomy
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-medical' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "ethics-medical" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- AUTONOMY & INFORMED CONSENT (Cases 1-20)
    ---------------------------------------------------------------------------

    -- CASE 01: The Elements of Informed Consent (Beauchamp & Childress)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Components of Consent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Components of Consent', 'A 45-year-old man is scheduled for an elective cholecystectomy. The surgeon explains the procedure but omits the alternative of conservative management.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old man is scheduled for an elective cholecystectomy. The surgeon explains the procedure but omits the alternative of conservative management.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which element of informed consent is missing in this scenario?', '["Capacity", "Disclosure of alternatives", "Voluntariness", "Understanding"]', 1, 'Informed consent requires disclosure of the nature of the procedure, risks, benefits, and reasonable alternatives.'),
    (v_case_id, 'What is the standard for "adequate disclosure" in most jurisdictions?', '["The Professional Standard (what other doctors say)", "The Reasonable Patient Standard (what a patient would want to know)", "None", "None"]', 1, 'The modern standard is what a reasonable person in the patient''s position would find material to their decision.'),
    (v_case_id, 'If the patient is unconscious and needs emergency surgery, what type of consent is used?', '["Informed", "Implied", "Proxy", "None"]', 1, 'In emergencies where the patient cannot consent and delay would cause serious harm, consent is implied.');

    -- CASE 02: Refusal of Life-Saving Treatment (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Right to Say No' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Right to Say No', 'A 60-year-old woman with a history of severe CAD refuses a life-saving CABG, stating she has "lived a good life" and wants no more interventions.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman with a history of severe CAD refuses a life-saving CABG, stating she has "lived a good life" and wants no more interventions.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step when a competent patient refuses life-saving treatment?', '["Call Psychiatry", "Assess the patient''s decision-making capacity", "Force the treatment", "None"]', 1, 'Capacity must be confirmed before accepting a refusal that leads to death.'),
    (v_case_id, 'If the patient has capacity, can the hospital override her refusal?', '["Yes, life is sacred", "No, a competent adult has the right to refuse any treatment", "None", "None"]', 1, 'Respect for autonomy allows a competent adult to refuse even life-saving care.'),
    (v_case_id, 'Does the patient need to be "rational" in their refusal?', '["Yes", "No, they only need to have capacity (understanding, appreciation, reasoning)", "None", "None"]', 1, 'Capacity does not require the doctor to agree with the "wisdom" of the choice.');

    -- CASE 03: Religious Objections - Jehovah''s Witness (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blood and Belief' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blood and Belief', 'A 30-year-old Jehovah''s Witness presents with massive GI bleeding and a hemoglobin of 4. He is alert and carries a "No Blood" card.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old Jehovah''s Witness presents with massive GI bleeding and a hemoglobin of 4. He is alert and carries a "No Blood" card.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate management?', '["Give blood anyway", "Respect the refusal and use non-blood alternatives (IV fluids, EPO)", "Wait for a court order", "None"]', 1, 'Competent adults can refuse blood for religious reasons.'),
    (v_case_id, 'If the patient becomes unconscious and the "No Blood" card is present, should you transfuse?', '["Yes, save a life", "No, the card is an advanced directive representing his autonomous choice", "None", "None"]', 1, 'The card serves as an advanced directive.'),
    (v_case_id, 'If the patient was a 5-year-old child of Jehovah''s Witness parents, would you transfuse?', '["No, parents decide", "Yes, in an emergency, life-saving blood is given to minors despite parental objection", "None", "None"]', 1, 'Parents cannot refuse life-saving treatment for their children based on religious beliefs.');

    -- CASE 04: The Mature Minor (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Adolescent Autonomy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Adolescent Autonomy', 'A 16-year-old girl with end-stage cystic fibrosis asks to stop her ventilator. Her parents want "everything done."', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl with end-stage cystic fibrosis asks to stop her ventilator. Her parents want "everything done."', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What doctrine might allow the 16-year-old to make this decision?', '["In loco parentis", "Mature Minor Doctrine", "Emancipated Minor", "None"]', 1, 'The mature minor doctrine allows adolescents with sufficient maturity to make certain health decisions.'),
    (v_case_id, 'Which of these conditions often allows a minor to consent WITHOUT parents?', '["Broken leg", "Pregnancy, STIs, and Substance Abuse", "Cancer treatment", "None"]', 1, 'Public health policy allows minors to seek treatment for these "sensitive" issues independently.'),
    (v_case_id, 'What is the primary difference between a Mature Minor and an Emancipated Minor?', '["Age", "Legal status (emancipation requires court order, marriage, or military)", "None", "None"]', 1, 'Emancipation is a formal legal change in status.');

    -- CASE 05: Capacity vs. Competence (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Evaluating the Mind' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Evaluating the Mind', 'A 75-year-old man with mild dementia is refusing a necessary amputation for gangrene.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old man with mild dementia is refusing a necessary amputation for gangrene.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who determines a patient''s "Capacity"?', '["A Judge", "A Physician", "The Family", "None"]', 1, 'Capacity is a clinical determination made by a doctor; Competence is a legal determination made by a judge.'),
    (v_case_id, 'Which of these is NOT an essential part of capacity?', '["Expressing a choice", "High Intelligence Quotient (IQ)", "Understanding the facts", "Appreciating consequences"]', 1, 'IQ is not a criterion; functional understanding and reasoning are.'),
    (v_case_id, 'Can a patient with dementia have capacity for a specific decision?', '["No, never", "Yes, capacity is task-specific and can wax and wane", "None", "None"]', 1, 'A patient may have capacity to choose a surrogate but not to understand complex surgery.');

    -- CASE 06: Advanced Directives - Living Will (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Living Will' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Living Will', 'A patient with metastatic cancer has a living will that states: "No intubation or CPR if my heart stops."', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with metastatic cancer has a living will that states: "No intubation or CPR if my heart stops."', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary function of a Living Will?', '["Assign a proxy", "Specify preferences for future medical treatments", "Manage finances", "None"]', 1, 'It provides instructions for care when the patient can no longer speak for themselves.'),
    (v_case_id, 'If the living will and the family''s wishes conflict, which takes precedence?', '["The Family", "The Living Will", "The Doctor", "None"]', 1, 'The living will is the patient''s voice and generally overrides family wishes.'),
    (v_case_id, 'Does a DNR order mean "Do Not Treat"?', '["Yes", "No, it only means no CPR or intubation in the event of arrest", "None", "None"]', 1, 'Patients with DNR orders should still receive all other appropriate medical care.');

    -- CASE 07: Power of Attorney for Healthcare (Beauchamp & Childress)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Health Proxy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Health Proxy', 'An 80-year-old man becomes unconscious. He has designated his daughter as his Health Care Proxy (HCP).', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man becomes unconscious. He has designated his daughter as his Health Care Proxy (HCP).', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When does the HCP''s authority "activate"?', '["Immediately upon signing", "Only when the patient lacks decision-making capacity", "When the family agrees", "None"]', 1, 'The proxy only speaks when the patient cannot.'),
    (v_case_id, 'What standard should the HCP use to make decisions?', '["Their own preference", "Substituted Judgment (what the patient would want)", "Best Interest of the hospital", "None"]', 1, 'Substituted judgment aims to mimic the patient''s autonomous choice.'),
    (v_case_id, 'If no HCP is named, who is the "Default Surrogate" in most states?', '["The Lawyer", "Spouse > Adult Children > Parents > Siblings", "The Hospital CEO", "None"]', 1, 'This is the standard hierarchy for surrogate decision-making.');

    -- CASE 08: Substituted Judgment (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Speaking for the Silent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Speaking for the Silent', 'A surrogate states: "I know my brother, he would never want to be on a feeding tube like this."', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surrogate states: "I know my brother, he would never want to be on a feeding tube like this."', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ethical principle is the surrogate applying?', '["Best Interest Standard", "Substituted Judgment", "Paternalism", "None"]', 1, 'Substituted judgment uses the patient''s values to make a decision.'),
    (v_case_id, 'When is the "Best Interest Standard" used instead?', '["When the patient''s wishes are unknown", "When the patient is a child", "Both A and B", "None"]', 2, 'If we don''t know what they would want (or they never had capacity), we do what is objectively best for them.'),
    (v_case_id, 'Can a surrogate refuse life-sustaining treatment?', '["No, only the patient can", "Yes, if it aligns with the patient''s wishes", "None", "None"]', 1, 'Surrogates have the same right to refuse as the patient would.');

    -- CASE 09: Therapeutic Privilege (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Withholding Information' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Withholding Information', 'A doctor decides not to tell a very depressed patient about a rare side effect of a drug, fearing it will lead to suicide.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor decides not to tell a very depressed patient about a rare side effect of a drug, fearing it will lead to suicide.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this practice called?', '["Informed Consent", "Therapeutic Privilege", "Justice", "None"]', 1, 'Therapeutic privilege is withholding info if disclosure would cause severe harm (rarely used/accepted today).'),
    (v_case_id, 'Is Therapeutic Privilege commonly supported by modern ethics?', '["Yes, it''s good for the patient", "No, it is seen as overly paternalistic and undermines autonomy", "None", "None"]', 1, 'Modern ethics heavily prioritizes transparency and autonomy.'),
    (v_case_id, 'If a patient says, "I don''t want to know the risks, just do it," what should the doctor do?', '["Force them to listen", "Respect the \"Waiver of Informed Consent\"", "Refuse to operate", "None"]', 1, 'A patient can autonomously choose not to receive information.');

    -- CASE 10: Medical Errors & Disclosure (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Dose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Dose', 'A nurse accidentally gives a patient double the dose of an antibiotic. The patient suffers no harm.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A nurse accidentally gives a patient double the dose of an antibiotic. The patient suffers no harm.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should this error be disclosed to the patient?', '["No, because no harm occurred", "Yes, ethics require disclosure of all medical errors", "None", "None"]', 1, 'Disclosure is required regardless of harm to maintain trust and autonomy.'),
    (v_case_id, 'What is the primary benefit of "Full Disclosure" policies?', '["Lowering malpractice costs (often)", "Promoting a culture of safety", "Maintaining the doctor-patient relationship", "All of the above"]', 3, 'Transparency improves safety systems and trust.'),
    (v_case_id, 'Who is responsible for disclosing the error?', '["The nurse only", "The attending physician or the team involved", "The hospital lawyer", "None"]', 1, 'The attending or the physician lead typically manages the disclosure.');

    ---------------------------------------------------------------------------
    -- BENEFICENCE & NON-MALEFICENCE (Cases 11-30)
    ---------------------------------------------------------------------------

    -- CASE 11: Paternalism (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Doctor Knows Best?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Doctor Knows Best?', 'A physician insists that a patient must undergo a specific chemotherapy, despite the patient expressing concerns about quality of life.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician insists that a patient must undergo a specific chemotherapy, despite the patient expressing concerns about quality of life.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ethical conflict is occurring here?', '["Justice vs Autonomy", "Beneficence (Paternalism) vs Autonomy", "None", "None"]', 1, 'The doctor acts for the patient''s "good" (beneficence) but ignores their choice (autonomy).'),
    (v_case_id, 'When is "Weak Paternalism" generally accepted?', '["For every patient", "When the patient lacks capacity and treatment is urgent", "None", "None"]', 1, 'Intervening when capacity is absent to prevent harm is often justifiable.'),
    (v_case_id, 'What is "Strong Paternalism"?', '["Overriding a competent patient''s choice", "Giving more medicine", "None", "None"]', 0, 'Strong paternalism is generally rejected in modern medical ethics.');

    -- CASE 12: Confidentiality & HIPAA (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Privacy in the Elevator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Privacy in the Elevator', 'Two residents discuss a patient''s interesting EKG in a crowded hospital elevator, mentioning the patient''s last name.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Two residents discuss a patient''s interesting EKG in a crowded hospital elevator, mentioning the patient''s last name.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law is being violated?', '["The Good Samaritan Law", "HIPAA", "Emergency Medical Treatment and Labor Act (EMTALA)", "None"]', 1, 'Health Insurance Portability and Accountability Act protects patient privacy.'),
    (v_case_id, 'When can confidentiality be breached?', '["To tell a curious neighbor", "Mandatory reporting (child abuse, certain infections) or duty to warn (threat to others)", "Never", "None"]', 1, 'Confidentiality is not absolute; public safety can override it.'),
    (v_case_id, 'A wife calls asking for her husband''s lab results. He hasn''t given permission. What do you do?', '["Give them, she is the wife", "Refuse until the patient gives explicit consent", "None", "None"]', 1, 'Spousal relationship does not automatically grant access to medical records.');

    -- CASE 13: Duty to Warn - Tarasoff (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Threat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Threat', 'A psychiatric patient tells his doctor, "I am going to kill my ex-girlfriend as soon as I get out of here."', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A psychiatric patient tells his doctor, "I am going to kill my ex-girlfriend as soon as I get out of here."', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physician''s legal and ethical obligation?', '["Maintain confidentiality", "Duty to Warn/Protect (Tarasoff Rule)", "None", "None"]', 1, 'When a specific person is threatened, the doctor must warn the victim and/or notify the police.'),
    (v_case_id, 'Does a general threat like "I hate everyone" trigger the duty to warn?', '["Yes", "No, the threat must be specific and credible", "None", "None"]', 1, 'Tarasoff requires a specific target.'),
    (v_case_id, 'If a patient has an infectious disease (e.g., Syphilis) and refuses to tell their partner, what should you do?', '["Call the partner", "Report to the Department of Health (they handle partner notification)", "None", "None"]', 1, 'Public health authorities manage contact tracing and notification.');

    -- CASE 14: End-of-Life: Palliative Sedation (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Comfort at the End' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Comfort at the End', 'A patient with terminal cancer has intractable pain and respiratory distress. You increase their morphine dose to achieve comfort, knowing it might hasten death.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with terminal cancer has intractable pain and respiratory distress. You increase their morphine dose to achieve comfort, knowing it might hasten death.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ethical principle justifies this action?', '["The Rule of Double Effect", "Euthanasia", "Justice", "None"]', 0, 'If the primary intent is to relieve suffering (good effect), a known but unintended side effect (hastened death) is acceptable.'),
    (v_case_id, 'Is this action considered Physician-Assisted Suicide (PAS)?', '["Yes", "No, intent is the key difference", "None", "None"]', 1, 'PAS involves providing a lethal drug with the explicit intent of causing death.'),
    (v_case_id, 'What is the definition of "Active Euthanasia"?', '["Stopping a ventilator", "A physician directly administering a lethal injection", "None", "None"]', 1, 'Active euthanasia is illegal in the United States.');

    -- CASE 15: Futility of Care (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medical Futility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medical Futility', 'A family insists on continuing dialysis for a patient who is brain dead.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A family insists on continuing dialysis for a patient who is brain dead.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is Brain Death considered legal death in most jurisdictions?', '["No", "Yes, irreversible cessation of all brain activity including the brainstem is death", "None", "None"]', 1, 'Once dead, there is no duty to provide life-sustaining treatment (except briefly for organ donation).'),
    (v_case_id, 'What is "Physiologic Futility"?', '["Treatment that the family doesn''t like", "Treatment that cannot achieve its physiologic goal (e.g., CPR for rigor mortis)", "None", "None"]', 1, 'Doctors are not ethically required to provide physiologically futile care.'),
    (v_case_id, 'How should a conflict over "futility" be resolved?', '["The doctor decides alone", "Ethics Committee consultation and hospital policy", "None", "None"]', 1, 'Committees help mediate values-based conflicts.');

    -- CASE 16: Gift Giving (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Token of Thanks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Token of Thanks', 'A grateful patient offers his surgeon a $5,000 cash gift after a successful surgery.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A grateful patient offers his surgeon a $5,000 cash gift after a successful surgery.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate response?', '["Accept it gladly", "Politely decline large monetary gifts", "Give it to the nurse", "None"]', 1, 'Large gifts create a conflict of interest or an appearance of impropriety.'),
    (v_case_id, 'Can small, low-value gifts (like cookies) be accepted?', '["No, never", "Yes, if they are meant as tokens of appreciation and do not influence care", "None", "None"]', 1, 'Context and value matter.'),
    (v_case_id, 'Why are expensive gifts problematic?', '["Tax reasons", "They can create an expectation of preferential treatment", "None", "None"]', 1, 'Boundaries must be maintained for professional integrity.');

    -- CASE 17: Boundaries - Sexual Misconduct (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Crossing the Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Crossing the Line', 'A physician starts dating a current patient.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician starts dating a current patient.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this behavior ethical?', '["Yes, if both are adults", "No, sexual relationships with current patients are always unethical", "None", "None"]', 1, 'This is a major boundary violation due to the power imbalance.'),
    (v_case_id, 'Can a doctor ever date a FORMER patient?', '["Never", "Sometimes, if enough time has passed and no dependence exists (psychiatry has stricter rules)", "None", "None"]', 1, 'Psychiatry generally forbids it indefinitely; other specialties vary but require caution.'),
    (v_case_id, 'What should you do if you witness a colleague engaging in sexual misconduct?', '["Nothing", "Report them to the state medical board", "None", "None"]', 1, 'Professionals have a duty to self-regulate.');

    -- CASE 18: Good Samaritan Laws (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Roadside Hero' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Roadside Hero', 'A doctor stops to help at a car accident and performs an emergency procedure. The patient later sues for a complication.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor stops to help at a car accident and performs an emergency procedure. The patient later sues for a complication.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What laws generally protect the doctor in this scenario?', '["HIPAA", "Good Samaritan Laws", "EMTALA", "None"]', 1, 'These laws protect individuals who provide emergency care in good faith without expectation of payment.'),
    (v_case_id, 'Does the Good Samaritan law protect against "Gross Negligence"?', '["Yes", "No, it only protects against ordinary negligence", "None", "None"]', 1, 'Reckless or intentional harm is not protected.'),
    (v_case_id, 'Are you legally required to stop and help in most US states?', '["Yes", "No, there is no \"Duty to Rescue\" unless you have a pre-existing relationship", "None", "None"]', 1, 'Except in specific states like Vermont, there is no legal mandate to stop.');

    -- CASE 19: Physician Health & Impairment (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shaky Surgeon' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shaky Surgeon', 'You notice a colleague smelling of alcohol and having tremors before starting a surgery.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You notice a colleague smelling of alcohol and having tremors before starting a surgery.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is your primary responsibility?', '["Ignore it", "Prevent them from performing the surgery and report to a supervisor/Physician Health Program (PHP)", "None", "None"]', 1, 'Patient safety is the absolute priority.'),
    (v_case_id, 'What is a Physician Health Program (PHP)?', '["A jail", "A confidential program to help impaired doctors with recovery and return to practice", "None", "None"]', 1, 'PHPs focus on rehabilitation.'),
    (v_case_id, 'If the colleague is your supervisor, should you still report?', '["No, you might get fired", "Yes, the duty to protect patients is higher than the hierarchy", "None", "None"]', 1, 'Ethical duties override personal career concerns.');

    -- CASE 20: Placebos in Clinical Practice (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sugar Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sugar Pill', 'A doctor gives a "difficult" patient a saline injection, telling them it is a powerful new painkiller.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor gives a "difficult" patient a saline injection, telling them it is a powerful new painkiller.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this use of placebo ethical?', '["Yes, if it works", "No, it involves deception and violates informed consent", "None", "None"]', 1, 'Deceptive placebos undermine the trust and autonomy of the patient.'),
    (v_case_id, 'When are placebos ethically used?', '["In everyday practice", "In randomized controlled trials (RCTs) with informed consent", "None", "None"]', 1, 'Research use is strictly regulated.'),
    (v_case_id, 'What is the "Nocebo" effect?', '["No effect", "Adverse symptoms caused by the expectation of harm from a treatment", "None", "None"]', 1, 'It is the negative counterpart to the placebo effect.');

    ---------------------------------------------------------------------------
    -- JUSTICE & HEALTH SYSTEMS (Cases 21-50)
    ---------------------------------------------------------------------------

    -- CASE 21: Triage in Disaster (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mass Casualty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mass Casualty', 'Following a bridge collapse, triage officers must allocate limited resources to dozens of injured people.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Following a bridge collapse, triage officers must allocate limited resources to dozens of injured people.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which principle dominates disaster triage?', '["Individual Autonomy", "Utilitarianism (Greatest good for the greatest number)", "None", "None"]', 1, 'Resources are allocated to those most likely to survive with intervention.'),
    (v_case_id, 'What does the "Black Tag" mean in triage?', '["Dead or expected to die (comfort care only)", "Immediate", "Delayed", "None"]', 0, 'In a resource-limited crisis, those with non-survivable injuries are prioritized lower for active life-saving.'),
    (v_case_id, 'What is the "First-Come, First-Served" approach?', '["The best way", "An inefficient and often unjust way to allocate scarce resources in a crisis", "None", "None"]', 1, 'It ignores clinical need and prognosis.');

    -- CASE 22: Organ Allocation (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Who Gets the Heart?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Who Gets the Heart?', 'Two patients need a heart transplant: a 20-year-old student and a 70-year-old retired CEO.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Two patients need a heart transplant: a 20-year-old student and a 70-year-old retired CEO.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these is NOT a standard UNOS criterion?', '["Medical urgency", "Ability to pay", "Prognosis/Success chance", "Time on waiting list"]', 1, 'Wealth and social status should not influence organ allocation.'),
    (v_case_id, 'Can "Social Worth" be used to decide organ distribution?', '["Yes, important people first", "No, it is ethically rejected as a criterion", "None", "None"]', 1, 'Justice requires fair, non-discriminatory criteria.'),
    (v_case_id, 'What is the "Rule of Rescue"?', '["A law", "The psychological impulse to save a specific, identifiable life even at great cost", "None", "None"]', 1, 'This often conflicts with systemic utilitarian goals.');

    -- CASE 23: Insurance Models - HMO vs PPO (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Managed Care Models' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Managed Care Models', 'A patient wants to see a specialist but is told they must first see their primary care "gatekeeper."', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient wants to see a specialist but is told they must first see their primary care "gatekeeper."', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which insurance model typically uses a "Gatekeeper"?', '["PPO", "HMO (Health Maintenance Organization)", "Fee-for-service", "None"]', 1, 'HMOs require referrals and focus on cost-containment through coordinated care.'),
    (v_case_id, 'What is the primary advantage of a PPO (Preferred Provider Organization)?', '["Lower premiums", "Greater flexibility to see specialists without a referral", "None", "None"]', 1, 'PPOs allow more choice but often at a higher cost.'),
    (v_case_id, 'What is "Capitation"?', '["A type of surgery", "A fixed amount of money per patient per unit of time paid in advance to the doctor", "None", "None"]', 1, 'This shifts the financial risk to the provider.');

    -- CASE 24: Medicare vs Medicaid (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Safety Net' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Safety Net', 'A 66-year-old retired worker needs insurance, while a 25-year-old single parent living in poverty needs it as well.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old retired worker needs insurance, while a 25-year-old single parent living in poverty needs it as well.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which program is primarily for the elderly (>65) and those with ESRD?', '["Medicaid", "Medicare", "CHIP", "None"]', 1, 'Medicare is a federal program for the aged and disabled.'),
    (v_case_id, 'Which program is joint federal-state and based on low income?', '["Medicare", "Medicaid", "COBRA", "None"]', 1, 'Medicaid is for the indigent.'),
    (v_case_id, 'What is Medicare Part D?', '["Hospital coverage", "Prescription drug coverage", "Outpatient care", "None"]', 1, 'A=Hospital, B=Outpatient, C=Medicare Advantage, D=Drugs.');

    -- CASE 25: Root Cause Analysis - RCA (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Why Did It Happen?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Why Did It Happen?', 'A patient receives the wrong medication because two vials look identical and were stored next to each other.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient receives the wrong medication because two vials look identical and were stored next to each other.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate first system-wide response?', '["Fire the nurse", "Perform a Root Cause Analysis (RCA)", "None", "None"]', 1, 'RCA looks at system failures rather than individual blame (retrospective).'),
    (v_case_id, 'Is RCA retrospective or prospective?', '["Prospective", "Retrospective (done after an event)", "None", "None"]', 1, 'It analyzes a past error to prevent future ones.'),
    (v_case_id, 'What is FMEA (Failure Mode and Effects Analysis)?', '["Retrospective", "Prospective (identifying risks before they happen)", "None", "None"]', 1, 'FMEA is a "proactive" safety tool.');

    -- CASE 26: Conflict of Interest - Pharma (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Drug Rep' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Drug Rep', 'A pharmaceutical representative offers to pay for a physician''s family vacation if the physician prescribes more of their new drug.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pharmaceutical representative offers to pay for a physician''s family vacation if the physician prescribes more of their new drug.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this arrangement ethical?', '["Yes", "No, it is a kickback and a major conflict of interest", "None", "None"]', 1, 'Direct financial incentives for prescribing violate professional ethics and law (Anti-Kickback Statute).'),
    (v_case_id, 'What does the "Physician Sunshine Act" require?', '["More sunlight in clinics", "Reporting of all payments from drug/device companies to physicians", "None", "None"]', 1, 'Transparency allows the public to see potential conflicts.'),
    (v_case_id, 'Can doctors accept any industry funding?', '["Never", "Yes, for legitimate research and modest meals during educational talks", "None", "None"]', 1, 'Strict guidelines govern these interactions.');

    -- CASE 27: EMTALA (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Emergency Law' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Emergency Law', 'A homeless man with chest pain is turned away from a private hospital because he has no insurance.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A homeless man with chest pain is turned away from a private hospital because he has no insurance.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law is being violated?', '["HIPAA", "EMTALA", "Medicare Part A", "None"]', 1, 'The Emergency Medical Treatment and Labor Act requires hospitals to screen and stabilize anyone in an emergency regardless of ability to pay.'),
    (v_case_id, 'Does EMTALA apply to a patient who is "stable"?', '["No", "Yes, but once stabilized, they can be transferred", "None", "None"]', 1, 'The hospital must provide a "Medical Screening Exam" (MSE) first.'),
    (v_case_id, 'Does EMTALA apply to a woman in active labor?', '["No", "Yes, labor is considered an emergency condition", "None", "None"]', 1, 'Laboring women must be managed until delivery or stable transfer.');

    -- CASE 28: Public Health - Mandatory Reporting (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reporting the Unseen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reporting the Unseen', 'A physician suspects a child has been physically abused by their parents.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician suspects a child has been physically abused by their parents.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physician''s duty?', '["Confront the parents", "Mandatory report to Child Protective Services (CPS)", "Wait for proof", "None"]', 1, 'Reporting is required based on "reasonable suspicion," not certainty.'),
    (v_case_id, 'Which of these is NOT usually a mandatory report?', '["Elder abuse", "Gunshot wounds", "Infidelity", "Tuberculosis"]', 2, 'Personal affairs are not reported; abuse, specific injuries, and infectious diseases are.'),
    (v_case_id, 'Are reporters protected from lawsuits if the suspicion is wrong?', '["No", "Yes, \"Good Faith\" reporting is legally protected", "None", "None"]', 1, 'Immunity encourages reporting to protect vulnerable populations.');

    -- CASE 29: Cost-Effectiveness Analysis (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Value in Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Value in Care', 'A health system is deciding whether to implement a new screening test that costs $1 million per life saved.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A health system is deciding whether to implement a new screening test that costs $1 million per life saved.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a QALY?', '["Quality-Adjusted Life Year", "None", "None", "None"]', 0, 'A measure used in cost-effectiveness to value the benefit of a medical intervention.'),
    (v_case_id, 'What is "Opportunity Cost"?', '["The price of the drug", "The benefit lost from the next best alternative when one choice is made", "None", "None"]', 1, 'Money spent on one program is money not available for another.'),
    (v_case_id, 'Is it ethical to consider costs in healthcare?', '["No", "Yes, justice requires stewardship of limited resources", "None", "None"]', 1, 'Avoiding "low-value care" allows resources to be used more fairly.');

    -- CASE 30: Cultural Competence vs. Humility (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bridging the Gap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bridging the Gap', 'A patient from a culture that values communal decision-making wants their entire extended family present for a diagnosis.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient from a culture that values communal decision-making wants their entire extended family present for a diagnosis.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial approach?', '["Tell the family to leave", "Ask the patient how they would like to receive information and who should be involved", "None", "None"]', 1, 'Respecting the patient''s preference for communal decision-making is part of cultural humility.'),
    (v_case_id, 'Why is using a family member as a translator discouraged?', '["They are too slow", "High risk of error, omission, and breach of privacy", "None", "None"]', 1, 'Professional medical interpreters are the gold standard.'),
    (v_case_id, 'What is "Implicit Bias"?', '["Intentional racism", "Unconscious associations or stereotypes that affect our understanding and actions", "None", "None"]', 1, 'Recognizing bias is the first step to mitigating its impact on care.');

    -- [CASES 31-50 Summary: Further refining Autonomy, Justice, and Systems]
    
    -- CASE 31: Self-Prescribing (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Treating Yourself' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Treating Yourself', 'A physician writes a prescription for a controlled substance for their own chronic back pain.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician writes a prescription for a controlled substance for their own chronic back pain.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this ethical?', '["Yes", "No, doctors should not treat themselves or close family, especially with controlled substances", "None", "None"]', 1, 'Objectivity is lost, and it may lead to substance misuse.'),
    (v_case_id, 'When is treating family acceptable?', '["Always", "In minor emergencies when no other doctor is available", "None", "None"]', 1, 'Limited to acute, minor situations.'),
    (v_case_id, 'What is the risk of treating family?', '["Over-testing", "Under-testing due to familiarity", "Compromised physical exams", "All of the above"]', 3, 'Professional distance is necessary for quality care.');

    -- CASE 32: Truth-Telling (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bad News' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bad News', 'A family asks the doctor NOT to tell the patient they have cancer, saying "it will kill him."', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A family asks the doctor NOT to tell the patient they have cancer, saying "it will kill him."', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should the doctor respond?', '["Agree with the family", "Ask the patient if they want to know their diagnosis", "Tell the patient immediately", "None"]', 1, 'The patient has the right to know; the doctor should assess the patient''s wish for information.'),
    (v_case_id, 'What is the "SPIKES" protocol used for?', '["Surgery", "Delivering bad news", "None", "None"]', 1, 'Setting, Perception, Invitation, Knowledge, Empathy, Strategy/Summary.'),
    (v_case_id, 'Can a doctor LIE to a patient?', '["Yes, to protect them", "No, veracity (truth-telling) is a core professional obligation", "None", "None"]', 1, 'Deception undermines the entire clinical relationship.');

    -- CASE 33: Triage - The "VIP" (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Celebrity Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Celebrity Patient', 'A famous politician arrives in the ED with a minor injury at the same time as a non-famous patient with a potential MI.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A famous politician arrives in the ED with a minor injury at the same time as a non-famous patient with a potential MI.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who should be seen first?', '["The politician (VIP)", "The patient with the potential MI", "The first one who walked in", "None"]', 1, 'Triage is based on clinical urgency, not social status.'),
    (v_case_id, 'What is the ethical danger of "VIP Syndrome"?', '["Better care", "Worse care due to skipping protocols or \"bending the rules\"", "None", "None"]', 1, 'Deviating from standard care for VIPs often leads to errors.'),
    (v_case_id, 'Is it ethical for a doctor to accept a "referral fee"?', '["Yes", "No, it is a conflict of interest", "None", "None"]', 1, 'Referrals should be based on quality, not payment.');

    -- CASE 34: Clinical Trials - Phase I (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing New Drugs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing New Drugs', 'A new drug is being tested on a small group of healthy volunteers.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A new drug is being tested on a small group of healthy volunteers.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which phase of clinical trial is this?', '["Phase I", "Phase II", "Phase III", "Phase IV"]', 0, 'Phase I tests safety/dosage in healthy volunteers.'),
    (v_case_id, 'What is Phase III?', '["Safety", "Large-scale efficacy and comparison to standard of care", "None", "None"]', 1, 'Phase III is the "definitive" trial before FDA approval.'),
    (v_case_id, 'What is "Clinical Equipoise"?', '["Equal weight", "Genuine uncertainty in the medical community about which treatment is better", "None", "None"]', 1, 'Equipoise is required to ethically randomize patients.');

    -- CASE 35: Brain Death vs. PVS (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Coma and Beyond' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Coma and Beyond', 'A patient is in a Persistent Vegetative State (PVS) after a cardiac arrest.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is in a Persistent Vegetative State (PVS) after a cardiac arrest.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is PVS considered "Brain Death"?', '["Yes", "No, the brainstem is still functional in PVS", "None", "None"]', 1, 'In PVS, patients have sleep-wake cycles but no awareness; Brain Death is total loss of all brain function.'),
    (v_case_id, 'Can you stop nutrition/hydration for a patient in PVS?', '["Never", "Yes, if it aligns with their previously stated wishes or surrogate judgment", "None", "None"]', 1, 'Feeding tubes are medical interventions that can be withdrawn.'),
    (v_case_id, 'How is Brain Death confirmed?', '["Just looking", "Clinical exam (no reflexes, apnea test) or ancillary tests (EEG, flow study)", "None", "None"]', 1, 'Strict clinical criteria must be met.');

    -- CASE 36: Health Literacy (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Do They Understand?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Do They Understand?', 'A doctor uses complex medical jargon to explain heart failure to a patient with a 5th-grade education.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor uses complex medical jargon to explain heart failure to a patient with a 5th-grade education.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best technique to ensure patient understanding?', '["Speak louder", "\"Teach-Back\" method (ask them to explain it back in their own words)", "None", "None"]', 1, 'Teach-back is the most effective way to verify comprehension.'),
    (v_case_id, 'What is "Health Literacy"?', '["Ability to read", "The capacity to obtain, process, and understand basic health information", "None", "None"]', 1, 'Low health literacy is a major barrier to safe care.'),
    (v_case_id, 'Should you use "plain language" (e.g., "high blood pressure" instead of "hypertension")?', '["No, it''s unprofessional", "Yes, to improve communication and outcomes", "None", "None"]', 1, 'Plain language is a key communication skill.');

    -- CASE 37: Resource Stewardship (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Choosing Wisely' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Choosing Wisely', 'A physician orders a daily chest X-ray for a stable patient "just in case."', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician orders a daily chest X-ray for a stable patient "just in case."', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this an example of?', '["Good care", "Low-value care / Over-utilization", "None", "None"]', 1, 'Unnecessary tests waste resources and may lead to "incidentalomas."'),
    (v_case_id, 'What is the "Choosing Wisely" campaign?', '["A way to spend more", "An initiative to reduce unnecessary and potentially harmful tests and procedures", "None", "None"]', 1, 'It encourages evidence-based resource use.'),
    (v_case_id, 'How does over-utilization affect the health system?', '["Better profits", "Increases costs and decreases access for others (Justice issue)", "None", "None"]', 1, 'Wasteful spending limits the budget for essential care.');

    -- CASE 38: Conflict of Interest - Research (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Funded Trial' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Funded Trial', 'A researcher holds significant stock in a company whose drug they are currently testing.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A researcher holds significant stock in a company whose drug they are currently testing.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must the researcher do?', '["Sell the stock immediately", "Disclose the financial conflict of interest in all publications and to the IRB", "None", "None"]', 1, 'Disclosure and management (oversight) are required for integrity.'),
    (v_case_id, 'What is the role of the IRB (Institutional Review Board)?', '["To fund the trial", "To protect the rights and welfare of human research subjects", "None", "None"]', 1, 'The IRB reviews all human research for ethical compliance.'),
    (v_case_id, 'Can research participants be paid?', '["No", "Yes, for their time and effort, but not so much that it becomes coercive", "None", "None"]', 1, 'Payment should not be "undue inducement."');

    -- CASE 39: End-of-Life: Organ Donation (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gift of Life' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gift of Life', 'A patient is declared brain dead. They are a registered organ donor.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is declared brain dead. They are a registered organ donor.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the family override the patient''s donor registration?', '["Yes", "No, in most states, the registry is a legally binding directive", "None", "None"]', 1, '"First Person Consent" laws honor the patient''s choice.'),
    (v_case_id, 'Who should approach the family about organ donation?', '["The attending physician", "A trained representative from the Organ Procurement Organization (OPO)", "None", "None"]', 1, 'OPO specialists are more effective and avoid conflicts of interest for the clinical team.'),
    (v_case_id, 'Can the doctor declaring death be part of the transplant team?', '["Yes", "No, to avoid a conflict of interest", "None", "None"]', 1, 'Separation ensures that the declaration of death is unbiased.');

    -- CASE 40: Confidentiality - Minors (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Teenager''s Secret' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Teenager''s Secret', 'A 15-year-old girl tests positive for Chlamydia and begs the doctor not to tell her mother.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl tests positive for Chlamydia and begs the doctor not to tell her mother.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Must the doctor tell the mother?', '["Yes", "No, minors generally have a right to confidential STI testing and treatment", "None", "None"]', 1, 'Encourage the teen to talk to her parents, but maintain her privacy if she refuses.'),
    (v_case_id, 'Does this privacy apply to all medical issues for minors?', '["Yes", "No, only to specific areas like sexual health, mental health, and substance use", "None", "None"]', 1, 'General medical care still requires parental consent/info.'),
    (v_case_id, 'What is the "Mature Minor" rule in this context?', '["She is old enough", "Some states allow minors who understand the implications to consent for themselves", "None", "None"]', 1, 'It varies by state but generally applies to the "sensitive" topics.');

    -- CASE 41: Physician Disagreement (Conrad Fischer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Conflicting Opinions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Conflicting Opinions', 'A consultant recommends a surgery that the primary attending believes is unnecessary and risky.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A consultant recommends a surgery that the primary attending believes is unnecessary and risky.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should the physicians handle this?', '["Argue in front of the patient", "Discuss privately and reach a consensus if possible", "None", "None"]', 1, 'Professional disagreements should be handled away from the bedside.'),
    (v_case_id, 'What if they cannot agree?', '["Flip a coin", "Explain both viewpoints to the patient and let the patient decide", "None", "None"]', 1, 'Informed consent includes knowing there may be multiple valid approaches.'),
    (v_case_id, 'Is it professional to disparage a colleague''s skill to a patient?', '["Yes, if they are bad", "No, it is unprofessional and undermines trust in the profession", "None", "None"]', 1, 'Report concerns through proper peer-review channels.');

    -- CASE 42: Non-Compliance vs. Autonomy (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Non-Compliant" Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Non-Compliant" Patient', 'A patient with diabetes repeatedly fails to take their insulin, citing the cost and the pain of injections.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with diabetes repeatedly fails to take their insulin, citing the cost and the pain of injections.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in addressing "non-compliance"?', '["Discharge the patient", "Explore the barriers to adherence (cost, side effects, beliefs)", "None", "None"]', 1, 'The term "adherence" is now preferred over "compliance" to emphasize a partnership.'),
    (v_case_id, 'Can you "fire" a patient for non-adherence?', '["Never", "Yes, but only after proper notice and ensuring no acute crisis exists (avoiding abandonment)", "None", "None"]', 1, 'Patient abandonment is a legal and ethical violation.'),
    (v_case_id, 'How long is the typical notice period for discharging a patient?', '["1 day", "30 days (allowing time to find a new doctor)", "None", "None"]', 1, 'Continuity of care must be maintained during the transition.');

    -- CASE 43: Informed Refusal (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Informed of the Risks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Informed of the Risks', 'A patient refuses a colonoscopy. The doctor explains that without it, they might miss a treatable cancer.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient refuses a colonoscopy. The doctor explains that without it, they might miss a treatable cancer.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this process called?', '["Informed Refusal", "Coercion", "None", "None"]', 0, 'Just as consent must be informed, refusal must be based on a clear understanding of the risks of not treating.'),
    (v_case_id, 'If the patient understands the risks and still refuses, is the doctor liable?', '["Yes", "No, if the informed refusal was properly documented", "None", "None"]', 1, 'Documentation of the discussion is crucial for legal protection.'),
    (v_case_id, 'Should you ask the patient to sign an "Against Medical Advice" (AMA) form?', '["Yes", "No", "None", "None"]', 0, 'AMA forms document that the patient was informed of the risks and chose to leave.');

    -- CASE 44: Health Disparities (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unequal Outcomes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unequal Outcomes', 'Data shows that patients from a certain minority group have significantly higher rates of maternal mortality at a local hospital.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Data shows that patients from a certain minority group have significantly higher rates of maternal mortality at a local hospital.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ethical principle is most directly concerned here?', '["Autonomy", "Justice", "Beneficence", "None"]', 1, 'Justice requires equitable health outcomes and access to care.'),
    (v_case_id, 'What are "Social Determinants of Health"?', '["DNA", "Economic and social conditions (housing, education, food security) that influence health", "None", "None"]', 1, 'These non-medical factors account for a huge portion of health variances.'),
    (v_case_id, 'What is the goal of "Health Equity"?', '["Everyone gets the same thing", "Everyone has a fair and just opportunity to be as healthy as possible", "None", "None"]', 1, 'Equity recognizes that different people need different resources to reach the same goal.');

    -- CASE 45: Managed Care - Prior Authorization (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Permission to Treat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Permission to Treat', 'A doctor wants to order an MRI, but the insurance company requires a "Prior Authorization" first.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor wants to order an MRI, but the insurance company requires a "Prior Authorization" first.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of Prior Authorization?', '["To help the doctor", "To control costs and ensure the test meets the insurer''s \"Medical Necessity\" criteria", "None", "None"]', 1, 'It is a utilization management tool.'),
    (v_case_id, 'Can prior authorization delay care?', '["No", "Yes, it is often cited as a major administrative burden", "None", "None"]', 1, 'Delays can impact patient outcomes.'),
    (v_case_id, 'What is a "Peer-to-Peer" review?', '["Talking to a friend", "A discussion between the treating physician and the insurance medical director to appeal a denial", "None", "None"]', 1, 'This is a common way to advocate for a patient''s treatment.');

    -- CASE 46: Public Health - Quarantine (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'For the Public Good' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'For the Public Good', 'During an outbreak of a highly contagious disease, authorities order a mandatory quarantine for exposed individuals.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'During an outbreak of a highly contagious disease, authorities order a mandatory quarantine for exposed individuals.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ethical justification for quarantine?', '["Autonomy", "Police power of the state to protect public health", "None", "None"]', 1, 'Individual liberty can be restricted if there is a serious threat to others.'),
    (v_case_id, 'What is the difference between "Isolation" and "Quarantine"?', '["Nothing", "Isolation is for the sick; Quarantine is for those exposed but not yet sick", "None", "None"]', 1, 'A key distinction in public health law.'),
    (v_case_id, 'Should quarantine be the "Least Restrictive" possible?', '["No", "Yes, to balance public safety with individual rights", "None", "None"]', 1, 'Proportionality is a key ethical requirement.');

    -- CASE 47: Health Literacy - Numbers (Bodenheimer)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Percentages' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Percentages', 'A doctor tells a patient, "You have a 0.05 probability of a side effect."', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A doctor tells a patient, "You have a 0.05 probability of a side effect."', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is this a poor way to communicate risk?', '["It''s too small", "Many patients struggle with decimals and probabilities (Low Numeracy)", "None", "None"]', 1, 'Numeracy is a subset of health literacy.'),
    (v_case_id, 'What is a better way to phrase "0.05 probability"?', '["5%", "5 out of 100 people", "None", "None"]', 1, 'Natural frequencies (e.g., "5 in 100") are often more easily understood than percentages.'),
    (v_case_id, 'What is "Framing" in communication?', '["Putting a picture in a frame", "Presenting information in a way that influences the patient''s perception (e.g., \"90% survival\" vs \"10% death\")", "None", "None"]', 1, 'Doctors should be aware of how they frame risks.');

    -- CASE 48: Dual Agency (Principles of Biomedical Ethics)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Prison Doctor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Prison Doctor', 'A physician works in a prison and is asked by the warden to help with an interrogation.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician works in a prison and is asked by the warden to help with an interrogation.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ethical problem?', '["Justice", "Conflict of Loyalty (Dual Agency)", "None", "None"]', 1, 'A doctor''s primary loyalty must be to the patient, not the state or institution.'),
    (v_case_id, 'Is it ethical for doctors to participate in executions?', '["Yes", "No, it violates the core duty to \"do no harm\"", "None", "None"]', 1, 'The AMA and other professional bodies strictly forbid participation in capital punishment.'),
    (v_case_id, 'What about military doctors?', '["They have no ethics", "They face similar dual loyalty challenges between the patient and the mission", "None", "None"]', 1, 'This is a significant area of debate in medical ethics.');

    -- CASE 49: Genetic Testing & Privacy (Master the Boards)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gene Result' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gene Result', 'A patient tests positive for a BRCA mutation. Their insurance company finds out and tries to raise their rates.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient tests positive for a BRCA mutation. Their insurance company finds out and tries to raise their rates.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law protects the patient from this?', '["HIPAA", "GINA (Genetic Information Nondiscrimination Act)", "None", "None"]', 1, 'GINA prohibits health insurers and employers from discriminating based on genetic information.'),
    (v_case_id, 'Does GINA apply to Life Insurance or Long-Term Care insurance?', '["Yes", "No, it is limited to health insurance and employment", "None", "None"]', 1, 'This is a common "gap" in legal protection.'),
    (v_case_id, 'Should family members be told if a patient has a highly heritable mutation?', '["Yes, immediately", "Only if the patient consents; however, there is a strong ethical pull to encourage disclosure", "None", "None"]', 1, 'Confidentiality remains the default.');

    -- CASE 50: Physician Advocacy (Jekel''s)
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Doctor-Advocate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Doctor-Advocate', 'A pediatrician notices many of their patients have lead poisoning and lobbies the city to replace old pipes.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pediatrician notices many of their patients have lead poisoning and lobbies the city to replace old pipes.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What role is the physician fulfilling?', '["Technician", "Patient/Community Advocate", "None", "None"]', 1, 'Advocacy for the social determinants of health is a core part of professional responsibility.'),
    (v_case_id, 'Is advocacy part of the medical profession?', '["No, stick to science", "Yes, it is listed in many professional charters (e.g., CanMEDS)", "None", "None"]', 1, 'Physicians have a unique perspective on how policy affects health.'),
    (v_case_id, 'What is "Macro-allocation" of resources?', '["Giving one pill", "Policy-level decisions about how to distribute the entire health budget", "None", "None"]', 1, 'Advocacy often aims to influence macro-allocation.');

END $$;

COMMIT;
