-- Orthopedics: Sports medicine & soft tissue injuries
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-sports-medicine

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-sports-medicine';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Rotator Cuff Tear (Supraspinatus)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Empty Can' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Empty Can', 'A 55-year-old carpenter presents with chronic right shoulder pain, especially when reaching overhead. He reports a sudden worsening of pain after lifting a heavy box.

Vitals: Stable.
Physical Examination: Weakness with resisted abduction in internal rotation and 30 degrees of forward flexion (Empty Can test). Painful arc between 60 and 120 degrees.
Laboratory Results: MRI shows a full-thickness tear of the supraspinatus tendon.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old with supraspinatus tear; positive Empty Can test and painful arc.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which muscle is most commonly involved in rotator cuff tears?', '["Infraspinatus", "Supraspinatus", "Teres minor", "Subscapularis"]', 1, 'The supraspinatus is the most frequently torn rotator cuff muscle due to its location under the acromion.'),
    (v_case_id, 'The "Drop Arm Test" is a clinical sign of:', '["Minor inflammation", "A large or full-thickness supraspinatus tear", "Biceps tendonitis", "Frozen shoulder"]', 1, 'Inability to slowly lower the arm from 90 degrees of abduction suggests a significant supraspinatus failure.'),
    (v_case_id, 'What is the "critical zone" of the supraspinatus?', '["An area of poor vascularity near the insertion on the greater tuberosity", "The origin at the scapula", "The muscle belly", "None"]', 0, 'This hypovascular zone is prone to degenerative tears.');

    ---------------------------------------------------------------------------
    -- CASE 02: Shoulder Impingement Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Catching Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Catching Pain', 'A 30-year-old swimmer complains of shoulder pain during her workouts. She feels a "catch" when raising her arm overhead.

Vitals: Stable.
Physical Examination: Positive Neer test (pain with passive forward flexion) and Hawkin''s test (pain with internal rotation at 90 deg flexion).
Laboratory Results: X-rays show a Type II (curved) acromion but no fracture.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old swimmer with positive Neer and Hawkin''s tests; Type II acromion.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is being "impinged" in this syndrome?', '["The rotator cuff tendons and subacromial bursa", "The glenoid labrum", "The deltoid muscle", "The clavicle"]', 0, 'Impingement occurs when the rotator cuff and bursa are squeezed between the humeral head and the acromion/coracoacromial arch.'),
    (v_case_id, 'Which Bigliani acromial shape is most highly associated with rotator cuff tears?', '["Type I (Flat)", "Type II (Curved)", "Type III (Hooked)", "None"]', 2, 'The hooked acromion (Type III) significantly narrows the subacromial space.'),
    (v_case_id, 'First-line treatment for subacromial impingement includes:', '["Immediate surgery", "Rest, NSAIDs, physical therapy, and potentially a subacromial steroid injection", "A cast for 6 weeks", "Total shoulder replacement"]', 1, 'Conservative management is successful in most patients.');

    ---------------------------------------------------------------------------
    -- CASE 03: Adhesive Capsulitis (Frozen Shoulder)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Shoulder', 'A 50-year-old female with Type 1 Diabetes presents with severe shoulder stiffness. She can no longer reach behind her back to fasten her bra.

Vitals: Stable.
Physical Examination: Severe loss of BOTH active and passive range of motion, especially external rotation.
Laboratory Results: MRI shows a thickened axillary recess.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old diabetic with loss of active and passive ROM (Frozen Shoulder).', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark of Adhesive Capsulitis?', '["Loss of only active ROM", "Loss of both active and passive ROM, particularly external rotation", "Pain only at night", "Weakness without pain"]', 1, 'True "stiffness" means the joint cannot be moved even by the examiner (passive loss).'),
    (v_case_id, 'Which systemic condition is most strongly associated with adhesive capsulitis?', '["Hypertension", "Diabetes Mellitus", "Gout", "Anemia"]', 1, 'Diabetics have a higher incidence and often a more severe/recalcitrant course of frozen shoulder.'),
    (v_case_id, 'What is the typical natural history of this condition?', '["It gets worse forever", "It is usually self-limiting, progressing through \"freezing,\" \"frozen,\" and \"thawing\" phases over 1-2 years", "It requires surgery within 1 month", "None"]', 1, 'Most cases eventually resolve or significantly improve with time and therapy.');

    ---------------------------------------------------------------------------
    -- CASE 04: Anterior Shoulder Instability
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Popped Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Popped Shoulder', 'A 19-year-old football player sustained a shoulder dislocation when his arm was forced into abduction and external rotation. It was reduced in the ED.

Vitals: Stable.
Physical Examination: Positive apprehension and relocation tests.
Laboratory Results: MRI shows an anterior-inferior labral tear and a compression fracture of the posterolateral humeral head.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old with a Bankart lesion and Hill-Sachs deformity after dislocation.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for the anterior-inferior labral tear?', '["Hill-Sachs lesion", "Bankart lesion", "SLAP tear", "Biceps rupture"]', 1, 'A Bankart lesion is a detachment of the anterior-inferior labrum from the glenoid.'),
    (v_case_id, 'The compression fracture of the humeral head is called a:', '["Bankart lesion", "Hill-Sachs lesion", "Segond fracture", "Maisonneuve fracture"]', 1, 'A Hill-Sachs lesion occurs when the soft humeral head is "dented" by the hard glenoid rim during dislocation.'),
    (v_case_id, 'Which nerve is at highest risk during an anterior shoulder dislocation?', '["Radial nerve", "Axillary nerve", "Ulnar nerve", "Median nerve"]', 1, 'The axillary nerve (supplying the deltoid) wraps around the surgical neck of the humerus and is easily stretched.');

    ---------------------------------------------------------------------------
    -- CASE 05: SLAP Lesion
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pitcher''s Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pitcher''s Pain', 'A college baseball pitcher reports deep shoulder pain and "clicking" during his throwing motion.

Vitals: Stable.
Physical Examination: Positive O''Brien''s test (pain with resisted downward pressure on the arm in internal rotation/adduction, relieved by external rotation).
Laboratory Results: MR Arthrogram shows a tear of the superior labrum.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pitcher with deep pain and positive O''Brien''s test; superior labrum tear.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does SLAP stand for?', '["Superior Labrum Anterior to Posterior", "Shoulder Ligament and Proximal tendon", "Small Labral Attachment Point", "None"]', 0, 'SLAP tears involve the top part of the labrum where the long head of the biceps tendon attaches.'),
    (v_case_id, 'Which clinical test is highly suggestive of a SLAP lesion?', '["Lachman test", "O''Brien''s Active Compression test", "Empty Can test", "Neer test"]', 1, 'O''Brien''s test helps differentiate labral pathology from AC joint pain.'),
    (v_case_id, 'True or False: Type II SLAP lesions (detachment of the labrum and biceps anchor) are the most common type requiring surgical repair in athletes.', '["True", "False"]', 0, 'Type II is the most clinically significant and common surgical type.');

    ---------------------------------------------------------------------------
    -- CASE 06: AC Joint Separation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shoulder Point' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shoulder Point', 'A cyclist falls directly onto his "point of the shoulder." He presents with a visible deformity on top of his shoulder.

Vitals: Stable.
Physical Examination: Tucking the arm reduces the deformity. Point tenderness over the Acromioclavicular (AC) joint.
Laboratory Results: X-rays show the distal clavicle is 100% displaced superiorly compared to the other side.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cyclist with a visible shoulder deformity after a fall; 100% clavicle displacement.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A separation with 100% superior displacement of the clavicle is classified as Rockwood Grade:', '["Grade I", "Grade II", "Grade III", "Grade VI"]', 2, 'Grade III involves complete rupture of both the AC and Coracoclavicular (CC) ligaments, with 25-100% displacement.'),
    (v_case_id, 'What ligaments are responsible for the vertical stability of the clavicle?', '["AC ligaments", "Coracoclavicular (CC) ligaments (Conoid and Trapezoid)", "Glenohumeral ligaments", "None"]', 1, 'The CC ligaments (Conoid/Trapezoid) are the primary vertical stabilizers.'),
    (v_case_id, 'Initial management for most Grade I and II AC separations is:', '["Surgical reconstruction", "Sling, ice, and early range of motion (conservative)", "Hanging arm cast", "Bed rest"]', 1, 'Grades I and II are almost always treated without surgery.');

    ---------------------------------------------------------------------------
    -- CASE 07: Distal Biceps Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Popeye Arm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Popeye Arm', 'A 40-year-old male was helping a friend move a heavy refrigerator. He felt a "pop" in his elbow when the weight shifted suddenly.

Vitals: Stable.
Physical Examination: Deformity in the mid-arm (muscle belly retracted proximally). Weakness in elbow supination. Positive "Hook Test."
Laboratory Results: Ultrasound confirms a complete distal tendon rupture.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old with mid-arm deformity and positive Hook Test after heavy lifting.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which action is most severely weakened by a distal biceps rupture?', '["Elbow flexion", "Forearm supination", "Forearm pronation", "Wrist extension"]', 1, 'While the biceps flexes the elbow, it is the most powerful supinator of the forearm.'),
    (v_case_id, 'What is the "Hook Test"?', '["Trying to hook the biceps tendon with a finger from the lateral side of the antecubital fossa", "Checking for a fracture", "Checking reflexes", "None"]', 0, 'In a complete rupture, the examiner cannot "hook" the tendon.');

    ---------------------------------------------------------------------------
    -- CASE 08: Subscapularis Tear
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Front of the Cuff' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Front of the Cuff', 'A patient presents with shoulder pain after an injury.

Vitals: Stable.
Physical Examination: Patient is unable to push his hand away from his lower back (Lift-off test). Also shows weakness when pushing his hand against his belly (Belly-press test).
Laboratory Results: MRI shows a tear of the subscapularis tendon.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with positive Lift-off and Belly-press tests; subscapularis tear.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary function of the subscapularis?', '["Internal rotation", "External rotation", "Abduction", "Elevation"]', 0, 'The subscapularis is the only rotator cuff muscle that internally rotates the humerus.'),
    (v_case_id, 'Where does the subscapularis tendon insert?', '["Greater tuberosity", "Lesser tuberosity", "Bicipital groove", "Coracoid process"]', 1, 'The other three cuff muscles (Supraspinatus, Infraspinatus, Teres minor) insert on the greater tuberosity.'),
    (v_case_id, 'True or False: Isolated subscapularis tears are less common than supraspinatus tears.', '["True", "False"]', 0, 'Subscapularis tears are often associated with larger, multi-tendon rotator cuff injuries.');

    ---------------------------------------------------------------------------
    -- CASE 09: Long Head of Biceps Tendonitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Groove Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Groove Pain', 'A patient has anterior shoulder pain that is worse when carrying heavy bags.

Vitals: Stable.
Physical Examination: Tenderness directly over the bicipital groove. Positive Speed''s test (pain with resisted forward flexion with the forearm supinated).
Laboratory Results: Normal X-rays.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with bicipital groove tenderness and positive Speed''s test.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which test involves resisting forearm supination while the patient rotates the arm externally?', '["Speed''s test", "Yergason''s test", "Neer test", "Hawkin''s test"]', 1, 'Yergason''s test is classic for bicipital tendonitis or instability in the groove.'),
    (v_case_id, 'The long head of the biceps tendon enters the shoulder joint and attaches to the:', '["Coracoid process", "Superior glenoid tubercle/labrum", "Acromion", "Greater tuberosity"]', 1, 'The short head of the biceps attaches to the coracoid (extra-articular).'),
    (v_case_id, 'Initial management of biceps tendonitis is:', '["Surgery", "Conservative (NSAIDs, activity modification, PT)", "Total joint replacement", "Antibiotics"]', 1, 'Conservative care is the standard starting point.');

    ---------------------------------------------------------------------------
    -- CASE 10: Multidirectional Instability (MDI)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Double-Jointed Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Double-Jointed Shoulder', 'A 17-year-old gymnast reports that both of her shoulders "feel loose" and sometimes slip out of place without trauma. She can touch her thumb to her forearm.

Vitals: Stable.
Physical Examination: Positive "Sulcus Sign" (a visible indentation under the acromion when the arm is pulled downward). Generalized ligamentous laxity.
Laboratory Results: Normal MRI.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 17-year-old with generalized laxity and a positive Sulcus Sign.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary treatment for MDI?', '["Immediate surgery", "Extensive physical therapy (6-12 months) focusing on rotator cuff and periscapular strengthening", "Bracing for life", "None"]', 1, 'Surgery is only considered if prolonged, dedicated PT fails, as these patients often have global capsule laxity.'),
    (v_case_id, 'The "Sulcus Sign" indicates instability in which direction?', '["Anterior", "Posterior", "Inferior", "Superior"]', 2, 'A positive sulcus sign indicates inferior laxity, a key component of MDI.'),
    (v_case_id, 'True or False: Patients with MDI usually have a history of a single, violent traumatic dislocation.', '["True", "False"]', 1, 'MDI is typically an atraumatic or micro-traumatic condition related to tissue laxity.');

    ---------------------------------------------------------------------------
    -- CASE 11: ACL Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pop and Swell' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pop and Swell', 'A 22-year-old female soccer player planted her foot and twisted her knee while trying to change direction. She felt a "loud pop" and her knee swelled up within an hour.

Vitals: Stable.
Physical Examination: Positive Lachman test (increased anterior translation with no firm endpoint at 20-30 deg flexion). Positive Pivot Shift test.
Laboratory Results: MRI shows a complete tear of the Anterior Cruciate Ligament (ACL) and a small "Segond fracture" (avulsion of the lateral tibial plateau).', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old with a "pop," rapid swelling, and positive Lachman test; ACL tear.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which is the most sensitive physical exam test for an acute ACL tear?', '["Anterior Drawer test", "Lachman test", "Pivot Shift test", "McMurray test"]', 1, 'The Lachman test is more sensitive than the Anterior Drawer because it minimizes hamstring guarding by flexing the knee only 20-30 degrees.'),
    (v_case_id, 'What is the significance of a "Segond fracture"?', '["It is pathognomonic (highly specific) for an ACL tear", "It indicates an MCL injury", "It is a normal finding", "It means the hip is also broken"]', 0, 'A Segond fracture is an avulsion of the anterolateral ligament and is almost always associated with an ACL rupture.'),
    (v_case_id, 'Why are female athletes at higher risk for ACL tears than males?', '["Hormonal factors", "Anatomical differences (e.g., narrower intercondylar notch, increased Q-angle)", "Neuromuscular landing patterns", "All of the above"]', 3, 'The increased risk in females is multifactorial.');

    ---------------------------------------------------------------------------
    -- CASE 12: PCL Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dashboard Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dashboard Injury', 'A 35-year-old male was involved in a motor vehicle accident where his knee hit the dashboard.

Vitals: Stable.
Physical Examination: The tibia appears to sit posterior to the femur when the knee is flexed to 90 degrees (Positive Sag Sign). Increased posterior translation with a soft endpoint (Posterior Drawer).
Laboratory Results: MRI shows a Grade II PCL tear.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old with "Sag Sign" and positive Posterior Drawer after a dashboard injury.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common mechanism for an isolated PCL injury?', '["Twisting with foot planted", "Direct anterior blow to the tibia with the knee flexed (e.g., dashboard injury)", "Hyperextension", "Valgus stress"]', 1, 'This mechanism pushes the tibia posteriorly relative to the femur.'),
    (v_case_id, 'Initial management for most ISOLATED Grade I and II PCL tears is:', '["Immediate surgery", "Conservative (rehabilitation focusing on quadriceps strengthening)", "Casting in full extension", "None"]', 1, 'Unlike the ACL, the PCL has a better healing capacity and often does well with conservative management if no other ligaments are involved.'),
    (v_case_id, 'True or False: Quadriceps strengthening is more important than hamstring strengthening in PCL rehab.', '["True", "False"]', 0, 'The quadriceps acts as a "dynamic stabilizer" to prevent posterior tibial translation.');

    ---------------------------------------------------------------------------
    -- CASE 13: MCL Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Valgus Blow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Valgus Blow', 'A 28-year-old rugby player was "clipped" from the lateral side of his knee while his foot was planted.

Vitals: Stable.
Physical Examination: Pain and laxity when applying a valgus stress at 30 degrees of flexion. No laxity at 0 degrees.
Laboratory Results: MRI shows a Grade II tear of the Medial Collateral Ligament (MCL).', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old with MCL laxity under valgus stress at 30 degrees.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the MCL tested at 30 degrees of flexion rather than full extension?', '["It''s easier for the patient", "At 30 degrees, the joint capsule and ACL/PCL are relaxed, isolating the MCL", "The MCL is only tight in flexion", "None"]', 1, 'In full extension, other structures (capsule, ACL) provide secondary stability, masking an MCL injury.'),
    (v_case_id, 'What is the "Unhappy Triad" (O''Donoghue''s Triad)?', '["ACL, MCL, and Medial Meniscus tears", "ACL, LCL, and Lateral Meniscus tears", "PCL, MCL, and Patella", "None"]', 0, 'This classic injury pattern occurs with a severe valgus/rotation force (though lateral meniscus is actually more commonly injured in acute ACL tears).'),
    (v_case_id, 'Management of most isolated MCL tears (Grades I-III) is:', '["Surgical repair", "Non-operative (bracing and early ROM)", "Hanging cast", "Bed rest"]', 1, 'The MCL has a very high healing potential due to its extra-articular location and good blood supply.');

    ---------------------------------------------------------------------------
    -- CASE 14: Meniscal Tear
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Locking and Catching' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Locking and Catching', 'A 45-year-old male reports knee pain after "squatting down to fix a sink." He now feels a "clicking" sensation and occasionally his knee gets "stuck" and he has to wiggle it to straighten it.

Vitals: Stable.
Physical Examination: Joint line tenderness. Positive McMurray test (pain/click with rotation and extension).
Laboratory Results: MRI shows a "bucket-handle" tear of the medial meniscus.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with mechanical "locking" and joint line tenderness; bucket-handle tear.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanical symptoms like "locking" or "catching" are most characteristic of:', '["ACL tear", "Meniscal tear", "MCL sprain", "Patellar tendonitis"]', 1, 'A displaced meniscal fragment can physically block the range of motion of the joint.'),
    (v_case_id, 'Which part of the meniscus has the best potential for healing if repaired?', '["The inner \"white-white\" zone", "The peripheral \"red-red\" zone", "The middle \"red-white\" zone", "The horns"]', 1, 'The outer 1/3 (red-red zone) has a vascular supply; the inner 2/3 is avascular and relies on diffusion.'),
    (v_case_id, 'True or False: A "bucket-handle" tear that is causing the knee to lock is an indication for relatively urgent surgical intervention.', '["True", "False"]', 0, 'Locked knees should be addressed to prevent further articular damage and restore function.');

    ---------------------------------------------------------------------------
    -- CASE 15: Patellofemoral Pain Syndrome (PFPS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Movie Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Movie Sign', 'A 24-year-old female graduate student complains of generalized anterior knee pain. It is worse when she sits in a lecture for a long time or when she walks down stairs.

Vitals: Stable.
Physical Examination: Pain with compression of the patella against the femur. Patellar "grind" test is positive. No ligamentous laxity.
Laboratory Results: X-rays (including "Sunrise view") are normal.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old with anterior pain after prolonged sitting ("Movie Sign"); normal X-rays.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The "Movie Sign" (pain after prolonged sitting with knees flexed) is classic for:', '["Meniscal tear", "Patellofemoral Pain Syndrome", "Osteoarthritis", "ACL tear"]', 1, 'Prolonged flexion increases the pressure between the patella and the femoral trochlea.'),
    (v_case_id, 'What is the primary treatment for PFPS?', '["Surgery (Lateral release)", "Physical therapy focusing on VMO (vastus medialis obliquus) and hip abductor/external rotator strengthening", "Injections", "Total knee replacement"]', 1, 'Correcting the "tracking" of the patella through strengthening and biomechanical correction is highly effective.'),
    (v_case_id, 'Which radiographic view is best for evaluating the patellofemoral joint?', '["AP view", "Lateral view", "Sunrise (Axial) view", "Oblique view"]', 2, 'The Sunrise view shows the relationship of the patella to the trochlear groove.');

    ---------------------------------------------------------------------------
    -- CASE 16: Osgood-Schlatter Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bumpy Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bumpy Knee', 'A 13-year-old boy who plays basketball reports pain and a "hard bump" just below his kneecap.

Vitals: Stable.
Physical Examination: Tenderness and prominent bony enlargement over the tibial tuberosity. Pain is worse with resisted knee extension.
Laboratory Results: Lateral X-ray shows fragmentation and swelling of the tibial tuberosity apophysis.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 13-year-old basketball player with a tender "bump" at the tibial tuberosity.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiology of Osgood-Schlatter Disease?', '["Infection", "Traction apophysitis of the tibial tuberosity due to repetitive pull of the patellar tendon", "Malignant tumor", "Avascular necrosis"]', 1, 'Repetitive stress in active adolescents during growth spurts leads to micro-avulsions of the immature apophysis.'),
    (v_case_id, 'Management of Osgood-Schlatter includes:', '["Immediate surgery to remove the bump", "Activity modification, icing, and stretching (conservative)", "Casting the leg for 3 months", "None"]', 1, 'It is a self-limiting condition that usually resolves when the growth plate closes.'),
    (v_case_id, 'True or False: Most patients with Osgood-Schlatter require surgery as adults.', '["True", "False"]', 1, 'Surgery is rare and only for persistent, painful ossicles after skeletal maturity.');

    ---------------------------------------------------------------------------
    -- CASE 17: Patellar Dislocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Knee Capsized' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Knee Capsized', 'A 16-year-old cheerleader felt her kneecap "shift out" while she was dancing. She fell to the ground in severe pain. Her coach "straightened her leg" and the kneecap popped back in.

Vitals: Stable.
Physical Examination: Large hemarthrosis; tenderness over the medial patellofemoral ligament (MPFL). Positive Apprehension Test (patient tenses up when patella is pushed laterally).
Laboratory Results: X-rays show a small "bony flake" off the medial patella.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old with patellar dislocation and positive Apprehension Test.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which direction does the patella almost always dislocate?', '["Medially", "Laterally", "Superiorly", "Inferiorly"]', 1, 'Lateral forces (Q-angle, muscle pull) predispose to lateral dislocation.'),
    (v_case_id, 'Which ligament is the primary "tether" that prevents lateral patellar dislocation?', '["ACL", "MCL", "Medial Patellofemoral Ligament (MPFL)", "LCL"]', 2, 'The MPFL provides about 50-60% of the restraint to lateral translation.'),
    (v_case_id, 'What is a common complication of a patellar dislocation?', '["Osteochondral fracture (bone and cartilage fragment knocked off during the event)", "Nerve root injury", "Hip dislocation", "None"]', 0, 'Small fractures are common as the patella relocates; they may require surgical removal if they are large or loose.');

    ---------------------------------------------------------------------------
    -- CASE 18: IT Band Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Runner''s Lateral Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Runner''s Lateral Pain', 'A marathon runner complains of sharp pain on the OUTSIDE of his knee that starts after 3 miles of running.

Vitals: Stable.
Physical Examination: Point tenderness over the lateral femoral epicondyle. Positive Noble''s Compression Test.
Laboratory Results: Normal X-rays.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A runner with lateral knee pain and positive Noble''s test (IT Band Syndrome).', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of IT Band Syndrome?', '["A tear in the ligament", "Repetitive friction of the IT band over the lateral femoral epicondyle", "Meniscal tear", "Arthritis"]', 1, 'The band "snaps" back and forth over the bone at about 30 degrees of flexion.'),
    (v_case_id, 'Which specialized test evaluates for tightness of the Ilio-Tibial Band?', '["Lachman test", "Ober''s test", "McMurray test", "Trendelenburg test"]', 1, 'In Ober''s test, an abducted leg that stays abducted when released suggests a tight ITB.'),
    (v_case_id, 'Treatment for ITB syndrome primarily involves:', '["Surgery", "Stretching the ITB/TFL, foam rolling, and hip abductor strengthening", "Cortisone injections only", "None"]', 1, 'Conservative management is the mainstay.');

    ---------------------------------------------------------------------------
    -- CASE 19: Quadriceps Tendon Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gap Above the Cap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gap Above the Cap', 'A 62-year-old male tripped on a curb and landed on his knee. He is now unable to lift his leg off the table.

Vitals: Stable.
Physical Examination: Palpable "gap" just above the superior pole of the patella. Patient cannot perform a straight leg raise (loss of extensor mechanism).
Laboratory Results: Lateral X-ray shows "Patella Baja" (the patella is lower than normal).', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old unable to perform a straight leg raise; palpable gap above the patella.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["ACL tear", "Quadriceps Tendon Rupture", "Patellar Tendon Rupture", "Femur fracture"]', 1, 'A rupture above the patella is the quadriceps tendon. Below the patella would be the patellar tendon.'),
    (v_case_id, 'Why does a quad tendon rupture cause "Patella Baja"?', '["The patellar tendon is still pulling the patella down, but there is no opposing upward pull from the quads", "The bone is broken", "It''s an illusion", "None"]', 0, 'The resting position of the patella is determined by the balance of the two tendons.'),
    (v_case_id, 'Management of a complete rupture of the extensor mechanism in a healthy adult is:', '["Bracing in extension", "Urgent surgical repair", "Physical therapy alone", "None"]', 1, 'Without surgery, the patient will never be able to actively extend the knee or walk normally.');

    ---------------------------------------------------------------------------
    -- CASE 20: Osteochondritis Dissecans (OCD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loose Fragment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loose Fragment', 'A 15-year-old boy has vague knee pain and occasional "locking."

Vitals: Stable.
Physical Examination: Positive Wilson''s Test (pain with internal rotation during extension, relieved by external rotation).
Laboratory Results: X-ray shows a well-demarcated area of subchondral bone necrosis on the lateral aspect of the MEDIAL femoral condyle.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old with vague pain and a necrotic bone fragment on the medial femoral condyle.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common location for OCD in the knee?', '["Lateral aspect of the medial femoral condyle (L-MFC)", "Lateral femoral condyle", "Patella", "Tibial plateau"]', 0, 'The lateral aspect of the medial condyle is the classic location (70% of cases).'),
    (v_case_id, 'What determines the prognosis and management of OCD?', '["The patient''s age (skeletal maturity) and whether the fragment is \"stable\" or \"unstable\" on MRI", "The patient''s weight", "Blood type", "None"]', 0, 'Juvenile OCD (open growth plates) has a much higher rate of spontaneous healing than adult OCD.'),
    (v_case_id, 'True or False: All OCD fragments require immediate surgical removal.', '["True", "False"]', 1, 'Stable fragments in children are often treated with activity modification and bracing.');

    ---------------------------------------------------------------------------
    -- CASE 21: Baker''s Cyst (Popliteal Cyst)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Back Knee Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Back Knee Lump', 'A 58-year-old female with known osteoarthritis of the knee presents with a "fullness" and swelling in the back of her knee.

Vitals: Stable.
Physical Examination: Palpable, non-pulsatile mass in the popliteal fossa. It is more prominent when the knee is fully extended.
Laboratory Results: Ultrasound confirms a fluid-filled cyst between the semimembranosus and medial gastrocnemius tendons.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old with a popliteal mass; ultrasound shows a fluid-filled cyst.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A Baker''s cyst in an adult is usually:', '["A primary condition", "Secondary to intra-articular pathology (e.g., meniscal tear or osteoarthritis)", "A malignant tumor", "An aneurysm"]', 1, 'In adults, these cysts are almost always caused by excessive synovial fluid production from an underlying joint problem.'),
    (v_case_id, 'What is a common complication of a Baker''s cyst that can mimic a DVT?', '["Rupture of the cyst, leading to calf pain and swelling", "Nerve compression", "Arterial occlusion", "None"]', 0, 'A ruptured cyst causes fluid to track down into the calf, resembling the clinical presentation of deep vein thrombosis.'),
    (v_case_id, 'The primary treatment for a symptomatic Baker''s cyst is:', '["Surgical excision of the cyst", "Addressing the underlying intra-articular pathology", "Antibiotics", "None"]', 1, 'If you don''t fix the "faucet" (the joint problem), the "sink" (the cyst) will just refill after excision.');

    ---------------------------------------------------------------------------
    -- CASE 22: Plica Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snapping Band' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snapping Band', 'A patient reports a "snapping" sensation on the medial side of the patella during knee motion.

Vitals: Stable.
Physical Examination: A palpable, tender band can be felt just medial to the patella. Pain is reproduced when the band is rolled over the medial femoral condyle at 30 degrees of flexion.
Laboratory Results: Normal X-rays. MRI shows a thickened medial synovial fold.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a palpable, tender band medial to the patella (Plica Syndrome).', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "plica"?', '["A torn ligament", "A remnant of a synovial septum from embryological development", "A type of fracture", "A bursa"]', 1, 'Plicae are normal embryologic remnants; they only become a "syndrome" when they become thickened and inflamed.'),
    (v_case_id, 'Which plica is most commonly symptomatic?', '["Superior", "Inferior", "Medial", "Lateral"]', 2, 'The medial plica is the most frequent cause of clinical symptoms.'),
    (v_case_id, 'Treatment of plica syndrome usually begins with:', '["Arthroscopic resection", "Conservative care (rest, NSAIDs, physical therapy)", "Total knee replacement", "None"]', 1, 'Most cases respond to conservative management.');

    ---------------------------------------------------------------------------
    -- CASE 23: Pes Anserine Bursitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medial Tibial Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medial Tibial Pain', 'A middle-aged, overweight female with knee osteoarthritis complains of pain on the inner side of her upper shin, especially when climbing stairs.

Vitals: Stable.
Physical Examination: Point tenderness over the anteromedial proximal tibia, about 2-3 cm below the joint line. No joint line tenderness.
Laboratory Results: Normal X-rays.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An overweight female with tenderness 2-3cm below the medial joint line.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which three tendons form the "Pes Anserinus"?', '["Sartorius, Gracilis, Semitendinosus", "Sartorius, Gracilis, Semimembranosus", "Rectus femoris, Vastus medialis, Sartorius", "None"]', 0, 'Remember "Say Grace before Tea" (Sartorius, Gracilis, Semitendinosus).'),
    (v_case_id, 'Where does the Pes Anserinus insert?', '["Lateral tibial plateau", "Proximal medial tibial shaft", "Gerdy''s tubercle", "Fibular head"]', 1, 'It inserts on the medial aspect of the proximal tibia.'),
    (v_case_id, 'How do you differentiate Pes Anserine Bursitis from a Medial Meniscus tear?', '["Bursitis tenderness is below the joint line; meniscus tenderness is AT the joint line", "Bursitis causes locking", "Meniscus tears have a \"bumpy\" feeling", "None"]', 0, 'Location of tenderness is key to the physical exam diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 24: Multi-ligamentous Knee Injury (Knee Dislocation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shattered Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shattered Knee', 'A high-speed motorcycle accident victim presents with a grossly unstable knee.

Vitals: Stable.
Physical Examination: The knee is unstable in multiple planes (Positive Lachman, Varus, and Valgus stress tests). Distal pulses are weak.
Laboratory Results: X-rays show no fracture. ABI (Ankle-Brachial Index) is 0.7.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A trauma victim with multi-planar knee instability and a low ABI (0.7).', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical structure to evaluate in a suspected knee dislocation?', '["The ACL", "The Popliteal Artery", "The Meniscus", "The Patella"]', 1, 'Vascular injury is common and limb-threatening. An ABI < 0.9 or abnormal pulses require urgent vascular evaluation (CT Angiogram).'),
    (v_case_id, 'Which nerve is most commonly injured in a knee dislocation, especially with LCL/posterolateral corner involvement?', '["Tibial nerve", "Common Peroneal (Fibular) nerve", "Femoral nerve", "Obturator nerve"]', 1, 'The peroneal nerve wraps around the fibular head and is easily stretched or torn.'),
    (v_case_id, 'True or False: A knee that appears normally aligned in the ED can still have been a dislocation that spontaneously reduced.', '["True", "False"]', 0, 'Up to 50% of knee dislocations are reduced by the time they reach medical attention; high clinical suspicion is vital.');

    ---------------------------------------------------------------------------
    -- CASE 25: Femoroacetabular Impingement (FAI)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Deep Groin Ache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Deep Groin Ache', 'A 28-year-old hockey player reports deep groin pain that is worse with internal rotation of the hip.

Vitals: Stable.
Physical Examination: Positive FADIR test (Flexion, Adduction, Internal Rotation reproduces the pain).
Laboratory Results: X-rays show a "pistol-grip" deformity of the femoral neck (Cam-type) and an "over-covered" acetabulum (Pincer-type).', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old with groin pain and positive FADIR test; Cam and Pincer FAI.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Cam-type" impingement?', '["Abnormal bone at the femoral head-neck junction", "Over-coverage of the femoral head by the acetabulum", "A torn labrum", "None"]', 0, 'An aspherical femoral head "bumps" into the acetabular rim during flexion.'),
    (v_case_id, 'What is "Pincer-type" impingement?', '["Abnormal bone at the femoral neck", "Over-coverage of the femoral head by the acetabular rim", "A fractured hip", "None"]', 1, 'The acetabular rim is too deep or retroverted, causing the neck to hit it prematurely.'),
    (v_case_id, 'What is the most common long-term complication of untreated symptomatic FAI?', '["Hip dislocation", "Early-onset Hip Osteoarthritis", "Nerve palsy", "Muscle atrophy"]', 1, 'Repetitive impingement damages the labrum and articular cartilage, leading to degeneration.');

    ---------------------------------------------------------------------------
    -- CASE 26: Hip Labral Tear
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clicking Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clicking Hip', 'A patient reports sharp groin pain and a "clicking" or "giving way" sensation in the hip.

Vitals: Stable.
Physical Examination: Positive FADIR and McCarthy tests.
Laboratory Results: MR Arthrogram (MRA) shows a tear of the anterior-superior acetabular labrum.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with sharp groin pain and clicking; MRA shows an acetabular labral tear.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the gold standard imaging modality for diagnosing a hip labral tear?', '["Plain X-rays", "MRI without contrast", "MR Arthrogram (MRA) with intra-articular gadolinium", "Ultrasound"]', 2, 'The dye helps highlight small tears that a standard MRI might miss.'),
    (v_case_id, 'Where is the most common location for a hip labral tear?', '["Anterior-superior", "Posterior", "Inferior", "None"]', 0, 'Most tears occur in the anterior-superior region, often associated with FAI.'),
    (v_case_id, 'Conservative management of a labral tear includes:', '["Physical therapy, activity modification, and NSAIDs", "Immediate surgery", "Complete bed rest for 1 month", "None"]', 0, 'Non-operative care is attempted first to improve hip mechanics.');

    ---------------------------------------------------------------------------
    -- CASE 27: Athletic Pubalgia (Sports Hernia)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Invisible Hernia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Invisible Hernia', 'A professional soccer player complains of chronic, severe groin pain that is worse with sprinting and twisting. There is no palpable bulge.

Vitals: Stable.
Physical Examination: Tenderness over the pubic tubercle and the external inguinal ring. Pain is reproduced with resisted sit-ups and adduction.
Laboratory Results: MRI shows "bone marrow edema" in the pubic symphysis and a tear of the rectus abdominis insertion.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A soccer player with groin pain and tenderness over the pubic tubercle; no palpable bulge.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Athletic Pubalgia"?', '["A true inguinal hernia with a bulge", "A tear or strain of the abdominal and/or adductor muscles at their insertion on the pubis", "A hip fracture", "A kidney stone"]', 1, 'It is a soft tissue injury of the core musculature, not a traditional hernia with a peritoneal sac.'),
    (v_case_id, 'Which two muscle groups are usually involved in the "imbalance" that causes this?', '["Rectus abdominis and Adductor longus", "Gluteus maximus and Quads", "Hamstrings and Calves", "None"]', 0, 'The rectus abdominis pulls the pubis upward, while the adductors pull it downward; injury occurs at this high-tension junction.'),
    (v_case_id, 'True or False: Most cases require surgery as the first-line treatment.', '["True", "False"]', 1, 'Initial treatment is almost always conservative (rest and rehab). Surgery is reserved for athletes who fail a dedicated program.');

    ---------------------------------------------------------------------------
    -- CASE 28: Hamstring Strain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sprint Pop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sprint Pop', 'A track athlete felt a sudden "snap" in the back of his thigh while sprinting. He can no longer run.

Vitals: Stable.
Physical Examination: Ecchymosis (bruising) on the posterior thigh. Tenderness over the ischial tuberosity.
Laboratory Results: MRI shows a Grade II strain at the myotendinous junction.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A sprinter with posterior thigh bruising and tenderness after a sudden "snap."', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the most common site for a hamstring strain?', '["At the origin on the ischial tuberosity", "At the myotendinous junction", "In the middle of the muscle belly", "At the insertion on the tibia"]', 1, 'The junction between muscle and tendon is the weakest point under high-tension eccentric loading.'),
    (v_case_id, 'Which phase of muscle contraction is most likely to cause a strain?', '["Concentric (shortening)", "Isometric (no change)", "Eccentric (lengthening under tension)", "None"]', 2, 'Hamstring strains typically occur during the late swing phase of sprinting when the muscle is lengthening to decelerate the leg.'),
    (v_case_id, 'A complete avulsion of all three hamstring tendons from the ischium in a young athlete usually requires:', '["Surgical repair", "A cast", "Physical therapy alone", "None"]', 0, 'Complete bony or tendon avulsions often require surgical reattachment to restore full power.');

    ---------------------------------------------------------------------------
    -- CASE 29: Snapping Hip Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Audible Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Audible Hip', 'A dancer reports an audible and palpable "clunk" on the OUTSIDE of her hip when she moves her leg from flexion to extension. It is usually painless but annoying.

Vitals: Stable.
Physical Examination: A snap is felt over the greater trochanter as the hip is moved.
Laboratory Results: Normal X-rays.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A dancer with an audible "clunk" over the greater trochanter (Snapping Hip).', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is "snapping" in External Snapping Hip Syndrome?', '["The psoas tendon", "The Ilio-Tibial (IT) Band or Gluteus Maximus tendon sliding over the Greater Trochanter", "The labrum", "The ligamentum teres"]', 1, 'This is the most common type of snapping hip.'),
    (v_case_id, 'What structure causes Internal Snapping Hip Syndrome?', '["The IT band", "The Iliopsoas tendon sliding over the Iliopectineal eminence or femoral head", "The meniscus", "None"]', 1, 'This is felt deep in the groin, whereas external snapping is felt on the side.'),
    (v_case_id, 'Management of painless snapping hip is:', '["Surgery", "Reassurance, stretching, and activity modification", "Bracing", "None"]', 1, 'If it doesn''t hurt, it usually doesn''t need treatment.');

    ---------------------------------------------------------------------------
    -- CASE 30: Meralgia Paresthetica
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Numb Outer Thigh' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Numb Outer Thigh', 'A 45-year-old male construction worker who wears a heavy tool belt complains of numbness and burning on the outer aspect of his right thigh.

Vitals: Stable.
Physical Examination: Sensation is decreased on the lateral thigh. Motor strength of the quadriceps and hip flexors is completely normal. Negative SLR.
Laboratory Results: Normal X-rays.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A construction worker with lateral thigh numbness; normal motor strength.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What nerve is involved in Meralgia Paresthetica?', '["Femoral nerve", "Lateral Femoral Cutaneous Nerve (LFCN)", "Obturator nerve", "Sciatic nerve"]', 1, 'The LFCN is a purely sensory nerve that can be compressed as it passes under the inguinal ligament.'),
    (v_case_id, 'Where is the typical site of compression for the LFCN?', '["Under the Inguinal Ligament, near the ASIS", "At the spinal cord", "In the sciatic notch", "In the calf"]', 0, 'Heavy belts, tight clothing, or obesity are common contributing factors.'),
    (v_case_id, 'Why is motor strength normal in this condition?', '["The patient is faking it", "The LFCN has no motor fibers", "It''s a very mild compression", "None"]', 1, 'The LFCN provides sensation only; if weakness is present, the diagnosis is likely a femoral neuropathy or L2-L3 radiculopathy.');

    ---------------------------------------------------------------------------
    -- CASE 31: Lateral Ankle Sprain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Inversion Twist' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Inversion Twist', 'A 21-year-old basketball player "rolled" her ankle while landing from a jump.

Vitals: Stable.
Physical Examination: Swelling and ecchymosis over the lateral ankle. Tenderness over the Anterior Talofibular Ligament (ATFL). Positive Anterior Drawer test of the ankle.
Laboratory Results: X-rays show no fracture (Ottawa Ankle Rules negative for imaging).', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 21-year-old with lateral ankle swelling and positive Anterior Drawer; ATFL injury.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which ligament is the first and most commonly injured in a lateral ankle sprain?', '["Anterior Talofibular Ligament (ATFL)", "Calcaneofibular Ligament (CFL)", "Posterior Talofibular Ligament (PTFL)", "Deltoid ligament"]', 0, 'The ATFL is the weakest of the lateral ligaments and the first to tear during an inversion injury.'),
    (v_case_id, 'What does a positive "Anterior Drawer" test of the ankle indicate?', '["ACL tear", "ATFL insufficiency", "Deltoid ligament tear", "High ankle sprain"]', 1, 'It assesses the stability of the talus within the mortise, primarily restrained by the ATFL.'),
    (v_case_id, 'According to the Ottawa Ankle Rules, an X-ray is indicated if there is bone tenderness at:', '["The posterior edge or tip of the lateral or medial malleolus", "The base of the 5th metatarsal", "The navicular bone", "All of the above"]', 3, 'These rules help avoid unnecessary imaging in stable, low-risk ankle sprains.');

    ---------------------------------------------------------------------------
    -- CASE 32: High Ankle Sprain (Syndesmosis Injury)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Squeeze Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Squeeze Pain', 'A football player reports ankle pain after his foot was caught and his leg was externally rotated. Pain is felt higher than a typical sprain.

Vitals: Stable.
Physical Examination: Pain is reproduced by squeezing the tibia and fibula together at mid-calf (Positive Squeeze Test). Pain with passive external rotation of the foot.
Laboratory Results: X-rays show widening of the "tibiofibular clear space" (syndesmotic diastasis).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A football player with positive Squeeze and External Rotation tests; syndesmotic injury.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "High Ankle Sprain"?', '["A tear of the ATFL", "An injury to the distal tibiofibular syndesmosis", "A proximal fibula fracture", "None"]', 1, 'It involves the ligaments connecting the tibia and fibula above the ankle joint.'),
    (v_case_id, 'Which mechanism of injury is classic for a syndesmotic sprain?', '["Inversion", "External rotation and eversion of the foot", "Plantarflexion", "None"]', 1, 'External rotation forces the talus to act as a wedge, prying the tibia and fibula apart.'),
    (v_case_id, 'True or False: High ankle sprains typically take significantly longer to heal than lateral ankle sprains.', '["True", "False"]', 0, 'Because the syndesmosis is subjected to high stress during every step, recovery is prolonged.');

    ---------------------------------------------------------------------------
    -- CASE 33: Achilles Tendon Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gunshot Sensation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gunshot Sensation', 'A 42-year-old weekend warrior felt a "pop" like someone kicked him or shot him in the back of the leg while playing tennis.

Vitals: Stable.
Physical Examination: Palpable gap in the Achilles tendon. Positive Thompson Test (no plantarflexion when the calf is squeezed).
Laboratory Results: Ultrasound confirms a complete rupture 4 cm proximal to the calcaneal insertion.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old with a "pop," palpable gap, and positive Thompson test; Achilles rupture.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a positive Thompson test indicate?', '["Intact Achilles tendon", "Complete rupture of the Achilles tendon", "Plantaris rupture", "Calf strain"]', 1, 'Failure of the foot to plantarflex when the gastrocnemius is squeezed proves the tendon is not continuous.'),
    (v_case_id, 'Where is the most common site of Achilles rupture?', '["At the calcaneal insertion", "The \"watershed\" area (2-6 cm proximal to the insertion)", "At the musculotendinous junction", "None"]', 1, 'This region has relatively poor blood supply, predisposing it to degenerative changes and rupture.'),
    (v_case_id, 'Which class of antibiotics is associated with an increased risk of Achilles tendon rupture?', '["Penicillins", "Fluoroquinolones (e.g., Ciprofloxacin)", "Macrolides", "Cephalosporins"]', 1, 'Fluoroquinolones can cause tendon toxicity.');

    ---------------------------------------------------------------------------
    -- CASE 34: Achilles Tendinopathy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Heel Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Heel Pain', 'A runner complains of morning stiffness and pain in the back of the heel that improves slightly with activity but worsens after long runs.

Vitals: Stable.
Physical Examination: Tenderness and nodular thickening of the Achilles tendon 3 cm above the heel.
Laboratory Results: X-rays show a small "Haglund''s deformity" (bony bump on the posterior calcaneus).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A runner with chronic Achilles tenderness and nodular thickening; Haglund''s deformity.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most effective rehabilitation strategy for Achilles tendinopathy?', '["Complete rest and immobilization", "Eccentric loading exercises (e.g., heel drops)", "Concentric exercises only", "Immediate steroid injection"]', 1, 'Eccentric exercises help remodel the tendon and are the gold standard for non-insertional tendinopathy.'),
    (v_case_id, 'Why are steroid injections into the Achilles tendon generally avoided?', '["They are too painful", "Risk of tendon rupture", "They don''t work", "None"]', 1, 'Steroids can weaken the tendon structure and lead to catastrophic rupture.'),
    (v_case_id, 'Insertional tendinopathy occurs right at the bone and is often associated with:', '["A Haglund''s deformity", "A retrocalcaneal bursa", "Calcaneal bone spurs", "All of the above"]', 3, 'These are common findings in "insertional" Achilles issues.');

    ---------------------------------------------------------------------------
    -- CASE 35: Plantar Fasciitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'First Step Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'First Step Pain', 'A 45-year-old nurse complains of sharp pain in her heel that is most severe when she first gets out of bed in the morning.

Vitals: Stable.
Physical Examination: Maximal tenderness over the medial tubercle of the calcaneus. Pain increases with passive toe extension (Windlass mechanism).
Laboratory Results: X-ray shows a small subcalcaneal bone spur.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with morning heel pain; tenderness over the medial calcaneal tubercle.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical feature of Plantar Fasciitis?', '["Pain that is worse at the end of the day", "Pain that is most severe with the first few steps in the morning (\"start-up\" pain)", "Numbness in the toes", "Swelling of the ankle"]', 1, 'The fascia tightens overnight; the first steps cause micro-tearing and pain.'),
    (v_case_id, 'True or False: The presence of a "heel spur" on X-ray is the cause of the pain and always requires surgical removal.', '["True", "False"]', 1, 'Heel spurs are common and often asymptomatic; the pain is due to inflammation/degeneration of the fascia itself, not the spur.'),
    (v_case_id, 'Initial management of Plantar Fasciitis includes:', '["Achilles and plantar fascia stretching, night splints, and orthotics", "Immediate surgery", "Complete non-weight bearing for 6 weeks", "None"]', 0, 'Conservative management is successful in >90% of cases.');

    ---------------------------------------------------------------------------
    -- CASE 36: Medial Tibial Stress Syndrome (Shin Splints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shin Ache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shin Ache', 'A 19-year-old military recruit complains of diffuse pain along the inner part of his lower legs after a week of intensive marching.

Vitals: Stable.
Physical Examination: Diffuse tenderness along the posteromedial border of the distal 1/3 of the tibia. No focal bone tenderness.
Laboratory Results: X-rays are normal.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A military recruit with diffuse tenderness along the posteromedial tibia.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What differentiates MTSS ("Shin Splints") from a Tibial Stress Fracture?', '["MTSS has diffuse tenderness; stress fractures have focal \"point\" tenderness", "MTSS only happens in the morning", "MTSS causes numbness", "None"]', 0, 'Diffuse vs. focal tenderness is a key clinical differentiator.'),
    (v_case_id, 'Which muscle is most commonly implicated in the traction of the periosteum in MTSS?', '["Tibialis Anterior", "Tibialis Posterior or Soleus", "Gastrocnemius", "Peroneus Longus"]', 1, 'The deep posterior compartment muscles pull on the medial tibial border.'),
    (v_case_id, 'Management of MTSS includes:', '["Rest, ice, better footwear, and gradual return to activity", "Surgery", "Casting", "None"]', 0, 'Training modification is essential to prevent progression to a stress fracture.');

    ---------------------------------------------------------------------------
    -- CASE 37: Stress Fracture (Navicular)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Midfoot Ache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Midfoot Ache', 'A high-level track athlete complains of vague midfoot pain that is worse with activity.

Vitals: Stable.
Physical Examination: Point tenderness over the "N-spot" (the dorsal-central aspect of the navicular bone).
Laboratory Results: Initial X-rays are normal. MRI shows a linear signal abnormality in the navicular bone.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An athlete with point tenderness over the navicular "N-spot"; MRI shows a stress fracture.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a Navicular Stress Fracture considered a "high-risk" stress fracture?', '["Because of the poor blood supply to the central portion of the bone, which can lead to non-union or AVN", "Because it is a large bone", "Because it is in the toe", "None"]', 0, 'Similar to the scaphoid in the wrist, the navicular has a precarious blood supply.'),
    (v_case_id, 'Initial management of a non-displaced navicular stress fracture usually requires:', '["6 weeks of non-weight bearing in a short leg cast", "Continuing to run through the pain", "Ankle sprain exercises", "None"]', 0, 'Conservative management with "weight-bearing as tolerated" has a high failure rate; strict NWB is the standard.'),
    (v_case_id, 'True or False: Most stress fractures are visible on plain X-rays within the first 24 hours of symptoms.', '["True", "False"]', 1, 'Stress fractures often take 2-4 weeks to show up on X-ray (as callus or a fracture line). MRI or Bone Scan is needed for early diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 38: Turf Toe
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Big Toe Sprain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Big Toe Sprain', 'A football player playing on artificial turf sustained a forced hyperextension injury to his big toe.

Vitals: Stable.
Physical Examination: Swelling and tenderness on the plantar aspect of the 1st Metatarsophalangeal (MTP) joint. Pain with passive extension of the toe.
Laboratory Results: X-rays show no fracture.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A football player with a hyperextension injury of the 1st MTP joint (Turf Toe).', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is primarily injured in "Turf Toe"?', '["The plantar plate of the 1st MTP joint", "The Achilles tendon", "The lateral ligaments", "None"]', 0, 'Turf toe is a sprain/tear of the plantar capsuloligamentous complex.'),
    (v_case_id, 'Why is "Turf Toe" more common on artificial turf?', '["The surface is harder and provides more friction/traction, allowing the toe to \"stick\" while the body moves forward", "The turf is toxic", "It is just a coincidence", "None"]', 0, 'Increased friction leads to the hyperextension mechanism.'),
    (v_case_id, 'Management of a Grade I turf toe includes:', '["Taping (to prevent extension), stiff-soled shoes, and rest", "Total amputation", "A cast for 6 months", "None"]', 0, 'Protecting the joint from further extension is the goal.');

    ---------------------------------------------------------------------------
    -- CASE 39: Peroneal Tendonitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lateral Ankle Tendon Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lateral Ankle Tendon Pain', 'A patient reports pain on the outside of the ankle, just behind the lateral malleolus.

Vitals: Stable.
Physical Examination: Tenderness and swelling along the course of the peroneal tendons. Pain with resisted eversion of the foot.
Laboratory Results: MRI shows fluid around the peroneal tendons.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with tenderness behind the lateral malleolus and pain with resisted eversion.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which two muscles make up the peroneal group in the lateral compartment?', '["Peroneus Longus and Brevis", "Peroneus Tertius and Anterior", "Tibialis and Soleus", "None"]', 0, 'They are the primary everters of the foot.'),
    (v_case_id, 'Where does the Peroneus Brevis tendon insert?', '["Base of the 5th metatarsal", "Under the foot to the 1st metatarsal", "Navicular", "None"]', 0, 'The Brevis is the one most commonly associated with avulsion fractures of the 5th metatarsal base.'),
    (v_case_id, 'A patient who feels a "snap" and has a tendon that visibly "flicks" over the lateral malleolus has:', '["Achilles rupture", "Peroneal tendon subluxation", "Ankle sprain", "None"]', 1, 'This is usually due to a tear of the superior peroneal retinaculum.');

    ---------------------------------------------------------------------------
    -- CASE 40: Morton''s Neuroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Walking on a Marble' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Walking on a Marble', 'A 50-year-old female complains of burning pain in the ball of her foot and a sensation like she is "walking on a marble."

Vitals: Stable.
Physical Examination: Tenderness between the 3rd and 4th metatarsal heads. Squeezing the metatarsals together produces a painful "click" (Mulder''s Sign).
Laboratory Results: Normal X-rays.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old with pain between 3rd/4th metatarsals; positive Mulder''s click.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Morton''s Neuroma?', '["A malignant tumor", "A perineural fibrosis of a common digital nerve", "A fracture", "A cyst"]', 1, 'It is a reactive thickening of the nerve, not a true neoplasm.'),
    (v_case_id, 'What is the most common location for Morton''s Neuroma?', '["Between the 1st and 2nd metatarsals", "Between the 3rd and 4th metatarsals", "In the heel", "None"]', 1, 'The 3rd webspace is the classic site.'),
    (v_case_id, 'Initial treatment of Morton''s Neuroma includes:', '["Wide-toe box shoes and metatarsal pads", "Amputation", "Total foot replacement", "None"]', 0, 'Reducing the pressure on the metatarsal heads is the first step.');

    ---------------------------------------------------------------------------
    -- CASE 41: Lateral Epicondylitis (Tennis Elbow)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tennis Elbow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tennis Elbow', 'A 42-year-old male complains of lateral elbow pain after spending the weekend power-washing his driveway.

Vitals: Stable.
Physical Examination: Tenderness directly over the lateral epicondyle. Pain is reproduced with resisted wrist extension and resisted extension of the middle finger (Maudsley''s test).
Laboratory Results: Normal X-rays.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old with lateral epicondyle tenderness and pain with resisted wrist extension.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which muscle is most commonly involved in lateral epicondylitis?', '["Extensor Carpi Radialis Brevis (ECRB)", "Extensor Carpi Ulnaris", "Brachioradialis", "Pronator Teres"]', 0, 'The ECRB origin on the lateral epicondyle is the site of micro-tearing and angiofibroblastic hyperplasia.'),
    (v_case_id, 'What is the underlying pathology in chronic "tendonitis" like this?', '["Acute inflammation with neutrophils", "Angiofibroblastic hyperplasia (tendinosis/degeneration) without significant inflammation", "Infection", "Autoimmune attack"]', 1, 'It is a degenerative process (tendinosis) rather than a purely inflammatory one.'),
    (v_case_id, 'Treatment of lateral epicondylitis includes:', '["Counterforce bracing, stretching, eccentric exercises, and activity modification", "Immediate surgery", "Total elbow replacement", "None"]', 0, 'Conservative management is effective in most cases.');

    ---------------------------------------------------------------------------
    -- CASE 42: Medial Epicondylitis (Golfer''s Elbow)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Golfer''s Elbow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Golfer''s Elbow', 'A golfer complains of pain on the inner side of his elbow.

Vitals: Stable.
Physical Examination: Tenderness over the medial epicondyle. Pain is reproduced with resisted wrist flexion and resisted forearm pronation.
Laboratory Results: Normal X-rays.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A golfer with medial epicondyle tenderness and pain with resisted wrist flexion.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which muscle group originates at the medial epicondyle?', '["The common extensor-supinator group", "The common flexor-pronator group", "The triceps", "None"]', 1, 'The Pronator Teres and Flexor Carpi Radialis are frequently involved.'),
    (v_case_id, 'Which nerve can be irritated in association with medial epicondylitis?', '["Radial nerve", "Ulnar nerve", "Median nerve", "Axillary nerve"]', 1, 'The ulnar nerve passes through the cubital tunnel just posterior to the medial epicondyle.'),
    (v_case_id, 'True or False: Medial epicondylitis is less common than lateral epicondylitis.', '["True", "False"]', 0, 'Lateral epicondylitis is much more frequent in the general population.');

    ---------------------------------------------------------------------------
    -- CASE 43: Ulnar Collateral Ligament (UCL) Tear
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tommy John Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tommy John Injury', 'A high school pitcher felt a "pop" in his medial elbow during a fastball.

Vitals: Stable.
Physical Examination: Tenderness over the ulnar collateral ligament. Positive Valgus Stress test of the elbow. Positive "Moving Valgus Stress Test."
Laboratory Results: MR Arthrogram shows a tear of the anterior band of the UCL.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pitcher with medial elbow pop and positive Valgus Stress Test; UCL tear.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of the UCL is the primary stabilizer against valgus stress?', '["Anterior band", "Posterior band", "Transverse band", "None"]', 0, 'The anterior band of the UCL is the most important for elbow stability in throwing.'),
    (v_case_id, 'Surgical reconstruction of the UCL is commonly known as:', '["The Latarjet procedure", "Tommy John surgery", "The Bankart repair", "The Whipple procedure"]', 1, 'Named after the first major league pitcher to successfully return after the surgery.'),
    (v_case_id, 'What is often used as a graft for UCL reconstruction?', '["The palmaris longus tendon", "The Achilles tendon", "The ACL", "None"]', 0, 'The palmaris longus (if present) is a common autograft choice.');

    ---------------------------------------------------------------------------
    -- CASE 44: De Quervain''s Tenosynovitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The New Mother''s Wrist' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The New Mother''s Wrist', 'A 30-year-old female with a 3-month-old baby reports pain on the thumb side of her wrist.

Vitals: Stable.
Physical Examination: Tenderness over the radial styloid. Positive Finkelstein''s test (pain when the thumb is tucked into the fist and the wrist is deviated ulnarly).
Laboratory Results: Normal X-rays.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A new mother with radial wrist pain and positive Finkelstein''s test.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which two tendons are involved in De Quervain''s?', '["Abductor Pollicis Longus (APL) and Extensor Pollicis Brevis (EPB)", "Extensor Pollicis Longus (EPL) and EPB", "APL and EPL", "None"]', 0, 'These two tendons occupy the first dorsal compartment of the wrist.'),
    (v_case_id, 'What is the most common demographic for De Quervain''s?', '["New mothers (due to picking up the baby) and clerical workers", "Football players", "Marathon runners", "None"]', 0, 'Repetitive thumb abduction and ulnar deviation are the primary triggers.'),
    (v_case_id, 'Treatment of De Quervain''s includes:', '["Thumb spica splinting, NSAIDs, and corticosteroid injection", "Immediate surgery", "Total wrist fusion", "None"]', 0, 'Corticosteroid injections into the first compartment are highly effective (>80% success).');

    ---------------------------------------------------------------------------
    -- CASE 45: Gamekeeper''s / Skier''s Thumb
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thumb Sprain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thumb Sprain', 'A skier fell and his thumb was pulled away from his hand by the ski pole strap.

Vitals: Stable.
Physical Examination: Tenderness and swelling over the ulnar aspect of the 1st Metacarpophalangeal (MCP) joint. Weakness in "pinching." Laxity with valgus stress of the thumb MCP.
Laboratory Results: X-ray shows no fracture.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A skier with ulnar thumb MCP laxity after a fall.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What ligament is injured in Gamekeeper''s/Skier''s thumb?', '["Ulnar Collateral Ligament (UCL) of the thumb MCP joint", "Radial Collateral Ligament", "APL", "None"]', 0, 'The UCL provides stability against valgus (abduction) forces.'),
    (v_case_id, 'What is a "Stener Lesion"?', '["A fracture", "Interposition of the adductor pollicis aponeurosis between the torn UCL and its insertion", "A type of tumor", "None"]', 1, 'A Stener lesion prevents the ligament from healing and is an absolute indication for surgery.'),
    (v_case_id, 'Initial treatment for a stable, partial UCL tear of the thumb is:', '["Thumb spica cast or splint for 4-6 weeks", "Surgery", "Amputation", "None"]', 0, 'Stable tears heal well with immobilization.');

    ---------------------------------------------------------------------------
    -- CASE 46: Mallet Finger
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dropped Tip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dropped Tip', 'An outfielder was hit on the tip of his extended finger by a baseball. He can no longer straighten the end of his finger.

Vitals: Stable.
Physical Examination: The Distal Interphalangeal (DIP) joint is flexed at rest. The patient can flex the DIP but cannot actively extend it.
Laboratory Results: X-ray shows a small avulsion fracture of the dorsal base of the distal phalanx.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An athlete with loss of active DIP extension after a fingertip injury.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is damaged in Mallet Finger?', '["The flexor digitorum profundus (FDP)", "The terminal extensor tendon", "The collateral ligament", "None"]', 1, 'The injury can be a purely tendon tear or an avulsion fracture.'),
    (v_case_id, 'What is the standard treatment for a Mallet Finger?', '["Immediate surgery", "Continuous splinting of the DIP joint in full extension for 6-8 weeks", "Splinting only at night", "None"]', 1, 'Strict, continuous splinting is essential. If the splint is removed and the finger drops even once, the "clock" restarts.'),
    (v_case_id, 'True or False: If left untreated, a mallet finger can lead to a Swan-neck deformity.', '["True", "False"]', 0, 'The loss of the extensor pull at the DIP leads to an imbalance that hyper-extends the PIP joint.');

    ---------------------------------------------------------------------------
    -- CASE 47: Jersey Finger
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tackler''s Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tackler''s Injury', 'A football player was trying to tackle an opponent and caught his ring finger on the opponent''s jersey. He can no longer flex the end of his finger.

Vitals: Stable.
Physical Examination: The patient is unable to actively flex the DIP joint of the ring finger.
Laboratory Results: X-ray shows no fracture. Ultrasound shows the FDP tendon retracted into the palm.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A football player unable to flex the DIP joint after grabbing a jersey.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is damaged in Jersey Finger?', '["Terminal extensor tendon", "Flexor Digitorum Profundus (FDP) tendon", "Flexor Digitorum Superficialis (FDS) tendon", "None"]', 1, 'The FDP is avulsed from the base of the distal phalanx as the finger is forced into extension while actively flexing.'),
    (v_case_id, 'Which finger is most commonly involved in Jersey Finger?', '["Thumb", "Index", "Middle", "Ring"]', 3, 'The ring finger is the most commonly injured (75% of cases).'),
    (v_case_id, 'Unlike Mallet Finger, Jersey Finger usually requires:', '["Splinting alone", "Early surgical repair (within 7-10 days)", "No treatment", "None"]', 1, 'Because the tendon often retracts and loses its blood supply (vincula), surgical reattachment is necessary.');

    ---------------------------------------------------------------------------
    -- CASE 48: Female Athlete Triad
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thin Runner' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thin Runner', 'An 18-year-old female cross-country runner presents with a repeat stress fracture. She also mentions that she hasn''t had a menstrual period in 6 months.

Vitals: BMI 17.0.
Physical Examination: Thin, athletic build. Tenderness over the 2nd metatarsal.
Laboratory Results: DEXA scan shows low bone mineral density (Z-score < -2.0).', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 18-year-old runner with repeat stress fractures and amenorrhea.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three components of the traditional Female Athlete Triad?', '["Low energy availability (with or without disordered eating), Menstrual dysfunction, and Low bone mineral density", "Obesity, Diabetes, Hypertension", "ACL tear, Meniscal tear, MCL tear", "None"]', 0, 'This syndrome is common in sports where thinness is emphasized.'),
    (v_case_id, 'The current, broader term for this condition that includes males is:', '["Relative Energy Deficiency in Sport (RED-S)", "Metabolic Syndrome", "Anorexia Athletica", "None"]', 0, 'RED-S recognizes the physiological effects of energy deficiency beyond just bone and menses.'),
    (v_case_id, 'What is the most critical intervention for this patient?', '["Bone density medication (bisphosphonates)", "Increasing caloric intake to match energy expenditure", "Hormone replacement therapy", "None"]', 1, 'Correcting the energy deficit is the foundational treatment.');

    ---------------------------------------------------------------------------
    -- CASE 49: Sports Concussion
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Head Collision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Head Collision', 'A soccer player was "dazed" after colliding heads with another player. He did not lose consciousness but feels nauseated and "foggy."

Vitals: Stable.
Physical Examination: Glasgow Coma Scale (GCS) is 15. Standardized Assessment of Concussion (SAC) score is low.
Laboratory Results: CT scan of the brain is normal.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A soccer player who is "foggy" after head contact; normal CT scan.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a concussion (Mild Traumatic Brain Injury)?', '["A structural brain injury visible on CT", "A functional disturbance of brain activity caused by direct or indirect forces to the head", "Always involves loss of consciousness", "None"]', 1, 'Most concussions do not involve a loss of consciousness and have normal imaging.'),
    (v_case_id, 'If a player is suspected of having a concussion during a game, what is the next step?', '["Return to play after 15 minutes of rest", "Immediate removal from play; no return to play on the same day", "Continue playing if they feel okay", "None"]', 1, 'The rule is "When in doubt, sit them out."'),
    (v_case_id, 'What is "Second Impact Syndrome"?', '["A second concussion weeks later", "Rapid, often fatal brain swelling that occurs when a second head injury is sustained before a first concussion has resolved", "A neck injury", "None"]', 1, 'This is a rare but catastrophic complication, primarily seen in young athletes.');

    ---------------------------------------------------------------------------
    -- CASE 50: Exertional Heat Stroke
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Overheated Lineman' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Overheated Lineman', 'A 280-lb football lineman collapses during practice in 95-degree heat. He is confused and combative.

Vitals: Temp 105.5 F (rectal), HR 140, BP 90/60.
Physical Examination: Altered mental status. Skin may be hot and dry OR sweaty.
Laboratory Results: Elevated creatinine and liver enzymes.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A football lineman collapses in heat; Temp 105.5 F, confused.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What differentiates Heat Stroke from Heat Exhaustion?', '["Core temperature > 104 F (40 C) AND central nervous system dysfunction (confusion, coma, seizures)", "The amount of sweating", "Muscle cramps", "None"]', 0, 'CNS dysfunction is the hallmark of heat stroke, which is a medical emergency.'),
    (v_case_id, 'What is the immediate, life-saving treatment for exertional heat stroke?', '["Rapid cooling, preferably via cold-water immersion (\"cool first, transport second\")", "Oral hydration", "Antibiotics", "Aspirin"]', 0, 'Aggressive cooling to lower core temperature is the priority.'),
    (v_case_id, 'True or False: Exertional heat stroke can occur even if the athlete is still sweating.', '["True", "False"]', 0, 'Unlike classic heat stroke in the elderly, young athletes with exertional heat stroke are often still sweating profusely.');

END $$;

COMMIT;
