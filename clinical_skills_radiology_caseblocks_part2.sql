-- Clinical Skills & Diagnostics: Chest X-ray & Radiology - Part 2 (Cases 13-25)
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
    -- CASE 13: Pneumoperitoneum (Free Air)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Abdominal Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Abdominal Pain', 'A 50-year-old man presents with sudden onset "tearing" epigastric pain and a rigid abdomen. An upright CXR is ordered.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old man presents with sudden onset "tearing" epigastric pain and a rigid abdomen. An upright CXR is ordered.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which finding on an upright CXR would indicate a perforated viscus?', '["Air-fluid levels in the stomach", "Crescent-shaped radiolucency under the right hemidiaphragm", "Blunted costophrenic angles", "Cephalization of flow"]', 1, 'Pneumoperitoneum (free air) typically collects under the diaphragm on an upright film.'),
    (v_case_id, 'If the patient cannot stand, which position is best for detecting free air on a plain film?', '["Supine", "Left lateral decubitus", "Prone", "Right lateral decubitus"]', 1, 'In the left lateral decubitus position, free air will rise and be visible against the liver on the right side.'),
    (v_case_id, 'The "Rigler sign" (visibility of both sides of the bowel wall) is seen in which of the following?', '["Bowel obstruction", "Large-volume pneumoperitoneum on supine film", "Ascites", "Normal bowel gas"]', 1, 'Rigler sign occurs when air inside AND outside the bowel wall makes the wall clearly visible on a supine film.');

    ---------------------------------------------------------------------------
    -- CASE 14: Small Bowel Obstruction (SBO)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Nausea, Vomiting, and Distension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Nausea, Vomiting, and Distension', 'A 40-year-old woman with a history of prior abdominal surgery presents with crampy pain and vomiting. Abdominal X-rays show multiple dilated loops of bowel.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old woman with a history of prior abdominal surgery presents with crampy pain and vomiting. Abdominal X-rays show multiple dilated loops of bowel.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which radiographic finding distinguishes small bowel loops from large bowel loops?', '["Haustral markings that do not cross the entire width", "Valvulae conniventes (circular folds) that cross the entire width", "Presence of stool", "Central location only"]', 1, 'Small bowel folds (valvulae conniventes) cross the entire width of the lumen, unlike haustra.'),
    (v_case_id, 'What is the "3-6-9 rule" for the upper limits of normal bowel diameter (Small Bowel, Large Bowel, Cecum)?', '["1 cm, 2 cm, 3 cm", "3 cm, 6 cm, 9 cm", "5 cm, 10 cm, 15 cm", "3 mm, 6 mm, 9 mm"]', 1, 'Normal diameter: Small bowel < 3 cm, Large bowel < 6 cm, Cecum < 9 cm.'),
    (v_case_id, 'On an upright abdominal film, what finding is classic for a mechanical bowel obstruction?', '["Total absence of gas", "Multiple air-fluid levels in a ''stepladder'' pattern", "Gas in the rectum", "Air in the biliary tree"]', 1, 'Multiple dilated loops with air-fluid levels are characteristic of mechanical SBO.');

    ---------------------------------------------------------------------------
    -- CASE 15: CT Head - Epidural Hematoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Head Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Head Trauma', 'A 20-year-old is hit in the temple by a baseball. He has a "lucid interval" then becomes unresponsive. A non-contrast CT head shows a hyperdense, biconvex (lens-shaped) collection.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old is hit in the temple by a baseball. He has a "lucid interval" then becomes unresponsive. A non-contrast CT head shows a hyperdense, biconvex (lens-shaped) collection.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Subdural hematoma", "Epidural hematoma", "Subarachnoid hemorrhage", "Intraparenchymal hemorrhage"]', 1, 'Epidural hematomas are lens-shaped (biconvex) and do not cross suture lines.'),
    (v_case_id, 'Which vessel is most commonly ruptured in an epidural hematoma?', '["Middle cerebral artery", "Middle meningeal artery", "Bridging veins", "Basilar artery"]', 1, 'Rupture of the middle meningeal artery (often due to temporal bone fracture) is the classic cause.'),
    (v_case_id, 'Why does the hematoma not cross cranial suture lines?', '["The blood is too thick", "The dura is tightly adherent to the bone at the sutures", "The pressure is too low", "It follows the sulci"]', 1, 'The dura is the periosteum of the inner skull and is anchored at the sutures.');

    ---------------------------------------------------------------------------
    -- CASE 16: CT Head - Subdural Hematoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Elderly Patient with a Fall' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Elderly Patient with a Fall', 'An 80-year-old man on warfarin fell three days ago. He is now confused. CT head shows a crescent-shaped hyperdense collection that crosses suture lines.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man on warfarin fell three days ago. He is now confused. CT head shows a crescent-shaped hyperdense collection that crosses suture lines.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Epidural hematoma", "Subdural hematoma", "Hemorrhagic stroke", "Brain tumor"]', 1, 'Subdural hematomas are crescent-shaped and can cross suture lines.'),
    (v_case_id, 'Which vessels are typically involved in a subdural hematoma?', '["Cerebral arteries", "Meningeal arteries", "Bridging veins", "Dural sinuses"]', 2, 'Rupture of the bridging veins, which span the subdural space, causes this hemorrhage.'),
    (v_case_id, 'How does the appearance of a "chronic" subdural hematoma differ from an "acute" one on CT?', '["Chronic is hyperdense (white)", "Chronic is hypodense (dark)", "Chronic is biconvex", "There is no difference"]', 1, 'Acute blood is white (hyperdense); as it ages, it becomes isodense and then hypodense (dark) after ~3 weeks.');

    ---------------------------------------------------------------------------
    -- CASE 17: CT Head - Subarachnoid Hemorrhage (SAH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Worst Headache of Life' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Worst Headache of Life', 'A 45-year-old woman presents with a "thunderclap" headache. CT head shows hyperdensity within the basal cisterns and sulci.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman presents with a "thunderclap" headache. CT head shows hyperdensity within the basal cisterns and sulci.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common non-traumatic cause of SAH?', '["Hypertension", "Ruptured berry aneurysm", "AV malformation", "Amyloid angiopathy"]', 1, 'Saccular (berry) aneurysms, often at the Circle of Willis, are the most common cause.'),
    (v_case_id, 'If the CT head is negative but clinical suspicion for SAH is high, what is the next best step?', '["MRI brain", "Lumbar puncture", "Repeat CT in 24 hours", "Discharge with NSAIDs"]', 1, 'LP is used to look for xanthochromia (yellowish CSF from RBC breakdown) which is highly sensitive for SAH.'),
    (v_case_id, 'Which complications can occur several days after an SAH?', '["Cerebral vasospasm and hydrocephalus", "Hypertensive crisis", "Diabetes insipidus", "Temporal arteritis"]', 0, 'Vasospasm (causing ischemia) and hydrocephalus (impaired CSF absorption) are major late complications.');

    ---------------------------------------------------------------------------
    -- CASE 18: CT Abdomen - Appendicitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Right Lower Quadrant Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Right Lower Quadrant Pain', 'A 25-year-old male presents with periumbilical pain that shifted to the RLQ. CT abdomen shows a blind-ending tubular structure that is 8 mm in diameter with "fat stranding" around it.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male presents with periumbilical pain that shifted to the RLQ. CT abdomen shows a blind-ending tubular structure that is 8 mm in diameter with "fat stranding" around it.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the upper limit for a normal appendix diameter on CT?', '["3 mm", "6 mm", "10 mm", "12 mm"]', 1, 'An appendix > 6 mm is generally considered enlarged/abnormal.'),
    (v_case_id, 'What does "fat stranding" on CT represent?', '["Obesity", "Inflammation/Edema in the surrounding mesentery", "Normal finding", "Prior surgery"]', 1, 'Fat stranding (hazy increased density in the fat) is a key sign of nearby inflammation.'),
    (v_case_id, 'What is the name of the calcified stone sometimes seen at the base of the appendix?', '["Enterolith", "Appendicolith", "Gallstone", "Phlebolith"]', 1, 'An appendicolith is a calcified fecalith that can obstruct the appendix lumen.');

    ---------------------------------------------------------------------------
    -- CASE 19: Pulmonary Embolism - CTPA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shortness of Breath and Tachycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shortness of Breath and Tachycardia', 'A post-operative patient has sudden dyspnea. A Computed Tomography Pulmonary Angiogram (CTPA) shows dark "filling defects" in the pulmonary arteries.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-operative patient has sudden dyspnea. A Computed Tomography Pulmonary Angiogram (CTPA) shows dark "filling defects" in the pulmonary arteries.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "filling defect" on CTPA?', '["An area where contrast cannot flow due to a clot", "An area of excessive contrast", "A lung nodule", "A pleural effusion"]', 0, 'Contrast makes the vessels white; a clot appears as a dark area (filling defect) within the white vessel.'),
    (v_case_id, 'What is a "Saddle Embolus"?', '["An embolus in the leg", "An embolus that straddles the bifurcation of the main pulmonary artery", "An embolus in a small subsegmental branch", "An embolus in the heart"]', 1, 'Saddle emboli are large and life-threatening as they obstruct both main pulmonary arteries.'),
    (v_case_id, 'Which of the following is a relative contraindication to receiving IV contrast for CTPA?', '["Penicillin allergy", "Elevated creatinine/Renal failure", "Hypertension", "Recent surgery"]', 1, 'IV contrast is nephrotoxic and should be used with caution in patients with significant renal impairment.');

    ---------------------------------------------------------------------------
    -- CASE 20: Aortic Dissection - CT
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tearing Back Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tearing Back Pain', 'A 65-year-old male with a history of hypertension presents with sudden, "tearing" pain radiating to his back. CT angiography shows an "intimal flap" dividing the aorta into two lumens.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male with a history of hypertension presents with sudden, "tearing" pain radiating to his back. CT angiography shows an "intimal flap" dividing the aorta into two lumens.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The Stanford classification for dissection depends on the involvement of which part of the aorta?', '["Ascending aorta", "Descending aorta", "Aortic arch", "Abdominal aorta"]', 0, 'Stanford Type A involves the ascending aorta (requires surgery); Type B is limited to the descending aorta.'),
    (v_case_id, 'Which finding on a standard CXR might suggest an aortic dissection?', '["Lobar pneumonia", "Widened mediastinum", "Pleural effusion", "Pneumothorax"]', 1, 'Mediastinal widening is a classic but non-specific sign of aortic dissection on CXR.'),
    (v_case_id, 'The dissection occurs between which layers of the aortic wall?', '["Intima and Adventitia", "Intima and Media", "Media and Adventitia", "Within the Intima only"]', 1, 'Dissection involves blood entering the media through an intimal tear.');

    ---------------------------------------------------------------------------
    -- CASE 21: Ultrasound - Cholelithiasis and Cholecystitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Right Upper Quadrant Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Right Upper Quadrant Pain', 'A 42-year-old woman has RUQ pain. Ultrasound shows echogenic foci within the gallbladder with "posterior acoustic shadowing." The gallbladder wall is 5 mm thick.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old woman has RUQ pain. Ultrasound shows echogenic foci within the gallbladder with "posterior acoustic shadowing." The gallbladder wall is 5 mm thick.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "posterior acoustic shadow" behind a gallstone?', '["Artifact from the liver", "Area where sound waves are blocked by the dense stone", "A sign of infection", "Presence of air"]', 1, 'Dense objects (like stones or bone) block US waves, creating a dark "shadow" behind them.'),
    (v_case_id, 'What is the normal upper limit for the gallbladder wall thickness?', '["1 mm", "3 mm", "5 mm", "7 mm"]', 1, 'A gallbladder wall > 3 mm is considered thickened and suggestive of cholecystitis (if other signs are present).'),
    (v_case_id, 'Pain elicited when the ultrasound probe is pressed over the gallbladder is called:', '["Sonographic Murphy sign", "Sonographic Rovsing sign", "Psoas sign", "McBurney sign"]', 0, 'The Sonographic Murphy sign is very sensitive for acute cholecystitis.');

    ---------------------------------------------------------------------------
    -- CASE 22: Ultrasound - Abdominal Aortic Aneurysm (AAA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pulsatile Abdominal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pulsatile Abdominal Mass', 'A 68-year-old male smoker has a routine screening ultrasound. The abdominal aorta measures 4.2 cm in diameter.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old male smoker has a routine screening ultrasound. The abdominal aorta measures 4.2 cm in diameter.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what diameter is an abdominal aorta generally considered aneurysmal?', '[" > 2 cm", " > 3 cm", " > 5 cm", " > 7 cm"]', 1, 'An aorta > 3 cm is considered an aneurysm; surgical referral is typically at 5.5 cm in men.'),
    (v_case_id, 'What is the primary screening recommendation for AAA?', '["Annual CT for all adults", "One-time ultrasound for men aged 65-75 who have ever smoked", "MRI for everyone over 50", "Blood test for elastin"]', 1, 'USPSTF recommends a one-time screening US for men 65-75 with a smoking history.'),
    (v_case_id, 'AAA most commonly occurs in which segment of the aorta?', '["Suprarenal", "Infrarenal", "Thoracic", "Aortic arch"]', 1, 'Most AAAs are infrarenal (below the level of the renal arteries).');

    ---------------------------------------------------------------------------
    -- CASE 23: MRI Basics - T1 vs T2
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Understanding the Pulse Sequences' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Understanding the Pulse Sequences', 'You are looking at an MRI of the brain. On Image A, the CSF in the ventricles is dark (black). On Image B, the CSF is bright (white).', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Understanding the Pulse Sequences', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the sequence for Image B (where water/CSF is bright)?', '["T1-weighted", "T2-weighted", "FLAIR", "Diffusion-weighted"]', 1, 'T2-weighted images have "bright water" (H2O is white). T1 has "dark water" (H2O is black).'),
    (v_case_id, 'On a T1-weighted image, what is the appearance of fat?', '["Dark", "Bright (Hyperintense)", "Grey", "Transparent"]', 1, 'Fat is bright on T1-weighted images.'),
    (v_case_id, 'Which MRI sequence is most sensitive for detecting an "acute" ischemic stroke within minutes?', '["T1", "T2", "FLAIR", "Diffusion-Weighted Imaging (DWI)"]', 3, 'DWI is extremely sensitive to cytotoxic edema in early stroke.');

    ---------------------------------------------------------------------------
    -- CASE 24: Fractures - Description
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Describing a Break' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Describing a Break', 'An orthopedic surgeon asks you to describe a femur fracture. The bone is broken into three distinct fragments.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Describing a Break', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for a fracture with more than two fragments?', '["Simple", "Greenstick", "Comminuted", "Stress"]', 2, 'Comminuted fractures have > 2 fragments.'),
    (v_case_id, 'A "greenstick" fracture is most common in which population?', '["Elderly with osteoporosis", "Adults with trauma", "Children", "Athletes"]', 2, 'Children have more pliable bones, leading to incomplete "greenstick" fractures.'),
    (v_case_id, 'In an "open" (compound) fracture, what is the most important clinical finding?', '["The bone is in pieces", "The fracture communicates with the outside environment (skin break)", "There is no pain", "It involves a joint"]', 1, 'Open fractures require emergent irrigation and antibiotics due to infection risk.');

    ---------------------------------------------------------------------------
    -- CASE 25: CT Abdomen - Diverticulitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Left Lower Quadrant Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Left Lower Quadrant Pain', 'A 60-year-old woman presents with LLQ pain and fever. CT shows wall thickening and fat stranding around the sigmoid colon.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Left Lower Quadrant Pain', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Colon cancer", "Ulcerative colitis", "Diverticulitis", "Ischemic colitis"]', 2, 'LLQ pain and localized colonic inflammation in an older patient is classic for diverticulitis.'),
    (v_case_id, 'Presence of air bubbles outside the colon lumen on CT would indicate:', '["Normal finding", "Perforation", "Constipation", "Hemorrhoids"]', 1, 'Extraluminal air is a sign of colonic perforation.'),
    (v_case_id, 'Why is colonoscopy typically avoided during an acute episode of diverticulitis?', '["It is too expensive", "Risk of perforation", "It cannot see the diverticula", "It causes bleeding"]', 1, 'Instrumentation during active inflammation increases the risk of rupturing a diverticulum.');

END $$;

COMMIT;
