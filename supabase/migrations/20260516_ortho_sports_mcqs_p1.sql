-- Orthopedics: Part 1 (Questions 1-50)
-- Topic: Sports medicine & soft tissue injuries (General Principles & Shoulder)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug ortho-sports-medicine not found.';
    END IF;

    -- Master wipe for standalone MCQs in this topic
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- GENERAL PRINCIPLES
    (v_topic_id, 'Which of the following is the primary cell type responsible for tendon repair?', '["Chondrocytes", "Tenocytes (specialized fibroblasts)", "Osteoblasts", "Myocytes"]', 1, 'Tenocytes are specialized fibroblasts that synthesize collagen and ground substance in tendons.'),
    (v_topic_id, 'During the healing of a ligament, which type of collagen is initially deposited in high amounts before being replaced?', '["Type I", "Type II", "Type III", "Type X"]', 2, 'Type III collagen (immature) is deposited first in the proliferative phase, later being replaced by the stronger Type I collagen.'),
    (v_topic_id, 'What is the "toe region" of a ligament''s stress-strain curve?', '["The point of failure", "The phase where wavy collagen fibers straighten out with minimal force", "The linear elastic region", "The plastic deformation zone"]', 1, 'The toe region represents the initial straightening of collagen crimp.'),
    (v_topic_id, 'Which of the following describes "Creep" in musculoskeletal tissues?', '["Sudden rupture", "Gradual increase in strain under a constant load", "Loss of strength with age", "Muscle atrophy"]', 1, 'Creep is a time-dependent increase in deformation under a constant stress.'),
    (v_topic_id, 'What is the effect of "immobilization" on a ligament?', '["Increased strength", "Decrease in collagen mass, cross-linking, and overall tensile strength", "Hypertrophy of tenocytes", "Improved vascularity"]', 1, 'Immobilization leads to rapid degradation of ligamentous properties.'),

    -- SHOULDER (INTERNAL IMPINGEMENT)
    (v_topic_id, 'What is "Internal Impingement" of the shoulder, typically seen in overhead athletes?', '["Impingement of the rotator cuff under the acromion", "Entrapment of the posterior-superior rotator cuff between the humeral head and the posterosuperior glenoid", "Biceps tendonitis", "AC joint arthritis"]', 1, 'Internal impingement occurs in the late cocking phase of throwing (Abduction/External Rotation).'),
    (v_topic_id, 'Which clinical sign is often associated with internal impingement in pitchers?', '["Positive Neer test", "GIRD (Glenohumeral Internal Rotation Deficit)", "Positive O''Brien test", "Sulcus sign"]', 1, 'GIRD is common in throwing athletes due to posterior capsule tightness.'),
    (v_topic_id, 'The "PASTA" lesion stands for:', '["Partial Articular Surface Tendon Avulsion", "Posterior Anatomical Shoulder Tendon Atrophy", "Painful Acromial Sub-Tendon Abrasion", "None"]', 0, 'A PASTA lesion is a specific type of partial-thickness rotator cuff tear on the articular side.'),

    -- SHOULDER (PECTORALIS MAJOR)
    (v_topic_id, 'A 25-year-old bodybuilder feels a "pop" while performing a heavy bench press, followed by chest bruising and a loss of the anterior axillary fold. What is the most likely diagnosis?', '["Biceps rupture", "Pectoralis major rupture", "Rotator cuff tear", "Deltoid strain"]', 1, 'The bench press is the classic mechanism for Pec Major ruptures.'),
    (v_topic_id, 'Where is the most common site for a Pectoralis Major rupture?', '["The muscle belly", "The musculotendinous junction", "The insertion on the humerus", "The origin on the sternum"]', 2, 'Most surgical ruptures occur at the tendon insertion on the lateral lip of the bicipital groove.'),

    -- SHOULDER (SC JOINT)
    (v_topic_id, 'Which type of Sternoclavicular (SC) joint dislocation is considered a surgical emergency?', '["Anterior dislocation", "Posterior dislocation", "Superior dislocation", "Inferior dislocation"]', 1, 'Posterior SC dislocations can compress the trachea, esophagus, or great vessels in the superior mediastinum.'),
    (v_topic_id, 'What is the most appropriate next step for a stable patient with a suspected posterior SC joint dislocation?', '["Immediate open reduction", "CT scan of the chest to evaluate mediastinal structures", "X-ray and discharge", "Sling for 6 weeks"]', 1, 'Imaging (CT) is critical to assess for vascular or airway compromise before reduction.'),

    -- SHOULDER (GIRD & SCAPULAR DYSKINESIS)
    (v_topic_id, 'Which of the following is the hallmark of "Scapular Dyskinesis"?', '["Weakness of the deltoid", "Abnormal position or movement of the scapula during humeral motion", "A frozen shoulder", "Clavicle fracture"]', 1, 'It is often caused by muscle imbalance (e.g., weak serratus anterior or trapezius).'),
    (v_topic_id, '"Little League Shoulder" is best described as:', '["A rotator cuff tear in a child", "Proximal humeral epiphysiolysis (stress fracture of the growth plate)", "A shoulder dislocation", "Biceps tendonitis"]', 1, 'It is an overuse injury of the proximal humeral physis in young throwers.'),

    -- SHOULDER (NERVES)
    (v_topic_id, 'The "Suprascapular Nerve" is most commonly compressed at which two locations?', '["The suprascapular notch and the spinoglenoid notch", "The carpal tunnel and cubital tunnel", "The neck and the axilla", "None"]', 0, 'Cysts (e.g., from labral tears) at these notches can cause infraspinatus and/or supraspinatus weakness.'),
    (v_topic_id, 'Compression of the suprascapular nerve at the "Spinoglenoid Notch" typically causes weakness in which muscle?', '["Supraspinatus only", "Infraspinatus only", "Both supraspinatus and infraspinatus", "Deltoid"]', 1, 'Because the nerve has already supplied the supraspinatus before reaching the spinoglenoid notch, only the infraspinatus is affected.'),

    -- SHOULDER (MISC)
    (v_topic_id, 'What is the "Bennett Lesion" in a pitcher?', '["A labral tear", "An extra-articular posterior glenoid ossification associated with posterior capsule traction", "A humeral fracture", "A biceps rupture"]', 1, 'It is a radiographic finding often seen in chronic throwers.'),
    (v_topic_id, 'A "Snapping Scapula" is most commonly caused by inflammation of the:', '["Acromioclavicular joint", "Subscapular bursae (between the scapula and chest wall)", "Glenohumeral joint", "None"]', 1, 'Bursitis or bony prominences (Luschka''s tubercle) can cause painful crepitus.'),

    -- RECAP/ADVANCED
    (v_topic_id, 'Which rotator cuff muscle provides the primary restraint to "Anterior" humeral translation?', '["Supraspinatus", "Infraspinatus", "Subscapularis", "Teres minor"]', 2, 'The subscapularis is the anterior component of the cuff.'),
    (v_topic_id, 'True or False: The "Dead Arm Syndrome" is often a clinical manifestation of occult shoulder instability in athletes.', '["True", "False"]', 0, 'Transient subluxation can cause sharp pain and sudden weakness.'),
    (v_topic_id, 'The "Zanca View" is a specific radiographic view used to evaluate:', '["The glenoid", "The AC joint", "The SC joint", "The coracoid"]', 1, 'It involves an 10-15 degree cephalic tilt to improve AC joint visualization.'),

    -- TENDON REPAIR
    (v_topic_id, 'What is "Stress Shielding" in the context of tendon healing?', '["Protecting the tendon from all stress", "A phenomenon where a stiff implant carries too much load, preventing the tendon from receiving the mechanical stimulus needed for remodeling", "A type of bracing", "None"]', 1, 'Tendons need mechanical load to align collagen fibers correctly.'),
    (v_topic_id, 'Which cytokine is a major driver of the early inflammatory phase of tendon healing?', '["IL-10", "TGF-beta", "Insulin", "Estrogen"]', 1, 'TGF-beta is critical for collagen synthesis and cell proliferation.'),

    -- MORE SHOULDER
    (v_topic_id, 'What is the "Mumford Procedure"?', '["Rotator cuff repair", "Distal clavicle excision", "Labral repair", "Biceps tenodesis"]', 1, 'It is used for symptomatic AC joint arthritis or impingement.'),
    (v_topic_id, 'The "Latarjet Procedure" is used to treat:', '["Rotator cuff tears", "Recurrent shoulder instability with significant glenoid bone loss", "Frozen shoulder", "AC joint separation"]', 1, 'It involves transferring the coracoid process to the anterior glenoid to provide a bone block and a sling effect.'),
    (v_topic_id, 'In a "Bankart Repair," the labrum is reattached to which structure?', '["The humerus", "The glenoid rim", "The acromion", "The clavicle"]', 1, 'Restoring the labral "bumper" is the goal.'),

    -- ELBOW START (Sneak peek for Part 2)
    (v_topic_id, 'Which bundle of the Ulnar Collateral Ligament (UCL) is the primary stabilizer against valgus stress at the elbow?', '["Anterior bundle", "Posterior bundle", "Transverse bundle", "Lateral bundle"]', 0, 'The anterior bundle is the strongest and most clinically important component of the UCL.'),
    (v_topic_id, 'The "Moving Valgus Stress Test" is used to diagnose:', '["Tennis elbow", "UCL insufficiency", "Cubital tunnel syndrome", "Biceps rupture"]', 1, 'It is a dynamic test that reproduces valgus pain through the functional throwing range.'),

    -- ADDITIONAL 20+
    (v_topic_id, 'What is the "Quadrilateral Space Syndrome" compression?', '["Radial nerve", "Axillary nerve and posterior humeral circumflex artery", "Ulnar nerve", "Median nerve"]', 1, 'Symptoms include vague shoulder pain and deltoid/teres minor weakness.'),
    (v_topic_id, 'Which muscle forms the superior border of the quadrilateral space?', '["Teres major", "Teres minor", "Triceps (long head)", "Deltoid"]', 1, 'The boundaries are Teres minor (sup), Teres major (inf), Triceps long head (med), and Humerus (lat).'),
    (v_topic_id, 'What is the "Haglund Deformity" equivalent in the shoulder?', '["AC joint spur", "Os Acromiale", "Hooked acromion", "Hill-Sachs"]', 2, 'A hooked acromion (Type III) predisposes to impingement like a Haglund spur predisposes to Achilles issues.'),
    (v_topic_id, 'True or False: "Os Acromiale" is a failure of fusion of the acromial apophysis and can mimic a fracture.', '["True", "False"]', 0, 'It occurs in up to 15% of the population and can cause impingement symptoms.'),
    (v_topic_id, 'The most common site for an "Os Acromiale" is the junction between:', '["Meso-acromion and Meta-acromion", "Pre-acromion and Meso-acromion", "Meta-acromion and Basi-acromion", "None"]', 0, 'The meso-meta junction is the most frequent site of non-union.'),
    (v_topic_id, 'What is the "Kim Lesion" in the shoulder?', '["An anterior labral tear", "A concealed superficial tear of the posterior-inferior labrum", "A biceps tear", "A clavicle fracture"]', 1, 'It is associated with posterior instability.'),
    (v_topic_id, 'Which clinical test is most specific for "Posterior" shoulder instability?', '["Apprehension test", "Jerk test", "O''Brien test", "Neer test"]', 1, 'The Jerk test (axial load with internal rotation/adduction) is classic.'),
    (v_topic_id, 'What is "Buford Complex"?', '["A type of fracture", "A normal variant consisting of a cord-like middle glenohumeral ligament and an absent anterosuperior labrum", "A tumor", "None"]', 1, 'Surgeons must avoid "repairing" this variant, as it is normal anatomy.'),
    (v_topic_id, 'Which structure is the "Primary" stabilizer of the AC joint to horizontal (anteroposterior) translation?', '["CC ligaments", "AC ligaments", "Deltoid muscle", "Trapezius muscle"]', 1, 'AC ligaments handle horizontal stability; CC ligaments handle vertical stability.'),
    (v_topic_id, 'In the "Rockwood Classification" of AC joint injuries, which grade involves POSTERIOR displacement of the clavicle into the trapezius?', '["Grade III", "Grade IV", "Grade V", "Grade VI"]', 1, 'Grade IV is a posterior dislocation.'),
    (v_topic_id, 'What is the "West Point View" used to visualize?', '["The AC joint", "Anterior-inferior glenoid rim bone loss (Bony Bankart)", "The humeral head", "The SC joint"]', 1, 'It is a specialized axillary view.'),
    (v_topic_id, 'Which shoulder muscle is the primary "external" rotator when the arm is at the side (0 degrees abduction)?', '["Infraspinatus", "Supraspinatus", "Subscapularis", "Deltoid"]', 0, 'The infraspinatus is the main external rotator in this position.'),
    (v_topic_id, 'True or False: The "Long Head of the Biceps" is a significant stabilizer of the glenohumeral joint.', '["True", "False"]', 0, 'It acts as a humeral head depressor and stabilizer, especially in the setting of rotator cuff deficiency.'),
    (v_topic_id, 'What is the "Sling" of the long head of the biceps?', '["A brace", "The pulley system formed by the CHL, SGHL, and subscapularis/supraspinatus tendons at the bicipital groove", "The muscle belly", "None"]', 1, 'Disruption of the "pulley" leads to biceps instability/medial subluxation.'),
    (v_topic_id, 'Which clinical sign involves pain when the patient tries to place their hand on the OPPOSITE shoulder?', '["Neer sign", "Dugas sign", "Hawkins sign", "Speed sign"]', 1, 'It was historically used for shoulder dislocations.'),
    (v_topic_id, 'A "Glenohumeral Internal Rotation Deficit" (GIRD) of more than how many degrees is considered clinically significant?', '["5 degrees", "10 degrees", "20 degrees", "50 degrees"]', 2, 'A deficit of >20 degrees compared to the contralateral side increases injury risk.'),
    (v_topic_id, 'What is the "SICK Scapula" acronym?', '["Scapular Malposition, Inferior medial border prominence, Coracoid pain, and Dyskinesis of scapular movement", "Shoulder Injury and Chronic Knee pain", "None", "None"]', 0, 'It is a specific pattern of scapular dyskinesis.'),
    (v_topic_id, 'Which ligament is the primary restraint to "Posterior" humeral translation with the arm flexed and internally rotated?', '["SGHL", "MGHL", "Posterior-inferior Glenohumeral Ligament (PIGHL)", "ALL"]', 2, 'The inferior glenohumeral ligament complex (IGHLC) is the most important stabilizer in various positions.'),
    (v_topic_id, 'What is the "Walch Classification" used for?', '["Rotator cuff tears", "Glenoid morphology in the setting of osteoarthritis/instability", "Clavicle fractures", "None"]', 1, 'It describes glenoid retroversion and wear patterns.'),
    (v_topic_id, 'True or False: Most "Anterior" SC joint dislocations can be treated non-operatively.', '["True", "False"]', 0, 'Unlike posterior dislocations, anterior ones are usually cosmetic and do not threaten vital structures.'),
    (v_topic_id, 'Which tendon is typically used as a graft for a "LIGAMENT" reconstruction in the elbow (Tommy John surgery)?', '["Biceps", "Palmaris longus", "Triceps", "Achilles"]', 1, 'The palmaris longus (if present) is a common choice.'),
    (v_topic_id, 'Final Question Part 1: Which athlete is at HIGHEST risk for Suprascapular Neuropathy at the spinoglenoid notch?', '["Football players", "Volleyball players (especially during the serve/spike)", "Swimmers", "Runners"]', 1, 'The repetitive "follow-through" phase of the spike can stretch the nerve at the spinoglenoid notch.')
    ;
END $$;
