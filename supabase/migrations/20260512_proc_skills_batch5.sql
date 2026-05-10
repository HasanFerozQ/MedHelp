-- Batch 5: Procedural Skills (241-300)
-- Topic: Procedural Skills (Year 4 Emergency Medicine)
-- Focus: Soft Tissue and Orthopedic Procedures (I&D, Arthrocentesis, Splinting)

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-procedural-skills' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A patient presents with a 3cm fluctuant abscess on the back. What is the standard procedural approach?', '["Needle aspiration", "Incision and Drainage (I&D)", "Oral antibiotics alone", "Warm compresses alone"]', 1, 'Incision and Drainage is the definitive treatment for skin abscesses. Antibiotics are generally not required for simple abscesses in healthy patients.'),
        (topic_id_val, 'When performing an Arthrocentesis of the knee, which approach is typically the easiest and most successful for a large effusion?', '["Superolateral or Mediopatellar", "Anterior", "Posterior", "Inferior"]', 0, 'The superolateral approach (entering just above and lateral to the patella) or mediopatellar approach are standard and provide high success rates.'),
        (topic_id_val, 'Which of the following joint fluid analysis findings is most suggestive of a Septic Arthritis?', '["WBC < 2,000 /mm³", "WBC > 50,000 /mm³ (often > 100,000)", "Clear, straw-colored appearance", "Presence of negatively birefringent crystals"]', 1, 'A high synovial fluid WBC count (typically >50,000/mm³ with >75% neutrophils) is highly suggestive of septic arthritis.'),
        (topic_id_val, 'A patient with a distal radius fracture requires a splint. What is the standard splinting choice for this injury in the ED?', '["Ulnar gutter splint", "Sugar-tong splint", "Thumb spica splint", "Long arm posterior splint"]', 1, 'A sugar-tong splint is preferred for distal radius/ulna fractures as it allows for swelling while limiting wrist and forearm rotation (pronation/supination).'),
        (topic_id_val, 'When suturing a clean, 2cm linear laceration on the forearm, which suture material is generally preferred?', '["4-0 or 5-0 Monofilament Nylon (Non-absorbable)", "3-0 Chromic Gut (Absorbable)", "6-0 Prolene", "Silk"]', 0, 'Monofilament non-absorbable sutures (like Nylon or Prolene) are standard for skin closure on the extremities to minimize tissue reaction and provide strength.'),
        (topic_id_val, 'A patient presents with a painful subungual hematoma covering >50% of the nail bed. What is the most appropriate procedure?', '["Nail removal", "Trephination (nail cautery/drilling)", "Ice and elevation only", "Digital block and suture"]', 1, 'Trephination using a heated paperclip or a specialized cautery tool is effective for relieving the pressure and pain of a subungual hematoma.'),
        (topic_id_val, 'When performing a Digital Block for a finger laceration, where should the anesthetic be injected?', '["Into the pulp of the finger", "At the base of the finger near the dorsal and volar nerves", "Directly into the wound", "Into the distal interphalangeal joint"]', 1, 'Anesthetic is injected on both sides of the base of the finger to block the four digital nerves (two dorsal, two volar).'),
        (topic_id_val, 'Which of the following anesthetics is classically CONTRAINDICATED (though debated) for use in "fingers, toes, nose, and hose" due to risk of ischemia?', '["Lidocaine", "Lidocaine with Epinephrine", "Bupivacaine", "Mepivacaine"]', 1, 'Epinephrine is traditionally avoided in areas with terminal circulation (like fingers) due to the theoretical risk of vasoconstriction causing distal ischemia, though recent evidence suggests it is safer than previously thought.'),
        (topic_id_val, 'A patient with a suspected Compartment Syndrome in the lower leg requires pressure measurement. A pressure >30 mmHg or within 30 mmHg of the diastolic BP (Delta pressure) is diagnostic. What is the name of the device often used?', '["Manometer", "Stryker needle device", "Tonometer", "Sphygmomanometer"]', 1, 'The Stryker device is a specialized commercial needle and pressure-monitoring system used for measuring intracompartmental pressures.'),
        (topic_id_val, 'When applying a splint, what is the most important step to prevent skin breakdown and pressure sores?', '["Using cold water", "Applying thick layers of cast padding (cotton)", "Wrapping the ACE bandage as tight as possible", "Using plaster instead of fiberglass"]', 1, 'Generous use of padding (e.g., Webril) over bony prominences is essential to prevent pressure necrosis and discomfort.');
        
    END IF;
END $$;
