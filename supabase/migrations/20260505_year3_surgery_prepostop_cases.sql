BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Pre/Post-op & Anesthesia
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pre-post-op-anesthesia' LIMIT 1;

    -- CASE 01: Pre-op Cardiac Risk Assessment
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The High-Risk Cardiac Patient', 'A 72-year-old male with a history of congestive heart failure and a previous stroke is scheduled for an elective ventral hernia repair. He can walk two flights of stairs without chest pain.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most important predictor of peri-operative cardiac risk?', '["Patient age", "Functional capacity (measured in METs)", "History of smoking", "Type of anesthesia"]', 1, 'Functional capacity (the ability to perform activities of daily living or exercise) is a powerful predictor of post-op outcomes. > 4 METs is generally considered low risk.'),
    (v_case_id, 'What is the "Revised Cardiac Risk Index" (RCRI or Lee criteria) used for?', '["To diagnose an MI", "To estimate the risk of major adverse cardiac events (MACE) in non-cardiac surgery", "To determine if the patient needs a pacemaker", "To decide on the type of surgery"]', 1, 'The RCRI uses 6 variables (High-risk surgery, Ischemic heart disease, CHF, CVD, Diabetes on insulin, and Cr > 2.0) to predict risk.'),
    (v_case_id, 'Should this patient undergo routine pre-operative coronary angiography?', '["Yes, always", "No, unless he has unstable symptoms or requires high-risk surgery with poor functional capacity", "Only if he is over 80", "Only if he has a murmur"]', 1, 'Routine prophylactic revascularization is generally not recommended in stable patients before non-cardiac surgery.');

    -- CASE 02: Pre-op Medication Management - Diabetes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diabetes and the NPO Patient', 'A 55-year-old with Type 2 Diabetes is scheduled for surgery tomorrow. He takes Metformin and 20 units of Glargine (long-acting insulin) nightly.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should Metformin be managed before surgery?', '["Continue as usual", "Hold on the day of surgery to avoid lactic acidosis", "Double the dose", "Switch to IV metformin"]', 1, 'Metformin is typically held on the day of surgery and restarted when renal function is confirmed stable.'),
    (v_case_id, 'What is the standard recommendation for long-acting insulin (Glargine) the night before surgery?', '["Hold the entire dose", "Give 50-80% of the usual dose", "Give the full dose plus extra", "Switch to short-acting only"]', 1, 'A reduced dose of basal insulin prevents ketoacidosis while minimizing the risk of fasting hypoglycemia.'),
    (v_case_id, 'What is the target blood glucose range for most surgical patients in the peri-operative period?', '["70 - 100 mg/dL", "140 - 180 mg/dL", "200 - 250 mg/dL", "< 70 mg/dL"]', 1, 'Strict glycemic control (< 110) has been associated with higher mortality due to hypoglycemia; 140-180 is the current target for most.');

    -- CASE 03: Pre-op Medication Management - Anticoagulants
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bridging the Warfarin', 'A 65-year-old with a mechanical mitral valve is on Warfarin. She is undergoing a high-risk surgical procedure.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When should Warfarin typically be stopped before surgery?', '["1 day prior", "3 days prior", "5 days prior", "10 days prior"]', 2, 'It takes approximately 5 days for the INR to normalize after stopping Warfarin.'),
    (v_case_id, 'What is "bridging anticoagulation"?', '["Giving extra Warfarin", "Switching to a short-acting agent (like Heparin or Lovenox) while the Warfarin is wearing off", "Using aspirin instead", "Using a mechanical pump"]', 1, 'Bridging is used in high-thromboembolic-risk patients (e.g., mechanical valves, recent VTE) to minimize the time without anticoagulation.'),
    (v_case_id, 'When should bridging (LMWH) be stopped before the incision?', '["1 hour prior", "12-24 hours prior", "48 hours prior", "It shouldn''t be stopped"]', 1, 'Stopping LMWH 24 hours before surgery ensures the anticoagulant effect has dissipated.');

    -- CASE 04: General Anesthesia - Induction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Going Under', 'A healthy 30-year-old is undergoing general anesthesia. The anesthesiologist administers Propofol, Fentanyl, and Succinylcholine.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these medications is used specifically for muscle relaxation to facilitate intubation?', '["Propofol", "Fentanyl", "Succinylcholine", "Midazolam"]', 2, 'Succinylcholine is a depolarizing neuromuscular blocker.'),
    (v_case_id, 'What is a common side effect of Propofol induction?', '["Hypertension", "Hypotension", "Tachycardia", "Seizures"]', 1, 'Propofol causes significant vasodilation and myocardial depression, leading to a drop in BP.'),
    (v_case_id, 'What is "Rapid Sequence Induction" (RSI) designed to prevent?', '["Pain", "Awareness during surgery", "Aspiration of gastric contents", "High blood pressure"]', 2, 'RSI involves rapid administration of induction and paralytic agents with cricoid pressure to secure the airway quickly in patients at risk for aspiration.');

    -- CASE 05: Neuromuscular Blockade - Succinylcholine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Twitchy Induction', 'Immediately after receiving Succinylcholine, the patient exhibits brief, involuntary muscle twitches across their body.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these muscle twitches called?', '["Seizures", "Fasciculations", "Rigidity", "Tremors"]', 1, 'Depolarizing blockers (Succinylcholine) cause initial stimulation of the nicotinic receptors, leading to fasciculations before the block occurs.'),
    (v_case_id, 'Succinylcholine is contraindicated in which of the following conditions?', '["Asthma", "Hyperkalemia or severe burns/denervation", "Hypertension", "Obesity"]', 1, 'Succinylcholine can cause a significant rise in serum potassium, which can be fatal in patients who are already hyperkalemic or have upregulated receptors.'),
    (v_case_id, 'Which enzyme is responsible for the metabolism of Succinylcholine?', '["Acetylcholinesterase", "Pseudocholinesterase (Butyrylcholinesterase)", "Liver transaminase", "Renal peptidase"]', 1, 'Patients with a genetic deficiency in pseudocholinesterase will have prolonged paralysis after a dose of succinylcholine.');

    -- CASE 06: Neuromuscular Blockade - Non-depolarizing
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Reversing the Block', 'At the end of surgery, the patient is still paralyzed from a dose of Rocuronium. The anesthesiologist administers Neostigmine and Glycopyrrolate.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Neostigmine reverse neuromuscular blockade?', '["It directly blocks the receptors", "It inhibits acetylcholinesterase, increasing the concentration of acetylcholine at the motor endplate", "It degrades the rocuronium", "It increases calcium levels"]', 1, 'Increased ACh competes with the non-depolarizing blocker to restore transmission.'),
    (v_case_id, 'Why is Glycopyrrolate (an anticholinergic) given alongside Neostigmine?', '["To make the patient sleep", "To prevent the systemic muscarinic side effects of Neostigmine (e.g., bradycardia, secretions)", "To increase the muscle strength", "To prevent nausea"]', 1, 'Neostigmine increases ACh everywhere, not just at the muscles; glycopyrrolate blocks the unwanted "SLUDGE" effects at other sites.'),
    (v_case_id, 'What is the name of the newer agent that directly encapsulates and inactivates Rocuronium and Vecuronium?', '["Atropine", "Sugammadex", "Edrophonium", "Physostigmine"]', 1, 'Sugammadex provides rapid and complete reversal without the need for anticholinergics.');

    -- CASE 07: Spinal vs. Epidural Anesthesia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Regional Choice', 'A patient is undergoing a knee replacement. The anesthesiologist discusses placing a needle into the back to provide numbness.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which space is the local anesthetic injected during SPINAL anesthesia?', '["Epidural space", "Subarachnoid space (CSF)", "Subdural space", "Paravertebral space"]', 1, 'Spinal anesthesia involves a direct injection into the CSF.'),
    (v_case_id, 'Where is an EPIDURAL catheter typically placed relative to the dura mater?', '["Inside the dura", "Outside the dura", "In the spinal cord", "In the skin"]', 1, 'The epidural space is outside the dural sac.'),
    (v_case_id, 'Which technique is better suited for providing CONTINUOUS pain relief for several days after surgery?', '["Spinal", "Epidural", "General Anesthesia", "Local infiltration"]', 1, 'A catheter can be left in the epidural space for continuous infusion of meds, whereas a spinal is typically a one-time injection.');

    -- CASE 08: Post-Dural Puncture Headache (PDPH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Headache After the Block', 'A 30-year-old woman developed a severe headache 24 hours after a spinal anesthetic for a C-section. The pain is much worse when she stands up and resolves when she lies flat.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic feature of a PDPH?', '["It is worst at night", "It is positional (better when supine, worse when upright)", "It is associated with a rash", "It involves the jaw"]', 1, 'A "spinal headache" is caused by CSF leakage through the dural puncture site, leading to low intracranial pressure.'),
    (v_case_id, 'What is the definitive treatment for a severe, persistent PDPH?', '["IV Antibiotics", "Epidural Blood Patch", "Repeat Spinal", "Morphine"]', 1, 'An epidural blood patch involves injecting the patient''s own blood into the epidural space to "plug" the hole in the dura.'),
    (v_case_id, 'Which needle characteristic reduces the risk of PDPH?', '["Larger gauge", "Pencil-point (non-cutting) tip", "Shorter length", "Cutting tip"]', 1, 'Pencil-point needles separate the dural fibers rather than cutting them, allowing the hole to close more easily.');

    -- CASE 09: Post-op Pain - Patient Controlled Analgesia (PCA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The PCA Pump', 'A patient is started on a Morphine PCA after abdominal surgery. The settings are: Demand dose 1 mg, Lockout interval 10 minutes, No basal rate.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of the "Lockout interval"?', '["To stop the machine at night", "To prevent the patient from receiving a second dose too quickly, reducing the risk of overdose", "To save medicine", "To allow the nurse to sleep"]', 1, 'The lockout ensures the patient feels the effect of the first dose before being able to trigger another.'),
    (v_case_id, 'Why is a "Basal rate" (continuous background infusion) generally avoided in opioid-naive patients?', '["It doesn''t work", "It significantly increases the risk of respiratory depression", "It is too expensive", "It causes constipation"]', 1, 'Without a basal rate, the patient will only receive medication if they are awake and alert enough to push the button; a basal rate can lead to over-sedation.'),
    (v_case_id, 'What is the most important vital sign to monitor in a patient on a PCA?', '["Blood pressure", "Respiratory rate and sedation level", "Temperature", "Urine output"]', 1, 'Respiratory depression is the most serious side effect of opioids.');

    -- CASE 10: Post-operative Nausea and Vomiting (PONV)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nausea After Anesthesia', 'A 25-year-old non-smoking female is undergoing a laparoscopic procedure. She has a history of motion sickness.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following are the four classic risk factors for PONV in the Apfel score?', '["Age, Weight, Smoking, Diabetes", "Female sex, Non-smoker, History of PONV/Motion sickness, Post-op opioids", "Male sex, Smoker, Age > 60, Hypertension", "Fasting time, Surgery length, Type of IV fluid, Use of ASA"]', 1, 'These four factors are highly predictive of PONV risk.'),
    (v_case_id, 'Which type of surgery is particularly associated with a high rate of PONV?', '["Hernia repair", "Laparoscopic surgery", "Spinal surgery", "Skin grafting"]', 1, 'Laparoscopic procedures (due to CO2 insufflation) and strabismus surgery are high risk.'),
    (v_case_id, 'Which medication is a 5-HT3 receptor antagonist commonly used for PONV prophylaxis?', '["Metoclopramide", "Ondansetron (Zofran)", "Prochlorperazine", "Dexamethasone"]', 1, 'Ondansetron is a first-line agent for PONV.');

    -- CASE 11: Post-op Urinary Retention
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unable to Void', 'A 65-year-old male is 8 hours post-inguinal hernia repair. He feels a strong urge to urinate but cannot. His bladder is palpable and tender.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of acute urinary retention after pelvic or groin surgery?', '["Kidney failure", "Bladder detrusor dysfunction due to anesthesia and surgical trauma", "Urethral stricture", "Dehydration"]', 1, 'Anesthesia, narcotics, and local trauma/pain all contribute to post-op retention.'),
    (v_case_id, 'What is the immediate management for this patient?', '["Give IV fluids", "Perform a bladder scan and in-and-out catheterization", "Give a diuretic", "Wait another 4 hours"]', 1, 'Relieving the acute distension is necessary to prevent bladder injury and pain.'),
    (v_case_id, 'Which type of anesthesia is most strongly associated with post-op urinary retention?', '["General Anesthesia", "Spinal/Epidural Anesthesia", "MAC", "Local only"]', 1, 'Neuraxial blocks are a major risk factor as they block the autonomic nerves to the bladder.');

    -- CASE 12: Post-op Ileus vs. Obstruction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'No Bowel Sounds', 'A patient is POD 3 after a major abdominal case. He has abdominal distension and has not passed flatus. X-ray shows dilated loops of both small and large bowel.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mechanical Small Bowel Obstruction", "Post-operative Ileus", "Volvulus", "Intussusception"]', 1, 'Ileus is a functional lack of peristalsis involving the entire GI tract, common after abdominal surgery.'),
    (v_case_id, 'How do you distinguish ileus from mechanical obstruction on imaging?', '["Ileus: Dilated small and large bowel; Obstruction: Dilated proximal to a transition point, collapsed distal", "Ileus has air-fluid levels", "Obstruction has no gas in the rectum", "They look the same"]', 0, 'The presence of gas in the colon and rectum and a lack of a transition point suggest ileus.'),
    (v_case_id, 'What is the most important factor in promoting the return of bowel function?', '["IV fluids", "Early mobilization (walking) and early enteral intake (ERAS)", "Laxatives", "Opioids"]', 1, 'Early walking and minimizing opioids are key components of reducing ileus duration.');

    -- CASE 13: Pulmonary Embolism - Post-op
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Dyspnea on POD 5', 'A 60-year-old patient who had a total hip replacement 5 days ago suddenly develops shortness of breath and chest pain while walking.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Myocardial infarction", "Pneumonia", "Pulmonary Embolism (PE)", "Atelectasis"]', 2, 'Sudden dyspnea in a post-op orthopedic patient is PE until proven otherwise.'),
    (v_case_id, 'What is the gold standard imaging test for diagnosing PE?', '["CXR", "CT Pulmonary Angiography (CTPA)", "D-dimer", "Echocardiogram"]', 1, 'CTPA is the most accurate and commonly used test.'),
    (v_case_id, 'What is the "triad" of factors that predispose to thrombosis (Virchow''s Triad)?', '["Fever, Pain, Swelling", "Stasis, Hypercoagulability, Endothelial Injury", "Obesity, Age, Smoking", "Tachycardia, Hypotension, Hypoxia"]', 1, 'Surgery involves all three: stasis from bedrest, injury from the incision, and hypercoagulability from the stress response.');

    -- CASE 14: Post-operative Delirium
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Disoriented Elder', 'An 80-year-old male becomes agitated and starts pulling at his IV lines at 2:00 AM on POD 1.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Early dementia", "Post-operative delirium", "Stroke", "Psychosis"]', 1, 'Delirium is an acute, fluctuating state of confusion common in elderly post-op patients.'),
    (v_case_id, 'What is the best way to PREVENT post-op delirium?', '["Give sedative-hypnotics (Benadryl/Ambien)", "Frequent reorientation, early mobilization, and maintaining sleep-wake cycles", "Physical restraints", "High-dose narcotics"]', 1, 'Non-pharmacological bundles are the most effective way to prevent delirium.'),
    (v_case_id, 'Before assuming the delirium is behavioral, what medical cause must you rule out?', '["Hunger", "Hypoxia, infection (UTI), or electrolyte imbalance", "Depression", "Boredom"]', 1, 'Delirium is often a symptom of an underlying medical problem or organ dysfunction.');

    -- CASE 15: PACU Discharge - Aldrete Score
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ready for the Floor?', 'A patient in the Post-Anesthesia Care Unit (PACU) is awake, breathing deeply, and can move all four extremities. His oxygen saturation is 96% on room air.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What scoring system is used to determine if a patient is ready for discharge from the PACU?', '["Glasgow Coma Scale", "Aldrete Score", "Apgar Score", "Child-Pugh Score"]', 1, 'The Aldrete score evaluates Activity, Respiration, Circulation, Consciousness, and Oxygen saturation.'),
    (v_case_id, 'What is the minimum score typically required for discharge?', '["5", "9", "12", "15"]', 1, 'A score of 9 or 10 is usually required.'),
    (v_case_id, 'A patient who is \"unresponsive\" and has \"labored breathing\" would have an Aldrete score of approximately:', '["0-2", "5", "8", "10"]', 0, 'Low scores in multiple categories would preclude discharge.');

    -- CASE 16: Informed Consent
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Signing the Paperwork', 'A surgeon is discussing a planned cholecystectomy with a patient. He explains the procedure, the risks (bleeding, infection, bile duct injury), and the alternatives.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three essential components of informed consent?', '["Information, Capacity, and Voluntariness", "Signature, Date, and Witness", "Success rate, Cost, and Surgeon experience", "Pre-op, Intra-op, and Post-op plans"]', 0, 'The patient must have the information, the capacity to understand it, and make the choice without coercion.'),
    (v_case_id, 'If a patient is unconscious and has a life-threatening emergency with no available family, how is consent handled?', '["The surgery must wait", "Implied consent (emergency privilege)", "A court order is needed", "The hospital CEO signs"]', 1, 'In true emergencies, consent is implied to preserve life or limb.'),
    (v_case_id, 'Whose responsibility is it to obtain informed consent for the surgery?', '["The nurse", "The surgical resident", "The attending surgeon", "The medical student"]', 2, 'The person performing the procedure is legally and ethically responsible for the consent process.');

    -- CASE 17: Advance Directives in the OR
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The DNR Patient and Surgery', 'A patient with terminal cancer but a DNR (Do Not Resuscitate) order requires surgery for an acute bowel obstruction to relieve pain.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What happens to a DNR order when a patient enters the operating room?', '["It is automatically canceled", "It is usually \"suspended\" or modified after a discussion with the patient (required re-evaluation)", "It must be followed strictly, even if the heart stops due to anesthesia", "It doesn''t apply in the OR"]', 1, 'Standard policy requires a specific discussion about what measures (e.g., intubation, vasopressors, shocks) are acceptable in the peri-operative period.'),
    (v_case_id, 'Why is a strict "No Intubation" DNR difficult to follow during general anesthesia?', '["It isn''t", "General anesthesia often requires intubation to maintain the airway; the patient must agree to temporary suspension for the procedure", "The machine won''t work", "It is illegal"]', 1, 'Anesthesia itself causes respiratory arrest, making the distinction between "resuscitation" and "anesthesia" blurry.'),
    (v_case_id, 'A legal document that designates a specific person to make medical decisions if the patient becomes incapacitated is called:', '["A Living Will", "A Durable Power of Attorney for Healthcare (Healthcare Proxy)", "A DNR order", "A HIPAA waiver"]', 1, 'The proxy or surrogate is the person who makes the decisions.');

    -- CASE 18: Malnutrition and Wound Healing
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Frail Patient', 'A 75-year-old male with esophageal cancer has lost 25% of his body weight. His Albumin is 2.5 g/dL and Pre-albumin is 10 mg/dL.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is Albumin often a POOR marker for acute nutritional status?', '["It is too expensive", "It has a long half-life (20 days) and is an \"inverse\" acute phase reactant (falls during stress)", "It is only made in the kidney", "It doesn''t relate to protein"]', 1, 'Albumin stays low for a long time even after nutrition improves; Pre-albumin (half-life 2 days) is better for monitoring response to therapy.'),
    (v_case_id, 'Severe malnutrition increases the risk of which post-op complication?', '["Wound dehiscence and infection", "DVT", "Stroke", "Malignant hyperthermia"]', 0, 'Protein and energy are essential for collagen synthesis and immune function.'),
    (v_case_id, 'If surgery can be delayed, what is the recommended period of pre-operative nutritional support for a severely malnourished patient?', '["1 day", "3 days", "7 - 10 days", "1 month"]', 2, 'About a week of support is usually needed to significantly improve outcomes.');

    -- CASE 19: Enhancing Recovery After Surgery (ERAS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Modern Surgical Protocol', 'A patient is scheduled for a colectomy using an ERAS protocol. He is encouraged to drink clear liquids until 2 hours before surgery.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of ERAS?', '["To save money", "To reduce the stress response to surgery and accelerate recovery", "To use more opioids", "To keep patients in the hospital longer"]', 1, 'ERAS is a multimodal approach involving pre-, intra-, and post-op interventions.'),
    (v_case_id, 'Which of the following is a component of an ERAS protocol?', '["Strict \"NPO after midnight\" for all patients", "Aggressive intra-operative fluid loading", "Opioid-sparing (multimodal) analgesia and early feeding", "Prolonged bedrest"]', 2, 'Avoiding opioids reduces ileus, and early feeding maintains gut integrity.'),
    (v_case_id, 'Why is a carbohydrate-rich drink given 2 hours before surgery in ERAS?', '["To make the patient happy", "To reduce insulin resistance and the catabolic state after surgery", "To prevent nausea", "To increase blood pressure"]', 1, 'Being in a "fed" state rather than a "fasted" state improves the metabolic response to stress.');

    -- CASE 20: Post-op Fever - "Water" (UTI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever on POD 3', 'A patient who had a foley catheter for 3 days after a prostatectomy develops a fever of 101.5°F on post-op day 3.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of the fever ("Water")?', '["Pneumonia", "Urinary Tract Infection (UTI)", "DVT", "Wound infection"]', 1, 'UTI is the classic cause of fever around POD 3, especially if a catheter was used.'),
    (v_case_id, 'What is the most important intervention to PREVENT post-op UTIs?', '["Give prophylactic antibiotics", "Remove the urinary catheter as early as possible", "Flush the bladder with saline", "Increase fluid intake"]', 1, 'Catheter duration is the #1 risk factor for CAUTI (Catheter-Associated UTI).'),
    (v_case_id, 'Urinalysis showing nitrites and leukocyte esterase is suggestive of:', '["Dehydration", "Bacterial infection", "Kidney failure", "Normal recovery"]', 1, 'These are standard markers for UTI on a dipstick.');

    -- CASE 21: Epidural Analgesia Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weakness After Epidural', 'A patient with an epidural catheter for post-op pain develops sudden-onset weakness in both legs and loss of sensation below the waist.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared complication that must be ruled out immediately?', '["The catheter fell out", "Epidural Hematoma or Abscess", "Normal effect of the medicine", "Nerve damage from the surgery"]', 1, 'An epidural hematoma is a surgical emergency that can cause permanent paralysis if not decompressed.'),
    (v_case_id, 'What imaging test is needed for a suspected epidural hematoma?', '["CXR", "MRI of the Spine", "Ultrasound", "CT head"]', 1, 'MRI is the gold standard for visualizing the spinal cord and any collections around it.'),
    (v_case_id, 'Besides weakness, what other symptom is concerning for an epidural hematoma?', '["Fever", "Severe, localized back pain", "Nausea", "Headache"]', 1, 'Back pain is often the first symptom.');

    -- CASE 22: PONV Risk and Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The High-Risk PONV Patient', 'A 30-year-old woman is scheduled for surgery. She is a non-smoker, has a history of severe motion sickness, and will require post-op morphine.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is her Apfel score (estimated risk of PONV)?', '["1 (10%)", "2 (20%)", "3 (60%)", "4 (80%)"]', 3, 'Female (1), Non-smoker (1), History (1), Opioids (1) = 4 points. The risk is approximately 80% if no prophylaxis is given.'),
    (v_case_id, 'For a high-risk patient, how many anti-emetic agents should be given for prophylaxis?', '["None", "One", "Two or more (multimodal)", "Only if she vomits"]', 2, 'Combining agents from different classes (e.g., Ondansetron + Dexamethasone) is more effective.'),
    (v_case_id, 'Which anesthetic agent is associated with a LOWER risk of PONV?', '["Nitrous Oxide", "Isoflurane", "Propofol (used for maintenance/TIVA)", "Sevoflurane"]', 2, 'Propofol has intrinsic anti-emetic properties; Total Intravenous Anesthesia (TIVA) with propofol reduces PONV.');

    -- CASE 23: DVT Prophylaxis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Preventing the Clot', 'A 50-year-old male is undergoing a 4-hour abdominal procedure for cancer. He has no history of bleeding.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard DVT prophylaxis for this high-risk patient?', '["Early walking only", "Sequential Compression Devices (SCDs) + Pharmacological prophylaxis (LMWH or Heparin)", "Aspirin only", "IVC filter"]', 1, 'Major abdominal surgery for cancer requires both mechanical and pharmacological prophylaxis.'),
    (v_case_id, 'When should mechanical prophylaxis (SCDs) be started?', '["After the patient wakes up", "Before induction of anesthesia", "Only if the surgery lasts > 6 hours", "At discharge"]', 1, 'SCDs should be placed and started before anesthesia induction, as stasis begins immediately.'),
    (v_case_id, 'Why is LMWH (Lovenox) often preferred over Unfractionated Heparin for DVT prophylaxis?', '["It is cheaper", "Once-daily dosing and a more predictable response", "It doesn''t cause bleeding", "It works faster"]', 1, 'LMWH has better bioavailability and a longer half-life.');

    -- CASE 24: Post-op Ileus - Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Persistent Ileus', 'On POD 5, a patient still hasn''t had a bowel movement and is vomiting. He has been on a Morphine PCA.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of "prolonged" post-op ileus?', '["Antibiotics", "Opioid medications", "Anesthesia", "Lack of vitamins"]', 1, 'Opioids inhibit GI motility by binding to mu-receptors in the gut.'),
    (v_case_id, 'What is the first step in managing significant vomiting from an ileus?', '["Give a laxative", "Insert a Nasogastric (NG) tube for decompression", "Increase IV fluids", "Perform a CT scan"]', 1, 'NG decompression relieves distension and prevents aspiration.'),
    (v_case_id, 'Which electrolyte abnormality can worsen an ileus?', '["Hypercalcemia", "Hypokalemia", "Hyponatremia", "Hyperchloremia"]', 1, 'Low potassium (and low magnesium) impairs smooth muscle contraction in the gut.');

    -- CASE 25: Airway Complications - Laryngospasm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Trouble at Extubation', 'Immediately after the breathing tube is removed at the end of surgery, the patient begins making a high-pitched "crowing" sound (stridor) and is struggling to breathe.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumothorax", "Laryngospasm", "Bronchospasm", "Heart failure"]', 1, 'Laryngospasm is a forceful involuntary closure of the vocal cords, common during "light" anesthesia or emergence.'),
    (v_case_id, 'What is the first-line management for laryngospasm?', '["Immediate re-intubation", "100% Oxygen with Positive Pressure ventilation (CPAP)", "Give Albuterol", "Chest compressions"]', 1, 'Applying positive pressure can often "break" the spasm.'),
    (v_case_id, 'If initial maneuvers fail, what medication can be given to rapidly relax the vocal cords?', '["Atropine", "A small dose of Succinylcholine", "Fentanyl", "Epinephrine"]', 1, 'A small dose of a paralytic will relax the laryngeal muscles and allow ventilation.');

    -- CASE 26: Post-op Myocardial Infarction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Silent MI', 'A 75-year-old with diabetes is on POD 2. He is not complaining of pain but is noted to be slightly more tachycardic and tachypneic. An EKG shows new T-wave inversions.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are post-op MIs often "silent" (painless)?', '["They are too small to feel", "Residual effects of anesthesia and post-op analgesia mask the chest pain", "Surgical patients don''t get pain", "Diabetes causes it"]', 1, 'Pain management and anesthesia can hide the typical anginal symptoms.'),
    (v_case_id, 'What is the most common timeframe for a post-op MI to occur?', '["During surgery", "POD 1 - POD 3", "POD 10", "Immediately upon waking"]', 1, 'The greatest risk is in the first 72 hours as fluids shift and the stress response is maximal.'),
    (v_case_id, 'What lab test is most specific for diagnosing a peri-operative MI?', '["Troponin", "CK-MB", "LDH", "AST"]', 0, 'Troponin is the gold standard; however, small elevations can occur in renal failure or sepsis without a true MI.');

    -- CASE 27: Discharge Criteria - Post-op Day 0
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Going Home the Same Day', 'A patient is scheduled for an ambulatory (day) surgery procedure. Before going home, he must meet several criteria.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is NOT a standard requirement for discharge after day surgery?', '["Stable vital signs", "Able to tolerate oral fluids", "Has passed a bowel movement", "Has a responsible adult to drive them home"]', 2, 'Passing a BM is not required for day surgery, but voiding (in some cases) and tolerating fluids are.'),
    (v_case_id, 'Why is a "responsible adult" required for transport?', '["The hospital doesn''t like taxis", "Residual effects of anesthesia impair judgment and driving ability for 24 hours", "To pay the bill", "To sign more papers"]', 1, 'Patients are legally and medically considered impaired for 24 hours after sedation or general anesthesia.'),
    (v_case_id, 'What is the standard "NPO" (nothing by mouth) rule for SOLID FOOD before surgery?', '["2 hours", "4 hours", "6 - 8 hours", "24 hours"]', 2, 'The ASA recommends 6 hours for a light meal and 8 hours for a heavy/fatty meal.');

    -- CASE 28: Stress Ulcer Prophylaxis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Preventing GI Bleeding', 'A patient is in the Surgical ICU after a major burn and is on a ventilator.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two major risk factors that mandate stress ulcer prophylaxis in surgical/ICU patients?', '["Diabetes and Obesity", "Mechanical ventilation (> 48h) and Coagulopathy", "Age and Smoking", "History of GERD"]', 1, 'Patients with these factors are at high risk for "stress-induced" gastric erosions and bleeding.'),
    (v_case_id, 'What is a "Curling''s Ulcer"?', '["A stress ulcer associated with severe burns", "A stress ulcer associated with head trauma", "A peptic ulcer from H. pylori", "A cancerous ulcer"]', 0, 'Curling = Burns. (Cushing = Head trauma).'),
    (v_case_id, 'Which class of medications is commonly used for this prophylaxis but may increase the risk of hospital-acquired pneumonia?', '["NSAIDs", "Proton Pump Inhibitors (PPIs) or H2-blockers", "Antibiotics", "Steroids"]', 1, 'Raising gastric pH can allow bacterial overgrowth in the stomach, which can be aspirated into the lungs.');

    -- CASE 29: Post-op Pneumonia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cough and Fever on POD 4', 'A 70-year-old male who had an upper abdominal incision develops a productive cough and fever on POD 4. His breath sounds are decreased at the right base.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do upper abdominal and thoracic incisions increase the risk of post-op pneumonia?', '["The surgeon touched the lungs", "Pain causes shallow breathing (splinting) and a poor cough, leading to atelectasis and infection", "The anesthesia was too long", "Because of the foley catheter"]', 1, 'Splinting is a major risk factor for pulmonary complications.'),
    (v_case_id, 'What device is used to encourage deep breathing and prevent atelectasis?', '["Pulse oximeter", "Incentive Spirometer", "Ventilator", "Oxygen mask"]', 1, 'Incentive spirometry provides visual feedback to the patient to take slow, deep breaths.'),
    (v_case_id, 'In a patient on a ventilator, what is the best way to prevent Ventilator-Associated Pneumonia (VAP)?', '["Oral hygiene and keeping the head of the bed elevated (30-45 degrees)", "Regular antibiotics", "Lying completely flat", "Daily CXR"]', 0, 'Elevation of the head reduces the micro-aspiration of gastric/oral contents.');

    -- CASE 30: Fluid Overload (TACO)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Too Much Fluid', 'An 80-year-old woman with pre-existing heart failure receives 3 liters of saline in the OR during a procedure. In the recovery room, she is gasping for air and her O2 sat is 85%.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Transfusion-Associated Circulatory Overload (TACO)", "PE", "Anaphylaxis"]', 1, 'TACO is hydrostatic pulmonary edema due to excessive fluid administration, especially in those with poor cardiac reserve.'),
    (v_case_id, 'What is the first-line treatment for TACO?', '["Give more fluids", "Diuretics (Furosemide) and supplemental oxygen", "Antibiotics", "Vasopressors"]', 1, 'Removing the excess fluid is necessary to clear the pulmonary edema.'),
    (v_case_id, 'How do you differentiate TACO from TRALI?', '["TACO has a high CVP and responds to diuretics; TRALI has a low/normal CVP", "TRALI is always immediate", "TACO only happens with blood", "There is no difference"]', 0, 'CVP (central venous pressure) reflects the volume status; it is high in overload (TACO) and low/normal in inflammatory edema (TRALI).');

    RAISE NOTICE 'SUCCESS: Pre/Post-op & Anesthesia Case Blocks (1-30) registered.';
END $$;

COMMIT;
