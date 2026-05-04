-- Migration: 4th Year Ethics - End-of-life care & advance directives (Part 1/2)
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
    -- CASE 01: The "DNR" vs "DNI" Confusion
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'DNR vs DNI in Acute Respiratory Failure',
        'A 78-year-old female with advanced Chronic Obstructive Pulmonary Disease (COPD) and metastatic lung cancer is admitted with worsening dyspnea and productive cough. She has a signed "Do Not Resuscitate" (DNR) order in her chart but does not have a "Do Not Intubate" (DNI) order. Over the last 4 hours, her respiratory status has declined significantly.

Vitals: Temp: 101.4°F | HR: 112 bpm | RR: 32/min | BP: 102/58 mmHg | SpO2: 84% on 6L NC.

Physical Examination:
Mental Status: Somnolent but arousable to loud voice; disoriented to time.
Physical: Use of accessory muscles for respiration; diffuse expiratory wheezes and crackles at the right base.

Laboratory Results:
pH: 7.21 (Normal: 7.35–7.45)
PaCO2: 72 mmHg (Normal: 35–45)
PaO2: 52 mmHg (Normal: 80–100)
HCO3: 28 mEq/L (Normal: 22–26)
Lactate: 3.2 mmol/L (Normal: <2.0)',
        1
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The patient''s daughter, who is the designated healthcare proxy, is present and asks if her mother should be intubated. Based on the patient''s current orders, which of the following is the most appropriate next step?',
        '["Do not intubate as the DNR order implies refusal of all life-sustaining measures.", "Intubate the patient and transfer to the ICU if she continues to deteriorate.", "Contact the hospital ethics committee before taking any action.", "Provide palliative morphine only as the patient is terminal.", "Perform a surgical tracheostomy instead of endotracheal intubation."]',
        1,
        'Reasoning: A "Do Not Resuscitate" (DNR) order specifically applies to the event of a cardiopulmonary arrest (loss of pulse or breathing). It does NOT automatically imply "Do Not Intubate" (DNI) for acute respiratory failure when the patient still has a pulse. Since the patient does not have a DNI order and has acute hypercapnic respiratory failure (pH 7.21, pCO2 72), intubation is medically indicated and permitted unless explicitly refused by the patient or proxy. Options A and D are incorrect as they conflate DNR with DNI/Comfort care. Option C is unnecessary as the orders are clear.'
    );

    ---------------------------------------------------------------------------
    -- CASE 02: Brain Death Criteria and Testing
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Declaration of Death by Neurological Criteria',
        'A 24-year-old male is brought to the hospital after a high-speed motorcycle accident. He sustained a severe traumatic brain injury (TBI) with diffuse axonal injury and a large subdural hematoma that was surgically evacuated. He has been in the ICU for 48 hours.

Vitals: Temp: 96.8°F | HR: 64 bpm | RR: 12/min (ventilator-set) | BP: 110/70 mmHg.

Physical Examination:
Mental Status: GCS 3; no response to deep painful stimuli.
Reflexes: Absent pupillary, corneal, oculocephalic, and gag reflexes. No spontaneous respirations noted during a brief disconnect from the ventilator.
Laboratory Results:
Sodium: 145 mEq/L
Potassium: 4.0 mEq/L
Blood Alcohol: Negative
Toxicology Screen: Negative for opioids and sedatives
Temperature: 36.5°C (core)',
        2
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Before proceeding with an apnea test to confirm brain death, which of the following prerequisites must be met?',
        '["A flat EEG for at least 30 minutes.", "Confirmation of irreversible cessation of all cardiac activity.", "A core body temperature of at least 36.5°C (97.7°F).", "At least 72 hours of observation since the time of injury.", "Serum sodium levels below 135 mEq/L."]',
        2,
        'Reasoning: Brain death is a clinical diagnosis. Prerequisites include: 1. Identification of an irreversible cause of coma. 2. Absence of confounding factors (hypothermia, drug intoxication, severe metabolic derangements). 3. Normalization of blood pressure (SBP >100). 4. Core temperature >36.5°C. A core temperature of 36.5°C is required to ensure that the absence of brainstem reflexes is not due to hypothermia. Option A (EEG) is an ancillary test, not a prerequisite. Option B is for cardiac death. Option D is not a standard requirement for adults.'
    ),
    (
        v_case_id,
        'During the apnea test, the patient''s PaCO2 rises from 40 mmHg to 62 mmHg over 8 minutes. No respiratory effort is observed. The patient''s blood pressure remains stable. What is the interpretation of this test?',
        '["Negative for brain death; the PaCO2 must rise above 80 mmHg.", "Inconclusive; the test must last for at least 15 minutes.", "Positive for brain death; a PaCO2 >60 mmHg (or >20 mmHg rise from baseline) with no respiratory effort confirms apnea.", "Invalid; apnea tests cannot be used in patients with TBI.", "Positive for brain death; any rise in PaCO2 is sufficient."]',
        2,
        'Reasoning: A positive apnea test (supporting brain death) is defined by the absence of respiratory effort when the PaCO2 reaches 60 mmHg or higher (or a rise of 20 mmHg from baseline) and the pH drops below 7.28. Option C correctly identifies the standard threshold.'
    );

    ---------------------------------------------------------------------------
    -- CASE 03: The Principle of Double Effect
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Pain Management in Terminal Illness',
        'A 62-year-old male with Stage IV metastatic prostate cancer is admitted to hospice care. He is experiencing severe, refractory bone pain. He is currently on a high-dose morphine infusion, but his pain remains poorly controlled (10/10). He is frequently moaning and grimacing. The palliative care team proposes increasing the morphine dose significantly.

Vitals: Temp: 98.6°F | HR: 98 bpm | RR: 10/min | BP: 100/60 mmHg.

Physical Examination:
Mental Status: Lethargic; oriented only to name.
Physical: Emaciated appearance; tenderness over several bony prominences; shallow respirations.

Laboratory Results:
BUN: 45 mg/dL (Normal: 7–20)
Creatinine: 1.8 mg/dL (Normal: 0.6–1.2)
Calcium: 11.8 mg/dL (Normal: 8.5–10.5)',
        3
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The patient''s family is concerned that increasing the morphine might "stop his breathing" and cause him to die sooner. Which of the following ethical principles justifies increasing the dose despite this risk?',
        '["The Principle of Justice.", "The Principle of Beneficence.", "The Principle of Double Effect.", "The Principle of Non-maleficence.", "The Principle of Autonomy."]',
        2,
        'Reasoning: The Principle of Double Effect states that an action intended to produce a good effect (pain relief) is ethically permissible even if it has an unintended but foreseeable bad effect (respiratory depression/hastening death), provided: 1. The action itself is good. 2. The intent is the good effect. 3. The bad effect is not the means to the good effect. 4. The good effect outweighs the bad. Increasing morphine to relieve terminal agony is the classic application. Option B (Beneficence) is general; Double Effect is the specific ethical framework for this dilemma.'
    );

    ---------------------------------------------------------------------------
    -- CASE 04: Substituted Judgment Standard
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Surrogate Decision Maker''s Role',
        'An 88-year-old female with advanced Alzheimer''s dementia and severe dysphagia is hospitalized for the third time in six months with aspiration pneumonia. She has no written living will. Her daughter is the designated healthcare proxy. The medical team suggests that a percutaneous endoscopic gastrostomy (PEG) tube is not recommended due to her poor prognosis and lack of evidence that it prevents aspiration in advanced dementia.

Vitals: Temp: 100.8°F | HR: 108 bpm | RR: 24/min | BP: 110/64 mmHg.

Physical Examination:
Mental Status: Non-verbal; does not follow commands.
Physical: Coarse rales in the right middle lobe; multiple stage II pressure ulcers on the sacrum.

Laboratory Results:
Albumin: 2.2 g/dL (Normal: 3.5–5.0)
WBC: 14,000/mm³ (Normal: 4,500–11,000)
CRP: 85 mg/L (Normal: <10)',
        4
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The daughter says, "I know my mother always said she never wanted to be kept alive like this, but I can''t bear the thought of her starving. Please place the tube." What is the most appropriate next step for the physician?',
        '["Place the PEG tube immediately to respect the proxy''s wishes.", "Refuse the PEG tube as it is medically futile and violates non-maleficence.", "Initiate a discussion with the daughter about what the mother would want for herself (Substituted Judgment).", "Seek a court order to override the daughter''s decision.", "Administer total parenteral nutrition (TPN) as a middle ground."]',
        2,
        'Reasoning: When a patient lacks capacity and has no living will, the surrogate (proxy) is legally and ethically bound to use the "Substituted Judgment" standard—making the decision the patient would have made based on their values. Since the daughter acknowledged the mother "never wanted to be kept alive like this," she is struggling with her own grief rather than representing the patient''s wishes. The physician should gently redirect the conversation back to the patient''s stated values. Option B is paternalistic; Option C is the first step in ethical mediation.'
    );

    ---------------------------------------------------------------------------
    -- CASE 05: Withdrawing Life Support - Terminal Extubation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Ethical Withdrawing of Mechanical Ventilation',
        'A 65-year-old male is in the ICU following a massive intraventricular hemorrhage. He is currently on a mechanical ventilator. Neurological prognosis is extremely poor (persistent vegetative state likely). The patient has a living will stating he does not want "prolonged life support if there is no chance of meaningful recovery." The family agrees with the decision to withdraw support.

Vitals: Temp: 98.2°F | HR: 82 bpm | RR: 14/min (set) | BP: 115/75 mmHg.

Physical Examination:
Mental Status: Comatose; no response to pain.
Physical: Intubated; minimal gag reflex.

Laboratory Results:
Sodium: 142 mEq/L
Potassium: 4.2 mEq/L
Creatinine: 1.1 mg/dL',
        5
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'As the medical team prepares for terminal extubation, which of the following is an essential component of the procedure?',
        '["Administration of a paralytic agent to ensure no gasping occurs.", "Stopping all intravenous fluids 24 hours prior to extubation.", "Proactive administration of opioids and benzodiazepines to prevent air hunger and distress.", "Ensuring the patient''s heart rate is below 60 bpm before removal.", "Requiring a legal representative to witness the extubation."]',
        2,
        'Reasoning: Terminal extubation focuses on comfort. Proactive symptom management (opioids for dyspnea/air hunger and benzodiazepines for anxiety/agitation) is crucial. Option A is highly unethical and illegal (it masks distress rather than treating it and can be seen as active euthanasia). Fluids (Option B) are secondary. Option C is the standard of care in palliative extubation.'
    );

    ---------------------------------------------------------------------------
    -- CASE 06: Hospice Eligibility and Goals
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Criteria for Hospice Referral',
        'A 70-year-old male with NYHA Class IV Congestive Heart Failure is seen in the clinic. He has had four hospitalizations in the past 6 months for decompensated heart failure. He is currently on optimal medical therapy but remains symptomatic at rest. He states, "I am tired of the hospital. I just want to stay home with my dog."',
        6
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following is a primary requirement for this patient to be eligible for the Medicare Hospice Benefit?',
        '["He must have a life expectancy of 12 months or less.", "He must agree to stop all medications, including diuretics.", "He must have a DNR order already signed.", "Two physicians must certify that he has a life expectancy of 6 months or less if the disease follows its natural course.", "He must be unable to perform any Activities of Daily Living (ADLs)."]',
        3,
        'Reasoning: Hospice eligibility under Medicare requires a terminal prognosis of 6 months or less, certified by two physicians (one is the hospice medical director). Option A is the wrong timeframe. Option B is incorrect; many hospice patients stay on comfort-focused meds (like diuretics for edema). Option C is common but not a legal requirement for entry. Option E is for long-term care/nursing home requirements.'
    );

    ---------------------------------------------------------------------------
    -- CASE 07: Persistent Vegetative State (PVS) vs Brain Death
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Differentiating Altered States of Consciousness',
        'A 55-year-old female is in a long-term care facility after a cardiac arrest 3 months ago. She has spontaneous eye-opening and sleep-wake cycles. She does not follow commands, speak, or show any purposeful movement.

Vitals: Temp: 98.6°F | HR: 72 bpm | RR: 16/min | BP: 120/80 mmHg.

Physical Examination:
Mental Status: Eyes open spontaneously; no tracking; no awareness of self or environment.
Reflexes: Intact pupillary, corneal, and gag reflexes; positive Babinski bilaterally.',
        7
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following best describes the patient''s current neurological state?',
        '["Brain Death.", "Locked-in Syndrome.", "Persistent Vegetative State.", "Minimally Conscious State.", "Coma."]',
        2,
        'Reasoning: Persistent Vegetative State (PVS) is characterized by a "wakeful unresponsiveness"—the patient has sleep-wake cycles and eye-opening but no cognitive function or awareness. Brain death (Option A) requires absence of all brainstem reflexes. Locked-in (Option B) has full awareness but total paralysis (except eyes). Minimally Conscious (Option D) shows occasional purposeful behavior. Coma (Option E) lacks sleep-wake cycles.'
    );

    ---------------------------------------------------------------------------
    -- CASE 08: Refusal of Nutrition and Hydration
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Artificial Nutrition and Hydration (ANH)',
        'A 92-year-old man with end-stage Parkinson''s disease and severe dementia is no longer able to swallow safely. His proxy, following the patient''s previously stated values, chooses to decline the placement of a feeding tube. The nursing home staff is concerned that "starving him to death" is inhumane.',
        8
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following is the most accurate statement regarding the withdrawal of artificial nutrition and hydration (ANH)?',
        '["ANH is considered basic care (like hygiene) and cannot be legally withdrawn.", "Withdrawal of ANH is ethically and legally equivalent to withdrawing other life-sustaining treatments like ventilators.", "ANH must be continued until the patient develops multi-organ failure.", "Only a court order can authorize the withdrawal of ANH.", "Withdrawal of ANH is considered active euthanasia in most states."]',
        1,
        'Reasoning: The US Supreme Court (Cruzan case) and major medical societies agree that ANH is a medical intervention, not basic care. Therefore, it can be refused or withdrawn just like any other medical treatment. Option E is a common misconception; it is not euthanasia. Option B is the legal and ethical standard.'
    );

    ---------------------------------------------------------------------------
    -- CASE 09: Futility and Unilateral DNR
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'The Ethics of Futile Resuscitation',
        'An 85-year-old male with multi-organ failure, advanced metastatic cancer, and septic shock is in the ICU. He is on maximum pressor support and a ventilator. His prognosis for surviving the hospitalization is <1%. The family insists on "Full Code" status, including chest compressions and defibrillation if his heart stops.',
        9
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The medical team believes that CPR would be medically futile and potentially harmful (rib fractures, skin burns) without any physiological benefit. What is the most appropriate next step in most jurisdictions?',
        '["Unilaterally write a DNR order without informing the family.", "Perform CPR as requested, even if it is believed to be futile.", "Engage the hospital ethics committee and follow the institutional policy for resolving futility disputes.", "Request that the family be removed from the ICU.", "Sedate the family so they don''t witness the death."]',
        2,
        'Reasoning: Unilateral DNR orders (Option A) are legally and ethically risky in most states. The standard approach to "medical futility" is a process-based one: 1. Intensive communication. 2. Ethics committee involvement. 3. Attempting to transfer to another facility. If these fail, some states (like Texas) allow for unilateral action after a specific timeframe, but the first step is committee mediation. Option B is common but ethically debated.'
    );

    ---------------------------------------------------------------------------
    -- CASE 10: Physician-Assisted Suicide (PAS) vs Euthanasia
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Legal and Ethical Distinctions in Aid-in-Dying',
        'A 55-year-old female with terminal ALS in a state where "Medical Aid in Dying" is legal requests that her physician provide her with a lethal dose of medication to end her life when her breathing becomes too difficult.',
        10
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following best describes "Physician-Assisted Suicide" (or Medical Aid in Dying) as opposed to "Active Euthanasia"?',
        '["The physician administers the lethal injection directly.", "The physician provides the prescription, but the patient must self-administer the medication.", "The physician turns off the ventilator while the patient is sedated.", "The physician provides enough morphine to cause respiratory arrest.", "The patient is given a choice between hospice or a lethal injection."]',
        1,
        'Reasoning: In PAS, the physician provides the means (the prescription), but the patient performs the final act (ingestion). In Active Euthanasia (illegal in all US states), the physician performs the final act (e.g., injection). Option C is withdrawing care. Option D is Double Effect if the intent is pain relief.'
    );

    ---------------------------------------------------------------------------
    -- CASE 11: The "Slow Code" Ethics
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Ethical Implications of the Slow Code',
        'A 90-year-old nursing home resident with end-stage dementia and multiple comorbidities is admitted for sepsis. The family insists on "Full Code." The attending physician tells the residents, "If he arrests, just walk to the room slowly and go through the motions without really trying to revive him."',
        11
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the ethical standing of a "Slow Code"?',
        '["It is an acceptable way to manage family expectations when CPR is futile.", "It is ethically deceptive and violates the duty of honesty and professional integrity.", "It is required in teaching hospitals to allow students to practice.", "It is legally protected if the patient is over 85.", "It is the preferred method for terminal patients in many countries."]',
        1,
        'Reasoning: A "Slow Code" is a deceptive practice that provides the appearance of resuscitation without the intent to succeed. It violates the patient-physician relationship and professional ethics. If CPR is futile, the proper path is honest communication and ethics committee involvement, not deception. Option B is the correct ethical critique.'
    );

    ---------------------------------------------------------------------------
    -- CASE 12: Best Interest Standard
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Decision Making for the Never-Competent Patient',
        'A 25-year-old male with severe intellectual disability (IQ <30) and no family or known friends is diagnosed with a treatable but aggressive leukemia. He has never been able to express personal values or medical preferences.',
        12
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'When a surrogate or court-appointed guardian makes decisions for this patient, which ethical standard must they use?',
        '["Substituted Judgment Standard.", "Best Interest Standard.", "Quality of Life Standard.", "The Principle of Justice.", "Paternalistic Standard."]',
        1,
        'Reasoning: "Substituted Judgment" is for patients who WERE once competent and had known values. For patients who were NEVER competent (or whose values are entirely unknown), the "Best Interest Standard" is used—what a reasonable person would choose in that situation to maximize benefit and minimize harm.'
    );

    ---------------------------------------------------------------------------
    -- CASE 13: POLST vs DNR
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Understanding POLST/MOLST Forms',
        'A 75-year-old male with metastatic pancreatic cancer is being discharged to home hospice. The social worker discusses a Physician Orders for Life-Sustaining Treatment (POLST) form with him.',
        13
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is a primary advantage of a POLST form over a traditional DNR order or a Living Will?',
        '["It is only for healthy patients to plan for the future.", "It converts a patient''s wishes into immediately actionable medical orders that follow the patient across different care settings.", "It removes the need for a healthcare proxy.", "It is legally binding in all 50 states and all foreign countries.", "It allows the physician to make decisions without the patient''s input."]',
        1,
        'Reasoning: Unlike a Living Will (which is a general statement of future wishes) or a hospital-specific DNR, the POLST is a set of medical orders that travel with the patient (home, EMS, hospital) and covers a range of interventions (CPR, intubation, feeding tubes, antibiotics). Option B describes its core function.'
    );

    ---------------------------------------------------------------------------
    -- CASE 14: Organ Donation After Cardiac Death (DCD)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Ethics of Organ Donation Protocols',
        'A 30-year-old male with a non-survivable brain injury is not brain dead but is dependent on the ventilator. His family wishes to withdraw support and has also consented to organ donation.',
        14
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The team plans for Donation after Cardiac Death (DCD). Which of the following is an ethical requirement for this process?',
        '["The transplant surgeon should be the one to declare the patient dead.", "Withdrawal of life support must occur in the operating room to ensure organ viability.", "The decision to withdraw life support must be made entirely independently of the decision to donate organs.", "The patient must be given a lethal dose of potassium to ensure rapid cardiac arrest.", "No sedation can be given during the withdrawal of support to avoid organ contamination."]',
        2,
        'Reasoning: To avoid a conflict of interest, the decision to withdraw care must be separate from the donation decision. Also, the team declaring death must be separate from the transplant team. Option C is the fundamental ethical boundary. Option D is active euthanasia/murder.'
    );

    ---------------------------------------------------------------------------
    -- CASE 15: CPR in the Frail Elderly
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Informed Consent for Resuscitation',
        'A 95-year-old female with severe frailty, advanced dementia, and multiple chronic illnesses is being admitted to a skilled nursing facility. The physician is discussing code status with the family.',
        15
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Which of the following pieces of information is most critical to provide to the family regarding the reality of CPR in this population?',
        '["The success rate for returning to prior baseline function after in-hospital arrest in this population is approximately 50%.", "CPR in the very frail often leads to rib fractures and internal organ damage without meaningful survival.", "The hospital is legally required to perform CPR unless a judge says otherwise.", "Most patients find CPR to be a peaceful way to transition.", "The cost of CPR is usually not covered by insurance."]',
        1,
        'Reasoning: Informed consent requires realistic expectations. For the frail elderly with multiple comorbidities, survival to discharge after CPR is extremely low (<5-10%), and meaningful neurological recovery is even rarer. Option B provides the necessary realistic clinical context.'
    );

    ---------------------------------------------------------------------------
    -- CASE 16: Refusal of Blood (Advanced Directive)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Jehovah''s Witness and the Unconscious Patient',
        'A 45-year-old male is brought to the ED after a car accident. He is unconscious and bleeding heavily. A wallet card states he is a Jehovah''s Witness and refuses all blood products under any circumstances. No family is present.',
        16
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the most appropriate next step?',
        '["Administer blood under the emergency implied consent rule.", "Respect the refusal on the wallet card and withhold blood products.", "Wait for a court order before giving or withholding blood.", "Give the blood and then apologize to the patient later.", "Contact a local church to verify his status."]',
        1,
        'Reasoning: A clear, specific, and signed advance directive (like a pocket card) is legally binding even if the patient is currently incapacitated. Autonomy (expressed through the card) overrides the physician''s desire to save the life (Beneficence) in this specific religious context. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 17: Terminal Agitation and Sedation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Palliative Sedation at End of Life',
        'A 60-year-old patient with terminal cancer is in his final hours. He is experiencing "terminal agitation," characterized by extreme restlessness, thrashing, and apparent distress that has not responded to standard doses of benzodiazepines.',
        17
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'The team proposes "palliative sedation to unconsciousness." How does this differ from euthanasia?',
        '["The intent is to relieve refractory suffering by lowering the level of consciousness, not to cause death.", "Palliative sedation is only legal for patients over 80.", "It involves giving a lethal dose of insulin.", "There is no difference; it is a form of euthanasia.", "It requires a judge''s signature."]',
        0,
        'Reasoning: Intent and method are the keys. Palliative sedation uses medications (like midazolam or propofol) to titrate to a level where the patient is no longer in distress, even if that results in unconsciousness. The intent is symptom control, not death. Option A is the correct distinction.'
    );

    ---------------------------------------------------------------------------
    -- CASE 18: Discontinuing Pacemakers vs ICDs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Ethical Withdrawal of Cardiac Devices',
        'An 80-year-old male with end-stage heart failure and a terminal diagnosis of pancreatic cancer wants his Implantable Cardioverter Defibrillator (ICD) deactivated to allow for a natural death.',
        18
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Is deactivating a life-sustaining cardiac device like an ICD ethically equivalent to withdrawing a ventilator?',
        '["No, cardiac devices are permanent and cannot be turned off.", "Yes, a competent patient has the right to refuse any medical intervention, including implanted devices.", "Only if the patient is already in the hospital.", "Only if the device is low on battery.", "No, turning it off is considered suicide."]',
        1,
        'Reasoning: Medical ethics and the law treat implanted devices the same as external ones (like ventilators). A patient has the right to refuse the continued "bodily invasion" of the device. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 19: Request for "Everything" in a Terminal State
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Managing the Unrealistic Expectations of the Dying',
        'A 40-year-old patient with metastatic cancer and multi-organ failure says, "I know I''m dying, but I want you to try every single surgery and drug possible, even if it has a 0% chance of working."',
        19
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Does the physician have an obligation to provide non-beneficial (futile) treatment just because the patient asks for it?',
        '["Yes, autonomy is the highest principle and must be followed.", "No, the duty of non-maleficence and professional integrity means a physician should not perform procedures that offer no benefit and only cause harm.", "Yes, but only if the patient pays in cash.", "Only if the hospital lawyer approves.", "Yes, but the physician can perform a ''fake'' surgery to satisfy them."]',
        1,
        'Reasoning: Autonomy is a "negative right" (the right to refuse) not a "positive right" (the right to demand any treatment). Physicians should not provide treatment that is outside the standard of care and provides no benefit. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 20: Role of the Hospital Ethics Committee
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'When to Consult the Ethics Committee',
        'The family of a patient in a coma is demanding that the patient be kept on life support indefinitely, despite the medical team''s consensus that the patient is brain dead.',
        20
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the primary role of the Hospital Ethics Committee in this situation?',
        '["To act as a judge and issue legally binding verdicts.", "To provide a forum for communication, mediate conflicts, and offer non-binding advisory opinions.", "To protect the hospital from any potential lawsuits.", "To decide who gets to live and who gets to die based on cost.", "To fire physicians who disagree with families."]',
        1,
        'Reasoning: Ethics committees are advisory. They help clarify the ethical issues and facilitate a resolution through mediation and communication. They do not have legal "police powers." Option B is their standard role.'
    );

    ---------------------------------------------------------------------------
    -- CASE 21: The "Live-in" Partner vs Estranged Family
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Priority in the Surrogate Hierarchy',
        'A 50-year-old man is in a coma. He has no advance directive. He has lived with a domestic partner for 10 years but is not legally married. He also has an adult sister with whom he hasn''t spoken in 20 years. Who is the legal surrogate in most states?',
        21
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'Based on the standard legal hierarchy of next-of-kin, who has the primary authority?',
        '["The domestic partner.", "The estranged sister.", "The hospital administrator.", "The patient''s neighbor.", "The primary care physician."]',
        1,
        'Reasoning: In most states (without a domestic partnership registration), the legal hierarchy is: 1. Spouse. 2. Adult children. 3. Parents. 4. Siblings. The partner, no matter how close, has no legal standing unless specifically designated as the healthcare proxy. Option B is the unfortunate legal reality.'
    );

    ---------------------------------------------------------------------------
    -- CASE 22: CPR and the "Gasping" Patient
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Signs of Impending Death',
        'A patient with a DNR order is actively dying. The family sees the patient "gasping" for air (agonal respirations) and calls the nurse in a panic to "do something."',
        22
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'What is the most appropriate response by the nurse?',
        '["Start chest compressions immediately.", "Explain that these are agonal respirations, a normal part of the dying process, and provide morphine to ensure comfort.", "Intubate the patient silently.", "Tell the family to leave the room.", "Call a ''Code Blue''."]',
        1,
        'Reasoning: Agonal respirations are a sign of impending death, not distress that requires CPR in a DNR patient. Education and symptom management (Option B) are the correct responses.'
    );

    ---------------------------------------------------------------------------
    -- CASE 23: Withdrawing Care in a Minor
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Pediatric End-of-Life Decisions',
        'A 5-year-old child has a non-survivable brain tumor. The parents want to stop chemotherapy and move to hospice. The child says, "I don''t want to die."',
        23
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'How should the medical team approach this conflict?',
        '["The child''s refusal of hospice must be honored.", "The parents have the legal right to decide on the best course of care for the child.", "The child must be made a ward of the state.", "Hospice is illegal for children under 12.", "Wait until the child is 18 to decide."]',
        1,
        'Reasoning: Parents are the legal decision-makers for minors. While "assent" is sought from older children, for a 5-year-old with a terminal diagnosis, the parents'' decision to move to palliative care is legally and ethically paramount. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 24: The Role of the Living Will
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Living Wills vs Proxy Decisions',
        'A patient has a living will that says "No ventilators." The proxy says, "I think he changed his mind right before he fell asleep. Let''s intubate him."',
        24
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'In the case of a conflict between a clear, written living will and a proxy''s "hunch," which takes priority?',
        '["The proxy''s current decision always overrides the past written document.", "The written living will takes priority as it is the most direct evidence of the patient''s competent wishes.", "The physician decides based on their own opinion.", "They should flip a coin.", "The living will is only valid if a lawyer is present."]',
        1,
        'Reasoning: A clear, specific written directive is the "gold standard" for evidence of autonomy. Proxies are meant to follow the patient''s wishes, not override them without very strong evidence. Option B is correct.'
    );

    ---------------------------------------------------------------------------
    -- CASE 25: Autonomy in the Setting of Depression
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (
        v_topic_id,
        'Terminal Illness and Concurrent Depression',
        'A 70-year-old with metastatic cancer is refusing life-prolonging surgery. The family thinks he is "just depressed" and wants to force the surgery.',
        25
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES (
        v_case_id,
        'How should the physician evaluate the patient''s capacity to refuse the surgery?',
        '["The presence of any depression automatically removes capacity.", "The physician must determine if the depression is so severe that it is clouding the patient''s ability to understand the risks and benefits and make a reasoned choice.", "Surgery should be performed regardless of capacity because it saves life.", "The family''s wishes are more important than the patient''s.", "Wait 6 months to see if the depression improves before deciding."]',
        1,
        'Reasoning: Depression does not equal a lack of capacity. A patient can be sad or even clinically depressed but still be able to reason through a medical decision. Only if the depression impairs the core components of capacity (understanding, reasoning, appreciation) is the refusal invalid. Option B is the correct clinical approach.'
    );

END $$;

COMMIT;
