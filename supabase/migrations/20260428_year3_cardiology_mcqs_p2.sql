-- Migration: Year 3 - Cardiology MCQ Bank (PART 2: 101-200)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiology' LIMIT 1;

    -- SECTION 6: ADVANCED ARRHYTHMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '101: Which antiarrhythmic class is most associated with "Use Dependence," where sodium channel blockade increases at higher heart rates?', '["Class IA", "Class IB", "Class IC", "Class III"]', 2, 'Class IC agents (e.g., Flecainide) have slow dissociation from Na+ channels, showing strong use-dependence. (Harrison''s Ch. 263)'),
    (v_topic_id, '102: What is the most appropriate next step for a patient with symptomatic 3rd-degree heart block?', '["Atropine", "Transcutaneous pacing", "Wait and watch", "Epinephrine"]', 1, 'Temporary pacing is required until a permanent pacemaker can be placed. (Pocket Medicine: Cardiology)'),
    (v_topic_id, '103: Which rhythm is characterized by three or more distinct P-wave morphologies and a heart rate >100 bpm, often seen in COPD?', '["Atrial Fibrillation", "Multifocal Atrial Tachycardia (MAT)", "Atrial Flutter", "Sinus Arrhythmia"]', 1, 'MAT is highly associated with underlying pulmonary disease. (Step-Up to Medicine)'),
    (v_topic_id, '104: A patient with AFib has a CHADS2-VASc score of 4. What is the recommended long-term management?', '["Aspirin", "Aspirin + Clopidogrel", "Oral Anticoagulation (DOAC or Warfarin)", "No treatment"]', 2, 'Scores >= 2 in men or >= 3 in women strongly favor anticoagulation. (Harrison''s Ch. 263)'),
    (v_topic_id, '105: "Ashman phenomenon" refers to:', '["ST elevation in V1-V3", "Aberrant conduction of a supraventricular impulse following a long-short R-R sequence", "Delta waves in WPW", "U waves in hypokalemia"]', 1, 'Commonly seen in AFib, where a long cycle followed by a short cycle results in a wide QRS (often RBBB). (Pocket Medicine)'),
    (v_topic_id, '106: Which antiarrhythmic agent is contraindicated in patients with structural heart disease (e.g., post-MI) due to increased proarrhythmic risk?', '["Amiodarone", "Flecainide", "Metoprolol", "Lidocaine"]', 1, 'CAST trial showed increased mortality with IC agents in post-MI patients. (Harrison''s Ch. 263)'),
    (v_topic_id, '107: What is the classic ECG finding in Brugada syndrome?', '["Short PR interval", "Pseudo-RBBB and ST elevation in V1-V3", "Long QT interval", "Diffuse ST depression"]', 1, 'Sodium channelopathy common in Asian males; carries high risk of sudden cardiac death. (Harrison''s Ch. 263)'),
    (v_topic_id, '108: Which Class IA antiarrhythmic is known for causing cinchonism (tinnitus, headache)?', '["Procainamide", "Quinidine", "Disopyramide", "Lidocaine"]', 1, 'Quinidine toxicity causes "Cinchonism." (Step-Up to Medicine)'),
    (v_topic_id, '109: Procainamide is famously associated with causing which reversible condition?', '["Pulmonary fibrosis", "Drug-induced SLE (Lupus)", "Gingival hyperplasia", "Tendon rupture"]', 1, 'Associated with positive ANA and anti-histone antibodies. (Pocket Medicine)'),
    (v_topic_id, '110: Which electrolyte abnormality potentiates Digoxin toxicity even if Digoxin levels are normal?', '["Hyperkalemia", "Hypokalemia", "Hyponatremia", "Hypomagnesemia"]', 1, 'Low potassium allows more Digoxin to bind to the Na+/K+ ATPase pump. (Harrison''s Ch. 272)');

    -- SECTION 7: CARDIOMYOPATHIES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '111: Which cardiomyopathy is characterized by stiff ventricles with impaired diastolic filling but relatively normal systolic function?', '["Dilated", "Hypertrophic", "Restrictive", "Arrhythmogenic"]', 2, 'Restrictive CM involves stiff walls, often due to infiltration (e.g., amyloid). (Harrison''s Ch. 274)'),
    (v_topic_id, '112: The most common primary cause of restrictive cardiomyopathy worldwide is:', '["Amyloidosis", "Sarcoidosis", "Hemochromatosis", "Endomyocardial fibrosis"]', 0, 'Amyloidosis (AL or ATTR) is the leading cause. (Pocket Medicine)'),
    (v_topic_id, '113: Which finding on cardiac MRI is classic for cardiac amyloidosis?', '["Thin ventricular walls", "Diffuse subendocardial gadolinium enhancement", "Focal apical scarring", "Normal enhancement"]', 1, 'Late gadolinium enhancement is highly suggestive of amyloid infiltration. (Harrison''s Ch. 274)'),
    (v_topic_id, '114: A patient with HFE gene mutation and "bronze diabetes" is at risk for which cardiomyopathy?', '["Dilated", "Restrictive", "Both Dilated and Restrictive", "Hypertrophic"]', 2, 'Hemochromatosis can cause a mixed picture, initially restrictive and later dilated. (Step-Up)'),
    (v_topic_id, '115: What is the most common cause of non-ischemic dilated cardiomyopathy in the USA?', '["Cocaine", "Alcohol", "Idiopathic", "Viral Myocarditis"]', 2, 'Idiopathic remains the #1 label, though many have genetic or post-viral origins. (Harrison''s Ch. 274)'),
    (v_topic_id, '116: "Takotsubo cardiomyopathy" (Broken Heart Syndrome) classically shows which feature on Echo?', '["Basal ballooning", "Apical ballooning", "Global hypokinesis", "Septal hypertrophy"]', 1, 'Apical akinesis with basal hyperkinesis, often triggered by stress. (Pocket Medicine)'),
    (v_topic_id, '117: Which medication should be used as first-line therapy for symptomatic Hypertrophic Cardiomyopathy (HCM)?', '["Digoxin", "Beta-blockers (e.g., Metoprolol)", "ACE Inhibitors", "Nifedipine"]', 1, 'Beta-blockers or non-DHP CCBs increase diastolic filling and reduce outflow gradient. (Harrison''s Ch. 274)'),
    (v_topic_id, '118: "Myocyte disarray" on histology is pathognomonic for:', '["Amyloidosis", "HCM", "Dilated CM", "Myocarditis"]', 1, 'Haphazardly arranged myocytes are the microscopic hallmark of HCM. (Harrison''s Ch. 274)'),
    (v_topic_id, '119: Which virus is most commonly implicated in acute viral myocarditis?', '["HIV", "Coxsackie B", "EBV", "Hepatitis C"]', 1, 'Coxsackievirus B and Adenovirus are classic causes. (Step-Up)'),
    (v_topic_id, '120: Chagas disease (Trypanosoma cruzi) causes which cardiac complication?', '["Hypertrophic CM", "Dilated CM and conduction blocks", "Aortic stenosis", "Pericardial effusion"]', 1, 'Common in South America; also causes megaesophagus/megacolon. (Harrison''s Ch. 274)');

    -- SECTION 8: CONGENITAL HEART DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: Which ASD type is the most common?', '["Ostium primum", "Ostium secundum", "Sinus venosus", "Coronary sinus"]', 1, 'Secundum defects (75-80%) occur in the region of the fossa ovalis. (Harrison''s Ch. 271)'),
    (v_topic_id, '122: Patent Foramen Ovale (PFO) is a risk factor for which clinical event?', '["Pulmonary edema", "Paradoxical embolism (Stroke)", "Right heart failure", "Myocarditis"]', 1, 'Venous thrombi can cross to the left heart and embolize to the brain. (Pocket Medicine)'),
    (v_topic_id, '123: Which congenital defect is characterized by "differential cyanosis" (cyanosis of lower extremities but not upper)?', '["ASD", "VSD", "PDA with Eisenmenger", "TOF"]', 2, 'Shunted deoxygenated blood enters the aorta distal to the left subclavian. (Harrison''s Ch. 271)'),
    (v_topic_id, '124: The "3" sign on CXR is associated with:', '["Aortic dissection", "Coarctation of the aorta", "Atrial myxoma", "Pericardial effusion"]', 1, 'Due to pre-stenotic and post-stenotic dilation of the aorta. (Step-Up)'),
    (v_topic_id, '125: Which condition is associated with a "continuous machinery murmur" at the infraclavicular area?', '["Mitral Regurgitation", "VSD", "Patent Ductus Arteriosus (PDA)", "Aortic Stenosis"]', 2, 'Murmur persists through both systole and diastole. (Harrison''s Ch. 271)'),
    (v_topic_id, '126: Ebstein anomaly is often associated with which accessory pathway syndrome?', '["Long QT", "Wolff-Parkinson-White (WPW)", "Brugada", "Sick Sinus Syndrome"]', 1, 'Type B WPW is common in these patients. (Pocket Medicine)'),
    (v_topic_id, '127: Which syndrome is characterized by supravalvular aortic stenosis and "elfin" facies?', '["Down", "Turner", "Williams", "Noonan"]', 2, 'Deletion on chromosome 7 including the elastin gene. (Harrison''s Ch. 271)'),
    (v_topic_id, '128: Turner Syndrome (45, XO) is most strongly associated with which cardiac defect?', '["VSD", "Bicuspid aortic valve and Coarctation", "TOF", "Tricuspid Atresia"]', 1, 'Up to 30% of Turner patients have these left-sided defects. (Step-Up)'),
    (v_topic_id, '129: What is the most common congenital heart defect at birth?', '["ASD", "VSD", "PDA", "TOF"]', 1, 'VSD is the most common overall; many close spontaneously. (Harrison''s Ch. 271)'),
    (v_topic_id, '130: The most common cyanotic congenital heart disease manifesting in the neonatal period is:', '["TOF", "Transposition of the Great Arteries (TGA)", "TAPVR", "Truncus Arteriosus"]', 1, 'TGA presents with cyanosis immediately at birth; TOF often presents later. (Pocket Medicine)');

    -- SECTION 9: VASCULAR PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '131: An Abdominal Aortic Aneurysm (AAA) is defined as a diameter greater than:', '["2 cm", "3 cm", "5 cm", "10 cm"]', 1, '3.0 cm is the threshold for aneurysm; screening recommended for male smokers 65-75. (Harrison''s Ch. 281)'),
    (v_topic_id, '132: What is the #1 risk factor for the development of an Abdominal Aortic Aneurysm?', '["Hypertension", "Diabetes", "Cigarette Smoking", "Hyperlipidemia"]', 2, 'Smoking is the most potent risk factor for AAA. (Step-Up)'),
    (v_topic_id, '133: Sudden severe "tearing" chest pain with a BP difference between arms (>20 mmHg) suggests:', '["MI", "Aortic Dissection", "Pulmonary Embolism", "Pneumothorax"]', 1, 'Asymmetric pulses or BP are key physical exam clues for dissection. (Harrison''s Ch. 281)'),
    (v_topic_id, '134: Which underlying pathological process is most common in patients with thoracic aortic dissection?', '["Atherosclerosis", "Cystic Medial Necrosis", "Syphilis", "Giant Cell Arteritis"]', 1, 'Medial degeneration is the hallmark, often exacerbated by HTN or Marfan. (Harrison''s Ch. 281)'),
    (v_topic_id, '135: A patient with Marfan syndrome is most at risk for which aortic complication?', '["Atherosclerosis", "Abdominal Aneurysm", "Ascending Aortic Dissection", "Aortic Coarctation"]', 2, 'Marfan patients develop root dilation and dissections at young ages. (Pocket Medicine)'),
    (v_topic_id, '136: What is the recommended management for a Stanford Type B aortic dissection without complications?', '["Urgent surgery", "Medical management (IV Beta-blockers)", "PCI", "Thrombolytics"]', 1, 'Type B is typically managed medically unless there is organ ischemia or rupture. (Harrison''s Ch. 281)'),
    (v_topic_id, '137: Which vessel is most commonly affected in Fibromuscular Dysplasia (FMD)?', '["Celiac artery", "Renal artery", "Radial artery", "Femoral artery"]', 1, 'FMD causes "string of beads" appearance and secondary HTN in young women. (Step-Up)'),
    (v_topic_id, '138: "Leriche syndrome" (aortoiliac occlusive disease) clinical triad includes:', '["Claudication, Fever, Rash", "Claudication, Impotence, Absent femoral pulses", "Pain, Jaundice, Mass", "HTN, Bradycardia, Miosis"]', 1, 'Due to chronic occlusion at the aortic bifurcation. (Pocket Medicine)'),
    (v_topic_id, '139: An Ankle-Brachial Index (ABI) of 0.6 indicates:', '["Normal flow", "Mild-to-moderate Peripheral Artery Disease (PAD)", "Severe ischemia", "Non-compressible vessels"]', 1, 'Normal is 0.9–1.3; <0.9 is diagnostic of PAD. (Harrison''s Ch. 282)'),
    (v_topic_id, '140: Which medication is used specifically to improve walking distance in patients with claudication?', '["Aspirin", "Cilostazol", "Warfarin", "Lisinopril"]', 1, 'Cilostazol (PDE-3 inhibitor) provides symptomatic relief in PAD. (Harrison''s Ch. 282)');

    -- SECTION 10: PERICARDIAL DISEASE II
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '141: What is the most common cause of acute pericarditis in developed countries?', '["Tuberculosis", "Uremia", "Idiopathic (likely Viral)", "Autoimmune"]', 2, 'Most cases follow a viral prodrome (e.g., Coxsackie). (Harrison''s Ch. 275)'),
    (v_topic_id, '142: Which finding on ECG is most suggestive of an acute pericardial effusion?', '["Low voltage QRS", "ST elevation", "Large U waves", "Narrow QRS"]', 0, 'Fluid insulates the heart, reducing the electrical signal reaching the leads. (Pocket Medicine)'),
    (v_topic_id, '143: "Pericardial knock" is a physical exam finding associated with:', '["Acute pericarditis", "Cardiac tamponade", "Constrictive pericarditis", "Restrictive CM"]', 2, 'An early diastolic sound occurring as ventricular filling is abruptly halted by the rigid sac. (Harrison''s Ch. 275)'),
    (v_topic_id, '144: Which surgery is the definitive treatment for symptomatic constrictive pericarditis?', '["Pericardiocentesis", "Pericardial Window", "Pericardiectomy", "Valve replacement"]', 2, 'Complete removal of the calcified/rigid pericardium. (Step-Up)'),
    (v_topic_id, '145: "Dressler Syndrome" is an autoimmune pericarditis that typically occurs:', '["24 hours post-MI", "2-6 weeks post-MI", "6 months post-MI", "During the MI"]', 1, 'A delayed immune-mediated response to myocardial antigens. (Harrison''s Ch. 269)'),
    (v_topic_id, '146: Which medication is often added to NSAIDs to reduce the recurrence of acute pericarditis?', '["Prednisone", "Colchicine", "Aspirin", "Azathioprine"]', 1, 'Colchicine significantly reduces recurrence rates. (Pocket Medicine)'),
    (v_topic_id, '147: Pericardiocentesis is the immediate treatment for:', '["Constrictive Pericarditis", "Cardiac Tamponade", "Uremic Pericarditis", "Viral Pericarditis"]', 1, 'Removal of fluid is life-saving in tamponade. (Step-Up)'),
    (v_topic_id, '148: Which JVP finding is classic for cardiac tamponade?', '["Prominent y-descent", "Absent y-descent", "Prominent a-wave", "Absent a-wave"]', 1, 'The y-descent is blunted because the heart cannot fill rapidly in diastole. (Harrison''s Ch. 275)'),
    (v_topic_id, '149: "Tree-bark" appearance of the aorta is a classic pathological description of:', '["Atherosclerosis", "Syphilitic aortitis", "Aortic dissection", "Takayasu"]', 1, 'Due to scarring of the media from endarteritis of the vasa vasorum. (Harrison''s Ch. 281)'),
    (v_topic_id, '150: Water-bottle heart silhouette on CXR suggests:', '["Hypertrophy", "Large pericardial effusion", "COPD", "Pneumonia"]', 1, 'Occurs when >250mL of fluid accumulates. (Step-Up)');

    -- Continue filling 151-200 with specific clinical focus
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: What is the drug of choice for hypertensive emergency with aortic dissection?', '["Hydralazine", "Esmolol + Nitroprusside", "Nifedipine", "Clonidine"]', 1, 'Esmolol (Beta-blocker) must be given first to reduce heart rate/shear stress. (Harrison''s Ch. 281)'),
    (v_topic_id, '152: Which physical maneuver decreases the intensity of an Aortic Stenosis murmur?', '["Squatting", "Handgrip", "Leg raise", "Inspiration"]', 1, 'Handgrip increases afterload, reducing the pressure gradient across the aortic valve. (Pocket Medicine)'),
    (v_topic_id, '153: A "tumor plop" heard in diastole is characteristic of:', '["Myocarditis", "Atrial Myxoma", "S3 gallop", "Mitral Stenosis"]', 1, 'The mass swinging through the mitral orifice. (Harrison''s Ch. 278)'),
    (v_topic_id, '154: Which valve is most commonly affected by Libman-Sacks endocarditis (sterile vegetations) in SLE?', '["Tricuspid", "Aortic", "Mitral", "Pulmonic"]', 2, 'Vegetations can occur on both sides of the mitral valve. (Harrison''s Ch. 361)'),
    (v_topic_id, '155: "Flea-bitten" kidney appearance is seen in:', '["Benign HTN", "Malignant HTN", "Minimal change disease", "Diabetes"]', 1, 'Due to petechial hemorrhages from necrotizing arteriolitis. (Step-Up)'),
    (v_topic_id, '156: Which test is most useful for diagnosing heart failure with preserved ejection fraction (HFpEF)?', '["ECG", "Stress Test", "Echocardiogram (with Doppler for diastology)", "Chest X-ray"]', 2, 'Doppler assesses E/A ratios and tissue velocities (e''). (Harrison''s Ch. 272)'),
    (v_topic_id, '157: First-line medication for African-American patients with hypertension (without CKD)?', '["Lisinopril", "Chlorthalidone or Amlodipine", "Metoprolol", "Spironolactone"]', 1, 'JNC 8 recommends Thiazides or CCBs as initial therapy in this group. (Pocket Medicine)'),
    (v_topic_id, '158: Which artery is primarily involved in "Giant Cell Arteritis"?', '["Aorta", "Temporal Artery", "Renal Artery", "Coronary Artery"]', 1, 'Can lead to permanent blindness if not treated with steroids. (Harrison''s Ch. 363)'),
    (v_topic_id, '159: Jaw claudication and scalp tenderness are hallmarks of:', '["PAN", "Temporal Arteritis", "Takayasu", "Wegener''s"]', 1, 'Strongly associated with Polymyalgia Rheumatica. (Step-Up)'),
    (v_topic_id, '160: Kawasaki disease primarily affects which size of blood vessels?', '["Small", "Medium", "Large", "Capillaries"]', 1, 'Medium-vessel vasculitis; coronary aneurysms are a major risk. (Harrison''s Ch. 363)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '161: Which medication should be given immediately to all patients with suspected acute coronary syndrome?', '["Beta-blocker", "Aspirin (325 mg chewed)", "Statins", "Warfarin"]', 1, 'Chewed aspirin provides the fastest antiplatelet effect. (Harrison''s Ch. 268)'),
    (v_topic_id, '162: "Holiday Heart Syndrome" refers to which arrhythmia triggered by binge drinking?', '["V-tach", "Atrial Fibrillation", "Heart Block", "SVT"]', 1, 'Alcohol is a common reversible trigger for paroxysmal AFib. (Pocket Medicine)'),
    (v_topic_id, '163: Which heart sound is often the first sign of a stiff ventricle in a patient with HTN?', '["S1", "S2", "S3", "S4"]', 3, 'S4 (atrial gallop) indicates reduced ventricular compliance. (Step-Up)'),
    (v_topic_id, '164: A paradoxical split of S2 (split on expiration, not inspiration) is seen in:', '["ASD", "Left Bundle Branch Block (LBBB) or Aortic Stenosis", "RBBB", "Pulmonic Stenosis"]', 1, 'Delayed LV emptying causes A2 to occur after P2. (Harrison''s Ch. 264)'),
    (v_topic_id, '165: Which condition is associated with "Osler-Weber-Rendu" syndrome and pulmonary AVMs?', '["HCM", "Hereditary Hemorrhagic Telangiectasia", "Marfan", "Ehlers-Danlos"]', 1, 'Can cause right-to-left shunting and paradoxical emboli. (Harrison''s Ch. 283)'),
    (v_topic_id, '166: Most common primary malignancy to metastasize to the heart?', '["Lung Cancer", "Breast Cancer", "Melanoma", "Lymphoma"]', 2, 'Melanoma has a high tropism for the myocardium. (Harrison''s Ch. 278)'),
    (v_topic_id, '167: "Cannon a-waves" in the JVP are seen in:', '["AFib", "AV Dissociation (e.g., 3rd degree block)", "Mitral Regurgitation", "Tricuspid Stenosis"]', 1, 'Occurs when the atrium contracts against a closed tricuspid valve. (Harrison''s Ch. 264)'),
    (v_topic_id, '168: Which medication is used for pharmacologic stress testing in patients unable to exercise?', '["Dobutamine", "Adenosine", "Regadenoson", "All of the above"]', 3, 'Dobutamine (inotropic) or Vasodilators (Adenosine/Regadenoson) are used. (Pocket Medicine)'),
    (v_topic_id, '169: "Carvallo sign" (increased murmur with inspiration) helps distinguish:', '["AS from MR", "TR from MR", "MS from AS", "VSD from ASD"]', 1, 'Tricuspid regurgitation (TR) increases with inspiration; Mitral regurgitation (MR) does not. (Harrison''s Ch. 264)'),
    (v_topic_id, '170: Which finding on a 12-lead ECG is most suggestive of right ventricular hypertrophy (RVH)?', '["Left Axis Deviation", "Dominant R-wave in V1", "Q waves in II, III, aVF", "Short PR"]', 1, 'V1 normally has a small R and deep S; in RVH, the R becomes dominant. (Step-Up)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '171: What is the treatment of choice for a patient in Ventricular Fibrillation (V-fib)?', '["Amiodarone", "Lidocaine", "Immediate Defibrillation", "Epinephrine"]', 2, 'Defibrillation is the only effective way to terminate V-fib. (Harrison''s Ch. 299)'),
    (v_topic_id, '172: Which antiplatelet agent irreversibly inhibits P2Y12 receptors?', '["Aspirin", "Clopidogrel", "Ticagrelor", "Abciximab"]', 1, 'Clopidogrel and Prasugrel are irreversible; Ticagrelor is reversible. (Pocket Medicine)'),
    (v_topic_id, '173: "ST elevation in all leads except aVR" is classic for:', '["STEMI", "Acute Pericarditis", "Early Repolarization", "Hyperkalemia"]', 1, 'Pericarditis shows diffuse concave ST elevation. (Step-Up)'),
    (v_topic_id, '174: Which valvular abnormality is most associated with hemolytic anemia and schistocytes?', '["Mitral Prolapse", "Mechanical Heart Valve", "Aortic Stenosis", "Tricuspid Regurg"]', 1, 'Turbulent flow across a prosthetic valve can shear RBCs. (Harrison''s Ch. 273)'),
    (v_topic_id, '175: "Pulsus alternans" (alternating strong and weak pulses) is a sign of:', '["Tamponade", "Severe Left Ventricular Failure", "Aortic Regurgitation", "Hyperthyroidism"]', 1, 'Indicates a very poorly functioning left ventricle. (Harrison''s Ch. 264)'),
    (v_topic_id, '176: Which medication improves survival in patients with HFrEF and NYHA Class II-IV symptoms by blocking the effects of Neprilysin?', '["Lisinopril", "Sacubitril/Valsartan (ARNI)", "Eplerenone", "Dapagliflozin"]', 1, 'ARNI therapy is superior to ACEi alone in reduced EF heart failure. (Harrison''s Ch. 272)'),
    (v_topic_id, '177: What is the most common side effect of Hydralazine?', '["Bradycardia", "Drug-induced Lupus", "Cough", "Hyperkalemia"]', 1, 'Also causes reflex tachycardia and fluid retention. (Pocket Medicine)'),
    (v_topic_id, '178: Which artery is the "Gold Standard" for coronary artery bypass grafting (CABG)?', '["Saphenous vein", "Internal Mammary Artery (LIMA)", "Radial artery", "Gastroepiploic artery"]', 1, 'LIMA has the highest long-term patency rates. (Harrison''s Ch. 270)'),
    (v_topic_id, '179: "Bifid pulse" (Pulsus bisferiens) is typically heard in:', '["Aortic Stenosis", "Aortic Regurgitation or HCM", "Mitral Stenosis", "Tamponade"]', 1, 'Two systolic peaks in the arterial pulse. (Harrison''s Ch. 264)'),
    (v_topic_id, '180: Which ECG change is seen first in hyperkalemia?', '["ST elevation", "Peaked T-waves", "Wide QRS", "Loss of P-waves"]', 1, 'Progresses to PR lengthening, then QRS widening (sine wave). (Step-Up)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: Which antiarrhythmic Class prolongs Phase 0 depolarization?', '["Class I", "Class II", "Class III", "Class IV"]', 0, 'Sodium channel blockers (Class I) slow the upstroke of the action potential. (Harrison''s Ch. 263)'),
    (v_topic_id, '182: A patient has a regular narrow-complex tachycardia at 150 bpm. Vagal maneuvers fail. Next step?', '["Amiodarone", "Adenosine", "Beta-blocker", "Diltiazem"]', 1, 'Adenosine is both diagnostic and therapeutic for SVT. (Pocket Medicine)'),
    (v_topic_id, '183: "U waves" on ECG are associated with:', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hypocalcemia"]', 1, 'Occur after the T-wave; often seen with ST depression. (Step-Up)'),
    (v_topic_id, '184: Which lipid agent is most likely to cause myopathy, especially when combined with a Statin?', '["Niacin", "Fibrates (e.g., Gemfibrozil)", "Ezetimibe", "Sequestrants"]', 1, 'Gemfibrozil inhibits the glucuronidation of statins, increasing levels. (Harrison''s Ch. 412)'),
    (v_topic_id, '185: "S3" heart sound in an elderly patient always indicates:', '["Normal finding", "Pathological (likely Heart Failure)", "Atrial contraction", "Valve closure"]', 1, 'Normal in children/pregnant women, but pathological in adults >40. (Step-Up)'),
    (v_topic_id, '186: Which medication is used to close a PDA in a premature infant?', '["Prostaglandin E1", "Indomethacin", "Dopamine", "Digoxin"]', 1, 'NSAIDs inhibit the prostaglandins that keep the ductus open. (Harrison''s Ch. 271)'),
    (v_topic_id, '187: "Boot-shaped heart" is seen in Tetralogy of Fallot because of:', '["Left heart failure", "Right Ventricular Hypertrophy", "Aortic aneurysm", "Pericardial effusion"]', 1, 'The apex is pushed up and rounded. (Step-Up)'),
    (v_topic_id, '188: Which murmur is louder with Squatting and softer with Valsalva?', '["HCM", "Mitral Valve Prolapse", "Aortic Stenosis", "Both A and B are incorrect"]', 2, 'Increased preload (squatting) increases flow across the stenotic valve. (Pocket Medicine)'),
    (v_topic_id, '189: Most common symptom of chronic Peripheral Artery Disease?', '["Edema", "Intermittent Claudication", "Rest Pain", "Ulceration"]', 1, 'Aching pain in calves induced by exercise and relieved by rest. (Harrison''s Ch. 282)'),
    (v_topic_id, '190: "Blue toe syndrome" is a sign of:', '["Venous stasis", "Atheroembolism", "Raynaud", "Buerger"]', 1, 'Cholesterol crystals breaking off from a proximal plaque. (Harrison''s Ch. 282)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '191: Which heart sound is produced by the closure of the AV valves (Mitral/Tricuspid)?', '["S1", "S2", "S3", "S4"]', 0, 'Occurs at the start of ventricular systole. (Harrison''s Ch. 264)'),
    (v_topic_id, '192: Which congenital defect shows a "rib-notching" pattern on CXR?', '["ASD", "VSD", "Coarctation of the Aorta", "TOF"]', 2, 'Due to dilated intercostal arteries. (Step-Up)'),
    (v_topic_id, '193: First-line medication for rate control in AFib with RVR?', '["Amiodarone", "Beta-blocker or Calcium Channel Blocker", "Digoxin", "Lidocaine"]', 1, 'Metoprolol or Diltiazem/Verapamil are standard. (Pocket Medicine)'),
    (v_topic_id, '194: "Electrical alternans" is associated with:', '["Myocardial infarction", "Cardiac Tamponade", "Hypokalemia", "WPW"]', 1, 'Varying QRS height. (Harrison''s)'),
    (v_topic_id, '195: Mechanism of action of Clopidogrel?', '["COX-1 inhibitor", "P2Y12 receptor antagonist", "GP IIb/IIIa inhibitor", "PDE inhibitor"]', 1, 'Prevents ADP-induced platelet aggregation. (Harrison''s Ch. 268)'),
    (v_topic_id, '196: Which finding on Echo is most suggestive of Mitral Stenosis?', '["Systolic anterior motion", "Doming of the leaflets in diastole (Hockey-stick)", "Prolapse", "Vegetation"]', 1, 'Due to restricted leaflet tips but flexible bodies. (Harrison''s Ch. 273)'),
    (v_topic_id, '197: "Wide fixed splitting of S2" is the classic finding for:', '["Mitral Regurg", "ASD", "VSD", "LBBB"]', 1, 'Found in large Atrial Septal Defects. (Step-Up)'),
    (v_topic_id, '198: Which drug is a potent vasodilator used in Hypertensive Emergency that can cause Cyanide toxicity?', '["Nitroglycerin", "Sodium Nitroprusside", "Hydralazine", "Labetalol"]', 1, 'Metabolized to NO and 5 cyanide ions. (Pocket Medicine)'),
    (v_topic_id, '199: The "Mid-systolic Click" of MVP occurs EARLIER with which maneuver?', '["Squatting", "Standing or Valsalva", "Handgrip", "Leg raise"]', 1, 'Decreased preload (standing) makes the LV smaller, causing earlier prolapse. (Harrison''s Ch. 273)'),
    (v_topic_id, '200: Which cardiomyopathy is classically associated with "Low Voltage" on ECG despite "Thickened Walls" on Echo?', '["HCM", "Cardiac Amyloidosis", "Dilated CM", "Athlete''s Heart"]', 1, 'Infiltrative material is not electrically active. (Harrison''s Ch. 274)');

    RAISE NOTICE 'SUCCESS: Cardiology MCQ Part 2 (101-200) registered.';
END $$;

COMMIT;
