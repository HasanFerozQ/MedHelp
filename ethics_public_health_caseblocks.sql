-- Ethics, Law & Health Systems: Public health & preventive medicine - Complete (Cases 1-50)
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ethics-public-health

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-public-health' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ethics-public-health';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Mandatory Reporting - Child Abuse
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Suspicious Bruise' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Suspicious Bruise', 'A 4-year-old boy is brought to the pediatrician by his father for a routine check-up. During the exam, you notice several bruises on his back and buttocks in various stages of healing. The father explains the boy fell off his bike yesterday.

Vitals: BP 95/60 mmHg, HR 105 bpm, Temp 98.6°F.
Physical Examination: Multiple 1-2 cm ecchymoses on the lower back and buttocks; some are purple, some are yellow-green.
Laboratory Results: Normal CBC and coagulation studies.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old boy is brought to the pediatrician by his father for a routine check-up. During the exam, you notice several bruises on his back and buttocks in various stages of healing. The father explains the boy fell off his bike yesterday.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate next step for the physician?', '["Confront the father and accuse him of abuse", "Report the suspicious findings to Child Protective Services (CPS) immediately", "Wait until the next visit to see if more bruises appear", "Ask the child alone if his father hits him and only report if he says yes"]', 1, 'Physicians are mandatory reporters. In cases of suspected child abuse, you do not need proof—only a \"reasonable suspicion.\" Reports must be made immediately.'),
    (v_case_id, 'Which finding in this case is most suggestive of non-accidental trauma?', '["The size of the bruises", "Bruises in various stages of healing on the back/buttocks", "The child''s heart rate", "The father''s presence"]', 1, 'Bruises on protected areas (buttocks, back, trunk) and bruises of different ages (colors) are highly suggestive of repeated abuse.'),
    (v_case_id, 'True or False: A physician can be held liable for a \"bad faith\" report of child abuse.', '["True", "False"]', 1, 'Most states provide immunity from civil and criminal liability for mandatory reporters who make reports in good faith, even if the investigation finds no abuse.');

    ---------------------------------------------------------------------------
    -- CASE 02: Mandatory Reporting - Elder Abuse
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neglected Senior' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neglected Senior', 'An 82-year-old woman with advanced dementia is brought to the ED from home by her daughter. She is noted to be severely dehydrated, wearing a heavily soiled adult diaper, and has a Stage IV pressure ulcer on her sacrum.

Vitals: BP 90/50 mmHg, HR 118 bpm, Temp 100.2°F.
Physical Examination: Poor hygiene, cachectic appearance, 5x5 cm ulcer with visible bone on the sacrum.
Laboratory Results: BUN 65 mg/dL, Creatinine 2.1 mg/dL (Baseline 0.8).', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 82-year-old woman with advanced dementia is brought to the ED. She is noted to be severely dehydrated, wearing a heavily soiled adult diaper, and has a Stage IV pressure ulcer on her sacrum.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This scenario is most suggestive of:', '["Natural progression of dementia", "Elder neglect", "Physical assault", "Financial exploitation"]', 1, 'Elder neglect is a form of abuse characterized by the failure of a caregiver to provide for the elder''s basic needs (hygiene, nutrition, medical care).'),
    (v_case_id, 'Is the physician required to report this to a government agency?', '["No, because the patient has dementia", "Yes, to Adult Protective Services (APS)", "Only if the daughter admits to neglect", "Only if the patient asks for help"]', 1, 'Like child abuse, suspected elder abuse or neglect must be reported to the appropriate authorities (APS).'),
    (v_case_id, 'What is the primary goal of Adult Protective Services?', '["To put caregivers in jail", "To ensure the safety and well-being of vulnerable adults while respecting their autonomy as much as possible", "To take over the patient''s finances", "To move every patient to a nursing home"]', 1, 'APS aims to provide services and interventions to protect vulnerable adults from harm.');

    ---------------------------------------------------------------------------
    -- CASE 03: Intimate Partner Violence (IPV)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Secret Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Secret Injury', 'A 30-year-old woman presents to the clinic with a fractured wrist. She is hesitant to explain how it happened and glances frequently at her husband, who is in the room. When the husband leaves to take a call, she admits he pushed her down the stairs.

Vitals: Stable.
Physical Examination: Transverse fracture of the distal radius. Old bruising on the upper arms.
Laboratory Results: Normal.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old woman admits her husband pushed her down the stairs, causing a wrist fracture.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In most states, is the physician MANDATED to report this to the police against the patient''s will?', '["Yes, always", "No, for competent adults, reporting IPV is usually NOT mandatory unless a weapon was used or specific state laws apply", "Only if the husband is still in the building", "Only if the injury requires surgery"]', 1, 'For competent adults, mandatory reporting of IPV can actually increase danger to the victim. The physician should offer resources and a safety plan.'),
    (v_case_id, 'What is the most important intervention for this patient?', '["Prescribing pain medication", "Conducting a lethality assessment and helping her create a safety plan", "Calling the husband to scold him", "Reporting her to CPS"]', 1, 'Safety is the priority. A safety plan includes having a bag packed, a place to go, and knowing the numbers for domestic violence hotlines.'),
    (v_case_id, 'True or False: You should document the patient''s own words regarding the cause of the injury in the medical record.', '["True", "False"]', 0, 'Accurate documentation (using quotes) and photographs (with consent) are vital for future legal protection for the victim.');

    ---------------------------------------------------------------------------
    -- CASE 04: Mandatory Reporting - Infectious Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Syphilis Diagnosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Syphilis Diagnosis', 'A 24-year-old male is diagnosed with primary syphilis after presenting with a painless chancre. He is a prominent local politician and begs you not to report the diagnosis to the health department, fearing it will leak to the press.

Vitals: Stable.
Physical Examination: 1 cm painless, indurated ulcer on the glans penis.
Laboratory Results: RPR positive (1:64), FTA-ABS positive.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old politician is diagnosed with syphilis and begs the physician not to report it.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must the physician do regarding the political status of the patient?', '["Honoring the request due to his public status", "Report the case to the local health department as required by law", "Wait for the patient to decide", "Only report if the patient refuses treatment"]', 1, 'Public health laws mandate the reporting of specific \"notifiable\" infectious diseases (like syphilis, HIV, TB) to protect the community. There are no exceptions for public figures.'),
    (v_case_id, 'Which of the following is typically a \"notifiable\" disease to the CDC/State?', '["Common Cold", "Syphilis", "Type 2 Diabetes", "Osteoarthritis"]', 1, 'Syphilis is a reportable STI due to its impact on public health and the need for partner notification.'),
    (v_case_id, 'What is the primary purpose of partner notification in STIs?', '["To punish the partners", "To identify, test, and treat individuals who may have been exposed to prevent further spread", "To generate data for the press", "To shame the patient"]', 1, 'Contact tracing/partner notification is a core public health strategy to break the chain of transmission.');

    ---------------------------------------------------------------------------
    -- CASE 05: Duty to Warn - Tarasoff
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Specific Threat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Specific Threat', 'During a psychiatric session, a patient tells his therapist, \"I am going to kill my ex-girlfriend, Sarah Miller, when she gets off work today at the grocery store on Main Street.\" The patient has a history of violence.

Vitals: BP 140/90 mmHg, HR 100 bpm.
Physical Examination: Patient is agitated, pacing, and focused on the threat.
Laboratory Results: Normal.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A psychiatric patient makes a specific threat to kill his ex-girlfriend.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on the Tarasoff ruling, the therapist''s primary obligation is to:', '["Maintain patient confidentiality at all costs", "Warn the intended victim and/or notify the police", "Increase the patient''s medication and send him home", "Ask the patient to sign a \"no-harm\" contract"]', 1, 'The \"Duty to Warn\" (or Protect) arises when a patient communicates a serious, specific threat of physical violence against an identifiable victim.'),
    (v_case_id, 'Which element is REQUIRED to trigger the duty to warn?', '["A vague sense that the patient is \"dangerous\"", "A specific threat against an identifiable third party", "The patient having a weapon in the room", "The patient being uninsured"]', 1, 'Confidentiality is waived only when there is a specific, identifiable threat to public safety or an individual.'),
    (v_case_id, 'True or False: If the threat is vague (e.g., \"I hate everyone\"), the duty to warn Sarah Miller still applies.', '["True", "False"]', 1, 'Vague or generalized threats do not typically trigger the duty to warn specific individuals, though they may justify involuntary hospitalization.');

    ---------------------------------------------------------------------------
    -- CASE 06: Police Power - Tuberculosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Non-Compliant TB Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Non-Compliant TB Patient', 'A patient with active, sputum-positive pulmonary tuberculosis refuses to stay in the hospital and refuses to take his medications. He tells you he plans to return to his job as a bus driver immediately.

Vitals: Temp 101.5°F, RR 22 bpm, O2 Sat 94% on RA.
Physical Examination: Cachectic, persistent cough with hemoptysis.
Laboratory Results: Sputum AFB smear 3+ positive; CXR shows cavitary lesion in RUL.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with active, infectious TB refuses treatment and plans to return to work as a bus driver.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate public health intervention?', '["Allow him to leave to respect his autonomy", "Involuntary isolation and Directly Observed Therapy (DOT)", "Ask him to wear a mask occasionally", "Fire him from his job"]', 1, 'Public health law (Police Power) allows the state to infringe on individual liberty (e.g., quarantine/isolation) when there is a significant threat to public health (like infectious TB).'),
    (v_case_id, 'Directly Observed Therapy (DOT) is a standard of care for TB because:', '["It saves money", "It ensures adherence and prevents the development of multi-drug resistant (MDR) strains", "It makes patients feel better", "It is easier for the doctor"]', 1, 'Non-adherence to TB therapy is a major public health risk; DOT involves a health worker watching the patient take every dose.'),
    (v_case_id, 'Which principle is being balanced against Patient Autonomy in this case?', '["Beneficence", "Justice", "The Harm Principle (Public Safety)", "Veracity"]', 2, 'The Harm Principle suggests that the only purpose for which power can be rightfully exercised over any member of a civilized community, against his will, is to prevent harm to others.');

    ---------------------------------------------------------------------------
    -- CASE 07: Contact Tracing - HIV
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Partner Notification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Partner Notification', 'A 28-year-old woman is newly diagnosed with HIV. She is terrified of her husband''s reaction and refuses to tell him or allow the clinic to notify him.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: HIV-1/2 Antigen/Antibody Immunoassay positive; CD4 count 450 cells/µL.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman newly diagnosed with HIV refuses to notify her husband.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physician''s first priority in this situation?', '["Report her to the police", "Encourage her to disclose and offer assistance or health department notification services", "Immediately call the husband without her knowledge", "Do nothing"]', 1, 'The first step is to counsel the patient on the importance of notification and offer help (e.g., \"partner notification services\" where the health department notifies the partner anonymously).'),
    (v_case_id, 'In many jurisdictions, if the patient persistently refuses to notify a spouse who is at high risk, the physician __________.', '["Must stay silent", "May have a legal \"privilege to disclose\" or duty to notify the spouse/health department", "Should terminate the patient", "Must tell the patient''s employer"]', 1, 'Public health laws vary, but many allow or require notification of a known, identifiable spouse/partner who is unknowingly at risk.'),
    (v_case_id, 'True or False: Partner notification services always reveal the name of the original patient.', '["True", "False"]', 1, 'Public health departments can perform notification anonymously, informing the contact they have been exposed without naming the index patient.');

    ---------------------------------------------------------------------------
    -- CASE 08: Occupational Health - Lead Poisoning
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Battery Factory Worker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Battery Factory Worker', 'A 45-year-old man works in a battery recycling plant. He presents with abdominal pain, constipation, and \"pins and needles\" in his feet. He mentions that several of his coworkers have similar symptoms.

Vitals: BP 155/95 mmHg, HR 88 bpm.
Physical Examination: Mild diffuse abdominal tenderness; decreased sensation in a \"stocking-glove\" distribution.
Laboratory Results: Blood Lead Level (BLL) 65 µg/dL. Microcytic anemia with basophilic stippling.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A battery factory worker presents with symptoms of lead poisoning.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physician''s public health obligation in this case?', '["Only treat the patient", "Report the elevated blood lead level to the state health department/OSHA", "Tell the patient to quit his job", "Ignore the coworkers'' symptoms"]', 1, 'Occupational lead poisoning is a reportable condition. The health department and OSHA (Occupational Safety and Health Administration) use these reports to investigate workplace safety violations.'),
    (v_case_id, 'Which of the following is a classic sign of lead poisoning?', '["Lead lines\" on the gums (Burton lines)", "Wrist drop", "Basophilic stippling on peripheral smear", "All of the above"]', 3, 'Lead poisoning affects the neurologic, gastrointestinal, renal, and hematologic systems.'),
    (v_case_id, 'What is the most important \"treatment\" for occupational lead poisoning?', '["Chelation therapy alone", "Removal from the source of exposure", "Drinking more milk", "Vitamin C"]', 1, 'While chelation is used for very high levels, removal from exposure is the first and most critical step.');

    ---------------------------------------------------------------------------
    -- CASE 09: Biostatistics - Incidence vs. Prevalence
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Impact of the New Drug' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Impact of the New Drug', 'A new drug is developed that significantly prolongs the survival of patients with pancreatic cancer but does not cure the disease.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A new drug increases survival in pancreatic cancer but does not cure it.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How will this drug affect the PREVALENCE of pancreatic cancer in the population?', '["Decrease", "Increase", "Stay the same", "Become zero"]', 1, 'Prevalence = Incidence x Duration. Since the drug increases survival (duration) without curing (incidence stays same), more people will be living with the disease at any given time.'),
    (v_case_id, 'How will this drug affect the INCIDENCE of pancreatic cancer?', '["Decrease", "Increase", "Stay the same", "Incidence cannot be measured"]', 2, 'Incidence is the rate of NEW cases. A treatment for existing cases does not change the rate at which new cases occur.'),
    (v_case_id, 'Prevalence is most useful for:', '["Determining the cause of a disease", "Allocating healthcare resources and planning services", "Evaluating a new vaccine", "Assessing the risk of contracting a disease"]', 1, 'Prevalence reflects the total \"burden\" of a disease in a community at a specific time, which is essential for resource planning.');

    ---------------------------------------------------------------------------
    -- CASE 10: Screening Ethics - Overdiagnosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Finding \"Disease\" That Doesn''t Matter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Finding \"Disease\" That Doesn''t Matter', 'A 75-year-old man undergoes a full-body \"screening MRI\" he saw advertised. It finds a 4 mm nodule in his kidney. He is otherwise healthy. He undergoes a biopsy, which is inconclusive, leading to a partial nephrectomy. The pathology shows a very low-grade cancer that likely never would have caused symptoms.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy man undergoes an unindicated screening MRI and ends up with a partial nephrectomy for a benign-behaving tumor.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This scenario is an example of:', '["A successful screening outcome", "Overdiagnosis", "A near miss", "Effective preventive medicine"]', 1, 'Overdiagnosis is the detection of a \"disease\" that would never have caused symptoms or death in the patient''s lifetime. It leads to unnecessary treatment and harm.'),
    (v_case_id, 'How does overdiagnosis differ from a \"false positive\"?', '["They are the same", "A false positive is a test error; overdiagnosis is a true disease finding that is clinically irrelevant", "False positives are more common", "Overdiagnosis only happens in children"]', 1, 'In overdiagnosis, the patient *has* the lesion, but the lesion is not harmful.'),
    (v_case_id, 'What is the primary way the USPSTF prevents overdiagnosis?', '["By banning all MRIs", "By only recommending screening (Grades A and B) for populations where the benefits significantly outweigh the harms", "By making screening free", "By asking patients what they want"]', 1, 'Screening recommendations are based on a careful balance of potential benefits vs. harms (including overdiagnosis and overtreatment).');

    ---------------------------------------------------------------------------
    -- CASE 11: Vaccine Ethics - The Refusal
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Refusing the Vitamin K and Hep B' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Refusing the Vitamin K and Hep B', 'A couple presents for the birth of their first child. They refuse the Vitamin K injection and the Hepatitis B vaccine for their newborn, stating they \"want to go all-natural.\"

Vitals: Newborn is stable.
Physical Examination: Normal newborn.
Laboratory Results: Normal.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A couple refuses Vitamin K and Hep B for their newborn.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial response to vaccine refusal in a stable patient?', '["Immediately call CPS", "Listen to their concerns, provide factual information, and aim for a collaborative relationship", "Refuse to treat the family", "Tell them they are being neglectful"]', 1, 'The CDC and AAP recommend a non-confrontational, educational approach. Listening to concerns builds trust and may eventually lead to acceptance.'),
    (v_case_id, 'In which situation is it ETHICALLY permissible to override parental refusal for a life-saving intervention?', '["In every case of vaccine refusal", "When the refusal poses a significant, immediate threat of serious harm to the child (e.g., blood transfusion in a bleeding child)", "Never; parents have absolute rights", "Only if the doctor is a specialist"]', 1, 'The state''s \"parens patriae\" power allows interference with parental decisions when they put a child at risk of death or serious disability.'),
    (v_case_id, 'True or False: Hepatitis B is routinely given at birth to prevent vertical transmission and long-term chronic infection.', '["True", "False"]', 0, 'Universal birth-dose Hepatitis B is a core public health strategy to eliminate Hep B transmission.');

    ---------------------------------------------------------------------------
    -- CASE 12: Vaccine Ethics - Mandates
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'School Entry Requirements' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'School Entry Requirements', 'A state legislature is considering a bill to eliminate religious and philosophical exemptions for school-entry vaccines, leaving only medical exemptions.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A state legislature considers eliminating non-medical vaccine exemptions.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The ethical justification for mandatory school-entry vaccines is based on:', '["Protecting the individual child", "Achieving Herd Immunity to protect the most vulnerable in the community", "Saving money on school lunches", "Increasing drug company profits"]', 1, 'Herd Immunity occurs when a high enough percentage of the population is immune, making the spread of disease unlikely and protecting those who cannot be vaccinated (e.g., immunocompromised).'),
    (v_case_id, 'Which of the following is a VALID medical exemption for most vaccines?', '["Severe allergic reaction (anaphylaxis) to a vaccine component", "A mild cold", "History of autism in a sibling", "The parent''s intuition"]', 0, 'Medical exemptions are for specific, contraindicating conditions like anaphylaxis or severe immunosuppression (for live vaccines).'),
    (v_case_id, 'True or False: The Supreme Court case Jacobson v. Massachusetts (1905) upheld the state''s power to mandate vaccines for public health.', '["True", "False"]', 0, 'Jacobson established that individual liberty is not absolute and can be restricted for the greater public good.');

    ---------------------------------------------------------------------------
    -- CASE 13: Screening - Breast Cancer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mammography Guidelines' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mammography Guidelines', 'A 42-year-old healthy woman asks about starting screening mammograms. She has no family history of breast cancer and no symptoms.

Vitals: Stable.
Physical Examination: Normal breast exam.
Laboratory Results: Normal.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman with no risk factors asks about mammography.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the USPSTF, the decision to start mammography before age 50 should be:', '["Mandatory for all women", "Based on an individual patient''s values and preferences after discussing benefits and harms", "Prohibited", "Determined by her insurance company"]', 1, 'For women aged 40-49, the benefit is smaller and the risk of false positives/unnecessary biopsies is higher, making it an individual decision.'),
    (v_case_id, 'At what age does the USPSTF give a GRADE B recommendation for biennial (every 2 years) mammography?', '["30-40", "40-50", "50-74", "75+"]', 2, 'The Grade B recommendation (substantial benefit) is for women aged 50-74.'),
    (v_case_id, 'Why is screening mammography typically stopped after age 74 or if life expectancy is < 10 years?', '["To save money", "The potential harms (overdiagnosis/overtreatment) likely outweigh the benefits of finding a slow-growing cancer", "Older women don''t get breast cancer", "Older women shouldn''t have surgery"]', 1, 'Screening is most effective when the patient has a long enough life expectancy to benefit from early detection of a potentially fatal cancer.');

    ---------------------------------------------------------------------------
    -- CASE 14: Screening - Colon Cancer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Colorectal Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Colorectal Screening', 'A 47-year-old male presents for a physical. He has no symptoms and no family history of colorectal cancer.

Vitals: BP 120/80 mmHg.
Physical Examination: Normal.
Laboratory Results: Normal.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 47-year-old male asks about colon cancer screening.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current recommended age to START colorectal cancer screening for average-risk individuals?', '["40", "45", "50", "55"]', 1, 'The USPSTF updated the recommendation to age 45 due to the increasing incidence of colorectal cancer in younger adults.'),
    (v_case_id, 'Which of the following is an acceptable screening option?', '["Colonoscopy every 10 years", "Annual FIT (Fecal Immunochemical Test)", "CT Colonography every 5 years", "All of the above"]', 3, 'Multiple strategies are effective; the \"best\" test is the one that gets done.'),
    (v_case_id, 'If a patient''s father was diagnosed with colon cancer at age 52, when should the patient start screening?', '["At age 45", "At age 42 (10 years before the father''s diagnosis)", "At age 50", "At age 40"]', 1, 'For patients with a first-degree relative diagnosed < 60, screening should start at age 40 or 10 years before the relative''s diagnosis, whichever is earlier.');

    ---------------------------------------------------------------------------
    -- CASE 15: Screening - Cervical Cancer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cervical Cytology' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cervical Cytology', 'A 22-year-old woman presents for a wellness exam. She became sexually active at age 16. She has never had a Pap smear.

Vitals: Stable.
Physical Examination: Normal pelvic exam.
Laboratory Results: Normal.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old woman presents for her first Pap smear.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age should cervical cancer screening (Pap smear) BEGIN?', '["At onset of sexual activity", "Age 18", "Age 21", "Age 25"]', 2, 'Screening starts at age 21 regardless of sexual history, as screening younger leads to unnecessary treatment of transient HPV infections.'),
    (v_case_id, 'For a 32-year-old woman, what is the preferred screening strategy?', '["Pap smear every year", "Pap smear every 3 years", "Pap + HPV co-testing every 5 years", "HPV testing alone is not allowed"]', 2, 'Women aged 30-65 can be screened with Pap alone (every 3 years), Co-testing (every 5 years), or hrHPV testing alone (every 5 years).'),
    (v_case_id, 'True or False: Screening can be stopped after age 65 if the patient has had adequate prior negative screening.', '["True", "False"]', 0, 'If a woman has no history of high-grade lesions and has had 3 consecutive negative Paps or 2 negative co-tests in the last 10 years, screening can stop.');

    ---------------------------------------------------------------------------
    -- CASE 16: Screening - Lung Cancer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heavy Smoker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heavy Smoker', 'A 55-year-old man has a 30-pack-year smoking history and continues to smoke a pack a day. He has no symptoms.

Vitals: BP 135/85 mmHg.
Physical Examination: Clear lungs.
Laboratory Results: Normal.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old 30-pack-year smoker asks about lung cancer screening.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended screening test for this patient?', '["Chest X-ray", "Sputum cytology", "Annual Low-Dose CT (LDCT)", "MRI of the chest"]', 2, 'LDCT is the only test proven to reduce lung cancer mortality in high-risk smokers.'),
    (v_case_id, 'What are the criteria for lung cancer screening?', '["Age 50-80, 20+ pack-year history, and current smoker or quit within 15 years", "Age 40-70, any smoking history", "Age 65-75, men only", "Annual CXR for all smokers"]', 0, 'USPSTF expanded the criteria to age 50 and 20 pack-years in 2021.'),
    (v_case_id, 'When can lung cancer screening be DISCONTINUED?', '["Once the patient turns 60", "Once the patient has not smoked for 15 years", "Once the patient develops a chronic cough", "Never"]', 1, 'Screening stops if the patient turns 81, hasn''t smoked for 15 years, or develops a health problem that limits life expectancy or ability to have curative surgery.');

    ---------------------------------------------------------------------------
    -- CASE 17: Screening - Abdominal Aortic Aneurysm (AAA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The One-Time Screen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The One-Time Screen', 'A 66-year-old male presents for a visit. He quit smoking 5 years ago after smoking for 30 years.

Vitals: BP 140/90 mmHg.
Physical Examination: No palpable abdominal masses.
Laboratory Results: Normal.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old male former smoker presents for a check-up.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What screening is recommended for this patient?', '["Annual abdominal CT", "One-time ultrasound for AAA", "Monthly palpation of the aorta", "No screening is needed"]', 1, 'USPSTF recommends a one-time ultrasound screening for AAA in men aged 65-75 who have ever smoked.'),
    (v_case_id, 'Is this same screening recommended for women who have never smoked?', '["Yes", "No (Grade D - against screening)", "Only if they have high blood pressure", "Only if they ask"]', 1, 'The prevalence of AAA in non-smoking women is so low that the harms of screening (false positives/surgery) outweigh the benefits.'),
    (v_case_id, 'What is the primary goal of AAA screening?', '["To find small aneurysms and operate immediately", "To identify large aneurysms (>5.5 cm) for elective repair to prevent rupture", "To treat hypertension", "To find kidney stones"]', 1, 'Elective repair of a large asymptomatic aneurysm is much safer than emergency surgery for a rupture.');

    ---------------------------------------------------------------------------
    -- CASE 18: Screening - Osteoporosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bone Density' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bone Density', 'A 67-year-old woman presents for a check-up. She has no history of fractures and takes no medications.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old woman asks about bone health.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the recommended screening test for this patient?', '["X-ray of the spine", "DEXA scan (Dual-energy X-ray absorptiometry)", "Serum calcium and Vitamin D levels", "Bone biopsy"]', 1, 'DEXA of the hip and lumbar spine is the standard screening tool for osteoporosis.'),
    (v_case_id, 'At what age should universal screening for osteoporosis begin in women?', '["45", "55", "65", "75"]', 2, 'USPSTF recommends screening for all women aged 65 and older.'),
    (v_case_id, 'Can screening be done earlier (e.g., at age 55)?', '["No, it is prohibited", "Yes, if the woman is at increased risk (e.g., low body weight, smoker, family history of fracture)", "Only if she has already had a fracture", "Only for men"]', 1, 'Women younger than 65 should be screened if their risk of fracture (calculated by tools like FRAX) is equal to or greater than that of a 65-year-old woman with no additional risk factors.');

    ---------------------------------------------------------------------------
    -- CASE 19: Preventive - Statin Therapy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Primary Prevention Statin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Primary Prevention Statin', 'A 50-year-old male with hypertension and a 10-year ASCVD risk of 12% presents for a physical. His LDL is 140 mg/dL. He has no history of heart disease.

Vitals: BP 138/88 mmHg.
Physical Examination: Normal.
Laboratory Results: LDL 140 mg/dL, HDL 45 mg/dL, Total Cholesterol 210 mg/dL.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with an ASCVD risk of 12% and LDL of 140 asks about statins.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the USPSTF, should this patient be started on a low-to-moderate dose statin?', '["No, his LDL is too low", "Yes (Grade B recommendation)", "Only if he also has diabetes", "Only if his BP is > 160"]', 1, 'USPSTF recommends statins for adults aged 40-75 with one or more risk factors (HTN, DM, Smoking, Dyslipidemia) and a 10-year ASCVD risk >= 10%.'),
    (v_case_id, 'What is the \"Grade C\" recommendation for statins?', '["Never use them", "Consider them for patients with 7.5% - 10% risk based on individual preference", "Only for smokers", "Only for patients over 80"]', 1, 'Grade C means the net benefit is small, and the decision should be individualized for those with a 7.5% to 10% risk.'),
    (v_case_id, 'True or False: The ASCVD risk calculator includes age, sex, race, BP, and smoking status.', '["True", "False"]', 0, 'The Pooled Cohort Equations (ASCVD risk) use multiple population-level variables to estimate 10-year risk of MI or stroke.');

    ---------------------------------------------------------------------------
    -- CASE 20: Screening - HIV Universal
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'HIV Universal Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'HIV Universal Screening', 'A 35-year-old woman presents for a routine physical. She has been in a monogamous relationship for 10 years and has no history of STIs or drug use. She has never been tested for HIV.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old low-risk woman asks if she needs an HIV test.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should an HIV test be offered to this patient?', '["No, she is low risk", "Yes, universal screening is recommended at least once for all adults aged 15-65", "Only if she gets pregnant", "Only if she has a new partner"]', 1, 'Universal screening ensures that individuals who do not perceive themselves as at risk are diagnosed and treated early.'),
    (v_case_id, 'Besides age 15-65, who else should be screened for HIV?', '["All pregnant women", "Individuals with a new STI", "Anyone seeking treatment for an STI", "All of the above"]', 3, 'Screening is also mandatory in pregnancy to prevent transmission and recommended during any STI evaluation.'),
    (v_case_id, 'True or False: Modern HIV screening (4th generation) can detect both the P24 antigen and HIV antibodies.', '["True", "False"]', 0, '4th gen tests shorten the \"window period\" by detecting the antigen which appears before antibodies.');

    ---------------------------------------------------------------------------
    -- CASE 21: Occupational Health - Asbestos
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Old Shipyard Worker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Old Shipyard Worker', 'A 70-year-old man who worked in shipbuilding for 40 years presents with progressive shortness of breath. His chest X-ray shows bilateral pleural plaques.

Vitals: BP 130/80 mmHg, HR 75 bpm, RR 18 bpm.
Physical Examination: Fine bibasilar inspiratory crackles.
Laboratory Results: CXR shows calcified pleural plaques and interstitial fibrosis in the lower lobes.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old former shipyard worker presents with shortness of breath and pleural plaques.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Asbestos exposure significantly increases the risk of which cancer?', '["Bronchogenic carcinoma (Lung cancer)", "Mesothelioma", "Both Bronchogenic carcinoma and Mesothelioma", "Neither"]', 2, 'Asbestos is the primary risk factor for mesothelioma, but it increases the risk of bronchogenic carcinoma even more, especially in smokers.'),
    (v_case_id, 'The synergistic effect of smoking and asbestos exposure increases the lung cancer risk by approximately:', '["2-fold", "10-fold", "Over 50-fold", "Smoking has no effect"]', 2, 'Smoking and asbestos exposure have a multiplicative (synergistic) effect on lung cancer risk.'),
    (v_case_id, 'True or False: Pleural plaques are considered a precancerous lesion.', '["True", "False"]', 1, 'Pleural plaques are a marker of asbestos exposure but are not themselves malignant and do not typically lead to mesothelioma.');

    ---------------------------------------------------------------------------
    -- CASE 22: Occupational Health - Silicosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sandblaster' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sandblaster', 'A 50-year-old man who works in sandblasting and masonry presents with chronic cough and exertional dyspnea.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: CXR shows small, rounded opacities in the upper lobes and \"eggshell\" calcification of the hilar lymph nodes.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old sandblaster presents with upper lobe nodules and eggshell calcification.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Patients with silicosis are at a significantly increased risk for which infection?', '["Pneumocystis jirovecii", "Tuberculosis (TB)", "Legionella", "Aspergillosis"]', 1, 'Silica particles impair macrophage function (phagolysosome formation), making patients highly susceptible to Mycobacterium tuberculosis.'),
    (v_case_id, 'What is the characteristic CXR finding for silicosis?', '["Bibasilar crackles", "Eggshell calcification of hilar lymph nodes", "Pleural effusion", "Honeycombing"]', 1, 'Eggshell calcification is a classic (though not always present) radiographic sign of silicosis.'),
    (v_case_id, 'True or False: All patients with silicosis should receive a baseline TST or IGRA for TB screening.', '["True", "False"]', 0, 'Due to the high risk of TB, baseline screening and close monitoring are mandatory for silicosis patients.');

    ---------------------------------------------------------------------------
    -- CASE 23: Occupational Health - Berylliosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Electronics Manufacturer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Electronics Manufacturer', 'A 40-year-old woman works in a plant that manufactures high-end electronics and aerospace components. She presents with dry cough and fatigue. Her lung biopsy shows non-caseating granulomas.

Vitals: Stable.
Physical Examination: Occasional crackles.
Laboratory Results: CXR shows bilateral hilar adenopathy; PFTs show a restrictive pattern.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An electronics worker has non-caseating granulomas and hilar adenopathy.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Chronic Beryllium Disease (Berylliosis) can be clinically indistinguishable from:', '["Asthma", "Sarcoidosis", "Congestive Heart Failure", "Pneumonia"]', 1, 'Both sarcoidosis and berylliosis present with non-caseating granulomas and hilar lymphadenopathy; an occupational history is key to distinguishing them.'),
    (v_case_id, 'Which test can help confirm the diagnosis of berylliosis?', '["Sputum culture", "Beryllium Lymphocyte Proliferation Test (BeLPT)", "Serum ACE level", "Sweat chloride test"]', 1, 'The BeLPT measures the immune response to beryllium and is a specific diagnostic tool.'),
    (v_case_id, 'In which industries is beryllium exposure common?', '["Textiles", "Coal mining", "Aerospace, electronics, and nuclear power", "Agriculture"]', 2, 'Beryllium is a lightweight, strong metal used in advanced engineering and high-tech manufacturing.');

    ---------------------------------------------------------------------------
    -- CASE 24: Environmental Health - Radon
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Basement Gas' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Basement Gas', 'A healthy non-smoker is found to have a new lung mass on a routine chest X-ray for an unrelated issue. He has lived in the basement of an old house in a rocky region for 20 years.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: CT shows a 3 cm spiculated mass in the left upper lobe.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A non-smoker living in a basement is diagnosed with lung cancer.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely environmental risk factor for this patient''s lung cancer?', '["Secondhand smoke", "Radon gas", "Air pollution", "Radon is not a risk factor"]', 1, 'Radon is a colorless, odorless gas produced by the decay of uranium in soil and rock. It is the second leading cause of lung cancer overall and the first among non-smokers.'),
    (v_case_id, 'Where does radon gas typically accumulate in a home?', '["Attics", "Basements and ground floors", "Kitchens", "Bathrooms"]', 1, 'Radon enters homes through cracks in the foundation and accumulates in poorly ventilated lower levels.'),
    (v_case_id, 'True or False: The EPA recommends that all homes be tested for radon.', '["True", "False"]', 0, 'Radon testing is simple and inexpensive; mitigation (ventilation systems) can significantly reduce risk.');

    ---------------------------------------------------------------------------
    -- CASE 25: Environmental Health - Carbon Monoxide
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Winter Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Winter Headache', 'A family of four presents to the ED during a cold winter night with severe headaches, nausea, and dizziness. They recently started using a kerosene space heater in their living room.

Vitals: BP 110/70 mmHg, HR 105 bpm.
Physical Examination: All family members appear mildly confused and have \"cherry-red\" lips and skin.
Laboratory Results: Pulse oximetry shows 100% saturation on room air.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A family using a space heater presents with headaches and nausea.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the pulse oximetry reading (100%) misleading in carbon monoxide (CO) poisoning?', '["The machine is broken", "Pulse oximeters cannot distinguish between oxyhemoglobin and carboxyhemoglobin", "CO increases oxygen levels", "CO poisoning is a diagnosis of exclusion"]', 1, 'Standard pulse oximetry measures the percentage of hemoglobin bound to *something*; it cannot tell the difference between O2 and CO, leading to falsely normal readings.'),
    (v_case_id, 'What is the definitive diagnostic test for CO poisoning?', '["Chest X-ray", "Arterial Blood Gas (ABG) with co-oximetry", "EKG", "Basic Metabolic Panel (BMP)"]', 1, 'Co-oximetry specifically measures the percentage of carboxyhemoglobin in the blood.'),
    (v_case_id, 'What is the initial treatment for suspected CO poisoning?', '["Intubation", "100% high-flow oxygen", "IV fluids", "Antibiotics"]', 1, 'Oxygen competes with CO for hemoglobin binding; high-flow O2 (or hyperbaric O2 in severe cases) accelerates the clearance of CO.');

    ---------------------------------------------------------------------------
    -- CASE 26: Workers'' Compensation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Injury on the Job' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Injury on the Job', 'A construction worker presents with back pain after lifting a heavy beam at work. He is seeking medical care and asks about receiving compensation for his time off.

Vitals: Stable.
Physical Examination: Paraspinal muscle tenderness; negative straight leg raise.
Laboratory Results: Normal.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A worker injured on the job asks about Workers'' Compensation.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Workers'' Compensation is a \"no-fault\" system, which means:', '["The worker must prove the employer was negligent", "The worker receives benefits regardless of who was at fault for the injury", "The employer is never responsible", "The worker is always at fault"]', 1, 'No-fault systems provide faster medical and wage benefits in exchange for the worker giving up the right to sue the employer for negligence.'),
    (v_case_id, 'What is the physician''s primary role in a Workers'' Compensation case?', '["To decide if the worker is \"lazy\"", "To provide a medical diagnosis, determine if the injury is work-related, and assess the level of disability", "To handle the legal paperwork", "To testify in court against the worker"]', 1, 'The physician provides the clinical evidence needed to determine eligibility and level of benefit.'),
    (v_case_id, 'True or False: Workers'' Compensation typically covers injuries that occur during the commute to work.', '["True", "False"]', 1, 'In most states, the \"coming and going rule\" excludes injuries during the normal commute unless the worker is performing a work-related task.');

    ---------------------------------------------------------------------------
    -- CASE 27: Environmental - Water Safety
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Community Crisis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Community Crisis', 'A city switches its water source to a river without proper corrosion control. Over the next year, pediatricians notice an increase in children with developmental delays and behavioral problems.

Vitals: Stable.
Physical Examination: Subtle neurological findings.
Laboratory Results: Elevated blood lead levels in a cluster of local children.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A city''s water supply is contaminated with lead after a source switch.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate source of lead in drinking water in this scenario?', '["The river water itself", "Leaching from old lead pipes and solder due to corrosive water", "Industrial dumping", "Lead paint in the reservoir"]', 1, 'Corrosive water (low pH or lack of inhibitors) causes lead to leach out of the infrastructure (pipes/solder).'),
    (v_case_id, 'Which age group is most vulnerable to the neurotoxic effects of lead?', '["Infants and young children", "Teens", "Young adults", "The elderly"]', 0, 'Developing brains are highly sensitive to lead, which can cause permanent cognitive impairment and behavioral issues.'),
    (v_case_id, 'What is the primary public health action in a water contamination crisis?', '["Giving everyone bottled water indefinitely", "Replacing lead service lines and ensuring proper water chemistry/filtration", "Closing all schools", "Mandatory relocation of the population"]', 1, 'Short-term involves filters/bottled water; long-term requires fixing the infrastructure and water treatment process.');

    ---------------------------------------------------------------------------
    -- CASE 28: Occupational - Organophosphate Poisoning
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pesticide Exposure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pesticide Exposure', 'A 30-year-old farm worker presents with profuse sweating, salivation, miosis, and diarrhea after spraying an unknown pesticide.

Vitals: BP 90/60 mmHg, HR 50 bpm.
Physical Examination: Miosis, diffuse wheezing, and excessive oral secretions.
Laboratory Results: Decreased plasma cholinesterase activity.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A farm worker has symptoms of organophosphate poisoning.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Organophosphates cause toxicity by:', '["Blocking acetylcholine receptors", "Irreversibly inhibiting acetylcholinesterase", "Increasing dopamine levels", "Blocking calcium channels"]', 1, 'This leads to an overabundance of acetylcholine and a \"cholinergic crisis.\"'),
    (v_case_id, 'The mnemonic \"DUMBBELLS\" stands for:', '["Diarrhea, Urination, Miosis, Bradycardia, Bronchospasm, Emesis, Lacrimation, Lethargy, Salivation", "Dizzy, Upset, Mad, Bad, Bold, Evil, Loose, Lost, Sick", "Diabetes, Uremia, Meningitis, Bone, Brain, Eye, Lung, Liver, Spleen", "None of the above"]', 0, 'DUMBBELLS helps identify the parasympathetic overstimulation seen in cholinergic poisoning.'),
    (v_case_id, 'What is the standard treatment for organophosphate poisoning?', '["Atropine and Pralidoxime (2-PAM)", "Epinephrine", "Naloxone", "Activated charcoal only"]', 0, 'Atropine blocks the muscarinic receptors; Pralidoxime regenerates the acetylcholinesterase enzyme if given before \"aging\" occurs.');

    ---------------------------------------------------------------------------
    -- CASE 29: Global Health - Travel Medicine
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The African Safari' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The African Safari', 'A 35-year-old woman is planning a 3-week trip to rural sub-Saharan Africa. She asks for advice on preventing illness.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A woman planning a trip to Africa asks for travel medicine advice.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which intervention is most likely to be REQUIRED for entry into several African countries?', '["Malaria pills", "Yellow Fever vaccine", "Influenza vaccine", "HIV test"]', 1, 'Yellow fever vaccination is often a mandatory entry requirement for travelers from/to endemic regions.'),
    (v_case_id, 'What is the best way to prevent travelers'' diarrhea?', '["Taking prophylactic antibiotics", "Boil it, cook it, peel it, or forget it", "Drinking only local tap water", "Eating at street vendors"]', 1, 'Water and food hygiene are the mainstays of prevention; prophylaxis is generally not recommended for most travelers.'),
    (v_case_id, 'True or False: Malaria prophylaxis must be started before the trip begins.', '["True", "False"]', 0, 'Most malaria regimens (e.g., Atovaquone/Proguanil, Mefloquine, Doxycycline) require a \"lead-in\" period and must be continued after returning.');

    ---------------------------------------------------------------------------
    -- CASE 30: Public Health - Foodborne Outbreak
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Church Picnic Outbreak' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Church Picnic Outbreak', 'Twelve people present to local EDs with nausea, vomiting, and diarrhea within 4 hours of attending a church picnic.

Vitals: Some patients are mildly hypotensive and tachycardic.
Physical Examination: Diffuse abdominal tenderness.
Laboratory Results: Stool cultures are pending.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cluster of gastrointestinal illness occurs after a community picnic.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The rapid onset of symptoms (within 4-6 hours) suggests:', '["Salmonella infection", "Pre-formed toxin (e.g., S. aureus or B. cereus)", "Giardia", "Norovirus"]', 1, 'Toxin-mediated food poisoning (S. aureus from mayo-based salads or B. cereus from reheated rice) has a very short incubation period compared to bacterial infections.'),
    (v_case_id, 'What is the first step in a public health outbreak investigation?', '["Recall all food", "Establish the case definition and confirm the existence of an outbreak", "Interview the cook", "Take a random survey of the town"]', 1, 'You must first define what a \"case\" is and confirm that the number of cases exceeds what is normally expected.'),
    (v_case_id, 'Which study design is most commonly used to identify the \"culprit\" food item in an outbreak?', '["Case-control study", "Cohort study", "Randomized controlled trial", "Ecological study"]', 0, 'In a case-control study, you compare what the sick people (cases) ate vs. what the healthy people (controls) ate to find the statistically significant difference.');

    ---------------------------------------------------------------------------
    -- CASE 31: Screening Metrics - Sensitivity and Specificity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The New Rapid Test' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The New Rapid Test', 'A new rapid test for Strep A is evaluated. In a study of 1000 patients, 200 actually have Strep (confirmed by culture). The rapid test is positive in 180 of those with Strep and negative in 720 of the 800 without Strep.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: 2x2 table: TP=180, FN=20, TN=720, FP=80.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A new rapid test for Strep A is evaluated against a gold standard culture.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the sensitivity of this rapid test?', '["180/200 (90%)", "180/260 (69%)", "720/800 (90%)", "20/200 (10%)"]', 0, 'Sensitivity = TP / (TP + FN). It is the ability of the test to correctly identify those with the disease.'),
    (v_case_id, 'What is the specificity of this rapid test?', '["720/800 (90%)", "180/200 (90%)", "80/800 (10%)", "720/740 (97%)"]', 0, 'Specificity = TN / (TN + FP). It is the ability of the test to correctly identify those without the disease.'),
    (v_case_id, 'If a test has 100% sensitivity, what does a NEGATIVE result tell you?', '["The patient might have the disease", "The patient definitely does NOT have the disease (SNOUT)", "The patient needs another test", "The result is inconclusive"]', 1, 'Sensitivity is used for screening. A highly sensitive test, if negative, rules OUT the disease (SeNSitivity rules OUT = SNOUT).');

    ---------------------------------------------------------------------------
    -- CASE 32: Screening Metrics - PPV and NPV
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Power of Prevalence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Power of Prevalence', 'You use the same Strep test (Sensitivity 90%, Specificity 90%) in two different clinics. Clinic A is an Urgent Care where 50% of patients have Strep. Clinic B is a routine school screening where only 1% have Strep.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The same test is used in a high-prevalence and a low-prevalence setting.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which clinic will the Positive Predictive Value (PPV) be HIGHER?', '["Clinic A (High prevalence)", "Clinic B (Low prevalence)", "They will be the same", "PPV does not depend on prevalence"]', 0, 'PPV increases as the prevalence of the disease in the population increases.'),
    (v_case_id, 'What is the definition of PPV?', '["Probability that a person with the disease tests positive", "Probability that a person with a positive test actually has the disease", "Probability that a test is accurate", "Probability of a false positive"]', 1, 'PPV = TP / (TP + FP). It tells the clinician how likely the result is a \"true positive.\"'),
    (v_case_id, 'As prevalence decreases, the Negative Predictive Value (NPV) will:', '["Decrease", "Increase", "Stay the same", "Become zero"]', 1, 'NPV increases as prevalence decreases (it is easier to rule out a disease that is rare).');

    ---------------------------------------------------------------------------
    -- CASE 33: Lead-Time Bias
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Illusion of Survival' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Illusion of Survival', 'A new screening program for a deadly cancer finds cases 3 years earlier than they would have been found by symptoms. Patients in the screening group live 5 years after diagnosis, while those in the symptom group live 2 years after diagnosis. Both groups die at age 70.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A screening program appears to increase survival time, but death age remains the same.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This phenomenon is known as:', '["Selection bias", "Lead-time bias", "Length-time bias", "Recall bias"]', 1, 'Lead-time bias is an apparent increase in survival time that is actually just due to earlier detection, without any change in the actual time of death.'),
    (v_case_id, 'To overcome lead-time bias, researchers should look at:', '["Survival time from diagnosis", "Mortality rate (e.g., deaths per 100,000 population)", "PPV", "Sensitivity"]', 1, 'Mortality rates are not affected by the time of diagnosis, making them a more reliable measure of screening effectiveness.'),
    (v_case_id, 'True or False: Lead-time bias makes a screening test look MORE effective than it actually is.', '["True", "False"]', 0, 'It creates a false impression that patients are living longer \"because of\" the test.');

    ---------------------------------------------------------------------------
    -- CASE 34: Length-Time Bias
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Finding the Slow Growers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Finding the Slow Growers', 'A screening test for prostate cancer is very good at finding slow-growing, indolent tumors that might never have caused harm, but it often misses aggressive, fast-growing tumors that kill the patient between screening intervals.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A screening test disproportionately identifies slow-growing cases.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This phenomenon is known as:', '["Lead-time bias", "Length-time bias", "Observer bias", "Measurement bias"]', 1, 'Length-time bias occurs because screening is more likely to detect slow-growing (and thus less dangerous) diseases because they have a longer \"pre-clinical\" phase.'),
    (v_case_id, 'Length-time bias can lead to which clinical problem?', '["Under-diagnosis", "Over-diagnosis and overtreatment", "False negatives", "Increased mortality"]', 1, 'By finding indolent cases, we may treat patients who never would have suffered from the disease.'),
    (v_case_id, 'How does length-time bias affect survival statistics?', '["It makes the screened group look healthier because it includes more indolent cases", "It makes the screened group look sicker", "It has no effect", "It only affects elderly patients"]', 0, 'Indolent cases have a better prognosis by definition, artificially inflating the survival rate of the screened group.');

    ---------------------------------------------------------------------------
    -- CASE 35: Study Design - Cohort Study
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tracking the Future' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tracking the Future', 'Researchers identify 500 people who eat a high-fiber diet and 500 people who eat a low-fiber diet. They follow both groups for 10 years to see who develops colon cancer.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A study identifies exposure status first and then follows the groups for the outcome.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This study design is a:', '["Case-control study", "Cohort study", "Cross-sectional study", "Ecological study"]', 1, 'A cohort study starts with a group (the cohort) and follows them over time based on their exposure.'),
    (v_case_id, 'What is the measure of association typically calculated in a cohort study?', '["Odds Ratio (OR)", "Relative Risk (RR)", "Prevalence", "Sensitivity"]', 1, 'RR compares the incidence of disease in the exposed group vs. the unexposed group.'),
    (v_case_id, 'A major disadvantage of a prospective cohort study is:', '["It is prone to recall bias", "It is expensive and time-consuming", "It cannot determine incidence", "It is only for rare diseases"]', 1, 'Following a large group for years is resource-intensive.');

    ---------------------------------------------------------------------------
    -- CASE 36: Study Design - Case-Control Study
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Looking at the Past' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Looking at the Past', 'Researchers identify 100 patients with a rare form of esophageal cancer (Cases) and 100 healthy people (Controls). They interview both groups about their past history of drinking very hot tea.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A study starts with people who have the disease and looks back at their exposures.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This study design is a:', '["Cohort study", "Case-control study", "Randomized controlled trial", "Meta-analysis"]', 1, 'Case-control studies are retrospective and start with the outcome (disease).'),
    (v_case_id, 'What is the measure of association typically calculated in a case-control study?', '["Relative Risk (RR)", "Odds Ratio (OR)", "Attributable Risk", "Incidence"]', 1, 'Since incidence cannot be directly measured in a case-control study, we use the OR as an estimate of RR.'),
    (v_case_id, 'Which type of bias is a major concern in case-control studies?', '["Lead-time bias", "Recall bias", "Selection bias", "Both Recall and Selection bias"]', 3, 'Patients with a disease may remember their exposures differently than healthy controls (Recall bias), and choosing a representative control group can be difficult (Selection bias).');

    ---------------------------------------------------------------------------
    -- CASE 37: Number Needed to Treat (NNT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Value of the Pill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Value of the Pill', 'A clinical trial of a new antihypertensive drug shows that the risk of stroke is 5% in the placebo group and 3% in the drug group over 5 years.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A drug reduces the absolute risk of stroke from 5% to 3%.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Absolute Risk Reduction (ARR)?', '["2%", "40%", "8%", "1%"]', 0, 'ARR = Control Risk - Treatment Risk = 0.05 - 0.03 = 0.02 (or 2%).'),
    (v_case_id, 'What is the Number Needed to Treat (NNT) to prevent one stroke?', '["2", "20", "50", "100"]', 2, 'NNT = 1 / ARR. 1 / 0.02 = 50. You need to treat 50 people for 5 years to prevent one stroke.'),
    (v_case_id, 'If the cost of the drug is very high and the NNT is 1000, the drug is considered to have:', '["High value", "Low clinical utility/Value", "High sensitivity", "No side effects"]', 1, 'A high NNT means many people must be treated to see a single benefit, which may not be cost-effective.');

    ---------------------------------------------------------------------------
    -- CASE 38: Bias - Selection Bias
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hospital Sample' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hospital Sample', 'A researcher wants to study the prevalence of hypertension in the general population. He decides to recruit his sample from patients waiting in the cardiology clinic of a major hospital.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A researcher samples cardiology patients to estimate general population hypertension.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of bias is most likely to affect this study?', '["Recall bias", "Selection bias (specifically Berkson''s bias)", "Observer bias", "Lead-time bias"]', 1, 'Selection bias occurs when the study population is not representative of the target population. Berkson''s bias specifically refers to selection bias in hospital-based samples.'),
    (v_case_id, 'How will this selection bias affect the results?', '["The prevalence of hypertension will be underestimated", "The prevalence of hypertension will be overestimated", "It will have no effect", "It will increase the sensitivity of the test"]', 1, 'Patients in a cardiology clinic are much more likely to have hypertension than the general public.'),
    (v_case_id, 'The \"Healthy Worker Effect\" is a type of selection bias where:', '["Workers are sicker than the general public", "Working populations are healthier than the general public (which includes the disabled/ill)", "Hospitals are safe", "All workers should be screened"]', 1, 'This bias often makes occupational exposures look less dangerous than they are.');

    ---------------------------------------------------------------------------
    -- CASE 39: Bias - Confounding
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Coffee and Cancer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Coffee and Cancer', 'An observational study finds a strong statistical association between coffee drinking and pancreatic cancer. However, when the researchers look closer, they realize that most of the heavy coffee drinkers are also heavy smokers.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A study finds an association between coffee and cancer that is actually due to smoking.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In this study, smoking is a:', '["Confounder", "Mediator", "Outcome", "Effect modifier"]', 0, 'A confounder is a third variable that is related to both the exposure (coffee) and the outcome (cancer) and masks the true relationship.'),
    (v_case_id, 'What is the best way to handle confounding in the design phase of a study?', '["Randomization", "Increasing the sample size", "Hiding the data", "Recall"]', 0, 'Randomization is the most powerful way to distribute both known and unknown confounders equally between groups.'),
    (v_case_id, 'What statistical technique can be used in the ANALYSIS phase to control for confounding?', '["Calculating sensitivity", "Stratification or Multivariable Regression", "T-test", "Chi-square"]', 1, 'By looking at coffee drinkers who smoke vs. those who don''t (stratification), the true effect can be isolated.');

    ---------------------------------------------------------------------------
    -- CASE 40: Epidemiology - Attributable Risk
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burden of Smoking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burden of Smoking', 'In a population, the incidence of lung cancer is 100 per 100,000 in smokers and 10 per 100,000 in non-smokers.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Comparing lung cancer incidence in smokers vs. non-smokers.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Attributable Risk (AR) of lung cancer due to smoking?', '["10", "90 per 100,000", "0.1", "1000"]', 1, 'AR = Incidence(exposed) - Incidence(unexposed) = 100 - 10 = 90. This is the \"excess risk\" specifically due to the exposure.'),
    (v_case_id, 'What is the Relative Risk (RR) of lung cancer for smokers?', '["10", "90", "110", "1"]', 0, 'RR = Incidence(exposed) / Incidence(unexposed) = 100 / 10 = 10. Smokers are 10 times more likely to get lung cancer.'),
    (v_case_id, 'The \"Attributable Risk Percent\" (AR%) tells you:', '["How many people will die", "The percentage of the disease in the exposed group that could be eliminated if the exposure was removed", "The cost of the disease", "The sensitivity of the diagnosis"]', 1, 'AR% = (RR - 1) / RR. In this case, 90% of lung cancer in smokers is attributable to their smoking.');

    ---------------------------------------------------------------------------
    -- CASE 41: Smoking Cessation - Pharmacotherapy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Quitting for Good' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Quitting for Good', 'A 50-year-old smoker with a 20-pack-year history wants to quit. He has tried \"cold turkey\" in the past without success. He has no history of seizures or eating disorders.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient wants to quit smoking and asks about medications.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following first-line medications has the HIGHEST efficacy for smoking cessation?', '["Nicotine patches alone", "Varenicline", "Bupropion", "Acupuncture"]', 1, 'Varenicline (a partial nicotine receptor agonist) is generally the most effective single agent for smoking cessation.'),
    (v_case_id, 'Bupropion is CONTRAINDICATED in patients with which condition?', '["Hypertension", "Seizure disorder or Bulimia/Anorexia", "Diabetes", "COPD"]', 1, 'Bupropion lowers the seizure threshold and is contraindicated in patients with seizures or active/past eating disorders.'),
    (v_case_id, 'What is the most effective overall approach to smoking cessation?', '["Medication alone", "Counseling alone", "Combination of pharmacotherapy and behavioral counseling", "Hypnosis"]', 2, 'The combination of drug therapy and professional counseling yields the highest long-term quit rates.');

    ---------------------------------------------------------------------------
    -- CASE 42: Stages of Change - Transtheoretical Model
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Not Ready to Quit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Not Ready to Quit', 'A patient who smokes two packs a day is told by his doctor about the risks of lung cancer. The patient responds, \"My grandfather smoked until he was 90 and he was fine. I don''t have any interest in quitting right now.\"

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient expresses no interest in quitting smoking.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which stage of change is this patient in?', '["Pre-contemplation", "Contemplation", "Preparation", "Action"]', 0, 'In pre-contemplation, the patient is not considering change and may be defensive or in denial about the risks.'),
    (v_case_id, 'What is the most appropriate physician response to a patient in the pre-contemplation stage?', '["Lecture them on the dangers of smoking", "Acknowledge their stance, offer information if they want it, and keep the door open for future discussion", "Refuse to see them until they quit", "Tell them they are making a mistake"]', 1, 'The goal in pre-contemplation is to raise awareness without causing the patient to withdraw from care.'),
    (v_case_id, 'If the patient said, \"I know it''s bad for me and I want to quit, but I''m not sure I can handle the stress,\" they would be in:', '["Pre-contemplation", "Contemplation", "Preparation", "Action"]', 1, 'Contemplation is the \"ambivalence\" stage—the patient recognizes the problem but is not yet ready to act.');

    ---------------------------------------------------------------------------
    -- CASE 43: Alcohol Use - SBIRT
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Screening for Alcohol' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Screening for Alcohol', 'A 45-year-old man presents for a physical. On the AUDIT-C screening, he scores a 6 (suggestive of hazardous drinking). He admits he drinks \"4 or 5 beers every night\" to relax.

Vitals: BP 145/92 mmHg.
Physical Examination: Normal.
Laboratory Results: AST 50, ALT 40, GGT 80 (elevated).', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient screens positive for hazardous alcohol use.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Brief Intervention\" part of SBIRT?', '["A 60-minute therapy session", "A 5-10 minute conversation to raise awareness of risks and motivate the patient to change", "A formal referral to AA", "A lecture on liver cirrhosis"]', 1, 'SBIRT (Screening, Brief Intervention, and Referral to Treatment) uses short, evidence-based conversations to address substance use.'),
    (v_case_id, 'What are the \"low-risk\" drinking limits for men under 65?', '["No more than 4 drinks on any day AND no more than 14 drinks per week", "No more than 1 drink per day", "7 drinks per week", "Any alcohol is high risk"]', 0, 'Exceeding these NIAAA limits is considered hazardous drinking.'),
    (v_case_id, 'True or False: Alcohol use is a significant (and often overlooked) cause of secondary hypertension.', '["True", "False"]', 0, 'Reducing alcohol intake can lead to a measurable decrease in blood pressure.');

    ---------------------------------------------------------------------------
    -- CASE 44: Obesity - Counseling
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weight and Health' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weight and Health', 'A 35-year-old woman has a BMI of 32 kg/m². She has no other comorbidities. She asks for advice on losing weight.

Vitals: BP 120/80 mmHg.
Physical Examination: BMI 32.
Laboratory Results: Normal glucose and lipids.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with obesity asks for weight loss advice.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The USPSTF recommends which intervention for adults with a BMI of 30 or higher?', '["Immediate bariatric surgery", "Intensive, multicomponent behavioral interventions", "Low-carb diet only", "No intervention if the blood pressure is normal"]', 1, 'Intensive behavioral counseling (diet, exercise, and behavioral strategies) is a Grade B recommendation for obesity.'),
    (v_case_id, 'A BMI of 32 kg/m² is classified as:', '["Overweight", "Obesity Class I", "Obesity Class II", "Morbid Obesity"]', 1, 'BMI 25-29.9 is overweight; 30-34.9 is Class I obesity; 35-39.9 is Class II; >=40 is Class III.'),
    (v_case_id, 'What is a realistic and healthy initial goal for weight loss?', '["5-10% of baseline weight over 6 months", "20% in one month", "Reaching a BMI of 22 immediately", "Weight loss is not recommended"]', 0, 'A 5-10% weight loss significantly improves metabolic health and is achievable for many patients.');

    ---------------------------------------------------------------------------
    -- CASE 45: Physical Activity Recommendations
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sedentary Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sedentary Patient', 'A 60-year-old man who works an office job asks how much he needs to exercise to stay healthy.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient asks about physical activity guidelines.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current CDC/HHS recommendation for moderate-intensity aerobic activity for adults?', '["30 minutes once a week", "At least 150 minutes per week", "60 minutes every day", "Strength training only"]', 1, 'The guideline is 150-300 minutes of moderate-intensity OR 75-150 minutes of vigorous-intensity aerobic activity per week.'),
    (v_case_id, 'In addition to aerobic activity, adults should perform muscle-strengthening activities at least:', '["Once a month", "Twice a week", "Daily", "Never"]', 1, 'Strength training involving all major muscle groups is recommended at least 2 days per week.'),
    (v_case_id, 'True or False: Any amount of physical activity is better than none.', '["True", "False"]', 0, 'Even small increases in activity provide health benefits, especially for highly sedentary individuals.');

    ---------------------------------------------------------------------------
    -- CASE 46: Health Literacy - Teach-Back
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Checking Understanding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Checking Understanding', 'A physician explains the complicated multi-drug regimen for latent TB to a patient with limited English proficiency. The patient nods and says, \"Yes, I understand.\"

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician uses the \"Teach-Back\" method to ensure patient understanding.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which technique is most effective to verify the patient truly understands the instructions?', '["Asking \"Do you have any questions?\"", "Asking \"Do you understand?\"", "Using the \"Teach-Back\" method (asking the patient to explain the plan in their own words)", "Giving them a printed brochure"]', 2, '\"Teach-Back\" is a validated tool to confirm comprehension and is a cornerstone of health literacy.'),
    (v_case_id, 'Low health literacy is associated with:', '["Better medication adherence", "Higher rates of hospitalization and emergency department use", "Lower healthcare costs", "Better preventive care uptake"]', 1, 'Patients who struggle to understand health information have significantly worse outcomes.'),
    (v_case_id, 'True or False: You should use medical jargon (e.g., \"asymptomatic,\" \"prophylaxis\") to make the instructions sound more professional.', '["True", "False"]', 1, 'Plain language (e.g., \"no symptoms,\" \"prevention\") should be used to improve clarity and understanding.');

    ---------------------------------------------------------------------------
    -- CASE 47: Secondary Prevention - Aspirin
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Aspirin Question' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Aspirin Question', 'A 65-year-old healthy man with a 12% ASCVD risk asks if he should start a daily low-dose aspirin to prevent a heart attack. He has no history of GI bleeds.

Vitals: BP 130/80 mmHg.
Physical Examination: Normal.
Laboratory Results: Normal.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old man asks about starting aspirin for primary prevention.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the 2022 USPSTF guidelines, what is the recommendation for starting aspirin in adults age 60 or older for PRIMARY prevention?', '["Recommended for all", "Against starting (Grade C or D depending on risk)", "Only if they smoke", "Only for women"]', 1, 'The 2022 update states there is no net benefit for starting aspirin for primary prevention in those 60+, as the risk of bleeding offsets the cardiovascular benefit.'),
    (v_case_id, 'For adults age 40-59 with a >=10% ASCVD risk, the decision to start aspirin should be:', '["Mandatory", "An individual decision based on the balance of benefits and harms", "Prohibited", "Recommended only for men"]', 1, 'This is a Grade C recommendation; the benefit is small and requires shared decision-making.'),
    (v_case_id, 'True or False: These guidelines apply to patients who have ALREADY had a heart attack or stroke.', '["True", "False"]', 1, 'These guidelines are for PRIMARY prevention. Aspirin remains a standard of care for SECONDARY prevention (patients with established cardiovascular disease).');

    ---------------------------------------------------------------------------
    -- CASE 48: Behavioral Health - Suicide Screening
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Universal Suicide Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Universal Suicide Screening', 'A 20-year-old male presents to the ED with a sprained ankle. As part of the triage process, the nurse asks, \"In the past two weeks, have you felt that you would be better off dead or hurting yourself in some way?\"', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is screened for suicide in the ED regardless of their presenting complaint.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do many hospitals implement universal suicide screening in the ED?', '["To save time", "Because many individuals who complete suicide have visited a healthcare setting (often for a non-psychiatric reason) in the weeks prior", "To increase billing", "It is required by the fire department"]', 1, 'Universal screening (e.g., using the ASQ or PHQ-9) identifies \"hidden\" suicidality in the general patient population.'),
    (v_case_id, 'Does asking a patient about suicide increase the risk that they will attempt it?', '["Yes, it \"plants the seed\"", "No, evidence shows it does not increase suicidal ideation or behavior", "Only in children", "Only if the doctor is nervous"]', 1, 'This is a common myth; asking directly is safe and necessary for identification.'),
    (v_case_id, 'If a patient screens positive, what is the next critical step?', '["Call the police", "Discharge them immediately", "Conduct a formal safety assessment (Plan, Intent, Access to means)", "Give them a sedative"]', 2, 'A positive screen must be followed by a more detailed assessment to determine the level of risk and needed intervention.');

    ---------------------------------------------------------------------------
    -- CASE 49: Cultural Competence - Language Barriers
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Family Interpreter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Family Interpreter', 'A Spanish-speaking patient presents for a preventive exam. Her 10-year-old son, who speaks fluent English, offers to interpret for his mother.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A child offers to interpret for his non-English speaking mother during a medical visit.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate action for the physician?', '["Allow the son to interpret to save time", "Politely decline and use a professional medical interpreter (in-person or via phone/video)", "Try to use \"broken\" Spanish", "Reschedule the appointment"]', 1, 'Using family members (especially children) is prone to errors, breaches of confidentiality, and can create inappropriate family dynamics. Professional interpreters are the standard of care.'),
    (v_case_id, 'The legal requirement for healthcare providers to provide meaningful access to patients with Limited English Proficiency (LEP) is part of:', '["The HIPAA Privacy Rule", "Title VI of the Civil Rights Act", "The Stark Law", "The EMTALA Act"]', 1, 'Federal law requires that recipients of federal financial assistance (like Medicare/Medicaid) provide language services.'),
    (v_case_id, 'True or False: Using a professional interpreter has been shown to reduce medical errors and improve patient satisfaction.', '["True", "False"]', 0, 'Professional interpretation ensures accurate communication of complex medical and preventive information.');

    ---------------------------------------------------------------------------
    -- CASE 50: Public Health Ethics - Resource Allocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Triage in a Crisis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Triage in a Crisis', 'During a severe influenza pandemic, a hospital has 10 ventilators but 15 patients in respiratory failure. They must decide who receives a ventilator.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital must allocate scarce resources (ventilators) during a pandemic.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a \"crisis standards of care\" scenario, the ethical framework shifts from \"patient-centered\" to:', '["Individual autonomy", "Utilitarian (maximizing the greatest good for the greatest number)", "First-come, first-served", "Ability to pay"]', 1, 'Public health ethics during disasters focus on saving the most lives possible with limited resources.'),
    (v_case_id, 'Which factor is typically prioritized in triage protocols for scarce resource allocation?', '["Short-term survival (likelihood of surviving the acute illness)", "Social worth (e.g., how \"important\" the person is)", "Age only", "Wealth"]', 0, 'Most protocols prioritize those most likely to benefit and survive the immediate crisis.'),
    (v_case_id, 'Who should ideally make the final triage decisions in this scenario?', '["The patient''s primary doctor", "An independent Triage Committee or Triage Officer", "The hospital CEO", "The police"]', 1, 'To ensure fairness and reduce moral distress for the bedside team, decisions should be made by an independent group following a pre-established protocol.');

END $$;

COMMIT;
