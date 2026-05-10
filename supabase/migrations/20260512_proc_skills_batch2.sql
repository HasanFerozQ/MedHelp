-- Batch 2: Procedural Skills (61-120)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Vascular Access (Central Lines, IO, Arterial Lines)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 70-year-old in septic shock requires a central line. Which site is associated with the LOWEST risk of iatrogenic pneumothorax?', '["Subclavian", "Internal Jugular (IJ)", "Femoral", "External Jugular"]', 2, 'The femoral site has no risk of pneumothorax as it is far from the thoracic cavity, although it carries a higher risk of infection and thrombosis in adults.'),
        (topic_id_val, 'When performing an Internal Jugular (IJ) central line placement, where is the vein typically located in relation to the carotid artery?', '["Medial and Deep", "Lateral and Superficial", "Posterior and Medial", "Anterior and Medial"]', 1, 'The IJ vein is typically located lateral and slightly superficial to the carotid artery. Ultrasound guidance is now the standard of care to confirm this anatomy.'),
        (topic_id_val, 'Which central venous access site is generally preferred for a patient undergoing active CPR?', '["Internal Jugular", "Subclavian", "Femoral", "Basilic"]', 2, 'The femoral site is preferred during CPR because it does not interfere with chest compressions or airway management and can be accessed easily from the groin.'),
        (topic_id_val, 'A 3-year-old in cardiac arrest has no peripheral IV access after 2 attempts. What is the most immediate next step for vascular access?', '["Internal Jugular central line", "Intraosseous (IO) access", "Venous cutdown", "Subclavian central line"]', 1, 'In pediatric or adult cardiac arrest where IV access cannot be rapidly established, IO access is the first-line alternative due to its speed and high success rate.'),
        (topic_id_val, 'Where is the recommended insertion site for a proximal tibia Intraosseous (IO) needle?', '["Medial to the tibial tuberosity", "Lateral to the tibial tuberosity", "Directly on the patella", "Distal to the medial malleolus"]', 0, 'The proximal tibia site is 1-2 cm medial to the tibial tuberosity on the flat aspect of the bone.'),
        (topic_id_val, 'What is a major contraindication to Intraosseous (IO) placement in a specific limb?', '["Dehydration", "Previous IO attempt in the same bone", "Old age", "Presence of a central line elsewhere"]', 1, 'A previous IO attempt or fracture in the target bone is a contraindication, as fluids would simply leak out of the previous hole/fracture site.'),
        (topic_id_val, 'During Subclavian vein catheterization, the needle is directed toward which landmark?', '["The thyroid notch", "The suprasternal notch", "The acromion", "The midpoint of the humerus"]', 1, 'The needle is inserted 1 cm inferior to the junction of the medial and middle thirds of the clavicle and directed toward the suprasternal notch.'),
        (topic_id_val, 'A patient develops sudden SOB and decreased breath sounds on the right after a subclavian central line attempt. What is the immediate diagnostic step?', '["ECG", "Upright Chest X-ray", "D-dimer", "ABG"]', 1, 'An upright CXR (or bedside ultrasound) is the gold standard for detecting an iatrogenic pneumothorax following a central line attempt.'),
        (topic_id_val, 'Which central line site is associated with the highest risk of catheter-related bloodstream infection (CRBSI)?', '["Internal Jugular", "Subclavian", "Femoral", "Upper extremity PICC"]', 2, 'The femoral site has the highest infection rate due to its proximity to the groin and difficulty in maintaining a sterile dressing.'),
        (topic_id_val, 'What is the "Seldinger Technique" used for in the ED?', '["Wound closure", "Vascular access via a guidewire", "Airway suctioning", "Joint reduction"]', 1, 'The Seldinger technique is the standard procedure for inserting a catheter over a guidewire into a vessel or body cavity.');
        
    END IF;
END $$;
