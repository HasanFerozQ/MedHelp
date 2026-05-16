-- Orthopedics: Part 3 (Questions 101-150)
-- Topic: Sports medicine & soft tissue injuries (Wrist, Hand & Hip)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- WRIST & HAND (TFCC)
    (v_topic_id, 'The Triangular Fibrocartilage Complex (TFCC) is the primary stabilizer of which joint?', '["Distal Radioulnar Joint (DRUJ)", "Radiocarpal joint", "Midcarpal joint", "First CMC joint"]', 0, 'The TFCC stabilizes the DRUJ and cushions the ulnar carpus.'),
    (v_topic_id, 'Which clinical test involves ulnar deviation and axial loading of the wrist to reproduce TFCC pain?', '["Phalen test", "TFCC Compression Test (Ulnar Grind)", "Finkelstein test", "Watson shift test"]', 1, 'This maneuver compresses the TFCC against the ulnar head.'),
    (v_topic_id, 'In "Ulnar Impaction Syndrome," the ulna is relatively:', '["Short (Ulnar Minus)", "Long (Ulnar Plus)", "Neutral", "None"]', 1, 'Positive ulnar variance (ulnar plus) leads to increased load on the TFCC and lunate.'),

    -- WRIST & HAND (DE QUERVAIN'S & FINGERS)
    (v_topic_id, 'De Quervain''s Tenosynovitis involves which two tendons in the first dorsal compartment?', '["Abductor Pollicis Longus (APL) and Extensor Pollicis Brevis (EPB)", "EPL and ECRL", "FCR and PL", "None"]', 0, 'Repetitive thumb use (e.g., in golf or racquet sports) irritates these tendons.'),
    (v_topic_id, 'A "Jersey Finger" is an avulsion of which tendon?', '["Flexor Digitorum Profundus (FDP)", "Flexor Digitorum Superficialis (FDS)", "Extensor Digitorum", "Biceps"]', 0, 'It typically occurs in the ring finger when an athlete grabs a jersey and the finger is forced into extension while actively flexing.'),
    (v_topic_id, 'A "Mallet Finger" involves an injury to the:', '["FDP tendon", "Terminal extensor tendon at the DIP joint", "Central slip at the PIP joint", "UCL of the thumb"]', 1, 'The result is an inability to actively extend the DIP joint.'),
    (v_topic_id, 'A "Boutonniere Deformity" is caused by a rupture of the:', '["Terminal extensor tendon", "Central slip of the extensor hood at the PIP joint", "Volar plate", "Collateral ligament"]', 1, 'This leads to PIP flexion and DIP hyperextension.'),
    (v_topic_id, 'What is "Skier''s Thumb"?', '["Rupture of the Radial Collateral Ligament of the thumb", "Acute rupture of the Ulnar Collateral Ligament (UCL) of the thumb MCP joint", "A fracture of the distal phalanx", "None"]', 1, 'It is caused by forced abduction of the thumb (e.g., by a ski pole).'),
    (v_topic_id, 'A "Stener Lesion" occurs when which structure becomes interposed between the torn UCL and its insertion in the thumb?', '["The adductor pollicis aponeurosis", "The flexor pollicis longus", "The abductor pollicis", "None"]', 0, 'A Stener lesion prevents healing and is a definitive indication for surgical repair.'),

    -- WRIST & HAND (GYMNAST'S WRIST)
    (v_topic_id, '"Gymnast''s Wrist" is a chronic stress injury of the:', '["Scaphoid", "Distal radial physis (growth plate)", "Lunate", "TFCC"]', 1, 'Repetitive weight-bearing on the hands causes physeal widening and potential premature closure.'),

    -- WRIST & HAND (HOOK OF HAMATE)
    (v_topic_id, 'Fractures of the "Hook of the Hamate" are classically seen in athletes playing which sports?', '["Golf, Baseball, and Tennis", "Football and Soccer", "Swimming", "Running"]', 0, 'The "butt" of the club or racquet strikes the hamate hook during a swing.'),

    -- HIP (FAI - FEMOROACETABULAR IMPINGEMENT)
    (v_topic_id, 'Which type of FAI involves an abnormal "bump" at the femoral head-neck junction?', '["Pincer type", "Cam type", "Mixed type", "None"]', 1, 'Cam impingement is more common in young active males.'),
    (v_topic_id, 'Which type of FAI involves over-coverage of the femoral head by the acetabulum?', '["Pincer type", "Cam type", "Mixed type", "None"]', 0, 'Pincer impingement is often due to acetabular retroversion or profunda.'),
    (v_topic_id, 'The "Alpha Angle" on an axial MRI or Dunn view X-ray is used to quantify:', '["Acetabular depth", "Femoral head-neck asphericity (Cam lesion)", "Hip dysplasia", "None"]', 1, 'An angle >50-55 degrees suggests a Cam deformity.'),

    -- HIP (LABRAL TEARS)
    (v_topic_id, 'Where is the most common location for an athletic hip labral tear?', '["Posterior-superior", "Anterior-superior", "Inferior", "None"]', 1, 'This area receives the highest stress during hip flexion and internal rotation.'),
    (v_topic_id, 'The "FADIR" test (Flexion, Adduction, Internal Rotation) is most sensitive for:', '["Hip dysplasia", "FAI and Labral tears", "Sacroiliac joint dysfunction", "Gluteal tendinopathy"]', 1, 'It is the classic provocative maneuver for anterior impingement.'),

    -- HIP (ATHLETIC PUBALGIA / SPORTS HERNIA)
    (v_topic_id, 'What is the primary pathology in "Athletic Pubalgia"?', '["A true inguinal hernia", "Weakness of the posterior inguinal wall and imbalance between the adductors and abdominal muscles", "A stress fracture of the pubis", "None"]', 1, 'It is NOT a true hernia but a "core muscle injury."'),
    (v_topic_id, 'Which two structures are most commonly involved in the "crossover" injury of athletic pubalgia?', '["Rectus abdominis and Adductor longus", "Obliques and Gluteals", "Iliopsoas and Rectus femoris", "None"]', 0, 'The tension between the superior pull of the rectus and the inferior pull of the adductor stresses the pubic symphysis area.'),

    -- HIP (SNAPPING HIP)
    (v_topic_id, '"External" snapping hip syndrome (Coxa Saltans) is caused by the snapping of which structure over the greater trochanter?', '["Iliopsoas tendon", "Iliotibial (IT) band or gluteus maximus", "Ligamentum teres", "Piriformis"]', 1, 'It is usually felt laterally.'),
    (v_topic_id, '"Internal" snapping hip involves the snapping of the:', '["IT band", "Iliopsoas tendon over the iliopectineal eminence or femoral head", "Labrum", "Hamstrings"]', 1, 'This is typically felt in the groin/anterior hip area.'),

    -- HIP (MERALGIA PARESTHETICA)
    (v_topic_id, 'Meralgia Paresthetica involves compression of which nerve?', '["Femoral nerve", "Lateral Femoral Cutaneous Nerve (LFCN)", "Obturator nerve", "Sciatic nerve"]', 1, 'It causes burning/numbness over the lateral thigh but NO motor weakness.'),

    -- HIP (ADDUCTOR STRAINS)
    (v_topic_id, 'Which adductor muscle is most frequently strained in sports?', '["Adductor magnus", "Adductor longus", "Gracilis", "Pectineus"]', 1, 'The adductor longus is the most vulnerable during eccentric loading.'),

    -- HIP (HAMSTRINGS)
    (v_topic_id, 'What is the most common mechanism for a proximal hamstring rupture?', '["Forced hip flexion with the knee in extension", "Forced hip extension", "Sudden knee flexion", "None"]', 0, 'Classic example: water skiing or sprinting "kick" phase.'),
    (v_topic_id, 'How many of the three hamstring tendons must be ruptured for surgery to be strongly considered in an athlete?', '["One", "At least two, or a single tendon with >2cm retraction", "All three", "None"]', 1, 'Significant retraction or multi-tendon involvement usually warrants repair.'),

    -- HIP (RECTUS FEMORIS)
    (v_topic_id, 'A "Bullseye Sign" on MRI of the thigh suggests a tear of which muscle?', '["Biceps femoris", "Rectus femoris (intramuscular tendon tear)", "Vastus lateralis", "Sartorius"]', 1, 'The deep intramuscular tendon of the rectus femoris can tear, creating this MRI appearance.'),

    -- WRIST & HAND (SCAPHOID)
    (v_topic_id, 'Why are scaphoid fractures at the "Proximal Pole" particularly prone to non-union and avascular necrosis?', '["The proximal pole is the largest part", "The blood supply enters distally and flows retrograde", "The bone is too soft", "None"]', 1, 'The retrograde blood supply leaves the proximal pole "high and dry" if fractured.'),
    (v_topic_id, 'What is the most sensitive physical exam finding for a scaphoid fracture?', '["Pain in the anatomic snuffbox", "Pain with wrist flexion", "Pain with supination", "None"]', 0, 'Snuffbox tenderness is the hallmark.'),

    -- WRIST (S-L LIGAMENT)
    (v_topic_id, 'The "Terry Thomas Sign" on X-ray indicates a tear of which ligament?', '["Scapholunate (SL) ligament", "Lunotriquetral (LT) ligament", "TFCC", "Radial collateral"]', 0, 'Named after a gap between the front teeth, it represents a widened SL interval (>3mm).'),
    (v_topic_id, 'What is the "VISI" pattern of carpal instability?', '["Volar Intercalated Segment Instability", "Vertical Internal Stress Injury", "None", "None"]', 0, 'It is associated with Lunotriquetral (LT) ligament tears.'),
    (v_topic_id, 'The "DISI" pattern (Dorsal Intercalated Segment Instability) is associated with:', '["LT tear", "SL ligament tear", "Radius fracture", "None"]', 1, 'The lunate tilts dorsally when the SL ligament is gone.'),

    -- HAND (BOXER''S FRACTURE)
    (v_topic_id, 'A "Boxer''s Fracture" is a fracture of the:', '["1st metacarpal neck", "5th metacarpal neck", "Scaphoid", "Hamate"]', 1, 'It is caused by a punch with a clenched fist.'),

    -- HIP (MISC)
    (v_topic_id, 'What is "Osteitis Pubis"?', '["A bacterial infection", "Non-infectious inflammation of the pubic symphysis, often seen in athletes with repetitive kicking/twisting", "A tumor", "None"]', 1, 'Radiographs may show "moth-eaten" or sclerotic changes at the symphysis.'),
    (v_topic_id, 'The "Log Roll" test is used to evaluate for:', '["Knee instability", "Intra-articular hip pathology (e.g., synovitis, labral tear)", "Lumbar spine issues", "None"]', 1, 'Internal and external rotation of the femur in extension stresses the joint capsule.'),

    -- ADDITIONAL 15+
    (v_topic_id, 'Which nerve supplies the "Adductor" group in the hip?', '["Femoral", "Obturator", "Sciatic", "Gluteal"]', 1, 'Except for the hamstring part of the adductor magnus (sciatic).'),
    (v_topic_id, 'What is "Piriformis Syndrome"?', '["Compression of the sciatic nerve by the piriformis muscle", "A hip fracture", "A knee injury", "None"]', 0, 'It presents with buttock pain and sciatica-like symptoms.'),
    (v_topic_id, 'True or False: The "Ligamentum Teres" can be a source of hip pain and instability in athletes.', '["True", "False"]', 0, 'Hypertrophy or tearing of this ligament can cause mechanical symptoms.'),
    (v_topic_id, 'Which carpal bone is the most commonly fractured?', '["Lunate", "Scaphoid", "Hamate", "Triquetrum"]', 1, 'The scaphoid accounts for ~60-70% of carpal fractures.'),
    (v_topic_id, 'What is "Kienbock''s Disease"?', '["Avascular necrosis of the scaphoid", "Avascular necrosis of the lunate", "A type of arthritis", "None"]', 1, 'It is often associated with "Ulnar Minus" variance.'),
    (v_topic_id, 'The "Eichhoff Test" is a variant of which test for De Quervain''s?', '["Phalen", "Finkelstein", "Allen", "Froment"]', 1, 'Though often called Finkelstein''s, the patient-performed version is technically Eichhoff''s.'),
    (v_topic_id, 'Which structure is the "Primary" restraint to ulnar deviation of the thumb MCP joint?', '["Radial collateral ligament", "Ulnar collateral ligament", "Volar plate", "Adductor pollicis"]', 1, 'The UCL prevents valgus stress.'),
    (v_topic_id, 'A "Sagittal Band" injury (Boxer''s Knuckle) causes:', '["Inability to flex", "Subluxation of the extensor tendon at the MCP joint", "Trigger finger", "None"]', 1, 'It is most common in the middle finger.'),
    (v_topic_id, 'What is "Gamekeeper''s Thumb"?', '["Acute UCL tear", "Chronic UCL insufficiency of the thumb", "A fracture", "None"]', 1, 'Named after Scottish gamekeepers who developed chronic UCL laxity from snapping necks of rabbits.'),
    (v_topic_id, 'True or False: A "Bennett Fracture" is an intra-articular fracture of the base of the first metacarpal.', '["True", "False"]', 0, 'It involves subluxation due to the pull of the APL tendon.'),
    (v_topic_id, 'What is a "Rolando Fracture"?', '["A non-displaced fracture", "A comminuted Y or T-shaped intra-articular fracture of the base of the first metacarpal", "A stress fracture", "None"]', 1, 'It has a worse prognosis than a Bennett fracture.'),
    (v_topic_id, 'The "Hip-Spine Syndrome" refers to:', '["The co-existence of hip and lumbar spine pathology, making diagnosis difficult", "A type of scoliosis", "None", "None"]', 0, 'Groin pain can be from the hip or L2-L3 radiculopathy.'),
    (v_topic_id, 'Which muscle is the primary "Internal" rotator of the hip?', '["Gluteus medius and minimus (anterior fibers)", "Piriformis", "Obturator internus", "Gluteus maximus"]', 0, 'The gluteals are the main drivers of internal rotation in certain positions.'),
    (v_topic_id, 'What is the "Dreaded Black Line" in the context of stress fractures?', '["A sign of healing", "A transverse cortical lucency on the tension side of a bone (e.g., anterior tibia), suggesting high risk of completion", "A growth plate", "None"]', 1, 'It indicates a high-risk stress fracture that may require surgical fixation.'),
    (v_topic_id, 'Which carpal bone is involved in "Preiser''s Disease"?', '["Lunate", "Scaphoid", "Hamate", "Triquetrum"]', 1, 'Preiser''s disease is idiopathic avascular necrosis of the scaphoid.'),
    (v_topic_id, 'The "Waiters Tip" deformity is associated with an injury to which part of the brachial plexus?', '["Upper trunk (C5-C6)", "Lower trunk (C8-T1)", "Posterior cord", "None"]', 0, 'Known as Erb''s Palsy, it can occur in contact sports or birth trauma.'),
    (v_topic_id, 'Final Question Part 3: What is the "Neutral" position for testing the strength of the Subscapularis in the "Belly Press" test?', '["Hand on the belly, elbow in front of the body", "Hand behind the back", "Hand on the head", "None"]', 0, 'It isolates the subscapularis by preventing substitution by the pectoralis and latissimus.')
    ;
END $$;
