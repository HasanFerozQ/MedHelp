-- Orthopedics: Part 6 (Questions 251-300)
-- Topic: Sports medicine & soft tissue injuries (Misc: Compartment, Concussion, Pharm, Biomechanics)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- EXERCISE-INDUCED COMPARTMENT SYNDROME (EICS)
    (v_topic_id, 'Which compartment of the leg is most commonly affected by Exercise-Induced Compartment Syndrome?', '["Anterior compartment", "Lateral compartment", "Deep posterior compartment", "Superficial posterior compartment"]', 0, 'The anterior compartment is involved in ~70-80% of cases.'),
    (v_topic_id, 'What is the diagnostic threshold for "Post-Exercise" compartment pressure in EICS (Pedowitz criteria)?', '["10 mmHg", "15 mmHg", "30 mmHg at 1 minute or 20 mmHg at 5 minutes post-exercise", "100 mmHg"]', 2, 'These time-dependent pressure elevations are diagnostic.'),
    (v_topic_id, 'How does EICS differ from acute compartment syndrome?', '["EICS is a surgical emergency", "EICS symptoms resolve with rest, while acute compartment syndrome is progressive and requires immediate fasciotomy", "EICS has no pain", "None"]', 1, 'EICS is chronic and exertional; acute is traumatic and emergent.'),

    -- SPORTS CONCUSSION
    (v_topic_id, 'What is the primary pathophysiology of a "Concussion"?', '["Structural brain damage (bleeding)", "Functional metabolic crisis (ionic shift and energy mismatch)", "Skull fracture", "None"]', 1, 'It is a functional rather than structural injury.'),
    (v_topic_id, 'True or False: Loss of consciousness (LOC) is required for a diagnosis of concussion.', '["True", "False"]', 1, 'Less than 10% of concussions involve LOC.'),
    (v_topic_id, 'What is the "Second Impact Syndrome"?', '["A second concussion after the first has healed", "Rapid, often fatal brain swelling that occurs when a second concussion happens before the first one has fully resolved", "A neck injury", "None"]', 1, 'Loss of cerebrovascular autoregulation leads to massive cerebral edema.'),
    (v_topic_id, 'The "SCAT6" (Sport Concussion Assessment Tool) is used for:', '["Acute on-field and sideline evaluation", "Long-term monitoring only", "Surgical planning", "None"]', 0, 'It is the latest standardized tool for clinical concussion assessment.'),

    -- SPORTS PHARMACOLOGY
    (v_topic_id, 'Which class of antibiotics is associated with an increased risk of tendon rupture (especially the Achilles)?', '["Penicillins", "Fluoroquinolones (e.g., Ciprofloxacin)", "Macrolides", "Tetracyclines"]', 1, 'Fluoroquinolones interfere with collagen synthesis.'),
    (v_topic_id, 'Anabolic steroid use can lead to which musculoskeletal complication?', '["Increased tendon flexibility", "Tendon rupture (due to muscle strength outstripping tendon structural integrity)", "Bone softening", "None"]', 1, 'Hypertrophic muscles can overwhelm the relatively weaker tendons.'),
    (v_topic_id, 'Chronic use of NSAIDs can potentially inhibit which aspect of bone healing?', '["Osteoclast activity", "Prostaglandin-mediated osteoblast recruitment and bone remodeling", "Calcium absorption", "None"]', 1, 'COX inhibition can delay the inflammatory phase necessary for bone repair/remodeling.'),

    -- BIOMECHANICS & REHAB
    (v_topic_id, 'What is an "Eccentric" muscle contraction?', '["Muscle shortening under load", "Muscle lengthening while under tension", "Static contraction with no movement", "None"]', 1, 'Eccentric exercises are the mainstay for treating tendinopathies (e.g., Achilles, Patellar).'),
    (v_topic_id, 'In the "Kinetic Chain" of throwing, which segment provides the majority of the energy and momentum?', '["The shoulder", "The elbow", "The legs and trunk", "The wrist"]', 2, 'The "engine" of the throw is the lower body and core.'),
    (v_topic_id, 'What is the "Open Kinetic Chain" exercise?', '["A squat", "A leg press", "A seated leg extension (where the distal segment is free to move)", "A pull-up"]', 2, 'In open chain, the distal part is free; in closed chain (squat), it is fixed.'),

    -- PERFORMANCE ENHANCEMENT (DOPING)
    (v_topic_id, 'Erythropoietin (EPO) is used by endurance athletes to increase:', '["Muscle mass", "Red blood cell mass and oxygen-carrying capacity", "Bone density", "Reaction time"]', 1, 'It increases hematocrit, which also increases the risk of stroke/clotting.'),
    (v_topic_id, 'Which of the following is a side effect of HGH (Human Growth Hormone) abuse?', '["Acromegaly, joint pain, and insulin resistance", "Hypoglycemia", "Weight loss", "None"]', 0, 'Excess HGH can lead to significant systemic morbidity.'),

    -- NUTRITION & HEAT ILLNESS
    (v_topic_id, 'The "Female Athlete Triad" consists of which three conditions?', '["Anemia, Obesity, and ACL tears", "Low energy availability (with or without disordered eating), Menstrual dysfunction, and Low bone mineral density", "Knee pain, Back pain, and Headaches", "None"]', 1, 'It is a critical syndrome to recognize in young female athletes.'),
    (v_topic_id, 'What is the most severe form of heat illness, characterized by CNS dysfunction and core temp >104 F (40 C)?', '["Heat exhaustion", "Heat cramps", "Heat stroke", "Heat syncope"]', 2, 'Heat stroke is a medical emergency requiring rapid cooling.'),
    (v_topic_id, 'Hyponatremia in marathon runners is most often caused by:', '["Lack of salt intake", "Over-consumption of hypotonic fluids (water) during the race", "Excessive sweating", "None"]', 1, 'Dilutional hyponatremia is a serious risk in long-distance events.'),

    -- MISC SPORTS MEDICINE
    (v_topic_id, 'What is "Burner" or "Stinger" in football?', '["A skin burn", "A transient brachial plexus stretch injury or nerve root compression", "A concussion", "None"]', 1, 'It causes sudden burning pain and weakness in one arm.'),
    (v_topic_id, 'The "Return to Play" protocol for concussion involves how many stages of increasing activity?', '["3", "6 (from rest to full contact)", "10", "None"]', 1, 'Athletes must remain asymptomatic at each stage for 24 hours before progressing.'),

    -- ADDITIONAL 30
    (v_topic_id, 'Which type of graft has the LOWEST risk of disease transmission for ACL surgery?', '["Allograft", "Autograft (patient''s own tissue)", "Synthetic graft", "None"]', 1, 'Autograft eliminates the risk of viral transmission from a donor.'),
    (v_topic_id, 'What is "Osteitis Fibrosa Cystica"? (Wait, sports context): What is "Stress Reaction" vs "Stress Fracture"?', '["They are the same", "Stress reaction is bone marrow edema on MRI without a visible fracture line; stress fracture has a cortical break", "Stress reaction is worse", "None"]', 1, 'Reaction is the precursor to a true fracture.'),
    (v_topic_id, 'Which vitamin is critical for calcium absorption and bone health in athletes?', '["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin K"]', 2, 'Vitamin D deficiency is common and increases stress fracture risk.'),
    (v_topic_id, 'The "Q-Angle" is measured between the ASIS, the patella, and what other point?', '["Tibial tubercle", "Fibula", "Greater trochanter", "None"]', 0, 'A high Q-angle is a risk factor for patellofemoral pain.'),
    (v_topic_id, 'What is "Proprioception"?', '["Muscle strength", "The body''s ability to sense its position and movement in space", "Pain sensation", "None"]', 1, 'Proprioceptive training is key to preventing recurrent ankle sprains.'),
    (v_topic_id, 'Which muscle is most commonly involved in "Groin Strain"?', '["Iliopsoas", "Adductor longus", "Rectus femoris", "Gracilis"]', 1, 'Already covered, but high yield for Part 6 review.'),
    (v_topic_id, 'What is "Sports Anemia"?', '["True iron deficiency", "A transient increase in plasma volume that dilutes the hemoglobin concentration", "A genetic condition", "None"]', 1, 'It is often a normal physiological adaptation to training.'),
    (v_topic_id, 'True or False: "Delayed Onset Muscle Soreness" (DOMS) is primarily caused by lactic acid buildup.', '["True", "False"]', 1, 'DOMS is caused by microscopic muscle fiber tears and inflammation, not lactic acid (which clears quickly).'),
    (v_topic_id, 'What is the "Clonus" test used to screen for in a sports physical?', '["Knee stability", "Upper motor neuron lesion or spinal cord injury", "Muscle strength", "None"]', 1, 'Repetitive rhythmic contractions after a stretch indicate CNS pathology.'),
    (v_topic_id, 'Which of the following is a "high-risk" site for a stress fracture that usually requires non-weight bearing?', '["Navicular, 5th metatarsal base, and Great toe sesamoids", "Fibula and 2nd metatarsal", "Ribs", "None"]', 0, 'These sites have poor blood supply and high mechanical stress.'),
    (v_topic_id, 'True or False: Cryotherapy (ice) is most effective when applied in the first 48-72 hours after an acute injury.', '["True", "False"]', 0, 'It helps control pain and swelling during the acute inflammatory phase.'),
    (v_topic_id, 'The "PEACE & LOVE" acronym has replaced "RICE" for soft tissue injuries. What does the "E" in PEACE stand for?', '["Exercise", "Elevation", "Electricity", "None"]', 1, 'Elevation is still a core component.'),
    (v_topic_id, 'What is "Plyometric" training?', '["Slow lifting", "Exercises that use explosive movements to increase power (stretch-shortening cycle)", "Yoga", "None"]', 1, 'Jump training is a classic example.'),
    (v_topic_id, 'In a "Closed Kinetic Chain" exercise like a squat, which muscle provides the primary force for knee extension?', '["Hamstrings", "Quadriceps", "Gluteals", "Gastrocnemius"]', 1, 'The quads are the main extensors.'),
    (v_topic_id, 'Which structure is most commonly injured in a "High" ankle sprain?', '["ATFL", "AITFL", "Deltoid", "None"]', 1, 'Reviewing syndesmosis for Part 6.'),
    (v_topic_id, 'What is the "Internal Bracing" technique in ligament repair?', '["A type of cast", "Using a high-strength suture tape to augment a primary repair", "A metal plate", "None"]', 1, 'It allows for earlier range of motion and rehabilitation.'),
    (v_topic_id, 'Which knee ligament has the highest rate of "spontaneous" healing?', '["ACL", "MCL", "LCL", "PCL"]', 1, 'The MCL''s blood supply and extra-articular position are key.'),
    (v_topic_id, 'What is the "Pivot Shift" equivalent for the HIP?', '["Log roll", "Dial test", "There isn''t a direct equivalent, but the FADIR test is provocative", "None"]', 2, 'The pivot shift is unique to the knee''s rotatory instability.'),
    (v_topic_id, 'Which nerve is at risk during a "Lateral Meniscus" repair?', '["Peroneal", "Saphenous", "Tibial", "None"]', 0, 'The peroneal nerve is near the lateral joint line.'),
    (v_topic_id, 'Which nerve is at risk during a "Medial Meniscus" repair?', '["Peroneal", "Saphenous nerve", "Tibial", "None"]', 1, 'The saphenous nerve and its infrapatellar branch are on the medial side.'),
    (v_topic_id, 'What is "Hoffa''s Disease"?', '["A hip disease", "Infrapatellar fat pad impingement", "A spine disease", "None"]', 1, 'Review for Part 6.'),
    (v_topic_id, 'True or False: An "Autograft" for ACL reconstruction is generally preferred in patients under 25 years old.', '["True", "False"]', 0, 'Allografts have significantly higher failure rates in young, active patients.'),
    (v_topic_id, 'What is the "Dynamic Start" in sprinting?', '["Starting from a standstill", "A start that utilizes the stretch-shortening cycle for maximal power", "None", "None"]', 1, 'Biomechanics of power production.'),
    (v_topic_id, 'Which part of the "Throwing Motion" is the most dangerous for the rotator cuff?', '["Early cocking", "Late cocking", "Deceleration (follow-through)", "Wind-up"]', 2, 'The cuff must eccentrically contract to slow down the arm, leading to high tensile stress.'),
    (v_topic_id, 'What is "GIRD"?', '["A stomach condition", "Glenohumeral Internal Rotation Deficit", "A knee condition", "None"]', 1, 'Final review of shoulder thrower pathology.'),
    (v_topic_id, 'The "Sleeper Stretch" is used to treat:', '["GIRD and posterior capsule tightness", "ACL tears", "Hip impingement", "None"]', 0, 'It improves internal rotation in overhead athletes.'),
    (v_topic_id, 'Which muscle is the "Key" to scapular stabilization in the overhead athlete?', '["Serratus anterior", "Biceps", "Deltoid", "Pectoralis major"]', 0, 'It prevents winging and allows for proper upward rotation of the scapula.'),
    (v_topic_id, 'What is "Little League Elbow" vs "Little League Shoulder"?', '["They are the same", "Elbow involves the medial epicondyle; shoulder involves the proximal humeral physis", "None", "None"]', 1, 'Both are growth plate overuse injuries.'),
    (v_topic_id, 'True or False: PRP (Platelet-Rich Plasma) injections have a "strong" evidence base for treating acute ACL tears.', '["True", "False"]', 1, 'While used, the evidence for *acute* ACL healing is weak/controversial; better evidence exists for chronic tendinopathies.'),
    (v_topic_id, 'Final Question Part 6: What is the primary goal of "Neuromuscular Training" in ACL prevention?', '["Increasing max strength", "Improving movement patterns and landing mechanics to reduce \"valgus collapse\"", "None", "None"]', 1, 'Teaching athletes to land safely is the most effective way to reduce non-contact ACL injuries.')
    ;
END $$;
