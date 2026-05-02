-- Clinical Skills & Diagnostics: Chest X-ray & Radiology - Part 3 (Cases 26-37)
-- US MD/MBBS (3rd Year) mixed case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: chest-xray-radiology

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'chest-xray-radiology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'chest-xray-radiology';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 26: Osteomyelitis - Imaging Modalities
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Diabetic Foot Ulcer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Diabetic Foot Ulcer', 'A 60-year-old diabetic patient has a deep non-healing ulcer on his heel. You are concerned about osteomyelitis.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Diabetic Foot Ulcer', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long does it typically take for osteomyelitis to be visible on a plain X-ray?', '["1 hour", "24 hours", "10-14 days", "6 months"]', 2, 'Bone destruction from osteomyelitis is not visible on plain film for ~2 weeks.'),
    (v_case_id, 'Which imaging modality is most sensitive for early detection of osteomyelitis?', '["Plain X-ray", "Ultrasound", "CT scan", "MRI"]', 3, 'MRI is the most sensitive and specific test for diagnosing early osteomyelitis.'),
    (v_case_id, 'On plain film, what is the term for a fragment of dead bone that has become sequestered from its blood supply?', '["Involucrum", "Sequestrum", "Callus", "Cloaca"]', 1, 'Sequestrum is dead bone; Involucrum is the new bone formed around it.');

    ---------------------------------------------------------------------------
    -- CASE 27: Pulmonary Infarction - Hampton''s Hump
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wedge-Shaped Opacity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wedge-Shaped Opacity', 'A patient with a confirmed PE has a CXR showing a wedge-shaped opacity at the lung periphery with its base against the pleura.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Wedge-Shaped Opacity', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this radiographic sign called?', '["Hampton''s hump", "Westermark sign", "Kerley B line", "Silhouette sign"]', 0, 'Hampton''s hump represents pulmonary infarction distal to a PE.'),
    (v_case_id, 'What is the "Westermark sign" in pulmonary embolism?', '["A wedge-shaped opacity", "Focal oligemia (decreased vascular markings) distal to the embolus", "A dilated pulmonary artery", "PR segment depression"]', 1, 'Westermark sign is decreased vascularity (blacker lung) due to blood flow obstruction.'),
    (v_case_id, 'Which of the following is true about these signs (Hampton''s and Westermark)?', '["They are very sensitive for PE", "They are specific but not sensitive for PE", "They are found in 90% of PE cases", "They are normal variants"]', 1, 'These signs are classic but rarely seen in actual practice (low sensitivity).');

    ---------------------------------------------------------------------------
    -- CASE 28: Diaphragmatic Hernia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bowel Loops in the Chest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bowel Loops in the Chest', 'A neonate presents with respiratory distress and a "scaphoid" abdomen. The CXR shows air-filled tubular structures in the left hemithorax.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bowel Loops in the Chest', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of congenital diaphragmatic hernia (occurring posteriorly)?', '["Morgagni", "Bochdalek", "Hiatal", "Paraesophageal"]', 1, 'Bochdalek hernias are posterior and more common; "Bochdalek is Back (and Left)."'),
    (v_case_id, 'What is the primary life-threatening complication for the neonate?', '["Bowel obstruction", "Pulmonary hypoplasia", "Cardiac failure", "Malnutrition"]', 1, 'The mass effect of the bowel in the chest prevents normal lung development (hypoplasia).'),
    (v_case_id, 'Which diaphragmatic hernia occurs anteriorly through the retrosternal space?', '["Bochdalek", "Morgagni", "Sliding", "Congenital"]', 1, 'Morgagni hernias are anterior.');

    ---------------------------------------------------------------------------
    -- CASE 29: Endotracheal Tube (ETT) Placement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tube Verification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tube Verification', 'A patient was just intubated. You are checking the post-intubation CXR for tube placement.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tube Verification', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where should the tip of the ETT ideally be located?', '["At the level of the vocal cords", "3-5 cm above the carina", "In the right mainstem bronchus", "In the esophagus"]', 1, 'The ETT tip should be halfway between the vocal cords and the carina (about 3-5 cm above the carina).'),
    (v_case_id, 'If the ETT is advanced too far, which bronchus does it most commonly enter?', '["Right mainstem bronchus", "Left mainstem bronchus", "It stays in the trachea", "It enters the stomach"]', 0, 'The right mainstem is more vertical and wider than the left.'),
    (v_case_id, 'What radiographic sign would indicate that the ETT has been placed in the esophagus?', '["Air bronchograms", "The tube is seen lateral to the trachea or the stomach is distended with air", "Lobar collapse", "Hyperinflation"]', 1, 'Esophageal intubation can be seen as the tube being outside the tracheal air column.');

    ---------------------------------------------------------------------------
    -- CASE 30: Nasogastric Tube (NGT) Placement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Safe Feeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Safe Feeding', 'A nurse asks you to confirm NGT placement before starting tube feeds.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Safe Feeding', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where must the tip of the NGT be for it to be safe to use for feeding?', '["In the esophagus", "Below the level of the diaphragm and within the stomach bubble", "In the duodenum", "At the carina"]', 1, 'The tip and all side holes must be within the stomach, well below the gastroesophageal junction.'),
    (v_case_id, 'If the NGT is seen following the course of a bronchus, what should be done?', '["Start feeding", "Flush with water", "Immediately remove and re-attempt", "Inject air and listen"]', 2, 'Accidental placement in the tracheobronchial tree can lead to aspiration pneumonia or pneumothorax.'),
    (v_case_id, 'What is the most reliable method to confirm NGT placement?', '["Auscultation of an air bolus", "pH testing of aspirate", "Chest X-ray", "Watching the patient for cough"]', 2, 'X-ray is the gold standard for verifying NGT position.');

    ---------------------------------------------------------------------------
    -- CASE 31: Central Venous Catheter (CVC) - Tip Position
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Internal Jugular Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Internal Jugular Line', 'You have just placed a right internal jugular central line. The confirmation CXR is performed.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Internal Jugular Line', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the ideal location for the tip of a central venous catheter?', '["Right atrium", "Superior Vena Cava (SVC) near its junction with the Right Atrium", "Internal jugular vein", "Aorta"]', 1, 'The tip should be in the SVC to avoid cardiac arrhythmias or perforation of the atrium.'),
    (v_case_id, 'Which complication should be specifically looked for on the post-procedure CXR after CVC placement?', '["Pneumothorax", "Pneumonia", "Atelectasis", "Rib fracture"]', 0, 'Pneumothorax is a known risk of CVC placement, especially with subclavian attempts.'),
    (v_case_id, 'If the CVC tip is in the right atrium, what is a potential complication?', '["Stroke", "Cardiac arrhythmias", "Esophageal perforation", "Pneumonia"]', 1, 'Irritation of the atrial wall can trigger SVT or A-fib.');

    ---------------------------------------------------------------------------
    -- CASE 32: Lung Abscess vs. Empyema
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fluid Level' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fluid Level', 'A patient with pneumonia has a large air-fluid level in the lower lung field.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fluid Level', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A collection of pus within the pleural space is called:', '["Lung abscess", "Empyema", "Bronchiectasis", "Pneumothorax"]', 1, 'Empyema is an infection in the pleural space, often requiring drainage.'),
    (v_case_id, 'Which CT sign helps distinguish an empyema from a lung abscess by showing displacement of the pleural layers?', '["Silhouette sign", "Split pleura sign", "Halo sign", "Air crescent sign"]', 1, 'The "split pleura sign" (thickened, enhancing parietal and visceral pleura) is characteristic of empyema.'),
    (v_case_id, 'An air-fluid level that has equal lengths on both PA and lateral views is more likely to be:', '["Empyema", "Lung abscess", "Normal lung", "Pleural effusion"]', 1, 'Abscesses are generally spherical, so the fluid level length is similar on both views. Empyema follows the chest wall and varies more.');

    ---------------------------------------------------------------------------
    -- CASE 33: Bronchiectasis - Tram Tracks
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Productive Cough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Productive Cough', 'A 30-year-old with cystic fibrosis has a CXR showing parallel linear shadows and "ring" opacities.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Productive Cough', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these parallel linear shadows called?', '["A-lines", "Tram tracks", "Kerley B lines", "Septal lines"]', 1, 'Tram tracks represent thickened, dilated bronchial walls in bronchiectasis.'),
    (v_case_id, 'What is the gold standard imaging modality for diagnosing bronchiectasis?', '["CXR", "Ultrasound", "High-Resolution CT (HRCT)", "MRI"]', 2, 'HRCT is much more sensitive than CXR for detecting bronchial dilation.'),
    (v_case_id, 'On CT, a bronchus that is significantly larger than its accompanying pulmonary artery is known as:', '["The Silhouette sign", "The Signet Ring sign", "The Golden S sign", "The Comet tail sign"]', 1, 'The signet ring sign is the hallmark of bronchiectasis on CT.');

    ---------------------------------------------------------------------------
    -- CASE 34: Pulmonary Sequestration
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Abnormal Lung Segment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Abnormal Lung Segment', 'A young adult has recurrent pneumonias in the same location (left lower lobe). CT shows a segment of lung tissue that lacks a normal connection to the bronchial tree.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Abnormal Lung Segment', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this non-functional lung tissue that receives its blood supply from the systemic circulation (aorta)?', '["Sequestration", "Abscess", "Hamartoma", "Atelectasis"]', 0, 'Pulmonary sequestration is congenital and receives systemic arterial supply.'),
    (v_case_id, 'Which type of sequestration is enclosed within the same visceral pleura as the rest of the lung?', '["Intralobar", "Extralobar", "Mediastinal", "Parietal"]', 0, 'Intralobar is more common and presents later in life; Extralobar has its own pleura and presents in neonates.'),
    (v_case_id, 'What is the most definitive way to diagnose sequestration on imaging?', '["Demonstrating an anomalous systemic artery supplying the lung segment", "Seeing a cavity", "Seeing a pleural effusion", "Auscultation"]', 0, 'The hallmark is the systemic arterial supply (e.g., from the aorta).');

    ---------------------------------------------------------------------------
    -- CASE 35: Osteoporosis - DEXA vs. Plain Film
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fragile Bones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fragile Bones', 'A 70-year-old woman has a DEXA scan showing a T-score of -3.0 at the lumbar spine.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fragile Bones', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis based on the T-score?', '["Normal", "Osteopenia", "Osteoporosis", "Osteomalacia"]', 2, 'Osteoporosis is defined as a T-score <= -2.5.'),
    (v_case_id, 'How much bone mineral density must be lost before it is visible as "osteopenia" on a plain X-ray?', '["5%", "10%", "30-50%", "90%"]', 2, 'Plain films are not sensitive for early osteoporosis; significant loss is required for visibility.'),
    (v_case_id, 'Which vertebral fracture pattern is classic for osteoporosis on a lateral X-ray?', '["Burst fracture", "Wedge (Compression) fracture", "Hangman''s fracture", "Jefferson fracture"]', 1, 'Anterior wedge/compression fractures are common in osteoporotic spines.');

    ---------------------------------------------------------------------------
    -- CASE 36: Mammography - BIRADS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breast Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breast Screening', 'A woman''s screening mammogram is reported as "BIRADS 0."', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Breast Screening', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a BIRADS 0 score indicate?', '["Negative finding", "Incomplete; further imaging (ultrasound/spot views) needed", "Benign finding", "Highly suggestive of malignancy"]', 1, 'BIRADS 0 means the assessment is incomplete.'),
    (v_case_id, 'Which radiographic finding on mammography is most concerning for cancer?', '["Macrocalcifications", "Smooth, round mass", "Pleomorphic microcalcifications and architectural distortion", "Simple cyst"]', 2, 'Microcalcifications and spiculated masses are high-risk features.'),
    (v_case_id, 'A BIRADS 4 report suggests that the finding is:', '["Benign", "Probably benign", "Suspicious (Biopsy recommended)", "Confirmed malignancy"]', 2, 'BIRADS 4 means suspicious; a biopsy should be performed.');

    ---------------------------------------------------------------------------
    -- CASE 37: Free Air vs. Chilaiditi Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The False Positive' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The False Positive', 'A 70-year-old man has a CXR for a preoperative screen. You see air under the right hemidiaphragm, but the patient has no abdominal pain.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The False Positive', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The presence of haustral markings in the subdiaphragmatic air indicates which benign condition?', '["Pneumoperitoneum", "Chilaiditi Syndrome", "Achalasia", "Hiatal hernia"]', 1, 'Chilaiditi syndrome is the interposition of the colon between the liver and the diaphragm.'),
    (v_case_id, 'How can you distinguish Chilaiditi syndrome from true free air on X-ray?', '["Chilaiditi air is blacker", "Chilaiditi air contains haustral folds; true free air is a featureless crescent", "Chilaiditi air only occurs on the left", "Free air is always above the stomach"]', 1, 'Haustral folds identify the air as being inside the bowel.'),
    (v_case_id, 'If you are still unsure if the subdiaphragmatic air is free or within a loop of bowel, what is the best next step?', '["Emergency surgery", "Lateral decubitus film or CT scan", "Barium swallow", "No follow-up needed"]', 1, 'A decubitus film or CT can definitively differentiate free air from colonic gas.');

END $$;

COMMIT;
