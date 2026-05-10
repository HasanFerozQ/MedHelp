-- Batch 3: Cardiac Emergencies (121-180)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: Ventricular Arrhythmias (VT/VF), Torsades de Pointes, Heart Blocks

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 65-year-old male with a history of MI presents with sudden onset palpitations. BP 115/75. ECG shows a wide-complex regular tachycardia at a rate of 160. What is the most likely diagnosis?', '["SVNRT with aberrancy", "Ventricular Tachycardia (VT)", "Atrial Flutter", "Sinus Tachycardia"]', 1, 'In an older patient with structural heart disease (history of MI), a wide-complex tachycardia should be treated as VT until proven otherwise.'),
        (topic_id_val, 'The patient above (stable VT) should receive which initial treatment?', '["Adenosine 6mg", "Amiodarone 150mg infusion", "Lidocaine 100mg IV", "Magnesium Sulfate 2g IV"]', 1, 'Stable monomorphic VT is treated with Amiodarone (150mg over 10 minutes) or Procainamide.'),
        (topic_id_val, 'A 50-year-old male is found pulseless and breathless. The monitor shows Ventricular Fibrillation. What is the immediate next step?', '["Epinephrine 1mg IV", "Unsynchronized defibrillation (200J Biphasic)", "Amiodarone 300mg IV", "Chest compressions for 5 minutes"]', 1, 'The treatment for pulseless VFib/VT is immediate unsynchronized defibrillation (shock).'),
        (topic_id_val, 'A patient on Erythromycin and Terfenadine presents with palpitations. ECG shows a wide-complex tachycardia where the QRS peaks appear to "twist" around the isoelectric line. Treatment?', '["Amiodarone", "Lidocaine", "Magnesium Sulfate 2g IV", "Adenosine"]', 2, 'Torsades de Pointes (polymorphic VT with long QT) is treated with IV Magnesium Sulfate. Amiodarone is contraindicated as it can further prolong the QT interval.'),
        (topic_id_val, 'A 70-year-old male presents with lightheadedness. BP 90/60. ECG shows a PR interval that progressively lengthens until a QRS is dropped. Diagnosis?', '["First-degree AV Block", "Mobitz I (Wenckebach) Second-degree Block", "Mobitz II Second-degree Block", "Third-degree AV Block"]', 1, 'Mobitz I (Wenckebach) is characterized by progressive PR prolongation followed by a dropped QRS.'),
        (topic_id_val, 'A patient with an anterior wall MI develops a new heart block on ECG. The PR interval is constant, but there are intermittent dropped QRS complexes. Diagnosis?', '["Mobitz I", "Mobitz II", "First-degree Block", "Third-degree Block"]', 1, 'Mobitz II is characterized by constant PR intervals with intermittent non-conducted P waves. It is often a precursor to complete heart block in the setting of anterior MI.'),
        (topic_id_val, 'A 80-year-old female presents with syncope. BP 80/40. ECG shows P waves at a rate of 80 and QRS complexes at a rate of 30, with no relationship between them. Treatment?', '["Atropine 0.5mg", "Transcutaneous pacing", "Observe in ICU", "Isoproterenol infusion"]', 1, 'Third-degree (complete) heart block with hemodynamic instability requires immediate pacing (transcutaneous followed by transvenous). Atropine is often ineffective if the block is below the AV node.'),
        (topic_id_val, 'What is the characteristic ECG finding in Brugada Syndrome?', '["Delta wave", "ST elevation in V1-V3 with a coved appearance", "Short PR interval", "Long QT interval"]', 1, 'Brugada syndrome presents with a specific pattern of ST elevation in the right precordial leads (V1-V3), often described as "coved" or "saddle-back," and is a major cause of sudden cardiac death in young healthy adults.'),
        (topic_id_val, 'A patient with Hyperkalemia (K+ 7.2) shows a "sine wave" pattern on the monitor. What is the most immediate life-saving treatment?', '["Insulin and Glucose", "Albuterol nebulizer", "Calcium Gluconate or Chloride IV", "Kayexalate"]', 2, 'Calcium (Gluconate or Chloride) stabilizes the cardiac membrane against the effects of hyperkalemia. It does not lower the potassium level but prevents lethal arrhythmias.'),
        (topic_id_val, 'What is the most common cause of sudden cardiac death in athletes under age 35?', '["Coronary Artery Disease", "Hypertrophic Cardiomyopathy (HCM)", "Commotio Cordis", "Myocarditis"]', 1, 'HCM is the leading cause of sudden cardiac death in young athletes due to ventricular arrhythmias.');
        
    END IF;
END $$;
