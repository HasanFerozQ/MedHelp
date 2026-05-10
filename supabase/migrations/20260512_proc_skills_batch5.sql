-- Batch 5: Procedural Skills (241-300)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Soft Tissue and Orthopedic Procedures

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A patient has a 3cm fluctuant abscess. What is the standard treatment?', '["Needle aspiration", "Incision and Drainage (I&D)", "Oral antibiotics alone", "Warm compresses"]', 1, 'Incision and Drainage is the definitive treatment for skin abscesses.'),
        (topic_id_val, 'Which approach is easiest for knee Arthrocentesis with a large effusion?', '["Superolateral or Mediopatellar", "Anterior", "Posterior", "Inferior"]', 0, 'Superolateral or mediopatellar approaches provide the highest success rates for knee aspiration.'),
        (topic_id_val, 'Synovial fluid analysis shows WBC > 100,000 /mm³. Diagnosis?', '["Gout", "Septic Arthritis", "Osteoarthritis", "Rheumatoid Arthritis"]', 1, 'A synovial WBC > 50,000-100,000 is highly suggestive of septic arthritis.'),
        (topic_id_val, 'What is the preferred splint for a distal radius fracture?', '["Ulnar gutter", "Sugar-tong splint", "Thumb spica", "Long arm"]', 1, 'A sugar-tong splint allows for swelling while limiting wrist and forearm rotation.'),
        (topic_id_val, 'Which suture is preferred for skin closure on a forearm laceration?', '["4-0 or 5-0 Nylon (Non-absorbable)", "3-0 Chromic Gut", "6-0 Prolene", "Silk"]', 0, 'Monofilament non-absorbable sutures like Nylon are standard for skin closure on the extremities.'),
        (topic_id_val, 'Treatment for a subungual hematoma covering >50% of the nail?', '["Nail removal", "Trephination", "Ice alone", "Digital block"]', 1, 'Trephination is effective for relieving pain and pressure from subungual hematomas.'),
        (topic_id_val, 'Where is the digital block injected?', '["Into the pulp", "Base of the finger", "Directly into wound", "DIP joint"]', 1, 'Digital blocks are injected at the base of the finger to block all four digital nerves.'),
        (topic_id_val, 'Traditionally avoided anesthetic in "fingers, toes, nose, and hose"?', '["Lidocaine", "Lidocaine with Epinephrine", "Bupivacaine", "Mepivacaine"]', 1, 'Epinephrine is traditionally avoided in terminal circulation areas due to ischemia risk, though this is now debated.'),
        (topic_id_val, 'Device for measuring compartment pressure?', '["Manometer", "Stryker needle device", "Tonometer", "Manifold"]', 1, 'The Stryker device is the standard for measuring intracompartmental pressures.'),
        (topic_id_val, 'Essential step to prevent skin breakdown under a splint?', '["Cold water", "Generous cast padding (Webril)", "Tight ACE wrap", "Plaster"]', 1, 'Generous padding over bony prominences is critical to prevent pressure necrosis.');
        
    END IF;
END $$;
