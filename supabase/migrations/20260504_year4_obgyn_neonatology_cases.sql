BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Neonatology
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-neonatology' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-neonatology" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Initial NRP Assessment (NRP 8th Ed)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Golden Minute' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Golden Minute', 'A baby is delivered at 39 weeks. The pediatrician is at the bedside for the initial assessment.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A baby is delivered at 39 weeks. The pediatrician is at the bedside for the initial assessment.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three initial questions asked immediately after birth?', '["Is the baby pink? Is the baby crying? Is the mother okay?", "Is the baby term? Does the baby have good muscle tone? Is the baby breathing or crying?", "What is the weight? What is the gender? Is the cord cut?", "None"]', 1, 'These three questions determine if the baby can stay with the mother or needs to be moved to the radiant warmer.'),
    (v_case_id, 'If the answer to any of the three initial questions is \"No,\" what are the first steps?', '["Immediate intubation", "Provide warmth, position airway, clear secretions if needed, dry and stimulate", "Give Epinephrine", "None"]', 1, 'Initial steps focus on stabilization and stimulation.'),
    (v_case_id, 'What is the target timeframe for completing the initial steps and starting ventilation if needed?', '["30 seconds", "60 seconds (The Golden Minute)", "5 minutes", "None"]', 1, 'Ventilation should start within 60 seconds if the baby remains apneic or has a low heart rate.');

    ---------------------------------------------------------------------------
    -- CASE 02: Evaluating Heart Rate (NRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vital Signs at Birth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vital Signs at Birth', 'After initial stimulation, the newborn is gasping and appears limp.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After initial stimulation, the newborn is gasping and appears limp.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the single most important vital sign in neonatal resuscitation?', '["Blood pressure", "Heart rate", "Temperature", "Respiratory rate"]', 1, 'Heart rate determines the next steps in the NRP algorithm.'),
    (v_case_id, 'What is the heart rate threshold for starting Positive Pressure Ventilation (PPV)?', '["Heart rate < 100 bpm", "Heart rate < 60 bpm", "Heart rate < 140 bpm", "None"]', 0, 'If HR is < 100 or the baby is apneic/gasping, PPV is indicated.'),
    (v_case_id, 'Where is the best place to check for a pulse in a newborn?', '["Radial artery", "Base of the umbilical cord or auscultation of the precordium", "Carotid artery", "None"]', 1, 'Auscultation is the most accurate clinical method for HR assessment.');

    ---------------------------------------------------------------------------
    -- CASE 03: Positive Pressure Ventilation - PPV (NRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Starting Ventilation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Starting Ventilation', 'PPV is initiated for a heart rate of 80 bpm. After 15 seconds of PPV, the heart rate is not increasing and the chest is not moving.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'PPV is initiated for a heart rate of 80 bpm. After 15 seconds of PPV, the heart rate is not increasing and the chest is not moving.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the acronym used for ventilation corrective steps?', '["ABCDE", "MR. SOPA", "MONA", "RICE"]', 1, 'MR. SOPA stands for Mask adjustment, Reposition airway, Suction, Open mouth, Pressure increase, and Alternative airway.'),
    (v_case_id, 'What does the \"S\" in MR. SOPA stand for?', '["Stimulate", "Suction mouth and nose", "Stabilize", "None"]', 1, 'Clearing secretions ensures a patent airway.'),
    (v_case_id, 'What is the recommended rate for PPV breaths?', '["10-20 breaths/min", "40-60 breaths/min", "80-100 breaths/min", "None"]', 1, 'The rhythm is \"Breathe, two, three; Breathe, two, three.\"');

    ---------------------------------------------------------------------------
    -- CASE 04: Chest Compressions (NRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Advancing Resuscitation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Advancing Resuscitation', 'Despite 30 seconds of effective PPV through an endotracheal tube, the baby''s heart rate is 40 bpm.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Despite 30 seconds of effective PPV through an endotracheal tube, the baby''s heart rate is 40 bpm.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'When are chest compressions indicated?', '["HR < 100", "HR < 60 bpm despite at least 30 seconds of effective PPV", "Always", "None"]', 1, 'Compressions are started only after optimizing ventilation.'),
    (v_case_id, 'What is the preferred technique for chest compressions in a newborn?', '["Two-finger technique", "Two-thumb-encircling-hands technique", "One-hand technique", "None"]', 1, 'The two-thumb technique generates better blood pressure.'),
    (v_case_id, 'What is the ratio of compressions to ventilations in neonatal CPR?', '["15:2", "3:1 (90 compressions and 30 breaths per minute)", "30:2", "None"]', 1, 'Neonatal resuscitation focuses on respiratory support, hence the 3:1 ratio.');

    ---------------------------------------------------------------------------
    -- CASE 05: Epinephrine and Fluids (NRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Medications in the Delivery Room' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Medications in the Delivery Room', 'Compressions have been ongoing for 60 seconds. The heart rate remains at 40 bpm.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Medications in the Delivery Room', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the medication of choice for persistent bradycardia?', '["Atropine", "Epinephrine (1:10,000)", "Bicarbonate", "Calcium"]', 1, 'Epinephrine is used to increase coronary perfusion pressure.'),
    (v_case_id, 'What is the preferred route for emergency medications in a newborn?', '["Peripheral IV", "Umbilical Venous Catheter (UVC)", "Intramuscular", "None"]', 1, 'UVC access is rapid and reliable in the delivery room.'),
    (v_case_id, 'If blood loss is suspected (e.g., pale baby, history of abruption), what is used for volume expansion?', '["D5W", "Normal Saline (10 mL/kg) or O-negative blood", "Albumin", "None"]', 1, 'Isotonic crystalloid is the first-line for volume expansion.');

    ---------------------------------------------------------------------------
    -- CASE 06: APGAR Scores (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Scoring the Transition' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Scoring the Transition', 'A baby is born. At 1 minute, he has a heart rate of 110, is crying lustily, has some flexion of extremities, sneezes when suctioned, but has blue hands and feet.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Scoring the Transition', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this baby''s 1-minute APGAR score?', '["7", "8", "9", "10"]', 2, 'HR > 100 (2), Cry (2), Irritability/Sneeze (2), Flexion (1), Color/Acrocyanosis (1) = 8. Wait, HR(2)+Resp(2)+Irrit(2)+Tone(1)+Color(1) = 8.'),
    (v_case_id, 'What does the \"P\" in APGAR stand for?', '["Pressure", "Pulse (Heart rate)", "Pallor", "None"]', 1, 'APGAR: Appearance, Pulse, Grimace, Activity, Respiration.'),
    (v_case_id, 'Does a low 1-minute APGAR score predict long-term neurological outcome?', '["Yes", "No, it primarily reflects the need for immediate resuscitation", "Only in preemies", "None"]', 1, 'The 5-minute and 10-minute scores are more predictive of survival and outcome.');

    ---------------------------------------------------------------------------
    -- CASE 07: Meconium-Stained Fluid (NRP 8th Ed)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Meconium at Birth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Meconium at Birth', 'A baby is born through thick, \"pea-soup\" meconium-stained amniotic fluid. The baby is crying and active.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Meconium at Birth', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current management for a VIGOROUS baby born with meconium?', '["Routine endotracheal suctioning", "Initial steps (warm/dry/stimulate) and stay with mother", "Antibiotics", "None"]', 1, 'Current NRP guidelines emphasize that vigorous babies should not be routinely suctioned.'),
    (v_case_id, 'If a baby born with meconium is NON-VIGOROUS (limp/apneic), what is the first step?', '["Immediate intubation", "Start PPV if HR < 100 or apneic", "Suction the mouth and nose with a bulb syringe and start NRP", "None"]', 2, 'Suctioning the trachea is no longer routinely recommended even for non-vigorous babies; focus on starting PPV if needed.'),
    (v_case_id, 'What is a potential complication of meconium aspiration?', '["Diabetes", "Meconium Aspiration Syndrome (MAS) and Persistent Pulmonary Hypertension (PPHN)", "Twins", "None"]', 1, 'Meconium causes chemical pneumonitis and can lead to severe respiratory failure.');

    ---------------------------------------------------------------------------
    -- CASE 08: Routine Newborn Prophylaxis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Standard Newborn Meds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Standard Newborn Meds', 'Standard orders are written for a healthy newborn in the nursery.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Standard Newborn Meds', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is Vitamin K (Phytonadione) given to all newborns?', '["To prevent infection", "To prevent Vitamin K Deficiency Bleeding (Hemorrhagic disease of the newborn)", "To help with jaundice", "None"]', 1, 'Newborns are Vitamin K deficient, which can lead to life-threatening intracranial hemorrhage.'),
    (v_case_id, 'What is the purpose of Erythromycin ophthalmic ointment?', '["To prevent viral pink eye", "To prevent Gonococcal ophthalmia neonatorum (which can cause blindness)", "To clean the eyes", "None"]', 1, 'Prophylaxis against N. gonorrhoeae is mandatory in many regions.'),
    (v_case_id, 'Which vaccine is typically given within 24 hours of birth?', '["MMR", "Hepatitis B", "Polio", "Flu"]', 1, 'Hep B is the first in the childhood series.');

    ---------------------------------------------------------------------------
    -- CASE 09: Newborn Screening (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Screening for Hidden Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Screening for Hidden Disease', 'Before discharge, a series of screening tests are performed on the newborn.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Screening for Hidden Disease', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What metabolic disorder is universally screened for because early treatment with a special diet prevents mental retardation?', '["Diabetes", "Phenylketonuria (PKU)", "Asthma", "None"]', 1, 'Early detection of PKU allows for a low-phenylalanine diet.'),
    (v_case_id, 'What does pulse oximetry screening in the nursery aim to detect?', '["Pneumonia", "Critical Congenital Heart Disease (CCHD)", "Anemia", "None"]', 1, 'Screening the right hand and either foot helps identify ductal-dependent lesions.'),
    (v_case_id, 'Why is hearing screening performed before discharge?', '["To see if they like music", "Early detection of hearing loss is critical for normal speech and language development", "To check ear size", "None"]', 1, 'Universal hearing screening is now standard of care.');

    ---------------------------------------------------------------------------
    -- CASE 10: Umbilical Cord Assessment (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Three Vessels' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Three Vessels', 'A medical student is examining the umbilical cord after it is clamped.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Three Vessels', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the normal vessel composition of the umbilical cord?', '["One artery, one vein", "Two arteries, one vein", "One artery, two veins", "Three arteries"]', 1, 'Two small, thick-walled arteries and one large, thin-walled vein.'),
    (v_case_id, 'What is the clinical significance of a Single Umbilical Artery (SUA)?', '["Nothing", "It is associated with an increased risk of renal and cardiac anomalies", "It means twins", "None"]', 1, 'Finding a 2-vessel cord warrants a thorough anatomical survey.'),
    (v_case_id, 'What is \"Delayed Cord Clamping\"?', '["Waiting for 1 hour", "Waiting 30-60 seconds after birth to clamp (which increases iron stores and reduces IVH risk in preemies)", "Clamping immediately", "None"]', 1, 'DCC is now recommended for both term and preterm infants.');

    ---------------------------------------------------------------------------
    -- CASE 11: TTN - Transient Tachypnea (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Wet Lungs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Wet Lungs', 'A term baby born via elective C-section without labor develops grunting and tachypnea (RR 80) shortly after birth.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Wet Lungs', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["RDS", "Transient Tachypnea of the Newborn (TTN)", "Sepsis", "MAS"]', 1, 'TTN is caused by delayed clearance of fetal lung fluid.'),
    (v_case_id, 'What is a classic X-ray finding for TTN?', '["Ground-glass appearance", "Fluid in the fissures and perihilar streaking", "Large heart", "None"]', 1, 'This represents interstitial edema/retained fluid.'),
    (v_case_id, 'What is the typical management of TTN?', '["Antibiotics", "Supportive care (oxygen/CPAP) and it usually resolves within 24-72 hours", "Surgery", "None"]', 1, 'TTN is a self-limited condition.');

    ---------------------------------------------------------------------------
    -- CASE 12: RDS - Respiratory Distress Syndrome (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surfactant Deficiency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surfactant Deficiency', 'A 28-week preterm infant has severe respiratory distress, nasal flaring, and retractions.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Surfactant Deficiency', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of RDS in preemies?', '["Infection", "Surfactant deficiency leading to alveolar collapse", "Fluid", "None"]', 1, 'Surfactant is needed to reduce surface tension and keep alveoli open.'),
    (v_case_id, 'What is the classic X-ray finding for RDS?', '["Fluid in fissures", "Diffuse, fine \"ground-glass\" opacities and air bronchograms", "Black lungs", "None"]', 1, 'This represents diffuse atelectasis.'),
    (v_case_id, 'What is the definitive treatment for severe RDS?', '["Antibiotics", "Exogenous surfactant administration via endotracheal tube", "More oxygen", "None"]', 1, 'Replacing the missing surfactant improves lung compliance.');

    ---------------------------------------------------------------------------
    -- CASE 13: Physiological Jaundice (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Normal Newborn Yellowing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Normal Newborn Yellowing', 'A healthy 3-day-old term baby has mild jaundice of the face and chest.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Normal Newborn Yellowing', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what point is jaundice always considered PATHOLOGICAL?', '["Day 3", "Within the first 24 hours of life", "Day 7", "None"]', 1, 'Jaundice in the first 24 hours suggests hemolysis or infection.'),
    (v_case_id, 'Why do newborns develop physiological jaundice?', '["Immature liver (low UGT enzyme activity) and high red cell turnover", "Too much milk", "Infection", "None"]', 0, 'Newborns have more RBCs and a slower ability to conjugate bilirubin.'),
    (v_case_id, 'What is the management of mild physiological jaundice?', '["Phototherapy", "Ensuring adequate feeding (to promote stooling) and observation", "Blood transfusion", "None"]', 1, 'Bilirubin is excreted in the stool; more milk means more excretion.');

    ---------------------------------------------------------------------------
    -- CASE 14: ABO Incompatibility (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hemolysis in the Newborn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hemolysis in the Newborn', 'A baby born to a Type O mother is found to be Type A. The baby is jaundiced at 12 hours of age.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hemolysis in the Newborn', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of the jaundice?', '["Physiological", "ABO Incompatibility (Maternal Anti-A antibodies attacking fetal A cells)", "Sepsis", "None"]', 1, 'ABO incompatibility is a common cause of early-onset jaundice.'),
    (v_case_id, 'Which lab test confirms the presence of maternal antibodies on the fetal red cells?', '["Indirect Coombs", "Direct Antiglobulin Test (Direct Coombs)", "CBC", "None"]', 1, 'A positive Direct Coombs confirms immune-mediated hemolysis.'),
    (v_case_id, 'What is the treatment for rising bilirubin levels in this case?', '["Antibiotics", "Phototherapy", "Sugar water", "None"]', 1, 'Phototherapy converts bilirubin into water-soluble isomers.');

    ---------------------------------------------------------------------------
    -- CASE 15: Kernicterus (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bilirubin Toxicity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bilirubin Toxicity', 'A baby with a bilirubin level of 30 mg/dL (very high) becomes lethargic and develops an arched back (opisthotonus).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilirubin Toxicity', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this condition?', '["Sepsis", "Kernicterus (Bilirubin Encephalopathy)", "Colic", "None"]', 1, 'Kernicterus is permanent brain damage from bilirubin deposition in the basal ganglia.'),
    (v_case_id, 'Is it caused by Conjugated or Unconjugated bilirubin?', '["Conjugated", "Unconjugated (which is fat-soluble and crosses the blood-brain barrier)", "Both", "None"]', 1, 'Only free, unconjugated bilirubin is neurotoxic.'),
    (v_case_id, 'What is the emergency treatment for dangerously high bilirubin?', '["More milk", "Exchange Transfusion", "Phototherapy only", "None"]', 1, 'Exchange transfusion physically removes the bilirubin and antibodies.');

    ---------------------------------------------------------------------------
    -- CASE 16: GBS Sepsis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Early-Onset Sepsis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Early-Onset Sepsis', 'A baby born to a GBS-positive mother who did not receive antibiotics develops respiratory distress and temperature instability at 6 hours of age.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Early-Onset Sepsis', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common organism for early-onset neonatal sepsis?', '["Listeria", "Group B Streptococcus (GBS)", "Staph aureus", "None"]', 1, 'GBS is the leading cause, though rates have dropped with intrapartum prophylaxis.'),
    (v_case_id, 'What is the empiric antibiotic regimen for suspected neonatal sepsis?', '["Amoxicillin", "Ampicillin and Gentamicin", "Vancomycin", "None"]', 1, 'This covers both GBS and E. coli.'),
    (v_case_id, 'What is the single most effective way to prevent early-onset GBS sepsis?', '["Treating the baby after birth", "Maternal screening at 36-37 weeks and intrapartum Penicillin", "C-section", "None"]', 1, 'Screening and prophylaxis are highly effective.');

    ---------------------------------------------------------------------------
    -- CASE 17: Neonatal Hypoglycemia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Blood Sugar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Blood Sugar', 'A large-for-gestational-age (LGA) infant born to a mother with gestational diabetes is jittery at 1 hour of age.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Low Blood Sugar', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Sepsis", "Neonatal Hypoglycemia", "Drug withdrawal", "None"]', 1, 'Infants of diabetic mothers (IDM) are at high risk due to fetal hyperinsulinemia.'),
    (v_case_id, 'Why does the IDM develop hypoglycemia AFTER birth?', '["No more food", "Fetal hyperinsulinemia persists after the maternal glucose supply is cut off", "Infection", "None"]', 1, 'The baby''s pancreas is still over-secreting insulin.'),
    (v_case_id, 'What is the first-line treatment for a symptomatic hypoglycemic infant?', '["Observe", "IV Bolus of Dextrose (D10W)", "Feeding alone", "None"]', 1, 'Symptomatic babies need immediate IV glucose.');

    ---------------------------------------------------------------------------
    -- CASE 18: Birth Trauma - Cephalohematoma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Head Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Head Swelling', 'A baby born after a vacuum-assisted delivery has a swelling on his head that does NOT cross the suture lines.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Head Swelling', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Caput Succedaneum", "Cephalohematoma", "Subgaleal hemorrhage", "Skull fracture"]', 1, 'Cephalohematoma is subperiosteal and therefore limited by suture lines.'),
    (v_case_id, 'How does Caput Succedaneum differ?', '["It is deeper", "It is soft-tissue edema that CROSSES the suture lines", "It is permanent", "None"]', 1, 'Caput is more superficial and resolves quickly.'),
    (v_case_id, 'What is a potential complication as a cephalohematoma resolves?', '["Hyperbilirubinemia (jaundice)", "Brain damage", "Blindness", "None"]', 0, 'Breakdown of the trapped blood can increase the bilirubin load.');

    ---------------------------------------------------------------------------
    -- CASE 19: Necrotizing Enterocolitis - NEC (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Premature Gut' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Premature Gut', 'A 26-week preemie develops abdominal distension, bloody stools, and temperature instability.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Premature Gut', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Constipation", "Necrotizing Enterocolitis (NEC)", "Milk allergy", "None"]', 1, 'NEC is a life-threatening intestinal emergency in preemies.'),
    (v_case_id, 'What is the pathognomonic X-ray finding for NEC?', '["Ground-glass", "Pneumatosis intestinalis (air in the bowel wall)", "Bowel obstruction", "None"]', 1, 'Air within the wall of the gut is diagnostic.'),
    (v_case_id, 'What is a protective factor against the development of NEC?', '["Formula feeding", "Human breast milk", "Antibiotics", "None"]', 1, 'Breast milk significantly reduces the risk of NEC.');

    ---------------------------------------------------------------------------
    -- CASE 20: Brachial Plexus Injury (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Limp Arm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Limp Arm', 'After a difficult shoulder dystocia, the newborn is noted to have a limp right arm. It is adducted, internally rotated, with the wrist flexed.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Limp Arm', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this specific palsy?', '["Klumpke''s palsy", "Erb-Duchenne palsy (\"Waiter''s tip\" position)", "Cerebral palsy", "None"]', 1, 'Erb''s involves C5-C6 roots.'),
    (v_case_id, 'Which roots are involved in Klumpke''s palsy (claw hand)?', '["C5-C6", "C8-T1", "L4-L5", "None"]', 1, 'Klumpke''s affects the lower roots of the brachial plexus.'),
    (v_case_id, 'What is the prognosis for most obstetric brachial plexus injuries?', '["Permanent paralysis", "Most (80-90%) recover spontaneously within 3-6 months", "Always requires surgery", "None"]', 1, 'Conservative management and PT are usually effective.');

    ---------------------------------------------------------------------------
    -- CASE 21: Breastfeeding Benefits (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Best for Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Best for Baby', 'A mother is asking why she should breastfeed.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Best for Baby', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary antibody found in breast milk?', '["IgG", "Secretory IgA", "IgM", "IgE"]', 1, 'IgA provides local immunity to the infant''s gut.'),
    (v_case_id, 'Breastfeeding reduces the risk of which neonatal condition?', '["Otitis media, GI infections, and Necrotizing Enterocolitis", "Diabetes", "Autism", "None"]', 0, 'The immunological benefits are vast.'),
    (v_case_id, 'What is a maternal benefit of breastfeeding?', '["Faster uterine involution and decreased risk of breast/ovarian cancer", "Weight gain", "Better eyesight", "None"]', 0, 'Oxytocin release during nursing helps the uterus contract.');

    ---------------------------------------------------------------------------
    -- CASE 22: Breastfeeding Contraindications (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When NOT to Breastfeed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When NOT to Breastfeed', 'A physician is screening a mother for contraindications to nursing.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'When NOT to Breastfeed', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the US, which maternal infection is an absolute contraindication to breastfeeding?', '["Hepatitis B", "HIV", "Common cold", "Genital warts"]', 1, 'HIV can be transmitted via breast milk; formula is recommended in high-resource settings.'),
    (v_case_id, 'Can a mother with active, untreated Tuberculosis breastfeed?', '["Yes", "No, she should be isolated from the baby until treated and non-contagious", "Only with a mask", "None"]', 1, 'The risk of respiratory transmission is high.'),
    (v_case_id, 'What is a contraindication based on the INFANT''S health?', '["Prematurity", "Galactosemia (infant cannot metabolize galactose)", "Jaundice", "None"]', 1, 'Infants with galactosemia need specialized formula.');

    ---------------------------------------------------------------------------
    -- CASE 23: Mastitis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painful Nursing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painful Nursing', 'A breastfeeding mother has a painful, red, warm area on her right breast and a fever of 101F.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Painful Nursing', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Engorgement", "Mastitis", "Breast cancer", "None"]', 1, 'Mastitis is an infection of the breast tissue.'),
    (v_case_id, 'What is the most common causative organism?', '["E. coli", "Staph aureus", "GBS", "None"]', 1, 'Staph aureus from the baby''s mouth or maternal skin enters through nipple cracks.'),
    (v_case_id, 'Should the mother CONTINUE to breastfeed from the affected side?', '["No, it will poison the baby", "Yes, frequent emptying of the breast is a critical part of treatment", "Only after 1 week", "None"]', 1, 'Stopping nursing increases the risk of abscess formation.');

    ---------------------------------------------------------------------------
    -- CASE 24: Diaphragmatic Hernia (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Respiratory Failure and Scaphoid Abdomen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Respiratory Failure and Scaphoid Abdomen', 'A newborn has severe respiratory distress and a hollowed-out (scaphoid) abdomen.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Respiratory Failure and Scaphoid Abdomen', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pneumonia", "Congenital Diaphragmatic Hernia (CDH)", "TEF", "None"]', 1, 'Abdominal contents herniate into the chest, preventing lung development.'),
    (v_case_id, 'On which side do most CDHs occur?', '["Right", "Left (Bochdalek hernia)", "Middle", "None"]', 1, 'Left-sided hernias are most common.'),
    (v_case_id, 'What is the immediate management for a baby with suspected CDH?', '["Start PPV with a mask", "Immediate intubation (to avoid inflating the stomach in the chest)", "Give oxygen", "None"]', 1, 'Avoid bag-mask ventilation as it distends the herniated bowel and further compresses the lung.');

    ---------------------------------------------------------------------------
    -- CASE 25: Polycythemia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Thick Blood' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Thick Blood', 'A baby born to a mother with poorly controlled diabetes has a hematocrit of 70%.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Thick Blood', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of neonatal polycythemia?', '["Hct > 45%", "Venous Hematocrit > 65%", "Hct > 50%", "None"]', 1, 'High Hct increases blood viscosity.'),
    (v_case_id, 'What is a common symptom of polycythemia?', '["Pale skin", "Plethora (ruddy appearance), lethargy, and jitteriness", "Fast heart rate", "None"]', 1, 'High viscosity can lead to poor organ perfusion.'),
    (v_case_id, 'What is a potential complication as the excess RBCs break down?', '["Hypoglycemia", "Hyperbilirubinemia", "Anemia", "None"]', 1, 'More RBCs = more heme = more bilirubin.');

    ---------------------------------------------------------------------------
    -- CASE 26: Gastroschisis vs Omphalocele (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Abdominal Wall Defects' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Abdominal Wall Defects', 'A baby is born with bowel loops protruding through the abdominal wall.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Abdominal Wall Defects', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the defect called if the bowel is NOT covered by a membrane and is to the right of the cord?', '["Omphalocele", "Gastroschisis", "Hernia", "None"]', 1, 'Gastroschisis is an uncovered defect.'),
    (v_case_id, 'What is an Omphalocele?', '["Bowel out to the right", "Herniation into the umbilical cord covered by a membrane (peritoneum/amnion)", "A hole in the stomach", "None"]', 1, 'Omphaloceles are covered and usually midline.'),
    (v_case_id, 'Which one is more frequently associated with other chromosomal anomalies?', '["Gastroschisis", "Omphalocele", "Both", "Neither"]', 1, 'Omphaloceles have a high association with Trisomies and syndromes like Beckwith-Wiedemann.');

    ---------------------------------------------------------------------------
    -- CASE 27: Neonatal HSV (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Herpes in the Newborn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Herpes in the Newborn', 'A 10-day-old infant develops vesicles on the scalp and lethargy.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Herpes in the Newborn', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Yeast infection", "Neonatal Herpes Simplex Virus (HSV)", "Chickenpox", "None"]', 1, 'Vesicles are the hallmark, but some babies present with only CNS or disseminated disease.'),
    (v_case_id, 'What is the treatment for neonatal HSV?', '["Antibiotics", "Acyclovir", "Steroids", "None"]', 1, 'High-dose IV Acyclovir is life-saving.'),
    (v_case_id, 'How do most babies acquire HSV?', '["In utero", "During birth via an infected birth canal", "From the air", "None"]', 1, 'Peripartum transmission is the most common route.');

    ---------------------------------------------------------------------------
    -- CASE 28: Subgaleal Hemorrhage (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dangerous Scalp Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dangerous Scalp Swelling', 'Following a vacuum delivery, a baby''s head swelling increases rapidly and crosses the suture lines. The baby becomes pale and tachycardic.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dangerous Scalp Swelling', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Caput", "Cephalohematoma", "Subgaleal Hemorrhage", "Skull fracture"]', 2, 'Subgaleal hemorrhage involves bleeding into the large potential space between the periosteum and the aponeurosis.'),
    (v_case_id, 'Why is this an emergency?', '["It looks bad", "The baby can lose up to 40% of their blood volume into this space, leading to shock", "It causes deafness", "None"]', 1, 'The subgaleal space is large enough for a massive, fatal hemorrhage.'),
    (v_case_id, 'How is it distinguished from cephalohematoma?', '["It is smaller", "It CROSSES the suture lines and the swelling is often mobile/fluctuant", "It is only in preemies", "None"]', 1, 'Crossing sutures is the key distinguishing feature.');

    ---------------------------------------------------------------------------
    -- CASE 29: Congenital Syphilis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Congenital Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Congenital Infection', 'A baby is born with snuffles (rhinitis), a maculopapular rash on the palms and soles, and an enlarged liver.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital Infection', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["HIV", "Congenital Syphilis", "Toxoplasmosis", "None"]', 1, 'Snuffles and the specific rash are classic early signs.'),
    (v_case_id, 'What is a late skeletal finding of syphilis?', '["Broken bones", "Saber shins and Hutchinson teeth", "Short height", "None"]', 1, 'Untreated syphilis causes permanent deformities.'),
    (v_case_id, 'What is the treatment for neonatal syphilis?', '["Penicillin G", "Doxycycline", "Azithromycin", "None"]', 0, 'Penicillin is the only effective treatment.');

    ---------------------------------------------------------------------------
    -- CASE 30: Tracheoesophageal Fistula - TEF (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Drooling and Choking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Drooling and Choking', 'A newborn is drooling excessively and chokes during the first attempt at feeding.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Drooling and Choking', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pyloric stenosis", "Esophageal Atresia with Tracheoesophageal Fistula (TEF)", "Cleft palate", "None"]', 1, 'Inability to pass a gastric tube confirms the atresia.'),
    (v_case_id, 'What is the most common VACTERL association?', '["Heart", "Vertebral, Anal, Cardiac, Tracheal, Esophageal, Renal, Limb", "Brain", "None"]', 1, 'TEF is often part of this multi-system anomaly cluster.'),
    (v_case_id, 'What is a risk in a baby with TEF?', '["Aspiration pneumonia", "Diabetes", "Twins", "None"]', 0, 'Saliva and feeds enter the lungs through the fistula.');

    ---------------------------------------------------------------------------
    -- CASE 31: Colostrum (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Milk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Milk', 'A mother is worried because she is only producing a few teaspoons of thick, yellow fluid.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The First Milk', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this fluid called?', '["Pus", "Colostrum", "Serum", "None"]', 1, 'Colostrum is the highly concentrated first milk.'),
    (v_case_id, 'What is colostrum rich in?', '["Sugar", "Antibodies (IgA) and protein", "Fat", "Water"]', 1, 'It is perfectly designed for the newborn''s immune system and small stomach capacity.'),
    (v_case_id, 'When does \"mature\" milk usually come in?', '["Day 1", "Day 3 to 5", "Week 2", "None"]', 1, 'Volume increases significantly as the milk transitions.');

    ---------------------------------------------------------------------------
    -- CASE 32: Breast milk jaundice (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Late Onset Jaundice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Late Onset Jaundice', 'A healthy, exclusively breastfed 10-day-old baby has persistent jaundice.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Late Onset Jaundice', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Biliary Atresia", "Breast Milk Jaundice", "ABO incompatibility", "None"]', 1, 'Breast milk jaundice is a benign condition starting at 1 week and peaking at 2-3 weeks.'),
    (v_case_id, 'What is the mechanism?', '["Not enough milk", "Components in breast milk (like beta-glucuronidase) increase enterohepatic circulation of bilirubin", "Infection", "None"]', 1, 'The milk itself promotes reabsorption of bilirubin.'),
    (v_case_id, 'Should the mother stop breastfeeding?', '["Yes", "No, it is a benign condition and nursing should continue", "Only if it is red", "None"]', 1, 'Bilirubin will eventually decline without intervention.');

    ---------------------------------------------------------------------------
    -- CASE 33: Breastfeeding Jaundice (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dehydration and Jaundice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dehydration and Jaundice', 'A 4-day-old baby has lost 12% of birth weight and is jaundiced.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dehydration and Jaundice', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Breast Milk Jaundice", "BreastFEEDING Jaundice (Lactation failure jaundice)", "Sepsis", "None"]', 1, 'This is caused by insufficient milk intake and dehydration.'),
    (v_case_id, 'How does dehydration increase bilirubin?', '["It makes blood thicker", "Reduced stooling leads to increased enterohepatic circulation of bilirubin", "It doesn''t", "None"]', 1, 'If the baby doesn''t poop, the bilirubin gets reabsorbed.'),
    (v_case_id, 'What is the management?', '["Stop breastfeeding", "Optimize nursing frequency and position (lactation support)", "Give water", "None"]', 1, 'Improving intake is the key; water is NOT recommended.');

    ---------------------------------------------------------------------------
    -- CASE 34: PPHN - Persistent Pulmonary Hypertension (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fetal Circulation Persists' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fetal Circulation Persists', 'A term baby born after meconium aspiration has severe cyanosis that does not improve with 100% oxygen.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fetal Circulation Persists', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Congenital heart disease", "Persistent Pulmonary Hypertension of the Newborn (PPHN)", "TTN", "None"]', 1, 'PPHN involves high pulmonary vascular resistance and right-to-left shunting.'),
    (v_case_id, 'What is a specific treatment for PPHN?', '["Antibiotics", "Inhaled Nitric Oxide (iNO)", "Surfactant only", "None"]', 1, 'Nitric oxide is a potent pulmonary vasodilator.'),
    (v_case_id, 'What is the ultimate \"rescue\" therapy for severe PPHN or respiratory failure?', '["More oxygen", "ECMO (Extracorporeal Membrane Oxygenation)", "Surgery", "None"]', 1, 'ECMO acts as a lung/heart bypass until the baby recovers.');

    ---------------------------------------------------------------------------
    -- CASE 35: Congenital CMV (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'TORCH - CMV' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'TORCH - CMV', 'A newborn is noted to have microcephaly, a \"blueberry muffin\" rash, and periventricular calcifications on brain ultrasound.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'TORCH - CMV', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Toxoplasmosis", "Congenital Cytomegalovirus (CMV)", "Rubella", "Syphilis"]', 1, 'Periventricular calcifications are classic for CMV.'),
    (v_case_id, 'What is a common long-term disability associated with congenital CMV?', '["Diabetes", "Sensorineural hearing loss", "Blindness", "None"]', 1, 'CMV is the #1 non-genetic cause of childhood hearing loss.'),
    (v_case_id, 'What is the treatment for symptomatic congenital CMV?', '["Antibiotics", "Ganciclovir or Valganciclovir", "Steroids", "None"]', 1, 'Antivirals can improve hearing and developmental outcomes.');

    ---------------------------------------------------------------------------
    -- CASE 36: Congenital Toxoplasmosis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'TORCH - Toxo' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'TORCH - Toxo', 'A newborn has hydrocephalus, chorioretinitis, and diffuse (scattered) intracranial calcifications.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'TORCH - Toxo', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["CMV", "Congenital Toxoplasmosis", "Herpes", "None"]', 1, 'Diffuse calcifications and hydrocephalus favor Toxo over CMV.'),
    (v_case_id, 'What is the classic triad of toxoplasmosis?', '["Fever, Rash, Pain", "Hydrocephalus, Chorioretinitis, Intracranial Calcifications", "Cough, Cold, Fever", "None"]', 1, 'This is a common board-exam triad.'),
    (v_case_id, 'How do mothers typically acquire toxoplasmosis?', '["Unwashed vegetables and cat feces", "Through the air", "From water", "None"]', 0, 'Parasite (T. gondii) is found in soil and cat litter.');

    ---------------------------------------------------------------------------
    -- CASE 37: Neonatal Drug Withdrawal - NAS (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Abstinence Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Abstinence Syndrome', 'A baby born to a mother with an opioid use disorder is hyper-irritable, has a high-pitched cry, and is sneezing frequently.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neonatal Abstinence Syndrome', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis", "Neonatal Abstinence Syndrome (NAS)", "Normal behavior", "None"]', 1, 'Withdrawal from opioids causes CNS and GI over-stimulation.'),
    (v_case_id, 'What is the \"Eat, Sleep, Console\" method?', '["Feeding the baby more", "A management approach focusing on non-pharmacological care (swaddling, quiet room, frequent feeds)", "A type of med", "None"]', 1, 'Non-drug care is the first-line treatment.'),
    (v_case_id, 'What medication is used if non-pharmacological care fails?', '["Antibiotics", "Morphine or Methadone", "Aspirin", "None"]', 1, 'Gradual weaning of opioids may be necessary.');

    ---------------------------------------------------------------------------
    -- CASE 38: Clavicular Fracture (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Birth Injury - Clavicle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Birth Injury - Clavicle', 'A large baby was born after a difficult delivery. He is noted to have crepitus over the right collarbone.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Birth Injury - Clavicle', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Arm fracture", "Clavicular Fracture", "Dislocated shoulder", "None"]', 1, 'Clavicle fracture is the most common birth-related fracture.'),
    (v_case_id, 'What is the management?', '["Casting", "Supportive care (pinning the sleeve to the shirt to limit movement) and pain management", "Surgery", "None"]', 1, 'These fractures heal rapidly with minimal intervention.'),
    (v_case_id, 'What is a common sign of healing seen a few weeks later?', '["A hole", "A palpable lump (callus formation)", "Nothing", "None"]', 1, 'The callus is a normal part of the healing process.');

    ---------------------------------------------------------------------------
    -- CASE 39: Intraventricular Hemorrhage - IVH (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bleeding in the Brain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bleeding in the Brain', 'A 24-week preemie has a sudden drop in hematocrit and a bulging fontanelle.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bleeding in the Brain', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Sepsis", "Intraventricular Hemorrhage (IVH)", "Brain tumor", "None"]', 1, 'Fragile germinal matrix vessels are prone to bleeding in early preemies.'),
    (v_case_id, 'How is IVH diagnosed?', '["CT scan", "Cranial Ultrasound", "MRI", "None"]', 1, 'Head US is the preferred bedside screening tool.'),
    (v_case_id, 'What maternal medication reduces the risk of IVH in preemies?', '["Antibiotics", "Antenatal Corticosteroids (e.g., Betamethasone)", "Aspirin", "None"]', 1, 'Steroids stabilize the fragile vessels.');

    ---------------------------------------------------------------------------
    -- CASE 40: Retinopathy of Prematurity - ROP (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eye Care for Preemies' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eye Care for Preemies', 'A very low birth weight infant requires prolonged high-concentration oxygen.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Eye Care for Preemies', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What eye condition is this infant at risk for?', '["Cataracts", "Retinopathy of Prematurity (ROP)", "Glaucoma", "None"]', 1, 'High oxygen can trigger abnormal vascular proliferation in the retina.'),
    (v_case_id, 'What is the main risk of severe ROP?', '["Eye pain", "Retinal detachment and blindness", "Pink eye", "None"]', 1, 'Untreated ROP is a major cause of childhood blindness.'),
    (v_case_id, 'What is a current treatment for severe ROP?', '["Vitamins", "Laser photocoagulation or anti-VEGF injections", "Surgery", "None"]', 1, 'Intervention aims to stop the abnormal vessel growth.');

    ---------------------------------------------------------------------------
    -- CASE 41: Breastfeeding Positions (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mastering the Latch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mastering the Latch', 'A mother is having trouble getting her baby to latch.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mastering the Latch', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important factor for pain-free breastfeeding?', '["Size of the breast", "Proper latch (deep mouthful of breast tissue, not just the nipple)", "Using a bottle", "None"]', 1, 'A shallow latch causes nipple trauma and pain.'),
    (v_case_id, 'Which position is often recommended after a C-section to avoid pressure on the incision?', '["Cradle hold", "Football hold", "Side-lying", "Both Football and Side-lying"]', 3, 'These avoid placing the baby across the abdomen.'),
    (v_case_id, 'How can you tell if the latch is deep?', '["The baby''s lips are flanged out and more of the areola is visible above the top lip", "The baby is crying", "It hurts", "None"]', 0, 'Visual cues help confirm a good latch.');

    ---------------------------------------------------------------------------
    -- CASE 42: Breast Milk Storage (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pumping and Storing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pumping and Storing', 'A mother is returning to work and needs to store her milk.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pumping and Storing', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long is freshly expressed breast milk safe at room temperature?', '["1 hour", "Up to 4 hours (ideally)", "24 hours", "None"]', 1, 'Guidelines vary slightly but 4 hours is standard.'),
    (v_case_id, 'How long can breast milk be stored in a standard refrigerator?', '["1 day", "Up to 4 days", "1 month", "None"]', 1, 'Storage in the back of the fridge is best.'),
    (v_case_id, 'What is the best way to thaw frozen breast milk?', '["Microwave", "Overnight in the refrigerator or in a bowl of warm water", "Room temperature for 2 days", "None"]', 1, 'Microwaving creates \"hot spots\" and can destroy nutrients.');

    ---------------------------------------------------------------------------
    -- CASE 43: Down Syndrome Neonatal Signs (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Recognizing Trisomy 21' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Recognizing Trisomy 21', 'A newborn is noted to have hypotonia and a single transverse palmar crease.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recognizing Trisomy 21', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are other common neonatal signs of Down Syndrome?', '["Large head", "Flat nasal bridge, upslanting palpebral fissures, and a protruding tongue", "Long fingers", "None"]', 1, 'These facial features are characteristic.'),
    (v_case_id, 'What cardiac anomaly is strongly associated with Down Syndrome?', '["Valve problem", "Atrioventricular (AV) Canal Defect", "Coarctation", "None"]', 1, 'Endocardial cushion defects are seen in 40-50% of Down syndrome infants.'),
    (v_case_id, 'What GI anomaly is a classic finding in Down Syndrome?', '["Reflux", "Duodenal Atresia (\"Double-bubble\" sign on X-ray)", "Constipation", "None"]', 1, 'The double bubble represents the dilated stomach and duodenum.');

    ---------------------------------------------------------------------------
    -- CASE 44: Biliary Atresia (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Direct Hyperbilirubinemia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Direct Hyperbilirubinemia', 'A 3-week-old infant has persistent jaundice and pale (acholic) stools.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Direct Hyperbilirubinemia', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of hyperbilirubinemia is expected here?', '["Unconjugated", "Conjugated (Direct)", "Both", "None"]', 1, 'Acholic stools suggest an obstruction of the biliary tract.'),
    (v_case_id, 'What is the likely diagnosis?', '["Physiological jaundice", "Biliary Atresia", "ABO incompatibility", "None"]', 1, 'Progressive obliteration of the extrahepatic biliary tree.'),
    (v_case_id, 'What is the surgical treatment for Biliary Atresia?', '["Kasai procedure (Hepatoportoenterostomy)", "Hysterectomy", "D&C", "None"]', 0, 'Early surgical intervention (before 60 days) is critical to prevent liver failure.');

    ---------------------------------------------------------------------------
    -- CASE 45: Neonatal Acne (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Newborn Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Newborn Skin', 'A 2-week-old has small red papules and pustules on his cheeks.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Newborn Skin', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Impetigo", "Neonatal Cephalic Pustulosis (Neonatal acne)", "Sepsis", "None"]', 1, 'It is caused by maternal hormones and Malassezia species.'),
    (v_case_id, 'What is the management?', '["Antibiotics", "Reassurance (it usually resolves spontaneously by 3-4 months)", "Steroids", "None"]', 1, 'No treatment is necessary for most cases.'),
    (v_case_id, 'What are \"Milia\"?', '["Zits", "Small white pearly papules on the nose and cheeks (trapped keratin)", "Moles", "None"]', 1, 'Milia are very common and harmless in newborns.');

    ---------------------------------------------------------------------------
    -- CASE 46: Erb''s vs Klumpke''s (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reflexes and Nerve Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reflexes and Nerve Injury', 'A baby with a right-sided brachial plexus injury is being tested for reflexes.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reflexes and Nerve Injury', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In Erb''s palsy (C5-C6), which reflex is typically ABSENT?', '["Moro reflex (on the affected side)", "Sucking reflex", "Blink reflex", "None"]', 0, 'The inability to abduct the arm impairs the Moro response.'),
    (v_case_id, 'In Klumpke''s palsy (C8-T1), which reflex is ABSENT?', '["Moro", "Grasp reflex", "Rooting", "None"]', 1, 'Klumpke''s affects the small muscles of the hand.'),
    (v_case_id, 'What is Horner''s Syndrome?', '["Ear problem", "Miosis, Ptosis, and Anhidrosis (sometimes seen with Klumpke''s if the sympathetic fibers are involved)", "Weight loss", "None"]', 1, 'Horner''s suggests a deeper nerve root involvement.');

    ---------------------------------------------------------------------------
    -- CASE 47: Caput Succedaneum (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Molded Head' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Molded Head', 'A baby born after a long second stage has a puffy head.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Molded Head', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for soft tissue edema of the scalp?', '["Cephalohematoma", "Caput Succedaneum", "Brain tumor", "None"]', 1, 'It is caused by pressure on the head during labor.'),
    (v_case_id, 'Does Caput cross suture lines?', '["No", "Yes", "Only in preemies", "None"]', 1, 'It is above the periosteum, so it can spread freely.'),
    (v_case_id, 'How long does it take to resolve?', '["1 month", "2-3 days", "1 year", "None"]', 1, 'It is a very transient finding.');

    ---------------------------------------------------------------------------
    -- CASE 48: Neonatal Polycythemia - Risks (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hyperviscosity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hyperviscosity', 'A baby with polycythemia is being monitored in the NICU.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hyperviscosity', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a major risk factor for neonatal polycythemia?', '["Small mothers", "Maternal diabetes and IUGR (due to chronic fetal hypoxia)", "Fast labor", "None"]', 1, 'Chronic hypoxia triggers increased erythropoietin production.'),
    (v_case_id, 'What is a treatment for symptomatic polycythemia?', '["Blood transfusion", "Partial Exchange Transfusion (replacing blood with saline to dilute it)", "Aspirin", "None"]', 1, 'Diluting the blood reduces the viscosity.'),
    (v_case_id, 'Polycythemia can lead to which metabolic complication?', '["Hypercalcemia", "Hypoglycemia", "Hypothyroidism", "None"]', 1, 'Increased RBC mass consumes more glucose.');

    ---------------------------------------------------------------------------
    -- CASE 49: Umbilical Cord Care (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Caring for the Stump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Caring for the Stump', 'A mother asks how to clean the baby''s cord.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Caring for the Stump', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current recommendation for cord care?', '["Alcohol swabs every hour", "Keep dry and clean (dry cord care)", "Antibiotic ointment", "None"]', 1, 'Applying alcohol can actually delay the cord falling off.'),
    (v_case_id, 'When does the umbilical cord usually fall off?', '["1 day", "7 to 14 days", "1 month", "None"]', 1, 'The stump undergoes dry gangrene and separates naturally.'),
    (v_case_id, 'What is \"Omphalitis\"?', '["A normal cord", "Infection of the umbilical stump (a surgical emergency)", "A hernia", "None"]', 1, 'Redness spreading to the surrounding skin warrants immediate evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 10: Congenital Hypothyroidism (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sleepy Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sleepy Baby', 'A 2-week-old baby has poor feeding, a large tongue (macroglossia), and a persistent umbilical hernia.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sleepy Baby', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Down Syndrome", "Congenital Hypothyroidism (Cretinism)", "Sepsis", "None"]', 1, 'Macroglossia and umbilical hernia are classic signs.'),
    (v_case_id, 'Why is this disorder screened for in newborns?', '["To check weight", "Early replacement of thyroid hormone is crucial to prevent permanent intellectual disability", "To check height", "None"]', 1, 'The brain requires thyroid hormone for development.'),
    (v_case_id, 'What is the most common cause of congenital hypothyroidism?', '["Iodine deficiency", "Thyroid dysgenesis (absent or poorly formed gland)", "Brain tumor", "None"]', 1, 'In high-resource settings, dysgenesis is the most common cause.');

    RAISE NOTICE 'SUCCESS: 50 Neonatology & Newborn Resuscitation Case Blocks registered.';
END $$;

COMMIT;
