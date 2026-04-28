-- Migration: Year 3 - Cardiology MCQ Bank (PART 3: 201-250)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiology' LIMIT 1;

    -- SECTION 11: ADVANCED CLINICAL & DIAGNOSTICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '201: A patient has ST-elevation in leads I, aVL, V5, and V6. Which artery is primarily involved?', '["LAD", "LCX (Left Circumflex)", "RCA", "Diagonal"]', 1, 'These leads view the lateral wall of the left ventricle. (Harrison''s Ch. 268)'),
    (v_topic_id, '202: What is the most appropriate next step for a patient with NSTEMI and a high GRACE risk score?', '["Thrombolytics", "Early Invasive Strategy (Angiography)", "Observation for 48 hours", "Discharge on dual antiplatelets"]', 1, 'High-risk NSTEMI requires early invasive evaluation, usually within 24 hours. (Harrison''s Ch. 268)'),
    (v_topic_id, '203: "Electrical alternans" is often seen on ECG in which condition?', '["AFib", "Cardiac Tamponade", "Hypokalemia", "WPW"]', 1, 'Alternating QRS amplitude due to heart swinging. (Pocket Medicine)'),
    (v_topic_id, '204: Which heart sound splitting is seen in Right Bundle Branch Block (RBBB)?', '["Narrow split", "Wide fixed split", "Wide persistent split", "Paradoxical split"]', 2, 'Delayed RV activation delays P2, causing a wide split that still varies with respiration. (Harrison''s Ch. 264)'),
    (v_topic_id, '205: A "new-onset" LBBB in a patient with chest pain is considered:', '["Normal finding", "STEMI equivalent", "Non-specific", "Sign of pericarditis"]', 1, 'In the context of typical symptoms, new LBBB should be treated as a STEMI. (Step-Up)'),
    (v_topic_id, '206: Which ECG lead is the most sensitive for detecting right ventricular infarction?', '["V1", "V4R (Right-sided V4)", "aVF", "V6"]', 1, 'Right-sided leads are essential in inferior MIs to check for RV involvement. (Pocket Medicine)'),
    (v_topic_id, '207: What is the goal heart rate during a treadmill exercise stress test?', '["100 bpm", "150 bpm", "85% of Maximum Predicted HR (220-age)", "95% of Maximum Predicted HR"]', 2, '85% is the threshold for a "diagnostic" stress test. (Harrison''s Ch. 267)'),
    (v_topic_id, '208: Which feature on ECG is most characteristic of WPW syndrome?', '["Long PR", "Short PR and Delta wave", "Wide P wave", "T-wave inversion"]', 1, 'Delta wave represents pre-excitation via the accessory pathway. (Harrison''s Ch. 263)'),
    (v_topic_id, '209: "Romano-Ward Syndrome" is a form of congenital Long QT that is inherited:', '["Autosomal Dominant", "Autosomal Recessive", "X-linked", "Mitochondrial"]', 0, 'Jervell and Lange-Nielsen is the AR form with deafness. (Harrison''s Ch. 263)'),
    (v_topic_id, '210: Which medication is used for the "chemical cardioversion" of recent-onset AFib in a patient with NO structural heart disease?', '["Amiodarone", "Flecainide or Ibutilide", "Metoprolol", "Digoxin"]', 1, 'Class IC or III agents can be used for rhythm control in healthy hearts. (Pocket Medicine)');

    -- SECTION 12: PREVENTIVE CARDIOLOGY & UPDATES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '211: According to 2024-2025 guidelines, what is the LDL goal for a patient at "Very High Risk" (e.g., recent MI)?', '["<100 mg/dL", "<70 mg/dL", "<55 mg/dL", "<40 mg/dL"]', 2, 'The 22nd Edition of Harrison''s and recent AHA/ESC updates emphasize <55 mg/dL for secondary prevention. (Harrison''s Ch. 412)'),
    (v_topic_id, '212: Which SGLT2 Inhibitor is proven to reduce mortality and hospitalization in BOTH HFrEF and HFpEF?', '["Dapagliflozin", "Empagliflozin", "Both A and B", "Canagliflozin"]', 2, 'Dapa-HF and Empereor trials confirmed benefit across the EF spectrum. (Harrison''s Ch. 272)'),
    (v_topic_id, '213: What is the standard duration of "Dual Antiplatelet Therapy" (DAPT) following a drug-eluting stent (DES) for ACS?', '["1 month", "3 months", "6 months", "12 months"]', 3, '12 months is the default for ACS, though it can be shortened based on bleeding risk. (Pocket Medicine)'),
    (v_topic_id, '214: Which medication class is recommended as first-line for HTN in patients with Proteinuric CKD?', '["CCBs", "Thiazides", "ACEi or ARBs", "Beta-blockers"]', 2, 'They reduce intraglomerular pressure and proteinuria. (Step-Up)'),
    (v_topic_id, '215: "High-intensity" statin therapy is expected to lower LDL by approximately:', '["<30%", "30-50%", ">50%", ">75%"]', 2, 'Atorvastatin 40-80mg or Rosuvastatin 20-40mg are high-intensity. (Harrison''s Ch. 412)'),
    (v_topic_id, '216: Which lipid agent works by inhibiting the PCSK9 protein?', '["Ezetimibe", "Alirocumab", "Colesevelam", "Gemfibrozil"]', 1, 'PCSK9 inhibitors increase the recycling of LDL receptors. (Harrison''s Ch. 412)'),
    (v_topic_id, '217: What is the primary side effect of Ezetimibe?', '["Muscle pain", "Diarrhea/GI upset", "Flush", "Cough"]', 1, 'It inhibits cholesterol absorption in the small intestine. (Pocket Medicine)'),
    (v_topic_id, '218: Which antihypertensive can cause a reversible "Drug-induced Lupus" syndrome?', '["Hydralazine", "Propranolol", "Amlodipine", "Hydrochlorothiazide"]', 0, 'Procainamide and Hydralazine are the most common cardiac causes. (Step-Up)'),
    (v_topic_id, '219: For a patient with chronic AFib and a mechanical heart valve, which anticoagulant MUST be used?', '["Apixaban", "Rivaroxaban", "Warfarin", "Dabigatran"]', 2, 'DOACs are currently contraindicated in patients with mechanical valves. (Harrison''s Ch. 273)'),
    (v_topic_id, '220: What is the threshold for diagnosing Hypertension (Stage 1) according to ACC/AHA guidelines?', '["120/80", "130/80", "140/90", "150/95"]', 1, 'Consistent readings of 130/80 or higher are Stage 1. (Harrison''s Ch. 280)');

    -- SECTION 13: ADVANCED CARDIAC PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '221: "Arrythmogenic Right Ventricular Cardiomyopathy" (ARVC) is caused by mutations in which protein?', '["Beta-MHC", "Desmosomal proteins", "Dystrophin", "Troponin T"]', 1, 'Fibrofatty replacement of the RV wall; leads to V-tach and sudden death. (Harrison''s Ch. 274)'),
    (v_topic_id, '222: Which valvular abnormality is associated with "Austin Flint" murmur?', '["Mitral Stenosis", "Severe Aortic Regurgitation", "Tricuspid Regurg", "Aortic Stenosis"]', 1, 'A mid-diastolic rumble produced by AR jet striking the mitral valve. (Harrison''s Ch. 273)'),
    (v_topic_id, '223: "Ewart''s sign" (dullness to percussion at the left lung base) is seen in:', '["Pneumonia", "Large Pericardial Effusion", "Heart Failure", "Pneumothorax"]', 1, 'Due to compression of the lung by the pericardial sac. (Pocket Medicine)'),
    (v_topic_id, '224: Which heart sound is often heard in patients with "Constrictive Pericarditis" but not in "Tamponade"?', '["S3", "S4", "Pericardial Knock", "Opening Snap"]', 2, 'The knock represents sudden cessation of ventricular filling. (Harrison''s Ch. 275)'),
    (v_topic_id, '225: What is the definitive diagnostic test for cardiac amyloidosis?', '["Echo", "MRI", "Endomyocardial Biopsy (Congo Red stain)", "BNP"]', 2, 'Apple-green birefringence under polarized light is the gold standard. (Harrison''s Ch. 274)'),
    (v_topic_id, '226: "Heberden''s sign" is an archaic term for:', '["Palpitation", "Angina Pectoris", "Shortness of breath", "Syncope"]', 1, 'Named after William Heberden who first described angina. (Harrison''s Ch. 267)'),
    (v_topic_id, '227: Which medication is used to prevent coronary artery aneurysms in Kawasaki disease?', '["Antibiotics", "IVIG and High-dose Aspirin", "Steroids", "Warfarin"]', 1, 'Early treatment significantly reduces the risk of aneurysms. (Step-Up)'),
    (v_topic_id, '228: "Osler''s nodes" and "Janeway lesions" are found in:', '["Rheumatic Fever", "Infective Endocarditis", "SLE", "Kawasaki"]', 1, 'Classic peripheral stigmata of endocarditis. (Pocket Medicine)'),
    (v_topic_id, '229: What is the "Roth spot"?', '["A retinal hemorrhage with a central white spot", "A painful nodule on the finger", "A splinter hemorrhage", "A macular rash"]', 0, 'Seen in 2-10% of endocarditis cases. (Harrison''s Ch. 129)'),
    (v_topic_id, '230: Which valve is the most commonly affected in patients with "Non-bacterial Thrombotic Endocarditis" (NBTE)?', '["Mitral", "Tricuspid", "Aortic", "Pulmonic"]', 0, 'Also known as marantic endocarditis, often associated with advanced malignancy. (Harrison''s Ch. 129)');

    -- FINAL MISC (231-250)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '231: Which artery is the "natural pacemaker" of the heart?', '["RCA", "SA Nodal Artery", "LAD", "LCX"]', 1, 'Arises from the RCA in 60% and the LCX in 40% of cases. (Harrison''s Ch. 263)'),
    (v_topic_id, '232: What is the primary physiological drive for blood flow through the CORONARY arteries?', '["Systole", "Diastole", "Mean Arterial Pressure", "Atrial contraction"]', 1, 'Coronary flow occurs primarily during diastole because systolic contraction compresses the vessels. (Harrison''s Ch. 267)'),
    (v_topic_id, '233: Which heart chamber forms the "Apex" of the heart?', '["Right Atrium", "Right Ventricle", "Left Atrium", "Left Ventricle"]', 3, 'The LV is responsible for the apical impulse. (Step-Up)'),
    (v_topic_id, '234: "Pulsus parvus et tardus" is a hallmark of:', '["Aortic Regurgitation", "Aortic Stenosis", "Mitral Regurg", "Hyperthyroidism"]', 1, 'A weak and delayed carotid upstroke. (Harrison''s Ch. 273)'),
    (v_topic_id, '235: Which congenital defect is often found in patients with "Down Syndrome"?', '["TOF", "Endocardial Cushion Defect (AV Canal)", "Coarctation", "Ebstein"]', 1, 'Nearly 40% of Down syndrome infants have heart defects. (Harrison''s Ch. 271)'),
    (v_topic_id, '236: The "Egg-on-a-string" heart silhouette is classic for:', '["TOF", "Transposition of the Great Arteries", "TAPVR", "Truncus"]', 1, 'Due to narrow mediastinum and large globular heart. (Pocket Medicine)'),
    (v_topic_id, '237: Which heart sound is often referred to as an "Atrial Gallop"?', '["S1", "S2", "S3", "S4"]', 3, 'S4 reflects atrial contraction into a stiff ventricle. (Harrison''s Ch. 264)'),
    (v_topic_id, '238: "Electrical alternans" is associated with:', '["Hyperkalemia", "Cardiac Tamponade", "WPW", "Hypomagnesemia"]', 1, 'Varying QRS amplitude. (Harrison''s)'),
    (v_topic_id, '239: Which drug is a potent vasodilator used in Hypertensive Emergency that can cause Cyanide toxicity?', '["Nitroglycerin", "Sodium Nitroprusside", "Hydralazine", "Labetalol"]', 1, 'Sodium Nitroprusside. (Pocket Medicine)'),
    (v_topic_id, '240: "Delta wave" is the EKG hallmark of:', '["Long QT", "Brugada", "WPW Syndrome", "SVT"]', 2, 'Pre-excitation through Bundle of Kent. (Harrison''s Ch. 263)'),
    (v_topic_id, '241: Which antibiotic class is associated with "Long QT" and risk of Torsades?', '["Penicillins", "Macrolides (e.g., Erythromycin)", "Aminoglycosides", "Tetracyclines"]', 1, 'Macrolides and Quinolones can prolong the QT interval. (Step-Up)'),
    (v_topic_id, '242: What is the most common cause of "Right Heart Failure"?', '["Pulmonary HTN", "COPD", "Left Heart Failure", "Tricuspid Stenosis"]', 2, 'Left-sided failure is the leading cause of right-sided failure. (Harrison''s Ch. 272)'),
    (v_topic_id, '243: "Ortner''s syndrome" involves hoarseness due to:', '["Aortic aneurysm", "Left atrial enlargement (compressing laryngeal nerve)", "Goiter", "Lung cancer"]', 1, 'Seen in severe Mitral Stenosis. (Harrison''s Ch. 273)'),
    (v_topic_id, '244: Which JVP finding is classic for "Constrictive Pericarditis"?', '["Absent y-descent", "Prominent y-descent (Friedreich''s sign)", "Absent a-wave", "Flattened x-descent"]', 1, 'Rapid ventricular filling causes a steep y-descent. (Harrison''s Ch. 275)'),
    (v_topic_id, '245: Which serum marker is elevated in "Ischemic Hepatitis" (Shock Liver) following heart failure?', '["AST/ALT (>1000)", "Bilirubin", "Amylase", "Creatinine"]', 0, 'Profound elevation of transaminases due to hypoperfusion. (Pocket Medicine)'),
    (v_topic_id, '246: "Kussmaul sign" is:', '["JVP increase with inspiration", "BP drop with inspiration", "Murmur increase with inspiration", "None"]', 0, 'Seen in Constrictive Pericarditis and RV infarction. (Harrison''s Ch. 264)'),
    (v_topic_id, '247: What is the treatment of choice for "Pulmonary Edema" due to acute heart failure?', '["Aspirin", "Furosemide", "Metoprolol", "Spironolactone"]', 1, 'Loop diuretics are the mainstay. (Step-Up)'),
    (v_topic_id, '248: "Corrigan pulse" is another name for:', '["Water-hammer pulse", "Pulsus alternans", "Bifid pulse", "None"]', 0, 'Associated with Aortic Regurgitation. (Harrison''s)'),
    (v_topic_id, '249: Which medication is used for "Rate Control" in permanent AFib?', '["Amiodarone", "Diltiazem", "Lidocaine", "Propafenone"]', 1, 'Non-DHP CCBs or Beta-blockers are preferred. (Pocket Medicine)'),
    (v_topic_id, '250: The "Standard" position for auscultating an Aortic Regurgitation murmur is:', '["Lying flat", "Left lateral decubitus", "Sitting up and leaning forward", "Standing"]', 2, 'Brings the aortic root closer to the chest wall. (Harrison''s Ch. 273)');

    RAISE NOTICE 'SUCCESS: Cardiology MCQ Part 3 (201-250) registered.';
END $$;

COMMIT;
