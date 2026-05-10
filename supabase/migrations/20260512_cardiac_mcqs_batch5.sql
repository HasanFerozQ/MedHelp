-- Batch 5: Cardiac Emergencies (241-300)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: Aortic Dissection, Hypertensive Emergencies, Aneurysms

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 60-year-old male presents with "tearing" chest pain radiating to the back. BP is 190/110. CXR shows a widened mediastinum. What is the most likely diagnosis?', '["Myocardial Infarction", "Aortic Dissection", "Pulmonary Embolism", "Esophageal Rupture"]', 1, 'Tearing or ripping pain radiating to the back combined with a widened mediastinum on CXR is classic for aortic dissection.'),
        (topic_id_val, 'In the patient above, what is the target Heart Rate and Systolic BP for initial medical management?', '["HR < 60, SBP 100-120", "HR < 100, SBP 140-160", "HR < 80, SBP 140-150", "HR < 90, SBP 130-140"]', 0, 'In aortic dissection, the goal is rapid reduction of both HR (<60) and SBP (100-120) to minimize shear stress on the aortic wall.'),
        (topic_id_val, 'Which medication should be administered FIRST to the patient with aortic dissection and tachycardia?', '["Sodium Nitroprusside", "Esmolol or Labetalol", "Hydralazine", "Nitroglycerin"]', 1, 'Beta-blockers (Esmolol/Labetalol) must be given before vasodilators to prevent reflex tachycardia, which can worsen the dissection.'),
        (topic_id_val, 'A 70-year-old male presents with sudden onset back pain and hypotension. A pulsatile abdominal mass is palpated. What is the most immediate priority?', '["Perform an abdominal CT with contrast", "Prepare for emergent surgical repair (OR)", "Perform an MRI", "Obtain a formal Ultrasound"]', 1, 'In an unstable patient with a suspected ruptured AAA (Abdominal Aortic Aneurysm), the priority is emergent surgical or endovascular repair. Do not delay for imaging if the patient is unstable.'),
        (topic_id_val, 'A patient presents with BP 220/130 and a severe headache. Fundoscopic exam shows papilledema. Diagnosis?', '["Hypertensive Urgency", "Hypertensive Emergency", "Benign Hypertension", "Tension Headache"]', 1, 'Hypertensive emergency is defined by severely elevated BP with evidence of acute end-organ damage (e.g., papilledema, encephalopathy, renal failure).'),
        (topic_id_val, 'In Hypertensive Encephalopathy, what is the recommended rate of BP reduction in the first hour?', '["Drop to 120/80 immediately", "Reduce Mean Arterial Pressure (MAP) by 20-25%", "Reduce SBP to 140", "Reduce SBP to 160"]', 1, 'Except in specific cases like stroke or aortic dissection, MAP should be reduced by no more than 20-25% in the first hour to prevent cerebral hypoperfusion.'),
        (topic_id_val, 'A 50-year-old patient with Aortic Dissection develops a new diastolic murmur and pulmonary edema. What happened?', '["Extension into the coronary arteries", "Extension into the aortic valve (Acute Aortic Regurgitation)", "Rupture into the pericardium", "Extension into the carotid artery"]', 1, 'Retrograde extension of a Stanford Type A dissection can involve the aortic valve, leading to acute aortic regurgitation and heart failure.'),
        (topic_id_val, 'What is the most common risk factor for Aortic Dissection?', '["Smoking", "Hypertension", "Diabetes", "Hyperlipidemia"]', 1, 'Hypertension is the single most important risk factor for aortic dissection.'),
        (topic_id_val, 'A patient presents with severe chest pain. BP is 180/90 in the right arm and 140/80 in the left. What does this "pulse deficit" indicate?', '["Right-sided MI", "Proximal Aortic Dissection (Type A)", "Left-sided MI", "Pulmonary Embolism"]', 1, 'Blood pressure discrepancy between arms is a highly specific sign for proximal aortic dissection involving the subclavian arteries.'),
        (topic_id_val, 'A patient with Marfan syndrome presents with acute chest pain. Which type of aortic dissection are they most at risk for?', '["Type B", "Type A", "Neither", "Both equally"]', 1, 'Marfan syndrome and other connective tissue disorders strongly predispose patients to Type A (proximal) dissections.');
        
    END IF;
END $$;
