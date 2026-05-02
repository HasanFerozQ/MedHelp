BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Advanced Trauma (ATLS)
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-advanced-trauma' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-advanced-trauma" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Airway with C-Spine Protection (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Comatose Trauma Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Comatose Trauma Patient', 'A 25-year-old male is brought to the ER after a high-speed MVC. He is unconscious with a GCS of 6.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male is brought to the ER after a high-speed MVC. He is unconscious with a GCS of 6.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority for this patient?', '["Chest X-ray", "Definitive airway (Intubation) with manual in-line stabilization", "IV Fluids", "None"]', 1, 'In trauma, any patient with a GCS < 8 requires an ETT. Manual in-line stabilization (MILS) is essential to protect the C-spine during the procedure.'),
    (v_case_id, 'Should you use the "Head-Tilt/Chin-Lift" maneuver in this patient?', '["Yes", "No, use the Jaw-Thrust maneuver only", "Always", "None"]', 1, 'The Jaw-Thrust is the preferred method for opening the airway in suspected C-spine injury as it minimizes neck movement.'),
    (v_case_id, 'What is the "Golden Hour" in trauma management?', '["The first hour after injury where resuscitation is most effective", "The hour of sleep after surgery", "None", "None"]', 0, 'Rapid intervention within this timeframe significantly improves survival rates.');

    ---------------------------------------------------------------------------
    -- CASE 02: Tension Pneumothorax (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Obstructive Shock in Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Obstructive Shock in Trauma', 'A patient with blunt chest trauma has distended neck veins, tracheal deviation to the right, and absent breath sounds on the left.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Obstructive Shock in Trauma', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Simple Pneumothorax", "Tension Pneumothorax", "Hemothorax", "None"]', 1, 'The triad of hypotension, absent breath sounds, and tracheal deviation is classic for a tension pneumothorax.'),
    (v_case_id, 'Should you wait for a chest X-ray to confirm this diagnosis?', '["Yes", "No, it is a clinical diagnosis and requires immediate decompression", "None", "None"]', 1, 'Waiting for an X-ray can be fatal; decompress as soon as it is clinically suspected.'),
    (v_case_id, 'What is the definitive treatment after initial decompression?', '["Chest Tube (Tube Thoracostomy)", "Oxygen", "Aspirin", "None"]', 0, 'A chest tube must be placed to ensure the lung remains expanded.');

    ---------------------------------------------------------------------------
    -- CASE 03: Massive Hemothorax (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dullness to Percussion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dullness to Percussion', 'A patient with a stab wound to the chest has flat neck veins, hypotension, and dullness to percussion on the right.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dullness to Percussion', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish massive hemothorax from tension pneumothorax clinically?', '["Pain levels", "Neck veins (flat in hemothorax) and percussion (dull in hemothorax)", "None", "None"]', 1, 'Tension pneumo has distended veins and hyper-resonance; hemothorax has flat veins and dullness.'),
    (v_case_id, 'What volume of initial blood drainage from a chest tube defines a "Massive Hemothorax"?', '["100 mL", "1500 mL or more", "500 mL", "None"]', 1, '1500 mL initially or 200 mL/hr for 2-4 hours indicates the need for emergency thoracotomy.'),
    (v_case_id, 'What is the immediate priority besides the chest tube?', '["Volume resuscitation with blood products", "Pain meds", "Wound care", "None"]', 0, 'Large-bore access and blood transfusion are critical for hemodynamic stability.');

    ---------------------------------------------------------------------------
    -- CASE 04: Cardiac Tamponade (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Squeezed Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Squeezed Heart', 'A patient with a penetrating wound to the chest has muffled heart sounds, hypotension, and distended neck veins.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Squeezed Heart', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this classic clinical triad called?', '["Cushing''s Triad", "Beck''s Triad", "Virchow''s Triad", "None"]', 1, 'Beck''s triad (hypotension, muffled heart sounds, JVD) is highly suggestive of tamponade.'),
    (v_case_id, 'What bedside test is best for rapid diagnosis?', '["ECG", "FAST Exam (Pericardial window)", "X-ray", "None"]', 1, 'The FAST exam can identify fluid in the pericardium in seconds.'),
    (v_case_id, 'What is the definitive procedure if the patient is "crashing" in the ER?', '["IV fluids", "Emergency Department Thoracotomy (EDT)", "Aspirin", "None"]', 1, 'In the setting of penetrating trauma and arrest/crashing, EDT is indicated to relieve tamponade and control bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 05: Open Pneumothorax (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sucking Chest Wound' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sucking Chest Wound', 'A patient has a 4 cm gaping wound to the chest wall. Air can be heard moving in and out of the wound.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sucking Chest Wound', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate field treatment for this wound?', '["Complete occlusive dressing", "Three-sided occlusive dressing", "Stapling it shut", "None"]', 1, 'A three-sided dressing acts as a one-way valve, allowing air to escape but not enter.'),
    (v_case_id, 'What is the danger of taping all four sides of the dressing?', '["Infection", "Conversion to a Tension Pneumothorax", "None", "None"]', 1, 'If air cannot escape the chest, it will build up pressure under the occlusive dressing.'),
    (v_case_id, 'When is a chest tube placed in this patient?', '["Immediately, at a site distant from the wound", "In the OR", "Never", "None"]', 0, 'Place a chest tube before definitive surgical repair of the chest wall defect.');

    ---------------------------------------------------------------------------
    -- CASE 06: Hemorrhagic Shock - Class III (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Decompensated Shock' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Decompensated Shock', 'A patient has lost approx. 1500-2000 mL of blood (30-40% volume). HR 130, BP 85/50, confused.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Decompensated Shock', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What class of hemorrhagic shock is this?', '["Class I", "Class II", "Class III", "Class IV"]', 2, 'Class III shock is marked by a drop in blood pressure and altered mental status.'),
    (v_case_id, 'What is the initial resuscitation priority for Class III/IV shock?', '["Crystalloids (2L)", "Blood products (e.g., MTP - 1:1:1 ratio)", "Sugar water", "None"]', 1, 'Modern ATLS emphasizes early blood products over massive crystalloid use to avoid coagulopathy and hemodilution.'),
    (v_case_id, 'What is the best marker of end-organ perfusion in shock?', '["Skin color", "Urine output and Base Deficit/Lactate", "Heart rate", "None"]', 1, 'Urine output (> 0.5 mL/kg/hr for adults) is a key physiologic indicator of perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 07: Pelvic Fracture Resuscitation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Open Book Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Open Book Injury', 'A patient fell from a height. X-ray shows a symphysis pubis diastasis of 4 cm. BP is dropping.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Open Book Injury', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority to stabilize the pelvis and control bleeding?', '["Surgery", "Pelvic Binder (applied at the level of the greater trochanters)", "Skeletal traction", "None"]', 1, 'A binder reduces pelvic volume and helps control venous/bone bleeding.'),
    (v_case_id, 'Why is "rocking" or "springing" the pelvis during the exam dangerous?', '["It hurts", "It can dislodge clots and cause massive re-bleeding", "None", "None"]', 1, 'Perform the pelvic stability exam ONLY once and gently.');

    ---------------------------------------------------------------------------
    -- CASE 08: Epidural Hematoma (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lucid Interval' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lucid Interval', 'A 20-year-old was hit with a baseball bat. He was briefly KO''d, then seemed fine, but now is rapidly deteriorating.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Lucid Interval', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Subdural hematoma", "Epidural hematoma", "Concussion", "None"]', 1, 'The classic "lucid interval" followed by rapid decline is characteristic of an epidural bleed.'),
    (v_case_id, 'Which vessel is most commonly injured in an epidural hematoma?', '["Bridging veins", "Middle Meningeal Artery", "Carotid", "None"]', 1, 'Injury to the temporal bone often tears the middle meningeal artery.'),
    (v_case_id, 'What is the characteristic shape on CT?', '["Crescent-shaped", "Biconvex / Lenticular-shaped", "None", "None"]', 1, 'Epidural bleeds are arterial and limited by dural sutures, forming a convex shape.');

    ---------------------------------------------------------------------------
    -- CASE 09: Subdural Hematoma (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crescent Bleed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crescent Bleed', 'An elderly patient on warfarin falls and has progressive confusion over 24 hours. CT shows a hyperdense crescentic lesion.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Crescent Bleed', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Epidural hematoma", "Subdural hematoma", "Stroke", "None"]', 1, 'Subdurals are more common in elderly/anticoagulated patients and show a crescent shape.'),
    (v_case_id, 'What is the source of bleeding in a subdural hematoma?', '["Arteries", "Bridging veins", "None", "None"]', 1, 'These veins are stretched as the brain atrophies with age, making them prone to tearing.'),
    (v_case_id, 'Does a "chronic" subdural look different on CT than an acute one?', '["No", "Yes, it becomes hypodense (darker) over time", "None", "None"]', 1, 'Old blood appears darker than acute, bright-white blood.');

    ---------------------------------------------------------------------------
    -- CASE 10: Flail Chest (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paradoxical Motion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paradoxical Motion', 'A patient with multiple rib fractures has a segment of the chest wall that moves INWARD during inspiration.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Paradoxical Motion', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Rib fracture", "Flail Chest", "Hemothorax", "None"]', 1, 'Flail chest occurs when 2 or more ribs are fractured in 2 or more places.'),
    (v_case_id, 'What is the most dangerous associated injury in flail chest?', '["Skin bruising", "Pulmonary Contusion", "Aortic injury", "None"]', 1, 'The underlying lung injury (contusion) causes hypoxia more than the flail segment itself.'),
    (v_case_id, 'What is the main goal of management?', '["Pain control and aggressive pulmonary toilet/hygiene", "Taping the chest segment", "None", "None"]', 0, 'Incentive spirometry and pain control prevent pneumonia and respiratory failure.');

    ---------------------------------------------------------------------------
    -- CASE 11: Traumatic Aortic Injury (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Deceleration' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Deceleration', 'A patient survived a high-speed frontal MVC. Chest X-ray shows a widened mediastinum (> 8 cm).', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Deceleration', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely injury?', '["Lung cancer", "Traumatic Aortic Rupture/Disruption", "Atelectasis", "None"]', 1, 'Widened mediastinum in trauma is aortic injury until proven otherwise.'),
    (v_case_id, 'Where is the most common site of traumatic aortic injury?', '["Aortic arch", "Aortic isthmus (distal to the left subclavian artery)", "None", "None"]', 1, 'The aorta is fixed at the ligamentum arteriosum, making it vulnerable to shear forces.'),
    (v_case_id, 'What is the next diagnostic step for a stable patient?', '["Wait and see", "CTA Chest (Computed Tomography Angiography)", "X-ray", "None"]', 1, 'CTA is highly sensitive and specific for this life-threatening injury.');

    ---------------------------------------------------------------------------
    -- CASE 12: Diaphragmatic Rupture (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stomach in the Chest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stomach in the Chest', 'An X-ray of a trauma patient shows a nasogastric (NG) tube coiled in the left hemithorax.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Stomach in the Chest', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Traumatic Diaphragmatic Rupture", "Esophageal rupture", "None"]', 1, 'NG tube in the chest is a classic radiographic sign of diaphragmatic hernia.'),
    (v_case_id, 'On which side do most traumatic diaphragmatic ruptures occur?', '["Right side", "Left side", "Equal", "None"]', 1, 'The liver protects the right diaphragm, so most injuries occur on the left.'),
    (v_case_id, 'What is the definitive treatment?', '["Chest tube", "Surgical repair", "Oxygen", "None"]', 1, 'Surgical intervention is required to reduce the contents and repair the defect.');

    ---------------------------------------------------------------------------
    -- CASE 13: FAST Exam - LUQ (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Splenic Window' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Splenic Window', 'You are performing a FAST exam. You see an anechoic (black) stripe between the spleen and the diaphragm.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Splenic Window', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does this finding indicate?', '["Normal", "Intra-abdominal free fluid (hemoperitoneum)", "Bowel gas", "None"]', 1, 'Free fluid in the perisplenic space indicates bleeding.'),
    (v_case_id, 'What are the four windows of the FAST exam?', '["Morrison''s pouch (RUQ), Splenorenal (LUQ), Suprapubic (Pelvis), and Subxyphoid (Pericardium)", "Lungs only", "Legs", "None"]', 0, 'The FAST is a rapid screen for life-threatening internal bleeding.'),
    (v_case_id, 'Is the FAST exam sensitive for retroperitoneal bleeding?', '["Yes", "No", "Always", "None"]', 1, 'FAST is poor at detecting retroperitoneal or hollow viscus injuries.');

    ---------------------------------------------------------------------------
    -- CASE 14: Urethral Injury (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Riding Prostate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Riding Prostate', 'A male trauma patient has blood at the urethral meatus and a "high-riding" prostate on DRE.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The High-Riding Prostate', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the absolute contraindication in this patient?', '["IV fluids", "Placement of a Foley catheter", "X-ray", "None"]', 1, 'Blindly placing a catheter can turn a partial urethral tear into a complete one.'),
    (v_case_id, 'What diagnostic test should be performed first to evaluate the urethra?', '["CT scan", "Retrograde Urethrogram (RUG)", "Cystoscopy", "None"]', 1, 'RUG is the standard test to evaluate for urethral disruption.'),
    (v_case_id, 'What type of fracture is most associated with urethral injury?', '["Femur", "Pelvic (especially anterior arch/straddle fractures)", "None", "None"]', 1, 'The urethra is fixed at the puboprostatic ligament and shears during pelvic trauma.');

    ---------------------------------------------------------------------------
    -- CASE 15: Compartment Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tense Calf' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tense Calf', 'A patient with a tibia fracture has pain that is "out of proportion" to the injury and increased pain on passive stretch of the toes.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tense Calf', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Blood clot", "Compartment Syndrome", "Infection", "None"]', 1, 'Pain out of proportion and pain on passive stretch are the most sensitive early signs.'),
    (v_case_id, 'What is the definitive treatment?', '["Ice and elevation", "Emergent Fasciotomy", "Cast", "None"]', 1, 'Pressure must be surgically relieved to prevent muscle and nerve necrosis.'),
    (v_case_id, 'Is the absence of a distal pulse (pulselessness) an early or late sign?', '["Early", "Late (often indicates irreversible damage)", "Never", "None"]', 1, 'Do not wait for pulselessness to diagnose compartment syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 16: Fat Embolism Syndrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Broken Femur and Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Broken Femur and Rash', '24 hours after a femur fracture, a patient develops hypoxia, confusion, and a petechial rash on the neck and axilla.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Broken Femur and Rash', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pulmonary Embolism", "Fat Embolism Syndrome", "Sepsis", "None"]', 1, 'The triad of respiratory distress, neurological changes, and petechiae after long-bone trauma is classic.'),
    (v_case_id, 'Where does the "fat" originate?', '["Diet", "Bone marrow of the fractured long bone", "None", "None"]', 1, 'Fat globules enter the venous circulation from the marrow.'),
    (v_case_id, 'What is the management?', '["Heparin", "Supportive care (Oxygen, early stabilization of the fracture)", "Antibiotics", "None"]', 1, 'There is no specific antidote; focus on prevention through early fixation.');

    ---------------------------------------------------------------------------
    -- CASE 17: Burn Resuscitation - Rule of Nines (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Parkland Formula' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Parkland Formula', 'A 70 kg man has 2nd and 3rd degree burns involving his entire chest and abdomen.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Parkland Formula', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the estimated % TBSA burned for the chest and abdomen?', '["9%", "18%", "36%", "None"]', 1, 'The front of the trunk is 18% (chest 9% + abdomen 9%).'),
    (v_case_id, 'What is the Parkland Formula for fluid resuscitation in the first 24 hours?', '["2 mL x kg x %TBSA", "4 mL x kg x %TBSA (Lactated Ringer''s)", "None", "None"]', 1, 'Give 4 mL/kg/%TBSA of LR, with half in the first 8 hours.'),
    (v_case_id, 'Do you include 1st-degree burns (like sunburn) in the %TBSA calculation?', '["Yes", "No", "Only if large", "None"]', 1, 'Only 2nd and 3rd-degree burns are counted for fluid calculations.');

    ---------------------------------------------------------------------------
    -- CASE 18: Inhalation Injury (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Smoke and Heat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Smoke and Heat', 'A victim of a house fire has singed nasal hairs, soot in the mouth, and a hoarse voice.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Smoke and Heat', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority intervention?', '["Steroids", "Early endotracheal intubation", "Chest X-ray", "None"]', 1, 'Upper airway edema can progress rapidly; "singed nasal hairs" and hoarseness are major red flags.'),
    (v_case_id, 'What poisonous gas should be suspected in house fire victims?', '["Oxygen", "Carbon Monoxide and Cyanide", "None", "None"]', 1, 'Both can cause severe tissue hypoxia despite normal-looking pulse oximetry.'),
    (v_case_id, 'What is the treatment for CO poisoning?', '["Low flow O2", "100% High-flow Oxygen (decreases CO half-life)", "None", "None"]', 1, 'O2 displaces CO from hemoglobin.');

    ---------------------------------------------------------------------------
    -- CASE 19: Spinal Cord Syndrome - Central Cord (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weak Arms, Strong Legs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weak Arms, Strong Legs', 'An elderly patient with cervical spondylosis has a hyperextension injury. He has severe weakness in his arms but can move his legs well.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weak Arms, Strong Legs', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely spinal cord syndrome?', '["Brown-Séquard", "Central Cord Syndrome", "Anterior Cord", "None"]', 1, 'Central cord syndrome presents with motor deficit upper > lower, often after hyperextension.'),
    (v_case_id, 'Why are the arms more affected?', '["They are bigger", "The cervical motor fibers for the arms are located more centrally in the cord", "None", "None"]', 1, 'Somatotopic arrangement places sacral fibers peripheral and cervical fibers central.'),
    (v_case_id, 'Is this usually treated with surgery or conservatively?', '["Surgery always", "Often managed conservatively with bracing and PT initially", "None", "None"]', 1, 'Initial management is often non-operative unless there is significant instability.');

    ---------------------------------------------------------------------------
    -- CASE 20: Neurogenic vs. Spinal Shock (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypotension and Bradycardia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypotension and Bradycardia', 'A patient with a high cervical spine injury has a BP of 80/40 and a HR of 50 bpm. Skin is warm and dry.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hypotension and Bradycardia', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of shock is this?', '["Hemorrhagic", "Neurogenic Shock", "Spinal Shock", "None"]', 1, 'Neurogenic shock is a circulatory failure due to loss of sympathetic tone (Hypotension + Bradycardia + Warm skin).'),
    (v_case_id, 'How does "Spinal Shock" differ?', '["It is a BP problem", "It refers to the loss of reflexes and flaccidity following cord injury", "None", "None"]', 1, 'Spinal shock is a neurological state; neurogenic shock is a hemodynamic state.'),
    (v_case_id, 'What is the treatment for neurogenic shock?', '["Fluids and Vasopressors (e.g., Norepinephrine or Phenylephrine)", "Shock", "Ice", "None"]', 0, 'Treat the vasodilation and bradycardia.');

    ---------------------------------------------------------------------------
    -- CASE 21: Trauma in Pregnancy (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Protecting Two' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Protecting Two', 'A 28-week pregnant woman is in an MVC. She is hemodynamically stable.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Protecting Two', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most sensitive indicator of maternal hemorrhage in late pregnancy?', '["Maternal HR", "Fetal heart rate (fetal distress often precedes maternal instability)", "None", "None"]', 1, 'The fetus acts as a "biosensor" for maternal perfusion.'),
    (v_case_id, 'What test should be ordered to detect fetal-maternal hemorrhage?', '["CBC", "Kleihauer-Betke (KB) test", "X-ray", "None"]', 1, 'The KB test quantifies fetal cells in maternal circulation to determine Rhogam dosing and severity.'),
    (v_case_id, 'How should a pregnant patient > 20 weeks be positioned for resuscitation?', '["Flat", "Left Lateral Tilt or Manual Uterine Displacement", "None", "None"]', 1, 'Avoid supine hypotensive syndrome by moving the uterus off the IVC.');

    ---------------------------------------------------------------------------
    -- CASE 22: Trauma Laparotomy Indications (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'To the OR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'To the OR', 'A patient with a gunshot wound to the abdomen has a BP of 80/40.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'To the OR', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definitive next step?', '["CT scan", "Emergency Exploratory Laparotomy", "X-ray", "None"]', 1, 'Penetrating abdominal trauma with hemodynamic instability is an absolute indication for surgery.'),
    (v_case_id, 'Is evisceration (bowel hanging out) an indication for laparotomy?', '["No", "Yes", "Only if it hurts", "None"]', 1, 'Evisceration, peritonitis, or free air on X-ray are surgical indications.'),
    (v_case_id, 'What is the goal of "Damage Control Surgery"?', '["Final repair", "Abbreviated procedure to control bleeding and contamination, followed by ICU stabilization", "None", "None"]', 1, 'Fix the "leaks and kills" now, and come back for final repair once stable.');

    ---------------------------------------------------------------------------
    -- CASE 23: Maxillofacial Trauma - Le Fort (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Facial Instability' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Facial Instability', 'When pulling the upper teeth forward, the entire midface (including the bridge of the nose) moves.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Facial Instability', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of Le Fort fracture is this?', '["Le Fort I", "Le Fort II", "Le Fort III (Craniofacial disjunction)", "None"]', 2, 'Le Fort III involves a fracture through the zygomatic arches and orbits, separating the face from the skull.'),
    (v_case_id, 'What is a major airway concern in severe facial trauma?', '["Dry mouth", "Massive hemorrhage and edema causing airway obstruction", "None", "None"]', 1, 'Bleeding and swelling can make intubation nearly impossible.'),
    (v_case_id, 'Is NG tube placement safe in suspected midface fractures?', '["Yes", "No, use an OG tube (risk of intracranial placement via cribriform plate)", "Always", "None"]', 1, 'A nasogastric tube can accidentally enter the brain through a fractured skull base.');

    ---------------------------------------------------------------------------
    -- CASE 24: Splenic Injury (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Left Shoulder Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Left Shoulder Pain', 'A patient with blunt trauma has LUQ pain and referred pain to the left shoulder.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Left Shoulder Pain', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for referred shoulder pain due to diaphragmatic irritation?', '["Kehr''s sign", "Grey-Turner''s sign", "None", "None"]', 0, 'Blood from a splenic rupture irritates the phrenic nerve.'),
    (v_case_id, 'Can a Grade I-III splenic laceration be managed non-operatively?', '["No", "Yes, in hemodynamically stable patients with close observation", "Always", "None"]', 1, 'Many splenic injuries are managed with observation or angioembolization.'),
    (v_case_id, 'What long-term risk exists if a splenectomy is performed?', '["Diabetes", "Overwhelming Post-Splenectomy Infection (OPSI) from encapsulated organisms", "None", "None"]', 1, 'Patients need vaccinations against Strep pneumo, H. flu, and Neisseria meningitidis.');

    ---------------------------------------------------------------------------
    -- CASE 25: Liver Laceration (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'RUQ Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'RUQ Trauma', 'A stable patient has a Grade IV liver laceration on CT scan.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'RUQ Trauma', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary factor deciding management (Surgery vs. Observation)?', '["Grade of injury", "Hemodynamic stability", "Age", "None"]', 1, 'Even high-grade injuries can be observed if the patient is stable.'),
    (v_case_id, 'What is the "Pringle Maneuver" during surgery for liver bleeding?', '["Squeezing the heart", "Clamping the hepatoduodenal ligament (Portal vein, Hepatic artery, Bile duct)", "None", "None"]', 1, 'This identifies if the bleeding is from the liver parenchyma or hepatic veins/IVC.'),
    (v_case_id, 'What is a possible delayed complication of liver trauma?', '["Hemobilia (bleeding into the bile ducts)", "Blindness", "None", "None"]', 0, 'This presents with GI bleeding, jaundice, and RUQ pain.');

    ---------------------------------------------------------------------------
    -- CASE 26: Pelvic Binder Placement (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Applying the Binder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Applying the Binder', 'You are applying a pelvic binder to a hemodynamically unstable patient.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Applying the Binder', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the correct anatomical landmark for the center of the pelvic binder?', '["Iliac crests", "Greater trochanters", "Umbilicus", "None"]', 1, 'Placing it too high (on iliac crests) is ineffective for stabilizing the pelvic ring.'),
    (v_case_id, 'If a commercial binder is not available, what can be used?', '["Towel", "A bedsheet wrapped and secured with clamps", "None", "None"]', 1, 'The "pelvic sheet" is an effective makeshift alternative.'),
    (v_case_id, 'Should you keep the binder on during the CT scan?', '["Yes", "No", "Only if it is plastic", "None"]', 0, 'Keep it on until definitive stabilization (External fixation) or until cleared.');

    ---------------------------------------------------------------------------
    -- CASE 27: Genitourinary - Bladder Rupture (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvis and Urine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvis and Urine', 'A patient with a pelvic fracture has gross hematuria. Cystogram shows contrast leaking into the paracolic gutters.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pelvis and Urine', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this an intra-peritoneal or extra-peritoneal bladder rupture?', '["Extra-peritoneal", "Intra-peritoneal (tears through the dome into the peritoneum)", "None", "None"]', 1, 'Intra-peritoneal rupture allows urine/contrast to flow among the bowel loops and gutters.'),
    (v_case_id, 'Which type of bladder rupture ALWAYS requires surgical repair?', '["Extra-peritoneal", "Intra-peritoneal", "Both", "None"]', 1, 'Extra-peritoneal ruptures can often be managed with catheter drainage alone.'),
    (v_case_id, 'What is the "dome" of the bladder significance?', '["It is the strongest part", "It is the only part covered by peritoneum", "None", "None"]', 1, 'Full-bladder trauma often causes a "blowout" at the dome.');

    ---------------------------------------------------------------------------
    -- CASE 28: Spine Trauma - Brown-Séquard (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hemisection of the Cord' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hemisection of the Cord', 'A patient with a stab wound to the back has loss of motor function on the right and loss of pain/temp sensation on the left.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hemisection of the Cord', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this syndrome called?', '["Central Cord", "Brown-Séquard Syndrome", "None", "None"]', 1, 'It results from hemisection of the spinal cord.'),
    (v_case_id, 'Why is pain/temp sensation lost on the CONTRALATERAL side?', '["Nerves cross high", "The spinothalamic tract crosses 1-2 levels above the entry point in the cord", "None", "None"]', 1, 'Motor and vibration/proprioception tracts cross in the medulla (ipsilateral below that).'),
    (v_case_id, 'What sensation is lost ipsilaterally along with motor?', '["Pain", "Vibration and Proprioception (Position sense)", "None", "None"]', 1, 'The dorsal columns do not cross in the spinal cord.');

    ---------------------------------------------------------------------------
    -- CASE 29: Spine Trauma - Anterior Cord (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vibration Preserved' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vibration Preserved', 'A trauma patient has complete motor loss and loss of pain sensation, but can still feel vibration and position in his feet.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vibration Preserved', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely spinal cord syndrome?', '["Brown-Séquard", "Anterior Cord Syndrome", "None", "None"]', 1, 'The posterior columns (vibration) are spared while the anterior 2/3 of the cord is damaged.'),
    (v_case_id, 'What is a common cause of anterior cord syndrome?', '["Stab wound", "Flexion injury or occlusion of the Anterior Spinal Artery", "None", "None"]', 1, 'Ischemia to the front of the cord is a classic mechanism.'),
    (v_case_id, 'How is the prognosis for Anterior Cord compared to others?', '["Excellent", "Poorest among the incomplete cord syndromes", "None", "None"]', 1, 'Recovery of motor function is generally very limited.');

    ---------------------------------------------------------------------------
    -- CASE 30: Open Fractures (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bone through Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bone through Skin', 'A patient has a tibia fracture where the bone is visible through a 5 cm wound contaminated with dirt.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bone through Skin', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classification system for open fractures?', '["Gustilo-Anderson", "Salter-Harris", "None", "None"]', 0, 'This classifies injuries based on size, contamination, and soft tissue damage.'),
    (v_case_id, 'What is the priority treatment for an open fracture in the ER?', '["Ice", "IV Antibiotics and Tetanus prophylaxis", "Cast", "None"]', 1, 'Early antibiotics (e.g., Ancef/Cefazolin) are vital for preventing osteomyelitis.'),
    (v_case_id, 'What should you do with the wound?', '["Suture it", "Cover with sterile saline-soaked gauze and splint", "None", "None"]', 1, 'Do not perform a definitive closure in the ER.');

    ---------------------------------------------------------------------------
    -- CASE 31: Pediatric Trauma - Waddell''s Triad (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pedestrian Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pedestrian Child', 'A 7-year-old was struck by a car. He has a femur fracture, splenic injury, and head trauma.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pedestrian Child', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this pattern of injuries in children struck by vehicles?', '["Cushing''s", "Waddell''s Triad", "None", "None"]', 1, 'It results from the child''s height relative to the car (Femur -> Trunk -> Head).'),
    (v_case_id, 'Why do children have fewer rib fractures than adults even in severe trauma?', '["Strong bones", "Pliable, less calcified ribs transmit force to the lung without breaking", "None", "None"]', 1, 'Lack of rib fractures does NOT mean the lungs are safe; pulmonary contusions are common.'),
    (v_case_id, 'What is the most common cause of traumatic death in children?', '["Bleeding", "Head Trauma", "None", "None"]', 1, 'TBI is the leading killer in pediatric trauma.');

    ---------------------------------------------------------------------------
    -- CASE 32: Traumatic Arrest - EDT Indications (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Last Resort' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Last Resort', 'A patient with a stab wound to the heart loses pulses just as he arrives in the ER.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Last Resort', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is an Emergency Department Thoracotomy (EDT) indicated?', '["No", "Yes, for penetrating trauma with recent loss of signs of life", "Only for blunt trauma", "None"]', 1, 'EDT is most successful in penetrating thoracic trauma with witnessed signs of life.'),
    (v_case_id, 'What is the survival rate for EDT in blunt trauma arrest?', '["50%", "Extremely low (< 1-2%)", "None", "None"]', 1, 'Blunt trauma arrest carries a much worse prognosis than penetrating.'),
    (v_case_id, 'What is the goal of clamping the descending aorta during EDT?', '["Stop digestion", "Redirect all remaining blood to the brain and heart", "None", "None"]', 1, 'This maximizes cerebral and coronary perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 33: Secondary Survey (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tertiary Survey' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tertiary Survey', 'The primary survey is complete and the patient is stable. You are now examining every inch of the patient.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tertiary Survey', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When is the secondary survey performed?', '["As soon as they arrive", "ONLY after the primary survey (ABCDE) is complete and the patient is stable", "None", "None"]', 1, 'Never move to secondary survey if the "A" is not secure.'),
    (v_case_id, 'What is the "Tertiary Survey"?', '["Final check", "A repeat comprehensive exam 24 hours later to find missed injuries", "None", "None"]', 1, 'Many subtle injuries (e.g., hand fractures) are missed during the initial chaos.'),
    (v_case_id, 'Is the secondary survey "head-to-toe"?', '["No", "Yes, including the back (log roll) and all orifices", "None", "None"]', 1, 'A complete exam requires seeing the entire skin surface.');

    ---------------------------------------------------------------------------
    -- CASE 34: Hypothermia in Trauma (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lethal Triad' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lethal Triad', 'A trauma patient has a core temperature of 34°C (93°F).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Lethal Triad', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three components of the "Trauma Lethal Triad"?', '["Pain, Fear, Shock", "Hypothermia, Acidosis, and Coagulopathy", "None", "None"]', 1, 'These factors worsen each other and lead to uncontrollable bleeding.'),
    (v_case_id, 'Why is hypothermia dangerous in a bleeding patient?', '["It hurts", "It inhibits the coagulation cascade and platelet function", "None", "None"]', 1, 'Coagulation enzymes do not work efficiently at low temperatures.'),
    (v_case_id, 'What should you do to the ER room for a trauma patient?', '["Cool it down", "Keep it warm (approx. 80-85°F) and use warmed IV fluids", "None", "None"]', 1, 'Environmental control is part of the "E" in ABCDE.');

    ---------------------------------------------------------------------------
    -- CASE 35: Blast Injury - Primary (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shockwave' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shockwave', 'A victim of an explosion has no external shrapnel wounds but is in severe respiratory distress.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shockwave', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Primary" blast injury caused by?', '["Shrapnel", "Overpressure wave (affects gas-filled organs)", "Heat", "None"]', 1, 'Lungs, bowel, and ears are most vulnerable to the pressure wave.'),
    (v_case_id, 'What is the most common primary blast injury?', '["Laceration", "Tympanic membrane rupture", "None", "None"]', 1, 'If the TMs are intact, serious primary blast injury to the lungs is less likely.'),
    (v_case_id, 'What is a "Quaternary" blast injury?', '["Impact", "Burns, smoke inhalation, or toxic gas exposure", "None", "None"]', 1, 'This category covers all miscellaneous injuries from the blast.');

    ---------------------------------------------------------------------------
    -- CASE 36: GCS Scoring (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'GCS Math' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'GCS Math', 'A patient opens eyes to pain (2), makes incomprehensible sounds (2), and withdraws from pain (4).', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'GCS Math', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this patient''s total GCS score?', '["5", "8", "15", "None"]', 1, 'E2 + V2 + M4 = 8.'),
    (v_case_id, 'Based on this GCS, what is the priority?', '["Wait", "Intubation (GCS 8 = Intubate)", "None", "None"]', 1, 'A GCS of 8 or less indicates an inability to protect the airway.'),
    (v_case_id, 'What is the lowest possible GCS score?', '["0", "3", "1", "None"]', 1, 'Even a dead patient has a GCS of 3 (1 point for each category).');

    ---------------------------------------------------------------------------
    -- CASE 37: Spinal Cord - Anterior Cord (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Flexion Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Flexion Injury', 'A patient has loss of motor, pain, and temp sensation, but keeps vibration and light touch sensation.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Flexion Injury', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this syndrome?', '["Anterior Cord", "Central Cord", "None", "None"]', 0, 'Anterior cord syndrome often follows burst fractures or flexion injuries.'),
    (v_case_id, 'What artery is usually involved?', '["Posterior spinal", "Anterior spinal artery", "None", "None"]', 1, 'This artery supplies the front 2/3 of the cord.'),
    (v_case_id, 'Is this an "Incomplete" or "Complete" cord injury?', '["Complete", "Incomplete", "None", "None"]', 1, 'Any sparing of function below the level of injury makes it an incomplete syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 38: Cervical Spine Clearance (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Clearing the Collar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Clearing the Collar', 'A student asks when the C-collar can be removed safely.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clearing the Collar', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What clinical criteria (e.g., NEXUS) allow for collar removal without imaging?', '["Age", "No midline tenderness, no intoxicants, no focal neuro deficit, normal alertness, and no distracting injury", "None", "None"]', 1, 'The NEXUS criteria are highly sensitive for ruling out significant injury.'),
    (v_case_id, 'What is a "distracting injury"?', '["Bruise", "A painful injury (like a femur fracture) that might mask the pain of a C-spine fracture", "None", "None"]', 1, 'If the patient is in severe pain elsewhere, they cannot reliably report neck pain.'),
    (v_case_id, 'Is a single lateral X-ray enough to clear the C-spine?', '["Yes", "No, CT is the gold standard", "Maybe", "None"]', 1, 'X-rays miss many fractures and have been largely replaced by CT in trauma centers.');

    ---------------------------------------------------------------------------
    -- CASE 39: Retroperitoneal Injury - Pancreas (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Handlebar Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Handlebar Injury', 'A child falls over his bicycle handlebars. FAST is negative, but he has persistent epigastric pain.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Handlebar Injury', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What organ should be suspected?', '["Liver", "Pancreas", "None", "None"]', 1, 'Focal blunt trauma to the upper abdomen can compress the pancreas against the spine.'),
    (v_case_id, 'Why was the FAST exam negative?', '["FAST was bad", "Pancreas is retroperitoneal and the FAST only looks for intra-peritoneal fluid", "None", "None"]', 1, 'Retroperitoneal injuries are a major pitfall of the FAST exam.'),
    (v_case_id, 'What imaging is better for the pancreas?', '["X-ray", "CT with IV contrast", "None", "None"]', 1, 'CT is needed to evaluate retroperitoneal structures.');

    ---------------------------------------------------------------------------
    -- CASE 40: Pelvic Fracture - Urethra vs Bladder (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvis and GU' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvis and GU', 'A patient with an open book pelvic fracture has gross hematuria.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pelvis and GU', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common GU injury associated with pelvic fracture in males?', '["Renal", "Urethral disruption", "None", "None"]', 1, 'The male urethra is vulnerable to shearing.'),
    (v_case_id, 'Is a "high-riding" prostate always present in urethral injury?', '["Yes", "No, it is specific but not very sensitive", "None", "None"]', 1, 'Rely on blood at the meatus and inability to void.'),
    (v_case_id, 'What is the first step in diagnosing bladder injury?', '["CT with IV contrast", "Retrograde Cystogram (filling the bladder with contrast via catheter)", "None", "None"]', 1, 'IV contrast alone is often insufficient; the bladder must be actively distended with contrast.');

    ---------------------------------------------------------------------------
    -- CASE 41: Traumatic Amputation (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Severed Limb' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Severed Limb', 'A patient arrives with a traumatic amputation of his hand.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Severed Limb', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should the amputated part be preserved for possible replantation?', '["In ice", "Wrapped in saline gauze, in a bag, and the bag placed in ice water", "None", "None"]', 1, 'Do not put the part directly on ice (frostbite) or directly in water (edema).'),
    (v_case_id, 'What is the priority in the ER?', '["Fixing the hand", "Life before limb (Primary survey and control of hemorrhage)", "None", "None"]', 1, 'The patient''s survival is more important than the limb.'),
    (v_case_id, 'How do you control hemorrhage from the stump?', '["Tourniquet", "Direct pressure (first) or Tourniquet (if pressure fails)", "None", "None"]', 1, 'Tourniquets are now favored early in limb hemorrhage that is not controlled by pressure.');

    ---------------------------------------------------------------------------
    -- CASE 42: Gunshot Wounds - Ballistics (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Entry and Exit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Entry and Exit', 'A patient has a gunshot wound to the chest.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Entry and Exit', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is it easy to distinguish entry from exit wounds in the ER?', '["Yes", "No, and the physician should not document \"entry\" or \"exit\" for forensic reasons; just describe the wound", "None", "None"]', 1, 'Forensic pathologists make these determinations; clinicians should simply describe the findings.'),
    (v_case_id, 'Does the bullet always travel in a straight line between two wounds?', '["Yes", "No, it can ricochet off bones and travel in unpredictable paths", "None", "None"]', 1, 'Always assume any organ in the general area could be injured.'),
    (v_case_id, 'Should you try to "probe" a GSW with your finger?', '["Yes", "No, it provides little info and can cause further injury/bleeding", "None", "None"]', 1, 'Imaging and surgery are for exploration.');

    ---------------------------------------------------------------------------
    -- CASE 43: Neck Trauma - Zone II (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Penetrating Neck Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Penetrating Neck Injury', 'A patient has a stab wound to the middle of the neck, through the platysma muscle.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Penetrating Neck Injury', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of the platysma?', '["It is thin", "If it is breached, the injury is considered penetrating and needs formal evaluation", "None", "None"]', 1, 'Superficial skin wounds that don''t cross the platysma are generally not life-threatening.'),
    (v_case_id, 'What zone of the neck is between the cricoid and the angle of the mandible?', '["Zone I", "Zone II", "Zone III", "None"]', 1, 'Zone II is the largest and most surgical zone of the neck.'),
    (v_case_id, 'What is a "Hard Sign" of neck injury requiring immediate surgery?', '["Small bruise", "Expanding hematoma, bruit, or bubbling air from the wound", "None", "None"]', 1, 'These signs indicate major vascular or aerodigestive injury.');

    ---------------------------------------------------------------------------
    -- CASE 44: Head Trauma - DAI (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Severe Brain Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Severe Brain Injury', 'A patient has a GCS of 4 after an MVC. The CT scan is nearly normal.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Severe Brain Injury', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis when the clinical state is much worse than the CT?', '["Concussion", "Diffuse Axonal Injury (DAI)", "None", "None"]', 1, 'DAI involves microscopic shearing of axons throughout the brain.'),
    (v_case_id, 'What is the characteristic (but often absent) CT finding for DAI?', '["Large bleed", "Punctate hemorrhages at the gray-white junction", "None", "None"]', 1, 'Shearing often happens where tissues of different densities meet.'),
    (v_case_id, 'What imaging is more sensitive for DAI?', '["X-ray", "MRI", "None", "None"]', 1, 'MRI (especially GRE/SWI sequences) is far better at seeing DAI than CT.');

    ---------------------------------------------------------------------------
    -- CASE 45: Geriatric Trauma - Meds (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Beta-Blocked Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Beta-Blocked Trauma', 'An 80-year-old on metoprolol has a BP of 90/60 but a HR of 65 bpm after a fall.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Beta-Blocked Trauma', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the heart rate misleading?', '["He is fit", "Beta-blockers prevent the normal compensatory tachycardia of shock", "None", "None"]', 1, 'A "normal" heart rate in an elderly trauma patient could still be shock.'),
    (v_case_id, 'What is another common medication that complicates trauma in the elderly?', '["Anticoagulants (Warfarin, DOACs)", "Vitamin D", "None", "None"]', 0, 'Bleeding risk is drastically increased even with minor trauma.'),
    (v_case_id, 'Is "normal" blood pressure the same in the elderly?', '["Yes", "No, relative hypotension may exist if their baseline is hypertensive (e.g., 110/70 might be shock for them)", "None", "None"]', 1, 'Always consider their baseline health.');

    ---------------------------------------------------------------------------
    -- CASE 46: Pediatric - Intubation (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Small Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Small Airway', 'You are intubating a 4-year-old trauma victim.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Small Airway', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the formula for sizing an uncuffed ET tube in a child?', '["Age/4 + 4", "Age + 10", "None", "None"]', 0, 'This provides a rough estimate for sizing.'),
    (v_case_id, 'Where is the narrowest part of a child''s airway?', '["Vocal cords", "Cricoid ring", "None", "None"]', 1, 'The pediatric airway is funnel-shaped, unlike the cylindrical adult airway.'),
    (v_case_id, 'What anatomical feature makes child intubation different?', '["Small tongue", "Large tongue, floppy epiglottis, and more anterior/superior larynx", "None", "None"]', 1, 'These features make the cords harder to visualize.');

    ---------------------------------------------------------------------------
    -- CASE 47: Burn - Electrical (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Current Flow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Current Flow', 'A patient touched a high-voltage wire. He has a small burn on his finger and his toe.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Current Flow', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is the severity of the injury limited to the visible skin burns?', '["Yes", "No, electricity causes deep tissue damage along the path of the current", "None", "None"]', 1, 'Internal damage to muscles, nerves, and vessels is often far worse than the skin entry/exit wounds.'),
    (v_case_id, 'What is a major renal complication of electrical injury?', '["Stones", "Rhabdomyolysis and Myoglobinuria (leading to AKI)", "None", "None"]', 1, 'Muscle destruction releases myoglobin which is toxic to the kidneys.'),
    (v_case_id, 'What heart monitoring is needed?', '["None", "Continuous ECG (risk of arrhythmias)", "None", "None"]', 1, 'Electricity can trigger VF or other conduction blocks.');

    ---------------------------------------------------------------------------
    -- CASE 48: Spinal Cord - Sacral Sparing (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing the Tail' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing the Tail', 'A patient has no motor function in his legs, but has perianal sensation and voluntary anal sphincter contraction.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Testing the Tail', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this clinical finding called?', '["Spinal shock", "Sacral Sparing", "None", "None"]', 1, 'This indicates the injury is "incomplete."'),
    (v_case_id, 'What is the significance of sacral sparing?', '["It hurts", "It indicates a better prognosis for neurological recovery", "None", "None"]', 1, 'Incomplete injuries have a much higher chance of some functional recovery.'),
    (v_case_id, 'What are the sacral segments?', '["S1-S2", "S4-S5", "None", "None"]', 1, 'These are the most distal parts of the cord/roots.');

    ---------------------------------------------------------------------------
    -- CASE 49: Exposure and Environment (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Backside' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Backside', 'You are completing the "E" of the primary survey.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Backside', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What must be done to ensure a complete exam?', '["Ask the patient", "Undress the patient completely and log roll to examine the back", "None", "None"]', 1, 'Injuries on the back or in the axilla/groin are easily missed.'),
    (v_case_id, 'What is the danger of leaving the patient undressed in the ER?', '["Embarrassment", "Hypothermia", "None", "None"]', 1, 'Once the exam is done, cover the patient with warm blankets.'),
    (v_case_id, 'Is a DRE (Digital Rectal Exam) mandatory in every trauma patient according to latest ATLS?', '["Yes", "No, only if spinal cord injury or urethral/bowel injury is suspected", "None", "None"]', 1, 'It is no longer a routine requirement for every single patient but should be used selectively.');

    ---------------------------------------------------------------------------
    -- CASE 50: Trauma Transfer (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Higher Level of Care' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Higher Level of Care', 'A small community hospital has a patient with a severe TBI and a shattered spleen.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Higher Level of Care', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should the community hospital wait for a CT scan before transferring the patient?', '["Yes", "No, if they cannot treat the injury, stabilize (ABC) and transfer immediately", "None", "None"]', 1, 'Do not delay transfer for imaging that won''t change the immediate decision to transfer.'),
    (v_case_id, 'What is the priority before the ambulance leaves?', '["Final paperwork", "Ensuring the Airway is secure and basic stabilization (ABC) is done", "None", "None"]', 1, 'The patient must be safe for transport.'),
    (v_case_id, 'What is the "Golden Hour" significance in transfers?', '["None", "The faster the transfer to a Level 1 center, the better the outcome", "None", "None"]', 1, 'Trauma centers save lives through multidisciplinary expertise.');

    RAISE NOTICE 'SUCCESS: 50 Advanced Trauma (ATLS) Case Blocks registered.';
END $$;

COMMIT;
