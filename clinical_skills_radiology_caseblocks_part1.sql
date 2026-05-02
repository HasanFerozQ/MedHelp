-- Clinical Skills & Diagnostics: Chest X-ray & Radiology - Part 1 (Cases 1-12)
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
    -- CASE 01: Radiology Basics - The 5 Densities
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Learning the Grey Scale' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Learning the Grey Scale', 'A medical student is learning to interpret X-rays. She is asked to identify the five basic radiographic densities.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student is learning to interpret X-rays. She is asked to identify the five basic radiographic densities.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which structure appears most "radiopaque" (whitest) on a standard plain film?', '["Fat", "Water/Soft tissue", "Air", "Metal"]', 3, 'The five densities from black to white are: Air, Fat, Water/Soft tissue, Bone/Calcium, and Metal.'),
    (v_case_id, 'On an X-ray, why does the heart appear grey (water density) while the lungs appear black (air density)?', '["Difference in blood flow", "Difference in atomic number and physical density", "Difference in temperature", "The heart reflects X-rays"]', 1, 'X-rays are absorbed more by denser tissues with higher atomic numbers, resulting in less film exposure (white/grey).'),
    (v_case_id, 'Radiographically, fat is more radiolucent (darker) than which of the following?', '["Air", "Water/Soft tissue", "Lead", "Bone"]', 1, 'Fat is denser than air but less dense than water/soft tissue, bone, or metal.');

    ---------------------------------------------------------------------------
    -- CASE 02: Adequacy of a Chest X-ray
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Technical Quality' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Technical Quality', 'You are reviewing a PA chest X-ray. You notice the medial ends of the clavicles are not equidistant from the spinous processes.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are reviewing a PA chest X-ray. You notice the medial ends of the clavicles are not equidistant from the spinous processes.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What technical error does this observation indicate?', '["Under-penetration", "Inadequate inspiration", "Patient rotation", "Magnification"]', 2, 'Equidistant clavicles relative to the spinous processes indicate the patient was not rotated.'),
    (v_case_id, 'How many posterior ribs should be visible above the diaphragm on a good inspiratory CXR?', '["6-7", "8-9", "10-11", "12-13"]', 2, 'A good inspiratory effort should show 10 posterior ribs (or 6 anterior ribs) above the diaphragm.'),
    (v_case_id, 'Why does a portable AP (anteroposterior) film often show a falsely enlarged heart (pseudo-cardiomegaly)?', '["Increased heart size during illness", "Divergence of the X-ray beam", "The heart is closer to the detector", "Patient is usually supine"]', 1, 'In an AP film, the heart is further from the detector and closer to the source, causing magnification by the diverging beam.');

    ---------------------------------------------------------------------------
    -- CASE 03: Lobar Consolidation - Pneumonia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever and Cough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever and Cough', 'A 65-year-old man has a fever and a productive cough. His CXR shows an opaque density in the right lower lung field. The right heart border is clearly visible, but the right hemidiaphragm is obscured.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old man has a fever and a productive cough. His CXR shows an opaque density in the right lower lung field. The right heart border is clearly visible, but the right hemidiaphragm is obscured.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the pneumonia localized based on the silhouette sign?', '["Right Upper Lobe", "Right Middle Lobe", "Right Lower Lobe", "Right Hilum"]', 2, 'Loss of the right hemidiaphragm border indicates Right Lower Lobe (RLL) consolidation. Loss of the right heart border would indicate RML.'),
    (v_case_id, 'What is the classic radiographic sign of consolidation where air-filled bronchi are visible against opaque lung?', '["The Silhouette sign", "Air bronchograms", "The Deep Sulcus sign", "The Golden S sign"]', 1, 'Air bronchograms occur when fluid/pus fills the alveoli but leaves the airways open.'),
    (v_case_id, 'Which of the following is the most common cause of community-acquired pneumonia showing lobar consolidation?', '["Mycoplasma pneumoniae", "Streptococcus pneumoniae", "Legionella pneumophila", "Pneumocystis jirovecii"]', 1, 'Streptococcus pneumoniae is the leading cause of lobar pneumonia.');

    ---------------------------------------------------------------------------
    -- CASE 04: Pleural Effusion
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shortness of Breath and Dull Percussion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shortness of Breath and Dull Percussion', 'A 70-year-old male with heart failure presents with worsening dyspnea. His CXR shows blunting of the left costophrenic angle and a "meniscus sign" along the lateral chest wall.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male with heart failure presents with worsening dyspnea. His CXR shows blunting of the left costophrenic angle and a "meniscus sign" along the lateral chest wall.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pneumothorax", "Pleural effusion", "Atelectasis"]', 2, 'Blunting of costophrenic angles and the meniscus sign are classic for pleural effusion.'),
    (v_case_id, 'Approximately how much fluid must be present to be visible on a standard upright PA chest X-ray?', '["5-10 mL", "50 mL", "200-300 mL", "1 Liter"]', 2, 'At least 200-300 mL of fluid is usually required to blunt the costophrenic angle on a PA view. Lateral views can detect smaller amounts (~50-100 mL).'),
    (v_case_id, 'A "massive" pleural effusion would most likely result in which of the following mediastinal changes?', '["Mediastinal shift toward the effusion", "Mediastinal shift away from the effusion", "No mediastinal shift", "Narrowing of the mediastinum"]', 1, 'Massive effusions act as space-occupying lesions, pushing the mediastinum away from the fluid.');

    ---------------------------------------------------------------------------
    -- CASE 05: Pneumothorax
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Pleuritic Chest Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Pleuritic Chest Pain', 'A 22-year-old tall, thin male smoker presents with sudden left-sided chest pain. On CXR, you see a thin white line parallel to the chest wall and an absence of lung markings lateral to it.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old tall, thin male smoker presents with sudden left-sided chest pain. On CXR, you see a thin white line parallel to the chest wall and an absence of lung markings lateral to it.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the thin white line seen on the X-ray?', '["Parietal pleura", "Visceral pleura", "Diaphragm", "Intercostal muscle"]', 1, 'The "visceral pleural line" is the diagnostic hallmark of a pneumothorax.'),
    (v_case_id, 'In a "tension" pneumothorax, what is the most critical radiographic and clinical sign?', '["Presence of a pleural line", "Flattening of the hemidiaphragm and mediastinal shift away from the lesion", "Lobar collapse", "Air bronchograms"]', 1, 'Tension pneumothorax is a life-threatening emergency characterized by increased intrapleural pressure, pushing the heart and mediastinum toward the contralateral side.'),
    (v_case_id, 'On a supine film in the ICU, a pneumothorax may appear as an unusually deep, dark costophrenic angle. This is called:', '["The Silhouette sign", "The Deep Sulcus sign", "The Westermark sign", "The Hamman sign"]', 1, 'In supine patients, air collects anteriorly and inferiorly, deepening the sulcus.');

    ---------------------------------------------------------------------------
    -- CASE 06: Congestive Heart Failure (CHF) - Kerley B Lines
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fluid Overload' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fluid Overload', 'A 75-year-old patient with dyspnea and orthopnea has a CXR showing cardiomegaly, increased caliber of upper lobe vessels, and short, thin horizontal lines at the lung bases near the pleura.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old patient with dyspnea and orthopnea has a CXR showing cardiomegaly, increased caliber of upper lobe vessels, and short, thin horizontal lines at the lung bases near the pleura.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these short horizontal lines called?', '["A-lines", "Kerley B lines", "B-lines (Ultrasound)", "Tram tracks"]', 1, 'Kerley B lines represent thickened interlobular septa due to pulmonary venous hypertension/interstitial edema.'),
    (v_case_id, 'What is the radiographic term for the enlarged upper lobe vessels seen in early CHF?', '["Oligemia", "Cephalization", "Peribronchial cuffing", "Batwing appearance"]', 1, 'Cephalization is the redistribution of blood flow to the upper lobes as left atrial pressure rises.'),
    (v_case_id, 'Cardiomegaly on a PA chest film is defined as a cardiothoracic ratio (CTR) greater than:', '["0.3", "0.4", "0.5", "0.7"]', 2, 'CTR > 50% is generally considered indicative of cardiomegaly on an upright PA film.');

    ---------------------------------------------------------------------------
    -- CASE 07: Atelectasis vs. Pneumonia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Volume Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Volume Loss', 'You are comparing two films. Film A shows a dense opacity in the left lung with the trachea deviated toward that side. Film B shows a similar opacity but the trachea is shifted away.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are comparing two films. Film A shows a dense opacity in the left lung with the trachea deviated toward that side. Film B shows a similar opacity but the trachea is shifted away.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for Film A?', '["Pleural effusion", "Atelectasis (Collapse)", "Tension pneumothorax", "Pneumonia"]', 1, 'Atelectasis is a volume-loss condition; it pulls mobile structures (trachea, fissures) toward the lesion.'),
    (v_case_id, 'Which radiographic sign is used to describe a lobar collapse that pulls the hilar structures upward or downward?', '["Fissural displacement", "Silhouette sign", "Golden S sign", "Hampton''s hump"]', 0, 'Displacement of fissures is the most reliable sign of lobar atelectasis.'),
    (v_case_id, 'The "Golden S sign" on CXR is specifically associated with which of the following?', '["Right Upper Lobe collapse due to an obstructing mass", "Left Lower Lobe effusion", "Bilateral pneumonia", "TB cavity"]', 0, 'The Golden S sign occurs when the minor fissure shifts superiorly but is bulged inferiorly by a hilar mass.');

    ---------------------------------------------------------------------------
    -- CASE 08: Pulmonary Nodule and Malignancy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Solitary Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Solitary Nodule', 'A 55-year-old smoker has an incidental 2 cm rounded opacity found on CXR. The borders are irregular and "spiculated."', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old smoker has an incidental 2 cm rounded opacity found on CXR. The borders are irregular and "spiculated."', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which feature is most suggestive of malignancy in a solitary pulmonary nodule?', '["Concentric calcification", "Smooth, well-defined borders", "Spiculated or lobulated borders", "Size < 5 mm"]', 2, 'Spiculated (star-like) or irregular borders have a high positive predictive value for malignancy.'),
    (v_case_id, 'What is the clinical definition of a pulmonary "nodule" versus a "mass"?', '["Nodule < 1 cm, Mass > 1 cm", "Nodule < 3 cm, Mass > 3 cm", "Nodule is round, Mass is irregular", "Nodule is benign, Mass is malignant"]', 1, 'Radiographically, a lesion <= 3 cm is a nodule; > 3 cm is a mass.'),
    (v_case_id, 'Which calcification pattern in a nodule is generally considered benign?', '["Stippled", "Eccentric", "Popcorn-like", "Irregular"]', 2, 'Popcorn calcification is classic for a benign hamartoma; central or concentric patterns are also usually benign.');

    ---------------------------------------------------------------------------
    -- CASE 09: Sarcoidosis - Lymphadenopathy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bilateral Hilar Fullness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bilateral Hilar Fullness', 'A 30-year-old African American woman presents with a dry cough and erythema nodosum. Her CXR shows prominent, symmetric enlargement of both hila.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old African American woman presents with a dry cough and erythema nodosum. Her CXR shows prominent, symmetric enlargement of both hila.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis based on the classic "1-2-3 sign" (symmetric hilar and paratracheal adenopathy)?', '["Tuberculosis", "Sarcoidosis", "Lymphoma", "Lung cancer"]', 1, 'Symmetric bilateral hilar lymphadenopathy (Stage 1) is the hallmark of sarcoidosis.'),
    (v_case_id, 'As sarcoidosis progresses (Stage 2), what radiographic change occurs?', '["The adenopathy disappears", "Development of interstitial lung disease (reticular opacities)", "Massive pleural effusion", "Lobar collapse"]', 1, 'Stage 2 sarcoidosis involves both hilar adenopathy and parenchymal lung disease.'),
    (v_case_id, 'Eggshell calcification of the hilar lymph nodes is most classically associated with which occupational lung disease?', '["Asbestosis", "Silicosis", "Berylliosis", "Coal worker''s pneumoconiosis"]', 1, 'Eggshell calcification (rim-like) of hilar nodes is a classic finding in silicosis.');

    ---------------------------------------------------------------------------
    -- CASE 10: Tuberculosis - Cavitary Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weight Loss and Hemoptysis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weight Loss and Hemoptysis', 'A 45-year-old man from an endemic region presents with chronic cough, night sweats, and weight loss. His CXR shows a thick-walled cavity in the right upper lobe apex.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old man from an endemic region presents with chronic cough, night sweats, and weight loss. His CXR shows a thick-walled cavity in the right upper lobe apex.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where does "reactivation" tuberculosis typically appear on CXR?', '["Lower lobes", "Apical or posterior segments of the upper lobes", "Pleural space only", "Hilar nodes only"]', 1, 'Reactivation TB favors high-oxygen environments like the lung apices.'),
    (v_case_id, 'A fungus ball (Aspergilloma) can often be seen inside a pre-existing TB cavity. This appears as a mobile mass within the cavity, known as:', '["The Silhouette sign", "The Monod sign (Air crescent sign)", "The Halo sign", "The Split Pleura sign"]', 1, 'The Monod sign is air surrounding an intracavitary mass (like an aspergilloma).'),
    (v_case_id, 'Small (1-2 mm) widespread "millet seed" nodules throughout both lungs indicate which form of TB?', '["Primary TB", "Reactivation TB", "Miliary TB", "Ghon complex"]', 2, 'Miliary TB represents hematogenous spread of the bacilli.');

    ---------------------------------------------------------------------------
    -- CASE 11: COPD and Hyperinflation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Smoker''s Lungs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Smoker''s Lungs', 'A 68-year-old heavy smoker presents with chronic dyspnea. His CXR shows flattened hemidiaphragms, an increased retrosternal clear space, and a small, narrow heart.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old heavy smoker presents with chronic dyspnea. His CXR shows flattened hemidiaphragms, an increased retrosternal clear space, and a small, narrow heart.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These findings are most characteristic of:', '["Asthma", "Emphysema (COPD)", "Restrictive lung disease", "Pulmonary fibrosis"]', 1, 'Hyperinflation (flattened diaphragms, increased retrosternal air) is classic for emphysema.'),
    (v_case_id, 'In emphysema, the heart appears small and narrow (vertical) primarily because:', '["The heart is actually shrinking", "The diaphragm is pushing it up", "Hyperinflated lungs compress the heart", "It is an optical illusion from the black lungs"]', 2, 'Hyperinflated lungs elongate the heart, making it look narrow and vertical.'),
    (v_case_id, 'Large ( > 1 cm) air-filled spaces within the lung parenchyma that lack normal lung markings are called:', '["Cavities", "Abscesses", "Bullae", "Blebs"]', 2, 'Bullae are a common feature of advanced emphysema and can rupture to cause pneumothorax.');

    ---------------------------------------------------------------------------
    -- CASE 12: Mediastinal Anatomy - The 4 Ts
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anterior Mediastinal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anterior Mediastinal Mass', 'A 40-year-old man has a CXR for a persistent cough. The lateral view shows an opaque density filling the retrosternal clear space.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old man has a CXR for a persistent cough. The lateral view shows an opaque density filling the retrosternal clear space.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is part of the differential diagnosis for an "Anterior" mediastinal mass (The 4 Ts)?', '["Neurogenic tumor", "Thymoma", "Bronchogenic cyst", "Esophageal tumor"]', 1, 'The 4 Ts of anterior mediastinal masses: Thymoma, Teratoma, Thyroid (retrosternal), and "Terrible" Lymphoma.'),
    (v_case_id, 'Neurogenic tumors are the most common cause of masses in which mediastinal compartment?', '["Anterior", "Middle", "Posterior", "Superior"]', 2, 'Posterior mediastinal masses are most commonly neurogenic in origin.'),
    (v_case_id, 'On a frontal CXR, which structure forms the right border of the mediastinum?', '["Left ventricle", "Right atrium", "Aortic arch", "Pulmonary artery"]', 1, 'The right heart border is formed by the Right Atrium; the left border is formed by the Left Ventricle and Aortic Arch.');

END $$;

COMMIT;
