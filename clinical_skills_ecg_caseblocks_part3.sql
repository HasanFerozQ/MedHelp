-- Clinical Skills & Diagnostics: ECG Interpretation - Part 3 (Cases 26-37)
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
    -- CASE 26: Torsades de Pointes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Polymorphic VT' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Polymorphic VT', 'A 35-year-old woman with a history of anorexia is brought to the ED after a fainting spell. Her rhythm strip shows a wide-complex tachycardia where the QRS axis appears to twist around the baseline.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old woman with a history of anorexia is brought to the ED after a fainting spell. Her rhythm strip shows a wide-complex tachycardia where the QRS axis appears to twist around the baseline.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this rhythm?', '["Atrial fibrillation", "Torsades de Pointes", "Monomorphic VT", "Wenckebach"]', 1, 'Torsades de Pointes is a polymorphic VT associated with a prolonged QT interval.'),
    (v_case_id, 'What is the first-line intravenous treatment for Torsades de Pointes?', '["Calcium chloride", "Magnesium sulfate", "Amiodarone", "Potassium chloride"]', 1, 'Magnesium sulfate is the drug of choice for treating and preventing Torsades.'),
    (v_case_id, 'Which of the following classes of medications is most notorious for prolonging the QT interval?', '["Beta-blockers", "Fluoroquinolones", "ACE inhibitors", "Statins"]', 1, 'Many drugs (macrolides, fluoroquinolones, antipsychotics, certain anti-emetics) can prolong the QT interval.');

    ---------------------------------------------------------------------------
    -- CASE 27: Digoxin Effect
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sagging ST' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sagging ST', 'A 75-year-old woman with A-fib and heart failure is on several medications. Her ECG shows ST segments with a concave "scooped" or "sagging" appearance in the lateral leads.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old woman with A-fib and heart failure is on several medications. Her ECG shows ST segments with a concave "scooped" or "sagging" appearance in the lateral leads.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medication is most likely responsible for this "scooped" appearance?', '["Lisinopril", "Metoprolol", "Digoxin", "Warfarin"]', 2, 'The "digoxin effect" is characterized by down-sloping ST segment depression (the Salvador Dali sag).'),
    (v_case_id, 'True or False: The presence of the "digoxin effect" on ECG means the patient is toxic.', '["True", "False"]', 1, 'The digoxin effect is a normal finding at therapeutic levels; it does not necessarily indicate toxicity.'),
    (v_case_id, 'What is a classic visual symptom of digoxin toxicity?', '["Double vision", "Yellow-green color halos (Xanthopsia)", "Sudden blindness", "Red-green color blindness"]', 1, 'Xanthopsia (seeing yellow or green halos) is a classic side effect of digoxin toxicity.');

    ---------------------------------------------------------------------------
    -- CASE 28: Tricyclic Antidepressant (TCA) Toxicity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Overdose and Wide QRS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Overdose and Wide QRS', 'An 18-year-old woman is brought to the ED after an intentional overdose. She is confused and has dry skin and dilated pupils. Her ECG shows a QRS of 130 ms and a tall R wave in lead aVR.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-year-old woman is brought to the ED after an intentional overdose. She is confused and has dry skin and dilated pupils. Her ECG shows a QRS of 130 ms and a tall R wave in lead aVR.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely substance ingested?', '["Aspirin", "Tricyclic Antidepressants (TCAs)", "Acetaminophen", "Opioids"]', 1, 'TCAs cause anticholinergic symptoms and characteristic ECG changes (wide QRS, tall R in aVR).'),
    (v_case_id, 'What is the mechanism of QRS widening in TCA toxicity?', '["Calcium channel blockade", "Sodium channel blockade", "Potassium channel blockade", "Beta-receptor blockade"]', 1, 'TCAs block fast sodium channels in the heart, leading to slowed conduction.'),
    (v_case_id, 'What is the specific antidote to treat the cardiotoxicity of TCAs?', '["Naloxone", "N-acetylcysteine", "Sodium bicarbonate", "Flumazenil"]', 2, 'Sodium bicarbonate increases extracellular sodium and alkalinizes the blood, helping to overcome the sodium channel blockade.');

    ---------------------------------------------------------------------------
    -- CASE 29: Brugada Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Death Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Death Risk', 'A 30-year-old Southeast Asian male presents for a check-up. He mentions his brother died suddenly at age 32. His ECG shows "coved" ST elevation in leads V1 and V2 followed by an inverted T wave.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old Southeast Asian male presents for a check-up. He mentions his brother died suddenly at age 32. His ECG shows "coved" ST elevation in leads V1 and V2 followed by an inverted T wave.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["RBBB", "Brugada syndrome", "Anterior MI", "Pericarditis"]', 1, 'Brugada syndrome is an autosomal dominant condition (sodium channel mutation) that carries a high risk of sudden cardiac death.'),
    (v_case_id, 'ECG changes in Brugada syndrome are often unmasked or worsened by:', '["Exercise", "Fever", "Sleep", "Caffeine"]', 1, 'Fever is a well-known trigger for unmasking the Brugada pattern and inducing arrhythmias.'),
    (v_case_id, 'What is the definitive treatment for high-risk patients with Brugada syndrome?', '["Beta-blockers", "Aspirin", "Implantable Cardioverter-Defibrillator (ICD)", "Catheter ablation"]', 2, 'High-risk patients (e.g., prior syncope or cardiac arrest) require an ICD for primary or secondary prevention.');

    ---------------------------------------------------------------------------
    -- CASE 30: Wellens Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Warning Pattern' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Warning Pattern', 'A patient with prior chest pain that has now resolved has an ECG showing deeply inverted, symmetric T waves in leads V2 and V3. He is currently asymptomatic.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with prior chest pain that has now resolved has an ECG showing deeply inverted, symmetric T waves in leads V2 and V3. He is currently asymptomatic.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this ECG pattern called?', '["de Winter T-waves", "Wellens syndrome", "Osborn waves", "Delta waves"]', 1, 'Wellens syndrome (Type B) shows deep, symmetric T-wave inversions in V2-V3 when the patient is pain-free.'),
    (v_case_id, 'What does Wellens syndrome indicate?', '["Acute pericarditis", "Critical stenosis of the proximal LAD", "Right heart strain", "Digitalis effect"]', 1, 'Wellens syndrome is a warning sign for high-grade proximal LAD obstruction, carrying a high risk of an impending massive anterior MI.'),
    (v_case_id, 'How should a patient with suspected Wellens syndrome be managed?', '["Exercise stress test", "Urgent cardiac catheterization", "Home with NSAIDs", "Outpatient follow-up"]', 1, 'Stress testing is contraindicated due to the risk of inducing a massive MI. Urgent angiography is required.');

    ---------------------------------------------------------------------------
    -- CASE 31: de Winter T-waves
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The STEMI Equivalent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The STEMI Equivalent', 'A patient with acute chest pain has an ECG showing 1-3 mm of up-sloping ST depression in the precordial leads (V1-V6) that merges into tall, symmetric, hyperacute T waves.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with acute chest pain has an ECG showing 1-3 mm of up-sloping ST depression in the precordial leads (V1-V6) that merges into tall, symmetric, hyperacute T waves.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this pattern called?', '["Wellens syndrome", "de Winter T-waves", "Brugada pattern", "J-point elevation"]', 1, 'de Winter T-waves are characterized by ST depression followed by tall, peaked T waves in the precordial leads.'),
    (v_case_id, 'What is the clinical significance of de Winter T-waves?', '["Benign finding", "Early sign of hyperkalemia", "STEMI equivalent (Proximal LAD occlusion)", "Sign of early repolarization"]', 2, 'Like Wellens, de Winter T-waves indicate acute proximal LAD occlusion and require emergent reperfusion.'),
    (v_case_id, 'How do de Winter T-waves differ from hyperacute T-waves in a typical STEMI?', '["They are associated with ST elevation", "They are associated with ST depression", "They only occur in inferior leads", "They disappear with nitroglycerin"]', 1, 'Typical hyperacute T waves in early STEMI are associated with ST elevation; de Winter T waves have up-sloping ST depression.');

    ---------------------------------------------------------------------------
    -- CASE 32: Pacemaker Rhythm
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vertical Spikes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vertical Spikes', 'An elderly man with a permanent pacemaker has an ECG showing thin vertical lines immediately preceding every wide QRS complex.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly man with a permanent pacemaker has an ECG showing thin vertical lines immediately preceding every wide QRS complex.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What do these vertical lines represent?', '["P waves", "Artifact", "Pacemaker spikes", "U waves"]', 2, 'Vertical spikes represent the electrical discharge from the pacemaker leads.'),
    (v_case_id, 'Why is the QRS typically wide in a ventricular-paced rhythm?', '["The patient has an underlying LBBB", "The impulse travels via the myocardium rather than the specialized conduction system", "The pacemaker is malfunctioning", "The atrial rate is too slow"]', 1, 'Ventricular pacing usually occurs from the right ventricle, meaning the impulse must travel across the myocardium to the left side, resembling an LBBB pattern.'),
    (v_case_id, 'If a spike is present but not followed by a QRS complex, what is this called?', '["Failure to sense", "Failure to capture", "Failure to pace", "Normal function"]', 1, 'Failure to capture means the pacemaker delivered an impulse but the heart muscle did not depolarize.');

    ---------------------------------------------------------------------------
    -- CASE 33: Hypothermia - Osborn Waves
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cold and Confused' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cold and Confused', 'A homeless man is found unresponsive in the snow. His core temperature is 28°C (82°F). His ECG shows a positive deflection at the J-junction in the lateral leads.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A homeless man is found unresponsive in the snow. His core temperature is 28°C (82°F). His ECG shows a positive deflection at the J-junction in the lateral leads.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this positive deflection called?', '["Delta wave", "Osborn (J) wave", "U wave", "Epsilon wave"]', 1, 'Osborn waves are characteristic of hypothermia; they are seen at the junction of the QRS and ST segments.'),
    (v_case_id, 'Which arrhythmia is common in severe hypothermia?', '["SVT", "Atrial fibrillation with slow response", "Ventricular tachycardia", "Sinus tachycardia"]', 1, 'Severe hypothermia often leads to A-fib with a slow ventricular response, eventually progressing to asystole.'),
    (v_case_id, 'Osborn waves can also be seen in which of the following?', '["Hyperthermia", "Hypercalcemia", "Severe CNS injury", "Iron deficiency"]', 1, 'While most common in hypothermia, J-waves can sometimes be seen in hypercalcemia or neurologic emergencies.');

    ---------------------------------------------------------------------------
    -- CASE 34: Arrhythmogenic RV Cardiomyopathy (ARVC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Epsilon Wave' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Epsilon Wave', 'A young man has a syncopal episode during exercise. His ECG shows a small "notch" at the end of the QRS complex in lead V1 and T-wave inversions in V1-V3.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A young man has a syncopal episode during exercise. His ECG shows a small "notch" at the end of the QRS complex in lead V1 and T-wave inversions in V1-V3.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this small notch called?', '["Delta wave", "Epsilon wave", "J wave", "U wave"]', 1, 'The epsilon wave is a classic finding in ARVC, representing delayed right ventricular activation.'),
    (v_case_id, 'ARVC involves the replacement of RV myocardium with which tissue?', '["Fibrofatty tissue", "Amyloid protein", "Iron deposits", "Granulomas"]', 0, 'ARVC is a genetic condition where RV muscle is replaced by fat and fibrous tissue, leading to arrhythmias.'),
    (v_case_id, 'Which arrhythmia is most concerning in patients with ARVC?', '["A-fib", "Mobitz II block", "Ventricular tachycardia (LBBB pattern)", "Sinus bradycardia"]', 2, 'Patients with ARVC are at high risk for VT originating from the right ventricle.');

    ---------------------------------------------------------------------------
    -- CASE 35: Left Anterior Fascicular Block (LAFB)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Isolated Left Axis Deviation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Isolated Left Axis Deviation', 'An asymptomatic 50-year-old male has an ECG with a normal QRS duration, a positive lead I, and a deeply negative lead aVF. Leads II and III are also negative. There are no signs of LVH.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An asymptomatic 50-year-old male has an ECG with a normal QRS duration, a positive lead I, and a deeply negative lead aVF. Leads II and III are also negative. There are no signs of LVH.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["LAD", "LAFB", "LBBB", "LVH"]', 1, 'LAFB is characterized by left axis deviation (usually < -45 degrees) without other causes like LBBB or LVH.'),
    (v_case_id, 'What is the characteristic QRS pattern in leads II, III, and aVF in LAFB?', '["qR", "rS", "rsR''", "Delta wave"]', 1, 'LAFB typically shows an rS pattern in the inferior leads (II, III, aVF) and a qR pattern in leads I and aVL.'),
    (v_case_id, 'Bifascicular block refers to a combination of RBBB and:', '["LAFB or LPFB", "First-degree block", "Left main disease", "LVH"]', 0, 'Bifascicular block is RBBB + either Left Anterior Fascicular Block (LAFB) or Left Posterior Fascicular Block (LPFB).');

    ---------------------------------------------------------------------------
    -- CASE 36: Multifocal Atrial Tachycardia (MAT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregular Rhythm in COPD' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregular Rhythm in COPD', 'An 80-year-old man with severe COPD and acute respiratory failure has an irregular rhythm at 120 bpm. His ECG shows P waves of at least three different morphologies and varying PR intervals.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man with severe COPD and acute respiratory failure has an irregular rhythm at 120 bpm. His ECG shows P waves of at least three different morphologies and varying PR intervals.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rhythm?', '["A-fib", "A-flutter", "Multifocal Atrial Tachycardia (MAT)", "Wandering Atrial Pacemaker"]', 2, 'MAT is defined by a rate > 100 bpm and at least 3 different P-wave morphologies.'),
    (v_case_id, 'What is the first-line treatment for MAT?', '["Amiodarone", "Synchronized cardioversion", "Treat the underlying condition (e.g., lung disease)", "Digoxin"]', 2, 'MAT is usually secondary to lung disease or electrolyte imbalance; cardioversion is generally ineffective.'),
    (v_case_id, 'Which medication class is often effective if rate control is needed for MAT?', '["Beta-blockers", "Calcium channel blockers (e.g., Verapamil)", "Adenosine", "Lidocaine"]', 1, 'CCBs are preferred over beta-blockers in MAT, as beta-blockers may exacerbate the underlying lung disease.');

    ---------------------------------------------------------------------------
    -- CASE 37: Hypertrophic Cardiomyopathy (HCM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Young Athlete at Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Young Athlete at Risk', 'A 17-year-old male athlete collapses during basketball practice. His baseline ECG shows deep, narrow "dagger-like" Q waves in leads I, aVL, and V5-V6, along with LVH criteria.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 17-year-old male athlete collapses during basketball practice. His baseline ECG shows deep, narrow "dagger-like" Q waves in leads I, aVL, and V5-V6, along with LVH criteria.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What do the "dagger-like" Q waves represent?', '["Old myocardial infarction", "Septal hypertrophy", "Lateral wall ischemia", "Right ventricular overload"]', 1, 'Deep, narrow Q waves in lateral leads in HCM represent massive septal depolarization.'),
    (v_case_id, 'Which maneuver would likely INCREASE the murmur of HCM on physical exam?', '["Squatting", "Valsalva", "Handgrip", "Passive leg raise"]', 1, 'The HCM murmur (HOCM) increases with maneuvers that decrease preload (like Valsalva or standing).'),
    (v_case_id, 'What is the most common cause of sudden cardiac death in young athletes in the US?', '["WPW", "Brugada syndrome", "Hypertrophic cardiomyopathy", "Commotio cordis"]', 2, 'HCM is the most frequent cause of sudden cardiac death in young American athletes.');

END $$;

COMMIT;
