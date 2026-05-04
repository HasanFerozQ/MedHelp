-- Orthopedics: Fractures & dislocations — classification & management - Complete (Cases 1-50)
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-fractures

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-fractures' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-fractures';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Open Fracture - Gustilo-Anderson
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Motorcycle Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Motorcycle Crash', 'A 24-year-old male is brought to the ED after a high-speed motorcycle accident. He has an obvious deformity of his right leg with a 5 cm jagged wound through which bone is protruding. There is heavy soil contamination.

Vitals: BP 110/70 mmHg, HR 115 bpm.
Physical Examination: 5 cm wound over the mid-tibia with visible bone; distal pulses are 2+ and equal. Sensation is intact in the foot.
Laboratory Results: Normal CBC; X-ray shows a comminuted mid-shaft tibia fracture.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old male has a 5 cm contaminated wound with protruding bone over a mid-shaft tibia fracture following a motorcycle crash.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Gustilo-Anderson classification, what type of open fracture is this?', '["Type I", "Type II", "Type IIIA", "Type IIIB"]', 2, 'Type IIIA fractures are >10 cm or involve high-energy trauma with adequate soft tissue coverage. Even though the wound is 5 cm, the high-energy nature (motorcycle) and comminution often push this into Type III territory. If there is adequate soft tissue for coverage, it is IIIA.'),
    (v_case_id, 'What is the most critical initial medical intervention for this open fracture?', '["Immediate IV antibiotics and Tetanus prophylaxis", "Oral pain medication", "Applying a plaster cast", "Immediate blood transfusion"]', 0, 'Early administration of IV antibiotics (usually a 1st gen cephalosporin ± aminoglycoside for Type III) is the most important factor in reducing infection risk.'),
    (v_case_id, 'True or False: All open fractures require urgent surgical irrigation and debridement (I&D) in the operating room.', '["True", "False"]', 0, 'Open fractures are surgical emergencies; the \"gold standard\" is I&D within 24 hours (previously 6 hours) to minimize the bacterial load.');

    ---------------------------------------------------------------------------
    -- CASE 02: Compartment Syndrome - Clinical Diagnosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain Out of Proportion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain Out of Proportion', 'A 30-year-old male is 6 hours post-op from an intramedullary nailing of a tibial shaft fracture. He complains of excruciating pain in his calf that is not relieved by increasing doses of IV morphine.

Vitals: Stable.
Physical Examination: Calf is tense and \"wood-like\" on palpation. Pain is significantly worsened by passive extension of the toes. Distal pulses are still palpable.
Laboratory Results: Normal.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-op tibial fracture patient has excruciating pain and tense calf muscles; pain is worsened by passive toe extension.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Deep Vein Thrombosis (DVT)", "Acute Compartment Syndrome (ACS)", "Opioid seeking behavior", "Infection"]', 1, 'Pain out of proportion to the injury and pain with passive stretch are the most sensitive clinical signs of ACS.'),
    (v_case_id, 'Which of the \"6 Ps\" is typically the LAST to appear and indicates irreversible damage?', '["Pain", "Paresthesia", "Pallor", "Pulselessness"]', 3, 'Pulselessness is a very late sign. ACS occurs at pressures below systolic pressure, so pulses usually remain palpable until the very end.'),
    (v_case_id, 'What is the definitive treatment for this condition?', '["Elevate the limb above the heart", "Apply a tight compression bandage", "Emergent surgical fasciotomy", "Wait and monitor pressures"]', 2, 'ACS is a surgical emergency. Fasciotomy of all involved compartments must be performed immediately to prevent muscle necrosis and nerve damage.');

    ---------------------------------------------------------------------------
    -- CASE 03: Bone Healing - Primary vs. Secondary
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Callus Formation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Callus Formation', 'A 19-year-old football player sustained a mid-shaft femoral fracture. He was treated with an intramedullary nail. Six weeks later, his X-ray shows a large cloud-like bridge of bone across the fracture site.

Vitals: Stable.
Physical Examination: Patient is weight-bearing as tolerated with minimal pain.
Laboratory Results: CXR/X-ray shows abundant external callus.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with an intramedullary nail for a femur fracture shows bridging callus at 6 weeks.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The formation of a \"callus\" is a hallmark of which type of bone healing?', '["Primary (Direct) bone healing", "Secondary (Indirect) bone healing", "Non-union", "Mal-union"]', 1, 'Secondary bone healing occurs when there is some micro-motion (relative stability), such as with IM nails, casts, or external fixators. It involves an inflammatory phase, callus formation, and remodeling.'),
    (v_case_id, 'Primary bone healing occurs under which condition?', '["Absolute stability (e.g., compression plating)", "Relative stability (e.g., IM nail)", "When the fracture is left untreated", "Only in children"]', 0, 'Primary healing involves direct cutting-cone remodeling across the fracture site without callus formation, requiring rigid internal fixation.'),
    (v_case_id, 'What is the first biological stage of secondary bone healing?', '["Soft callus formation", "Hematoma formation and inflammation", "Hard callus formation", "Remodeling"]', 1, 'The process starts with a hematoma, which provides the signaling molecules for mesenchymal cell recruitment.');

    ---------------------------------------------------------------------------
    -- CASE 04: Pediatric - Salter-Harris Classification
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Growth Plate Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Growth Plate Injury', 'An 8-year-old girl falls off a jungle gym and hurts her ankle. X-rays show a fracture line that starts in the epiphysis, crosses the physis (growth plate), and extends into the metaphysis.

Vitals: Stable.
Physical Examination: Tenderness and swelling over the distal tibia.
Laboratory Results: X-ray shows a fracture crossing all three zones of the bone end.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-year-old has a fracture crossing from the epiphysis through the growth plate into the metaphysis.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Salter-Harris classification, what type is this?', '["Type II", "Type III", "Type IV", "Type V"]', 2, 'Salter-Harris IV (S-A-L-T-E-R mnemonic: IV is Through). It crosses the metaphysis, physis, and epiphysis.'),
    (v_case_id, 'Which Salter-Harris type has the POOREST prognosis for future growth?', '["Type I", "Type II", "Type III", "Type V"]', 3, 'Type V involves a crush injury to the physis, which often leads to premature growth plate closure and limb length discrepancy.'),
    (v_case_id, 'True or False: Salter-Harris Type I and II fractures are usually managed non-operatively.', '["True", "False"]', 0, 'Types I and II do not cross the articular surface and are generally stable enough for casting/closed management.');

    ---------------------------------------------------------------------------
    -- CASE 05: Open Fracture - Management Priorities
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Contaminated Wound' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Contaminated Wound', 'A patient presents with a Type IIIB open tibia fracture sustained in a farm accident (manure exposure).

Vitals: Stable.
Physical Examination: Large soft tissue defect, bone exposed, significant debris.
Laboratory Results: Normal.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A farm-related Type IIIB open tibia fracture with heavy contamination.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'For a soil or farm-contaminated wound, which antibiotic should be added to the standard cephalosporin?', '["Vancomycin", "Penicillin G", "Ciprofloxacin", "Metronidazole"]', 1, 'Penicillin G is added to cover Clostridium species (gas gangrene) in cases of soil/farm contamination.'),
    (v_case_id, 'What is the definition of a Gustilo Type IIIB fracture?', '["Extensive soft tissue injury with periosteal stripping and bone exposure requiring a flap for coverage", "Wound > 10 cm", "Vascular injury requiring repair", "Any fracture in a farm"]', 0, 'The hallmark of IIIB is that the wound cannot be closed primarily and requires a plastic surgery flap or graft for coverage.'),
    (v_case_id, 'True or False: Pulse lavage with high-pressure water is the current recommendation for irrigation.', '["True", "False"]', 1, 'Current evidence suggests that low-pressure irrigation (simple gravity flow) is as effective and less likely to drive bacteria deeper into the bone.');

    ---------------------------------------------------------------------------
    -- CASE 06: Fat Embolism Syndrome (FES)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Triad of FES' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Triad of FES', 'A 22-year-old male with a bilateral femur fracture from an MVC. 48 hours after admission, he becomes suddenly confused and develops respiratory distress.

Vitals: BP 110/60 mmHg, HR 125 bpm, RR 28 bpm, O2 Sat 88% on RA.
Physical Examination: Multiple small red-brown petechiae are noted on his neck and axilla.
Laboratory Results: CXR shows \"snowstorm\" infiltrates.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with bilateral femur fractures develops confusion, respiratory distress, and petechiae 48 hours later.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pulmonary Embolism (PE)", "Fat Embolism Syndrome (FES)", "Sepsis", "Pneumonia"]', 1, 'The classic triad of FES is: 1) Respiratory distress, 2) Neurological changes (confusion), and 3) Petechial rash (found in <50% but highly specific).'),
    (v_case_id, 'FES is most commonly associated with fractures of:', '["The skull", "Long bones (Femur, Tibia) and Pelvis", "The wrist", "The ribs"]', 1, 'Fat globules are released from the marrow of large bones into the venous circulation.'),
    (v_case_id, 'What is the primary management of Fat Embolism Syndrome?', '["Heparinization", "Intubation and supportive care", "Immediate surgical fixation of the fractures", "Corticosteroids"]', 1, 'Management is supportive. Early stabilization/fixation of the fracture helps *prevent* FES, but once it occurs, treatment is supportive (oxygen, ventilation).');

    ---------------------------------------------------------------------------
    -- CASE 07: Neurovascular Assessment
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dislocated Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dislocated Knee', 'A 45-year-old male presents with a grossly deformed knee after a car crash. The knee is \"wobbly\" in all directions.

Vitals: Stable.
Physical Examination: Large effusion, multi-directional instability. Dorsalis pedis pulse is diminished compared to the other side.
Laboratory Results: ABI (Ankle-Brachial Index) is 0.8.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A knee dislocation patient has a diminished DP pulse and an ABI of 0.8.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared vascular complication of a knee dislocation?', '["Femoral artery tear", "Popliteal artery injury", "DVT", "Varicose veins"]', 1, 'The popliteal artery is tethered at the adductor hiatus and the soleus arch, making it highly vulnerable to stretch/tear during knee dislocation.'),
    (v_case_id, 'What is the next most appropriate diagnostic step given the abnormal ABI?', '["CT Angiography", "Immediate surgery", "Apply a cast", "MRI of the knee"]', 0, 'An ABI < 0.9 or diminished pulses in a knee dislocation are \"hard signs\" or \"soft signs\" that mandate vascular imaging (CTA or formal angiogram).'),
    (v_case_id, 'Which nerve is most commonly injured in a knee dislocation?', '["Tibial nerve", "Common peroneal (fibular) nerve", "Saphenous nerve", "Femoral nerve"]', 1, 'The common peroneal nerve wraps around the fibular head and is frequently stretched or torn.');

    ---------------------------------------------------------------------------
    -- CASE 08: Compartment Syndrome - Delta Pressure
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Measuring Pressures' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Measuring Pressures', 'A patient with an obtunded mental state has a crushed leg. You are concerned about compartment syndrome but cannot perform a clinical exam. You measure the compartment pressure.

Vitals: BP 100/60 mmHg (MAP 73).
Physical Examination: Tense calf.
Laboratory Results: Deep posterior compartment pressure is 35 mmHg.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An unconscious patient has a compartment pressure of 35 mmHg and a BP of 100/60.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the \"Delta Pressure\" (ΔP) for this patient?', '["35 mmHg", "25 mmHg", "65 mmHg", "5 mmHg"]', 1, 'Delta Pressure = Diastolic BP - Compartment Pressure. 60 - 35 = 25 mmHg.'),
    (v_case_id, 'What Delta Pressure threshold is typically used to diagnose Acute Compartment Syndrome?', '["ΔP < 10 mmHg", "ΔP < 30 mmHg", "ΔP > 50 mmHg", "Any ΔP > 0"]', 1, 'A Delta Pressure less than 30 mmHg is highly suggestive of ACS and is used as an indication for fasciotomy, especially in patients who cannot be examined.'),
    (v_case_id, 'Why is an absolute pressure (e.g., >30 mmHg) less reliable than Delta Pressure?', '["It isn''t; absolute is better", "Blood flow depends on the gradient between perfusion pressure and tissue pressure; a hypotensive patient will have ischemia at lower tissue pressures", "Machine error", "Tissue density"]', 1, 'Perfusion depends on the pressure gradient. A patient with a BP of 180/110 can tolerate a tissue pressure of 40 much better than a patient with a BP of 90/50.');

    ---------------------------------------------------------------------------
    -- CASE 09: Principles of Splinting
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Art of Splinting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Art of Splinting', 'You are preparing to splint a mid-shaft radius and ulna fracture in the ED.

Vitals: Stable.
Physical Examination: Deformity of the mid-forearm.
Laboratory Results: X-ray shows displaced mid-shaft fractures.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'You are splinting a mid-shaft forearm fracture.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The general rule for immobilization of a long bone fracture is to include:', '["The fracture site only", "The joint above and the joint below the fracture", "The entire limb", "Just the wrist"]', 1, 'To prevent rotation and movement at the fracture site, the adjacent joints must be immobilized.'),
    (v_case_id, 'Why is a \"splint\" preferred over a \"cast\" in the acute setting (first 24-48 hours)?', '["It is stronger", "It allows for swelling and reduces the risk of compartment syndrome", "It is cheaper", "It is easier to walk in"]', 1, 'Casts are circumferential and do not expand; acute swelling inside a fresh cast can quickly lead to ACS.'),
    (v_case_id, 'True or False: You should always check neurovascular status *after* applying a splint.', '["True", "False"]', 0, 'Applying a splint or performing a reduction can inadvertently compress a nerve or artery; documentation of post-procedural status is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 10: AO Classification Basics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Orthopedic Shorthand' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Orthopedic Shorthand', 'An orthopedic resident describes a fracture as \"32-B2\".

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Understanding the AO/OTA fracture classification system.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the AO system, the first digit \"3\" refers to which bone?', '["Humerus", "Radius/Ulna", "Femur", "Tibia/Fibula"]', 2, '1=Humerus, 2=Radius/Ulna, 3=Femur, 4=Tibia/Fibula.'),
    (v_case_id, 'The second digit \"2\" refers to the location on the bone. Where is it?', '["Proximal", "Diaphysis (Shaft)", "Distal", "Malleolar"]', 1, '1=Proximal, 2=Diaphysis, 3=Distal.'),
    (v_case_id, 'A \"Type C\" fracture in the AO system is generally:', '["Simple", "Wedge", "Complex/Comminuted", "Incomplete"]', 2, 'A=Simple, B=Wedge, C=Complex. As you go from A to C, the severity and difficulty of treatment increase.');

    ---------------------------------------------------------------------------
    -- CASE 11: Clavicle Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cycling Accident' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cycling Accident', 'A 28-year-old competitive cyclist falls onto his outstretched right arm. He has a visible deformity over the mid-clavicle and skin tenting.

Vitals: Stable.
Physical Examination: Deformity of the middle third of the clavicle; skin is thin and stretched over the fracture but not broken.
Laboratory Results: X-ray shows 2 cm of shortening and significant displacement.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cyclist has a displaced mid-clavicle fracture with 2 cm shortening and skin tenting.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an absolute indication for surgical fixation of a clavicle fracture?', '["Any middle-third fracture", "Open fracture or \"threatened\" skin (skin tenting)", "Pain", "A patient who wants to look better"]', 1, 'Open fractures, neurovascular injury, or skin tenting (which could become an open fracture) are urgent indications for surgery.'),
    (v_case_id, 'Which part of the clavicle is most commonly fractured?', '["Medial third", "Middle third", "Lateral third", "Acromion"]', 1, 'The middle third is the weakest part of the clavicle and accounts for ~80% of fractures.'),
    (v_case_id, 'True or False: Most mid-shaft clavicle fractures can be managed with a simple sling.', '["True", "False"]', 0, 'While surgery is increasingly common for athletes/high-demand patients with displacement, the majority can be successfully treated non-operatively.');

    ---------------------------------------------------------------------------
    -- CASE 12: Shoulder Dislocation - Anterior
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blocked Shot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blocked Shot', 'A 20-year-old basketball player was reaching for a block when his arm was forced back. He presents with his arm held in abduction and external rotation.

Vitals: Stable.
Physical Examination: Loss of normal shoulder contour (squared off appearance). Patient cannot touch the opposite shoulder.
Laboratory Results: X-ray shows the humeral head displaced inferior and medial to the glenoid.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A basketball player has an anterior shoulder dislocation; arm is in abduction/ER.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is most commonly injured in an anterior shoulder dislocation?', '["Radial nerve", "Axillary nerve", "Musculocutaneous nerve", "Median nerve"]', 1, 'The axillary nerve (C5-C6) provides sensation over the lateral deltoid (\"regimental badge area\") and innervates the deltoid/teres minor.'),
    (v_case_id, 'A \"Hill-Sachs\" lesion seen on post-reduction imaging is:', '["A fracture of the glenoid rim", "A compression fracture of the posterolateral humeral head", "A rotator cuff tear", "An axillary nerve palsy"]', 1, 'It is caused by the humeral head impacting the glenoid during the dislocation.'),
    (v_case_id, 'What is the most likely long-term complication for this 20-year-old patient?', '["Frozen shoulder", "Recurrent instability/dislocation", "Osteoarthritis", "Nerve death"]', 1, 'The younger the patient at the time of first dislocation, the higher the risk of recurrence (up to 90% in some studies).');

    ---------------------------------------------------------------------------
    -- CASE 13: Shoulder Dislocation - Posterior
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Seizure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Seizure', 'A 50-year-old man is brought to the ED after a generalized tonic-clonic seizure. He complains of severe shoulder pain and holds his arm in internal rotation and adduction.

Vitals: Stable.
Physical Examination: Prominent posterior shoulder contour; arm is \"locked\" in internal rotation.
Laboratory Results: AP X-ray shows a \"light bulb sign\" (humeral head appears perfectly round).', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a posterior shoulder dislocation after a seizure; arm is held in internal rotation.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Posterior shoulder dislocations are classically associated with:', '["Seizures and electrocution", "Falling on an outstretched hand", "Car accidents", "Sports injuries"]', 0, 'Violent muscle contractions (internal rotators are stronger than external rotators) during seizures or electrical shocks force the head posteriorly.'),
    (v_case_id, 'Why is a posterior dislocation often missed on initial AP X-rays?', '["The head looks normal in the glenoid fossa", "The \"light bulb appearance\" can be subtle", "The arm is held in a way that blocks the view", "Both A and B"]', 3, 'In internal rotation, the humeral head looks like a light bulb. On AP view, it may appear to be in the glenoid, so an Axillary or Scapular Y view is mandatory.'),
    (v_case_id, 'True or False: Posterior dislocations are much more common than anterior dislocations.', '["True", "False"]', 1, 'Anterior dislocations account for ~95% of shoulder dislocations.');

    ---------------------------------------------------------------------------
    -- CASE 14: Proximal Humerus Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neer Classification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neer Classification', 'An 80-year-old woman falls in her home and sustains a proximal humerus fracture. X-rays show displacement of the greater tuberosity and the surgical neck.

Vitals: Stable.
Physical Examination: Significant ecchymosis of the shoulder and upper arm.
Laboratory Results: X-ray shows three distinct bone fragments separated by > 1 cm.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old with a 3-part proximal humerus fracture after a fall.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The Neer classification defines a \"part\" as a fragment with:', '["Any visible fracture line", "Displacement > 1 cm or Angulation > 45 degrees", "Visible bone marrow", "A fragment that needs surgery"]', 1, 'Only significantly displaced/angulated fragments count as \"parts\" in the Neer system.'),
    (v_case_id, 'A 4-part proximal humerus fracture is at a high risk for:', '["Mal-union", "Avascular Necrosis (AVN) of the humeral head", "Radial nerve palsy", "Infection"]', 1, 'The blood supply to the humeral head (primarily the posterior humeral circumflex artery) is often completely disrupted in 4-part fractures.'),
    (v_case_id, 'Most \"1-part\" proximal humerus fractures in the elderly are treated with:', '["Total shoulder replacement", "Plating (ORIF)", "Sling and early range of motion", "Hemiarthroplasty"]', 2, 'Non-displaced or minimally displaced fractures have an excellent prognosis with conservative management.');

    ---------------------------------------------------------------------------
    -- CASE 15: Humerus Shaft Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Radial Nerve Palsy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Radial Nerve Palsy', 'A 35-year-old male sustains a spiral fracture of the distal third of the humerus shaft (Holstein-Lewis fracture). On exam, he is unable to extend his wrist or fingers.

Vitals: Stable.
Physical Examination: \"Wrist drop\"; loss of sensation on the dorsal first web space.
Laboratory Results: X-ray shows distal 1/3 spiral humerus fracture.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A distal 1/3 humerus shaft fracture with wrist drop.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The inability to extend the wrist (wrist drop) indicates injury to which nerve?', '["Median nerve", "Ulnar nerve", "Radial nerve", "Musculocutaneous nerve"]', 2, 'The radial nerve is intimately associated with the humerus shaft as it travels in the spiral groove.'),
    (v_case_id, 'What is the initial management of a \"Holstein-Lewis\" fracture with radial nerve palsy?', '["Immediate surgery to explore the nerve", "Closed reduction and functional bracing (Sarmiento brace); observe for nerve recovery", "Nerve graft", "Amputation"]', 1, 'The vast majority (>90%) of radial nerve palsies associated with humerus shaft fractures are \"neuropraxias\" that recover spontaneously within 3-4 months.'),
    (v_case_id, 'True or False: Most mid-shaft humerus fractures require surgical plating.', '["True", "False"]', 1, 'Non-operative treatment with a coaptation splint followed by a Sarmiento brace is highly successful for most humerus shaft fractures.');

    ---------------------------------------------------------------------------
    -- CASE 16: Pediatric Supracondylar Humerus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gartland Classification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gartland Classification', 'A 6-year-old boy falls off the sofa. His elbow is swollen and he refuses to move it. X-rays show a supracondylar fracture with complete displacement.

Vitals: Stable.
Physical Examination: Swollen, S-shaped elbow deformity. Pulses are 1+.
Laboratory Results: X-ray shows posterior displacement of the distal fragment; no bone contact (Gartland Type III).', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old has a Gartland Type III supracondylar humerus fracture.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Gartland Type III fractures typically require:', '["Casting in the ED", "Urgent closed reduction and percutaneous pinning (CRPP) in the OR", "Physical therapy only", "Open surgery for everyone"]', 1, 'Completely displaced supracondylar fractures are unstable and at risk for neurovascular compromise; they require surgical pinning.'),
    (v_case_id, 'What is a \"fat pad sign\" (or sail sign) on an elbow X-ray?', '["A sign of a fracture in the growth plate", "Displacement of the periarticular fat by a joint effusion, suggesting an occult fracture", "A normal finding in children", "A sign of infection"]', 1, 'A posterior fat pad is always abnormal and suggests an intra-articular fracture (supracondylar in kids, radial head in adults).'),
    (v_case_id, 'The most feared late complication of an untreated or poorly managed supracondylar fracture is:', '["Volkmann Ischemic Contracture", "Cubitus valgus", "Elbow arthritis", "Tennis elbow"]', 0, 'Ischemia (due to brachial artery injury or compartment syndrome) leads to permanent fibrosis and contracture of the forearm muscles.');

    ---------------------------------------------------------------------------
    -- CASE 17: Supracondylar - Nerve Assessment
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The \"OK\" Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The \"OK\" Sign', 'A child with a supracondylar fracture is asked to make an \"OK\" sign with his fingers. He is able to touch his thumb to his index finger, but they are flat (pulp-to-pulp) instead of making a circle (tip-to-tip).

Vitals: Stable.
Physical Examination: Weakness of the Flexor Pollicis Longus (FPL) and Flexor Digitorum Profundus (FDP) to the index finger.
Laboratory Results: N/A.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A child with a supracondylar fracture cannot make a tip-to-tip \"OK\" sign.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is most likely affected?', '["Median nerve (main branch)", "Anterior Interosseous Nerve (AIN)", "Radial nerve", "Ulnar nerve"]', 1, 'The AIN is a motor-only branch of the median nerve. Damage prevents tip-to-tip flexion of the thumb and index finger.'),
    (v_case_id, 'Which nerve is most commonly injured in EXTENSION-type supracondylar fractures?', '["AIN / Median nerve", "Ulnar nerve", "Radial nerve", "Axillary nerve"]', 0, 'The median nerve (specifically the AIN) is the most common nerve injured in the common extension-type fracture.'),
    (v_case_id, 'Which nerve is more commonly injured in the rarer FLEXION-type supracondylar fracture?', '["Median nerve", "Ulnar nerve", "Radial nerve", "AIN"]', 1, 'The ulnar nerve is more at risk in flexion-type supracondylar fractures.');

    ---------------------------------------------------------------------------
    -- CASE 18: Elbow Dislocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The \"Terrible Triad\"' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The \"Terrible Triad\"', 'A 30-year-old wrestler lands on his arm. His elbow is dislocated. Imaging shows a posterior dislocation with associated fractures of the radial head and the coronoid process.

Vitals: Stable.
Physical Examination: Gross deformity of the elbow; neurovascular status intact.
Laboratory Results: X-rays show posterior elbow dislocation, comminuted radial head fracture, and coronoid fracture.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with an elbow dislocation, radial head fracture, and coronoid fracture.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This combination of injuries is known as:', '["Monteggia injury", "Terrible Triad of the elbow", "Galeazzi injury", "Essex-Lopresti"]', 1, 'The \"Terrible Triad\" is notoriously unstable and almost always requires surgical management.'),
    (v_case_id, 'In which direction do most elbow dislocations occur?', '["Anterior", "Posterior / Posterolateral", "Medial", "Divergent"]', 1, 'Posterior/posterolateral dislocations are the most common.'),
    (v_case_id, 'True or False: Simple elbow dislocations (no fractures) can usually be treated with closed reduction and early motion.', '["True", "False"]', 0, 'Simple dislocations are generally stable after reduction and do not require long-term immobilization.');

    ---------------------------------------------------------------------------
    -- CASE 19: Radial Head Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mason Classification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mason Classification', 'A 40-year-old woman falls on her outstretched hand. She has lateral elbow pain and a limited range of motion, especially pronation/supination.

Vitals: Stable.
Physical Examination: Tenderness over the radial head; positive \"fat pad sign\" on X-ray.
Laboratory Results: X-ray shows a non-displaced fracture of the radial head.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a non-displaced (Mason Type I) radial head fracture.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Mason classification, a non-displaced radial head fracture is:', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Type I=Non-displaced, Type II=Displaced (>2mm), Type III=Comminuted.'),
    (v_case_id, 'What is the management of a Mason Type I radial head fracture?', '["Surgery (ORIF)", "Total elbow replacement", "Sling and early range of motion (often within days)", "Long arm cast for 6 weeks"]', 2, 'Early motion is critical to prevent elbow stiffness, which is a common complication.'),
    (v_case_id, 'An Essex-Lopresti injury involves a radial head fracture plus:', '["A humerus fracture", "Disruption of the interosseous membrane and distal radioulnar joint (DRUJ)", "A wrist fracture", "A shoulder dislocation"]', 1, 'It is a longitudinal instability of the forearm.');

    ---------------------------------------------------------------------------
    -- CASE 20: Olecranon Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Triceps Pull' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Triceps Pull', 'A 60-year-old male falls directly onto his \"funny bone\" (olecranon). He is unable to actively extend his elbow against gravity.

Vitals: Stable.
Physical Examination: Swelling and a palpable gap at the olecranon.
Laboratory Results: X-ray shows a displaced transverse fracture of the olecranon.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A displaced olecranon fracture with loss of active elbow extension.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are most displaced olecranon fractures treated surgically?', '["Because they look bad", "The pull of the triceps muscle causes persistent displacement and loss of extension", "Because the bone has poor blood supply", "To prevent nerve damage"]', 1, 'The triceps tendon inserts on the olecranon; a fracture disrupts the extensor mechanism.'),
    (v_case_id, 'What is a common surgical technique for a simple transverse olecranon fracture?', '["Intramedullary nail", "Tension-band wiring", "Plate and screws", "External fixation"]', 1, 'Tension-band wiring converts the distracting force of the triceps into a compressive force at the fracture site.'),
    (v_case_id, 'True or False: Olecranon fractures are often associated with ulnar nerve symptoms.', '["True", "False"]', 0, 'The ulnar nerve sits in the cubital tunnel right next to the olecranon.');

    ---------------------------------------------------------------------------
    -- CASE 21: Monteggia Fracture-Dislocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The MUGR Mnemonic - M' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The MUGR Mnemonic - M', 'A 25-year-old man presents with a painful, deformed forearm after a fall. X-rays show a fracture of the proximal third of the ulnar shaft and an anterior dislocation of the radial head.

Vitals: Stable.
Physical Examination: Swelling and tenderness over the proximal ulna; limited elbow motion.
Laboratory Results: X-rays show proximal ulna fracture and radio-capitellar joint disruption.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A proximal ulna fracture with associated radial head dislocation.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury is known as a:', '["Galeazzi fracture", "Monteggia fracture", "Colles fracture", "Nightstick fracture"]', 1, 'Monteggia: Proximal ulnar fracture + Radial head dislocation. (Mnemonic: MUGR - Monteggia/Ulna, Galeazzi/Radius).'),
    (v_case_id, 'What is the primary management for this injury in adults?', '["Long arm cast", "Closed reduction and sling", "Open Reduction and Internal Fixation (ORIF) of the ulna", "Physical therapy alone"]', 2, 'Monteggia fractures in adults are notoriously unstable and require ORIF of the ulna, which usually reduces the radial head automatically.'),
    (v_case_id, 'The radio-capitellar line on X-ray should always point toward the:', '["Olecranon", "Capitellum", "Radial tuberosity", "Medial epicondyle"]', 1, 'A line through the center of the radial shaft and head should always bisect the capitellum in all views.');

    ---------------------------------------------------------------------------
    -- CASE 22: Galeazzi Fracture-Dislocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The MUGR Mnemonic - G' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The MUGR Mnemonic - G', 'A 30-year-old woman falls on her outstretched hand. X-rays show a fracture of the distal third of the radial shaft and a dislocation of the distal radioulnar joint (DRUJ).

Vitals: Stable.
Physical Examination: Tenderness and swelling of the distal radius and wrist.
Laboratory Results: X-rays show distal radial fracture and widened DRUJ.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A distal radius fracture with associated DRUJ dislocation.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury is known as a:', '["Monteggia fracture", "Galeazzi fracture", "Smith fracture", "Barton fracture"]', 1, 'Galeazzi: Distal radial fracture + DRUJ dislocation. (Mnemonic: MUGR - Monteggia/Ulna, Galeazzi/Radius).'),
    (v_case_id, 'Galeazzi fractures are sometimes called:', '["Fracture of necessity", "The easy fracture", "The gymnast injury", "None of the above"]', 0, 'It is called a \"fracture of necessity\" because it almost always necessitates surgical fixation (ORIF) in adults due to instability.'),
    (v_case_id, 'True or False: In a Galeazzi fracture, the DRUJ should be assessed for stability after the radius is fixed.', '["True", "False"]', 0, 'If the DRUJ remains unstable after fixing the radius, it may need to be pinned or immobilized in supination.');

    ---------------------------------------------------------------------------
    -- CASE 23: Colles Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dinner Fork Deformity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dinner Fork Deformity', 'A 70-year-old woman with a history of osteoporosis falls on her outstretched hand. Her wrist has a characteristic \"dinner fork\" appearance.

Vitals: Stable.
Physical Examination: Dorsal displacement and tilt of the distal radius; no neurovascular deficits.
Laboratory Results: X-rays show extra-articular distal radius fracture with dorsal angulation.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old with a dorsally displaced distal radius fracture (Colles).', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This fracture is classified as a:', '["Colles fracture", "Smith fracture", "Chauffeur fracture", "Boxer''s fracture"]', 0, 'Colles is the most common distal radius fracture, characterized by dorsal displacement/angulation.'),
    (v_case_id, 'Which associated injury is most common in a Colles fracture?', '["Scaphoid fracture", "Ulnar styloid fracture", "Carpal tunnel syndrome", "Nerve death"]', 1, 'An ulnar styloid fracture occurs in over 50% of Colles fractures.'),
    (v_case_id, 'What is the most likely late complication of a Colles fracture?', '["Mal-union with \"dinner fork\" deformity and loss of grip strength", "Infection", "AVN", "Elbow stiffness"]', 0, 'Poor reduction or loss of reduction in a x-ray can lead to permanent deformity and functional impairment.');

    ---------------------------------------------------------------------------
    -- CASE 24: Smith Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The \"Reverse Colles\"' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The \"Reverse Colles\"', 'A 40-year-old male falls onto a flexed wrist. His wrist has a \"garden spade\" appearance.

Vitals: Stable.
Physical Examination: Volar (ventral) displacement and tilt of the distal radius.
Laboratory Results: X-rays show distal radius fracture with volar angulation.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a volarly displaced distal radius fracture (Smith).', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This fracture is known as a:', '["Colles fracture", "Smith fracture", "Barton fracture", "Die-punch fracture"]', 1, 'Smith fracture is the \"reverse Colles,\" with volar displacement.'),
    (v_case_id, 'Smith fractures are considered __________ stable than Colles fractures.', '["More", "Less", "Equally", "Infinitely"]', 1, 'Smith fractures are inherently more unstable and often require surgical fixation (volar locking plate).'),
    (v_case_id, 'True or False: The mechanism of a Smith fracture is usually a fall on an outstretched hand (FOOSH) with the wrist in extension.', '["True", "False"]', 1, 'Smith is usually a fall onto a FLEXED wrist or a blow to the back of the wrist.');

    ---------------------------------------------------------------------------
    -- CASE 25: Scaphoid Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anatomical Snuffbox Tenderness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anatomical Snuffbox Tenderness', 'A 22-year-old male falls on his outstretched hand. He has pain at the base of his thumb. Initial X-rays in the ED are negative for a fracture.

Vitals: Stable.
Physical Examination: Point tenderness in the anatomical snuffbox. Pain with axial loading of the thumb.
Laboratory Results: Initial X-rays: Negative.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with snuffbox tenderness but negative initial X-rays.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate next step in management?', '["Reassure the patient and discharge", "Thumb spica splint and repeat X-rays in 10-14 days", "Immediate MRI", "Surgery"]', 1, 'Scaphoid fractures are often radiographically occult initially. A \"clinical scaphoid fracture\" (tenderness) must be treated with a thumb spica and re-evaluated.'),
    (v_case_id, 'Which part of the scaphoid is most at risk for Avascular Necrosis (AVN)?', '["Distal pole", "Waist", "Proximal pole", "All are equal"]', 2, 'The scaphoid has a retrograde blood supply; a fracture at the waist or proximal pole can cut off flow to the proximal fragment, leading to AVN or non-union.'),
    (v_case_id, 'The anatomical snuffbox is bounded by which tendons?', '["EPL medially; EPB and APL laterally", "FPL and FCR", "EDC and ECU", "None"]', 0, 'Extensor Pollicis Longus (EPL) and the duo of Extensor Pollicis Brevis (EPB) / Abductor Pollicis Longus (APL).');

    ---------------------------------------------------------------------------
    -- CASE 26: Boxer''s Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Punch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Punch', 'A 24-year-old male presents with hand pain after punching a wall. He has swelling and a \"missing knuckle\" on the ulnar side of his hand.

Vitals: Stable.
Physical Examination: Loss of prominence of the 5th MCP joint; volar angulation of the 5th metacarpal neck.
Laboratory Results: X-ray shows a fracture of the 5th metacarpal neck with 40 degrees of volar angulation.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 5th metacarpal neck fracture after punching a wall.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is commonly known as a:', '["Colles fracture", "Boxer''s fracture", "Bennett fracture", "Rolando fracture"]', 1, 'Boxer''s fracture specifically refers to the 5th metacarpal neck.'),
    (v_case_id, 'What is the acceptable amount of volar angulation for a 5th metacarpal neck fracture?', '["Zero", "Up to 10 degrees", "Up to 40-50 degrees", "Up to 90 degrees"]', 2, 'The 5th CMC joint is very mobile, allowing for significant compensation. Angulation up to 40-50 degrees is often tolerated without functional loss.'),
    (v_case_id, 'When is surgical fixation (ORIF) indicated for a metacarpal fracture?', '["Always", "Any degree of rotational deformity (scissoring)", "Only for professional boxers", "If the patient is under 20"]', 1, 'Rotational deformity (where fingers overlap when making a fist) does NOT compensate and must be corrected surgically.');

    ---------------------------------------------------------------------------
    -- CASE 27: Gamekeeper''s / Skier''s Thumb
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Thumb Instability' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Thumb Instability', 'A skier falls and her thumb is caught in the pole strap, forcing it into abduction. She now has pain and weakness with \"pinching\" or \"grasping\".

Vitals: Stable.
Physical Examination: Tenderness and laxity at the ulnar aspect of the 1st MCP joint.
Laboratory Results: Stress X-rays show > 30 degrees of opening of the joint.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An ulnar collateral ligament (UCL) tear of the thumb after a fall.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury is a tear of which structure?', '["Radial collateral ligament", "Ulnar collateral ligament (UCL)", "Flexor pollicis longus", "Adductor pollicis"]', 1, 'The UCL provides stability to the 1st MCP joint during pinching/grasping.'),
    (v_case_id, 'What is a \"Stener lesion\"?', '["A bone chip", "The adductor aponeurosis getting caught between the torn UCL and its insertion", "A nerve entrapment", "A type of skin rash"]', 1, 'A Stener lesion prevents the ligament from healing and is an absolute indication for surgical repair.'),
    (v_case_id, 'What is the definitive treatment for a complete UCL tear with instability (>30 degrees)?', '["Thumb spica cast for 6 weeks", "Surgical repair", "Buddy taping", "No treatment"]', 1, 'Complete tears with significant instability (or Stener lesions) require surgical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 28: Cervical Spine Clearance
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'To Image or Not to Image?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'To Image or Not to Image?', 'A 30-year-old male is brought to the ED after a minor car accident. He is awake, alert, and sober. He denies neck pain or neurological symptoms.

Vitals: Stable.
Physical Examination: No midline cervical spine tenderness; full painless range of motion of the neck; no focal neuro deficits.
Laboratory Results: N/A.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Applying NEXUS criteria for C-spine clearance.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the NEXUS criteria, does this patient require C-spine imaging?', '["Yes, everyone in an MVC needs a CT", "No, he meets all low-risk criteria", "Only if his insurance covers it", "Only if he is over 65"]', 1, 'NEXUS criteria: 1) No midline tenderness, 2) No focal neuro deficits, 3) Normal alertness, 4) No intoxication, 5) No \"distracting\" injuries. If all are met, imaging is not needed.'),
    (v_case_id, 'Which of the following is a \"distracting injury\" that would mandate imaging?', '["A small bruise on the arm", "A femur fracture", "A mild headache", "Anxiety"]', 1, 'Severe injuries elsewhere can distract the patient from perceiving neck pain.'),
    (v_case_id, 'What is the current \"gold standard\" imaging for C-spine trauma in a high-risk patient?', '["3-view X-ray", "CT scan of the C-spine", "MRI of the C-spine", "Ultrasound"]', 1, 'CT is far more sensitive than X-ray for detecting fractures and is the standard in most trauma centers.');

    ---------------------------------------------------------------------------
    -- CASE 29: Jefferson Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Diving Accident' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Diving Accident', 'A 20-year-old male dives into a shallow pool and hits his head on the bottom. He presents with severe upper neck pain.

Vitals: Stable.
Physical Examination: Midline tenderness at the base of the skull; neurologically intact.
Laboratory Results: Open-mouth odontoid X-ray shows bilateral lateral mass displacement of C1 (total > 7 mm).', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A C1 burst fracture (Jefferson) after an axial load.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury is known as a:', '["Hangman''s fracture", "Jefferson fracture", "Clay-shoveler''s fracture", "Chance fracture"]', 1, 'A Jefferson fracture is a burst fracture of the C1 ring due to axial loading.'),
    (v_case_id, 'Why are Jefferson fractures often neurologically intact?', '["They aren''t", "The burst mechanism actually expands the spinal canal", "C1 is too high for nerves", "Pure luck"]', 1, 'The rings of C1 break and \"burst\" outward, which can actually increase the space for the cord.'),
    (v_case_id, 'A lateral mass displacement > 7 mm on an open-mouth view suggests injury to which structure?', '["Ligamentum flavum", "Transverse Ligament", "Anterior Longitudinal Ligament", "Nuchal ligament"]', 1, 'Involvement of the transverse ligament makes the C1-C2 joint unstable and usually mandates more aggressive management (Halo vest or surgery).');

    ---------------------------------------------------------------------------
    -- CASE 30: Hangman''s Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hyperextension Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hyperextension Injury', 'A 70-year-old man falls and hits his forehead on a table, forcing his neck into extreme hyperextension.

Vitals: Stable.
Physical Examination: Severe neck pain; no neurological deficits.
Laboratory Results: CT shows bilateral fractures through the pedicles (pars interarticularis) of C2.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A C2 pedicle fracture (Hangman''s) after hyperextension.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury is known as a:', '["Jefferson fracture", "Hangman''s fracture", "Odontoid fracture", "Teardrop fracture"]', 1, 'Hangman''s fracture is a fracture of the C2 pars interarticularis, classically caused by hyperextension.'),
    (v_case_id, 'Which traumatic event (besides judicial hanging) most commonly causes this fracture?', '["Axial load from a fall", "High-speed MVC with forehead impact against the dashboard", "Side-impact collision", "Strangulation"]', 1, 'Any high-energy hyperextension event can cause this.'),
    (v_case_id, 'True or False: Like the Jefferson fracture, the Hangman''s fracture is often associated with a \"bursting\" that protects the spinal cord.', '["True", "False"]', 0, 'Spondylolisthesis (forward slippage) of C2 on C3 often expands the canal, leading to the \"Hangman''s Paradox\" where the neck is broken but the cord is spared.');

    ---------------------------------------------------------------------------
    -- CASE 31: Pelvic Fracture - Open Book
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Open Book' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Open Book', 'A 35-year-old male is brought to the trauma bay after being crushed between two cars.

Vitals: BP 85/50 mmHg, HR 130 bpm.
Physical Examination: Pelvis is unstable to lateral compression; blood at the urethral meatus.
Laboratory Results: AP Pelvis X-ray shows symphysis pubis diastasis of 4 cm and disruption of the sacroiliac (SI) joints.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A trauma patient has an unstable \"open book\" pelvic fracture and hypotension.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of life-threatening hemorrhage in this patient?', '["Arterial injury (Internal Iliac)", "Venous plexus in the retroperitoneum", "Spleen laceration", "Fractured bone ends"]', 1, 'While arterial injury occurs, ~85% of pelvic fracture hemorrhage is from the low-pressure venous plexus and raw bone surfaces.'),
    (v_case_id, 'What is the immediate management to stabilize the pelvic volume?', '["Urgent ORIF", "Application of a pelvic binder or sheet", "Laparotomy", "CT scan"]', 1, 'A pelvic binder reduces the pelvic volume, which helps tamponade venous bleeding and provides mechanical stability.'),
    (v_case_id, 'True or False: A symphysis diastasis > 2.5 cm is indicative of ligamentous disruption and mechanical instability.', '["True", "False"]', 0, '2.5 cm is the threshold where the sacrospinous and sacrotuberous ligaments are typically torn.');

    ---------------------------------------------------------------------------
    -- CASE 32: Pelvic Fracture - Hemodynamic Instability
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unstable Pelvis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unstable Pelvis', 'A patient with an open-book pelvic fracture remains hypotensive despite a pelvic binder and 2 units of PRBCs. FAST exam is negative for intraperitoneal fluid.

Vitals: BP 80/40 mmHg.
Physical Examination: Pelvis binder in place.
Laboratory Results: Hb 8.0.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pelvic fracture patient remains hypotensive after a binder and fluids; FAST is negative.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next best step for a hemodynamically unstable pelvic fracture patient with a negative FAST?', '["Diagnostic Peritoneal Lavage (DPL)", "Angiography and embolization", "Pelvic packing in the OR", "Both B and C are valid options depending on institutional protocol"]', 3, 'If FAST is negative, the bleeding is likely retroperitoneal. Angiography (to stop arterial bleeds) or pelvic packing (to stop venous bleeds) are the life-saving steps.'),
    (v_case_id, 'Why is a FAST exam less reliable for detecting pelvic fracture bleeding?', '["It doesn''t look at the pelvis", "The bleeding is retroperitoneal and FAST primarily detects intraperitoneal fluid", "User error", "Air interference"]', 1, 'FAST is excellent for intraperitoneal blood (Spleen/Liver) but poor for retroperitoneal blood (Pelvis).'),
    (v_case_id, 'The classic \"Young-Burgess\" classification system is based on:', '["Bone density", "Mechanism of injury (APC, LC, VS)", "Patient age", "Number of fragments"]', 1, 'APC (Anteroposterior Compression), LC (Lateral Compression), and VS (Vertical Shear).');

    ---------------------------------------------------------------------------
    -- CASE 33: Hip Dislocation - Posterior
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dashboard Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dashboard Injury', 'A 24-year-old male was the unrestrained driver in a head-on collision. His knees hit the dashboard.

Vitals: Stable.
Physical Examination: Right leg is held in adduction, internal rotation, and slight flexion. The leg appears shorter than the left.
Laboratory Results: X-ray shows the femoral head is superior and lateral to the acetabulum.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A posterior hip dislocation after a dashboard injury; limb is in adduction/IR.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common direction for traumatic hip dislocations?', '["Anterior", "Posterior", "Medial (Central)", "Obturator"]', 1, 'Posterior dislocations account for ~90% of traumatic hip dislocations.'),
    (v_case_id, 'Which nerve is most commonly injured in a posterior hip dislocation?', '["Femoral nerve", "Obturator nerve", "Sciatic nerve", "Lateral femoral cutaneous"]', 2, 'The sciatic nerve passes directly posterior to the acetabulum and is at high risk during posterior displacement.'),
    (v_case_id, 'What is the \"golden window\" for reducing a hip dislocation to minimize the risk of AVN?', '["6 hours", "24 hours", "48 hours", "1 week"]', 0, 'The risk of Avascular Necrosis (AVN) of the femoral head increases significantly if the hip remains dislocated for more than 6 hours.');

    ---------------------------------------------------------------------------
    -- CASE 34: Hip Dislocation - Anterior
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rare Dislocation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rare Dislocation', 'A patient presents after a high-energy fall. Their leg is held in marked abduction and external rotation.

Vitals: Stable.
Physical Examination: The hip is abducted and externally rotated; the femoral head is palpable in the groin.
Laboratory Results: X-ray shows the femoral head inferior and medial to the acetabulum.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An anterior hip dislocation; limb is in abduction/ER.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Posterior hip dislocation", "Anterior hip dislocation", "Femoral neck fracture", "Intertrochanteric fracture"]', 1, 'The \"Abduction and External Rotation\" position is the classic hallmark of an anterior dislocation.'),
    (v_case_id, 'Which neurovascular structure is most at risk in an anterior hip dislocation?', '["Sciatic nerve", "Femoral nerve/artery/vein", "Obturator nerve", "Gluteal artery"]', 1, 'The femoral bundle is directly anterior to the hip joint.'),
    (v_case_id, 'True or False: Unlike posterior dislocations, anterior dislocations are rarely associated with acetabular fractures.', '["True", "False"]', 1, 'Both types are high-energy injuries frequently associated with fractures of the acetabulum or femoral head.');

    ---------------------------------------------------------------------------
    -- CASE 35: Hip Dislocation - Complications
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Reduction Check' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Reduction Check', 'You have successfully reduced a posterior hip dislocation under conscious sedation.

Vitals: Stable.
Physical Examination: Hip is stable through range of motion. Patient has weakness in ankle dorsiflexion.
Laboratory Results: Post-reduction CT shows a 2 mm fragment of bone within the joint space.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-reduction of a hip dislocation; patient has a foot drop and intra-articular fragment.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the weakness in ankle dorsiflexion indicate?', '["Femoral nerve injury", "Sciatic nerve injury (Peroneal division)", "Malingering", "Compartment syndrome of the thigh"]', 1, 'Foot drop (loss of dorsiflexion) is the classic presentation of sciatic nerve injury associated with hip dislocation.'),
    (v_case_id, 'What is the indication for surgery in this post-reduction patient?', '["The nerve injury alone", "The presence of a bone fragment in the joint (incarcerated fragment)", "Always for all dislocations", "To prevent pain"]', 1, 'A fragment in the joint will cause rapid cartilage destruction; it must be removed surgically.'),
    (v_case_id, 'True or False: A normal post-reduction X-ray is sufficient to rule out intra-articular fragments.', '["True", "False"]', 1, 'CT is mandatory after every traumatic hip dislocation to look for subtle fractures or incarcerated fragments.');

    ---------------------------------------------------------------------------
    -- CASE 36: Femoral Neck Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Garden Classification' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Garden Classification', 'An 85-year-old woman falls in her bathroom and cannot get up. Her leg is shortened and externally rotated.

Vitals: Stable.
Physical Examination: Pain on any movement of the hip; leg is shortened and externally rotated.
Laboratory Results: X-ray shows a displaced femoral neck fracture.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old with a displaced femoral neck fracture.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Femoral neck fractures are classified as:', '["Extra-capsular", "Intra-capsular", "Sub-trochanteric", "Shaft"]', 1, 'The femoral neck is inside the hip joint capsule.'),
    (v_case_id, 'Why do displaced femoral neck fractures in the elderly often require joint replacement (Hemiarthroplasty) instead of pinning?', '["To make them walk faster", "The risk of Avascular Necrosis (AVN) and non-union is very high due to disrupted blood supply", "It is a cheaper surgery", "Screws don''t work in old bone"]', 1, 'Displacement usually tears the retinacular vessels, cutting off the blood supply to the femoral head.'),
    (v_case_id, 'A Garden Type I fracture is:', '["Completely displaced", "Valgus impacted / Incomplete", "Non-displaced", "Comminuted"]', 1, 'Garden I and II are considered \"non-displaced\" (stable), while III and IV are \"displaced\" (unstable).');

    ---------------------------------------------------------------------------
    -- CASE 37: Intertrochanteric Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Extra-capsular Hip Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Extra-capsular Hip Fracture', 'A 75-year-old male falls. X-rays show a fracture extending between the greater and lesser trochanters.

Vitals: Stable.
Physical Examination: Shortened and externally rotated leg.
Laboratory Results: X-ray shows a fracture outside the capsule but within the trochanteric region.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old with an intertrochanteric hip fracture.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Intertrochanteric fractures are considered __________ than femoral neck fractures.', '["Intra-capsular", "Extra-capsular", "More likely to cause AVN", "Only in children"]', 1, 'Because they are outside the capsule in well-vascularized cancellous bone, the risk of AVN is very low.'),
    (v_case_id, 'What is the standard surgical treatment for a stable intertrochanteric fracture?', '["Total hip replacement", "Sliding Hip Screw (DHS) or Cephalomedullary Nail", "Sling", "Amputation"]', 1, 'The DHS allows the fracture to collapse and compress, promoting healing.'),
    (v_case_id, 'Which hip fracture type is associated with the highest amount of occult blood loss?', '["Femoral neck", "Intertrochanteric", "Greater tuberosity", "None"]', 1, 'Extracapsular fractures can bleed significantly into the soft tissues of the thigh (up to 1.5L), unlike intracapsular fractures which are contained by the capsule.');

    ---------------------------------------------------------------------------
    -- CASE 38: Femoral Shaft Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High Energy Thigh Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High Energy Thigh Trauma', 'A 19-year-old male presents after a high-speed MVC with a grossly deformed thigh.

Vitals: BP 110/70 mmHg, HR 105 bpm.
Physical Examination: Tense, swollen thigh with obvious mid-shaft deformity. Distal pulses are intact.
Laboratory Results: X-ray shows a comminuted mid-shaft femur fracture.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A mid-shaft femur fracture in a young male after an MVC.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the treatment of choice for a femoral shaft fracture in an adult?', '["Long leg cast", "Skeletal traction for 6 weeks", "Intramedullary (IM) Nailing", "Plate and screws"]', 2, 'Reamed IM nailing is the gold standard, allowing early weight-bearing and high union rates.'),
    (v_case_id, 'What is the most common cause of death associated with a femoral shaft fracture?', '["Blood loss", "Fat embolism syndrome", "Infection", "Associated multi-system trauma"]', 3, 'Femur fractures require massive energy; it is the associated injuries (Head, Chest, Abdomen) that are most often fatal.'),
    (v_case_id, 'True or False: Traction is a definitive treatment for femur fractures in adults.', '["True", "False"]', 1, 'Traction is a temporary measure to provide pain relief and restore length before surgery.');

    ---------------------------------------------------------------------------
    -- CASE 39: Slipped Capital Femoral Epiphysis (SCFE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Obese Adolescent' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Obese Adolescent', 'A 13-year-old obese male presents with a 2-month history of dull aching pain in his left knee and a limp. He denies trauma.

Vitals: Stable.
Physical Examination: Left hip is held in external rotation; loss of internal rotation. Pain is reproduced with hip motion, not knee motion.
Laboratory Results: X-ray shows the femoral head is displaced posteriorly and inferiorly relative to the neck (Klein''s line does not intersect the epiphysis).', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An obese 13-year-old with knee pain and loss of hip internal rotation.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Osgood-Schlatter", "Slipped Capital Femoral Epiphysis (SCFE)", "Septic arthritis", "Legg-Calvé-Perthes"]', 1, 'SCFE typically occurs in obese adolescents. Referred pain to the knee is extremely common.'),
    (v_case_id, 'What is the immediate management of a confirmed SCFE?', '["Physical therapy", "Non-weight bearing and urgent surgical pinning in situ", "Reduction and casting", "Observation"]', 1, 'The patient must stop weight-bearing immediately to prevent further slip and be taken to surgery for a single cannulated screw.'),
    (v_case_id, 'True or False: You should attempt to manually reduce the slip before pinning.', '["True", "False"]', 1, 'Manipulation/reduction of a chronic SCFE significantly increases the risk of AVN.');

    ---------------------------------------------------------------------------
    -- CASE 40: Legg-Calvé-Perthes Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painless Limp' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painless Limp', 'A 6-year-old boy is brought in because he has been limping for 3 weeks. He says it doesn''t really hurt.

Vitals: Stable.
Physical Examination: Mildly limited internal rotation and abduction of the hip. No fever, no systemic symptoms.
Laboratory Results: X-ray shows a flattened and sclerotic femoral head epiphysis.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old boy with a painless limp and flattened femoral head.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["SCFE", "Legg-Calvé-Perthes Disease", "Transient Synovitis", "Osteosarcoma"]', 1, 'Perthes is idiopathic AVN of the proximal femoral epiphysis in younger children (typically 4-8 years).'),
    (v_case_id, 'How does the presentation of Perthes differ from SCFE?', '["Perthes is in older kids", "Perthes is usually painless and in younger kids (4-8); SCFE is painful and in older/obese kids (10-15)", "Perthes requires emergency surgery", "There is no difference"]', 1, 'Age and pain level are the primary clinical differentiators.'),
    (v_case_id, 'True or False: Most cases of Perthes in young children (under age 6) can be managed with observation and activity modification.', '["True", "False"]', 0, 'Younger children have more remodeling potential and generally have a better prognosis with conservative management.');

    ---------------------------------------------------------------------------
    -- CASE 41: Tibial Plateau Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bumper Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bumper Injury', 'A 45-year-old pedestrian is struck by a car bumper on the lateral side of his knee.

Vitals: Stable.
Physical Examination: Significant swelling and hemarthrosis of the knee. Stability testing is limited by pain, but there is laxity to varus stress.
Laboratory Results: X-ray shows a depressed fracture of the lateral tibial plateau.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A lateral tibial plateau fracture after a bumper strike.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Tibial plateau fractures are classified using which system?', '["Neer", "Garden", "Schatzker", "Weber"]', 2, 'The Schatzker classification (Types I-VI) is the most common system for plateau fractures.'),
    (v_case_id, 'A lateral tibial plateau fracture is frequently associated with an injury to which ligament?', '["ACL", "MCL", "LCL", "PCL"]', 1, 'The valgus stress that causes a lateral plateau fracture often also tears the Medial Collateral Ligament (MCL).'),
    (v_case_id, 'What is the threshold of articular depression that usually mandates surgical elevation and fixation?', '["1 mm", "> 2-3 mm", "10 mm", "Surgery is never needed"]', 1, 'Articular incongruity > 2-3 mm is generally accepted as an indication for ORIF to prevent rapid post-traumatic arthritis.');

    ---------------------------------------------------------------------------
    -- CASE 42: Tibial Shaft Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Most Common Long Bone Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Most Common Long Bone Fracture', 'A soccer player sustained a mid-shaft tibia fracture during a slide tackle.

Vitals: Stable.
Physical Examination: Obvious deformity; skin is intact. Calf is soft.
Laboratory Results: X-ray shows a displaced transverse mid-shaft tibia fracture.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A mid-shaft tibia fracture in a soccer player.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The tibia is the most common site for which orthopedic emergency?', '["AVN", "Acute Compartment Syndrome", "Fat embolism", "Osteosarcoma"]', 1, 'Because of its narrow compartments and high frequency of high-energy trauma, the tibia is the #1 site for ACS.'),
    (v_case_id, 'What is the gold standard treatment for a displaced tibial shaft fracture in an adult?', '["Long leg cast", "Functional brace", "Intramedullary (IM) Nailing", "External fixation"]', 2, 'IM nailing allows for excellent alignment and early weight-bearing.'),
    (v_case_id, 'True or False: Most isolated tibial shaft fractures can be treated with a cast if they have < 5 degrees of angulation.', '["True", "False"]', 0, 'Conservative management is an option for stable fractures with minimal displacement/angulation.');

    ---------------------------------------------------------------------------
    -- CASE 43: Patellar Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Loss of Extension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Loss of Extension', 'A 50-year-old female falls directly onto her knee. She cannot actively extend her leg against gravity.

Vitals: Stable.
Physical Examination: Palpable gap in the patella; large hemarthrosis.
Laboratory Results: X-ray shows a displaced transverse patellar fracture with 1 cm of separation.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A displaced patellar fracture with loss of the extensor mechanism.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The inability to actively extend the knee indicates disruption of the:', '["ACL", "Extensor mechanism (Quadriceps/Patella/Patellar tendon)", "Hamstrings", "LCL"]', 1, 'The patella is a sesamoid bone that increases the mechanical advantage of the quadriceps.'),
    (v_case_id, 'What is the indication for surgery in a patellar fracture?', '["Any fracture line", "Displacement > 2-3 mm or loss of active extension", "If the patient is over 50", "Pain alone"]', 1, 'If the fragments are separated or the patient cannot extend the knee, surgical repair (usually tension band wiring) is required.'),
    (v_case_id, 'A "bipartite patella" is a common anatomical variant that can be mistaken for a fracture. Where is the extra bone fragment usually located?', '["Superolateral pole", "Inferior pole", "Medial side", "Center"]', 0, 'Bipartite patella is usually smooth-edged and located at the superolateral aspect, helping distinguish it from an acute fracture.');

    ---------------------------------------------------------------------------
    -- CASE 44: Ankle Fracture - Weber Classification
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weber System' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weber System', 'A patient twists her ankle. X-rays show a fibular fracture that is at the level of the syndesmosis.

Vitals: Stable.
Physical Examination: Tenderness over the lateral malleolus.
Laboratory Results: X-ray shows a transverse fibular fracture at the level of the ankle joint.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A fibular fracture at the level of the syndesmosis.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Danis-Weber classification, what type is this?', '["Weber A", "Weber B", "Weber C", "Weber D"]', 1, 'A = below syndesmosis, B = at level of syndesmosis, C = above syndesmosis.'),
    (v_case_id, 'Which Weber type is almost ALWAYS associated with syndesmotic instability and requires surgery?', '["Weber A", "Weber B", "Weber C", "All of them"]', 2, 'Weber C fractures occur above the joint and involve complete disruption of the syndesmosis.'),
    (v_case_id, 'True or False: A Weber B fracture can be treated non-operatively if the medial side (deltoid ligament/medial malleolus) is intact and stable.', '["True", "False"]', 0, 'Stability is determined by the "ring" of the ankle. If only one side is broken and there is no shift, it may be stable.');

    ---------------------------------------------------------------------------
    -- CASE 45: Ankle Fracture - Lauge-Hansen
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mechanism of Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mechanism of Injury', 'An orthopedic surgeon describes an ankle fracture as \"SER 4\".

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Understanding the Lauge-Hansen ankle fracture classification.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does \"SER\" stand for in the Lauge-Hansen system?', '["Sudden External Rotation", "Supination-External Rotation", "Simple Extra-articular Reconstruction", "Slow Eversion Rotation"]', 1, 'The Lauge-Hansen system is based on the position of the foot (Supination/Pronation) and the direction of the force (Abduction/Adduction/ER).'),
    (v_case_id, 'Which Lauge-Hansen pattern is the most common (accounting for ~60-70% of ankle fractures)?', '["SA (Supination-Adduction)", "SER (Supination-External Rotation)", "PA (Pronation-Abduction)", "PER (Pronation-External Rotation)"]', 1, 'SER is the classic \"twisted ankle\" mechanism.'),
    (v_case_id, 'A \"bimalleolar\" ankle fracture involves:', '["Lateral malleolus only", "Medial and Lateral malleoli", "Medial, Lateral, and Posterior malleoli", "Fibular shaft and Tibial plateau"]', 1, 'Bimalleolar fractures are inherently unstable and usually require ORIF.');

    ---------------------------------------------------------------------------
    -- CASE 46: Maisonneuve Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Fibula Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Fibula Fracture', 'A patient has medial ankle pain and swelling after a fall. X-rays of the ankle show a fracture of the medial malleolus and a widened syndesmosis, but the lateral malleolus is intact.

Vitals: Stable.
Physical Examination: Tenderness over the medial ankle AND the proximal fibula (near the knee).
Laboratory Results: Proximal fibula X-ray shows a fracture of the fibular neck.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medial ankle injury associated with a proximal fibula fracture.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This injury complex is known as a:', '["Monteggia fracture", "Maisonneuve fracture", "Galeazzi fracture", "Jones fracture"]', 1, 'A Maisonneuve fracture involves a proximal fibula fracture plus an unstable ankle injury (medial malleolus fracture or deltoid tear + syndesmosis disruption).'),
    (v_case_id, 'Why is it critical to palpate the proximal fibula in all ankle injuries?', '["To check for nerve damage", "To rule out a Maisonneuve fracture which might be missed if you only image the ankle", "To check for knee arthritis", "It isn''t necessary"]', 1, 'If you only X-ray the ankle, you will miss the fibular component and the syndesmotic instability.'),
    (v_case_id, 'What is the treatment for a Maisonneuve fracture?', '["Walking boot", "ORIF of the proximal fibula", "Surgical stabilization of the ankle syndesmosis (syndesmotic screws/buttons)", "Knee brace"]', 2, 'The fibula itself doesn''t need fixing, but the ankle is unstable and requires syndesmotic stabilization.');

    ---------------------------------------------------------------------------
    -- CASE 47: Calcaneus Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lover''s Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lover''s Fracture', 'A 30-year-old man jumps from a second-story balcony to escape a fire and lands on his heels.

Vitals: Stable.
Physical Examination: Severe heel pain, swelling, and ecchymosis extending to the sole of the foot (Mondor''s sign). He also complains of lower back pain.
Laboratory Results: X-ray shows a comminuted fracture of the calcaneus with a decreased Bohler''s angle.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A calcaneus fracture after a fall from height; patient also has back pain.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common associated injury with a high-energy calcaneus fracture?', '["Hip dislocation", "Compression/Burst fracture of the lumbar spine", "Wrist fracture", "Rib fractures"]', 1, 'Axial loading from a fall on the heels often transmits force up the skeleton, causing lumbar spine injuries (Don Juan syndrome).'),
    (v_case_id, 'What is "Bohler''s Angle"?', '["An angle measured on the foot to assess for calcaneal collapse", "The angle of the spine", "The angle of the ankle joint", "None"]', 0, 'A Bohler''s angle < 20 degrees suggests a depressed intra-articular calcaneal fracture.'),
    (v_case_id, 'True or False: Calcaneal fractures are notorious for severe soft tissue swelling and wound healing complications.', '["True", "False"]', 0, 'The thin skin over the heel is very prone to necrosis; surgery is often delayed until the \"wrinkle sign\" appears (indicating swelling has subsided).');

    ---------------------------------------------------------------------------
    -- CASE 48: Lisfranc Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Midfoot Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Midfoot Pain', 'A football player has his foot stepped on while it is planted and flexed. He has severe pain in the midfoot and cannot bear weight.

Vitals: Stable.
Physical Examination: Swelling over the midfoot; plantar ecchymosis (bruising on the sole of the foot).
Laboratory Results: Weight-bearing X-rays show a 4 mm gap between the bases of the 1st and 2nd metatarsals.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A Lisfranc injury (midfoot dislocation) in a football player.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A \"Lisfranc injury\" is a disruption of the:', '["Ankle joint", "Tarsometatarsal (TMT) joint complex", "Subtalar joint", "MCP joint"]', 1, 'It involves the articulation between the cuneiforms/cuboid and the metatarsal bases.'),
    (v_case_id, 'What is the highly specific clinical sign for a Lisfranc injury?', '["Pain on the top of the foot", "Plantar ecchymosis", "Swollen toes", "Inability to move the ankle"]', 1, 'Bruising on the sole of the midfoot is pathognomonic for a Lisfranc injury.'),
    (v_case_id, 'Why are non-weight-bearing X-rays often insufficient for diagnosis?', '["They are too blurry", "The injury may only show displacement when the foot is stressed by weight-bearing", "Insurance doesn''t pay for them", "None"]', 1, 'Subtle instabilities may reduce when not bearing weight; stress views (weight-bearing) are essential.');

    ---------------------------------------------------------------------------
    -- CASE 49: Achilles Tendon Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Pop" in the Calf' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The \"Pop\" in the Calf', 'A 40-year-old \"weekend warrior\" is playing tennis when he feels a sudden \"pop\" and a sensation like someone kicked him in the back of the leg.

Vitals: Stable.
Physical Examination: Palpable gap in the distal calf; unable to perform a single-leg heel raise.
Laboratory Results: N/A.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old with an acute Achilles tendon rupture.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most reliable clinical test for an Achilles tendon rupture?', '["Anterior drawer test", "Thompson test (Squeeze the calf and look for plantarflexion)", "Lachman test", "Homan''s sign"]', 1, 'In a positive Thompson test, squeezing the calf does NOT cause the foot to plantarflex, indicating a complete rupture.'),
    (v_case_id, 'Which class of antibiotics is associated with an increased risk of Achilles tendon rupture?', '["Penicillins", "Fluoroquinolones (e.g., Ciprofloxacin)", "Macrolides", "Tetracyclines"]', 1, 'Fluoroquinolones can cause tendinopathy and increase the risk of rupture, especially in older patients or those on steroids.'),
    (v_case_id, 'True or False: Achilles ruptures can often be managed non-operatively with early functional rehabilitation in a boot.', '["True", "False"]', 0, 'Recent studies show similar outcomes between surgical and non-surgical management for many patients, provided a strict rehab protocol is followed.');

    ---------------------------------------------------------------------------
    -- CASE 50: Stress Fractures
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The March Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The March Fracture', 'A 19-year-old military recruit presents with 2 weeks of worsening foot pain. She has recently increased her daily running distance.

Vitals: Stable.
Physical Examination: Point tenderness over the shaft of the 2nd metatarsal.
Laboratory Results: Initial X-rays are negative for a fracture.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A military recruit with 2nd metatarsal stress fracture.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common location for a stress fracture in the foot?', '["1st metatarsal", "2nd and 3rd metatarsals", "5th metatarsal", "Talus"]', 1, 'The 2nd metatarsal is the most common site due to its rigidity and load-bearing role.'),
    (v_case_id, 'What is the most sensitive imaging modality for an early stress fracture (within the first week)?', '["X-ray", "MRI", "Ultrasound", "Bone scan"]', 1, 'MRI is the gold standard for early detection, showing marrow edema before bone changes are visible on X-ray.'),
    (v_case_id, 'The "Female Athlete Triad" increases the risk for stress fractures. What are its three components?', '["Anemia, Fatigue, Weakness", "Low energy availability (Eating disorder), Amenorrhea, and Osteoporosis", "Hypertension, Obesity, Diabetes", "None"]', 1, 'Low estrogen and poor nutrition lead to decreased bone mineral density and high fracture risk.');

END $$;

COMMIT;
