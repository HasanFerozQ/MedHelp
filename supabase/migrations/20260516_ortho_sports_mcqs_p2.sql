-- Orthopedics: Part 2 (Questions 51-100)
-- Topic: Sports medicine & soft tissue injuries (Elbow & Distal Biceps)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- ELBOW: UCL (ULNAR COLLATERAL LIGAMENT)
    (v_topic_id, 'Which phase of the pitching motion places the maximum valgus stress on the elbow?', '["Wind-up", "Early cocking", "Late cocking / Early acceleration", "Follow-through"]', 2, 'The transition from late cocking to acceleration creates peak valgus torque, exceeding the UCL''s ultimate tensile strength.'),
    (v_topic_id, 'The "Anterior Bundle" of the UCL consists of two bands; which band is tight throughout the entire range of motion?', '["Anterior band", "Posterior band", "Transverse band", "None"]', 0, 'The anterior band of the anterior bundle is functionally the most important.'),
    (v_topic_id, 'A pitcher with UCL insufficiency may report pain primarily during which part of the throwing motion?', '["Release", "Acceleration", "Deceleration", "Follow-through"]', 1, 'Pain occurs when the valgus stress is at its peak during acceleration.'),
    (v_topic_id, 'What is the "Talar Tilt" equivalent in the elbow for UCL testing?', '["Valgus Stress Test at 25 degrees of flexion", "Varus Stress Test", "Moving Valgus Stress Test", "O''Brien test"]', 0, 'Testing at 25 degrees unlocks the olecranon from the fossa, isolating the UCL.'),
    (v_topic_id, 'The "Milking Maneuver" is a clinical test for:', '["Biceps rupture", "UCL injury", "Lateral epicondylitis", "Cubital tunnel"]', 1, 'The examiner pulls the patient''s thumb posteriorly while the elbow is flexed, creating valgus stress.'),
    (v_topic_id, 'What is the "Tommy John" surgery officially called?', '["Distal biceps repair", "UCL reconstruction", "Ulnar nerve transposition", "Lateral release"]', 1, 'Named after the first pitcher to undergo the procedure in 1974 by Dr. Frank Jobe.'),
    (v_topic_id, 'Which nerve is most commonly at risk or requires management during UCL reconstruction?', '["Radial nerve", "Ulnar nerve", "Median nerve", "Axillary nerve"]', 1, 'The ulnar nerve is often transposed or protected as it runs just posterior to the UCL.'),

    -- ELBOW: VALGUS EXTENSION OVERLOAD (VEO)
    (v_topic_id, 'What is the primary pathophysiology of "Valgus Extension Overload" in throwers?', '["Tension at the medial side", "Compression/impingement at the posteromedial olecranon", "Inflammation of the biceps", "None"]', 1, 'Repeated high-velocity extension causes the olecranon to "hammer" into the olecranon fossa, leading to osteophyte formation.'),
    (v_topic_id, 'Which structure is typically impinged in VEO?', '["The radial head", "The medial aspect of the olecranon tip and the corresponding fossa", "The ulnar nerve", "The coronoid process"]', 1, 'Posteromedial osteophytes are the hallmark of VEO.'),
    (v_topic_id, 'A patient with VEO will typically have pain with:', '["Passive flexion", "Resisted extension", "Terminal extension (locking out)", "Supination"]', 2, 'Pain occurs when the osteophytes abut in the fossa at full extension.'),

    -- ELBOW: EPICONDYLITIS
    (v_topic_id, 'Which muscle is most commonly involved in "Lateral Epicondylitis" (Tennis Elbow)?', '["Extensor Carpi Radialis Brevis (ECRB)", "Extensor Carpi Ulnaris (ECU)", "Brachioradialis", "Flexor Carpi Radialis"]', 0, 'The ECRB is the primary culprit due to its origin and repetitive eccentric loading.'),
    (v_topic_id, 'What is the underlying pathology in "Tennis Elbow"?', '["Acute inflammation (tendonitis)", "Angiofibroblastic hyperplasia (tendonosis/degeneration)", "Infection", "Muscle tear"]', 1, 'It is a degenerative process (epicondylalgia/tendinosis) rather than an acute inflammatory one.'),
    (v_topic_id, 'Which muscle is most commonly involved in "Medial Epicondylitis" (Golfer''s Elbow)?', '["Pronator teres and Flexor Carpi Radialis (FCR)", "Flexor Carpi Ulnaris", "Biceps", "Triceps"]', 0, 'Repetitive wrist flexion and pronation stress these origins.'),
    (v_topic_id, 'Physical exam for Lateral Epicondylitis involves pain with:', '["Resisted wrist flexion", "Resisted wrist extension with the elbow in extension", "Resisted forearm supination", "None"]', 1, 'Stressing the ECRB reproduces the pain.'),

    -- ELBOW: LITTLE LEAGUE ELBOW
    (v_topic_id, '"Little League Elbow" is a term encompassing several injuries; which is the most classic in a 10-year-old?', '["Medial epicondyle apophysitis", "UCL tear", "Radial head fracture", "Olecranon bursitis"]', 0, 'Young throwers are prone to traction injuries at the medial epicondyle growth plate.'),
    (v_topic_id, 'Which of the following is a "Lateral" side complication of the valgus stress seen in Little League Elbow?', '["UCL tear", "Osteochondritis Dissecans (OCD) of the Capitellum", "Ulnar neuritis", "None"]', 1, 'Valgus stress causes medial tension but lateral COMPRESSION, which can lead to OCD of the capitellum or radial head.'),

    -- ELBOW: OCD OF THE CAPITELLUM
    (v_topic_id, 'OCD of the capitellum is most common in which patient population?', '["Adolescent overhead athletes (pitchers, gymnasts)", "Elderly patients", "Sedentary children", "None"]', 0, 'Repetitive compressive loads across the radio-capitellar joint lead to ischemia.'),
    (v_topic_id, 'What is "Panner''s Disease"?', '["A tumor of the elbow", "Osteochondrosis of the entire capitellum in children (typically <10 years old)", "A fracture of the radius", "None"]', 1, 'Panner''s involves the entire epiphysis and has a better prognosis than OCD (which is more focal and seen in older children).'),

    -- ELBOW: DISTAL BICEPS (ADVANCED)
    (v_topic_id, 'The distal biceps tendon has two distinct bundles; what are they?', '["Medial and lateral", "Short head and Long head", "Anterior and posterior", "Superior and inferior"]', 1, 'The long head and short head remain distinct and have slightly different insertion points on the radial tuberosity.'),
    (v_topic_id, 'Which distal biceps bundle (Long or Short head) inserts more posteriorly and distally on the radial tuberosity?', '["Long head", "Short head", "Both insert at the same spot", "None"]', 0, 'The long head inserts more distally; the short head more proximally.'),
    (v_topic_id, 'What structure allows for some elbow flexion strength even after a complete distal biceps rupture?', '["Brachialis muscle", "Triceps", "Anconeus", "Supinator"]', 0, 'The brachialis is the primary flexor of the elbow, regardless of forearm position.'),
    (v_topic_id, 'True or False: Surgical repair of a distal biceps rupture is generally recommended for active individuals to restore "Supination" power.', '["True", "False"]', 0, 'Supination strength loss (up to 40-50%) is the main indication for repair in active patients.'),
    (v_topic_id, 'The "Lacertus Fibrosus" (Bicipital Aponeurosis) can sometimes stay intact during a biceps rupture, leading to:', '["A negative Hook Test", "A \"pseudo-intact\" feeling or a less obvious Popeye deformity", "Increased pain", "None"]', 1, 'An intact lacertus can mask the clinical signs of a complete rupture.'),

    -- ELBOW: DISTAL TRICEPS
    (v_topic_id, 'Distal triceps ruptures are much less common than biceps ruptures; which metabolic condition is highly associated with them?', '["Diabetes", "Systemic Steroid Use / Renal failure", "Gout", "Hypothyroidism"]', 1, 'Renal osteodystrophy and chronic steroid use weaken the tendon insertion.'),
    (v_topic_id, 'The "Flake Sign" on a lateral elbow X-ray after trauma suggests:', '["Radial head fracture", "Distal triceps avulsion (bony flake from the olecranon)", "Coronoid fracture", "None"]', 1, 'It is pathognomonic for a triceps avulsion injury.'),

    -- ELBOW: NERVES
    (v_topic_id, 'Which nerve can be compressed in the "Arcade of Frohse"?', '["Posterior Interosseous Nerve (PIN)", "Ulnar nerve", "Median nerve", "Axillary nerve"]', 0, 'The Arcade of Frohse is the superior border of the supinator muscle, a classic site for PIN entrapment.'),
    (v_topic_id, 'What is the hallmark of "PIN Syndrome" (Posterior Interosseous Nerve)?', '["Weakness of wrist and finger extensors WITHOUT sensory loss", "Numbness in the thumb", "Weakness of the flexors", "None"]', 0, 'The PIN is purely motor (after its branch to the ECRB/ECRL).'),
    (v_topic_id, 'Compression of the ulnar nerve at the "Cubital Tunnel" can be worsened by:', '["Repetitive elbow extension", "Repetitive or prolonged elbow flexion", "Forearm supination", "None"]', 1, 'Flexion increases pressure in the tunnel and stretches the nerve.'),
    (v_topic_id, 'What is "Osborne''s Ligament"?', '["A ligament in the knee", "The roof of the cubital tunnel (joining the two heads of the FCU)", "A fracture line", "None"]', 1, 'It is a common site of ulnar nerve compression.'),

    -- ELBOW: PLICA
    (v_topic_id, 'A "Posterolateral Elbow Plica" can mimic which other condition?', '["Tennis elbow (Lateral epicondylitis)", "Cubital tunnel", "Biceps rupture", "Fracture"]', 0, 'Snapping or pain at the radio-capitellar joint can be confused with ECRB pain.'),

    -- ELBOW: INSTABILITY
    (v_topic_id, 'What is the "Terrible Triad" of the elbow?', '["Elbow dislocation, Coronoid fracture, and Radial head fracture", "ACL, MCL, and Meniscus", "Ulnar nerve, UCL, and Biceps", "None"]', 0, 'This injury is highly unstable and difficult to manage.'),
    (v_topic_id, 'What is "Posterolateral Rotatory Instability" (PLRI)?', '["UCL injury", "Insufficiency of the Lateral Collateral Ligament (LCL) complex, specifically the LUCL", "Radial nerve palsy", "None"]', 1, 'The LUCL (Lateral Ulnar Collateral Ligament) is the key stabilizer against PLRI.'),
    (v_topic_id, 'The "Pivot Shift Test" of the elbow assesses for:', '["ACL tear", "PLRI (Posterolateral Rotatory Instability)", "UCL tear", "Tennis elbow"]', 1, 'The patient is supine with the arm overhead; valgus stress and axial load are applied during flexion.'),

    -- ADDITIONAL 15+
    (v_topic_id, 'Which structure is the "Primary" stabilizer of the elbow to "VARUS" stress?', '["UCL", "Lateral Collateral Ligament (LCL) complex", "Triceps", "Biceps"]', 1, 'Specifically the LUCL and RCL.'),
    (v_topic_id, 'True or False: The coronoid process is a critical bony stabilizer of the elbow.', '["True", "False"]', 0, 'It prevents posterior subluxation; losing even 50% of the coronoid significantly destabilizes the joint.'),
    (v_topic_id, 'In the "Horii Circle" (stages of elbow dislocation), which ligament is the FIRST to tear?', '["UCL", "LUCL (Lateral Ulnar Collateral Ligament)", "Anterior capsule", "None"]', 1, 'Dislocations typically progress from lateral to medial (Stage 1 = LUCL tear).'),
    (v_topic_id, 'What is "Student''s Elbow"?', '["Tennis elbow", "Olecranon bursitis", "Ulnar neuritis", "None"]', 1, 'Named after the pressure on the elbow from leaning on it while studying.'),
    (v_topic_id, 'True or False: Aspiration of an olecranon bursa is usually avoided unless infection is suspected.', '["True", "False"]', 0, 'Aspiration increases the risk of introducing infection or creating a chronic sinus tract.'),
    (v_topic_id, 'Which muscle originates from the "Common Extensor Origin"?', '["ECRB, ED, EDM, ECU", "FCR, FCU, PL", "Biceps", "Triceps"]', 0, 'The ECRB is the most important in the context of sports injuries.'),
    (v_topic_id, 'The "Radial Tunnel Syndrome" involves compression of which nerve?', '["PIN (Posterior Interosseous Nerve)", "Ulnar", "Median", "Musculocutaneous"]', 0, 'It presents with pain over the extensor muscle mass, often mimicking tennis elbow but without motor weakness (initially).'),
    (v_topic_id, 'How do you differentiate Radial Tunnel Syndrome from Lateral Epicondylitis?', '["Pain is 4-5 cm distal to the epicondyle in Radial Tunnel Syndrome", "Pain is exactly at the bone in RTS", "RTS causes numbness", "None"]', 0, 'The location of maximal tenderness is the key differentiator.'),
    (v_topic_id, 'What is the "Cozen''s Test"?', '["Test for UCL", "Resisted wrist extension with the forearm pronated (test for lateral epicondylitis)", "Test for carpal tunnel", "None"]', 1, 'It is a classic provocative test.'),
    (v_topic_id, 'Which tendon is most commonly used for "Tommy John" surgery if the Palmaris is absent?', '["Gracilis", "Semitendinosus", "Toe extensor", "All of the above"]', 3, 'Gracilis and semitendinosus (hamstrings) are common alternatives.'),
    (v_topic_id, 'True or False: Most UCL injuries in non-professional athletes can be treated non-operatively.', '["True", "False"]', 0, 'Unless the patient is a high-level thrower, PT and rest are usually sufficient.'),
    (v_topic_id, 'What is the "Thrower''s Exostosis"?', '["A bony growth on the scapula", "Posteromedial olecranon osteophytes seen in VEO", "A rib fracture", "None"]', 1, 'It is a result of the chronic repetitive trauma of pitching.'),
    (v_topic_id, 'Which nerve passes through the "Struthers'' Ligament" (if present)?', '["Ulnar nerve", "Median nerve", "Radial nerve", "None"]', 1, 'Struthers'' ligament (associated with a supracondylar process) can compress the median nerve.'),
    (v_topic_id, 'Where is the "Lacertus Fibrosus" located?', '["Knee", "Shoulder", "Antecubital fossa (bicipital aponeurosis)", "Wrist"]', 2, 'It crosses the median nerve and brachial artery.'),
    (v_topic_id, 'Compression of the "Median Nerve" at the elbow can occur in which condition?', '["Pronator Syndrome", "Carpal Tunnel Syndrome", "Cubital Tunnel Syndrome", "None"]', 0, 'Entrapment can occur between the two heads of the pronator teres.'),
    (v_topic_id, 'Which of the following is the primary restraint to elbow "Distraction" in full extension?', '["UCL", "Anterior capsule", "Biceps", "Triceps"]', 1, 'The anterior capsule provides about 70% of the restraint to distraction in full extension.'),
    (v_topic_id, 'Final Question Part 2: What is the most sensitive test for a distal biceps rupture?', '["MRI", "The Hook Test", "X-ray", "Ultrasound"]', 1, 'A physical exam by an experienced clinician (Hook Test) is remarkably accurate.')
    ;
END $$;
