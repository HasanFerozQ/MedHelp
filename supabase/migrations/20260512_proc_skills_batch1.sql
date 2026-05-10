-- Batch 1: Procedural Skills (1-60)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Airway Management, RSI, and Difficult Airway

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 45-year-old male with a history of severe asthma presents in respiratory failure. He is agitated and using accessory muscles. Decision is made for RSI. Which induction agent is preferred due to its bronchodilatory properties?', '["Etomidate", "Ketamine", "Propofol", "Midazolam"]', 1, 'Ketamine is a dissociative anesthetic that provides bronchodilation via catecholamine release, making it the induction agent of choice for patients with severe asthma or COPD.'),
        (topic_id_val, 'A 65-year-old male with a suspected crush injury (potassium level 6.2 mEq/L) requires intubation. Which paralytic agent is strictly CONTRAINDICATED?', '["Rocuronium", "Succinylcholine", "Vecuronium", "Pancuronium"]', 1, 'Succinylcholine is a depolarizing neuromuscular blocker that can transiently raise serum potassium by 0.5-1.0 mEq/L. In hyperkalemic patients, this can lead to lethal arrhythmias or cardiac arrest.'),
        (topic_id_val, 'During a difficult intubation, a "Bougie" (gum elastic bougie) is used. What is the classic tactile sensation that confirms correct tracheal placement?', '["Smooth sliding", "Feeling the tracheal rings (clicks)", "Resistance at 15cm", "Soft-tissue bounce"]', 1, 'The tactile sensation of "clicks" as the bougie tip slides over the tracheal rings, or "hang-up" at the carina, are reliable signs of tracheal placement.'),
        (topic_id_val, 'A patient with a massive facial trauma and upper airway obstruction fails three attempts at orotracheal intubation. SpO2 is 75%. What is the most appropriate next step?', '["Attempt Laryngeal Mask Airway (LMA)", "Perform emergent Cricothyroidotomy", "Continue BVM ventilation for 10 minutes", "Attempt Nasotracheal intubation"]', 1, 'In a "cannot intubate, cannot oxygenate" (CICO) scenario, especially with facial trauma where supraglottic devices may fail, emergent surgical cricothyroidotomy is the definitive step.'),
        (topic_id_val, 'Which of the following is an absolute contraindication to performing a surgical cricothyroidotomy?', '["Massive neck edema", "Cervical spine injury", "Age under 8-10 years", "Expanding neck hematoma"]', 2, 'Surgical cricothyroidotomy is contraindicated in young children (typically <8-10 years) due to the small size of the cricothyroid membrane and the risk of subglottic stenosis. Needle cricothyroidotomy with jet ventilation is preferred.'),
        (topic_id_val, 'What is the most common complication associated with nasotracheal intubation in the ED?', '["Vocal cord paralysis", "Epistaxis", "Aspiration", "Esophageal perforation"]', 1, 'Epistaxis is the most common complication, often occurring when the tube passes through the nasal turbinates.'),
        (topic_id_val, 'A 30-year-old trauma patient has a suspected cervical spine injury. Which maneuver should be used during intubation to stabilize the neck?', '["Jaw thrust only", "Manual In-Line Stabilization (MILS)", "C-collar application during laryngoscopy", "Head-tilt chin-lift"]', 1, 'MILS is the standard technique where an assistant stabilizes the head and neck in a neutral position while the clinician performs intubation. The C-collar should be opened or removed to allow jaw movement.'),
        (topic_id_val, 'Which blade is generally preferred for intubating an adult patient with a long, floppy epiglottis?', '["Macintosh 3", "Miller 3", "Wis-Foregger", "Magill"]', 1, 'The Miller (straight) blade is designed to directly lift the epiglottis, providing a better view in patients with a floppy or large epiglottis.'),
        (topic_id_val, 'In RSI, what is the primary purpose of the "Pre-oxygenation" phase?', '["To induce unconsciousness", "To increase the oxygen reservoir in the lungs (Functional Residual Capacity)", "To prevent gastric insufflation", "To sedate the patient"]', 1, 'Pre-oxygenation (nitrogen washout) creates an oxygen reservoir in the FRC, allowing for several minutes of safe apnea during the intubation attempt.'),
        (topic_id_val, 'A patient is intubated but has absent breath sounds on the left side and decreased breath sounds on the right. The tube is at 26cm at the teeth. Diagnosis?', '["Esophageal intubation", "Right mainstem bronchus intubation", "Left-sided tension pneumothorax", "Mucus plug"]', 1, 'A right mainstem intubation is common if the ETT is advanced too far (average depth is 21-23cm). It results in decreased or absent breath sounds on the left.');
        
    END IF;
END $$;
