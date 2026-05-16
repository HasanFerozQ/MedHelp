-- Orthopedics: Part 4 (Questions 151-200)
-- Topic: Sports medicine & soft tissue injuries (Knee: Advanced Ligaments & Soft Tissue)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- KNEE: ACL (ADVANCED)
    (v_topic_id, 'Which bundle of the ACL is the primary restraint to "Anterior" translation in FLEXION?', '["Anteromedial (AM) bundle", "Posterolateral (PL) bundle", "Intermediate bundle", "None"]', 0, 'The AM bundle is tight in flexion, while the PL bundle is tight in extension.'),
    (v_topic_id, 'Which bundle of the ACL provides the most stability against "Rotatory" (Pivot shift) stress?', '["Anteromedial (AM) bundle", "Posterolateral (PL) bundle", "Both equally", "None"]', 1, 'The PL bundle is more important for rotational stability.'),
    (v_topic_id, 'A "Segond Fracture" is pathognomonic for which injury?', '["ACL rupture", "PCL rupture", "MCL tear", "Meniscal tear"]', 0, 'It is an avulsion of the lateral capsular ligament (ALL) from the tibia.'),

    -- KNEE: PCL (ADVANCED)
    (v_topic_id, 'The PCL is the primary restraint to which tibial motion?', '["Anterior translation", "Posterior translation", "Valgus stress", "Varus stress"]', 1, 'It prevents the tibia from sliding backward relative to the femur.'),
    (v_topic_id, 'Which PCL bundle is the largest and strongest?', '["Anterolateral (AL) bundle", "Posteromedial (PM) bundle", "Both are equal", "None"]', 0, 'The AL bundle is the primary stabilizer.'),
    (v_topic_id, 'Which PCL bundle is tight in "Extension"?', '["Anterolateral (AL) bundle", "Posteromedial (PM) bundle", "Both", "None"]', 1, 'The PM bundle is tight in extension; the AL bundle is tight in flexion.'),

    -- KNEE: PLC (POSTEROLATERAL CORNER)
    (v_topic_id, 'Which three structures are the most important components of the "Posterolateral Corner" (PLC)?', '["LCL, Popliteus tendon, and Popliteofemoral ligament", "ACL, MCL, and Meniscus", "PCL, IT band, and Biceps", "None"]', 0, 'These three provide primary restraint to varus and external rotation.'),
    (v_topic_id, 'The "Dial Test" assesses for PLC and PCL injuries. If there is increased external rotation at 30 degrees of flexion but NOT at 90 degrees, what is the diagnosis?', '["Isolated PLC injury", "Isolated PCL injury", "Combined PLC and PCL injury", "ACL tear"]', 0, 'Increased rotation at 30 degrees only suggests PLC. If increased at both 30 and 90, it suggests a combined PLC/PCL injury.'),
    (v_topic_id, 'Which nerve is most at risk in a PLC injury or during surgical repair?', '["Peroneal (Common Fibular) nerve", "Tibial nerve", "Saphenous nerve", "Femoral nerve"]', 0, 'The peroneal nerve wraps around the fibular head, very close to the PLC structures.'),

    -- KNEE: MENISCUS (ADVANCED)
    (v_topic_id, 'Which meniscus is more "C-shaped" and less mobile?', '["Medial meniscus", "Lateral meniscus", "Both are the same", "None"]', 0, 'The medial meniscus is firmly attached to the capsule/MCL, making it more prone to injury than the mobile, O-shaped lateral meniscus.'),
    (v_topic_id, 'A "Bucket Handle" meniscal tear is a type of:', '["Radial tear", "Vertical longitudinal tear", "Horizontal cleavage tear", "Complex tear"]', 1, 'The inner fragment can flip into the notch, causing joint locking.'),
    (v_topic_id, 'The "Red-Red Zone" of the meniscus refers to:', '["The central avascular zone", "The peripheral vascularized zone", "The meniscus-bone junction", "None"]', 1, 'Tears in this zone have the highest potential for successful repair due to blood supply.'),
    (v_topic_id, 'What is a "Meniscal Root Tear"?', '["A tear at the mid-body", "An avulsion or tear at the bony attachment of the meniscus horns", "A small flap tear", "None"]', 1, 'Root tears (especially posterior medial) lead to rapid joint degeneration, equivalent to a total meniscectomy.'),

    -- KNEE: PATELLOFEMORAL (ADVANCED)
    (v_topic_id, 'Which structure is the "Primary" stabilizer against lateral patellar dislocation?', '["Medial Patellofemoral Ligament (MPFL)", "Medial collateral ligament", "Quadriceps tendon", "IT band"]', 0, 'The MPFL provides ~50-60% of the restraint to lateral translation in early flexion.'),
    (v_topic_id, 'The "J-Sign" in the knee refers to:', '["A type of meniscus tear", "Lateral subluxation of the patella as the knee reaches full extension", "A fracture pattern", "None"]', 1, 'It indicates patellofemoral maltracking.'),
    (v_topic_id, 'What is the "TT-TG Distance" used to evaluate?', '["ACL length", "Patellar malalignment (distance between the Tibial Tubercle and Trochlear Groove)", "Meniscal width", "None"]', 1, 'A distance >20mm is strongly associated with patellar instability.'),

    -- KNEE: SOFT TISSUE / TENDONS
    (v_topic_id, '"Jumper''s Knee" is technically known as:', '["Osgood-Schlatter", "Patellar tendinopathy", "ACL tear", "IT band syndrome"]', 1, 'It involves degeneration (tendinosis) at the inferior pole of the patella.'),
    (v_topic_id, 'Which part of the patellar tendon is typically affected in Jumper''s Knee?', '["The deep/posterior fibers at the proximal attachment", "The superficial/anterior fibers", "The distal attachment on the tibia", "None"]', 0, 'The proximal posterior fibers experience the highest strain.'),
    (v_topic_id, 'What is "Sinding-Larsen-Johansson Syndrome"?', '["A hip disease", "Traction apophysitis of the inferior pole of the patella in adolescents", "A type of arthritis", "None"]', 1, 'It is the proximal equivalent of Osgood-Schlatter disease.'),

    -- KNEE: MULTI-LIGAMENT
    (v_topic_id, 'How many of the four major ligaments must be torn to classify a "Knee Dislocation"?', '["One", "Two or more", "All four", "None"]', 1, 'Schenck Classification is used to grade these high-energy injuries.'),
    (v_topic_id, 'What is the most critical immediate assessment in a suspected knee dislocation?', '["MRI of the knee", "Vascular exam (ABI and distal pulses)", "X-ray", "Lachman test"]', 1, 'Popliteal artery injury is common and limb-threatening.'),
    (v_topic_id, 'An Ankle-Brachial Index (ABI) of less than what value requires immediate CT Angiography in a knee dislocation?', '["0.5", "0.7", "0.9", "1.2"]', 2, 'An ABI <0.9 is the threshold for further vascular imaging.'),

    -- KNEE: BURSITIS & PLICA
    (v_topic_id, 'Which knee bursa is located between the patellar tendon and the tibia?', '["Prepatellar bursa", "Deep infrapatellar bursa", "Pes anserine bursa", "Suprapatellar bursa"]', 1, 'Inflammation here causes pain deep to the tendon.'),
    (v_topic_id, 'What is "Housemaid''s Knee"?', '["Pes anserine bursitis", "Prepatellar bursitis", "Infrapatellar bursitis", "None"]', 1, 'Caused by prolonged kneeling on hard surfaces.'),
    (v_topic_id, 'A "Medial Plica" becomes symptomatic when it:', '["Tears", "Becomes thickened and snaps over the medial femoral condyle during flexion", "Infects", "None"]', 1, 'It can mimic a medial meniscus tear.'),

    -- KNEE: OCD (ADVANCED)
    (v_topic_id, 'What is the most common location for Osteochondritis Dissecans (OCD) in the knee?', '["Lateral aspect of the medial femoral condyle (L-MFC)", "Lateral femoral condyle", "Patella", "Trochlea"]', 0, 'Classic mnemonic: "L" for lateral aspect of the "M"edial condyle.'),

    -- KNEE: IT BAND
    (v_topic_id, '"Noble''s Test" is used to diagnose:', '["ACL tear", "IT Band Friction Syndrome", "Meniscus tear", "PCL tear"]', 1, 'Pressure is applied over the lateral femoral epicondyle while extending the knee.'),

    -- KNEE: MISC
    (v_topic_id, 'What is a "Cyclops Lesion" after ACL reconstruction?', '["A type of meniscus tear", "A localized fibroproliferative nodule in the notch that limits extension", "A graft failure", "None"]', 1, 'It causes a painful "clunk" at terminal extension.'),
    (v_topic_id, 'True or False: The "Popliteus Muscle" acts as an internal rotator of the tibia to "unlock" the knee from full extension.', '["True", "False"]', 0, 'The "Screw Home" mechanism is reversed by the popliteus.'),

    -- ADDITIONAL 20+
    (v_topic_id, 'Which ligament is the primary restraint to "External" rotation of the tibia?', '["ACL", "PLC (specifically the Popliteus complex)", "MCL", "None"]', 1, 'PLC injuries lead to excessive external rotation.'),
    (v_topic_id, 'The "Reverse Pivot Shift" test is used to evaluate for:', '["ACL injury", "PLC instability", "PCL injury", "MCL injury"]', 1, 'It is the PLC equivalent of the ACL pivot shift.'),
    (v_topic_id, 'In an ACL reconstruction, which graft is considered the "Gold Standard" for high-level athletes?', '["Hamstring", "Bone-Patellar Tendon-Bone (BTB)", "Quadriceps tendon", "Allograft"]', 1, 'BTB has better initial stability and bone-to-bone healing.'),
    (v_topic_id, 'What is the "Blumensaat Line"?', '["A fracture line", "The line of the intercondylar roof on a lateral X-ray", "A skin crease", "None"]', 1, 'It is used to assess patellar height (Alta/Baja).'),
    (v_topic_id, 'Patella "Alta" is associated with:', '["ACL tears", "Patellar dislocations", "PCL tears", "None"]', 1, 'A high-riding patella has less stability in the trochlea.'),
    (v_topic_id, 'Which meniscus is more likely to have a "Discord" (congenital abnormality where the meniscus is a solid block)?', '["Medial", "Lateral", "Both equally", "None"]', 1, 'Discoid lateral meniscus is a known variant, often presenting with a "snapping" knee in children.'),
    (v_topic_id, 'What is "Hoffa''s Fat Pad Syndrome"?', '["Inflammation of the infrapatellar fat pad due to impingement", "A tumor", "A type of fracture", "None"]', 0, 'It causes anterior knee pain, often worsened by extension.'),
    (v_topic_id, 'The "Wrisberg Ligament" and "Humphrey Ligament" are associated with which structure?', '["ACL", "PCL (Meniscofemoral ligaments)", "MCL", "LCL"]', 1, 'They run from the lateral meniscus to the medial femoral condyle, flanking the PCL.'),
    (v_topic_id, 'True or False: A "Stieda Fracture" is an avulsion of the MCL from the medial femoral condyle.', '["True", "False"]', 0, 'Pellegrini-Stieda refers to calcification in this area following an old MCL injury.'),
    (v_topic_id, 'Which grade of MCL injury involves "no endpoint" on valgus stress testing?', '["Grade I", "Grade II", "Grade III", "Grade IV"]', 2, 'Grade III is a complete tear with gross laxity.'),
    (v_topic_id, 'True or False: Most isolated Grade III MCL injuries can be treated non-operatively in a brace.', '["True", "False"]', 0, 'The MCL has excellent healing potential due to its extra-articular nature and blood supply.'),
    (v_topic_id, 'The "Anteromedial" (AM) bundle of the ACL is most lax in:', '["Flexion", "Extension", "Mid-rotation", "None"]', 1, 'It is tight in flexion and relatively lax in extension.'),
    (v_topic_id, 'What is the "Crossover Sign" on a hip X-ray?', '["Acetabular retroversion (Pincer FAI)", "Knee instability", "Shoulder impingement", "None"]', 0, 'This indicates the anterior wall of the acetabulum is more lateral than the posterior wall superiorly.'),
    (v_topic_id, 'Wait, back to the knee: What is the "Godfrey Test"?', '["Test for ACL", "Posterior sag test for PCL", "Test for meniscus", "None"]', 1, 'The patient''s hips and knees are flexed to 90 degrees, and the examiner looks for a posterior sag of the tibia.'),
    (v_topic_id, 'Which structure is the "Secondary" stabilizer to valgus stress if the MCL is gone?', '["ACL", "ACL and lateral joint capsule", "PCL", "None"]', 1, 'The ACL provides some secondary restraint.'),
    (v_topic_id, 'What is "Synovial Chondromatosis"?', '["A benign condition where the synovium produces multiple cartilaginous loose bodies", "A malignant tumor", "A type of infection", "None"]', 0, 'It often presents with joint swelling and mechanical symptoms.'),
    (v_topic_id, 'A "Fleck Sign" on an AP X-ray of the foot/ankle (Wait, knee context): In the KNEE, a bony avulsion of the PCL is best seen on which view?', '["AP", "Lateral", "Sunrise", "Merchant"]', 1, 'The posterior aspect of the tibia is visible on the lateral view.'),
    (v_topic_id, 'True or False: ACL tears are more common in female athletes than male athletes in similar sports.', '["True", "False"]', 0, 'Factors include Q-angle, hormonal influences, and neuromuscular recruitment patterns.'),
    (v_topic_id, 'What is the "Quadriceps Active Test" used for?', '["ACL", "PCL", "MCL", "LCL"]', 1, 'Contraction of the quads pulls the posteriorly-sagged tibia anteriorly, confirming a PCL tear.'),
    (v_topic_id, 'Which structure is the "Primary" stabilizer to lateral translation of the patella at 0-30 degrees of flexion?', '["MPFL", "Lateral retinaculum", "Vastus medialis", "None"]', 0, 'The MPFL is most active in early flexion before the patella engages the trochlea.'),
    (v_topic_id, 'Final Question Part 4: In a multi-ligament knee injury, what is the "Rule of 100" for vascular monitoring?', '["ABI > 1.0", "Systolic BP > 100 and pulse < 100", "Observation for 100 hours", "None"]', 1, 'It is a clinical guideline for ensuring stability before and after vascular intervention.')
    ;
END $$;
