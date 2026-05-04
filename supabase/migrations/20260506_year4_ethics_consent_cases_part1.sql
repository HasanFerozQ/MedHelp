-- Clinical Skills & Diagnostics: Ethics - Informed Consent & Capacity - Part 1 (Cases 1-25)
-- US MD/MBBS (4th Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ethics-consent

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-consent' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ethics-consent';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Core Elements of Informed Consent - The Overwhelmed Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Overwhelmed Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Overwhelmed Patient', 'A 55-year-old man is diagnosed with advanced pancreatic cancer. The oncologist explains the prognosis, the proposed chemotherapy regimen, its side effects, and alternative options including hospice. The patient listens quietly and then says, ''This is too much for me to process. Just do whatever you think is best, Doc. I trust you.''', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old man is diagnosed with advanced pancreatic cancer. The oncologist explains the prognosis, the proposed chemotherapy regimen, its side effects, and alternative options including hospice. The patient listens quietly and then says, ''This is too much for me to process. Just do whatever you think is best, Doc. I trust you.''', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step by the physician?', '["Proceed with the chemotherapy as the patient has given implied consent.", "Accept the patient''s waiver of informed consent and proceed.", "Ask the patient to explain his understanding of the disease and the proposed treatment.", "Determine if the patient has a surrogate decision maker who can sign the consent.", "Refer the patient for a psychiatric evaluation for depression."]', 2, 'Before accepting a waiver, the physician must ensure the patient has the capacity to make that choice. Asking the patient to explain his understanding (the ''teach-back'' method) ensures that his decision to waive information is made from a position of competence rather than mere confusion or misunderstanding.'),
    (v_case_id, 'If the patient demonstrates full understanding but still insists on waiving his right to further information and decision-making, what is the ethical term for this?', '["Implied consent", "Therapeutic privilege", "Waiver of informed consent", "Substituted judgment", "Paternalism"]', 2, 'A Waiver of Informed Consent occurs when a competent patient explicitly requests not to be informed about their condition or treatment risks, and leaves the decision to the physician. This is an exercise of their autonomy.');

    ---------------------------------------------------------------------------
    -- CASE 02: Core Elements - The Language Barrier
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Language Barrier' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Language Barrier', 'A 42-year-old woman requires an urgent cholecystectomy for acute cholecystitis. She speaks only Vietnamese. Her 14-year-old bilingual son is with her and offers to translate the surgical risks and benefits so she can sign the consent form.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman requires an urgent cholecystectomy for acute cholecystitis. She speaks only Vietnamese. Her 14-year-old bilingual son is with her and offers to translate the surgical risks and benefits so she can sign the consent form.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate next step in obtaining informed consent?', '["Allow the son to translate, as it is culturally appropriate.", "Proceed with the surgery under implied consent for emergencies.", "Obtain a professional medical interpreter via phone or in-person.", "Have a bilingual nurse from another department translate.", "Delay the surgery until an adult family member arrives to translate."]', 2, 'Professional medical interpreters must be used for obtaining informed consent. Using family members (especially minors) or untrained staff is associated with translation errors, lack of medical vocabulary, and breaches of patient confidentiality.'),
    (v_case_id, 'Why is using the 14-year-old son ethically problematic in this scenario?', '["He cannot legally sign the consent form.", "He lacks the medical knowledge to translate complex surgical risks accurately.", "It violates the principle of beneficence.", "The mother may be coerced by the son.", "The hospital will not be reimbursed for the interpreter service."]', 1, 'Children and family members often lack medical vocabulary, may edit information to protect the patient emotionally, or may inject their own biases, preventing true informed consent. They should only be used in dire, life-threatening emergencies where no professional is available.');

    ---------------------------------------------------------------------------
    -- CASE 03: Decision-Making Capacity - The Sliding Scale
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sliding Scale of Capacity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sliding Scale of Capacity', 'A 78-year-old woman with mild dementia is hospitalized for pneumonia. She consistently refuses to have her blood drawn for routine morning labs, stating, ''I hate needles and I don''t want you poking me.'' However, she agrees to take her oral antibiotics and participates in physical therapy.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old woman with mild dementia is hospitalized for pneumonia. She consistently refuses to have her blood drawn for routine morning labs, stating, ''I hate needles and I don''t want you poking me.'' However, she agrees to take her oral antibiotics and participates in physical therapy.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should the physician approach her refusal of blood draws?', '["Restrain her to draw the blood, as she has dementia and lacks capacity.", "Contact her health care proxy to authorize the blood draw.", "Order a psychiatry consult to officially determine her capacity.", "Respect her refusal, as the intervention is low-risk and she understands the immediate consequence of discomfort.", "Discharge her against medical advice (AMA)."]', 3, 'Capacity is decision-specific (the ''sliding scale'' of capacity). A patient with mild dementia may lack the capacity to make complex financial or surgical decisions but can still retain the capacity to refuse a low-risk, easily understood procedure like a blood draw.'),
    (v_case_id, 'Later that day, the patient develops a perforated bowel requiring life-saving emergency surgery. She says, ''No surgery, I just want to go home and feed my dog.'' She cannot explain the consequences of refusing surgery. How does this alter the capacity assessment?', '["She still retains the right to refuse as established earlier.", "She now lacks capacity for this high-risk decision because she cannot appreciate the consequences.", "Her health care proxy must be contacted solely because it is a surgical procedure.", "The decision falls to the hospital ethics committee.", "The surgeon must obtain a court order to operate."]', 1, 'The threshold for capacity increases as the risk of the decision increases. While she had capacity to refuse a blood draw, refusing life-saving surgery requires a higher level of understanding and appreciation of consequences, which she now demonstrates she lacks.');

    ---------------------------------------------------------------------------
    -- CASE 04: Assessing Capacity - The Delirious Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Delirious Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Delirious Patient', 'A 68-year-old man is admitted with urosepsis. He is receiving IV fluids and antibiotics. On hospital day 2, he becomes agitated, pulls out his IV line, and demands to leave the hospital. He is disoriented to time and place and believes the nurses are trying to poison him. His vital signs are HR 110, BP 90/60, Temp 101.5F.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old man is admitted with urosepsis. He is receiving IV fluids and antibiotics. On hospital day 2, he becomes agitated, pulls out his IV line, and demands to leave the hospital. He is disoriented to time and place and believes the nurses are trying to poison him. His vital signs are HR 110, BP 90/60, Temp 101.5F.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the capacity to leave Against Medical Advice (AMA)?', '["Yes, any adult can leave AMA at any time.", "Yes, because he is expressing a clear choice.", "No, because his delirium impairs his ability to understand and appreciate the consequences of his decision.", "No, because leaving would result in his death.", "It depends on whether his family agrees."]', 2, 'To have capacity, a patient must be able to understand the information, appreciate the situation and its consequences, reason through the options, and communicate a choice. This patient is delirious and acting under a delusion (poisoning), thus lacking the capacity to make a rational choice about his medical care.'),
    (v_case_id, 'What is the most appropriate next step in his management?', '["Allow him to leave but provide oral antibiotics.", "Call hospital security to physically restrain him immediately.", "Administer IV haloperidol and reinsert the IV line against his will to treat the life-threatening sepsis.", "Have him sign the AMA form to release the hospital from liability.", "Call his next of kin to ask permission to keep him in the hospital."]', 2, 'This is a medical emergency. The patient lacks capacity due to delirium (likely from sepsis), and his condition is life-threatening. Under the principle of beneficence and emergency implied consent, the physician must treat the underlying life-threatening condition, using chemical or physical restraints if absolutely necessary for safety, while continuing to search for a surrogate.');

    ---------------------------------------------------------------------------
    -- CASE 05: Exceptions to Consent - Emergency (Implied) Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unconscious Trauma Victim' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unconscious Trauma Victim', 'A 25-year-old John Doe is brought to the ED by paramedics after a severe motor vehicle collision. He is unconscious, hypotensive, and has an expanding rigid abdomen. FAST exam shows massive intraperitoneal bleeding. No identification or family is present.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old John Doe is brought to the ED by paramedics after a severe motor vehicle collision. He is unconscious, hypotensive, and has an expanding rigid abdomen. FAST exam shows massive intraperitoneal bleeding. No identification or family is present.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate legal and ethical justification for taking this patient immediately to the operating room?', '["Therapeutic privilege", "Substituted judgment", "Implied consent", "The principle of double effect", "Waiver of consent"]', 2, 'Implied consent applies in life-threatening emergencies where the patient is incapacitated and no surrogate is immediately available. The law assumes that a reasonable person would consent to life-saving treatment in such circumstances.'),
    (v_case_id, 'While in the OR, a wallet is found identifying the patient. A medical alert card inside states ''No Blood Transfusions - Jehovah''s Witness''. The patient is actively bleeding out and requires blood products. What should the surgeon do?', '["Administer the blood because implied consent was already established at the start of surgery.", "Administer the blood because the patient is unconscious and cannot confirm his current wishes.", "Do not administer blood products.", "Call the hospital ethics committee for an emergency consult.", "Wake the patient from anesthesia to ask him."]', 2, 'A valid, specific, and clear advance directive (like a signed medical alert card) must be honored, even in an emergency, and even if it results in the patient''s death. It overrides the presumption of implied consent for that specific intervention.');

    ---------------------------------------------------------------------------
    -- CASE 06: Exceptions to Consent - Therapeutic Privilege
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fragile Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fragile Heart', 'A 60-year-old man with severe, unstable angina is about to undergo a high-risk coronary artery bypass graft (CABG). He is extremely anxious, and his heart rate spikes dangerously when stressed. The surgeon considers withholding the information that there is a 5% risk of intraoperative death, fearing the anxiety might trigger a fatal myocardial infarction before the surgery even begins.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old man with severe, unstable angina is about to undergo a high-risk coronary artery bypass graft (CABG). He is extremely anxious, and his heart rate spikes dangerously when stressed. The surgeon considers withholding the information that there is a 5% risk of intraoperative death, fearing the anxiety might trigger a fatal myocardial infarction before the surgery even begins.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the surgeon decides to withhold this specific risk information, what ethical doctrine is being invoked?', '["Paternalism", "Therapeutic privilege", "Implied consent", "Waiver of consent", "Substituted judgment"]', 1, 'Therapeutic privilege is an exception to informed consent where a physician may withhold information if disclosure would cause severe psychological threat or physical harm to the patient (e.g., triggering a fatal MI).'),
    (v_case_id, 'Which of the following is true regarding the modern application of therapeutic privilege?', '["It is frequently used to avoid making patients sad about terminal diagnoses.", "It is widely supported by modern hospital ethics committees.", "It is a very narrow exception and rarely justified, as it heavily infringes on patient autonomy.", "It can be used if the family requests that the patient not be told.", "It is legally identical to a waiver of consent."]', 2, 'Therapeutic privilege is highly controversial and rarely justified in modern medicine because it directly violates patient autonomy. It cannot be used simply because information would be upsetting or if the family requests it; there must be a compelling risk of serious, direct harm.');

    ---------------------------------------------------------------------------
    -- CASE 07: Surrogate Decision Making - Hierarchy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Divided Family' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Divided Family', 'A 70-year-old man suffers a massive hemorrhagic stroke and is intubated in the ICU. He lacks decision-making capacity and has no written advance directive or designated health care proxy. The medical team determines further aggressive care is futile and recommends transitioning to comfort measures. The patient''s family members disagree on the plan. Present are his estranged wife (legally married, separated for 5 years), his 40-year-old son, his 35-year-old daughter, and his live-in girlfriend of 4 years.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old man suffers a massive hemorrhagic stroke and is intubated in the ICU. He lacks decision-making capacity and has no written advance directive or designated health care proxy. The medical team determines further aggressive care is futile and recommends transitioning to comfort measures. The patient''s family members disagree on the plan. Present are his estranged wife (legally married, separated for 5 years), his 40-year-old son, his 35-year-old daughter, and his live-in girlfriend of 4 years.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to standard legal hierarchy in most US states, who has the primary authority to make medical decisions for this patient?', '["The live-in girlfriend", "The estranged wife", "The oldest child (the 40-year-old son)", "A majority vote of the son and daughter", "The attending physician"]', 1, 'In the absence of a designated health care proxy, standard state laws dictate a hierarchy of surrogates: 1) Legal spouse (even if separated, unless legally divorced), 2) Adult children, 3) Parents, 4) Adult siblings. The estranged wife is the legal decision-maker.'),
    (v_case_id, 'Assume the patient had a signed Durable Power of Attorney for Healthcare designating his live-in girlfriend as his proxy. However, the estranged wife argues that as his legal spouse, she should make the decision. Who has authority?', '["The estranged wife", "The live-in girlfriend", "The hospital ethics committee", "A court-appointed guardian", "The adult children"]', 1, 'A designated Health Care Proxy (Durable Power of Attorney for Healthcare) supersedes the default legal hierarchy of next-of-kin. The girlfriend has the authority.');

    ---------------------------------------------------------------------------
    -- CASE 08: Surrogate Standards - Substituted Judgment
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Substituted Judgment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Substituted Judgment', 'An 80-year-old woman with severe Alzheimer''s dementia requires a feeding tube placement. She cannot communicate her wishes. Her daughter is her designated health care proxy. The physician asks the daughter if she consents to the procedure.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old woman with severe Alzheimer''s dementia requires a feeding tube placement. She cannot communicate her wishes. Her daughter is her designated health care proxy. The physician asks the daughter if she consents to the procedure.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'On what primary standard should the daughter base her decision?', '["What the daughter feels is best for her mother (Best Interest Standard)", "What the mother would have chosen if she were competent (Substituted Judgment Standard)", "What the attending physician recommends", "What will prolong the mother''s life the longest", "What the majority of the family wants"]', 1, 'Surrogates must use the Substituted Judgment standard first—making the decision the patient would have made based on the patient''s known values, beliefs, and past statements. The Best Interest standard is only used if the patient''s wishes are completely unknown.'),
    (v_case_id, 'The daughter says, ''I know my mother told me many times before she got sick that she never wanted to be kept alive on machines or feeding tubes. But I can''t bear to let her go, so I want the tube placed.'' What is the physician''s ethical obligation?', '["Follow the daughter''s wishes as she is the legal proxy.", "Place the tube because it preserves life (Beneficence).", "Refuse to place the tube and honor the patient''s previously stated wishes.", "Ask the other children for their opinion.", "Discharge the patient to a hospice facility immediately."]', 2, 'The proxy''s role is to enact the patient''s wishes, not their own. If the proxy explicitly states they are acting against the patient''s known wishes for their own emotional reasons, the physician should not follow the proxy''s directive. An ethics consult is usually the next best step to mediate this.');

    ---------------------------------------------------------------------------
    -- CASE 09: Capacity in Psychiatric Illness
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Schizophrenia and Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Schizophrenia and Surgery', 'A 35-year-old man with a long history of poorly controlled schizophrenia is diagnosed with acute appendicitis. He is currently experiencing auditory hallucinations and believes the government is tracking him. However, when the surgeon explains the appendectomy, the patient says, ''I know my appendix is infected. If you don''t take it out, it will burst and I could die. I want the surgery.''', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old man with a long history of poorly controlled schizophrenia is diagnosed with acute appendicitis. He is currently experiencing auditory hallucinations and believes the government is tracking him. However, when the surgeon explains the appendectomy, the patient says, ''I know my appendix is infected. If you don''t take it out, it will burst and I could die. I want the surgery.''', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the capacity to consent to the appendectomy?', '["No, a diagnosis of schizophrenia automatically precludes capacity.", "No, because he is actively experiencing auditory hallucinations.", "Yes, because his psychiatric symptoms are not interfering with his understanding of his medical condition and the proposed treatment.", "Yes, because appendectomies are low-risk procedures.", "It requires a court order to determine."]', 2, 'Capacity is decision-specific and not solely determined by a psychiatric diagnosis. As long as the patient''s delusions or hallucinations do not cloud his ability to understand his specific medical issue (appendicitis) and the consequences of treating or not treating it, he retains capacity for this decision.'),
    (v_case_id, 'What if the patient refused the surgery, stating, ''The pain in my stomach is actually a government tracking device, and surgery is how they activate it.'' Does he have capacity to refuse?', '["Yes, competent refusal must always be honored.", "Yes, because he understands surgery involves opening his abdomen.", "No, because his decision is a direct manifestation of his psychiatric delusion.", "No, because refusing life-saving surgery always indicates lack of capacity.", "Only a psychiatrist can determine this."]', 2, 'In this scenario, his psychotic delusion directly impairs his ability to appreciate the true nature of his medical condition (appendicitis) and the consequences of refusal. He lacks capacity, and surrogate decision-making or emergency treatment protocols must be engaged.');

    ---------------------------------------------------------------------------
    -- CASE 10: Refusal of Care - Against Medical Advice (AMA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chest Pain and AMA' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chest Pain and AMA', 'A 50-year-old man presents to the ED with crushing substernal chest pain. ECG shows ST-segment elevations consistent with an acute myocardial infarction. The cardiologist recommends emergent cardiac catheterization. The patient refuses, stating, ''I don''t trust hospitals. My father died in one. I am going home.'' The physician thoroughly explains that leaving may result in his immediate death. The patient repeats back this information, says he understands, but still wants to leave.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old man presents to the ED with crushing substernal chest pain. ECG shows ST-segment elevations consistent with an acute myocardial infarction. The cardiologist recommends emergent cardiac catheterization. The patient refuses, stating, ''I don''t trust hospitals. My father died in one. I am going home.'' The physician thoroughly explains that leaving may result in his immediate death. The patient repeats back this information, says he understands, but still wants to leave.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate next step?', '["Administer a sedative and perform the catheterization under emergency consent.", "Call hospital security to detain the patient under a psychiatric hold.", "Have the patient sign an AMA form, provide discharge instructions, and let him leave.", "Refuse to let him leave until his wife arrives.", "Tell the patient his insurance will not cover the ED visit if he leaves AMA."]', 2, 'A competent adult has the absolute right to refuse any medical intervention, even life-saving ones. The patient has demonstrated capacity (understands the risk of death, reasons based on his own values/fears). He must be allowed to leave AMA. Document the discussion thoroughly.'),
    (v_case_id, 'Is it ethical or legally sound to tell the patient his insurance won''t cover the visit if he leaves AMA?', '["Yes, this is a useful tactic to encourage patients to stay for life-saving care.", "Yes, it is a standard part of the informed refusal process.", "No, this is coercion and factually incorrect.", "Only if the physician has verified his specific insurance policy.", "Yes, because it falls under the principle of beneficence."]', 2, 'Telling patients their insurance will deny payment if they leave AMA is a common myth, is usually factually incorrect, and constitutes unethical coercion. Physicians must respect autonomy without using threats or false information.');

    ---------------------------------------------------------------------------
    -- CASE 11: Minors - Parental Refusal of Life-Saving Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Jehovah''s Witness Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Jehovah''s Witness Child', 'A 6-year-old boy is brought to the ED after a severe bicycle accident resulting in significant internal bleeding. His hemoglobin is 5 g/dL and dropping. The trauma surgeon states that without an immediate blood transfusion, the child will die. The parents are devout Jehovah''s Witnesses and refuse the blood transfusion on religious grounds.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old boy is brought to the ED after a severe bicycle accident resulting in significant internal bleeding. His hemoglobin is 5 g/dL and dropping. The trauma surgeon states that without an immediate blood transfusion, the child will die. The parents are devout Jehovah''s Witnesses and refuse the blood transfusion on religious grounds.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate course of action for the physician?', '["Respect the parents'' religious freedom and withhold the blood.", "Administer the blood transfusion over the parents'' objections to save the child''s life.", "Wait until a court order is obtained before giving the blood.", "Transfer the child to a different hospital.", "Ask the 6-year-old what he wants to do."]', 1, 'While parents have broad authority over their children''s medical care, they do NOT have the right to refuse life-saving treatment for a child (Parens Patriae doctrine). In an emergency, physicians must administer life-saving care to a minor regardless of parental religious objection. A court order can be obtained later if time permits, but care should not be delayed if death is imminent.'),
    (v_case_id, 'If the patient in this exact scenario was a 45-year-old competent adult who refused the blood transfusion, what would the physician do?', '["Administer the blood to save his life.", "Withhold the blood, honoring the patient''s refusal.", "Obtain a court order to administer the blood.", "Call his spouse to override his decision.", "Administer blood substitutes only if the patient agrees."]', 1, 'A competent adult has the absolute right to refuse life-saving treatment based on their religious beliefs. The state''s interest in preserving life does not override a competent adult''s autonomy.');

    ---------------------------------------------------------------------------
    -- CASE 12: Minors - Specific Exceptions to Parental Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 15-Year-Old Clinic Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 15-Year-Old Clinic Patient', 'A 15-year-old girl comes to her pediatrician''s office alone. She requests a prescription for oral contraceptives and asks to be tested for sexually transmitted infections (STIs). She explicitly asks the doctor not to tell her parents, fearing they will kick her out of the house.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl comes to her pediatrician''s office alone. She requests a prescription for oral contraceptives and asks to be tested for sexually transmitted infections (STIs). She explicitly asks the doctor not to tell her parents, fearing they will kick her out of the house.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the physician legally provide the requested care without parental consent?', '["No, all minors require parental consent for all medical care.", "Yes, but only the STI testing, not the contraception.", "Yes, minors can consent to care regarding contraception, STIs, pregnancy, and substance abuse.", "No, she must be an officially emancipated minor (e.g., married or in the military).", "Yes, but the physician is legally obligated to inform the parents afterward."]', 2, 'All 50 US states have laws allowing minors to consent to specific types of healthcare without parental knowledge or consent. These include contraception, STI testing/treatment, pregnancy care, and substance abuse treatment. This is to encourage vulnerable minors to seek necessary care.'),
    (v_case_id, 'Later in the visit, she also requests that the doctor prescribe an antidepressant for her mild depression without telling her parents. Can the physician do this?', '["Yes, mental health falls under the same exceptions as STIs.", "No, prescribing daily psychiatric medication generally requires parental consent for a non-emancipated 15-year-old.", "Yes, but only if the physician feels she is a ''mature minor''.", "No, unless she is actively suicidal.", "Yes, if she pays for the medication in cash."]', 1, 'While some states allow minors to consent to outpatient mental health *counseling*, initiating pharmacological treatment for depression in a non-emancipated minor generally requires parental consent, as it does not fall under the strict public health exceptions (like STIs/contraception).');

    ---------------------------------------------------------------------------
    -- CASE 13: Minors - Emancipation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Emancipated Minor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Emancipated Minor', 'A 17-year-old male presents to the clinic requesting a vasectomy. He provides legal documentation proving he is married and currently serving in the US Army.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 17-year-old male presents to the clinic requesting a vasectomy. He provides legal documentation proving he is married and currently serving in the US Army.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the legal right to consent to a vasectomy without parental involvement?', '["No, he is under 18 and a vasectomy is a permanent elective procedure.", "No, vasectomies are illegal for anyone under 18 regardless of status.", "Yes, because he meets the criteria for an emancipated minor.", "Yes, but only if his commanding officer approves.", "Yes, but only if his spouse co-signs the consent."]', 2, 'Emancipated minors have the full legal capacity of an adult to consent to all medical procedures. Common criteria for emancipation include being legally married, serving in the armed forces, being financially independent and living apart from parents, or having a court order of emancipation.'),
    (v_case_id, 'Which of the following is generally NOT a standalone criteria for legal emancipation in most states?', '["Being married", "Serving in the military", "Having a child", "Having a court order", "Being self-supporting"]', 2, 'Simply having a child does not automatically emancipate a minor in most states (though the minor *can* make medical decisions for their child). Marriage, military service, and court orders are the standard criteria.');

    ---------------------------------------------------------------------------
    -- CASE 14: Pregnant Patients and Refusal of Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Maternal vs Fetal Rights' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Maternal vs Fetal Rights', 'A 28-year-old woman at 38 weeks gestation presents with severe preeclampsia and fetal distress. The obstetrician recommends an emergent cesarean section to save the fetus. The mother, who is fully competent, refuses the surgery because she strongly desires a natural vaginal birth, despite understanding that the delay will likely result in fetal demise.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old woman at 38 weeks gestation presents with severe preeclampsia and fetal distress. The obstetrician recommends an emergent cesarean section to save the fetus. The mother, who is fully competent, refuses the surgery because she strongly desires a natural vaginal birth, despite understanding that the delay will likely result in fetal demise.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate ethical and legal action for the physician?', '["Perform the C-section against her will to save the viable fetus.", "Obtain an emergency court order to force the C-section.", "Respect the mother''s refusal and prepare for a high-risk vaginal delivery.", "Call child protective services to take custody of the fetus.", "Sedate the mother to perform the surgery safely."]', 2, 'A competent pregnant woman has the same right to refuse medical treatment as any other competent adult, even if that refusal results in harm or death to the fetus. Forced medical interventions (like surgery) on a competent pregnant woman violate her bodily autonomy and are ethically and legally unacceptable.'),
    (v_case_id, 'Does the father of the fetus have the legal right to override the mother''s refusal in this situation?', '["Yes, because the fetus is viable.", "Yes, if they are legally married.", "No, the father cannot override the mother''s bodily autonomy.", "Yes, if he obtains a court order.", "It depends on state laws regarding fetal personhood."]', 2, 'The father cannot compel the mother to undergo an invasive medical procedure (surgery) against her will, regardless of marital status or fetal viability. The mother''s bodily autonomy is paramount.');

    ---------------------------------------------------------------------------
    -- CASE 15: Disclosing Medical Errors
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrong Medication' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrong Medication', 'An intern accidentally orders 100 mg of metoprolol instead of 10 mg for a patient. The nurse administers the medication. The patient develops transient bradycardia (HR 45) but remains asymptomatic, and his heart rate normalizes after a few hours without any intervention. The patient is unaware of the error.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An intern accidentally orders 100 mg of metoprolol instead of 10 mg for a patient. The nurse administers the medication. The patient develops transient bradycardia (HR 45) but remains asymptomatic, and his heart rate normalizes after a few hours without any intervention. The patient is unaware of the error.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should this error be disclosed to the patient?', '["No, because no permanent harm occurred.", "No, it will only cause the patient unnecessary anxiety.", "Yes, but only if the patient asks why his heart rate dropped.", "Yes, medical ethics require full disclosure of all medical errors, regardless of harm.", "No, tell the attending physician but keep it from the patient."]', 3, 'Physicians have an ethical obligation to disclose all medical errors to patients, even "near misses" or errors that caused no significant or lasting harm. This maintains trust, respects autonomy, and is a professional standard.'),
    (v_case_id, 'Who is the most appropriate person to disclose the error to the patient?', '["The hospital risk manager", "The nurse who administered the drug", "The intern who wrote the order, ideally accompanied by the attending physician", "The hospital chaplain", "A lawyer"]', 2, 'The physician primarily responsible for the patient''s care (the attending) or the one who made the error (the intern, supervised by the attending) should disclose the error. It should be done promptly, honestly, and with an apology.');

    ---------------------------------------------------------------------------
    -- CASE 16: Research and Informed Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clinical Trial' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clinical Trial', 'A patient with refractory rheumatoid arthritis is enrolled in a randomized, double-blind, placebo-controlled trial for a new biologic drug. Two months into the trial, she tells the investigator, ''I want to drop out. My joints hurt too much, and I think I am on the placebo.''', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with refractory rheumatoid arthritis is enrolled in a randomized, double-blind, placebo-controlled trial for a new biologic drug. Two months into the trial, she tells the investigator, ''I want to drop out. My joints hurt too much, and I think I am on the placebo.''', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the investigator''s most appropriate response?', '["Inform her that she signed a contract and must complete the 6-month trial.", "Unblind her treatment assignment so she knows if she is on the placebo.", "Respect her decision and allow her to withdraw without penalty.", "Tell her she will lose access to standard clinic care if she drops out.", "Offer to pay her more to stay in the study."]', 2, 'A fundamental principle of research ethics (Declaration of Helsinki) is that participants have the absolute right to withdraw from a research study at any time, for any reason, without penalty or loss of standard medical care.'),
    (v_case_id, 'Which of the following elements is required for informed consent in a research study but NOT typically required for standard clinical care consent?', '["Disclosure of risks and benefits", "Assessment of patient capacity", "Explanation that participation is voluntary and they can withdraw at any time", "Discussion of alternatives", "The name of the physician"]', 2, 'While voluntariness is assumed in clinical care, research consent must explicitly state that participation is entirely voluntary, that refusal will not affect standard care, and that the subject can withdraw at any time.');

    ---------------------------------------------------------------------------
    -- CASE 17: Advance Directives - The Living Will
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Living Will' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Living Will', 'An 85-year-old man with end-stage COPD is admitted with severe respiratory failure. He is lethargic and lacks capacity. He has a Living Will that explicitly states: "I do not want to be placed on a mechanical ventilator under any circumstances." His son, who is his designated health care proxy, insists that the doctors intubate him, saying, "He didn''t know how bad it would get. Please save him."', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old man with end-stage COPD is admitted with severe respiratory failure. He is lethargic and lacks capacity. He has a Living Will that explicitly states: "I do not want to be placed on a mechanical ventilator under any circumstances." His son, who is his designated health care proxy, insists that the doctors intubate him, saying, "He didn''t know how bad it would get. Please save him."', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What should the physician do regarding intubation?', '["Intubate the patient because the proxy''s current decision overrides a past document.", "Do not intubate the patient, honoring the Living Will.", "Intubate the patient because of the principle of beneficence.", "Wait for an ethics committee consult before acting.", "Intubate the patient, but extubate him later if the son changes his mind."]', 1, 'A clear, specific, and applicable written advance directive (Living Will) representing the patient''s competent wishes supersedes a surrogate''s decision. The proxy is supposed to enact the patient''s wishes; if they directly contradict a clear written directive, the directive must be followed.'),
    (v_case_id, 'What is the primary difference between a Living Will and a Durable Power of Attorney for Healthcare (Healthcare Proxy)?', '["A Living Will is only for terminal illnesses; a Proxy is for any illness.", "A Living Will designates a person; a Proxy dictates specific treatments.", "A Living Will outlines specific medical wishes; a Proxy designates a person to make decisions.", "A Living Will expires after 5 years; a Proxy does not.", "There is no difference; they are synonymous."]', 2, 'A Living Will is a document detailing specific interventions a patient does or does not want (e.g., ventilators, feeding tubes). A Durable Power of Attorney for Healthcare designates a surrogate person to make decisions when the patient cannot.');

    ---------------------------------------------------------------------------
    -- CASE 18: Brain Death and Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Brain Death Criteria' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Brain Death Criteria', 'A 40-year-old woman suffers a devastating subarachnoid hemorrhage. After comprehensive neurological testing (including apnea testing), she meets all clinical criteria for brain death. Her heart is still beating due to the mechanical ventilator. Her family is distraught and says, "We will not consent to turning off the ventilator. We are waiting for a miracle."', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old woman suffers a devastating subarachnoid hemorrhage. After comprehensive neurological testing (including apnea testing), she meets all clinical criteria for brain death. Her heart is still beating due to the mechanical ventilator. Her family is distraught and says, "We will not consent to turning off the ventilator. We are waiting for a miracle."', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Do the physicians need the family''s consent to discontinue the ventilator?', '["Yes, because the heart is still beating.", "Yes, stopping the ventilator without consent constitutes murder.", "No, brain death is legal death; consent is not required to stop medical interventions on a deceased person.", "Only if the patient did not have an organ donor card.", "Yes, unless the hospital ethics committee overrides the family."]', 2, 'Brain death is legally and medically equivalent to cardiopulmonary death. Once brain death is declared, the patient is legally dead. Consent is not required from the family to discontinue life support, as you cannot provide medical treatment to a corpse. (However, physicians should handle the situation with immense compassion and allow the family time to grieve).'),
    (v_case_id, 'Which of the following is NOT a requirement for declaring brain death?', '["Absence of brainstem reflexes (e.g., pupillary, corneal, gag)", "Apnea (inability to breathe independently when PCO2 rises)", "Irreversible cessation of all functions of the entire brain", "A flat electroencephalogram (EEG)", "Exclusion of reversible causes (e.g., hypothermia, drug intoxication)"]', 3, 'Brain death is primarily a clinical diagnosis. While an EEG or cerebral blood flow study can be used as an ancillary test if clinical testing cannot be fully performed, a flat EEG is not strictly required if the clinical criteria (coma, absence of brainstem reflexes, positive apnea test) are met.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Intoxicated Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Intoxicated Laceration' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Intoxicated Laceration', 'A 22-year-old college student is brought to the ED by friends after a fall at a fraternity party. He has a deep, actively bleeding laceration on his forehead. He smells strongly of alcohol, slurs his words, and cannot stay awake during the physician''s questions. When the doctor tries to suture the wound, he swats her hand away and slurs, "Leave me alone, I''m going to sleep."', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old college student is brought to the ED by friends after a fall at a fraternity party. He has a deep, actively bleeding laceration on his forehead. He smells strongly of alcohol, slurs his words, and cannot stay awake during the physician''s questions. When the doctor tries to suture the wound, he swats her hand away and slurs, "Leave me alone, I''m going to sleep."', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the capacity to refuse the sutures?', '["Yes, because a laceration is not life-threatening.", "Yes, because intoxication does not automatically remove capacity.", "No, his level of intoxication impairs his ability to understand the risks of refusing care.", "No, because his friends brought him in, making them his surrogates.", "Yes, because he physically resisted."]', 2, 'While mild intoxication does not automatically remove capacity, this patient is slurring, somnolent, and unable to engage in a discussion about risks and benefits. He lacks the capacity to make a reasoned decision to refuse care.'),
    (v_case_id, 'What is the appropriate management?', '["Let him sleep it off and suture it tomorrow.", "Have his friends hold him down to suture the wound.", "Discharge him to the care of his friends.", "Use chemical or physical restraints if necessary to evaluate and treat the active bleeding, as implied consent applies.", "Call his parents for consent."]', 3, 'Because he lacks capacity and has an active injury requiring evaluation (potential head trauma) and treatment (bleeding laceration), the physician must act under implied consent. Restraints may be used to safely provide necessary care until he regains capacity.');

    ---------------------------------------------------------------------------
    -- CASE 20: Capacity vs. Competence
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Capacity vs Competence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Capacity vs Competence', 'A 3rd-year medical student is presenting a case of a patient with severe dementia to the attending physician. The student says, "The patient is incompetent to consent to the colonoscopy."', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3rd-year medical student is presenting a case of a patient with severe dementia to the attending physician. The student says, "The patient is incompetent to consent to the colonoscopy."', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the student''s use of the word "incompetent" technically incorrect in a clinical setting?', '["Because dementia patients are always competent.", "Because ''competence'' is a legal term determined by a judge, whereas ''capacity'' is a clinical term determined by a physician.", "Because ''competence'' only refers to financial decisions.", "Because the correct term is ''insane''.", "There is no difference; the terms are interchangeable."]', 1, 'In medical ethics and law, "Capacity" is a clinical determination made by a healthcare provider for a specific medical decision. "Competence" is a global legal status determined by a judge in a court of law.'),
    (v_case_id, 'If a patient is legally declared "incompetent" by a judge, who makes their medical decisions?', '["The attending physician", "A court-appointed legal guardian", "The patient''s oldest child automatically", "The hospital ethics committee", "The state government"]', 1, 'When a court declares someone legally incompetent, it strips them of their decision-making rights and appoints a legal guardian (conservator) to make decisions on their behalf.');

    ---------------------------------------------------------------------------
    -- CASE 21: Consent for HIV Testing
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Needlestick Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Needlestick Injury', 'A surgical resident sustains a deep needlestick injury while operating on a patient with a history of IV drug use. The resident wants the patient tested for HIV. The patient is awake in the recovery room and refuses HIV testing.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surgical resident sustains a deep needlestick injury while operating on a patient with a history of IV drug use. The resident wants the patient tested for HIV. The patient is awake in the recovery room and refuses HIV testing.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the hospital test the patient''s blood for HIV without his consent?', '["Yes, to protect the healthcare worker.", "Yes, because he is a high-risk IV drug user.", "No, HIV testing generally requires specific informed consent, and competent refusal must be honored.", "Only if the hospital administrator signs an override.", "Yes, but only if they don''t tell the patient the results."]', 2, 'In most jurisdictions, HIV testing requires specific informed consent from the patient. Even in the case of a healthcare worker exposure, a competent patient''s refusal must be honored. (Note: A few states have laws allowing testing of existing blood samples after occupational exposure, but the general USMLE rule emphasizes patient consent).'),
    (v_case_id, 'What is the most appropriate next step for the resident?', '["Draw blood from the patient while he is asleep.", "Start Post-Exposure Prophylaxis (PEP) immediately.", "Refuse to treat the patient in the future.", "Sue the patient for negligence.", "Wait to see if symptoms develop."]', 1, 'If source patient testing cannot be obtained, the exposed healthcare worker should immediately begin empiric Post-Exposure Prophylaxis (PEP) for HIV, ideally within hours of the exposure.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Right to Information - Family Requests
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Protective Daughter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Protective Daughter', 'A 75-year-old woman undergoes a biopsy that reveals metastatic breast cancer. Before the physician can enter the room to deliver the results, the patient''s daughter stops him in the hallway and says, "If it''s cancer, please don''t tell my mother. It will destroy her will to live. I will make all the treatment decisions."', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old woman undergoes a biopsy that reveals metastatic breast cancer. Before the physician can enter the room to deliver the results, the patient''s daughter stops him in the hallway and says, "If it''s cancer, please don''t tell my mother. It will destroy her will to live. I will make all the treatment decisions."', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate response by the physician?', '["Agree to the daughter''s request to protect the patient''s emotional state.", "Ask the patient how much information she wishes to know about her diagnosis.", "Tell the daughter that by law, he must immediately tell the patient everything.", "Refer the case to the ethics committee.", "Tell the patient she has a benign tumor to maintain her hope."]', 1, 'While family members often want to protect patients, the physician''s primary duty is to the patient. The best approach is to ask the patient directly how much she wants to know (e.g., "Some patients want to know all the details, while others prefer I discuss it with their family. What would you prefer?"). If she asks for the diagnosis, she must be told the truth.'),
    (v_case_id, 'If the patient says, "I don''t want to know the results. Just tell my daughter and let her decide," what ethical principle is she exercising?', '["Justice", "Beneficence", "Autonomy (Waiver of informed consent)", "Non-maleficence", "Paternalism"]', 2, 'Choosing not to receive medical information and delegating decision-making to a surrogate is a valid exercise of patient autonomy, known as a waiver of informed consent.');

    ---------------------------------------------------------------------------
    -- CASE 23: Deception in Medical Practice
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Alzheimer''s Ward' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Alzheimer''s Ward', 'An 88-year-old man with advanced Alzheimer''s dementia lives in a memory care unit. Every afternoon, he becomes highly agitated, crying that he needs to leave to pick up his children from school (his children are in their 60s). Logic and reality orientation only make him more combative and distressed.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 88-year-old man with advanced Alzheimer''s dementia lives in a memory care unit. Every afternoon, he becomes highly agitated, crying that he needs to leave to pick up his children from school (his children are in their 60s). Logic and reality orientation only make him more combative and distressed.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The nursing staff asks the physician if it is acceptable to use "therapeutic fibbing" (e.g., telling him "The school called, the kids are staying late for a field trip, let''s have some tea while we wait") to calm him down. Is this ethically permissible?', '["No, lying to a patient is never ethically permissible under any circumstances.", "Yes, because it prevents distress and harm in a patient who lacks the capacity to be oriented to reality.", "No, he should be chemically restrained with antipsychotics instead.", "Yes, but only if the family signs a consent form for deception.", "No, it violates the principle of justice."]', 1, 'While veracity (truth-telling) is a core ethical duty, strict reality orientation in advanced dementia often causes severe psychological harm. "Therapeutic fibbing" or validation therapy is ethically permissible and compassionate when a patient lacks capacity to understand reality and telling the truth causes needless suffering (Beneficence/Non-maleficence outweighing strict Veracity).'),
    (v_case_id, 'What ethical principle primarily justifies this approach?', '["Autonomy", "Justice", "Non-maleficence (preventing psychological harm)", "Confidentiality", "Fidelity"]', 2, 'The primary justification is preventing the severe psychological distress and potential physical harm (from agitation) that reality orientation causes in this specific, incapacitated patient.');

    ---------------------------------------------------------------------------
    -- CASE 24: Implied Consent in Primary Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Routine Exam' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Routine Exam', 'A patient visits his primary care doctor for a routine physical. The doctor says, "I need to listen to your heart and lungs," and the patient unbuttons his shirt and sits forward on the exam table.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient visits his primary care doctor for a routine physical. The doctor says, "I need to listen to your heart and lungs," and the patient unbuttons his shirt and sits forward on the exam table.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of consent has the patient provided for the physical exam?', '["Explicit written consent", "Implied consent", "Emergency consent", "Substituted consent", "Waiver of consent"]', 1, 'Implied consent occurs when a patient''s actions (like rolling up a sleeve for a blood draw or unbuttoning a shirt for an exam) indicate their agreement to a routine, low-risk procedure. Written informed consent is not required for routine physical exams.'),
    (v_case_id, 'Later, the doctor wants to perform a digital rectal exam (DRE) to check the prostate. The patient says, "No, I don''t want that done today." What should the doctor do?', '["Perform the exam anyway, as it is part of a routine physical.", "Explain the risks of skipping the exam, and if he still refuses, respect his decision.", "Tell the patient he must find a new doctor.", "Assume the patient doesn''t understand and proceed.", "Have the nurse perform it."]', 1, 'Patients can withdraw implied consent at any time. The physician must explain the medical reasoning (beneficence) but ultimately respect the competent patient''s refusal (autonomy).');

    ---------------------------------------------------------------------------
    -- CASE 25: Restraints and Autonomy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fall Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fall Risk', 'An 82-year-old woman is admitted for a hip fracture. She is confused, likely due to pain medications (delirium), and keeps trying to climb out of bed, putting her at severe risk for another fall and fracture. The nursing staff requests an order for soft wrist restraints.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 82-year-old woman is admitted for a hip fracture. She is confused, likely due to pain medications (delirium), and keeps trying to climb out of bed, putting her at severe risk for another fall and fracture. The nursing staff requests an order for soft wrist restraints.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s fall risk?', '["Order the restraints immediately to prevent harm.", "Attempt less restrictive measures first (e.g., bed alarm, frequent checks, lowering the bed, family sitter).", "Administer heavy sedation.", "Call the ethics committee.", "Transfer her to the ICU."]', 1, 'Restraints are a severe infringement on autonomy and carry physical risks (strangulation, skin breakdown, worsening delirium). They should only be used as an absolute last resort when all less restrictive alternatives have failed and there is an imminent risk of harm.'),
    (v_case_id, 'If all less restrictive measures fail and she actively attempts to climb over the bed rails, is it ethical to apply restraints without her consent?', '["No, restraints always require written informed consent.", "Yes, because she currently lacks capacity due to delirium and is at imminent risk of severe physical harm.", "No, the family must sign a consent form first.", "Yes, but only for a maximum of 24 hours without review.", "Yes, because the hospital is liable if she falls."]', 1, 'When a patient lacks capacity and is an immediate danger to themselves or others, the physician has an ethical and legal duty to protect them (Beneficence/Non-maleficence), which may justify the temporary use of restraints. Strict protocols and frequent reassessments are required.');

END $$;

COMMIT;
