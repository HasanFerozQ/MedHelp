-- Migration: Year 3 - Cardiology BCQ Bank (Clinical Cases 1-50)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiology' LIMIT 1;

    -- CASE 1: ACUTE MI
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Onset Chest Pain', 'A 58-year-old male with a history of hypertension and smoking presents to the ER with 2 hours of crushing substernal chest pain radiating to his left jaw. He is diaphoretic and nauseated. Physical exam shows a BP of 150/90 mmHg and HR of 95 bpm. ECG reveals 3mm ST-elevation in leads V1-V4.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the BEST immediate pharmacological intervention to reduce mortality in this patient?', '["Intravenous Morphine", "Sublingual Nitroglycerin", "Oral Aspirin (325 mg chewed)", "Intravenous Heparin"]', 2, 'While all may be given, chewed aspirin is the single best immediate intervention proven to reduce mortality in ACS. Morphine and Nitro provide symptom relief but no survival benefit. (Harrison''s Ch. 269)'),
    (v_case_id, 'If the nearest PCI-capable hospital is 3 hours away, what is the BEST reperfusion strategy?', '["Wait for transfer to PCI center", "Immediate fibrinolysis with Alteplase", "Urgent CABG", "Intravenous Beta-blockers"]', 1, 'In STEMI, the goal is "time to device" < 90-120 mins. If transfer time exceeds this, fibrinolysis becomes the superior choice to minimize infarct size. (Step-Up to Medicine)');

    -- CASE 2: HEART FAILURE
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Shortness of Breath', 'A 72-year-old female with known HFrEF (EF 30%) presents with worsening dyspnea and orthopnea over the past 3 days. She has bilateral pitting edema to the knees and crackles at the lung bases. BP is 110/70 mmHg, HR 105 bpm. JVP is 12 cm H2O.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the BEST next step in the management of her acute symptoms?', '["Start Metoprolol", "Intravenous Furosemide", "Increase oral Lisinopril", "Start Spironolactone"]', 1, 'In acute decompensated heart failure with volume overload, IV loop diuretics are the best next step. Beta-blockers should not be started or increased during acute congestion. (Pocket Medicine)'),
    (v_case_id, 'After her symptoms stabilize, which medication class would be the BEST choice to add to reduce long-term mortality and remodeling?', '["Digoxin", "SGLT2 Inhibitor (e.g. Empagliflozin)", "Diltiazem", "Clonidine"]', 1, 'SGLT2 inhibitors are now part of the "Four Pillars" of HFrEF therapy (along with ARNI, Beta-blocker, and MRA) due to strong mortality benefits. (Harrison''s Ch. 272)');

    -- CASE 3: ATRIAL FIBRILLATION
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Palpitations and Fatigue', 'A 68-year-old male with diabetes and a history of a TIA presents with heart palpitations. ECG shows an irregularly irregular rhythm without P waves at a rate of 140 bpm. BP is 135/85 mmHg.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST initial goal for this patient in the ER?', '["Immediate DC cardioversion", "Rate control with Metoprolol or Diltiazem", "Rhythm control with Amiodarone", "Immediate initiation of Warfarin"]', 1, 'As the patient is hemodynamically stable, rate control is the preferred first step over rhythm control. (Harrison''s Ch. 263)'),
    (v_case_id, 'Based on his CHADS2-VASc score (Age 65+, DM, TIA history), what is the BEST long-term stroke prevention strategy?', '["Aspirin 81 mg", "Aspirin 325 mg", "Apixaban (DOAC)", "Dual antiplatelet therapy"]', 2, 'With a score of 4 (1 for age, 1 for DM, 2 for TIA), anticoagulation is mandatory. DOACs like Apixaban are now generally preferred over Warfarin unless a mechanical valve is present. (Pocket Medicine)');

    -- CASE 4: AORTIC STENOSIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Syncope during Exercise', 'A 75-year-old male faints while walking his dog. He reports occasional chest pressure on exertion. Physical exam reveals a harsh crescendo-decrescendo systolic murmur at the right upper sternal border and a weak, delayed carotid pulse.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST diagnostic test to confirm the severity of the suspected valvular lesion?', '["Chest X-ray", "12-lead ECG", "Transthoracic Echocardiogram", "Exercise Stress Test"]', 2, 'Echo is the best test to visualize the aortic valve and measure the pressure gradient/valve area. Stress tests are contraindicated in symptomatic severe AS. (Step-Up to Medicine)'),
    (v_case_id, 'If severe aortic stenosis is confirmed (Area < 1.0 cm2), what is the BEST definitive treatment?', '["Long-term Beta-blockers", "Balloon Valvuloplasty", "Aortic Valve Replacement (Surgical or TAVR)", "Aggressive BP control"]', 2, 'Medical therapy does not improve survival in severe symptomatic AS. Valve replacement is the only definitive treatment. (Harrison''s Ch. 273)');

    -- CASE 5: INFECTIVE ENDOCARDITIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Fever and a New Murmur', 'A 32-year-old female with a history of IV drug use presents with a fever of 102°F and chills for 4 days. On exam, she has a new holosystolic murmur at the left lower sternal border and small, painless red spots on her palms.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST next step to establish a diagnosis in this patient?', '["Obtain three sets of blood cultures", "Order a Chest X-ray", "Start empiric Vancomycin immediately", "Perform an EKG"]', 0, 'Blood cultures are the most critical first step for the Modified Duke Criteria. They must be drawn before starting antibiotics if the patient is stable. (Harrison''s Ch. 129)'),
    (v_case_id, 'Which valve is the BEST fit for the murmur described (holosystolic, left lower sternal border, IVDU)?', '["Mitral Valve", "Aortic Valve", "Tricuspid Valve", "Pulmonary Valve"]', 2, 'In IVDU, right-sided endocarditis (Tricuspid) is most common. Janeway lesions (painless spots) are also characteristic. (Pocket Medicine)');

    -- CASE 6: AORTIC DISSECTION
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Severe Back Pain', 'A 60-year-old male with poorly controlled hypertension presents with "tearing" pain between his shoulder blades. BP is 210/110 mmHg in the right arm and 180/90 mmHg in the left arm.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST imaging modality to quickly confirm the diagnosis of aortic dissection in the ER?', '["CT Angiography of the Chest", "Transesophageal Echocardiogram (TEE)", "A and B are both excellent options", "Chest X-ray"]', 2, 'Both CTA and TEE are highly sensitive and specific. CTA is often faster in the ER setting. (Harrison''s Ch. 281)'),
    (v_case_id, 'Which of the following is the BEST initial medical management to reduce shear stress on the aorta?', '["Intravenous Hydralazine", "Intravenous Esmolol", "Intravenous Nitroglycerin", "Oral Lisinopril"]', 1, 'Beta-blockers (Esmolol/Labetalol) are the best choice to reduce heart rate and dP/dt before vasodilators are added. (Pocket Medicine)');

    -- CASE 7: CARDIAC TAMPONADE
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hypotension and Distended Veins', 'A patient 2 days after heart surgery becomes suddenly hypotensive. On exam, the heart sounds are faint, and the JVP is elevated. ECG shows low voltage and electrical alternans.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the BEST clinical sign to check for on physical exam?', '["Kussmaul sign", "Pulsus paradoxus", "Widened pulse pressure", "Murmur of AR"]', 1, 'A drop in SBP > 10 mmHg on inspiration (Pulsus paradoxus) is a hallmark of tamponade. (Harrison''s Ch. 275)'),
    (v_case_id, 'What is the BEST immediate treatment for this patient?', '["Intravenous Bolus of Normal Saline", "Emergent Pericardiocentesis", "Furosemide", "Synchronized Cardioversion"]', 1, 'Removing even a small amount of fluid can be life-saving. Saline can be a temporary bridge but pericardiocentesis is definitive. (Step-Up to Medicine)');

    -- CASE 8: PERICARDITIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Positional Chest Pain', 'A 24-year-old male presents with sharp chest pain that is worse when lying flat and better when leaning forward. He had a viral "cold" last week. ECG shows diffuse concave ST elevation.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST first-line treatment for this patient?', '["Aspirin or NSAIDs + Colchicine", "High-dose Prednisone", "Heparin", "Alteplase"]', 0, 'NSAIDs plus Colchicine are the best first-line therapy to resolve inflammation and prevent recurrence. (Harrison''s Ch. 275)'),
    (v_case_id, 'Which of the following is the BEST description of the expected physical exam finding?', '["Holosystolic murmur", "Three-phase pericardial friction rub", "Opening snap", "S3 gallop"]', 1, 'A scratchy friction rub is most audible at the left sternal border with the patient leaning forward. (Pocket Medicine)');

    -- CASE 9: PERIPHERAL ARTERY DISEASE
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pain in Calves', 'A 65-year-old smoker reports cramping pain in both calves that occurs after walking one block and resolves with 5 minutes of rest. He has no pain at rest.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST initial non-invasive test to diagnose PAD?', '["Duplex Ultrasound", "Ankle-Brachial Index (ABI)", "CT Angio", "MRA"]', 1, 'ABI is the best initial screening and diagnostic tool for PAD. (Harrison''s Ch. 282)'),
    (v_case_id, 'Which of the following is the BEST recommendation for improving his walking distance?', '["Complete bed rest", "Structured supervised exercise program", "Oral Warfarin", "Verapamil"]', 1, 'Supervised walking programs are the best initial therapy for claudication symptoms. (Step-Up to Medicine)');

    -- CASE 10: HYPERTENSIVE EMERGENCY
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Headache and Blurred Vision', 'A 50-year-old male with a history of missed appointments presents with a severe headache and blurred vision. His BP is 220/130 mmHg. Fundoscopy shows papilledema.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST classification for this patient''s condition?', '["Hypertensive Urgency", "Hypertensive Emergency", "Stage 2 Hypertension", "Primary Hyperaldosteronism"]', 1, 'The presence of end-organ damage (papilledema, encephalopathy) makes this an emergency, not just urgency. (Harrison''s Ch. 280)'),
    (v_case_id, 'What is the BEST goal for blood pressure reduction in the first hour?', '["Lower BP to <120/80 immediately", "Reduce Mean Arterial Pressure (MAP) by no more than 25%", "Reduce SBP to <140", "Switch to oral Amlodipine immediately"]', 1, 'Rapidly lowering BP to normal can cause cerebral ischemia. The best approach is a controlled 20-25% reduction in MAP. (Pocket Medicine)');

    -- ... Adding more cases to reach 50 questions (25 cases x 2) ...

    -- CASE 11: HYPERTROPHIC CARDIOMYOPATHY
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Young Athlete Screening', 'A 19-year-old college basketball player comes for a physical. His older brother died suddenly at age 22. On exam, he has a systolic murmur that increases with standing and decreases with squatting.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST initial diagnostic test for this patient?', '["EKG", "Transthoracic Echocardiogram", "Cardiac Catheterization", "Stress EKG"]', 1, 'Echo is the best way to visualize asymmetrical septal hypertrophy and dynamic obstruction. (Harrison''s Ch. 274)'),
    (v_case_id, 'Which of the following is the BEST pharmacological choice to manage his symptoms?', '["Digoxin", "Metoprolol", "Lisinopril", "Furosemide"]', 1, 'Beta-blockers are the best first-line choice as they slow the heart rate and increase diastolic filling time, reducing obstruction. (Pocket Medicine)');

    -- CASE 12: PULMONARY EMBOLISM (CARDIAC IMPACT)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Post-Op Dyspnea', 'A 60-year-old male 3 days after hip surgery develops sudden shortness of breath and pleuritic chest pain. He is tachycardic (120 bpm) and tachypneic. ECG shows S1Q3T3 pattern.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST next step to confirm the diagnosis?', '["D-dimer", "CT Pulmonary Angiogram", "V/Q Scan", "Venous Doppler of legs"]', 1, 'In a patient with high clinical suspicion (Well''s score), CTA is the best gold-standard diagnostic tool. (Step-Up to Medicine)'),
    (v_case_id, 'If the patient becomes hypotensive (BP 80/40), what is the BEST next management step?', '["Start Heparin", "Systemic Thrombolysis (e.g. Alteplase)", "IV Fluids only", "Wait for repeat CTA"]', 1, 'Massive PE with hemodynamic instability is an indication for thrombolysis. (Harrison''s Ch. 283)');

    -- CASE 13: BRADYCARDIA
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Dizziness and Slow Pulse', 'An 80-year-old male presents with lightheadedness. His pulse is 35 bpm and regular. ECG shows P waves and QRS complexes that are completely independent of each other.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST interpretation of this ECG?', '["First-degree AV block", "Mobitz Type II", "Third-degree (Complete) AV block", "Sinus Bradycardia"]', 2, 'AV dissociation is the hallmark of 3rd-degree block. (Harrison''s Ch. 263)'),
    (v_case_id, 'What is the BEST definitive treatment for this patient?', '["Atropine", "Permanent Pacemaker", "Observation", "Caffeine"]', 1, '3rd-degree block in an elderly patient requires a permanent pacemaker to prevent syncope or sudden death. (Pocket Medicine)');

    -- CASE 14: MITRAL STENOSIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pregnancy and Dyspnea', 'A 28-year-old female in her second trimester of pregnancy presents with new-onset shortness of breath and palpitations. She grew up in a developing country and remembers having severe joint pains as a child.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which valvular lesion is the BEST fit for her history?', '["Aortic Regurgitation", "Mitral Stenosis", "MVP", "Tricuspid Atresia"]', 1, 'Rheumatic heart disease often manifests as Mitral Stenosis, which can be unmasked by the increased blood volume of pregnancy. (Harrison''s Ch. 273)'),
    (v_case_id, 'If she develops Atrial Fibrillation, what is the BEST management for her stroke risk?', '["Aspirin", "Apixaban", "Warfarin", "LMWH (if in first trimester)"]', 2, 'In rheumatic MS with AFib, Warfarin is traditionally the best choice, though LMWH is used during specific periods of pregnancy to avoid teratogenicity. (Pocket Medicine)');

    -- CASE 15: WPW SYNDROME
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Tachycardia in a Young Adult', 'A 22-year-old male presents with rapid palpitations. ECG shows a narrow-complex tachycardia at 190 bpm. After vagal maneuvers, the rhythm converts, and the baseline ECG shows a short PR and a slurred upstroke of the QRS.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST name for the slurred upstroke seen on his ECG?', '["J wave", "U wave", "Delta wave", "Osborne wave"]', 2, 'The Delta wave is caused by early ventricular activation via an accessory pathway. (Harrison''s Ch. 263)'),
    (v_case_id, 'What is the BEST definitive treatment to prevent future episodes of tachycardia?', '["Long-term Digoxin", "Radiofrequency Catheter Ablation", "Amiodarone", "Daily Metoprolol"]', 1, 'Ablation of the accessory pathway is the best definitive cure for WPW. (Step-Up to Medicine)');

    -- CASE 16: STABLE ANGINA
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chest Pain on Exertion', 'A 62-year-old male with diabetes reports chest heaviness that occurs when walking uphill and goes away after 2 minutes of rest. He has no pain at rest.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST initial diagnostic test for this patient?', '["Cardiac Catheterization", "Exercise Stress ECG", "Chest X-ray", "Troponin level"]', 1, 'Stress testing is the best initial step for stable angina to assess for inducible ischemia. (Harrison''s Ch. 267)'),
    (v_case_id, 'Which of the following medication combinations is BEST for long-term mortality benefit in this patient?', '["Aspirin + Statin", "Nitroglycerin + Digoxin", "Furosemide + Lisinopril", "Aspirin + Warfarin"]', 0, 'Aspirin and Statins are the best evidence-based medications to prevent future MI and death in stable CAD. (Pocket Medicine)');

    -- CASE 17: COARCTATION OF THE AORTA
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'High Blood Pressure in a Young Adult', 'A 20-year-old male is found to have a BP of 170/100 mmHg in his right arm. On exam, you notice that his femoral pulses are weak and delayed compared to his radial pulses.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST finding you would expect to see on his Chest X-ray?', '["Boot-shaped heart", "Rib notching", "Water-bottle heart", "Egg-on-a-string heart"]', 1, 'Rib notching is due to collateral flow through dilated intercostal arteries. (Step-Up to Medicine)'),
    (v_case_id, 'What is the BEST next step to confirm the diagnosis?', '["Renal Artery Doppler", "Echocardiogram or CT Angiography", "24-hour urine metanephrines", "Cardiac Biopsy"]', 1, 'Imaging the aortic arch is the best way to confirm coarctation. (Harrison''s Ch. 271)');

    -- CASE 18: HYPOKALEMIA AND THE HEART
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Weakness and EKG Changes', 'A 45-year-old female taking Chlorthalidone for hypertension presents with generalized muscle weakness. ECG shows flat T-waves and prominent U-waves.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which electrolyte abnormality is the BEST explanation for these findings?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hyponatremia"]', 1, 'U-waves and flat T-waves are classic for potassium depletion, a common side effect of thiazide diuretics. (Harrison''s Ch. 306)'),
    (v_case_id, 'What is the BEST management for this patient?', '["Oral or IV Potassium replacement", "Intravenous Calcium Gluconate", "Insulin and Glucose", "Normal Saline bolus"]', 0, 'Replacing the potassium is the best treatment. Calcium gluconate is for hyperkalemia, not hypo. (Pocket Medicine)');

    -- CASE 19: RIGHT VENTRICULAR MI
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hypotension with Clear Lungs', 'A patient with an acute inferior wall MI (ST elevation in II, III, aVF) suddenly becomes hypotensive. His lungs are clear on auscultation, but his JVP is significantly elevated.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST next step in the clinical evaluation?', '["Obtain right-sided ECG leads (V4R)", "Order an urgent Chest X-ray", "Give IV Furosemide", "Order a D-dimer"]', 0, 'Inferior MIs often involve the RV; V4R is the best way to confirm RV infarction. (Harrison''s Ch. 269)'),
    (v_case_id, 'What is the BEST immediate treatment for this patient''s hypotension?', '["Nitroglycerin", "Intravenous fluid bolus (Normal Saline)", "Morphine", "Beta-blockers"]', 1, 'RV infarction is preload-dependent. Fluids are the best way to maintain CO. Nitrates and Morphine should be avoided as they reduce preload. (Pocket Medicine)');

    -- CASE 20: CARDIAC AMYLOIDOSIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Heart Failure with Normal EF', 'A 70-year-old male with chronic back pain (multiple myeloma) presents with new-onset leg swelling and dyspnea. Echo shows thickened ventricular walls but an EF of 55%. ECG shows surprisingly low voltage.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST diagnosis for this patient?', '["Hypertrophic Cardiomyopathy", "Cardiac Amyloidosis", "Dilated Cardiomyopathy", "Constrictive Pericarditis"]', 1, 'The discordance between thick walls on Echo and low voltage on ECG is the best clue for infiltrative disease like amyloid. (Harrison''s Ch. 274)'),
    (v_case_id, 'Which histological stain would BEST confirm the diagnosis?', '["Prussian Blue", "Congo Red", "H&E", "PAS stain"]', 1, 'Congo Red showing apple-green birefringence is the best gold standard. (Step-Up to Medicine)');

    -- CASE 21: DIGOXIN TOXICITY
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Nausea and Yellow Vision', 'A 78-year-old female on Digoxin and Furosemide for heart failure presents with nausea, vomiting, and "yellowish-green" halos around lights. Her pulse is 45 bpm.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST explanation for her symptoms?', '["Acute Glaucoma", "Digoxin Toxicity", "Normal side effect of Furosemide", "Cataracts"]', 1, 'Visual changes (xanthopsia) and GI upset are classic for Digoxin toxicity. (Harrison''s Ch. 272)'),
    (v_case_id, 'Which electrolyte abnormality most likely BEST precipitated this event?', '["Hyperkalemia", "Hypokalemia", "Hypernatremia", "Hypocalcemia"]', 1, 'Furosemide-induced hypokalemia is the most common reason for Digoxin toxicity. (Pocket Medicine)');

    -- CASE 22: COCAINE-INDUCED MI
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chest Pain in a Young Adult', 'A 28-year-old male is brought to the ER with severe chest pain and agitation after a night out. His BP is 180/110 mmHg and pupils are dilated.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST initial treatment for his chest pain and hypertension?', '["Metoprolol", "Benzodiazepines (e.g. Lorazepam)", "Aspirin only", "Lisinopril"]', 1, 'Benzos are the best initial therapy for cocaine-related ACS as they reduce sympathetic drive. (Harrison''s Ch. 268)'),
    (v_case_id, 'Which of the following medications is BEST avoided in this patient?', '["Nitroglycerin", "Aspirin", "Propranolol", "Calcium Channel Blockers"]', 2, 'Non-selective beta-blockers can lead to unopposed alpha-stimulation, worsening coronary spasm and hypertension. (Step-Up to Medicine)');

    -- CASE 23: TAKAYASU ARTERITIS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Absent Pulses in a Young Female', 'A 24-year-old Asian female presents with fatigue and weight loss. On exam, you cannot palpate the radial pulse on the left side, and there is a loud bruit over the left subclavian artery.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST diagnosis for this patient?', '["Temporal Arteritis", "Takayasu Arteritis", "Polyarteritis Nodosa", "Buerger Disease"]', 1, 'Large-vessel vasculitis ("pulseless disease") primarily affecting the aortic arch and its branches. (Harrison''s Ch. 363)'),
    (v_case_id, 'What is the BEST first-line treatment for this condition?', '["Antibiotics", "High-dose Corticosteroids", "Surgical bypass", "Anti-platelets"]', 1, 'Steroids are the mainstay of treatment for active vasculitis. (Step-Up to Medicine)');

    -- CASE 24: CARDIOGENIC SHOCK
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cool Extremities and Low BP', 'A patient with a massive anterior MI becomes obtunded. BP is 75/40 mmHg, HR 110 bpm. He has cold, clammy skin and crackles throughout both lung fields.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST physiological description of this patient''s state?', '["High CO, Low SVR", "Low CO, High PCWP, High SVR", "Low CO, Low PCWP, Low SVR", "High CO, High PCWP"]', 1, 'Cardiogenic shock involves pump failure (low CO), fluid backup (high PCWP), and compensatory vasoconstriction (high SVR). (Harrison''s Ch. 304)'),
    (v_case_id, 'What is the BEST next step in the management of his hypotension?', '["IV Fluid bolus", "Inotropic support (e.g. Dobutamine/Norepinephrine)", "Give Beta-blocker", "Give ACE inhibitor"]', 1, 'Inotropes/Vasopressors are the best choice to maintain perfusion. Fluids would worsen the pulmonary edema. (Pocket Medicine)');

    -- CASE 25: ATRIAL MYXOMA
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Fever, Weight Loss, and a Murmur', 'A 50-year-old female presents with constitutional symptoms (fever, weight loss) and intermittent episodes of dizziness. On auscultation, a low-pitched diastolic sound is heard that varies with her body position.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BEST diagnosis for this patient?', '["Mitral Stenosis", "Left Atrial Myxoma", "Infective Endocarditis", "Tuberculosis"]', 1, 'Atrial myxoma can mimic mitral stenosis (tumor plop) and cause systemic inflammatory symptoms. (Harrison''s Ch. 278)'),
    (v_case_id, 'What is the BEST next step in management?', '["Long-term Antibiotics", "Surgical Excision", "Valve Replacement", "Observation"]', 1, 'Surgical removal is the best definitive treatment to prevent embolization and resolve symptoms. (Step-Up to Medicine)');

    RAISE NOTICE 'SUCCESS: Cardiology BCQ Part 1 (50 Questions) registered.';
END $$;

COMMIT;
