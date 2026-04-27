-- Migration: Sexual & Forensic Pathology Cases Part 3 (21-30)
-- Goal: Cover Forensic Pathology: Injury and Death Investigation
-- Sources: Pathoma, Robbins, Goljan, Forensic Medicine Standards

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'sexual-forensic-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30;

    -- CASE 21: Time of Death (Mortis triad)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Estimating Time of Death', 'A body is found in a park. The muscles are stiff (cannot be moved), and there is purple discoloration on the back that does not blanch with pressure.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the stiffening of the muscles after death?', '["Livor mortis", "Rigor mortis", "Algor mortis", "Putrefaction"]', 1, 'Rigor mortis is the post-mortem stiffening of muscles due to the depletion of ATP, preventing the dissociation of actin and myosin.'),
    (v_case_id, 'The purple discoloration on the back that DOES NOT blanch indicates which of the following?', '["Algor mortis", "Fixed livor mortis", "Bruising from a fall", "Cyanosis"]', 1, 'Livor mortis is the settling of blood in dependent parts. Once it becomes "fixed" (usually after 8-12 hours), the blood has leaked into the tissues and will not shift or blanch.'),
    (v_case_id, 'If the body temperature is significantly lower than ambient temperature, which process is occurring?', '["Hyperthermia", "Algor mortis", "Rigor mortis", "Saponification"]', 1, 'Algor mortis is the cooling of the body after death until it reaches environmental temperature.');

    -- CASE 22: Blunt Force Trauma - Contusions
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Multi-Colored Bruise', 'A child is brought in with several bruises. One bruise on the shoulder is yellow-green, while another on the thigh is purple-blue.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the forensic term for a bruise?', '["Abrasion", "Contusion", "Laceration", "Incised wound"]', 1, 'A contusion is an injury to the subcutaneous tissue caused by blunt force that ruptures blood vessels but leaves the overlying skin intact.'),
    (v_case_id, 'What does the yellow-green color of the shoulder bruise indicate?', '["Recent injury (minutes ago)", "Infection", "Injury occurred several days ago (breakdown of hemoglobin)", "The child has jaundice"]', 2, 'As a bruise heals, hemoglobin breaks down into biliverdin (green) and then bilirubin/hemosiderin (yellow), allowing for a rough estimation of the age of the injury.'),
    (v_case_id, 'The presence of bruises of different ages in a child should raise suspicion for what?', '["Coagulopathy", "Non-accidental trauma (Child Abuse)", "Frequent falls", "Leukemia"]', 1, 'Bruises in various stages of healing (different colors) on non-bony prominences are a major red flag for physical abuse.');

    -- CASE 23: Laceration vs. Incised Wound
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Scalp Injury', 'An unconscious man is found with a 5 cm gap in his scalp. The edges are irregular and "bridged" by intact nerves and blood vessels. There is an abrasion at the margin.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would you classify this wound?', '["Incised wound", "Laceration", "Stab wound", "Puncture"]', 1, 'A laceration is a blunt force injury where the skin is torn. Key features are irregular edges and "tissue bridging" (nerves/vessels/connective tissue remaining intact across the gap).'),
    (v_case_id, 'How does an INCISED wound differ from a laceration?', '["It is caused by blunt force", "It has clean, sharp edges with no tissue bridging", "It is deeper than it is long", "It always has a bruise around it"]', 1, 'An incised wound (cut) is caused by a sharp object. It lacks tissue bridging and the edges are clean-cut.'),
    (v_case_id, 'What is the term for a wound that is deeper than it is long?', '["Abrasion", "Laceration", "Stab wound", "Chop wound"]', 2, 'A stab wound is a specialized sharp-force injury that penetrates deeper into the body than its length on the skin surface.');

    -- CASE 24: Gunshot - Entrance vs. Exit
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Shooting Victim', 'A body is found with two gunshot wounds. Wound A is small, circular, and has an "abrasion ring" around it. Wound B is large, irregular, and has "everted" edges.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which wound is likely the ENTRANCE wound?', '["Wound A", "Wound B", "Both", "Neither"]', 0, 'Entrance wounds are typically smaller, circular, and have an "abrasion collar/ring" where the bullet rubbed against the skin edge as it entered.'),
    (v_case_id, 'What is the characteristic feature of an EXIT wound?', '["It has an abrasion ring", "It is usually smaller than the entrance wound", "It is often irregular/stellate and LACKS an abrasion ring", "It always has soot"]', 2, 'Exit wounds are typically larger, more irregular (shored), and importantly, they do not have an abrasion ring.'),
    (v_case_id, 'If Wound A was in the head and showed a "stellate" (star-shaped) tearing of the skin, what would that suggest about the range of fire?', '["Distant shot (> 3 feet)", "Contact shot over bone", "Intermediate shot (1 foot)", "The gun was silencer-equipped"]', 1, 'In a contact shot over bone (like the skull), gas from the muzzle flash expands under the skin, causing it to rip in a stellate fashion.');

    -- CASE 25: Range of Fire (Soot vs. Tattooing)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Determining Range', 'A gunshot wound on a chest shows a central hole surrounded by numerous small, red-brown "dots" or "specks" embedded in the skin (tattooing) but NO black soot.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the forensic term for these small specks?', '["Soot", "Gunpowder stippling (tattooing)", "Burn marks", "Abrasions"]', 1, 'Stippling (tattooing) is caused by unburned or partially burned gunpowder particles striking and embedding in the skin.'),
    (v_case_id, 'What range of fire does "tattooing" indicate?', '["Contact", "Intermediate (usually 1/2 inch to 3 feet)", "Distant (> 3 feet)", "Indeterminate"]', 1, 'Tattooing is the hallmark of an intermediate-range shot. If soot is also present, it is a "close-range" shot (within inches).'),
    (v_case_id, 'If there is NO soot and NO tattooing, what is the classification of the range?', '["Contact", "Intermediate", "Distant", "Close"]', 2, 'A distant shot is one where only the bullet reaches the target, and all muzzle discharge (soot and powder) falls away before reaching the victim.');

    -- CASE 26: Stab Wounds and Manner of Death
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Kitchen Knife Incident', 'A woman is found dead with a single stab wound to the heart. The wound is 2 cm long, with one blunt end and one sharp end.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "one blunt and one sharp end" of the wound suggest about the weapon?', '["It was a double-edged dagger", "It was a single-edged knife (like a kitchen knife)", "It was a screwdriver", "It was an ice pick"]', 1, 'A single-edged blade creates a "teardrop" or "wedge" shaped wound with one blunt margin (from the spine of the knife) and one sharp margin (from the cutting edge).'),
    (v_case_id, 'If the autopsy reveals the depth of the wound track is 10 cm, but the knife blade found nearby is only 8 cm long, is this possible?', '["No, the knife must be longer than the wound", "Yes, if the skin and underlying tissues were compressed during the stabbing", "No, it must be a different weapon", "Only if the knife was heated"]', 1, 'Tissue compression (especially in the abdomen or chest) can result in a wound track that is deeper than the actual length of the blade.'),
    (v_case_id, 'Which of the following is considered a "Manner of Death"?', '["Stab wound to the heart", "Exsanguination", "Homicide", "Myocardial infarction"]', 2, 'The Manner of Death is a legal classification (Homicide, Suicide, Accidental, Natural, or Undetermined). The Cause of Death is the actual injury or disease (e.g., Stab wound).');

    -- CASE 27: Defense Wounds
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Struggle', 'A murder victim is found with multiple incised wounds on the palms of the hands and the outer surfaces of the forearms.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the forensic significance of these wounds?', '["They are self-inflicted (suicidal)", "They are \"defense wounds\" indicating an attempt to ward off a sharp weapon", "They are accidental", "They are post-mortem artifacts"]', 1, 'Defense wounds are typically found on the palms (grabbing the blade) or forearms (blocking the attack) and indicate the victim was conscious and struggling.'),
    (v_case_id, 'Are defense wounds typically found in suicides?', '["Yes, always", "No, their presence strongly suggests homicide", "Only if the person is hesitant", "Yes, on the wrists"]', 1, 'Defense wounds indicate a struggle against an assailant, making them a hallmark of homicide.'),
    (v_case_id, 'What are \"hesitation marks\" in the context of a sharp-force death?', '["Wounds made by the assailant to scare the victim", "Superficial, parallel cuts near a deep fatal wound, suggesting suicide", "Bruises from a struggle", "Signs of decomposition"]', 1, 'Hesitation marks are shallow, preliminary cuts (often on the wrists or neck) made by a person before committing to the fatal suicidal act.');

    -- CASE 28: Asphyxiation - Hanging vs. Strangulation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Ligature Marks', 'A body is found with a ligature mark around the neck. The mark is horizontal, completely circles the neck, and is located below the thyroid cartilage.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the horizontal, low-placed mark suggest?', '["Judicial hanging", "Ligature strangulation (Homicide)", "Suicidal hanging", "Natural death"]', 1, 'In hangings (suicide), the mark is usually V-shaped and rises toward the point of suspension. A horizontal, circular mark below the larynx is highly suspicious for manual or ligature strangulation (homicide).'),
    (v_case_id, 'What is the characteristic autopsy finding in the eyes of a strangulation victim?', '["Cataracts", "Petechial hemorrhages (Tardieu spots) in the conjunctiva", "Glaucoma", "Retinal detachment"]', 1, 'Petechiae are caused by the rupture of small vessels due to the sudden increase in venous pressure above the point of neck compression.'),
    (v_case_id, 'Fracture of which bone in the neck is classically associated with manual strangulation?', '["Cervical vertebrae", "Hyoid bone", "Clavicle", "Mandible"]', 1, 'While not always present, a fractured hyoid bone is a classic forensic indicator of manual strangulation, especially in older victims.');

    -- CASE 29: Carbon Monoxide Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Garage Incident', 'A man is found dead in his car inside a closed garage. His skin and internal organs show a vibrant, "cherry-red" color.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of the cherry-red discoloration?', '["Cyanide poisoning", "Carbon monoxide (CO) poisoning", "Nitrite poisoning", "Hypothermia"]', 1, 'CO binds to hemoglobin with 200x the affinity of oxygen, forming carboxyhemoglobin, which has a distinct cherry-red color.'),
    (v_case_id, 'How does CO cause death at the cellular level?', '["Inhibition of glycolysis", "Inhibition of the electron transport chain (Cytochrome c oxidase)", "Competitive inhibition of oxygen binding to hemoglobin and Shift of the dissociation curve to the left", "Rupture of red blood cells"]', 2, 'CO kills by preventing oxygen delivery (binding to Hb) and preventing oxygen release to tissues (left shift of the curve). It also binds to cytochrome oxidase.'),
    (v_case_id, 'If the body showed "bright pink" livor mortis but NOT cherry-red organs, and was found in a freezer, what would be the cause?', '["CO poisoning", "Hypothermia", "Cyanide", "Hydrogen sulfide"]', 1, 'Hypothermia can also cause a bright pink livor mortis because oxygen stays bound to hemoglobin in the cold, but it lacks the systemic cherry-red organ change of CO/Cyanide.');

    -- CASE 30: Decomposition
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The "Bloated" Body', 'A body is recovered from a warm room after 3 days. The abdomen is distended with gas, the skin is greenish-black, and there is a foul odor.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the breakdown of tissues by bacterial action after death?', '["Autolysis", "Putrefaction", "Adipocere formation", "Mummification"]', 1, 'Putrefaction is the decomposition of organic matter by microorganisms (especially gut bacteria like C. welchii), producing gases and discoloration.'),
    (v_case_id, 'What is "Autolysis"?', '["Breakdown of tissues by bacteria", "Self-digestion of tissues by cellular enzymes", "Drying of the body", "Stiffening of the body"]', 1, 'Autolysis is the sterile breakdown of cells by their own internal enzymes (e.g., in the pancreas or stomach).'),
    (v_case_id, 'If a body is found in a cold, damp environment and the fat has turned into a waxy, soap-like substance, what is this called?', '["Mummification", "Adipocere (Grave Wax)", "Saponification", "Marbling"]', 1, 'Adipocere is the conversion of fatty tissue into a firm, waxy substance in anaerobic, moist conditions.');

    RAISE NOTICE 'SUCCESS: Sexual & Forensic Pathology Cases Part 3 (21-30) registered.';
END $$;

COMMIT;
