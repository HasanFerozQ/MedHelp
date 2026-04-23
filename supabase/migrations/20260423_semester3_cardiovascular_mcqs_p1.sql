-- Migration: Semester 3 - Cardiovascular MCQ Bank (PART 1: 1-100)
-- Date: 2026-04-23

BEGIN;

-- 1. Ensure Topic "Cardiovascular" exists for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'Cardiovascular', 'cardiovascular', 50)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'cardiovascular' LIMIT 1;

    -- SECTION 1: EMBRYOLOGY & ANATOMY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ductus arteriosus is embryologically derived from which aortic arch?', '["Third", "Fourth", "Fifth", "Sixth"]', 3, 'The ductus arteriosus is derived from the distal portion of the left 6th aortic arch.'),
    (v_topic_id, 'In right-dominant circulation, the AV nodal artery typically arises from:', '["Left circumflex", "Right coronary artery", "LAD", "Left main"]', 1, 'In 85% of people (right-dominant), the PDA (which gives off the AV nodal artery) arises from the RCA.'),
    (v_topic_id, 'Aorta lying anterior and to the right of the pulmonary artery (TGA) failure of:', '["Endocardial cushions", "Neural crest spiraling", "Septum secundum", "Septum primum"]', 1, 'TGA results from failure of the aorticopulmonary septum to spiral (neural crest dependent).'),
    (v_topic_id, 'Structure forming the most posterior part of heart; enlargement causes dysphagia:', '["Right atrium", "Right ventricle", "Left atrium", "Left ventricle"]', 2, 'The left atrium lies directly anterior to the esophagus; enlargement can compress it.'),
    (v_topic_id, 'Endocardial cushion defect in Down syndrome failure of:', '["Septum secundum", "Truncus arteriosus", "Atrioventricular septum", "Sinus venosus"]', 2, 'Endocardial cushions contribute to the AV septum and valves.');

    -- SECTION 2: CARDIAC PHYSIOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Stroke volume 70 mL, EDV 120 mL, HR 80 bpm. What is the Ejection Fraction?', '["42%", "58%", "65%", "70%"]', 1, 'EF = (SV / EDV) x 100. (70/120) = 58.3%.'),
    (v_topic_id, 'PV loop point representing closing of the aortic valve?', '["Point of max pressure", "Top left corner", "Bottom right", "Bottom left"]', 1, 'The top left corner marks end of systole and start of isovolumetric relaxation.'),
    (v_topic_id, 'Response to sudden increase in carotid sinus baroreceptor firing?', '["High sympathetic", "Low vagal", "High resistance", "Low heart rate/contractility"]', 3, 'High BP triggers parasympathetic (vagal) tone and decreases sympathetic tone.'),
    (v_topic_id, 'Frank-Starling law: increase in venous return leads to high stroke volume due to:', '["High inotropy", "Increased end-diastolic myofibril stretch", "Low afterload", "High HR"]', 1, 'Frank-Starling relates preload (stretch) to output; distinct from extrinsic inotropy.'),
    (v_topic_id, 'Phase 2 (plateau) of ventricular action potential channels?', '["Phase 0", "Phase 1", "Phase 2", "Phase 3"]', 2, 'Phase 2 is the plateau phase where calcium influx balances potassium efflux.');

    -- SECTION 3: ISCHEMIC HEART DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Crushing chest pain, ST elevation in II, III, aVF. Artery?', '["LAD", "LCX", "RCA", "Left Main"]', 2, 'Leads II, III, and aVF look at the inferior wall, supplied by the RCA.'),
    (v_topic_id, 'New harsh holosystolic murmur at left sternal border 4 days post-MI. Complication?', '["Free wall rupture", "Interventricular septal rupture", "Papillary rupture", "Dressler"]', 1, 'Septal rupture presents with new VSD murmur and left-to-right shunt.'),
    (v_topic_id, 'Chest pain at rest in early morning; ST elevation improves with Nitroglycerin:', '["Fixed plaque", "Plaque rupture", "Coronary vasospasm", "High demand"]', 2, 'Prinzmetal angina is caused by hyperreactivity of coronary smooth muscle.'),
    (v_topic_id, 'First cardiac biomarker to rise post-MI (least specific)?', '["Troponin I", "Troponin T", "CK-MB", "Myoglobin"]', 3, 'Myoglobin rises in 1-3 hours but is found in all muscle tissue.'),
    (v_topic_id, 'Autopsy: wavy fibers and contraction bands. MI timing?', '["1-4 hours", "12-24 hours", "3-7 days", "2 weeks"]', 1, 'Early coagulative necrosis (wavy fibers) is characteristic of the 12-24 hour window.');

    -- SECTION 4: HEART FAILURE & VALVULAR
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Harsh crescendo-decrescendo systolic murmur radiating to carotids:', '["Mitral regurgitation", "Aortic stenosis", "Aortic regurgitation", "Pulmonic stenosis"]', 1, 'Classic SAD triad (Syncope, Angina, Dyspnea) for Aortic Stenosis.'),
    (v_topic_id, 'Mid-systolic click and late systolic murmur occurring earlier with standing:', '["Mitral stenosis", "Mitral valve prolapse", "Aortic regurgitation", "Tricuspid regurg"]', 1, 'Standing decreases preload, making MVP click occur earlier in systole.'),
    (v_topic_id, 'Low-pitched rumbling diastolic murmur at apex preceded by opening snap:', '["Bicuspid", "Rheumatic heart disease", "Myxomatous", "Syphilitic aortitis"]', 1, 'Mitral stenosis is almost always a late sequela of rheumatic fever.'),
    (v_topic_id, 'Classic finding in chronic Aortic Regurgitation?', '["Pulsus parvus", "Widened pulse pressure and head bobbing", "Opening snap", "Weak femoral pulses"]', 1, 'Wide pulse pressure and "De Musset sign" (head bobbing) are classic AR findings.'),
    (v_topic_id, 'Drug class proven to decrease mortality in HF (EF 30%) by inhibiting remodeling?', '["Loop diuretics", "Digoxin", "ACE inhibitors", "Calcium blockers"]', 2, 'ACEi, ARBs, Beta-blockers, and Spironolactone improve survival.');

    -- SECTION 5: CONGENITAL HEART DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, ' "Boot-shaped" heart on X-ray is classic for:', '["TGA", "Tetralogy of Fallot", "Coarctation", "Ebstein"]', 1, 'RVH pushes the apex upward in Tetralogy of Fallot.'),
    (v_topic_id, 'Upper extremity HTN, weak lower pulses, rib notching. Associated syndrome?', '["Down", "Turner syndrome", "Marfan", "DiGeorge"]', 1, 'Coarctation of the aorta is highly associated with Turner syndrome (45,XO).'),
    (v_topic_id, 'Squatting during a "Tet spell" helps by:', '["Lower preload", "Increasing SVR", "Lower PVR", "High HR"]', 1, 'Squatting increases SVR, forcing more blood across VSD into the lungs.'),
    (v_topic_id, 'Eisenmenger syndrome occurs when:', '["R-to-L becomes L-to-R", "L-to-R reverses due to pulmonary HTN", "PDA fails to close", "Tricuspid displacement"]', 1, 'Chronic shunting causes PVR rise, reversing shunt to right-to-left (cyanosis).'),
    (v_topic_id, ' "Egg-on-a-string" X-ray in neonate of diabetic mother:', '["TOF", "Transposition of Great Vessels", "TAPVR", "Truncus"]', 1, 'TGA is associated with diabetic mothers and shows a narrow mediastinum.');

    -- SECTION 6: CARDIOMYOPATHIES & PERICARDIAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Young athlete sudden death; thickened interventricular septum. Inheritance?', '["AR", "X-linked", "Autosomal dominant", "Mitochondrial"]', 2, 'HCM is usually AD mutations in sarcomere proteins like Beta-MHC.'),
    (v_topic_id, 'Alcoholic biventricular HF; Echo shows dilated heart (EF 25%):', '["Eccentric hypertrophy", "Concentric", "Restrictive", "Constrictive"]', 0, 'Dilated cardiomyopathy involves volume overload and "eccentric" hypertrophy.'),
    (v_topic_id, '#1 cause of Restrictive Cardiomyopathy?', '["Alcohol", "Hemochromatosis", "Amyloidosis", "Coxsackie B"]', 2, 'Amyloidosis leads to stiff ventricles and impaired filling.'),
    (v_topic_id, 'Pleuritic pain relieved by leaning forward; diffuse ST elevation/PR depression:', '["MI", "Acute Pericarditis", "PE", "Dissection"]', 1, 'Classic ECG and positional findings for Pericarditis.'),
    (v_topic_id, 'Drop in systolic BP >10 mmHg during inspiration (Large effusion):', '["Kussmaul", "Pulsus paradoxus", "Electrical alternans", "Beck''s triad"]', 1, 'Pulsus paradoxus is commonly seen in cardiac tamponade.');

    -- SECTION 7: ARRHYTHMIAS & ECG
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Irregularly irregular rhythm, no P waves. High risk for:', '["VFib", "Embolic stroke", "Heart block", "Tamponade"]', 1, 'AFib causes blood stasis in LA appendage, leading to thrombus/stroke.'),
    (v_topic_id, 'Delta wave and shortened PR interval hallmark:', '["Long QT", "Wolff-Parkinson-White", "U waves", "ST depression"]', 1, 'WPW involves an accessory pathway (Bundle of Kent) bypassing AV node.'),
    (v_topic_id, 'QT interval 500 ms risk for which arrhythmia?', '["Atrial flutter", "Torsades de pointes", "1st degree block", "Mobitz II"]', 1, 'Long QT predisposes to polymorphic ventricular tachycardia.'),
    (v_topic_id, 'Progressive PR lengthening until a QRS is dropped:', '["1st degree", "Mobitz Type I (Wenckebach)", "Mobitz Type II", "3rd degree"]', 1, ' "Longer, longer, longer, drop, now you have a Wenckebach."'),
    (v_topic_id, 'Drug to rapidly reset SVT rhythm:', '["Digoxin", "Adenosine", "Lidocaine", "Amiodarone"]', 1, 'Adenosine hyperpolarizes the AV node to stop conduction.');

    -- SECTION 8: VASCULAR PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Tearing chest pain radiating to back, widened mediastinum:', '["MI", "Aortic dissection", "AAA", "Esophageal rupture"]', 1, 'Classic presentation for aortic dissection in hypertensive patients.'),
    (v_topic_id, 'Pulsatile abdominal mass in 65yo smoker. Underlying pathology?', '["Medial necrosis", "Atherosclerosis", "Syphilis", "Giant cell"]', 1, 'AAA is primarily driven by atherosclerosis and smoking.'),
    (v_topic_id, 'Young Japanese woman, weak pulse in arm, fever:', '["Temporal", "Takayasu arteritis", "PAN", "Buerger"]', 1, 'Takayasu ("pulseless disease") affects large vessels in young Asian women.'),
    (v_topic_id, 'Kawasaki disease complication concern?', '["Glomerulonephritis", "Coronary artery aneurysm", "MVP", "Edema"]', 1, 'Kawasaki (CRASH and Burn) requires monitoring for coronary aneurysms.'),
    (v_topic_id, 'Vasculitis associated with Hepatitis B; fibrinoid necrosis:', '["Wegener", "Microscopic", "Polyarteritis nodosa (PAN)", "Churg-Strauss"]', 2, 'PAN is a medium-vessel vasculitis often associated with Hep B.');

    -- SECTION 9: PHARMACOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Antihypertensive causing persistent dry cough:', '["Renin", "ACE", "Carbonic anhydrase", "HMG-CoA"]', 1, 'ACE inhibitors prevent bradykinin breakdown, causing cough.'),
    (v_topic_id, 'Electrolyte abnormality increasing Digoxin toxicity risk?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hyponatremia"]', 1, 'Digoxin competes with K+; low K+ allows more Digoxin binding.'),
    (v_topic_id, 'Selective Beta-1 Blocker example?', '["Propranolol", "Metoprolol", "Nadolol", "Timolol"]', 1, 'Selective B1 blockers (A-M: Atenolol, Metoprolol) are safer in asthma.'),
    (v_topic_id, 'Calcium channel blocker causing gingival hyperplasia:', '["Nifedipine", "Verapamil", "Hydralazine", "Lisinopril"]', 0, 'DHP CCBs like Nifedipine cause edema and gingival hyperplasia.'),
    (v_topic_id, 'Nitroglycerin mechanism?', '["PDE-5 inhibition", "Increasing cGMP via NO", "Calcium block", "Alpha-2 activation"]', 1, 'Nitrates provide NO, increasing cGMP for smooth muscle relaxation.');

    -- SECTION 10: MISC PATHOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'IV drug user endocarditis most likely valve?', '["Mitral", "Aortic", "Tricuspid", "Pulmonary"]', 2, 'Right-sided endocarditis (S. aureus) is typical in IVDUs.'),
    (v_topic_id, ' "Tumor plop" heard during diastole; constitutional symptoms:', '["Rhabdomyoma", "Atrial myxoma", "Melanoma", "Libman-Sacks"]', 1, 'Atrial myxoma is the most common primary adult heart tumor.'),
    (v_topic_id, 'Libman-Sacks endocarditis association?', '["Rheumatic", "SLE", "Marantic", "Dental"]', 1, 'SLE-associated endocarditis involves sterile vegetations on both sides.'),
    (v_topic_id, 'Tertiary syphilis primary CV effect?', '["Mitral", "Aortic vasa vasorum", "Coronary", "Pericardium"]', 1, 'Syphilitic aortitis leads to "tree-barking" and root dilation.'),
    (v_topic_id, 'Marfan syndrome patient highest risk:', '["Coarctation", "Aortic dissection", "Pulmonic stenosis", "ASD"]', 1, 'Cystic medial necrosis predisposes to root dilation and dissection.');

    -- SECTION 11: HEMODYNAMICS & ACTION POTENTIAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'During exercise, which parameter decreases?', '["HR", "CO", "TPR", "MAP"]', 2, 'Vasodilation in muscle and local metabolites drop Total Peripheral Resistance.'),
    (v_topic_id, 'Carotid sinus massage effect?', '["High sympathetic", "High pressure on chemoreceptor", "Increases CN IX firing", "Low vagal"]', 2, 'Mimics high BP, increasing glossopharyngeal firing and parasympathetic tone.'),
    (v_topic_id, 'Slowest conduction velocity in the heart?', '["Purkinje", "Atrial", "Ventricular", "AV node"]', 3, 'AV node delay allows for ventricular filling (Parks At Ventura Ave).'),
    (v_topic_id, 'PE primary physiological change in pulmonary circuit?', '["Low dead space", "High PVR", "Low RV afterload", "L-to-R shunt"]', 1, 'PE increases RV afterload by obstructing flow and causing vasoconstriction.'),
    (v_topic_id, 'Increased inotropy PV loop representation?', '["Bottom-right right", "Top-left left and upward", "Wide right", "Narrow"]', 1, 'Increased inotropy increases ESPVR slope, lowering ESV.');

    -- SECTION 12: ANTIARRHYTHMICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Class IA antiarrhythmic causing reversible SLE-like syndrome?', '["Quinidine", "Procainamide", "Disopyramide", "Lidocaine"]', 1, 'Associated with drug-induced lupus in slow acetylators.'),
    (v_topic_id, 'Cinchonism (tinnitus/headache) antiarrhythmic side effect?', '["Amiodarone", "Quinidine", "Flecainide", "Verapamil"]', 1, 'Quinidine classic toxicity.'),
    (v_topic_id, 'Class III agents primarily block which channel?', '["Na+", "Beta", "K+", "Ca2+"]', 2, 'Prolong repolarization (Phase 3) and action potential duration.'),
    (v_topic_id, 'Amiodarone monitoring requirement?', '["Oto", "Pulmonary fibrosis", "Gingival", "Bladder"]', 1, 'Long half-life; requires lung, thyroid, and liver monitoring.'),
    (v_topic_id, 'Class IB agent used for life-threatening ventricular arrhythmias?', '["Lidocaine", "Metoprolol", "Ibutilide", "Diltiazem"]', 0, 'Lidocaine/Mexiletine prefer ischemic/depolarized tissues.');

    -- SECTION 13: LIPIDS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Enzyme inhibited by Statins?', '["LPL", "HMG-CoA reductase", "CETP", "PCSK9"]', 1, 'Statins inhibit the rate-limiting step of cholesterol synthesis.'),
    (v_topic_id, 'Niacin flush mediator?', '["Histamine", "Prostaglandins", "Leukotrienes", "Bradykinin"]', 1, 'Mediated by prostaglandins; blunted by Aspirin.'),
    (v_topic_id, 'Lipid agent causing gallstones by inhibiting 7-alpha-hydroxylase?', '["Ezetimibe", "Fibrates", "Sequestrants", "PCSK9"]', 1, 'Fibrates increase cholesterol excretion into bile.'),
    (v_topic_id, 'Lipoprotein carrying most cholesterol from liver to tissues?', '["Chylomicrons", "VLDL", "LDL", "HDL"]', 2, 'LDL ("Bad") delivers; HDL ("Good") performs reverse transport.'),
    (v_topic_id, 'Tendon xanthomas hallmark of:', '["Type I", "Type IIa Familial Hypercholesterolemia", "Type IV", "Hypo"]', 1, 'Defective LDL receptors lead to high LDL and tendon deposition.');

    -- SECTION 14: HTN & HF CLINICAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'First-line HTN drug for African American demographic?', '["ACEi", "Beta-blocker", "Thiazide or CCB", "Spironolactone"]', 2, 'JNC 8 recommends Thiazides or CCBs as initial therapy.'),
    (v_topic_id, 'Best diuretic for acute pulmonary edema?', '["HCTZ", "Furosemide", "Acetazolamide", "Spironolactone"]', 1, 'Loop diuretics are potent/rapid-acting for preload reduction.'),
    (v_topic_id, ' "S3" heart sound common association?', '["Hypertrophy", "Dilated cardiomyopathy (volume overload)", "MS", "AS"]', 1, 'Early diastolic sound of sloshing in a floppy ventricle.'),
    (v_topic_id, ' "S4" heart sound association?', '["Healthy children", "AFib", "Stiff ventricles (Concentric)", "MR"]', 2, 'Atrial kick into a non-compliant ventricle; absent in AFib.'),
    (v_topic_id, 'Contraindicated in bilateral renal artery stenosis?', '["Amlodipine", "Enalapril", "Metoprolol", "Chlorthalidone"]', 1, 'ACEi reduce efferent constriction, tanking GFR in stenosis.');

    -- SECTION 15: RARE SYNDROMES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Brugada syndrome ECG pattern?', '["Long PR", "Pseudo-RBBB and ST elevation V1-V3", "Short QT", "Q waves"]', 1, 'Sodium channelopathy common in Asian males; sudden death risk.'),
    (v_topic_id, 'Child with "elfin" facies and supravalvular aortic stenosis:', '["Marfan", "Williams syndrome", "Noonan", "DiGeorge"]', 1, 'Microdeletion on chromosome 7 (elastin gene).'),
    (v_topic_id, 'Parasite causing DCM and mega-esophagus in South America?', '["Toxoplasma", "Trypanosoma cruzi", "Falciparum", "Echinococcus"]', 1, 'Chagas disease (T. cruzi).'),
    (v_topic_id, ' "Nutmeg liver" (centrilobular congestion) sign of:', '["MI", "Left HF", "Right-sided heart failure", "Portal HTN"]', 2, 'Venous backup from IVC/hepatic veins.'),
    (v_topic_id, 'Splenic "flea-bitten" appearance (petechial hemorrhages):', '["Angina", "Malignant hypertension", "Mono", "Myocarditis"]', 1, 'Hyperplastic arteriolosclerosis/necrotizing arteriolitis.');

    -- SECTION 16: INFLAMMATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '#1 cause of subacute bacterial endocarditis (damaged valves)?', '["S. aureus", "Viridans streptococci", "S. bovis", "Coxiella"]', 1, 'Enter blood via dental work; adhere via dextrans.'),
    (v_topic_id, 'Next step if endocarditis caused by Streptococcus bovis?', '["Echo", "Colonoscopy", "Renal biopsy", "CT Head"]', 1, 'S. bovis is strongly associated with colorectal cancer.'),
    (v_topic_id, 'Beck''s Triad (Cardiac Tamponade)?', '["Fever/Murmur/Splinter", "Hypotension, JVD, Muffled sounds", "HTN/Brady", "Pain/Rub"]', 1, 'Indicates restricted filling due to fluid.'),
    (v_topic_id, 'Rheumatic fever heart damage mechanism?', '["Viral", "Type II Hypersensitivity (molecular mimicry)", "Type III", "Exotoxin"]', 1, 'Antibodies against Strep M-protein cross-react with myosin.'),
    (v_topic_id, 'Aschoff bodies and Anitschkow cells hallmark:', '["Sarcoidosis", "Rheumatic myocarditis", "Endocarditis", "Amyloid"]', 1, 'Microscopic hallmarks of acute rheumatic carditis.');

    -- SECTION 17: VASCULITIS II
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Sinusitis, hemoptysis, hematuria; c-ANCA positive:', '["Microscopic", "Granulomatosis with polyangiitis (Wegener)", "Goodpasture", "EGPA"]', 1, 'Triad: upper/lower respiratory and renal involvement.'),
    (v_topic_id, 'Vasculitis: asthma, peripheral eosinophilia, p-ANCA:', '["Wegener", "Churg-Strauss", "Kawasaki", "HSP"]', 1, 'Eosinophilic Granulomatosis with Polyangiitis (EGPA).'),
    (v_topic_id, 'Temporal (Giant Cell) Arteritis association?', '["RA", "Polymyalgia rheumatica", "SLE", "PAN"]', 1, 'Stiffness in shoulders and hips in 50% of GCA patients.'),
    (v_topic_id, 'Untreated Temporal Arteritis danger?', '["Stroke", "Blindness", "Rupture", "Renal"]', 1, 'Ophthalmic artery occlusion leads to permanent vision loss.'),
    (v_topic_id, 'Young male smoker, gangrene of fingertips:', '["Raynaud", "Thromboangiitis obliterans (Buerger)", "Takayasu", "Scleroderma"]', 1, 'Segmental thrombosing vasculitis linked to tobacco.');

    -- SECTION 18: PHYSIOLOGY II
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'When is Left Ventricle coronary flow at maximum?', '["Early systole", "Late systole", "Early diastole", "Isovolumetric contraction"]', 2, 'Myocardium compresses arteries during systole; flow is diastolic.'),
    (v_topic_id, 'Resistance proportional to which power of radius?', '["2nd", "3rd", "4th", "5th"]', 2, 'Poiseuille Law: R is inversely proportional to r^4.'),
    (v_topic_id, 'Organ with highest blood flow per gram of tissue?', '["Brain", "Liver", "Kidneys", "Heart"]', 2, 'Kidneys receive ~25% of CO despite small size.'),
    (v_topic_id, 'Primary driver of blood flow in Brain/Heart?', '["Skin", "Muscle", "Autoregulation (Metabolic control)", "Lungs"]', 2, 'Controlled by local metabolites like CO2 and Adenosine.'),
    (v_topic_id, 'PVR decrease during high CO cause?', '["Constriction", "Recruitment and distension of capillaries", "Sympathetic", "Low volume"]', 1, 'Pulmonary vessels dilate to accommodate flow, preventing high pressures.');

    -- SECTION 19: CLINICAL DIAGNOSIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Sharp pleuritic pain, friction rub on exam:', '["Angina", "Pericarditis", "Dissection", "Pneumothorax"]', 1, 'Friction rub is highly specific for pericarditis.'),
    (v_topic_id, 'Kussmaul sign (JVP increase on inspiration) seen in:', '["Tamponade", "Constrictive pericarditis", "Right HF", "Tension PTX"]', 1, 'Rigid pericardium prevents expansion for inspiratory return.'),
    (v_topic_id, ' "Water-hammer" pulse association?', '["MS", "Aortic regurgitation", "PDA", "Both B and C"]', 3, 'Rapid runoff leads to high-stroke-volume bounding pulse.'),
    (v_topic_id, '#1 cause of sudden death first 48 hrs post-MI?', '["Arrhythmia", "Free wall rupture", "Papillary rupture", "Shock"]', 0, 'VFib is the leading early cause of death.'),
    (v_topic_id, 'ECG: "Electrical Alternans" (varying QRS heights):', '["HyperK", "WPW", "Large effusion/tamponade", "Digoxin"]', 2, 'Heart "swinging" in a bag of fluid.');

    -- SECTION 20: INTEGRATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Keep PDA open in cyanotic neonate?', '["Indomethacin", "Alprostadil (PGE1)", "Aspirin", "Celecoxib"]', 1, ' "PGE1 keeps the PDA open."'),
    (v_topic_id, 'Increase in pulse pressure common cause?', '["HF", "AS", "Aging (stiffened arteries)", "Tachy"]', 2, 'Decreased compliance increases systolic/lowers diastolic.'),
    (v_topic_id, ' "String of beads" renal artery angiography:', '["Atherosclerosis", "Fibromuscular dysplasia", "PAN", "Buerger"]', 1, 'Non-inflammatory disease of young women; secondary HTN.'),
    (v_topic_id, 'Sensitive marker for RE-infarction within first week?', '["Trop I", "Trop T", "CK-MB", "LDH"]', 2, 'Troponins stay high for 10 days; CK-MB drops in 48 hrs.'),
    (v_topic_id, 'Orthostatic hypotension physiological cause?', '["Hyper baroreceptor", "Decreased venous return and failed tachycardia", "High symp", "ADH"]', 1, 'Reflex arc failure or hypovolemia.');

    RAISE NOTICE 'SUCCESS: Cardiovascular MCQ Part 1 (1-100) registered.';
END $$;

COMMIT;
