-- Clinical Skills & Diagnostics: Ethics - Informed Consent & Capacity - Part 2 (Cases 26-50)
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
    -- CASE 26: Assent vs. Consent in Pediatrics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 12-Year-Old''s Assent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 12-Year-Old''s Assent', 'A 12-year-old boy is diagnosed with osteosarcoma. The oncologist explains the treatment plan, which involves an amputation and chemotherapy, to both the boy and his parents. The parents consent to the surgery. The boy is terrified and says, ''No, please don''t cut my leg off! I won''t let you!''', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old boy is diagnosed with osteosarcoma. The oncologist explains the treatment plan, which involves an amputation and chemotherapy, to both the boy and his parents. The parents consent to the surgery. The boy is terrified and says, ''No, please don''t cut my leg off! I won''t let you!''', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ethical requirement regarding the child in this scenario?', '["His refusal must be honored because he is over 10 years old.", "The physician should attempt to obtain his ''assent'', but parental ''consent'' is legally sufficient to proceed.", "The surgery cannot proceed until a court orders it.", "The parents lose their right to consent if the child disagrees.", "He is an emancipated minor due to the severity of the disease."]', 1, 'In pediatrics, ''consent'' is legally provided by the parents. However, ethically, physicians should seek the ''assent'' (agreement) of older children (typically >7 years old) out of respect for their developing autonomy. If a child refuses a life-saving or necessary treatment that the parents consent to, the treatment proceeds, but the physician should work to address the child''s fears.'),
    (v_case_id, 'What is the primary difference between consent and assent?', '["Consent is verbal; assent is written.", "Consent is for adults; assent is the ethical agreement of a minor who lacks legal capacity to consent.", "Consent is clinical; assent is legal.", "There is no difference.", "Assent is only used in research, not clinical care."]', 1, 'Consent is a legally binding authorization (by an adult or emancipated minor). Assent is an ethical concept reflecting a minor''s willingness to participate in care, acknowledging their developing autonomy without granting them legal veto power over necessary treatments.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Mature Minor Doctrine
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mature Minor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mature Minor', 'A 16-year-old girl with a history of recurrent, severe endometriosis presents for a scheduled laparoscopic ablation. Her mother is delayed in traffic and cannot be reached. The girl is highly intelligent, understands all the risks and benefits, and has had this identical procedure done before. She asks to sign the consent form so the surgery is not delayed.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl with a history of recurrent, severe endometriosis presents for a scheduled laparoscopic ablation. Her mother is delayed in traffic and cannot be reached. The girl is highly intelligent, understands all the risks and benefits, and has had this identical procedure done before. She asks to sign the consent form so the surgery is not delayed.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the physician allow her to consent under the "Mature Minor Doctrine"?', '["Yes, because she is over 15 and understands the procedure.", "Yes, because it is not a high-risk surgery.", "No, the Mature Minor doctrine is a legal determination made by a judge, not a clinical determination by a doctor on the fly.", "No, endometriosis does not qualify as an emergency.", "Yes, because her mother is unreachable."]', 2, 'The "Mature Minor Doctrine" allows minors who demonstrate sufficient maturity and intelligence to understand the risks/benefits of a proposed treatment to consent to it. However, in most jurisdictions, this is a legal defense or requires a judge''s order, not something a physician can independently decide in a non-emergency clinical setting. The surgery must wait for the parent.'),
    (v_case_id, 'If the procedure was a life-saving emergency (e.g., ruptured ectopic pregnancy), what would be the justification to proceed?', '["Mature minor doctrine", "Emancipation", "Implied consent", "Substituted judgment", "Beneficence"]', 2, 'In an emergency where a delay would cause death or severe harm, and parents cannot be reached, implied consent applies to minors just as it does to incapacitated adults.');

    ---------------------------------------------------------------------------
    -- CASE 28: Emancipation vs Specific Exceptions
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pregnant Teenager' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pregnant Teenager', 'A 16-year-old girl is 3 months pregnant. She comes to the clinic requesting treatment for a chlamydial infection and also asks to get a cast put on her wrist, which she broke roller-skating.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl is 3 months pregnant. She comes to the clinic requesting treatment for a chlamydial infection and also asks to get a cast put on her wrist, which she broke roller-skating.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which treatments can she consent to without her parents?', '["Only the cast", "Only the chlamydia treatment", "Both the chlamydia treatment and the cast", "Neither; she is 16", "Only treatments directly related to her pregnancy"]', 1, 'In most states, pregnancy does NOT automatically emancipate a minor for ALL medical care. She can consent to care related to pregnancy, STIs, and contraception (specific exceptions), but she still needs parental consent for general medical care like a broken wrist.'),
    (v_case_id, 'Can she make medical decisions for her future baby once it is born?', '["No, her parents must make decisions for the baby.", "No, she must be 18.", "Yes, a minor parent has full legal authority to consent to medical care for their own child.", "Only if she is married.", "Only if the baby''s father is 18."]', 2, 'A minor who has a child retains full legal authority to make medical decisions for that child, even if the minor parent themselves still requires parental consent for their own general medical care.');

    ---------------------------------------------------------------------------
    -- CASE 29: Withholding vs Withdrawing Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Withdrawing the Ventilator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Withdrawing the Ventilator', 'A patient with end-stage ALS has been on a ventilator for a month. He communicates via an eye-tracking device that he wants the ventilator turned off because his quality of life is unacceptable. The ICU team is uncomfortable, feeling that turning off the machine is active euthanasia.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with end-stage ALS has been on a ventilator for a month. He communicates via an eye-tracking device that he wants the ventilator turned off because his quality of life is unacceptable. The ICU team is uncomfortable, feeling that turning off the machine is active euthanasia.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ethical and legal consensus on withholding versus withdrawing life-sustaining treatment?', '["Withdrawing is ethically worse than withholding.", "Withholding is legal, but withdrawing is illegal.", "There is no ethical or legal distinction between withholding and withdrawing life-sustaining treatment.", "Withdrawing requires a court order.", "Withdrawing constitutes physician-assisted suicide."]', 2, 'Ethically and legally, there is no difference between choosing not to start a treatment (withholding) and stopping a treatment that has already been started (withdrawing). Both are considered allowing the underlying disease process to take its natural course when a competent patient refuses care.'),
    (v_case_id, 'Is turning off the ventilator in this scenario considered active euthanasia?', '["Yes, because the physician is taking an action that leads to death.", "No, it is honoring a competent refusal of care; the underlying disease is the cause of death.", "Yes, if the patient dies within 24 hours.", "No, but it is physician-assisted suicide.", "Yes, under the principle of double effect."]', 1, 'Active euthanasia is administering a lethal substance with the intent to cause death. Turning off a ventilator is honoring a patient''s right to refuse bodily invasion (the breathing tube); the underlying ALS is what causes the death. It is entirely legal and ethical.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Principle of Double Effect
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Morphine Drip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Morphine Drip', 'A patient with terminal bone cancer is in agonizing pain during his final days in hospice. The physician prescribes a high-dose morphine drip to control the pain, knowing that this dose may also depress the patient''s respiratory drive and potentially hasten his death.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with terminal bone cancer is in agonizing pain during his final days in hospice. The physician prescribes a high-dose morphine drip to control the pain, knowing that this dose may also depress the patient''s respiratory drive and potentially hasten his death.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which ethical principle justifies this action?', '["The principle of Double Effect", "Therapeutic Privilege", "Active Euthanasia", "Justice", "Substituted Judgment"]', 0, 'The Principle of Double Effect states that an action with a bad effect (hastening death) is ethically permissible if the action itself is good or neutral (giving pain medication), the intent is good (relieving pain), the bad effect is not the means to the good effect, and there is a proportionately grave reason (terminal agony).'),
    (v_case_id, 'What is the critical differentiator between the Principle of Double Effect and Euthanasia in this scenario?', '["The dosage of the medication.", "The patient''s life expectancy.", "The physician''s primary intent.", "The patient''s capacity.", "The involvement of the family."]', 2, 'Intent is the key. In double effect, the intent is solely to relieve pain, and death is an accepted but unintended side effect. In euthanasia, the primary intent is to cause death to relieve suffering.');

    ---------------------------------------------------------------------------
    -- CASE 31: End of Life - Next of Kin Disagreement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Disagreeing Siblings' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Disagreeing Siblings', 'A 90-year-old widow with advanced vascular dementia suffers a massive stroke. She is unresponsive. She has no designated health care proxy. Her two adult children are present. The son wants to transition to comfort care, stating, ''Mom hated being in hospitals.'' The daughter demands full aggressive measures, stating, ''We must do everything.''', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 90-year-old widow with advanced vascular dementia suffers a massive stroke. She is unresponsive. She has no designated health care proxy. Her two adult children are present. The son wants to transition to comfort care, stating, ''Mom hated being in hospitals.'' The daughter demands full aggressive measures, stating, ''We must do everything.''', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Legally, how is this tie typically resolved if neither child was formally appointed as proxy?', '["The male child has priority in most states.", "The older child has priority.", "Both children have equal legal standing; consensus must be reached, or an ethics committee/court must intervene.", "The attending physician makes the decision.", "Aggressive care is legally required until they agree."]', 2, 'In the absence of a designated proxy, state hierarchy laws place all adult children on the same level of priority. If they disagree, the physician cannot arbitrarily pick one. An ethics consult, mediation, or ultimately a court order is required to break the tie.'),
    (v_case_id, 'What ethical standard should the ethics committee use to help the siblings reach a decision?', '["Best interest standard", "Substituted judgment standard", "Quality of life standard", "The principle of non-maleficence", "The principle of justice"]', 1, 'The committee will try to mediate by asking the siblings to focus on the Substituted Judgment standard: not what the children want, but what the mother would have wanted if she could speak for herself right now.');

    ---------------------------------------------------------------------------
    -- CASE 32: Medical Futility
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medical Futility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medical Futility', 'A patient is in a persistent vegetative state with multi-organ failure. The family demands the physician initiate dialysis and administer experimental, unproven therapies. The physician believes these interventions offer no physiological benefit and will only prolong the dying process.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is in a persistent vegetative state with multi-organ failure. The family demands the physician initiate dialysis and administer experimental, unproven therapies. The physician believes these interventions offer no physiological benefit and will only prolong the dying process.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is the physician ethically obligated to provide the requested therapies?', '["Yes, because patient/family autonomy is absolute.", "Yes, because the therapies might work (beneficence).", "No, physicians are not obligated to provide medically futile (non-beneficial) treatments.", "Only if the family threatens to sue.", "Only if the therapies are FDA approved."]', 2, 'Autonomy is not a negative right to demand any treatment. Physicians are not ethically or legally obligated to provide treatments that are physiologically futile or outside the standard of care. This is rooted in non-maleficence (preventing the harm of invasive, useless procedures).'),
    (v_case_id, 'If the family refuses to accept the physician''s determination of futility, what is the appropriate process?', '["Unilaterally stop all care immediately.", "Call hospital security to remove the family.", "Engage the hospital ethics committee, offer a second opinion, and allow time to transfer the patient to another facility if one will accept them.", "Sedate the patient so they don''t feel the lack of care.", "Follow the family''s demands to avoid a lawsuit."]', 2, 'When conflicts over futility arise, institutional policies (often based on laws like the Texas Advance Directives Act) dictate a process: ethics committee review, clear communication, and offering the family a reasonable window (e.g., 10-14 days) to find another physician or facility willing to provide the care before unilateral withdrawal is considered.');

    ---------------------------------------------------------------------------
    -- CASE 33: Refusal of Care in Pregnancy (Psychiatric overlay)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pregnant Patient with Anorexia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pregnant Patient with Anorexia', 'A 24-year-old woman with severe, long-standing anorexia nervosa is 20 weeks pregnant. Her BMI is 14. She is refusing all oral intake and IV nutrition, stating, ''I am too fat, I cannot eat.'' The obstetrician is concerned that both the mother and fetus will die of starvation.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old woman with severe, long-standing anorexia nervosa is 20 weeks pregnant. Her BMI is 14. She is refusing all oral intake and IV nutrition, stating, ''I am too fat, I cannot eat.'' The obstetrician is concerned that both the mother and fetus will die of starvation.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does her psychiatric diagnosis impact her capacity to refuse nutrition?', '["It automatically removes her capacity.", "Her delusion regarding her body weight directly impairs her ability to understand the reality of her starvation and its consequences, thus she lacks capacity for this specific decision.", "She retains capacity because anorexia is not a psychotic disorder.", "Her pregnancy automatically removes her capacity.", "She retains capacity because refusing food is a fundamental right."]', 1, 'Severe anorexia can reach a delusional intensity where the patient cannot appreciate the reality of their physical deterioration. Because her psychiatric illness directly impairs her understanding of the specific decision (nutrition), she lacks capacity.'),
    (v_case_id, 'Given her lack of capacity, what is the most appropriate management?', '["Respect her refusal as a competent choice.", "Place a feeding tube against her will to save her and the fetus.", "Discharge her to a psychiatric facility.", "Obtain a court order for an abortion.", "Tell her she is harming her baby to induce guilt."]', 1, 'Because she lacks capacity to make decisions about her nutrition, and the condition is life-threatening to her (and the fetus), the medical team should intervene (surrogate consent or emergency intervention) to provide life-saving artificial nutrition, usually in coordination with a psychiatric hold/treatment.');

    ---------------------------------------------------------------------------
    -- CASE 34: Intellectual Disability and Capacity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Down Syndrome and Consent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Down Syndrome and Consent', 'A 30-year-old man with Down syndrome and moderate intellectual disability needs a dental extraction under conscious sedation. He lives in a group home but his parents are his legal guardians.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old man with Down syndrome and moderate intellectual disability needs a dental extraction under conscious sedation. He lives in a group home but his parents are his legal guardians.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who must provide the legal consent for the procedure?', '["The patient", "The manager of the group home", "The parents (legal guardians)", "The attending dentist", "No one, implied consent applies"]', 2, 'Because the patient has a court-appointed legal guardian (his parents) due to his intellectual disability, the legal guardians must provide the informed consent.'),
    (v_case_id, 'What is the ethical role of the 30-year-old patient in this process?', '["He has no role.", "He should be excluded from the room during the discussion.", "The dentist should explain the procedure in simple terms and seek his assent.", "He must sign the consent form alongside his parents.", "He has the power to veto his parents'' decision."]', 2, 'Similar to pediatric ethics, when dealing with adults who have intellectual disabilities and legal guardians, the physician should respect the patient''s developing or remaining autonomy by explaining things at their level of understanding and seeking their assent to the procedure.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Suicidal Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Acetaminophen Overdose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Acetaminophen Overdose', 'A 20-year-old woman is brought to the ED by her roommate. She admits to taking an entire bottle of acetaminophen an hour ago in a suicide attempt because her boyfriend broke up with her. She is currently medically stable and alert, but refuses the administration of N-acetylcysteine (NAC) or activated charcoal, stating, ''I want to die. Let me go.''', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old woman is brought to the ED by her roommate. She admits to taking an entire bottle of acetaminophen an hour ago in a suicide attempt because her boyfriend broke up with her. She is currently medically stable and alert, but refuses the administration of N-acetylcysteine (NAC) or activated charcoal, stating, ''I want to die. Let me go.''', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the capacity to refuse life-saving treatment?', '["Yes, any adult can refuse any treatment.", "Yes, because she is alert and oriented.", "No, acute suicidal ideation impairs capacity because the desire to die overrides rational evaluation of the medical consequences.", "No, because acetaminophen causes delirium.", "It depends on her blood levels."]', 2, 'Patients who are actively suicidal generally lack the capacity to make decisions that would facilitate their death. The psychiatric illness (depression/suicidality) is directly impairing their ability to reason and protect their own life.'),
    (v_case_id, 'What is the most appropriate next step?', '["Let her leave AMA.", "Have her sign a waiver.", "Involuntarily detain her and administer the NAC, using restraints if necessary.", "Wait for a psychiatrist to evaluate her before giving the antidote.", "Call her parents for consent."]', 2, 'Because she lacks capacity due to suicidality and has taken a potentially lethal overdose, she must be placed on an involuntary psychiatric hold (e.g., 5150) and treated for the medical emergency (NAC administration) under the principle of beneficence and emergency exception to consent.');

    ---------------------------------------------------------------------------
    -- CASE 36: Surrogate Decision Making - The Absent Proxy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unreachable Proxy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unreachable Proxy', 'A 60-year-old man requires an urgent (but not immediately life-threatening) appendectomy. He has severe dementia and lacks capacity. His medical record shows his sister is his designated health care proxy. The hospital has tried calling her for 12 hours, but she is unreachable on a wilderness hiking trip. The patient''s adult son is currently at the bedside and says, ''Just do the surgery, I give permission.''', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old man requires an urgent (but not immediately life-threatening) appendectomy. He has severe dementia and lacks capacity. His medical record shows his sister is his designated health care proxy. The hospital has tried calling her for 12 hours, but she is unreachable on a wilderness hiking trip. The patient''s adult son is currently at the bedside and says, ''Just do the surgery, I give permission.''', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the son legally consent to the surgery?', '["No, only the designated proxy can ever consent.", "Yes, if the designated proxy is unavailable in a medically necessary timeframe, decision-making authority defaults to the next person in the legal hierarchy.", "No, the surgery must wait until the sister returns.", "Only if the son obtains a court order.", "Yes, because sons have higher priority than sisters."]', 1, 'While a designated proxy has priority, if they are completely unreachable and the medical situation requires a timely decision, the authority falls to the standard state hierarchy of surrogates. Since the patient has no spouse present, the adult son can legally act as the surrogate.'),
    (v_case_id, 'If the surgery was not urgent (e.g., a routine screening colonoscopy), what would be the best approach?', '["Let the son consent.", "Perform it under implied consent.", "Wait until the designated proxy (the sister) returns from her trip.", "Cancel the procedure permanently.", "Ask the ethics committee."]', 2, 'If a procedure is entirely elective and non-urgent, the physician should wait until the patient''s chosen designated proxy is available to make the decision.');

    ---------------------------------------------------------------------------
    -- CASE 37: Coercion in Consent
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Demanding Husband' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Demanding Husband', 'A 30-year-old woman comes to the clinic with her husband to discuss contraception. The husband dominates the conversation, stating, ''We want her to get her tubes tied so we don''t have any more kids.'' The woman is quiet and looks at the floor. When asked directly, she nods and whispers, ''Yes, tie my tubes.''', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old woman comes to the clinic with her husband to discuss contraception. The husband dominates the conversation, stating, ''We want her to get her tubes tied so we don''t have any more kids.'' The woman is quiet and looks at the floor. When asked directly, she nods and whispers, ''Yes, tie my tubes.''', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What core element of informed consent is most likely compromised in this scenario?', '["Disclosure", "Understanding", "Voluntariness", "Competence", "Capacity"]', 2, 'Voluntariness means the patient is making the decision freely, without coercion, manipulation, or undue influence. The husband''s dominant behavior and the wife''s subdued compliance strongly suggest she may be acting under coercion.'),
    (v_case_id, 'What is the most appropriate next step for the physician?', '["Schedule the tubal ligation as she verbally consented.", "Refuse to perform the procedure.", "Ask the husband to step out of the room so you can speak to the patient alone.", "Schedule a psychiatric evaluation.", "Ask the husband to sign the consent form."]', 2, 'To ensure voluntariness and screen for potential intimate partner violence or coercion, the physician must speak to the patient privately, away from the spouse or family members.');

    ---------------------------------------------------------------------------
    -- CASE 38: Language Barriers - The Untrained Interpreter
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cafeteria Worker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cafeteria Worker', 'A patient requires consent for a lumbar puncture. The patient speaks only Tagalog. The hospital''s official phone interpreter service is temporarily down. The nurse mentions that one of the cafeteria workers speaks Tagalog and offers to bring him up to translate.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient requires consent for a lumbar puncture. The patient speaks only Tagalog. The hospital''s official phone interpreter service is temporarily down. The nurse mentions that one of the cafeteria workers speaks Tagalog and offers to bring him up to translate.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should the physician use the cafeteria worker to obtain informed consent?', '["Yes, because it will save time.", "Yes, because any bilingual person is adequate.", "No, ad hoc interpreters should not be used for obtaining informed consent due to risk of errors and confidentiality breaches.", "Only if the patient signs a waiver.", "Yes, but only if the nurse stays in the room."]', 2, 'Using untrained, ad hoc interpreters (like custodial staff, cafeteria workers, or family members) is highly discouraged. They lack training in medical terminology, impartiality, and the legal requirements of confidentiality (HIPAA). Consent should wait until a professional interpreter is available unless it is a life-or-death emergency.'),
    (v_case_id, 'What is the most appropriate course of action if the procedure is NOT a life-threatening emergency?', '["Use the cafeteria worker.", "Delay the procedure until the professional interpreter service is restored.", "Use Google Translate on a smartphone.", "Have the patient sign the English consent form and hope they understand.", "Use hand gestures to explain the lumbar puncture."]', 1, 'For non-emergent procedures, obtaining proper, legally valid informed consent via a professional medical interpreter is mandatory. The procedure must be delayed.');

    ---------------------------------------------------------------------------
    -- CASE 39: Consent in the ER - The Psychiatric Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bipolar Episode' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bipolar Episode', 'A 28-year-old woman is brought to the ED in the midst of a severe manic episode (Bipolar I). She is hyperactive, speaking pressured, and believes she is an immortal being. She slipped and sustained a displaced Colles fracture of her wrist. The orthopedic surgeon wants to perform a closed reduction. The patient refuses, stating, ''I am immortal, my bones heal themselves instantly with my mind!''', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old woman is brought to the ED in the midst of a severe manic episode (Bipolar I). She is hyperactive, speaking pressured, and believes she is an immortal being. She slipped and sustained a displaced Colles fracture of her wrist. The orthopedic surgeon wants to perform a closed reduction. The patient refuses, stating, ''I am immortal, my bones heal themselves instantly with my mind!''', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does she have the capacity to refuse the bone reduction?', '["Yes, because a broken wrist is not life-threatening.", "No, her manic delusion prevents her from understanding the reality of her injury and the consequences of refusing care.", "Yes, because she is an adult.", "No, because she is in the ED.", "Only a psychiatrist can decide."]', 1, 'Her psychiatric illness (mania with psychotic features) is directly clouding her judgment and preventing her from appreciating the reality of her physical injury. She lacks capacity for this decision.'),
    (v_case_id, 'Since a broken wrist is not immediately life-threatening, but requires prompt treatment to prevent permanent deformity, what is the best approach?', '["Let her leave and heal it with her mind.", "Admit her to psychiatry and let the wrist heal deformed.", "Attempt to contact a surrogate decision-maker (e.g., family) to obtain consent for the reduction, while treating her acute mania.", "Restrain her immediately and fix the wrist without telling anyone.", "Call the police."]', 2, 'Because the situation is not immediately life-and-death (like massive bleeding), there is time to attempt to locate a surrogate decision-maker while simultaneously addressing her acute psychiatric decompensation. If a surrogate cannot be found and delay would cause irreversible harm (e.g., nerve damage/permanent loss of function), the physician could eventually act under the emergency exception.');

    ---------------------------------------------------------------------------
    -- CASE 40: Informed Consent - The Risk Disclosure Standard
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Reasonable Patient Standard' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Reasonable Patient Standard', 'A surgeon is obtaining consent for a routine cholecystectomy. He explains the risks of bleeding, infection, and bile duct injury. He does not mention the 1 in 1,000,000 chance of a specific, obscure allergic reaction to the surgical drape, which the patient subsequently suffers.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A surgeon is obtaining consent for a routine cholecystectomy. He explains the risks of bleeding, infection, and bile duct injury. He does not mention the 1 in 1,000,000 chance of a specific, obscure allergic reaction to the surgical drape, which the patient subsequently suffers.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When determining what risks must be disclosed during informed consent, what standard do most modern jurisdictions use?', '["The Reasonable Physician Standard (what a typical doctor would say)", "The Reasonable Patient Standard (what a typical patient would need to know to make a decision)", "The Absolute Disclosure Standard (every possible risk, no matter how rare)", "The Subjective Standard (whatever the specific patient asks about)", "The Institutional Standard"]', 1, 'Most jurisdictions use the "Reasonable Patient Standard," meaning the physician must disclose the information that a hypothetical reasonable person in the patient''s position would consider material (important) when deciding whether to undergo the procedure. Extremely rare, unpredictable risks (like 1 in a million) generally do not need to be disclosed unless they are extraordinarily severe (like death).'),
    (v_case_id, 'Was the surgeon ethically and legally negligent for failing to disclose the 1 in 1,000,000 risk?', '["Yes, because the patient suffered the complication.", "Yes, because all risks must be disclosed.", "No, because a reasonable patient would not factor a 1 in a million risk into their decision for a common surgery.", "Yes, because the drape was part of the procedure.", "No, because the patient didn''t ask."]', 2, 'The surgeon met the standard of care by disclosing the common and severe risks (bleeding, infection, bile duct injury). It is impractical and impossible to list every theoretical risk. Failure to disclose an astronomically rare risk is not a breach of informed consent.');

    ---------------------------------------------------------------------------
    -- CASE 41: Minors and Abortion (General Concepts)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 16-Year-Old and Abortion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 16-Year-Old and Abortion', 'A 16-year-old girl comes to a clinic requesting an abortion. She explicitly states she does not want her parents to know.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl comes to a clinic requesting an abortion. She explicitly states she does not want her parents to know.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'While laws vary wildly by state, what is the USMLE standard approach regarding a minor seeking an abortion without parental consent?', '["Minors can always consent to abortions without parental knowledge.", "Minors can never consent to abortions without parental consent.", "Many states require parental notification or consent, but must offer a ''judicial bypass'' allowing the minor to seek approval from a judge instead.", "The physician can override the parents.", "The father of the fetus must consent."]', 2, 'For board purposes, recognize that state laws vary, but the constitutionally mandated standard is that if a state requires parental involvement (consent or notification), it MUST provide a "judicial bypass" option. This allows a minor to petition a judge to grant permission if telling the parents would be dangerous or not in the minor''s best interest.'),
    (v_case_id, 'If the same 16-year-old girl instead decides to carry the pregnancy to term, does she need her parents'' consent for her prenatal care?', '["Yes, because she is a minor.", "No, minors can consent to medical care related to pregnancy in all 50 states.", "Only for the actual delivery.", "Yes, unless she is married.", "Only if she needs a C-section."]', 1, 'As a specific exception to parental consent rules, all 50 states allow minors to consent to their own prenatal care and medical care related to carrying a pregnancy to term.');

    ---------------------------------------------------------------------------
    -- CASE 42: Surrogate Conflicts - The New Spouse vs Children
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Second Wife' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Second Wife', 'A 65-year-old man is in a coma following a severe traumatic brain injury. He has no written advance directive or health care proxy. His 30-year-old son from his first marriage wants to withdraw life support, stating, "Dad said he never wanted to be a vegetable." The patient''s second wife of two years wants to continue full life support. Who has the legal authority to make the decision?', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old man is in a coma following a severe traumatic brain injury. He has no written advance directive or health care proxy. His 30-year-old son from his first marriage wants to withdraw life support, stating, "Dad said he never wanted to be a vegetable." The patient''s second wife of two years wants to continue full life support. Who has the legal authority to make the decision?', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who is the legal surrogate decision-maker?', '["The adult son", "The second wife", "They share authority equally", "The attending physician", "An ethics committee"]', 1, 'In the absence of a designated proxy, the legal spouse is at the top of the surrogate hierarchy in nearly all jurisdictions, regardless of how long they have been married or the existence of children from a prior marriage.'),
    (v_case_id, 'What is the ethical obligation of the second wife in making this decision?', '["To do what she feels is best.", "To follow the Substituted Judgment standard based on what the patient would have wanted.", "To defer to the son.", "To follow the physician''s advice blindly.", "To keep him alive at all costs."]', 1, 'While she has the legal authority, her ethical obligation is to exercise "Substituted Judgment"—she must make the decision the patient would have made based on his known values and prior statements, not her own desires.');

    ---------------------------------------------------------------------------
    -- CASE 43: Advanced Directives - DNI / DNR
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The DNI Order' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The DNI Order', 'A 70-year-old man with advanced pulmonary fibrosis has a valid "Do Not Intubate" (DNI) order in his chart, but he does NOT have a "Do Not Resuscitate" (DNR) order. He goes into ventricular fibrillation cardiac arrest.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old man with advanced pulmonary fibrosis has a valid "Do Not Intubate" (DNI) order in his chart, but he does NOT have a "Do Not Resuscitate" (DNR) order. He goes into ventricular fibrillation cardiac arrest.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate medical response?', '["Do nothing, a DNI implies a DNR.", "Perform chest compressions, administer shocks (defibrillation) and medications, and manage the airway with bag-valve-mask ventilation, but do not place an endotracheal tube.", "Perform chest compressions only.", "Intubate him because he is in cardiac arrest.", "Call his family to ask what to do."]', 1, 'A DNI is specific: Do Not Intubate. It does not mean Do Not Resuscitate. The team must provide all other components of CPR (compressions, shocks, drugs) and can support the airway non-invasively (BVM), but they must respect the specific refusal of an endotracheal tube.'),
    (v_case_id, 'If the patient had a DNR order but NO DNI order, and he developed severe respiratory distress without losing his pulse, could he be intubated?', '["No, DNR implies DNI.", "Yes, a DNR only applies to cardiopulmonary arrest (loss of pulse/breathing). If he has a pulse, he can be intubated for respiratory failure.", "Only if he signs a new consent form.", "No, because he has pulmonary fibrosis.", "Only if the family agrees."]', 1, 'A DNR applies strictly to the event of a cardiac or respiratory arrest. If a patient is deteriorating but still has a pulse and is breathing, they can receive aggressive interventions like intubation, pressors, and ICU care unless they have specific orders (like DNI or Comfort Measures Only) against them.');

    ---------------------------------------------------------------------------
    -- CASE 44: Implied Consent - Routine vs Invasive
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Central Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Central Line', 'A patient is admitted for pneumonia. The nurse tells the patient, "I need to put an IV in your arm," and the patient holds out his arm. Later, the ICU physician decides the patient needs a Central Venous Catheter (central line) in his neck to administer pressors.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is admitted for pneumonia. The nurse tells the patient, "I need to put an IV in your arm," and the patient holds out his arm. Later, the ICU physician decides the patient needs a Central Venous Catheter (central line) in his neck to administer pressors.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can the physician place the central line based on the implied consent given for the peripheral IV?', '["Yes, an IV is an IV.", "Yes, because the patient is in the ICU.", "No, implied consent for a low-risk routine procedure (peripheral IV) does not extend to an invasive, higher-risk procedure (central line). Explicit informed consent is required.", "Yes, if the nurse witnesses it.", "No, central lines always require a court order."]', 2, 'Implied consent is specific to the low-risk action being performed. Placing a central line involves significant risks (pneumothorax, arterial puncture, infection) and requires explicit, usually written, informed consent from the patient or surrogate (unless it is an immediate life-and-death emergency).');

    ---------------------------------------------------------------------------
    -- CASE 45: Capacity and Neurological Deficits
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Aphasia and Capacity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Aphasia and Capacity', 'A 70-year-old man suffers a stroke that leaves him with severe expressive aphasia (Broca''s aphasia). He cannot speak more than single words, but his comprehension is fully intact. He needs a feeding tube placed. He shakes his head "no" violently when the doctor explains the procedure and shows him a picture of the tube.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old man suffers a stroke that leaves him with severe expressive aphasia (Broca''s aphasia). He cannot speak more than single words, but his comprehension is fully intact. He needs a feeding tube placed. He shakes his head "no" violently when the doctor explains the procedure and shows him a picture of the tube.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient have the capacity to refuse the feeding tube?', '["No, because he cannot speak.", "No, because a stroke removes capacity.", "Yes, because he can comprehend the information and communicate his decision (even non-verbally).", "Only if he can write down his reason.", "No, his surrogate must decide."]', 2, 'Communication of a choice does not require verbal speech. A patient with expressive aphasia but intact comprehension can communicate their decisions via writing, gestures, nodding, or communication boards. As long as he understands, his refusal must be honored.'),
    (v_case_id, 'If the stroke had caused severe Receptive Aphasia (Wernicke''s), how would this change the capacity assessment?', '["It wouldn''t change it.", "He would lack capacity because he cannot understand the information being presented to him.", "He would still have capacity if he could speak fluently.", "He would need a psychiatric hold.", "He could only consent to non-invasive procedures."]', 1, 'Receptive aphasia impairs comprehension. If a patient cannot understand the medical information, the risks, or the benefits, they cannot make an informed decision and therefore lack capacity. A surrogate would be needed.');

    ---------------------------------------------------------------------------
    -- CASE 46: Informed Consent - The Trainee
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Medical Student' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Medical Student', 'A patient is scheduled for a diagnostic lumbar puncture. The attending physician plans to have a 3rd-year medical student perform the procedure under direct supervision. The attending obtains standard consent for the lumbar puncture from the patient but does not mention the student''s involvement.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is scheduled for a diagnostic lumbar puncture. The attending physician plans to have a 3rd-year medical student perform the procedure under direct supervision. The attending obtains standard consent for the lumbar puncture from the patient but does not mention the student''s involvement.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this ethically acceptable?', '["Yes, because it is a teaching hospital.", "Yes, because the attending is supervising.", "No, patients must be explicitly informed if a trainee (student or resident) will be performing an invasive procedure, and they have the right to refuse.", "Only if the student has done it before.", "Yes, because the consent form covers all hospital staff."]', 2, 'Informed consent includes disclosing who will be performing significant or invasive parts of a procedure. Patients in teaching hospitals still retain autonomy and have the right to decline having a trainee perform their procedure. Failing to disclose the student''s role violates informed consent.');

    ---------------------------------------------------------------------------
    -- CASE 47: Refusal of Care - The Eating Disorder (Competent)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Competent Refusal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Competent Refusal', 'A 45-year-old woman with a history of anorexia nervosa is admitted with severe malnutrition and heart failure. Unlike the previous case, she is evaluated by a psychiatrist who determines she DOES have full decision-making capacity. She clearly states, "I understand my heart is failing because I don''t eat. I understand I will die if I don''t let you feed me through a tube. But I have lived with this disease for 30 years and I am tired. I refuse the feeding tube."', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman with a history of anorexia nervosa is admitted with severe malnutrition and heart failure. Unlike the previous case, she is evaluated by a psychiatrist who determines she DOES have full decision-making capacity. She clearly states, "I understand my heart is failing because I don''t eat. I understand I will die if I don''t let you feed me through a tube. But I have lived with this disease for 30 years and I am tired. I refuse the feeding tube."', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must the medical team do?', '["Force feed her because anorexia is a psychiatric illness.", "Honor her refusal and provide palliative/comfort care.", "Wait until she loses consciousness and then place the tube under implied consent.", "Have her declared legally incompetent by a judge.", "Administer an appetite stimulant covertly."]', 1, 'If a thorough psychiatric evaluation confirms that a patient with a psychiatric illness retains full capacity (they understand the reality of their condition and the consequences of their choice), their competent refusal of life-saving care must be honored. You cannot use "implied consent" later if the loss of consciousness is the direct, expected result of the disease process they competently chose not to treat (this acts as an advance directive).');

    ---------------------------------------------------------------------------
    -- CASE 48: Consent and Cultural Beliefs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cultural Authority' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cultural Authority', 'A 50-year-old immigrant from a patriarchal culture is diagnosed with colon cancer. When the physician attempts to explain the diagnosis and surgical options, the patient''s eldest son says, "In our culture, the eldest son makes all medical decisions. My father does not want to hear the bad news. Talk only to me."', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old immigrant from a patriarchal culture is diagnosed with colon cancer. When the physician attempts to explain the diagnosis and surgical options, the patient''s eldest son says, "In our culture, the eldest son makes all medical decisions. My father does not want to hear the bad news. Talk only to me."', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should the physician navigate this situation?', '["Comply entirely with the son''s request out of respect for cultural diversity.", "Tell the son that American law requires the father to be informed.", "Ask the patient privately if he wishes to defer information and decision-making to his son.", "Ignore the son and force the father to listen to the diagnosis.", "Call the ethics committee immediately."]', 2, 'While physicians must be culturally sensitive, the ethical obligation to the individual patient''s autonomy comes first. The physician must verify with the patient directly (ideally alone, with a professional interpreter) if he wishes to waive his right to information and delegate decision-making to his son. If the patient agrees, it is a valid waiver of informed consent. If the patient wants to know, he must be told.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Involuntary Psychiatric Hold
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 5150' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 5150', 'A 30-year-old man is brought to the ED by police. He was found wandering in traffic, screaming that he needs to sacrifice himself to save the world. He is placed on an involuntary 72-hour psychiatric hold (e.g., 5150). In the ED, he is found to have a severe, limb-threatening bacterial infection in his leg. He refuses antibiotics.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old man is brought to the ED by police. He was found wandering in traffic, screaming that he needs to sacrifice himself to save the world. He is placed on an involuntary 72-hour psychiatric hold (e.g., 5150). In the ED, he is found to have a severe, limb-threatening bacterial infection in his leg. He refuses antibiotics.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does the involuntary psychiatric hold automatically give the physician the right to force medical (non-psychiatric) treatment on him?', '["Yes, patients on psychiatric holds lose all medical decision-making rights.", "No, an involuntary hold is for psychiatric evaluation/treatment. Capacity for separate medical decisions must be assessed independently.", "Yes, because the infection is limb-threatening.", "Only if a judge signs a specific medical order.", "Yes, because the police brought him in."]', 1, 'An involuntary psychiatric hold allows the hospital to detain the patient to prevent harm to self/others from mental illness. It does NOT automatically strip the patient of capacity for separate medical decisions. The physician must assess if his psychosis impairs his ability to understand the leg infection. If it does (which is likely here), a surrogate or emergency consent applies. If he somehow understood the leg infection clearly, he could theoretically refuse it.');

    ---------------------------------------------------------------------------
    -- CASE 50: The DNR Tattoo
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tattoo' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tattoo', 'A 60-year-old man collapses in a grocery store and is brought to the ED in cardiac arrest. Paramedics have been performing CPR. As the ED team cuts off his shirt, they see a large, clear tattoo across his chest that says "DO NOT RESUSCITATE" with a signature tattooed underneath. No other documentation or family is present.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old man collapses in a grocery store and is brought to the ED in cardiac arrest. Paramedics have been performing CPR. As the ED team cuts off his shirt, they see a large, clear tattoo across his chest that says "DO NOT RESUSCITATE" with a signature tattooed underneath. No other documentation or family is present.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate action for the ED team?', '["Stop CPR immediately because the tattoo is a clear expression of his wishes.", "Continue full CPR and resuscitative efforts.", "Perform chemical resuscitation (drugs) but not physical CPR.", "Call the hospital legal team before doing anything else.", "Shock him once, and if he doesn''t recover, stop."]', 1, 'A tattoo is not a legally binding medical document. It does not meet the legal requirements for a DNR order (e.g., physician signature, standardized form). Furthermore, there is no way to verify if the patient changed his mind after getting the tattoo but couldn''t afford to have it removed, or if he was intoxicated when he got it. In an emergency with ambiguity, the default is always to preserve life (continue CPR) until valid documentation or a surrogate is found.');

END $$;

COMMIT;
