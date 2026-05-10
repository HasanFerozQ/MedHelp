-- Batch 6: Procedural Skills (301-350)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Advanced Resuscitation (ED Thoracotomy, Pacing, Cardioversion)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A pulseless patient with penetrating chest trauma who lost pulses 5 minutes ago in the ED is a candidate for Resuscitative Thoracotomy. Which side is the incision typically made?', '["Left 4th or 5th intercostal space", "Right 2nd intercostal space", "Midline sternotomy", "Bilateral clamshell"]', 0, 'A left anterolateral thoracotomy (4th or 5th ICS) is the standard initial approach to allow for decompression of tamponade and cross-clamping of the aorta.'),
        (topic_id_val, 'What are the three main goals of performing an emergent ED Thoracotomy?', '["Release tamponade, control cardiac hemorrhage, and cross-clamp the aorta", "Aspirate a PE, repair the esophagus, and fix ribs", "Defibrillate, pace, and intubate", "None of the above"]', 0, 'The primary objectives are relieving pericardial tamponade, controlling intrathoracic bleeding (e.g., cardiac wound), and cross-clamping the descending aorta to redistribute blood to the brain and heart.'),
        (topic_id_val, 'A patient with symptomatic bradycardia (HR 35, BP 80/40) fails to respond to atropine. What is the immediate next procedural step?', '["Transvenous pacing", "Transcutaneous pacing", "Permanent pacemaker placement", "Carotid massage"]', 1, 'Transcutaneous pacing (TCP) is the rapid, non-invasive first-line treatment for unstable bradycardia refractory to medical therapy.'),
        (topic_id_val, 'When performing Synchronized Cardioversion for Atrial Fibrillation, why is the "Sync" mode used?', '["To deliver the shock at the peak of the T-wave", "To deliver the shock on the R-wave", "To increase the energy level", "To decrease skin resistance"]', 1, 'Sync mode ensures the shock is delivered on the R-wave, avoiding the T-wave (vulnerable period), which could trigger Ventricular Fibrillation (R-on-T phenomenon).'),
        (topic_id_val, 'A patient with a massive Pulmonary Embolism and cardiac arrest may require "Resuscitative Endovascular Balloon Occlusion of the Aorta" (REBOA). Which zone is the balloon inflated for abdominal hemorrhage control?', '["Zone 1 (Descending Thoracic Aorta)", "Zone 2 (Paravisceral)", "Zone 3 (Infrarenal)", "Zone 4 (Iliac)"]', 0, 'Zone 1 (descending thoracic aorta above the celiac trunk) is the target for balloon inflation in REBOA for patients with non-compressible torso hemorrhage below the diaphragm.'),
        (topic_id_val, 'In a patient with a "stable" but persistent wide-complex tachycardia (Monomorphic VT), what is the first-line procedural option?', '["Immediate Defibrillation", "Synchronized Cardioversion", "Transcutaneous Pacing", "Carotid Sinus Massage"]', 1, 'Stable VT can be treated with pharmacological agents, but if procedural intervention is chosen, synchronized cardioversion (e.g., 100J) is the correct choice.'),
        (topic_id_val, 'What is the "Allman maneuver" used for in the ED?', '["Shoulder dislocation reduction", "Intubation", "Venous access", "Cardiac massage"]', 0, 'The Milch, Stimson, and modified Allman/Cunningham maneuvers are various techniques used for reducing anterior shoulder dislocations.'),
        (topic_id_val, 'A patient with a shoulder dislocation has a "Bankart lesion." What does this refer to?', '["Fracture of the humerus", "Tear of the anterior-inferior glenoid labrum", "Compression fracture of the posterior humeral head", "Axillary nerve palsy"]', 1, 'A Bankart lesion is a tear of the anterior-inferior labrum, often occurring during an anterior shoulder dislocation. (Hill-Sachs is the humeral head fracture).'),
        (topic_id_val, 'What is the primary risk of using "Blind" (non-ultrasound) guidance for Internal Jugular central line placement?', '["Carotid artery puncture", "Esophageal puncture", "Air embolism", "All of the above"]', 0, 'Accidental carotid artery puncture is the most common serious complication of blind IJ access, which is why ultrasound is now standard.'),
        (topic_id_val, 'A patient with a suspected retrobulbar hematoma and increasing intraocular pressure (>40 mmHg) requires an emergent procedure to save their vision. What is it?', '["Lateral Canthotomy and Cantholysis", "Needle aspiration of the eye", "Cataract surgery", "Orbital decompression in the OR"]', 0, 'Lateral canthotomy and cantholysis is a time-sensitive emergency procedure to decompress the orbit and prevent permanent vision loss from a retrobulbar hematoma.');
        
    END IF;
END $$;
