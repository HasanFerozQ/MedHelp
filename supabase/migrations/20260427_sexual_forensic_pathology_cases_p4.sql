-- Migration: Sexual & Forensic Pathology Cases Part 4 (31-40)
-- Goal: Cover Forensic Pathology: Toxicology, Drowning, and Thermal Injuries
-- Sources: Pathoma, Robbins, Goljan, Forensic Medicine Standards

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'sexual-forensic-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40;

    -- CASE 31: Drowning - Mechanism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Pool Fatality', 'A body is recovered from a freshwater swimming pool. The lungs are heavy, boggy, and contain fine, white froth in the airways.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of death in FRESHWATER drowning?', '["Dehydration", "Ventricular fibrillation due to hemodilution and hyperkalemia", "Pulmonary edema due to hypertonicity", "Infection"]', 1, 'Freshwater is hypotonic to blood. It is rapidly absorbed into the circulation, causing hemodilution, hemolysis, and a surge in potassium that can trigger fatal arrhythmias.'),
    (v_case_id, 'How does SALTWATER drowning differ?', '["It causes hemodilution", "It is hypertonic, drawing fluid into the lungs (pulmonary edema)", "It is safer than freshwater", "It causes immediate cardiac arrest"]', 1, 'Saltwater is hypertonic and draws water OUT of the blood and into the alveoli, causing massive pulmonary edema and hypoxia.'),
    (v_case_id, 'What is "Dry Drowning"?', '["Drowning in a desert", "Death from laryngospasm preventing water from entering the lungs", "Drowning without any froth", "Delayed death after leaving the water"]', 1, 'In about 10-15% of drownings, intense laryngospasm prevents water from entering the lungs, but the victim still dies from asphyxiation.');

    -- CASE 32: Drowning - Diatoms
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The River Mystery', 'A body is found in a river. The forensic pathologist searches for microscopic, silica-walled algae (diatoms) in the bone marrow of the victim.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of finding diatoms in closed organs like the bone marrow?', '["It indicates the body was dumped in water after death", "It suggests the victim was ALIVE and breathing when they entered the water", "It indicates the victim had an infection", "It has no forensic significance"]', 1, 'If a victim is alive, they inhale water containing diatoms, which then enter the circulation and deposit in distant organs (like bone marrow). If the body was dead before entering, diatoms would not reach the bone marrow.'),
    (v_case_id, 'Why are diatoms useful for forensic analysis?', '["They are colorful", "Their silica walls are resistant to acid digestion and decomposition", "They are only found in saltwater", "They grow in the lungs after death"]', 1, 'Diatoms are durable and can be recovered from decomposed bodies after treating the tissues with strong acids.'),
    (v_case_id, 'If a body is found in water with "washerwoman" skin (wrinkled hands), does this prove drowning?', '["Yes", "No, it only proves the body was in water for a significant time", "Only if there is no froth", "Only in children"]', 1, 'Washerwoman skin is a post-mortem change caused by water immersion and occurs regardless of the cause of death.');

    -- CASE 33: Thermal Injuries (Burns)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'House Fire Victim', 'A victim is rescued from a fire. He has large blisters on his chest that are painful to the touch. On his arms, the skin is charred, white, and completely painless.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What classification is the PAINFUL, blistered burn on the chest?', '["First-degree", "Second-degree (Partial thickness)", "Third-degree (Full thickness)", "Fourth-degree"]', 1, 'Second-degree burns involve the epidermis and part of the dermis, causing blisters and significant pain because nerve endings are exposed but intact.'),
    (v_case_id, 'Why is the charred, third-degree burn on the arms PAINLESS?', '["The patient is in shock", "The nerve endings in the dermis have been completely destroyed", "It is a minor burn", "Adrenaline is blocking the pain"]', 1, 'Third-degree (full-thickness) burns destroy the entire dermis, including the sensory nerves.'),
    (v_case_id, 'What is the "Rule of Nines" used for in burn victims?', '["Estimating the depth of the burn", "Estimating the percentage of Total Body Surface Area (TBSA) affected", "Calculating the age of the victim", "Determining the cause of the fire"]', 1, 'The Rule of Nines is a clinical tool used to estimate burn size, which is critical for determining fluid resuscitation needs (Parkland Formula).');

    -- CASE 34: Inhalation Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Smoke Inhalation', 'A firefighter is found dead at the scene of a fire. Autopsy shows soot deep in the trachea and bronchi, and the laryngeal mucosa is severely edematous.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the presence of soot deep in the airways prove?', '["The victim was dead before the fire started", "The victim was ALIVE and breathing during the fire", "The victim was a heavy smoker", "The soot fell into the airway after death"]', 1, 'Soot in the lower respiratory tract is a vital sign indicating the victim was inhaling smoke while alive.'),
    (v_case_id, 'What is the most immediate cause of death in someone trapped in a burning building before the flames reach them?', '["Heat stroke", "Carbon monoxide poisoning and asphyxiation", "Cardiac arrest", "Fear"]', 1, 'Most fire victims die from smoke inhalation (CO/Cyanide poisoning and low oxygen) rather than thermal burns.'),
    (v_case_id, 'What is "pugilistic posture" in a fire victim?', '["A sign of a struggle before death", "A post-mortem artifact caused by heat-induced contraction of muscle proteins", "A sign of a contact gunshot wound", "A neurological reflex"]', 1, 'The heat causes the muscles (especially the flexors) to contract and shorten, resulting in a "boxer-like" (pugilistic) pose. It is NOT a sign of a struggle.');

    -- CASE 35: Electrical Injuries
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lightning Strike', 'A man is found dead under a tree after a thunderstorm. His skin shows a delicate, fern-like pattern of redness (Lichtenberg figures).', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of IMMEDIATE death from an electric shock or lightning strike?', '["Severe burns", "Cardiac arrhythmia (ventricular fibrillation)", "Renal failure", "Brain damage"]', 1, 'The electric current disrupts the heart''s electrical system, leading to immediate arrest.'),
    (v_case_id, 'Are Lichtenberg figures true burns?', '["Yes, third-degree", "No, they are a transient skin reaction to the electric discharge", "Yes, they are permanent scars", "Only if the person survives"]', 1, 'Lichtenberg figures are not true burns; they are transient markings that usually disappear within 24 hours in survivors.'),
    (v_case_id, 'If a person is electrocuted by a low-voltage household current, what determines the severity of the internal injury?', '["The color of the wire", "The resistance of the skin (dry vs wet)", "The size of the room", "The person''s age"]', 1, 'Wet skin has much lower resistance than dry skin, allowing more current to pass into the body, which is much more dangerous.');

    -- CASE 36: Hypothermia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Winter Exposure', 'A homeless man is found dead in an alley during a blizzard. He is found partially undressed, despite the freezing temperatures. Autopsy shows small, dark-brown erosions in the stomach mucosa (Wischnewsky spots).', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the "undressing" behavior seen in some hypothermia victims?', '["Post-mortem stripping", "Paradoxical undressing", "Homicidal tampering", "Delirium"]', 1, 'In severe hypothermia, the victim may feel a sudden sensation of extreme heat due to the failure of peripheral vasoconstriction, leading them to strip off their clothes.'),
    (v_case_id, 'What is the forensic significance of Wischnewsky spots?', '["They indicate poisoning", "They are a hallmark of fatal hypothermia", "They indicate a stomach ulcer", "They are a sign of decomposition"]', 1, 'Wischnewsky spots are superficial, hemorrhagic gastric erosions found in about 75% of hypothermia fatalities.'),
    (v_case_id, 'What is the "Hide-and-Die" syndrome?', '["A form of suicide", "Terminal burrowing behavior in hypothermia victims", "A type of drowning", "Fear of being found"]', 1, 'Many hypothermia victims are found in small, enclosed spaces (under beds, in closets) because of a primitive instinct to burrow or find shelter as they become terminal.');

    -- CASE 37: Cyanide Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Bitter Almond Scent', 'A lab worker is found dead. During the autopsy, the pathologist notices a distinct "bitter almond" odor when opening the chest cavity. The blood is bright red.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of Cyanide toxicity?', '["Inhibition of hemoglobin", "Inhibition of Cytochrome c oxidase in the mitochondria", "Activation of GABA", "Destruction of the liver"]', 1, 'Cyanide binds to the iron in cytochrome c oxidase, stopping the electron transport chain and preventing the cell from using oxygen (histotoxic hypoxia).'),
    (v_case_id, 'Why is the venous blood bright red in cyanide poisoning?', '["It is highly oxygenated because the tissues cannot use the oxygen", "Cyanide turns blood into paint", "It is caused by CO binding", "It is an artifact of death"]', 0, 'Since the cells cannot utilize oxygen, the oxygen remains in the blood as it returns to the heart, making the venous blood look arterial.'),
    (v_case_id, 'Which vitamin is used as a safe antidote for cyanide poisoning by binding to it to form cyanocobalamin?', '["Vitamin C", "Vitamin B12 (Hydroxocobalamin)", "Vitamin K", "Vitamin D"]', 1, 'Hydroxocobalamin binds cyanide to form B12, which is then excreted by the kidneys.');

    -- CASE 38: Arsenic Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chronic Poisoning', 'A woman presents with hyperpigmentation, hyperkeratosis of the palms and soles, and white transverse lines on her fingernails (Mees'' lines).', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic "garlic-like" odor associated with?', '["Lead", "Arsenic", "Mercury", "Cyanide"]', 1, 'Arsenic poisoning often imparts a garlic-like odor to the breath or tissues.'),
    (v_case_id, 'Arsenic exposure is a major risk factor for which types of cancer?', '["Angiosarcoma of the liver, Lung cancer, and Squamous cell carcinoma of the skin", "Colon cancer", "Brain cancer", "Prostate cancer"]', 0, 'Arsenic is a potent multi-organ carcinogen, classically linked to liver angiosarcoma and skin/lung cancers.'),
    (v_case_id, 'How does arsenic interfere with cellular metabolism?', '["It inhibits glycolysis", "It inhibits lipoic acid, a cofactor for pyruvate dehydrogenase", "It destroys ribosomes", "It blocks calcium channels"]', 1, 'Arsenic inhibits pyruvate dehydrogenase by binding to lipoic acid, shutting down the TCA cycle.');

    -- CASE 39: Lead Poisoning (Plumbism)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Abdominal Pain and Anemia', 'A child living in an old apartment with peeling paint presents with abdominal pain (colic), irritability, and a microcytic anemia with "basophilic stippling" on the blood smear.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which enzymes in the heme synthesis pathway does lead inhibit?', '["ALAS and Ferrochelatase", "ALAD (delta-aminolevulinic acid dehydratase) and Ferrochelatase", "Porphobilinogen deaminase", "Uroporphyrinogen decarboxylase"]', 1, 'Lead inhibits ALAD and ferrochelatase, leading to the accumulation of protoporphyrin and iron.'),
    (v_case_id, 'What is the term for the dark lines seen at the gingival margins in lead poisoning?', '["Linezolid lines", "Burton lines", "Mees'' lines", "Roth spots"]', 1, 'Burtonian lines are bluish-purple lines on the gums caused by lead reacting with sulfur-producing bacteria in the mouth.'),
    (v_case_id, 'What is the characteristic radiographic finding in children with chronic lead poisoning?', '["Punched-out lesions", "Lead lines (increased density) in the metaphyses of long bones", "Fractures", "Bowing of the legs"]', 1, 'Lead deposits in the growth plates, appearing as dense lines on X-ray.');

    -- CASE 40: Ethanol Intoxication
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Fatal Car Crash', 'A driver is killed in a high-speed collision. Autopsy reveals a blood alcohol concentration (BAC) of 0.25%. The liver is enlarged, yellow, and greasy.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first stage of alcoholic liver disease seen in this victim?', '["Cirrhosis", "Alcoholic hepatitis", "Steatosis (Fatty change)", "Hepatocellular carcinoma"]', 2, 'Steatosis (fatty liver) is the earliest and reversible stage of alcoholic liver injury.'),
    (v_case_id, 'Which enzyme is responsible for the primary metabolism of ethanol in the liver?', '["Alcohol dehydrogenase", "Acetaldehyde dehydrogenase", "Catalase", "CYP2E1"]', 0, 'Alcohol dehydrogenase converts ethanol to acetaldehyde. Acetaldehyde dehydrogenase then converts it to acetate.'),
    (v_case_id, 'What is the mechanism of "zero-order kinetics" in ethanol metabolism?', '["The more you drink, the faster you clear it", "Metabolism occurs at a constant rate regardless of concentration", "Metabolism is proportional to the concentration", "It is only metabolized in the lungs"]', 1, 'Ethanol is cleared at a constant rate (about 15-20 mg/dL per hour) because the enzymes are easily saturated.');

    RAISE NOTICE 'SUCCESS: Sexual & Forensic Pathology Cases Part 4 (31-40) registered.';
END $$;

COMMIT;
