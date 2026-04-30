BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiology' LIMIT 1;

    -- CASE 01: Acute STEMI (Inferior Wall)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Chest Pain and Bradycardia', 'A 65-year-old male with a history of HTN and smoking presents with 2 hours of "crushing" substernal chest pain, nausea, and diaphoresis. His BP is 90/60 mmHg and HR is 45 bpm. ECG shows ST-segment elevation in leads II, III, and aVF.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which coronary artery is most likely occluded?', '["Left Main", "Left Anterior Descending (LAD)", "Right Coronary Artery (RCA)", "Left Circumflex (LCx)"]', 2, 'ST elevation in leads II, III, and aVF indicates an inferior wall MI, usually supplied by the RCA.'),
    (v_case_id, 'The patient''s bradycardia is most likely due to ischemia of which structure?', '["AV Node", "SA Node", "Bundle of His", "Purkinje fibers"]', 0, 'The RCA supplies the AV node in 90% of individuals.'),
    (v_case_id, 'What is the most appropriate next step in management?', '["Fibrinolytics", "Immediate Coronary Angiography (PCI)", "Beta-blocker administration", "Observation in ICU"]', 1, 'Primary PCI is the gold standard for STEMI if available within 90-120 minutes.');

    -- CASE 02: Stable Angina
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Predictable Exertional Chest Pain', 'A 58-year-old male presents with chest "heaviness" that occurs after walking two blocks and is relieved by 5 minutes of rest. He has no pain at rest. His baseline ECG is normal.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Unstable Angina", "Stable Angina", "Prinzmetal Angina", "NSTEMI"]', 1, 'Pain that is predictable with exertion and relieved by rest is characteristic of stable angina.'),
    (v_case_id, 'Which of the following is the best initial diagnostic test?', '["Exercise Stress ECG", "Coronary Angiography", "CT Calcium Scoring", "Resting Echocardiogram"]', 0, 'Stress testing is used to evaluate for inducible ischemia in patients with a normal baseline ECG.'),
    (v_case_id, 'Which medication has been shown to improve survival in this patient?', '["Nitroglycerin", "Aspirin", "Calcium Channel Blockers", "Ranolazine"]', 1, 'Aspirin and Statins are the primary medications that reduce the risk of future cardiovascular events and improve survival in stable CAD.');

    -- CASE 03: HFrEF (Systolic Heart Failure)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive Dyspnea and Leg Swelling', 'A 70-year-old female with a history of long-standing HTN and a previous MI presents with progressive SOB, orthopnea, and bilateral ankle edema. Echo shows an LVEF of 30% and a dilated left ventricle.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which physical exam finding is most specific for heart failure?', '["Pitting edema", "Crackles at lung bases", "Jugular Venous Distension (JVD)", "S3 gallop"]', 3, 'An S3 gallop is highly specific for volume overload and systolic dysfunction.'),
    (v_case_id, 'Which of the following drug classes is NOT part of Guideline-Directed Medical Therapy (GDMT) for reducing mortality?', '["ACE Inhibitors/ARNIs", "Beta-blockers", "Loop Diuretics", "SGLT2 inhibitors"]', 2, 'Loop diuretics are essential for symptom control (fluid removal) but have NOT been shown to reduce mortality in HFrEF.'),
    (v_case_id, 'The patient''s orthopnea is best explained by:', '["Increased sympathetic tone", "Redistribution of blood from the lower extremities to the lungs when supine", "Diaphragmatic fatigue", "Pulmonary fibrosis"]', 1, 'Lying flat increases venous return, which a failing left ventricle cannot handle, leading to pulmonary congestion.');

    -- CASE 04: Atrial Fibrillation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Irregularly Irregular Palpitations', 'A 72-year-old male with HTN and OSA presents with palpitations and "lightheadedness." His pulse is 130 bpm and irregularly irregular. ECG confirms Atrial Fibrillation.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important long-term management goal to prevent a catastrophic complication?', '["Rhythm control", "Anticoagulation to prevent stroke", "Daily ECGs", "High-dose aspirin"]', 1, 'Stroke prevention via anticoagulation (based on CHADS-VASc score) is the priority in AFib.'),
    (v_case_id, 'Which score is used to assess the risk of stroke in this patient?', '["Wells Score", "CHA2DS2-VASc Score", "HAS-BLED Score", "Framingham Score"]', 1, 'The CHA2DS2-VASc score determines the need for oral anticoagulation.'),
    (v_case_id, 'If the patient is hemodynamically unstable (BP 80/40), what is the immediate treatment?', '["Diltiazem drip", "Metoprolol IV", "Synchronized Cardioversion", "Unsynchronized Defibrillation"]', 2, 'Unstable tachyarrhythmias require immediate synchronized cardioversion.');

    -- CASE 05: Aortic Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syncope and a Systolic Murmur', 'An 82-year-old male presents after a fainting spell while walking his dog. On exam, he has a harsh crescendo-decrescendo systolic murmur at the 2nd right intercostal space that radiates to the carotids.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mitral Regurgitation", "Aortic Stenosis", "Hypertrophic Cardiomyopathy", "Pulmonary Hypertension"]', 1, 'Syncope + Exertional Angina + Systolic Murmur is the classic triad for severe Aortic Stenosis.'),
    (v_case_id, 'What is the characteristic pulse finding in this condition?', '["Pulsus alternans", "Pulsus parvus et tardus", "Water-hammer pulse", "Bifid pulse"]', 1, 'Pulse is weak (parvus) and late (tardus) relative to the heartbeat.'),
    (v_case_id, 'Once symptoms develop in severe Aortic Stenosis, what is the definitive treatment?', '["Diuretics and Nitro", "Balloon Valvuloplasty", "Aortic Valve Replacement (Surgical or TAVR)", "Beta-blockers"]', 2, 'Medical therapy is ineffective for severe symptomatic AS; valve replacement is required.');

    -- CASE 06: Acute Pericarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sharp Chest Pain Relieved by Leaning Forward', 'A 30-year-old male presents with sharp, retrosternal chest pain that is worse when lying flat and better when sitting forward. He recently recovered from a viral "cold." ECG shows diffuse ST-segment elevation in almost all leads.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["STEMI", "Acute Pericarditis", "Pulmonary Embolism", "Aortic Dissection"]', 1, 'Positional chest pain + diffuse ST elevation + recent viral illness is classic for pericarditis.'),
    (v_case_id, 'What finding would you expect to hear on auscultation?', '["S3 gallop", "Pericardial Friction Rub", "Opening Snap", "Holosystolic murmur"]', 1, 'A high-pitched, scratchy sound (rub) is characteristic.'),
    (v_case_id, 'What is the first-line treatment for this condition?', '["Aspirin and Heparin", "NSAIDs and Colchicine", "Steroids", "Urgent PCI"]', 1, 'NSAIDs (High dose) plus Colchicine reduce inflammation and prevent recurrence.');

    -- CASE 07: Infective Endocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and a New Heart Murmur', 'A 45-year-old male with a history of IV drug use presents with a fever of 102\u00b0F and a new holosystolic murmur at the lower left sternal border. Exam shows small, non-tender red spots on his palms.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the red spots on his palms called?', '["Osler Nodes", "Janeway Lesions", "Splinter Hemorrhages", "Roth Spots"]', 1, 'Janeway lesions are non-tender (embolic); Osler nodes are tender (immune complex).'),
    (v_case_id, 'Which organism is the most common cause of acute endocarditis in IV drug users?', '["Staph epidermidis", "Staph aureus", "Strep viridans", "Enterococcus"]', 1, 'S. aureus is the most common and aggressive cause.'),
    (v_case_id, 'The holosystolic murmur at the left sternal border in this patient most likely indicates:', '["Mitral Regurgitation", "Tricuspid Regurgitation", "VSD", "Aortic Stenosis"]', 1, 'IV drug users often have right-sided endocarditis involving the tricuspid valve.');

    -- CASE 08: Hypertrophic Cardiomyopathy (HCM)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Death in a Young Athlete', 'A 19-year-old college basketball player collapses and dies during a game. His father also died suddenly at age 35. Autopsy reveals massive hypertrophy of the interventricular septum.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying genetic defect?', '["Collagen synthesis defect", "Mutations in sarcomere proteins (e.g., Myosin binding protein C)", "Iron overload", "Viral myocarditis"]', 1, 'HCM is usually autosomal dominant with mutations in beta-myosin heavy chain or myosin-binding protein C.'),
    (v_case_id, 'A systolic murmur in HCM typically _____ with Valsalva and _____ with Squatting.', '["Decreases; Increases", "Increases; Decreases", "Does not change", "Disappears"]', 1, 'Valsalva (decreased preload) makes the murmur louder; squatting (increased preload) makes it softer.'),
    (v_case_id, 'What is the cause of the outflow obstruction in HCM?', '["Fixed valve narrowing", "Systolic Anterior Motion (SAM) of the mitral valve", "Aortic root dilation", "Chordae rupture"]', 1, 'The mitral valve is "sucked" toward the septum during systole, blocking the LV outflow tract.');

    -- CASE 09: Cardiac Tamponade
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypotension and Muffled Heart Sounds', 'A patient with metastatic lung cancer presents with severe dyspnea. Her BP is 85/50 mmHg, HR is 115 bpm, and her neck veins are distended. Heart sounds are very distant and difficult to hear.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This clinical presentation (Hypotension, JVD, Muffled heart sounds) is known as:', '["Charcot''s Triad", "Beck''s Triad", "Cushing''s Triad", "Whipple''s Triad"]', 1, 'The classic triad for cardiac tamponade.'),
    (v_case_id, 'What finding would you expect on a pulsus examination?', '["Pulsus parvus", "Pulsus paradoxus (Drop in SBP > 10 mmHg on inspiration)", "Pulsus alternans", "Bifid pulse"]', 1, 'Inspiration increases RV filling, which pushes the septum into the LV, reducing stroke volume.'),
    (v_case_id, 'What is the immediate life-saving treatment?', '["High-dose diuretics", "Synchronized cardioversion", "Emergency Pericardiocentesis", "Thrombolytics"]', 2, 'Fluid must be removed from the pericardial sac to allow the heart to fill.');

    -- CASE 10: Mitral Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'History of Rheumatic Fever and Hemoptysis', 'A 40-year-old immigrant from a developing country presents with dyspnea and occasional hemoptysis. She recalls having a severe "sore throat and joint pains" as a child. On exam, there is an opening snap followed by a mid-diastolic rumble at the apex.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aortic Regurgitation", "Mitral Stenosis", "Mitral Regurgitation", "ASD"]', 1, 'Rheumatic heart disease is the #1 cause of Mitral Stenosis worldwide.'),
    (v_case_id, 'What arrhythmia is most commonly associated with this condition?', '["Ventricular Tachycardia", "Atrial Fibrillation", "SVT", "Heart Block"]', 1, 'Left atrial enlargement due to the stenotic valve triggers AFib.'),
    (v_case_id, 'The "Opening Snap" occurs due to:', '["Aortic valve closure", "Abrupt tensing of the mitral valve leaflets after they open", "Atrial contraction", "Ventricular filling"]', 1, 'High left atrial pressure "snaps" the leaflets open early in diastole.');

    -- CASE 11: Aortic Dissection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tearing Back Pain and HTN', 'A 60-year-old male with poorly controlled HTN presents with sudden, "tearing" chest pain that radiates to his back between the shoulder blades. His BP is 210/110 mmHg. A pulse deficit is noted in the left arm.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute MI", "Aortic Dissection", "Pulmonary Embolism", "Pneumothorax"]', 1, 'Sudden tearing pain + severe HTN + pulse deficit = Dissection.'),
    (v_case_id, 'Which imaging modality is preferred in an unstable patient?', '["CT Angiography", "Transesophageal Echocardiography (TEE)", "Chest X-ray", "MRI"]', 1, 'TEE can be done at the bedside in the ER or OR for unstable patients; CT is best for stable patients.'),
    (v_case_id, 'What is the most important initial medical management goal?', '["Anticoagulation", "Rate and Pressure control (e.g., Esmolol or Labetalol)", "Fibrinolytics", "Fluids"]', 1, 'Reducing HR and BP (Shear stress) is critical to prevent propagation of the dissection.');

    -- CASE 12: Wolff-Parkinson-White (WPW) Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Short PR and Delta Waves', 'A 22-year-old female presents with sudden-onset palpitations. Her ECG shows a short PR interval, a slurred upstroke to the QRS (delta wave), and a widened QRS complex.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomical basis for this condition?', '["AV node delay", "Accessory pathway (Bundle of Kent) bypassing the AV node", "Purkinje fiber hypertrophy", "Atrial septal defect"]', 1, 'The accessory pathway allows for pre-excitation of the ventricles.'),
    (v_case_id, 'Which arrhythmia is most dangerous in a patient with WPW?', '["Atrial Fibrillation with rapid ventricular response", "Sinus Bradycardia", "First-degree heart block", "PVCs"]', 0, 'AFib can conduct 1:1 down the accessory pathway, leading to Ventricular Fibrillation.'),
    (v_case_id, 'Which medication should be AVOIDED in a patient with WPW and AFib?', '["Procainamide", "Amiodarone", "Calcium Channel Blockers (Diltiazem/Verapamil)", "Ibutilide"]', 2, 'AV nodal blocking agents (ABCD: Adenosine, Beta-blockers, CCBs, Digoxin) can force more conduction through the accessory pathway, increasing the risk of VFib.');

    -- CASE 13: Prinzmetal (Variant) Angina
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nocturnal Chest Pain and ST Elevation', 'A 45-year-old female smoker presents with episodes of chest pain that occur primarily at rest, often in the early morning hours. During an episode, her ECG shows transient ST-segment elevation which resolves after 10 minutes when the pain stops.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Unstable Angina", "Prinzmetal Angina", "STEMI", "NSTEMI"]', 1, 'Transient rest pain with ST elevation in a young smoker is classic for vasospasm.'),
    (v_case_id, 'What is the first-line treatment for this condition?', '["Beta-blockers", "Calcium Channel Blockers and Nitrates", "Aspirin only", "Urgent PCI"]', 1, 'Vasodilators are used to prevent and treat the spasm. Beta-blockers should be avoided as they can worsen vasospasm.'),
    (v_case_id, 'A coronary angiogram in this patient is most likely to show:', '["Triple vessel disease", "Left main stenosis", "Clean coronary arteries with no significant fixed obstruction", "Total RCA occlusion"]', 2, 'The pain is due to spasm, not a fixed atherosclerotic plaque.');

    -- CASE 14: Dilated Cardiomyopathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Alcohol Use and Heart Failure', 'A 50-year-old male with a history of severe alcohol use disorder presents with 3 months of worsening dyspnea and orthopnea. Echo shows global hypokinesis and an EF of 25%.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hypertrophic Cardiomyopathy", "Dilated Cardiomyopathy", "Restrictive Cardiomyopathy", "Ischemic Cardiomyopathy"]', 1, 'Alcohol is a common toxin causing dilated cardiomyopathy.'),
    (v_case_id, 'Which of the following is NOT a known cause of dilated cardiomyopathy?', '["Cocaine", "Doxorubicin", "Amyloidosis", "Viral myocarditis (Coxsackie B)"]', 2, 'Amyloidosis causes RESTRICTIVE cardiomyopathy.'),
    (v_case_id, 'What heart sound is classically heard in this patient?', '["S3", "S4", "Ejection Click", "Opening Snap"]', 0, 'S3 is associated with ventricular filling into a dilated, compliant chamber.');

    -- CASE 15: Restrictive Cardiomyopathy (Amyloidosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stiff Heart and Low Voltage ECG', 'A 75-year-old male presents with heart failure. ECG shows very low voltage QRS complexes. Echo shows markedly thickened ventricular walls with a "speckled" appearance, but normal LVEF. He also has macroglossia (enlarged tongue).', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["HOCM", "Amyloidosis (Restrictive Cardiomyopathy)", "Dilated Cardiomyopathy", "Athlete''s heart"]', 1, 'Macroglossia + speckled heart + low voltage ECG is pathognomonic for amyloidosis.'),
    (v_case_id, 'In restrictive cardiomyopathy, which of the following is typically impaired?', '["Systolic function", "Diastolic filling", "Valve closure", "SA node firing"]', 1, 'The "stiff" heart cannot relax and fill properly.'),
    (v_case_id, 'Which biopsy would be most useful to confirm systemic involvement?', '["Liver biopsy", "Abdominal fat pad biopsy", "Skin biopsy", "Muscle biopsy"]', 1, 'Fat pad biopsy with Congo Red staining (showing apple-green birefringence) is a classic test.');

    -- CASE 16: Third-Degree (Complete) Heart Block
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syncope and a Slow Pulse', 'An 80-year-old female is brought in after fainting. Her pulse is 35 bpm and regular. ECG shows P waves at a rate of 90 bpm and QRS complexes at a rate of 35 bpm, with NO relationship between the two.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["First-degree AV block", "Mobitz I (Wenckebach)", "Mobitz II", "Third-degree AV block"]', 3, 'Complete AV dissociation is the definition of third-degree block.'),
    (v_case_id, 'What physical exam finding is associated with this condition?', '["Pulsus paradoxus", "Cannon a-waves in the JVP", "Opening snap", "S3"]', 1, 'Atria contract against a closed tricuspid valve when dissociation occurs.'),
    (v_case_id, 'What is the definitive treatment for this patient?', '["Atropine", "Beta-blocker", "Permanent Pacemaker", "Warfarin"]', 2, 'Complete heart block requires a pacemaker to prevent sudden cardiac death.');

    -- CASE 17: Coarctation of the Aorta
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypertension and Weak Leg Pulses', 'A 25-year-old male is found to have a BP of 170/100 mmHg in his right arm during a routine physical. On exam, he has strong pulses in his arms but very weak, delayed pulses in his groins (femoral arteries).', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aortic Stenosis", "Coarctation of the Aorta", "Renal Artery Stenosis", "Pheochromocytoma"]', 1, 'Brachial-femoral pulse delay + upper extremity hypertension = Coarctation.'),
    (v_case_id, 'What classic finding would you see on a Chest X-ray?', '["Boot-shaped heart", "Rib Notching and the 3-sign", "Egg-on-a-string", "Water bottle heart"]', 1, 'Rib notching is due to collateral circulation through intercostal arteries.'),
    (v_case_id, 'This condition is most commonly associated with which genetic syndrome?', '["Down Syndrome", "Turner Syndrome", "Marfan Syndrome", "DiGeorge Syndrome"]', 1, 'Coarctation and Bicuspid Aortic Valve are common in Turner patients (45,X).');

    -- CASE 18: Acute Mitral Regurgitation (Papillary Muscle Rupture)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-MI Dyspnea and a New Murmur', 'A 60-year-old male is hospitalized for an inferior MI. On day 4, he suddenly develops severe respiratory distress and a new, loud holosystolic murmur at the apex.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely complication?', '["Ventricular Septal Rupture", "Papillary Muscle Rupture leading to Acute MR", "Free wall rupture", "Dressler Syndrome"]', 1, 'Inferior MI often involves the RCA, which supplies the posteromedial papillary muscle.'),
    (v_case_id, 'What is the expected hemodynamic consequence?', '["Sudden drop in Left Atrial pressure", "Sudden rise in Left Atrial pressure and Pulmonary Edema", "Right heart failure only", "Increased Cardiac Output"]', 1, 'Acute MR causes massive backflow into a non-compliant LA, leading to flash pulmonary edema.'),
    (v_case_id, 'What is the definitive management?', '["Nitroglycerin and Diuretics", "Emergency Surgical Repair/Replacement", "Beta-blockers", "Thrombolytics"]', 1, 'Mechanical complications of MI require surgical intervention.');

    -- CASE 19: Ventricular Septal Defect (Post-MI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-MI Murmur with an "Oxygen Step-up"', 'A 68-year-old female presents 3 days after an anterior MI with a new, harsh holosystolic murmur at the left sternal border and worsening BP. A right heart catheterization shows an "oxygen step-up" from the RA to the RV.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Mitral Regurgitation", "Ventricular Septal Rupture (VSD)", "Free Wall Rupture", "Pericarditis"]', 1, 'VSD causes a left-to-right shunt, increasing the oxygen saturation in the RV compared to the RA.'),
    (v_case_id, 'In which type of MI is this complication most common?', '["Inferior", "Anterior", "Lateral", "Posterior"]', 1, 'VSR is more common following large anterior wall infarctions (LAD).'),
    (v_case_id, 'What is the prognosis without surgical repair?', '["Excellent", "Poor (> 90% mortality)", "Good with medical therapy", "Stable"]', 1, 'VSR leads to cardiogenic shock and has a very high mortality rate without surgery.');

    -- CASE 20: Restrictive Pericarditis (Constrictive)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'JVP Increase on Inspiration', 'A 50-year-old male with a history of radiation therapy for Hodgkin''s lymphoma presents with worsening SOB and fatigue. On exam, his neck veins become more distended when he takes a deep breath. Echo shows a thickened, calcified pericardium.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the JVP finding described?', '["Levine sign", "Kussmaul''s Sign", "Beck''s triad", "Hamman''s sign"]', 1, 'Kussmaul''s sign is the paradoxical increase in JVP on inspiration.'),
    (v_case_id, 'What is the characteristic sound heard in this condition?', '["S3", "Pericardial Knock", "S4", "Opening Snap"]', 1, 'The "knock" occurs when ventricular filling is abruptly halted by the rigid pericardium.'),
    (v_case_id, 'What is the treatment for symptomatic patients?', '["Diuretics", "Pericardiectomy", "Colchicine", "Nitrates"]', 1, 'Surgical removal of the stiff pericardium (pericardiectomy) is required.');

    -- CASE 21: Bicuspid Aortic Valve
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Early Onset Aortic Stenosis', 'A 55-year-old male (younger than the typical AS patient) presents with exertional dyspnea and a systolic murmur. Echo shows a calcified aortic valve with only two leaflets.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Senile calcific AS", "Bicuspid Aortic Valve", "Rheumatic AS", "Syphilitic aortitis"]', 1, 'Bicuspid valves develop calcification and stenosis 10-20 years earlier than normal tri-leaflet valves.'),
    (v_case_id, 'What other aortic pathology is this condition associated with?', '["Aortic Aneurysm and Dissection", "Aortic Atresia", "Normal aorta", "Venous thrombosis"]', 0, 'Patients with bicuspid valves often have an underlying aortopathy (weakness of the aortic wall).'),
    (v_case_id, 'What is the inheritance pattern of bicuspid aortic valve?', '["Autosomal recessive", "Autosomal dominant with incomplete penetrance", "X-linked", "Mitochondrial"]', 1, 'It is the most common congenital heart defect, often showing familial clustering.');

    -- CASE 22: Myocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chest Pain and HF Symptoms in a Young Adult', 'A 24-year-old male presents with 2 days of chest pain and worsening SOB. He had a flu-like illness 10 days ago. ECG shows ST changes and labs show elevated troponin. Coronary angiography is completely normal. Echo shows a globally reduced EF.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute MI", "Viral Myocarditis", "Pericarditis", "Pulmonary Embolism"]', 1, 'Recent viral illness + heart failure symptoms + elevated troponin with clean coronaries = Myocarditis.'),
    (v_case_id, 'Which virus is most commonly implicated?', '["Hepatitis A", "Coxsackievirus B", "EBV", "HIV"]', 1, 'Coxsackie B and Adenovirus are classic causes.'),
    (v_case_id, 'What is the gold standard for diagnosis?', '["Echo", "Endomyocardial Biopsy", "Cardiac MRI", "CT scan"]', 1, 'Though Cardiac MRI is often used in practice, biopsy is the definitive gold standard.');

    -- CASE 23: Vasovagal Syncope
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fainting after a Blood Draw', 'A 20-year-old medical student faints immediately after seeing a large needle during a blood draw. She felt "warm and nauseated" before falling. She woke up within 30 seconds and feels fine now.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cardiac arrhythmia", "Vasovagal Syncope", "Seizure", "Hypoglycemia"]', 1, 'Triggered by a stressful stimulus; preceded by a prodrome (nausea, warmth).'),
    (v_case_id, 'What is the underlying mechanism?', '["Abrupt withdrawal of sympathetic tone and increase in vagal tone", "Sudden spike in blood sugar", "Cerebral hemorrhage", "Heart block"]', 0, 'Leads to bradycardia and/or hypotension (hypoperfusion of the brain).'),
    (v_case_id, 'What is the most appropriate management?', '["Pacemaker", "Reassurance and avoidance of triggers", "Daily aspirin", "Anti-epileptic drugs"]', 1, 'Vasovagal syncope is benign and managed with education and hydration.');

    -- CASE 24: Mobitz I (Wenckebach)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive PR Interval Lengthening', 'A 50-year-old male is noted to have a slow pulse on routine exam. ECG shows a PR interval that gradually lengthens with each beat until a QRS complex is "dropped," after which the cycle repeats.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["First-degree AV block", "Second-degree AV block, Mobitz I", "Second-degree AV block, Mobitz II", "Third-degree block"]', 1, 'The "Going, Going, Gone" pattern.'),
    (v_case_id, 'Where is the level of the block usually located?', '["SA node", "AV node", "Bundle of His", "Left bundle branch"]', 1, 'Mobitz I is almost always at the level of the AV node and is usually benign.'),
    (v_case_id, 'What is the management in an asymptomatic patient?', '["Pacemaker", "Observe and monitor", "Atropine", "Isoproterenol"]', 1, 'No treatment is typically needed for asymptomatic Mobitz I.');

    -- CASE 25: Mobitz II Heart Block
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Dropped Beats without Warning', 'A 75-year-old female presents with near-syncope. Her ECG shows a constant PR interval, but some P-waves are suddenly NOT followed by a QRS complex.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz I", "Mobitz II", "Wenckebach", "SVT"]', 1, 'Sudden drop without PR prolongation.'),
    (v_case_id, 'Where is the level of the block usually located?', '["AV node", "Infranodal (Bundle of His or Purkinje system)", "Atria", "SA node"]', 1, 'Mobitz II is more dangerous because it occurs below the AV node.'),
    (v_case_id, 'What is the definitive management for this patient?', '["Permanent Pacemaker", "Wait and see", "Aspirin", "Digoxin"]', 0, 'Mobitz II has a high risk of progressing to complete heart block.');

    -- CASE 26: Ventricular Tachycardia (Pulseless)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Code Blue: Wide Complex Tachycardia', 'You are called to a "Code Blue." The patient is unresponsive and has no pulse. The monitor shows a regular, wide-complex tachycardia at a rate of 180 bpm.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm?', '["SVT", "Ventricular Tachycardia (VT)", "Atrial Fibrillation", "Sinus Tachycardia"]', 1, 'Regular wide-complex tachycardia is VT until proven otherwise.'),
    (v_case_id, 'What is the immediate management for a pulseless patient in this rhythm?', '["Amiodarone IV", "Synchronized cardioversion", "Unsynchronized Defibrillation and CPR", "Adenosine"]', 2, 'Pulseless VT/VFib are "shockable" rhythms requiring immediate unsynchronized defibrillation.'),
    (v_case_id, 'If the patient HAD a pulse but was hypotensive (Unstable), what would be the treatment?', '["Adenosine", "Synchronized Cardioversion", "Lidocaine", "Metoprolol"]', 1, 'Sustained VT with a pulse but instability requires synchronized cardioversion.');

    -- CASE 27: Torsades de Pointes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Twisting around the Point', 'A patient with severe hypomagnesemia develops a "twisting" wide-complex tachycardia on the monitor. The QRS complexes seem to shift in polarity around the isoelectric line.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm called?', '["Ventricular Fibrillation", "Torsades de Pointes", "SVT", "AFib"]', 1, 'A form of polymorphic VT associated with prolonged QT interval.'),
    (v_case_id, 'What is the first-line treatment for Torsades?', '["Potassium", "Magnesium Sulfate IV", "Calcium Gluconate", "Lidocaine"]', 1, 'Magnesium stabilizes the cardiac membrane.'),
    (v_case_id, 'Which of the following medications is most likely to trigger this rhythm?', '["Aspirin", "Erythromycin or Sotalol", "Lisinopril", "Metoprolol"]', 1, 'Many drugs (ABCDE: Anti-arrhythmics, Biotics, C-psychotics, Depressants, Emetically active) can prolong the QT interval.');

    -- CASE 28: Supraventricular Tachycardia (AVNRT)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Racing Heart and Neck Pulsations', 'A 25-year-old female presents with sudden onset "racing heart." Her HR is 180 bpm and regular. Her ECG shows a narrow-complex tachycardia with no visible P-waves.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sinus Tachycardia", "Supraventricular Tachycardia (SVT/AVNRT)", "VT", "AFib"]', 1, 'Regular narrow-complex tachycardia in a young person is usually SVT.'),
    (v_case_id, 'What is the first-line bedside maneuver to attempt to stop this rhythm?', '["Precordial thump", "Vagal maneuvers (e.g., Valsalva or Carotid sinus massage)", "Coughing", "Standing up"]', 1, 'Vagal maneuvers increase AV nodal delay and can break the re-entrant circuit.'),
    (v_case_id, 'What is the first-line pharmacological treatment if maneuvers fail?', '["Amiodarone", "Adenosine (rapid IV push)", "Epinephrine", "Atropine"]', 1, 'Adenosine causes transient AV block and is diagnostic/therapeutic for SVT.');

    -- CASE 29: Pericardial Effusion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Muffled Sounds and Large Water-Bottle Heart', 'A patient with severe hypothyroidism presents with dyspnea. Her heart sounds are distant. Chest X-ray shows a massively enlarged cardiac silhouette shaped like a "water bottle." BP is 110/70 (Stable).', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Heart Failure", "Pericardial Effusion", "Pneumonia", "Lung Cancer"]', 1, 'The "water-bottle" heart is characteristic of a large effusion.'),
    (v_case_id, 'What ECG finding is characteristic of a large effusion?', '["ST elevation", "Electrical Alternans (alternating QRS height)", "Delta waves", "Short PR"]', 1, 'Due to the heart swinging within the fluid.'),
    (v_case_id, 'How is this distinguished from Tamponade?', '["Presence of fluid on echo", "Clinical stability (BP/JVP) vs. Shock", "Size of the heart", "Presence of a murmur"]', 1, 'Tamponade is a clinical diagnosis of hemodynamic compromise (shock). Effusion can be asymptomatic if it develops slowly.');

    -- CASE 30: Hypertensive Emergency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blurry Vision and Extremely High BP', 'A 55-year-old male presents with a headache and blurry vision. His BP is 220/130 mmHg. Fundoscopic exam shows papilledema and flame-shaped hemorrhages.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hypertensive Urgency", "Hypertensive Emergency", "Stroke", "Brain tumor"]', 1, 'BP > 180/120 WITH evidence of end-organ damage (e.g., papilledema) is an emergency.'),
    (v_case_id, 'What is the goal for blood pressure reduction in the first hour?', '["Drop to 120/80 immediately", "Reduce Mean Arterial Pressure (MAP) by no more than 25% (except in dissection/stroke)", "Drop SBP by 100 mmHg", "No change"]', 1, 'Rapid over-correction can cause cerebral ischemia.'),
    (v_case_id, 'Which of the following is a preferred IV agent for this condition?', '["Oral Lisinopril", "IV Nitroprusside, Nicardipine, or Labetalol", "IV Furosemide", "Oral Clonidine"]', 1, 'Parenteral, titratable antihypertensives are required.');

    RAISE NOTICE 'SUCCESS: Cardiology Case Blocks (1-30) registered.';
END $$;

COMMIT;
