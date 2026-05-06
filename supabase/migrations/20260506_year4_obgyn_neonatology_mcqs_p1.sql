BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- Check if topic exists, otherwise create it
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-neonatology' LIMIT 1;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (title, slug, section, year_id) 
        VALUES ('Neonatology & newborn resuscitation', 'obgyn-neonatology', 'Obstetrics & Gynecology', 4)
        RETURNING id INTO v_topic_id;
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates without a global constraint
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 1: 1-60 (Initial Resuscitation and APGAR)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('1: Immediately after birth, what is the most important and effective action in neonatal resuscitation?', '["Chest compressions", "Ventilation of the lungs", "Administering epinephrine", "Providing supplemental oxygen"]', 1, 'Establishing effective ventilation is the primary goal and most effective step. (NRP Guidelines)'),
    ('2: What are the three rapid evaluation questions asked immediately after birth to determine if a baby can stay with the mother?', '["Term gestation? Good tone? Breathing or crying?", "Heart rate > 100? Pink color? Breathing?", "Term gestation? Clear fluid? Heart rate > 100?", "Good tone? Breathing? Clear fluid?"]', 0, 'If the answer to all three is YES, the baby stays with the mother for routine care. (NRP)'),
    ('3: If a newborn is apneic, gasping, or has a heart rate < 100 bpm after the initial steps, what is the immediate next step?', '["Start CPAP", "Initiate Positive Pressure Ventilation (PPV)", "Start chest compressions", "Intubate immediately"]', 1, 'PPV is indicated if the HR is < 100 or if the baby is apneic/gasping. (NRP)'),
    ('4: When starting PPV for a term newborn, what should the initial oxygen concentration be?', '["100%", "50%", "21% (Room Air)", "30%"]', 2, 'To avoid oxygen toxicity, resuscitation of term infants starts with 21% O2. (NRP)'),
    ('5: For a preterm infant (< 35 weeks), what is the recommended starting oxygen concentration for PPV?', '["21%", "21-30%", "50%", "100%"]', 1, 'Preterm infants may require slightly more oxygen, but 100% is avoided to prevent oxidative stress. (NRP)'),
    ('6: What is the target pre-ductal SpO2 at 1 minute of life?', '["95-100%", "85-90%", "60-65%", "75-80%"]', 2, 'Oxygen saturation rises gradually; 60-65% at 1 min is normal. (NRP)'),
    ('7: Where should the pulse oximeter probe be placed to measure pre-ductal saturation?', '["Left hand", "Right hand or wrist", "Right foot", "Left foot"]', 1, 'The right arm receives blood from the brachiocephalic artery, which branches before the ductus arteriosus. (NRP)'),
    ('8: The mnemonic MR. SOPA is used to troubleshoot what step in resuscitation?', '["Chest compressions", "Medication administration", "Ineffective ventilation (PPV)", "Intubation"]', 2, 'Mask adjustment, Reposition airway, Suction mouth/nose, Open mouth, Pressure increase, Airway alternative. (NRP)'),
    ('9: When are chest compressions indicated in neonatal resuscitation?', '["HR < 100 despite 30 seconds of PPV", "HR < 60 despite at least 30 seconds of effective PPV", "Immediately if HR < 60 at birth", "If baby is cyanotic"]', 1, 'Effective ventilation must be established first. (NRP)'),
    ('10: What is the recommended compression-to-ventilation ratio for neonatal resuscitation?', '["15 to 2", "30 to 2", "3 to 1", "5 to 1"]', 2, 'Provides 90 compressions and 30 breaths per minute. (NRP)'),
    ('11: When performing chest compressions on a neonate, what concentration of oxygen should be used for ventilation?', '["21%", "30%", "50%", "100%"]', 3, 'Once compressions start, oxygen is increased to 100%. (NRP)'),
    ('12: If the heart rate remains < 60 bpm after 60 seconds of chest compressions with effective ventilation with 100% O2, what is the next step?', '["Administer Epinephrine", "Stop resuscitation", "Give Sodium Bicarbonate", "Administer Atropine"]', 0, 'Epinephrine is indicated for persistent bradycardia despite adequate ventilation and compressions. (NRP)'),
    ('13: What is the preferred route for administering Epinephrine during neonatal resuscitation?', '["Endotracheal tube", "Umbilical Venous Catheter (UVC)", "Intramuscular", "Subcutaneous"]', 1, 'Intravenous (via UVC) is the most reliable route. (NRP)'),
    ('14: Which condition should be suspected if a newborn presents with scaphoid abdomen, respiratory distress, and bowel sounds in the chest?', '["Congenital Diaphragmatic Hernia (CDH)", "Tracheoesophageal Fistula", "Pneumothorax", "Choanal Atresia"]', 0, 'Bag-mask ventilation is contraindicated in CDH; immediate intubation is required. (Williams)'),
    ('15: Why is bag-mask ventilation contraindicated in Congenital Diaphragmatic Hernia?', '["It causes pneumothorax", "It inflates the stomach and intestines in the chest, worsening lung compression", "It lowers heart rate", "None of the above"]', 1, 'Intubation is required to ventilate the lungs directly. (Beckmann)'),
    ('16: What is the APGAR score for a baby with: HR 120, crying vigorously, active motion, completely pink, sneezes to stimulation?', '["7", "8", "9", "10"]', 3, 'HR>100(2), Crying(2), Active(2), Pink(2), Sneeze(2) = 10. (ACOG)'),
    ('17: An APGAR score of 3 at 1 minute indicates:', '["Normal transition", "Mild depression", "Moderate depression", "Severe depression requiring immediate resuscitation"]', 3, 'Score 0-3 is severe. (Williams)'),
    ('18: When are APGAR scores routinely assessed?', '["1 and 5 minutes", "1 and 10 minutes", "5 and 10 minutes", "Immediately at birth only"]', 0, 'If the 5-minute score is < 7, assess every 5 minutes up to 20 minutes. (ACOG)'),
    ('19: What does the "A" in APGAR stand for?', '["Airway", "Appearance (Skin Color)", "Activity", "None of the above"]', 1, 'Appearance (color), Pulse (HR), Grimace (reflex), Activity (tone), Respiration (effort). (ACOG)'),
    ('20: A newborn has acrocyanosis (blue hands/feet but pink body) at 1 minute. What score does this receive for Appearance?', '["0", "1", "2", "3"]', 1, '0 = Pale/Blue, 1 = Acrocyanosis, 2 = Completely pink. (ACOG)'),
    ('21: Which APGAR component is the most important indicator of successful resuscitation?', '["Appearance", "Pulse (Heart Rate)", "Grimace", "Activity"]', 1, 'A rising heart rate indicates effective ventilation. (NRP)'),
    ('22: Is the APGAR score used to dictate when to start resuscitation?', '["Yes", "No, resuscitation is initiated before the 1-minute APGAR is assigned", "Only for preemies", "None of the above"]', 1, 'Resuscitation depends on the rapid assessment (HR, breathing, tone). (NRP)'),
    ('23: What is "Transient Tachypnea of the Newborn" (TTN)?', '["Surfactant deficiency", "Delayed clearance of fetal lung fluid", "Meconium aspiration", "Pneumonia"]', 1, 'Common after C-sections without labor. (Williams)'),
    ('24: Classic chest X-ray finding for TTN?', '["Ground glass opacities", "Hyperinflation with fluid in the fissures (prominent perihilar streaking)", "Pneumothorax", "Patchy infiltrates"]', 1, 'Resolves within 24-48 hours with supportive care. (Beckmann)'),
    ('25: What is the primary cause of Respiratory Distress Syndrome (RDS) in premature infants?', '["Infection", "Surfactant deficiency", "Retained fluid", "Meconium aspiration"]', 1, 'Surfactant reduces alveolar surface tension. (Williams)'),
    ('26: Classic chest X-ray finding for RDS?', '["Clear lungs", "Hyperinflation", "Low lung volumes with diffuse reticulogranular ground-glass appearance and air bronchograms", "Fluid in fissures"]', 2, 'Classic board description for RDS. (Beckmann)'),
    ('27: Which maternal condition significantly INCREASES the risk of RDS in the newborn?', '["Maternal hypertension", "Maternal diabetes", "Prolonged rupture of membranes", "Heroin addiction"]', 1, 'Fetal hyperinsulinemia delays lung maturation. (Williams)'),
    ('28: What is the best preventive strategy for RDS in a woman presenting in preterm labor at 28 weeks?', '["Antibiotics", "Antenatal Corticosteroids (e.g., Betamethasone)", "Magnesium", "Tocolytics alone"]', 1, 'Accelerates type II pneumocyte maturation. (ACOG)'),
    ('29: Treatment for established severe RDS in a premature neonate?', '["Exogenous surfactant administration via ETT", "Albuterol", "Diuretics", "Antibiotics only"]', 0, 'Given directly into the lungs. (Beckmann)'),
    ('30: "Meconium Aspiration Syndrome" (MAS) primarily affects which newborns?', '["Preterm", "Term or Post-term", "Extremely low birth weight", "None of the above"]', 1, 'Meconium passage is rare before 34 weeks. (Williams)'),
    ('31: Classic chest X-ray finding for MAS?', '["Ground glass", "Fluid in fissures", "Patchy atelectasis with areas of overinflation (ball-valve effect)", "Clear lungs"]', 2, 'Meconium obstructs airways leading to air trapping. (Beckmann)'),
    ('32: A newborn is born through thick meconium. The baby is vigorous and crying. Management?', '["Immediate intubation and suction", "Routine care with mother", "CPAP", "Chest compressions"]', 1, 'Routine care for vigorous infants regardless of meconium. (NRP)'),
    ('33: A newborn is born through thick meconium. The baby is limp and apneic. Initial management?', '["Routine care", "Intubate and suction trachea", "Bring to radiant warmer and perform initial steps (clear secretions with bulb syringe), start PPV if HR < 100", "Start compressions"]', 2, 'Routine tracheal suctioning for non-vigorous MAS is NO LONGER recommended as the initial step. (NRP 2015/2020 updates)'),
    ('34: Persistent Pulmonary Hypertension of the Newborn (PPHN) is a major complication of:', '["TTN", "Meconium Aspiration Syndrome", "RDS", "Prematurity"]', 1, 'Hypoxia causes pulmonary vasoconstriction, leading to right-to-left shunting. (Williams)'),
    ('35: First-line medical therapy for severe PPHN?', '["Epinephrine", "Inhaled Nitric Oxide (iNO)", "Prostaglandin E1", "Indomethacin"]', 1, 'iNO is a selective pulmonary vasodilator. (Beckmann)'),
    ('36: "Choanal Atresia" presents with:', '["Cyanosis that worsens with crying", "Cyanosis that improves with crying", "Vomiting", "Drooling"]', 1, 'Neonates are obligate nose breathers; crying opens the mouth allowing air in. (Williams)'),
    ('37: How is Choanal Atresia initially diagnosed?', '["MRI", "Inability to pass a catheter through the nares into the nasopharynx", "X-ray", "Blood test"]', 1, 'Simple bedside test. (Beckmann)'),
    ('38: "Tracheoesophageal Fistula" (TEF) most commonly presents as:', '["Esophageal atresia with a distal fistula to the trachea", "Esophageal atresia with proximal fistula", "H-type fistula", "None of the above"]', 0, 'Type C is the most common (85%). (Williams)'),
    ('39: Clinical presentation of TEF?', '["Cyanosis when crying", "Excessive drooling, choking/coughing with first feed, inability to pass NGT", "Bilious vomiting", "Diarrhea"]', 1, 'Saliva and milk spill into the lungs. (Beckmann)'),
    ('40: What prenatal ultrasound finding is highly suspicious for Esophageal Atresia?', '["Oligohydramnios", "Polyhydramnios and absent fetal stomach bubble", "Enlarged kidneys", "Echogenic bowel"]', 1, 'Fetus cannot swallow amniotic fluid. (Williams)'),
    ('41: Routine prophylactic administration of which vitamin is given to all newborns immediately after birth?', '["Vitamin C", "Vitamin K", "Vitamin D", "Vitamin B12"]', 1, 'Given IM to prevent Hemorrhagic Disease of the Newborn. (ACOG)'),
    ('42: What eye prophylaxis is routinely given to newborns in the US to prevent Gonococcal Ophthalmia Neonatorum?', '["Silver nitrate", "Erythromycin ointment", "Gentamicin drops", "Saline wash"]', 1, 'Also effective against some other bacteria, but primarily targeted at Gonorrhea. (CDC)'),
    ('43: Erythromycin eye ointment does NOT effectively prevent which type of neonatal conjunctivitis?', '["Gonococcal", "Chlamydial", "Staphylococcal", "None of the above"]', 1, 'Chlamydial conjunctivitis requires systemic oral macrolides. (CDC)'),
    ('44: When does Gonococcal conjunctivitis typically present?', '["Days 2-5 of life", "Days 5-14 of life", "First 24 hours", "After 1 month"]', 0, 'Rapid onset, severe purulent discharge, can cause blindness. (Williams)'),
    ('45: When does Chlamydial conjunctivitis typically present?', '["Days 2-5 of life", "Days 5-14 of life", "First 24 hours", "After 1 month"]', 1, 'Slower onset compared to Gonorrhea. (Beckmann)'),
    ('46: The "Hepatitis B" vaccine should be given to all medically stable infants weighing > 2000g within what timeframe?', '["24 hours of birth", "1 week", "1 month", "2 months"]', 0, 'First dose of the series. (CDC/AAP)'),
    ('47: If the mother is Hepatitis B Surface Antigen (HBsAg) POSITIVE, the newborn should receive:', '["HepB vaccine only", "HepB vaccine and Hepatitis B Immune Globulin (HBIG) within 12 hours of birth", "HBIG only", "Nothing"]', 1, 'Provides both active and passive immunity. (ACOG/CDC)'),
    ('48: Which condition is routinely screened for in all US newborns via the "heel prick" blood test?', '["Phenylketonuria (PKU)", "Congenital Hypothyroidism", "Galactosemia", "All of the above"]', 3, 'Newborn screening panels vary by state but include these core conditions. (AAP)'),
    ('49: Early detection of Congenital Hypothyroidism prevents:', '["Liver failure", "Severe intellectual disability (Cretinism)", "Blindness", "Deafness"]', 1, 'Thyroid hormone is essential for brain development. (Williams)'),
    ('50: A newborn with Galactosemia is absolutely contraindicated from:', '["Formula feeding", "Breastfeeding", "Intravenous fluids", "Vitamin K"]', 1, 'Breast milk contains lactose (glucose + galactose); requires soy-based formula. (AAP)'),
    ('51: Normal newborn respiratory rate is:', '["12-20 bpm", "20-30 bpm", "40-60 bpm", "60-80 bpm"]', 2, 'Tachypnea is defined as > 60 bpm. (Beckmann)'),
    ('52: Normal newborn resting heart rate is:', '["60-100 bpm", "80-120 bpm", "110-160 bpm", "150-200 bpm"]', 2, 'Bradycardia is generally < 100 in the delivery room context. (NRP)'),
    ('53: "Caput Succedaneum" is a scalp swelling that:', '["Does not cross suture lines", "Crosses suture lines", "Is a surgical emergency", "Causes severe anemia"]', 1, 'Edema of the scalp soft tissue, often from vacuum or prolonged labor. Resolves in days. (Williams)'),
    ('54: "Cephalohematoma" is a subperiosteal hemorrhage that:', '["Crosses suture lines", "Does not cross suture lines", "Is harmless", "Requires drainage"]', 1, 'Bound by the periosteal attachments; takes weeks to resolve and can cause jaundice. (Beckmann)'),
    ('55: "Subgaleal Hemorrhage" is a dangerous collection of blood that:', '["Does not cross suture lines", "Crosses suture lines and pushes the ears forward; can cause massive blood loss and shock", "Is benign", "Resolves in 2 days"]', 1, 'Blood accumulates in the loose areolar tissue space. (Williams)'),
    ('56: Which brachial plexus injury involves C5-C6 and presents with the arm internally rotated and pronated ("Waiter''s Tip" posture)?', '["Klumpke palsy", "Erb-Duchenne palsy", "Facial nerve palsy", "Phrenic nerve palsy"]', 1, 'Most common brachial plexus injury from shoulder dystocia. (ACOG)'),
    ('57: Which brachial plexus injury involves C8-T1 and presents with an absent grasp reflex ("Claw hand")?', '["Klumpke palsy", "Erb palsy", "Horner syndrome", "None of the above"]', 0, 'Associated with upward traction on the arm. (Beckmann)'),
    ('58: Klumpke palsy (C8-T1) can be associated with which ipsilateral eye finding?', '["Cataract", "Horner syndrome (ptosis, miosis, anhidrosis)", "Glaucoma", "Strabismus"]', 1, 'Due to involvement of sympathetic fibers in T1. (Williams)'),
    ('59: Most brachial plexus injuries from birth trauma:', '["Require immediate surgery", "Resolve spontaneously within 3-6 months with physical therapy", "Are permanent", "Are due to C-sections"]', 1, 'Conservative management is first-line. (ACOG)'),
    ('60: Clavicle fracture is a common birth injury. Presentation?', '["Crepitus over the clavicle, asymmetric Moro reflex", "Paralysis of the arm", "Respiratory distress", "Seizures"]', 0, 'Often occurs during shoulder dystocia; heals spontaneously with no specific treatment needed. (Beckmann)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Neonatology & Resuscitation registered.';
END $$;
COMMIT;
