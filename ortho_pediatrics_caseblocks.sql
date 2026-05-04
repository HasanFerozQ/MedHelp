-- Orthopedics: Pediatric Orthopedics
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-pediatric

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-pediatric' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-pediatric';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: DDH - Neonate
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clickey Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clickey Hip', 'A newborn female, born via breech delivery, is evaluated in the nursery.

Vitals: Stable.
Physical Examination: A palpable "clunk" is felt when the left hip is abducted (Ortolani maneuver). The left hip also feels unstable when adducted with posterior pressure (Barlow maneuver). There is no gross leg length discrepancy.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neonatal DDH in a breech female; Ortolani/Barlow positive.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three most significant risk factors for Developmental Dysplasia of the Hip (DDH)?', '["First-born, female, and breech presentation", "Male sex, prematurity, and twin gestation", "Diabetes, hypertension, and smoking", "None"]', 0, 'The "3 Fs" (First-born, Female, and Fruit/Breech) are the classic risk factors.'),
    (v_case_id, 'What is the primary screening imaging modality for a newborn with suspected DDH before 4-6 months of age?', '["X-ray", "Ultrasound", "MRI", "CT scan"]', 1, 'The femoral head is not ossified before 4-6 months, making X-rays unreliable; ultrasound is the gold standard.'),
    (v_case_id, 'What is the standard first-line treatment for an unstable but reducible hip in a neonate?', '["Immediate surgery", "Pavlik harness", "Spica casting", "Observation"]', 1, 'The Pavlik harness maintains the hip in flexion and abduction to encourage proper acetabular development.');

    ---------------------------------------------------------------------------
    -- CASE 02: DDH - Late Presentation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Limping Toddler' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Limping Toddler', 'A 14-month-old female is brought in because she has just started walking with a noticeable limp.

Vitals: Stable.
Physical Examination: Trendelenburg gait is noted on the right side. There is a limitation of abduction on the right hip and a perceived leg length discrepancy (Galeazzi sign positive).', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Late-presenting DDH in a walking child; Trendelenburg gait.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Galeazzi Sign"?', '["A click in the hip", "Apparent shortening of the femur when the knees are flexed and feet are flat on the table", "A type of skin rash", "None"]', 1, 'This indicates a hip dislocation or severe leg length discrepancy.'),
    (v_case_id, 'What radiographic measurement is used to assess the tilt of the acetabular roof on a pelvic X-ray?', '["Cobb angle", "Acetabular Index", "Hilgenreiner line", "None"]', 1, 'The acetabular index is elevated in DDH.'),
    (v_case_id, 'In a child between 6 and 18 months of age with DDH, what is the typical treatment?', '["Pavlik harness", "Closed reduction and Spica casting", "Total hip replacement", "None"]', 1, 'Once a child starts pulling to stand or is older than 6 months, the Pavlik harness is less effective, and closed (or open) reduction is usually required.');

    ---------------------------------------------------------------------------
    -- CASE 03: Legg-Calve-Perthes Disease (LCPD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Hip', 'A 6-year-old boy presents with a painless limp that has worsened over several months.

Vitals: Stable.
Physical Examination: Limitation of internal rotation and abduction of the right hip.
Laboratory Results: X-rays show a small, fragmented, and sclerotic femoral head (flattening).', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old boy with Legg-Calve-Perthes disease.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathology of Legg-Calve-Perthes disease?', '["Bacterial infection", "Idiopathic avascular necrosis of the femoral head", "Autoimmune inflammation", "A fracture"]', 1, 'LCPD is idiopathic AVN in children, usually between ages 4-8.'),
    (v_case_id, 'Which of the following is a "head at risk" sign on X-ray in LCPD?', '["Gage''s sign (lateral V-shaped lucency)", "Small joint space", "Increased bone density", "None"]', 0, 'Gage''s sign, lateral calcification, and lateral subluxation are signs of a poor prognosis.'),
    (v_case_id, 'What is the primary goal of treatment (containment) in LCPD?', '["To make the leg longer", "To keep the femoral head within the acetabulum while it remodels during the revascularization phase", "To stop all activity", "None"]', 1, 'Containment ensures the femoral head maintains a spherical shape as it heals.');

    ---------------------------------------------------------------------------
    -- CASE 04: Slipped Capital Femoral Epiphysis (SCFE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Obese Adolescent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Obese Adolescent', 'A 13-year-old obese male presents with left knee pain and a limp.

Vitals: Stable.
Physical Examination: The left hip is held in external rotation. When the hip is flexed, it automatically rotates externally.
Laboratory Results: X-rays of the hip show the femoral head is displaced posteriorly and inferiorly relative to the neck (Klein''s line does not intersect the epiphysis).', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'SCFE in an obese 13-year-old; knee pain as a presenting symptom.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is knee pain a common presentation for hip pathology in children?', '["Referred pain via the obturator nerve", "The knee is also injured", "Growth plates are growing", "None"]', 0, 'Always check the hip in a child with "knee" pain.'),
    (v_case_id, 'How is "Stability" defined in the Loder classification of SCFE?', '["By the size of the slip", "By the ability to bear weight on the affected limb", "By the age of the patient", "None"]', 1, 'Stable SCFE can bear weight; unstable cannot. This is the most important prognostic factor.'),
    (v_case_id, 'What is the definitive treatment for an acute SCFE?', '["Bed rest and observation", "In situ screw fixation", "Total hip replacement", "Spica casting"]', 1, 'Prompt surgical stabilization is required to prevent further slippage.');

    ---------------------------------------------------------------------------
    -- CASE 05: Septic Arthritis of the Hip
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Toxic Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Toxic Hip', 'A 3-year-old girl presents with a high fever, refusal to bear weight, and severe pain when the hip is moved.

Vitals: Temp 102.5 F, HR 130.
Physical Examination: The hip is held in a flexed, abducted, and externally rotated position (Log roll test extremely painful).
Laboratory Results: WBC 18,000, ESR 45, CRP 3.0.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Septic arthritis of the hip in a 3-year-old.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is NOT part of the Kocher criteria for differentiating septic arthritis from transient synovitis?', '["Fever > 38.5 C", "Non-weight bearing", "ESR > 40", "Platelet count < 100k"]', 3, 'The four Kocher criteria are: Fever, NWB, ESR > 40, and WBC > 12k.'),
    (v_case_id, 'What is the most common causative organism in pediatric septic arthritis?', '["Staphylococcus aureus", "Group A Streptococcus", "E. coli", "None"]', 0, 'S. aureus is the most frequent pathogen overall.'),
    (v_case_id, 'True or False: Septic arthritis of the hip in a child is a surgical emergency.', '["True", "False"]', 0, 'Rapid drainage (often surgical) is required to prevent pressure-induced necrosis of the femoral head (chondrolysis).');

    ---------------------------------------------------------------------------
    -- CASE 06: Transient Synovitis (Toxic Synovitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Viral Limp' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Viral Limp', 'A 5-year-old boy presents with a limp 10 days after a mild upper respiratory infection. He is afebrile and can limp across the room.

Vitals: Temp 98.6 F.
Laboratory Results: WBC 9,000, ESR 15. Hip ultrasound shows a small effusion.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Transient synovitis following a viral URI.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the typical management for Transient Synovitis?', '["IV antibiotics", "Rest and NSAIDs (e.g., Ibuprofen)", "Surgical drainage", "None"]', 1, 'It is a self-limiting inflammatory condition.'),
    (v_case_id, 'How do you differentiate Transient Synovitis from Septic Arthritis using the Kocher criteria?', '["Transient synovitis usually meets 0 or 1 criteria, with a very low risk of sepsis", "They are the same", "One requires chemotherapy", "None"]', 0, 'The risk of septic arthritis is <3% if only 1 criteria is met.'),
    (v_case_id, 'True or False: Transient synovitis is the most common cause of acute hip pain in children aged 3-10.', '["True", "False"]', 0, 'It is extremely common and usually follows a viral illness.');

    ---------------------------------------------------------------------------
    -- CASE 07: Proximal Femoral Focal Deficiency (PFFD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Short Thigh' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Short Thigh', 'A newborn is noted to have a significantly shortened right thigh and an unstable hip.

Vitals: Stable.
Laboratory Results: X-rays show a missing or severely hypoplastic proximal femur.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital PFFD.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is PFFD?', '["A type of fracture", "A congenital anomaly characterized by failure of the proximal femur to develop normally", "A bone tumor", "None"]', 1, 'It results in severe limb length discrepancy.'),
    (v_case_id, 'Which of the following is frequently associated with PFFD?', '["Fibular hemimelia", "Down Syndrome", "Scoliosis", "None"]', 0, 'Fibular hemimelia (absence of the fibula) is a common co-morbidity.'),
    (v_case_id, 'True or False: Rotationplasty is a surgical option for severe PFFD.', '["True", "False"]', 0, 'Van Nes rotationplasty can be used to convert the ankle joint into a functional knee joint for a prosthesis.');

    ---------------------------------------------------------------------------
    -- CASE 08: Snapping Hip Syndrome (Pediatric)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Popping Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Popping Hip', 'A 15-year-old dancer complains of a "pop" in her lateral hip when she moves. It is usually painless but annoying.

Vitals: Stable.
Physical Examination: A snapping sensation is felt over the greater trochanter as the hip is moved from flexion to extension.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'External snapping hip (IT band over greater trochanter).', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of "External" Snapping Hip?', '["The iliopsoas tendon", "The Iliotibial (IT) band snapping over the greater trochanter", "A labral tear", "None"]', 1, 'Internal snapping usually involves the iliopsoas tendon snapping over the pelvic brim.'),
    (v_case_id, 'Initial treatment for snapping hip syndrome:', '["Surgery", "Stretching the IT band and iliopsoas, along with activity modification", "Casting", "None"]', 1, 'Surgery is rarely needed.'),
    (v_case_id, 'True or False: Snapping hip can sometimes be caused by an intra-articular loose body.', '["True", "False"]', 0, 'This is "intra-articular" snapping, which is more likely to be painful and catch.');

    ---------------------------------------------------------------------------
    -- CASE 09: Developmental Coxa Vara
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Decreased Angle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Decreased Angle', 'A 4-year-old presents with a waddling gait.

Vitals: Stable.
Laboratory Results: X-rays show a femoral neck-shaft angle of 100 degrees (normal is ~135).', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Developmental Coxa Vara.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Coxa Vara"?', '["Increased neck-shaft angle", "Decreased neck-shaft angle (< 120 degrees)", "A twisted femur", "None"]', 1, 'Normal pediatric neck-shaft angle is 135-145; in adults it is ~125-130.'),
    (v_case_id, 'What is the "Hilgenreiner-Epiphyseal (H-E) Angle"?', '["An angle used to determine the risk of progression in coxa vara", "A type of fracture angle", "The angle of the knee", "None"]', 0, 'An H-E angle > 60 degrees suggests the deformity will progress and require surgery.'),
    (v_case_id, 'The surgical treatment for progressive coxa vara is:', '["Total hip replacement", "Valgus-producing proximal femoral osteotomy", "A Pavlik harness", "None"]', 1, 'The osteotomy re-aligns the neck to a more normal angle.');

    ---------------------------------------------------------------------------
    -- CASE 10: Femoral Anteversion
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Intoer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Intoer', 'A 5-year-old girl is brought in because she "trips over her own feet." She prefers to sit in the "W" position.

Vitals: Stable.
Physical Examination: When walking, the patellae point inward ("kissing patellae"). Internal rotation of the hips is 80 degrees, and external rotation is 10 degrees.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Excessive femoral anteversion causing in-toeing.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the natural history of femoral anteversion in most children?', '["It gets worse with age", "It gradually corrects spontaneously by age 8-10", "It leads to arthritis", "None"]', 1, 'The vast majority of cases resolve without treatment.'),
    (v_case_id, 'What is the "W" sitting position?', '["Sitting with legs crossed", "Sitting with knees together and feet out to the sides", "Standing on one leg", "None"]', 1, 'This position is comfortable for children with high anteversion but is often discouraged by parents.'),
    (v_case_id, 'True or False: Bracing and special shoes are highly effective for treating femoral anteversion.', '["True", "False"]', 1, 'Braces/shoes have NO effect on the bony torsion; observation is the standard of care.');

    ---------------------------------------------------------------------------
    -- CASE 11: Congenital Talipes Equinovarus (Clubfoot)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rigid Clubfoot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rigid Clubfoot', 'A newborn male is noted to have bilateral feet that are turned inward and downward. The deformity is rigid and cannot be manually corrected to neutral.

Vitals: Stable.
Physical Examination: Cavus, Adductus, Varus, and Equinus (CAVE) deformities are present.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilateral clubfoot (TEV) in a newborn; CAVE deformities.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the acronym "CAVE" stand for in clubfoot?', '["Cold, Blue, Vascular, Edema", "Cavus, Adductus, Varus, Equinus", "Cyst, Abscess, Vesicle, Erosion", "None"]', 1, 'These are the four components of the clubfoot deformity.'),
    (v_case_id, 'What is the gold standard non-operative treatment for clubfoot?', '["Physical therapy only", "The Ponseti method (serial casting, tenotomy, and bracing)", "Immediate surgery", "None"]', 1, 'The Ponseti method has revolutionized clubfoot care, avoiding major surgery in most cases.'),
    (v_case_id, 'What is the last component of the clubfoot deformity to be corrected in the Ponseti sequence?', '["Cavus", "Adductus", "Equinus (usually requires a percutaneous Achilles tenotomy)", "Varus"]', 2, 'Equinus is corrected last, often needing a minor procedure to release the heel cord.');

    ---------------------------------------------------------------------------
    -- CASE 12: Metatarsus Adductus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Kidney Bean Foot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Kidney Bean Foot', 'A 2-month-old infant is brought in because her feet "curve inward."

Vitals: Stable.
Physical Examination: The lateral border of the foot is convex, and the forefoot is adducted relative to the hindfoot. The deformity is flexible and can be corrected past neutral.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Flexible metatarsus adductus in an infant.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is Metatarsus Adductus (MA) typically distinguished from Clubfoot?', '["MA involves only the forefoot and the hindfoot is neutral or in valgus; Clubfoot involves the whole foot with hindfoot varus", "MA is always rigid", "Clubfoot is painless", "None"]', 0, 'This is a critical distinction.'),
    (v_case_id, 'What is the "V-test" for metatarsus adductus?', '["Testing for a vitamin deficiency", "Placing the base of the index and middle finger in a V around the base of the fifth metatarsal to see if the foot curves in", "A blood test", "None"]', 1, 'The V-test (or Heikel''s sign) helps visualize the adduction.'),
    (v_case_id, 'True or False: Most cases of flexible metatarsus adductus resolve spontaneously.', '["True", "False"]', 0, 'Parental reassurance and stretching are usually all that is needed.');

    ---------------------------------------------------------------------------
    -- CASE 13: Congenital Vertical Talus (CVT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rocker-Bottom Foot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rocker-Bottom Foot', 'A newborn is noted to have a "rocker-bottom" deformity of the feet, with a convex plantar surface and a prominent heel.

Vitals: Stable.
Physical Examination: The forefoot is dorsiflexed and abducted. The hindfoot is in equinus. The deformity is rigid.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital vertical talus (CVT); rocker-bottom appearance.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic radiographic finding in CVT?', '["A broken ankle", "The talus is oriented vertically, and the navicular is dislocated onto the dorsal neck of the talus", "Missing toes", "None"]', 1, 'The navicular-talus relationship is the key to the deformity.'),
    (v_case_id, 'CVT is frequently associated with which of the following?', '["Trisomy 18", "Arthrogryposis", "Spina Bifida", "All of the above"]', 3, 'CVT is often a component of more complex syndromes or neuromuscular conditions.'),
    (v_case_id, 'True or False: CVT is a flexible deformity that can be corrected with simple stretching.', '["True", "False"]', 1, 'CVT is a rigid deformity that usually requires surgical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 14: Calcaneonavicular Coalition
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Anteater Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Anteater Nose', 'A 10-year-old boy presents with progressive foot pain and frequent "ankle sprains."

Vitals: Stable.
Physical Examination: Decreased subtalar motion. The foot appears flat (pes planus).
Laboratory Results: Oblique X-rays show a bony bridge between the calcaneus and the navicular.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Calcaneonavicular tarsal coalition in a 10-year-old.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Anteater Nose Sign"?', '["A long nose on a child", "An elongated anterior process of the calcaneus seen on lateral X-ray in calcaneonavicular coalition", "A sign of a cold", "None"]', 1, 'It looks like the snout of an anteater reaching toward the navicular.'),
    (v_case_id, 'What is the most common age of presentation for calcaneonavicular coalition?', '["Birth", "8-12 years (when the coalition ossifies)", "Adults", "None"]', 1, 'Pain begins when the previously fibrous/cartilaginous bridge turns to bone.'),
    (v_case_id, 'Initial treatment for a symptomatic tarsal coalition:', '["Immediate fusion", "Activity modification, orthotics, and potentially a short period of casting", "Amputation", "None"]', 1, 'Conservative measures should always be tried first.');

    ---------------------------------------------------------------------------
    -- CASE 15: Talocalcaneal Coalition
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The C Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The C Sign', 'A 14-year-old girl presents with rigid flat feet and pain after activity.

Vitals: Stable.
Physical Examination: Rigid pes planovalgus. Subtalar motion is almost zero.
Laboratory Results: Lateral X-rays show a "C-sign" (continuity between the talus and the sustentaculum tali).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Talocalcaneal coalition in a 14-year-old.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "C-sign" on lateral X-ray?', '["A sign of Vitamin C deficiency", "A radiographic halo formed by the talocalcaneal coalition and the sustentaculum tali", "A curved toe", "None"]', 1, 'The C-sign is a classic radiographic indicator of this coalition.'),
    (v_case_id, 'Which imaging modality is best for evaluating the size and extent of a tarsal coalition?', '["X-ray", "CT Scan", "Ultrasound", "None"]', 1, 'CT is the gold standard for defining the bony anatomy of coalitions.'),
    (v_case_id, 'True or False: Talocalcaneal coalitions typically present later than calcaneonavicular ones.', '["True", "False"]', 0, 'They usually ossify and become symptomatic between ages 12 and 15.');

    ---------------------------------------------------------------------------
    -- CASE 16: Sever''s Disease (Calcaneal Apophysitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heel Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heel Pain', 'An 11-year-old soccer player complains of bilateral heel pain that is worse during and after matches.

Vitals: Stable.
Physical Examination: Tenderness over the posterior aspect of the calcaneus, specifically when the heel is "squeezed" (Squeeze test positive).', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sever''s disease (calcaneal apophysitis) in a young athlete.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Sever''s disease?', '["A bone tumor", "Traction apophysitis of the calcaneus where the Achilles tendon attaches", "A type of fracture", "None"]', 1, 'It is similar to Osgood-Schlatter but occurs at the heel.'),
    (v_case_id, 'True or False: X-rays are usually diagnostic for Sever''s disease.', '["True", "False"]', 1, 'X-rays often look normal or show "increased density" of the apophysis, which is a normal finding; the diagnosis is clinical.'),
    (v_case_id, 'Treatment for Sever''s disease includes:', '["Total rest for 6 months", "Heel cups, stretching the Achilles tendon, and activity modification", "Surgery", "None"]', 1, 'It is a self-limiting condition that resolves as the apophysis fuses.');

    ---------------------------------------------------------------------------
    -- CASE 17: Köhler''s Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flattened Navicular' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flattened Navicular', 'A 5-year-old boy presents with pain and swelling over the dorsum of his midfoot.

Vitals: Stable.
Laboratory Results: X-rays show a thin, wafer-like, and sclerotic tarsal navicular.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Köhler''s disease (navicular osteochondrosis).', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Köhler''s disease?', '["A type of gout", "Osteochondrosis of the tarsal navicular bone", "A stress fracture", "None"]', 1, 'It is a self-limiting avascular necrosis of the navicular.'),
    (v_case_id, 'True or False: The navicular bone in Köhler''s disease eventually reconstitutes and regains its normal shape.', '["True", "False"]', 0, 'Long-term prognosis is excellent with minimal intervention.'),
    (v_case_id, 'What is the recommended treatment for symptomatic Köhler''s disease?', '["Surgery", "Short-term immobilization in a walking cast for 4-6 weeks", "Chemotherapy", "None"]', 1, 'Casting provides rapid pain relief and allows the child to stay active.');

    ---------------------------------------------------------------------------
    -- CASE 18: Cavus Foot (Pes Cavus)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Arch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Arch', 'A 12-year-old girl presents with high-arched feet and clawing of the toes.

Vitals: Stable.
Physical Examination: High longitudinal arch. Hindfoot varus. A positive "Coleman block test" shows the hindfoot varus corrects to valgus when the first metatarsal is allowed to drop.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cavus foot (pes cavus); Coleman block test.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Coleman Block Test" used for?', '["To test for a block in the heart", "To determine if hindfoot varus is flexible and driven by a plantar-flexed first metatarsal", "To test for skin sensitivity", "None"]', 1, 'If the heel corrects to valgus, the deformity is "forefoot driven."'),
    (v_case_id, 'Which neuromuscular condition is most commonly associated with bilateral cavus feet?', '["Cerebral Palsy", "Charcot-Marie-Tooth (CMT) Disease", "Polio", "None"]', 1, 'CMT is a common cause of progressive cavovarus deformity.'),
    (v_case_id, 'True or False: A unilateral cavus foot should prompt an evaluation of the spine (e.g., MRI for tethered cord).', '["True", "False"]', 0, 'Asymmetric or unilateral cavus foot is a red flag for intraspinal pathology.');

    ---------------------------------------------------------------------------
    -- CASE 19: Flat Foot (Pes Planus)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flat Arch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flat Arch', 'A 6-year-old boy is brought in because he "has no arches."

Vitals: Stable.
Physical Examination: When standing, the arches are flat. When the child stands on his tiptoes, the arch reappears and the heel moves into valgus.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Flexible pes planus (flat foot) in a child.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines a "Flexible" flat foot?', '["The arch is always flat", "The arch reconstitutes (reappears) when the child is non-weight bearing or stands on tiptoes", "The child can touch his toes", "None"]', 1, 'Flexible flat feet are extremely common and usually asymptomatic.'),
    (v_case_id, 'True or False: Most children with flexible, painless flat feet require corrective shoes or orthotics.', '["True", "False"]', 1, 'Evidence shows that orthotics do not change the development of the arch; they are only used for symptomatic relief.'),
    (v_case_id, 'What should you suspect if a flat foot is "Rigid" and does not reconstitute on tiptoe?', '["Tarsal coalition", "Vertical talus", "Inflammatory arthritis", "All of the above"]', 3, 'Rigid flat feet are always pathological and require further investigation.');

    ---------------------------------------------------------------------------
    -- CASE 20: Accessory Navicular
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Extra Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Extra Bone', 'A 13-year-old female presents with pain on the medial side of her foot, especially when wearing tight shoes.

Vitals: Stable.
Physical Examination: Tenderness and prominence over the medial aspect of the navicular.
Laboratory Results: X-rays show a large accessory ossicle (Type II) within the posterior tibial tendon insertion.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Symptomatic Type II accessory navicular.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What tendon inserts onto the accessory navicular?', '["Achilles tendon", "Posterior Tibial Tendon", "Peroneus longus", "None"]', 1, 'The posterior tibial tendon inserts into the ossicle, causing traction and pain.'),
    (v_case_id, 'What is the "Kidner Procedure"?', '["A type of knee surgery", "Excision of the accessory navicular and transposition of the posterior tibial tendon", "A foot cast", "None"]', 1, 'This is the standard surgical treatment for symptomatic cases that fail conservative care.'),
    (v_case_id, 'Which type of accessory navicular is most commonly symptomatic?', '["Type I (small ossicle)", "Type II (larger, connected via a synchondrosis)", "Type III (fused/gorilloid navicular)", "None"]', 1, 'Type II is the most frequently symptomatic due to motion at the synchondrosis.');

    ---------------------------------------------------------------------------
    -- CASE 21: Infantile Blount''s Disease (Tibia Vara)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Early Bowing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Early Bowing', 'A 2-year-old African American male, who started walking early (at 9 months), presents with progressive bowing of the legs.

Vitals: Stable.
Physical Examination: Significant varus deformity of the proximal tibia.
Laboratory Results: X-rays show a Metaphyseal-Diaphyseal (Drennan) Angle of 20 degrees.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infantile Blount''s disease in a 2-year-old; Drennan angle > 16.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Drennan (Metaphyseal-Diaphyseal) Angle" used for?', '["To measure height", "To differentiate between physiological bowing and infantile Blount''s disease", "To measure foot length", "None"]', 1, 'An angle > 16 degrees has a high probability of progression to Blount''s.'),
    (v_case_id, 'What is the primary pathology in Blount''s disease?', '["Vitamin D deficiency", "Abnormal growth at the posteromedial aspect of the proximal tibial physis due to excessive pressure", "A bone tumor", "None"]', 1, 'It is a developmental disorder of the growth plate.'),
    (v_case_id, 'Treatment for Langenskiold Stage I or II infantile Blount''s in a 2.5-year-old:', '["Total knee replacement", "Bracing (KAFO) and observation", "Immediate corrective osteotomy", "None"]', 1, 'Bracing is often effective in very young children with early-stage disease.');

    ---------------------------------------------------------------------------
    -- CASE 22: Adolescent Blount''s Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heavy Adolescent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heavy Adolescent', 'A 13-year-old obese male presents with progressive bowing of the left leg and knee pain.

Vitals: Stable.
Physical Examination: Unilateral genu varum on the left.
Laboratory Results: X-rays show narrowing of the medial proximal tibial physis and varus deformity.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adolescent Blount''s disease in an obese 13-year-old.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Adolescent Blount''s differ from the Infantile form?', '["It is always bilateral", "It presents after age 10, is often unilateral, and is strongly associated with obesity", "It is caused by rickets", "None"]', 1, 'Obesity is a major risk factor due to increased load on the medial physis.'),
    (v_case_id, 'Treatment for symptomatic adolescent Blount''s with significant deformity usually involves:', '["Bracing", "Surgical correction (e.g., hemi-epiphysiodesis or osteotomy)", "Weight loss alone", "None"]', 1, 'Bracing is not effective in adolescents; surgical realignment is typically necessary.'),
    (v_case_id, 'True or False: Adolescent Blount''s disease is purely a cosmetic concern.', '["True", "False"]', 1, 'Untreated deformity leads to premature medial compartment osteoarthritis.');

    ---------------------------------------------------------------------------
    -- CASE 23: Physiological Genu Varum (Bowed Legs)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Normal Bow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Normal Bow', 'An 18-month-old is brought in because his legs are "bowed." He is walking normally and meeting all milestones.

Vitals: Stable.
Physical Examination: Bilateral, symmetric genu varum.
Laboratory Results: X-rays show a Drennan angle of 8 degrees and normal appearing growth plates.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Physiological genu varum in an 18-month-old.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age is physiological genu varum (bowing) most common?', '["Birth to 2 years", "Age 3-4", "Adolescence", "None"]', 0, 'Children are normally bowed at birth, neutral at 1.5-2 years, and then move into valgus.'),
    (v_case_id, 'What is the characteristic feature of "Physiological" bowing?', '["It is unilateral", "It is bilateral, symmetric, and resolves spontaneously", "It requires surgery", "None"]', 1, 'Symmetry is a key indicator of physiological vs pathological bowing.'),
    (v_case_id, 'Management for physiological genu varum includes:', '["Bracing", "Parental reassurance and serial observation", "Vitamin D supplements", "None"]', 1, 'No treatment is needed as it corrects with growth.');

    ---------------------------------------------------------------------------
    -- CASE 24: Physiological Genu Valgum (Knock Knees)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Knock Knees' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Knock Knees', 'A 3.5-year-old girl is brought in because her "knees touch when she walks."

Vitals: Stable.
Physical Examination: Bilateral genu valgum. Intermalleolar distance is 6 cm.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Physiological genu valgum in a 3.5-year-old.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age is physiological genu valgum (knock knees) typically at its peak?', '["Birth", "Age 3-4 years", "Age 10", "None"]', 1, 'Valgus peaks at 3-4 years and then settles toward a normal adult alignment (5-7 degrees) by age 7.'),
    (v_case_id, 'When is genu valgum considered "Pathological"?', '["If it is bilateral", "If it is excessive (> 15-20 degrees), unilateral, or persists after age 8", "If it is seen in a 3-year-old", "None"]', 1, 'Unilateral valgus is a major red flag for trauma or infection of the growth plate.'),
    (v_case_id, 'True or False: Physiological genu valgum requires specialized "orthopedic" shoes.', '["True", "False"]', 1, 'Shoes do not affect the bony alignment of the knees.');

    ---------------------------------------------------------------------------
    -- CASE 25: Osgood-Schlatter Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bumpy Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bumpy Knee', 'A 13-year-old boy, active in basketball, presents with pain and a prominent bump on the front of his right knee.

Vitals: Stable.
Physical Examination: Exquisite tenderness and a prominent bony tubercle at the insertion of the patellar tendon on the tibia.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Osgood-Schlatter disease in a 13-year-old athlete.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathology of Osgood-Schlatter disease?', '["A bone tumor", "Traction apophysitis of the tibial tubercle", "A ligament tear", "None"]', 1, 'Repetitive pull of the patellar tendon on the immature tibial tubercle leads to inflammation and micro-avulsions.'),
    (v_case_id, 'True or False: Patients with Osgood-Schlatter should be completely immobilized in a cast for 6 weeks.', '["True", "False"]', 1, 'Complete immobilization is not necessary; treatment is activity modification, ice, and NSAIDs.'),
    (v_case_id, 'What is a possible long-term sequel of Osgood-Schlatter?', '["Amputation", "A persistent painless bony prominence (ossicle)", "Knee replacement", "None"]', 1, 'The "bump" often persists into adulthood but is rarely symptomatic.');

    ---------------------------------------------------------------------------
    -- CASE 26: Sinding-Larsen-Johansson (SLJ) Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lower Pole Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lower Pole Pain', 'A 10-year-old boy complains of pain at the bottom of his kneecap during gym class.

Vitals: Stable.
Physical Examination: Tenderness specifically at the inferior pole of the patella.
Laboratory Results: X-rays show minor calcification at the inferior patellar pole.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sinding-Larsen-Johansson syndrome (patellar apophysitis).', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does SLJ syndrome differ from Osgood-Schlatter?', '["SLJ is in the hip", "SLJ occurs at the inferior pole of the patella; Osgood-Schlatter occurs at the tibial tubercle", "SLJ is a malignancy", "None"]', 1, 'Both are traction apophysitis conditions of the patellar mechanism.'),
    (v_case_id, 'Treatment for SLJ syndrome is primarily:', '["Surgical excision", "Conservative (rest, ice, stretching)", "Radiation", "None"]', 1, 'Like other apophysitis, it is self-limiting.'),
    (v_case_id, 'True or False: SLJ syndrome is most common in active, growing children.', '["True", "False"]', 0, 'It is frequently seen in children involved in jumping or running sports.');

    ---------------------------------------------------------------------------
    -- CASE 27: Discoid Meniscus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snapping Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snapping Knee', 'An 8-year-old presents with a "snapping" sound in his lateral knee and occasional locking.

Vitals: Stable.
Physical Examination: A palpable and audible snap is felt over the lateral joint line during knee extension.
Laboratory Results: MRI shows a thick, disc-shaped lateral meniscus.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Discoid lateral meniscus in an 8-year-old.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Discoid Meniscus"?', '["A torn meniscus", "A congenital variant where the meniscus is disc-shaped rather than C-shaped", "A bone tumor", "None"]', 1, 'The lateral meniscus is almost always the one affected.'),
    (v_case_id, 'Which variant of discoid meniscus is the most unstable due to lack of posterior attachments?', '["Complete", "Incomplete", "Wrisberg-type", "None"]', 2, 'The Wrisberg variant lacks the normal posterior coronary ligament, making it highly mobile and symptomatic.'),
    (v_case_id, 'Treatment for a symptomatic, torn, or snapping discoid meniscus usually involves:', '["Total meniscectomy", "Arthroscopic \"saucerization\" (re-shaping the meniscus) and repair", "Casting", "None"]', 1, 'Saucerization aims to create a more normal C-shaped meniscus.');

    ---------------------------------------------------------------------------
    -- CASE 28: Toddler''s Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Occult Spiral' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Occult Spiral', 'A 20-month-old child refuses to bear weight after a minor trip at daycare.

Vitals: Stable.
Physical Examination: No gross deformity. Mild tenderness over the mid-tibia. Pain on gentle torsion of the foot.
Laboratory Results: Initial X-rays are normal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Toddler''s fracture (undisplaced spiral fracture of the tibia).', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Toddler''s Fracture"?', '["A broken femur", "An undisplaced spiral fracture of the distal third of the tibia in a young child", "A type of growth plate injury", "None"]', 1, 'It is a common cause of sudden refusal to walk in toddlers.'),
    (v_case_id, 'What should you do if a toddler refuses to walk, has tibial tenderness, but X-rays are normal?', '["Assume it is a sprain", "Treat as a toddler''s fracture (immobilize in a walking cast) and repeat X-rays in 10-14 days", "Order an immediate MRI", "None"]', 1, 'The fracture line is often invisible initially but becomes apparent once callus forms.'),
    (v_case_id, 'True or False: Toddler''s fractures are highly suspicious for child abuse.', '["True", "False"]', 1, 'Unlike femur or humerus fractures in non-ambulatory children, a toddler''s fracture usually results from a simple twisting fall during normal play.');

    ---------------------------------------------------------------------------
    -- CASE 29: Congenital Pseudarthrosis of the Tibia (CPT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The False Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The False Joint', 'A newborn is noted to have a progressive anterolateral bowing of the tibia.

Vitals: Stable.
Laboratory Results: X-rays show a narrowed, "pencil-point" appearance of the tibia with a non-union site.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital pseudarthrosis of the tibia.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Congenital Pseudarthrosis of the Tibia is strongly associated with which condition?', '["Down Syndrome", "Neurofibromatosis Type 1 (NF1)", "Cystic Fibrosis", "None"]', 1, 'Approximately 50% of children with CPT have NF1.'),
    (v_case_id, 'What is the characteristic clinical course of CPT?', '["It heals spontaneously", "It is extremely difficult to achieve bony union, even with multiple surgeries", "It turns into a tumor", "None"]', 1, 'Achieving union in CPT is one of the greatest challenges in pediatric orthopedics.'),
    (v_case_id, 'Initial management of anterolateral bowing (pre-pseudarthrosis) involves:', '["Immediate surgery", "Protective bracing to prevent a fracture", "Total rest", "None"]', 1, 'Once the tibia breaks, pseudarthrosis (non-union) is likely to occur.');

    ---------------------------------------------------------------------------
    -- CASE 30: Patellar Instability
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dislocating Cap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dislocating Cap', 'A 14-year-old girl was dancing when her right "knee went out." She felt a pop and her kneecap was briefly displaced laterally.

Vitals: Stable.
Physical Examination: Significant knee effusion (hemarthrosis). Tenderness over the medial patellofemoral ligament (MPFL). A positive "Apprehension test" (pain and guarding when the patella is pushed laterally).', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute patellar dislocation in a 14-year-old girl.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which ligament is the primary medial stabilizer of the patella and is typically torn during a lateral dislocation?', '["ACL", "Medial Patellofemoral Ligament (MPFL)", "PCL", "LCL"]', 1, 'The MPFL is the key structure that prevents lateral displacement.'),
    (v_case_id, 'What is a common risk factor for patellar instability in adolescent females?', '["Increased Q-angle", "Patella alta (high kneecap)", "Ligamentous laxity", "All of the above"]', 3, 'These factors all contribute to the risk of dislocation.'),
    (v_case_id, 'Management for a FIRST-TIME patellar dislocation without loose bodies:', '["Immediate MPFL reconstruction", "Reduction, brief immobilization, and physical therapy to strengthen the quadriceps (VMO)", "Total knee replacement", "None"]', 1, 'Non-operative management is the standard for the first episode unless there is an osteochondral fracture.');

    ---------------------------------------------------------------------------
    -- CASE 31: Adolescent Idiopathic Scoliosis (AIS) - Diagnosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spinal Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spinal Curve', 'A 12-year-old girl is noted to have "uneven shoulders" during a school screening.

Vitals: Stable.
Physical Examination: Adam''s Forward Bend test shows a prominent right-sided rib hump. Neurological exam is normal.
Laboratory Results: Standing X-rays show a right thoracic curve with a Cobb angle of 15 degrees.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Initial diagnosis of AIS in a 12-year-old girl; 15-degree curve.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is the "Cobb Angle" measured?', '["Between the most tilted vertebrae (end-vertebrae) at the top and bottom of the curve", "From the neck to the pelvis", "Using a tape measure on the skin", "None"]', 0, 'The Cobb angle is the gold standard for quantifying scoliosis.'),
    (v_case_id, 'A Cobb angle of at least how many degrees is required to diagnose "Scoliosis"?', '["5 degrees", "10 degrees", "20 degrees", "40 degrees"]', 1, 'Curves < 10 degrees are considered spinal asymmetry, not scoliosis.'),
    (v_case_id, 'What is the standard management for a 15-degree curve in a skeletally immature patient?', '["Immediate surgery", "Bracing", "Observation with serial X-rays every 6 months", "None"]', 2, 'Curves < 20-25 degrees in immature patients are generally observed.');

    ---------------------------------------------------------------------------
    -- CASE 32: AIS - Bracing
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Progressing Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Progressing Curve', 'A 11-year-old girl (pre-menarcheal) returns for follow-up. Her curve has increased from 18 degrees to 28 degrees in 6 months.

Vitals: Stable.
Physical Examination: Risser stage 0 (no ossification of the iliac apophysis).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Progressing AIS requiring bracing; Risser 0.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Risser Stage" used to assess?', '["Pain levels", "Skeletal maturity and remaining growth potential", "Lung function", "None"]', 1, 'Risser 0-2 indicates significant remaining growth and higher risk of curve progression.'),
    (v_case_id, 'What is the standard threshold for starting brace treatment in AIS?', '["Any curve > 10 degrees", "A curve between 25 and 45 degrees in a skeletally immature patient", "Only after the curve reaches 50 degrees", "None"]', 1, 'Bracing aims to prevent further progression, not to correct the existing curve.'),
    (v_case_id, 'True or False: Bracing is most effective when worn for at least 16-23 hours per day.', '["True", "False"]', 0, 'There is a strong dose-response relationship between brace wear time and success.');

    ---------------------------------------------------------------------------
    -- CASE 33: AIS - Surgical Treatment
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Severe Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Severe Curve', 'A 14-year-old female presents with a thoracic curve that has reached 52 degrees. She is now Risser stage 4.

Vitals: Stable.
Physical Examination: Noticeable trunk imbalance and significant rib hump.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Surgical AIS case; Cobb angle > 50.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what Cobb angle is surgery (Posterior Spinal Fusion) typically recommended for AIS?', '["20 degrees", "30 degrees", "Generally > 45-50 degrees", "Never"]', 2, 'Curves over 50 degrees are likely to continue progressing even after skeletal maturity.'),
    (v_case_id, 'What is the primary goal of surgery in AIS?', '["To make the patient taller", "To prevent further progression and achieve a balanced spine in the coronal and sagittal planes", "To stop all back pain", "None"]', 1, 'Functional balance and stability are more important than achieving a "perfectly straight" spine.'),
    (v_case_id, 'True or False: Most patients with AIS have significant neurological deficits.', '["True", "False"]', 1, 'By definition, "idiopathic" scoliosis occurs in otherwise healthy children with normal neurology. Deficits should prompt an MRI to look for syrinx or tumor.');

    ---------------------------------------------------------------------------
    -- CASE 34: Congenital Scoliosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Misshapen Vertebra' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Misshapen Vertebra', 'An infant is noted to have a sharp, angular curve in the mid-back at birth.

Vitals: Stable.
Laboratory Results: X-rays show a "hemivertebra" (a half-formed vertebra) at T8.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital scoliosis due to a hemivertebra.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the difference between Congenital and Idiopathic scoliosis?', '["They are the same", "Congenital is due to abnormal vertebral development (failure of formation or segmentation) during embryogenesis", "Congenital is caused by bad posture", "None"]', 1, 'Congenital scoliosis is present at birth and often progresses rapidly.'),
    (v_case_id, 'Which organ systems should be screened in a child with congenital scoliosis (VACTERL association)?', '["Heart (Echo) and Kidneys (Ultrasound)", "Lungs only", "Eyes and ears", "None"]', 0, '20-30% of these patients have renal anomalies; cardiac anomalies are also common.'),
    (v_case_id, 'True or False: Congenital scoliosis usually responds well to bracing.', '["True", "False"]', 1, 'Bracing is ineffective for congenital bony deformities; early surgery is often needed.');

    ---------------------------------------------------------------------------
    -- CASE 35: Neuromuscular Scoliosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Collapsing Spine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Collapsing Spine', 'A 10-year-old boy with non-ambulatory Cerebral Palsy (GMFCS IV) presents with a long, C-shaped curve of his entire spine and pelvic obliquity.

Vitals: Stable.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neuromuscular scoliosis in a non-ambulatory CP patient.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a characteristic feature of neuromuscular scoliosis?', '["Short curves", "Long, C-shaped curves that often involve the pelvis (pelvic obliquity)", "Spontaneous resolution", "None"]', 1, 'The lack of trunk muscle control leads to a collapsing, long-segment curve.'),
    (v_case_id, 'Why is surgery often performed earlier in neuromuscular scoliosis than in AIS?', '["To improve sitting balance and prevent respiratory compromise", "To help the child walk", "To stop all pain", "None"]', 0, 'Sitting balance is crucial for quality of life in non-ambulatory patients.'),
    (v_case_id, 'True or False: Neuromuscular curves often continue to progress even after skeletal maturity.', '["True", "False"]', 0, 'Unlike AIS, the underlying neurological condition keeps the curve at risk.');

    ---------------------------------------------------------------------------
    -- CASE 36: Scheuermann''s Kyphosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Round Back' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Round Back', 'A 16-year-old male presents with mid-back pain and a "hunchback" appearance.

Vitals: Stable.
Physical Examination: A sharp, rigid thoracic kyphosis that does not correct with extension.
Laboratory Results: X-rays show 3 consecutive vertebrae with > 5 degrees of anterior wedging and Schmorl''s nodes.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Scheuermann''s kyphosis in a 16-year-old.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic criteria (Sorenson''s) for Scheuermann''s disease?', '["One wedged vertebra", "At least 3 consecutive vertebrae with at least 5 degrees of anterior wedging each", "Being very tall", "None"]', 1, 'This wedging leads to a rigid, structural kyphosis.'),
    (v_case_id, 'What are "Schmorl''s Nodes"?', '["Bony tumors", "Herniation of the intervertebral disc into the vertebral body endplate", "A type of fracture", "None"]', 1, 'These are common radiographic findings in Scheuermann''s.'),
    (v_case_id, 'Initial treatment for Scheuermann''s kyphosis with a curve < 60-70 degrees:', '["Immediate surgery", "Physical therapy and bracing if immature", "Observation only", "None"]', 1, 'Bracing can be effective if the patient has remaining growth.');

    ---------------------------------------------------------------------------
    -- CASE 37: Spondylolysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scotty Dog' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scotty Dog', 'A 15-year-old female gymnast presents with low back pain that is worse with hyperextension.

Vitals: Stable.
Physical Examination: Focal tenderness over the L5 spinous process.
Laboratory Results: Oblique X-rays show a "collar" on the "Scotty Dog" (a defect in the pars interarticularis).', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spondylolysis in a 15-year-old gymnast.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Spondylolysis"?', '["A herniated disc", "A stress fracture or defect in the pars interarticularis (most common at L5)", "A spinal tumor", "None"]', 1, 'It is very common in athletes who perform repetitive spinal hyperextension.'),
    (v_case_id, 'Which radiographic view is best for visualizing the "Scotty Dog" neck?', '["AP view", "Lateral view", "Oblique view", "None"]', 2, 'The pars interarticularis forms the neck of the scotty dog.'),
    (v_case_id, 'Initial management for symptomatic spondylolysis:', '["Spinal fusion", "Activity modification (rest from sports), bracing (occasionally), and core strengthening", "Bed rest", "None"]', 1, 'Most athletes can return to sports after a period of rest and rehab.');

    ---------------------------------------------------------------------------
    -- CASE 38: Spondylolisthesis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spinal Slip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spinal Slip', 'A 14-year-old presents with back pain and "tight hamstrings."

Vitals: Stable.
Physical Examination: A "step-off" is palpable in the lumbar spine. Positive "Phalen-Dickson" sign (knee-flexed, hip-flexed gait).
Laboratory Results: Lateral X-ray shows L5 has slipped forward on S1 by 40%.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Grade II isthmic spondylolisthesis at L5-S1.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Spondylolisthesis"?', '["A broken rib", "Forward translation (slipping) of one vertebra relative to the one below it", "A twisted spine", "None"]', 1, 'It often follows bilateral spondylolysis.'),
    (v_case_id, 'How is "Grade II" spondylolisthesis defined in the Meyerding classification?', '["0-25% slip", "26-50% slip", "51-75% slip", "76-100% slip"]', 1, 'Grades I and II are low-grade; III, IV, and V are high-grade.'),
    (v_case_id, 'True or False: Tight hamstrings are a classic physical exam finding in children with spondylolisthesis.', '["True", "False"]', 0, 'This is a very common compensatory mechanism.');

    ---------------------------------------------------------------------------
    -- CASE 39: Congenital Muscular Torticollis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tilted Head' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tilted Head', 'A 3-week-old infant is brought in because her head is always tilted to the right and her chin is turned to the left.

Vitals: Stable.
Physical Examination: A firm, non-tender "olive-shaped" mass is felt within the right sternocleidomastoid (SCM) muscle.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital muscular torticollis with an SCM "pseudotumor."', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of torticollis in a neonate?', '["Brain tumor", "Congenital Muscular Torticollis (fibrosis of the SCM muscle)", "Vision problems", "None"]', 1, 'It is thought to be related to intrauterine positioning or birth trauma.'),
    (v_case_id, 'Initial management for Congenital Muscular Torticollis:', '["Immediate surgery", "Stretching exercises and repositioning", "Casting", "None"]', 1, '> 90% of cases resolve with a diligent stretching program within the first year.'),
    (v_case_id, 'True or False: Infants with torticollis should also be screened for Developmental Dysplasia of the Hip (DDH).', '["True", "False"]', 0, 'There is a known association (approx 5-10%) between torticollis and DDH ("packaging" defects).');

    ---------------------------------------------------------------------------
    -- CASE 40: Klippel-Feil Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Short Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Short Neck', 'A 7-year-old boy presents with a "short neck" and limited ability to turn his head.

Vitals: Stable.
Physical Examination: Classic triad: low posterior hairline, short neck, and limited cervical range of motion.
Laboratory Results: X-rays show congenital fusion of several cervical vertebrae.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Klippel-Feil syndrome; cervical vertebral fusion.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Klippel-Feil Syndrome?', '["A type of muscle weakness", "Congenital fusion of at least two cervical vertebrae", "A bone infection", "None"]', 1, 'It is due to failure of normal segmentation of cervical somites.'),
    (v_case_id, 'What is "Sprengel''s Deformity," which is often seen in Klippel-Feil syndrome?', '["A missing rib", "Congenital undescended (high-riding) scapula", "A twisted foot", "None"]', 1, 'The scapula fails to descend from its embryonic position in the neck.'),
    (v_case_id, 'True or False: Renal and cardiac anomalies are common in Klippel-Feil syndrome.', '["True", "False"]', 0, 'Like other congenital spinal anomalies, multi-system screening is required.');

    ---------------------------------------------------------------------------
    -- CASE 41: Osteogenesis Imperfecta (OI)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fragile Bones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fragile Bones', 'A 4-year-old girl presents with her third long-bone fracture in two years.

Vitals: Stable.
Physical Examination: Blue sclerae are noted. She has significant ligamentous laxity and hearing loss.
Laboratory Results: X-rays show generalized osteopenia and thin cortices.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Osteogenesis Imperfecta Type I; blue sclerae and multiple fractures.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying molecular defect in most cases of OI?', '["Defect in Type II collagen", "Defect in Type I collagen (COL1A1 or COL1A2 genes)", "Defect in Vitamin D receptors", "None"]', 1, 'Type I collagen is the primary structural protein in bone.'),
    (v_case_id, 'Which type of OI is the most common and generally the mildest form?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Type I is autosomal dominant and characterized by blue sclerae and fractures but relatively normal stature.'),
    (v_case_id, 'True or False: Bisphosphonates are often used to increase bone density and reduce fracture rates in children with OI.', '["True", "False"]', 0, 'Pamidronate or Zoledronate infusions are standard of care for moderate-to-severe OI.');

    ---------------------------------------------------------------------------
    -- CASE 42: Achondroplasia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Short Stature' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Short Stature', 'A child presents with disproportionate short stature, a prominent forehead (frontal bossing), and a depressed nasal bridge.

Vitals: Stable.
Physical Examination: Rhizomelic (proximal) shortening of the limbs. Trident hands (increased space between the third and fourth fingers).', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Achondroplasia; rhizomelic shortening and FGFR3 mutation.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the genetic mutation responsible for Achondroplasia?', '["GNAS", "FGFR3 (gain-of-function mutation)", "COL2A1", "None"]', 1, 'Fibroblast Growth Factor Receptor 3 mutation leads to inhibited chondrocyte proliferation in the growth plate.'),
    (v_case_id, 'What is a life-threatening neurological complication that can occur in infants with achondroplasia?', '["Hydrocephalus", "Foramen magnum stenosis (leading to sleep apnea or sudden death)", "Peripheral neuropathy", "None"]', 1, 'The narrow foramen magnum can compress the brainstem/cervical cord.'),
    (v_case_id, 'True or False: Spinal stenosis is extremely common in adults with achondroplasia.', '["True", "False"]', 0, 'Narrowed interpedicular distances lead to symptomatic lumbar stenosis in most patients by mid-adulthood.');

    ---------------------------------------------------------------------------
    -- CASE 43: Non-Accidental Heat Injury (Child Abuse)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Suspicious Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Suspicious Fracture', 'A 6-month-old infant is brought to the ER with a swollen leg. The caregiver says the child "caught her leg in the crib."

Vitals: Stable.
Physical Examination: Bruising of various ages on the trunk.
Laboratory Results: X-rays show a "metaphyseal corner fracture" of the distal femur and healing rib fractures.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Suspected child abuse; metaphyseal corner fracture and rib fractures.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following fractures is HIGHLY specific for non-accidental trauma in an infant?', '["Clavicle fracture", "Metaphyseal corner (bucket-handle) fracture", "Torus fracture of the radius", "Toddler''s fracture"]', 1, 'These are caused by violent shearing/tugging of the limb.'),
    (v_case_id, 'True or False: A femur fracture in a child who is not yet walking is a major red flag for child abuse.', '["True", "False"]', 0, 'Non-ambulatory children rarely sustain high-energy fractures from normal household accidents.'),
    (v_case_id, 'What is the mandatory next step for a physician who suspects child abuse?', '["Wait for the parents to confess", "Immediate report to Child Protective Services (CPS) / social services", "Call the police directly", "None"]', 1, 'Physicians are "mandated reporters" of suspected abuse.');

    ---------------------------------------------------------------------------
    -- CASE 44: Nutritional Rickets
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Soft Bones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Soft Bones', 'An 18-month-old boy, exclusively breastfed without Vitamin D supplementation, presents with bowed legs and delayed walking.

Vitals: Stable.
Physical Examination: "Rachitic rosary" (palpable nodules at the costochondral junctions) and widening of the wrists.
Laboratory Results: Low Calcium, Low Phosphorus, High Alkaline Phosphatase, and Low 25-hydroxy Vitamin D.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nutritional Rickets due to Vitamin D deficiency.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic radiographic finding in active rickets?', '["Pencil-point bones", "Fraying, cupping, and widening of the metaphysis", "Sclerotic lines", "None"]', 1, 'This is most easily seen at the wrists and knees (areas of rapid growth).'),
    (v_case_id, 'What is the "Rachitic Rosary"?', '["A type of jewelry", "Enlargement of the costochondral junctions due to expansion of the growth plate", "A skin rash", "None"]', 1, 'It is a classic physical exam finding of rickets.'),
    (v_case_id, 'True or False: Vitamin D supplementation for exclusively breastfed infants is recommended to prevent rickets.', '["True", "False"]', 0, 'Breast milk is naturally low in Vitamin D.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vitamin D Resistant Rickets (XLH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Inherited Bowing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Inherited Bowing', 'A 5-year-old child presents with severe bowing. Her 25-hydroxy Vitamin D levels are normal, but she has persistently low serum phosphorus.

Vitals: Stable.
Laboratory Results: High Alkaline Phosphatase, Low Phosphorus, and Low 1,25-dihydroxy Vitamin D.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'X-linked hypophosphatemic rickets; PHEX mutation.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common form of heritable rickets?', '["Type I OI", "X-linked hypophosphatemic rickets (XLH)", "Achondroplasia", "None"]', 1, 'It is caused by a mutation in the PHEX gene leading to phosphate wasting in the kidneys.'),
    (v_case_id, 'How is XLH typically treated?', '["Vitamin D alone", "Oral phosphorus and high-dose calcitriol (1,25-OH2 Vitamin D)", "Surgical drainage", "None"]', 1, 'The goal is to normalize phosphate levels and promote mineralization.'),
    (v_case_id, 'True or False: Deformities in XLH often require multiple surgical osteotomies if medical management is not optimized.', '["True", "False"]', 0, 'Aggressive medical management is key to minimizing the need for surgery.');

    ---------------------------------------------------------------------------
    -- CASE 46: Cerebral Palsy (CP) - General
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tight Muscles' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tight Muscles', 'A 4-year-old child, born prematurely, presents with difficulty walking and "toe-walking."

Vitals: Stable.
Physical Examination: Increased muscle tone (spasticity) in both lower extremities. Hyperreflexia and a positive Babinski sign are present.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spastic diplegic Cerebral Palsy in a 4-year-old.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary definition of Cerebral Palsy?', '["A progressive muscle disease", "A non-progressive permanent disorder of movement and posture due to a brain injury in the developing fetus or infant", "A bone tumor", "None"]', 1, 'While the brain injury is non-progressive, the orthopedic manifestations (contractures, scoliosis) can be progressive.'),
    (v_case_id, 'What is the "GMFCS" classification used for in CP?', '["To measure height", "To categorize gross motor function and level of mobility (Level I is walking, Level V is wheelchair dependent)", "To test for a virus", "None"]', 1, 'GMFCS levels provide a standardized way to describe a child''s functional status.'),
    (v_case_id, 'Which surgical procedure involves cutting specific sensory nerve roots in the spinal cord to reduce spasticity in CP?', '["Tendon lengthening", "Selective Dorsal Rhizotomy (SDR)", "Spinal fusion", "None"]', 1, 'SDR is an effective treatment for reducing spasticity in carefully selected patients.');

    ---------------------------------------------------------------------------
    -- CASE 47: CP - Hip Subluxation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Migrating Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Migrating Hip', 'A 6-year-old with spastic quadriplegic CP (GMFCS V) is brought in for an annual hip screening.

Vitals: Stable.
Physical Examination: Limited hip abduction (only 15 degrees bilaterally).
Laboratory Results: X-rays show a Reimers migration index of 45% on the right.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'CP-related hip subluxation; Reimer''s migration index > 30%.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Reimers Migration Index"?', '["A measure of spinal curvature", "The percentage of the femoral head that lies lateral to Perkins line (outside the acrobatics)", "A type of gait analysis", "None"]', 1, 'A migration index > 30% indicates hip subluxation.'),
    (v_case_id, 'Why is hip subluxation common in children with non-ambulatory CP?', '["Due to excessive weight", "Muscle imbalances (strong adductors/flexors vs. weak abductors/extensors) pulling the hip out of the socket", "Lack of vitamins", "None"]', 1, 'Spasticity of the adductors and iliopsoas is the main driver.'),
    (v_case_id, 'At what Migration Index threshold is preventive surgery (e.g., adductor release or bony realignment) usually considered?', '["10%", "30-40%", "90%", "None"]', 1, 'Early intervention prevents the painful dislocation that occurs at 100% migration.');

    ---------------------------------------------------------------------------
    -- CASE 48: Down Syndrome (Trisomy 21) - Ortho
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unstable Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unstable Neck', 'An 8-year-old with Down syndrome presents for a sports physical. He wants to participate in the Special Olympics.

Vitals: Stable.
Laboratory Results: Lateral X-rays of the cervical spine in flexion show an Atlanto-Dens Interval (ADI) of 6 mm.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Atlantoaxial instability in a child with Down syndrome.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cervical spine abnormality in Down syndrome?', '["Scoliosis", "Atlantoaxial instability (due to laxity of the transverse ligament)", "Fractures", "None"]', 1, 'Up to 15-30% of patients with Down syndrome have AAI.'),
    (v_case_id, 'What is a "Normal" ADI in children?', '["< 5 mm", "< 10 mm", "> 20 mm", "None"]', 0, 'An ADI > 5 mm in a child is considered unstable.'),
    (v_case_id, 'Symptoms of symptomatic atlantoaxial instability include:', '["Sudden onset of gait changes or weakness", "Loss of bowel or bladder control", "Neck pain or torticollis", "All of the above"]', 3, 'These are signs of spinal cord compression and require urgent evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 49: Arthrogryposis Multiplex Congenita (AMC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fixed Joints' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fixed Joints', 'A newborn presents with multiple joint contractures in all four extremities. The joints are fixed and lack active or passive range of motion.

Vitals: Stable.
Physical Examination: Featureless limbs (no skin creases over joints). Internal rotation of the shoulders, extension of the elbows, and flexion of the wrists ("waiter''s tip" position). Bilateral clubfoot and DDH are present.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Arthrogryposis multiplex congenita; multiple fixed contractures.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark of Arthrogryposis?', '["Progressive muscle weakness", "Multiple non-progressive congenital joint contractures", "Bone tumors", "None"]', 1, 'It is caused by decreased fetal movement (akinesia) in utero.'),
    (v_case_id, 'True or False: Cognition is usually normal in most children with AMC.', '["True", "False"]', 0, 'Most forms of AMC do not affect the brain or intelligence.'),
    (v_case_id, 'The primary goal of orthopedic surgery in AMC is:', '["To make the joints move like normal", "To place the limbs in more functional positions for ADLs (e.g., getting hands to the mouth)", "To stop the disease", "None"]', 1, 'Surgery aims to optimize position and function, even if the joints remain stiff.');

    ---------------------------------------------------------------------------
    -- CASE 50: Multiple Hereditary Exostoses (MHE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bumpy Bones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bumpy Bones', 'A 10-year-old boy presents with multiple hard, non-tender bumps near his knees and ankles. His father has similar bumps.

Vitals: Stable.
Laboratory Results: X-rays show multiple pedunculated and sessile osteochondromas (bone spurs) arising from the metaphyses.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Multiple Hereditary Exostoses; EXT1/EXT2 mutation.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which genes are typically mutated in MHE?', '["TP53", "EXT1 or EXT2", "RB1", "None"]', 1, 'These genes are involved in heparan sulfate synthesis.'),
    (v_case_id, 'What is the most concerning long-term complication of MHE?', '["Fractures", "Malignant transformation of an osteochondroma into a secondary Chondrosarcoma (risk ~1-5%)", "Infection", "None"]', 1, 'Sudden growth or pain in an exostosis after skeletal maturity is a major red flag.'),
    (v_case_id, 'True or False: MHE often results in short stature and forearm deformities (e.g., ulnar deviation).', '["True", "False"]', 0, 'The exostoses disrupt the normal growth of the physes, leading to characteristic deformities.');

END $$;

COMMIT;
