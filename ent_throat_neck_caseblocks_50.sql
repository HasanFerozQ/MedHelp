-- ENT (Otolaryngology): Throat & Neck — Pharynx, Larynx, Salivary Glands, Neck Masses
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-throat
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-throat' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-throat';
    END IF;


    ---------------------------------------------------------------------------
    -- CASE 01: Acute Pharyngitis (GABHS vs Viral)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sore Throat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sore Throat', 'A 12-year-old male presents with a 2-day history of severe sore throat, fever, and painful swallowing. He does not have a cough or runny nose.

Vitals: Temp 102.5°F, HR 105 bpm.
Physical Examination: Beefy red oropharynx with tonsillar exudates. Tender anterior cervical lymphadenopathy. No rash.
Laboratory Results: Rapid Antigen Detection Test (RADT) is positive for Group A Streptococcus.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute GABHS Pharyngitis; Centor criteria positive, RADT confirmation.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which criteria are used to estimate the probability of GABHS pharyngitis?', '["Jones Criteria", "Centor Criteria", "Duke Criteria", "None"]', 1, 'Centor criteria include: Fever, Tonsillar exudates, Tender anterior cervical adenopathy, and Absence of cough.'),
    (v_case_id, 'What is the primary reason for treating GABHS pharyngitis with antibiotics?', '["To prevent viral spread", "To prevent Acute Rheumatic Fever (ARF)", "To prevent Glomerulonephritis", "None"]', 1, 'Antibiotics significantly reduce the risk of ARF, though they may not prevent post-streptococcal glomerulonephritis.'),
    (v_case_id, 'What is the first-line antibiotic treatment for GABHS in non-allergic patients?', '["Azithromycin", "Penicillin V or Amoxicillin", "Ciprofloxacin", "None"]', 1, 'Penicillins remain highly effective against GABHS with no reported resistance.');

    ---------------------------------------------------------------------------
    -- CASE 02: Infectious Mononucleosis (EBV)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Kissing Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Kissing Disease', 'An 18-year-old college student presents with 2 weeks of extreme fatigue, sore throat, and "swollen glands." He was recently given Amoxicillin by a local clinic and developed a generalized maculopapular rash.

Vitals: Temp 101.2°F, Stable.
Physical Examination: Significant posterior cervical lymphadenopathy. Exudative tonsillitis. Palpable spleen tip (splenomegaly).
Laboratory Results: Monospot test is positive. Atypical lymphocytes seen on peripheral smear.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infectious Mononucleosis (EBV); posterior adenopathy, splenomegaly, amoxicillin rash.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic distribution of lymphadenopathy in Mononucleosis?', '["Anterior cervical", "Posterior cervical", "Axillary only", "None"]', 1, 'Posterior cervical involvement is highly characteristic of EBV infection.'),
    (v_case_id, 'Why did the patient develop a rash after taking Amoxicillin?', '["He has a true penicillin allergy", "It is a characteristic non-allergic reaction to aminopenicillins in patients with EBV", "It is a sign of secondary infection", "None"]', 1, 'The "Ampicillin rash" is a well-known phenomenon in patients with Mono.'),
    (v_case_id, 'What is the most important activity restriction for this patient?', '["Avoidance of fatty foods", "Avoidance of contact sports for 3-4 weeks (risk of splenic rupture)", "Complete bed rest for 2 months", "None"]', 1, 'Splenic rupture is a rare but life-threatening complication; sports should be avoided until the spleen is no longer palpable or at least 21 days have passed.');

    ---------------------------------------------------------------------------
    -- CASE 03: Peritonsillar Abscess (Quinsy)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hot Potato Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hot Potato Voice', 'A 25-year-old male presents with severe unilateral sore throat and difficulty opening his mouth (trismus). He has a muffled "hot potato" voice.

Vitals: Temp 103.0°F, HR 110.
Physical Examination: Bulging of the superior tonsillar pillar on the right. Deviation of the uvula to the left. Drooling.
Laboratory Results: Elevated WBC. CT Neck with contrast shows a rim-enhancing fluid collection.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Peritonsillar Abscess (PTA); trismus, uvular deviation, hot potato voice.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common causative organism of PTA?', '["Streptococcus pyogenes (GABHS)", "Staphylococcus aureus", "Haemophilus influenzae", "None"]', 0, 'Mixed anaerobes (like Fusobacterium) are also frequently involved.'),
    (v_case_id, 'What is the hallmark physical exam finding for PTA?', '["Bilateral tonsillar exudates", "Unilateral tonsillar bulge with uvular deviation to the opposite side", "Posterior pharyngeal wall swelling", "None"]', 1, 'The deviation of the uvula away from the abscess is diagnostic.'),
    (v_case_id, 'What is the primary treatment for an established peritonsillar abscess?', '["Oral antibiotics only", "Needle aspiration or Incision and Drainage (I\u0026D) + Antibiotics", "Immediate tonsillectomy", "None"]', 1, 'Draining the abscess is necessary for rapid symptom relief and resolution.');

    ---------------------------------------------------------------------------
    -- CASE 04: Retropharyngeal Abscess (Pediatric)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Neck', 'A 4-year-old child presents with high fever, neck stiffness, and refusal to eat. The child is holding the head in a slightly extended position.

Vitals: Temp 103.5°F, RR 24.
Physical Examination: Posterior pharyngeal wall is bulging and erythematous. Pain with any neck movement. No trismus.
Laboratory Results: Lateral neck X-ray shows widening of the prevertebral soft tissue space.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Retropharyngeal Abscess; prevertebral space widening, neck extension.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are retropharyngeal abscesses more common in children under 6?', '["They have more allergies", "Presence of lymph nodes in the retropharyngeal space (Nodes of Rouviere) that atrophy after age 6", "Poor hygiene", "None"]', 1, 'Infections in the nasopharynx drain to these nodes, which can then suppurate.'),
    (v_case_id, 'What is a "positive" finding for prevertebral space widening on a lateral neck X-ray?', '["Space \u003e2 mm", "Space \u003e7 mm at C2 or \u003e14-22 mm at C6", "No space", "None"]', 1, 'Specific measurements vary by age and level, but significant widening suggests an abscess or cellulitis.'),
    (v_case_id, 'What is the most serious potential complication of a retropharyngeal abscess?', '["Hearing loss", "Spread to the mediastinum (Mediastinitis)", "Loss of teeth", "None"]', 1, 'The retropharyngeal space ("danger space") communicates directly with the posterior mediastinum.');

    ---------------------------------------------------------------------------
    -- CASE 05: Ludwig''s Angina
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Elevated Tongue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Elevated Tongue', 'A 35-year-old male with poor dental hygiene presents with severe submandibular swelling, floor of mouth pain, and a "woody" induration of the neck.

Vitals: Temp 102.8°F, HR 115, RR 26.
Physical Examination: The floor of the mouth is elevated, pushing the tongue upward and backward. "Brawny" non-pitting edema of the submandibular space.
Laboratory Results: CT shows diffuse cellulitis of the sublingual and submandibular spaces.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ludwig''s Angina; submandibular space cellulitis, airway risk.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common source of infection in Ludwig''s Angina?', '["Tonsils", "Odontogenic (dental) infection, particularly the 2nd and 3rd molars", "The ear", "None"]', 1, 'The roots of these molars lie below the mylohyoid muscle line, allowing infection to spread to the submandibular space.'),
    (v_case_id, 'What is the primary cause of death in Ludwig''s Angina?', '["Sepsis", "Asphyxiation due to posterior displacement of the tongue obstructing the airway", "Heart attack", "None"]', 1, 'Airway management is the single most important aspect of care.'),
    (v_case_id, 'True or False: Ludwig''s Angina is usually an abscess that requires immediate surgical drainage.', '["True", "False"]', 1, 'It is typically a rapidly spreading cellulitis, not a discrete abscess, although drainage may be performed if an abscess eventually forms or for decompression.');

    ---------------------------------------------------------------------------
    -- CASE 06: Eagle''s Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Styloid Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Styloid Pain', 'A 50-year-old female presents with persistent unilateral throat pain and a sensation of a foreign body (globus) that worsens with head rotation. She had a tonsillectomy 10 years ago.

Vitals: Stable.
Physical Examination: Palpation of the tonsillar fossa on the affected side reproduces her pain.
Laboratory Results: CT shows an elongated styloid process (\u003e30 mm) and calcification of the stylohyoid ligament.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Eagle''s Syndrome; elongated styloid process, post-tonsillectomy pain.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomical cause of Eagle''s Syndrome?', '["Elongated styloid process or calcified stylohyoid ligament", "Large tonsils", "Thyroid nodule", "None"]', 0, 'This can compress the glossopharyngeal nerve or the carotid artery.'),
    (v_case_id, 'Why is this condition often associated with a history of tonsillectomy?', '["Tonsils prevent it", "Post-surgical scarring may trap the glossopharyngeal nerve against the elongated styloid", "It is unrelated", "None"]', 1, 'This is the "classic" variant of the syndrome.'),
    (v_case_id, 'What is the definitive treatment for symptomatic Eagle''s Syndrome?', '["Antibiotics", "Surgical shortening of the styloid process (styloidectomy)", "Steroid injections only", "None"]', 1, 'The process can be removed via an intraoral or transcervical approach.');

    ---------------------------------------------------------------------------
    -- CASE 07: Lemierre''s Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Forgotten Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Forgotten Disease', 'A 20-year-old male presents with severe neck pain, high fevers, and "septic" pulmonary emboli (cough, pleuritic chest pain) one week after having a sore throat.

Vitals: Temp 104.0°F, HR 125, BP 100/60.
Physical Examination: Tenderness and induration along the sternocleidomastoid muscle (SCM).
Laboratory Results: Blood cultures positive for Fusobacterium necrophorum. CT Neck shows internal jugular vein (IJV) thrombosis.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lemierre''s Syndrome; IJV thrombophlebitis, Fusobacterium, septic emboli.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Lemierre''s Syndrome?', '["A type of flu", "Septic thrombophlebitis of the internal jugular vein following a pharyngeal infection", "A lung tumor", "None"]', 1, 'It typically follows an oropharyngeal infection that spreads to the parapharyngeal space.'),
    (v_case_id, 'Which organism is the most common cause of Lemierre''s Syndrome?', '["Staphylococcus aureus", "Fusobacterium necrophorum", "Streptococcus pyogenes", "None"]', 1, 'This is an anaerobic gram-negative rod that is part of the normal oral flora.'),
    (v_case_id, 'What is a common "metastatic" complication of Lemierre''s Syndrome?', '["Hearing loss", "Septic pulmonary emboli", "Liver failure", "None"]', 1, 'Bacteria and thrombi break off and travel to the lungs, causing abscesses and pleurisy.');

    ---------------------------------------------------------------------------
    -- CASE 08: Zenker''s Diverticulum
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Regurgitated Meal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Regurgitated Meal', 'A 75-year-old male presents with progressive difficulty swallowing (dysphagia), foul-smelling breath (halitosis), and regurgitation of undigested food that he ate hours earlier.

Vitals: Stable.
Physical Examination: Occasionally, a soft, gurgling mass is felt in the left side of the neck.
Laboratory Results: Barium swallow shows a pouch protruding from the posterior pharyngeal wall above the cricopharyngeus muscle.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Zenker''s Diverticulum; Killian''s triangle, halitosis, regurgitation.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where exactly does a Zenker''s diverticulum form?', '["Through the tonsil", "Through Killian''s Triangle (between the thyropharyngeus and cricopharyngeus muscles)", "In the stomach", "None"]', 1, 'This is a "false" diverticulum caused by increased intraluminal pressure.'),
    (v_case_id, 'What is the characteristic symptom of Zenker''s?', '["Weight gain", "Regurgitation of undigested food and nocturnal coughing/aspiration", "Bloody stools", "None"]', 1, 'Food gets trapped in the pouch and is later regurgitated.'),
    (v_case_id, 'What is the standard diagnostic test for Zenker''s diverticulum?', '["Endoscopy (caution required)", "Barium Swallow", "CT Scan", "None"]', 1, 'Endoscopy must be performed with extreme care to avoid accidental perforation of the pouch.');

    ---------------------------------------------------------------------------
    -- CASE 09: Acute Epiglottitis (Adult)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapid Airway Block' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapid Airway Block', 'A 45-year-old male presents with rapid-onset severe sore throat, drooling, and difficulty breathing. He has no cough.

Vitals: Temp 102.8°F, RR 28, HR 110, SpO2 94% on room air.
Physical Examination: Patient is sitting in a "tripod" position. Inspiratory stridor. No visible pharyngeal abnormality.
Laboratory Results: Lateral neck X-ray shows the "thumbprint sign" (swollen epiglottis).', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Adult Epiglottitis; thumbprint sign, tripod position.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Thumbprint Sign" on a lateral neck X-ray?', '["A broken thumb", "A thickened, rounded epiglottis indicating acute inflammation", "A lung shadow", "None"]', 1, 'This is a classic sign of epiglottitis.'),
    (v_case_id, 'What is the most common causative organism in ADULT epiglottitis?', '["Haemophilus influenzae type b (Hib)", "Streptococcus pneumoniae or Group A Strep", "Influenza virus", "None"]', 1, 'While Hib is the classic cause in children (pre-vaccine), adults are often infected by Strep or Staph species.'),
    (v_case_id, 'What is the most critical first step in the management of suspected epiglottitis?', '["IV antibiotics", "Securing the airway (preferably in the OR)", "Throat culture", "None"]', 1, 'Airway obstruction can occur suddenly; equipment for emergency intubation or tracheostomy must be ready.');

    ---------------------------------------------------------------------------
    -- CASE 10: Chronic Tonsillitis / Tonsilloliths
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Smelly Stones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Smelly Stones', 'A 28-year-old female complains of persistent bad breath (halitosis) and the occasional coughing up of small, hard, foul-smelling white "stones."

Vitals: Stable.
Physical Examination: Deep tonsillar crypts containing white, chalky debris (tonsilloliths). No acute inflammation.
Laboratory Results: Normal.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tonsilloliths; debris in tonsillar crypts, halitosis.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "Tonsilloliths"?', '["Kidney stones", "Calcified accumulations of food debris, dead cells, and bacteria in the tonsillar crypts", "Tumors", "None"]', 1, 'They are a common cause of halitosis in patients with deep tonsillar crypts.'),
    (v_case_id, 'Which criteria are often used to determine the indication for tonsillectomy in recurrent pharyngitis?', '["Paradise Criteria", "Centor Criteria", "Kadish Staging", "None"]', 0, 'Paradise criteria consider frequency, severity, and duration of infections.'),
    (v_case_id, 'True or False: Tonsilloliths alone are a standard indication for tonsillectomy.', '["True", "False"]', 1, 'Usually, conservative management (irrigation, gargling) is tried first; tonsillectomy is considered only if halitosis is severely distressing to the patient.');

    ---------------------------------------------------------------------------
    -- CASE 11: Croup (Laryngotracheobronchitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Barking Seal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Barking Seal', 'A 2-year-old child presents with a "barking" cough and inspiratory stridor that worsens at night. He had a mild runny nose and low-grade fever for 2 days.

Vitals: Temp 100.8°F, RR 28, HR 115.
Physical Examination: Inspiratory stridor and mild subcostal retractions. No drooling. Oropharynx is normal.
Laboratory Results: AP neck X-ray shows subglottic narrowing ("Steeple sign").', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Croup (Laryngotracheobronchitis); barking cough, steeple sign.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common causative agent of Croup?', '["Respiratory Syncytial Virus (RSV)", "Parainfluenza Virus (Type 1)", "Haemophilus influenzae", "None"]', 1, 'Parainfluenza is responsible for the majority of croup cases.'),
    (v_case_id, 'What is the characteristic X-ray finding in Croup?', '["Thumbprint sign", "Steeple sign (subglottic narrowing)", "Halo sign", "None"]', 1, 'The narrowing of the airway below the vocal cords creates the steeple shape.'),
    (v_case_id, 'Which medication is first-line for moderate-to-severe Croup with stridor at rest?', '["Antibiotics", "Dexamethasone and Nebulized Racemic Epinephrine", "Inhaled Albuterol", "None"]', 1, 'Steroids reduce inflammation, and epinephrine provides rapid temporary relief of airway edema.');

    ---------------------------------------------------------------------------
    -- CASE 12: Vocal Cord Nodules
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Screamer''s Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Screamer''s Voice', 'A 10-year-old boy who is very active in sports and prone to shouting presents with a 6-month history of a "raspy" voice.

Vitals: Stable.
Physical Examination: Flexible laryngoscopy shows bilateral, symmetric small calloused growths at the junction of the anterior 1/3 and posterior 2/3 of the true vocal cords.
Laboratory Results: Normal.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Cord Nodules; bilateral, voice abuse history.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of vocal cord nodules?', '["Smoking", "Vocal abuse or misuse (phonotrauma)", "Infection", "None"]', 1, 'Chronic friction between the cords leads to these calloused lesions.'),
    (v_case_id, 'True or False: Vocal cord nodules are typically unilateral.', '["True", "False"]', 1, 'Nodules are almost always bilateral and symmetric.'),
    (v_case_id, 'What is the first-line treatment for vocal cord nodules in children?', '["Immediate surgery", "Speech therapy (voice hygiene)", "Antibiotics", "None"]', 1, 'Voice therapy to correct the underlying misuse is the mainstay of treatment.');

    ---------------------------------------------------------------------------
    -- CASE 13: Vocal Cord Polyp
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sudden Hoarseness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sudden Hoarseness', 'A 35-year-old male presents with hoarseness after a weekend of cheering loudly at a football game.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals a unilateral, pedunculated, translucent lesion on the left true vocal cord.
Laboratory Results: Normal.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Cord Polyp; unilateral, pedunculated.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do vocal cord polyps typically differ from nodules?', '["They are bilateral", "They are often unilateral and can follow a single event of vocal trauma", "They are cancerous", "None"]', 1, 'Polyps often arise from a localized hemorrhage (vocal cord hemorrhage) after acute trauma.'),
    (v_case_id, 'What is a "pedunculated" polyp?', '["One that is flat", "One that is attached by a stalk", "One that is bleeding", "None"]', 1, 'Pedunculated polyps can flip in and out of the glottis during phonation.'),
    (v_case_id, 'Treatment for a persistent vocal cord polyp usually involves:', '["Voice therapy only", "Micro-laryngeal surgery (excision) + Voice therapy", "Radiation", "None"]', 1, 'While therapy is tried, persistent polyps often require surgical removal.');

    ---------------------------------------------------------------------------
    -- CASE 14: Reinke''s Edema
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Smoker''s Rasp' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Smoker''s Rasp', 'A 60-year-old female with a 40-pack-year smoking history presents with a "manly," very low-pitched voice that has developed over years.

Vitals: Stable.
Physical Examination: Laryngoscopy shows bilateral, diffuse, "jelly-like" swelling of the entire true vocal cord (superficial lamina propria).
Laboratory Results: Normal.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reinke''s Edema; diffuse swelling, smoking related.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary risk factor for Reinke''s Edema?', '["Alcohol", "Chronic smoking", "Eating spicy food", "None"]', 1, 'Chronic irritation from smoke leads to fluid accumulation in Reinke''s space.'),
    (v_case_id, 'Where exactly is "Reinke''s Space"?', '["The subglottis", "The superficial lamina propria of the vocal cord", "The epiglottis", "None"]', 1, 'This is the layer that vibrates during phonation.'),
    (v_case_id, 'What is the first step in the management of Reinke''s Edema?', '["Surgery", "Smoking cessation and reflux management", "Speech therapy only", "None"]', 1, 'The underlying irritant must be removed to prevent progression and recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 15: Laryngeal Papillomatosis (RRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Warty Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Warty Airway', 'A 4-year-old child presents with progressive hoarseness and occasional stridor.

Vitals: Stable.
Physical Examination: Laryngoscopy shows multiple "raspberry-like" exophytic growths on the vocal cords and epiglottis.
Laboratory Results: Biopsy confirms Human Papillomavirus (HPV) infection.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent Respiratory Papillomatosis (RRP); HPV 6/11.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which HPV strains are most commonly associated with RRP?', '["16 and 18", "6 and 11", "1 and 2", "None"]', 1, 'Strains 6 and 11 are low-risk but cause benign growths.'),
    (v_case_id, 'What is the main challenge in treating RRP?', '["It is malignant", "High rate of recurrence, often requiring multiple surgeries", "It spreads to the blood", "None"]', 1, 'The virus persists in the mucosa, leading to frequent regrowth.'),
    (v_case_id, 'How do children typically acquire RRP?', '["Contaminated food", "Vertical transmission during childbirth (from maternal genital warts)", "Hand-to-mouth contact", "None"]', 1, 'This is the most common route for Juvenile-onset RRP.');

    ---------------------------------------------------------------------------
    -- CASE 16: Contact Granuloma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Intubation Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Intubation Pain', 'A 45-year-old male presents with persistent throat discomfort and a "catching" sensation when speaking. He was intubated for 5 days following a surgery 2 months ago.

Vitals: Stable.
Physical Examination: Laryngoscopy shows a reddish-gray mass on the medial surface of the vocal process of the arytenoid cartilage.
Laboratory Results: Normal.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Contact Granuloma; arytenoid vocal process, intubation trauma.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where do contact granulomas typically occur?', '["The anterior commissure", "The posterior glottis (vocal process of the arytenoid)", "The subglottis", "None"]', 1, 'This is where the cords meet during forceful phonation or where an ET tube rests.'),
    (v_case_id, 'Which two factors are most commonly implicated in the development of contact granulomas?', '["Smoking and Alcohol", "Vocal abuse and Laryngopharyngeal Reflux (LPR)", "Genetics and Virus", "None"]', 1, 'Acid irritation from LPR and mechanical irritation (coughing/shouting) are key drivers.'),
    (v_case_id, 'What is the initial treatment of choice for a contact granuloma?', '["Surgical excision", "Anti-reflux therapy (PPIs), voice therapy, and Botox injections", "Radiation", "None"]', 1, 'Surgery is avoided if possible because recurrence is very high; conservative medical management is preferred.');

    ---------------------------------------------------------------------------
    -- CASE 17: Glottic Cancer (T1a)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Persistent Hoarseness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Persistent Hoarseness', 'A 65-year-old male smoker complains of hoarseness that has lasted for 3 months. He has no pain or weight loss.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals a small, leukoplakic (white) lesion on the middle third of the left true vocal cord. Vocal cord mobility is normal.
Laboratory Results: Biopsy shows Squamous Cell Carcinoma.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Glottic SCC (T1a); normal cord mobility, leukoplakia.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does glottic cancer often present early compared to supraglottic cancer?', '["It is more aggressive", "Small lesions on the vocal cord cause noticeable hoarseness immediately", "It is easier to see", "None"]', 1, 'Hoarseness is an early warning sign for glottic lesions.'),
    (v_case_id, 'What is the lymphatic drainage of the true vocal cords?', '["Extremely rich", "Virtually absent (scant lymphatics)", "Drains to axillary nodes", "None"]', 1, 'The paucity of lymphatics in the glottis leads to a very low rate of early nodal metastasis (T1 glottic cancer \u003c1%).'),
    (v_case_id, 'Treatment options for T1 glottic cancer include:', '["Total laryngectomy", "Radiotherapy or Endoscopic Laser Cordectomy", "Chemotherapy only", "None"]', 1, 'Both radiation and laser surgery offer excellent cure rates and voice preservation.');

    ---------------------------------------------------------------------------
    -- CASE 18: Supraglottic Cancer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Muffled Swallowing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Muffled Swallowing', 'A 60-year-old heavy drinker and smoker presents with a persistent "lump in the throat," ear pain (otalgia), and weight loss.

Vitals: Stable.
Physical Examination: Laryngoscopy shows a large, ulcerated mass on the epiglottis. Both vocal cords move normally.
Laboratory Results: CT shows the mass is isolated to the supraglottis but there are several enlarged (2 cm) lymph nodes in the neck.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supraglottic SCC; nodal metastasis, referred otalgia.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do patients with supraglottic cancer often present with ear pain?', '["Ear infection", "Referred pain via the Vagus nerve (Arnold''s nerve) or Glossopharyngeal nerve", "Tumor in the ear", "None"]', 1, 'Referred otalgia is a classic "red flag" for upper aerodigestive tract malignancy.'),
    (v_case_id, 'How does the lymphatic drainage of the supraglottis compare to the glottis?', '["It is similar", "The supraglottis has a very rich lymphatic network, leading to early bilateral nodal metastasis", "It has no lymphatics", "None"]', 1, 'About 40-50% of supraglottic cancers have nodes at presentation.'),
    (v_case_id, 'Which structure separates the supraglottis from the glottis?', '["The epiglottis", "The ventricle", "The subglottis", "None"]', 1, 'The laryngeal ventricle is the anatomical boundary.');

    ---------------------------------------------------------------------------
    -- CASE 19: Vocal Cord Paralysis (Unilateral)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Breathy Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Breathy Voice', 'A 45-year-old female presents with a "breathy" voice and frequent choking on liquids following a thyroidectomy.

Vitals: Stable.
Physical Examination: Laryngoscopy shows the left vocal cord is fixed in a lateral (abducted) position. The right cord moves normally.
Laboratory Results: Normal.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Unilateral VC Paralysis; Recurrent Laryngeal Nerve injury.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve was most likely injured during the thyroidectomy?', '["Superior Laryngeal Nerve", "Recurrent Laryngeal Nerve (RLN)", "Hypoglossal Nerve", "None"]', 1, 'The RLN provides motor supply to all intrinsic laryngeal muscles except the cricothyroid.'),
    (v_case_id, 'Why does the patient choke on liquids?', '["The esophagus is blocked", "Incomplete glottic closure allows aspiration during swallowing", "Loss of sensation", "None"]', 1, 'If the cords don''t close, the airway is not protected during the swallow.'),
    (v_case_id, 'What is the goal of "Medialization Thyroplasty" or vocal cord injection?', '["To make the cord move again", "To move the paralyzed cord toward the midline so the healthy cord can meet it", "To remove the cord", "None"]', 1, 'This improves voice quality and prevents aspiration by restoring glottic closure.');

    ---------------------------------------------------------------------------
    -- CASE 20: Vocal Cord Paralysis (Bilateral)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Op Stridor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Op Stridor', 'A patient develops immediate inspiratory stridor and respiratory distress following a total thyroidectomy. The voice is surprisingly normal.

Vitals: RR 32, HR 120, SpO2 88%.
Physical Examination: Both vocal cords are fixed in the midline position. Significant inspiratory stridor.
Laboratory Results: Normal.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilateral VC Paralysis; midline position, airway emergency.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the voice near-normal in bilateral midline paralysis?', '["The cords are moving", "The cords are fixed in the phonatory (midline) position, allowing sound production", "The patient is faking", "None"]', 1, 'Paradoxically, the "best" voice in paralysis often comes with the "worst" airway.'),
    (v_case_id, 'What is the immediate management for this patient?', '["Wait and see", "Emergency airway management (Intubation or Tracheostomy)", "Voice therapy", "None"]', 1, 'Midline paralysis means the airway is severely narrowed.'),
    (v_case_id, 'Which muscle is the ONLY abductor of the vocal cords?', '["Lateral Cricoarytenoid", "Posterior Cricoarytenoid (PCA)", "Thyroarytenoid", "None"]', 1, 'The PCA "pulls the cords apart"; paralysis leads to midline drift.');

    ---------------------------------------------------------------------------
    -- CASE 21: Laryngopharyngeal Reflux (LPR)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Reflux' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Reflux', 'A 40-year-old male complains of a "lump in the throat" (globus), frequent throat clearing, and a "sour" taste in the morning. He has no heartburn.

Vitals: Stable.
Physical Examination: Laryngoscopy shows "pachyderma" (thickening) of the posterior commissure and erythema of the arytenoids.
Laboratory Results: Normal.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'LPR; "silent" reflux, posterior glottic thickening.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does LPR differ from GERD?', '["LPR has more heartburn", "LPR often lacks classic heartburn and primarily involves laryngeal symptoms", "They are the same", "None"]', 1, 'LPR is the "extra-esophageal" manifestation of reflux.'),
    (v_case_id, 'What is the characteristic laryngoscopic finding of LPR?', '["Bilateral polyps", "Posterior commissure hypertrophy and arytenoid erythema", "Vocal cord paralysis", "None"]', 1, 'This area is most exposed to stomach acid when lying down.'),
    (v_case_id, 'What is the first-line medical treatment for LPR?', '["Antibiotics", "Proton Pump Inhibitors (PPIs) twice daily + Dietary changes", "Surgery", "None"]', 1, 'LPR often requires higher doses and longer durations of PPI therapy than GERD.');

    ---------------------------------------------------------------------------
    -- CASE 22: Laryngomalacia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Omega Epiglottis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Omega Epiglottis', 'A 2-month-old infant is brought in for high-pitched inspiratory stridor that is louder when the baby is lying on their back or crying, and improves when prone. The baby is feeding and growing well.

Vitals: Stable.
Physical Examination: Flexible laryngoscopy shows an "Omega-shaped" epiglottis that collapses into the airway during inspiration.
Laboratory Results: Normal.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngomalacia; most common cause of congenital stridor.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of congenital stridor?', '["Vocal cord paralysis", "Laryngomalacia", "Subglottic stenosis", "None"]', 1, 'It accounts for about 60-70% of cases.'),
    (v_case_id, 'What is the typical natural history of laryngomalacia?', '["It gets worse forever", "It usually resolves spontaneously by 18-24 months of age", "It causes cancer", "None"]', 1, 'As the laryngeal cartilage matures and stiffens, the symptoms disappear.'),
    (v_case_id, 'When is surgical intervention (Supraglottoplasty) indicated?', '["For all cases", "Severe cases with failure to thrive, hypoxia, or cor pulmonale", "Never", "None"]', 1, 'Most cases are managed with observation and reflux medication.');

    ---------------------------------------------------------------------------
    -- CASE 23: Subglottic Stenosis (Post-Intubation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scarred Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scarred Airway', 'A 4-year-old child who was born prematurely and spent 4 weeks on a ventilator presents with progressive stridor and exercise intolerance.

Vitals: Stable.
Physical Examination: Biphasic stridor. Endoscopy shows a circumferential narrowing of the airway below the level of the true vocal cords.
Laboratory Results: CT neck confirms subglottic narrowing.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Subglottic Stenosis; Myer-Cotton grading, post-intubation scar.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which anatomical structure defines the subglottis?', '["The thyroid cartilage", "The cricoid cartilage (only complete ring)", "The hyoid bone", "None"]', 1, 'The cricoid is the narrowest point of the pediatric airway.'),
    (v_case_id, 'The Myer-Cotton system is used to grade:', '["Tonsil size", "The severity of subglottic stenosis based on the percentage of airway narrowing", "Hearing loss", "None"]', 1, 'Grade I (\u003c50%), II (51-70%), III (71-99%), IV (No detectable lumen).'),
    (v_case_id, 'Management for severe (Grade III/IV) stenosis often includes:', '["Antibiotics", "Laryngotracheal Reconstruction (LTR) or Cricotracheal Resection (CTR)", "Nasal sprays", "None"]', 1, 'Surgical expansion of the airway using cartilage grafts (LTR) or resection of the stenotic segment (CTR).');

    ---------------------------------------------------------------------------
    -- CASE 24: Foreign Body Inhalation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Missing Game Piece' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Missing Game Piece', 'A 3-year-old child presents with sudden-onset wheezing and coughing while playing with small toys.

Vitals: Stable.
Physical Examination: Unilateral (right-sided) wheezing and decreased breath sounds.
Laboratory Results: Chest X-ray shows "air trapping" on the right side on expiratory view.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'FB Inhalation; unilateral wheeze, air trapping.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the most common site for an inhaled foreign body to lodge?', '["Left main bronchus", "Right main bronchus", "Stomach", "None"]', 1, 'The right bronchus is wider, shorter, and more vertical than the left.'),
    (v_case_id, 'What does "air trapping" on an expiratory X-ray indicate?', '["Pneumonia", "A \"ball-valve\" obstruction where air can enter but not exit the lung", "A collapsed lung", "None"]', 1, 'This leads to hyperinflation of the affected side during expiration.'),
    (v_case_id, 'What is the definitive procedure for foreign body removal in a child?', '["Flexible bronchoscopy", "Rigid Bronchoscopy", "Heimlich maneuver only", "None"]', 1, 'Rigid bronchoscopy provides superior control of the airway and better visualization for removal.');

    ---------------------------------------------------------------------------
    -- CASE 25: Tracheostomy (Complication)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sudden Bleed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sudden Bleed', 'A patient with a long-term tracheostomy presents with "sentinel" bleeding (small amount of bright red blood) from around the tube, followed by massive arterial hemorrhage.

Vitals: BP 80/40, HR 130.
Physical Examination: Profuse bleeding from the tracheostomy stoma.
Laboratory Results: Normal coags.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tracheoinnominate Fistula (TIF); sentinel bleed, surgical emergency.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Tracheoinnominate Artery Fistula (TIF)?', '["A minor skin infection", "An erosion of the tracheostomy tube through the tracheal wall into the innominate (brachiocephalic) artery", "A type of tumor", "None"]', 1, 'This is a rare but catastrophic complication usually occurring between 1-4 weeks post-op.'),
    (v_case_id, 'What is the "Sentinel Bleed"?', '["A large hemorrhage", "A small, self-limited warning bleed that precedes a massive hemorrhage", "Bleeding from the gums", "None"]', 1, 'Any bright red bleeding from a trach stoma after the first week must be treated as a TIF until proven otherwise.'),
    (v_case_id, 'What is the immediate bedside maneuver to control a TIF?', '["Remove the tube", "Over-inflation of the trach cuff or digital compression of the artery against the sternum via the stoma (Utley maneuver)", "Ice packs", "None"]', 1, 'Digital pressure can temporarily control the bleeding while the patient is rushed to the OR.');

    ---------------------------------------------------------------------------
    -- CASE 26: Sialolithiasis (Submandibular Gland)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mealtime Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mealtime Swelling', 'A 45-year-old male presents with a painful swelling under his jaw that occurs predictably at mealtimes and resolves an hour later.

Vitals: Stable.
Physical Examination: A tender, palpable mass is felt along the floor of the mouth. The opening of Wharton''s duct is erythematous.
Laboratory Results: Ultrasound of the submandibular gland shows a hyperechoic structure with posterior acoustic shadowing within the duct.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sialolithiasis; Wharton''s duct stone, mealtime pain.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which salivary gland is most commonly affected by sialolithiasis?', '["Parotid", "Submandibular", "Sublingual", "None"]', 1, 'The submandibular gland accounts for ~80% of cases due to its alkaline, mucin-rich saliva and the upward course of Wharton''s duct.'),
    (v_case_id, 'What is the name of the duct of the submandibular gland?', '["Stensen''s duct", "Wharton''s duct", "Bartholin''s duct", "None"]', 1, 'Stensen''s duct drains the parotid gland.'),
    (v_case_id, 'A small stone near the duct opening can be treated with:', '["Parotidectomy", "Intraoral stone removal (marsupialization) or sialendoscopy", "IV antibiotics only", "None"]', 1, 'Minimally invasive approaches preserve the gland and are preferred over gland excision.');

    ---------------------------------------------------------------------------
    -- CASE 27: Acute Parotitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swollen Cheek' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swollen Cheek', 'A 75-year-old post-operative male on morphine presents with a tender, swollen, erythematous right cheek. He has had poor oral intake.

Vitals: Temp 101.5°F.
Physical Examination: Swelling of the parotid region. Purulent discharge expressible from Stensen''s duct opening.
Laboratory Results: Elevated WBC. Culture grows Staphylococcus aureus.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Suppurative Parotitis; Staph aureus, dehydration.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common risk factor for acute suppurative parotitis?', '["Smoking", "Dehydration and decreased salivary flow (post-op, debilitated patients)", "Young age", "None"]', 1, 'Low salivary flow allows bacteria to ascend retrograde up the duct.'),
    (v_case_id, 'What is the landmark for the opening of Stensen''s duct?', '["Beside the lower first molar", "Opposite the upper second molar", "Under the tongue", "None"]', 1, 'Knowing this allows the clinician to check for purulence.'),
    (v_case_id, 'Treatment of acute suppurative parotitis includes:', '["Surgery first", "Anti-staphylococcal antibiotics, IV hydration, massage, and sialogogues", "Antiviral medications", "None"]', 1, 'Improving salivary flow along with antibiotics is key to resolution.');

    ---------------------------------------------------------------------------
    -- CASE 28: Pleomorphic Adenoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Cheek Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Cheek Lump', 'A 40-year-old female notices a painless, slow-growing lump just in front of her left ear.

Vitals: Stable.
Physical Examination: A 2 cm firm, mobile, well-demarcated mass in the superficial parotid lobe. No facial weakness.
Laboratory Results: MRI shows a well-circumscribed, lobulated mass with a heterogeneous "mixed" signal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pleomorphic Adenoma; most common benign parotid tumor.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common tumor of the salivary glands overall?', '["Warthin''s Tumor", "Pleomorphic Adenoma (Mixed Tumor)", "Mucoepidermoid Carcinoma", "None"]', 1, 'It accounts for about 70-80% of all benign parotid tumors.'),
    (v_case_id, 'Why must a pleomorphic adenoma be excised with a cuff of normal tissue?', '["For aesthetics", "It has a thin, incomplete capsule that can rupture, leading to recurrence or malignant transformation (\"carcinoma ex pleomorphic adenoma\")", "To check for cancer", "None"]', 1, 'Enucleation alone results in a high recurrence rate.'),
    (v_case_id, 'Standard surgical treatment for a superficial lobe pleomorphic adenoma is:', '["Fine needle aspiration only", "Superficial Parotidectomy with facial nerve preservation", "Total parotidectomy", "None"]', 1, 'The facial nerve runs through the parotid and must be carefully preserved.');

    ---------------------------------------------------------------------------
    -- CASE 29: Warthin''s Tumor
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bilateral Parotid Lumps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bilateral Parotid Lumps', 'A 65-year-old male smoker presents with bilateral, non-tender parotid swellings.

Vitals: Stable.
Physical Examination: Soft, cystic masses bilaterally at the tail of both parotid glands.
Laboratory Results: Tc-99m scintigraphy (nuclear scan) shows bilateral "hot spots" in the parotid glands.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Warthin''s Tumor; bilateral, male smokers, "hot" on Tc scan.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic patient demographic for Warthin''s Tumor?', '["Young females", "Older male smokers", "Children", "None"]', 1, 'Warthin''s (Cystadenoma Lymphomatosum) has a strong association with smoking.'),
    (v_case_id, 'Which feature makes Warthin''s tumor unique among parotid neoplasms?', '["It is malignant", "It is bilateral in ~10% and is the only parotid tumor that concentrates Tc-99m", "It is very painful", "None"]', 1, 'The oncocytic cells in Warthin''s actively accumulate technetium, making it a "hot" lesion on scan.'),
    (v_case_id, 'What is the typical management of Warthin''s tumor?', '["Radiation", "Surgical excision (superficial parotidectomy)", "Observation only", "None"]', 1, 'Although benign, excision is generally preferred for diagnosis and to prevent enlargement.');

    ---------------------------------------------------------------------------
    -- CASE 30: Mucoepidermoid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapidly Growing Parotid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapidly Growing Parotid', 'A 55-year-old male with a previously known parotid mass presents with rapid enlargement and new onset of facial twitching.

Vitals: Stable.
Physical Examination: Hard, fixed, tender mass in the right parotid. Partial right facial weakness (House-Brackmann Grade III).
Laboratory Results: MRI shows an irregular mass with local invasion. Biopsy confirms malignancy.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mucoepidermoid Carcinoma; most common malignant salivary tumor, facial nerve involvement.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignant tumor of the salivary glands?', '["Adenoid Cystic Carcinoma", "Mucoepidermoid Carcinoma", "Acinic Cell Carcinoma", "None"]', 1, 'It can be low, intermediate, or high grade.'),
    (v_case_id, 'Facial nerve involvement (weakness) in a parotid mass is a "red flag" for:', '["Benign tumor", "Malignancy with perineural invasion", "Infection", "None"]', 1, 'Any parotid tumor causing facial nerve palsy must be considered malignant until proven otherwise.'),
    (v_case_id, 'Treatment for high-grade Mucoepidermoid Carcinoma of the parotid is:', '["Chemotherapy only", "Total Parotidectomy (with facial nerve sacrifice if involved) + Post-op Radiotherapy", "Observation", "None"]', 1, 'Adjuvant radiotherapy is added for high-grade tumors or positive margins.');

    ---------------------------------------------------------------------------
    -- CASE 31: Adenoid Cystic Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nerve Pain Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nerve Pain Tumor', 'A 50-year-old female presents with a painful submandibular mass and numbness of the lower lip.

Vitals: Stable.
Physical Examination: Firm, slightly tender submandibular mass. Decreased sensation in the chin (V3 distribution).
Laboratory Results: Biopsy shows a "cribriform" (Swiss-cheese) pattern of tumor cells.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adenoid Cystic Carcinoma; perineural invasion, cribriform pattern.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark biological behavior of Adenoid Cystic Carcinoma?', '["Rapid lymph node spread", "Perineural invasion (tracking along nerve sheaths)", "Bone destruction", "None"]', 1, 'This leads to pain, numbness, and facial weakness, and makes surgical clearance difficult.'),
    (v_case_id, 'What is the classic histological pattern of Adenoid Cystic Carcinoma?', '["Papillary", "Cribriform (\"Swiss-cheese\") pattern with mucin-filled pseudolumens", "Solid nests", "None"]', 1, 'The cribriform pattern is the most recognizable histological subtype.'),
    (v_case_id, 'What is the characteristic late behavior of Adenoid Cystic Carcinoma?', '["Very rarely recurs", "Tendency for late distant metastases (especially to the lungs) even decades after treatment", "Always curable with surgery", "None"]', 1, 'Patients require very long-term follow-up due to this "slow but relentless" nature.');

    ---------------------------------------------------------------------------
    -- CASE 32: Parotitis (Mumps / Viral)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Epidemic Parotid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Epidemic Parotid', 'A 14-year-old unvaccinated male presents with bilateral painful swelling of the parotid glands and low-grade fever.

Vitals: Temp 100.5°F.
Physical Examination: Bilateral tender parotid swelling that lifts the ear lobes. The overlying skin is not erythematous.
Laboratory Results: Elevated serum lipase and amylase.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mumps; bilateral non-suppurative parotitis, unvaccinated child.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent of Mumps?', '["Parainfluenza virus", "Paramyxovirus", "EBV", "None"]', 1, 'Mumps is caused by a Paramyxovirus and is preventable by the MMR vaccine.'),
    (v_case_id, 'What are the two most common extrasalivary complications of mumps?', '["Blindness and Deafness", "Orchitis (in post-pubertal males) and Pancreatitis", "Kidney failure", "None"]', 1, 'Orchitis can lead to infertility if bilateral.'),
    (v_case_id, 'Treatment of Mumps parotitis is:', '["Antiviral medications", "Supportive (analgesics, hydration, rest)", "Antibiotics", "None"]', 1, 'There is no specific antiviral treatment; management is symptomatic.');

    ---------------------------------------------------------------------------
    -- CASE 33: Thyroglossal Duct Cyst
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Moving Midline Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Moving Midline Cyst', 'A 10-year-old girl presents with a painless midline neck swelling that her parents noticed gradually increasing in size.

Vitals: Stable.
Physical Examination: A smooth, soft, non-tender midline cyst at the level of the hyoid bone that moves upward on swallowing and on tongue protrusion.
Laboratory Results: Ultrasound confirms a cystic structure in the midline with normal thyroid tissue in its expected position.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Thyroglossal Duct Cyst; midline, moves with tongue protrusion.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What embryological remnant gives rise to a Thyroglossal Duct Cyst?', '["The 2nd branchial cleft", "The thyroglossal duct, a tract from the foramen cecum at the tongue base to the thyroid gland", "The parathyroid gland", "None"]', 1, 'The thyroid descends along this tract during development.'),
    (v_case_id, 'What is the pathognomonic clinical feature of a thyroglossal duct cyst?', '["It is lateral", "It elevates on protrusion of the tongue due to its attachment to the hyoid via the duct tract", "It pulsates", "None"]', 1, 'This movement distinguishes it from other midline neck masses.'),
    (v_case_id, 'What is the standard surgical treatment for TGDC?', '["Aspiration alone", "Sistrunk Procedure (excision of the cyst, tract, and central body of the hyoid bone)", "Antibiotics only", "None"]', 1, 'Removal of the hyoid body is essential to remove the tract and prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 34: Branchial Cleft Cyst (2nd)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lateral Neck Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lateral Neck Cyst', 'A 25-year-old male presents with a painless lateral neck swelling that has been present since childhood and recently became slightly larger.

Vitals: Stable.
Physical Examination: A smooth, fluctuant, non-tender cyst located at the anterior border of the upper SCM muscle.
Laboratory Results: CT shows a cystic mass lateral to the carotid sheath, medial to the SCM, and posterior to the submandibular gland.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '2nd Branchial Cleft Cyst; anterior SCM border, lateral.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which branchial cleft anomaly is most common?', '["1st branchial cleft cyst", "2nd branchial cleft cyst", "3rd branchial cleft cyst", "None"]', 1, 'It accounts for ~95% of all branchial cleft anomalies.'),
    (v_case_id, 'Where does the fistulous opening of a 2nd branchial cleft fistula typically emerge?', '["The midline", "Along the anterior border of the SCM, usually at the junction of the upper and middle thirds", "The mastoid", "None"]', 1, 'The tract passes between the internal and external carotid arteries.'),
    (v_case_id, 'In an adult presenting with a new lateral cystic neck mass, which diagnosis must be excluded?', '["Thyroglossal duct cyst", "Cystic metastasis from a squamous cell carcinoma (especially HPV+ oropharyngeal cancer)", "Parotid cyst", "None"]', 1, 'Any new lateral neck cyst in an adult must be biopsied to exclude malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 35: Cystic Hygroma (Lymphangioma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Transilluminating Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Transilluminating Neck', 'A newborn is noted to have a large, soft, compressible swelling in the posterior triangle of the neck.

Vitals: Stable.
Physical Examination: A brilliantly transilluminating, multi-loculated soft mass in the left posterior neck. No skin change.
Laboratory Results: MRI shows a multicystic, infiltrating lesion wrapping around neck structures.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cystic Hygroma (Lymphangioma); transilluminates, posterior triangle.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Cystic Hygroma?', '["A thyroglossal cyst", "A macrocystic lymphatic malformation (type of lymphangioma)", "A hemangioma", "None"]', 1, 'It results from sequestered lymphatic tissue that fails to connect to the central system.'),
    (v_case_id, 'In which triangle of the neck is a cystic hygroma most commonly found?', '["Anterior", "Posterior", "Submental", "None"]', 1, 'The posterior triangle is the most common location.'),
    (v_case_id, 'Which prenatal finding is strongly associated with cystic hygroma?', '["Gestational diabetes", "Turner syndrome (45,X) and other chromosomal anomalies", "Maternal smoking", "None"]', 1, 'A large nuchal hygroma on prenatal ultrasound prompts chromosomal analysis.');

    ---------------------------------------------------------------------------
    -- CASE 36: Carotid Body Tumor (Paraganglioma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulsating Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulsating Neck Mass', 'A 50-year-old female presents with a slowly growing painless lateral neck mass at the level of the carotid bifurcation.

Vitals: Stable.
Physical Examination: A firm, pulsatile mass that can be moved horizontally but not vertically ("Fontaine''s sign").
Laboratory Results: Angiography shows a highly vascular tumor that "splays" the carotid bifurcation ("lyre sign").', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Carotid Body Tumor; lyre sign, Fontaine''s sign, paraganglioma.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Lyre Sign" on angiography?', '["A musical artifact", "Splaying/widening of the carotid bifurcation by the tumor", "Normal anatomy", "None"]', 1, 'This is the classic angiographic appearance of a carotid body tumor.'),
    (v_case_id, 'Which genetic mutation is commonly associated with familial carotid body tumors?', '["BRCA1", "SDHB or SDHD (Succinate Dehydrogenase subunit genes)", "TP53", "None"]', 1, 'SDH gene mutations are found in hereditary paraganglioma syndromes.'),
    (v_case_id, 'What is the preoperative preparation for a large, highly vascular carotid body tumor?', '["Aspirin", "Preoperative embolization to reduce blood loss during surgery", "No preparation needed", "None"]', 1, 'Embolization devascularizes the tumor, reducing the risk of massive hemorrhage during resection.');

    ---------------------------------------------------------------------------
    -- CASE 37: Cervical Lymphadenopathy (Lymphoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "B" Symptoms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "B" Symptoms', 'A 22-year-old male presents with painless bilateral supraclavicular and cervical lymphadenopathy for 3 months along with fevers, night sweats, and 15 lb weight loss.

Vitals: Temp 100.4°F (low grade).
Physical Examination: Multiple firm, rubbery, non-tender lymph nodes in the neck and supraclavicular fossae. Splenomegaly.
Laboratory Results: CBC shows lymphocytosis. Excisional biopsy reveals Reed-Sternberg cells.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hodgkin Lymphoma; Reed-Sternberg cells, "B" symptoms.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "B" symptoms in lymphoma?', '["Bleeding, Bruising, Blood in stool", "Fever >38°C, drenching Night sweats, and Weight loss >10% in 6 months", "Bone pain, Back pain, Blindness", "None"]', 1, '"B" symptoms indicate more advanced, systemic disease.'),
    (v_case_id, 'What is the pathognomonic cell of Hodgkin Lymphoma?', '["Plasma cell", "Reed-Sternberg cell (\"owl-eye\" appearance)", "Small lymphocyte", "None"]', 1, 'The Reed-Sternberg cell is a large binucleated B-cell.'),
    (v_case_id, 'Why is excisional lymph node biopsy preferred over FNA in suspected lymphoma?', '["FNA is too expensive", "FNA may miss the diagnosis because lymphoma diagnosis requires assessment of the nodal architecture", "Excisional biopsy is less invasive", "None"]', 1, 'Nodal architecture is destroyed in malignant lymphoma, a finding that requires the whole node for assessment.');

    ---------------------------------------------------------------------------
    -- CASE 38: Kikuchi-Fujimoto Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Self-Limiting Nodes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Self-Limiting Nodes', 'A 22-year-old Asian female presents with tender posterior cervical lymphadenopathy, low-grade fever, and fatigue for 3 weeks. All infectious workup is negative.

Vitals: Temp 100.2°F.
Physical Examination: Tender, matted posterior cervical nodes. Mild hepatosplenomegaly.
Laboratory Results: WBC mildly low. Monospot negative. EBV, CMV negative. Excisional biopsy shows necrotizing histiocytic lymphadenitis.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Kikuchi-Fujimoto Disease; necrotizing histiocytic lymphadenitis, self-limiting.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Kikuchi-Fujimoto Disease?', '["A form of lymphoma", "A self-limiting necrotizing histiocytic lymphadenitis most common in young Asian women", "A bacterial infection", "None"]', 1, 'It is benign and resolves spontaneously within 1-4 months.'),
    (v_case_id, 'Which condition must be excluded in a patient with Kikuchi disease?', '["Appendicitis", "Systemic Lupus Erythematosus (SLE)", "Diabetes", "None"]', 1, 'KFD can be a presenting feature of or confused with SLE; the two share histological similarities.'),
    (v_case_id, 'What is the treatment for Kikuchi-Fujimoto Disease?', '["Chemotherapy", "Supportive care (analgesics, rest) as it is self-limiting", "Long-term antibiotics", "None"]', 1, 'NSAIDs and supportive care are sufficient in most cases.');

    ---------------------------------------------------------------------------
    -- CASE 39: Obstructive Sleep Apnea (OSA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snoring Trucker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snoring Trucker', 'A 52-year-old obese male presents with daytime sleepiness, loud snoring, and morning headaches. His wife reports witnessed apneas during sleep.

Vitals: BP 148/92, BMI 38.
Physical Examination: Short neck, Mallampati Class III airway, enlarged tonsils (Grade 2+).
Laboratory Results: Polysomnography (sleep study) shows AHI of 38 events/hour (severe OSA).', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Severe OSA; AHI >30, CPAP indicated.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the gold-standard treatment for moderate-to-severe OSA?', '["Tonsillectomy", "CPAP (Continuous Positive Airway Pressure)", "Weight loss only", "None"]', 1, 'CPAP acts as a pneumatic splint, keeping the upper airway open during sleep.'),
    (v_case_id, 'What does the Apnea-Hypopnea Index (AHI) measure?', '["Blood oxygen level", "Number of apnea and hypopnea events per hour of sleep", "Snoring decibel level", "None"]', 1, 'AHI >30 = severe OSA.'),
    (v_case_id, 'Which surgical option reduces the soft palate and uvula to enlarge the oropharynx?', '["Tonsillectomy alone", "Uvulopalatopharyngoplasty (UPPP)", "Septoplasty", "None"]', 1, 'UPPP is a surgical alternative for patients who fail or refuse CPAP.');

    ---------------------------------------------------------------------------
    -- CASE 40: Oropharyngeal Cancer (HPV+)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tonsil Asymmetry' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tonsil Asymmetry', 'A 48-year-old non-smoker male presents with a painless neck mass and subtle asymmetry of the right tonsil for 2 months.

Vitals: Stable.
Physical Examination: 3 cm firm, non-tender right level II lymph node. Right tonsil is slightly larger and indurated.
Laboratory Results: FNA of node shows squamous cell carcinoma. p16 IHC is positive (surrogate for HPV).', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'HPV+ Oropharyngeal SCC; p16 positive, better prognosis.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which HPV strain is primarily responsible for oropharyngeal SCC?', '["HPV 6", "HPV 16", "HPV 11", "None"]', 1, 'HPV 16 is a high-risk oncogenic strain.'),
    (v_case_id, 'How does the prognosis of HPV+ oropharyngeal SCC compare to HPV- disease?', '["Much worse", "Significantly better (higher survival rates)", "The same", "None"]', 1, 'HPV+ tumors are more radiosensitive and have a better response to treatment.'),
    (v_case_id, 'What is p16 IHC used as in the context of oropharyngeal cancer?', '["A tumor marker for all cancers", "A surrogate marker for HPV infection in oropharyngeal SCC", "A staging tool", "None"]', 1, 'p16 overexpression correlates highly with transcriptionally active HPV infection.');

    ---------------------------------------------------------------------------
    -- CASE 41: Neck Dissection (Types)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neck Surgery Plan' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neck Surgery Plan', 'A surgeon is planning a neck dissection for a patient with oral tongue cancer (T2N1M0). The single ipsilateral node is clinically positive at level I.

Vitals: Stable.
Physical Examination: 2 cm ulcerated lesion on the right lateral tongue. Single 2 cm node at right level I (submandibular).
Laboratory Results: CT confirms single level I node; no extranodal extension.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Selective Neck Dissection; levels I-III for oral cavity cancer.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Radical Neck Dissection"?', '["Removal of nodes only", "Removal of all 5 levels of cervical nodes plus the SCM, IJV, and CN XI (spinal accessory)", "Removal of the parotid gland", "None"]', 1, 'It is associated with significant morbidity (shoulder drop, neck contour deformity).'),
    (v_case_id, 'What is the key advantage of a "Modified Radical" or "Selective" Neck Dissection?', '["It is faster", "Preservation of important structures (SCM, IJV, CN XI) reduces functional morbidity", "It removes more nodes", "None"]', 1, 'Selective dissection is now preferred for most head and neck cancers with equivalent oncologic outcomes.'),
    (v_case_id, 'Which nerve, if injured during a neck dissection, causes shoulder drop and inability to abduct the arm above 90 degrees?', '["Vagus nerve (CN X)", "Spinal Accessory Nerve (CN XI)", "Hypoglossal nerve (CN XII)", "None"]', 1, 'CN XI innervates the trapezius muscle; its injury is the key morbidity of radical neck dissection.');

    ---------------------------------------------------------------------------
    -- CASE 42: Dysphagia (Oropharyngeal vs. Esophageal)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swallowing Difficulty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swallowing Difficulty', 'A 70-year-old male with a history of stroke presents with coughing and choking immediately when he tries to swallow liquids. He has not lost weight.

Vitals: Stable.
Physical Examination: Hoarse voice, weak cough. Modified Barium Swallow shows aspiration of thin liquids during the pharyngeal phase.
Laboratory Results: Normal.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Oropharyngeal Dysphagia (Neurogenic); aspiration of liquids, post-stroke.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is oropharyngeal dysphagia distinguished from esophageal dysphagia?', '["They are the same", "Oropharyngeal dysphagia causes coughing/choking at initiation of swallow; esophageal causes food sticking lower down", "Esophageal dysphagia is only for solids", "None"]', 1, 'Timing and location of symptoms helps localize the problem.'),
    (v_case_id, 'What is the "Modified Barium Swallow" (MBS) study used for?', '["Diagnosing GERD", "A videofluoroscopic assessment of the oral and pharyngeal phases of swallowing", "Checking for stomach ulcers", "None"]', 1, 'It is the gold standard for evaluating aspiration risk.'),
    (v_case_id, 'What is the initial management for post-stroke dysphagia with aspiration?', '["Immediate surgery", "Diet modification (thickened liquids), speech therapy, and aspiration precautions", "Antibiotics", "None"]', 1, 'The goal is to maintain adequate nutrition while minimizing aspiration risk.');

    ---------------------------------------------------------------------------
    -- CASE 43: Tonsillectomy Complication (Post-Tonsillectomy Hemorrhage)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Night of Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Night of Bleeding', 'A 7-year-old child presents to the ED with bright red blood in his mouth on post-operative day 7 following a tonsillectomy.

Vitals: HR 115, BP 95/65.
Physical Examination: Active oozing from the right tonsillar fossa. Clot present.
Laboratory Results: Hb 10.2 g/dL.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Secondary Post-Tonsillectomy Hemorrhage; Day 5-10, surgical emergency.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the difference between "primary" and "secondary" post-tonsillectomy hemorrhage?', '["There is no difference", "Primary occurs within 24 hours of surgery; secondary occurs 5-10 days later (eschar separation)", "Secondary is always minor", "None"]', 1, 'Secondary hemorrhage is more common and related to infection or premature eschar separation.'),
    (v_case_id, 'What is the immediate management priority for a child with active tonsillar bleeding?', '["Send home with antibiotics", "Airway and hemodynamic stabilization, then urgent return to OR for bleeding control", "Observation", "None"]', 1, 'Active hemorrhage can compromise the airway; urgent surgical intervention is often needed.'),
    (v_case_id, 'Which vessel is most commonly responsible for severe post-tonsillectomy hemorrhage?', '["The lingual artery", "Branches of the External Carotid Artery (especially the tonsillar branch of the facial artery)", "The internal jugular vein", "None"]', 1, 'The tonsil is highly vascular and supplied primarily by the external carotid system.');

    ---------------------------------------------------------------------------
    -- CASE 44: Cat Scratch Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cat Owner''s Nodes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cat Owner''s Nodes', 'A 16-year-old female presents with a tender, enlarging axillary lymph node 2 weeks after adopting a kitten. She has a healing scratch on her forearm.

Vitals: Low-grade fever.
Physical Examination: Tender unilateral axillary lymphadenopathy. A healing papule at the scratch site.
Laboratory Results: Bartonella henselae serology is positive.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cat Scratch Disease; Bartonella henselae, unilateral adenopathy.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism of Cat Scratch Disease?', '["Pasteurella multocida", "Bartonella henselae", "Staphylococcus aureus", "None"]', 1, 'Transmitted via the scratch or bite of a kitten (young cats have higher rates of bacteremia).'),
    (v_case_id, 'What is the classic histological finding of CSD lymphadenopathy?', '["Reed-Sternberg cells", "Stellate necrotic granulomas", "Caseating granulomas", "None"]', 1, 'These "star-shaped" granulomas are characteristic but not pathognomonic of CSD.'),
    (v_case_id, 'In an immunocompetent child, what is the typical course of CSD?', '["Fatal without treatment", "Self-limiting within 2-4 months", "Requires IV antibiotics", "None"]', 1, 'Most cases resolve spontaneously; azithromycin may speed recovery.');

    ---------------------------------------------------------------------------
    -- CASE 45: Hypopharyngeal Cancer (Pyriform Sinus)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Swallower' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Swallower', 'A 62-year-old male smoker and heavy drinker presents with a neck mass and dysphagia to solids. He delayed seeking care for 6 months.

Vitals: Stable, significant weight loss.
Physical Examination: Hard, fixed level II/III neck nodes. Flexible laryngoscopy shows a mucosal lesion in the right pyriform sinus with pooling of saliva.
Laboratory Results: CT/PET shows primary pyriform sinus tumor with bilateral neck nodes and a suspicious pulmonary nodule.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pyriform Sinus SCC; late presentation, bilateral nodes.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do hypopharyngeal cancers present late?', '["They cause early pain", "The hypopharynx is a \"silent\" area; tumors grow large before causing noticeable symptoms", "They grow slowly", "None"]', 1, 'Pooling of saliva in the pyriform sinus is a late sign.'),
    (v_case_id, 'What is the most common site of hypopharyngeal cancer?', '["Posterior pharyngeal wall", "Pyriform sinus", "Post-cricoid region", "None"]', 1, 'The pyriform sinus accounts for approximately 60-70% of hypopharyngeal cancers.'),
    (v_case_id, 'The combination of dysphagia, an upper esophageal web, and iron-deficiency anemia in a middle-aged woman is called:', '["Boerhaave syndrome", "Plummer-Vinson syndrome", "Eagle''s syndrome", "None"]', 1, 'This is a pre-malignant condition with increased risk of post-cricoid/hypopharyngeal cancer.');

    ---------------------------------------------------------------------------
    -- CASE 46: Paraganglioma (Vagal / Jugular)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulsatile Ear Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulsatile Ear Mass', 'A 45-year-old female presents with pulsatile tinnitus in the right ear and progressive hoarseness.

Vitals: Stable.
Physical Examination: A reddish, pulsatile mass visible behind an intact tympanic membrane ("rising sun" sign). Soft palate deviation and hoarse voice (CN IX, X involvement).
Laboratory Results: MRI shows a "salt-and-pepper" appearance of a jugular foramen mass.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Jugular Paraganglioma (Glomus Jugulare); salt-and-pepper MRI, CN IX-XII involvement.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Salt-and-Pepper" appearance on MRI characteristic of?', '["Lymphoma", "Paragangliomas — caused by flow voids (pepper) and hemorrhagic foci (salt)", "Metastases", "None"]', 1, 'This is highly characteristic of paragangliomas due to their highly vascular nature.'),
    (v_case_id, 'Involvement of which cranial nerves produces the "Jugular Foramen Syndrome" (Vernet''s syndrome)?', '["CN III, IV, VI", "CN IX (Glossopharyngeal), X (Vagus), XI (Spinal Accessory)", "CN VII, VIII", "None"]', 1, 'All three nerves pass through the jugular foramen.'),
    (v_case_id, 'In which patients is genetic screening for SDH mutations most important in paragangliomas?', '["Elderly patients with single tumor", "Young patients, bilateral tumors, or family history of paraganglioma", "All patients equally", "None"]', 1, 'Hereditary paraganglioma syndromes (SDHx mutations) are more likely in these scenarios.');

    ---------------------------------------------------------------------------
    -- CASE 47: Globus Pharyngeus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Phantom Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Phantom Lump', 'A 38-year-old anxious female complains of a constant sensation of a "lump in her throat." She has no dysphagia, weight loss, or odynophagia. Symptoms actually improve when eating.

Vitals: Stable.
Physical Examination: Normal oropharynx and laryngoscopy. No masses palpable.
Laboratory Results: Normal. Barium swallow normal.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Globus Pharyngeus; functional, no dysphagia, improves with swallowing.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Globus Pharyngeus?', '["A pharyngeal tumor", "A functional sensation of a lump in the throat without true dysphagia or structural cause", "A type of abscess", "None"]', 1, 'It is one of the most common ENT complaints and is often associated with LPR and anxiety.'),
    (v_case_id, 'What is the key distinguishing feature of Globus vs. true dysphagia?', '["Globus has weight loss", "Globus improves or disappears during actual swallowing; dysphagia worsens", "They are the same", "None"]', 1, 'This paradoxical relief during swallowing is a hallmark of globus.'),
    (v_case_id, 'What are common associations with Globus Pharyngeus?', '["Hypertension and Diabetes", "LPR (Laryngopharyngeal Reflux), anxiety, and cricopharyngeal muscle dysfunction", "Sinus disease only", "None"]', 1, 'Treating LPR and addressing anxiety often leads to improvement.');

    ---------------------------------------------------------------------------
    -- CASE 48: Parapharyngeal Space Tumor
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Medial Tonsil Bulge' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Medial Tonsil Bulge', 'A 50-year-old male presents with a slow-growing, medial displacement of the right tonsil and soft palate. He has no trismus, pain, or fever.

Vitals: Stable.
Physical Examination: Smooth bulge pushing the right tonsil medially. No mucosal ulceration.
Laboratory Results: MRI shows a well-circumscribed, fat-containing mass in the parapharyngeal space.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Parapharyngeal Space Tumor; prestyloid (salivary); medial tonsil displacement.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common tumor of the parapharyngeal space?', '["Lymphoma", "Deep lobe parotid tumor (usually pleomorphic adenoma)", "Paraganglioma", "None"]', 1, 'Tumors of the deep lobe of the parotid bulge into the prestyloid parapharyngeal space.'),
    (v_case_id, 'How does a parapharyngeal space mass typically present differently from a peritonsillar abscess?', '["Both cause trismus", "Parapharyngeal tumors are non-tender with smooth mucosa and no fever; PTA is painful and feverish", "Both are the same treatment", "None"]', 1, 'The absence of inflammation is key to distinguishing a neoplasm from an abscess.'),
    (v_case_id, 'What is the preferred surgical approach for a prestyloid parapharyngeal tumor?', '["Transoral (through the mouth)", "Transcervical (neck incision) with or without a transparotid approach", "Radiation only", "None"]', 1, 'This provides better exposure and the ability to control the facial nerve and carotid artery.');

    ---------------------------------------------------------------------------
    -- CASE 49: Snoring (Non-Apneic) / Upper Airway Resistance Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Social Snorer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Social Snorer', 'A 35-year-old male presents with loud snoring that is disturbing his wife but he has no daytime sleepiness and feels fully rested.

Vitals: BMI 27, BP normal.
Physical Examination: Large tonsils (Grade 3), elongated uvula, low-lying soft palate.
Laboratory Results: Polysomnography shows AHI of 3 (normal, <5). No significant desaturations.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Primary Snoring; normal AHI, no apneas.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What distinguishes "primary snoring" from Obstructive Sleep Apnea?', '["Primary snoring is louder", "Primary snoring has no apneas, hypopneas, or significant oxygen desaturations (AHI <5)", "They are the same condition", "None"]', 1, 'Primary snoring is a social problem, while OSA is a health problem.'),
    (v_case_id, 'What surgical options exist for socially bothersome primary snoring?', '["Tracheostomy", "Palatal procedures (UPPP, palatal implants, laser-assisted) or tonsillectomy if tonsils are large", "CPAP is mandatory", "None"]', 1, 'Surgery is elective in primary snoring; patient preference and anatomy guide the decision.'),
    (v_case_id, 'The Mallampati classification is used in ENT to assess:', '["Tonsil size", "The degree of soft palate visibility and oropharyngeal crowding", "Tongue size only", "None"]', 1, 'A higher Mallampati class predicts a more crowded airway and greater risk of OSA.');

    ---------------------------------------------------------------------------
    -- CASE 50: Total Laryngectomy & Voice Rehabilitation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Voiceless Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Voiceless Patient', 'A 68-year-old male underwent a total laryngectomy for T4 glottic SCC. He breathes through a permanent neck stoma and has lost his natural voice.

Vitals: Stable.
Physical Examination: Permanent end-tracheostomy (laryngectomy stoma). No voice. Patient is writing to communicate.
Laboratory Results: Normal post-op labs.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-Total Laryngectomy; voice rehabilitation options.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Tracheoesophageal Puncture (TEP) voice prosthesis?', '["An external microphone", "A small one-way valve placed in a surgically created fistula between the trachea and esophagus, allowing air to vibrate the esophageal mucosa", "A type of pacemaker", "None"]', 1, 'TEP is considered the gold standard for voice rehabilitation after total laryngectomy.'),
    (v_case_id, 'What is "Esophageal Speech"?', '["Using a machine", "Learning to swallow and then expel air from the esophagus to create vibrations for speech", "Whispering", "None"]', 1, 'This is the oldest method of alaryngeal speech; it requires significant practice.'),
    (v_case_id, 'An "Electrolarynx" is an example of which type of alaryngeal communication?', '["Esophageal speech", "An external vibratory device held against the neck that produces a buzzing sound", "TEP voice", "None"]', 1, 'It is the easiest method to learn but produces a robotic-sounding voice.');

END $$;
COMMIT;
