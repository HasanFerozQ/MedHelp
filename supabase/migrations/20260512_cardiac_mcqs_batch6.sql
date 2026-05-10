-- Batch 6: Cardiac Emergencies (301-340)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: Pericardial Disease, Tamponade, Myocarditis, Valvular Failures

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 45-year-old male with a history of lung cancer presents with progressive SOB. BP 90/60, HR 115. PE: Distended neck veins and muffled heart sounds. What is the most definitive next step?', '["IV Fluids", "Perform an immediate Ultrasound/Echo", "Obtain a Chest X-ray", "Start IV Antibiotics"]', 1, 'In a patient with Beck’s Triad (Hypotension, JVD, Muffled heart sounds), bedside ultrasound is the fastest way to confirm cardiac tamponade.'),
        (topic_id_val, 'A patient with cardiac tamponade shows a 15 mmHg drop in systolic BP during inspiration. What is this sign called?', '["Pulsus paradoxus", "Kussmaul sign", "Trousseau sign", "Ewart sign"]', 0, 'Pulsus paradoxus (a drop in SBP > 10 mmHg during inspiration) is a classic finding in cardiac tamponade due to ventricular interdependence.'),
        (topic_id_val, 'What is the characteristic ECG finding in large pericardial effusions or tamponade?', '["Diffuse ST elevation", "Electrical Alternans", "Osborn waves", "Delta waves"]', 1, 'Electrical alternans (variation in QRS amplitude from beat to beat) is caused by the heart swinging back and forth in the pericardial fluid.'),
        (topic_id_val, 'A patient with acute pericarditis has severe chest pain. Which medication is first-line for both pain relief and reducing recurrence?', '["Aspirin or NSAIDs plus Colchicine", "Prednisone", "Morphine", "Lisinopril"]', 0, 'The combination of high-dose Aspirin/NSAIDs and Colchicine is the standard treatment for acute pericarditis to reduce inflammation and recurrence risk.'),
        (topic_id_val, 'A 30-year-old female presents with chest pain and heart failure symptoms 2 weeks after a flu-like illness. Troponin is 2.4. Echo shows an EF of 35%. Diagnosis?', '["Viral Myocarditis", "Anterior STEMI", "Pericarditis", "Pulmonary Embolism"]', 0, 'Viral myocarditis typically follows a viral prodrome and presents with heart failure, elevated cardiac enzymes, and potentially arrhythmias.'),
        (topic_id_val, 'A patient with an acute MI suddenly develops pulmonary edema and a new holosystolic murmur at the apex radiating to the axilla. What is the complication?', '["Ventricular Septal Defect", "Acute Mitral Regurgitation (Papillary Muscle Rupture)", "Aortic Dissection", "Tricuspid Regurgitation"]', 1, 'Acute mitral regurgitation due to papillary muscle rupture (usually 2-7 days post-MI) causes sudden heart failure and a characteristic apical systolic murmur.'),
        (topic_id_val, 'In a patient with Acute Aortic Regurgitation (e.g., from dissection), why is the use of an Intra-Aortic Balloon Pump (IABP) CONTRAINDICATED?', '["It increases preload", "It worsens the regurgitation by inflating during diastole", "It causes hemolysis", "It increases myocardial oxygen demand"]', 1, 'IABP inflates during diastole to improve coronary perfusion, but in aortic regurgitation, this would force more blood back through the incompetent valve into the left ventricle.'),
        (topic_id_val, 'Which valvular emergency is most commonly associated with a history of Rheumatic Heart Disease and presents with sudden onset AFib?', '["Mitral Stenosis", "Aortic Stenosis", "Mitral Regurgitation", "Tricuspid Stenosis"]', 0, 'Mitral stenosis often leads to left atrial enlargement, which triggers atrial fibrillation. It is most commonly a sequela of rheumatic fever.'),
        (topic_id_val, 'What is the "Kussmaul Sign" in the context of pericardial disease?', '["A rise in JVP on inspiration", "A drop in BP on inspiration", "A systolic murmur", "A pericardial friction rub"]', 0, 'Kussmaul sign is the paradoxical rise in jugular venous pressure during inspiration, commonly seen in constrictive pericarditis or right heart failure.');
        
    END IF;
END $$;
