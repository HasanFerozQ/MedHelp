-- Clinical Skills & Diagnostics: ECG Interpretation - Part 1 (Cases 1-13)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ecg-interpretation

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ecg-interpretation' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ecg-interpretation';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: ECG Basics - Rate and Axis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Routine Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Routine Screening', 'A 25-year-old athlete presents for a sports physical. His ECG shows a regular rhythm with 4 large boxes between each QRS complex. Lead I is positive (R > S), and lead aVF is negative (S > R).', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old athlete presents for a sports physical. His ECG shows a regular rhythm with 4 large boxes between each QRS complex. Lead I is positive (R > S), and lead aVF is negative (S > R).', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the estimated heart rate?', '["60 bpm", "75 bpm", "100 bpm", "150 bpm"]', 1, 'Rate = 300 / number of large boxes. 300 / 4 = 75 bpm.'),
    (v_case_id, 'What is the QRS axis in this patient?', '["Normal axis", "Left axis deviation (LAD)", "Right axis deviation (RAD)", "Extreme axis deviation"]', 1, 'Lead I positive and aVF negative indicates LAD (between -30 and -90 degrees).'),
    (v_case_id, 'Which of the following is a common normal variant in a young athlete?', '["ST elevation in all leads", "Sinus bradycardia", "Complete heart block", "Delta waves"]', 1, 'Athletes often have high vagal tone, leading to resting sinus bradycardia or even Mobitz I block.');

    ---------------------------------------------------------------------------
    -- CASE 02: Atrial Fibrillation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregularly Irregular Palpitations' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregularly Irregular Palpitations', 'A 72-year-old male with a history of hypertension presents with "fluttering" in his chest. His ECG shows an irregularly irregular rhythm with no discernible P waves and a narrow QRS complex.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male with a history of hypertension presents with "fluttering" in his chest. His ECG shows an irregularly irregular rhythm with no discernible P waves and a narrow QRS complex.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Atrial flutter", "Atrial fibrillation", "Multifocal Atrial Tachycardia (MAT)", "Ventricular tachycardia"]', 1, 'Atrial fibrillation is characterized by an irregularly irregular rhythm and absence of P waves.'),
    (v_case_id, 'Which tool is used to assess the risk of stroke in this patient?', '["CHADS2-VASc score", "HAS-BLED score", "Wells criteria", "NYHA classification"]', 0, 'CHADS2-VASc determines the need for anticoagulation in non-valvular A-fib.'),
    (v_case_id, 'If this patient were hemodynamically unstable, what would be the immediate next step?', '["Diltiazem drip", "Metoprolol IV", "Synchronized cardioversion", "Unsynchronized defibrillation"]', 2, 'Unstable tachyarrhythmias (hypotension, altered mental status, chest pain) require immediate synchronized cardioversion.');

    ---------------------------------------------------------------------------
    -- CASE 03: Atrial Flutter
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sawtooth Pattern' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sawtooth Pattern', 'A 65-year-old female presents with fatigue. Her ECG shows a regular atrial rate of 300 bpm with a "sawtooth" appearance in leads II, III, and aVF, and a ventricular rate of 150 bpm.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old female presents with fatigue. Her ECG shows a regular atrial rate of 300 bpm with a "sawtooth" appearance in leads II, III, and aVF, and a ventricular rate of 150 bpm.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the conduction ratio in this ECG?', '["1:1", "2:1", "3:1", "4:1"]', 1, 'Atrial rate 300 / Ventricular rate 150 = 2:1 conduction ratio.'),
    (v_case_id, 'Where is the re-entrant circuit typically located in classic atrial flutter?', '["Left atrium", "Right atrium (Cavotricuspid isthmus)", "AV node", "Purkinje fibers"]', 1, 'Classic (Type I) atrial flutter involves a macro-re-entrant circuit around the cavotricuspid isthmus in the right atrium.'),
    (v_case_id, 'What is the most definitive long-term treatment for symptomatic atrial flutter?', '["Amiodarone", "Digoxin", "Radiofrequency catheter ablation", "Warfarin alone"]', 2, 'Catheter ablation of the isthmus has a very high success rate and is often preferred over long-term medical therapy.');

    ---------------------------------------------------------------------------
    -- CASE 04: Supraventricular Tachycardia (SVT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Onset Racing Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Onset Racing Heart', 'A 28-year-old woman reports her heart suddenly "took off" while she was sitting at her desk. Her ECG shows a narrow-complex tachycardia at 180 bpm. P waves are not clearly visible.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old woman reports her heart suddenly "took off" while she was sitting at her desk. Her ECG shows a narrow-complex tachycardia at 180 bpm. P waves are not clearly visible.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line non-pharmacological maneuver to terminate this rhythm?', '["Precordial thump", "Vagal maneuvers (e.g., carotid sinus massage)", "Chest compressions", "Pacing"]', 1, 'Vagal maneuvers increase parasympathetic tone to the AV node and can break the re-entrant circuit.'),
    (v_case_id, 'If vagal maneuvers fail, what is the first-line pharmacological agent?', '["Adenosine", "Epinephrine", "Amiodarone", "Atropine"]', 0, 'Adenosine (rapid IV push) transiently blocks the AV node, terminating most AVNRT/AVRT rhythms.'),
    (v_case_id, 'What is a common contraindication or caution for using adenosine?', '["Hypertension", "Asthma/Bronchospasm", "Tachycardia", "Hypokalemia"]', 1, 'Adenosine can cause transient bronchospasm and should be used with caution in patients with reactive airway disease.');

    ---------------------------------------------------------------------------
    -- CASE 05: Wolff-Parkinson-White (WPW) Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Short PR Interval' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Short PR Interval', 'A 19-year-old male presents for a physical. His ECG shows a PR interval of 100 ms, a QRS complex of 120 ms, and a slurred upstroke of the QRS complex.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old male presents for a physical. His ECG shows a PR interval of 100 ms, a QRS complex of 120 ms, and a slurred upstroke of the QRS complex.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the slurred upstroke of the QRS complex called?', '["J wave", "Delta wave", "U wave", "Osborn wave"]', 1, 'The delta wave represents early ventricular activation via an accessory pathway (Bundle of Kent).'),
    (v_case_id, 'Which medication should be AVOIDED in a patient with WPW and atrial fibrillation?', '["Procainamide", "Amiodarone", "Diltiazem", "Ibutilide"]', 2, 'AV nodal blocking agents (Beta-blockers, CCBs, Digoxin) can promote conduction over the accessory pathway, leading to ventricular fibrillation.'),
    (v_case_id, 'What is the characteristic triad of WPW on ECG?', '["Short PR, Wide QRS, Delta wave", "Long PR, Wide QRS, Delta wave", "Short PR, Narrow QRS, ST elevation", "Short PR, Wide QRS, U wave"]', 0, 'The triad is a short PR (<120ms), widened QRS (>120ms), and a delta wave.');

    ---------------------------------------------------------------------------
    -- CASE 06: First-Degree AV Block
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Delayed Pulse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Delayed Pulse', 'An 80-year-old asymptomatic male has an ECG showing a PR interval of 280 ms that remains constant. Every P wave is followed by a QRS complex.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old asymptomatic male has an ECG showing a PR interval of 280 ms that remains constant. Every P wave is followed by a QRS complex.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["First-degree AV block", "Second-degree AV block Mobitz I", "Second-degree AV block Mobitz II", "Third-degree AV block"]', 0, 'First-degree block is defined by a PR interval > 200 ms with 1:1 conduction.'),
    (v_case_id, 'Where is the anatomical site of the delay in most cases of first-degree AV block?', '["SA node", "AV node", "Bundle of His", "Purkinje fibers"]', 1, 'The delay is most commonly within the AV node itself.'),
    (v_case_id, 'What is the recommended management for an asymptomatic patient with first-degree AV block?', '["Immediate pacemaker", "Atropine", "Observation/No treatment required", "Beta-blocker therapy"]', 2, 'Asymptomatic first-degree block is usually benign and requires no specific treatment.');

    ---------------------------------------------------------------------------
    -- CASE 07: Second-Degree AV Block Mobitz I (Wenckebach)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Progressive PR Lengthening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Progressive PR Lengthening', 'A 60-year-old man has an ECG showing PR intervals that gradually increase from 200 ms to 240 ms to 280 ms, followed by a P wave that is not conducted (dropped QRS).', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old man has an ECG showing PR intervals that gradually increase from 200 ms to 240 ms to 280 ms, followed by a P wave that is not conducted (dropped QRS).', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz I (Wenckebach)", "Mobitz II", "Third-degree block", "Sinus arrest"]', 0, 'Mobitz I (Wenckebach) is characterized by progressive PR lengthening until a beat is dropped.'),
    (v_case_id, 'Mobitz I is most commonly associated with which type of myocardial infarction?', '["Anterior wall MI", "Inferior wall MI", "Lateral wall MI", "Septal wall MI"]', 1, 'Inferior MIs often cause increased vagal tone or AV nodal ischemia, leading to Mobitz I.'),
    (v_case_id, 'If the patient becomes symptomatic (e.g., dizzy) with this rhythm, what is the initial drug of choice?', '["Adenosine", "Atropine", "Lidocaine", "Amiodarone"]', 1, 'Atropine can be used to increase AV nodal conduction in symptomatic Mobitz I.');

    ---------------------------------------------------------------------------
    -- CASE 08: Second-Degree AV Block Mobitz II
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unexpected Drop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unexpected Drop', 'A 75-year-old male with a history of an old anterior MI has an ECG showing constant PR intervals of 180 ms, but occasionally a P wave is not followed by a QRS complex.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a history of an old anterior MI has an ECG showing constant PR intervals of 180 ms, but occasionally a P wave is not followed by a QRS complex.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz I", "Mobitz II", "Complete heart block", "Sinus exit block"]', 1, 'Mobitz II is characterized by intermittently dropped beats without PR interval changes.'),
    (v_case_id, 'Where is the site of the block in Mobitz II typically located?', '["AV node", "Infranodal (Bundle of His or bundle branches)", "SA node", "Atrial myocardium"]', 1, 'Mobitz II is usually due to a block in the His-Purkinje system and has a higher risk of progressing to complete heart block.'),
    (v_case_id, 'What is the definitive treatment for Mobitz II AV block?', '["Permanent pacemaker", "Diltiazem", "Observation", "Ablation"]', 0, 'Mobitz II always requires a pacemaker, even if the patient is asymptomatic, due to the high risk of sudden progression to asystole.');

    ---------------------------------------------------------------------------
    -- CASE 09: Third-Degree (Complete) AV Block
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AV Dissociation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AV Dissociation', 'An 85-year-old woman presents with syncope. Her ECG shows P waves at a rate of 80 bpm and QRS complexes at a rate of 35 bpm. There is no relationship between the P waves and the QRS complexes.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old woman presents with syncope. Her ECG shows P waves at a rate of 80 bpm and QRS complexes at a rate of 35 bpm. There is no relationship between the P waves and the QRS complexes.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Mobitz II", "Third-degree (Complete) AV block", "Ventricular tachycardia", "Agonal rhythm"]', 1, 'Complete AV block is defined by total dissociation between atria and ventricles.'),
    (v_case_id, 'If the QRS complex is wide (>120 ms) in complete heart block, where is the escape rhythm most likely originating?', '["AV node", "Atria", "Ventricles (Idioventricular)", "Bundle of His"]', 2, 'Wide QRS escape rhythms originate in the ventricles and are typically slow (20-40 bpm).'),
    (v_case_id, 'Cannon "a" waves in the jugular venous pulse are a physical exam finding associated with which rhythm?', '["Atrial fibrillation", "Atrial flutter", "Complete heart block", "Sinus tachycardia"]', 2, 'Cannon a waves occur when the atrium contracts against a closed tricuspid valve during AV dissociation.');

    ---------------------------------------------------------------------------
    -- CASE 10: Right Bundle Branch Block (RBBB)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rabbit Ears' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rabbit Ears', 'A 50-year-old male has an ECG with a QRS duration of 140 ms. Lead V1 shows an rsR'' pattern, and lead V6 shows a slurred S wave.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male has an ECG with a QRS duration of 140 ms. Lead V1 shows an rsR'' pattern, and lead V6 shows a slurred S wave.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["RBBB", "LBBB", "LVH", "WPW"]', 0, 'RBBB criteria: QRS > 120 ms, rsR'' in V1/V2, and slurred S in V5/V6.'),
    (v_case_id, 'Which of the following is true regarding RBBB?', '["It always indicates serious heart disease", "It makes it impossible to diagnose STEMI", "It can be a normal variant or caused by right heart strain", "It requires immediate pacemaker"]', 2, 'RBBB can occur in healthy people or in conditions like PE or ASD.'),
    (v_case_id, 'In RBBB, the T waves in leads V1-V3 are typically:', '["Upright", "Inverted (Secondary repolarization changes)", "Biphasic", "Absent"]', 1, 'Bundle branch blocks cause secondary T-wave inversions in the leads with the dominant R'' wave.');

    ---------------------------------------------------------------------------
    -- CASE 11: Left Bundle Branch Block (LBBB)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'New Onset Chest Pain and LBBB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'New Onset Chest Pain and LBBB', 'A 60-year-old woman with chest pain has an ECG with a QRS duration of 150 ms. Lead V1 shows a deep S wave, and lead V6 shows a broad, notched R wave.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman with chest pain has an ECG with a QRS duration of 150 ms. Lead V1 shows a deep S wave, and lead V6 shows a broad, notched R wave.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["RBBB", "LBBB", "RVH", "Brugada syndrome"]', 1, 'LBBB criteria: QRS > 120 ms, deep S in V1, and broad/notched R in V6.'),
    (v_case_id, 'In the setting of new-onset chest pain, a "new" LBBB is often treated as equivalent to:', '["NSTEMI", "STEMI", "Stable angina", "Pericarditis"]', 1, 'A new LBBB in a patient with ischemic symptoms is clinically considered a STEMI equivalent.'),
    (v_case_id, 'Which criteria are used to diagnose an acute MI in the presence of an existing LBBB?', '["Sgarbossa criteria", "Duke criteria", "Light''s criteria", "Centor criteria"]', 0, 'Sgarbossa criteria (e.g., concordant ST elevation) help identify MI in patients with LBBB.');

    ---------------------------------------------------------------------------
    -- CASE 12: Ventricular Tachycardia (VT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wide Complex Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wide Complex Tachycardia', 'A 68-year-old male with a history of ischemic cardiomyopathy presents with palpitations. His ECG shows a regular wide-complex tachycardia at 160 bpm.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old male with a history of ischemic cardiomyopathy presents with palpitations. His ECG shows a regular wide-complex tachycardia at 160 bpm.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which finding on ECG strongly favors VT over SVT with aberrancy?', '["Narrow QRS complexes", "AV dissociation and fusion beats", "Regular rhythm", "Rate > 150 bpm"]', 1, 'AV dissociation, fusion beats, and capture beats are pathognomonic for VT.'),
    (v_case_id, 'If the patient is stable, which medication is often used to treat VT?', '["Adenosine", "Amiodarone", "Atropine", "Digoxin"]', 1, 'Amiodarone (or procainamide/sotalol) is used for stable VT.'),
    (v_case_id, 'What is the most likely cause of VT in this patient?', '["Electrolyte imbalance", "Re-entry around a myocardial scar", "Drug toxicity", "Hypothyroidism"]', 1, 'In patients with a prior MI, VT is most commonly due to re-entry around fibrous scar tissue.');

    ---------------------------------------------------------------------------
    -- CASE 13: Ventricular Fibrillation (VF)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Cardiac Arrest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Cardiac Arrest', 'You are at a grocery store and a man collapses. You find him pulseless and non-breathing. The AED analysis shows a chaotic, rapid rhythm without identifiable QRS complexes.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are at a grocery store and a man collapses. You find him pulseless and non-breathing. The AED analysis shows a chaotic, rapid rhythm without identifiable QRS complexes.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm?', '["VT", "VF", "Asystole", "PEA"]', 1, 'VF is characterized by a chaotic, wavy baseline with no discernible complexes.'),
    (v_case_id, 'What is the most critical intervention for VF?', '["Epinephrine", "Amiodarone", "Unsynchronized defibrillation", "Synchronized cardioversion"]', 2, 'Defibrillation is the only effective treatment for VF. Every minute of delay reduces survival chance by ~10%.'),
    (v_case_id, 'After the first shock and 2 minutes of CPR, the patient remains in VF. What is the first medication to give?', '["Amiodarone 300 mg", "Epinephrine 1 mg", "Lidocaine 100 mg", "Magnesium 2 g"]', 1, 'ACLS protocols recommend epinephrine 1 mg every 3-5 minutes, starting after the second shock (if still in a shockable rhythm).');

END $$;

COMMIT;
