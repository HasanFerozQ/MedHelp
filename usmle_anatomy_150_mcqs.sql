-- MediHelp: USMLE Step 1 - Anatomy (150 MCQs)
-- Idempotent Migration: Ensures clean state for the topic's MCQs.

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    -- 1. Find existing "Anatomy" Topic
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title ILIKE '%Anatomy%' AND usmle_step = 1 
    LIMIT 1;

    -- 2. Fallback creation if not found
    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (title, slug, usmle_step, "order")
        VALUES ('Anatomy', 'anatomy-step-1', 1, 5)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. CLEAN UP: Remove existing MCQs for this topic to ensure a clean state
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;

    -- Q1-Q10
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A 24-year-old man falls asleep with his arm hanging over a chair. On awakening, he cannot extend his wrist or fingers. Which nerve is most likely injured?', to_jsonb(ARRAY['Axillary nerve', 'Median nerve', 'Radial nerve', 'Ulnar nerve', 'Musculocutaneous nerve']), 2, 'Compression of the radial nerve in the spiral groove causes wrist drop.'),
    (v_topic_id, 'A fracture of the surgical neck of the humerus most commonly injures which nerve?', to_jsonb(ARRAY['Radial nerve', 'Ulnar nerve', 'Axillary nerve', 'Median nerve', 'Musculocutaneous nerve']), 2, 'The axillary nerve wraps around the surgical neck.'),
    (v_topic_id, 'A patient with axillary nerve injury would most likely have weakness of which movement?', to_jsonb(ARRAY['Elbow flexion', 'Shoulder abduction from 15° to 90°', 'Forearm pronation', 'Wrist extension', 'Finger abduction']), 1, 'The deltoid abducts the arm from 15° to 90°.'),
    (v_topic_id, 'Scapular winging after mastectomy is most likely due to injury of the:', to_jsonb(ARRAY['Dorsal scapular nerve', 'Long thoracic nerve', 'Suprascapular nerve', 'Thoracodorsal nerve', 'Axillary nerve']), 1, 'Long thoracic nerve -> Serratus anterior.'),
    (v_topic_id, 'A patient with long thoracic nerve injury has difficulty performing which action?', to_jsonb(ARRAY['Adducting the arm', 'Extending the elbow', 'Raising the arm above horizontal', 'Supinating the forearm', 'Flexing the wrist']), 2, 'Serratus anterior helps rotate the scapula upward.'),
    (v_topic_id, 'A patient has numbness over the palmar lateral 3½ digits and weakness of thumb opposition. Which syndrome is most likely?', to_jsonb(ARRAY['Cubital tunnel syndrome', 'Carpal tunnel syndrome', 'Guyon canal syndrome', 'Radial tunnel syndrome', 'Thoracic outlet syndrome']), 1, 'Classic carpal tunnel presentation.'),
    (v_topic_id, 'Which structure is NOT contained within the carpal tunnel?', to_jsonb(ARRAY['Median nerve', 'Flexor digitorum superficialis tendons', 'Flexor digitorum profundus tendons', 'Flexor pollicis longus tendon', 'Flexor carpi radialis tendon']), 4, 'Flexor carpi radialis passes in its own compartment.'),
    (v_topic_id, 'A patient fractures the medial epicondyle and later develops weakness of finger abduction and adduction. Which nerve is injured?', to_jsonb(ARRAY['Median nerve', 'Radial nerve', 'Ulnar nerve', 'Axillary nerve', 'Musculocutaneous nerve']), 2, 'Ulnar nerve passes posterior to the medial epicondyle.'),
    (v_topic_id, 'A patient cannot make an "OK sign" due to weakness of FPL and lateral FDP. Which nerve is injured?', to_jsonb(ARRAY['Recurrent median nerve', 'Anterior interosseous nerve', 'Deep branch of ulnar nerve', 'Posterior interosseous nerve', 'Superficial radial nerve']), 1, 'AIN is a motor branch of the median nerve.'),
    (v_topic_id, 'A stab wound causes sensory loss over the lateral forearm. Which nerve was most likely injured?', to_jsonb(ARRAY['Ulnar nerve', 'Radial nerve', 'Musculocutaneous nerve', 'Median nerve', 'Axillary nerve']), 2, 'Musculocutaneous continues as lateral antebrachial cutaneous.');

    -- Q11-Q20
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'The femoral head in adults receives its major blood supply from the:', to_jsonb(ARRAY['Inferior gluteal artery', 'Medial circumflex femoral artery', 'Lateral circumflex femoral artery', 'Obturator artery only', 'Inferior epigastric artery']), 1, 'Medial circumflex femoral artery is the primary supply.'),
    (v_topic_id, 'A posterior hip dislocation most commonly injures the:', to_jsonb(ARRAY['Femoral nerve', 'Obturator nerve', 'Sciatic nerve', 'Superior gluteal nerve', 'Inferior gluteal nerve']), 2, 'The sciatic nerve lies posterior to the hip joint.'),
    (v_topic_id, 'A patient has pelvis dropping on the contralateral side while standing on one leg. Which nerve is injured?', to_jsonb(ARRAY['Inferior gluteal nerve', 'Femoral nerve', 'Obturator nerve', 'Superior gluteal nerve', 'Sciatic nerve']), 3, 'Superior gluteal nerve -> Trendelenburg sign.'),
    (v_topic_id, 'Weakness climbing stairs and rising from a chair after gluteal injection suggests injury to the:', to_jsonb(ARRAY['Superior gluteal nerve', 'Inferior gluteal nerve', 'Sciatic nerve', 'Femoral nerve', 'Obturator nerve']), 1, 'Inferior gluteal nerve -> Gluteus maximus.'),
    (v_topic_id, 'A fibular neck fracture causes foot drop. Which nerve is most likely injured?', to_jsonb(ARRAY['Tibial nerve', 'Deep fibular nerve only', 'Superficial fibular nerve only', 'Common fibular nerve', 'Sural nerve']), 3, 'Common fibular nerve wraps around the neck of the fibula.'),
    (v_topic_id, 'Loss of sensation in the first dorsal web space most strongly suggests injury to the:', to_jsonb(ARRAY['Superficial fibular nerve', 'Tibial nerve', 'Deep fibular nerve', 'Sural nerve', 'Saphenous nerve']), 2, 'Deep fibular nerve -> first dorsal web space.'),
    (v_topic_id, 'A patient cannot stand on tiptoe after a tibial nerve injury. Which reflex is most likely absent?', to_jsonb(ARRAY['Patellar reflex', 'Achilles reflex', 'Biceps reflex', 'Triceps reflex', 'Cremasteric reflex']), 1, 'Tibial nerve mediates the Achilles reflex.'),
    (v_topic_id, 'The great saphenous vein is closely associated with which nerve?', to_jsonb(ARRAY['Sural nerve', 'Tibial nerve', 'Saphenous nerve', 'Superficial fibular nerve', 'Deep fibular nerve']), 2, 'Saphenous nerve accompanies the great saphenous vein.'),
    (v_topic_id, 'The ACL primarily prevents:', to_jsonb(ARRAY['Posterior displacement of tibia', 'Anterior displacement of tibia', 'Excessive inversion of foot', 'Lateral patellar displacement', 'Hyperextension of hip']), 1, 'ACL prevents anterior tibial translation.'),
    (v_topic_id, 'A posterior duodenal ulcer is most likely to erode which artery?', to_jsonb(ARRAY['Left gastric artery', 'Right gastric artery', 'Gastroduodenal artery', 'Splenic artery', 'Inferior pancreaticoduodenal']), 2, 'GDA lies posterior to the first part of the duodenum.');

    -- Q21-Q30
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Pain from early appendicitis is first perceived around the umbilicus because of visceral afferents entering at:', to_jsonb(ARRAY['T6', 'T8', 'T10', 'T12', 'L2']), 2, 'Midgut visceral pain refers to T10.'),
    (v_topic_id, 'A patient with portal hypertension develops esophageal varices. These involve anastomoses between left gastric and:', to_jsonb(ARRAY['Inferior mesenteric', 'Azygos system', 'Portal directly', 'IVC only', 'Splenic vein']), 1, 'Portosystemic anastomosis between left gastric and azygos systems.'),
    (v_topic_id, 'Caput medusae in portal hypertension results from dilation of veins around the:', to_jsonb(ARRAY['Hepatorenal recess', 'Paraumbilical region', 'Lesser omentum', 'Splenic hilum', 'Round ligament of ovary']), 1, 'Paraumbilical veins producing caput medusae.'),
    (v_topic_id, 'The pancreas is best described as:', to_jsonb(ARRAY['Intraperitoneal', 'Retroperitoneal except tail', 'Suspended in mesentery', 'Within the lesser sac', 'Primarily pelvic']), 1, 'Most of the pancreas is retroperitoneal.'),
    (v_topic_id, 'Which structure forms the portal triad?', to_jsonb(ARRAY['Portal vein, hepatic artery, CBD', 'IVC, portal vein, cystic duct', 'Splenic artery, portal, CBD', 'Portal vein, hepatic vein, duct', 'Aorta, IVC, duct']), 0, 'Portal vein, proper hepatic artery, and bile duct.'),
    (v_topic_id, 'An indirect inguinal hernia passes:', to_jsonb(ARRAY['Medial to inferior epigastrics', 'Lateral to inferior epigastrics', 'Through Hesselbach triangle', 'Through femoral canal', 'Through obturator canal']), 1, 'Indirect hernias are lateral to the inferior epigastric vessels.'),
    (v_topic_id, 'A direct inguinal hernia protrudes through:', to_jsonb(ARRAY['Deep ring', 'Hesselbach triangle', 'Femoral canal', 'Obturator membrane', 'Lesser sciatic foramen']), 1, 'Direct hernias protrude through Hesselbach triangle.'),
    (v_topic_id, 'A femoral hernia passes through the:', to_jsonb(ARRAY['Deep ring', 'Superficial ring', 'Femoral canal', 'Obturator canal', 'Greater sciatic foramen']), 2, 'Femoral hernias pass through the femoral canal.'),
    (v_topic_id, 'Parasympathetic innervation to the bladder arises from:', to_jsonb(ARRAY['T10-L2', 'S2-S4', 'L1-L2', 'S1-S3', 'Vagus']), 1, 'S2-S4 via pelvic splanchnic nerves.'),
    (v_topic_id, 'Erection is primarily mediated by:', to_jsonb(ARRAY['Sympathetic', 'Parasympathetic', 'Somatic only', 'Pudendal only', 'Vagal']), 1, 'Parasympathetic = Point.');

    -- Q31-Q40
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'The pudendal nerve is blocked near which landmark during childbirth?', to_jsonb(ARRAY['Ischial tuberosity', 'Ischial spine', 'Pubic crest', 'Sacral promontory', 'Coccygeal ligament']), 1, 'Pudendal nerve is anesthetized near the ischial spine.'),
    (v_topic_id, 'A fracture at the pterion can rupture which vessel?', to_jsonb(ARRAY['Superior sagittal sinus', 'Middle meningeal artery', 'Basilar artery', 'Internal carotid artery', 'Great cerebral vein']), 1, 'Middle meningeal artery tear -> epidural hematoma.'),
    (v_topic_id, 'A lens-shaped hemorrhage limited by sutures on CT is:', to_jsonb(ARRAY['Subdural', 'Epidural', 'Subarachnoid', 'Intraventricular', 'Diffuse axonal']), 1, 'Classic epidural hematoma presentation.'),
    (v_topic_id, 'A crescent-shaped hemorrhage that crosses suture lines is:', to_jsonb(ARRAY['Epidural', 'Subdural', 'Subarachnoid', 'Intraparenchymal', 'Epidural abscess']), 1, 'Classic subdural hematoma presentation.'),
    (v_topic_id, 'A berry aneurysm rupture most commonly causes:', to_jsonb(ARRAY['Epidural', 'Subdural', 'Subarachnoid', 'Epidural abscess', 'Cavernous sinus thrombosis']), 2, 'Circle of Willis aneurysm rupture -> SAH.'),
    (v_topic_id, 'A pituitary macroadenoma compressing the optic chiasm most commonly causes:', to_jsonb(ARRAY['Monocular blindness', 'Bitemporal hemianopia', 'Homonymous hemianopia', 'Tunnel vision', 'Complete blindness']), 1, 'Bitemporal hemianopia from chiasmal compression.'),
    (v_topic_id, 'The fibers that cross in the optic chiasm arise from the:', to_jsonb(ARRAY['Temporal retina', 'Nasal retina', 'Macula only', 'LGB', 'Superior colliculus']), 1, 'Nasal fibers cross at the chiasm.'),
    (v_topic_id, 'Hoarseness after surgery near the aortic arch is due to injury of:', to_jsonb(ARRAY['Right RLN', 'Left RLN', 'Superior laryngeal', 'Hypoglossal', 'Glossopharyngeal']), 1, 'Left RLN loops under the aortic arch.'),
    (v_topic_id, 'Bell palsy causes weakness of:', to_jsonb(ARRAY['Contralateral lower face', 'Ipsilateral upper and lower face', 'Ipsilateral lower face only', 'Contralateral whole face', 'Mastication']), 1, 'LMN lesion of CN VII affects entire side of face.'),
    (v_topic_id, 'Taste from the anterior two-thirds of the tongue is carried by:', to_jsonb(ARRAY['Glossopharyngeal', 'Hypoglossal', 'Chorda tympani', 'Lingual only', 'Vagus']), 2, 'Chorda tympani carries taste from anterior 2/3.');

    -- Q41-Q50
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A lesion of the hypoglossal nerve causes the tongue to deviate:', to_jsonb(ARRAY['Away from lesion', 'Toward the lesion', 'Upward', 'Downward', 'Not at all']), 1, 'Tongue deviates toward the lesion due to genioglossus weakness.'),
    (v_topic_id, 'A mandibular nerve (V3) lesion would impair:', to_jsonb(ARRAY['Smell', 'Mastication', 'Facial expression', 'Taste from posterior tongue', 'Hearing']), 1, 'V3 supplies the muscles of mastication.'),
    (v_topic_id, 'The trigeminal nerve provides general sensation to anterior 2/3 of tongue through the:', to_jsonb(ARRAY['Chorda tympani', 'Glossopharyngeal', 'Lingual nerve', 'Hypoglossal', 'Vagus']), 2, 'Lingual nerve (V3) carries general sensation.'),
    (v_topic_id, 'Failure of tracheoesophageal septation can lead to:', to_jsonb(ARRAY['Pyloric stenosis', 'EA with TEF', 'Omphalocele', 'Meckel', 'Hirschsprung']), 1, 'Abnormal separation of trachea and esophagus.'),
    (v_topic_id, 'A newborn with bilious vomiting and "double bubble" sign most likely has:', to_jsonb(ARRAY['Pyloric stenosis', 'Duodenal atresia', 'Hirschsprung', 'Meconium ileus', 'Omphalocele']), 1, 'Failed recanalization -> Duodenal atresia.'),
    (v_topic_id, 'Failure of neural crest migration to the distal colon causes:', to_jsonb(ARRAY['Meckel', 'Hirschsprung', 'Omphalocele', 'Malrotation', 'Pyloric stenosis']), 1, ' Hirschsprung disease is due to aganglionosis.'),
    (v_topic_id, 'A bowel remnant on the antimesenteric border of the ileum causing painless bleeding is:', to_jsonb(ARRAY['Duodenal diverticulum', 'Meckel diverticulum', 'Omphalocele', 'Gastroschisis', 'Intussusception']), 1, 'Meckel is a vitelline duct remnant.'),
    (v_topic_id, 'A newborn with bowel herniating into the umbilical cord covered by a sac has:', to_jsonb(ARRAY['Gastroschisis', 'Omphalocele', 'Umbilical granuloma', 'Vitelline fistula', 'Pyloric stenosis']), 1, 'Omphalocele is covered by a membrane.'),
    (v_topic_id, 'Abdominal contents protruding through the abdominal wall without a sac indicate:', to_jsonb(ARRAY['Omphalocele', 'Gastroschisis', 'Meckel', 'Diaphragmatic hernia', 'Umbilical hernia']), 1, 'Gastroschisis has no sac.'),
    (v_topic_id, 'A posterolateral diaphragmatic defect causing bowel in the thorax is:', to_jsonb(ARRAY['Eventration', 'Morgagni', 'Bochdalek', 'Paraesophageal', 'Omphalocele']), 2, 'Bochdalek is a congenital posterolateral hernia.');

    -- Q51-Q60
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A patient presents with "waiter’s tip" posture after a birth injury. Which roots are involved?', to_jsonb(ARRAY['C5-C6', 'C6-C7', 'C7-T1', 'C8-T1', 'T1-T2']), 0, 'Erb-Duchenne affects C5-C6.'),
    (v_topic_id, 'Which muscle is most affected in Erb palsy?', to_jsonb(ARRAY['Interossei', 'Deltoid', 'Lumbricals', 'FDP', 'Adductor pollicis']), 1, 'Axillary nerve (C5-C6) innervates deltoid.'),
    (v_topic_id, 'A patient has clawing of the entire hand ("total claw"). Which lesion?', to_jsonb(ARRAY['Ulnar at wrist', 'Median at wrist', 'Lower trunk (C8-T1)', 'Radial injury', 'Axillary injury']), 2, 'Klumpke palsy affects all intrinsic hand muscles.'),
    (v_topic_id, 'Horner syndrome associated with brachial plexus injury suggests involvement of:', to_jsonb(ARRAY['Upper trunk', 'Middle trunk', 'Lower trunk', 'Lateral cord', 'Posterior cord']), 2, 'T1 sympathetic fibers are near the lower trunk.'),
    (v_topic_id, 'The radial nerve originates from which cord?', to_jsonb(ARRAY['Lateral', 'Posterior', 'Medial', 'Upper trunk', 'Lower trunk']), 1, 'Radial and axillary nerves come from the posterior cord.'),
    (v_topic_id, 'Which nerve is most vulnerable in midshaft humeral fractures?', to_jsonb(ARRAY['Median', 'Ulnar', 'Radial', 'Axillary', 'Musculocutaneous']), 2, 'Radial nerve lies in the spiral groove.'),
    (v_topic_id, 'Loss of thumb abduction is due to injury of:', to_jsonb(ARRAY['Ulnar', 'Radial', 'Median', 'Axillary', 'Musculocutaneous']), 2, 'Abductor pollicis brevis is median nerve.'),
    (v_topic_id, 'Which muscle is spared in ulnar nerve injury?', to_jsonb(ARRAY['Interossei', 'Adductor pollicis', 'FCU', 'Thenar muscles', 'Medial lumbricals']), 3, 'Thenar muscles are median nerve.'),
    (v_topic_id, '"Froment sign" indicates weakness of:', to_jsonb(ARRAY['Opponens pollicis', 'Adductor pollicis', 'APL', 'Extensor pollicis', 'FPL']), 1, 'Weakness of adductor pollicis (ulnar nerve).'),
    (v_topic_id, 'The anatomical snuffbox is bounded by:', to_jsonb(ARRAY['EPL + APL/EPB', 'FPL + FDP', 'FCR + FCU', 'PT + BR', 'Supinator + Pronator']), 0, 'Extensor pollicis longus and APL/EPB.');

    -- Q61-Q70
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Which nerve supplies the quadriceps?', to_jsonb(ARRAY['Sciatic', 'Obturator', 'Femoral', 'Tibial', 'Fibular']), 2, 'Femoral nerve (L2-L4) supplies quadriceps.'),
    (v_topic_id, 'Femoral nerve injury causes loss of:', to_jsonb(ARRAY['Knee flexion', 'Knee extension', 'Hip extension', 'Foot eversion', 'Toe flexion']), 1, 'Quadriceps perform knee extension.'),
    (v_topic_id, 'Obturator nerve injury leads to weakness of:', to_jsonb(ARRAY['Hip abduction', 'Hip adduction', 'Knee extension', 'Plantarflexion', 'Dorsiflexion']), 1, 'Obturator nerve (L2-L4) supplies adductors.'),
    (v_topic_id, 'The popliteal artery becomes the:', to_jsonb(ARRAY['Femoral artery', 'Tibial arteries', 'Obturator artery', 'Deep femoral', 'Sural artery']), 1, 'Popliteal divides into anterior and posterior tibial.'),
    (v_topic_id, 'The posterior tibial artery supplies the:', to_jsonb(ARRAY['Anterior compartment', 'Posterior compartment', 'Lateral compartment', 'Gluteal region', 'Thigh']), 1, 'Supplies the deep and superficial posterior compartments.'),
    (v_topic_id, 'Which structure passes through the T8 level of the diaphragm?', to_jsonb(ARRAY['Aorta', 'Esophagus', 'IVC', 'Thoracic duct', 'Vagus']), 2, 'I 8 10 Eggs At 12.'),
    (v_topic_id, 'Esophagus passes through diaphragm at:', to_jsonb(ARRAY['T6', 'T8', 'T10', 'T12', 'L1']), 2, 'Esophagus at T10.'),
    (v_topic_id, 'Aorta passes through diaphragm at:', to_jsonb(ARRAY['T8', 'T10', 'T12', 'L1', 'T6']), 2, 'Aorta at T12.'),
    (v_topic_id, 'Phrenic nerve originates from:', to_jsonb(ARRAY['C1-C2', 'C3-C5', 'T1-T4', 'L1-L2', 'S2-S4']), 1, 'C3, 4, 5 keep the diaphragm alive.'),
    (v_topic_id, 'Phrenic nerve injury leads to:', to_jsonb(ARRAY['Vocal cord paralysis', 'Diaphragm paralysis', 'Loss of swallowing', 'Horner syndrome', 'Facial paralysis']), 1, 'Provides motor to diaphragm.');

    -- Q71-Q80
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Celiac trunk supplies:', to_jsonb(ARRAY['Midgut', 'Hindgut', 'Foregut', 'Kidneys', 'Pelvis']), 2, 'Supplies foregut structures.'),
    (v_topic_id, 'SMA supplies:', to_jsonb(ARRAY['Foregut', 'Midgut', 'Hindgut', 'Liver', 'Spleen']), 1, 'Supplies midgut structures.'),
    (v_topic_id, 'IMA supplies:', to_jsonb(ARRAY['Foregut', 'Midgut', 'Hindgut', 'Liver', 'Pancreas']), 2, 'Supplies hindgut structures.'),
    (v_topic_id, 'Which ligament contains the portal triad?', to_jsonb(ARRAY['Falciform', 'Hepatoduodenal', 'Hepatogastric', 'Splenorenal', 'Coronary']), 1, ' Triad runs in the hepatoduodenal ligament.'),
    (v_topic_id, 'The foramen of Winslow connects:', to_jsonb(ARRAY['Peritoneum to pleura', 'Lesser sac to greater sac', 'Thorax to abdomen', 'Liver to stomach', 'Pancreas to spleen']), 1, 'Epiploic foramen links the two sacs.'),
    (v_topic_id, 'The uterus is supplied mainly by:', to_jsonb(ARRAY['Ovarian artery', 'Uterine artery', 'Internal pudendal', 'Inferior epigastric', 'External iliac']), 1, 'Primary supply is the uterine artery.'),
    (v_topic_id, 'Uterine artery crosses over the:', to_jsonb(ARRAY['Ovarian ligament', 'Ureter', 'Round ligament', 'Broad ligament', 'Cervix']), 1, 'Water (ureter) under the bridge (artery).'),
    (v_topic_id, 'The pudendal nerve supplies:', to_jsonb(ARRAY['Bladder only', 'External genitalia', 'Uterus', 'Prostate only', 'Kidneys']), 1, 'S2-S4 motor/sensory to perineum.'),
    (v_topic_id, 'The corticospinal tract decussates at:', to_jsonb(ARRAY['Midbrain', 'Pons', 'Medulla', 'Thalamus', 'Cortex']), 2, 'Pyramidal decussation in the medulla.'),
    (v_topic_id, 'A lesion above decussation causes:', to_jsonb(ARRAY['Ipsilateral weakness', 'Contralateral weakness', 'Bilateral weakness', 'No weakness', 'Sensory loss only']), 1, 'Crossed fibers -> contralateral deficit.');

    -- Q81-Q90
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Broca area lesion causes:', to_jsonb(ARRAY['Fluent aphasia', 'Nonfluent aphasia', 'Sensory loss', 'Blindness', 'Deafness']), 1, 'Broca = Broken speech.'),
    (v_topic_id, 'Wernicke area lesion causes:', to_jsonb(ARRAY['Nonfluent aphasia', 'Fluent aphasia', 'Dysarthria', 'Ataxia', 'Weakness']), 1, 'Wernicke = Word salad.'),
    (v_topic_id, 'The stylopharyngeus muscle is innervated by:', to_jsonb(ARRAY['Vagus', 'Glossopharyngeal', 'Facial', 'Hypoglossal', 'Trigeminal']), 1, 'CN IX supplies its only muscle.'),
    (v_topic_id, 'The only muscle that abducts vocal cords:', to_jsonb(ARRAY['Cricothyroid', 'Posterior cricoarytenoid', 'Lateral cricoarytenoid', 'Thyroarytenoid', 'Vocalis']), 1, 'PCA = Pulls Cords Apart.'),
    (v_topic_id, 'Damage to posterior cricoarytenoid causes:', to_jsonb(ARRAY['Hoarseness only', 'Inability to abduct vocal cords', 'Dysphagia', 'Loss of taste', 'Facial paralysis']), 1, 'Critical for opening the airway.'),
    (v_topic_id, 'Neural tube closes by:', to_jsonb(ARRAY['Week 1', 'Week 2', 'Week 3-4', 'Week 6', 'Week 8']), 2, 'Closure occurs around day 24-26.'),
    (v_topic_id, 'Failure of neural tube closure leads to:', to_jsonb(ARRAY['Meckel', 'Spina bifida', 'Hirschsprung', 'Omphalocele', 'TE fistula']), 1, 'Neural tube defects like spina bifida.'),
    (v_topic_id, 'Midgut rotates:', to_jsonb(ARRAY['90°', '180°', '270°', '360°', '45°']), 2, '270 degrees counterclockwise.'),
    (v_topic_id, 'Malrotation predisposes to:', to_jsonb(ARRAY['Hernia', 'Volvulus', 'Pancreatitis', 'Hepatitis', 'Appendicitis']), 1, 'Torsion around the SMA root.'),
    (v_topic_id, 'Vitelline duct remnant =', to_jsonb(ARRAY['Urachus', 'Meckel diverticulum', 'Omphalocele', 'Hirschsprung', 'Cloaca']), 1, 'Persistent vitelline duct.');

    -- Q91-Q100
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A patient develops cavernous sinus thrombosis after a facial infection. Which cranial nerve is most vulnerable centrally?', to_jsonb(ARRAY['Oculomotor', 'Trochlear', 'Ophthalmic', 'Maxillary', 'Abducens']), 4, 'CN VI runs centrally in the sinus.'),
    (v_topic_id, 'A lesion in the cavernous sinus may affect all EXCEPT:', to_jsonb(ARRAY['CN III', 'CN IV', 'CN V2', 'CN XII', 'ICA']), 3, 'CN XII does not pass through the cavernous sinus.'),
    (v_topic_id, 'A PCom aneurysm develops ptosis, "down and out" eye, and mydriasis. Which nerve?', to_jsonb(ARRAY['Optic', 'Oculomotor', 'Trochlear', 'Abducens', 'Ophthalmic']), 1, 'CN III palsy with pupil involvement.'),
    (v_topic_id, 'A patient cannot look downward and inward while descending stairs. Which nerve?', to_jsonb(ARRAY['Oculomotor', 'Trochlear', 'Abducens', 'Optic', 'Facial']), 1, 'CN IV palsy (superior oblique).'),
    (v_topic_id, 'A patient presents with inability to abduct the right eye. Which cranial nerve?', to_jsonb(ARRAY['CN III', 'CN IV', 'CN V1', 'CN VI', 'CN VII']), 3, 'CN VI palsy (lateral rectus).'),
    (v_topic_id, 'An MCA stroke most commonly produces weakness of:', to_jsonb(ARRAY['Leg > Arm', 'Face/Arm > Leg', 'Trunk', 'Foot', 'Bilateral legs']), 1, 'MCA supplies lateral cortex area.'),
    (v_topic_id, 'An ACA infarct most commonly produces weakness of the:', to_jsonb(ARRAY['Face', 'Upper limb', 'Lower limb', 'Tongue', 'Extraocular']), 2, 'ACA supplies medial cortex (leg area).'),
    (v_topic_id, 'A PCA infarct is most likely to produce:', to_jsonb(ARRAY['Leg weakness', 'Contralateral homonymous hemianopia', 'Aphasia', 'Bell palsy', 'Facial pain loss']), 1, 'PCA supplies occipital visual cortex.'),
    (v_topic_id, 'A lesion of the internal capsule most often causes:', to_jsonb(ARRAY['Isolated palsy', 'Severe contralateral motor deficits', 'Ipsilateral ataxia', 'Loss of smell', 'Isolated sensory loss']), 1, 'Dense motor fibers in posterior limb.'),
    (v_topic_id, 'The lenticulostriate arteries are branches of the:', to_jsonb(ARRAY['ACA', 'MCA', 'PCA', 'Basilar', 'Vertebral']), 1, 'Small branches of MCA.');

    -- Q101-Q110
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A small vessel hemorrhage in the internal capsule most likely involves:', to_jsonb(ARRAY['Anterior spinal', 'Lenticulostriate', 'PICA', 'PCom', 'SCA']), 1, 'Prone to rupture in hypertension.'),
    (v_topic_id, 'A lesion of the lateral medulla due to PICA infarction most likely produces:', to_jsonb(ARRAY['Contralateral weakness', 'Dysphagia and hoarseness', 'Ipsilateral tongue paralysis', 'Blindness', 'Forehead sparing']), 1, 'Affects Nucleus Ambiguus.'),
    (v_topic_id, 'Medial medullary syndrome often involves damage to which cranial nerve?', to_jsonb(ARRAY['Facial', 'Glossopharyngeal', 'Hypoglossal', 'Trochlear', 'Vagus']), 2, 'May affect CN XII fibers.'),
    (v_topic_id, 'Quadrilateral quadriplegia with communication only by blinking after basilar thrombosis is:', to_jsonb(ARRAY['Brown-Séquard', 'Locked-in syndrome', 'Wallenberg', 'Horner', 'Weber']), 1, 'Basal pons damage.'),
    (v_topic_id, 'The facial colliculus is located in the:', to_jsonb(ARRAY['Midbrain', 'Pons', 'Medulla', 'Internal capsule', 'Cerebellum']), 1, 'Dorsal pons relation.'),
    (v_topic_id, 'A patient has a lesion of the dorsal columns. Which sensation is lost?', to_jsonb(ARRAY['Pain', 'Temperature', 'Vibration', 'Crude touch', 'Motor strength']), 2, 'Vibration, fine touch, proprioception.'),
    (v_topic_id, 'Dorsal column fibers decussate in the:', to_jsonb(ARRAY['Spinal cord', 'Medulla', 'Pons', 'Midbrain', 'Thalamus']), 1, 'Internal arcuate fibers in medulla.'),
    (v_topic_id, 'Spinothalamic fibers decussate in the:', to_jsonb(ARRAY['Medulla', 'Pons', 'Spinal cord', 'Internal capsule', 'Cortex']), 2, 'Within 1-2 levels of entry.'),
    (v_topic_id, 'Ipsilateral vibration loss and contralateral pain loss after hemisection is:', to_jsonb(ARRAY['Tabes dorsalis', 'Brown-Séquard syndrome', 'Wallenberg', 'Cauda equina', 'Central cord']), 1, 'Classic cord hemisection.'),
    (v_topic_id, 'The cerebral aqueduct connects:', to_jsonb(ARRAY['Lateral to 3rd', '3rd to 4th', '4th to subarachnoid', 'Central canal to lateral', '3rd to subarachnoid']), 1, 'Links middle ventricles.');

    -- Q111-Q120
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'CSF is produced mainly by the:', to_jsonb(ARRAY['Arachnoid granulations', 'Choroid plexus', 'Pia mater', 'Venous sinuses', 'Ependyma']), 1, 'Active secretion by choroid plexus.'),
    (v_topic_id, 'CSF is reabsorbed into the venous system through:', to_jsonb(ARRAY['Circle of Willis', 'Arachnoid granulations', 'Choroid plexus', 'Falx cerebri', 'Ependymal cells']), 1, 'Returns to dural sinuses.'),
    (v_topic_id, 'The thoracic duct drains into the junction of the:', to_jsonb(ARRAY['Right IJV/Subclavian', 'Left IJV/Subclavian', 'SVC/Azygos', 'Brachiocephalic/SVC', 'Left Brachiocephalic/Azygos']), 1, 'Drains into the left venous angle.'),
    (v_topic_id, 'Which region is drained by the right lymphatic duct?', to_jsonb(ARRAY['Both lower limbs', 'Abdomen', 'Left thorax', 'Right upper quadrant', 'Pelvis']), 3, 'Drains RUQ of body.'),
    (v_topic_id, 'A left-sided varicocele is common because the left testicular vein drains into:', to_jsonb(ARRAY['IVC directly', 'Left renal vein', 'Portal vein', 'IMV', 'Internal iliac']), 1, 'Enters renal vein at 90 deg.'),
    (v_topic_id, 'The testicular arteries arise directly from the:', to_jsonb(ARRAY['External iliac', 'Internal iliac', 'Abdominal aorta', 'Renal arteries', 'Inferior epigastric']), 2, 'Paired visceral branches of aorta.'),
    (v_topic_id, 'The cremaster muscle is derived from:', to_jsonb(ARRAY['External oblique', 'Internal oblique', 'Transversus abdominis', 'Rectus abdominis', 'Pyramidalis']), 1, 'Fibers from internal oblique.'),
    (v_topic_id, 'The cremasteric reflex afferent is:', to_jsonb(ARRAY['Ilioinguinal', 'Pudendal', 'Femoral', 'Obturator', 'Sciatic']), 0, 'Ilioinguinal (L1) afferent.'),
    (v_topic_id, 'A horseshoe kidney is most likely trapped under the:', to_jsonb(ARRAY['Celiac trunk', 'SMA', 'IMA', 'Renal artery', 'Common iliac']), 2, 'Trapped by IMA during ascent.'),
    (v_topic_id, 'The ureter is NORMALLY narrowed at all EXCEPT:', to_jsonb(ARRAY['UPJ', 'Crossing iliacs', 'UVJ', 'Mid-ureter beside pancreas', 'None']), 3, 'UPJ, iliac crossing, and UVJ are the 3 sites.');

    -- Q121-Q130
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A kidney stone at the UVJ may refer pain to the:', to_jsonb(ARRAY['Shoulder', 'Groin', 'Neck', 'Head', 'Lateral arm']), 1, 'Pain follows T11-L2 dermatomes.'),
    (v_topic_id, 'The suprarenal glands develop from mesoderm and:', to_jsonb(ARRAY['Surface ectoderm', 'Neural tube', 'Neural crest', 'Endoderm', 'Somites']), 2, 'Medulla = neural crest; Cortex = mesoderm.'),
    (v_topic_id, 'The thyroid gland originates near the:', to_jsonb(ARRAY['Foramen ovale', 'Foramen cecum', 'Cribriform plate', 'Jugular foramen', 'Sella turcica']), 1, 'Descends from the tongue base.'),
    (v_topic_id, 'A thyroglossal duct cyst usually moves with:', to_jsonb(ARRAY['Eye movement', 'Tongue protrusion', 'Jaw opening', 'Shoulder shrug', 'Inspiration']), 1, 'Moves with tongue/swallowing.'),
    (v_topic_id, 'The parathyroid glands develop from pharyngeal pouches:', to_jsonb(ARRAY['1st/2nd', '2nd/3rd', '3rd/4th', '4th/5th', '1st/3rd']), 2, '3rd (inferior) and 4th (superior).'),
    (v_topic_id, 'The thymus develops from the:', to_jsonb(ARRAY['1st pouch', '2nd pouch', '3rd pouch', '4th pouch', 'Neural crest']), 2, '3rd pharyngeal pouch.'),
    (v_topic_id, 'The stapes and styloid process derive from which arch?', to_jsonb(ARRAY['1st', '2nd', '3rd', '4th', '6th']), 1, 'Reichert cartilage (2nd arch).'),
    (v_topic_id, 'Muscles of mastication derive from the:', to_jsonb(ARRAY['1st arch', '2nd arch', '3rd arch', '4th arch', '6th arch']), 0, 'Arch 1 (mandibular).'),
    (v_topic_id, 'Muscles of facial expression derive from the:', to_jsonb(ARRAY['1st arch', '2nd arch', '3rd arch', '4th arch', 'Occipital somites']), 1, 'Arch 2 (hyoid).'),
    (v_topic_id, 'Stylopharyngeus derives from the:', to_jsonb(ARRAY['1st arch', '2nd arch', '3rd arch', '4th arch', '6th arch']), 2, 'Arch 3 (glossopharyngeal).');

    -- Q131-Q140
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Most laryngeal cartilages derive from:', to_jsonb(ARRAY['1st/2nd', '2nd/3rd', '3rd/4th', '4th/6th', '1st/4th']), 3, 'Arches 4 and 6.'),
    (v_topic_id, 'Cleft lip results from failure of fusion of:', to_jsonb(ARRAY['Maxillary with Medial nasal', 'Mandibular prominences', 'Lateral nasal only', 'Arch 1/2', 'Palatal shelves']), 0, 'Maxillary prominence + medial nasal prominence.'),
    (v_topic_id, 'Cleft palate results from failure of fusion of the:', to_jsonb(ARRAY['Medial nasal', 'Palatal shelves', 'Mandibular', 'Frontonasal', 'Lateral nasal']), 1, 'Palatal shelves failure to fuse.'),
    (v_topic_id, 'Failure of forebrain division leads to:', to_jsonb(ARRAY['Spina bifida', 'Holoprosencephaly', 'Arnold-Chiari', 'Dandy-Walker', 'Syringomyelia']), 1, 'Associated with Sonic Hedgehog.'),
    (v_topic_id, 'Cerebellar tonsil herniation occurs in:', to_jsonb(ARRAY['Dandy-Walker', 'Arnold-Chiari', 'Holoprosencephaly', 'Agenesis', 'Craniosynostosis']), 1, 'Chiari type II involves tonsils.'),
    (v_topic_id, 'Dandy-Walker malformation involves enlargement of the:', to_jsonb(ARRAY['Lateral', '3rd', '4th ventricle', 'Central canal', 'Cavum']), 2, 'Cerebellar vermis agenesis -> 4th vent dilation.'),
    (v_topic_id, 'A lesion of the cerebellar vermis causes:', to_jsonb(ARRAY['Intention tremor', 'Truncal ataxia', 'Hemiballismus', 'Resting tremor', 'Hemiplegia']), 1, 'Vermis = midline control.'),
    (v_topic_id, 'The flocculonodular lobe is associated with:', to_jsonb(ARRAY['Fine limb movement', 'Balance/Eye movements', 'Speech', 'Pain', 'Memory']), 1, 'Vestibulocerebellum function.'),
    (v_topic_id, 'The red nucleus is in the:', to_jsonb(ARRAY['Medulla', 'Pons', 'Midbrain', 'Thalamus', 'Internal capsule']), 2, 'Midbrain tegmentum.'),
    (v_topic_id, 'The superior colliculus is involved in:', to_jsonb(ARRAY['Hearing', 'Visual reflexes', 'Taste', 'Bladder', 'Language']), 1, 'Mediates visual tracking/reflexes.');

    -- Q141-Q150
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'The inferior colliculus is involved in:', to_jsonb(ARRAY['Vision', 'Hearing', 'Smell', 'Taste', 'Balance']), 1, 'Part of the auditory pathway.'),
    (v_topic_id, 'The facial artery crosses the mandible anterior to the:', to_jsonb(ARRAY['Masseter', 'Temporalis', 'Buccinator', 'Platysma', 'Mylohyoid']), 0, 'Masseter is the key landmark.'),
    (v_topic_id, 'The lingual artery is a branch of the:', to_jsonb(ARRAY['Internal carotid', 'External carotid', 'Maxillary', 'Facial', 'Subclavian']), 1, '2nd branch of external carotid.'),
    (v_topic_id, 'The maxillary artery is a terminal branch of the:', to_jsonb(ARRAY['Facial', 'External carotid', 'Internal carotid', 'Vertebral', 'Subclavian']), 1, 'One of the two terminal branches.'),
    (v_topic_id, 'The occipital artery is a branch of the:', to_jsonb(ARRAY['External carotid', 'Internal carotid', 'Vertebral', 'Basilar', 'Subclavian']), 0, 'Posterior branch of external carotid.'),
    (v_topic_id, 'Middle meningeal artery is a branch of the:', to_jsonb(ARRAY['Facial', 'Maxillary', 'Internal carotid', 'Superficial temporal', 'Ophthalmic']), 1, 'Branch of maxillary (Arch 1 remnant).'),
    (v_topic_id, 'The ophthalmic artery is a branch of the:', to_jsonb(ARRAY['External carotid', 'Internal carotid', 'Maxillary', 'Facial', 'Vertebral']), 1, 'Branch of internal carotid after the sinus.'),
    (v_topic_id, 'The vertebral arteries join to form the:', to_jsonb(ARRAY['Circle of Willis', 'PCom', 'Basilar artery', 'Anterior spinal', 'MCA']), 2, 'Join at the pontomedullary junction.'),
    (v_topic_id, 'The great cerebral vein drains into the:', to_jsonb(ARRAY['Cavernous', 'Superior sagittal', 'Straight sinus', 'Transverse', 'Sigmoid']), 2, 'Joins inferior sagittal to form straight sinus.'),
    (v_topic_id, 'The superior sagittal sinus ultimately drains into the:', to_jsonb(ARRAY['Straight sinus', 'Transverse sinus', 'Cavernous', 'Internal carotid', 'Superior petrosal']), 1, 'Drains into the confluence then transverse sinus.');

END $$;
