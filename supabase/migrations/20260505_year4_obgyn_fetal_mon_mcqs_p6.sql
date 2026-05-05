BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review and Integration)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A patient at 40 weeks has "Category I" tracing with contractions every 2-3 minutes. She has been pushing for 3 hours. Next step?', '["Immediate C-section", "Allow another hour of pushing (if mother/fetus stable) per current guidelines", "Forceps now", "Vacuum now"]', 1, 'Guidelines allow for 3+ hours in nulliparous women with epidural. (ACOG)'),
    (v_topic_id, '302: A "Prolonged Deceleration" occurs immediately after "Rupture of Membranes." First suspected diagnosis?', '["Placenta Previa", "Umbilical Cord Prolapse", "GDM", "Pre-eclampsia"]', 1, 'Acute change with ROM suggests cord. (Beckmann)'),
    (v_topic_id, '303: In "Shoulder Dystocia," if McRoberts and Suprapubic pressure fail, and the posterior arm is NOT reachable, what is the next step?', '["Zavanelli", "Rotation maneuvers (Woods/Rubin) or Roll the patient (Gaskin)", "C-section", "Wait"]', 1, 'Moving through the algorithm. (ACOG)'),
    (v_topic_id, '304: A woman with "Uterine Atony" has failed Oxytocin and Methergine. She has "Asthma." Which medication is CONTRAINDICATED?', '["Misoprostol", "Hemabate (PGF2-alpha)", "TXA", "Antibiotics"]', 1, 'Hemabate causes bronchoconstriction. (ACOG)'),
    (v_topic_id, '305: A woman with "Uterine Atony" has "Severe Hypertension" (170/110). Which medication is CONTRAINDICATED?', '["Oxytocin", "Methergine (Methylergonovine)", "Hemabate", "Misoprostol"]', 1, 'Methergine causes severe vasoconstriction and risk of stroke in HTN. (ACOG)'),
    (v_topic_id, '306: "Fetal Scalp stimulation" results in an acceleration. What is the chance that the pH is > 7.20?', '["50%", "75%", "> 99%", "0%"]', 2, 'Highly reliable test for ruling out acidosis. (Beckmann)'),
    (v_topic_id, '307: "BPP" - "Breathing" is scored as 2 if there is at least one episode of fetal breathing lasting >= _____ seconds.', '["10", "30", "60", "None"]', 1, 'Must be seen in a 30-minute window. (Williams)'),
    (v_topic_id, '308: A "BPP" of 10/10 at 41 weeks indicates the risk of stillbirth in the next week is:', '["1 in 10", "1 in 100", "Extremely low (~1 in 1000)", "High"]', 2, 'High negative predictive value. (ACOG)'),
    (v_topic_id, '309: "Amniotic Fluid Index" (AFI) is the sum of the vertical pockets in _____ quadrants.', '["1", "2", "4", "8"]', 2, 'Standard measurement technique. (Beckmann)'),
    (v_topic_id, '310: "Single Deepest Pocket" (SDP) of < _____ cm is defined as oligohydramnios.', '["1", "2", "5", "None"]', 1, 'Alternative to AFI. (ACOG)'),
    (v_topic_id, '311: In "Twin" monitoring, how do you distinguish the two heart rates?', '["One is always faster", "Use dual channels and ensure they are different by at least 5-10 bpm (check maternal pulse as well)", "Guess", "None"]', 1, 'Crucial to ensure you are not monitoring the same twin twice. (Williams)'),
    (v_topic_id, '312: "Instrumental" delivery - A "Cephalohematoma" in the neonate:', '["Crosses suture lines", "Does NOT cross suture lines", "Is an emergency", "None"]', 1, 'Bleeding under the periosteum. (Beckmann)'),
    (v_topic_id, '313: "Instrumental" delivery - A "Caput Succedaneum":', '["Crosses suture lines", "Does not cross", "Is blood", "None"]', 0, 'Edema of the scalp. (Williams)'),
    (v_topic_id, '314: "Subgaleal Hemorrhage" presents with:', '["Firm mass", "Fluctuant mass that crosses suture lines and shifts with movement; baby shows signs of shock", "No mass", "None"]', 1, 'The most dangerous neonatal scalp complication of vacuum. (Beckmann)'),
    (v_topic_id, '315: "Fetal Heart Rate" baseline - If it shifts from 130 to 170 for 15 minutes, it is:', '["A prolonged acceleration", "A baseline change (Tachycardia)", "Normal", "None"]', 1, 'Defined by the 10-minute rule. (ACOG)'),
    (v_topic_id, '316: "Periodic" decelerations happen with contractions. "Episodic" decelerations happen:', '["Only with movement", "Independently of contractions", "Only in sleep", "None"]', 1, 'Important distinction for identifying cause. (Williams)'),
    (v_topic_id, '317: "Uterine Atony" - "Fundal Massage" should be performed:', '["Only if there is bleeding", "Continuously or at frequent intervals after the 3rd stage of labor", "Once", "Never"]', 1, 'Standard prophylactic measure. (ACOG)'),
    (v_topic_id, '318: "Retained Placenta" - "Manual Removal" technique?', '["Pull the cord", "Insert hand into the uterus, find the cleavage plane, and sweep to separate", "Use a spoon", "None"]', 1, 'Standard clinical procedure. (Beckmann)'),
    (v_topic_id, '319: "Placenta Accreta" Spectrum (PAS) - "Increta" means:', '["Attached to myometrium", "Invades INTO the myometrium", "Grows through to the bladder", "None"]', 1, 'Intermediate severity. (Williams)'),
    (v_topic_id, '320: "Placenta Accreta" Spectrum (PAS) - "Accreta" (proper) means:', '["Attached directly to the myometrium due to absence of decidua basalis", "Invasive", "Infected", "None"]', 0, 'Most common form (75%). (Williams)'),
    (v_topic_id, '321: "Umbilical Artery" gas: pH 7.05, PCO2 80, Bicarb 20.', '["Metabolic acidosis", "Respiratory acidosis (likely acute)", "Normal", "None"]', 1, 'High PCO2 indicates respiratory origin. (ACOG)'),
    (v_topic_id, '322: "Umbilical Artery" gas: pH 6.95, PCO2 50, Bicarb 12.', '["Respiratory acidosis", "Metabolic acidosis (concerning for chronic hypoxia)", "Normal", "None"]', 1, 'Low bicarb indicates metabolic component. (ACOG)'),
    (v_topic_id, '323: "Fetal scalp" - "Caput" can lead to "Overestimation" of descent (station).', '["True", "False", "Only in GDM", "None"]', 0, 'Head may be higher than it seems if the scalp is very swollen. (Beckmann)'),
    (v_topic_id, '324: "Uterine Rupture" - The most common prior surgery associated with rupture is:', '["Appendectomy", "Cesarean Section", "Gallbladder", "None"]', 1, 'Weakens the uterine wall. (Williams)'),
    (v_topic_id, '325: "Vasa Previa" - Which "test" can quickly confirm if bleeding is fetal?', '["Glucose", "Apt test (Alkali denaturation)", "Nitrazine", "None"]', 1, 'High-yield for emergency diagnostics. (Beckmann)'),
    (v_topic_id, '326: "PPH" - "Bakri Balloon" - What is the "drainage" port for?', '["To give fluids", "To monitor for ongoing bleeding within the cavity", "To give oxytocin", "None"]', 1, 'Allows for quantification of blood loss above the balloon. (ACOG)'),
    (v_topic_id, '327: "Amniotic Fluid Embolism" - If ROSC is not achieved within _____ minutes of arrest, PMCD should be started.', '["2", "4", "10", "30"]', 1, 'Crucial for survival. (AHA)'),
    (v_topic_id, '328: "Category III" tracing - Is a C-section always mandatory?', '["Yes, immediately", "Yes, if intrauterine resuscitation fails to improve it to Category II or I", "No", "None"]', 1, 'Resuscitation can sometimes resolve a temporary insult. (ACOG)'),
    (v_topic_id, '329: "Category II" tracing - "Recurrent Variable Decelerations" with "Moderate" variability. Best first-line intervention?', '["C-section", "Amnioinfusion (if ROM) or Repositioning", "Wait", "Antibiotics"]', 1, 'Address the cord compression. (ACOG)'),
    (v_topic_id, '330: "Category II" tracing - "Late Decelerations" with "Moderate" variability. Best first-line intervention?', '["Wait", "Intrauterine resuscitation (Position, O2, IVF, Stop Pitocin)", "C-section", "None"]', 1, 'Address the placental blood flow. (ACOG)'),
    (v_topic_id, '331: "Fetal Scalp stimulation" is performable on which fetal part?', '["Hand", "Foot", "Scalp (Presenting head)", "None"]', 2, 'Targeting the CNS via the head. (Beckmann)'),
    (v_topic_id, '332: "IUPC" - "Adequate" labor is usually _____ MVUs in 10 minutes.', '["100", "200-250", "400", "50"]', 1, 'Used to guide oxytocin titration. (Williams)'),
    (v_topic_id, '333: "Uterine Tachysystole" - Does it ALWAYS mean the fetus is in distress?', '["Yes", "No, but it increases the risk and should be managed", "Only in GDM", "None"]', 1, 'Many fetuses compensate well initially. (ACOG)'),
    (v_topic_id, '334: "Umbilical Cord" - Number of vessels?', '["1 Artery, 1 Vein", "2 Arteries, 1 Vein", "2 Veins, 1 Artery", "None"]', 1, 'Arteries carry deoxygenated blood away; Vein carries oxygenated blood in. (Beckmann)'),
    (v_topic_id, '335: What is the most important factor in the successful management of an "Obstetric Emergency"?', '["Meds", "Equipment", "A coordinated, multi-disciplinary team response and regular \"Drills\"", "A fast surgeon"]', 2, 'Communication and teamwork save lives. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Fetal Monitoring & Emergencies registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
