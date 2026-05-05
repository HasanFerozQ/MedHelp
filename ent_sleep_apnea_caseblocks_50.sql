-- ENT (Otolaryngology): Obstructive Sleep Apnea
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-sleep-apnea
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-sleep-apnea' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-sleep-apnea';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Obstructive Sleep Apnea (Adult Classic Presentation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snoring Husband' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snoring Husband', 'A 55-year-old obese male is brought to the clinic by his wife. She complains that his snoring is ''deafening'' and she frequently witnesses him stop breathing for up to 30 seconds at a time during the night. He reports feeling exhausted during the day and often falls asleep while watching TV.

Vitals: BP 150/95, BMI 36.
Physical Examination: Neck circumference is 18 inches. Oropharyngeal exam reveals a crowded airway with a low-lying soft palate and an elongated uvula (Mallampati Class IV).
Laboratory Results: None.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old obese male is brought to the clinic by his wife. She complains that his snoring is ''deafening'' and she frequently witnesses him stop breathing for up to 30 seconds at a time during the night. He reports feeling exhausted during the day and often falls asleep while watching TV.

Vitals: BP 150/95, BMI 36.
Physical Examination: Neck circumference is 18 inches. Oropharyngeal exam reveals a crowded airway with a low-lying soft palate and an elongated uvula (Mallampati Class IV).
Laboratory Results: None.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathophysiologic mechanism of Obstructive Sleep Apnea (OSA)?', '["Lack of respiratory drive from the brainstem","Recurrent collapse of the pharyngeal airway during sleep due to loss of muscle tone","Excessive mucus production","None"]', 1, 'During sleep, pharyngeal dilator muscles relax, allowing the soft tissues (palate, tongue) to collapse and obstruct the airway.'),
    (v_case_id, 'What is the Gold Standard diagnostic test for suspected OSA?', '["Home pulse oximetry","In-lab, attended, overnight Polysomnography (PSG)","CT scan of the neck","None"]', 1, 'PSG monitors EEG, EOG, EMG, airflow, respiratory effort, and oxygen saturation to definitively diagnose and classify OSA.'),
    (v_case_id, 'What is the most common anatomic risk factor for OSA in adults?', '["Deviated septum","Obesity, particularly increased neck circumference (>17 inches in men, >16 in women)","Large tonsils","None"]', 1, 'Fat deposition in the parapharyngeal spaces narrows the airway and increases its collapsibility.');

    ---------------------------------------------------------------------------
    -- CASE 02: Pediatric Obstructive Sleep Apnea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hyperactive Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hyperactive Child', 'A 6-year-old boy is brought in by his parents due to behavioral issues and poor school performance. His teacher suspects ADHD. The parents note he is a chronic mouth-breather, snores loudly, and tosses and turns all night.

Vitals: Normal. BMI 50th percentile.
Physical Examination: ''Adenoid facies'' with an open mouth. Oral exam reveals massive 4+ ''kissing'' palatine tonsils that touch in the midline.
Laboratory Results: None.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old boy is brought in by his parents due to behavioral issues and poor school performance. His teacher suspects ADHD. The parents note he is a chronic mouth-breather, snores loudly, and tosses and turns all night.

Vitals: Normal. BMI 50th percentile.
Physical Examination: ''Adenoid facies'' with an open mouth. Oral exam reveals massive 4+ ''kissing'' palatine tonsils that touch in the midline.
Laboratory Results: None.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of Obstructive Sleep Apnea in children?', '["Obesity","Adenotonsillar hypertrophy","Craniofacial anomalies","None"]', 1, 'Unlike adults where obesity is the primary driver, pediatric OSA is most frequently caused by enlarged tonsils and adenoids.'),
    (v_case_id, 'How does the daytime presentation of pediatric OSA classically differ from adult OSA?', '["Adults are hyperactive; children are sleepy","Adults typically present with hypersomnolence, while children often present with paradoxical hyperactivity, inattention, and behavioral problems (mimicking ADHD)","They present identically","None"]', 1, 'Chronic sleep fragmentation in children manifests as behavioral dysregulation and poor executive function.'),
    (v_case_id, 'What is the first-line definitive treatment for this child?', '["CPAP","Adenotonsillectomy","Stimulant medications for ADHD","None"]', 1, 'Surgical removal of the hypertrophic adenoids and tonsils is highly effective and curative in the vast majority of healthy children with OSA.');

    ---------------------------------------------------------------------------
    -- CASE 03: Severe Obstructive Sleep Apnea (Polysomnography Interpretation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sleep Study' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sleep Study', 'A 45-year-old male undergoes overnight polysomnography (PSG) for suspected sleep apnea. The PSG report shows an average of 40 events per hour where his airflow completely stops for at least 10 seconds despite continued respiratory effort. His lowest oxygen saturation was 82%.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI = 40.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male undergoes overnight polysomnography (PSG) for suspected sleep apnea. The PSG report shows an average of 40 events per hour where his airflow completely stops for at least 10 seconds despite continued respiratory effort. His lowest oxygen saturation was 82%.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI = 40.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What index is the primary metric used to diagnose and grade the severity of OSA on a sleep study?', '["Oxygen Desaturation Index (ODI)","Apnea-Hypopnea Index (AHI)","Respiratory Disturbance Index (RDI)","None"]', 1, 'The AHI measures the total number of apneas and hypopneas per hour of sleep.'),
    (v_case_id, 'How is ''Severe'' Obstructive Sleep Apnea defined in adults based on the AHI?', '["AHI 5-15","AHI 15-30","AHI > 30 events per hour","None"]', 1, 'Mild is 5-15, Moderate is 15-30, and Severe is >30 events per hour.'),
    (v_case_id, 'What defines an ''Apnea'' during a sleep study?', '["A 50% reduction in airflow","A complete cessation of airflow (drop of ≥90%) lasting at least 10 seconds","A drop in oxygen by 3%","None"]', 1, 'Apnea means ''no breath''. Hypopnea is a partial reduction in airflow.');

    ---------------------------------------------------------------------------
    -- CASE 04: Central Sleep Apnea (CSA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Effortless Pause' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Effortless Pause', 'A 60-year-old male with severe congestive heart failure undergoes a sleep study. The PSG shows multiple 20-second periods where airflow completely stops. Crucially, the chest and abdominal effort belts show ZERO movement during these events.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: PSG shows absence of airflow and absence of respiratory effort.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with severe congestive heart failure undergoes a sleep study. The PSG shows multiple 20-second periods where airflow completely stops. Crucially, the chest and abdominal effort belts show ZERO movement during these events.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: PSG shows absence of airflow and absence of respiratory effort.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Central Sleep Apnea physiologically differ from Obstructive Sleep Apnea?', '["There is no difference","In OSA, the airway collapses but respiratory effort continues; in CSA, there is no airway collapse, but the brainstem fails to send the signal to breathe (no respiratory effort)","CSA only happens awake","None"]', 1, 'Central apnea is a problem of ventilatory drive, not airway anatomy.'),
    (v_case_id, 'What classic breathing pattern is frequently seen in patients with heart failure and Central Sleep Apnea?', '["Kussmaul breathing","Cheyne-Stokes Respiration (a crescendo-decrescendo pattern of breathing separated by central apneas)","Biot''s breathing","None"]', 1, 'Cheyne-Stokes breathing is a hallmark of CSA driven by delayed feedback loops in heart failure.'),
    (v_case_id, 'Can CPAP be used to treat Central Sleep Apnea?', '["It is the first choice","Standard CPAP is often ineffective; Adaptive Servo-Ventilation (ASV) or BiPAP with a backup respiratory rate is typically required","It cures it instantly","None"]', 1, 'Because the patient is not trying to breathe, just holding the airway open (CPAP) doesn''t force air into the lungs.');

    ---------------------------------------------------------------------------
    -- CASE 05: Continuous Positive Airway Pressure (CPAP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mask Therapy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mask Therapy', 'A 50-year-old male is diagnosed with severe OSA (AHI 45). The sleep physician prescribes the gold-standard medical therapy. The patient returns to the ENT clinic complaining that he finds the machine uncomfortable, but admits his daytime sleepiness has completely resolved when he uses it.

Vitals: BP 125/80.
Physical Examination: Mild nasal bridge erythema from a mask interface.
Laboratory Results: CPAP download shows excellent compliance and residual AHI of 2.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male is diagnosed with severe OSA (AHI 45). The sleep physician prescribes the gold-standard medical therapy. The patient returns to the ENT clinic complaining that he finds the machine uncomfortable, but admits his daytime sleepiness has completely resolved when he uses it.

Vitals: BP 125/80.
Physical Examination: Mild nasal bridge erythema from a mask interface.
Laboratory Results: CPAP download shows excellent compliance and residual AHI of 2.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does CPAP physically prevent Obstructive Sleep Apnea?', '["It delivers pure oxygen","It acts as a ''pneumatic splint,'' delivering continuous positive pressure to forcefully hold the pharyngeal soft tissues open during both inspiration and expiration","It forces the diaphragm to move","None"]', 1, 'It does not breathe for the patient; it just physically prevents the airway from collapsing.'),
    (v_case_id, 'What is the most common reason for failure of CPAP therapy?', '["The machine breaks","Poor patient adherence/compliance due to mask discomfort, claustrophobia, or nasal congestion","It doesn''t work for severe OSA","None"]', 1, 'CPAP is near 100% effective when worn, but long-term compliance is often only 50-60%.'),
    (v_case_id, 'If a patient complains of severe nasal dryness and epistaxis while using CPAP, what is the best initial intervention?', '["Stop CPAP forever","Add heated humidification to the CPAP machine and prescribe saline nasal spray","Perform sinus surgery","None"]', 1, 'High airflow dries out the nasal mucosa. Humidification is a standard comfort feature.');

    ---------------------------------------------------------------------------
    -- CASE 06: Bilevel Positive Airway Pressure (BiPAP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Two Pressures' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Two Pressures', 'A 400-pound (181 kg) male with severe OSA and obesity hypoventilation is unable to tolerate his CPAP machine because the constant high pressure (18 cm H2O) makes it extremely difficult for him to exhale against it. He feels like he is ''suffocating.''

Vitals: SpO2 92%.
Physical Examination: Morbid obesity.
Laboratory Results: None.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 400-pound (181 kg) male with severe OSA and obesity hypoventilation is unable to tolerate his CPAP machine because the constant high pressure (18 cm H2O) makes it extremely difficult for him to exhale against it. He feels like he is ''suffocating.''

Vitals: SpO2 92%.
Physical Examination: Morbid obesity.
Laboratory Results: None.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does BiPAP fundamentally differ from CPAP?', '["It uses two masks","CPAP delivers one constant pressure; BiPAP delivers a higher pressure during inspiration (IPAP) and a lower pressure during expiration (EPAP)","It delivers negative pressure","None"]', 1, 'The lower expiratory pressure makes it much easier and more comfortable for the patient to exhale, especially at high pressure settings.'),
    (v_case_id, 'In what patient population is BiPAP particularly indicated over CPAP?', '["Patients with mild OSA","Patients requiring very high pressures, or those with concomitant hypoventilation syndromes (e.g., COPD, Obesity Hypoventilation Syndrome) needing ventilatory support","Children","None"]', 1, 'The pressure difference (IPAP - EPAP) provides ''pressure support,'' actually assisting ventilation and blowing off CO2.'),
    (v_case_id, 'What parameter does the EPAP (Expiratory Positive Airway Pressure) in BiPAP primarily control?', '["Oxygenation","It acts like CPAP to stent the upper airway open and prevent obstructive collapse","Heart rate","None"]', 1, 'The baseline expiratory pressure must be high enough to keep the airway open, while the higher inspiratory pressure assists the breath.');

    ---------------------------------------------------------------------------
    -- CASE 07: Uvulopalatopharyngoplasty (UPPP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Palate Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Palate Surgery', 'A 35-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. He has very large palatine tonsils (Grade 3) and a long, redundant soft palate. He wants a permanent surgical solution.

Vitals: BMI 28.
Physical Examination: Redundant soft palate, elongated uvula, enlarged tonsils.
Laboratory Results: None.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. He has very large palatine tonsils (Grade 3) and a long, redundant soft palate. He wants a permanent surgical solution.

Vitals: BMI 28.
Physical Examination: Redundant soft palate, elongated uvula, enlarged tonsils.
Laboratory Results: None.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structures are surgically removed or remodeled during a classic UPPP?', '["The tongue base and epiglottis","The palatine tonsils (if present), the uvula, and a portion of the redundant free edge of the soft palate","The nasal septum","None"]', 1, 'The goal is to widen the retropalatal airway by removing redundant tissue and suturing the pillars to create a tighter box.'),
    (v_case_id, 'Is UPPP generally considered a highly successful standalone cure for severe OSA in all adults?', '["Yes, 100% cure rate","No, success rates (defined as 50% reduction in AHI and AHI < 20) are traditionally only around 40-50% for unselected patients","Yes, but only in obese patients","None"]', 1, 'UPPP only addresses the palatal level of obstruction. If the patient also collapses at the tongue base (which is common), UPPP alone will fail.'),
    (v_case_id, 'What is a common long-term risk or complication of overly aggressive UPPP?', '["Blindness","Velopharyngeal insufficiency (VPI), resulting in hypernasal speech and nasal regurgitation of liquids","Loss of taste","None"]', 1, 'If too much soft palate is removed, it cannot seal against the posterior pharyngeal wall during swallowing.');

    ---------------------------------------------------------------------------
    -- CASE 08: Drug-Induced Sleep Endoscopy (DISE)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sleeping Endoscopy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sleeping Endoscopy', 'A 45-year-old male with CPAP-intolerant OSA is being evaluated for sleep surgery. Awake examination reveals a normal palate and small tonsils. The surgeon wants to know exactly where the airway is collapsing before operating.

Vitals: Normal.
Physical Examination: The patient is taken to the OR and given IV Propofol and Dexmedetomidine to simulate natural sleep. A flexible endoscope is passed through his nose to observe the airway dynamically as he begins to snore and obstruct.
Laboratory Results: None.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male with CPAP-intolerant OSA is being evaluated for sleep surgery. Awake examination reveals a normal palate and small tonsils. The surgeon wants to know exactly where the airway is collapsing before operating.

Vitals: Normal.
Physical Examination: The patient is taken to the OR and given IV Propofol and Dexmedetomidine to simulate natural sleep. A flexible endoscope is passed through his nose to observe the airway dynamically as he begins to snore and obstruct.
Laboratory Results: None.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary purpose of Drug-Induced Sleep Endoscopy (DISE)?', '["To cure OSA","To dynamically identify the exact anatomic levels (palate, lateral walls, tongue base, epiglottis) and patterns (AP vs concentric) of airway collapse during simulated sleep","To biopsy the airway","None"]', 1, 'Awake exams correlate poorly with sleeping collapse. DISE allows targeted, personalized surgical planning.'),
    (v_case_id, 'If DISE reveals ''complete concentric collapse'' at the level of the velum (soft palate), what specific surgical treatment is generally CONTRAINDICATED?', '["UPPP","Hypoglossal Nerve Stimulation (Inspire therapy)","Tonsillectomy","None"]', 1, 'The FDA strictly contraindicates Inspire therapy in patients with complete concentric palatal collapse, as stimulating the tongue will not open a concentrically collapsed palate.'),
    (v_case_id, 'What classification system is commonly used to score the findings during DISE?', '["Mallampati","VOTE classification (Velum, Oropharynx lateral walls, Tongue base, Epiglottis)","Friedman","None"]', 1, 'The VOTE system standardizes the reporting of airway collapse.');

    ---------------------------------------------------------------------------
    -- CASE 09: Obesity Hypoventilation Syndrome (Pickwickian Syndrome)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hypoventilating Obese Male' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hypoventilating Obese Male', 'A 55-year-old morbidly obese male (BMI 45) presents with severe daytime somnolence, morning headaches, and lower extremity edema. He has a known history of severe OSA but refuses to use CPAP.

Vitals: BP 160/95, RR 20, SpO2 88% on room air while awake in the clinic.
Physical Examination: Cyanotic lips, pitting edema of the legs.
Laboratory Results: Arterial Blood Gas (ABG) while awake: PaCO2 is 55 mmHg (Normal 35-45).', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old morbidly obese male (BMI 45) presents with severe daytime somnolence, morning headaches, and lower extremity edema. He has a known history of severe OSA but refuses to use CPAP.

Vitals: BP 160/95, RR 20, SpO2 88% on room air while awake in the clinic.
Physical Examination: Cyanotic lips, pitting edema of the legs.
Laboratory Results: Arterial Blood Gas (ABG) while awake: PaCO2 is 55 mmHg (Normal 35-45).', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines Obesity Hypoventilation Syndrome (OHS)?', '["Obesity and low oxygen","Obesity (BMI > 30), daytime hypercapnia (PaCO2 > 45 mmHg) while awake, and sleep-disordered breathing, in the absence of other causes of hypoventilation","Obesity and diabetes","None"]', 1, 'These patients don''t just obstruct at night; the extreme weight on the chest wall blunts their respiratory drive, causing chronic CO2 retention even while awake.'),
    (v_case_id, 'Why do these patients develop peripheral edema?', '["Kidney failure","Chronic hypoxia and hypercapnia cause pulmonary vasoconstriction, leading to pulmonary hypertension, right heart failure (cor pulmonale), and subsequent peripheral edema","Too much salt","None"]', 1, 'Untreated OHS rapidly progresses to irreversible right heart failure.'),
    (v_case_id, 'What is the most appropriate positive airway pressure therapy for severe OHS?', '["CPAP only","BiPAP (Non-Invasive Positive Pressure Ventilation) is often required to aggressively ''blow off'' the excess CO2","No therapy","None"]', 1, 'While CPAP helps the OSA, BiPAP actually ventilates the patient, treating the hypercapnia.');

    ---------------------------------------------------------------------------
    -- CASE 10: Friedman Staging System
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Staging System' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Staging System', 'A 30-year-old male is being evaluated for UPPP. The ENT surgeon notes that the patient has a Friedman Stage III airway.

Vitals: Normal.
Physical Examination: Tonsils are Grade 1 (small, hidden behind pillars). The soft palate is low-lying, and the uvula is completely obscured by the tongue base when the mouth is opened wide (Modified Mallampati Class IV). BMI is 25.
Laboratory Results: None.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male is being evaluated for UPPP. The ENT surgeon notes that the patient has a Friedman Stage III airway.

Vitals: Normal.
Physical Examination: Tonsils are Grade 1 (small, hidden behind pillars). The soft palate is low-lying, and the uvula is completely obscured by the tongue base when the mouth is opened wide (Modified Mallampati Class IV). BMI is 25.
Laboratory Results: None.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What three variables are used to calculate the Friedman Stage for OSA surgical planning?', '["Age, weight, blood pressure","Palate position (Modified Mallampati), Tonsil size, and BMI","Neck size, height, AHI","None"]', 1, 'This simple bedside staging system predicts the success rate of UPPP surgery.'),
    (v_case_id, 'How would you expect a patient with Friedman Stage I (huge tonsils, high palate, low BMI) to respond to UPPP?', '["Poorly","Excellent response (approx. 80% success rate)","No change","None"]', 1, 'Stage I patients have obvious palatal/tonsillar obstruction that is easily fixed with surgery.'),
    (v_case_id, 'How would you expect the patient in the scenario (Friedman Stage III: small tonsils, Mallampati IV) to respond to UPPP alone?', '["Excellent response","Very poor response (approx. 8% success rate)","Perfect cure","None"]', 1, 'Stage III patients have obstruction at the tongue base, not just the palate. UPPP alone will almost certainly fail.');

    ---------------------------------------------------------------------------
    -- CASE 11: Mandibular Advancement Device (MAD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dental Appliance' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dental Appliance', 'A 40-year-old female with mild OSA (AHI 12) complains of snoring that bothers her husband. She tried CPAP but developed severe claustrophobia. She is not obese and does not want surgery. She has good dentition.

Vitals: BMI 23.
Physical Examination: Normal palate, slight retrognathia (recessed jaw).
Laboratory Results: None.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old female with mild OSA (AHI 12) complains of snoring that bothers her husband. She tried CPAP but developed severe claustrophobia. She is not obese and does not want surgery. She has good dentition.

Vitals: BMI 23.
Physical Examination: Normal palate, slight retrognathia (recessed jaw).
Laboratory Results: None.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does a Mandibular Advancement Device (MAD) treat OSA?', '["It blows air","It is a custom-fitted dental appliance that physically pulls the lower jaw forward during sleep, bringing the tongue base forward and opening the retroglossal airway","It holds the mouth closed","None"]', 1, 'By dragging the mandible forward, it tightens the pharyngeal musculature.'),
    (v_case_id, 'For which OSA severity is a MAD most strongly indicated as a first-line alternative to CPAP?', '["Severe OSA","Mild to Moderate OSA","Central Sleep Apnea","None"]', 1, 'It is highly effective for snoring and mild/moderate OSA, but less reliable for severe OSA.'),
    (v_case_id, 'What is a common side effect of long-term MAD use?', '["Tooth decay","Temporomandibular joint (TMJ) pain and permanent shifts in dental occlusion (bite changes)","Ear infections","None"]', 1, 'Constant forward pressure on the teeth and jaw joint can cause significant orthodontic changes.');

    ---------------------------------------------------------------------------
    -- CASE 12: Maxillomandibular Advancement (MMA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Maxillary Move' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Maxillary Move', 'A 45-year-old male with severe OSA (AHI 60) has failed CPAP, UPPP, and a dental appliance. He has a noticeably recessed lower jaw (retrognathia) and a narrow midface. He is seeking a definitive, highly successful surgical cure.

Vitals: BMI 28.
Physical Examination: Maxillary hypoplasia and severe mandibular retrognathia.
Laboratory Results: Lateral cephalogram shows a drastically narrowed posterior airway space (PAS).', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male with severe OSA (AHI 60) has failed CPAP, UPPP, and a dental appliance. He has a noticeably recessed lower jaw (retrognathia) and a narrow midface. He is seeking a definitive, highly successful surgical cure.

Vitals: BMI 28.
Physical Examination: Maxillary hypoplasia and severe mandibular retrognathia.
Laboratory Results: Lateral cephalogram shows a drastically narrowed posterior airway space (PAS).', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Maxillomandibular Advancement (MMA) surgery?', '["Removing the tonsils","A major orthognathic surgery where both the upper jaw (maxilla) and lower jaw (mandible) are cut and moved forward (usually ~10mm)","Removing the tongue","None"]', 1, 'This pulls the entire anterior pharyngeal wall (palate and tongue) forward, massively expanding the airway.'),
    (v_case_id, 'How does the success rate of MMA compare to UPPP for severe OSA?', '["It is lower","MMA is the most effective sleep surgery, with success rates often exceeding 85-90%, approaching the efficacy of CPAP","They are identical","None"]', 1, 'Because it fundamentally expands the skeletal box of the airway, it treats obstruction at all levels.'),
    (v_case_id, 'What is a major aesthetic consequence of MMA?', '["No change","Significant alteration of facial appearance (moving the lower face forward), which patients must be prepared for","Loss of teeth","None"]', 1, 'While often beneficial for retrognathic patients, it changes their face permanently.');

    ---------------------------------------------------------------------------
    -- CASE 13: Hypoglossal Nerve Stimulator (Inspire)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nerve Pacemaker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nerve Pacemaker', 'A 50-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. DISE shows AP (anterior-posterior) collapse at the tongue base, with NO complete concentric palatal collapse. He is not morbidly obese.

Vitals: BMI 30.
Physical Examination: Normal.
Laboratory Results: None.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. DISE shows AP (anterior-posterior) collapse at the tongue base, with NO complete concentric palatal collapse. He is not morbidly obese.

Vitals: BMI 30.
Physical Examination: Normal.
Laboratory Results: None.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Hypoglossal Nerve Stimulation work to treat OSA?', '["It stops breathing","An implanted pacemaker-like device senses respiration and electrically stimulates the distal branches of the hypoglossal nerve (CN XII) during inspiration","It stimulates the diaphragm","None"]', 1, 'Stimulation of CN XII causes the genioglossus muscle to contract, pushing the tongue forward and opening the airway.'),
    (v_case_id, 'Why is complete concentric collapse at the palate a strict contraindication for this therapy?', '["It causes pain","Stimulating the tongue only opens the retroglossal airway; it cannot pull open a palate that is collapsing circularly from all sides","It shocks the palate","None"]', 1, 'This is why Drug-Induced Sleep Endoscopy (DISE) is mandatory before implanting the device.'),
    (v_case_id, 'The stimulation cuff is placed on the distal branches of the hypoglossal nerve to selectively activate the genioglossus. What movement does this cause?', '["Tongue retraction","Tongue protrusion and stiffening","Palate elevation","None"]', 1, 'Protrusion clears the tongue base out of the posterior airway space.');

    ---------------------------------------------------------------------------
    -- CASE 14: Tracheostomy for OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ultimate Bypass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ultimate Bypass', 'A 60-year-old morbidly obese male with life-threatening severe OSA (AHI 110), severe cor pulmonale, and obesity hypoventilation syndrome has failed all conservative and non-invasive measures. He is in right heart failure and cannot breathe.

Vitals: SpO2 85%.
Physical Examination: Massive obesity. Cyanosis. Extreme neck thickness.
Laboratory Results: None.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old morbidly obese male with life-threatening severe OSA (AHI 110), severe cor pulmonale, and obesity hypoventilation syndrome has failed all conservative and non-invasive measures. He is in right heart failure and cannot breathe.

Vitals: SpO2 85%.
Physical Examination: Massive obesity. Cyanosis. Extreme neck thickness.
Laboratory Results: None.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Before the invention of CPAP in the 1980s, what was the only effective treatment for severe OSA?', '["UPPP","Tracheostomy","Dieting","None"]', 1, 'Tracheostomy completely bypasses the collapsible upper airway, providing a 100% cure for Obstructive Sleep Apnea.'),
    (v_case_id, 'Why is tracheostomy rarely used today for OSA?', '["It doesn''t work","It carries significant morbidity, psychosocial stigma, and requires rigorous daily stoma care; it is reserved only for extreme, refractory, life-threatening cases","It is too expensive","None"]', 1, 'It is the treatment of absolute last resort, but it is guaranteed to work.'),
    (v_case_id, 'If a tracheostomy is performed for OSA, what happens during the day?', '["The patient cannot talk","The tube is usually plugged or capped during the day to allow normal speech and breathing, and uncapped only at night to bypass the obstruction","The tube is removed","None"]', 1, 'This allows the patient to live relatively normally while awake.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cor Pulmonale secondary to OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heart Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heart Failure', 'A 65-year-old male with a 20-year history of untreated severe OSA presents to the ER with worsening shortness of breath, massive leg swelling, and ascites. His lungs are clear to auscultation.

Vitals: BP 140/90, HR 95.
Physical Examination: Elevated JVP, 3+ pitting edema, hepatomegaly.
Laboratory Results: Echocardiogram shows severe right ventricular hypertrophy and dilation. Left ventricular function is normal.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male with a 20-year history of untreated severe OSA presents to the ER with worsening shortness of breath, massive leg swelling, and ascites. His lungs are clear to auscultation.

Vitals: BP 140/90, HR 95.
Physical Examination: Elevated JVP, 3+ pitting edema, hepatomegaly.
Laboratory Results: Echocardiogram shows severe right ventricular hypertrophy and dilation. Left ventricular function is normal.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines Cor Pulmonale?', '["Left heart failure","Right-sided heart failure resulting from primary disease of the lungs or pulmonary vasculature (e.g., severe OSA causing pulmonary hypertension)","A heart attack","None"]', 1, 'The right heart fails because it is trying to pump against high pressure in the lungs.'),
    (v_case_id, 'How does untreated OSA lead to Cor Pulmonale?', '["By causing coronary artery disease","Chronic intermittent hypoxia during apneic events triggers pulmonary vasoconstriction; over years, this leads to fixed pulmonary hypertension and right heart strain","By causing arrhythmias","None"]', 1, 'Hypoxic pulmonary vasoconstriction is the body''s attempt to shunt blood away from poorly ventilated lung zones; in OSA, the whole lung is poorly ventilated.'),
    (v_case_id, 'Will initiating CPAP therapy reverse the Cor Pulmonale?', '["Never","It can halt progression and often partially reverse the pulmonary hypertension and right heart strain if started before irreversible fibrotic changes occur","It makes it worse","None"]', 1, 'Reversing the hypoxia removes the trigger for pulmonary vasoconstriction.');

    ---------------------------------------------------------------------------
    -- CASE 16: OSA and Systemic Hypertension
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Resistant Hypertension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Resistant Hypertension', 'A 45-year-old male is referred by his cardiologist. He has hypertension that remains uncontrolled (160/100) despite taking three different blood pressure medications (Lisinopril, Amlodipine, HCTZ). He snores heavily.

Vitals: BP 160/100. BMI 32.
Physical Examination: Thick neck, crowded oropharynx.
Laboratory Results: None.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male is referred by his cardiologist. He has hypertension that remains uncontrolled (160/100) despite taking three different blood pressure medications (Lisinopril, Amlodipine, HCTZ). He snores heavily.

Vitals: BP 160/100. BMI 32.
Physical Examination: Thick neck, crowded oropharynx.
Laboratory Results: None.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Obstructive Sleep Apnea is recognized as the most common cause of what cardiovascular condition?', '["Aortic dissection","Secondary (refractory) systemic hypertension","Endocarditis","None"]', 1, 'Any patient with hypertension resistant to 3 or more drugs MUST be evaluated for OSA.'),
    (v_case_id, 'What is the physiological mechanism linking OSA to systemic hypertension?', '["Kidney failure","Hypoxia and hypercapnia during apneas trigger massive surges of sympathetic nervous system activity (catecholamines), keeping blood pressure chronically elevated even during the day","High salt diet","None"]', 1, 'The body essentially experiences a ''fight or flight'' response hundreds of times a night.'),
    (v_case_id, 'What characteristic blood pressure pattern is often seen on 24-hour monitoring in patients with OSA?', '["Nighttime hypotension","A ''non-dipping'' pattern, where the normal 10-20% drop in blood pressure during sleep does not occur","Only daytime spikes","None"]', 1, 'The lack of nocturnal dipping is a strong predictor of cardiovascular events (strokes, heart attacks).');

    ---------------------------------------------------------------------------
    -- CASE 17: Epworth Sleepiness Scale (ESS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sleepy Driver' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sleepy Driver', 'A 50-year-old truck driver is sent for evaluation by his employer. He recently ran a red light because he ''dozed off'' for a second. The ENT asks him to fill out a questionnaire grading his likelihood of dozing in various situations (e.g., sitting and reading, riding in a car, sitting inactive in a public place).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: His questionnaire score is 18/24.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old truck driver is sent for evaluation by his employer. He recently ran a red light because he ''dozed off'' for a second. The ENT asks him to fill out a questionnaire grading his likelihood of dozing in various situations (e.g., sitting and reading, riding in a car, sitting inactive in a public place).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: His questionnaire score is 18/24.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of the Epworth Sleepiness Scale (ESS)?', '["To diagnose OSA","To subjectively quantify a patient''s level of daytime sleepiness","To measure oxygen levels","None"]', 1, 'It does not diagnose OSA, but it measures the clinical impact (somnolence). A score > 10 is considered abnormal.'),
    (v_case_id, 'Why is commercial driving a major concern in patients with untreated severe OSA?', '["They get lost","Untreated severe OSA dramatically increases the risk of motor vehicle accidents due to micro-sleeps and delayed reaction times","They can''t see well","None"]', 1, 'Many regulatory bodies require proof of CPAP compliance for commercial drivers diagnosed with OSA.'),
    (v_case_id, 'What objective test can be used in the sleep lab to measure the tendency to fall asleep during the day?', '["PSG","Multiple Sleep Latency Test (MSLT)","ECG","None"]', 1, 'The MSLT gives the patient 5 nap opportunities. Falling asleep rapidly (e.g., < 8 minutes) indicates pathologic sleepiness.');

    ---------------------------------------------------------------------------
    -- CASE 18: STOP-BANG Questionnaire
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pre-Op Screen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pre-Op Screen', 'A 60-year-old male is in the pre-operative clinic before an elective hernia repair. The anesthesiologist administers a questionnaire asking if he Snores, is Tired, has Observed apneas, has high blood Pressure, his BMI, Age, Neck circumference, and Gender.

Vitals: BP 145/90. BMI 36.
Physical Examination: Neck is 17.5 inches.
Laboratory Results: None.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male is in the pre-operative clinic before an elective hernia repair. The anesthesiologist administers a questionnaire asking if he Snores, is Tired, has Observed apneas, has high blood Pressure, his BMI, Age, Neck circumference, and Gender.

Vitals: BP 145/90. BMI 36.
Physical Examination: Neck is 17.5 inches.
Laboratory Results: None.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the STOP-BANG questionnaire used for?', '["To diagnose asthma","It is a highly sensitive screening tool to identify patients at high risk for OSA, especially in the pre-operative setting","To stage cancer","None"]', 1, 'A score of 3 or more indicates high risk and alerts the anesthesia team to potential airway and extubation challenges.'),
    (v_case_id, 'What does the ''BANG'' stand for?', '["Blood, Age, Nose, Genetics","BMI (>35), Age (>50), Neck circumference (>16/17in), Gender (Male)","Breath, Airway, Neck, Girth","None"]', 1, 'These are the four major demographic/physical risk factors for OSA.'),
    (v_case_id, 'Why is identifying OSA critical for the anesthesiologist?', '["To charge more","Patients with OSA are extremely sensitive to opioids/sedatives and are at high risk for post-operative respiratory failure and airway obstruction","To pick the right antibiotic","None"]', 1, 'They may require CPAP immediately in the recovery room and careful monitoring with avoidance of narcotics.');

    ---------------------------------------------------------------------------
    -- CASE 19: Mallampati Classification (OSA Risk)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hidden Uvula' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hidden Uvula', 'A 35-year-old female presents with snoring. The ENT asks her to open her mouth as wide as possible and stick out her tongue without saying ''ah''. The doctor can only see her hard palate; the soft palate, uvula, and tonsillar pillars are completely hidden by the base of the tongue.

Vitals: Normal.
Physical Examination: Oral cavity exam as described.
Laboratory Results: None.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female presents with snoring. The ENT asks her to open her mouth as wide as possible and stick out her tongue without saying ''ah''. The doctor can only see her hard palate; the soft palate, uvula, and tonsillar pillars are completely hidden by the base of the tongue.

Vitals: Normal.
Physical Examination: Oral cavity exam as described.
Laboratory Results: None.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on the description, what Mallampati score does this patient have?', '["Class I","Class II","Class IV","Class III"]', 3, 'Class I: entire uvula/tonsils visible. Class II: uvula partially visible. Class III: only base of uvula/soft palate visible. Class IV: only hard palate visible.'),
    (v_case_id, 'What does a high Mallampati score (Class III or IV) correlate with?', '["A good singing voice","A crowded oropharynx, a higher risk of difficult intubation, and a higher risk of Obstructive Sleep Apnea","Low risk of OSA","None"]', 2, 'It visually demonstrates the disproportion between the size of the tongue and the size of the oral cavity.'),
    (v_case_id, 'Why is the patient instructed NOT to say ''ah'' during the Modified Mallampati exam?', '["It spreads germs","Saying ''ah'' actively elevates the soft palate, falsely improving the view and leading to an underestimation of crowding","It makes them gag","None"]', 2, 'The airway must be assessed in its relaxed state.');

    ---------------------------------------------------------------------------
    -- CASE 20: Adenotonsillectomy for Pediatric OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cured Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cured Child', 'A 7-year-old girl with severe OSA (AHI 25) and massive tonsils underwent a tonsillectomy and adenoidectomy (T&A) 6 weeks ago. She returns for a follow-up. Her parents are ecstatic, reporting she sleeps silently, has boundless energy, and her school grades have improved.

Vitals: Normal.
Physical Examination: Well-healed tonsillar fossae. Clear nasal airway.
Laboratory Results: None.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 7-year-old girl with severe OSA (AHI 25) and massive tonsils underwent a tonsillectomy and adenoidectomy (T&A) 6 weeks ago. She returns for a follow-up. Her parents are ecstatic, reporting she sleeps silently, has boundless energy, and her school grades have improved.

Vitals: Normal.
Physical Examination: Well-healed tonsillar fossae. Clear nasal airway.
Laboratory Results: None.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the expected cure rate of Adenotonsillectomy for OSA in otherwise healthy, non-obese children?', '["10%","Very high, approximately 80-90%","50%","None"]', 2, 'T&A is highly curative, making it the definitive first-line treatment.'),
    (v_case_id, 'Is a post-operative sleep study (PSG) routinely required for all children after T&A?', '["Yes, always","No, it is typically reserved for children with severe preoperative OSA, obesity, syndromic conditions, or if symptoms persist","Only if they snore","None"]', 2, 'If a healthy child has complete symptom resolution, a repeat study is unnecessary.'),
    (v_case_id, 'What life-threatening complication must be monitored for in children with SEVERE preoperative OSA immediately following T&A?', '["Deafness","Post-obstructive pulmonary edema (Negative Pressure Pulmonary Edema) and respiratory compromise","Blindness","None"]', 2, 'Sudden relief of chronic high-grade obstruction can alter pulmonary hemodynamics. These children must be monitored overnight in the hospital.');

    ---------------------------------------------------------------------------
    -- CASE 21: Persistent OSA in Down Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Persistent Apnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Persistent Apnea', 'A 6-year-old boy with Down Syndrome and severe OSA underwent Adenotonsillectomy 3 months ago. Despite the surgery, his parents report he still snores heavily and has witnessed apneas. A repeat sleep study shows an AHI of 15.

Vitals: BMI 85th percentile.
Physical Examination: Large, protruding tongue (macroglossia). Midface hypoplasia. Narrow palate.
Laboratory Results: None.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old boy with Down Syndrome and severe OSA underwent Adenotonsillectomy 3 months ago. Despite the surgery, his parents report he still snores heavily and has witnessed apneas. A repeat sleep study shows an AHI of 15.

Vitals: BMI 85th percentile.
Physical Examination: Large, protruding tongue (macroglossia). Midface hypoplasia. Narrow palate.
Laboratory Results: None.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the success rate of Adenotonsillectomy for OSA significantly lower in children with Down Syndrome compared to healthy children?', '["Their tonsils grow back instantly","They have multiple other anatomic/physiologic levels of obstruction: macroglossia, midface hypoplasia, and generalized hypotonia (floppy airway)","They don''t have OSA","None"]', 2, 'T&A only removes one layer of the problem; the floppy, large tongue and small face remain.'),
    (v_case_id, 'What is a critical diagnostic step for this child to determine the cause of the persistent OSA?', '["Chest X-ray","Drug-Induced Sleep Endoscopy (DISE) to dynamically evaluate for tongue base collapse, epiglottic collapse, or laryngomalacia","Gastric emptying study","None"]', 2, 'DISE is essential in complex/syndromic pediatric patients who fail T&A to guide further targeted surgery or CPAP.'),
    (v_case_id, 'What is a common conservative therapy for persistent OSA in syndromic children?', '["Tracheostomy","CPAP or BiPAP therapy","Observation","None"]', 2, 'While surgical options (like tongue base reduction) exist, CPAP is the non-invasive standard for persistent disease.');

    ---------------------------------------------------------------------------
    -- CASE 22: Lateral Cephalometrics in OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cephalometric Profile' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cephalometric Profile', 'A 30-year-old male with severe OSA is undergoing evaluation for maxillomandibular advancement surgery. The surgeon orders a lateral X-ray of the head and neck to take specific bony and soft tissue measurements.

Vitals: Normal.
Physical Examination: Micrognathia.
Laboratory Results: Lateral Cephalogram shows SNA angle 78 (normal 82), SNB angle 74 (normal 80), and Posterior Airway Space (PAS) is 6 mm (normal >11mm).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male with severe OSA is undergoing evaluation for maxillomandibular advancement surgery. The surgeon orders a lateral X-ray of the head and neck to take specific bony and soft tissue measurements.

Vitals: Normal.
Physical Examination: Micrognathia.
Laboratory Results: Lateral Cephalogram shows SNA angle 78 (normal 82), SNB angle 74 (normal 80), and Posterior Airway Space (PAS) is 6 mm (normal >11mm).', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a reduced Posterior Airway Space (PAS) on a lateral cephalogram indicate?', '["Nasal obstruction","A narrow airway between the base of the tongue and the posterior pharyngeal wall, heavily predisposing to OSA","Large tonsils","None"]', 2, 'PAS is a classic 2D measurement of retroglossal airway size.'),
    (v_case_id, 'What do the SNA and SNB angles measure?', '["Tongue size","The anterior-posterior position of the maxilla (SNA) and mandible (SNB) relative to the skull base","Neck thickness","None"]', 2, 'Low angles confirm skeletal retrognathia (the jaws are set too far back), mechanically crowding the airway.'),
    (v_case_id, 'How does the position of the Hyoid bone relate to OSA severity?', '["It doesn''t","A lower, more inferiorly positioned hyoid bone correlates with a longer, more collapsible airway and more severe OSA","A high hyoid is bad","None"]', 2, 'The hyoid anchors the tongue musculature; if it sits low, the tongue base easily falls backward.');

    ---------------------------------------------------------------------------
    -- CASE 23: Positional Obstructive Sleep Apnea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Back Sleeper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Back Sleeper', 'A 45-year-old male undergoes a sleep study. The results show an overall AHI of 12. However, looking closely at the data, his AHI is 35 when he sleeps on his back (supine), and his AHI drops to 2 when he sleeps on his side (lateral decubitus).

Vitals: BMI 26.
Physical Examination: Normal.
Laboratory Results: Supine AHI = 35. Non-supine AHI = 2.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male undergoes a sleep study. The results show an overall AHI of 12. However, looking closely at the data, his AHI is 35 when he sleeps on his back (supine), and his AHI drops to 2 when he sleeps on his side (lateral decubitus).

Vitals: BMI 26.
Physical Examination: Normal.
Laboratory Results: Supine AHI = 35. Non-supine AHI = 2.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines Positional OSA?', '["OSA that only happens standing","An AHI that is at least twice as high in the supine position compared to the non-supine position (and often normalizes when non-supine)","OSA in children","None"]', 2, 'Gravity pulls the tongue base and soft palate straight back against the pharyngeal wall when supine.'),
    (v_case_id, 'What is the simplest, highly effective treatment for this specific patient?', '["Tracheostomy","Positional therapy (e.g., wearing a bumper belt or sewing a tennis ball into the back of a pajama shirt to prevent supine sleep)","CPAP only","None"]', 2, 'If the OSA is strictly positional, keeping them off their back is curative and avoids CPAP or surgery.'),
    (v_case_id, 'Why is the tongue base the primary culprit in positional OSA?', '["It grows at night","The genioglossus muscle relaxes, and gravity pulls the heavy tongue base posteriorly, crushing the airway","It paralyzes","None"]', 2, 'Turning to the side displaces the tongue laterally, opening the airway.');

    ---------------------------------------------------------------------------
    -- CASE 24: REM-Related Obstructive Sleep Apnea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The REM Drops' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The REM Drops', 'A 50-year-old female has a sleep study. Her overall AHI is 14. During NREM sleep, her AHI is 5. However, during periods of REM (Rapid Eye Movement) sleep, her AHI spikes to 45, with severe oxygen desaturations.

Vitals: BMI 28.
Physical Examination: Normal.
Laboratory Results: NREM AHI = 5. REM AHI = 45.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female has a sleep study. Her overall AHI is 14. During NREM sleep, her AHI is 5. However, during periods of REM (Rapid Eye Movement) sleep, her AHI spikes to 45, with severe oxygen desaturations.

Vitals: BMI 28.
Physical Examination: Normal.
Laboratory Results: NREM AHI = 5. REM AHI = 45.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does Obstructive Sleep Apnea characteristically worsen during REM sleep?', '["The brain turns off","REM sleep is characterized by profound skeletal muscle atonia (paralysis), including the pharyngeal dilator muscles, maximizing airway collapsibility","Dreams cause panic","None"]', 2, 'The diaphragm still works, but the airway muscles lose almost all their tone.'),
    (v_case_id, 'Which demographic is most classically associated with isolated REM-related OSA?', '["Elderly men","Women, particularly pre-menopausal women or younger adults","Toddlers","None"]', 2, 'Women often present with milder overall AHI but severe clustered events during REM sleep.'),
    (v_case_id, 'Are the oxygen desaturations typically worse in NREM or REM sleep apneic events?', '["NREM","REM sleep events typically have longer durations and more severe oxygen desaturations","They are the same","None"]', 2, 'Due to muscle atonia, the patient struggles longer to arouse and break the obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 25: Nasal Obstruction in OSA (Septoplasty/Turbinate Reduction)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blocked Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blocked Nose', 'A 40-year-old male with moderate OSA is prescribed CPAP. He returns a week later saying he takes the mask off after 10 minutes because he feels like he is suffocating. He has a history of a broken nose and chronic nasal congestion. He breathes exclusively through his mouth.

Vitals: Normal.
Physical Examination: Severe leftward septal deviation blocking 90% of the left nasal airway. Bilateral inferior turbinate hypertrophy.
Laboratory Results: None.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old male with moderate OSA is prescribed CPAP. He returns a week later saying he takes the mask off after 10 minutes because he feels like he is suffocating. He has a history of a broken nose and chronic nasal congestion. He breathes exclusively through his mouth.

Vitals: Normal.
Physical Examination: Severe leftward septal deviation blocking 90% of the left nasal airway. Bilateral inferior turbinate hypertrophy.
Laboratory Results: None.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does fixing a deviated septum (Septoplasty) cure Obstructive Sleep Apnea?', '["Yes, completely","No, isolated nasal surgery rarely cures OSA (it minimally reduces the AHI), as the primary collapse is usually in the palate or tongue base","Yes, in 90% of cases","None"]', 2, 'Nasal resistance plays a role, but it is almost never the sole cause of OSA.'),
    (v_case_id, 'If it doesn''t cure OSA, why is nasal surgery frequently performed in OSA patients?', '["Cosmetics","To drastically improve CPAP tolerance and compliance by allowing the use of a nasal mask and lowering the required CPAP pressure","To stop bleeding","None"]', 2, 'If a patient can''t breathe through their nose, they can''t tolerate nasal CPAP, which is much more comfortable than a full face mask.'),
    (v_case_id, 'According to the Starling resistor model of the airway, how does nasal obstruction worsen downstream palatal collapse?', '["It doesn''t","High upstream resistance in the nose requires greater negative inspiratory pressure generated by the chest, which sucks the floppy downstream pharynx closed","It makes it too dry","None"]', 2, 'Breathing through a pinched straw causes the straw to collapse.');

    ---------------------------------------------------------------------------
    -- CASE 26: Hypopnea Definition
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Subtle Apnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Subtle Apnea', 'A 55-year-old male complains of severe daytime fatigue. A sleep study shows only 3 true ''apneas'' per hour, but he has 20 events per hour where his airflow drops by 40%, accompanied by a 4% drop in oxygen saturation and a brief EEG arousal.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI = 23.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male complains of severe daytime fatigue. A sleep study shows only 3 true ''apneas'' per hour, but he has 20 events per hour where his airflow drops by 40%, accompanied by a 4% drop in oxygen saturation and a brief EEG arousal.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI = 23.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the AASM (American Academy of Sleep Medicine) define a Hypopnea?', '["Complete stop of breathing","A reduction in airflow of at least 30% lasting ≥10 seconds, associated with either a ≥3% oxygen desaturation OR an EEG arousal","A sneeze","None"]', 1, 'Hypopneas are partial obstructions, but they disrupt sleep architecture and cause hypoxia just as effectively as full apneas.'),
    (v_case_id, 'Why are both apneas and hypopneas included in the AHI calculation?', '["To make the score higher","Both cause sleep fragmentation (arousals) and sympathetic surges, leading to the exact same cardiovascular and neurocognitive consequences","They aren''t","None"]', 1, 'A patient with 30 hypopneas per hour is just as sick as a patient with 30 complete apneas per hour.'),
    (v_case_id, 'What is an EEG ''arousal'' in the context of a sleep study?', '["Waking up and walking around","An abrupt shift in EEG frequency lasting at least 3 seconds, representing a brief awakening that the patient does not remember, but which shatters sleep architecture","A nightmare","None"]', 1, 'These micro-arousals are what prevent the patient from getting deep, restorative N3 and REM sleep.');

    ---------------------------------------------------------------------------
    -- CASE 27: Upper Airway Resistance Syndrome (UARS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Exhausted Snorer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Exhausted Snorer', 'A 35-year-old thin female presents with profound daytime fatigue and headaches. Her husband says she snores lightly but never stops breathing. Her sleep study shows an AHI of 3 (normal). However, she has 30 events per hour where her respiratory effort increases steadily until she has a brief EEG arousal, but without any oxygen desaturation or 30% drop in airflow.

Vitals: Normal.
Physical Examination: Narrow palate.
Laboratory Results: AHI = 3. RDI = 33.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old thin female presents with profound daytime fatigue and headaches. Her husband says she snores lightly but never stops breathing. Her sleep study shows an AHI of 3 (normal). However, she has 30 events per hour where her respiratory effort increases steadily until she has a brief EEG arousal, but without any oxygen desaturation or 30% drop in airflow.

Vitals: Normal.
Physical Examination: Narrow palate.
Laboratory Results: AHI = 3. RDI = 33.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines a Respiratory Effort-Related Arousal (RERA)?', '["An apnea","A sequence of breaths characterized by increasing respiratory effort leading to an arousal, but which does NOT meet criteria for an apnea or hypopnea","A yawn","None"]', 1, 'The airway gets tight, the patient struggles harder and harder to pull air through it, and eventually wakes up just enough to open it, without ever dropping their oxygen.'),
    (v_case_id, 'How does Upper Airway Resistance Syndrome (UARS) differ classically from OSA?', '["It affects only men","UARS patients are often young, thin females who suffer severe sleep fragmentation from RERAs, but lack the hypoxia and obesity typical of OSA","It causes death instantly","None"]', 1, 'UARS is essentially a subtype of sleep-disordered breathing where the primary insult is sleep fragmentation, not hypoxia.'),
    (v_case_id, 'If the AHI only counts Apneas + Hypopneas, what index includes Apneas + Hypopneas + RERAs?', '["BMI","Respiratory Disturbance Index (RDI)","Heart rate","None"]', 1, 'In UARS, the AHI is normal (<5), but the RDI is elevated.');

    ---------------------------------------------------------------------------
    -- CASE 28: Pierre Robin Sequence and OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Syndromic Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Syndromic Infant', 'A 3-week-old infant is admitted to the NICU with severe failure to thrive, choking during feeds, and severe inspiratory stridor that worsens when he is laid on his back.

Vitals: O2 sat 88% on room air.
Physical Examination: Severe micrognathia (very small jaw), glossoptosis (tongue falling back), and a U-shaped cleft palate.
Laboratory Results: Sleep study shows severe OSA.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-week-old infant is admitted to the NICU with severe failure to thrive, choking during feeds, and severe inspiratory stridor that worsens when he is laid on his back.

Vitals: O2 sat 88% on room air.
Physical Examination: Severe micrognathia (very small jaw), glossoptosis (tongue falling back), and a U-shaped cleft palate.
Laboratory Results: Sleep study shows severe OSA.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of Pierre Robin Sequence?', '["Deafness, blindness, mutism","Micrognathia, Glossoptosis, and Cleft Palate (usually U-shaped)","Large jaw, big tongue, no teeth","None"]', 1, 'The tiny jaw forces the normal-sized tongue backward, blocking the airway and preventing the palate shelves from fusing during development.'),
    (v_case_id, 'Why do these infants have severe Obstructive Sleep Apnea?', '["They have big tonsils","The glossoptosis (posteriorly displaced tongue) physically impacts the posterior pharyngeal wall, completely occluding the airway, especially when supine","They have asthma","None"]', 1, 'The primary obstruction is at the tongue base due to the small skeletal box.'),
    (v_case_id, 'What is a common initial, non-surgical intervention to relieve the airway obstruction in a Pierre Robin infant?', '["Tracheostomy immediately","Prone positioning (laying the baby on their stomach), allowing gravity to pull the tongue forward out of the airway","Steroids","None"]', 1, 'If prone positioning fails, surgical options like mandibular distraction osteogenesis or tongue-lip adhesion are considered.');

    ---------------------------------------------------------------------------
    -- CASE 29: Laryngomalacia causing OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Floppy Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Floppy Airway', 'A 4-month-old infant presents with high-pitched inspiratory stridor that has been present since 2 weeks of age. A sleep study is performed because the parents note he snores and occasionally pauses breathing. The sleep study shows mild OSA.

Vitals: Normal.
Physical Examination: Flexible laryngoscopy while awake shows an omega-shaped epiglottis and short aryepiglottic folds that collapse inward during inspiration.
Laboratory Results: None.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-month-old infant presents with high-pitched inspiratory stridor that has been present since 2 weeks of age. A sleep study is performed because the parents note he snores and occasionally pauses breathing. The sleep study shows mild OSA.

Vitals: Normal.
Physical Examination: Flexible laryngoscopy while awake shows an omega-shaped epiglottis and short aryepiglottic folds that collapse inward during inspiration.
Laboratory Results: None.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'While laryngomalacia is primarily a supraglottic issue, can it cause Obstructive Sleep Apnea?', '["No, it only causes noise","Yes, the supraglottic collapse can obstruct airflow sufficiently during sleep to cause apneas, hypopneas, and sleep fragmentation","Only in adults","None"]', 1, 'Severe laryngomalacia is a recognized cause of pediatric OSA.'),
    (v_case_id, 'If an infant with laryngomalacia has severe OSA, failure to thrive, or right heart strain, what is the surgical treatment of choice?', '["Tonsillectomy","Supraglottoplasty (trimming the floppy aryepiglottic folds and epiglottis to widen the supraglottic airway)","Tracheostomy","None"]', 1, 'Supraglottoplasty relieves the mechanical obstruction and cures the associated OSA in these specific cases.'),
    (v_case_id, 'How does the presentation of laryngomalacia differ from typical adenotonsillar OSA?', '["It doesn''t","Laryngomalacia presents in early infancy (weeks old) with inspiratory stridor, whereas adenotonsillar OSA typically peaks between ages 3-6 years","Laryngomalacia is silent","None"]', 1, 'The timing of onset is a key clinical clue.');

    ---------------------------------------------------------------------------
    -- CASE 30: Treacher Collins Syndrome and OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Craniofacial Defect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Craniofacial Defect', 'A 5-year-old boy presents for sleep apnea evaluation. He has downward-slanting eyes, underdeveloped cheekbones, micrognathia, and malformed ears with hearing loss.

Vitals: Normal.
Physical Examination: Mandibular hypoplasia, malar hypoplasia.
Laboratory Results: Sleep study confirms severe OSA.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 5-year-old boy presents for sleep apnea evaluation. He has downward-slanting eyes, underdeveloped cheekbones, micrognathia, and malformed ears with hearing loss.

Vitals: Normal.
Physical Examination: Mandibular hypoplasia, malar hypoplasia.
Laboratory Results: Sleep study confirms severe OSA.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What genetic condition is described by this classic phenotype (mandibular/malar hypoplasia, down-slanting palpebral fissures, microtia)?', '["Down Syndrome","Treacher Collins Syndrome (Mandibulofacial Dysostosis)","Crouzon Syndrome","None"]', 1, 'It is an autosomal dominant defect in the 1st and 2nd branchial arches.'),
    (v_case_id, 'Why is OSA universally present and notoriously difficult to treat in Treacher Collins syndrome?', '["They have huge tonsils","The severe skeletal hypoplasia of both the midface and mandible severely crowds the pharyngeal airway, often requiring tracheostomy or major skeletal distraction","They are obese","None"]', 1, 'Soft tissue surgery (like T&A) is almost never sufficient because the bony box enclosing the airway is too small.'),
    (v_case_id, 'Unlike Treacher Collins, which craniofacial syndromes are characterized primarily by craniosynostosis and severe midface (maxillary) hypoplasia causing OSA?', '["Marfan Syndrome","Crouzon Syndrome and Apert Syndrome","Turner Syndrome","None"]', 1, 'In these syndromes, the maxilla is pushed back, obstructing the nasopharynx.');

    ---------------------------------------------------------------------------
    -- CASE 31: Mucopolysaccharidoses (MPS) and OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Joint', 'A 10-year-old boy with a known history of Hurler syndrome (a mucopolysaccharidosis) presents with severe snoring, daytime sleepiness, and witnessed apneas.

Vitals: Normal.
Physical Examination: Coarse facial features, macroglossia, short neck. Limited neck extension.
Laboratory Results: Sleep study confirms severe OSA.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old boy with a known history of Hurler syndrome (a mucopolysaccharidosis) presents with severe snoring, daytime sleepiness, and witnessed apneas.

Vitals: Normal.
Physical Examination: Coarse facial features, macroglossia, short neck. Limited neck extension.
Laboratory Results: Sleep study confirms severe OSA.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of Obstructive Sleep Apnea in Mucopolysaccharidoses (e.g., Hurler, Hunter syndromes)?', '["Obesity","Progressive deposition of glycosaminoglycans (GAGs) in the soft tissues of the airway (tongue, tonsils, pharynx) and altered craniofacial skeletal growth","Asthma","None"]', 1, 'The tissues literally become thickened and infiltrated with metabolic byproducts.'),
    (v_case_id, 'Why is surgical management of the airway or anesthesia exceptionally dangerous in patients with MPS?', '["They bleed easily","GAG deposition causes a rigid, immobile airway and often atlantoaxial (cervical spine) instability, making intubation extremely difficult and risky","They are allergic to anesthesia","None"]', 1, 'They are notoriously the most difficult airways in pediatric anesthesia.'),
    (v_case_id, 'Does enzyme replacement therapy (ERT) reliably cure the OSA in MPS patients?', '["Yes, immediately","No, while ERT helps systemic symptoms, it often does not fully reverse established airway tissue deposition or skeletal abnormalities","Yes, in 100% of cases","None"]', 1, 'These patients often require CPAP or tracheostomy despite medical treatment.');

    ---------------------------------------------------------------------------
    -- CASE 32: Hypothyroidism causing OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cold and Tired Woman' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cold and Tired Woman', 'A 45-year-old female presents with fatigue, weight gain, constipation, cold intolerance, and heavy snoring that started a year ago. She has no prior history of snoring.

Vitals: HR 55. BMI 31.
Physical Examination: Enlarged thyroid gland (goiter). Delayed relaxation phase of deep tendon reflexes. Macroglossia is noted.
Laboratory Results: TSH is 45 mIU/L (High), Free T4 is 0.4 ng/dL (Low).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female presents with fatigue, weight gain, constipation, cold intolerance, and heavy snoring that started a year ago. She has no prior history of snoring.

Vitals: HR 55. BMI 31.
Physical Examination: Enlarged thyroid gland (goiter). Delayed relaxation phase of deep tendon reflexes. Macroglossia is noted.
Laboratory Results: TSH is 45 mIU/L (High), Free T4 is 0.4 ng/dL (Low).', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does severe, untreated hypothyroidism contribute to the development of Obstructive Sleep Apnea?', '["It shrinks the airway","It causes macroglossia (enlarged tongue due to myxedema/mucopolysaccharide deposition), weight gain, and generalized myopathy of the pharyngeal dilator muscles","It causes nasal polyps","None"]', 1, 'The tongue gets bigger, the patient gets heavier, and the airway muscles get weaker.'),
    (v_case_id, 'What is the initial, most appropriate treatment for this patient''s OSA?', '["UPPP","Levothyroxine (thyroid hormone replacement), which may completely reverse the OSA as the myxedema and weight resolve","Tracheostomy","None"]', 1, 'Treat the underlying endocrine cause first before considering sleep surgery.'),
    (v_case_id, 'Can hypothyroidism also cause Central Sleep Apnea?', '["No","Yes, severe hypothyroidism blunts the central hypoxic and hypercapnic respiratory drive, potentially causing central apneas or hypoventilation","Only in men","None"]', 1, 'It is one of the few conditions that can cause a mixed apnea picture via both mechanical and central mechanisms.');

    ---------------------------------------------------------------------------
    -- CASE 33: Acromegaly and OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Growing Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Growing Face', 'A 50-year-old male presents with severe snoring and witnessed apneas. He mentions his shoe size has increased recently, and his wedding ring no longer fits. He has prominent frontal bossing and a massive jaw.

Vitals: BP 150/90.
Physical Examination: Prognathism (protruding jaw), macroglossia, spaced teeth, and enlarged, spade-like hands.
Laboratory Results: IGF-1 level is markedly elevated.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male presents with severe snoring and witnessed apneas. He mentions his shoe size has increased recently, and his wedding ring no longer fits. He has prominent frontal bossing and a massive jaw.

Vitals: BP 150/90.
Physical Examination: Prognathism (protruding jaw), macroglossia, spaced teeth, and enlarged, spade-like hands.
Laboratory Results: IGF-1 level is markedly elevated.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathophysiology of OSA in patients with Acromegaly?', '["Weight loss","Excess growth hormone causes massive soft tissue hypertrophy of the tongue (macroglossia), pharyngeal walls, and larynx, crowding the airway","Shrinking jaw","None"]', 1, 'Despite having a large, protruding jaw (which usually opens the airway), the sheer bulk of the soft tissue overpowers it.'),
    (v_case_id, 'What bony change in the face is characteristic of acromegaly?', '["Micrognathia","Mandibular prognathism (protruding lower jaw) and widened dental spaces","Cleft palate","None"]', 1, 'The mandible continues to grow under the influence of excess GH/IGF-1.'),
    (v_case_id, 'Will CPAP cure the underlying problem?', '["Yes","No, CPAP manages the OSA, but definitive treatment requires transsphenoidal surgical resection of the pituitary adenoma secreting Growth Hormone","Yes, it shrinks the tumor","None"]', 1, 'OSA is a symptom of the systemic endocrine disease.');

    ---------------------------------------------------------------------------
    -- CASE 34: Lingual Tonsil Hypertrophy / Base of Tongue Collapse
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Big Tongue Base' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Big Tongue Base', 'A 40-year-old male with severe OSA had a UPPP 2 years ago. His snoring improved, but his sleep study still shows an AHI of 35. DISE reveals massive collapse purely at the base of the tongue. The palate is open.

Vitals: BMI 28.
Physical Examination: Palate is surgically absent. Oral exam shows a huge tongue base taking up the entire oropharynx.
Laboratory Results: None.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old male with severe OSA had a UPPP 2 years ago. His snoring improved, but his sleep study still shows an AHI of 35. DISE reveals massive collapse purely at the base of the tongue. The palate is open.

Vitals: BMI 28.
Physical Examination: Palate is surgically absent. Oral exam shows a huge tongue base taking up the entire oropharynx.
Laboratory Results: None.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why did the UPPP fail to cure his Obstructive Sleep Apnea?', '["The surgeon did it wrong","UPPP only clears the retropalatal airway; it does nothing to address obstruction caused by a large tongue base or lingual tonsils falling backward (retroglossal collapse)","He ate too much","None"]', 1, 'This is the most common reason for UPPP failure.'),
    (v_case_id, 'What specific lymphoid tissue resides at the base of the tongue and can hypertrophy to cause OSA?', '["Palatine tonsils","Lingual tonsils","Adenoids","None"]', 1, 'Hypertrophy of the lingual tonsils is a major, often overlooked, cause of lower pharyngeal obstruction.'),
    (v_case_id, 'What surgical procedure specifically targets this area of collapse?', '["Septoplasty","Transoral Robotic Surgery (TORS) for base of tongue reduction / lingual tonsillectomy, or Genioglossus advancement","Myringotomy","None"]', 1, 'Robotic surgery allows precise removal of the bulky lingual tonsil tissue from the tongue base.');

    ---------------------------------------------------------------------------
    -- CASE 35: Genioglossus Advancement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Genial Tubercle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Genial Tubercle', 'A 35-year-old male with tongue base collapse on DISE is undergoing surgery to pull the tongue forward without doing a major jaw movement (MMA).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: None.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male with tongue base collapse on DISE is undergoing surgery to pull the tongue forward without doing a major jaw movement (MMA).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: None.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomic goal of a Genioglossus Advancement procedure?', '["To remove the tongue","To surgically pull the genial tubercle (a bony prominence on the inside of the anterior mandible where the genioglossus muscle attaches) forward, thereby pulling the tongue base forward and opening the airway","To pull the palate up","None"]', 1, 'It places tension on the tongue muscle, preventing it from falling back during sleep.'),
    (v_case_id, 'Does this procedure change the patient''s dental bite (occlusion)?', '["Yes, completely","No, it involves a ''window'' osteotomy in the anterior mandible below the tooth roots, pulling the bone fragment and muscle forward without moving the teeth or jaw joint","Yes, they lose all teeth","None"]', 1, 'This makes it much less morbid than a full Maxillomandibular Advancement (MMA).'),
    (v_case_id, 'This procedure is often combined with what other suspension technique to stabilize the airway?', '["Palate suspension","Hyoid suspension (tying the hyoid bone forward to the thyroid cartilage or mandible to expand the hypopharynx)","Ear suspension","None"]', 1, 'The GA and Hyoid suspension are often performed together as ''Phase 1'' tongue base surgery.');

    ---------------------------------------------------------------------------
    -- CASE 36: Sleep Architecture in OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Broken Architecture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Broken Architecture', 'A 45-year-old male complains that even if he sleeps 10 hours, he wakes up feeling like he hasn''t slept at all. His sleep study shows an AHI of 50. The hypnogram (graph of sleep stages) shows he spent 90% of the night in N1 and N2 sleep, and only 2% in REM and 0% in N3.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI 50. Minimal REM, absent N3 sleep.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male complains that even if he sleeps 10 hours, he wakes up feeling like he hasn''t slept at all. His sleep study shows an AHI of 50. The hypnogram (graph of sleep stages) shows he spent 90% of the night in N1 and N2 sleep, and only 2% in REM and 0% in N3.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: AHI 50. Minimal REM, absent N3 sleep.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are N3 and REM sleep?', '["Awake states","N3 is deep, restorative ''slow-wave'' sleep; REM is dream sleep critical for cognitive/memory consolidation","Coma states","None"]', 1, 'A normal adult spends ~20% in N3 and ~20-25% in REM.'),
    (v_case_id, 'Why is N3 and REM sleep severely decreased or absent in severe OSA?', '["The brain doesn''t want it","Every time the patient enters deeper sleep, the airway collapses, causing an apneic event and an immediate EEG arousal, bumping them back into light (N1/N2) sleep to breathe","They drink too much coffee","None"]', 1, 'They are trapped in a cycle of choking and waking, never reaching deep sleep.'),
    (v_case_id, 'What phenomenon frequently occurs on the first night a severe OSA patient successfully uses CPAP?', '["They die","REM Rebound (a massive, compensatory increase in REM and N3 sleep percentage) as the brain finally gets a chance to enter deep sleep without interruption","They never sleep again","None"]', 1, 'Patients often report having intense dreams on their first night of CPAP due to REM rebound.');

    ---------------------------------------------------------------------------
    -- CASE 37: Nocturnal Arrhythmias in OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dropping Pulse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dropping Pulse', 'A 55-year-old male with severe OSA is on a telemetry monitor in the hospital. The nurses frequently call the doctor because his heart rate drops to 30 bpm for 15 seconds at a time during the night. A 12-lead ECG during the day is perfectly normal.

Vitals: HR 70 while awake.
Physical Examination: Normal.
Laboratory Results: Telemetry shows nocturnal sinus bradycardia and sinus pauses up to 5 seconds.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male with severe OSA is on a telemetry monitor in the hospital. The nurses frequently call the doctor because his heart rate drops to 30 bpm for 15 seconds at a time during the night. A 12-lead ECG during the day is perfectly normal.

Vitals: HR 70 while awake.
Physical Examination: Normal.
Laboratory Results: Telemetry shows nocturnal sinus bradycardia and sinus pauses up to 5 seconds.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does severe Obstructive Sleep Apnea cause profound bradycardia or sinus pauses during sleep?', '["Heart attack","The massive negative intrathoracic pressure generated by struggling against a closed airway (Muller maneuver) causes extreme vagal nerve stimulation, slowing the heart","Medications","None"]', 1, 'This intense vagal tone during the apnea is followed by a massive sympathetic surge (tachycardia) upon arousal, creating a classic ''brady-tachy'' cyclic pattern.'),
    (v_case_id, 'Should this patient receive a permanent pacemaker for these nocturnal pauses?', '["Yes, immediately","No, the primary treatment is CPAP to resolve the airway obstruction; the bradycardia almost always resolves completely once the apneas stop","Yes, and a defibrillator","None"]', 1, 'Treat the cause (the apnea), not the symptom (the vagal response).'),
    (v_case_id, 'Untreated OSA drastically increases the risk of developing which chronic atrial arrhythmia?', '["Ventricular tachycardia","Atrial Fibrillation (AFib)","Heart block","None"]', 1, 'The structural changes to the heart (atrial stretch from negative pressure) and sympathetic surges heavily promote AFib.');

    ---------------------------------------------------------------------------
    -- CASE 38: Polycythemia secondary to OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thick Blood' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thick Blood', 'A 50-year-old obese male presents to his primary care doctor. Routine labs show his Hemoglobin is remarkably high at 19.5 g/dL, and his Hematocrit is 58%. He does not live at high altitude and does not use testosterone.

Vitals: BP 145/90. BMI 35.
Physical Examination: Plethoric (red) face.
Laboratory Results: Hgb 19.5, Hct 58%. Erythropoietin (EPO) level is elevated.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old obese male presents to his primary care doctor. Routine labs show his Hemoglobin is remarkably high at 19.5 g/dL, and his Hematocrit is 58%. He does not live at high altitude and does not use testosterone.

Vitals: BP 145/90. BMI 35.
Physical Examination: Plethoric (red) face.
Laboratory Results: Hgb 19.5, Hct 58%. Erythropoietin (EPO) level is elevated.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physiological link between Obstructive Sleep Apnea and Secondary Polycythemia?', '["Bone marrow cancer","Chronic, repetitive nocturnal hypoxemia stimulates the kidneys to produce excessive Erythropoietin (EPO), driving the bone marrow to overproduce red blood cells","Dehydration","None"]', 1, 'The body senses the low oxygen at night and tries to compensate by making more oxygen-carrying RBCs.'),
    (v_case_id, 'Why is a severely elevated Hematocrit (>55%) dangerous?', '["It causes bleeding","It drastically increases blood viscosity (hyperviscosity), slowing blood flow and increasing the risk of thrombosis (strokes, heart attacks)","It causes anemia","None"]', 1, 'Thick blood doesn''t flow well through small vessels.'),
    (v_case_id, 'Will CPAP therapy improve the polycythemia?', '["No","Yes, resolving the nocturnal hypoxia removes the stimulus for EPO production, and the hematocrit will gradually normalize","Only if combined with phlebotomy","None"]', 1, 'Secondary polycythemia from OSA is entirely reversible with adequate CPAP compliance.');

    ---------------------------------------------------------------------------
    -- CASE 39: Perioperative Risk in OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Op Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Op Crash', 'A 60-year-old male with known severe OSA (who rarely uses his CPAP) undergoes an open cholecystectomy under general anesthesia. In the recovery room (PACU), he is given IV Dilaudid (hydromorphone) for pain. Thirty minutes later, the nurse finds him unresponsive, blue, and not breathing.

Vitals: SpO2 70%, HR 40.
Physical Examination: Unresponsive, severe airway obstruction.
Laboratory Results: None.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with known severe OSA (who rarely uses his CPAP) undergoes an open cholecystectomy under general anesthesia. In the recovery room (PACU), he is given IV Dilaudid (hydromorphone) for pain. Thirty minutes later, the nurse finds him unresponsive, blue, and not breathing.

Vitals: SpO2 70%, HR 40.
Physical Examination: Unresponsive, severe airway obstruction.
Laboratory Results: None.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are patients with OSA at extreme risk for sudden respiratory arrest in the immediate post-operative period?', '["They are allergic to anesthesia","The combination of residual anesthetic muscle relaxation, supine positioning, and opioid analgesics profoundly depresses respiratory drive and exacerbates airway collapse","They have bad hearts","None"]', 1, 'Opioids specifically blunt the brain''s response to hypoxia and hypercapnia, meaning the patient won''t wake up when they stop breathing.'),
    (v_case_id, 'What is a mandatory protocol for a known severe OSA patient in the recovery room?', '["Discharge them immediately","Continuous pulse oximetry monitoring, elevation of the head of the bed, and immediate application of their CPAP/BiPAP machine while recovering","Give them more opioids","None"]', 1, 'They should never be left flat on their back without airway support after receiving narcotics.'),
    (v_case_id, 'When planning pain management for an OSA patient, what strategy should be maximized?', '["Maximum IV narcotics","Multimodal, opioid-sparing analgesia (e.g., NSAIDs, acetaminophen, regional nerve blocks) to minimize respiratory depression","No pain control","None"]', 1, 'The less narcotic used, the safer the airway.');

    ---------------------------------------------------------------------------
    -- CASE 40: Tonsil Grading Scale
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tonsil Scale' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tonsil Scale', 'A 15-year-old boy is in the clinic for recurrent tonsillitis and snoring. The ENT documents ''Grade 4+ tonsils'' in the chart.

Vitals: Normal.
Physical Examination: Upon opening the mouth, the palatine tonsils are so massive that they are touching each other in the exact midline.
Laboratory Results: None.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old boy is in the clinic for recurrent tonsillitis and snoring. The ENT documents ''Grade 4+ tonsils'' in the chart.

Vitals: Normal.
Physical Examination: Upon opening the mouth, the palatine tonsils are so massive that they are touching each other in the exact midline.
Laboratory Results: None.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What defines Grade 1+ tonsils?', '["Touching the midline","Tonsils are visible but hidden entirely behind the anterior tonsillar pillars (occupying <25% of the oropharyngeal width)","Touching the uvula","None"]', 1, 'Grade 1 is essentially normal, small tonsils.'),
    (v_case_id, 'What defines Grade 3+ tonsils?', '["Touching the midline","Tonsils extend beyond the pillars and occupy 50-75% of the oropharyngeal width, approaching the uvula","Hidden behind pillars","None"]', 1, 'Grade 3 and 4 are highly correlated with pediatric OSA.'),
    (v_case_id, 'What defines Grade 4+ tonsils?', '["Missing","Tonsils are ''kissing'' or touching each other in the midline, occupying >75% of the airway","Pus covered","None"]', 1, 'This represents near-total mechanical obstruction of the oropharynx.');

    ---------------------------------------------------------------------------
    -- CASE 41: Floppy Eyelid Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Eyes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Eyes', 'A 55-year-old obese male presents to the ophthalmologist with chronic, severe, bilateral eye irritation, redness, and a mucous discharge every morning. The eye doctor notices that his upper eyelids are incredibly rubbery, lax, and easily flip inside-out (evert) when he pulls them slightly upward.

Vitals: BMI 38.
Physical Examination: Hyperlaxity of the upper eyelids. Papillary conjunctivitis.
Laboratory Results: None.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old obese male presents to the ophthalmologist with chronic, severe, bilateral eye irritation, redness, and a mucous discharge every morning. The eye doctor notices that his upper eyelids are incredibly rubbery, lax, and easily flip inside-out (evert) when he pulls them slightly upward.

Vitals: BMI 38.
Physical Examination: Hyperlaxity of the upper eyelids. Papillary conjunctivitis.
Laboratory Results: None.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Floppy Eyelid Syndrome is highly, specifically associated with what underlying systemic condition?', '["Diabetes","Severe Obstructive Sleep Apnea","Glaucoma","None"]', 1, 'Almost 100% of patients with Floppy Eyelid Syndrome have OSA. It is a massive red flag.'),
    (v_case_id, 'What is the proposed mechanical cause of the chronic eye irritation in these patients?', '["Allergies","Because the lids are floppy, they easily evert (flip inside out) when the patient rubs their face on the pillow during sleep, exposing the conjunctiva to mechanical abrasion and drying","Infection","None"]', 1, 'The loss of tarsal elastin makes the lids incredibly loose.'),
    (v_case_id, 'What is the most definitive treatment to stop the progression of the eye disease?', '["Eye drops only","Treating the underlying Obstructive Sleep Apnea with CPAP (and sleeping with eye shields)","Blindness","None"]', 1, 'While surgical tightening of the lids can be done, treating the OSA prevents further elastin degradation.');

    ---------------------------------------------------------------------------
    -- CASE 42: GERD and OSA Relationship
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Acid Reflux' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Acid Reflux', 'A 45-year-old male with severe OSA complains of terrible heartburn, a sour taste in his mouth every morning, and chronic throat clearing. He is already taking a PPI, but it doesn''t help at night.

Vitals: BMI 34.
Physical Examination: Erythema of the posterior larynx.
Laboratory Results: None.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male with severe OSA complains of terrible heartburn, a sour taste in his mouth every morning, and chronic throat clearing. He is already taking a PPI, but it doesn''t help at night.

Vitals: BMI 34.
Physical Examination: Erythema of the posterior larynx.
Laboratory Results: None.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What mechanical force during an OSA event actively worsens Gastroesophageal Reflux Disease (GERD)?', '["Snoring vibrations","The massive negative intrathoracic pressure generated by struggling against a closed airway literally acts like a vacuum, sucking gastric acid up into the esophagus and pharynx","Positive pressure","None"]', 1, 'This is why severe OSA patients often have terrible, refractory nighttime reflux.'),
    (v_case_id, 'If the patient starts using CPAP effectively, what often happens to his GERD symptoms?', '["They get worse","They frequently completely resolve, as the CPAP eliminates the negative pressure ''vacuum'' effect and physically pushes down on the esophageal sphincter","No change","None"]', 1, 'Treating the OSA often cures the nighttime GERD.'),
    (v_case_id, 'Conversely, how can severe GERD/LPR worsen OSA?', '["It doesn''t","Acid irritating the pharynx and larynx causes mucosal edema and swelling, further narrowing the upper airway","It causes weight gain","None"]', 1, 'It is a vicious cycle: OSA causes reflux, and reflux worsens OSA.');

    ---------------------------------------------------------------------------
    -- CASE 43: Weight Loss and OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bariatric Cure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bariatric Cure', 'A 40-year-old female with morbid obesity (BMI 48) and severe OSA (AHI 65) undergoes a Roux-en-Y gastric bypass. Over the next 18 months, she loses 120 lbs.

Vitals: BMI drops to 26.
Physical Examination: Massive weight loss.
Laboratory Results: Repeat sleep study shows AHI = 4.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old female with morbid obesity (BMI 48) and severe OSA (AHI 65) undergoes a Roux-en-Y gastric bypass. Over the next 18 months, she loses 120 lbs.

Vitals: BMI drops to 26.
Physical Examination: Massive weight loss.
Laboratory Results: Repeat sleep study shows AHI = 4.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the relationship between substantial weight loss and OSA severity?', '["No effect","Significant weight loss often dramatically reduces the AHI and can completely cure OSA by removing the parapharyngeal fat compressing the airway","It makes it worse","None"]', 1, 'Bariatric surgery is one of the most effective ''cures'' for severe OSA in the morbidly obese.'),
    (v_case_id, 'Why is an overnight sleep study (PSG) often mandatory BEFORE bariatric surgery?', '["To check for dreams","To diagnose and treat OSA with CPAP pre-operatively, drastically reducing the risk of fatal post-operative airway obstruction and respiratory failure","To make money","None"]', 1, 'Untreated OSA patients are at extremely high risk during the immediate recovery from abdominal surgery.'),
    (v_case_id, 'Is a 10% reduction in body weight clinically meaningful for OSA?', '["No","Yes, even a 10% weight loss can lead to a 20-30% reduction in the AHI","Only in men","None"]', 1, 'Fat in the neck is mobilized early during weight loss.');

    ---------------------------------------------------------------------------
    -- CASE 44: Alcohol and Sedatives Worsening OSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nightcap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nightcap', 'A 35-year-old male has mild, asymptomatic OSA (AHI 8). However, his wife notes that on Friday nights, when he drinks 4 or 5 beers before bed, his snoring becomes violently loud and he stops breathing frequently.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: None.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male has mild, asymptomatic OSA (AHI 8). However, his wife notes that on Friday nights, when he drinks 4 or 5 beers before bed, his snoring becomes violently loud and he stops breathing frequently.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: None.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does alcohol consumption prior to sleep mechanically worsen OSA?', '["It causes weight gain","Alcohol is a central nervous system depressant and a muscle relaxant; it directly decreases the tone of the pharyngeal dilator muscles, making the airway much more collapsible","It inflames the tonsils","None"]', 1, 'It essentially turns a mild, sturdy airway into a floppy, easily collapsible one.'),
    (v_case_id, 'How does alcohol affect the brain''s response to an apneic event?', '["It makes the brain wake up faster","It blunts the arousal response to hypoxia and hypercapnia, meaning the apneas last significantly longer before the patient wakes up to breathe","It prevents dreams","None"]', 1, 'The events are both more frequent and much more severe (longer duration, deeper oxygen desaturation).'),
    (v_case_id, 'What other common class of medications has the exact same detrimental effect on OSA?', '["Antibiotics","Benzodiazepines and other sedative-hypnotics","Statins","None"]', 1, 'Prescribing sleeping pills to a snorer can be dangerous, as it worsens the underlying obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 45: OSA High-Yield Review
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The OSA Summary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The OSA Summary', 'A 4th-year medical student is reviewing Obstructive Sleep Apnea for the board exam.

Vitals: Normal.
Physical Examination: Focused.
Laboratory Results: None.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4th-year medical student is reviewing Obstructive Sleep Apnea for the board exam.

Vitals: Normal.
Physical Examination: Focused.
Laboratory Results: None.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the absolute best, most definitive, non-surgical treatment for OSA?', '["Dental appliance","CPAP (Continuous Positive Airway Pressure)","Weight loss supplements","None"]', 1, 'CPAP is the gold standard and near 100% effective if tolerated.'),
    (v_case_id, 'What is the most effective surgical treatment for pediatric OSA?', '["UPPP","Adenotonsillectomy","MMA","None"]', 1, 'It cures 80-90% of healthy children with OSA.'),
    (v_case_id, 'What is the most effective (highest success rate) skeletal surgery for adult OSA?', '["Septoplasty","Maxillomandibular Advancement (MMA)","UPPP","None"]', 1, 'MMA fundamentally expands the entire pharyngeal airway.');

END $$;
COMMIT;
