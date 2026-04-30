BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for ECG Interpretation
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ecg-interpretation' LIMIT 1;

    -- CASE 01: Normal Sinus Rhythm and Basics
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Routine Pre-Op ECG', 'A healthy 25-year-old male is having a routine ECG before a minor orthopedic surgery. The rate is 70 bpm, with a P wave before every QRS, a PR interval of 160 ms, and a QRS duration of 80 ms.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the upper limit of a normal PR interval?', '["120 ms", "200 ms (5 small boxes)", "240 ms", "300 ms"]', 1, 'A normal PR interval is 120-200 ms. Greater than 200 ms indicates a first-degree AV block.'),
    (v_case_id, 'What is the upper limit of a normal QRS duration?', '["80 ms", "100 ms", "120 ms (3 small boxes)", "150 ms"]', 2, 'A normal QRS is less than 120 ms. 120 ms or more indicates a bundle branch block or ventricular origin.'),
    (v_case_id, 'The standard ECG paper speed is 25 mm/sec. How much time is represented by one small box (1 mm)?', '["0.01 sec", "0.02 sec", "0.04 sec", "0.1 sec"]', 2, 'One small box is 0.04 seconds; one large box (5 small boxes) is 0.20 seconds.');

    -- CASE 02: Sinus Bradycardia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Marathon Runner', 'A 28-year-old elite athlete presents for a physical. His pulse is 45 bpm. An ECG shows a sinus rhythm with a rate of 45 bpm and otherwise normal intervals.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sick Sinus Syndrome", "Sinus Bradycardia", "First-degree AV block", "Junctional rhythm"]', 1, 'Sinus bradycardia is common in well-conditioned athletes due to high vagal tone.'),
    (v_case_id, 'Which medication class is a frequent pharmacological cause of sinus bradycardia?', '["ACE inhibitors", "Beta-blockers", "Calcium channel blockers (Dihydropyridines)", "Diuretics"]', 1, 'Beta-blockers and non-dihydropyridine CCBs (Verapamil/Diltiazem) slow the SA node.'),
    (v_case_id, 'If this patient were symptomatic (e.g., dizzy), what would be the first-line pharmacotherapy?', '["Epinephrine", "Amiodarone", "Atropine", "Adenosine"]', 2, 'Atropine is the first-line drug for symptomatic bradycardia to block vagal input.');

    -- CASE 03: Atrial Fibrillation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Palpitations and an Irregular Pulse', 'An 72-year-old male with hypertension and obesity presents with palpitations. On exam, his pulse is "irregularly irregular." An ECG shows no discernible P waves and a variable R-R interval.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Atrial Flutter", "Multifocal Atrial Tachycardia", "Atrial Fibrillation", "Sinus Arrhythmia"]', 2, 'Atrial fibrillation is characterized by an irregularly irregular rhythm and absence of P waves.'),
    (v_case_id, 'What is the most significant long-term risk associated with this rhythm?', '["Ventricular fibrillation", "Ischemic stroke", "Pulmonary hypertension", "Aortic dissection"]', 1, 'Stasis in the left atrial appendage leads to thrombus formation and embolization (stroke).'),
    (v_case_id, 'Which scoring system is used to determine the need for anticoagulation in this patient?', '["CHADS2-VASc", "NYHA Classification", "Gleason Score", "TIMI Score"]', 0, 'CHA2DS2-VASc scores patients based on age, sex, and comorbidities to assess stroke risk.');

    -- CASE 04: Atrial Flutter
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sawtooth Pattern', 'A 65-year-old male with COPD presents with shortness of breath. The ECG shows a regular atrial rate of 300 bpm with a "sawtooth" appearance in leads II, III, and aVF, and a ventricular rate of 150 bpm.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Atrial Fibrillation", "Atrial Flutter", "Ventricular Tachycardia", "Paroxysmal SVT"]', 1, 'Atrial flutter typically presents with regular "F" waves in a sawtooth pattern, often with a 2:1 AV block.'),
    (v_case_id, 'What is the typical atrial rate in Atrial Flutter?', '["150-200 bpm", "250-350 bpm", "400-600 bpm", "> 600 bpm"]', 1, 'The atrial rate is usually around 300 bpm, leading to a ventricular rate of 150 bpm in 2:1 conduction.'),
    (v_case_id, 'What is the definitive long-term treatment for recurrent atrial flutter?', '["Amiodarone", "Digoxin", "Catheter ablation of the cavotricuspid isthmus", "Pacemaker"]', 2, 'Ablation has a very high success rate for typical atrial flutter.');

    -- CASE 05: Paroxysmal Supraventricular Tachycardia (PSVT)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Onset Fast Heartbeat', 'A 25-year-old female presents to the ER with sudden onset palpitations. Her ECG shows a regular, narrow-complex tachycardia at 180 bpm. P waves are not clearly seen.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line non-pharmacological maneuver to try?', '["Precordial thump", "Vagal maneuvers (e.g., carotid sinus massage, Valsalva)", "Defibrillation", "Exercise"]', 1, 'Vagal maneuvers can terminate many SVTs by slowing AV node conduction.'),
    (v_case_id, 'If maneuvers fail, what is the first-line pharmacological treatment?', '["Lidocaine", "Adenosine", "Atropine", "Magnesium"]', 1, 'Adenosine briefly blocks the AV node and can "reset" the rhythm or reveal the underlying atrial activity.'),
    (v_case_id, 'How is Adenosine administered?', '["Slow IV push over 5 minutes", "Rapid IV bolus followed by a saline flush", "Orally", "Intramuscularly"]', 1, 'Adenosine has an extremely short half-life (< 10 seconds) and must reach the heart rapidly.');

    -- CASE 06: Wolff-Parkinson-White (WPW) Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Slurred Upstroke', 'A 19-year-old male with occasional palpitations has an ECG showing a short PR interval (< 120 ms) and a "slurred" upstroke to the QRS complex, known as a delta wave.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this syndrome?', '["Lown-Ganong-Levine", "Brugada", "Wolff-Parkinson-White (WPW)", "Long QT Syndrome"]', 2, 'WPW is caused by an accessory pathway (Bundle of Kent) that bypasses the AV node.'),
    (v_case_id, 'Which medication is CONTRAINDICATED if this patient develops Atrial Fibrillation?', '["Verapamil", "Procainamide", "Ibutilide", "Amiodarone"]', 0, 'AV nodal blockers (Verapamil, Digoxin, Beta-blockers) can force all impulses down the accessory pathway, leading to VF.'),
    (v_case_id, 'What is the preferred treatment for a patient with symptomatic WPW?', '["Chronic beta-blockers", "Radiofrequency catheter ablation of the accessory pathway", "Lifelong warfarin", "Implantable cardioverter-defibrillator (ICD)"]', 1, 'Ablation is curative for WPW.');

    -- CASE 07: 1st Degree AV Block
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'A Long Delay', 'During a check-up, a 60-year-old male has an ECG showing a PR interval of 280 ms. Every P wave is followed by a QRS complex, and the rhythm is regular.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sinus bradycardia", "First-degree AV block", "Mobitz I", "Mobitz II"]', 1, 'First-degree AV block is defined as a fixed PR interval > 200 ms with 1:1 conduction.'),
    (v_case_id, 'What is the clinical significance of an asymptomatic first-degree AV block?', '["High risk of sudden death", "Usually benign and requires no treatment", "Requires urgent pacing", "Indicates an acute MI"]', 1, 'Asymptomatic first-degree block is generally benign and common in elderly patients or those on AV nodal blockers.'),
    (v_case_id, 'Where is the anatomical site of the delay in this condition?', '["SA node", "Atrial muscle", "AV node", "Purkinje fibers"]', 2, 'The delay almost always occurs within the AV node.');

    -- CASE 08: 2nd Degree AV Block - Mobitz I (Wenckebach)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Going, Going, Gone...', 'A 70-year-old male is admitted with a syncopal episode. His ECG shows a progressively lengthening PR interval until a QRS complex is dropped, and then the cycle repeats.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this rhythm?', '["Mobitz I (Wenckebach)", "Mobitz II", "Third-degree block", "Sinoatrial exit block"]', 0, 'Mobitz I is characterized by "longer, longer, longer, drop."'),
    (v_case_id, 'What is the typical site of block in Mobitz I?', '["AV Node", "Bundle of His", "Left Bundle Branch", "Right Bundle Branch"]', 0, 'Mobitz I usually occurs in the AV node and has a better prognosis than Mobitz II.'),
    (v_case_id, 'Which of the following is true regarding the treatment of asymptomatic Mobitz I?', '["Requires a permanent pacemaker", "Observation is usually sufficient", "Requires immediate atropine", "Is a surgical emergency"]', 1, 'Asymptomatic patients usually only require observation and monitoring.');

    -- CASE 09: 2nd Degree AV Block - Mobitz II
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Random Drop', 'A 75-year-old male presents with lightheadedness. His ECG shows a constant PR interval (200 ms), but occasionally a P wave is NOT followed by a QRS complex. There is no progressive lengthening of the PR.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz I", "Mobitz II", "Third-degree block", "Sinus arrest"]', 1, 'Mobitz II has a fixed PR interval with random "dropped" beats.'),
    (v_case_id, 'What is the clinical significance of Mobitz II compared to Mobitz I?', '["It is more benign", "It has a high risk of progressing to complete heart failure", "It has a high risk of progressing to third-degree AV block", "It only occurs in athletes"]', 2, 'Mobitz II is much more dangerous as it can suddenly progress to complete heart block.'),
    (v_case_id, 'What is the recommended management for Mobitz II?', '["Observation", "Exercise", "Permanent pacemaker", "Aspirin"]', 2, 'Because of the risk of progression to 3rd-degree block, a pacemaker is usually indicated even if the patient is asymptomatic.');

    -- CASE 10: 3rd Degree (Complete) AV Block
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Total Divorce', 'An 82-year-old female presents with severe dizziness and a pulse of 35 bpm. The ECG shows P waves occurring at a regular rate of 90 bpm and QRS complexes occurring at a regular rate of 35 bpm, but there is NO relationship between them.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Atrial Fibrillation", "Mobitz II", "Third-degree (Complete) AV Block", "SVT"]', 2, 'Total AV dissociation is the hallmark of 3rd-degree block.'),
    (v_case_id, 'If the QRS complexes in this patient were WIDE (> 120 ms), where is the likely escape pacemaker located?', '["AV Node", "Bundle of His", "Ventricles", "SA Node"]', 2, 'A ventricular escape rhythm is typically slow (20-40 bpm) and wide.'),
    (v_case_id, 'What is the definitive treatment for this patient?', '["Oral beta-blockers", "Permanent pacemaker", "Carotid massage", "Amiodarone infusion"]', 1, 'Complete heart block is a medical emergency requiring a permanent pacemaker.');

    -- CASE 11: STEMI - Anterior Wall
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Crushing Chest Pain', 'A 55-year-old male presents with 30 minutes of crushing substernal chest pain. The ECG shows 4 mm of ST-segment elevation in leads V1, V2, V3, and V4.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which territory is the myocardial infarction occurring?', '["Inferior", "Lateral", "Anterior", "Posterior"]', 2, 'Elevation in V1-V4 indicates an anterior wall MI.'),
    (v_case_id, 'Which coronary artery is most likely occluded?', '["Right Coronary Artery (RCA)", "Left Circumflex (LCX)", "Left Anterior Descending (LAD)", "Left Main"]', 2, 'The LAD supplies the anterior wall and septum.'),
    (v_case_id, 'If you also see ST-segment DEPRESSION in leads II, III, and aVF, what does this represent?', '["Multi-vessel disease", "Reciprocal changes", "Atrial infarction", "Normal finding"]', 1, 'ST depression in leads opposite the site of the MI is a classic reciprocal change that helps confirm the diagnosis.');

    -- CASE 12: STEMI - Inferior Wall
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Epigastric Pain and Nausea', 'A 62-year-old male smoker presents with "indigestion" and nausea. An ECG is performed and shows ST elevation in leads II, III, and aVF.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Anterior MI", "Inferior MI", "Lateral MI", "Septal MI"]', 1, 'Leads II, III, and aVF look at the inferior wall of the heart.'),
    (v_case_id, 'Which artery is occluded in 85% of patients with this MI?', '["LAD", "LCX", "Right Coronary Artery (RCA)", "Left Main"]', 2, 'The RCA is dominant in most people and supplies the inferior wall via the PDA.'),
    (v_case_id, 'This patient suddenly becomes hypotensive after being given Nitroglycerin. What should you suspect?', '["Anaphylaxis", "Right Ventricular (RV) Infarction", "Aortic dissection", "Cardiac tamponade"]', 1, 'RV infarction often accompanies inferior MIs and is preload-dependent; Nitroglycerin (a venodilator) can crash the blood pressure. Treatment is IV fluids.');

    -- CASE 13: STEMI - Lateral Wall
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Lateral ST Elevation', 'A 50-year-old female presents with chest pressure. Her ECG shows ST elevation in leads I, aVL, V5, and V6.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which wall is involved?', '["Inferior", "Septal", "Lateral", "Posterior"]', 2, 'I, aVL, V5, and V6 are the lateral leads.'),
    (v_case_id, 'Which artery typically supplies the lateral wall?', '["LAD", "Left Circumflex (LCX)", "RCA", "Small marginal branch"]', 1, 'The LCX supplies the lateral wall of the left ventricle.'),
    (v_case_id, 'Leads I and aVL are often referred to as:', '["Low lateral leads", "High lateral leads", "Septal leads", "Precordial leads"]', 1, 'I and aVL are high lateral; V5 and V6 are low lateral.');

    -- CASE 14: Pericarditis vs. STEMI
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pleuritic Chest Pain', 'A 28-year-old male presents with sharp chest pain that is worse when lying flat and better when leaning forward. His ECG shows diffuse, concave-upwards ST elevation in almost all leads, and PR-segment depression in lead II.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute STEMI", "Acute Pericarditis", "Pulmonary Embolism", "Pneumothorax"]', 1, 'Diffuse ST elevation and PR depression are the classic ECG findings of pericarditis.'),
    (v_case_id, 'What is the significance of the PR depression in this case?', '["Indicates atrial ischemia", "Is highly specific for pericarditis", "Suggests an accessory pathway", "Is a normal finding in tachycardia"]', 1, 'PR depression is one of the most specific signs of acute pericarditis.'),
    (v_case_id, 'How do you differentiate the ST elevation of pericarditis from an MI?', '["Pericarditis is focal, MI is diffuse", "Pericarditis elevation is concave (\"saddle-shaped\"), while MI is often convex (\"tombstoning\")", "Pericarditis has reciprocal ST depression", "MI always has PR elevation"]', 1, 'MI typically has convex elevation in a specific coronary territory with reciprocal changes.');

    -- CASE 15: Hyperkalemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Renal Failure ECG', 'A 60-year-old patient with missed dialysis presents with muscle weakness. The ECG shows narrow, symmetric, and very tall T waves in all leads.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely electrolyte abnormality?', '["Hypercalcemia", "Hyperkalemia", "Hypokalemia", "Hyponatremia"]', 1, '"Peaked" T waves are the earliest sign of hyperkalemia.'),
    (v_case_id, 'As the electrolyte level rises further, what happens to the QRS complex?', '["It narrows", "It widens (progressing to a \"sine wave\")", "It disappears", "It develops a delta wave"]', 1, 'Severe hyperkalemia causes progressive widening of the QRS until it merges with the T wave in a sine wave pattern, an impending sign of VF.'),
    (v_case_id, 'What is the first-line medication to STABILIZE the cardiac membrane in this patient?', '["Insulin + Dextrose", "Calcium gluconate or Calcium chloride", "Sodium Bicarbonate", "Furosemide"]', 1, 'Calcium does not lower K+ levels, but it stabilizes the myocardium to prevent arrhythmias.');

    -- CASE 16: Ventricular Tachycardia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wide Complex Tachycardia', 'A 65-year-old male with a history of a previous large MI presents with palpitations. The ECG shows a regular rhythm at 160 bpm with a QRS duration of 160 ms. No P waves are seen.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["SVT with aberrancy", "Ventricular Tachycardia", "Atrial Fibrillation", "Ventricular Fibrillation"]', 1, 'A regular, wide-complex tachycardia in a patient with old heart disease is VT until proven otherwise.'),
    (v_case_id, 'What finding on the ECG would STRONGLY confirm VT over SVT?', '["Rate > 150", "QRS > 120", "AV dissociation (occasional P waves unrelated to QRS)", "Regular rhythm"]', 2, 'AV dissociation is highly specific for VT.'),
    (v_case_id, 'If the patient is hemodynamically STABLE, what is a preferred pharmacological treatment?', '["Adenosine", "Amiodarone", "Atropine", "Digoxin"]', 1, 'Amiodarone or Procainamide are standard for stable VT. Unstable VT requires synchronized cardioversion.');

    -- CASE 17: Torsades de Pointes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Polymorphic Tachycardia', 'A patient on Erythromycin develops a rapid heartbeat. The ECG shows a wide complex tachycardia where the QRS axis appears to "twist" around the isoelectric line.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this rhythm?', '["Ventricular Fibrillation", "Torsades de Pointes", "Atrial Flutter", "Monomorphic VT"]', 1, 'Torsades ("twisting of points") is a polymorphic VT associated with a prolonged QT interval.'),
    (v_case_id, 'What was the likely predisposing factor on the ECG?', '["Short PR interval", "Prolonged QT interval", "Delta wave", "ST depression"]', 1, 'Many drugs (like macrolides) prolong the QT, predisposing to Torsades.'),
    (v_case_id, 'What is the treatment of choice for Torsades de Pointes?', '["IV Calcium", "IV Magnesium Sulfate", "IV Potassium", "Adenosine"]', 1, 'Magnesium is the gold standard for treating and preventing Torsades.');

    -- CASE 18: Left Bundle Branch Block (LBBB)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Wide QRS with Deep S in V1', 'A 70-year-old male has an ECG showing a QRS duration of 140 ms. There is a deep, wide S wave in V1 and a broad, notched ("M-shaped") R wave in lead V6.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["RBBB", "LBBB", "WPW", "Left Ventricular Hypertrophy"]', 1, 'LBBB is characterized by a wide QRS, deep S in V1, and broad R in V6.'),
    (v_case_id, 'What is the clinical significance of a NEW LBBB in a patient with chest pain?', '["It is a benign finding", "It should be treated as a STEMI equivalent", "It indicates old hypertension", "It suggests a pulmonary embolism"]', 1, 'A new LBBB in the setting of ischemia is highly concerning for a large anterior MI.'),
    (v_case_id, 'In LBBB, what happens to the interpretation of ST-segment changes?', '["It becomes easier", "It becomes unreliable for diagnosing MI", "It stays the same", "It only affects lead II"]', 1, 'The abnormal repolarization in LBBB masks typical ST elevation; Sgarbossa criteria are needed to diagnose MI.');

    -- CASE 19: Right Bundle Branch Block (RBBB)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bunny Ears in V1', 'A healthy 30-year-old male has an ECG for an insurance physical. It shows a QRS of 130 ms with an "rsR''" pattern in lead V1 (resembling bunny ears) and a wide, slurred S wave in leads I and V6.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["LBBB", "RBBB", "WPW", "Brugada"]', 1, 'The "rsR''" in V1 is the classic hallmark of RBBB.'),
    (v_case_id, 'What is the clinical significance of an isolated RBBB in an otherwise healthy patient?', '["High risk of complete heart block", "Usually a benign finding", "Requires heart surgery", "Indicates a silent MI"]', 1, 'Unlike LBBB, an isolated RBBB is often benign and can be found in normal individuals.'),
    (v_case_id, 'Which congenital heart defect is classically associated with an RBBB pattern?', '["Ventriclar Septal Defect", "Atrial Septal Defect", "Patent Ductus Arteriosus", "Coarctation"]', 1, 'ASDs often cause right ventricular volume overload and RBBB.');

    -- CASE 20: Left Ventricular Hypertrophy (LVH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Voltage and Strain', 'A 60-year-old female with long-standing untreated hypertension has an ECG showing very tall R waves in V5 and V6, and deep S waves in V1 and V2. The sum of S in V1 and R in V5 is 45 mm. There is also asymmetric ST depression in V5-V6.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Anterior MI", "LBBB", "Left Ventricular Hypertrophy (LVH)", "Right Ventricular Hypertrophy"]', 2, 'High voltage (S in V1 + R in V5/V6 > 35 mm) is the classic Sokolow-Lyon criteria for LVH.'),
    (v_case_id, 'What is the asymmetric ST depression and T-wave inversion in V5-V6 called?', '["Acute ischemia", "Strain pattern", "Digitalis effect", "J-point elevation"]', 1, 'The "LVH with strain" pattern reflects chronic repolarization abnormalities in a thickened ventricle.'),
    (v_case_id, 'What is the primary goal in managing this patient''s ECG findings?', '["Urgent catheterization", "Aggressive blood pressure control", "Permanent pacemaker", "Amiodarone"]', 1, 'Treating the underlying hypertension can lead to regression of LVH over time.');

    -- CASE 21: Pulmonary Embolism (S1Q3T3)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden SOB and Tachycardia', 'A 45-year-old woman presents with sudden onset chest pain and dyspnea after a long flight. Her ECG shows sinus tachycardia at 120 bpm, a large S wave in lead I, a Q wave in lead III, and an inverted T wave in lead III.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic name for this ECG pattern?', '["Wenckebach", "S1Q3T3", "Brugada", "Delta wave"]', 1, 'S1Q3T3 is a sign of acute right heart strain, classically associated with PE.'),
    (v_case_id, 'What is the most common ECG finding in a patient with a pulmonary embolism?', '["S1Q3T3", "Sinus tachycardia", "RBBB", "Atrial Fibrillation"]', 1, 'While S1Q3T3 is famous, simple sinus tachycardia is the most common finding in PE.'),
    (v_case_id, 'Which of the following would also suggest right heart strain on an ECG?', '["Deep S wave in V6", "ST elevation in I and aVL", "Right axis deviation", "Short PR interval"]', 2, 'Right axis deviation and RBBB are other signs of acute right heart strain.');

    -- CASE 22: Digoxin Effect
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Saggit ST Segments', 'A 75-year-old patient with heart failure and AFib is on several medications. Her ECG shows a ventricular rate of 65 bpm and ST segments that are "scooped" or sagging downwards, resembling the mustache of Salvador Dali.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this ECG finding?', '["Ischemia", "Digitalis effect", "U waves", "Osborn waves"]', 1, '"Scooped" ST segments are characteristic of patients taking therapeutic doses of Digoxin.'),
    (v_case_id, 'Is this finding a sign of Digoxin TOXICITY?', '["Yes", "No, it is a sign of therapeutic effect", "Only if there is also bradycardia", "Only if the patient is vomiting"]', 1, 'Digitalis effect is a normal finding at therapeutic levels. Toxicity is usually suggested by arrhythmias (like PVCs or bidirectional VT).'),
    (v_case_id, 'Which electrolyte abnormality significantly POTENTIATES digoxin toxicity?', '["Hyperkalemia", "Hypokalemia", "Hyponatremia", "Hypercalcemia"]', 1, 'Low potassium increases digoxin binding to the Na+/K+ ATPase, increasing the risk of toxicity.');

    -- CASE 23: Hypokalemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diuretics and Weakness', 'A 40-year-old female taking high-dose Furosemide for edema presents with leg cramps. Her ECG shows flattened T waves and a prominent extra wave following the T wave, known as a U wave.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely electrolyte abnormality?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hypocalcemia"]', 1, 'U waves and T-wave flattening are the classic signs of hypokalemia.'),
    (v_case_id, 'What life-threatening arrhythmia can hypokalemia predispose to?', '["Sinus bradycardia", "Torsades de Pointes", "First-degree AV block", "Junctional rhythm"]', 1, 'Hypokalemia (often with hypomagnesemia) prolongs the QT interval and increases the risk of Torsades.'),
    (v_case_id, 'Where is the U wave best visualized on the ECG?', '["Lead III", "Leads V2 and V3", "Lead aVR", "Lead I"]', 1, 'U waves are most prominent in the precordial leads V2-V4.');

    -- CASE 24: Brugada Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Cardiac Death Risk in a Young Asian Male', 'A 32-year-old male of Southeast Asian descent has an ECG for a physical. It shows a pattern resembling an RBBB with a coved-type ST elevation in leads V1 and V2.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["STEMI", "Brugada Syndrome", "WPW", "Pericarditis"]', 1, 'The Brugada pattern (Type 1 is coved ST elevation in V1-V2) is a risk factor for VF and sudden death.'),
    (v_case_id, 'What is the underlying pathophysiology of Brugada Syndrome?', '["Coronary artery disease", "Sodium channelopathy", "Potassium channelopathy", "Viral infection"]', 1, 'It is an autosomal dominant genetic mutation in the SCN5A sodium channel.'),
    (v_case_id, 'If this patient has a history of syncope, what is the treatment of choice?', '["Beta-blockers", "Aspirin", "Implantable Cardioverter-Defibrillator (ICD)", "Catheter ablation"]', 2, 'An ICD is the only effective treatment for preventing sudden cardiac death in symptomatic Brugada patients.');

    -- CASE 25: Hypothermia (Osborn Waves)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hiker in the Cold', 'A 45-year-old male is found unconscious in the snow. His body temperature is 88°F (31°C). The ECG shows sinus bradycardia and a positive deflection at the J-junction in several leads.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these "J-waves" also called?', '["Delta waves", "U waves", "Osborn waves", "F waves"]', 2, 'Osborn waves are highly characteristic of hypothermia.'),
    (v_case_id, 'What other ECG finding is common in hypothermia due to skeletal muscle activity?', '["ST elevation", "Shivering artifact", "Wide QRS", "PR depression"]', 1, 'Muscular shivering creates a jagged, irregular baseline artifact.'),
    (v_case_id, 'What is a common atrial arrhythmia seen in hypothermia?', '["Atrial Flutter", "Atrial Fibrillation (\"Slow AF\")", "WPW", "SVT"]', 1, 'Hypothermia is a common cause of "cold" atrial fibrillation.');

    -- CASE 26: Hypercalcemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bones, Stones, and Groans', 'A 65-year-old male with lung cancer presents with confusion and constipation. His ECG shows an extremely short QT interval.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely electrolyte abnormality?', '["Hypocalcemia", "Hypercalcemia", "Hypermagnesemia", "Hyponatremia"]', 1, 'Hypercalcemia causes shortening of the QT interval.'),
    (v_case_id, 'Conversely, what ECG change would you expect in a patient with HYPOcalcemia?', '["Short QT", "Prolonged QT interval", "Delta wave", "Peaked T waves"]', 1, 'Low calcium leads to a long QT, primarily by prolonging the ST segment.'),
    (v_case_id, 'What is the most common cause of hypercalcemia in a hospitalized patient?', '["Primary hyperparathyroidism", "Malignancy", "Vitamin D toxicity", "Thiazide diuretics"]', 1, 'In the outpatient setting, primary HPT is #1; in the hospital, malignancy is the most common cause.');

    -- CASE 27: Atrial Enlargement
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tall P Waves', 'A patient with severe COPD has an ECG showing tall, peaked P waves (3 mm) in leads II, III, and aVF.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this pattern called?', '["P-mitrale", "P-pulmonale", "Delta wave", "U wave"]', 1, 'P-pulmonale indicates right atrial enlargement, often from pulmonary disease.'),
    (v_case_id, 'What would "P-mitrale" (left atrial enlargement) look like on an ECG?', '["Tall, peaked P waves", "Broad, notched P waves in lead II (resembling an M)", "No P waves", "Biphasic P wave in V1 with a large initial positive component"]', 1, 'P-mitrale is characterized by a broad, bifid P wave, classically from mitral valve disease.'),
    (v_case_id, 'Which lead is most useful for evaluating both right and left atrial enlargement?', '["Lead I", "Lead II", "Lead V1", "Lead aVL"]', 2, 'V1 shows the biphasic P wave; the first half is the RA and the second half is the LA.');

    -- CASE 28: Sinus Arrhythmia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cyclic Pulse', 'A healthy 20-year-old male has an ECG that shows a sinus rhythm where the heart rate increases slightly during inspiration and decreases during expiration. The intervals are all normal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sinus Bradycardia", "Sinus Arrhythmia", "Atrial Fibrillation", "First-degree AV block"]', 1, 'Sinus arrhythmia is a normal physiological variation caused by changes in vagal tone during breathing.'),
    (v_case_id, 'This finding is most common in which population?', '["Elderly patients", "Patients with heart failure", "Young, healthy individuals", "Patients with COPD"]', 2, 'It is very common in children and young adults.'),
    (v_case_id, 'Is any treatment required for this finding?', '["Yes, beta-blockers", "Yes, a pacemaker", "No, it is a normal finding", "Yes, atropine"]', 2, 'No treatment is needed; it is considered normal physiology.');

    -- CASE 29: Low Voltage ECG
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Faint Complexes', 'An 80-year-old male with a history of hypothyroidism and recent flu-like illness presents with SOB and muffled heart sounds. The ECG shows "low voltage" (QRS complexes < 5 mm in all limb leads) and electrical alternans.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute MI", "Large Pericardial Effusion / Tamponade", "COPD", "Obesity"]', 1, 'Low voltage and electrical alternans (varying QRS amplitude) suggest fluid surrounding the heart.'),
    (v_case_id, 'What is "Electrical Alternans" caused by?', '["Ischemia of the bundle branches", "The heart swinging back and forth in a large pool of pericardial fluid", "Intermittent block in the AV node", "Changes in respiration"]', 1, 'The physical movement of the heart in the fluid changes its electrical axis relative to the leads with each beat.'),
    (v_case_id, 'What is the classic physical exam triad for cardiac tamponade?', '["Beck''s Triad: Hypotension, JVD, and Muffled heart sounds", "Charcot Triad", "Virchow Triad", "Cushing Triad"]', 0, 'Beck''s Triad is the hallmark of tamponade.');

    -- CASE 30: Junctional Rhythm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Absent P Waves with Normal QRS', 'A patient taking excess Digoxin has an ECG showing a regular rhythm at 50 bpm. There are no P waves, but the QRS complexes are narrow and normal in appearance.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sinus Bradycardia", "Atrial Fibrillation", "Junctional Escape Rhythm", "Third-degree AV block"]', 2, 'A junctional rhythm originates in the AV junction; it has a slow, regular rate and narrow QRS, usually without P waves.'),
    (v_case_id, 'If a P wave WERE present in a junctional rhythm, where would it likely be located?', '["Just before the QRS", "Inverted and just before, during, or just after the QRS", "Far away from the QRS", "Only in lead V1"]', 1, 'Retrograde conduction from the AV node can produce inverted P waves in the inferior leads.'),
    (v_case_id, 'What is the typical intrinsic rate of the AV junction?', '["60-100 bpm", "40-60 bpm", "20-40 bpm", "10-20 bpm"]', 1, 'The junctional rate is 40-60 bpm. Ventricular is 20-40 bpm.');

    RAISE NOTICE 'SUCCESS: ECG Interpretation Case Blocks (1-30) registered.';
END $$;

COMMIT;
