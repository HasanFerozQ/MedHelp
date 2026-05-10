-- Batch 6: Procedural Skills (301-350)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Advanced Resuscitation (ED Thoracotomy, Canthotomy, Pacing)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'Standard incision for an emergent ED Thoracotomy?', '["Left 4th or 5th intercostal space", "Right 2nd ICS", "Median sternotomy", "Clamshell"]', 0, 'A left anterolateral thoracotomy is the standard approach for emergent resuscitation.'),
        (topic_id_val, 'Primary goals of ED Thoracotomy?', '["Release tamponade, control cardiac bleeding, and clamp aorta", "Fix ribs", "Defibrillate", "None"]', 0, 'Relieving tamponade and aortic cross-clamping are the primary objectives.'),
        (topic_id_val, 'First procedural step for unstable bradycardia refractory to atropine?', '["Transvenous pacing", "Transcutaneous pacing", "Pacemaker", "Massage"]', 1, 'Transcutaneous pacing is the rapid first-line intervention for unstable bradycardia.'),
        (topic_id_val, 'Reason for "Sync" mode in cardioversion?', '["Shock on T-wave", "Shock on R-wave", "Increase energy", "Skin resistance"]', 1, 'Sync mode ensures the shock is delivered on the R-wave to avoid the vulnerable T-wave period.'),
        (topic_id_val, 'Where is the REBOA balloon inflated for abdominal hemorrhage control?', '["Zone 1", "Zone 2", "Zone 3", "Zone 4"]', 0, 'Zone 1 (descending thoracic aorta) is the target for balloon inflation in REBOA for sub-diaphragmatic hemorrhage.'),
        (topic_id_val, 'First procedural choice for stable monomorphic VT?', '["Defibrillation", "Synchronized Cardioversion", "Pacing", "Massage"]', 1, 'If procedural intervention is needed for stable VT, synchronized cardioversion is the choice.'),
        (topic_id_val, 'Shoulder reduction maneuver name?', '["Milch", "Stimson", "Modified Allman", "All of the above"]', 3, 'Milch, Stimson, and Allman are all valid shoulder reduction techniques.'),
        (topic_id_val, 'What is a ''Bankart lesion''?', '["Humeral fracture", "Tear of anterior-inferior labrum", "Nerve palsy", "Rib fracture"]', 1, 'A Bankart lesion is a tear of the anterior-inferior labrum from a shoulder dislocation.'),
        (topic_id_val, 'Main risk of "Blind" (non-ultrasound) IJ placement?', '["Carotid puncture", "Esophageal puncture", "Air embolism", "All"]', 0, 'Accidental carotid artery puncture is the most common serious complication of blind IJ access.'),
        (topic_id_val, 'Emergency procedure for retrobulbar hematoma with IOP > 40?', '["Lateral Canthotomy and Cantholysis", "Needle aspiration", "Surgery", "Observation"]', 0, 'Lateral canthotomy is an emergency procedure to save vision from orbital compartment syndrome.');
        
    END IF;
END $$;
