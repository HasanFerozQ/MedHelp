-- MediHelp: USMLE Step 1 - Anatomy (50 Case Blocks)
-- Idempotent Migration: Locates existing topic and ensures a clean state.

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Find existing "Anatomy" Topic for USMLE Step 1
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title ILIKE '%Anatomy%' AND usmle_step = 1 
    LIMIT 1;

    -- 2. If not found, create it (fallback)
    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (title, slug, usmle_step, "order")
        VALUES ('Anatomy', 'anatomy-step-1', 1, 5)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. CLEAN UP: Remove existing cases for this topic to ensure a clean state
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- CASE 1
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Radial Nerve (Spiral Groove)', 'A 25-year-old man falls asleep with his arm draped over a park bench. On waking, he cannot extend his wrist or fingers.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is most likely injured?', to_jsonb(ARRAY['Axillary nerve', 'Median nerve', 'Radial nerve', 'Ulnar nerve', 'Musculocutaneous nerve']), 2, 'Compression of the radial nerve in the spiral groove causes wrist drop.'),
    (v_case_id, 'The lesion most likely occurred in which region?', to_jsonb(ARRAY['Cubital tunnel', 'Surgical neck of humerus', 'Spiral groove of humerus', 'Carpal tunnel', 'Quadrangular space']), 2, 'Spiral groove of humerus is the classic site.'),
    (v_case_id, 'Which additional finding is most likely?', to_jsonb(ARRAY['Loss of thumb opposition', 'Sensory loss over lateral forearm', 'Sensory loss over dorsal first web space', 'Loss of shoulder abduction initiation', 'Inability to flex DIP of 4th and 5th digits']), 2, 'Radial nerve supplies sensation to the dorsal first web space.');

    -- CASE 2
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Axillary Nerve Injury', 'A 19-year-old football player has an anterior shoulder dislocation. He now has difficulty abducting his arm from 15° to 90° and has numbness over the lateral shoulder.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Radial', 'Axillary', 'Musculocutaneous', 'Suprascapular', 'Long thoracic']), 1, 'Anterior shoulder dislocation commonly injures the axillary nerve.'),
    (v_case_id, 'Which muscle is primarily weak?', to_jsonb(ARRAY['Supraspinatus', 'Deltoid', 'Infraspinatus', 'Teres major', 'Biceps brachii']), 1, 'The axillary nerve innervates the deltoid.'),
    (v_case_id, 'Sensory loss is most likely over the:', to_jsonb(ARRAY['Medial forearm', 'Lateral shoulder ("regimental badge" area)', 'Palmar thumb', 'Dorsal 5th digit', 'Lateral hand']), 1, 'Axillary nerve provides sensation over the regimental badge area.');

    -- CASE 3
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Long Thoracic Nerve Injury', 'A woman undergoes mastectomy with axillary lymph node dissection. Postoperatively she has difficulty raising her arm above her head and has scapular winging when pushing against a wall.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve was injured?', to_jsonb(ARRAY['Dorsal scapular', 'Thoracodorsal', 'Long thoracic', 'Spinal accessory', 'Suprascapular']), 2, 'Injury to the long thoracic nerve denervates serratus anterior.'),
    (v_case_id, 'Which muscle is denervated?', to_jsonb(ARRAY['Trapezius', 'Serratus anterior', 'Rhomboid major', 'Latissimus dorsi', 'Levator scapulae']), 1, 'Long thoracic nerve -> Serratus anterior.'),
    (v_case_id, 'Loss of this muscle impairs:', to_jsonb(ARRAY['Elbow extension', 'Forearm supination', 'Upward rotation of scapula', 'Shoulder adduction', 'Flexion of shoulder']), 2, 'Serratus anterior rotates the scapula upward to allow abduction above 90 degrees.');

    -- CASE 4
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Midshaft Humeral Fracture', 'A patient with a midshaft humeral fracture has weakness extending the wrist but can still extend the elbow.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Why is elbow extension relatively preserved?', to_jsonb(ARRAY['Ulnar nerve compensation', 'Median nerve innervation to triceps', 'Proximal branches to triceps arise before the injury', 'Musculocutaneous innervation to triceps', 'Axillary contribution to triceps']), 2, 'Triceps branches often arise proximal to the spiral groove.'),
    (v_case_id, 'Which reflex may still be intact?', to_jsonb(ARRAY['Biceps reflex', 'Triceps reflex partially preserved', 'Patellar reflex', 'Achilles reflex', 'Jaw jerk']), 1, 'Triceps reflex may be spared if proximal branches are intact.'),
    (v_case_id, 'Which artery accompanies the nerve in the groove?', to_jsonb(ARRAY['Posterior circumflex humeral artery', 'Profunda brachii artery', 'Brachial artery', 'Radial artery', 'Ulnar artery']), 1, 'Radial nerve travels with profunda brachii.');

    -- CASE 5
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Median Nerve (Recurrent Branch)', 'A carpenter accidentally lacerates his wrist and cannot oppose the thumb. Thenar eminence sensation is intact.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which branch is injured?', to_jsonb(ARRAY['Ulnar recurrent branch', 'Recurrent branch of median nerve', 'Palmar cutaneous branch of median nerve', 'Deep branch of ulnar nerve', 'Superficial radial nerve']), 1, 'The recurrent branch innervates the thenar muscles.'),
    (v_case_id, 'Thenar eminence sensation is intact because it is supplied by:', to_jsonb(ARRAY['Deep branch of ulnar nerve', 'Palmar cutaneous branch of median nerve', 'Radial nerve only', 'Medial antebrachial cutaneous nerve', 'Lateral antebrachial cutaneous nerve']), 1, 'The palmar cutaneous branch arises proximal to the carpal tunnel.'),
    (v_case_id, 'Which movement is most affected?', to_jsonb(ARRAY['Thumb extension', 'Thumb opposition', 'Thumb adduction', 'Wrist extension', 'DIP flexion of index finger']), 1, 'Opposition is the primary function of the thenar muscles.');

    -- CASE 6
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Carpal Tunnel Syndrome', 'A patient has numbness in the lateral 3½ digits and weakness of thumb opposition that worsens at night.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which syndrome is most likely?', to_jsonb(ARRAY['Cubital tunnel syndrome', 'Carpal tunnel syndrome', 'Guyon canal syndrome', 'Pronator teres syndrome', 'Radial tunnel syndrome']), 1, 'Classic carpal tunnel presentation.'),
    (v_case_id, 'Which structure forms the roof of the tunnel?', to_jsonb(ARRAY['Palmar aponeurosis', 'Flexor retinaculum', 'Extensor retinaculum', 'Pronator quadratus', 'Deep transverse metacarpal ligament']), 1, 'The flexor retinaculum (transverse carpal ligament) forms the roof.'),
    (v_case_id, 'Which structure is NOT within the carpal tunnel?', to_jsonb(ARRAY['Median nerve', 'Flexor digitorum superficialis tendons', 'Flexor pollicis longus tendon', 'Flexor carpi radialis tendon', 'Flexor digitorum profundus tendons']), 3, 'Flexor carpi radialis runs in its own compartment.');

    -- CASE 7
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Ulnar Nerve (Medial Epicondyle)', 'A patient fractures the medial epicondyle and later develops clawing of the 4th and 5th digits.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is most likely injured?', to_jsonb(ARRAY['Median', 'Radial', 'Ulnar', 'Musculocutaneous', 'Axillary']), 2, 'Ulnar nerve runs behind the medial epicondyle.'),
    (v_case_id, 'Which intrinsic hand muscle is denervated?', to_jsonb(ARRAY['Thenar muscles only', 'Lateral two lumbricals only', 'Interossei', 'Opponens pollicis', 'Abductor pollicis brevis']), 2, 'Ulnar nerve innervates all interossei.'),
    (v_case_id, 'Which movement is impaired?', to_jsonb(ARRAY['Finger abduction/adduction', 'Thumb opposition', 'Wrist extension', 'Elbow flexion', 'Supination']), 0, 'Interossei are needed for finger abduction/adduction.');

    -- CASE 8
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Anterior Interosseous Nerve', 'A patient cannot make an "OK sign" with the thumb and index finger after a forearm injury.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve branch is likely injured?', to_jsonb(ARRAY['Recurrent median nerve', 'Deep branch of ulnar nerve', 'Anterior interosseous nerve', 'Posterior interosseous nerve', 'Superficial radial nerve']), 2, 'AIN innervates FPL and lateral FDP.'),
    (v_case_id, 'Which muscles are affected?', to_jsonb(ARRAY['Abductor pollicis brevis and opponens pollicis', 'Flexor pollicis longus and lateral FDP', 'Extensor pollicis longus and extensor indicis', 'Adductor pollicis and first dorsal interosseous', 'Pronator teres and FCU']), 1, 'Flexor pollicis longus and lateral FDP are needed for the OK pinch.'),
    (v_case_id, 'Sensory loss is:', to_jsonb(ARRAY['Present over palmar 3½ digits', 'Present over dorsal thumb', 'Absent because this branch is motor only', 'Present over hypothenar eminence', 'Present over lateral forearm']), 2, 'The AIN is a motor branch.');

    -- CASE 9
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Musculocutaneous Nerve', 'A man has numbness over the lateral forearm after a stab wound to the arm. Elbow flexion is weak, but forearm supination is still partly possible.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Radial', 'Musculocutaneous', 'Median', 'Ulnar', 'Axillary']), 1, 'Musculocutaneous nerve innervates the anterior arm flexors.'),
    (v_case_id, 'Which terminal sensory branch carries the cutaneous fibers?', to_jsonb(ARRAY['Medial antebrachial cutaneous nerve', 'Posterior antebrachial cutaneous nerve', 'Lateral antebrachial cutaneous nerve', 'Palmar cutaneous branch', 'Dorsal cutaneous branch']), 2, 'The musculocutaneous nerve continues as the lateral antebrachial cutaneous nerve.'),
    (v_case_id, 'Supination is partly preserved because of:', to_jsonb(ARRAY['Pronator teres', 'Triceps', 'Brachialis', 'Biceps assistance from median nerve', 'Supinator muscle via radial nerve']), 4, 'Supinator is innervated by the radial nerve.');

    -- CASE 10
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Posterior Cord Injury', 'A stab wound in the axilla injures the posterior cord of the brachial plexus.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve arising from this cord may be affected?', to_jsonb(ARRAY['Musculocutaneous', 'Median lateral root only', 'Ulnar', 'Radial', 'Long thoracic']), 3, 'Radial nerve arises from the posterior cord.'),
    (v_case_id, 'Which artery helps define the cords of the brachial plexus?', to_jsonb(ARRAY['Axillary artery', 'Axillary vein', 'Subclavian vein', 'Brachial artery', 'Profunda brachii artery']), 0, 'Cords are named relative to the axillary artery.'),
    (v_case_id, 'Which two major nerves arise from the posterior cord?', to_jsonb(ARRAY['Ulnar and median', 'Radial and axillary', 'Musculocutaneous and median', 'Long thoracic and dorsal scapular', 'Suprascapular and axillary']), 1, 'Axillary and Radial nerves come from the posterior cord.');

    -- CASE 11
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Femoral Neck Fracture', 'A patient has a fracture of the femoral neck and undergoes surgery. Postoperatively, the blood supply to the femoral head is a concern.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'In adults, the main blood supply to the femoral head usually comes from:', to_jsonb(ARRAY['Obturator artery via ligamentum teres', 'Medial circumflex femoral artery', 'Inferior gluteal artery', 'Lateral circumflex femoral artery only', 'Popliteal artery']), 1, 'Medial circumflex femoral artery is the primary supply.'),
    (v_case_id, 'Injury to this vessel risks:', to_jsonb(ARRAY['Posterior knee dislocation', 'Avascular necrosis of femoral head', 'Foot drop', 'Trendelenburg gait', 'Tarsal tunnel syndrome']), 1, 'Avascular necrosis is a major risk in femoral neck fractures.'),
    (v_case_id, 'In children, an additional contribution may come from:', to_jsonb(ARRAY['Fibular artery', 'Artery in ligament of head of femur', 'Superior gluteal artery only', 'Inferior epigastric artery', 'Great saphenous vein']), 1, 'The artery of the ligamentum teres is more important in children.');

    -- CASE 12
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Posterior Hip Dislocation', 'A patient has a posterior hip dislocation after a motor vehicle accident and develops weakness of knee flexion and all movements below the knee.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Femoral', 'Obturator', 'Sciatic', 'Superior gluteal', 'Inferior gluteal']), 2, 'The sciatic nerve is often injured in posterior dislocations.'),
    (v_case_id, 'Which muscle action is most likely preserved?', to_jsonb(ARRAY['Hamstring function completely absent', 'Knee extension', 'Plantarflexion', 'Dorsiflexion', 'Toe flexion']), 1, 'Knee extension is femoral nerve (L2-L4).'),
    (v_case_id, 'The injured nerve normally exits the pelvis through the:', to_jsonb(ARRAY['Greater sciatic foramen below piriformis', 'Lesser sciatic foramen', 'Obturator canal', 'Femoral canal', 'Inguinal canal']), 0, 'The sciatic nerve exits below the piriformis.');

    -- CASE 13
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Superior Gluteal Nerve Injury', 'A patient has weakness of hip abduction after intramuscular injection in the gluteal region and pelvis drops on the opposite side while walking.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Sciatic', 'Superior gluteal', 'Inferior gluteal', 'Femoral', 'Obturator']), 1, 'Superior gluteal nerve innervates hip abductors.'),
    (v_case_id, 'Which muscles are denervated?', to_jsonb(ARRAY['Gluteus maximus only', 'Gluteus medius and minimus', 'Adductor longus and magnus', 'Iliopsoas and sartorius', 'Biceps femoris and semitendinosus']), 1, 'Gluteus medius and minimus are the primary abductors.'),
    (v_case_id, 'This gait abnormality is:', to_jsonb(ARRAY['Steppage gait', 'Trendelenburg gait', 'Antalgic gait', 'Circumduction gait', 'Waddling']), 1, 'Trendelenburg gait is the classic finding.');

    -- CASE 14
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Inferior Gluteal Nerve Injury', 'A patient cannot climb stairs well or rise from a seated position after a gluteal injection. He also has weakness extending the hip.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is most likely injured?', to_jsonb(ARRAY['Superior gluteal', 'Inferior gluteal', 'Sciatic', 'Femoral', 'Obturator']), 1, 'Inferior gluteal nerve innervates gluteus maximus.'),
    (v_case_id, 'Which muscle is primarily affected?', to_jsonb(ARRAY['Gluteus medius', 'Gluteus minimus', 'Gluteus maximus', 'Tensor fasciae latae', 'Piriformis']), 2, 'Gluteus maximus is the primary hip extensor.'),
    (v_case_id, 'Proper safe site for IM gluteal injection is the:', to_jsonb(ARRAY['Inferomedial quadrant', 'Inferolateral quadrant', 'Superomedial quadrant', 'Superolateral quadrant', 'Central gluteal region']), 3, 'Superolateral quadrant is the safest site.');

    -- CASE 15
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Common Fibular Nerve Injury', 'A fibular neck fracture causes loss of dorsiflexion and foot eversion.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Tibial', 'Sural', 'Common fibular', 'Deep fibular only', 'Superficial fibular only']), 2, 'The common fibular nerve wraps around the neck of the fibula.'),
    (v_case_id, 'This produces:', to_jsonb(ARRAY['Trendelenburg gait', 'Foot drop', 'Waddling gait', 'Scissors gait', 'Ataxic gait']), 1, 'Loss of dorsiflexion leads to foot drop.'),
    (v_case_id, 'Sensory loss may involve:', to_jsonb(ARRAY['Sole of foot only', 'First dorsal web space and dorsum of foot', 'Medial leg only', 'Posterior thigh only', 'Heel only']), 1, 'The common fibular supplies the dorsum of the foot.');

    -- CASE 16
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Superficial Fibular Nerve', 'A patient has numbness over the lateral leg and dorsum of foot but dorsiflexion is intact. Eversion is weak.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Deep fibular', 'Superficial fibular', 'Tibial', 'Saphenous', 'Sural']), 1, 'Superficial fibular nerve innervates the lateral compartment.'),
    (v_case_id, 'Which muscles are weak?', to_jsonb(ARRAY['Tibialis anterior and EDL', 'Fibularis longus and brevis', 'Gastrocnemius and soleus', 'FDL and FHL', 'Popliteus and plantaris']), 1, 'Fibularis longus and brevis perform eversion.'),
    (v_case_id, 'Which function is preserved?', to_jsonb(ARRAY['Eversion', 'Dorsiflexion', 'Toe extension', 'Sensation between first two toes only lost', 'Plantarflexion always absent']), 1, 'Dorsiflexion is deep fibular nerve.');

    -- CASE 17
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Deep Fibular Nerve', 'A patient has numbness between the first and second toes and weak dorsiflexion.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Tibial', 'Superficial fibular', 'Deep fibular', 'Sural', 'Saphenous']), 2, 'Deep fibular nerve supplies the anterior compartment.'),
    (v_case_id, 'Which muscle is affected?', to_jsonb(ARRAY['Fibularis longus', 'Tibialis anterior', 'Gastrocnemius', 'Tibialis posterior', 'Flexor hallucis longus']), 1, 'Tibialis anterior performs dorsiflexion.'),
    (v_case_id, 'Which syndrome is it vulnerable in?', to_jsonb(ARRAY['Tarsal tunnel syndrome', 'Anterior compartment syndrome', 'Popliteal aneurysm', 'Obturator hernia', 'Femoral triangle injury']), 1, 'The deep fibular nerve is in the anterior compartment.');

    -- CASE 18
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Tibial Nerve Injury', 'A patient cannot stand on tiptoes and has loss of plantarflexion after a popliteal fossa injury.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Common fibular', 'Tibial', 'Femoral', 'Obturator', 'Sciatic']), 1, 'The tibial nerve innervates the posterior compartment of the leg.'),
    (v_case_id, 'Which reflex is diminished?', to_jsonb(ARRAY['Patellar', 'Biceps', 'Triceps', 'Achilles', 'Cremasteric']), 3, 'Achilles reflex tests the S1-S2 level via the tibial nerve.'),
    (v_case_id, 'Sensory loss may involve:', to_jsonb(ARRAY['Dorsum of foot only', 'Sole of foot', 'Lateral forearm', 'Medial thigh only', 'Lateral thigh only']), 1, 'Tibial nerve provides sensation to the sole of the foot.');

    -- CASE 19
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Saphenous Nerve Injury', 'A patient has loss of sensation over the medial leg after varicose vein surgery.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve was likely injured?', to_jsonb(ARRAY['Sural', 'Superficial fibular', 'Saphenous', 'Deep fibular', 'Tibial']), 2, 'The saphenous nerve provides sensation to the medial leg.'),
    (v_case_id, 'Which vein is often involved in this surgery?', to_jsonb(ARRAY['Small saphenous vein', 'Great saphenous vein', 'Femoral vein', 'Popliteal vein', 'Obturator vein']), 1, 'The saphenous nerve travels with the great saphenous vein.'),
    (v_case_id, 'The saphenous nerve is a branch of the:', to_jsonb(ARRAY['Tibial nerve', 'Femoral nerve', 'Common fibular nerve', 'Obturator nerve', 'Sciatic nerve']), 1, 'The saphenous nerve is a branch of the femoral nerve (L3-L4).');

    -- CASE 20
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'ACL Injury', 'A soccer player tears his ACL.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The ACL primarily prevents:', to_jsonb(ARRAY['Posterior displacement of tibia on femur', 'Anterior displacement of tibia on femur', 'Medial rotation of femur only', 'Lateral displacement of patella', 'Hyperextension of hip']), 1, 'The ACL prevents the tibia from sliding forward.'),
    (v_case_id, 'Which test is most useful?', to_jsonb(ARRAY['McMurray test', 'Anterior drawer/Lachman', 'Trendelenburg test', 'Tinel sign', 'Phalen maneuver']), 1, 'Lachman test is highly sensitive for ACL tears.'),
    (v_case_id, 'The ACL is intracapsular but:', to_jsonb(ARRAY['Extrasynovial', 'Intrasynovial', 'Extracapsular', 'Outside the knee entirely', 'In the meniscus']), 0, 'The ACL is within the joint capsule but outside the synovial lining.');

    -- CASE 21
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Thoracentesis Anatomy', 'A patient suffers a stab wound to the 4th intercostal space near the midaxillary line and develops a collapsed lung.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which structure is most at risk if the needle is placed just inferior to a rib?', to_jsonb(ARRAY['Intercostal neurovascular bundle', 'Thoracic duct', 'Vagus nerve', 'Phrenic nerve', 'Azygos vein']), 0, 'The neurovascular bundle runs in the costal groove at the inferior border of the rib.'),
    (v_case_id, 'The neurovascular bundle runs in the:', to_jsonb(ARRAY['Inferior border of the upper rib in the costal groove', 'Superior border of the lower rib', 'Center of intercostal space', 'Pleural cavity', 'Sternum only']), 0, 'VAN: Vein, Artery, Nerve from top to bottom.'),
    (v_case_id, 'To avoid this bundle during thoracentesis, the needle is inserted:', to_jsonb(ARRAY['Just below the rib', 'Just above the rib', 'Through the sternum', 'Through the xiphoid', 'Into the clavicle']), 1, 'Insert needles just above the rib below to avoid the bundle.');

    -- CASE 22
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Cardiac Tamponade', 'A patient with pericardial tamponade undergoes emergency pericardiocentesis via the subxiphoid approach.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which structure is being accessed?', to_jsonb(ARRAY['Pleural cavity', 'Pericardial cavity', 'Peritoneal cavity', 'Mediastinum only without pericardium', 'Thoracic duct']), 1, 'Pericardiocentesis removes fluid from the pericardial sac.'),
    (v_case_id, 'Which chamber lies most anteriorly and is at risk?', to_jsonb(ARRAY['Left atrium', 'Left ventricle', 'Right atrium', 'Right ventricle', 'Coronary sinus']), 3, 'The right ventricle is the most anterior chamber of the heart.'),
    (v_case_id, 'Cardiac tamponade classically reduces:', to_jsonb(ARRAY['Ventricular filling', 'Cardiac contractility only', 'Coronary anatomy', 'Aortic valve opening pressure only', 'Pulmonary compliance']), 0, 'High intrapericardial pressure impairs diastolic filling.');

    -- CASE 23
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Aortic Arch Surgery', 'A patient develops hoarseness after surgery near the aortic arch.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is most likely injured?', to_jsonb(ARRAY['Right recurrent laryngeal nerve', 'Left recurrent laryngeal nerve', 'External branch of superior laryngeal nerve', 'Hypoglossal nerve', 'Glossopharyngeal nerve']), 1, 'The left recurrent laryngeal nerve loops around the aortic arch.'),
    (v_case_id, 'The left recurrent laryngeal nerve loops around the:', to_jsonb(ARRAY['Left subclavian artery', 'Aortic arch near ligamentum arteriosum', 'Common carotid artery', 'Brachiocephalic trunk', 'Pulmonary veins']), 1, 'It passes under the arch near the ligamentum arteriosum.'),
    (v_case_id, 'Hoarseness occurs because most intrinsic laryngeal muscles are supplied by:', to_jsonb(ARRAY['Superior laryngeal nerve', 'Recurrent laryngeal nerve', 'Glossopharyngeal nerve', 'Hypoglossal nerve', 'Sympathetic trunk']), 1, 'The RLN supplies all intrinsic laryngeal muscles except the cricothyroid.');

    -- CASE 24
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Pancoast Tumor', 'A patient with a Pancoast tumor at the apex of the lung has ptosis, miosis, and anhidrosis.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This syndrome is:', to_jsonb(ARRAY['Brown-Séquard syndrome', 'Horner syndrome', 'Wallenberg syndrome', 'Tarsal tunnel syndrome', 'Carpal tunnel syndrome']), 1, 'Ptosis, miosis, and anhidrosis = Horner syndrome.'),
    (v_case_id, 'Which structure is likely compressed?', to_jsonb(ARRAY['Phrenic nerve', 'Sympathetic chain', 'Vagus nerve', 'Recurrent laryngeal nerve only', 'Thoracic duct only']), 1, 'Compression of the sympathetic trunk at the stellate ganglion.'),
    (v_case_id, 'The apex of the lung extends:', to_jsonb(ARRAY['Below the 1st rib only', 'Above the 1st rib into root of neck', 'Only to the 2nd rib', 'To the xiphoid', 'Into the abdomen']), 1, 'The lung apex extends through the superior thoracic aperture.');

    -- CASE 25
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Pancreatic Anatomy', 'A patient has severe epigastric pain radiating to the back. Pancreatitis is diagnosed.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The pancreas is primarily:', to_jsonb(ARRAY['Intraperitoneal', 'Retroperitoneal', 'In the lesser sac only', 'In the greater omentum', 'Attached to spleen by splenorenal ligament only']), 1, 'The pancreas is a secondarily retroperitoneal organ (except for the tail).'),
    (v_case_id, 'Which part is most closely related to the C-loop of the duodenum?', to_jsonb(ARRAY['Tail', 'Body', 'Neck', 'Head', 'Uncinate']), 3, 'The head of the pancreas sits in the C-loop of the duodenum.'),
    (v_case_id, 'The splenic artery runs along the:', to_jsonb(ARRAY['Inferior border of pancreas', 'Superior border of pancreas', 'Mesentery of jejunum', 'Lesser omentum only', 'Hepatoduodenal ligament']), 1, 'The splenic artery has a tortuous course along the superior border.');

    -- CASE 26
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Duodenal Ulcer', 'A patient with peptic ulcer disease develops posterior duodenal ulcer erosion and massive bleeding.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which vessel is most likely eroded?', to_jsonb(ARRAY['Left gastric artery', 'Gastroduodenal artery', 'Splenic artery', 'Right gastric artery', 'Inferior mesenteric artery']), 1, 'The GDA runs behind the first part of the duodenum.'),
    (v_case_id, 'The first part of the duodenum is related posteriorly to the:', to_jsonb(ARRAY['Aorta only', 'Gastroduodenal artery', 'Portal vein only', 'SMA only', 'IVC only']), 1, 'GDA is the key posterior relation.'),
    (v_case_id, 'An anterior duodenal ulcer is more likely to cause:', to_jsonb(ARRAY['Hemorrhage from GDA', 'Perforation into peritoneal cavity', 'Pancreatitis only', 'Colonic obstruction', 'Portal hypertension']), 1, 'Anterior ulcers perforate into the peritoneum.');

    -- CASE 27
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Portosystemic Anastomoses', 'A patient with cirrhosis has caput medusae and esophageal varices.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The varices result from:', to_jsonb(ARRAY['Portal hypertension', 'Pulmonary hypertension', 'Systemic hypotension only', 'Renal artery stenosis', 'Aortic coarctation']), 0, 'Elevated pressure in the portal system leads to shunting.'),
    (v_case_id, 'Esophageal varices involve anastomosis between:', to_jsonb(ARRAY['Superior mesenteric and splenic veins', 'Left gastric and esophageal veins', 'Portal and hepatic veins directly', 'Cystic and portal veins', 'Inferior mesenteric and renal veins']), 1, 'Left gastric (portal) ↔ esophageal (systemic) shunting.'),
    (v_case_id, 'Caput medusae reflects reopening of veins around the:', to_jsonb(ARRAY['Round ligament of liver/paraumbilical region', 'Coronary ligament', 'Falciform artery only', 'Hepatic artery', 'Cystic duct']), 0, 'Paraumbilical veins (portal) ↔ epigastric veins (systemic).');

    -- CASE 28
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Appendicitis Pain', 'A patient has pain that begins periumbilically and later localizes to the right lower quadrant in appendicitis.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Initial periumbilical pain is due to visceral afferents entering at:', to_jsonb(ARRAY['T5-T9', 'T10', 'L1', 'S2-S4', 'C3-C5']), 1, 'T10 is the dermatome for the umbilicus.'),
    (v_case_id, 'Localized RLQ pain later reflects irritation of:', to_jsonb(ARRAY['Visceral peritoneum only', 'Parietal peritoneum', 'Retroperitoneum only', 'Mesentery only', 'Sympathetic chain']), 1, 'Local irritation of the parietal peritoneum is somatically localized.'),
    (v_case_id, 'The appendix most commonly arises from the:', to_jsonb(ARRAY['Ascending colon', 'Cecum', 'Terminal ileum', 'Sigmoid colon', 'Descending colon']), 1, 'The appendix is attached to the cecum.');

    -- CASE 29
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Biliary Anatomy', 'A patient has gallstones causing pain in the right upper quadrant after fatty meals.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The gallbladder is supplied mainly by the:', to_jsonb(ARRAY['Proper hepatic artery', 'Cystic artery', 'Right gastric artery', 'Splenic artery', 'Left gastric artery']), 1, 'The cystic artery is the primary blood supply.'),
    (v_case_id, 'The cystic artery usually arises from the:', to_jsonb(ARRAY['Common hepatic artery', 'Right hepatic artery', 'Gastroduodenal artery', 'Left hepatic artery', 'SMA']), 1, 'The right hepatic artery usually gives off the cystic artery.'),
    (v_case_id, 'SURGEON identifies regions of cystic duct, common hepatic duct, and liver border:', to_jsonb(ARRAY['Hepatoduodenal ligament', 'Triangle of Calot', 'Lesser sac', 'Foramen of Winslow', 'Splenorenal ligament']), 1, 'Calot’s triangle contains the cystic artery.');

    -- CASE 30
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Indirect Inguinal Hernia', 'A patient develops an incarcerated indirect inguinal hernia.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'An indirect inguinal hernia passes:', to_jsonb(ARRAY['Medial to inferior epigastric vessels', 'Lateral to inferior epigastric vessels', 'Through Hesselbach triangle directly', 'Through femoral canal', 'Through obturator canal']), 1, 'Indirect hernias pass lateral to the inferior epigastric vessels.'),
    (v_case_id, 'It enters the deep inguinal ring, which is an opening in the:', to_jsonb(ARRAY['External oblique aponeurosis', 'Internal oblique muscle', 'Transversalis fascia', 'Conjoint tendon', 'Lacunar ligament']), 2, 'The deep ring is in the transversalis fascia.'),
    (v_case_id, 'Indirect hernias are often due to persistence of the:', to_jsonb(ARRAY['Urachus', 'Vitelline duct', 'Processus vaginalis', 'Allantois', 'Round ligament']), 2, 'Persistent processus vaginalis is the primary cause.');

    -- CASE 31
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Femoral Hernia', 'A woman develops a femoral hernia below the inguinal ligament and medial to the femoral vein.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Femoral hernias pass through the:', to_jsonb(ARRAY['Deep inguinal ring', 'Superficial inguinal ring', 'Femoral canal', 'Obturator canal', 'Greater sciatic foramen']), 2, 'They pass through the femoral canal.'),
    (v_case_id, 'They are more common in:', to_jsonb(ARRAY['Men only', 'Women', 'Children only', 'Newborn males only', 'Athletes only']), 1, 'Women have wider pelvises, making them more prone.'),
    (v_case_id, 'The femoral canal lies:', to_jsonb(ARRAY['Lateral to femoral artery', 'Between artery and nerve', 'Medial to femoral vein', 'Posterior to psoas major', 'In the inguinal canal']), 2, 'NAVEL: Nerve, Artery, Vein, Empty (canal), Lymphatics.');

    -- CASE 32
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Bladder Innervation', 'A patient has urinary incontinence after injury during radical pelvic surgery.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Parasympathetic fibers to the bladder arise from:', to_jsonb(ARRAY['T10-L2', 'S2-S4', 'C3-C5', 'L4-S1', 'T1-T4']), 1, 'S2-S4 Pelvic splanchnics.'),
    (v_case_id, 'These fibers travel in the:', to_jsonb(ARRAY['Pelvic splanchnic nerves', 'Greater splanchnic nerves', 'Hypogastric nerves only', 'Pudendal nerve', 'Genitofemoral nerve']), 0, 'Pelvic splanchnic nerves carry parasympathetic fibers.'),
    (v_case_id, 'Parasympathetic stimulation of the bladder causes:', to_jsonb(ARRAY['Internal sphincter contraction', 'Detrusor relaxation', 'Detrusor contraction', 'External sphincter contraction', 'No effect']), 2, 'Parasympathetic = Pee (contraction of detrusor).');

    -- CASE 33
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Penile Erection', 'A man has erectile dysfunction after pelvic fracture and damage to cavernous nerves.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Cavernous nerves carry primarily:', to_jsonb(ARRAY['Somatic motor fibers', 'Sympathetic fibers only', 'Parasympathetic fibers for erection', 'Sensory fibers from glans only', 'Pudendal motor fibers only']), 2, 'Parasympathetic fibers (S2-S4) mediate erection.'),
    (v_case_id, 'These nerves arise from the:', to_jsonb(ARRAY['Inferior mesenteric plexus', 'Prostatic/uterovaginal plexus region', 'Femoral nerve', 'Obturator nerve', 'Sacral plexus somatic division only']), 1, 'Pelvic autonomic plexuses supply the erectile tissue.'),
    (v_case_id, 'Ejaculation is primarily:', to_jsonb(ARRAY['Parasympathetic', 'Sympathetic', 'Purely somatic', 'Vagal', 'Hormonal only']), 1, 'Sympathetic = Shoot.');

    -- CASE 34
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Pudendal Nerve Block', 'A woman in labor receives a pudendal nerve block.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The nerve is anesthetized near the:', to_jsonb(ARRAY['Ischial tuberosity', 'Ischial spine', 'Pubic symphysis', 'Sacral promontory', 'Coccyx tip']), 1, 'Surgeon palpates the ischial spine through the vaginal wall.'),
    (v_case_id, 'The pudendal nerve exits the pelvis through the:', to_jsonb(ARRAY['Lesser foramen then greater', 'Greater foramen then lesser', 'Obturator canal', 'Inguinal canal', 'Femoral canal']), 1, 'It exits via greater sciatic foramen and reenters via lesser sciatic foramen.'),
    (v_case_id, 'It carries fibers from:', to_jsonb(ARRAY['L1-L2', 'L4-S1', 'S2-S4', 'T10-L1', 'C5-T1']), 2, 'S2, S3, S4 keep the poop off the floor.');

    -- CASE 35
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Epidural Hematoma', 'A patient has a fracture of the pterion and rapidly deteriorates neurologically.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which vessel is most likely ruptured?', to_jsonb(ARRAY['Middle meningeal artery', 'Anterior cerebral artery', 'Basilar artery', 'Great cerebral vein', 'Superior sagittal sinus']), 0, 'Middle meningeal artery is deep to the pterion.'),
    (v_case_id, 'The resulting hematoma is:', to_jsonb(ARRAY['Subarachnoid hemorrhage', 'Subdural hematoma', 'Epidural hematoma', 'Intraparenchymal hemorrhage', 'Intraventricular hemorrhage']), 2, 'Bleed between the skull and dura mater.'),
    (v_case_id, 'This classically shows:', to_jsonb(ARRAY['Crescent-shaped bleed', 'Lens-shaped bleed limited by sutures', 'Berry aneurysm', 'Pontine hemorrhage only', 'Diffuse axonal injury only']), 1, 'Biconvex (lens) shape limited by suture lines.');

    -- CASE 36
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Subdural Hematoma', 'An elderly patient falls and later develops headache and confusion. CT shows a crescent-shaped bleed crossing suture lines.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Diagnosis?', to_jsonb(ARRAY['Epidural hematoma', 'Subdural hematoma', 'Subarachnoid hemorrhage', 'Epidural abscess', 'Intraventricular hemorrhage']), 1, 'Crescent shape suggests subdural bleed.'),
    (v_case_id, 'Usually due to rupture of:', to_jsonb(ARRAY['Middle meningeal artery', 'Bridging veins', 'Circle of Willis aneurysm', 'Lenticulostriate arteries', 'Superior cerebellar artery']), 1, 'Rupture of bridging veins.'),
    (v_case_id, 'Risk factor in elderly:', to_jsonb(ARRAY['Tight adherence of brain to skull', 'Brain atrophy stretching bridging veins', 'Thickened dura preventing motion', 'Increased CSF pressure', 'Vertebral artery stenosis']), 1, 'Atrophy increases the distance veins must span.');

    -- CASE 37
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Subarachnoid Hemorrhage', 'A patient has sudden "worst headache of life." Ruptured berry aneurysm is suspected.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely hemorrhage type?', to_jsonb(ARRAY['Epidural', 'Subdural', 'Subarachnoid', 'Intradural venous', 'Extradural venous']), 2, 'Rupture into the subarachnoid space.'),
    (v_case_id, 'Berry aneurysms commonly occur at branch points of the:', to_jsonb(ARRAY['External carotid system', 'Circle of Willis', 'Vertebral venous plexus', 'Dural sinuses', 'Middle meningeal artery']), 1, 'A-com is the most common site.'),
    (v_case_id, 'Which congenital disease is associated?', to_jsonb(ARRAY['Cystic fibrosis', 'Autosomal dominant polycystic kidney disease', 'Marfan only', 'Hereditary spherocytosis', 'Wilson disease']), 1, 'ADPKD is strongly associated with berry aneurysms.');

    -- CASE 38
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Lateral Medullary Syndrome', 'A patient has loss of pain and temperature on the right side of the body and left side of the face after a lateral medullary infarct.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which artery is usually involved?', to_jsonb(ARRAY['Anterior spinal artery', 'PICA', 'MCA', 'ACA', 'Basilar perforators only']), 1, 'PICA infarct causes Wallenberg syndrome.'),
    (v_case_id, 'Which nucleus involvement explains dysphagia/hoarseness?', to_jsonb(ARRAY['Hypoglossal nucleus', 'Nucleus ambiguus', 'Edinger-Westphal nucleus', 'Red nucleus', 'Facial nucleus only']), 1, 'Nucleus ambiguus (motor IX, X) mediates swallowing.'),
    (v_case_id, 'This syndrome is:', to_jsonb(ARRAY['Medial medullary syndrome', 'Lateral medullary (Wallenberg) syndrome', 'Weber syndrome', 'Claude syndrome', 'Brown-Séquard syndrome']), 1, 'Wallenberg is the lateral medullary syndrome.');

    -- CASE 39
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Internal Capsule Stroke', 'A patient has contralateral body weakness and contralateral lower facial weakness after an internal capsule infarct.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which part of internal capsule most likely affected?', to_jsonb(ARRAY['Genu/posterior limb region', 'Retrolenticular part only', 'Sublenticular part only', 'Anterior limb only', 'External capsule']), 0, 'Motor fibers run in the genu and posterior limb.'),
    (v_case_id, 'Blood supply often comes from:', to_jsonb(ARRAY['PICA', 'Lenticulostriate arteries', 'Anterior choroidal only', 'PCA cortical branches only', 'Ophthalmic artery']), 1, 'Lenticulostriate arteries from MCA supply the internal capsule.'),
    (v_case_id, 'These arteries are prone to rupture in:', to_jsonb(ARRAY['Chronic hypotension', 'Chronic hypertension', 'Low ICP', 'Elevated CSF protein', 'Giant cell arteritis only']), 1, 'Charcot-Bouchard aneurysms occur due to chronic hypertension.');

    -- CASE 40
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Optic Chiasm Compression', 'A pituitary tumor compresses the optic chiasm.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which visual defect is expected?', to_jsonb(ARRAY['Left homonymous hemianopia', 'Bitemporal hemianopia', 'Right homonymous hemianopia', 'Monocular blindness', 'Left superior quadrantanopia']), 1, 'Nasal fibers (temporal visual field) are compressed.'),
    (v_case_id, 'Fibers crossing in the chiasm arise from the:', to_jsonb(ARRAY['Temporal retina', 'Nasal retina', 'Macula only', 'Optic tract', 'Lateral geniculate nucleus']), 1, 'Nasal retinal fibers cross at the chiasm.'),
    (v_case_id, 'The pituitary lies in the:', to_jsonb(ARRAY['Foramen magnum', 'Sella turcica', 'Pterion', 'Cribriform plate', 'Jugular foramen']), 1, 'Sella turcica of the sphenoid bone.');

    -- CASE 41
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Bell Palsy', 'A patient has facial weakness involving the entire right side of the face after Bell palsy.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is affected?', to_jsonb(ARRAY['Trigeminal nerve', 'Facial nerve', 'Glossopharyngeal nerve', 'Hypoglossal nerve', 'Vagus nerve']), 1, 'CN VII injury.'),
    (v_case_id, 'A lower motor neuron lesion causes:', to_jsonb(ARRAY['Contralateral lower facial weakness', 'Ipsilateral whole-face weakness', 'Forehead sparing', 'Bilateral lower facial weakness', 'Isolated sensory loss']), 1, 'LMN lesion affects the entire side of the face.'),
    (v_case_id, 'Taste from the anterior 2/3 of the tongue is carried by:', to_jsonb(ARRAY['Lingual nerve only', 'Chorda tympani', 'Glossopharyngeal nerve', 'Vagus nerve', 'Greater petrosal nerve only']), 1, 'Chorda tympani branch of CN VII.');

    -- CASE 42
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Hypoglossal Nerve Injury', 'A patient has difficulty protruding the tongue after carotid endarterectomy. The tongue deviates to the right when protruded.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which nerve is injured?', to_jsonb(ARRAY['Glossopharyngeal', 'Vagus', 'Hypoglossal', 'Lingual', 'Facial']), 2, 'CN XII controls tongue muscles.'),
    (v_case_id, 'The tongue deviates:', to_jsonb(ARRAY['Away from lesion', 'Toward lesion', 'Randomly', 'Only upward', 'Not at all']), 1, 'Unopposed action of contralateral genioglossus.'),
    (v_case_id, 'This is due to weakness of the:', to_jsonb(ARRAY['Genioglossus on the injured side', 'Hyoglossus on the intact side', 'Styloglossus bilaterally', 'Palatoglossus', 'Tensor veli palatini']), 0, 'Genioglossus is the primary tongue protruder.');

    -- CASE 43
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Trigeminal Nerve (V3)', 'A patient has a lesion of the mandibular division of CN V.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which function is impaired?', to_jsonb(ARRAY['Smell', 'Mastication', 'Lacrimation only', 'Facial expression', 'Hearing']), 1, 'V3 supplies the muscles of mastication.'),
    (v_case_id, 'Sensation is lost from the:', to_jsonb(ARRAY['Posterior 1/3 of tongue', 'Lower face and anterior 2/3 tongue sensation', 'Upper eyelid only', 'Scalp posterior to auricle only', 'Palate taste only']), 1, 'Mandibular nerve provides general sensation to lower face.'),
    (v_case_id, 'Which muscle is innervated by V3?', to_jsonb(ARRAY['Buccinator', 'Masseter', 'Platysma', 'Stapedius', 'Posterior cricoarytenoid']), 1, 'Masseter is a primary muscle of mastication.');

    -- CASE 44
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Cribriform Plate Fracture', 'A patient has a fracture involving the cribriform plate.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which sensory modality may be lost?', to_jsonb(ARRAY['Vision', 'Hearing', 'Smell', 'Taste posterior tongue', 'Balance only']), 2, 'Olfactory fibers traverse the cribriform plate.'),
    (v_case_id, 'Which cranial nerve fibers traverse the cribriform plate?', to_jsonb(ARRAY['Optic nerve', 'Olfactory nerve fibers', 'Trigeminal motor root', 'Facial nerve', 'Abducens nerve']), 1, 'Olfactory (CN I) axons.'),
    (v_case_id, 'A complication may include:', to_jsonb(ARRAY['CSF rhinorrhea', 'Hemotympanum only', 'Epidural hematoma only', 'Horner syndrome', 'Bell palsy only']), 0, 'Leaking of CSF from the nose.');

    -- CASE 45
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Esophageal Atresia', 'A newborn has excessive salivation, choking, and cyanosis with feeds. A nasogastric tube cannot be passed into the stomach.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely congenital anomaly?', to_jsonb(ARRAY['Congenital diaphragmatic hernia', 'Pyloric stenosis', 'Esophageal atresia with distal TEF', 'Duodenal atresia', 'Malrotation']), 2, 'Classic presentation of EA with TEF.'),
    (v_case_id, 'This anomaly arises from abnormal:', to_jsonb(ARRAY['Neural tube closure', 'Tracheoesophageal septation', 'Midgut rotation only', 'Vitelline artery persistence', 'Cloacal partitioning']), 1, 'Failed separation of respiratory and GI tracts.'),
    (v_case_id, 'Polyhydramnios may be present because the fetus:', to_jsonb(ARRAY['Cannot urinate', 'Cannot swallow amniotic fluid normally', 'Has renal agenesis', 'Has pulmonary hypoplasia only', 'Has meconium ileus']), 1, 'Amniotic fluid cannot be reabsorbed in the gut.');

    -- CASE 46
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Duodenal Atresia', 'A newborn has bilious vomiting and a "double bubble" sign on imaging.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', to_jsonb(ARRAY['Hypertrophic pyloric stenosis', 'Duodenal atresia', 'Jejunal atresia', 'Hirschsprung disease', 'Esophageal atresia']), 1, 'Double bubble = Duodenal atresia.'),
    (v_case_id, 'This is associated with:', to_jsonb(ARRAY['Down syndrome', 'Turner syndrome only', 'Marfan syndrome', 'Fragile X syndrome', 'Neurofibromatosis']), 0, 'High correlation with Trisomy 21.'),
    (v_case_id, 'Embryologically, this results from failure of:', to_jsonb(ARRAY['Neural crest migration', 'Recanalization of duodenum', 'Midgut return only', 'Vitelline duct obliteration', 'Cloacal septation']), 1, 'Lumen fails to recanalize.');

    -- CASE 47
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Hirschsprung Disease', 'A newborn fails to pass meconium and has abdominal distention. Rectal biopsy shows absence of ganglion cells.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Diagnosis?', to_jsonb(ARRAY['Pyloric stenosis', 'Hirschsprung disease', 'Meckel diverticulum', 'Intussusception', 'Omphalocele']), 1, 'Congenital megacolon due to aganglionosis.'),
    (v_case_id, 'Embryologic cause?', to_jsonb(ARRAY['Failure of lateral folding', 'Failure of neural crest migration', 'Persistence of urachus', 'Incomplete midgut rotation', 'Persistent vitelline artery']), 1, 'Failed migration of neural crest cells to the gut plexuses.'),
    (v_case_id, 'Most commonly affected bowel segment:', to_jsonb(ARRAY['Jejunum', 'Ileum', 'Rectosigmoid colon', 'Ascending colon', 'Cecum']), 2, 'Distal segments are always affected.');

    -- CASE 48
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Omphalocele', 'A newborn has bowel loops protruding through the abdominal wall, covered by a membranous sac.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', to_jsonb(ARRAY['Gastroschisis', 'Omphalocele', 'Umbilical hernia', 'Meckel diverticulum', 'Diaphragmatic hernia']), 1, 'Herniation into the umbilical cord covered by a sac.'),
    (v_case_id, 'The membranous covering helps distinguish it from:', to_jsonb(ARRAY['Pyloric stenosis', 'Gastroschisis', 'Hirschsprung disease', 'Esophageal atresia', 'Cloacal exstrophy']), 1, 'Gastroschisis has no sac.'),
    (v_case_id, 'Omphalocele is often associated with:', to_jsonb(ARRAY['Chromosomal abnormalities', 'Fibular hemimelia only', 'Isolated pyloric stenosis only', 'Bell palsy', 'Tetralogy only']), 0, 'High rate of other anomalies.');

    -- CASE 49
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Meckel Diverticulum', 'A bowel remnant on the antimesenteric border of the ileum causes painless rectal bleeding in a child.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', to_jsonb(ARRAY['Intussusception', 'Meckel diverticulum', 'Volvulus', 'Duodenal atresia', 'Hirschsprung disease']), 1, 'Rule of 2s.'),
    (v_case_id, 'Embryologic remnant of:', to_jsonb(ARRAY['Urachus', 'Allantois', 'Vitelline duct', 'Neural tube', 'Tracheoesophageal septum']), 2, 'Persistent yolk stalk (vitelline duct).'),
    (v_case_id, 'It may contain ectopic:', to_jsonb(ARRAY['Pancreatic and gastric mucosa', 'Thyroid tissue only', 'Adrenal cortex', 'Liver only', 'Cartilage']), 0, 'Ectopic gastric tissue causes ulceration and bleeding.');

    -- CASE 50
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Diaphragmatic Hernia', 'A newborn develops severe respiratory distress shortly after birth. Imaging shows abdominal contents in the left thorax.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', to_jsonb(ARRAY['Esophageal atresia', 'Congenital diaphragmatic hernia', 'Omphalocele', 'Tracheomalacia', 'Pyloric stenosis']), 1, 'Viscera in the chest.'),
    (v_case_id, 'Most common defect location?', to_jsonb(ARRAY['Foramen of Morgagni', 'Bochdalek foramen', 'Central tendon only', 'Caval opening', 'Esophageal hiatus']), 1, 'Bochdalek is the posterolateral defect.'),
    (v_case_id, 'Pulmonary hypoplasia results because:', to_jsonb(ARRAY['The lungs overexpand', 'Herniated viscera compress developing lungs', 'Surfactant cannot be synthesized', 'Trachea is absent', 'Pleura do not form']), 1, 'Space-occupying lesion in the thorax.');

END $$;
