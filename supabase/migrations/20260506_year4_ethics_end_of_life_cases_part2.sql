-- Migration: 4th Year Ethics - End-of-life care & advance directives (Part 2/2)
-- Target Topic: ethics-end-of-life
-- Standard: US MD/MBBS High Yield

BEGIN;

DO $$ 
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-end-of-life' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "ethics-end-of-life" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 26: Withdrawing Dialysis in the Elderly
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Deciding to Stop Renal Replacement Therapy',
        'An 82-year-old male with End-Stage Renal Disease (ESRD) has been on hemodialysis for 5 years. He also has worsening vascular dementia and heart failure. Recently, he has started becoming combative during dialysis sessions, pulling out his lines and shouting at the staff. He tells his son, "No more needles. I want to be done."',
        26
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following is the most appropriate next step in managing the dialysis request?',
        '["Force the patient to undergo dialysis as it is life-sustaining.", "Evaluate the patient''s capacity to refuse dialysis and involve the ethics committee if the son disagrees.", "Administer heavy sedation so the patient can be dialyzed safely.", "Discharge the patient from the dialysis center for being ''non-compliant''.", "Tell the patient he must continue until his labs improve."]',
        1,
        'Reasoning: Dialysis is a medical intervention that can be refused by a competent patient. If the patient has dementia, his capacity for this specific decision must be assessed. If he lacks capacity, his prior stated wishes or surrogate''s substituted judgment must be used. Withdrawing dialysis is a common and ethically sound decision in terminal or advanced geriatric care. Option B follows the correct ethical and legal pathway.'
    );

    ---------------------------------------------------------------------------
    -- CASE 27: Resuscitation in the Operating Room (DNR Suspension)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'DNR Orders and the Surgical Suite',
        'A 70-year-old female with a DNR order is undergoing a palliative procedure for a bowel obstruction. During the induction of anesthesia, she experiences a sudden, reversible cardiac arrest due to an anesthetic complication.',
        27
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the standard approach to DNR orders in the operating room (OR)?',
        '["The DNR order must always be followed strictly, and no resuscitation should be attempted.", "DNR orders are typically ''suspended'' or modified in the OR after a discussion between the surgeon, anesthesiologist, and patient/proxy, as intraoperative arrest is often reversible and iatrogenic.", "The surgeon is legally obligated to ignore the DNR in the OR.", "A lawyer must be present in the OR to decide.", "All surgeries are considered ''Full Code'' by default regardless of prior orders."]',
        1,
        'Reasoning: The standard of care is "required reconsideration." DNR orders are not automatically ignored, but they are usually suspended because arrests in the OR are often highly reversible and related to the anesthesia or surgery itself. A specific discussion should occur pre-operatively. Option B reflects this standard.'
    );

    ---------------------------------------------------------------------------
    -- CASE 28: Palliative Care vs. Hospice
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Differentiating Supportive Care Models',
        'A 55-year-old woman is diagnosed with metastatic breast cancer. She is currently undergoing aggressive chemotherapy and radiation with the goal of remission. She is experiencing significant nausea, pain, and depression related to her treatment.',
        28
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following services is most appropriate to help manage her symptoms at this time?',
        '["Hospice care.", "Palliative care.", "Respite care.", "Assisted living.", "Home health nursing only."]',
        1,
        'Reasoning: Palliative care is appropriate at any stage of a serious illness and can be provided alongside curative or life-prolonging treatments. Hospice (Option A) is specifically for patients with a 6-month prognosis who have chosen to stop curative treatment. Palliative care (Option B) is the correct choice here.'
    );

    ---------------------------------------------------------------------------
    -- CASE 29: Brain Death and Religious Objections
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Cultural Sensitivity in Death Declaration',
        'A 20-year-old male is declared brain dead after a car accident. His family, who are Orthodox Jews, believe that life continues as long as the heart is beating and refuse to accept the brain death diagnosis or allow the ventilator to be turned off.',
        29
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'In many states (e.g., New York, New Jersey), how must the hospital handle this objection to a brain death declaration?',
        '["The hospital must ignore the religious objection and turn off the ventilator immediately.", "The hospital must provide a ''reasonable accommodation'' which may include continuing mechanical ventilation for a period of time to allow the family to process the death or consult with religious leaders.", "The hospital must sue the family for custody of the body.", "The patient is not considered dead until the heart stops.", "Brain death cannot be declared in patients with religious beliefs."]',
        1,
        'Reasoning: While brain death is legally death in all US states, some states have "conscience clauses" or accommodation requirements for religious objections. Even in states without these laws, the ethical approach is to provide a reasonable window of time for the family rather than taking immediate unilateral action. Option B is the correct ethical/legal middle ground.'
    );

    ---------------------------------------------------------------------------
    -- CASE 30: Terminal Extubation and "Gasping"
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Managing Agonal Respirations at the End of Life',
        'A 70-year-old male is terminal extubated in the ICU. Five minutes after the tube is removed, the patient begins to have loud, irregular, gasping breaths. The family is extremely distressed and believes he is "suffocating."',
        30
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the most appropriate response for the nurse or physician?',
        '["Re-intubate the patient immediately.", "Explain that these are agonal breaths (a reflex during the dying process) and that the patient is not suffering, while providing additional comfort medications.", "Tell the family to leave so they don''t have to watch.", "Check the patient''s oxygen saturation and put him back on the ventilator.", "Stop all morphine because it might be causing the gasping."]',
        1,
        'Reasoning: Agonal respirations (reflexive brainstem gasping) are common after extubation in terminal patients. They look distressing to observers but do not indicate conscious suffering. Communication and symptom management (Option B) are the priority.'
    );

    ---------------------------------------------------------------------------
    -- CASE 31: Voluntary Stopping Eating and Drinking (VSED)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Ethics of Voluntarily Stopping Oral Intake',
        'An 80-year-old man with early-stage Alzheimer''s dementia, who is still fully competent, decides he does not want to live through the advanced stages of the disease. He tells his doctor he plans to stop all eating and drinking (VSED) to hasten his death.',
        31
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is VSED considered an ethically and legally permissible way for a competent patient to end their life in the US?',
        '["No, VSED is considered suicide and the doctor must intervene to force-feed the patient.", "Yes, a competent patient has the right to refuse food and water, and physicians can provide palliative care to ensure comfort during the process.", "Only if the patient is already in a state where PAS (Physician-Assisted Suicide) is legal.", "Only if the patient has a terminal cancer diagnosis.", "No, hospice will refuse to care for patients who choose VSED."]',
        1,
        'Reasoning: VSED is legally considered a form of refusing life-sustaining treatment (nutrition/hydration). Since competent adults have the right to refuse ANY treatment, VSED is permissible. Physicians and hospice can provide comfort care (mouth care, meds for thirst/agitation) but should not force-feed. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 32: The SPIKES Protocol for Breaking Bad News
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Effective Communication at the End of Life',
        'A physician needs to tell a family that their loved one has a terminal condition with no further curative options.',
        32
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'According to the SPIKES protocol, what does the "P" stand for?',
        '["Prognosis: Giving the exact timeline of death.", "Perception: Assessing what the patient or family already knows or understands about the situation.", "Planning: Immediately scheduling the funeral.", "Paternalism: Telling the family what they must do.", "Palliative: Referring to hospice."]',
        1,
        'Reasoning: SPIKES stands for: Setting, Perception, Invitation, Knowledge, Empathy, Strategy/Summary. "Perception" (Option B) is the crucial step of asking "What is your understanding of what has been happening?" before giving new information.'
    );

    ---------------------------------------------------------------------------
    -- CASE 33: Futility in Pediatrics
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Conflicting Views on Pediatric Care',
        'A newborn has anencephaly (absence of most of the brain). The medical team believes that aggressive resuscitation and life-support are futile and will only prolong suffering. The parents, citing religious beliefs, want "everything done" to keep the baby alive as long as possible.',
        33
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'In the case of a dispute over futility in a minor, who generally has the legal authority in most US jurisdictions?',
        '["The medical team can unilaterally stop care.", "The parents have broad authority to make medical decisions for their child, even if the medical team disagrees, unless it constitutes clear abuse or neglect.", "A hospital ethics committee can issue a binding order to stop care.", "The baby is automatically made a ward of the state.", "The church must decide."]',
        1,
        'Reasoning: Parents are given strong legal deference. Unless the parents'' choice is causing "active harm" (which is hard to prove in cases of omisson of resuscitation), hospitals usually cannot unilaterally override parents without a court order. Option B is the correct legal standard.'
    );

    ---------------------------------------------------------------------------
    -- CASE 34: The Role of the Medical Examiner
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Reporting Deaths and Autopsies',
        'An 85-year-old patient dies in the hospital after a fall and a hip fracture that occurred at home two days prior.',
        34
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Does this death need to be reported to the Medical Examiner/Coroner?',
        '["No, because the patient was 85 and died in the hospital.", "Yes, because the death was preceded by an accidental injury (the fall).", "Only if the family requests it.", "No, because the death was from natural causes like old age.", "Only if the fall happened in the hospital."]',
        1,
        'Reasoning: All "non-natural" deaths, including those resulting from accidents (even falls in the elderly), must be reported to the ME/Coroner, even if the death occurs days later in the hospital. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 35: Confidentiality After Death
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'HIPAA and the Deceased',
        'A patient dies of complications related to HIV. The patient''s brother, who was not the proxy, calls the doctor and asks for the cause of death.',
        35
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Under HIPAA, how long does the duty of confidentiality persist after a patient''s death?',
        '["Confidentiality ends immediately upon death.", "Confidentiality lasts for 10 years after death.", "Confidentiality lasts for 50 years after death.", "Confidentiality lasts forever.", "Only the executor of the estate can ever see the records."]',
        2,
        'Reasoning: HIPAA privacy protections for a patient''s identifiable health information continue for 50 years after the date of death. Option C is the current legal standard.'
    );

    ---------------------------------------------------------------------------
    -- CASE 36: Resuscitation in Terminal Illness (Step 2 Trap)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Ethical Treatment of Terminal Cardiac Arrest',
        'A 90-year-old patient with multi-organ failure and metastatic cancer, who is "Full Code," has a cardiac arrest. The intern performs chest compressions and hears multiple ribs crack. The patient remains in asystole after 20 minutes of high-quality CPR.',
        36
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'At what point is the physician ethically and legally permitted to stop CPR?',
        '["When the family gives permission.", "When the physician determines that the resuscitation is futile and there is no further physiological benefit.", "Only after 60 minutes of chest compressions.", "Only after a judge is notified.", "Never; you must continue until the family arrives."]',
        1,
        'Reasoning: Resuscitation is a medical procedure. If the physician determines that it is no longer offering benefit (futility), they have the authority to stop. Consent to "stop" is not legally required if the procedure is medically unsuccessful. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 37: Palliative Symptom Management (Mouth Care)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Basic Care as an Ethical Duty',
        'A patient is actively dying and has stopped all intake. The nurse asks if mouth care (cleaning and moistening the mouth) should be continued.',
        37
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is mouth care considered a "medical intervention" that can be withheld?',
        '["Yes, it is a medical treatment.", "No, basic comfort measures (hygiene, skin care, mouth care) are considered an essential ethical duty of care and should never be withheld in a dying patient.", "Only if the patient asks for it.", "Only if the doctor writes an order.", "No, it is a form of aggressive hydration."]',
        1,
        'Reasoning: While aggressive interventions (vents, tubes) can be withheld, basic human care/comfort (Option B) is an absolute ethical obligation to maintain dignity and prevent suffering (dry mouth/cracking).'
    );

    ---------------------------------------------------------------------------
    -- CASE 38: Ethics of "Slow Codes" (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Truth About Slow Resuscitation',
        'A physician decides to perform a "slow code" to make the family feel better without really trying to revive the patient.',
        38
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the primary ethical failure of a "slow code"?',
        '["It is too expensive.", "It violates the principle of veracity (honesty) and is a form of medical deception.", "It is only a failure if the patient survives.", "It is not a failure; it is a recommended practice.", "It violates the principle of justice."]',
        1,
        'Reasoning: Veracity (Option B) is a core component of medical ethics. Deceiving families by pretending to provide care that is actually not being provided undermines the trust in the profession.'
    );

    ---------------------------------------------------------------------------
    -- CASE 39: Withdrawal of Ventilator (Practical Ethics)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Logistics of Terminal Weaning',
        'A family is ready to turn off the ventilator for their loved one who has a non-survivable brain injury.',
        39
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following is an ethical "best practice" during this process?',
        '["Turning off all monitor alarms before starting the extubation.", "Telling the family to wait in the hallway.", "Performing the extubation exactly at midnight.", "Removing the IV lines immediately so the patient looks more ''natural'' before they die.", "Requiring the patient to be in the OR."]',
        0,
        'Reasoning: Alarms (Option A) are designed for recovery, not for the dying process. Hearing a flat-line alarm or an apnea alarm is highly traumatic for families. Turning them off is an ethical part of creating a peaceful environment.'
    );

    ---------------------------------------------------------------------------
    -- CASE 40: Organ Donation and Brain Death (Step 1 Yield)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Dead Donor Rule',
        'A patient meets all criteria for brain death. The family wants to donate the patient''s organs.',
        40
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the "Dead Donor Rule" in medical ethics?',
        '["Donors must be at least 18 years old.", "Organs cannot be taken from a living person if the act of taking them will cause that person''s death.", "Only family members can be donors.", "Donors must have died of natural causes.", "No donor can have a history of cancer."]',
        1,
        'Reasoning: The Dead Donor Rule (Option B) is a foundational principle: you cannot kill a patient to get their organs. The patient must be declared dead (by brain or cardiac criteria) before vital organs are harvested.'
    );

    ---------------------------------------------------------------------------
    -- CASE 41: Ethics of Refusing Food vs Suicidality
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Differentiating VSED from Suicide',
        'A terminally ill patient chooses VSED (Voluntary Stopping Eating and Drinking).',
        41
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Why is VSED ethically distinguished from suicide in the medical community?',
        '["It isn''t; it is suicide.", "It is seen as the patient choosing to not undergo the medical intervention of nutrition/hydration, allowing the natural disease process to lead to death.", "Suicide is only for young people.", "VSED is faster than suicide.", "VSED is only legal for religious reasons."]',
        1,
        'Reasoning: This is the core ethical distinction (Option B): it is framed as a "refusal of care" rather than an "active self-destruction," which aligns it with the principle of autonomy.'
    );

    ---------------------------------------------------------------------------
    -- CASE 42: Palliative Care in the ED
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Palliative Needs in Acute Care',
        'A terminal cancer patient comes to the ED with severe pain and shortness of breath. The ED physician says, "There''s nothing we can do because you are DNR."',
        42
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is the ED physician''s statement ethically correct?',
        '["Yes, DNR means no treatment.", "No, DNR only means no CPR. The physician still has an ethical duty to treat pain, dyspnea, and provide palliative care.", "Only if the patient is over 90.", "Yes, palliative care is only for the floor, not the ED.", "Only if the patient is unconscious."]',
        1,
        'Reasoning: DNR is not "Do Not Treat." Palliative treatment for symptoms (Option B) is always indicated regardless of code status.'
    );

    ---------------------------------------------------------------------------
    -- CASE 43: Ethics of Bereavement Care
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Physician''s Duty After Death',
        'A patient dies after a long illness. The doctor calls the family two weeks later to offer condolences and ask how they are doing.',
        43
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is "bereavement care" considered a part of the physician''s ethical duty in palliative medicine?',
        '["No, the doctor''s job ends at death.", "Yes, the family is considered part of the ''unit of care'' in palliative and end-of-life medicine.", "Only if the family pays for a follow-up visit.", "No, it is a violation of HIPAA.", "Only if the doctor is a psychiatrist."]',
        1,
        'Reasoning: In palliative care (Option B), the patient and family are considered a single unit. Care does not stop at the moment of death; support for the grieving family is an ethical extension of the medical duty.'
    );

    ---------------------------------------------------------------------------
    -- CASE 44: Confidentiality and the "Famous" Patient
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Public Figures and End of Life',
        'A famous celebrity is dying of cancer in the hospital. A reporter offers a nurse $5,000 for a photo of the patient.',
        44
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which ethical and legal duty is most at risk here?',
        '["Beneficence.", "Non-maleficence.", "Confidentiality/Privacy.", "Justice.", "Autonomy."]',
        2,
        'Reasoning: Privacy and Confidentiality (Option C) are absolute, even for public figures, and especially during the vulnerable dying process.'
    );

    ---------------------------------------------------------------------------
    -- CASE 45: Ethics of Withdrawing Hydration (Practical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Symptoms After Stopping IV Fluids',
        'A family is worried that their dying loved one will "feel thirsty" if the IV fluids are stopped.',
        45
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What should the physician explain about the sensation of thirst at the end of life?',
        '["Thirst is common and IV fluids are the only way to treat it.", "Thirst (or dry mouth) in dying patients is better managed with mouth swabs and ice chips rather than IV fluids, which can actually cause lung congestion and swelling.", "IV fluids must be continued until death.", "Thirst is impossible in comatose patients.", "Stopping fluids is a form of torture."]',
        1,
        'Reasoning: Scientific evidence shows that IV hydration at the end of life does not necessarily relieve thirst and can cause harm (Option B). Mouth care is more effective for comfort.'
    );

    ---------------------------------------------------------------------------
    -- CASE 46: Ethics of Advance Directives in Dementia
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Planning for Future Incapacity',
        'A 60-year-old with a strong family history of Alzheimer''s writes an advance directive saying, "If I ever develop dementia and can no longer recognize my children, I want all treatment, including antibiotics for pneumonia, to be withheld."',
        46
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is this "pre-emptive" refusal of care ethically valid?',
        '["No, you cannot refuse care for a future condition.", "Yes, as long as it was written when the patient was fully competent and is specific about the conditions and treatments.", "Only if a psychiatrist co-signs it.", "Only if it is written in a hospital.", "No, dementia patients must always be treated."]',
        1,
        'Reasoning: This is the essence of an advance directive (Option B): extending one''s autonomy into a future period of incapacity.'
    );

    ---------------------------------------------------------------------------
    -- CASE 47: The "Difficult" Family at End of Life
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Communication Strategies for Conflict',
        'A family is shouting at the medical team, accusing them of "killing" their father by suggesting hospice.',
        47
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the most ethically and professionally appropriate initial response?',
        '["Shout back to maintain authority.", "Call security immediately.", "Recognize that the anger is likely a manifestation of grief and use empathetic listening (''Tell me more about your concerns'').", "Refuse to talk to the family again.", "Tell the family they are wrong."]',
        2,
        'Reasoning: Anger in end-of-life care is often "displaced grief." Empathy and listening (Option C) are the first-line tools for ethical communication.'
    );

    ---------------------------------------------------------------------------
    -- CASE 48: Ethics of "N-of-1" Trials at End of Life
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Experimental Therapy Requests',
        'A dying patient wants to try an unproven, non-FDA-approved drug they found on the internet.',
        48
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which principle should guide the physician in deciding whether to facilitate "Right to Try" requests?',
        '["The duty of non-maleficence (protecting the patient from predatory or harmful ''cures'').", "The duty to save money.", "The duty to follow the internet.", "The duty to always say yes.", "The duty to perform research on every patient."]',
        0,
        'Reasoning: Protecting vulnerable dying patients from harm and exploitation (Option A) is a core professional duty.'
    );

    ---------------------------------------------------------------------------
    -- CASE 49: Religious Neutrality of the Physician
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Personal Beliefs vs Professional Duty',
        'A physician is a devout religious believer who is personally opposed to the withdrawal of life-support.',
        49
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'If a patient legally requests withdrawal of care, what is the physician''s ethical obligation?',
        '["The physician can refuse to talk to the patient.", "The physician can exercise ''conscientious objection'' but must transfer the patient''s care to another physician who is willing to honor the request.", "The physician must force their beliefs on the patient.", "The physician must quit the profession.", "The physician must ignore the patient''s request."]',
        1,
        'Reasoning: Conscientious objection (Option B) is allowed, but it cannot be used to block a patient''s legal right to care. A transfer of care is required.'
    );

    ---------------------------------------------------------------------------
    -- CASE 50: The Final Goal of End-of-Life Care
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Defining a "Good Death"',
        'A physician is reflecting on the goals of care for their panel of terminal patients.',
        50
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'In medical ethics, what is the ultimate goal of end-of-life care?',
        '["To prevent death at all costs.", "To ensure the patient dies on a specific day.", "To align medical treatments with the patient''s personal values, maximize comfort, and support the family.", "To maximize the number of procedures performed.", "To reduce the hospital''s liability."]',
        2,
        'Reasoning: This is the definition of patient-centered end-of-life care (Option C). It focuses on values, comfort, and the family unit.'
    );

END $$;

COMMIT;
