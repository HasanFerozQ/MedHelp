BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-fetal-monitoring' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-fetal-monitoring not found.';
    END IF;

    -- Batch 1: 1-60 (Fetal Monitoring Foundations and Heart Rate Patterns)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What is the primary goal of Electronic Fetal Monitoring (EFM) during labor?', '["To diagnose fetal infection", "To detect fetal hypoxia and prevent acidemia/neurological injury", "To measure maternal blood pressure", "To predict the time of birth"]', 1, 'EFM is used as a screening tool to identify signs of fetal compromise. (ACOG)'),
    (v_topic_id, '2: "External" fetal monitoring uses which technology to detect the fetal heart rate?', '["Infrared", "Doppler Ultrasound", "Piezoelectric pressure sensing", "Microphone"]', 1, 'Uses ultrasound waves to detect the movement of the fetal heart valves/walls. (Williams Obstetrics)'),
    (v_topic_id, '3: The "Toco" (Tocodynamometer) measures contraction frequency and duration but cannot accurately measure:', '["Maternal heart rate", "Contraction intensity (pressure in mmHg)", "Fetal movement", "Dilation"]', 1, 'Toco only measures the hardening of the abdominal wall; IUPC is needed for pressure. (Beckmann)'),
    (v_topic_id, '4: "Internal" fetal monitoring requires which of the following prerequisites?', '["Fully dilated cervix", "Ruptured membranes and some cervical dilation", "Patient must have an epidural", "Head at +2 station"]', 1, 'Needed to apply the electrode directly to the fetal scalp. (ACOG)'),
    (v_topic_id, '5: "Fetal Scalp Electrode" (FSE) is contraindicated in which scenario?', '["Maternal Hepatitis B or HIV", "Fetal breech presentation", "Twins", "Maternal obesity"]', 0, 'Risk of increasing vertical transmission through the scalp puncture. (ACOG)'),
    (v_topic_id, '6: "Intrauterine Pressure Catheter" (IUPC) measures contraction strength in which units?', '["mmHg", "Montevideo Units (MVUs)", "Newtons", "PSI"]', 1, 'MVUs are calculated as the sum of the intensities of contractions in 10 minutes. (Williams)'),
    (v_topic_id, '7: Normal "Baseline" FHR at term is:', '["100-140 bpm", "110-160 bpm", "120-180 bpm", "140-160 bpm"]', 1, 'Defined over a 10-minute window. (ACOG)'),
    (v_topic_id, '8: Fetal "Tachycardia" is a baseline FHR greater than:', '["150 bpm", "160 bpm", "170 bpm", "180 bpm"]', 1, 'Must persist for at least 10 minutes. (Beckmann)'),
    (v_topic_id, '9: Most common cause of persistent fetal tachycardia?', '["Fetal anemia", "Maternal fever / Intra-amniotic infection", "Fetal sleep", "Cord compression"]', 1, 'Fetal tachycardia is often the first sign of chorioamnionitis. (Williams)'),
    (v_topic_id, '10: Fetal "Bradycardia" is a baseline FHR less than:', '["100 bpm", "110 bpm", "120 bpm", "90 bpm"]', 1, 'A stable baseline of 100-110 is often normal in post-term fetuses. (ACOG)'),
    (v_topic_id, '11: "Baseline Variability" is defined as:', '["The difference between the lowest and highest bpm in a minute", "Fluctuations in the baseline FHR that are irregular in amplitude and frequency", "Accelerations only", "The pulse pressure"]', 1, 'Reflects the balance between the sympathetic and parasympathetic nervous systems. (ACOG)'),
    (v_topic_id, '12: "Moderate" variability is defined as a range of:', '["0-2 bpm", "3-5 bpm", "6-25 bpm", "> 25 bpm"]', 2, 'The most important indicator of a well-oxygenated fetal brain. (ACOG)'),
    (v_topic_id, '13: "Minimal" variability (<= 5 bpm) can be caused by:', '["Fetal sleep cycle", "Narcotics/magnesium", "Fetal hypoxia (if persistent)", "All of the above"]', 3, 'Context is essential for interpretation. (Beckmann)'),
    (v_topic_id, '14: "Absent" variability is defined as:', '["Amplitude range undetectable", "Amplitude < 5 bpm", "No accelerations", "Fetal death only"]', 0, 'Highly concerning if not due to medications; suggests significant acidosis. (ACOG)'),
    (v_topic_id, '15: "Marked" variability (> 25 bpm) is usually:', '["Benign", "Suggestive of acute fetal stress or hypoxia", "Normal in sleep", "Due to oxytocin"]', 1, 'May be seen during rapid descent or early hypoxia. (Williams)'),
    (v_topic_id, '16: "Accelerations" are defined as a peak of >= _____ bpm above baseline for at least _____ seconds (at >= 32 weeks).', '["10/10", "15/15", "20/20", "15/30"]', 1, 'Reliable indicator of non-acidotic status. (ACOG)'),
    (v_topic_id, '17: For a fetus < 32 weeks, accelerations are defined as:', '["15/15", "10/10", "5/5", "None"]', 1, 'Reflects immature autonomic control. (ACOG)'),
    (v_topic_id, '18: A "Prolonged Acceleration" lasts between:', '["2 and 10 minutes", "15 and 60 seconds", "10 and 20 minutes", "None"]', 0, 'If > 10 minutes, it is a baseline change. (ACOG)'),
    (v_topic_id, '19: "Early Decelerations" have a "mirror" image relationship with contractions. This means:', '["The peak of the contraction coincides with the nadir of the deceleration", "The decel happens after the contraction", "The decel is unrelated to contractions", "The decel is very deep"]', 0, 'Gradual decrease (>= 30 sec to nadir). (Williams)'),
    (v_topic_id, '20: Primary cause of "Early Decelerations"?', '["Uteroplacental insufficiency", "Umbilical cord compression", "Fetal head compression (vagal reflex)", "Fetal sleep"]', 2, 'Considered benign; no intervention needed. (Beckmann)'),
    (v_topic_id, '21: "Late Decelerations" are characterized by a nadir that occurs:', '["Before the contraction peak", "Simultaneously with the contraction peak", "After the peak of the contraction", "Randomly"]', 2, 'Gradual decrease (>= 30 sec to nadir). (ACOG)'),
    (v_topic_id, '22: Primary cause of "Late Decelerations"?', '["Head compression", "Umbilical cord compression", "Uteroplacental insufficiency (hypoxia)", "Maternal fever"]', 2, 'Requires immediate resuscitative measures. (Williams)'),
    (v_topic_id, '23: "Variable Decelerations" are an abrupt decrease in FHR (< 30 sec to nadir) caused by:', '["Head compression", "Umbilical cord compression", "Placental abruption", "Maternal hypotension"]', 1, 'Often V, U, or W shaped. (ACOG)'),
    (v_topic_id, '24: A "Prolonged Deceleration" is a decrease of >= 15 bpm lasting between:', '["15 and 30 seconds", "2 and 10 minutes", "10 and 20 minutes", "1 and 2 minutes"]', 1, 'If > 10 min, it is a baseline change (bradycardia). (ACOG)'),
    (v_topic_id, '25: "Category I" tracing is normal and requires:', '["Baseline 110-160, Moderate variability, NO late/variable decels", "Accelerations must be present", "Early decels must be absent", "All of the above"]', 0, 'Category I is strongly predictive of normal fetal acid-base status. (ACOG)'),
    (v_topic_id, '26: "Category III" tracing includes absent variability PLUS:', '["Recurrent late decelerations", "Recurrent variable decelerations", "Bradycardia", "Any of the above"]', 3, 'Category III is predictive of abnormal fetal acid-base status. (ACOG)'),
    (v_topic_id, '27: "Category II" tracings are defined as:', '["Normal", "Abnormal", "Indeterminate (not I or III)", "Dangerous"]', 2, 'Requires evaluation and continued surveillance. (Beckmann)'),
    (v_topic_id, '28: What is the most common Category II finding?', '["Absent variability", "Minimal variability or recurrent variable decelerations with moderate variability", "Late decelerations with moderate variability", "Tachycardia"]', 1, 'Includes a vast range of patterns. (ACOG)'),
    (v_topic_id, '29: "Sinusoidal" pattern is a smooth, sine wave-like baseline (3-5 cycles/min). It is most classically associated with:', '["Severe fetal anemia", "Fetal sleep", "Maternal fever", "Narcotics"]', 0, 'Category III finding. (Williams)'),
    (v_topic_id, '30: "Pseudo-sinusoidal" patterns can be seen after administration of:', '["Oxytocin", "Butorphanol (Stadol) or other narcotics", "Epidural", "Antibiotics"]', 1, 'Usually transient and benign. (Beckmann)'),
    (v_topic_id, '31: If FHR variability is minimal/absent, "Fetal Scalp Stimulation" is performed. A resulting acceleration indicates:', '["Acidosis", "pH > 7.20 (Reassuring)", "pH < 7.00", "Infection"]', 1, 'Proves the fetus is not acidotic at that moment. (ACOG)'),
    (v_topic_id, '32: "Vibroacoustic Stimulation" (VAS) uses a device on the maternal abdomen to:', '["Measure contractions", "Evoke FHR accelerations", "Divert the mother", "Measure fetal movement"]', 1, 'Alternative to scalp stimulation. (Williams)'),
    (v_topic_id, '33: "Intrauterine Resuscitation" maneuvers include lateral positioning, IV fluids, and:', '["Stopping oxytocin and giving O2", "Increasing oxytocin", "Starting antibiotics", "Wait and see"]', 0, 'Aims to increase placental blood flow. (ACOG)'),
    (v_topic_id, '34: "Terbutaline" (0.25 mg SC) is sometimes used as a rescue medication for:', '["Maternal HTN", "Uterine tachysystole with fetal distress", "Speeding up labor", "Infection"]', 1, 'Acute tocolysis to allow the uterus to relax and the fetus to recover. (Beckmann)'),
    (v_topic_id, '35: "Uterine Tachysystole" is defined as more than _____ contractions in 10 minutes.', '["3", "5", "8", "10"]', 1, 'Averaged over 30 minutes. (ACOG)'),
    (v_topic_id, '36: "Shoulder Dystocia" is a true emergency where the anterior shoulder is trapped under the:', '["Symphysis pubis", "Sacrum", "Ischial spines", "Cervix"]', 0, 'Incidence is ~0.6-1.4%. (Williams)'),
    (v_topic_id, '37: The first maneuver to try in shoulder dystocia is:', '["Zavanelli", "McRoberts Maneuver", "Woods Screw", "Fracture the clavicle"]', 1, 'Hyperflexing the maternal hips against the abdomen. (ACOG)'),
    (v_topic_id, '38: "Suprapubic pressure" is used in shoulder dystocia to:', '["Push the baby out", "Directly disimpact the anterior shoulder", "Help with contractions", "Stop bleeding"]', 1, 'Applied over the symphysis, NOT the fundus. (Beckmann)'),
    (v_topic_id, '39: "Fundal pressure" in shoulder dystocia is:', '["Highly recommended", "Contraindicated (increases risk of impaction and uterine rupture)", "Only for experts", "Always effective"]', 1, 'Never apply fundal pressure during dystocia. (ACOG)'),
    (v_topic_id, '40: "Zavanelli Maneuver" is:', '["Rotating the shoulders", "Replacing the fetal head in the uterus for emergency C-section", "Delivery of the legs", "Fracture of the humerus"]', 1, 'Last resort with high mortality. (Williams)'),
    (v_topic_id, '41: "Umbilical Cord Prolapse" presents as a sudden:', '["Late deceleration", "Deep, prolonged variable deceleration or bradycardia", "Early deceleration", "Fetal tachycardia"]', 1, 'Emergency; requires manual elevation of the head and C-section. (ACOG)'),
    (v_topic_id, '42: "Uterine Rupture" is most common in patients with:', '["No prior surgery", "Prior C-section (especially classical) or myomectomy", "Twins", "GDM"]', 1, 'Sudden loss of station and FHR distress. (Beckmann)'),
    (v_topic_id, '43: "Amniotic Fluid Embolism" (AFE) presents with a triad of:', '["Hypoxia, Hypotension, and DIC", "Fever, Rash, Pain", "High BP, Proteinuria, Seizures", "None"]', 0, 'Catastrophic event during labor/delivery. (ACOG)'),
    (v_topic_id, '44: Management of AFE is primarily:', '["Emergency C-section", "Aggressive supportive care (fluids, blood products, O2)", "Antibiotics", "Wait"]', 1, 'Maternal resuscitation is the priority. (Williams)'),
    (v_topic_id, '45: "Uterine Inversion" is often caused by:', '["Excessive cord traction on a non-separated placenta", "Strong contractions", "GDM", "Young age"]', 0, 'Presents with hemorrhage and a mass in the vagina. (Beckmann)'),
    (v_topic_id, '46: In "Uterine Inversion," which medication should be given BEFORE manual replacement?', '["Oxytocin", "Uterine relaxants (e.g., Nitroglycerin or Terbutaline)", "Methergine", "Hemabate"]', 1, 'You must relax the uterus to put it back. (Williams)'),
    (v_topic_id, '47: "Vasa Previa" rupture causes bleeding that is:', '["Maternal", "Fetal", "From the bladder", "Infectious"]', 1, 'Fetal mortality is high due to low blood volume. (ACOG)'),
    (v_topic_id, '48: "Meconium-stained" amniotic fluid in a "non-vigorous" infant requires:', '["Routine intubation and suctioning", "Immediate clearing of the airway and NRP as needed (no routine intubation)", "C-section", "Antibiotics"]', 1, 'Intubation for suction is no longer routinely recommended. (AAP/ACOG)'),
    (v_topic_id, '49: "Postpartum Hemorrhage" (PPH) is defined as cumulative blood loss > _____ mL regardless of mode of delivery.', '["500", "1000", "1500", "2000"]', 1, 'Updated ACOG definition. (ACOG)'),
    (v_topic_id, '50: The "Four Ts" of PPH causes: Tone, Trauma, Tissue, and:', '["Tension", "Thrombin (Coagulopathy)", "Temperature", "Time"]', 1, 'High-yield mnemonic. (Beckmann)'),
    (v_topic_id, '51: Most common cause of PPH?', '["Lacerations", "Uterine Atony", "Retained placenta", "Rupture"]', 1, 'Accounts for ~70-80% of cases. (Williams)'),
    (v_topic_id, '52: First-line medication for Uterine Atony?', '["Methergine", "Oxytocin (IV or IM)", "Hemabate", "Misoprostol"]', 1, 'Pitocin is the standard first step. (ACOG)'),
    (v_topic_id, '53: "Methergine" should be avoided in:', '["Asthma", "Hypertensive patients", "Diabetes", "Twins"]', 1, 'Causes vasoconstriction. (Beckmann)'),
    (v_topic_id, '54: "Hemabate" (Carboprost) should be avoided in:', '["Hypertension", "Asthmatic patients", "Renal failure", "Liver failure"]', 1, 'Causes bronchospasm. (ACOG)'),
    (v_topic_id, '55: "Bakri Balloon" is used for:', '["Ripening the cervix", "Tamponade of the uterine cavity in PPH", "Delivering the baby", "Measuring pressure"]', 1, 'Effective for refractory atony. (Williams)'),
    (v_topic_id, '56: "Post-term" pregnancy (> 42 weeks) monitoring usually includes:', '["Daily NST", "NST and AFI (Modified BPP) twice weekly", "Weekly ultrasound", "None"]', 1, 'Due to risk of placental decline and oligohydramnios. (ACOG)'),
    (v_topic_id, '57: "BPP" (Biophysical Profile) includes NST plus ultrasound assessment of Breathing, Movement, Tone, and:', '["Weight", "Amniotic Fluid Volume", "Heart rate", "Position"]', 1, 'Each scores 0 or 2. (Beckmann)'),
    (v_topic_id, '58: A "BPP" score of 4/10 at 38 weeks indicates:', '["Normal well-being", "Possible fetal hypoxia; delivery usually indicated", "Sleep", "None"]', 1, 'Low score requires action. (Williams)'),
    (v_topic_id, '59: "Kleihauer-Betke" (KB) test is used to detect:', '["Glucose", "Fetal RBCs in maternal circulation", "Infection", "Bilirubin"]', 1, 'Used in trauma or Rh-alloimmunization. (ACOG)'),
    (v_topic_id, '60: Maternal "Hypotension" after epidural often leads to:', '["Fetal tachycardia", "Late decelerations (due to decreased placental perfusion)", "Early decelerations", "None"]', 1, 'Treated with fluids and pressors (ephedrine/phenylephrine). (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Fetal Monitoring & Emergencies registered.';
END $$;
COMMIT;
