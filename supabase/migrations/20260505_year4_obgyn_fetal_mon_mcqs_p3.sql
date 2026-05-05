BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 3: 121-180 (ACOG Categories In-Depth, Rupture, Inversion, and Embolism)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "Category I" tracing: Which of the following is required?', '["Moderate variability", "No late or variable decelerations", "Baseline rate 110-160 bpm", "All of the above"]', 3, 'Category I is normal; management is routine surveillance. (ACOG)'),
    (v_topic_id, '122: "Category III" tracing: Which of the following is NOT a Category III finding?', '["Absent variability with recurrent late decelerations", "Sinusoidal pattern", "Tachycardia with moderate variability", "Absent variability with bradycardia"]', 2, 'Tachycardia with moderate variability is Category II. (ACOG)'),
    (v_topic_id, '123: The presence of "Moderate" variability indicates that the fetus is:', '["Acidotic", "NOT currently acidotic (likely pH > 7.20)", "In deep sleep", "Dying"]', 1, 'The single most important indicator of fetal well-being on EFM. (Beckmann)'),
    (v_topic_id, '124: "Absent" variability without decels? (Category II)', '["Always abnormal", "Requires evaluation; may be due to sleep, meds, or chronic injury", "Normal", "None"]', 1, 'Concerning but not yet Category III unless decels appear. (ACOG)'),
    (v_topic_id, '125: "Recurrent" decelerations are those that occur with what percentage of contractions?', '["10%", ">= 50%", "100%", "5%"]', 1, 'Measured over a 20-minute window. (ACOG)'),
    (v_topic_id, '126: "Uterine Tachysystole" can lead to "Late Decelerations" because:', '["The baby gets tired", "Frequent contractions reduce placental blood flow and oxygen exchange time", "The cord gets squashed", "None"]', 1, 'Cumulative oxygen debt. (Williams)'),
    (v_topic_id, '127: First-line management for "Tachysystole" in a patient receiving Oxytocin?', '["Increase dose", "Decrease or stop Oxytocin", "C-section", "Wait"]', 1, 'Reduce the stress on the placenta. (ACOG)'),
    (v_topic_id, '128: "Shoulder Dystocia" - McRoberts maneuver increases the pelvic outlet by:', '["Straightening the lumbar spine", "Rotating the pubic symphysis superiorly", "Increasing the posterior space", "All of the above"]', 3, 'Simple and effective first step. (Beckmann)'),
    (v_topic_id, '129: "Woods Screw" vs "Rubin" maneuver?', '["Woods rotates the posterior shoulder; Rubin rotates the anterior shoulder", "They are the same", "One uses a vacuum", "None"]', 0, 'Internal rotation maneuvers. (Williams)'),
    (v_topic_id, '130: A "Brachial Plexus" injury during shoulder dystocia is always due to excessive traction by the provider.', '["True", "False, it can happen spontaneously due to maternal forces", "Only if forceps were used", "None"]', 1, 'Many injuries occur before the head is even delivered. (ACOG)'),
    (v_topic_id, '131: "Clavicle Fracture" in a neonate after shoulder dystocia usually:', '["Requires surgery", "Heals spontaneously without long-term deficit", "Causes paralysis", "None"]', 1, 'Common and generally benign. (Beckmann)'),
    (v_topic_id, '132: "Uterine Rupture": The "Classic" sign on EFM is:', '["Accelerations", "Prolonged deceleration or sudden bradycardia", "Early decels", "None"]', 1, 'Reflects acute fetal compromise. (ACOG)'),
    (v_topic_id, '133: "Abdominal pain" in Uterine Rupture may be:', '["Sharp and tearing", "Absent (especially if the patient has an epidural)", "Both A and B", "Mild"]', 2, 'Epidural can mask the pain of rupture. (Williams)'),
    (v_topic_id, '134: "Uterine Rupture" occurs through which layer?', '["Only the endometrium", "All layers, including the serosa", "Only the myometrium", "None"]', 1, 'Distinguished from "Dehiscence" (which is partial and often asymptomatic). (Beckmann)'),
    (v_topic_id, '135: "Uterine Dehiscence" management?', '["Immediate surgery for everyone", "Observation if mother and fetus are stable (often found at C-section)", "Induction", "None"]', 1, 'Less urgent than a true rupture. (ACOG)'),
    (v_topic_id, '136: "Uterine Inversion": Why is it associated with "Shock"?', '["Only from blood loss", "Both blood loss and neurogenic shock from traction on the pelvic nerves", "Infection", "None"]', 1, 'Vagal stimulation causes profound bradycardia/hypotension. (Williams)'),
    (v_topic_id, '137: "Nitroglycerin" (IV or sublingual) is used in Uterine Inversion to:', '["Stop bleeding", "Relax the uterus to allow for manual replacement", "Treat high BP", "None"]', 1, 'Works quickly and has a short half-life. (Beckmann)'),
    (v_topic_id, '138: "O''Sullivan Technique" for Uterine Inversion uses:', '["Surgery", "Hydrostatic pressure (infusing warm saline into the vagina/uterus)", "Pulling", "None"]', 1, 'Creates pressure to pop the fundus back in. (Williams)'),
    (v_topic_id, '139: "Amniotic Fluid Embolism" (AFE) occurs most commonly during:', '["The 1st trimester", "Labor, delivery, or the immediate postpartum period", "Sleep", "None"]', 1, 'Can happen during C-section or vaginal birth. (ACOG)'),
    (v_topic_id, '140: What is the "pathophysiology" of AFE?', '["A simple blood clot", "An anaphylactoid response to fetal debris entering maternal circulation", "Air in the veins", "Infection"]', 1, 'Leads to pulmonary vasospasm and right heart failure. (Williams)'),
    (v_topic_id, '141: "DIC" in AFE is often:', '["Mild", "Profound and rapid (low fibrinogen, high D-dimer)", "Non-existent", "Delayed"]', 1, 'Often the cause of death from uncontrollable hemorrhage. (Beckmann)'),
    (v_topic_id, '142: In a "Maternal Arrest" during labor, what is the "4-minute rule"?', '["Give O2 for 4 min", "Perform Perimortem Cesarean Delivery (PMCD) if no ROSC within 4 minutes", "Wait 4 min to start CPR", "None"]', 1, 'To improve maternal resuscitation and potentially save the fetus. (AHA/ACOG)'),
    (v_topic_id, '143: "Perimortem C-section" is recommended after which week of gestation?', '["20", "23-24 (viability)", "37", "40"]', 1, 'May be performed even if the fetus is not viable to help the mother. (AHA)'),
    (v_topic_id, '144: "Umbilical Cord Prolapse" station? It is most common when the head is:', '["Engaged (+2)", "High and floating (unengaged)", "At the introitus", "None"]', 1, 'Leaves a gap for the cord to slip through. (Beckmann)'),
    (v_topic_id, '145: "Overt" Cord Prolapse is:', '["Cord is felt but not seen", "Cord is visible or felt in the vagina after ROM", "Cord is trapped behind the shoulder", "None"]', 1, 'Medical emergency. (Williams)'),
    (v_topic_id, '146: "Occult" Cord Prolapse is:', '["Cord is visible", "Cord is alongside the presenting part but not felt/seen (diagnosed by FHR changes)", "Cord is in the bladder", "None"]', 1, 'Presents with deep variables. (ACOG)'),
    (v_topic_id, '147: "Funic Souffle" is the sound of:', '["Maternal pulse", "Blood flowing through the umbilical cord (synchronous with FHR)", "Fetal heart", "None"]', 1, 'Can be heard on auscultation. (Beckmann)'),
    (v_topic_id, '148: "Uterine Souffle" is the sound of:', '["Fetal heart", "Blood flowing through the uterine arteries (synchronous with maternal pulse)", "Cord pulse", "None"]', 1, 'A maternal sound. (Williams)'),
    (v_topic_id, '149: "Postpartum Hemorrhage" - The "Active Management" of 3rd stage reduces risk by _____ percent.', '["10%", "30-50%", "90%", "0%"]', 1, 'Significant reduction in atony. (ACOG)'),
    (v_topic_id, '150: "Uterine Atony" Risk Factors?', '["Polyhydramnios and Multiples", "Prolonged labor or Oxytocin use", "Chorioamnionitis", "All of the above"]', 3, 'Anything that "tires" or overdistends the muscle. (Beckmann)'),
    (v_topic_id, '151: "Misoprostol" (Cytotec) dose for PPH?', '["10 mcg", "100 mcg", "600-1000 mcg (rectal or buccal)", "5 mg"]', 2, 'Prostaglandin E1 analogue. (ACOG)'),
    (v_topic_id, '152: "Bakri Balloon" should be filled with how much saline?', '["50 mL", "Up to 500 mL", "1000 mL", "5 mL"]', 1, 'To provide internal pressure against the uterine walls. (Williams)'),
    (v_topic_id, '153: If PPH persists despite meds and balloon, the next surgical step is often:', '["Hysterectomy immediately", "Uterine Artery Embolization (UAE) or B-Lynch suture", "Wait", "Antibiotics"]', 1, 'Conservative surgical measures. (ACOG)'),
    (v_topic_id, '154: "Internal Iliac Artery Ligation" is:', '["Easy", "Technically difficult and often less effective than embolization", "Standard for everyone", "None"]', 1, 'Requires high surgical skill. (Williams)'),
    (v_topic_id, '155: "Retained Placenta" - "Placenta Accreta" is suspected when:', '["The placenta is small", "The placenta cannot be manually removed and there is a lack of a cleavage plane", "There is no bleeding", "None"]', 1, 'Invasion into the myometrium. (Beckmann)'),
    (v_topic_id, '156: "Meconium Aspiration Syndrome" (MAS) pathophysiology?', '["Direct airway obstruction", "Chemical pneumonitis and inactivation of surfactant", "Pulmonary hypertension (PPHN)", "All of the above"]', 3, 'Complex neonatal respiratory failure. (AAP)'),
    (v_topic_id, '157: "Thick" (Pea-soup) meconium is more concerning than "Thin" meconium.', '["True", "False", "Only in GDM", "None"]', 0, 'Higher risk of obstruction and severity of MAS. (Williams)'),
    (v_topic_id, '158: "Fetal Acidosis" is defined as umbilical artery pH < _____ and Base Deficit >= _____.', '["7.10 / 10", "7.00 / 12", "7.20 / 5", "None"]', 1, 'Standard criteria for identifying significant birth acidemia. (ACOG)'),
    (v_topic_id, '159: "Hypoxic Ischemic Encephalopathy" (HIE) in the neonate is often treated with:', '["Antibiotics", "Therapeutic Hypothermia (cooling)", "High glucose", "None"]', 1, 'To reduce brain injury. (AAP/ACOG)'),
    (v_topic_id, '160: "Fetal Scalp Stimulation" acceleration rules out:', '["Infection", "Current metabolic acidemia", "Twins", "Sleep"]', 1, 'Proves the CNS is responsive. (Beckmann)'),
    (v_topic_id, '161: "Vibroacoustic Stimulation" duration?', '["1 second", "3 seconds", "1 minute", "10 minutes"]', 1, 'Brief stimulus on the lower abdomen. (Williams)'),
    (v_topic_id, '162: EFM "Window" for interpretation is usually:', '["1 minute", "10 minutes", "1 hour", "The whole labor"]', 1, 'Patterns are assessed in 10-minute blocks. (ACOG)'),
    (v_topic_id, '163: "Baseline Change" is defined as a change lasting more than:', '["2 minutes", "10 minutes", "30 minutes", "1 minute"]', 1, 'Otherwise, it is a prolonged acceleration/deceleration. (ACOG)'),
    (v_topic_id, '164: "Sinusoidal" pattern is most commonly seen in:', '["Fetal anemia (Rh, Kell, hemorrhage)", "Fetal infection", "Fetal sleep", "None"]', 0, 'Can also be seen with severe asphyxia. (Williams)'),
    (v_topic_id, '165: "Early" decelerations are considered "physiologic." This means:', '["They are normal", "They are related to vagal response from head compression", "They do not require treatment", "All of the above"]', 3, 'Core concept. (Beckmann)'),
    (v_topic_id, '166: "Late" decelerations are "physiologic"? ', '["True", "False, they are always pathologic/concerning", "Only in obesity", "None"]', 1, 'Indicate stress on placental reserves. (ACOG)'),
    (v_topic_id, '167: "Variable" decelerations are "physiologic" if they are:', '["Mild/Occasional", "Severe and recurrent", "They are never physiologic", "None"]', 0, 'Common and often tolerated well if moderate variability persists. (Beckmann)'),
    (v_topic_id, '168: "Amnioinfusion" for variable decels is done via:', '["IV", "IUPC", "FSE", "Maternal stomach"]', 1, 'Saline is pumped into the uterine cavity. (ACOG)'),
    (v_topic_id, '169: "Fetal tachycardia" + maternal "tachycardia" + "fever" = ', '["Chorioamnionitis", "GDM", "Pre-eclampsia", "Normal"]', 0, 'Classic presentation. (Williams)'),
    (v_topic_id, '170: "Fetal bradycardia" during the 2nd stage (pushing) is often due to:', '["Head compression or rapid descent", "Cord compression", "Maternal exhaustion", "None"]', 0, 'Commonly seen as the head reaches the perineum. (Beckmann)'),
    (v_topic_id, '171: "Tocolytics" during an emergency? Why?', '["To deliver faster", "To relax the uterus and stop contractions (Intrauterine resuscitation)", "To prevent infection", "None"]', 1, 'Allows placental blood flow to resume. (ACOG)'),
    (v_topic_id, '172: Most common instrument associated with "emergency" delivery?', '["Forceps", "Vacuum Extractor", "Both", "None"]', 2, 'Used for Category III tracings in the 2nd stage. (Williams)'),
    (v_topic_id, '173: "Vacuum Extractor" complications?', '["Cephalohematoma", "Subgaleal hemorrhage (emergency)", "Scalp lacerations", "All of the above"]', 3, 'Requires careful monitoring of the neonate. (ACOG)'),
    (v_topic_id, '174: "Subgaleal Hemorrhage" is dangerous because:', '["It is small", "The subgaleal space can hold a large percentage of the infant''s blood volume", "It is infectious", "None"]', 1, 'Can lead to rapid hypovolemic shock. (Beckmann)'),
    (v_topic_id, '175: "Forceps" complications?', '["Facial nerve palsy", "Skull fracture", "Maternal 3rd/4th degree tears", "All of the above"]', 3, 'Requires expert technique. (Williams)'),
    (v_topic_id, '176: "Pelvic Outlet" station?', '["Head at the pelvic floor (scalp visible between contractions)", "Head at +2", "Head at 0", "None"]', 0, 'Standard for outlet instrumental delivery. (ACOG)'),
    (v_topic_id, '177: "Emergency" Cesarean time goal?', '["30 minutes (Decision to Incision)", "60 minutes", "10 minutes", "None"]', 0, 'Standard benchmark in many hospitals. (ACOG)'),
    (v_topic_id, '178: "Cord pH": Which vessel reflects "fetal" acid-base status?', '["Umbilical Artery (UA)", "Umbilical Vein (UV)", "Both", "None"]', 0, 'UA blood has already been through the fetus. (ACOG)'),
    (v_topic_id, '179: Umbilical Vein pH is usually _____ than Umbilical Artery pH.', '["Lower", "Higher", "Same", "None"]', 1, 'Vein carries oxygenated blood from the placenta. (Beckmann)'),
    (v_topic_id, '180: A "Respiratory" Acidosis is characterized by low pH and:', '["Normal PCO2", "High PCO2", "Low bicarbonate", "None"]', 1, 'Usually due to acute cord compression; recovers quickly. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Fetal Monitoring & Emergencies registered.';
END $$;
COMMIT;
