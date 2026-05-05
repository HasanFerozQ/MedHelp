BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-normal-labor' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-normal-labor not found.';
    END IF;

    -- Batch 2: 61-120 (Advanced Labor, Instrumental, and Third Stage)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: A "Secondary Arrest" of labor occurs when:', '["Dilation stops for > 2 hours in the active phase", "The baby is breech", "Contractions stop", "The patient refuses to push"]', 0, 'Modern definitions use 4-6 hours, but "Secondary Arrest" traditionally meant no change for 2 hours. (Williams)'),
    (v_topic_id, '62: "Pudendal Block" provides anesthesia primarily to which area?', '["The entire pelvis", "The upper vagina", "The perineum and lower vagina", "The uterus"]', 2, 'Useful for repair of lacerations or instrumental delivery if epidural is absent. (Beckmann)'),
    (v_topic_id, '63: To perform a Pudendal block, the anesthetic is injected near which landmark?', '["Ischial spines", "Symphysis pubis", "Sacral promontory", "Coccyx"]', 0, 'The pudendal nerve passes behind the sacrospinous ligament near the spine. (Williams)'),
    (v_topic_id, '64: "Forceps" delivery requires the fetal head to be at least at what station for a "Low" forceps application?', '["-2", "0", "+2 or lower (but not on the perineum)", "Floating"]', 2, 'Criteria for forceps based on station and rotation. (ACOG)'),
    (v_topic_id, '65: Which of the following is a prerequisite for ANY instrumental vaginal delivery?', '["Membranes must be intact", "Cervix must be fully dilated", "The baby must be in a breech position", "The patient must have an epidural"]', 1, 'Full dilation and ruptured membranes are mandatory. (Williams)'),
    (v_topic_id, '66: "Vacuum Extraction" carries a specific risk of which neonatal complication compared to forceps?', '["Facial nerve palsy", "Cephalohematoma and Subgaleal hemorrhage", "Skull fracture", "Corneal abrasion"]', 1, 'Forceps are more associated with facial nerve injury. (Beckmann)'),
    (v_topic_id, '67: The maximum number of "pop-offs" or pulls allowed during a vacuum-assisted delivery is generally:', '["1", "3", "5", "10"]', 1, 'Standard safety protocol to avoid scalp injury. (ACOG)'),
    (v_topic_id, '68: "Amniotomy" (AROM) is most effective at speeding up labor during which phase?', '["Latent phase", "Active phase", "Stage 2", "Stage 3"]', 1, 'Commonly combined with oxytocin for augmentation. (Williams)'),
    (v_topic_id, '69: The "Third Stage of Labor" begins and ends with:', '["Dilation to 10cm", "Birth of the baby to delivery of the placenta", "Birth of the baby to 1 hour later", "Contractions to delivery"]', 1, 'Usually takes 5-30 minutes. (Beckmann)'),
    (v_topic_id, '70: Which of the following is a sign of "Placental Separation"?', '["Lengthening of the umbilical cord", "Gush of blood", "Uterus becomes globular and firm", "All of the above"]', 3, 'These are the classic signs to watch for. (Williams)'),
    (v_topic_id, '71: "Active Management of the Third Stage" (AMTSL) includes early cord clamping (debatable now), controlled cord traction, and:', '["Manual removal", "Routine administration of oxytocin", "Strong fundal pressure", "Cold compresses"]', 1, 'AMTSL significantly reduces the risk of PPH. (WHO/ACOG)'),
    (v_topic_id, '72: "Brandt-Andrews Maneuver" is used to deliver the placenta by:', '["Pulling hard on the cord", "Applying suprapubic pressure while providing gentle cord traction to prevent uterine inversion", "Manual extraction", "Pushing on the fundus only"]', 1, 'Safe way to assist placental delivery. (Williams)'),
    (v_topic_id, '73: A "Retained Placenta" is defined as a third stage lasting longer than:', '["10 minutes", "30 minutes", "1 hour", "2 hours"]', 1, 'May require manual removal. (Beckmann)'),
    (v_topic_id, '74: The primary concern with a "Manual Removal of Placenta" is:', '["Pain", "Infection and Hemorrhage", "High BP", "Diabetes"]', 1, 'Requires antibiotic prophylaxis and careful technique. (Williams)'),
    (v_topic_id, '75: After placental delivery, the placenta should be inspected for:', '["Size", "Completeness (missing cotyledons or membranes)", "Color", "Smell"]', 1, 'Retained fragments are a major cause of PPH. (Beckmann)'),
    (v_topic_id, '76: "Uterine Atony" is:', '["The uterus is too hard", "The failure of the uterus to contract effectively after delivery", "A type of infection", "A tumor"]', 1, 'Leading cause of PPH. (Williams)'),
    (v_topic_id, '77: Which medication is the FIRST-LINE agent for both prophylaxis and treatment of uterine atony?', '["Methergine", "Hemabate", "Oxytocin (Pitocin)", "Misoprostol"]', 2, 'Safe, cheap, and effective. (ACOG)'),
    (v_topic_id, '78: "Methylergonovine (Methergine)" is CONTRAINDICATED in patients with:', '["Asthma", "Hypertension or Pre-eclampsia", "Diabetes", "Heart failure"]', 1, 'Can cause severe hypertensive crisis. (Beckmann)'),
    (v_topic_id, '79: "Carboprost (Hemabate)" is a PGF2-alpha analog CONTRAINDICATED in patients with:', '["Hypertension", "Asthma", "Renal failure", "Liver disease"]', 1, 'Can cause severe bronchospasm. (Williams)'),
    (v_topic_id, '80: "Misoprostol (Cytotec)" for PPH is often administered via which route for rapid absorption?', '["Oral", "Rectal or Sublingual", "Intramuscular", "Intravenous"]', 1, 'Rectal is common in emergency atony management. (ACOG)'),
    (v_topic_id, '81: "Postpartum Hemorrhage" (PPH) was traditionally defined as > 500 mL for vaginal birth and > _____ mL for C-section.', '["600", "800", "1000", "2000"]', 2, 'Modern definitions use > 1000 mL regardless of mode. (ACOG)'),
    (v_topic_id, '82: What is the "Four Ts" mnemonic for causes of PPH?', '["Tension, Tired, Torn, Thin", "Tone, Tissue, Trauma, Thrombin", "Time, Temperature, Toxins, Tissues", "None"]', 1, 'Tone (Atony), Tissue (Retained), Trauma (Laceration), Thrombin (Coagulopathy). (Beckmann)'),
    (v_topic_id, '83: A "Bakri Balloon" is used in PPH to:', '["Stop blood flow to the legs", "Tamponade the uterine cavity from within", "Deliver the baby", "Measure urine"]', 1, 'Filled with saline to apply internal pressure. (Williams)'),
    (v_topic_id, '84: "B-Lynch Suture" is a surgical technique used during a C-section for PPH that:', '["Ties off the uterine artery", "Compresses the uterus like a \"suspenders\" belt", "Closes the skin", "Removes the uterus"]', 1, 'Effective for refractory atony. (Beckmann)'),
    (v_topic_id, '85: A "Uterine Inversion" is a rare, life-threatening cause of PPH often characterized by:', '["The uterus becoming very hard", "A mass in the vagina and sudden hypotension (shock)", "No bleeding", "High fever"]', 1, 'The uterus turns inside out. (Williams)'),
    (v_topic_id, '86: Management of Uterine Inversion includes:', '["Manual replacement of the fundus and stopping oxytocin temporarily", "Pulling harder on the cord", "Giving Methergine immediately", "Waiting"]', 0, 'You must relax the uterus to put it back. (Beckmann)'),
    (v_topic_id, '87: "Fourth Stage of Labor" is the first _____ hour(s) after delivery of the placenta.', '["1", "2", "6", "24"]', 0, 'A critical time for monitoring maternal stability and bleeding. (Williams)'),
    (v_topic_id, '88: Maternal "Shivering" (postpartum chills) is:', '["A sign of sepsis", "Common and usually normal", "A reaction to oxytocin only", "A sign of hemorrhage"]', 1, 'Due to hormonal shifts and thermal change. (Beckmann)'),
    (v_topic_id, '89: "Vaginal Hematoma" is suspected when a patient has:', '["No pain", "Severe rectal or vaginal pressure and pain out of proportion to exam", "Fever", "High BP"]', 1, 'Requires incision and drainage if large. (Williams)'),
    (v_topic_id, '90: The most common cause of "Late" Postpartum Hemorrhage (after 24 hours) is:', '["Atony", "Retained products of conception (RPOC) or subinvolution", "Infection", "Lacerations"]', 1, 'Often presents 1-2 weeks later. (Beckmann)'),
    (v_topic_id, '91: "Tranexamic Acid (TXA)" is used in PPH as:', '["A uterotonic", "An antifibrinolytic to stabilize clots", "An antibiotic", "A sedative"]', 1, 'Shown to reduce mortality in PPH if given early. (WOMAN trial/ACOG)'),
    (v_topic_id, '92: Immediate care of the newborn includes drying, stimulation, and clearing the airway if needed to prevent:', '["Infection", "Hypothermia", "Jaundice", "Hunger"]', 1, 'Babies lose heat rapidly. (AAP)'),
    (v_topic_id, '93: "Erythromycin" ophthalmic ointment prevents neonatorum ophthalmia caused by:', '["Chlamydia", "Neisseria gonorrhoeae", "Syphilis", "Staph"]', 1, 'Mandatory in most jurisdictions. (Beckmann)'),
    (v_topic_id, '94: "Vitamin K" (Phytonadione) is given to newborns to prevent:', '["Scurvy", "Hemorrhagic disease of the newborn (VKDB)", "Rickets", "Anemia"]', 1, 'Newborns have low levels of clotting factors. (AAP)'),
    (v_topic_id, '95: A "Breech" presentation where the hips are flexed and knees are extended is called:', '["Complete breech", "Frank breech", "Footling breech", "Kneeling breech"]', 1, 'Most common type of breech. (Williams)'),
    (v_topic_id, '96: "External Cephalic Version" (ECV) is typically performed at which gestational age?', '["32 weeks", "34 weeks", ">= 37 weeks", "Only during labor"]', 2, 'To ensure the baby is unlikely to flip back and can be safely delivered if complications occur. (ACOG)'),
    (v_topic_id, '97: Absolute contraindication to ECV?', '["Twins", "Prior C-section", "Placenta previa", "GDM"]', 2, 'You cannot deliver through a previa. (Williams)'),
    (v_topic_id, '98: "Compound Presentation" occurs when:', '["The baby is sideways", "An extremity (e.g., hand) presents alongside the head", "There are twins", "The baby is breech"]', 1, 'Usually resolves as the head descends. (Beckmann)'),
    (v_topic_id, '99: "Face Presentation" where the chin (mentum) is posterior is:', '["Favorable for vaginal delivery", "Not deliverable vaginally", "Normal", "Rare"]', 1, 'Mentum posterior prevents the neck from extending under the symphysis. (Williams)'),
    (v_topic_id, '100: "Brow Presentation" usually converts to:', '["Face or Occiput", "Breech", "Transverse", "It never converts"]', 0, 'Brow is unstable. (Beckmann)'),
    (v_topic_id, '101: "Active Phase Protraction" is slower-than-normal dilation. For a multipara, it is defined as:', '["< 0.5 cm/hr", "< 1.2 cm/hr", "< 1.5 cm/hr", "< 2.0 cm/hr"]', 2, 'Traditional Friedman criteria (1.2 for nullipara, 1.5 for multipara). (Williams)'),
    (v_topic_id, '102: The most common reason for a "Prolonged Latent Phase" is:', '["Large baby", "Unripe cervix or excessive sedation", "Small pelvis", "Twins"]', 1, 'Wait and see is the usual approach. (Beckmann)'),
    (v_topic_id, '103: "Amnioinfusion" (saline into the uterus) is primarily used to treat:', '["Late decelerations", "Recurrent variable decelerations (cord compression)", "Meconium", "Infection"]', 1, 'Buffers the cord from compression. (ACOG)'),
    (v_topic_id, '104: During "Shoulder Dystocia," the "Woods Screw" maneuver involves:', '["Pulling the head", "Rotating the posterior shoulder 180 degrees", "Breaking the clavicle", "C-section"]', 1, 'Internal rotation maneuver. (Williams)'),
    (v_topic_id, '105: "Rubin Maneuver" involves:', '["Rotating the anterior shoulder toward the fetal chest", "Pulling the legs", "Pushing on the back", "Vacuum"]', 0, 'Adducts the shoulders to reduce the diameter. (Beckmann)'),
    (v_topic_id, '106: Delivery of the "Posterior Arm" in shoulder dystocia:', '["Is forbidden", "Is often the most effective way to resolve the impaction", "Causes fractures in 100% of cases", "Is done first"]', 1, 'Significantly reduces the shoulder diameter. (ACOG)'),
    (v_topic_id, '107: What is the most common fetal injury in shoulder dystocia?', '["Skull fracture", "Brachial Plexus injury (Erb''s palsy) or Clavicle fracture", "Brain damage", "Lacerations"]', 1, 'Usually resolves, but some are permanent. (Williams)'),
    (v_topic_id, '108: "Vasa Previa" is a condition where fetal vessels cross the os. The primary risk is:', '["Maternal hemorrhage", "Fetal exsanguination (bleeding out) upon rupture of membranes", "Atony", "Diabetes"]', 1, 'Requires C-section before rupture. (Beckmann)'),
    (v_topic_id, '109: "Amniotic Fluid Index" (AFI) < 5 cm is defined as:', '["Polyhydramnios", "Oligohydramnios", "Normal", "Dehydration"]', 1, 'Associated with cord compression and IUGR. (Williams)'),
    (v_topic_id, '110: "Polyhydramnios" (AFI > 24-25 cm) is associated with which fetal condition?', '["Renal agenesis", "Esophageal atresia (inability to swallow)", "Lung hypoplasia", "Growth restriction"]', 1, 'Anything that prevents swallowing or increases urine. (Beckmann)'),
    (v_topic_id, '111: The "Kleihauer-Betke" (KB) test is used to:', '["Detect fetal lung maturity", "Quantify the amount of fetal-to-maternal hemorrhage", "Screen for Down syndrome", "Check for infection"]', 1, 'Used to calculate the dose of RhoGAM needed. (Williams)'),
    (v_topic_id, '112: "Hydrops Fetalis" in the setting of Rh-incompatibility is caused by:', '["High sugar", "Severe fetal anemia and high-output heart failure", "Infection", "Genetic mutation"]', 1, 'Leads to generalized edema. (Beckmann)'),
    (v_topic_id, '113: A "BPP" (Biophysical Profile) score of 4/10 usually indicates:', '["Reassuring status", "Possible fetal hypoxia; usually requires delivery", "Normal", "Sleep cycle"]', 1, 'Score < 6 is concerning. (ACOG)'),
    (v_topic_id, '114: Which component of the BPP is the first to be lost in acute hypoxia?', '["Fetal breathing", "Fetal tone", "Amniotic fluid volume", "NST"]', 0, 'Fetal breathing and NST are early markers. (Williams)'),
    (v_topic_id, '115: Which component of the BPP is a marker of "Chronic" placental insufficiency?', '["NST", "Fetal tone", "Amniotic fluid volume", "Fetal movement"]', 2, 'Low fluid means low fetal urine output due to chronic low blood flow. (Beckmann)'),
    (v_topic_id, '116: "Sinusoidal" FHR pattern is most classically associated with:', '["Sleep", "Severe fetal anemia", "Oxytocin use", "Fever"]', 1, 'Category III tracing. (ACOG)'),
    (v_topic_id, '117: What is the primary advantage of a "Low Transverse" uterine incision over a "Classical" incision for C-section?', '["Faster delivery", "Lower risk of uterine rupture in future pregnancies", "Less bleeding", "Better view"]', 1, 'Allows for a trial of labor (TOLAC) later. (Williams)'),
    (v_topic_id, '118: A "Classical" (vertical) uterine incision is indicated in:', '["Every C-section", "Preterm delivery where the lower segment is not developed", "Twins", "Maternal obesity"]', 1, 'Also for transverse lie or certain placenta issues. (Beckmann)'),
    (v_topic_id, '119: What is the most common complication of a C-section?', '["Bladder injury", "Infection (Endometritis/Wound)", "Ureteral injury", "Pulmonary embolism"]', 1, 'Prophylactic antibiotics are routine. (ACOG)'),
    (v_topic_id, '120: "TOLAC" stands for:', '["Treatment of labor and cervix", "Trial of labor after Cesarean", "Total obstetric labor and care", "None"]', 1, 'The attempt at vaginal birth. VBAC is the success. (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 2 (61-120) MCQs for Normal Labor registered.';
END $$;
COMMIT;
