BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Trauma
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'trauma-surgery' LIMIT 1;

    -- CASE 01: Primary Survey (ABCDE)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Golden Hour', 'A 25-year-old male is brought to the trauma bay after a high-speed motor vehicle accident. He is unresponsive and has obvious multiple injuries.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first priority in the management of this patient according to ATLS?', '["Check for broken bones", "Establish a patent airway with C-spine stabilization", "Start IV fluids", "Perform a CT scan"]', 1, 'Airway always comes first, along with protection of the cervical spine.'),
    (v_case_id, 'During the "B" (Breathing) phase, you notice the trachea is deviated to the right and breath sounds are absent on the left. What is the immediate intervention?', '["Chest X-ray", "Needle decompression of the left chest", "Intubation", "Pericardiocentesis"]', 1, 'Tracheal deviation and absent breath sounds indicate a tension pneumothorax, which is a clinical diagnosis requiring immediate needle decompression.'),
    (v_case_id, 'What does the "D" in ABCDE stand for?', '["Drugs", "Disability (Neurological status)", "Drainage", "Defibrillation"]', 1, 'Disability refers to a rapid assessment of neurological status (GCS and pupil response).');

    -- CASE 02: Tension Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Distended Neck Veins', 'A trauma patient has respiratory distress, absent breath sounds on the right, and distended neck veins. His blood pressure is 80/40.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiological cause of hypotension in tension pneumothorax?', '["Hemorrhage", "Obstruction of venous return to the heart (low preload)", "Direct heart injury", "Pain"]', 1, 'High intra-thoracic pressure shifts the mediastinum and kinking the vena cava, preventing blood from reaching the heart.'),
    (v_case_id, 'Where is the recommended anatomical site for needle decompression (standard ATLS 10th edition)?', '["2nd intercostal space, mid-clavicular line", "5th intercostal space, mid-axillary line", "Subxiphoid", "4th intercostal space, parasternal"]', 1, 'The 5th ICS (mid-axillary) is now preferred for adults in recent ATLS guidelines, though 2nd ICS (MCL) is still taught.'),
    (v_case_id, 'After needle decompression, what is the definitive management?', '["Repeat needle", "Tube thoracostomy (Chest tube)", "Thoracotomy", "Incentive spirometry"]', 1, 'Needle decompression is a temporary life-saving measure; a chest tube is the definitive treatment.');

    -- CASE 03: Open Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sucking Chest Wound', 'A patient arrives with a 4 cm gaping hole in his left chest wall. You hear a "sucking" sound with every breath.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management of an open pneumothorax?', '["Close the wound completely with sutures", "Apply an occlusive dressing taped on three sides", "Perform a thoracotomy", "Intubate and ventilate"]', 1, 'The three-sided dressing acts as a one-way valve, allowing air to escape but not enter.'),
    (v_case_id, 'Why is taping the dressing on all four sides dangerous?', '["It won''t stick", "It can convert the open pneumothorax into a tension pneumothorax", "It causes infection", "It is too painful"]', 1, 'Air needs a way to escape the pleural space during expiration.'),
    (v_case_id, 'When is a wound considered "sucking"?', '["When it is > 1/3 the diameter of the trachea", "When it is bloody", "When it is in the abdomen", "Any chest wound"]', 0, 'When the opening is large enough, air follows the path of least resistance through the wound rather than the trachea.');

    -- CASE 04: Massive Hemothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dullness to Percussion', 'A trauma patient has absent breath sounds on the left. Unlike a pneumothorax, the percussion is "dull" and the neck veins are flat.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Tension pneumothorax", "Massive Hemothorax", "Cardiac tamponade", "Diaphragmatic rupture"]', 1, 'Dullness (due to blood) and flat neck veins (due to hypovolemia) differentiate hemothorax from tension pneumothorax.'),
    (v_case_id, 'What is the definition of a "massive" hemothorax indicating the need for immediate thoracotomy?', '["500 mL", "Initial return of > 1500 mL of blood (or 200 mL/hr for 2-4 hours)", "Presence of any blood", "100 mL"]', 1, 'High initial or ongoing output suggests a major vessel injury.'),
    (v_case_id, 'What is the first step in management?', '["Needle decompression", "Tube thoracostomy (large bore chest tube) and volume resuscitation", "Urgent CT scan", "Antibiotics"]', 1, 'Evacuation of blood and restoration of volume are the priorities.');

    -- CASE 05: Cardiac Tamponade
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Beck''s Triad', 'A patient with a stab wound to the left chest has a BP of 90/60, distended neck veins, and "muffled" heart sounds.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this triad of findings called?', '["Charcot''s Triad", "Beck''s Triad", "Cushing''s Triad", "Whipple''s Triad"]', 1, 'Beck''s triad is the classic clinical indicator of cardiac tamponade.'),
    (v_case_id, 'What is "Pulsus Paradoxus"?', '["High BP with slow HR", "A drop in systolic BP of > 10 mmHg during inspiration", "An irregular heart rate", "Weak pulses in the legs"]', 1, 'Inspiration increases venous return to the right heart, which (in tamponade) bows the septum into the left heart, reducing SV/BP.'),
    (v_case_id, 'What is the definitive management for a TRAUMATIC cardiac tamponade?', '["Pericardiocentesis", "Emergency Thoracotomy / Pericardial Window", "Diuretics", "Wait and watch"]', 1, 'In trauma, the blood in the pericardium is often clotted; surgical drainage and repair of the heart are required.');

    -- CASE 06: Flail Chest
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Paradoxical Motion', 'A patient in a car crash has a segment of his chest wall that moves INWARD during inspiration and OUTWARD during expiration.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomical definition of a flail chest?', '["One broken rib", "Fracture of 2 or more adjacent ribs in 2 or more places", "Broken sternum", "Any rib fracture with pain"]', 1, 'This creates a "floating" segment that moves paradoxically.'),
    (v_case_id, 'What is the primary cause of hypoxia in a patient with flail chest?', '["Pain", "Underlying pulmonary contusion (bruised lung)", "Broken ribs", "Anemia"]', 1, 'The blunt force that broke the ribs also damages the underlying lung tissue, causing edema and hemorrhage.'),
    (v_case_id, 'How is a flail chest primarily managed?', '["Rib strapping and taping", "Adequate analgesia (e.g., epidural) and pulmonary toilet; intubation if needed", "Immediate surgery to plate the ribs", "Chest tube"]', 1, 'Taping the chest prevents deep breathing and worsens atelectasis/pneumonia. Pain control is the mainstay.');

    -- CASE 07: FAST Exam
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Scanning for Fluid', 'A hemodynamically unstable trauma patient (BP 80/40) arrives. You perform a bedside ultrasound to look for free fluid.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the four standard views of the FAST exam?', '["Head, Chest, Abdomen, Pelvis", "Morison''s pouch (RUQ), Perisplenic (LUQ), Suprapubic (Pelvis), and Subxiphoid (Pericardium)", "Liver, Spleen, Kidney, Bladder", "Lungs, Heart, Aorta, IVC"]', 1, 'The FAST looks for free fluid (blood) in these dependent areas.'),
    (v_case_id, 'What is the next step for a HEMODYNAMICALLY UNSTABLE patient with a POSITIVE FAST exam?', '["CT Abdomen", "Immediate Laparotomy", "DPL", "Angiography"]', 1, 'If the patient is crashing and you find blood in the belly, they go straight to the OR.'),
    (v_case_id, 'What is the major limitation of the FAST exam?', '["It takes too long", "It cannot reliably identify solid organ injury or retroperitoneal bleeding", "It is expensive", "It requires radiation"]', 1, 'FAST identifies fluid (blood), not the specific organ injury, and it misses the retroperitoneum.');

    -- CASE 08: Pelvic Fracture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Open Book" Pelvis', 'A pedestrian is struck by a car. He has significant pelvic pain and "on-off" hypotension. Pelvic X-ray shows a 4 cm widening of the pubic symphysis.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority for stabilizing this pelvic fracture?', '["Internal fixation", "Application of a pelvic binder or sheet wrap", "Traction", "Casting"]', 1, 'Closing the pelvic volume reduces the space for bleeding and stabilizes the bones.'),
    (v_case_id, 'What is the most common source of life-threatening bleeding in pelvic fractures?', '["Arterial injury", "Venous plexus and cancellous bone (raw bone edges)", "The bladder", "The rectum"]', 1, '85% of pelvic bleeding is venous/bone; arterial bleeding requires embolization.'),
    (v_case_id, 'If a patient with a pelvic fracture has blood at the urethral meatus, what should you AVOID?', '["IV fluids", "Insertion of a Foley catheter", "Rectal exam", "X-rays"]', 1, 'Blood at the meatus suggests a urethral injury; a retrograde urethrogram (RUG) must be done first.');

    -- CASE 09: Liver and Spleen Trauma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Solid Organ Injury', 'A stable patient has a Grade III splenic laceration on CT after blunt trauma.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the preferred management for a STABLE patient with a splenic or liver injury?', '["Immediate surgery", "Non-operative management (observation and bedrest in the ICU)", "Angiography", "Antibiotics"]', 1, 'Stable patients are managed conservatively regardless of the grade of injury (in many cases).'),
    (v_case_id, 'What is the most common reason for the failure of non-operative management?', '["Fever", "Hemodynamic instability (re-bleeding)", "Pain", "Constipation"]', 1, 'If the patient starts to crash, the observation period ends and they go to the OR.'),
    (v_case_id, 'A Grade V injury generally refers to:', '["A small scratch", "Complete organ shattering or hilar devascularization", "A hematoma", "A 2cm laceration"]', 1, 'Grade V is the most severe category.');

    -- CASE 10: Head Trauma - Epidural Hematoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lucid Interval', 'A 20-year-old is hit in the temple by a baseball. He was briefly knocked out, then woke up and felt fine for an hour, but now he is rapidly becoming unresponsive.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Subdural Hematoma", "Epidural Hematoma", "Concussion", "Stroke"]', 1, 'The "lucid interval" is classic for an epidural hematoma.'),
    (v_case_id, 'What is the typical source of bleeding in an epidural hematoma?', '["Bridging veins", "Middle Meningeal Artery", "Carotid artery", "Venous sinus"]', 1, 'The artery is usually torn by a fracture of the temporal bone at the pterion.'),
    (v_case_id, 'What is the classic appearance of an epidural hematoma on CT?', '["Crescent-shaped", "Biconvex (Lens-shaped) mass that does not cross suture lines", "Diffuse swelling", "Small white spots"]', 1, 'The dura is tightly attached to the sutures, preventing the blood from spreading further.');

    -- CASE 11: Head Trauma - Subdural Hematoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Slow Bleed', 'An 80-year-old male who is on aspirin presents with progressive confusion and "not acting right" over the last week. He fell 2 weeks ago.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Epidural Hematoma", "Subdural Hematoma (Chronic)", "Dementia", "UTI"]', 1, 'Chronic subdurals are common in the elderly after minor trauma.'),
    (v_case_id, 'What is the source of bleeding in a subdural hematoma?', '["Middle meningeal artery", "Bridging veins", "Aorta", "Brain tissue"]', 1, 'The bridging veins between the cortex and the dural sinuses are torn as the brain shifts.'),
    (v_case_id, 'What is the characteristic appearance of a subdural hematoma on CT?', '["Lens-shaped", "Crescent-shaped mass that can cross suture lines", "Star-shaped", "No finding"]', 1, 'The blood is in the potential space between the dura and arachnoid, allowing it to spread along the hemisphere.');

    -- CASE 12: Elevated ICP - Cushing''s Triad
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rising Intracranial Pressure', 'A head trauma patient has a dilated, non-reactive pupil. His vitals are: BP 190/100, HR 45, and irregular respirations.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this triad of vitals called?', '["Beck''s Triad", "Cushing''s Triad", "Virchow''s Triad", "Whipple''s Triad"]', 1, 'Cushing''s triad indicates dangerously high ICP and impending herniation.'),
    (v_case_id, 'Why does the heart rate drop (bradycardia) in response to high ICP?', '["The brain is tired", "Reflex response to the massive sympathetic surge (hypertension) needed to maintain cerebral perfusion", "Blood loss", "Sedation"]', 1, 'The body tries to maintain cerebral perfusion pressure (CPP = MAP - ICP).'),
    (v_case_id, 'What is an immediate medical intervention to lower ICP?', '["IV fluids", "Elevation of the head, Hyperventilation (short-term), and Mannitol/Hypertonic Saline", "Beta blockers", "Aspirin"]', 1, 'These measures acutely reduce brain volume and intracranial pressure.');

    -- CASE 13: Spinal Cord Injury - Central Cord Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hyperextension Injury', 'An elderly man with cervical arthritis falls and hits his chin. He now has significant weakness in his arms and hands, but relatively preserved strength in his legs.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this clinical pattern called?', '["Brown-Sequard Syndrome", "Central Cord Syndrome", "Anterior Cord Syndrome", "Cauda Equina"]', 1, 'Central cord syndrome is the most common incomplete cord injury, often affecting the upper extremities more than the lower.'),
    (v_case_id, 'What is "Brown-Sequard Syndrome"?', '["Bilateral paralysis", "Hemicord injury with ipsilateral loss of motor/proprioception and contralateral loss of pain/temp", "Complete transection", "Loss of only sensory"]', 1, 'It results from a penetrating injury that cuts half the cord.'),
    (v_case_id, 'Loss of motor function and pain/temp below the injury, but preserved vibration/proprioception suggests:', '["Central Cord", "Anterior Cord Syndrome", "Posterior Cord Syndrome", "Conus Medullaris"]', 1, 'Anterior cord (often from ischemia of the anterior spinal artery) spares the dorsal columns.');

    -- CASE 14: Urethral Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blood at the Meatus', 'A male patient has a "straddle injury" and presents with blood at the urethral meatus and a "high-riding" prostate on rectal exam.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bladder rupture", "Posterior Urethral Injury", "Kidney stone", "Testicular torsion"]', 1, 'These signs are classic for a disruption of the posterior urethra (membranous portion).'),
    (v_case_id, 'What is the diagnostic test of choice?', '["CT scan", "Retrograde Urethrogram (RUG)", "Urinalysis", "Cystoscopy"]', 1, 'Injecting contrast into the urethra will show extravasation.'),
    (v_case_id, 'If the RUG is positive, how should the bladder be drained?', '["Foley catheter", "Suprapubic catheter", "In-and-out cath", "Nothing"]', 1, 'A Foley can worsen the tear; a suprapubic tube is the safer choice.');

    -- CASE 15: Bladder Rupture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pelvic Fracture and Hematuria', 'A patient with a pelvic fracture has gross hematuria. A cystogram shows contrast leaking into the space around the bladder but NOT into the paracolic gutters or around the bowel.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Intraperitoneal bladder rupture", "Extraperitoneal bladder rupture", "Urethral injury", "Renal injury"]', 1, 'Extraperitoneal leaks are contained in the prevesical space (Space of Retzius).'),
    (v_case_id, 'What is the treatment for most EXTRAPERITONEAL bladder ruptures?', '["Immediate surgery", "Catheter drainage (Foley) for 10-14 days", "Antibiotics only", "No treatment"]', 1, 'Most will heal on their own if the bladder is kept empty.'),
    (v_case_id, 'How is an INTRAPERITONEAL bladder rupture managed?', '["Catheter only", "Surgical repair", "Stent", "Radiation"]', 1, 'Leaks into the peritoneum (often from a blow to a full bladder) require surgical closure.');

    -- CASE 16: Diaphragmatic Rupture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stomach in the Chest', 'A patient who was crushed by a heavy object has a CXR that shows the stomach bubble and loops of bowel inside the left chest cavity.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pneumothorax", "Diaphragmatic Rupture", "Pneumonia", "Hiatal hernia"]', 1, 'Blunt trauma can cause large tears in the diaphragm, allowing abdominal contents to herniate.'),
    (v_case_id, 'On which side do most traumatic diaphragmatic ruptures occur?', '["Right side", "Left side", "Equal on both sides", "Posterior"]', 1, 'The liver protects the right side, so the left is much more commonly affected.'),
    (v_case_id, 'What is the management?', '["Chest tube", "Surgical repair (laparotomy or thoracotomy)", "Observation", "NG tube only"]', 1, 'The diaphragm will not heal on its own and requires surgical closure.');

    -- CASE 17: Duodenal Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Seatbelt Sign', 'A child in a lap-belt-only restraint is involved in a crash. He has a bruise across his mid-abdomen and develops vomiting and RUQ pain 24 hours later. CT shows a "double bubble" and fluid in the retroperitoneum.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Liver laceration", "Duodenal hematoma or rupture", "Spleen injury", "Appendicitis"]', 1, 'Compression of the duodenum against the spine leads to hematoma or perforation.'),
    (v_case_id, 'Which part of the duodenum is most commonly injured in blunt trauma?', '["1st part", "2nd part (retroperitoneal)", "3rd part", "4th part"]', 1, 'The fixed retroperitoneal parts are most vulnerable.'),
    (v_case_id, 'What is the management of a stable DUODENAL HEMATOMA (no perforation)?', '["Surgery", "Nasogastric suction and TPN (wait 2-3 weeks for it to resolve)", "Stenting", "Antibiotics"]', 1, 'Most hematomas resolve with conservative management.');

    -- CASE 18: Compartment Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain Out of Proportion in a Limb', 'A patient with a tibia fracture has severe pain in his leg that is not relieved by morphine. Pain is much worse when you passively stretch his toes.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["DVT", "Compartment Syndrome", "Nerve injury", "Infection"]', 1, 'Pain out of proportion and pain with passive stretch are the earliest signs.'),
    (v_case_id, 'What is the definitive treatment?', '["Ice and elevation", "Emergency Fasciotomy", "Casting", "Anticoagulation"]', 1, 'The fascia must be opened to relieve the pressure and save the muscle.'),
    (v_case_id, 'Which "P" of compartment syndrome is usually a LATE and ominous sign?', '["Pain", "Pulselessness", "Paresthesia", "Pallor"]', 1, 'By the time the pulse is gone, the limb is likely non-viable.');

    -- CASE 19: Fat Embolism Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Classic Triad', 'Three days after a femur fracture, a patient develops sudden respiratory distress, confusion, and a petechial rash on his neck and armpits.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pulmonary Embolism", "Fat Embolism Syndrome", "Sepsis", "Drug reaction"]', 1, 'The triad of respiratory distress, neurological changes, and petechial rash is classic for fat embolism.'),
    (v_case_id, 'Fat embolism is most commonly associated with which type of injury?', '["Head trauma", "Long bone fractures (e.g., femur, tibia)", "Abdominal trauma", "Burns"]', 1, 'Fat from the marrow enters the systemic circulation.'),
    (v_case_id, 'What is the treatment?', '["Heparin", "Supportive care (Oxygen/Ventilation)", "Steroids", "Dialysis"]', 1, 'There is no specific treatment; the syndrome usually resolves with supportive care.');

    -- CASE 20: Penetrating Neck Trauma - Zones
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stab Wound to the Neck', 'A patient has a stab wound that penetrates the platysma muscle in the middle of the neck (between the cricoid cartilage and the angle of the mandible).', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What zone of the neck is this?', '["Zone I (below cricoid)", "Zone II (cricoid to mandible)", "Zone III (above mandible)", "Zone IV"]', 1, 'The neck is divided into three zones for surgical management.'),
    (v_case_id, 'Historically, what was the management for any penetrating injury to Zone II?', '["Observation", "Mandatory Surgical Exploration", "CT scan only", "Angiography"]', 1, 'Zone II was historically explored; now, many centers use a "selective" approach based on CT/exam.'),
    (v_case_id, 'What is a "Hard Sign" of vascular injury in the neck requiring immediate surgery?', '["Small bruise", "Expanding or pulsatile hematoma", "Difficulty swallowing", "Pain"]', 1, 'Hard signs (expanding hematoma, bruit, active bleeding, shock) mean the patient goes to the OR.');

    -- CASE 21: Damage Control Laparotomy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Abbreviated Surgery', 'During surgery for multiple gunshot wounds, the patient becomes hypothermic, acidotic, and starts to bleed from all surfaces (coagulopathy). The surgeon decides to pack the abdomen and close it temporarily.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this surgical philosophy called?', '["Definitive repair", "Damage Control Surgery", "Palliative surgery", "Wait and watch"]', 1, 'Damage control prioritizes physiological stabilization over anatomical perfection.'),
    (v_case_id, 'What is the goal of "packing" the abdomen?', '["To prevent infection", "To control hemorrhage from small vessels and raw surfaces", "To keep the organs warm", "To clean the belly"]', 1, 'Packing provides pressure to stop diffuse bleeding.'),
    (v_case_id, 'When is the patient typically brought back for the "second look" and definitive repair?', '["2 hours later", "24-48 hours later (once the \"Lethal Triad\" is corrected)", "1 week later", "Never"]', 1, 'The second stage occurs once the patient is warm, stable, and not coagulopathic.');

    -- CASE 22: Burns - Parkland Formula Revision
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fluid Resuscitation', 'A 100 kg man has 50% TBSA burns. Using the Parkland formula (4 mL/kg/%TBSA), how much fluid is needed in the first 24 hours?', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the total calculated volume?', '["10,000 mL", "20,000 mL", "5,000 mL", "15,000 mL"]', 1, '4 * 100 * 50 = 20,000 mL.'),
    (v_case_id, 'How much fluid should be given PER HOUR for the first 8 hours?', '["500 mL/hr", "1,250 mL/hr", "2,500 mL/hr", "10,000 mL/hr"]', 1, 'Half (10,000 mL) in 8 hours = 1,250 mL/hr.'),
    (v_case_id, 'What is the best indicator of adequate fluid resuscitation in a burn patient?', '["Blood pressure", "Urine output (0.5 mL/kg/hr)", "Heart rate", "Hematocrit"]', 1, 'Urine output is the most reliable real-time marker of organ perfusion.');

    -- CASE 23: Maxillofacial Trauma - Le Fort
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Midface Fracture', 'A patient hit in the face has a "floating palate" — the upper teeth and maxilla move separately from the rest of the face.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of Le Fort fracture is this?', '["Le Fort I", "Le Fort II", "Le Fort III", "Mandible fracture"]', 0, 'Le Fort I is a horizontal fracture through the maxilla.'),
    (v_case_id, 'Which Le Fort fracture is known as "Craniofacial Dysjunction" (the whole face is separated from the skull)?', '["Le Fort I", "Le Fort II", "Le Fort III", "Orbital blow-out"]', 2, 'Le Fort III is the most severe.'),
    (v_case_id, 'In a patient with midface trauma and CSF rhinorrhea (leaking from the nose), what should you AVOID?', '["Antibiotics", "Blind insertion of a nasogastric (NG) tube", "IV fluids", "CT scan"]', 1, 'The NG tube could pass through a fractured cribriform plate into the brain.');

    -- CASE 24: Secondary Survey
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Head-to-Toe Exam', 'After the primary survey is complete and the patient is stable, the surgeon proceeds with a detailed physical exam and history.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When should the secondary survey be performed?', '["As soon as the patient arrives", "Only after the primary survey (ABCDE) is complete and the patient is stabilized", "In the OR", "After the CT scan"]', 1, 'Never start the secondary survey if the "ABCs" are not secure.'),
    (v_case_id, 'What is the "AMPLE" mnemonic for trauma history?', '["Airway, Muscle, Pulse, Lung, Exam", "Allergies, Medications, Past medical history, Last meal, Events/Environment", "Anemia, Metabolism, Pain, Liver, Edema", "Age, Male, Pulse, Lactate, Ethanol"]', 1, 'This covers the essential history needed for emergency management.'),
    (v_case_id, 'True or False: A trauma patient must be "log-rolled" to examine the back as part of the secondary survey.', '["True", "False"]', 0, 'True. The back and spine must be examined while maintaining C-spine protection.');

    -- CASE 25: Aortic Disruption
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Widened Mediastinum', 'A high-speed crash victim has a CXR that shows a widened mediastinum (> 8 cm), blurring of the aortic knob, and deviation of the NG tube to the right.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What life-threatening injury must you suspect?', '["Myocardial contusion", "Traumatic Aortic Disruption", "Esophageal rupture", "Spleen injury"]', 1, 'Sudden deceleration causes the aorta to tear, usually at the ligamentum arteriosum.'),
    (v_case_id, 'What is the screening test of choice for suspected aortic injury?', '["Angiography", "CT Angiography (CTA) of the chest", "Echocardiogram", "MRI"]', 1, 'CTA is fast and highly sensitive.'),
    (v_case_id, 'If the patient is stable, what is the goal of initial medical management?', '["Increase BP", "Heart rate and blood pressure control (e.g., Esmolol) to reduce shear stress", "Give aspirin", "Emergency surgery"]', 1, 'Controlling "impulse" (dP/dt) prevents the partial tear from becoming a complete rupture.');

    -- CASE 26: Rectal Injury in Trauma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Penetrating Pelvic Wound', 'A patient has a gunshot wound that passes through the pelvis. Rectal exam shows gross blood.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard management for a significant extraperitoneal rectal injury?', '["Primary repair only", "Proximal diverting colostomy, presacral drainage, and distal rectal washout", "Observation", "Antibiotics only"]', 1, 'Diversion and drainage are the traditional pillars of managing these high-risk injuries.'),
    (v_case_id, 'Why is a rectal injury particularly dangerous?', '["It causes pain", "Fecal contamination in the deep pelvic spaces leads to severe sepsis and necrotizing fasciitis", "It bleeds a lot", "It heals slowly"]', 1, 'Infection in the retroperitoneum/pelvis is hard to drain and very morbid.'),
    (v_case_id, 'True or False: A negative DRE (no blood) completely rules out a rectal injury.', '["True", "False"]', 1, 'False. Sensitivity is not 100%; proctoscopy may be needed.');

    -- CASE 27: Tracheobronchial Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Persistent Leak', 'A patient with a chest tube for a pneumothorax has a massive, continuous air leak in the water seal and his lung refuses to re-expand.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What injury should be suspected?', '["Pneumonia", "Tracheobronchial tree rupture", "Small pneumothorax", "Esophageal tear"]', 1, 'A massive leak that prevents re-expansion suggests a large airway tear.'),
    (v_case_id, 'What is the best diagnostic test for an airway injury?', '["CT scan", "Bronchoscopy", "Repeat X-ray", "Lung scan"]', 1, 'Bronchoscopy allows direct visualization of the tear.'),
    (v_case_id, 'What is "Hamman''s Crunch"?', '["A rib fracture", "A crunching sound heard over the heart during systole, indicating pneumomediastinum", "A lung sound", "A stomach sound"]', 1, 'It is a sign of air in the mediastinum, often from an airway or esophageal injury.');

    -- CASE 28: Genitourinary Trauma - Renal
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flank Ecchymosis', 'A football player is tackled hard and has flank pain and gross hematuria.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common mechanism of renal injury?', '["Penetrating", "Blunt trauma to the flank/back", "Surgery", "Infection"]', 1, 'Blunt trauma (MVA, falls, sports) is the most common.'),
    (v_case_id, 'If a stable patient has a renal laceration with a small hematoma on CT, what is the management?', '["Total nephrectomy", "Observation and bedrest", "Stent", "Partial nephrectomy"]', 1, 'The vast majority (> 90%) of renal injuries are managed non-operatively.'),
    (v_case_id, 'When is surgical exploration of the kidney mandatory?', '["Any hematuria", "Hemodynamic instability due to renal bleeding or an expanding/pulsatile hematoma", "Grade I injury", "Patient request"]', 1, 'Ongoing bleeding is the primary indication for surgery.');

    -- CASE 29: Diaphragmatic Injury - Penetrating
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stab to the Lower Chest', 'A patient is stabbed in the 6th intercostal space on the left. He is stable and has a normal CXR.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is this injury concerning despite the normal CXR?', '["It might be infected", "Penetrating injuries below the nipples can cross the diaphragm into the abdomen", "The ribs are broken", "The heart is injured"]', 1, 'The "thoracoabdominal" zone (nipples to costal margin) involves both cavities.'),
    (v_case_id, 'What is the gold standard for diagnosing a small diaphragmatic tear from a stab wound?', '["CT scan", "Diagnostic Laparoscopy", "MRI", "Ultrasound"]', 1, 'CT has poor sensitivity for small diaphragmatic tears; direct visualization is preferred.'),
    (v_case_id, 'What is the risk of an un-repaired small diaphragmatic tear?', '["Nothing", "Delayed herniation of abdominal organs (months to years later) with strangulation", "Fever", "Anemia"]', 1, 'The pressure gradient between the abdomen and chest will eventually pull organs through even a small hole.');

    -- CASE 30: Burn - Chemical Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acid Spill', 'A factory worker is splashed with a strong acid. He has immediate, severe pain.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important immediate treatment for most chemical burns?', '["Apply a neutralizing agent", "Copious irrigation with water or saline for at least 20-30 minutes", "Apply butter", "Wait for a specialist"]', 1, 'Neutralizing agents generate heat (exothermic reaction) and can worsen the burn. Flushing is the key.'),
    (v_case_id, 'Which is generally more dangerous: Acid or Alkali burns?', '["Acid", "Alkali"]', 1, 'Alkali burns cause "liquefactive necrosis," which allows the chemical to penetrate deeper into the tissues compared to the "coagulative necrosis" of acids.'),
    (v_case_id, 'Which specific chemical burn (found in glass etching) requires treatment with Calcium Gluconate?', '["Sulfuric acid", "Hydrofluoric acid (HF)", "Sodium hydroxide", "Bleach"]', 1, 'HF causes severe pain and life-threatening hypocalcemia by binding calcium; topical or injected calcium is the treatment.');

    RAISE NOTICE 'SUCCESS: Trauma Surgery Case Blocks (1-30) registered.';
END $$;

COMMIT;
