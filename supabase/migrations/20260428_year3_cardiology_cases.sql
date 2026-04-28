-- Migration: Year 3 - Cardiology MCQ Bank (PART 4: 251-300)
-- Converted from BCQ format to standard MCQs as per user request.
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiology' LIMIT 1;

    -- DELETE previous BCQ/Case attempts to keep it clean
    DELETE FROM mcqs WHERE topic_id = v_topic_id AND type = 'BCQ';
    DELETE FROM case_studies WHERE topic_id = v_topic_id;
    DELETE FROM mcqs WHERE topic_id = v_topic_id AND question LIKE '251:%'; -- Safety for re-runs

    -- INSERT 50 MCQs (formerly BCQs)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation, type) VALUES
    -- 251-260: ACS & IHD
    (v_topic_id, '251: Which of the following is the BEST immediate pharmacological intervention to reduce mortality in a patient with acute STEMI?', '["Intravenous Morphine", "Sublingual Nitroglycerin", "Oral Aspirin (325 mg chewed)", "Intravenous Heparin"]', 2, 'Chewed aspirin is the single best immediate intervention proven to reduce mortality in ACS. (Harrison''s Ch. 269)', 'MCQ'),
    (v_topic_id, '252: If the nearest PCI-capable hospital is 3 hours away, what is the BEST reperfusion strategy for a STEMI patient?', '["Wait for transfer to PCI center", "Immediate fibrinolysis with Alteplase", "Urgent CABG", "Intravenous Beta-blockers"]', 1, 'If transfer time exceeds 120 mins, fibrinolysis is superior to minimize infarct size. (Step-Up to Medicine)', 'MCQ'),
    (v_topic_id, '253: What is the BEST next step for a 60-year-old with stable angina who continues to have symptoms despite maximum medical therapy?', '["Switch to a different beta-blocker", "Coronary angiography with view to revascularization", "Addition of high-dose Vitamin E", "Repeat stress test"]', 1, 'Refractory symptoms despite therapy warrant invasive evaluation. (Harrison''s Ch. 267)', 'MCQ'),
    (v_topic_id, '254: Which medication is the BEST choice for secondary prevention in a patient with documented coronary artery disease and an LDL of 120 mg/dL?', '["Niacin", "Atorvastatin 80mg", "Gemfibrozil", "Ezetimibe monotherapy"]', 1, 'High-intensity statins are the gold standard for secondary prevention. (Harrison''s Ch. 412)', 'MCQ'),
    (v_topic_id, '255: A patient with Cocaine-induced chest pain has a BP of 180/110. Which is the BEST initial treatment?', '["Metoprolol", "Lorazepam (Benzodiazepine)", "Lisinopril", "Digoxin"]', 1, 'Benzos reduce the sympathetic surge; beta-blockers are contraindicated. (Harrison''s Ch. 268)', 'MCQ'),
    (v_topic_id, '256: In a patient with suspected Prinzmetal (variant) angina, which test is the BEST to confirm the diagnosis during angiography?', '["Adenosine infusion", "Ergonovine or Acetylcholine provocation", "Dobutamine stress", "Normal saline flush"]', 1, 'Provocative testing can trigger the spasm for visualization. (Harrison''s Ch. 268)', 'MCQ'),
    (v_topic_id, '257: Which antiplatelet strategy is the BEST for a patient undergoing PCI with a drug-eluting stent for an acute MI?', '["Aspirin alone", "Aspirin + Clopidogrel (DAPT) for 12 months", "Warfarin + Aspirin", "Clopidogrel alone"]', 1, 'DAPT for 12 months is the standard of care post-ACS. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '258: A patient presents with 1 hour of chest pain and ST-depression in V1-V3. What is the BEST next step?', '["Discharge with PPI", "Obtain posterior leads (V7-V9) to rule out posterior STEMI", "Start Furosemide", "Order a d-dimer"]', 1, 'ST-depression in V1-V3 is often a reciprocal change of a posterior STEMI. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '259: Which is the BEST agent for rapid blood pressure control in a patient with acute aortic dissection?', '["Hydralazine", "Labetalol", "Nifedipine", "Clonidine"]', 1, 'Labetalol provides both alpha and beta blockade, reducing dP/dt. (Harrison''s Ch. 281)', 'MCQ'),
    (v_topic_id, '260: What is the BEST goal heart rate for a patient with stable angina being treated with beta-blockers?', '["40-50 bpm", "55-60 bpm", "70-80 bpm", "90-100 bpm"]', 1, 'The target is usually a resting HR of 55-60 to minimize O2 demand. (Harrison''s Ch. 267)', 'MCQ'),

    -- 261-270: HEART FAILURE
    (v_topic_id, '261: Which of the following is the BEST next step for a patient with HFrEF (EF 25%) who remains symptomatic (NYHA III) despite ACEi and Beta-blocker?', '["Digoxin", "Spironolactone (MRA)", "Amlodipine", "Increase the diuretic dose"]', 1, 'MRAs provide a mortality benefit in symptomatic HFrEF. (Harrison''s Ch. 272)', 'MCQ'),
    (v_topic_id, '262: What is the BEST choice of diuretic for a patient in acute pulmonary edema?', '["Hydrochlorothiazide", "Intravenous Furosemide", "Oral Torsemide", "Acetazolamide"]', 1, 'IV loop diuretics provide rapid relief. (Step-Up)', 'MCQ'),
    (v_topic_id, '263: In a patient with HFrEF and a heart rate of 85 bpm despite maximum tolerated beta-blockade, which is the BEST additional agent?', '["Ivabradine", "Verapamil", "Diltiazem", "Clonidine"]', 0, 'Ivabradine is indicated for HR > 70 in HFrEF. (Harrison''s Ch. 272)', 'MCQ'),
    (v_topic_id, '264: Which is the BEST classification for a heart failure patient with an EF of 45%?', '["HFrEF", "HFmrEF (Mid-range)", "HFpEF", "Normal"]', 1, 'HFmrEF is defined as EF 41-49%. (Harrison''s Ch. 272)', 'MCQ'),
    (v_topic_id, '265: For a patient with HFrEF and new-onset Atrial Fibrillation, which is the BEST anticoagulant?', '["Aspirin", "Apixaban (DOAC)", "Warfarin", "Clopidogrel"]', 1, 'DOACs are generally preferred over Warfarin in non-valvular AFib. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '266: Which physical exam finding is the BEST (most specific) indicator of elevated left ventricular end-diastolic pressure?', '["Peripheral edema", "S3 heart sound", "Hepatomegaly", "Pulmonary crackles"]', 1, 'S3 is a highly specific sign of ventricular dysfunction/failure. (Harrison''s Ch. 264)', 'MCQ'),
    (v_topic_id, '267: What is the BEST next step for a patient with HFrEF and a QRS duration of 160ms with LBBB pattern?', '["Pacemaker", "Cardiac Resynchronization Therapy (CRT)", "ICD alone", "Increase Lisinopril"]', 1, 'CRT is indicated for wide QRS (>150ms) to improve efficiency. (Harrison''s Ch. 272)', 'MCQ'),
    (v_topic_id, '268: Which drug class is the BEST choice for treating hypertension in a patient with HFrEF?', '["Calcium Channel Blockers", "ACE Inhibitors", "Alpha-blockers", "Minoxidil"]', 1, 'ACEi/ARBs/ARNIs are foundational for HFrEF. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '269: In a patient with HFpEF, what is the BEST primary goal of therapy?', '["Increase contractility", "Manage comorbidities (HTN, AFib) and use SGLT2i", "Give Digoxin", "Heart transplant"]', 1, 'SGLT2i are the only class with strong evidence in HFpEF. (Harrison''s Ch. 272)', 'MCQ'),
    (v_topic_id, '270: Which marker is the BEST for monitoring the response to therapy in acute decompensated heart failure?', '["BNP", "Daily weights and clinical exam", "Troponin", "Chest X-ray"]', 1, 'Serial BNP is not recommended for daily monitoring; clinical status is best. (Pocket Medicine)', 'MCQ'),

    -- 271-280: VALVULAR DISEASE
    (v_topic_id, '271: What is the BEST management for a patient with severe Aortic Stenosis who is asymptomatic?', '["Valve replacement", "Close observation with serial Echo", "Start statins", "Stress test"]', 1, 'Surgery is usually reserved for symptomatic patients or those with low EF. (Harrison''s Ch. 273)', 'MCQ'),
    (v_topic_id, '272: Which is the BEST diagnostic test for a patient with suspected Mitral Valve Prolapse?', '["Chest X-ray", "Echocardiogram", "ECG", "Cardiac Biopsy"]', 1, 'Echo confirms the displacement of the leaflets. (Step-Up)', 'MCQ'),
    (v_topic_id, '273: A patient with severe Mitral Regurgitation develops AFib. What is the BEST next step?', '["Aspirin", "Anticoagulation with Warfarin", "Rate control only", "Observation"]', 1, 'Valvular AFib requires Warfarin. (Harrison''s Ch. 273)', 'MCQ'),
    (v_topic_id, '274: Which is the BEST definitive treatment for a 30-year-old with severe symptomatic Mitral Stenosis?', '["Valve replacement", "Percutaneous Mitral Balloon Valvuloplasty", "Beta-blockers", "Digoxin"]', 1, 'PMBV is the preferred initial treatment for suitable anatomy. (Harrison''s Ch. 273)', 'MCQ'),
    (v_topic_id, '275: What is the BEST clinical sign to monitor the progression of Aortic Regurgitation?', '["Murmur intensity", "Pulse pressure", "LV size on Echo", "ECG voltage"]', 2, 'LV dilation is the key indicator for timing of surgery. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '276: For a patient with a mechanical heart valve, what is the BEST target INR?', '["1.5-2.0", "2.0-3.0", "2.5-3.5 (depending on position)", "4.0-5.0"]', 2, 'Target is usually 2.5-3.5 for mitral and 2.0-3.0 for aortic. (Harrison''s Ch. 273)', 'MCQ'),
    (v_topic_id, '277: Which is the BEST antibiotic choice for endocarditis prophylaxis in a high-risk patient undergoing a dental procedure?', '["Amoxicillin 2g", "Clindamycin 600mg", "Azithromycin 500mg", "Vancomycin"]', 0, 'Oral amoxicillin is the standard first-line. (Harrison''s Ch. 129)', 'MCQ'),
    (v_topic_id, '278: A patient with a bicuspid aortic valve has a root diameter of 5.0 cm. What is the BEST next step?', '["Yearly Echo", "Surgical repair", "Start Lisinopril", "Beta-blockers only"]', 1, 'Large root diameters warrant surgery to prevent dissection. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '279: Which is the BEST finding to distinguish Mitral Regurgitation from Aortic Stenosis?', '["Murmur radiation to axilla", "Crescendo-decrescendo shape", "Radiation to carotids", "S2 splitting"]', 0, 'MR radiates to the axilla; AS radiates to the carotids. (Step-Up)', 'MCQ'),
    (v_topic_id, '280: In a patient with Rheumatic heart disease, which valve is the BEST (most likely) to be affected first?', '["Aortic", "Mitral", "Tricuspid", "Pulmonary"]', 1, 'The mitral valve is almost always involved in rheumatic fever. (Harrison''s Ch. 273)', 'MCQ'),

    -- 281-290: ARRHYTHMIAS
    (v_topic_id, '281: What is the BEST treatment for a patient with symptomatic Sinus Bradycardia (HR 35)?', '["Atropine", "Pacemaker", "Epinephrine", "Digoxin"]', 0, 'Atropine is the first-line pharmacologic treatment. (Harrison''s Ch. 263)', 'MCQ'),
    (v_topic_id, '282: Which is the BEST choice for rate control in a patient with AFib and WPW syndrome?', '["Digoxin", "Verapamil", "Procainamide", "Beta-blockers"]', 2, 'AV nodal blockers (Digoxin, CCBs, BBs) can worsen WPW by favoring the accessory pathway. (Harrison''s Ch. 263)', 'MCQ'),
    (v_topic_id, '283: What is the BEST next step for a patient in Ventricular Fibrillation after the first unsuccessful shock?', '["Epinephrine", "Amiodarone", "Repeat shock (after CPR cycle)", "Lidocaine"]', 2, 'Defibrillation is the priority; drugs come later. (ACLS/Harrison''s)', 'MCQ'),
    (v_topic_id, '284: Which is the BEST long-term management for a patient with Brugada syndrome and a history of syncope?', '["Beta-blockers", "ICD (Implantable Cardioverter Defibrillator)", "Amiodarone", "Observation"]', 1, 'ICD is the only treatment proven to prevent sudden death. (Harrison''s Ch. 263)', 'MCQ'),
    (v_topic_id, '285: In a patient with regular narrow-complex tachycardia (SVT), what is the BEST initial maneuver?', '["Adenosine", "Vagal maneuvers (Valsalva or Carotid massage)", "Synchronized cardioversion", "Diltiazem"]', 1, 'Vagal maneuvers are safe, free, and often effective. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '286: Which is the BEST agent for pharmacological cardioversion of AFib in a patient with heart failure?', '["Flecainide", "Amiodarone", "Sotalol", "Propafenone"]', 1, 'Amiodarone is safer in structural heart disease/HF. (Harrison''s Ch. 263)', 'MCQ'),
    (v_topic_id, '287: For a patient with Mobitz Type II AV block, what is the BEST definitive management?', '["Permanent Pacemaker", "Atropine", "Observation", "Caffeine"]', 0, 'Mobitz II carries a high risk of progression to complete block. (Step-Up)', 'MCQ'),
    (v_topic_id, '288: Which is the BEST electrolyte to check in a patient with frequent PVCs and a normal potassium?', '["Sodium", "Magnesium", "Calcium", "Chloride"]', 1, 'Hypomagnesemia often co-exists with and exacerbates arrhythmias. (Harrison''s Ch. 306)', 'MCQ'),
    (v_topic_id, '289: In a patient with stable V-Tach, what is the BEST initial pharmacological choice?', '["Amiodarone", "Lidocaine", "Adenosine", "Metoprolol"]', 0, 'Amiodarone is the standard for stable VT. (ACLS/Pocket Medicine)', 'MCQ'),
    (v_topic_id, '290: What is the BEST description of "Torsades de Pointes"?', '["Monomorphic VT", "Polymorphic VT with QT prolongation", "Regular narrow tachycardia", "Irregular wide tachycardia"]', 1, 'Twisting around the baseline. (Harrison''s Ch. 263)', 'MCQ'),

    -- 291-300: MISC & VASCULAR
    (v_topic_id, '291: What is the BEST first-line treatment for acute pericarditis?', '["Steroids", "NSAIDs + Colchicine", "Antibiotics", "Aspirin only"]', 1, 'Combination therapy reduces recurrence. (Harrison''s Ch. 275)', 'MCQ'),
    (v_topic_id, '292: Which imaging is the BEST for the diagnosis of cardiac tamponade?', '["Chest X-ray", "Echocardiogram", "ECG", "CT Chest"]', 1, 'Echo shows the fluid and diastolic collapse. (Step-Up)', 'MCQ'),
    (v_topic_id, '293: What is the BEST management for a patient with a 5.5 cm Abdominal Aortic Aneurysm?', '["Yearly Echo", "Surgical or Endovascular repair", "Beta-blockers only", "Observation"]', 1, '5.5cm is the threshold for intervention in men. (Harrison''s Ch. 281)', 'MCQ'),
    (v_topic_id, '294: Which is the BEST initial test for a patient with suspected Giant Cell Arteritis?', '["CT scan", "Temporal artery biopsy", "MRI", "Angiography"]', 1, 'Biopsy is the gold standard, though steroids should start immediately. (Harrison''s Ch. 363)', 'MCQ'),
    (v_topic_id, '295: What is the BEST medication for symptomatic relief of claudication?', '["Aspirin", "Cilostazol", "Warfarin", "Lisinopril"]', 1, 'Cilostazol increases walking distance. (Step-Up)', 'MCQ'),
    (v_topic_id, '296: Which is the BEST classification for a patient with BP 150/95?', '["Normal", "Stage 1 HTN", "Stage 2 HTN", "Crisis"]', 2, 'BP > 140/90 is Stage 2. (Harrison''s Ch. 280)', 'MCQ'),
    (v_topic_id, '297: What is the BEST next step for a patient with a "Water-hammer" pulse and dyspnea?', '["ECG", "Echocardiogram to assess Aortic Regurgitation", "Chest X-ray", "Stress test"]', 1, 'Classic sign of AR. (Pocket Medicine)', 'MCQ'),
    (v_topic_id, '298: Which is the BEST agent for a hypertensive emergency with pulmonary edema?', '["Nitroprusside", "Nitroglycerin", "Hydralazine", "Metoprolol"]', 1, 'Nitroglycerin reduces both preload and afterload. (Harrison''s Ch. 280)', 'MCQ'),
    (v_topic_id, '299: In a patient with suspected Marfan syndrome, which imaging is the BEST to screen the aorta?', '["Abdominal Ultrasound", "Echocardiogram (Aortic root)", "CT Head", "Venous Doppler"]', 1, 'Marfan primarily affects the root and ascending aorta. (Harrison''s Ch. 281)', 'MCQ'),
    (v_topic_id, '300: What is the BEST marker to exclude pulmonary embolism in a patient with LOW clinical suspicion?', '["Troponin", "D-dimer", "BNP", "CK-MB"]', 1, 'High negative predictive value for low-risk patients. (Harrison''s Ch. 283)', 'MCQ');

    RAISE NOTICE 'SUCCESS: Cardiology MCQ Part 4 (251-300) registered.';
END $$;

COMMIT;
