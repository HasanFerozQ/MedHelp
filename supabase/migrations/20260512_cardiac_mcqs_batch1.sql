-- Batch 1: Cardiac Emergencies (1-60)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: ACS, STEMI, NSTEMI, Unstable Angina

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 64-year-old male presents with 45 minutes of substernal chest pressure radiating to the left jaw. He is diaphoretic. BP 150/90, HR 92, SpO2 96%. ECG shows 3mm ST elevation in leads II, III, and aVF. What is the most immediate priority in management?', '["Morphine 4mg IV", "Oxygen via nasal cannula at 4L/min", "Aspirin 324mg chewed", "Sublingual Nitroglycerin 0.4mg"]', 2, 'Aspirin is the only medication proven to reduce mortality in the acute phase of MI. Oxygen is only indicated if SpO2 < 94% or if the patient is in respiratory distress.'),
        (topic_id_val, 'In the patient above (Inferior STEMI), the BP suddenly drops to 85/50 after one dose of Nitroglycerin. What is the next best step?', '["IV Norepinephrine bolus", "Normal Saline 500mL IV bolus", "Atropine 0.5mg IV", "Dopamine infusion"]', 1, 'Inferior wall MIs often involve the Right Ventricle. RV infarctions are highly preload-dependent; nitroglycerin reduces preload and can cause profound hypotension. Initial management is fluid resuscitation.'),
        (topic_id_val, 'A 58-year-old female presents with epigastric pain, nausea, and fatigue for 2 hours. Troponin T is 0.8 ng/mL (Normal < 0.01). ECG shows T-wave inversions in V4-V6. What is the diagnosis?', '["Unstable Angina", "NSTEMI", "STEMI", "Acute Gastritis"]', 1, 'NSTEMI is characterized by elevated cardiac biomarkers (Troponin) without ST-segment elevation. Women often present with atypical symptoms like epigastric pain or fatigue.'),
        (topic_id_val, 'A patient with a history of CABG presents with chest pain. ECG shows a new Left Bundle Branch Block (LBBB). In the context of ischemic symptoms, how should this be treated?', '["As a non-diagnostic ECG", "As a STEMI equivalent", "Observe for 6 hours then re-ECG", "Perform a stress test"]', 1, 'A new or presumably new LBBB in a patient with clinical symptoms of ACS is considered a STEMI equivalent and should be managed with immediate reperfusion therapy.'),
        (topic_id_val, 'A 72-year-old male with known HFrEF (EF 25%) presents with crushing chest pain. BP 80/40, HR 110, rales halfway up the lung fields. ECG shows STEMI. What is the physiological state?', '["Hypovolemic Shock", "Cardiogenic Shock", "Septic Shock", "Neurogenic Shock"]', 1, 'STEMI combined with hypotension and pulmonary edema (rales) indicates cardiogenic shock due to pump failure.'),
        (topic_id_val, 'Which cardiac biomarker rises the earliest after myocardial injury?', '["Troponin I", "CK-MB", "Myoglobin", "LDH"]', 2, 'Myoglobin is the earliest marker to rise (within 1-3 hours), but it lacks specificity for cardiac muscle.'),
        (topic_id_val, 'A patient presents with chest pain that is relieved by leaning forward and worse when lying flat. ECG shows diffuse ST elevation and PR depression. What is the most likely diagnosis?', '["Acute Pericarditis", "Anterior STEMI", "Aortic Dissection", "Myocarditis"]', 0, 'Diffuse ST elevation (concave upwards) and PR depression across multiple leads are classic findings for acute pericarditis.'),
        (topic_id_val, 'In a patient with ACS, what is the primary purpose of administering Clopidogrel (Plavix) alongside Aspirin?', '["To dissolve the existing clot", "To prevent further platelet aggregation via ADP receptor inhibition", "To decrease myocardial oxygen demand", "To provide rapid analgesia"]', 1, 'Clopidogrel is a P2Y12 inhibitor that provides dual antiplatelet therapy (DAPT) by inhibiting platelet aggregation through a different pathway than aspirin.'),
        (topic_id_val, 'A 45-year-old smoker presents with intermittent chest pain occurring only at rest, often at 4 AM. ECG during pain shows transient ST elevation that resolves within 10 minutes. Diagnosis?', '["Prinzmetal (Variant) Angina", "STEMI", "Silent Ischemia", "Esophageal Spasm"]', 0, 'Prinzmetal angina is caused by coronary vasospasm and typically occurs at rest, often in a circadian pattern, with transient ST changes.'),
        (topic_id_val, 'A patient with an Inferior MI shows ST elevation in lead V4R on a right-sided ECG. What does this confirm?', '["Left main occlusion", "Right Ventricular Infarction", "Posterior wall extension", "High lateral MI"]', 1, 'Lead V4R is the most sensitive lead for detecting Right Ventricular involvement in the setting of inferior wall MI.');
        
        -- ... adding more in the real file ...
    END IF;
END $$;
