BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Congenital Heart Disease
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-congenital-heart' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-congenital-heart" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Fetal Circulation (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'In Utero Hemodynamics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'In Utero Hemodynamics', 'A medical student is reviewing how blood bypasses the high-resistance fetal lungs.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student is reviewing how blood bypasses the high-resistance fetal lungs.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which structure shunts oxygenated blood from the placenta away from the fetal liver directly into the IVC?', '["Foramen Ovale", "Ductus Venosus", "Ductus Arteriosus", "Umbilical Artery"]', 1, 'The ductus venosus bypasses the liver to deliver oxygenated blood more directly to the heart.'),
    (v_case_id, 'What structure allows blood to flow from the right atrium directly into the left atrium in the fetus?', '["PDA", "Foramen Ovale", "VSD", "None"]', 1, 'The foramen ovale shunts blood right-to-left to bypass the non-functional fetal lungs.'),
    (v_case_id, 'The Ductus Arteriosus shunts blood from the Pulmonary Artery to the:', '["Left Atrium", "Aorta", "IVC", "None"]', 1, 'The PDA diverts blood from the pulmonary circuit to the systemic circuit due to high pulmonary vascular resistance (PVR).');

    ---------------------------------------------------------------------------
    -- CASE 02: Transition at Birth (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Breath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Breath', 'Immediately after birth, a newborn takes its first breath and the umbilical cord is clamped.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Immediately after birth, a newborn takes its first breath and the umbilical cord is clamped.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What happens to the Pulmonary Vascular Resistance (PVR) when the lungs expand with air?', '["It increases", "It drops significantly", "No change", "None"]', 1, 'Oxygenation and expansion cause vasodilation, lowering PVR.'),
    (v_case_id, 'What happens to Systemic Vascular Resistance (SVR) after the placenta is removed?', '["It drops", "It increases", "No change", "None"]', 1, 'Clamping the low-resistance placenta causes a sudden rise in SVR.'),
    (v_case_id, 'What primary factor triggers the closure of the Ductus Arteriosus?', '["Low oxygen", "Increased arterial oxygen (PaO2) and decreased Prostaglandins", "Higher pressure in the right heart", "None"]', 1, 'Post-birth oxygenation inhibits the prostaglandin-mediated patency of the duct.');

    ---------------------------------------------------------------------------
    -- CASE 03: VSD - Ventricular Septal Defect (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Most Common Hole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Most Common Hole', 'A 4-week-old infant has a harsh, pansystolic murmur heard best at the left lower sternal border.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Most Common Hole', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["ASD", "VSD", "TOF", "PDA"]', 1, 'VSD is the most common congenital heart defect and presents with a harsh holosystolic murmur.'),
    (v_case_id, 'Does a smaller VSD typically produce a louder or softer murmur than a large VSD?', '["Softer", "Louder (due to higher turbulence across the small opening)", "Same", "None"]', 1, 'Smaller defects create more turbulence and thus a more intense murmur.'),
    (v_case_id, 'Why does a VSD NOT typically produce a murmur in the first day of life?', '["The heart is too small", "PVR is still high, so there is little pressure difference between the ventricles", "It hasn''t formed yet", "None"]', 1, 'As PVR drops over the first few weeks, the left-to-right shunt increases, making the murmur audible.');

    ---------------------------------------------------------------------------
    -- CASE 04: ASD - Atrial Septal Defect (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fixed Split' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fixed Split', 'A 5-year-old child is noted to have a widely split S2 that does NOT change with respiration.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fixed Split', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["VSD", "ASD (Atrial Septal Defect)", "Aortic Stenosis", "PDA"]', 1, 'A \"fixed split S2\" is the pathognomonic finding for an ASD.'),
    (v_case_id, 'What is the most common type of ASD?', '["Ostium primum", "Ostium secundum", "Sinus venosus", "None"]', 1, 'Ostium secundum defects account for the majority of ASDs.'),
    (v_case_id, 'Are children with ASD typically symptomatic in early childhood?', '["Yes, severe failure", "No, most are asymptomatic and the defect is found during routine physicals", "They are always blue", "None"]', 1, 'ASD is often a subtle finding in childhood.');

    ---------------------------------------------------------------------------
    -- CASE 05: PDA - Patent Ductus Arteriosus (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Machine Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Machine Murmur', 'A premature infant has a continuous, \"machine-like\" murmur at the left infraclavicular area and bounding peripheral pulses.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A premature infant has a continuous, \"machine-like\" murmur at the left infraclavicular area and bounding peripheral pulses.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["VSD", "ASD", "PDA (Patent Ductus Arteriosus)", "TOF"]', 2, 'The continuous murmur is due to blood flowing from the high-pressure aorta to the low-pressure pulmonary artery throughout the cardiac cycle.'),
    (v_case_id, 'What medication can be used to pharmacologically CLOSE a PDA in a premature infant?', '["Prostaglandin E1", "Indomethacin or Ibuprofen (NSAIDs)", "Aspirin", "Epinephrine"]', 1, 'NSAIDs inhibit prostaglandin synthesis, promoting ductal closure.'),
    (v_case_id, 'What condition is associated with an increased risk of PDA in full-term infants?', '["Down Syndrome", "Congenital Rubella Syndrome", "Turner Syndrome", "None"]', 1, 'Maternal rubella infection is a classic risk factor for PDA.');

    ---------------------------------------------------------------------------
    -- CASE 06: AVSD - Atrioventricular Septal Defect (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Common Canal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Common Canal', 'A newborn with Trisomy 21 has a murmur and is showing signs of early heart failure.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Common Canal', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["VSD only", "Atrioventricular Septal Defect (AVSD/Endocardial Cushion Defect)", "TOF", "None"]', 1, 'AVSD is the most common cardiac defect in children with Down Syndrome.'),
    (v_case_id, 'What is a hallmark finding on ECG for AVSD?', '["Right axis deviation", "Left axis deviation (Superior QRS axis)", "T-wave inversion", "None"]', 1, 'Superior QRS axis is a strong clue for endocardial cushion defects.'),
    (v_case_id, 'Why do these patients develop heart failure so early?', '["They have no heart", "Large left-to-right shunt and potentially common AV valve regurgitation", "Small heart", "None"]', 1, 'The combined atrial and ventricular shunts lead to rapid volume overload.');

    ---------------------------------------------------------------------------
    -- CASE 07: Tetralogy of Fallot - TOF (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Boot-Shaped Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Boot-Shaped Heart', 'A 6-month-old becomes blue while crying. A chest X-ray shows a small, upturned heart apex.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-month-old becomes blue while crying. A chest X-ray shows a small, upturned heart apex.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the four components of Tetralogy of Fallot?', '["ASD, VSD, PS, RVH", "VSD, Pulmonic Stenosis, Overriding Aorta, and Right Ventricular Hypertrophy (RVH)", "PDA, TGA, VSD, PS", "None"]', 1, 'This classic tetrad defines the condition.'),
    (v_case_id, 'What determines the degree of cyanosis in TOF?', '["Size of the VSD", "Severity of Pulmonic (Subpulmonary) Stenosis", "Position of the aorta", "None"]', 1, 'The degree of right-to-left shunting is directly related to the severity of the obstruction to pulmonary flow.'),
    (v_case_id, 'What is the classic X-ray description of TOF?', '["Snowman heart", "Coeur en sabot (Boot-shaped heart)", "Egg-on-a-string", "None"]', 1, 'The upturned apex is due to RVH.');

    ---------------------------------------------------------------------------
    -- CASE 08: Transposition of the Great Arteries - TGA (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Parallel Circuits' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Parallel Circuits', 'A 1-day-old neonate has severe cyanosis that does not improve with 100% oxygen. The heart sounds are normal.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 1-day-old neonate has severe cyanosis that does not improve with 100% oxygen. The heart sounds are normal.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["TOF", "Transposition of the Great Arteries (TGA)", "VSD", "PDA"]', 1, 'TGA is the most common cause of cyanosis in the first 24 hours of life.'),
    (v_case_id, 'Why is TGA incompatible with life unless a shunt is present?', '["The heart stops", "The systemic and pulmonary circuits run in parallel rather than in series", "The lungs are dead", "None"]', 1, 'Mixing must occur (via ASD, VSD, or PDA) for oxygenated blood to reach the body.'),
    (v_case_id, 'What is the classic X-ray finding for TGA?', '["Boot-shaped", "Egg-on-a-string (narrow mediastinum due to stress/thymus)", "Snowman", "None"]', 1, 'The narrow base of the heart is due to the parallel arrangement of the vessels.');

    ---------------------------------------------------------------------------
    -- CASE 09: Coarctation of the Aorta (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'BP Differentials' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'BP Differentials', 'A 12-year-old is found to have a blood pressure of 140/90 in the right arm and 90/60 in the leg.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old is found to have a blood pressure of 140/90 in the right arm and 90/60 in the leg.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PDA", "Coarctation of the Aorta", "VSD", "None"]', 1, 'Narrowing of the aorta distal to the left subclavian leads to high upper-body and low lower-body pressures.'),
    (v_case_id, 'What classic X-ray finding is seen in older children with coarctation?', '["Snowman sign", "Rib notching (due to collateral intercostal flow)", "Boot-shaped heart", "None"]', 1, 'Pressure from dilated collateral vessels erodes the underside of the ribs.'),
    (v_case_id, 'What chromosomal syndrome is strongly associated with coarctation of the aorta?', '["Down Syndrome", "Turner Syndrome (45,X)", "DiGeorge", "None"]', 1, 'Coarctation and Bicuspid Aortic Valve are common in Turner patients.');

    ---------------------------------------------------------------------------
    -- CASE 10: Hypoplastic Left Heart Syndrome - HLHS (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ductal-Dependent Systemic Flow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ductal-Dependent Systemic Flow', 'A 4-day-old becomes pale, lethargic, and has barely palpable pulses in all extremities as the PDA closes.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-day-old becomes pale, lethargic, and has barely palpable pulses in all extremities as the PDA closes.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sepsis", "Hypoplastic Left Heart Syndrome (HLHS)", "PDA", "None"]', 1, 'HLHS involves an underdeveloped left ventricle; systemic flow depends entirely on the PDA.'),
    (v_case_id, 'What is the immediate life-saving treatment?', '["Antibiotics", "Prostaglandin E1 (Alprostadil) to reopen the duct", "Immediate surgery", "None"]', 1, 'Keeping the duct open is the priority for stabilization.'),
    (v_case_id, 'What is the name of the first stage of the 3-stage surgical repair for HLHS?', '["Fontan", "Norwood Procedure", "Glenn", "None"]', 1, 'The Norwood is the most complex first step.');

    ---------------------------------------------------------------------------
    -- CASE 11: Hypercyanotic Spells - Tet Spells (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tet Spell' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tet Spell', 'A child with TOF becomes cyanotic and starts hyperventilating while having a tantrum.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tet Spell', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first physical maneuver to perform?', '["CPR", "Knee-to-chest position", "Hold the child flat", "None"]', 1, 'This increases SVR and reduces the right-to-left shunt.'),
    (v_case_id, 'How does the knee-to-chest position help?', '["It makes them stop crying", "It increases systemic vascular resistance, forcing more blood through the lungs", "It stops the heart", "None"]', 1, 'Mechanically increasing afterload improves pulmonary flow.'),
    (v_case_id, 'Which medication is commonly used to calm the patient and break the spell?', '["Epinephrine", "Morphine", "Adenosine", "None"]', 1, 'Morphine reduces the infundibular spasm and respiratory drive.');

    ---------------------------------------------------------------------------
    -- CASE 12: DiGeorge Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'CATCH-22' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'CATCH-22', 'A neonate has a cleft palate, low-set ears, and is found to have an interrupted aortic arch.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate has a cleft palate, low-set ears, and is found to have an interrupted aortic arch.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What syndrome should be suspected?', '["Turner", "DiGeorge Syndrome (22q11.2 deletion)", "Down", "None"]', 1, 'DiGeorge is associated with conotruncal heart defects.'),
    (v_case_id, 'Which heart defect is most strongly associated with DiGeorge?', '["ASD", "Truncus Arteriosus or Interrupted Aortic Arch", "VSD", "None"]', 1, 'These complex defects are classic for 22q11 deletion.'),
    (v_case_id, 'What metabolic abnormality is common in the neonatal period in DiGeorge?', '["Hypercalcemia", "Hypocalcemia (due to parathyroid hypoplasia)", "Hypoglycemia", "None"]', 1, 'Parathyroid absence leads to severe low calcium and seizures.');

    ---------------------------------------------------------------------------
    -- CASE 13: Kawasaki Disease (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Strawberry Tongue and Fever' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Strawberry Tongue and Fever', 'A 3-year-old has had a fever for 6 days, red eyes, a red tongue, and swollen hands.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-year-old has had a fever for 6 days, red eyes, a red tongue, and swollen hands.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Scarlet fever", "Kawasaki Disease", "Measles", "None"]', 1, 'Kawasaki is a systemic vasculitis of childhood.'),
    (v_case_id, 'What is the most serious potential cardiac complication of Kawasaki disease?', '["Heart failure", "Coronary Artery Aneurysms", "Valve leaks", "None"]', 1, 'Aneurysms can lead to thrombosis and MI.'),
    (v_case_id, 'What is the standard treatment to prevent coronary aneurysms?', '["Antibiotics", "IVIG (Intravenous Immunoglobulin) and high-dose Aspirin", "Steroids", "None"]', 1, 'IVIG given before day 10 significantly reduces coronary risk.');

    ---------------------------------------------------------------------------
    -- CASE 14: Eisenmenger Syndrome (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shunt Reversal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shunt Reversal', 'An adult who had a large untreated VSD in childhood now presents with cyanosis and clubbing.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An adult who had a large untreated VSD in childhood now presents with cyanosis and clubbing.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Heart failure", "Eisenmenger Syndrome", "Pneumonia", "None"]', 1, 'Irreversible pulmonary hypertension leads to shunt reversal (right-to-left).'),
    (v_case_id, 'Why does the shunt reverse?', '["The hole gets bigger", "Pulmonary pressure eventually exceeds systemic pressure due to vascular remodeling", "The heart stops", "None"]', 1, 'Chronic high flow damages the pulmonary vessels.'),
    (v_case_id, 'Can the defect be surgically closed once Eisenmenger is established?', '["Yes", "No, closure would lead to acute right heart failure and death", "Only if blue", "None"]', 1, 'Once resistance is too high, surgery is contraindicated.');

    ---------------------------------------------------------------------------
    -- CASE 15: Innocent Murmurs - Still''s Murmur (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Musical Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Musical Murmur', 'A healthy 4-year-old has a vibratory, musical systolic murmur at the left lower sternal border.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Musical Murmur', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["VSD", "Still''s Murmur (Innocent)", "Aortic Stenosis", "None"]', 1, 'Still''s murmur is the most common innocent murmur in children.'),
    (v_case_id, 'How does the murmur change when the child lies flat?', '["It disappears", "It often becomes louder (due to increased venous return)", "No change", "None"]', 1, 'Positional changes are common with innocent murmurs.'),
    (v_case_id, 'What is the management of an innocent murmur?', '["Echocardiogram", "Reassurance and no further workup if the child is asymptomatic and the exam is otherwise normal", "Refer to surgery", "None"]', 1, 'Most innocent murmurs are heard in 50-80% of healthy children.');

    ---------------------------------------------------------------------------
    -- CASE 16: Total Anomalous Pulmonary Venous Return - TAPVR (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snowman Heart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snowman Heart', 'A cyanotic neonate''s chest X-ray shows a \"Snowman\" appearance of the heart mediastinum.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cyanotic neonate''s chest X-ray shows a \"Snowman\" appearance of the heart mediastinum.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["TGA", "Total Anomalous Pulmonary Venous Return (TAPVR)", "HLHS", "None"]', 1, 'All pulmonary veins drain into the right heart (systemic venous circuit).'),
    (v_case_id, 'What determines the severity of TAPVR?', '["Size of the heart", "Presence or absence of obstruction of the anomalous veins", "Gender", "None"]', 1, 'Obstructed TAPVR is a surgical emergency.'),
    (v_case_id, 'Why does a snowman shape form?', '["Enlargement of the superior vena cava and vertical vein", "Too much fat", "Lung fluid", "None"]', 0, 'This forms the top of the snowman in the supracardiac type.');

    ---------------------------------------------------------------------------
    -- CASE 17: Tricuspid Atresia (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Underdeveloped Right Ventricle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Underdeveloped Right Ventricle', 'A cyanotic newborn has an ECG showing LEFT axis deviation and small RV voltages.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A cyanotic newborn has an ECG showing LEFT axis deviation and small RV voltages.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["TOF", "Tricuspid Atresia", "TGA", "None"]', 1, 'A cyanotic newborn with LAD on ECG is highly suggestive of Tricuspid Atresia.'),
    (v_case_id, 'Why is the RV small in this condition?', '["It is missing", "No blood enters the RV from the right atrium; it is a \"passive\" ventricle", "Too much pressure", "None"]', 1, 'Lack of flow leads to hypoplasia.'),
    (v_case_id, 'What other defects MUST be present for survival in Tricuspid Atresia?', '["PDA and VSD", "ASD and VSD (to allow flow into the left heart and then back to the lungs)", "None", "Brain hole"]', 1, 'Blood must get to the left heart and then some must cross back to the lungs.');

    ---------------------------------------------------------------------------
    -- CASE 18: Heart Failure in Infants (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Feeding Difficulty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Feeding Difficulty', 'A 2-month-old with a large VSD takes 45 minutes to finish a bottle and is sweating profusely during feeds.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Feeding Difficulty', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What do these symptoms represent in an infant?', '["Colic", "Congestive Heart Failure", "Reflux", "Hunger"]', 1, 'Poor feeding, sweating, and tachypnea are the infant versions of exercise intolerance.'),
    (v_case_id, 'What is the priority in initial medical management of infant heart failure?', '["Antibiotics", "Diuretics (Furosemide) and optimized nutrition", "Surgery today", "None"]', 1, 'Removing excess fluid and providing calories for the work of breathing are key.'),
    (v_case_id, 'Why do these babies fail to gain weight?', '["They don''t like milk", "Excessive caloric expenditure due to tachypnea and poor intake due to fatigue", "No reason", "None"]', 1, 'Feeding is a \"workout\" for these babies.');

    ---------------------------------------------------------------------------
    -- CASE 19: Infective Endocarditis Prophylaxis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dental Visits and CHD' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dental Visits and CHD', 'A child with a prosthetic heart valve is going to the dentist for a tooth extraction.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dental Visits and CHD', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this child require antibiotic prophylaxis?', '["No", "Yes, prosthetic valves are high-risk", "Only if he has a cold", "None"]', 1, 'High-risk lesions require prophylaxis for dental procedures involving gingival manipulation.'),
    (v_case_id, 'Which of the following does NOT require routine prophylaxis?', '["Unrepaired cyanotic CHD", "Repaired VSD with no residual shunt", "Prosthetic valve", "Prior endocarditis"]', 1, 'Simple repaired defects without residual shunts do not require long-term prophylaxis.'),
    (v_case_id, 'What is the standard antibiotic used for prophylaxis?', '["Penicillin", "Amoxicillin (single dose 30-60 mins before)", "Gentamicin", "None"]', 1, 'Amoxicillin is the first-line oral agent.');

    ---------------------------------------------------------------------------
    -- CASE 20: Ebstein Anomaly (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Large Right Atrium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Large Right Atrium', 'A neonate has severe cardiomegaly and the tricuspid valve is noted to be displaced into the right ventricle.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate has severe cardiomegaly and the tricuspid valve is noted to be displaced into the right ventricle.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["TOF", "Ebstein Anomaly", "TGA", "None"]', 1, 'The tricuspid valve is \"atrialized,\" leading to a massive right atrium.'),
    (v_case_id, 'What maternal exposure is classic for Ebstein Anomaly?', '["Alcohol", "Lithium", "Smoking", "None"]', 1, 'Lithium use in the first trimester is a known risk factor.'),
    (v_case_id, 'What arrhythmia is common in patients with Ebstein anomaly?', '["Heart block", "Wolff-Parkinson-White (WPW) Syndrome", "None", "Slow heart"]', 1, 'Accessory pathways are frequently associated.');

    ---------------------------------------------------------------------------
    -- CASE 21: Truncus Arteriosus (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'One Big Vessel' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'One Big Vessel', 'A single large vessel arises from the heart and gives off the coronary, pulmonary, and systemic arteries.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'One Big Vessel', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["TGA", "Truncus Arteriosus", "HLHS", "None"]', 1, 'Failure of septation of the truncus arteriosus.'),
    (v_case_id, 'Is there always a VSD present in Truncus Arteriosus?', '["No", "Yes, a large VSD is mandatory for blood to reach the single vessel", "Only in boys", "None"]', 1, 'The single vessel sits over a large VSD.'),
    (v_case_id, 'What syndrome is often associated with Truncus?', '["Turner", "DiGeorge Syndrome", "Down", "None"]', 1, 'DiGeorge is the most common association.');

    ---------------------------------------------------------------------------
    -- CASE 22: Pulmonary Stenosis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Systolic Click' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Systolic Click', 'A child has a harsh crescendo-decrescendo murmur at the left upper sternal border with an early systolic click.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Systolic Click', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Aortic Stenosis", "Pulmonary Stenosis", "VSD", "None"]', 1, 'Pulmonary stenosis is best heard in the pulmonic area (LUSB) and often has an ejection click.'),
    (v_case_id, 'What chromosomal syndrome is associated with Pulmonary Valve Stenosis?', '["Down", "Noonan Syndrome", "Turner", "None"]', 1, 'Noonan syndrome is often called \"Male Turner syndrome\" and has right-heart defects.'),
    (v_case_id, 'What is the first-line intervention for symptomatic valvar pulmonary stenosis?', '["Surgery", "Balloon Valvuloplasty (in the cath lab)", "OCPs", "None"]', 1, 'Dilation of the valve is usually very successful.');

    ---------------------------------------------------------------------------
    -- CASE 23: Williams Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Elfin Facies' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Elfin Facies', 'A child has an extremely outgoing \"cocktail party\" personality, elfin-like facial features, and a murmur.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Elfin Facies', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What heart defect is classic for Williams Syndrome?', '["ASD", "Supravalvular Aortic Stenosis", "TOF", "None"]', 1, 'Narrowing just above the aortic valve is characteristic.'),
    (v_case_id, 'What electrolyte abnormality is sometimes seen in infants with Williams?', '["Hypocalcemia", "Hypercalcemia", "Hyponatremia", "None"]', 1, 'Idiopathic infantile hypercalcemia is a known feature.'),
    (v_case_id, 'What is the genetic cause?', '["Trisomy 21", "Microdeletion on Chromosome 7 (including the elastin gene)", "Trisomy 18", "None"]', 1, 'Elastin gene deletion leads to the arteriopathy.');

    ---------------------------------------------------------------------------
    -- CASE 24: Rheumatic Heart Disease (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Infection Heart Damage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Infection Heart Damage', 'A child who had a severe sore throat 3 weeks ago now has a new murmur and joint pain.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-Infection Heart Damage', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common valve affected in Acute Rheumatic Fever?', '["Aortic", "Mitral (Mitral Regurgitation initially)", "Tricuspid", "None"]', 1, 'Mitral valve damage is the hallmark of RHD.'),
    (v_case_id, 'What is the name of the criteria used to diagnose Rheumatic Fever?', '["Apgar", "Jones Criteria", "Beck''s", "None"]', 1, 'Joints, Heart, Nodules, Erythema marginatum, Sydenham chorea.'),
    (v_case_id, 'What is the best way to prevent Rheumatic Heart Disease?', '["Exercise", "Timely treatment of Group A Strep pharyngitis with Penicillin", "Vitamins", "None"]', 1, 'Treating strep throat prevents the autoimmune cross-reaction.');

    ---------------------------------------------------------------------------
    -- CASE 25: Myocarditis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Viral Heart Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Viral Heart Failure', 'A 14-year-old with a recent flu-like illness now has chest pain, shortness of breath, and an elevated Troponin.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Viral Heart Failure', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Myocarditis", "Asthma", "None"]', 1, 'Inflammation of the heart muscle, often following a viral infection (e.g., Coxsackie).'),
    (v_case_id, 'What imaging test is most helpful for viewing heart function in myocarditis?', '["CT scan", "Echocardiogram", "X-ray", "None"]', 1, 'Echo shows depressed ventricular function and wall motion abnormalities.'),
    (v_case_id, 'What is the gold standard for definitive diagnosis?', '["Echo", "Endomyocardial Biopsy", "MRI", "None"]', 1, 'Biopsy confirms inflammation, though MRI is increasingly used.');

    ---------------------------------------------------------------------------
    -- CASE 26: Hypercyanotic Spell - Tet Spell (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tanrum Blue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tanrum Blue', 'A 2-year-old with unrepaired TOF is turning blue and crying.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tanrum Blue', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying physiology of a Tet spell?', '["Too much oxygen", "Infundibular spasm leading to increased R-to-L shunting", "Heart stops", "None"]', 1, 'The spasm further narrows the pulmonary outflow tract.'),
    (v_case_id, 'Besides knee-to-chest, what medication helps increase SVR to break a spell?', '["Aspirin", "Phenylephrine", "Albuterol", "None"]', 1, 'An alpha-agonist increases afterload, favoring pulmonary flow.'),
    (v_case_id, 'What is a long-term medical management to prevent spells?', '["Antibiotics", "Beta-blockers (e.g., Propranolol)", "Steroids", "None"]', 1, 'Beta-blockers relax the infundibulum and slow the heart.');

    ---------------------------------------------------------------------------
    -- CASE 27: Innocent Murmurs - Venous Hum (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Disappearing Hum' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Disappearing Hum', 'A child has a continuous murmur at the right upper sternal border that DISAPPEARS when he turns his head or lies down.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Disappearing Hum', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PDA", "Venous Hum (Innocent)", "VSD", "None"]', 1, 'The venous hum is caused by turbulence in the jugular veins.'),
    (v_case_id, 'How do you distinguish a venous hum from a PDA?', '["Venous hum is louder", "Venous hum disappears when supine or with neck pressure; PDA is constant", "Venous hum is blue", "None"]', 1, 'Positional changes only affect the venous hum.'),
    (v_case_id, 'Is a venous hum a cause for concern?', '["Yes", "No, it is a completely benign finding", "Only in boys", "None"]', 1, 'No further workup is needed.');

    ---------------------------------------------------------------------------
    -- CASE 28: Fontan Procedure (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Single Ventricle Repair' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Single Ventricle Repair', 'A child with HLHS is undergoing the final stage of his surgical repair.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Single Ventricle Repair', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of the Fontan procedure?', '["To fix the left ventricle", "To direct all systemic venous blood directly to the pulmonary arteries, bypassing the right heart", "To close the PDA", "None"]', 1, 'This creates a \"single ventricle\" circulation.'),
    (v_case_id, 'What is the second stage of repair (usually at 4-6 months)?', '["Norwood", "Bidirectional Glenn", "Fontan", "None"]', 1, 'The Glenn connects the SVC to the pulmonary artery.'),
    (v_case_id, 'What is a chronic complication of the Fontan circulation?', '["Protein-losing enteropathy (PLE)", "Fast heart", "Liver failure only", "None"]', 0, 'Chronic high venous pressure can cause PLE and other organ dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 29: Coarctation - Newborn Presentation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Coarctation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Coarctation', 'A neonate presents with shock, metabolic acidosis, and absent femoral pulses on day 4 of life.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate presents with shock, metabolic acidosis, and absent femoral pulses on day 4 of life.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why did the baby present on day 4?', '["He got hungry", "The Ductus Arteriosus closed, cutting off flow to the lower body", "Infection", "None"]', 1, 'In severe coarctation, the lower body depends on the PDA.'),
    (v_case_id, 'What is the immediate management?', '["Antibiotics", "Prostaglandin E1 infusion", "Giving milk", "None"]', 1, 'Reopening the duct restores systemic perfusion.'),
    (v_case_id, 'What is the definitive treatment?', '["Pills", "Surgical repair or balloon angioplasty", "Wait", "None"]', 1, 'Surgery is the standard for neonatal coarctation.');

    ---------------------------------------------------------------------------
    -- CASE 30: Digoxin in Pediatrics (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Inotropic Support' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Inotropic Support', 'An infant with heart failure is started on Digoxin.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Inotropic Support', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary action of Digoxin?', '["Slows the heart", "Increases contractility (Inotropy) and slows conduction through the AV node", "Lowers BP", "None"]', 1, 'It helps the heart pump more efficiently and controls heart rate.'),
    (v_case_id, 'What is a common sign of Digoxin toxicity in an infant?', '["Fever", "Vomiting and arrhythmias (e.g., heart block)", "Rash", "None"]', 1, 'Vomiting is a classic early sign of toxicity.'),
    (v_case_id, 'What electrolyte abnormality INCREASES the risk of Digoxin toxicity?', '["Hyperkalemia", "Hypokalemia", "Hyponatremia", "None"]', 1, 'Low potassium increases Digoxin binding to the Na-K-ATPase pump.');

    ---------------------------------------------------------------------------
    -- CASE 31: Heart Failure - Diuretic Therapy (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Managing Fluid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Managing Fluid', 'A child with a large VSD is on Furosemide (Lasix).', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Managing Fluid', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of Furosemide?', '["Blocks salt", "Loop diuretic that inhibits Na-K-2Cl transport in the ascending limb of Henle", "Blocks water only", "None"]', 1, 'It reduces preload and pulmonary congestion.'),
    (v_case_id, 'What electrolyte must be monitored in children on chronic Furosemide?', '["Sodium", "Potassium (risk of hypokalemia)", "Calcium", "None"]', 1, 'Loop diuretics cause significant potassium loss.'),
    (v_case_id, 'What can be added to counteract the potassium loss?', '["Aspirin", "Spironolactone (Potassium-sparing diuretic)", "More water", "None"]', 1, 'Spironolactone is often used in combination for this reason.');

    ---------------------------------------------------------------------------
    -- CASE 32: Infective Endocarditis - Signs (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fever and a Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fever and a Murmur', 'A child with a known VSD has had a fever for 2 weeks, splinter hemorrhages in the nails, and a new murmur.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fever and a Murmur', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Infective Endocarditis", "Flu", "None"]', 1, 'Prolonged fever in a patient with CHD is endocarditis until proven otherwise.'),
    (v_case_id, 'What are \"Osler nodes\"?', '["Painful nodules on fingers/toes", "Painless spots on palms", "Red eyes", "None"]', 0, 'Painful = Osler. Painless = Janeway lesions.'),
    (v_case_id, 'What is the first step in the workup?', '["Give antibiotics", "Blood cultures (at least 3 sets)", "Echocardiogram", "None"]', 1, 'Cultures are critical for identifying the organism before starting therapy.');

    ---------------------------------------------------------------------------
    -- CASE 33: Still''s Murmur - Normal Variant (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Normal Flow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Normal Flow', 'A healthy student has a systolic murmur during a sports physical.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Normal Flow', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is a diastolic murmur ever considered innocent?', '["Yes", "No, diastolic murmurs are always pathological and warrant an Echo", "Sometimes", "None"]', 1, 'This is a key clinical rule: Systolic can be innocent; Diastolic is not.'),
    (v_case_id, 'Is a loud (Grade III/VI or higher) murmur more likely to be innocent or pathological?', '["Innocent", "Pathological", "No difference", "None"]', 1, 'Loud, harsh, or holosystolic murmurs are usually pathological.'),
    (v_case_id, 'What happens to a Still''s murmur with valsalva?', '["Gets louder", "Gets softer (due to decreased venous return)", "No change", "None"]', 1, 'Less blood flow = less innocent murmur.');

    ---------------------------------------------------------------------------
    -- CASE 34: TGA - Management (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mixing for Survival' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mixing for Survival', 'A neonate with TGA is deeply cyanotic. The Echo shows a very small PFO and no VSD.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mixing for Survival', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What procedure can be done in the cath lab to create mixing at the atrial level?', '["Balloon Valvuloplasty", "Rashkind Atrial Septostomy (Balloon septostomy)", "Fontan", "None"]', 1, 'Tearing the atrial septum allows for life-saving mixing.'),
    (v_case_id, 'What is the definitive surgical repair for TGA?', '["Fontan", "Arterial Switch Operation (Jatene)", "Glenn", "None"]', 1, 'The great vessels are swapped back to their correct positions.'),
    (v_case_id, 'When is the arterial switch usually performed?', '["1 year", "First week of life", "10 years", "None"]', 1, 'It must be done while the LV can still handle systemic pressure.');

    ---------------------------------------------------------------------------
    -- CASE 35: SVT in Children (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infant SVT' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infant SVT', 'A 2-month-old is irritable and not feeding. The heart rate is constant at 250 bpm.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infant SVT', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Supraventricular Tachycardia (SVT)", "Sinus tach", "None"]', 1, 'Fixed rate > 220 in an infant is SVT.'),
    (v_case_id, 'What is a common physical maneuver used to break SVT in an infant?', '["Running", "Ice to the face (triggering the diving reflex)", "Standing up", "None"]', 1, 'Vagal maneuvers can slow the AV node conduction.'),
    (v_case_id, 'What medication is first-line for stable SVT?', '["Epinephrine", "Adenosine", "Atropine", "None"]', 1, 'Adenosine blocks the AV node briefly to break the re-entry.');

    ---------------------------------------------------------------------------
    -- CASE 36: Long QT Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Fainting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Fainting', 'A 10-year-old collapses while swimming. His older brother died suddenly at age 12.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Fainting', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What diagnosis should be suspected?', '["Epilepsy", "Long QT Syndrome", "Dehydration", "None"]', 1, 'Inherited ion channelopathies can cause sudden cardiac death.'),
    (v_case_id, 'What specific rhythm is a risk in Long QT?', '["Heart block", "Torsades de Pointes (Polymorphic VT)", "Sinus tach", "None"]', 1, 'Prolonged repolarization can trigger Torsades.'),
    (v_case_id, 'What is a common treatment to reduce the risk of triggers?', '["Steroids", "Beta-blockers", "Aspirin", "None"]', 1, 'Beta-blockers reduce the adrenergic triggers for arrhythmias.');

    ---------------------------------------------------------------------------
    -- CASE 37: ASD - Paradoxical Embolism (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stroke Risk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stroke Risk', 'A young adult with a known ASD has a sudden stroke.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Stroke Risk', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of this stroke?', '["Brain tumor", "Paradoxical Embolism (clot from a DVT crossing the ASD into the systemic circuit)", "Bad luck", "None"]', 1, 'A right-to-left shunt allows venous clots to reach the brain.'),
    (v_case_id, 'Under what conditions does the ASD shunt become right-to-left?', '["Exercise", "Transiently during cough/straining or long-term with pulmonary hypertension", "Sleep", "None"]', 1, 'Pressure shifts allow the paradoxical passage.'),
    (v_case_id, 'Is this a common complication in childhood?', '["Yes", "No, it is typically a late complication in adults", "Never", "None"]', 1, 'Children rarely have DVTs to cause the embolism.');

    ---------------------------------------------------------------------------
    -- CASE 38: Holt-Oram Syndrome (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Heart and Hand' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Heart and Hand', 'A child has a large ASD and a thumb that is missing.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Heart and Hand', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["DiGeorge", "Holt-Oram Syndrome", "Down", "None"]', 1, 'This syndrome links upper limb defects and cardiac septal defects.'),
    (v_case_id, 'What is the inheritance pattern?', '["Recessive", "Autosomal Dominant", "X-linked", "None"]', 1, 'Most cases are dominant mutations in TBX5.'),
    (v_case_id, 'Which cardiac defect is most common in Holt-Oram?', '["PDA", "ASD (Secundum type)", "TOF", "None"]', 1, 'ASD and VSD are the hallmark findings.');

    ---------------------------------------------------------------------------
    -- CASE 39: Coarctation - Lower Extremity Health (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Leg Pains' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Leg Pains', 'An older child complains of leg fatigue and pain when running.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Leg Pains', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of this \"Claudication\" in a child with coarctation?', '["Growing pains", "Inadequate blood flow to the lower extremities during exercise", "Arthritis", "None"]', 1, 'The obstruction limits the increase in flow needed during activity.'),
    (v_case_id, 'What is the femoral pulse like in this patient?', '["Strong", "Weak and Delayed (Brachial-Femoral Delay)", "Bounding", "None"]', 1, 'Pulse lag is a key diagnostic sign.'),
    (v_case_id, 'Can coarctation lead to early heart failure?', '["Yes, due to chronic afterload on the left ventricle", "No", "Only if blue", "None"]', 0, 'The LV must pump against high resistance.');

    ---------------------------------------------------------------------------
    -- CASE 40: Chest Pain in Children (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Is it My Heart?' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Is it My Heart?', 'A 12-year-old girl has sharp, stabbing chest pain that lasts for 10 seconds and is worse when she takes a deep breath.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Is it My Heart?', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this likely a cardiac problem?', '["Yes", "No, chest pain in children is rarely cardiac (often musculoskeletal, like Precordial Catch Syndrome)", "Always", "None"]', 1, 'Less than 1-5% of pediatric chest pain has a cardiac cause.'),
    (v_case_id, 'What is \"Precordial Catch Syndrome\"?', '["Heart attack", "A benign, sharp, localized pain common in teens that is worse with inspiration", "A lung hole", "None"]', 1, 'It is harmless and self-limited.'),
    (v_case_id, 'When should you WORRY about chest pain in a child?', '["When it is sharp", "When it occurs during exercise, with syncope, or a family history of sudden death", "When it is after eating", "None"]', 1, 'Exercise-induced pain is a red flag for HCM or coronary issues.');

    ---------------------------------------------------------------------------
    -- CASE 41: VSD - Eisenmenger Development (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Natural History' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Natural History', 'A child with a large VSD is not gaining weight and has high pulmonary pressures.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Natural History', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of surgery in this case?', '["To make them blue", "To prevent irreversible pulmonary vascular obstructive disease (Eisenmenger)", "To fix the murmur", "None"]', 1, 'Early closure prevents the high-flow damage.'),
    (v_case_id, 'What is the most common reason a VSD is closed in infancy?', '["It is ugly", "Refractory heart failure or failure to thrive", "Parent choice", "None"]', 1, 'If medicine fails to control symptoms, surgery is indicated.'),
    (v_case_id, 'Do most small VSDs need surgery?', '["Yes", "No, 50-75% of small muscular VSDs close spontaneously in the first few years", "Always", "None"]', 1, 'Many are monitored and resolve on their own.');

    ---------------------------------------------------------------------------
    -- CASE 42: Pulmonary Flow Murmur (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Teen Murmur' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Teen Murmur', 'A skinny 14-year-old has a soft systolic murmur at the left upper sternal border.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Teen Murmur', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this likely to be?', '["TOF", "Pulmonary Flow Murmur of Childhood (Innocent)", "ASD", "None"]', 1, 'Innocent flow through a normal pulmonary valve in a thin-chested child.'),
    (v_case_id, 'Is the S2 normally split in this patient?', '["No", "Yes, with normal respiratory variation", "It is fixed", "None"]', 1, 'Normal splitting helps rule out an ASD.'),
    (v_case_id, 'What is the sound quality?', '["Harsh", "Soft, blowing, or musical", "Machinery", "None"]', 1, 'Innocent murmurs are never harsh.');

    ---------------------------------------------------------------------------
    -- CASE 43: Kawasaki - Atypical Presentation (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Incomplete Kawasaki' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Incomplete Kawasaki', 'An infant has a 7-day fever but only two other criteria (rash and red eyes).', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Incomplete Kawasaki', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Can this still be Kawasaki disease?', '["No", "Yes, \"Incomplete Kawasaki\" is common in infants and they are at high risk for aneurysms", "Only in boys", "None"]', 1, 'Infants often don''t meet all criteria but are at highest risk.'),
    (v_case_id, 'What lab tests support the diagnosis of Kawasaki?', '["High ESR and CRP", "High platelets (Thrombocytosis after week 1)", "Low albumin and high ALT", "All of the above"]', 3, 'Inflammatory markers and thrombocytosis are helpful clues.'),
    (v_case_id, 'What is the first step in evaluation if you suspect incomplete Kawasaki?', '["Wait 1 week", "Echocardiogram (to look for early coronary changes)", "Skin biopsy", "None"]', 1, 'Echo is vital for management decisions.');

    ---------------------------------------------------------------------------
    -- CASE 44: Ductus Arteriosus - Physics (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shifting Shunt' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shifting Shunt', 'A student asks why a PDA is Left-to-Right after birth.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shifting Shunt', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the reason for the post-birth shunt direction?', '["The lungs are small", "Systemic pressure (Aorta) is now much higher than Pulmonary pressure", "Gravity", "None"]', 1, 'Fluids flow from high to low pressure.'),
    (v_case_id, 'If the PDA is very large, what happens to the left heart?', '["It shrinks", "It undergoes volume overload and dilation", "It dies", "None"]', 1, 'Excess blood returns to the left heart from the lungs.'),
    (v_case_id, 'What is the risk of a long-term large PDA?', '["Nothing", "Pulmonary hypertension and heart failure", "Cancer", "None"]', 1, 'Like VSD, it can lead to Eisenmenger syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 45: Tetralogy - The Murmur (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sound of the Tet' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sound of the Tet', 'A baby with TOF has a crescendo-decrescendo murmur at the LUSB.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sound of the Tet', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What produces the murmur in TOF?', '["The VSD", "Pulmonary Stenosis (flow through the narrowed valve)", "Overriding aorta", "None"]', 1, 'The VSD in TOF is typically so large it is silent (no pressure gradient).'),
    (v_case_id, 'What happens to the murmur during a Tet spell?', '["Gets louder", "Gets softer or disappears (due to almost no flow into the lungs)", "No change", "None"]', 1, 'Disappearance of the murmur during cyanosis is an emergency.'),
    (v_case_id, 'Why does the murmur disappear?', '["The heart stops", "Right-to-left shunting increases and pulmonary flow decreases", "Vomit", "None"]', 1, 'The blood is bypassing the lungs (and the murmur site).');

    ---------------------------------------------------------------------------
    -- CASE 46: Atrial Septal Defect - Types (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Primum vs Secundum' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Primum vs Secundum', 'A child with an ASD has a mitral valve leak and Left Axis Deviation.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Primum vs Secundum', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of ASD is this?', '["Secundum", "Ostium Primum", "Sinus Venosus", "None"]', 1, 'Primum defects are part of the AVSD spectrum and involve the valves and LAD.'),
    (v_case_id, 'Which type of ASD can sometimes be closed with a device in the cath lab?', '["Primum", "Secundum (if the rims are adequate)", "Neither", "None"]', 1, 'Secundum ASDs are often amenable to transcatheter closure.'),
    (v_case_id, 'Does an ASD murmur come from the hole itself?', '["Yes", "No, it is from increased flow through the pulmonary valve (relative PS)", "Yes", "None"]', 1, 'The low-pressure atrial shunt is silent; the sound is from the high RV volume ejection.');

    ---------------------------------------------------------------------------
    -- CASE 47: Pulse Oximetry Screening (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'CCHD Screening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'CCHD Screening', 'A newborn fails his pulse oximetry screen at 24 hours (Right hand 92%, Foot 88%).', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'CCHD Screening', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the goal of this universal screen?', '["To check for pneumonia", "To detect Critical Congenital Heart Disease (CCHD) before the baby leaves the hospital", "To check heart rate", "None"]', 1, 'Detecting lesions before the duct closes prevents sudden collapse at home.'),
    (v_case_id, 'What is the next step for a failed screen?', '["Repeat in 1 week", "Echocardiogram", "Give oxygen", "None"]', 1, 'An Echo must be done to rule out life-threatening defects.'),
    (v_case_id, 'Why is it done on the right hand and foot?', '["Random choice", "Right hand is pre-ductal; foot is post-ductal", "Left hand is bad", "None"]', 1, 'Comparing the two identifies ductal-dependent or obstructive lesions.');

    ---------------------------------------------------------------------------
    -- CASE 48: Coarctation - Surgical Complication (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Op Issues' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Op Issues', 'A patient had a coarctation repair and now has severe hypertension and abdominal pain.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-Op Issues', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this postoperative complication called?', '["Heart failure", "Post-coarctectomy syndrome (Mesenteric arteritis)", "Sepsis", "None"]', 1, 'Sudden increase in flow to the previously low-pressure mesenteric bed causes inflammation.'),
    (v_case_id, 'What is the treatment?', '["Surgery", "Strict BP control and bowel rest", "Antibiotics", "None"]', 1, 'Managing the rebound hypertension is critical.'),
    (v_case_id, 'What nerve can be injured during coarctation surgery?', '["Phrenic", "Recurrent Laryngeal Nerve (causing hoarseness)", "Vagus", "None"]', 1, 'The RLN loops around the aorta near the ductus.');

    ---------------------------------------------------------------------------
    -- CASE 49: Noonan Syndrome (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Right-Sided Turner' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Right-Sided Turner', 'A boy with short stature, webbed neck, and pectus excavatum has a murmur.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Right-Sided Turner', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cardiac defect in Noonan syndrome?', '["Aortic stenosis", "Pulmonary Valve Stenosis (often with a dysplastic valve)", "ASD", "None"]', 1, 'Right heart defects are characteristic.'),
    (v_case_id, 'What cardiomyopathy is also associated with Noonan?', '["Dilated", "Hypertrophic Cardiomyopathy (HCM)", "Restrictive", "None"]', 1, 'HCM is seen in about 20% of Noonan patients.'),
    (v_case_id, 'Is Noonan syndrome chromosomal?', '["Yes", "No, it is usually autosomal dominant (RASopathy)", "Only in girls", "None"]', 1, 'Unlike Turner, it occurs in both sexes and is single-gene driven.');

    ---------------------------------------------------------------------------
    -- CASE 50: VSD - The Small Hole (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Observation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Observation', 'A healthy 6-month-old has a Grade II harsh murmur. Echo shows a 2 mm muscular VSD.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Observation', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely outcome for this small VSD?', '["Heart failure", "Spontaneous closure (usually by age 2)", "Eisenmenger", "None"]', 1, 'Small muscular VSDs have a very high rate of natural closure.'),
    (v_case_id, 'Is endocarditis prophylaxis indicated for this small VSD?', '["Yes", "No", "Only if blue", "None"]', 1, 'Unrepaired simple VSDs do not require routine dental prophylaxis.'),
    (v_case_id, 'What is the only activity restriction for this child?', '["No sports", "None; they should be encouraged to be fully active", "No swimming", "None"]', 1, 'Small, hemodynamically insignificant defects don''t require restrictions.');

    RAISE NOTICE 'SUCCESS: 50 Congenital Heart Disease Case Blocks registered.';
END $$;

COMMIT;
