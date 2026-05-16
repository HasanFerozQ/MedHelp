-- Orthopedics: Part 1 (Questions 1-50)
-- Topic: Spine disorders — disc herniation, stenosis, scoliosis
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-spine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-spine' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug ortho-spine not found.';
    END IF;

    -- Master Wipe for standalone MCQs (does not affect caseblocks)
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- CERVICAL RADICULOPATHY & ANATOMY
    (v_topic_id, 'Which nerve root is most likely affected in a patient with a disc herniation at the C5-C6 level?', '["C4", "C5", "C6", "C7"]', 2, 'In the cervical spine, the nerve root exits ABOVE the corresponding vertebra. Therefore, at the C5-C6 interval, the C6 nerve root is exiting and is typically compressed by a disc herniation.'),
    (v_topic_id, 'A 45-year-old male presents with weakness in his triceps and a diminished triceps reflex. He also has numbness in his middle finger. Which cervical nerve root is likely involved?', '["C5", "C6", "C7", "C8"]', 2, 'C7 radiculopathy classically presents with triceps weakness, triceps reflex diminution, and sensory changes in the middle finger.'),
    (v_topic_id, 'The C8 nerve root exits the spinal canal between which two vertebrae?', '["C7 and C8", "C7 and T1", "C6 and C7", "T1 and T2"]', 1, 'There are 7 cervical vertebrae but 8 cervical nerve roots. C1-C7 exit above their named vertebrae, and C8 exits between C7 and T1. From T1 onwards, the roots exit below their named vertebrae.'),
    (v_topic_id, 'A patient with a C5 radiculopathy is most likely to demonstrate weakness in which muscle?', '["Triceps", "Biceps", "Deltoid", "Wrist flexors"]', 2, 'C5 provides the primary motor supply to the deltoid and contributes significantly to the biceps (along with C6).'),
    (v_topic_id, 'Which physical exam maneuver is most specific for diagnosing cervical radiculopathy?', '["Phalen test", "Spurling test", "Hoffman sign", "Lhermitte sign"]', 1, 'Spurling test (neck extension, lateral rotation toward the affected side, and axial compression) narrows the neural foramen and reproduces radicular symptoms.'),
    (v_topic_id, 'What is the "Shoulder Abduction Relief Sign" (Bakody sign)?', '["A sign of rotator cuff tear", "Relief of radicular pain when the patient places the affected hand on top of their head", "Increased pain with shoulder abduction", "A sign of thoracic outlet syndrome"]', 1, 'Bakody sign is positive when lifting the arm over the head relieves tension on the cervical nerve roots, suggesting cervical radiculopathy rather than a shoulder pathology.'),
    (v_topic_id, 'In the cervical spine, what is the most common level for a degenerative disc herniation?', '["C3-C4", "C4-C5", "C5-C6", "C6-C7"]', 3, 'C6-C7 is the most common level for cervical disc herniation, followed by C5-C6.'),
    (v_topic_id, 'A 52-year-old woman presents with neck pain and numbness in her thumb and index finger. She has 4/5 strength in her wrist extensors. Which nerve root is affected?', '["C5", "C6", "C7", "C8"]', 1, 'C6 radiculopathy involves the biceps and wrist extensors (motor) and the thumb/index finger (sensory).'),
    (v_topic_id, 'Which structure is the primary stabilizer of the atlantoaxial (C1-C2) joint?', '["Ligamentum flavum", "Transverse ligament", "Posterior longitudinal ligament", "Anterior longitudinal ligament"]', 1, 'The transverse ligament holds the dens of C2 against the anterior arch of C1. Its disruption leads to atlantoaxial instability.'),

    -- CERVICAL SPONDYLOTIC MYELOPATHY (CSM)
    (v_topic_id, 'Which of the following is an "Upper Motor Neuron" (UMN) sign that suggests spinal cord compression (myelopathy) rather than just nerve root compression?', '["Hyporeflexia", "Fasciculations", "Hoffman sign", "Muscle atrophy in a specific dermatome"]', 2, 'Hoffman sign (flicking the middle finger nail causes thumb/index flexion) is a classic UMN sign of the upper extremity, indicating cervical myelopathy.'),
    (v_topic_id, 'A 70-year-old male presents with "clumsy hands," difficulty buttoning his shirt, and a wide-based, unstable gait. What is the most likely diagnosis?', '["Carpal tunnel syndrome", "Cervical Spondylotic Myelopathy (CSM)", "Lumbar stenosis", "Parkinson disease"]', 1, 'Loss of fine motor skills in the hands combined with gait instability is the classic presentation of CSM.'),
    (v_topic_id, 'A "positive Lhermitte sign" is described as:', '["Pain with neck extension", "An electric shock-like sensation radiating down the spine or into the limbs with neck flexion", "Numbness in the fingers", "A positive Babinski reflex"]', 1, 'Lhermitte sign suggests irritation or compression of the cervical spinal cord.'),
    (v_topic_id, 'What is the "Inverted Radial Reflex"?', '["A sign of radial nerve injury", "Tapping the brachioradialis tendon results in finger flexion rather than elbow flexion", "Hyperactive biceps reflex", "A sign of median nerve compression"]', 1, 'The inverted radial reflex is a sign of cervical myelopathy, typically localized to the C5-C6 level.'),
    (v_topic_id, 'Cervical myelopathy is typically characterized by which reflex pattern in the lower extremities?', '["Absent Achilles reflex", "Hyporeflexia", "Hyperreflexia and clonus", "Normal reflexes"]', 2, 'Myelopathy above the level of the conus medullaris results in UMN signs below the level of compression, including hyperreflexia and clonus.'),
    (v_topic_id, 'What is the "Nurick Scale" used for?', '["To grade cervical radiculopathy", "To classify the severity of gait impairment in cervical spondylotic myelopathy", "To measure scoliosis Cobb angles", "To assess disc height"]', 1, 'The Nurick scale ranges from 0 (neck pain only) to 5 (bedbound/wheelchair) based on gait impairment.'),
    (v_topic_id, 'Which imaging modality is most definitive for diagnosing spinal cord compression in CSM?', '["X-ray", "CT without contrast", "MRI", "Bone scan"]', 2, 'MRI provides the best visualization of the spinal cord, its surrounding CSF, and intramedullary signal changes.'),

    -- OPLL (OSSIFICATION OF THE POSTERIOR LONGITUDINAL LIGAMENT)
    (v_topic_id, 'Ossification of the Posterior Longitudinal Ligament (OPLL) is most prevalent in which ethnic population?', '["Caucasians", "African Americans", "East Asians (especially Japanese)", "Hispanics"]', 2, 'OPLL has a significantly higher prevalence in East Asian populations and is a major cause of cervical myelopathy in these groups.'),
    (v_topic_id, 'In OPLL, where is the ossified material located relative to the spinal cord?', '["Directly behind the vertebral bodies, anterior to the cord", "Behind the cord, in the lamina", "Within the spinal cord itself", "Lateral to the cord in the foramen"]', 0, 'The PLL sits on the posterior aspect of the vertebral bodies, meaning its ossification narrows the spinal canal from the front.'),
    (v_topic_id, 'Which imaging modality is BEST for characterizing the exact thickness and extent of the bony bridge in OPLL?', '["MRI", "CT Scan", "X-ray", "Ultrasound"]', 1, 'While MRI shows cord compression, CT is superior for visualizing the dense ossification of the ligament.'),

    -- ANATOMY & PHYSIOLOGY
    (v_topic_id, 'The "Uncovertebral joints" (Joints of Luschka) are found in which region of the spine?', '["Cervical (C3-C7)", "Thoracic", "Lumbar", "Sacral"]', 0, 'These joints are unique to the cervical spine and are common sites for osteophyte formation leading to foraminal stenosis.'),
    (v_topic_id, 'What is the "Atlantodental Interval" (ADI)?', '["The distance between C2 and C3", "The space between the posterior aspect of the C1 anterior arch and the anterior aspect of the odontoid process", "The width of the spinal canal", "The height of the dens"]', 1, 'In adults, an ADI > 3 mm (or > 5 mm in children) suggests atlantoaxial instability.'),
    (v_topic_id, 'Which ligament is primarily responsible for preventing posterior migration of the dens into the spinal canal?', '["Alar ligament", "Transverse ligament", "Apical ligament", "Ligamentum nuchae"]', 1, 'The transverse ligament of the atlas is the strongest and most important stabilizer of the C1-C2 complex.'),

    -- SURGICAL PRINCIPLES (CERVICAL)
    (v_topic_id, 'What is the primary risk of performing a posterior-only laminectomy for myelopathy in a patient with a kyphotic (forward-flexed) neck?', '["Increased neck pain", "The spinal cord remains \"draped\" over anterior osteophytes and is not effectively decompressed", "Higher infection rate", "Severe bleeding"]', 1, 'In a kyphotic neck, the cord is pulled forward against the anterior structures. Decompressing the back (laminectomy) does not pull the cord away from the pressure; anterior decompression or deformity correction is needed.'),
    (v_topic_id, 'Which surgical procedure involves the removal of the entire vertebral body to decompress the spinal cord?', '["Discectomy", "Corpectomy", "Laminectomy", "Laminoplasty"]', 1, 'A corpectomy is performed for multi-level disease or retrovertebral compression that cannot be addressed by simple discectomy.'),
    (v_topic_id, 'What is a "Laminoplasty"?', '["Total removal of the lamina", "Reconstruction of the lamina to expand the canal space while maintaining posterior stability and some motion", "Fusion of the facets", "Removal of a disc"]', 1, 'Laminoplasty "hinges" the lamina open to create more space, avoiding the stability issues sometimes seen with total laminectomy and the stiffness of a multi-level fusion.'),
    (v_topic_id, 'The "Anterior Cervical Discectomy and Fusion" (ACDF) approach carries a risk of injury to which nerve, leading to post-operative hoarseness?', '["Recurrent laryngeal nerve", "Phrenic nerve", "Vagus nerve", "Hypoglossal nerve"]', 0, 'The recurrent laryngeal nerve is at risk during the retracting phase of an anterior neck approach.'),

    -- RHEUMATOID ARTHRITIS & THE SPINE
    (v_topic_id, 'Which of the following is a classic cervical spine manifestation of severe Rheumatoid Arthritis?', '["Spondylolisthesis", "Atlantoaxial subluxation", "DISH", "Schuermann disease"]', 1, 'Chronic synovial inflammation (pannus) in RA destroys the transverse ligament, leading to C1-C2 instability.'),
    (v_topic_id, 'In RA, "Basilar Invagination" (or cranial settling) refers to:', '["C1 slipping forward on C2", "The dens of C2 migrating superiorly into the foramen magnum", "Fracture of the atlas", "Calcification of the disc"]', 1, 'This occurs as the lateral masses of C1 collapse, allowing the skull and atlas to "sink" relative to C2.'),
    (v_topic_id, 'What is the "Space Available for the Cord" (SAC)?', '["The total width of the vertebrae", "The distance between the posterior aspect of the dens and the posterior arch of the atlas", "The height of the foramen magnum", "The length of the spinal canal"]', 1, 'A SAC < 14 mm is a significant predictor of neurologic deficit in patients with atlantoaxial subluxation.'),

    -- DIFFERENTIAL DIAGNOSIS
    (v_topic_id, 'Which condition presents with sudden, severe shoulder/neck pain followed by muscle weakness and atrophy, with a normal cervical MRI?', '["C5 radiculopathy", "Parsonage-Turner Syndrome (Neuralgic Amyotrophy)", "Rotator cuff tear", "Pancoast tumor"]', 1, 'Parsonage-Turner syndrome is an idiopathic brachial plexitis that can mimic a high cervical radiculopathy but has characteristically normal spine imaging.'),
    (v_topic_id, 'A "Pancoast tumor" (superior sulcus tumor of the lung) can mimic which cervical nerve root lesion?', '["C5", "C6", "C7", "C8/T1"]', 3, 'The tumor can invade the lower roots of the brachial plexus, causing pain and weakness in the hand and medial forearm, often accompanied by Horner syndrome.'),

    -- THORACIC DISCS
    (v_topic_id, 'Why are thoracic disc herniations much less common than cervical or lumbar herniations?', '["Thoracic discs are thicker", "The rib cage stabilizes the thoracic spine, limiting motion and degenerative stress", "The thoracic canal is much larger", "Thoracic nerve roots are shorter"]', 1, 'The rigidity of the thoracic segment provided by the rib cage protects the discs from the repetitive stresses that cause herniation elsewhere.'),
    (v_topic_id, 'A central thoracic disc herniation is most likely to present with:', '["Shoulder pain", "Radicular rib pain", "Myelopathy (weakness and spasticity in the legs)", "Urinary tract infection"]', 2, 'Because the thoracic spinal canal is narrow and contains the cord, a central herniation often leads to direct cord compression (myelopathy).'),

    -- LUMBAR DISC HERNIATION & RADICULOPATHY
    (v_topic_id, 'In the lumbar spine, a "paracentral" disc herniation at the L4-L5 level typically compresses which nerve root?', '["L4 (exiting)", "L5 (traversing)", "S1", "L3"]', 1, 'In the lumbar spine, paracentral discs usually miss the exiting root (which is already in the foramen) and hit the traversing root that is heading for the next level down.'),
    (v_topic_id, 'A "far lateral" (foraminal) disc herniation at the L4-L5 level typically compresses which nerve root?', '["L4 (exiting)", "L5 (traversing)", "S1", "L3"]', 0, 'Far lateral discs are located within the neural foramen and thus compress the exiting nerve root.'),
    (v_topic_id, 'A patient with an L4 radiculopathy is most likely to show weakness in which movement?', '["Great toe extension", "Knee extension (Quadriceps)", "Ankle plantarflexion", "Hip extension"]', 1, 'L4 provides the primary motor supply to the quadriceps.'),
    (v_topic_id, 'Which reflex is mediated by the L4 nerve root?', '["Achilles reflex", "Patellar reflex", "Biceps reflex", "None"]', 1, 'The patellar (knee-jerk) reflex is the classic test for L4 integrity.'),
    (v_topic_id, 'Numbness on the top of the foot and weakness in great toe extension (Extensor Hallucis Longus) suggests involvement of which nerve root?', '["L3", "L4", "L5", "S1"]', 2, 'L5 radiculopathy characteristically affects EHL and the dorsal foot sensation.'),
    (v_topic_id, 'Weakness in ankle plantarflexion (Gastrocnemius/Soleus) and an absent Achilles reflex suggest involvement of which nerve root?', '["L4", "L5", "S1", "S2"]', 2, 'S1 radiculopathy affects the "calf" muscles and the ankle jerk reflex.'),
    (v_topic_id, 'Which nerve root is responsible for sensation on the lateral border of the foot and the small toe?', '["L4", "L5", "S1", "S2"]', 2, 'S1 supplies the lateral aspect of the foot.'),

    -- LUMBAR PHYSICAL EXAM
    (v_topic_id, 'A positive "Crossed Straight Leg Raise" test (pain in the affected leg when the ASYMPTOMATIC leg is lifted) is highly specific for:', '["Malingering", "Lumbar disc herniation", "Hip arthritis", "Sacroiliitis"]', 1, 'The crossed SLR is a very specific tension sign for a disc herniation.'),
    (v_topic_id, 'The "Slump Test" is used to evaluate for:', '["Scoliosis", "Lumbar radiculopathy/tension", "Spondylolisthesis", "Muscle strain"]', 1, 'The slump test puts maximal tension on the dural sac and nerve roots; it is often more sensitive than the standard SLR.'),
    (v_topic_id, 'Which nerve root is being tested by having the patient walk on their heels?', '["L4", "L5", "S1", "S2"]', 1, 'Walking on heels tests dorsiflexion (Tibialis anterior), which is primarily L4 and L5, but L5 is the dominant contributor.'),
    (v_topic_id, 'Which nerve root is being tested by having the patient walk on their toes?', '["L4", "L5", "S1", "S2"]', 2, 'Walking on toes tests plantarflexion, which is the S1 root.'),

    -- CAUDA EQUINA SYNDROME (CES)
    (v_topic_id, 'What is the most sensitive early indicator of Cauda Equina Syndrome?', '["Back pain", "Foot drop", "Urinary retention (increased post-void residual volume)", "Fever"]', 2, 'While saddle anesthesia and incontinence are classic, urinary retention (inability to void) is often the first sign of autonomic dysfunction in CES.'),
    (v_topic_id, '"Saddle anesthesia" involves loss of sensation in which dermatomes?', '["L1-L2", "L4-L5", "S2-S4", "T12-L1"]', 2, 'S2-S4 roots provide sensation to the perineal area.'),
    (v_topic_id, 'Cauda Equina Syndrome is considered an orthopedic emergency. What is the recommended time frame for surgical decompression to minimize permanent deficit?', '["Within 2 hours", "Within 24-48 hours", "Within 1 week", "Surgery is not always necessary"]', 1, 'Early decompression is critical for the recovery of bowel, bladder, and sexual function.'),

    -- MISC LUMBAR
    (v_topic_id, 'Which of the following is considered a "Red Flag" for back pain, necessitating urgent advanced imaging (MRI)?', '["Age > 50", "Pain worse with activity", "History of malignancy", "Unilateral leg pain"]', 2, 'History of cancer, unexplained weight loss, night pain, and fever are major red flags for malignancy or infection.'),
    (v_topic_id, 'Most lumbar disc herniations (without neurologic deficit) should be treated initially with:', '["Immediate microdiscectomy", "Absolute bed rest for 2 weeks", "Conservative management (NSAIDs, activity modification, physical therapy)", "Inversion table"]', 2, '90% of lumbar discs resolve or become asymptomatic within 6-12 weeks with conservative care.'),
    (v_topic_id, 'Which structure is removed during a "Microdiscectomy"?', '["The entire intervertebral disc", "Only the herniated fragment of the nucleus pulposus", "The vertebral body", "The facet joint"]', 1, 'A microdiscectomy is a targeted, minimally invasive removal of the offending herniated material.')
    ;
END $$;
