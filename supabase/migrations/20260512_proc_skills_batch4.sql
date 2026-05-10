-- Batch 4: Procedural Skills (181-240)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Abdominal, GU, and Neuro Procedures

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 25-year-old female requires a Lumbar Puncture (LP) for suspected meningitis. What is the optimal position to measure opening pressure accurately?', '["Sitting upright", "Lateral recumbent (side-lying)", "Prone", "Trendelenburg"]', 1, 'Opening pressure must be measured in the lateral recumbent position to avoid hydrostatic pressure artifacts.'),
        (topic_id_val, 'In a Lumbar Puncture, the needle is inserted between which vertebral levels to ensure safety from the spinal cord in an adult?', '["L1-L2", "L3-L4 or L4-L5", "T12-L1", "L5-S1"]', 1, 'In adults, the spinal cord ends at L1-L2; L3-L4 or L4-L5 are safe insertion points.'),
        (topic_id_val, 'What is the most common complication following a Lumbar Puncture?', '["Epidural hematoma", "Post-LP Headache", "Meningitis", "Brain herniation"]', 1, 'Post-LP headache occurs in 10-30% of patients and is typically positional.'),
        (topic_id_val, 'A patient with cirrhosis and massive ascites requires paracentesis. What is the preferred entry point to avoid the inferior epigastric artery?', '["Midline, 2cm below umbilicus", "Left lower quadrant, 4-5cm superior and medial to ASIS", "Directly through the umbilicus", "Right upper quadrant"]', 1, 'The LLQ approach is preferred to avoid the epigastric vessels and the cecum.'),
        (topic_id_val, 'Diagnostic Peritoneal Lavage (DPL) is considered POSITIVE for blunt trauma if how many RBCs per cubic millimeter are found?', '["1,000", "10,000", "100,000", "1,000,000"]', 2, 'A count of >100,000 RBC/mm³ is positive for intra-abdominal hemorrhage in blunt trauma.'),
        (topic_id_val, 'A 60-year-old male with BPH has acute urinary retention. A standard Foley fails to pass. What is the next best catheter choice?', '["14 French Silastic", "''Coude''-tip catheter", "12 French Latex", "3-way irrigation catheter"]', 1, 'A Coude catheter has a curved, stiff tip designed to bypass an enlarged prostate.'),
        (topic_id_val, 'When performing a Suprapubic Cystostomy (tap), where is the needle inserted?', '["Midline, 2cm above pubic symphysis", "Midline, 5cm above umbilicus", "Lateral to rectus", "Scrotum"]', 0, 'The needle is inserted in the midline, 2 cm superior to the pubic symphysis into a full bladder.'),
        (topic_id_val, 'Which LP tube is sent for cell count to differentiate traumatic tap from true SAH?', '["Tube 1 only", "Tube 4 only", "Tubes 1 and 4", "Tubes 2 and 3"]', 2, 'Comparing Tube 1 and 4 helps differentiate a traumatic tap from a subarachnoid hemorrhage.'),
        (topic_id_val, 'Which finding warrants a CT head before performing an LP?', '["Fever", "Papilledema or Focal Neurological Deficit", "Nausea", "Stiff neck"]', 1, 'Papilledema or focal deficits suggest increased ICP, which risks herniation during LP.'),
        (topic_id_val, 'What is the absolute contraindication for a Lumbar Puncture?', '["Skin infection at the site", "Anticoagulation", "Migraines", "Age over 65"]', 0, 'Infection at the site is an absolute contraindication to avoid introducing bacteria into the CNS.');
        
    END IF;
END $$;
