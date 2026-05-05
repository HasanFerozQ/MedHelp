-- ENT (Otolaryngology): Laryngeal Disorders & Hoarseness
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-laryngeal-disorders-hoarseness
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-laryngeal-disorders-hoarseness' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-laryngeal-disorders-hoarseness';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acute Viral Laryngitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Whispering Teacher' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Whispering Teacher', 'A 32-year-old school teacher presents with hoarseness and a raspy voice for 3 days. She recently had a mild upper respiratory infection with a cough and rhinorrhea. She has been continuing to teach despite her symptoms.

Vitals: Temp 98.6F.
Physical Examination: Voice is hoarse and weak. Flexible laryngoscopy reveals bilateral edema and erythema of the true vocal folds. No discrete masses or airway compromise.
Laboratory Results: None indicated.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Viral Laryngitis', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common etiology of acute laryngitis?', '["Bacterial infection (Staphylococcus)","Viral infection (e.g., Rhinovirus, Adenovirus)","Fungal infection","Autoimmune"]', 1, 'Viral URIs are the most common cause of acute laryngitis. Bacterial causes are rare.'),
    (v_case_id, 'What is the most appropriate management for this patient?', '["Oral antibiotics","Strict voice rest, hydration, and humidification","Inhaled corticosteroids","Immediate surgical intervention"]', 1, 'Voice rest is critical to prevent vocal fold injury (like hemorrhage or nodule formation) while the vocal folds are inflamed.'),
    (v_case_id, 'Why should whispering be avoided during an episode of acute laryngitis?', '["It spreads the virus","Whispering actually increases muscle tension and strain on the vocal folds compared to normal phonation","It causes throat pain","None"]', 1, 'Whispering is an unnatural use of the larynx that forces the vocal folds together tightly, causing more trauma.');

    ---------------------------------------------------------------------------
    -- CASE 02: Laryngopharyngeal Reflux (LPR)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Morning Hoarseness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Morning Hoarseness', 'A 55-year-old male presents with a 6-month history of a rough voice, frequent throat clearing, and a sensation of a ''lump in his throat'' (globus sensation). His symptoms are typically worse in the morning. He drinks 3 cups of coffee daily and eats late at night.

Vitals: Stable. BMI 30.
Physical Examination: Laryngoscopy reveals posterior glottic erythema and edema (pachydermia laryngis) between the arytenoids.
Laboratory Results: None.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngopharyngeal Reflux (LPR)', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following differentiates Laryngopharyngeal Reflux (LPR) from classic GERD?', '["LPR always causes severe heartburn","Patients with LPR often do NOT complain of classic heartburn or regurgitation (''silent reflux'')","LPR only occurs in children","None"]', 1, 'Most LPR patients lack the classic esophagitis symptoms of GERD, presenting instead with throat clearing, hoarseness, and globus.'),
    (v_case_id, 'What is the classic laryngoscopic finding in LPR?', '["Anterior glottic web","Erythema and edema of the posterior larynx (arytenoids and interarytenoid area)","Vocal fold paralysis","None"]', 1, 'Acid and pepsin pool in the posterior larynx, causing inflammation in this specific area.'),
    (v_case_id, 'What is the recommended first-line medical therapy for suspected LPR?', '["Antacids PRN","Proton Pump Inhibitors (PPIs) twice daily for a minimum of 3-6 months, along with diet/lifestyle modifications","H2 blockers once daily","None"]', 1, 'LPR requires more aggressive and prolonged acid suppression than typical GERD to allow the laryngeal epithelium to heal.');

    ---------------------------------------------------------------------------
    -- CASE 03: Vocal Fold Nodules
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Singer''s Strain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Singer''s Strain', 'A 22-year-old female college student and lead singer in a rock band presents with progressive hoarseness, loss of high vocal range, and vocal fatigue over the past 4 months.

Vitals: Normal.
Physical Examination: Laryngoscopy with stroboscopy shows bilateral, symmetric, small, firm swellings at the junction of the anterior and middle thirds of the true vocal folds. The mucosa is otherwise normal.
Laboratory Results: None.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Fold Nodules', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathophysiology behind the formation of vocal fold nodules?', '["Viral infection","Chronic phonotrauma (vocal abuse/misuse) leading to repetitive mechanical stress and microtrauma","Allergies","None"]', 1, 'Nodules are essentially ''calluses'' of the vocal folds resulting from chronic collision forces.'),
    (v_case_id, 'Why do nodules characteristically form at the junction of the anterior 1/3 and posterior 2/3 (or middle 1/3) of the vocal folds?', '["It is the thinnest part","This is the point of maximal amplitude and strongest contact force during phonation","It is the only part with mucosa","None"]', 1, 'The anterior two-thirds of the vocal folds vibrate; the maximum strike force occurs exactly at this junction.'),
    (v_case_id, 'What is the mainstay of treatment for vocal fold nodules?', '["Surgical excision immediately","Voice therapy (speech language pathology) and vocal hygiene","Botox injections","None"]', 1, 'Nodules are a behavioral problem. Surgery is rarely indicated and only after prolonged voice therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 04: Vocal Fold Polyp
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Yelling Coach' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Yelling Coach', 'A 45-year-old male football coach presents with constant hoarseness that has not improved for 2 months. He vividly remembers losing his voice suddenly after screaming at a referee during a game.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals a unilateral, broad-based, hemorrhagic, fluid-filled mass on the middle third of the right true vocal fold. The left vocal fold is normal.
Laboratory Results: None.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Fold Polyp', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the typical clinical presentation of a vocal fold polyp differ from nodules?', '["Polyps only occur in children","Polyps are often unilateral and can arise from a single episode of severe phonotrauma, whereas nodules are bilateral and caused by chronic abuse","They are completely identical","None"]', 1, 'A polyp often starts as a localized submucosal hemorrhage from acute vocal strain.'),
    (v_case_id, 'In what anatomical layer do vocal fold polyps typically form?', '["The vocalis muscle","The superficial lamina propria (Reinke''s space)","The cartilage","None"]', 1, 'Most benign vocal fold lesions (polyps, nodules, edema) occur in the superficial lamina propria, which vibrates during phonation.'),
    (v_case_id, 'If voice therapy fails, what is the standard treatment for a mature vocal fold polyp?', '["Total laryngectomy","Phonomicrosurgery (microlaryngoscopy with excision) to restore a straight vocal edge","Radiation","None"]', 1, 'While voice therapy helps with underlying habits, established polyps often require careful surgical excision.');

    ---------------------------------------------------------------------------
    -- CASE 05: Reinke's Edema
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gravelly Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gravelly Voice', 'A 60-year-old female presents with a progressive, very low-pitched, ''gravelly'' voice over several years. She has a 40-pack-year smoking history. She also reports feeling a bit short of breath with exertion recently.

Vitals: SpO2 96%.
Physical Examination: Voice is distinctively deep and masculine. Laryngoscopy reveals bilateral, diffuse, massive, ''water-bag'' or ''balloon-like'' swelling along the entire length of both true vocal folds.
Laboratory Results: None.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reinke''s Edema', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary risk factor for Reinke''s edema (polypoid corditis)?', '["Alcohol abuse","Heavy, chronic cigarette smoking","Allergies","None"]', 1, 'Reinke''s edema is almost exclusively seen in chronic smokers, and more commonly affects middle-aged women.'),
    (v_case_id, 'Why does the patient''s voice become so low-pitched?', '["Paralysis of the vocal cords","The massive fluid accumulation increases the mass of the vocal folds, significantly decreasing their fundamental frequency of vibration","Tumor invasion","None"]', 1, 'Increased mass equals slower vibration (lower pitch), often giving females a remarkably masculine voice.'),
    (v_case_id, 'What is the most critical first step in management?', '["Surgical stripping of the vocal folds","Absolute smoking cessation (often leading to some regression of the edema)","Chemotherapy","None"]', 1, 'Surgery is only considered if smoking stops; if they continue smoking, the edema will return. Surgery is also done if the swelling is causing airway obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 06: Intubation Granuloma (Contact Granuloma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Intubation Aftermath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Intubation Aftermath', 'A 50-year-old male presents with hoarseness and a sensation of something stuck in his throat (foreign body sensation). He was in the ICU intubated for 10 days due to severe pneumonia a month ago.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals bilateral, pale, lobulated, fleshy masses on the vocal processes of the arytenoid cartilages. The anterior vocal folds are clear.
Laboratory Results: None.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Intubation Granuloma (Contact Granuloma)', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where do intubation granulomas characteristically form?', '["Anterior commissure","Posterior glottis, specifically on the vocal processes of the arytenoid cartilages","Epiglottis","None"]', 1, 'The endotracheal tube rests posteriorly against the arytenoids, causing pressure necrosis, ulceration, and subsequent granuloma formation.'),
    (v_case_id, 'Besides intubation, what is another common contributing factor to the development of contact granulomas?', '["Viral infection","Laryngopharyngeal Reflux (LPR) and chronic throat clearing","Smoking","None"]', 1, 'Acid reflux bathes the posterior larynx, irritating the thin mucosa over the arytenoids and promoting granuloma growth.'),
    (v_case_id, 'What is the initial management for contact granulomas?', '["Aggressive surgical excision","Conservative management with anti-reflux medication (PPIs), voice therapy, and observation","Radiation","None"]', 1, 'Surgery has a very high recurrence rate. Most granulomas resolve over months with aggressive reflux management and voice therapy.');

    ---------------------------------------------------------------------------
    -- CASE 07: Unilateral Vocal Fold Paralysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Breathy Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Breathy Voice', 'A 45-year-old female presents with a very breathy, weak voice and difficulty swallowing liquids (occasional aspiration). She underwent a total thyroidectomy for a large multinodular goiter 2 weeks ago. She has no difficulty breathing.

Vitals: Stable.
Physical Examination: Laryngoscopy shows the left vocal fold is completely immobile and fixed in a paramedian position. The right vocal fold moves normally but cannot completely close the gap (glottic incompetence).
Laboratory Results: None.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Unilateral Vocal Fold Paralysis', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Injury to which nerve during the thyroidectomy caused this presentation?', '["Superior laryngeal nerve","Left recurrent laryngeal nerve (RLN)","Glossopharyngeal nerve","None"]', 1, 'The RLN provides motor innervation to all intrinsic laryngeal muscles except the cricothyroid. Unilateral injury causes a paralyzed fold in the paramedian position.'),
    (v_case_id, 'Why does the patient have a breathy voice and aspiration risk, but NO respiratory distress?', '["The airway is totally blocked","The paralyzed fold in the paramedian position leaves enough airway to breathe, but prevents complete glottic closure during phonation and swallowing","The nerve will recover immediately","None"]', 1, 'Glottic incompetence allows air to escape (breathiness) and liquids to leak into the trachea (aspiration).'),
    (v_case_id, 'If the paralysis is permanent, what is a standard surgical treatment to improve her voice and prevent aspiration?', '["Tracheostomy","Vocal fold medialization (e.g., injection laryngoplasty or Type I thyroplasty) to push the paralyzed fold to the midline","Laryngectomy","None"]', 1, 'Medializing the paralyzed cord allows the working cord to meet it, restoring glottic closure.');

    ---------------------------------------------------------------------------
    -- CASE 08: Bilateral Vocal Fold Paralysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Op Stridor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Op Stridor', 'A 50-year-old female is in the recovery room immediately after a difficult total thyroidectomy for advanced thyroid cancer. As the anesthesia wears off, she develops significant biphasic stridor and severe respiratory distress. Her voice is surprisingly adequate, though slightly weak.

Vitals: HR 110, RR 28, O2 sat dropping to 88%.
Physical Examination: Patient is using accessory muscles to breathe. Flexible laryngoscopy shows both vocal folds are immobile and sitting near the midline, leaving only a 1-2 mm airway gap.
Laboratory Results: None.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilateral Vocal Fold Paralysis', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most immediate life-threatening concern in bilateral RLN injury?', '["Loss of voice","Acute airway obstruction requiring immediate re-intubation or tracheostomy","Severe bleeding","None"]', 1, 'Unlike unilateral paralysis, bilateral paralysis leaves both folds near the midline, critically narrowing the airway.'),
    (v_case_id, 'Why might the patient''s voice be surprisingly well-preserved?', '["The vocal folds are working","Because both folds are resting near the midline, they are close enough to vibrate against each other when air is forced through the narrow gap","The superior laryngeal nerve took over","None"]', 1, 'Good voice but terrible airway is the classic paradox of bilateral abductor paralysis.'),
    (v_case_id, 'If the bilateral paralysis is permanent and the patient wishes to be decannulated (remove the tracheostomy), what surgical trade-off is typically required?', '["No trade-off","Surgically enlarging the airway (e.g., arytenoidectomy or cordotomy) will permanently worsen the voice (making it breathy)","Total laryngectomy","None"]', 1, 'You must sacrifice voice quality to create a safe airway.');

    ---------------------------------------------------------------------------
    -- CASE 09: Superior Laryngeal Nerve (SLN) Paralysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Struggling Singer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Struggling Singer', 'A 40-year-old professional singer complains that her voice fatigues quickly and she has lost the ability to sing high pitches. She does not have a breathy voice or hoarseness at normal speaking pitches. She recently had surgery for a parapharyngeal space tumor near the carotid sheath high in the neck.

Vitals: Stable.
Physical Examination: Normal speaking voice. Laryngoscopy shows both vocal folds are fully mobile. However, the vocal folds appear slightly shortened and bowed, and the epiglottis deviates to the left when attempting high-pitched phonation.
Laboratory Results: None.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Superior Laryngeal Nerve (SLN) Paralysis', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which specific laryngeal muscle is paralyzed in this scenario?', '["Posterior cricoarytenoid","Cricothyroid muscle","Thyroarytenoid","None"]', 1, 'The external branch of the Superior Laryngeal Nerve (SLN) innervates only the cricothyroid muscle.'),
    (v_case_id, 'What is the primary function of the cricothyroid muscle?', '["Opening the vocal folds","Elongating and tensing the vocal folds to elevate vocal pitch","Closing the glottis","None"]', 1, 'Loss of cricothyroid function results in the inability to hit high notes and causes vocal fatigue.'),
    (v_case_id, 'Why is SLN paralysis often missed or difficult to diagnose on routine exam?', '["It doesn''t exist","The true vocal folds still open and close normally (RLN is intact), and speaking voice may be nearly normal","It causes massive swelling","None"]', 1, 'Diagnosis often relies on subtle signs (like bowing or rotation) and the specific symptom of pitch restriction.');

    ---------------------------------------------------------------------------
    -- CASE 10: Adductor Spasmodic Dysphonia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Broken Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Broken Voice', 'A 45-year-old female presents with a voice that sounds ''strained,'' ''strangled,'' and constantly breaks. She states she has to push hard to get words out. Her voice completely normalizes when she laughs, sings, or whispers. She has no history of intubation or trauma.

Vitals: Stable.
Physical Examination: Laryngoscopy shows structurally normal vocal folds. However, during speech, there are severe, irregular, hyperadductive spasms of the vocal folds slamming together.
Laboratory Results: None.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adductor Spasmodic Dysphonia', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying etiology of Spasmodic Dysphonia?', '["Psychiatric illness","A focal dystonia of the larynx (a neurological movement disorder)","A viral infection of the vocal cords","None"]', 1, 'It is a task-specific dystonia, similar to writer''s cramp, which explains why non-speech tasks (laughing, singing) are normal.'),
    (v_case_id, 'What is the classic auditory hallmark of the Adductor subtype?', '["Breathy voice","A strained, strangled voice with frequent pitch breaks and voice arrests due to the cords clamping shut","A whisper","None"]', 1, 'The thyroarytenoid muscles spasm shut, cutting off airflow intermittently.'),
    (v_case_id, 'What is the gold-standard symptomatic treatment for Adductor Spasmodic Dysphonia?', '["Psychotherapy","Botulinum toxin (Botox) injections into the thyroarytenoid muscles","Systemic muscle relaxants","None"]', 1, 'Botox temporarily weakens the spastic muscles, providing significant relief for 3-4 months per injection.');

    ---------------------------------------------------------------------------
    -- CASE 11: Abductor Spasmodic Dysphonia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Breathy Breaks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Breathy Breaks', 'A 50-year-old male presents with a voice that intermittently drops out into a breathy whisper. He specifically notices these breaks when speaking words that start with voiceless consonants like ''h'', ''s'', or ''f'' (e.g., ''Harry''). His voice is normal when singing.

Vitals: Stable.
Physical Examination: Laryngoscopy shows normal anatomy. During speech, the vocal folds involuntarily spasm apart (abduct) during voiceless consonants, causing sudden breathy breaks.
Laboratory Results: None.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Abductor Spasmodic Dysphonia', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Abductor Spasmodic Dysphonia differ from the Adductor type?', '["It is caused by vocal abuse","Instead of clamping shut, the vocal folds spasm OPEN during speech, causing breathy, whispering voice breaks","It causes airway obstruction","None"]', 1, 'It is a dystonia of the posterior cricoarytenoid (PCA) muscles, the only abductors of the vocal folds.'),
    (v_case_id, 'If Botox is used for Abductor Spasmodic Dysphonia, which muscle must be injected?', '["Thyroarytenoid (TA) muscle","Posterior Cricoarytenoid (PCA) muscle","Cricothyroid muscle","None"]', 1, 'Injecting the PCA is technically much more difficult and carries a risk of causing airway compromise if both PCAs are overly weakened.'),
    (v_case_id, 'Is Spasmodic Dysphonia primarily a structural or functional disorder?', '["Structural","Functional/Neurological (the vocal folds themselves are perfectly healthy)","Infectious","None"]', 1, 'The larynx is normal; the neurological signal driving it is abnormal.');

    ---------------------------------------------------------------------------
    -- CASE 12: Presbyphonia (Vocal Fold Atrophy)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Aging Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Aging Voice', 'An 80-year-old male complains that his voice has become weak, thin, and breathy over the last few years. He has trouble being heard in noisy restaurants. He has no history of smoking, intubation, or surgery.

Vitals: Normal.
Physical Examination: Laryngoscopy reveals bilaterally thin, bowed vocal folds with a prominent spindle-shaped gap between them during phonation. The vocal processes of the arytenoids are prominent.
Laboratory Results: None.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Presbyphonia (Vocal Fold Atrophy)', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary physiologic cause of Presbyphonia?', '["Nerve paralysis","Age-related atrophy and loss of bulk in the thyroarytenoid muscle and superficial lamina propria","Vocal abuse","None"]', 1, 'Just like skeletal muscle, the laryngeal muscles atrophy with advanced age, causing ''bowing'' of the vocal edges.'),
    (v_case_id, 'Why does the patient experience a breathy, weak voice?', '["The vocal cords are too tight","The bowed vocal folds cannot completely close during phonation (glottic insufficiency), allowing air loss","They have lung disease","None"]', 1, 'The spindle-shaped gap prevents efficient aerodynamic conversion of air into sound.'),
    (v_case_id, 'What is a common surgical intervention to improve the voice if voice therapy is insufficient?', '["Tracheostomy","Vocal fold augmentation (injection laryngoplasty) to ''plump up'' the atrophic folds and improve closure","Laryngectomy","None"]', 1, 'Injecting fillers (like hyaluronic acid or fat) adds bulk, closing the gap and restoring a strong voice.');

    ---------------------------------------------------------------------------
    -- CASE 13: Paradoxical Vocal Fold Motion (PVFM / VCD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Athletic Attack' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Athletic Attack', 'A 16-year-old female elite gymnast presents with episodes of sudden, severe shortness of breath and loud inspiratory stridor that occur strictly during high-intensity workouts. She feels a ''choking'' sensation in her throat. She has been treated for exercise-induced asthma with albuterol, but it provides zero relief.

Vitals: Normal at rest.
Physical Examination: Pulmonary function tests are normal at rest. Flexible laryngoscopy performed immediately after she runs on a treadmill shows the vocal folds paradoxically ADDUCTING (closing) forcefully during inspiration.
Laboratory Results: None.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Paradoxical Vocal Fold Motion (PVFM / VCD)', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark physiological finding in PVFM (Vocal Cord Dysfunction)?', '["The vocal cords are paralyzed","Involuntary, paradoxical adduction (closure) of the true vocal folds during inspiration, causing functional airway obstruction","Asthma","None"]', 1, 'Normal vocal folds open during inspiration; in PVFM, they inappropriately clamp shut.'),
    (v_case_id, 'Why does PVFM frequently get misdiagnosed as asthma?', '["It causes wheezing","It presents with episodic dyspnea and ''stridor'' that mimics wheezing, and is often triggered by exercise or stress","It responds to albuterol","None"]', 1, 'A key differentiator is that PVFM causes inspiratory stridor localized to the neck, while asthma causes expiratory wheezing in the chest. PVFM does not respond to bronchodilators.'),
    (v_case_id, 'What is the primary treatment for PVFM?', '["Inhaled steroids","Speech therapy (respiratory retraining and laryngeal relaxation exercises) and psychological support","Surgery","None"]', 1, 'Patients are taught specific breathing techniques to ''release'' the vocal folds during an attack.');

    ---------------------------------------------------------------------------
    -- CASE 14: Vocal Fold Hemorrhage
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bloody Scream' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bloody Scream', 'A 28-year-old female opera singer presents with sudden onset of severe hoarseness and pain in her neck that occurred abruptly while hitting a high note during a performance the night before. Her voice completely ''gave out''.

Vitals: Normal.
Physical Examination: Laryngoscopy reveals a dark red, blood-filled appearance of the entire right true vocal fold. The left vocal fold is normal. No discrete polyp is seen.
Laboratory Results: None.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Fold Hemorrhage', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of a vocal fold hemorrhage?', '["A viral infection","Rupture of a microvascular blood vessel in the superficial lamina propria due to acute, severe phonotrauma","Cancer","None"]', 1, 'The sudden shear stress of singing high/loud notes can rupture tiny vessels, bleeding into Reinke''s space.'),
    (v_case_id, 'What is the most critical and non-negotiable management for acute vocal fold hemorrhage?', '["Whispering only","Absolute, strict voice rest for several days to a week","Singing through it","None"]', 1, 'Continuing to phonate on a hemorrhaged fold can cause organizing hematomas, fibrosis, and permanent scarring (dysphonia).'),
    (v_case_id, 'Which medication should the patient immediately stop taking if applicable?', '["Acetaminophen","Aspirin or NSAIDs (which inhibit platelet function and exacerbate bleeding)","Antibiotics","None"]', 1, 'Blood thinners worsen the hemorrhage and delay resolution.');

    ---------------------------------------------------------------------------
    -- CASE 15: Recurrent Respiratory Papillomatosis (RRP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hoarse Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hoarse Child', 'A 4-year-old boy is brought in by his mother for chronic hoarseness that has been present for 2 years. Recently, he has developed mild stridor when playing vigorously. He has no history of intubation.

Vitals: Stable.
Physical Examination: Awake flexible laryngoscopy reveals multiple, irregular, pink, ''wart-like'' or ''cauliflower-like'' exophytic lesions covering the true and false vocal folds.
Laboratory Results: Biopsy confirms squamous papilloma.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent Respiratory Papillomatosis (RRP)', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the infectious etiology of Recurrent Respiratory Papillomatosis?', '["EBV","Human Papillomavirus (HPV), usually types 6 and 11","HSV","None"]', 1, 'In children (Juvenile-onset RRP), the virus is typically acquired via vertical transmission during vaginal birth from an infected mother.'),
    (v_case_id, 'What is the hallmark clinical course of RRP in children?', '["It resolves with antibiotics","Frequent, relentless recurrences requiring multiple surgical procedures (sometimes dozens) to maintain the airway and voice","It never comes back after one surgery","None"]', 1, 'The disease is notoriously stubborn. Surgery is aimed at debulking to preserve the airway, not curative resection, as the virus lives in surrounding normal-appearing mucosa.'),
    (v_case_id, 'What surgical tool is best avoided during removal of these lesions in the larynx?', '["Microdebrider","Aggressive laser use or scalpel excision that damages the underlying vocal ligament, leading to permanent scarring","Suction","None"]', 1, 'Preserving the underlying vocal fold anatomy is critical to prevent a permanent ''crippled'' larynx.');

    ---------------------------------------------------------------------------
    -- CASE 16: Laryngomalacia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Noisy Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Noisy Infant', 'A 4-week-old infant is brought in for noisy breathing. The parents report a high-pitched inspiratory squeak that is worse when the baby is crying, feeding, or lying on his back (supine). It improves when he is prone. The baby is gaining weight normally.

Vitals: Normal. O2 sat 99%.
Physical Examination: Inspiratory stridor is present. Flexible laryngoscopy shows an ''omega-shaped'' epiglottis and short aryepiglottic folds that collapse inward into the airway during inspiration.
Laboratory Results: None.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngomalacia', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of stridor in an infant?', '["Croup","Laryngomalacia","Tracheomalacia","None"]', 1, 'Laryngomalacia accounts for ~60-70% of all congenital anomalies of the pediatric larynx.'),
    (v_case_id, 'What is the typical natural history of Laryngomalacia?', '["It requires immediate tracheostomy","Symptoms usually peak around 6 months of age and spontaneously resolve by 12-18 months as the cartilages stiffen","It worsens until adulthood","None"]', 1, 'Over 90% of cases are mild and require only reassurance and observation.'),
    (v_case_id, 'If the infant were experiencing ''failure to thrive'' or severe cyanosis, what surgical procedure would be indicated?', '["Laryngectomy","Supraglottoplasty (trimming the floppy aryepiglottic folds to open the airway)","Tonsillectomy","None"]', 1, 'Supraglottoplasty is highly effective for the small percentage of severe, complicated cases.');

    ---------------------------------------------------------------------------
    -- CASE 17: Subglottic Stenosis (Post-Intubation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Narrow Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Narrow Airway', 'A 45-year-old female presents with progressively worsening shortness of breath and biphasic stridor over the last 3 months. She has a history of a severe motor vehicle accident 6 months ago requiring 3 weeks of intubation in the ICU. Her voice is relatively normal.

Vitals: RR 22, O2 sat 95%.
Physical Examination: Biphasic stridor localized to the neck. Laryngoscopy shows normal vocal cord mobility, but viewing below the cords reveals a dense, circumferential ring of scar tissue narrowing the airway to 4 mm.
Laboratory Results: None.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Subglottic Stenosis (Post-Intubation)', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the subglottis the most common site for stricture following prolonged intubation?', '["It is the widest part","The cricoid cartilage is a complete, unyielding cartilaginous ring; mucosal swelling inside it leads to pressure necrosis and subsequent scarring","It has no blood supply","None"]', 1, 'The endotracheal tube cuff sits right below the cords. Excessive cuff pressure against the full ring causes ischemia.'),
    (v_case_id, 'What defines ''biphasic'' stridor, and what does it indicate clinically?', '["Stridor only on expiration","Stridor heard on both inspiration and expiration, indicating a fixed lesion in the subglottis or cervical trachea","Stridor in the nose","None"]', 1, 'Inspiratory stridor suggests a supraglottic lesion; expiratory suggests intrathoracic; biphasic suggests a fixed subglottic/tracheal lesion.'),
    (v_case_id, 'For a severe, mature, circumferential subglottic stenosis, what is a definitive surgical treatment?', '["Repeated balloon dilations forever","Cricotracheal resection (resecting the scarred segment and anastomosing the healthy trachea to the cricoid/thyroid cartilage)","Tracheostomy for life","None"]', 1, 'While dilation is used, definitive cure often requires open surgical resection of the scar.');

    ---------------------------------------------------------------------------
    -- CASE 18: Idiopathic Subglottic Stenosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mystery Stenosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mystery Stenosis', 'A 35-year-old otherwise healthy female presents with a 1-year history of progressive dyspnea on exertion. She has been treated for adult-onset asthma with inhalers, with no improvement. She has NO history of intubation, trauma, or autoimmune disease.

Vitals: Stable.
Physical Examination: Expiratory and inspiratory stridor. Laryngoscopy reveals a thick, circumferential subglottic narrowing just below the vocal folds.
Laboratory Results: ANCA panel is negative. Rheumatoid factor negative.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Idiopathic Subglottic Stenosis', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic demographic for Idiopathic Subglottic Stenosis (iSGS)?', '["Elderly males","Almost exclusively adult females, typically Caucasian, between ages 30-50","Children","None"]', 1, 'The exact etiology is unknown, but the striking female predominance suggests hormonal or unique fibrotic pathways.'),
    (v_case_id, 'Why are these patients frequently misdiagnosed with asthma for months or years?', '["They wheeze","The gradual onset of dyspnea and ''wheezing'' (which is actually transmitted stridor) mimics asthma, and standard pulmonary function tests may be confusing","They have allergies","None"]', 1, 'Spirometry showing ''flattening of the inspiratory and expiratory loops'' (fixed upper airway obstruction) is the clue to look at the airway.'),
    (v_case_id, 'What autoimmune disease must be explicitly ruled out before diagnosing ''idiopathic'' subglottic stenosis?', '["Lupus","Granulomatosis with Polyangiitis (Wegener''s), which commonly causes subglottic stenosis","Celiac disease","None"]', 1, 'A negative ANCA panel and absence of systemic signs support the ''idiopathic'' diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 19: Croup (Laryngotracheobronchitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Barking Dog' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Barking Dog', 'A 2-year-old boy is brought to the ED at 2 AM with a harsh, ''barking'' cough and inspiratory stridor. He had a runny nose and low-grade fever for 2 days prior.

Vitals: Temp 100.4F, HR 120, O2 sat 94%.
Physical Examination: The child is mildly agitated with a characteristic seal-like bark cough. Chest shows mild retractions. No drooling; he is swallowing his secretions.
Laboratory Results: Neck X-ray (AP view) shows symmetric subglottic narrowing (''steeple sign'').', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Croup (Laryngotracheobronchitis)', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common viral pathogen responsible for Croup?', '["RSV","Parainfluenza virus (Types 1 and 2)","Rhinovirus","None"]', 1, 'Parainfluenza causes mucosal inflammation and edema specifically in the subglottic space.'),
    (v_case_id, 'What anatomically creates the ''steeple sign'' on an AP neck X-ray?', '["A swollen epiglottis","Edema of the subglottis, tapering up toward the vocal folds, resembling a church steeple","Tracheal collapse","None"]', 1, 'The subglottis is the narrowest part of the pediatric airway, so swelling here causes severe symptoms.'),
    (v_case_id, 'What is the standard medical management for moderate Croup with stridor at rest?', '["Oral antibiotics","A single dose of oral or IM Dexamethasone and nebulized racemic epinephrine","Immediate intubation","None"]', 1, 'Steroids reduce inflammation, and nebulized epinephrine causes rapid, temporary vasoconstriction to reduce airway edema.');

    ---------------------------------------------------------------------------
    -- CASE 20: Adult Epiglottitis (Supraglottitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Drooling Adult' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Drooling Adult', 'A 45-year-old male presents to the ED with severe, rapidly progressive sore throat, dysphagia, and a muffled ''hot potato'' voice over 12 hours. He is leaning forward and drooling because it hurts too much to swallow his saliva. He has no cough.

Vitals: Temp 102.5F, HR 110, RR 24.
Physical Examination: Patient appears toxic. Oral exam is normal (no tonsillar swelling). He is extremely tender to palpation over the hyoid bone.
Laboratory Results: Lateral neck X-ray shows a massively enlarged epiglottis (''thumbprint sign'').', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adult Epiglottitis (Supraglottitis)', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical initial management priority for this patient?', '["Examine the throat with a tongue depressor","Secure the airway in a controlled setting (e.g., OR) and keep the patient calm; do not agitate them","Give oral antibiotics","None"]', 1, 'Any manipulation, including a tongue depressor, can cause sudden, fatal laryngospasm and complete airway loss.'),
    (v_case_id, 'Historically, what was the most common pathogen for pediatric epiglottitis before widespread vaccination?', '["Staphylococcus aureus","Haemophilus influenzae type b (Hib)","Streptococcus pneumoniae","None"]', 1, 'The Hib vaccine has made pediatric epiglottitis rare, but it is now increasingly seen in adults caused by Streptococcus or Staphylococcus.'),
    (v_case_id, 'What anatomic region is inflamed in ''epiglottitis''?', '["The true vocal folds","The supraglottis (epiglottis, aryepiglottic folds, arytenoids)","The trachea","None"]', 1, 'Hence the more accurate term is ''supraglottitis''. The true vocal folds and subglottis are typically spared.');

    ---------------------------------------------------------------------------
    -- CASE 21: Bacterial Tracheitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Toxic Trachea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Toxic Trachea', 'A 5-year-old girl is brought to the ED. She had a typical case of ''croup'' for a few days, but suddenly became much worse with a high fever, severe stridor, and a toxic appearance. She is NOT drooling.

Vitals: Temp 103.8F, HR 140, RR 35.
Physical Examination: Severe stridor and retractions. Endoscopy reveals thick, purulent secretions and thick crusts (pseudomembranes) lining the trachea below the vocal folds.
Laboratory Results: WBC 18,000.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bacterial Tracheitis', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Bacterial tracheitis is most commonly a secondary bacterial infection complicating what primary illness?', '["Asthma","A viral upper respiratory infection, specifically viral Croup","Epiglottitis","None"]', 1, 'It presents as ''croup that got worse'' and didn''t respond to epinephrine or steroids.'),
    (v_case_id, 'What is the most common pathogen responsible for Bacterial Tracheitis?', '["Haemophilus influenzae","Staphylococcus aureus","Streptococcus pyogenes","None"]', 1, 'Staph aureus thrives on the damaged mucosa following the viral infection.'),
    (v_case_id, 'What makes Bacterial Tracheitis exceptionally dangerous?', '["It causes meningitis","The thick, sloughing purulent crusts can peel off and suddenly obstruct the airway","It causes vocal cord paralysis","None"]', 1, 'Patients often require intubation and frequent pulmonary toilet (suctioning) to clear the crusts, along with IV antibiotics.');

    ---------------------------------------------------------------------------
    -- CASE 22: Laryngeal Tuberculosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Laryngeal Consumption' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Laryngeal Consumption', 'A 55-year-old homeless male presents with chronic cough, night sweats, weight loss, and severe hoarseness with odynophagia (painful swallowing). He has a history of incarceration.

Vitals: Temp 100.1F.
Physical Examination: Laryngoscopy reveals a granular, ulcerated exophytic mass on the posterior glottis and arytenoids. It mimics a carcinoma.
Laboratory Results: Chest X-ray shows apical cavitary lesions. Sputum is positive for Acid-Fast Bacilli (AFB).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Tuberculosis', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Laryngeal tuberculosis is almost always secondary to what other organ involvement?', '["Renal TB","Advanced cavitary pulmonary tuberculosis","Bone TB","None"]', 1, 'The larynx is seeded by heavily infected sputum coughed up from the lungs.'),
    (v_case_id, 'What region of the larynx is most classically affected by tuberculosis?', '["Anterior commissure","The posterior larynx (arytenoids and interarytenoid space)","The epiglottis","None"]', 1, 'Sputum pools in the posterior larynx while the patient is supine, leading to granuloma formation and ulceration.'),
    (v_case_id, 'What is a critical consideration regarding the infectivity of Laryngeal TB?', '["It is not contagious","It is considered the most highly infectious form of tuberculosis","It only spreads via blood","None"]', 1, 'Because the infection is in the upper airway, coughing forcefully aerosolizes massive amounts of bacilli directly into the environment.');

    ---------------------------------------------------------------------------
    -- CASE 23: Laryngeal Candidiasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Inhaler Consequence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Inhaler Consequence', 'A 60-year-old asthmatic patient presents with a 3-week history of mild hoarseness. He recently started using a high-dose fluticasone inhaler daily but admits he rarely rinses his mouth afterward. He has no pain or dysphagia.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals thin, white, patchy ''cottage cheese'' plaques on both true vocal folds and the epiglottis. The underlying mucosa is slightly erythematous.
Laboratory Results: None.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Candidiasis', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary risk factor for laryngeal candidiasis in this patient?', '["Smoking","Use of inhaled corticosteroids without proper mouth/throat rinsing","GERD","None"]', 1, 'Steroid deposition on the vocal folds suppresses local immunity, allowing opportunistic Candida albicans overgrowth.'),
    (v_case_id, 'If the white plaques are scraped off, what is typically seen underneath?', '["Normal mucosa","An erythematous, friable base that may bleed slightly","A deep ulcer","None"]', 1, 'Unlike leukoplakia, Candida plaques can generally be wiped or scraped off.'),
    (v_case_id, 'What is the recommended treatment?', '["Surgery","Oral antifungal therapy (e.g., Fluconazole) and counseling on inhaler hygiene (using a spacer and rinsing)","Antibiotics","None"]', 1, 'Medical therapy resolves the infection, but hygiene prevents recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 24: External Laryngocele
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Glassblower''s Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Glassblower''s Neck', 'A 55-year-old male glassblower presents with a painless, intermittent swelling on the right side of his neck. The swelling reliably enlarges when he blows glass or performs a Valsalva maneuver, and he frequently notes a gurgling sound in his neck.

Vitals: Stable.
Physical Examination: A compressible swelling is palpable in the right lateral neck. Laryngoscopy shows a smooth, submucosal bulge in the right false vocal fold and aryepiglottic fold.
Laboratory Results: CT neck shows an air-filled sac extending from the laryngeal ventricle through the thyrohyoid membrane.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'External Laryngocele', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Laryngocele?', '["A cancerous tumor","An abnormal, air-filled dilation of the laryngeal saccule (an appendage of the laryngeal ventricle)","A blocked salivary gland","None"]', 1, 'It communicates with the laryngeal lumen and inflates with increased intraluminal pressure.'),
    (v_case_id, 'What distinguishes an ''external'' laryngocele from an ''internal'' one?', '["External is cancerous","An external laryngocele herniates through the thyrohyoid membrane into the lateral neck, presenting as a neck mass","Internal contains fluid","None"]', 1, 'Internal laryngoceles remain confined within the thyroid cartilage, causing hoarseness or airway obstruction but no neck mass.'),
    (v_case_id, 'If an adult presents with a new laryngocele, what MUST be explicitly ruled out with endoscopy or imaging?', '["Asthma","An underlying laryngeal Squamous Cell Carcinoma obstructing the neck of the saccule, acting like a one-way valve","A viral infection","None"]', 1, 'A small cancer in the ventricle can trap air, causing the saccule to dilate.');

    ---------------------------------------------------------------------------
    -- CASE 25: Laryngeal Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Traumatic Blow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Traumatic Blow', 'A 25-year-old male is brought to the ED after a ''clothesline'' injury to the neck while riding a dirt bike. He is coughing up blood (hemoptysis), his voice is a hoarse whisper, and he has pain swallowing.

Vitals: HR 115, RR 24. O2 sat 95%.
Physical Examination: Loss of the normal thyroid cartilage prominence (''Adam''s apple''). Extensive subcutaneous emphysema (crepitus) is felt over the anterior neck. Flexible laryngoscopy shows edema and a mucosal tear over the vocal cords.
Laboratory Results: CT neck confirms a comminuted fracture of the thyroid cartilage.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Fracture', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What physical exam finding strongly indicates a violation of the mucosal airway?', '["Neck bruising","Subcutaneous emphysema (air leaking into the neck tissues)","Pain","None"]', 1, 'Air in the soft tissues means the airway mucosa is torn.'),
    (v_case_id, 'Why is ''blind'' oral intubation contraindicated in severe blunt laryngeal trauma?', '["It hurts","The endotracheal tube can easily pass through the mucosal tear into a false passage, completely obliterating the airway","It causes bleeding","None"]', 1, 'Awake fiberoptic intubation or an awake tracheostomy under local anesthesia is required to secure the airway safely.'),
    (v_case_id, 'What is the classic triad of laryngeal trauma symptoms?', '["Fever, chills, cough","Hoarseness, dyspnea, and hemoptysis","Ear pain, neck mass, drooling","None"]', 1, 'These symptoms in the setting of neck trauma demand immediate airway evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 26: Vocal Fold Dysplasia (Leukoplakia)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Nodule', 'A 60-year-old male with a history of heavy smoking and alcohol use presents with a painless white plaque on his right true vocal fold, discovered during a routine physical when he mentioned mild, intermittent hoarseness.

Vitals: Stable.
Physical Examination: Laryngoscopy reveals a 4 mm thick, white, adherent plaque on the middle third of the right true vocal cord. Vocal cord mobility is normal.
Laboratory Results: Excisional biopsy shows severe dysplasia/carcinoma in situ.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Fold Dysplasia (Leukoplakia)', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the term ''leukoplakia'' imply about the histologic diagnosis?', '["It means cancer","Nothing; it is a strictly clinical descriptive term for a white patch that cannot be scraped off, and requires biopsy for histologic diagnosis","It means fungal infection","None"]', 1, 'Leukoplakia can represent benign hyperkeratosis, mild-to-severe dysplasia, or invasive squamous cell carcinoma.'),
    (v_case_id, 'If the biopsy shows severe dysplasia, what is the most appropriate management?', '["Observation only","Complete micro-laryngeal surgical excision of the lesion, with strict smoking cessation","Radiation therapy","None"]', 1, 'Severe dysplasia is on the cusp of becoming invasive carcinoma and should be completely removed, while preserving vocal fold function.'),
    (v_case_id, 'Why is a true vocal cord lesion highly unlikely to present with palpable neck lymph nodes?', '["It grows too fast","The true vocal folds are nearly devoid of lymphatic drainage","It spreads to the lungs first","None"]', 1, 'This is a key anatomical feature: glottic tumors stay localized longer than supraglottic or subglottic tumors.');

    ---------------------------------------------------------------------------
    -- CASE 27: Glottic Squamous Cell Carcinoma (T1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hoarse Smoker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hoarse Smoker', 'A 65-year-old male smoker presents with a 3-month history of progressive, constant hoarseness. He has no pain, no dysphagia, and no weight loss.

Vitals: Normal.
Physical Examination: Neck exam is negative for lymphadenopathy. Laryngoscopy reveals an irregular, exophytic, ulcerated mass involving the anterior two-thirds of the right true vocal fold. The vocal fold has full mobility.
Laboratory Results: Biopsy confirms well-differentiated Squamous Cell Carcinoma (SCC).', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Glottic Squamous Cell Carcinoma (T1)', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do T1 glottic cancers have such high cure rates (>90%)?', '["They are benign","They present early due to immediate voice changes, and lack early lymphatic spread","They respond to antibiotics","None"]', 1, 'The hoarseness prompts early medical evaluation while the tumor is still confined to the vocal fold.'),
    (v_case_id, 'What defines a T1 glottic tumor?', '["It involves the cartilage","It is confined to the true vocal fold(s) with normal mobility","It involves the lymph nodes","None"]', 1, 'If vocal fold mobility is impaired or fixed, the stage increases to T2 or T3, reflecting deeper muscle invasion.'),
    (v_case_id, 'What are the two standard curative treatment options for this patient?', '["Chemotherapy alone","Definitive radiation therapy OR transoral laser microsurgery (both have comparable survival rates)","Total laryngectomy","None"]', 1, 'Both options aim for cure while maximizing voice preservation. Total laryngectomy is reserved for advanced (T3/T4) disease.');

    ---------------------------------------------------------------------------
    -- CASE 28: Supraglottic Squamous Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Muffled Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Muffled Voice', 'A 58-year-old male alcoholic presents with a 2-month history of worsening throat pain, difficulty swallowing solid foods, and a ''hot potato'' voice. He recently noticed a firm lump on the left side of his neck.

Vitals: 10 lb weight loss over 2 months.
Physical Examination: A 3 cm firm, mobile lymph node is palpable in the left level II neck. Laryngoscopy shows a massive, ulcerated tumor on the laryngeal surface of the epiglottis, spilling into the aryepiglottic fold.
Laboratory Results: Biopsy confirms moderately differentiated SCC.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supraglottic Squamous Cell Carcinoma', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do supraglottic cancers frequently present at a later stage with neck metastases compared to glottic cancers?', '["They grow faster","The supraglottis has a rich, bilateral lymphatic network, and tumors do not affect voice until they are very large","They are painless","None"]', 1, 'The lack of early symptoms and rich lymphatics make early nodal spread common (up to 40% at presentation).'),
    (v_case_id, 'What specific symptom is a strong red flag for an advanced supraglottic tumor?', '["Sneezing","Referred otalgia (ear pain with a normal ear exam), transmitted via the Vagus or Glossopharyngeal nerves","Nosebleeds","None"]', 1, 'Pain from a supraglottic tumor is often referred to the ipsilateral ear.'),
    (v_case_id, 'Given the presence of a left neck node, what is the minimal neck management required?', '["Observation","Bilateral neck dissection or bilateral neck irradiation, because supraglottic tumors frequently cross the midline lymphatically","Unilateral node excision","None"]', 1, 'The supraglottis drains bilaterally, so both sides of the neck must be treated.');

    ---------------------------------------------------------------------------
    -- CASE 29: Subglottic Squamous Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slowly Failing Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slowly Failing Airway', 'A 70-year-old female presents to the ED with severe dyspnea and biphasic stridor. She reports a history of very subtle, mild hoarseness for the past 6 months that she ignored. She has no pain.

Vitals: RR 28, O2 sat 91%.
Physical Examination: Stridor. Endoscopy reveals a large, smooth, submucosal-appearing mass filling the subglottis, extending downward toward the trachea. Both vocal cords are paralyzed.
Laboratory Results: CT neck shows destruction of the cricoid cartilage by the tumor.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Subglottic Squamous Cell Carcinoma', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do primary subglottic cancers usually present with airway obstruction rather than voice changes?', '["They are benign","The subglottis is a silent area; symptoms only arise when the tumor grows large enough to block the airway or invades the RLN to cause paralysis","They only occur in asthma","None"]', 1, 'Primary subglottic cancers are rare (<5% of laryngeal cancers) and notorious for late presentation.'),
    (v_case_id, 'Which lymph node basin is uniquely at high risk for metastasis from a subglottic tumor?', '["Submandibular nodes","Paratracheal, pretracheal (Delphian node), and superior mediastinal nodes","Occipital nodes","None"]', 1, 'Unlike supraglottic tumors which drain to the upper neck, subglottic tumors drain down into the central neck and chest.'),
    (v_case_id, 'What is the most appropriate initial management for this patient in respiratory distress?', '["Steroids","Secure the airway, usually via awake tracheostomy below the level of the tumor","Oral antibiotics","None"]', 1, 'In severe airway obstruction from a tumor, a surgical airway must be established before staging or definitive treatment.');

    ---------------------------------------------------------------------------
    -- CASE 30: Laryngeal Chondrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hard Larynx' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hard Larynx', 'A 65-year-old male presents with a long history of slowly progressive hoarseness and a hard mass on the outside of his ''Adam''s apple.''

Vitals: Stable.
Physical Examination: A hard, non-tender mass is palpable over the cricoid cartilage. Laryngoscopy shows a smooth, submucosal bulge in the subglottis covered by normal-appearing mucosa.
Laboratory Results: CT neck shows a mass arising from the cricoid cartilage with ''popcorn'' calcifications. Biopsy confirms low-grade Chondrosarcoma.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Chondrosarcoma', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common site for a chondrosarcoma of the larynx?', '["The epiglottis","The posterior lamina of the cricoid cartilage","The true vocal cords","None"]', 1, 'It typically arises from the hyaline cartilage of the cricoid, slowly narrowing the subglottic airway.'),
    (v_case_id, 'How does the clinical presentation differ from classic SCC of the larynx?', '["It bleeds profusely","It presents as a slow-growing, submucosal mass with intact mucosa, whereas SCC is typically ulcerated and exophytic","It causes immediate airway collapse","None"]', 1, 'Because it arises from the cartilage, the overlying mucosa is initially spared.'),
    (v_case_id, 'What is the standard treatment for a low-grade laryngeal chondrosarcoma?', '["Radiation therapy","Surgical excision with preservation of laryngeal function if possible (e.g., partial laryngectomy or cricoid resection)","Chemotherapy","None"]', 1, 'Chondrosarcomas are highly radioresistant; surgical removal is the only effective treatment.');

    ---------------------------------------------------------------------------
    -- CASE 31: Granular Cell Tumor of Larynx
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Granular Cord' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Granular Cord', 'A 40-year-old African American female presents with mild hoarseness. She has no history of smoking.

Vitals: Normal.
Physical Examination: Laryngoscopy reveals a small, firm, yellowish-pink, broadly sessile mass on the posterior aspect of the true vocal fold.
Laboratory Results: Biopsy shows large polygonal cells with abundant granular eosinophilic cytoplasm. Immunohistochemistry is strongly positive for S-100 protein.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Granular Cell Tumor of Larynx', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'From what cell lineage do Granular Cell Tumors arise?', '["Squamous epithelium","Schwann cells (neural crest origin), which is why they are strongly S-100 positive","Muscle cells","None"]', 1, 'Despite the name, they are essentially a type of benign neural tumor.'),
    (v_case_id, 'What histologic finding in the overlying mucosa of a granular cell tumor can lead to a misdiagnosis of SCC?', '["Keratin pearls","Pseudoepitheliomatous hyperplasia (PEH)","Amyloid","None"]', 1, 'The benign tumor causes the overlying epithelium to grow wildly, mimicking invasive SCC if the biopsy is too superficial.'),
    (v_case_id, 'What is the treatment of choice?', '["Radiation","Conservative surgical excision","Chemotherapy","None"]', 1, 'They are almost always benign, and local excision is curative.');

    ---------------------------------------------------------------------------
    -- CASE 32: Myasthenia Gravis (Laryngeal)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fatigued Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fatigued Voice', 'A 35-year-old female presents with a voice that starts strong in the morning but becomes progressively weaker, breathy, and severely fatigued by the evening. She also notes occasional trouble swallowing and double vision at the end of the day.

Vitals: Normal.
Physical Examination: Laryngoscopy shows structurally normal vocal folds, but their movement becomes noticeably sluggish and weak after having her count aloud from 1 to 100.
Laboratory Results: Acetylcholine receptor (AChR) antibodies are positive.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Myasthenia Gravis (Laryngeal)', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiology of Myasthenia Gravis?', '["Viral infection","Autoimmune destruction of acetylcholine receptors at the neuromuscular junction","Demyelination","None"]', 1, 'This leads to the classic symptom of fatigable muscle weakness.'),
    (v_case_id, 'Why is laryngeal involvement in MG dangerous?', '["It causes cancer","Severe weakness of the laryngeal and pharyngeal muscles can lead to aspiration pneumonia and acute airway failure (Myasthenic crisis)","It causes bleeding","None"]', 1, 'Bulbar involvement (speech, swallowing) is a sign of potentially severe disease.'),
    (v_case_id, 'What class of medication is the first-line symptomatic treatment?', '["Antibiotics","Acetylcholinesterase inhibitors (e.g., Pyridostigmine)","Botox","None"]', 1, 'These drugs increase the amount of acetylcholine available at the neuromuscular junction, improving muscle strength.');

    ---------------------------------------------------------------------------
    -- CASE 33: Rheumatoid Arthritis of Cricoarytenoid Joint
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rheumatic Larynx' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rheumatic Larynx', 'A 55-year-old female with long-standing, severe Rheumatoid Arthritis (RA) with joint deformities presents with progressive hoarseness, throat pain, and mild inspiratory stridor.

Vitals: Stable.
Physical Examination: Laryngoscopy shows the vocal folds are immobile and fixed in a paramedian position. There is erythema and swelling over the arytenoid cartilages.
Laboratory Results: High titers of Rheumatoid Factor and anti-CCP.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rheumatoid Arthritis of Cricoarytenoid Joint', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does Rheumatoid Arthritis affect the larynx?', '["It attacks the nerves","The cricoarytenoid joint is a true diarthrodial synovial joint, making it a target for the autoimmune synovial inflammation of RA","It causes cancer","None"]', 1, 'Just like the joints in the hands, the cricoarytenoid joint can suffer acute synovitis and chronic fixation.'),
    (v_case_id, 'How can you clinically differentiate cricoarytenoid joint fixation from RLN paralysis?', '["You can''t","Direct palpation of the arytenoids under anesthesia (or CT imaging showing joint ankylosis); paralyzed folds are mobile if pushed, fixed joints are solid","Blood tests","None"]', 1, 'A paralyzed vocal cord still has a free-moving joint; an arthritic joint is ''frozen''.'),
    (v_case_id, 'What is the primary risk of bilateral cricoarytenoid joint fixation?', '["Coughing","Severe airway obstruction requiring a tracheostomy, as the fixed arytenoids cannot open the glottis","Bleeding","None"]', 1, 'If both joints fuse in the closed position, the airway is severely compromised.');

    ---------------------------------------------------------------------------
    -- CASE 34: Laryngeal Amyloidosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Apple-Green Cord' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Apple-Green Cord', 'A 60-year-old male presents with long-standing hoarseness. He has no history of smoking.

Vitals: Normal.
Physical Examination: Laryngoscopy reveals smooth, nodular, yellow-pink sub-mucosal masses involving the true and false vocal folds bilaterally.
Laboratory Results: Biopsy shows amorphous extracellular deposits. Congo red stain shows classic ''apple-green birefringence'' under polarized light.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Amyloidosis', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Laryngeal Amyloidosis typically composed of?', '["Cholesterol crystals","Extracellular deposition of insoluble fibrillar proteins, usually AL (amyloid light-chain) type in the larynx","Calcium","None"]', 1, 'It is the most common benign tumor of the larynx that is not of epithelial origin.'),
    (v_case_id, 'Is laryngeal amyloidosis usually part of systemic amyloidosis?', '["Always","No, it is usually a localized, primary disease of the larynx, though systemic workup is required to rule out Multiple Myeloma","Only in children","None"]', 1, 'Systemic workup includes serum and urine protein electrophoresis (SPEP/UPEP) and potentially bone marrow biopsy.'),
    (v_case_id, 'What is the standard treatment for symptomatic laryngeal amyloidosis?', '["Chemotherapy","Endoscopic surgical excision/laser vaporization to preserve voice and airway","Total laryngectomy","None"]', 1, 'Medical therapy is ineffective for localized amyloidosis; conservative surgical debulking is the mainstay.');

    ---------------------------------------------------------------------------
    -- CASE 35: Granulomatosis with Polyangiitis (Subglottic Stenosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wegener''s Airway' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wegener''s Airway', 'A 40-year-old male presents with progressively worsening stridor and dyspnea. He also reports a history of recurrent, bloody, crusting sinusitis and a recent diagnosis of glomerulonephritis.

Vitals: BP 140/90. O2 sat 94%.
Physical Examination: Severe biphasic stridor. Endoscopy reveals a circumferential, inflamed, and ulcerated narrowing of the subglottis.
Laboratory Results: c-ANCA (PR3-ANCA) is markedly elevated.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Granulomatosis with Polyangiitis (Subglottic Stenosis)', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Subglottic stenosis is a classic, potentially life-threatening airway manifestation of which autoimmune vasculitis?', '["Lupus","Granulomatosis with Polyangiitis (formerly Wegener''s granulomatosis)","Rheumatoid Arthritis","None"]', 1, 'It occurs in up to 20% of GPA patients and can occur even when systemic disease is in remission.'),
    (v_case_id, 'What is the classic triad of Granulomatosis with Polyangiitis?', '["Liver, Heart, Brain","Upper respiratory tract (sinusitis, saddle nose, subglottic stenosis), Lower respiratory tract (lung nodules), and Kidneys (glomerulonephritis)","Skin, Bones, Joints","None"]', 1, 'This is a systemic necrotizing granulomatous vasculitis.'),
    (v_case_id, 'What is a common local surgical intervention for GPA-induced subglottic stenosis?', '["Total laryngectomy","Endoscopic balloon dilation with intralesional steroid injection to manage the scar","Nothing","None"]', 1, 'Open surgery (like cricotracheal resection) is extremely high-risk while the inflammatory disease is active.');

    ---------------------------------------------------------------------------
    -- CASE 36: Relapsing Polychondritis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Floppy Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Floppy Ear', 'A 45-year-old male presents with stridor, hoarseness, and anterior neck pain. He also complains that both of his ears are red, swollen, and severely painful, but notably, his earlobes are completely normal.

Vitals: Temp 99.5F.
Physical Examination: Bilateral auricular chondritis (sparing the non-cartilaginous lobule). The nose shows a slight ''saddle'' deformity. Laryngoscopy shows diffuse swelling and collapse of the laryngeal cartilages.
Laboratory Results: ESR and CRP are highly elevated.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Relapsing Polychondritis', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What tissue is targeted by the autoimmune attack in Relapsing Polychondritis?', '["Muscle","Cartilage (specifically type II collagen), affecting the ears, nose, larynx, and trachea","Bone","None"]', 1, 'The sparing of the earlobule (which has no cartilage) is the classic clinical sign differentiating it from cellulitis.'),
    (v_case_id, 'Why is laryngeal and tracheal involvement the most common cause of death in this disease?', '["It causes cancer","Destruction of the supporting cartilaginous rings leads to severe tracheomalacia and fatal airway collapse","It causes bleeding","None"]', 1, 'The airway loses its structural integrity and collapses during respiration.'),
    (v_case_id, 'What is the mainstay of medical therapy for acute flares?', '["Antibiotics","High-dose systemic corticosteroids and immunosuppressants","Surgery","None"]', 1, 'Aggressive immunosuppression is required to stop the destruction of the cartilage.');

    ---------------------------------------------------------------------------
    -- CASE 37: Thermal Laryngeal Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thermal Burn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thermal Burn', 'A 30-year-old male firefighter is brought to the ED after being trapped in a burning building for 20 minutes. He has singed nasal hairs, soot in his mouth, and a hoarse voice.

Vitals: O2 sat 92%. RR 26.
Physical Examination: Mild stridor. Awake fiberoptic intubation is performed immediately. Direct laryngoscopy during intubation shows massive, blistering edema of the supraglottis and vocal folds.
Laboratory Results: Carboxyhemoglobin is elevated at 15%.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Thermal Laryngeal Injury', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is early, preemptive intubation critical in cases of suspected thermal or inhalational laryngeal injury?', '["To give oxygen","Laryngeal edema can progress incredibly rapidly, transforming a patent airway into a complete obstruction within minutes to hours","To clean the lungs","None"]', 1, 'Once severe edema sets in, intubation becomes impossible, requiring a surgical airway.'),
    (v_case_id, 'What clinical signs strongly indicate a high risk for impending airway obstruction in a burn patient?', '["Arm burns","Singed facial/nasal hair, soot in the oropharynx, hoarseness, stridor, and burns occurring in an enclosed space","Leg burns","None"]', 1, 'These are absolute indications for immediate airway evaluation and securing.'),
    (v_case_id, 'Unlike steam burns, why does dry heat (flame) rarely cause severe burns to the lower trachea and lungs?', '["It goes around the lungs","The upper airway (nose, mouth, larynx) is highly efficient at absorbing dry heat, shielding the lower airway; steam, however, holds 4000x more heat capacity and easily burns the lungs","The lungs are immune","None"]', 1, 'Dry heat burns the larynx; steam burns the alveoli.');

    ---------------------------------------------------------------------------
    -- CASE 38: Laryngeal Cleft
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cleft Larynx' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cleft Larynx', 'A newborn infant presents with severe choking, coughing, and cyanosis every time he feeds. He also has a weak, breathy cry.

Vitals: O2 sat drops to 80% during feeds.
Physical Examination: Aspiration is evident. Flexible laryngoscopy reveals a defect in the interarytenoid space, creating an open communication between the posterior larynx and the anterior esophagus.
Laboratory Results: Barium swallow confirms massive aspiration through a laryngeal defect.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Cleft', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What embryologic failure leads to a laryngeal cleft?', '["Failure of the branchial arches to fuse","Failure of the tracheoesophageal septum to fuse properly during early gestation","Failure of the palate to fuse","None"]', 1, 'This leaves a gap between the airway and the digestive tract, allowing food to spill directly into the lungs.'),
    (v_case_id, 'What is the classic presentation of a laryngeal cleft?', '["Ear pain","Feeding difficulties, choking, recurrent aspiration pneumonia, and a weak cry","Nosebleeds","None"]', 1, 'The severity depends on the depth of the cleft (Benjamin-Inglis classification, Types I-IV).'),
    (v_case_id, 'How is a Type I (supraglottic, involving only the interarytenoid muscle) laryngeal cleft typically repaired?', '["Total laryngectomy","Endoscopic surgical closure","Observation only","None"]', 1, 'Advances in endoscopic surgery allow for minimally invasive repair of less severe clefts.');

    ---------------------------------------------------------------------------
    -- CASE 39: Essential Tremor of Voice
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Trembling Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Trembling Voice', 'A 70-year-old female presents with a ''shaky'' and ''quivering'' voice that has gradually worsened over 10 years. She also has a noticeable tremor in her hands when reaching for a cup. Her voice improves slightly after drinking a glass of wine.

Vitals: Normal.
Physical Examination: Laryngoscopy reveals a rhythmic, involuntary oscillation of the entire larynx and vocal folds during prolonged phonation of the vowel ''E''.
Laboratory Results: None.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Essential Tremor of Voice', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the neurologic hallmark of Essential Tremor in the larynx?', '["Vocal cord paralysis","A rhythmic, 4-8 Hz involuntary tremor of the laryngeal musculature during phonation","Spasms","None"]', 1, 'It is an action tremor, meaning it occurs during use of the voice, not at rest.'),
    (v_case_id, 'How does Essential Tremor of the voice differ from Spasmodic Dysphonia?', '["It is the same","Essential Tremor is rhythmic and regular, while Spasmodic Dysphonia causes irregular, unpredictable voice breaks and spasms","It only affects men","None"]', 1, 'A patient can have both, but the rhythmic shaking is classic for ET.'),
    (v_case_id, 'What classic patient-reported factor temporarily improves Essential Tremor?', '["Caffeine","Alcohol consumption","Stress","None"]', 1, 'This is a classic historical clue for diagnosing Essential Tremor.');

    ---------------------------------------------------------------------------
    -- CASE 40: Muscle Tension Dysphonia (MTD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tense Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tense Neck', 'A 30-year-old female call-center employee presents with a severe ache in her neck and a strained, raspy voice. She reports immense stress at work. Her voice improves significantly on the weekends.

Vitals: Normal.
Physical Examination: Palpation of the anterior neck reveals extreme tenderness and tightness over the strap muscles and hyoid bone. Laryngoscopy shows structurally perfectly normal vocal folds, but she squeezes her false vocal folds together (supraglottic hyperfunction) when she tries to speak.
Laboratory Results: None.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Muscle Tension Dysphonia (MTD)', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Primary Muscle Tension Dysphonia?', '["A brain tumor","A functional voice disorder characterized by excessive tension in the paralaryngeal and laryngeal muscles, without any underlying structural or neurologic abnormality","A viral infection","None"]', 1, 'The larynx is physically fine, but the muscles are being misused and overworked.'),
    (v_case_id, 'What is the standard, highly effective treatment for Primary MTD?', '["Surgery","Voice therapy (Voice rehabilitation with a Speech-Language Pathologist) to relearn relaxed phonation techniques","Antibiotics","None"]', 1, 'Techniques like laryngeal massage (circumferential manual laryngeal therapy) can often instantly restore a normal voice.'),
    (v_case_id, 'How does MTD differ from Adductor Spasmodic Dysphonia?', '["MTD hurts","MTD is constant across all tasks (whispering, singing, speaking) and involves continuous squeezing; Spasmodic Dysphonia is task-specific (speech only) with irregular spasms","They are identical","None"]', 1, 'MTD is a behavioral response to stress or compensation; Spasmodic Dysphonia is a neurologic dystonia.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vocal Fold Epidermoid Cyst
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Submucosal Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Submucosal Cyst', 'A 28-year-old female school teacher presents with chronic, moderate hoarseness. Voice therapy has provided minimal improvement.

Vitals: Normal.
Physical Examination: Laryngoscopy with stroboscopy shows a unilateral, yellowish, submucosal swelling on the mid-portion of the left true vocal fold. There is significantly decreased mucosal wave over the lesion.
Laboratory Results: Excision and biopsy reveal a squamous epithelium-lined sac filled with keratin debris.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Fold Epidermoid Cyst', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where do vocal fold cysts typically arise?', '["In the muscle","Within the superficial lamina propria, tethered to the vocal ligament or overlying mucosa","On the cartilage","None"]', 1, 'Because they are tethered, they severely disrupt the normal mucosal wave during phonation.'),
    (v_case_id, 'How does a cyst often differ from a nodule clinically?', '["Cysts are usually bilateral","Cysts are typically unilateral, deeper, and do not respond well to voice therapy alone, whereas nodules are bilateral and respond well to therapy","They are the same","None"]', 1, 'Cysts require surgical excision for resolution.'),
    (v_case_id, 'What surgical technique is critical when removing a vocal fold cyst?', '["Laser ablation","Making a micro-flap incision and carefully dissecting the cyst wall intact, without injuring the underlying vocal ligament","Stripping the cord","None"]', 1, 'If the cyst ruptures or the ligament is scarred, severe permanent hoarseness can result.');

    ---------------------------------------------------------------------------
    -- CASE 42: Parkinson's Disease Dysphonia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Parkinsonian Whisper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Parkinsonian Whisper', 'A 72-year-old male with long-standing Parkinson''s disease complains that his family can no longer hear him. His speech is very rapid, mumbled, and extremely quiet (hypophonic).

Vitals: Normal.
Physical Examination: Resting tremor and bradykinesia. Laryngoscopy shows normal, mobile vocal folds, but they do not close forcefully during speech (glottic bowing).
Laboratory Results: None.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Parkinson''s Disease Dysphonia', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic speech pattern in Parkinson''s disease called?', '["Spastic dysarthria","Hypokinetic dysarthria (characterized by soft, monotonous, rapid, and breathy speech)","Ataxic dysarthria","None"]', 1, 'The basal ganglia dysfunction leads to a poverty of movement, affecting the respiratory and laryngeal muscles.'),
    (v_case_id, 'Why do Parkinson''s patients speak so quietly?', '["They are deaf","Rigidity and bradykinesia prevent them from generating sufficient subglottic air pressure and forceful vocal fold closure","Their vocal cords are paralyzed","None"]', 1, 'They literally lack the muscle dynamics to project their voice.'),
    (v_case_id, 'What specific voice therapy program is highly effective for Parkinson''s dysphonia?', '["Whisper therapy","Lee Silverman Voice Treatment (LSVT LOUD), which focuses on intensive, high-effort voice exercises to ''recalibrate'' their perception of loudness","Botox","None"]', 1, 'LSVT forces the patient to use ''maximum effort'' to overcome the rigidity.');

    ---------------------------------------------------------------------------
    -- CASE 43: Amyotrophic Lateral Sclerosis (Bulbar Onset)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The ALS Larynx' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The ALS Larynx', 'A 60-year-old male presents with progressively slurred speech, a harsh, strained voice, and difficulty swallowing. He has noted weakness in his hands. He frequently chokes on liquids.

Vitals: Normal.
Physical Examination: Tongue fasciculations are visible. Laryngoscopy shows sluggish, spastic vocal fold movements with pooling of saliva in the pyriform sinuses.
Laboratory Results: EMG shows widespread acute and chronic denervation.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Amyotrophic Lateral Sclerosis (Bulbar Onset)', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What characterizes the speech pattern of bulbar-onset ALS?', '["Whispering","A mixed flaccid-spastic dysarthria (harsh, strained, slow, and hypernasal speech)","Stuttering","None"]', 1, 'ALS affects both upper and lower motor neurons, causing a combination of spasticity and flaccid weakness.'),
    (v_case_id, 'Why is pooling of secretions in the pyriform sinuses a dangerous sign?', '["It causes bad breath","It indicates severe pharyngeal weakness and a high risk of aspiration pneumonia","It causes throat pain","None"]', 1, 'Aspiration pneumonia is a leading cause of death in ALS.'),
    (v_case_id, 'What finding on oral examination strongly points toward lower motor neuron bulbar involvement?', '["Large tonsils","Tongue atrophy and fasciculations (twitches)","Geographic tongue","None"]', 1, 'The hypoglossal nucleus degenerates, leading to denervation of the tongue.');

    ---------------------------------------------------------------------------
    -- CASE 44: Caustic Laryngeal Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Suicidal Drink' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Suicidal Drink', 'A 25-year-old female is brought to the ED after intentionally ingesting a bottle of industrial drain cleaner (lye). She is drooling, unable to speak, and stridorous.

Vitals: HR 120, BP 90/60.
Physical Examination: Severe burns and edema of the lips, oral cavity, and pharynx. Flexible laryngoscopy shows massive necrosis and edema of the epiglottis and arytenoids, severely narrowing the airway.
Laboratory Results: None.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Caustic Laryngeal Injury', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority in managing severe caustic ingestion with airway symptoms?', '["Induce vomiting","Secure the airway immediately via intubation or tracheostomy, as laryngeal edema can progress to complete obstruction rapidly","Give oral neutralizers","None"]', 1, 'Never induce vomiting or give neutralizers, as this causes a second pass of the chemical or an exothermic reaction that worsens the burn.'),
    (v_case_id, 'Why are alkaline agents (like drain cleaner) more destructive to tissue than acids?', '["They aren''t","Alkalis cause liquefaction necrosis, penetrating deep into tissues; acids cause coagulation necrosis, which forms a scab that limits deeper penetration","They are hotter","None"]', 1, 'Liquefaction necrosis causes severe full-thickness burns to the esophagus and airway.'),
    (v_case_id, 'What is a major long-term laryngeal complication if the patient survives?', '["Cancer","Severe, intractable laryngeal and esophageal strictures/stenosis requiring lifelong dilations or reconstructive surgery","Voice improvement","None"]', 1, 'The intense scarring essentially obliterates the normal lumen.');

    ---------------------------------------------------------------------------
    -- CASE 45: Laryngeal Web
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Webbed Vocal Folds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Webbed Vocal Folds', 'A 6-month-old infant has had a weak, abnormal cry since birth and mild stridor. He has no feeding difficulties.

Vitals: Normal.
Physical Examination: Flexible laryngoscopy reveals a thick, fibrous band of tissue connecting the anterior third of the true vocal folds.
Laboratory Results: Genetic testing reveals a 22q11.2 microdeletion.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Laryngeal Web', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What embryologic failure causes a congenital laryngeal web?', '["Too much cartilage","Failure of the laryngeal lumen to completely recanalize during the 10th week of gestation","A viral infection","None"]', 1, 'The larynx starts as a solid tube and must hollow out; incomplete hollowing leaves a web.'),
    (v_case_id, 'Where do congenital laryngeal webs almost universally occur?', '["Posterior glottis","The anterior glottis (connecting the anterior vocal folds)","The epiglottis","None"]', 1, 'Acquired webs (from trauma or surgery) can occur anywhere, but congenital webs are anterior.'),
    (v_case_id, 'What genetic syndrome is strongly associated with anterior laryngeal webs?', '["Down Syndrome","Velocardiofacial Syndrome / DiGeorge Syndrome (22q11.2 deletion)","Turner Syndrome","None"]', 1, 'Any child diagnosed with a congenital web should be evaluated for this syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 46: Sulcus Vocalis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Groove' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Groove', 'A 30-year-old male presents with a lifelong history of a weak, breathy, ''veiled'' voice. He has never smoked or abused his voice.

Vitals: Normal.
Physical Examination: Laryngoscopy with stroboscopy reveals a distinct longitudinal linear depression (groove) running along the medial edge of both true vocal folds. The mucosal wave is severely reduced over the grooves.
Laboratory Results: None.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sulcus Vocalis', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Sulcus Vocalis?', '["A cancerous tumor","A structural focal invagination or groove in the epithelium of the vocal fold that adheres to the underlying vocal ligament","A polyp","None"]', 1, 'Because the epithelium is stuck to the ligament, it cannot vibrate freely, destroying the mucosal wave.'),
    (v_case_id, 'How does Sulcus Vocalis typically present clinically?', '["Stridor","Lifelong mild-to-moderate hoarseness, vocal fatigue, and a breathy voice due to glottic insufficiency (the folds cannot close completely around the groove)","Bleeding","None"]', 1, 'The lack of vibration and incomplete closure cause the classic voice.'),
    (v_case_id, 'Why is surgical treatment of Sulcus Vocalis notoriously difficult?', '["It bleeds","Surgically freeing the adherent epithelium from the ligament without destroying the vocal fold is technically challenging and often yields unpredictable voice outcomes","It is contagious","None"]', 1, 'Voice therapy is often used first, followed by surgical slicing or augmentation techniques if needed.');

    ---------------------------------------------------------------------------
    -- CASE 47: Saccular Cyst
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swelling Saccule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swelling Saccule', 'A 2-month-old infant presents with worsening stridor and difficulty breathing. The stridor is not position-dependent.

Vitals: RR 40. O2 sat 94%.
Physical Examination: Laryngoscopy reveals a large, smooth, fluid-filled, submucosal cyst arising from the laryngeal ventricle, bulging into the airway and obscuring the vocal folds.
Laboratory Results: None.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Saccular Cyst', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the difference between a Saccular Cyst and a Laryngocele?', '["No difference","A saccular cyst is a completely closed sac filled with mucus (the orifice of the saccule is obstructed); a laryngocele is open and filled with air","Cysts are cancerous","None"]', 1, 'Because it is fluid-filled and closed, a saccular cyst does not deflate and frequently causes airway obstruction in infants.'),
    (v_case_id, 'What is the immediate management for a saccular cyst causing respiratory distress?', '["Observation","Endoscopic surgical marsupialization or excision of the cyst to open the airway","Antibiotics","None"]', 1, 'The fluid must be drained and the cyst wall removed or opened widely so it does not re-accumulate.'),
    (v_case_id, 'Where is the laryngeal ventricle (from which the saccule arises) located?', '["Below the vocal folds","Between the true vocal folds (inferiorly) and the false vocal folds (superiorly)","Above the epiglottis","None"]', 1, 'The saccule is an upward extension from the anterior ventricle.');

    ---------------------------------------------------------------------------
    -- CASE 48: Penetrating Laryngeal Trauma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neck Stab' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neck Stab', 'A 22-year-old male is brought to the ED with a stab wound to the anterior neck, just above the thyroid cartilage. Blood is bubbling from the wound, and he has severe stridor.

Vitals: HR 120, BP 100/60.
Physical Examination: Active bubbling of air and blood from the neck wound. He is pale and struggling to breathe.
Laboratory Results: None.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Penetrating Laryngeal Trauma', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does ''bubbling'' from a neck wound definitively indicate?', '["An artery is cut","The aerodigestive tract (trachea or larynx) has been penetrated, allowing air to escape through the skin","A vein is cut","None"]', 1, 'This is a ''hard sign'' of airway injury requiring immediate surgical exploration.'),
    (v_case_id, 'What is the safest way to secure the airway in this patient?', '["Blind rapid sequence intubation","Awake tracheostomy or intubation directly through the open traumatic wound if necessary","Wait for anesthesia","None"]', 1, 'Standard endotracheal intubation can push blood/clots into the lungs or complete a partial tracheal transection.'),
    (v_case_id, 'What structures define ''Zone II'' of the neck, where this injury occurred?', '["Clavicle to cricoid","Cricoid cartilage to the angle of the mandible","Angle of mandible to skull base","None"]', 1, 'Zone II contains the most accessible and critical structures, including the carotid sheath and larynx/trachea.');

    ---------------------------------------------------------------------------
    -- CASE 49: Hoarseness Summary (Review)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Laryngeal Summary' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Laryngeal Summary', 'A 4th-year medical student is reviewing high-yield laryngeal conditions before a shelf exam.

Vitals: Caffeinated.
Physical Examination: Reviewing notes.
Laboratory Results: None.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hoarseness Summary (Review)', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A patient with a ''hot potato'' voice, drooling, and sitting in the tripod position likely has what?', '["Vocal nodules","Acute Epiglottitis","LPR","None"]', 1, 'Classic presentation of supraglottitis/epiglottitis.'),
    (v_case_id, 'A professional singer with bilateral, symmetric mid-cord lesions likely has what?', '["Cancer","Vocal Fold Nodules","Granulomas","None"]', 1, 'Classic phonotrauma lesions at the point of maximum strike force.'),
    (v_case_id, 'A patient with hoarseness, an unremitting cough, and apical cavitary lung lesions likely has what?', '["SCC","Laryngeal Tuberculosis","Polyps","None"]', 1, 'TB of the larynx is almost always secondary to severe pulmonary TB.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vocal Cord Paralysis (Review)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Final Polish' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Final Polish', 'A 4th-year medical student is reviewing vocal cord paralysis.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: None.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vocal Cord Paralysis (Review)', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve loops under the aortic arch on the left, making it highly susceptible to injury from thoracic surgery or masses?', '["Superior laryngeal nerve","Left recurrent laryngeal nerve","Vagus nerve trunk","None"]', 1, 'This is why left vocal cord paralysis is much more common than right.'),
    (v_case_id, 'What is the primary symptom of UNILATERAL vocal cord paralysis?', '["Stridor","Breathy, weak voice and aspiration risk","No symptoms","None"]', 1, 'The paralyzed cord leaves a gap, allowing air and liquids to escape.'),
    (v_case_id, 'What is the primary symptom of BILATERAL vocal cord paralysis?', '["Perfect voice","Severe stridor and airway obstruction","Deafness","None"]', 1, 'Both cords rest near the midline, choking off the airway.');

END $$;
COMMIT;
