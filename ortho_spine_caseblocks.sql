-- Orthopedics: Spine disorders — disc herniation, stenosis, scoliosis
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-spine

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-spine' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-spine';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Cervical Radiculopathy (C6)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Biceps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Biceps', 'A 42-year-old male presents with neck pain and radiation into his right thumb and index finger.

Vitals: Stable.
Physical Examination: Weakness in biceps (4/5) and wrist extension (4/5). Diminished biceps reflex (1+). Sensation is decreased over the lateral forearm and thumb.
Laboratory Results: MRI shows a disc herniation at the C5-C6 level.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old has neck pain radiating to the thumb; weak biceps and wrist extension, and diminished biceps reflex.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve root is most likely affected in this patient?', '["C5", "C6", "C7", "C8"]', 1, 'C6 radiculopathy typically involves the biceps (motor), wrist extension (motor), and sensation over the thumb/index finger. The biceps reflex is also mediated by C6.'),
    (v_case_id, 'Which orthopedic test involves extending and rotating the neck toward the painful side to reproduce symptoms?', '["Lhermitte''s sign", "Spurling''s test", "Hoffman''s sign", "Phalen''s test"]', 1, 'Spurling''s test is highly specific for cervical radiculopathy; it narrows the neural foramen and compresses the nerve root.'),
    (v_case_id, 'What is the first-line treatment for a patient with cervical radiculopathy and NO progressive neurological deficit?', '["Immediate anterior cervical discectomy and fusion (ACDF)", "Physical therapy and NSAIDs", "Cervical traction only", "Chronic opioid therapy"]', 1, 'Over 90% of cervical radiculopathies improve with conservative management over 6-12 weeks.');

    ---------------------------------------------------------------------------
    -- CASE 02: Cervical Radiculopathy (C7)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Triceps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Triceps', 'A 50-year-old woman complains of pain radiating down the back of her arm into the middle finger.

Vitals: Stable.
Physical Examination: Weakness in triceps (4/5) and finger extension (4/5). Diminished triceps reflex (1+).
Laboratory Results: MRI shows a posterolateral disc herniation at C6-C7.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old with C7 radiculopathy; weak triceps and finger extension, diminished triceps reflex.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve root is most likely affected?', '["C5", "C6", "C7", "C8"]', 2, 'C7 is the most commonly affected nerve root in the cervical spine. It controls the triceps, wrist flexion, and finger extension, and mediates the triceps reflex.'),
    (v_case_id, 'In the cervical spine, the C7 nerve root exits:', '["Above the C7 vertebra", "Below the C7 vertebra", "Between C4 and C5", "Between T1 and T2"]', 0, 'Cervical nerve roots C1-C7 exit ABOVE their corresponding vertebrae. C8 exits between C7 and T1. From T1 down, roots exit below.'),
    (v_case_id, 'True or False: Most patients with C7 radiculopathy will have numbness in the little finger.', '["True", "False"]', 1, 'C7 typically affects the middle finger. The little finger is C8 territory.');

    ---------------------------------------------------------------------------
    -- CASE 03: Cervical Spondylotic Myelopathy (CSM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clumsy Hands' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clumsy Hands', 'A 68-year-old male presents with difficulty buttoning his shirt and frequent tripping. He denies neck pain.

Vitals: Stable.
Physical Examination: Hyperreflexia in all four limbs (3+); positive Hoffman''s sign; wide-based, unstable gait.
Laboratory Results: MRI shows significant spinal canal narrowing at C4-C5 and C5-C6 with intramedullary T2 hyperintensity.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old has hyperreflexia, Hoffman''s sign, and gait instability; MRI shows cord compression.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cervical Radiculopathy", "Cervical Spondylotic Myelopathy (CSM)", "Multiple Sclerosis", "Carpal Tunnel Syndrome"]', 1, 'The presence of Upper Motor Neuron (UMN) signs (hyperreflexia, Hoffman''s) and gait changes indicates spinal cord compression (myelopathy) rather than just nerve root compression.'),
    (v_case_id, 'A positive Hoffman''s sign is elicited by:', '["Stroking the sole of the foot", "Flicking the nail of the middle finger, resulting in flexion of the thumb and index finger", "Extending the neck", "Percussing the wrist"]', 1, 'Hoffman''s is a classic UMN sign of the upper extremity, suggesting cervical cord compression.'),
    (v_case_id, 'What is the natural history of Cervical Spondylotic Myelopathy?', '["Rapid spontaneous recovery", "Step-wise progression with episodes of stable plateau", "Complete resolution with NSAIDs", "It never gets worse"]', 1, 'CSM typically follows a step-wise decline. Once symptoms are present, surgical decompression is often recommended to prevent further permanent cord damage.');

    ---------------------------------------------------------------------------
    -- CASE 04: Myelopathy - Physical Exam Signs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sensation of Electricity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sensation of Electricity', 'A patient reports a \"shock-like\" sensation traveling down his spine and into his arms when he flexes his neck forward.

Vitals: Stable.
Physical Examination: Normal strength; symmetric reflexes.
Laboratory Results: MRI shows mild stenosis at C5-C6.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Patient has an electric shock sensation down the spine with neck flexion.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This sensation is known as:', '["Spurling''s sign", "Lhermitte''s sign", "Babinski sign", "Tinel''s sign"]', 1, 'Lhermitte''s sign is an \"electric\" sensation with neck flexion, indicating irritation of the cervical cord (e.g., from stenosis or MS).'),
    (v_case_id, 'Which of the following is an UMN sign seen in the lower extremity in a patient with cervical myelopathy?', '["Decreased patellar reflex", "Babinski reflex (extensor plantar response)", "Atrophy of the calves", "Hypotonia"]', 1, 'Myelopathy is a central nervous system injury, leading to UMN signs below the level of compression (Hyperreflexia, Babinski, Clonus).'),
    (v_case_id, 'The \"Nurick scale\" is used to classify:', '["Degree of hand pain", "The severity of myelopathy based on gait and disability", "Cervical range of motion", "Scoliosis degree"]', 1, 'The Nurick scale focuses on the patient''s ability to walk and work, ranging from Grade 0 (neck pain only) to Grade 5 (bedbound).');

    ---------------------------------------------------------------------------
    -- CASE 05: OPLL (Ossification of the Posterior Longitudinal Ligament)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Calcified Ligament' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Calcified Ligament', 'A 55-year-old male of East Asian descent presents with progressive hand weakness. CT scan shows a dense, ossified band behind the vertebral bodies from C3 to C6.

Vitals: Stable.
Physical Examination: Intrinsic hand muscle wasting; clonus in the ankles.
Laboratory Results: CT shows significant ossification of the PLL.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old with hand weakness; CT shows ossified band (OPLL) from C3-C6.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Disc herniation", "Ossification of the Posterior Longitudinal Ligament (OPLL)", "Spondylolisthesis", "Spinal tumor"]', 1, 'OPLL is more common in East Asian populations and causes severe canal stenosis by calcifying the ligament that sits directly behind the vertebral bodies.'),
    (v_case_id, 'Which imaging modality is the MOST sensitive for diagnosing and characterizing the extent of OPLL?', '["MRI", "CT Scan", "X-ray", "Ultrasound"]', 1, 'While MRI shows the cord compression, CT is much better for visualizing the actual ossified/calcified ligament.'),
    (v_case_id, 'True or False: Minor trauma in a patient with OPLL can lead to catastrophic spinal cord injury.', '["True", "False"]', 0, 'Because the canal is already severely narrowed and rigid, even a minor \"whiplash\" can cause the cord to impact the ossified ligament.');

    ---------------------------------------------------------------------------
    -- CASE 06: Rheumatoid Arthritis - C-Spine
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unstable Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unstable Neck', 'A 60-year-old woman with a 20-year history of severe Rheumatoid Arthritis (RA) is scheduled for elective hip surgery.

Vitals: Stable.
Physical Examination: Severe swan-neck deformities of fingers.
Laboratory Results: Lateral X-rays of the C-spine in flexion and extension show an Atlanto-Dens Interval (ADI) of 8 mm.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An RA patient has a flexion-extension X-ray showing an 8 mm Atlanto-Dens Interval.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of an ADI > 3.5 mm in an adult?', '["Normal variant", "Atlantoaxial instability due to transverse ligament laxity", "Cervical stenosis", "Torticollis"]', 1, 'In RA, chronic inflammation (pannus) destroys the transverse ligament, leading to C1-C2 instability.'),
    (v_case_id, 'Why is pre-operative C-spine screening critical for this RA patient?', '["To check for arthritis in the jaw", "Risk of quadriparesis or death during intubation due to atlantoaxial subluxation", "To check for osteoporosis", "No reason"]', 1, 'During anesthesia induction and intubation, the neck is often manipulated; an unstable C1-C2 can compress the cord.'),
    (v_case_id, 'A SAC (Space Available for the Cord) of less than ______ mm is a strong indication for surgical fusion.', '["20 mm", "14 mm", "10 mm", "30 mm"]', 1, 'SAC < 14 mm is highly associated with myelopathy and indicates that the canal is dangerously narrowed.');

    ---------------------------------------------------------------------------
    -- CASE 07: Rheumatoid Arthritis - Basilar Invagination
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cranial Settling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cranial Settling', 'The same RA patient now reports dysarthria (difficulty speaking) and a sensation of her head being \"too heavy\".

Vitals: Stable.
Physical Examination: Down-beating nystagmus.
Laboratory Results: MRI shows the tip of the dens is 8 mm above McGregor''s line.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An RA patient has dysarthria and nystagmus; dens is 8 mm above McGregor''s line.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Atlantoaxial subluxation", "Basilar invagination (Cranial settling)", "Subaxial subluxation", "Jefferson fracture"]', 1, 'In severe RA, the lateral masses of C1 collapse, allowing the dens to \"settle\" upward into the foramen magnum, compressing the brainstem.'),
    (v_case_id, 'Which of the following is a classic neurological sign of basilar invagination?', '["Wrist drop", "Down-beating nystagmus", "Foot drop", "Loss of smell"]', 1, 'Brainstem compression often manifests as cranial nerve palsies or nystagmus.'),
    (v_case_id, 'True or False: This condition is generally managed with a soft cervical collar.', '["True", "False"]', 1, 'Basilar invagination is a life-threatening condition that requires surgical stabilization and often decompression.');

    ---------------------------------------------------------------------------
    -- CASE 08: Cervical Spondylosis - Anatomy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Degenerative Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Degenerative Changes', 'A 55-year-old with chronic neck pain. X-rays show osteophytes at the joints of Luschka.

Vitals: Stable.
Physical Examination: Pain with lateral bending and rotation.
Laboratory Results: Osteophytes and disc space narrowing.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'X-rays show osteophytes at the joints of Luschka in a 55-year-old.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The \"Joints of Luschka\" are also known as:', '["Facet joints", "Uncovertebral joints", "Intervertebral discs", "SI joints"]', 1, 'Uncovertebral joints are unique to the cervical spine (C3-C7) and are a common site for osteophyte formation that can cause foraminal stenosis.'),
    (v_case_id, 'What is the most common level for degenerative cervical spondylosis?', '["C1-C2", "C2-C3", "C5-C6", "C7-T1"]', 2, 'C5-C6 and C6-C7 are the most mobile segments and undergo the most wear and tear.'),
    (v_case_id, 'Cervical stenosis is defined as a sagittal canal diameter of less than:', '["20 mm", "17 mm", "13 mm", "25 mm"]', 2, 'A diameter < 13 mm is considered stenotic; < 10 mm is highly predictive of myelopathy.');

    ---------------------------------------------------------------------------
    -- CASE 09: Cervical Myelopathy - Surgery
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Choosing the Approach' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Choosing the Approach', 'A patient with 3-level cervical stenosis and preserved cervical lordosis needs decompression.

Vitals: Stable.
Physical Examination: Myelopathic signs present.
Laboratory Results: MRI shows 3-level compression.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Patient with 3-level stenosis and preserved lordosis needs decompression.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which surgical approach involves making an incision in the front of the neck?', '["Laminectomy", "ACDF (Anterior Cervical Discectomy and Fusion)", "Laminoplasty", "Foraminotomy"]', 1, 'ACDF is the most common anterior procedure.'),
    (v_case_id, 'A \"Laminoplasty\" is a posterior procedure that aims to:', '["Remove the entire vertebral body", "Increase the canal volume without fusing the segments", "Fix a fracture", "Replace a disc"]', 1, 'Laminoplasty \"hinges\" the lamina open to create more space for the cord while maintaining some motion and stability.'),
    (v_case_id, 'What is a major contraindication to a POSTERIOR-only decompression (like laminectomy) in a patient with myelopathy?', '["Kyphosis (forward curvature of the neck)", "Lordosis", "Age > 60", "Smoking"]', 0, 'If the neck is in kyphosis, the cord remains draped over the anterior osteophytes even after the back is opened; anterior decompression or deformity correction is required.');

    ---------------------------------------------------------------------------
    -- CASE 10: Parsonage-Turner Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Shoulder Weakness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Shoulder Weakness', 'A 30-year-old male woke up with severe, excruciating shoulder pain 2 weeks ago. The pain has now subsided, but he is unable to lift his arm.

Vitals: Stable.
Physical Examination: Severe atrophy of the deltoid and supraspinatus; profound weakness (2/5) in shoulder abduction.
Laboratory Results: MRI of the C-spine is normal.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old with sudden shoulder pain followed by weakness and atrophy; C-spine MRI is normal.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["C5 radiculopathy", "Parsonage-Turner Syndrome (Neuralgic Amyotrophy)", "Rotator cuff tear", "Shoulder dislocation"]', 1, 'Parsonage-Turner is an idiopathic brachial plexitis. It characteristically starts with intense pain followed by rapid weakness and muscle atrophy as the pain fades.'),
    (v_case_id, 'How does this differ from C5 radiculopathy on MRI?', '["Radiculopathy shows a disc herniation; Parsonage-Turner shows a normal spine", "Parsonage-Turner has higher reflexes", "There is no difference", "Parsonage-Turner always involves the legs"]', 0, 'The normal MRI is a key clue that the problem is in the peripheral nerves/plexus rather than the spine.'),
    (v_case_id, 'What is the prognosis for Parsonage-Turner syndrome?', '["Permanent paralysis", "Most patients have a slow but significant recovery over 1-3 years", "Immediate recovery with steroids", "Needs surgery"]', 1, 'Recovery is generally good but can be very slow.');

    ---------------------------------------------------------------------------
    -- CASE 11: Adolescent Idiopathic Scoliosis (AIS) - Diagnosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Uneven Shoulders' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Uneven Shoulders', 'A 13-year-old girl is brought in by her mother because her clothes seem to "hang crooked."

Vitals: Stable.
Physical Examination: Right rib hump becomes prominent when the patient bends forward. Left shoulder is slightly lower than the right. Neurological exam is normal.
Laboratory Results: X-rays are ordered.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 13-year-old girl with a right rib hump and uneven shoulders.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most sensitive screening test for scoliosis?', '["MRI", "Adams Forward Bend Test", "Straight leg raise", "Trendelenburg test"]', 1, 'Forward bending emphasizes the rotational component of scoliosis, making the rib hump more visible.'),
    (v_case_id, 'Scoliosis is defined as a lateral curvature of the spine with a Cobb angle of at least:', '["5 degrees", "10 degrees", "20 degrees", "45 degrees"]', 1, 'A curve < 10 degrees is considered spinal asymmetry, not true scoliosis.'),
    (v_case_id, 'The rib hump in scoliosis is caused by:', '["One lung being larger than the other", "Rotational component of the vertebrae", "Muscle hypertrophy", "Rib fractures"]', 1, 'Scoliosis is a 3D deformity; as the vertebrae rotate, the attached ribs are pushed posteriorly on the convex side.');

    ---------------------------------------------------------------------------
    -- CASE 12: AIS - Cobb Angle and Skeletal Maturity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Assessing Maturity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Assessing Maturity', 'A 12-year-old pre-menarchal girl has a 25-degree right thoracic curve. 

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: X-ray shows the iliac apophysis is barely visible (Risser 0).', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old pre-menarchal girl with a 25-degree curve and Risser 0.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of "Risser 0" and "pre-menarchal" status?', '["Low risk of curve progression", "High risk of curve progression", "Indicates the patient is finished growing", "No significance"]', 1, 'Risser 0 indicates significant growth potential remains, which is the #1 risk factor for curve progression in AIS.'),
    (v_case_id, 'The Risser classification measures the ossification of which bone?', '["Pubis", "Iliac apophysis", "Clavicle", "Femur"]', 1, 'The apophysis starts laterally and moves medially across the iliac crest (Stages 1-4); Stage 5 is full fusion.'),
    (v_case_id, 'For a patient with a 25-degree curve and significant growth remaining, what is the standard of care?', '["Observation every 6 months", "Bracing (e.g., TLSO)", "Surgical fusion", "Intensive physical therapy alone"]', 1, 'Curves between 25 and 45 degrees in a skeletally immature patient require bracing to prevent further progression.');

    ---------------------------------------------------------------------------
    -- CASE 13: AIS - Surgical Thresholds
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Severe Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Severe Curve', 'A 15-year-old girl (Risser 4) has a 55-degree thoracic curve that has progressed despite bracing.

Vitals: Stable.
Physical Examination: Visible trunk shift.
Laboratory Results: 55-degree Cobb angle.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl with a 55-degree curve despite bracing.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the generally accepted threshold for recommending surgery (posterior spinal fusion) in AIS?', '["20 degrees", "30 degrees", "> 45-50 degrees", "Surgery is never needed"]', 2, 'Curves over 50 degrees tend to continue progressing even after skeletal maturity is reached.'),
    (v_case_id, 'What is the primary goal of surgery in AIS?', '["To make the patient taller", "To prevent further progression and balance the trunk", "To cure back pain", "To improve lung capacity in minor curves"]', 1, 'Surgery is about stabilization and balance, not necessarily "perfect" straightening.'),
    (v_case_id, 'Which of the following is a potential risk of surgery for a curve in the lower lumbar spine?', '["Loss of spinal flexibility and increased risk of adjacent segment disease", "Improving posture", "Becoming taller", "None"]', 0, 'Fusing into the lower lumbar spine (L3-L4-L5) significantly reduces trunk mobility.');

    ---------------------------------------------------------------------------
    -- CASE 14: Congenital Scoliosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Born with a Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Born with a Curve', 'A 2-year-old boy is found to have a severe thoracic curve. X-rays show a half-formed vertebra (hemivertebra) at T8.

Vitals: Stable.
Physical Examination: No skin lesions over the spine.
Laboratory Results: Hemivertebra present.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-year-old with a hemivertebra and congenital scoliosis.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Congenital scoliosis is caused by:', '["Bad posture", "Failure of formation or failure of segmentation during development", "Muscle weakness", "Infection"]', 1, 'Hemivertebrae (failure of formation) and bars (failure of segmentation) cause rapid, asymmetric growth.'),
    (v_case_id, 'What is the most important screening tool for a child with congenital scoliosis to rule out associated anomalies?', '["MRI of the whole spine and renal ultrasound", "Blood tests for calcium", "EKG only", "Eye exam"]', 0, 'Congenital spine defects are frequently associated with neural tube defects (MRI) and urogenital anomalies (Ultrasound) - "VACTERL" association.'),
    (v_case_id, 'True or False: Congenital scoliosis usually responds well to bracing.', '["True", "False"]', 1, 'Unlike AIS, congenital scoliosis is caused by structural bone anomalies and rarely responds to bracing; surgery is often needed early.');

    ---------------------------------------------------------------------------
    -- CASE 15: Neuromuscular Scoliosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cerebral Palsy and Spine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cerebral Palsy and Spine', 'A 10-year-old boy with spastic quadriplegic Cerebral Palsy presents with a long, C-shaped curve and significant pelvic obliquity. He is having difficulty sitting in his wheelchair.

Vitals: Stable.
Physical Examination: Non-ambulatory; severe trunk lean.
Laboratory Results: X-ray shows a 70-degree curve extending into the pelvis.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old with Cerebral Palsy and a 70-degree C-shaped curve.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the curve in neuromuscular scoliosis typically differ from AIS?', '["It is usually a shorter curve", "It is often a long, C-shaped curve that involves the pelvis", "It never progresses after maturity", "It is less severe"]', 1, 'Neuromuscular curves are long, involve the pelvis (causing obliquity), and continue to progress throughout life.'),
    (v_case_id, 'What is the primary goal of surgical fusion in a non-ambulatory CP patient?', '["To help them walk", "To provide a level pelvis for balanced sitting and prevent pressure sores", "To improve speech", "To fix cosmetic appearance only"]', 1, 'Sitting balance and skin protection are the key functional goals.'),
    (v_case_id, 'True or False: Neuromuscular scoliosis has a much higher rate of surgical complications than AIS.', '["True", "False"]', 0, 'Higher rates of infection, respiratory issues, and blood loss are seen in these complex patients.');

    ---------------------------------------------------------------------------
    -- CASE 16: Scheuermann''s Kyphosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Round Back' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Round Back', 'A 16-year-old male is brought in for "poor posture." He has middle back pain that worsens with activity.

Vitals: Stable.
Physical Examination: Fixed, sharp thoracic kyphosis that does not flatten when he tries to stand straight or bend forward.
Laboratory Results: Lateral X-ray shows 3 consecutive vertebrae with > 5 degrees of anterior wedging.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old with fixed thoracic kyphosis and anterior vertebral wedging.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Postural kyphosis", "Scheuermann''s Kyphosis", "Ankylosing Spondylitis", "Compression fracture"]', 1, 'Scheuermann''s is defined by fixed kyphosis and Sorensen''s criteria (>5 deg wedging across 3 vertebrae).'),
    (v_case_id, 'What radiologic feature is commonly seen on the endplates of vertebrae in this condition?', '["Schmorl''s nodes (herniation of disc into bone)", "Osteophytes", "Spondylolysis", "Burst fracture"]', 0, 'Schmorl''s nodes and irregular endplates are hallmark features of Scheuermann''s disease.'),
    (v_case_id, 'True or False: Unlike postural kyphosis, Scheuermann''s cannot be voluntarily corrected by the patient.', '["True", "False"]', 0, 'It is a rigid, structural deformity.');

    ---------------------------------------------------------------------------
    -- CASE 17: SMA Syndrome Post-Scoliosis Surgery
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-op Vomiting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-op Vomiting', 'A patient 3 days post-posterior spinal fusion for a 60-degree curve begins having "billious" (green) vomiting and abdominal distension.

Vitals: Tachycardic.
Physical Examination: Distended, tympanitic abdomen.
Laboratory Results: KUB shows a dilated stomach and proximal duodenum.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has billious vomiting 3 days after scoliosis surgery.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Post-op ileus", "Superior Mesenteric Artery (SMA) Syndrome", "Appendicitis", "Bowel perforation"]', 1, 'Lengthening the spine during scoliosis correction can stretch the SMA, compressing the 3rd portion of the duodenum against the aorta.'),
    (v_case_id, 'Who is at the highest risk for SMA syndrome?', '["Obese patients", "Very thin/asthenic patients with significant curve correction", "Elderly patients", "Males only"]', 1, 'Thin patients have less mesenteric fat to "buffer" the space between the SMA and aorta.'),
    (v_case_id, 'What is the initial management of SMA syndrome?', '["Immediate abdominal surgery", "Gastric decompression (NG tube), small frequent meals, and positioning in the left lateral decubitus/prone position", "Enemas", "More IV fluids only"]', 1, 'Conservative management is usually successful; surgery (duodenojejunostomy) is a last resort.');

    ---------------------------------------------------------------------------
    -- CASE 18: Back Pain in Children - Red Flags
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Night Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Night Pain', 'An 8-year-old boy presents with back pain that wakes him up at night.

Vitals: Stable.
Physical Examination: Mild tenderness; no neuro deficit.
Laboratory Results: X-ray shows a "winking owl" sign (missing pedicle).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-year-old with night pain and a missing pedicle on X-ray.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'True or False: Back pain in a child under age 10 is almost always "growing pains" and should be ignored.', '["True", "False"]', 1, 'Back pain in a young child is a major red flag for infection or tumor (e.g., Leukemia, Osteoid Osteoma, Eosinophilic Granuloma).'),
    (v_case_id, 'What does the "winking owl" sign on an AP X-ray signify?', '["Normal pedicle", "Destruction of a pedicle, often by a tumor (metastasis or primary bone tumor)", "A birth defect", "Muscle spasm"]', 1, 'The loss of the pedicle silhouette is a classic sign of bony destruction.'),
    (v_case_id, 'Which of the following is a "Red Flag" for pediatric back pain?', '["Age < 4", "Night pain", "Fever/Weight loss", "All of the above"]', 3, 'Children rarely have "mechanical" back pain; red flags mandate a thorough workup (MRI, labs).');

    ---------------------------------------------------------------------------
    -- CASE 19: Thoracic Disc Herniation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rare but Dangerous' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rare but Dangerous', 'A patient presents with a "band-like" pain around his mid-section and progressive weakness in both legs.

Vitals: Stable.
Physical Examination: Hyperreflexia in the knees; clonus.
Laboratory Results: MRI shows a central calcified disc herniation at T10-T11.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with band-like thoracic pain and myelopathic leg weakness.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are thoracic disc herniations less common than cervical or lumbar?', '["The thoracic spine is more flexible", "The rib cage provides stability and limits motion/wear", "Thoracic discs are larger", "There is no reason"]', 1, 'The thoracic spine is the most rigid segment, protecting the discs from herniation.'),
    (v_case_id, 'What is the most concerning presentation of a thoracic disc?', '["Myelopathy (spinal cord compression)", "Isolated rib pain", "Skin rash", "Fever"]', 0, 'Because the thoracic canal is small, central herniations often compress the cord directly.'),
    (v_case_id, 'True or False: Traditional posterior laminectomy is the preferred approach for a central thoracic disc.', '["True", "False"]', 1, 'Retracting the cord to get to a central thoracic disc from the back is very dangerous; anterior or lateral (trans-pedicular) approaches are usually preferred.');

    ---------------------------------------------------------------------------
    -- CASE 20: Scoliosis - Pulmonary Function
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breathless with a Curve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breathless with a Curve', 'A patient with a 100-degree thoracic scoliosis complains of shortness of breath.

Vitals: SpO2 94% on room air.
Physical Examination: Severe restrictive pattern on PFTs.
Laboratory Results: Cobb angle 100 degrees.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with 100-degree scoliosis and restrictive lung disease.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what Cobb angle do pulmonary function tests (PFTs) typically start to decline?', '["20 degrees", "40 degrees", "> 60-70 degrees", "Never"]', 2, 'Significant restrictive lung disease is usually seen when curves exceed 70-80 degrees.'),
    (v_case_id, 'The most common cause of death in untreated, severe early-onset scoliosis is:', '["Heart attack", "Cor pulmonale (right heart failure due to lung disease)", "Stroke", "Infection"]', 1, 'Chronic alveolar hypoventilation leads to pulmonary hypertension and eventually right-sided heart failure.'),
    (v_case_id, 'True or False: Surgery to straighten a 100-degree curve will significantly improve the patient''s baseline FVC (Forced Vital Capacity).', '["True", "False"]', 1, 'Surgery is done to stop progression; it rarely "undoes" existing pulmonary restriction.');

    ---------------------------------------------------------------------------
    -- CASE 21: Lumbar Radiculopathy (L4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Knee', 'A 58-year-old male presents with lower back pain radiating down the front of his left thigh to the medial side of his leg.

Vitals: Stable.
Physical Examination: Weakness in knee extension (Quadriceps, 4/5). Diminished patellar reflex (1+). Sensation is decreased over the medial malleolus.
Laboratory Results: MRI shows a disc herniation at the L3-L4 level.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old with L4 radiculopathy; weak knee extension and diminished patellar reflex.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve root is affected?', '["L3", "L4", "L5", "S1"]', 1, 'L4 radiculopathy (usually from an L3-L4 disc) affects the quadriceps, the patellar reflex, and sensation on the medial leg/malleolus.'),
    (v_case_id, 'In the lumbar spine, a "paracentral" (most common) disc herniation typically affects:', '["The exiting nerve root", "The traversing nerve root", "Both roots equally", "The spinal cord"]', 1, 'In the lumbar spine, a paracentral disc at L3-L4 misses the L3 root (which has already exited) and hits the traversing L4 root.'),
    (v_case_id, 'True or False: The patellar reflex is a reliable test for the L4 nerve root.', '["True", "False"]', 0, 'The patellar reflex is the primary reflex mediated by the L4 root.');

    ---------------------------------------------------------------------------
    -- CASE 22: Lumbar Radiculopathy (L5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foot Drop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foot Drop', 'A 45-year-old female complains of pain radiating down the lateral side of her leg into the top of her foot and great toe.

Vitals: Stable.
Physical Examination: Weakness in great toe extension (EHL, 3/5) and foot eversion. Normal patellar and Achilles reflexes. Sensation is decreased in the first dorsal webspace.
Laboratory Results: MRI shows a paracentral disc herniation at L4-L5.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with L5 radiculopathy; weak great toe extension and numbness in the first webspace.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve root is most likely affected?', '["L4", "L5", "S1", "S2"]', 1, 'L5 radiculopathy affects the Extensor Hallucis Longus (EHL) and sensation on the dorsal foot. There is no major reflex associated with L5.'),
    (v_case_id, 'Weakness in which muscle group would also be expected in an L5 radiculopathy?', '["Quadriceps", "Gastrocnemius", "Gluteus Medius (Hip abduction)", "Iliopsoas"]', 2, 'Hip abduction is largely controlled by L5; weakness here helps differentiate an L5 root lesion from a peroneal nerve injury (where hip abduction is normal).'),
    (v_case_id, 'True or False: An L4-L5 "foraminal" (far lateral) disc herniation would affect the L4 root, not the L5 root.', '["True", "False"]', 0, 'Far lateral discs hit the nerve root that is currently exiting that foramen.');

    ---------------------------------------------------------------------------
    -- CASE 23: Lumbar Radiculopathy (S1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weak Plantarflexion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weak Plantarflexion', 'A 38-year-old construction worker feels a "pop" in his back and now has pain radiating to the lateral side of his foot.

Vitals: Stable.
Physical Examination: Unable to perform a single-leg toe raise. Diminished Achilles reflex (0). Sensation is decreased over the lateral border of the foot and little toe.
Laboratory Results: MRI shows a paracentral disc herniation at L5-S1.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 38-year-old with S1 radiculopathy; weak plantarflexion and absent Achilles reflex.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve root is affected?', '["L4", "L5", "S1", "S2"]', 2, 'S1 radiculopathy involves the gastrocnemius (plantarflexion), the Achilles reflex, and the lateral foot.'),
    (v_case_id, 'What is the most common level for a lumbar disc herniation?', '["L1-L2", "L2-L3", "L4-L5 and L5-S1", "T12-L1"]', 2, 'The lowest two levels bear the most weight and undergo the most degenerative change.'),
    (v_case_id, 'True or False: 90% of lumbar disc herniations can be treated successfully without surgery.', '["True", "False"]', 0, 'Conservative management with NSAIDs, activity modification, and physical therapy is effective for the vast majority of patients.');

    ---------------------------------------------------------------------------
    -- CASE 24: Straight Leg Raise (SLR)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tension Signs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tension Signs', 'A patient has suspected lumbar radiculopathy. You perform a straight leg raise test.

Vitals: Stable.
Physical Examination: Raising the symptomatic right leg to 45 degrees reproduces the shooting pain down the leg. Raising the ASYMPTOMATIC left leg ALSO reproduces pain in the right leg.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Performing SLR and Crossed SLR tests for radiculopathy.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the reproduction of pain in the affected leg while lifting the OPPOSITE leg called?', '["Positive SLR", "Crossed (Contralateral) SLR", "Patrick''s test", "FADIR test"]', 1, 'The Crossed SLR is highly specific (though less sensitive) for a lumbar disc herniation.'),
    (v_case_id, 'The Straight Leg Raise test primarily puts tension on which nerve roots?', '["L2-L3", "L4-L5-S1 (Sciatic nerve)", "C5-C6", "T10"]', 1, 'The SLR stretches the sciatic nerve and its contributing roots (L4, L5, S1).'),
    (v_case_id, 'A "positive" SLR is defined by reproduction of radicular pain (below the knee) at what angle of elevation?', '["10 degrees", "Between 30 and 70 degrees", "Only at 90 degrees", "Any pain in the back is a positive test"]', 1, 'Pain before 30 degrees suggests malingering/non-organic issues; pain after 70 degrees is often just hamstring tightness. True radicular tension occurs in the mid-range.');

    ---------------------------------------------------------------------------
    -- CASE 25: Cauda Equina Syndrome (CES) - Presentation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Surgical Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Surgical Emergency', 'A 50-year-old male with a history of chronic back pain presents to the ED with sudden onset of severe leg weakness and "numbness in my groin."

Vitals: Stable.
Physical Examination: Absent perianal sensation; diminished rectal tone; bilateral leg weakness.
Laboratory Results: Bladder scan shows 800 mL of urine despite the patient saying he just went.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old with saddle anesthesia, loss of rectal tone, and urinary retention.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Lumbar stenosis", "Cauda Equina Syndrome (CES)", "Hip arthritis", "Malingering"]', 1, 'CES is a surgical emergency caused by massive compression of the multiple nerve roots in the lumbar canal.'),
    (v_case_id, 'What is the most sensitive early sign of Cauda Equina Syndrome?', '["Back pain", "Urinary retention (increased post-void residual)", "Foot drop", "Fever"]', 1, 'Urinary retention is often the first sign of autonomic dysfunction in CES.'),
    (v_case_id, 'What is the definitive management of confirmed CES?', '["Bed rest and muscle relaxants", "Physical therapy", "Emergent surgical decompression (usually within 24-48 hours)", "Epidural steroid injection"]', 2, 'Delayed decompression leads to permanent bowel/bladder dysfunction and sexual dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 26: Lumbar Spinal Stenosis - Neurogenic Claudication
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shopping Cart Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shopping Cart Sign', 'A 72-year-old male reports leg pain and heaviness that occurs when he walks. He notes that he can walk much further if he leans on a shopping cart at the grocery store.

Vitals: Stable. Pulses are 2+ in feet.
Physical Examination: Normal neurological exam while seated; symptoms reproduced with standing in extension.
Laboratory Results: MRI shows "trefoil" canal shape and thickening of the ligamentum flavum.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old with leg pain relieved by leaning forward (Shopping Cart Sign).', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this clinical presentation called?', '["Vascular claudication", "Neurogenic claudication", "Sciatica", "Bursitis"]', 1, 'Neurogenic claudication is the classic symptom of lumbar spinal stenosis.'),
    (v_case_id, 'Why does leaning forward (flexion) improve the symptoms?', '["It increases the diameter of the spinal canal", "It decreases blood flow to the legs", "It stretches the hamstrings", "It is just psychological"]', 0, 'Flexion increases the canal and foraminal volume, relieving pressure on the nerve roots.'),
    (v_case_id, 'How do you differentiate neurogenic from vascular claudication?', '["Vascular claudication is relieved by sitting; neurogenic is relieved by leaning forward", "Neurogenic has absent pulses", "Vascular is worse when biking", "There is no way to tell"]', 0, 'Vascular claudication (PAD) is purely activity-dependent; neurogenic claudication is position-dependent.');

    ---------------------------------------------------------------------------
    -- CASE 27: Spondylolysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gymnast''s Back' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gymnast''s Back', 'A 14-year-old competitive gymnast has worsening lower back pain with extension.

Vitals: Stable.
Physical Examination: Pain with "Stork Test" (standing on one leg and extending the back). No neuro deficit.
Laboratory Results: Oblique X-rays show a "collar" on the Scotty Dog.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 14-year-old gymnast with pain on back extension and "Scotty Dog" collar.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Spondylolysis", "Disc herniation", "Scoliosis", "Osteoarthritis"]', 0, 'Spondylolysis is a stress fracture of the pars interarticularis, common in athletes with repetitive hyperextension (gymnasts, football linemen).'),
    (v_case_id, 'The "collar" on the Scotty Dog represents a defect in the:', '["Vertebral body", "Pars interarticularis", "Spinous process", "Facet joint"]', 1, 'The pars is the bridge between the superior and inferior articular processes.'),
    (v_case_id, 'What is the most common level for spondylolysis?', '["L1", "L3", "L5", "T12"]', 2, 'L5 is the site of over 90% of spondylolysis cases.');

    ---------------------------------------------------------------------------
    -- CASE 28: Degenerative Spondylolisthesis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Slipped Vertebra' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Slipped Vertebra', 'A 65-year-old woman with lumbar stenosis. X-rays show that L4 has shifted 4 mm forward on L5.

Vitals: Stable.
Physical Examination: Neurogenic claudication symptoms.
Laboratory Results: Spondylolisthesis at L4-L5.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old with L4-L5 degenerative spondylolisthesis and stenosis.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the grading system for spondylolisthesis based on the percentage of slip?', '["Garden", "Meyerding", "Schatzker", "Neer"]', 1, 'Meyerding: Grade I (<25%), II (25-50%), III (50-75%), IV (75-100%), V (Spondyloptosis).'),
    (v_case_id, 'In DEGENERATIVE spondylolisthesis (where the pars is intact), which level is most common?', '["L3-L4", "L4-L5", "L5-S1", "L1-L2"]', 1, 'Degenerative slips are most common at L4-L5, often in older women ("The 4 Fs": Female, Fourth level, Fifty+, and Fat/obese - though the latter is debated).'),
    (v_case_id, 'How does this differ from ISTHMIC spondylolisthesis?', '["Isthmic involves a pars defect and usually occurs at L5-S1", "Isthmic is only in the elderly", "Degenerative is always surgical", "There is no difference"]', 0, 'Isthmic slips occur in younger patients due to pars defects, most commonly at L5-S1.');

    ---------------------------------------------------------------------------
    -- CASE 29: Far Lateral Disc Herniation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foraminal Disc' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foraminal Disc', 'A patient with severe L4 radiculopathy (quad weakness, medial leg numbness). MRI shows a disc herniation at the L4-L5 level, but it is located in the far lateral zone (foramen).

Vitals: Stable.
Physical Examination: Weak knee extension; diminished patellar reflex.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with L4 radiculopathy and a far lateral L4-L5 disc.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does an L4-L5 far lateral disc affect the L4 root instead of the L5 root?', '["Because the L4 root is exiting the foramen at that level", "Because L5 doesn''t exist in the foramen", "It''s a mistake in the exam", "None"]', 0, 'A paracentral disc hits the traversing nerve (L5), but a foraminal disc hits the exiting nerve (L4).'),
    (v_case_id, 'True or False: Far lateral discs often cause more severe pain because they compress the dorsal root ganglion.', '["True", "False"]', 0, 'The DRG is located in the foramen and is highly sensitive to pressure.'),
    (v_case_id, 'What is the best initial imaging for identifying a far lateral disc?', '["X-ray", "CT without contrast", "MRI", "Ultrasound"]', 2, 'MRI is the gold standard for soft tissue and nerve root assessment.');

    ---------------------------------------------------------------------------
    -- CASE 30: Hip-Spine Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Where is the Pain?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Where is the Pain?', 'A 70-year-old with both lumbar stenosis and severe hip osteoarthritis presents with groin and buttock pain.

Vitals: Stable.
Physical Examination: Limited internal rotation of the hip; positive SLR; neurogenic claudication.
Laboratory Results: X-rays show bone-on-bone hip OA and MRI shows moderate stenosis.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old with both hip OA and lumbar stenosis; identifying the source of pain.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic challenge of "Hip-Spine Syndrome"?', '["Both conditions can cause overlapping symptoms in the buttock and thigh", "They require the same surgery", "They never occur together", "None"]', 0, 'It is often hard to tell how much pain is coming from the hip vs. the spine.'),
    (v_case_id, 'Pain in the GROIN is much more likely to be coming from the:', '["Lumbar spine", "Hip joint", "Sacrum", "Ankle"]', 1, 'Groin pain is classic for hip pathology.'),
    (v_case_id, 'What is a useful diagnostic tool to differentiate the two?', '["Blood tests", "Intra-articular hip injection with local anesthetic", "Check reflexes", "None"]', 1, 'If the pain is relieved by a hip injection, the hip is a major contributor.');

    ---------------------------------------------------------------------------
    -- CASE 31: Degenerative Disc Disease (DDD) - Modic Changes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Endplate Changes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Endplate Changes', 'A 45-year-old with chronic axial back pain. MRI shows disc desiccation and "Modic Type 1" changes at L5-S1.

Vitals: Stable.
Physical Examination: No radiculopathy; pain with lumbar flexion.
Laboratory Results: MRI shows T1-hypointense and T2-hyperintense signals in the vertebral endplates.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with axial back pain and Modic Type 1 changes on MRI.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What do "Modic Type 1" changes signify?', '["Fatty marrow replacement", "Inflammation and edema in the vertebral endplates", "Bony sclerosis", "Infection"]', 1, 'Type 1 is inflammatory (edema); Type 2 is fatty replacement; Type 3 is sclerosis.'),
    (v_case_id, 'Which of the following is the most common symptom of Degenerative Disc Disease?', '["Radicular pain", "Axial (centerline) back pain worsened by sitting and forward bending", "Numbness in the toes", "Bladder dysfunction"]', 1, 'DDD causes "mechanical" or axial pain, as opposed to the radicular pain caused by herniations.'),
    (v_case_id, 'True or False: Most patients with DDD on MRI require surgery.', '["True", "False"]', 1, 'Disc degeneration is a normal part of aging; many asymptomatic people have DDD on MRI. Surgery is only for those with severe, recalcitrant pain.');

    ---------------------------------------------------------------------------
    -- CASE 32: Sacroiliac (SI) Joint Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fortin Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fortin Sign', 'A patient presents with buttock pain. She points directly to the area just below the PSIS (posterior superior iliac spine) when asked where it hurts.

Vitals: Stable.
Physical Examination: Positive FABER test; positive Gaenslen''s test. No radicular symptoms.
Laboratory Results: Normal MRI of the lumbar spine.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with buttock pain and positive SI joint provocative tests.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of pain?', '["L5-S1 disc", "Sacroiliac (SI) Joint", "Hip joint", "Piriformis muscle"]', 1, 'SI joint pain typically occurs below the beltline and is reproducible with provocative maneuvers (FABER, Gaenslen''s).'),
    (v_case_id, 'The "Fortin Finger Sign" refers to:', '["Numbness in the index finger", "The patient pointing to the SI joint area with one finger as the source of pain", "A sign of carpal tunnel", "None"]', 1, 'Patients with SI joint pain are very consistent in pointing to the localized area of the joint.'),
    (v_case_id, 'True or False: SI joint pain can occasionally radiate down the leg, mimicking sciatica.', '["True", "False"]', 0, 'Somatic referred pain from the SI joint can travel to the posterior thigh, but rarely goes below the knee.');

    ---------------------------------------------------------------------------
    -- CASE 33: Facet Joint Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain on Extension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain on Extension', 'A 60-year-old male has chronic back pain that is WORSE when he stands up straight or leans backward.

Vitals: Stable.
Physical Examination: Localized tenderness over the paraspinal muscles. Pain is reproduced with lumbar extension and lateral rotation.
Laboratory Results: X-rays show facet hypertrophy.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old with back pain worsened by extension; facet hypertrophy on X-ray.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely source of pain?', '["Lumbar Facet Joints", "Disc herniation", "Muscle strain", "Kidney stones"]', 0, 'Facet pain is characteristically worsened by extension (which loads the joints) and relieved by flexion.'),
    (v_case_id, 'Which procedure can be used both to diagnose and provide temporary relief for facet pain?', '["Epidural steroid injection", "Medial branch block (local anesthetic to the facet nerves)", "Discogram", "Trigger point injection"]', 1, 'If a medial branch block provides >80% relief, it confirms the facets as the pain source.'),
    (v_case_id, 'What is "Radiofrequency Ablation" (RFA) in the context of the spine?', '["Using heat to destroy the nerves (medial branches) that supply the facet joints", "A type of X-ray", "A way to dissolve discs", "None"]', 0, 'RFA can provide 6-12 months of relief for facet-mediated pain.');

    ---------------------------------------------------------------------------
    -- CASE 34: Piriformis Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pseudosciatica' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pseudosciatica', 'A runner complains of deep buttock pain and "sciatica" down her leg. Lumbar MRI is negative.

Vitals: Stable.
Physical Examination: Tenderness in the deep gluteal region. Pain is reproduced with resisted abduction and external rotation of the hip.
Laboratory Results: MRI shows a thickened piriformis muscle.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A runner with deep buttock pain and leg pain; lumbar MRI is normal.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["L5 radiculopathy", "Piriformis Syndrome", "Hip OA", "Hamstring tear"]', 1, 'The sciatic nerve can be compressed by the piriformis muscle as it exits the sciatic notch.'),
    (v_case_id, 'How do you differentiate Piriformis Syndrome from a lumbar disc herniation?', '["Piriformis syndrome has a normal lumbar MRI and tenderness in the buttock rather than the spine", "Piriformis syndrome causes foot drop", "Radiculopathy has normal reflexes", "None"]', 0, 'Normal spine imaging and localized gluteal tenderness are key differentiators.'),
    (v_case_id, 'Initial treatment for piriformis syndrome includes:', '["Immediate surgery", "Stretching, physical therapy, and occasionally an ultrasound-guided injection", "Bed rest for a month", "Casting the hip"]', 1, 'Conservative management is usually successful.');

    ---------------------------------------------------------------------------
    -- CASE 35: Spondyloptosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Extreme Slip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Extreme Slip', 'A 12-year-old child presents with a severe "step-off" in her lower back and a waddling gait. X-rays show that L5 has completely slipped off the front of S1.

Vitals: Stable.
Physical Examination: Palpable "shelf" at the lumbosacral junction.
Laboratory Results: Meyerding Grade V slip.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A child with a Grade V spondylolisthesis (L5 slipped off S1).', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Spondylolysis", "Spondyloptosis", "Scoliosis", "Kyphosis"]', 1, 'Spondyloptosis is the most severe form of spondylolisthesis (Grade V).'),
    (v_case_id, 'Which nerve root is at highest risk during surgical reduction of a high-grade L5-S1 slip?', '["L4", "L5", "S1", "S2"]', 1, 'The L5 root is stretched over the "dome" of the sacrum as the vertebrae are realigned.'),
    (v_case_id, 'True or False: High-grade slips in children have a high risk of progression and usually require surgical fusion.', '["True", "False"]', 0, 'High-grade slips are unstable and can lead to cauda equina symptoms or progressive deformity.');

    ---------------------------------------------------------------------------
    -- CASE 36: Failed Back Surgery Syndrome (FBSS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain After Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain After Surgery', 'A patient who had a microdiscectomy 6 months ago presents with the exact same radicular pain returning.

Vitals: Stable.
Physical Examination: Positive SLR.
Laboratory Results: MRI with gadolinium shows a mass that enhances at the previous surgical site.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent radicular pain 6 months after a discectomy.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'MRI with gadolinium is used in post-op patients to differentiate between:', '["Tumor and infection", "Recurrent disc herniation (which does NOT enhance centrally) and epidural fibrosis/scar (which DOES enhance)", "Bone and muscle", "None"]', 1, 'Scar tissue is vascular and enhances; a new disc fragment is avascular and only shows rim enhancement.'),
    (v_case_id, 'What is the "recurrent herniation" rate after a standard microdiscectomy?', '["0%", "5-15%", "50%", "90%"]', 1, 'A small but significant percentage of patients will have another herniation at the same level.'),
    (v_case_id, 'What is a major risk factor for poor outcomes after spine surgery?', '["Smoking", "Diabetes", "Litigation/Workers compensation status", "All of the above"]', 3, 'Both biological (smoking, DM) and psychosocial (workers comp) factors strongly influence spine surgery results.');

    ---------------------------------------------------------------------------
    -- CASE 37: Lumbar Fusion - Indications
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'To Fuse or Not to Fuse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'To Fuse or Not to Fuse', 'A patient with lumbar stenosis ALSO has an unstable degenerative spondylolisthesis.

Vitals: Stable.
Physical Examination: Neurogenic claudication.
Laboratory Results: Flexion-extension X-rays show 4 mm of dynamic movement at L4-L5.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with lumbar stenosis and dynamic instability at L4-L5.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In addition to decompression (laminectomy), what other procedure is generally indicated here?', '["Discectomy", "Posterolateral Fusion (PLF)", "Hip replacement", "None"]', 1, 'If the spine is unstable (spondylolisthesis with movement), simple decompression can lead to further slip; fusion is recommended to stabilize the segment.'),
    (v_case_id, 'What is "Adjacent Segment Disease" (ASD)?', '["A new infection", "Degeneration of the levels above or below a previous fusion due to increased stress", "Failure of the hardware", "None"]', 1, 'Fusing one segment increases the mechanical load on the neighboring segments, leading to faster wear.'),
    (v_case_id, 'True or False: Lumbar fusion is the gold standard treatment for most cases of simple low back pain.', '["True", "False"]', 1, 'Fusion for axial back pain alone is controversial and often has unpredictable results compared to fusion for deformity or instability.');

    ---------------------------------------------------------------------------
    -- CASE 38: Lumbar Disc Herniation - Indications for Surgery
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When to Operate?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When to Operate?', 'A patient has had 4 weeks of radicular pain from an L5-S1 disc. He has a mild foot drop (4/5 strength).

Vitals: Stable.
Physical Examination: Mild EHL weakness; normal bowel/bladder.
Laboratory Results: MRI shows paracentral L5-S1 disc.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with 4 weeks of pain and mild foot drop from an L5-S1 disc.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the absolute indication for URGENT surgery in this patient?', '["Pain for 4 weeks", "Development of progressive or severe neurological deficit (e.g., sudden paralysis or Cauda Equina Syndrome)", "A large disc on MRI", "The patient is tired of PT"]', 1, 'Most deficits improve with time, but rapidly worsening weakness or CES requires emergency decompression.'),
    (v_case_id, 'In the absence of an emergency, how long is the recommended trial of conservative therapy?', '["1 week", "6-12 weeks", "6 months", "2 years"]', 1, 'Most herniations resorb or symptoms resolve within 3 months.'),
    (v_case_id, 'The "SPORT" trial compared surgery vs. non-surgery for disc herniations. What was the main finding?', '["Surgery is always better", "Both groups improved significantly, though surgery provided faster pain relief in the first year", "Non-surgery is dangerous", "Neither group improved"]', 1, 'Surgery is highly effective for pain relief but the long-term (2-4 year) outcomes are often similar to those who eventually recover without surgery.');

    ---------------------------------------------------------------------------
    -- CASE 39: Arachnoiditis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clumping Roots' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clumping Roots', 'A patient with multiple previous back surgeries has severe, burning back and leg pain. MRI shows the nerve roots of the cauda equina are "clumped" together and stuck to the walls of the dural sac.

Vitals: Stable.
Physical Examination: Patchy neuro deficits; chronic pain.
Laboratory Results: MRI shows dural thickening and root clumping.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'MRI shows nerve roots "clumped" together in a patient with multiple back surgeries.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Stenosis", "Arachnoiditis", "Disc herniation", "Infection"]', 1, 'Arachnoiditis is inflammation and scarring of the arachnoid layer, often due to trauma, surgery, or previous oil-based myelogram dyes.'),
    (v_case_id, 'What is the surgical treatment for arachnoiditis?', '["Laminectomy", "Fusion", "Surgery is generally avoided as it often worsens the scarring", "Disc replacement"]', 2, 'Arachnoiditis is a difficult chronic pain condition that rarely responds well to further surgery.'),
    (v_case_id, 'True or False: Arachnoiditis can lead to "clumping" of the nerve roots in the center of the thecal sac.', '["True", "False"]', 0, 'This is a classic MRI finding.');

    ---------------------------------------------------------------------------
    -- CASE 40: Baastrup''s Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Kissing Spines' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Kissing Spines', 'An elderly patient with severe lumbar lordosis has localized pain over the spinous processes in the midline.

Vitals: Stable.
Physical Examination: Pain is sharply localized to the midline; worse with extension.
Laboratory Results: X-ray shows the spinous processes of L4 and L5 are touching (pseudo-joint formation).', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly patient with spinous processes that touch each other ("Kissing Spines").', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Baastrup''s Disease (Kissing Spine Syndrome)", "Scoliosis", "Kyphosis", "Spina Bifida"]', 0, 'Baastrup''s occurs when enlarged/deformed spinous processes rub against each other during extension.'),
    (v_case_id, 'How is Baastrup''s usually treated?', '["Conservative (NSAIDs, steroid injections into the interspinous space)", "Total spine replacement", "Chemotherapy", "None"]', 0, 'It is usually a benign cause of localized pain managed conservatively.'),
    (v_case_id, 'True or False: Baastrup''s disease is often associated with severe lumbar stenosis.', '["True", "False"]', 0, 'Both are features of advanced degenerative changes in the elderly.');

    ---------------------------------------------------------------------------
    -- CASE 41: Spinal Epidural Abscess
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Triad of Deficit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Triad of Deficit', 'A 50-year-old IV drug user presents with severe back pain, fever, and new-onset weakness in both legs.

Vitals: Temp 38.8 C (101.8 F).
Physical Examination: Point tenderness over the T12-L1 spinous processes; hyperreflexia in the knees.
Laboratory Results: WBC 15,000; ESR 90; CRP 120. MRI shows an enhancing mass in the epidural space compressing the cord.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An IV drug user with back pain, fever, and leg weakness; MRI shows epidural mass.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical triad of Spinal Epidural Abscess (SEA)?', '["Back pain, fever, and neurological deficit", "Cough, night sweats, and weight loss", "Jaundice, abdominal pain, and fever", "None"]', 0, 'This triad is present in only about 10-15% of patients early on, but is highly suggestive when complete.'),
    (v_case_id, 'What is the most common causative organism for SEA?', '["E. coli", "Staphylococcus aureus", "Pseudomonas", "Mycobacterium tuberculosis"]', 1, 'S. aureus is responsible for about 60% of cases.'),
    (v_case_id, 'What is the management of an acute SEA with neurological deficit?', '["Long-term antibiotics alone", "Urgent surgical decompression/drainage followed by long-term antibiotics", "Physical therapy", "Observation"]', 1, 'If a neurological deficit is present, surgical intervention is an emergency to save cord function.');

    ---------------------------------------------------------------------------
    -- CASE 42: Pyogenic Vertebral Osteomyelitis (PVO)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Deep Bone Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Deep Bone Infection', 'A 65-year-old diabetic male has had constant, deep back pain for 3 weeks. It is worse at night and not relieved by rest.

Vitals: Stable; low-grade fever (37.8 C).
Physical Examination: Severe percussion tenderness over the lumbar spine.
Laboratory Results: ESR 75; CRP 60. X-ray shows blurring of the L2-L3 disc space and endplate erosion.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A diabetic male with constant back pain and endplate erosion on X-ray.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does PVO typically spread to the spine?', '["Direct trauma", "Hematogenous spread (via the blood) from a distant source like a UTI or skin infection", "Inhaled spores", "None"]', 1, 'The rich blood supply to the vertebral endplates makes them a common site for bacterial seeding.'),
    (v_case_id, 'What is the "Gold Standard" for identifying the specific organism in osteomyelitis?', '["Blood cultures", "Biopsy (CT-guided or open) of the bone/disc space", "Urine culture", "Physical exam"]', 1, 'While blood cultures are helpful, a direct biopsy is necessary if blood cultures are negative to guide targeted antibiotic therapy.'),
    (v_case_id, 'True or False: Most cases of pyogenic osteomyelitis WITHOUT neurological deficit or instability can be treated with 6-8 weeks of IV antibiotics.', '["True", "False"]', 0, 'Conservative management with bracing and antibiotics is the mainstay for stable patients.');

    ---------------------------------------------------------------------------
    -- CASE 43: Metastatic Spinal Cord Compression (MSCC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cancer in the Spine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cancer in the Spine', 'A 70-year-old man with a history of prostate cancer presents with 2 days of inability to walk and "heaviness" in both legs.

Vitals: Stable.
Physical Examination: 0/5 strength in both legs; sensory level at the umbilicus (T10); positive Babinski.
Laboratory Results: MRI shows a metastatic lesion at T8 with significant cord compression.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with prostate cancer and sudden paraplegia; T10 sensory level.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate pharmacological management to reduce cord edema in MSCC?', '["High-dose Dexamethasone", "IV Morphine", "Ciprofloxacin", "Insulin"]', 0, 'Steroids are critical to reduce inflammation and edema around the compressed cord.'),
    (v_case_id, 'The "Patchell Trial" showed that in patients with a single symptomatic metastatic lesion, the best outcome is achieved with:', '["Radiation alone", "Surgery (decompression/stabilization) followed by radiation", "Chemotherapy only", "No treatment"]', 1, 'Surgical decompression plus radiation is superior to radiation alone for maintaining the ability to walk.'),
    (v_case_id, 'Which three cancers most commonly metastasize to the spine?', '["Lung, Breast, Prostate", "Skin, Colon, Bladder", "Brain, Stomach, Pancreas", "None"]', 0, 'These three account for the majority of spinal metastases.');

    ---------------------------------------------------------------------------
    -- CASE 44: Ankylosing Spondylitis (AS) - Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chalk Stick Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chalk Stick Fracture', 'A 60-year-old male with a 30-year history of Ankylosing Spondylitis (Bamboo spine) falls from standing height. He has new, severe neck pain.

Vitals: Stable.
Physical Examination: Fixed kyphotic "chin-on-chest" deformity; midline tenderness.
Laboratory Results: X-ray is difficult to read due to deformity, but CT shows a transverse fracture through the disc space and both columns of C6-C7.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with Ankylosing Spondylitis has a transverse "Chalk Stick" fracture after a minor fall.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a fall in a patient with AS much more dangerous than in a normal patient?', '["The fused, brittle spine acts like a long lever arm, concentrating force at the fracture site (Chalk Stick Fracture)", "They have bigger muscles", "They are more likely to fall", "None"]', 0, 'The "bamboo spine" is rigid and osteoporotic; minor trauma causes unstable, through-and-through fractures.'),
    (v_case_id, 'True or False: If a patient with AS has new back pain after trauma, you MUST obtain a CT or MRI even if X-rays are negative.', '["True", "False"]', 0, 'X-rays are notoriously insensitive for fractures in the ankylosed spine.'),
    (v_case_id, 'What is the characteristic HLA association for Ankylosing Spondylitis?', '["HLA-DR4", "HLA-B27", "HLA-B51", "HLA-DQ8"]', 1, 'Over 90% of AS patients are HLA-B27 positive.');

    ---------------------------------------------------------------------------
    -- CASE 45: DISH (Diffuse Idiopathic Skeletal Hyperostosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Flowing Osteophytes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Flowing Osteophytes', 'An elderly diabetic male has a "stiff back" but no significant pain. X-rays show massive calcification along the ANTERIOR aspect of at least 4 contiguous vertebral bodies.

Vitals: Stable.
Physical Examination: Decreased range of motion.
Laboratory Results: "Flowing" calcification on the right side of the thoracic spine.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly male with "flowing" anterior calcification over 4 vertebrae (DISH).', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Ankylosing Spondylitis", "DISH (Forestier''s Disease)", "Degenerative Disc Disease", "Spinal tumor"]', 1, 'DISH is characterized by thick, flowing calcification of the ALL (Anterior Longitudinal Ligament).'),
    (v_case_id, 'How does DISH differ from Ankylosing Spondylitis on X-ray?', '["DISH preserves the disc spaces and does NOT involve the sacroiliac (SI) joints", "DISH only occurs in children", "DISH involves the cord", "None"]', 0, 'AS always starts at the SI joints and involves disc space "squaring"; DISH skips the SI joints.'),
    (v_case_id, 'What metabolic condition is frequently associated with DISH?', '["Hypothyroidism", "Diabetes Mellitus", "Gout", "Anemia"]', 1, 'DISH is strongly linked to Type 2 DM and obesity.');

    ---------------------------------------------------------------------------
    -- CASE 46: Chordoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sacral Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sacral Mass', 'A 50-year-old male presents with vague buttock pain and new-onset constipation. Digital rectal exam reveals a firm mass in the presacral space.

Vitals: Stable.
Physical Examination: Firm mass palpable per rectum; saddle anesthesia.
Laboratory Results: MRI shows a large, destructive bone tumor in the sacrum.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old with a destructive sacral tumor and constipation.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for a primary malignant bone tumor in the sacrum?', '["Osteosarcoma", "Chordoma", "Ewing sarcoma", "Multiple myeloma"]', 1, 'Chordoma is the most common primary malignant tumor of the sacrum and clivus; it arises from notochord remnants.'),
    (v_case_id, 'Why is constipation a symptom in this case?', '["The tumor is secreting toxins", "The tumor is physically compressing the rectum or the sacral nerves controlling bowel function", "The patient is on opioids", "None"]', 1, 'Sacral tumors often present with bowel/bladder changes due to their location.'),
    (v_case_id, 'What is the treatment for Chordoma?', '["Chemotherapy only", "Wide surgical resection (often very complex) because these tumors are resistant to chemotherapy and radiation", "Observation", "Casting"]', 1, 'Chordomas are slow-growing but locally aggressive and require wide margins for a cure.');

    ---------------------------------------------------------------------------
    -- CASE 47: Osteoporotic Compression Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sudden Snap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sudden Snap', 'An 80-year-old woman with known osteoporosis felt a "snap" in her back while sneezing. She now has acute, localized mid-back pain.

Vitals: Stable.
Physical Examination: Point tenderness over T12; no neuro deficit.
Laboratory Results: X-ray shows 30% loss of height in the T12 vertebral body (wedge fracture).', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old with a T12 compression fracture after sneezing.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common site for osteoporotic compression fractures?', '["Cervical spine", "Thoracolumbar junction (T11-L2)", "Sacrum", "L5-S1"]', 1, 'This is the transition zone between the rigid thoracic and mobile lumbar spine, bearing the most stress.'),
    (v_case_id, 'What procedure involves injecting bone cement (PMMA) into the vertebral body to stabilize the fracture?', '["ACDF", "Vertebroplasty/Kyphoplasty", "Discectomy", "Laminectomy"]', 1, 'These "cement" procedures can provide rapid pain relief for acute, painful compression fractures.'),
    (v_case_id, 'True or False: A compression fracture (by definition) involves only the anterior column and is usually stable.', '["True", "False"]', 0, 'If the middle or posterior columns are involved, it is no longer a simple compression fracture (e.g., it may be a burst fracture).');

    ---------------------------------------------------------------------------
    -- CASE 48: Spine Trauma - Burst Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High Energy Load' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High Energy Load', 'A construction worker falls 20 feet and lands on his feet. He has severe back pain.

Vitals: Stable.
Physical Examination: Normal neuro exam.
Laboratory Results: CT shows a fracture of the L1 vertebra involving the anterior and middle columns, with 20% retropulsion into the canal.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An L1 burst fracture (anterior and middle columns) after a 20-foot fall.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of fracture is this?', '["Compression fracture", "Burst fracture", "Chance fracture", "Spondylolysis"]', 1, 'A burst fracture involves failure of the middle column (the posterior part of the vertebral body), often with bone fragments pushed into the canal (retropulsion).'),
    (v_case_id, 'What determines the stability of a burst fracture?', '["The number of vertebrae", "Integrity of the posterior ligamentous complex (PLC) and degree of canal compromise", "The patient''s age", "None"]', 1, 'The TLICS (Thoracolumbar Injury Classification and Severity) score uses morphology, PLC integrity, and neuro status to guide treatment.'),
    (v_case_id, 'True or False: All burst fractures require surgery.', '["True", "False"]', 1, 'Stable burst fractures in neurologically intact patients can often be treated in a specialized brace (TLSO).');

    ---------------------------------------------------------------------------
    -- CASE 49: Spine Trauma - Chance Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Seatbelt Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Seatbelt Injury', 'An 8-year-old child was a passenger in a car accident, wearing only a lap belt.

Vitals: Stable.
Physical Examination: Ecchymosis across the abdomen ("seatbelt sign"); tender over the mid-lumbar spine.
Laboratory Results: X-ray shows a horizontal fracture line through the spinous process, pedicles, and vertebral body of L2.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A child with a "seatbelt" (Chance) fracture of L2.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of a Chance fracture?', '["Axial load", "Flexion-Distraction (the body is thrown forward over a fixed lap belt)", "Direct hit", "Torsion"]', 1, 'The lap belt acts as a fulcrum, pulling the posterior elements apart (distraction).'),
    (v_case_id, 'A "Chance" fracture is highly associated with which other injury?', '["Head injury", "Intra-abdominal organ injury (e.g., bowel perforation or solid organ tear)", "Ankle fracture", "None"]', 1, 'The same force that breaks the spine often crushes the abdominal contents against the belt.'),
    (v_case_id, 'True or False: A Chance fracture involves all three columns of the spine.', '["True", "False"]', 0, 'It is an unstable, through-and-through distraction injury.');

    ---------------------------------------------------------------------------
    -- CASE 50: Adult Degenerative Scoliosis - Sagittal Balance
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Leaning Man' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Leaning Man', 'A 75-year-old male with severe back pain notes he "can''t stand up straight" and feels like he is falling forward.

Vitals: Stable.
Physical Examination: Significant forward lean.
Laboratory Results: Standing long-cassette X-rays show a C7 plumb line that falls 10 cm in front of the sacral promontory.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old with positive sagittal imbalance (C7 plumb line is 10 cm anterior).', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the measurement of the C7 plumb line relative to the sacrum called?', '["Cobb angle", "Sagittal Vertical Axis (SVA)", "Pelvic incidence", "Risser stage"]', 1, 'SVA is the most important radiographic predictor of pain and disability in adult spinal deformity.'),
    (v_case_id, 'A "Positive Sagittal Balance" means the patient is leaning:', '["Backward", "Forward", "To the left", "To the right"]', 1, 'Positive = Forward lean; it requires significant energy to maintain an upright posture.'),
    (v_case_id, 'What is the primary goal of complex adult deformity surgery?', '["To make the spine perfectly straight on the front view", "To restore sagittal balance and decompress the nerves", "To fix every disc", "None"]', 1, 'Restoring the "global alignment" (getting the head over the pelvis) is the key to improving quality of life.');

END $$;

COMMIT;
