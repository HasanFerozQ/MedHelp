-- Batch 4: Procedural Skills (181-240)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Abdominal, GU, and Neuro Procedures (LP, Paracentesis, DPL, Cath)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 25-year-old female presents with severe headache and meningismus. CT head is negative. What is the optimal position for the patient during a Lumbar Puncture (LP) to measure opening pressure accurately?', '["Sitting upright", "Lateral recumbent (side-lying)", "Prone", "Trendelenburg"]', 1, 'Opening pressure must be measured in the lateral recumbent position to avoid the effects of hydrostatic pressure that occur when sitting.'),
        (topic_id_val, 'In a Lumbar Puncture, the needle is inserted between which vertebral levels to ensure safety from the spinal cord in an adult?', '["L1-L2", "L3-L4 or L4-L5", "T12-L1", "L5-S1"]', 1, 'In adults, the spinal cord ends at L1-L2. Inserting the needle at L3-L4 or L4-L5 (level of the iliac crests) is safe.'),
        (topic_id_val, 'What is the most common complication following a Lumbar Puncture?', '["Epidural hematoma", "Post-LP Headache", "Meningitis", "Brain herniation"]', 1, 'Post-lumbar puncture headache occurs in 10-30% of patients and is typically positional (worse when upright).'),
        (topic_id_val, 'A patient with cirrhosis and massive ascites requires a large-volume paracentesis for symptom relief. What is the preferred entry point to avoid the inferior epigastric artery?', '["Midline, 2cm below the umbilicus", "2cm medial to the ASIS", "Lateral approach, 4-5cm superior and medial to the ASIS", "Directly through the umbilicus"]', 2, 'The lateral approach (left lower quadrant) is generally preferred to avoid the epigastric vessels and the bladder/bowel that may be midline.'),
        (topic_id_val, 'Diagnostic Peritoneal Lavage (DPL) is considered POSITIVE for blunt trauma if how many RBCs per cubic millimeter are found in the aspirate?', '["1,000", "10,000", "100,000", "1,000,000"]', 2, 'A count of >100,000 RBC/mm³ in a DPL is considered positive for intra-abdominal hemorrhage in blunt trauma.'),
        (topic_id_val, 'A 60-year-old male with acute urinary retention and a known history of BPH cannot have a standard Foley catheter passed. What is the next best catheter choice?', '["14 French Silastic", "Coude-tip catheter", "12 French Latex", "3-way irrigation catheter"]', 1, 'A Coude catheter has a curved, stiff tip designed to bypass the enlarged median lobe of the prostate.'),
        (topic_id_val, 'When performing a Suprapubic Cystostomy (Suprapubic tap), where is the needle inserted?', '["Midline, 2cm above the pubic symphysis", "Midline, 5cm above the umbilicus", "Lateral to the rectus abdominis", "Directly into the scrotum"]', 0, 'The needle is inserted in the midline, approximately 2 cm superior to the pubic symphysis, ensuring the bladder is full.'),
        (topic_id_val, 'A patient with suspected subarachnoid hemorrhage has an LP. Which tube(s) are typically sent for "cell count" to differentiate a traumatic tap from true hemorrhage?', '["Tube 1 only", "Tube 4 only", "Tubes 1 and 4", "Tubes 2 and 3"]', 2, 'Comparing the RBC count in Tube 1 and Tube 4 helps differentiate a traumatic tap (where count drops) from SAH (where count remains high).'),
        (topic_id_val, 'Which of the following is an absolute contraindication to performing a Lumbar Puncture?', '["Skin infection at the site of insertion", "Anticoagulation therapy", "History of migraines", "Age over 65"]', 0, 'Skin infection at the puncture site is an absolute contraindication to prevent introducing bacteria into the subarachnoid space.'),
        (topic_id_val, 'Before performing an LP, which of the following is the most important clinical finding that warrants a CT scan first to rule out increased ICP?', '["Fever", "Papilledema or Focal Neurological Deficit", "Nausea", "Stiff neck"]', 1, 'Papilledema, focal deficits, or altered mental status suggest increased ICP or a space-occupying lesion, which could lead to brain herniation during an LP.');
        
    END IF;
END $$;
