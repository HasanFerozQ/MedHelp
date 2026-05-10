-- Batch 3: Procedural Skills (121-180)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Thoracic and Cardiac Procedures (Chest Tubes, Pericardiocentesis)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A patient with a tension pneumothorax requires immediate needle decompression. What is the updated (ATLS 10th Ed) recommended location for this procedure in adults?', '["2nd intercostal space, mid-clavicular line", "4th or 5th intercostal space, anterior-axillary line", "3rd intercostal space, mid-axillary line", "7th intercostal space, posterior-axillary line"]', 1, 'The 4th or 5th intercostal space (ICS) at the anterior-axillary line is now preferred over the 2nd ICS because the chest wall is thinner and success rates are higher.'),
        (topic_id_val, 'When performing a Tube Thoracostomy (Chest Tube), the incision is made and the tube is passed over which part of the rib?', '["Over the top of the rib", "Under the bottom of the rib", "Directly through the rib", "It does not matter"]', 0, 'The tube must pass over the superior aspect of the rib to avoid the neurovascular bundle (intercostal artery, vein, and nerve), which runs along the inferior groove of the rib.'),
        (topic_id_val, 'A patient has a traumatic hemothorax. What is the generally recommended size for a chest tube in an adult for drainage of blood?', '["10-14 French", "20-24 French", "28-32 French", "8 French Pigtail"]', 2, 'For hemothorax, a larger bore tube (28-32 French or larger) is traditionally used to prevent clogging with blood clots, although smaller tubes are sometimes used with high-suction systems.'),
        (topic_id_val, 'During Pericardiocentesis, the needle is typically inserted at which location?', '["Left 2nd intercostal space", "Subxiphoid, directed toward the left shoulder", "Right 5th intercostal space", "Left 5th intercostal space, mid-axillary line"]', 1, 'The subxiphoid approach, inserting at a 45-degree angle and directing the needle toward the left shoulder, is the classic blind approach to avoid the pleura and lungs.'),
        (topic_id_val, 'What is the most serious acute complication of a blind pericardiocentesis?', '["Liver laceration", "Right ventricular puncture", "Pneumothorax", "Esophageal perforation"]', 1, 'Puncturing the right ventricle is a serious risk, which is why ultrasound guidance is strongly recommended for this procedure today.'),
        (topic_id_val, 'A patient with a large pleural effusion requires thoracentesis. What is the maximum amount of fluid that should be removed in one session to avoid re-expansion pulmonary edema?', '["500 mL", "1000-1500 mL", "3000 mL", "There is no limit"]', 1, 'Removing more than 1.5 liters at once increases the risk of re-expansion pulmonary edema, a rare but life-threatening complication.'),
        (topic_id_val, 'Where is the ''Triangle of Safety'' for chest tube insertion located?', '["Border of pectoralis major, latissimus dorsi, and 5th ICS", "Mid-clavicular line 2nd ICS", "Posterior to the scapula", "Inferior to the diaphragm"]', 0, 'The triangle of safety is bounded by the lateral border of the pectoralis major, the anterior border of the latissimus dorsi, and the level of the 5th intercostal space (above the nipple line).'),
        (topic_id_val, 'In a patient with a massive hemothorax (>1500 mL initial drainage), what is the definitive next step?', '["Repeat CXR", "Emergent Thoracotomy (usually in the OR)", "Clamp the chest tube", "Start IV antibiotics"]', 1, 'Initial drainage of >1500 mL of blood or ongoing drainage of >200 mL/hr for 2-4 hours is an indication for operative management (thoracotomy).'),
        (topic_id_val, 'Which of the following is a sign of a successful needle decompression for tension pneumothorax?', '["Blood return in the syringe", "A ''hiss'' of air escaping the chest", "Immediate return of a normal ECG", "Sudden increase in JVD"]', 1, 'The escape of air (hissing sound) followed by improvement in hemodynamics (BP, SpO2) confirms successful decompression.'),
        (topic_id_val, 'For a simple, small primary spontaneous pneumothorax (<15% or 2cm), what is the first-line management according to most guidelines?', '["Large-bore chest tube", "Needle aspiration or conservative observation with oxygen", "Emergent thoracotomy", "Pleurodesis"]', 1, 'Small, stable primary pneumothoraces can often be managed with observation and supplemental oxygen (to speed resorption) or simple needle aspiration.');
        
    END IF;
END $$;
