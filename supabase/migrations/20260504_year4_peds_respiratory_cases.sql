BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Pediatric Respiratory Disorders
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-respiratory' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-respiratory" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Croup - Laryngotracheobronchitis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Barking in the Night' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Barking in the Night', 'A 2-year-old child presents at 2 AM with a barking cough and inspiratory stridor that is audible when he is agitated.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-year-old child presents at 2 AM with a barking cough and inspiratory stridor that is audible when he is agitated.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Epiglottitis", "Croup (Laryngotracheobronchitis)", "Asthma", "Foreign Body"]', 1, 'Barking cough and inspiratory stridor are classic for Croup.'),
    (v_case_id, 'What is the classic radiographic finding associated with this condition?', '["Thumbprint sign", "Steeple sign (subglottic narrowing)", "Ground glass", "None"]', 1, 'The narrowing of the trachea below the vocal cords creates the appearance of a church steeple on AP neck X-ray.'),
    (v_case_id, 'What is the first-line medical treatment for mild Croup?', '["Antibiotics", "Single dose of oral Dexamethasone", "Inhaled Albuterol", "None"]', 1, 'Steroids reduce airway edema and improve outcomes even in mild cases.');

    ---------------------------------------------------------------------------
    -- CASE 02: Epiglottitis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Toxic Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Toxic Child', 'A 4-year-old is sitting in the \"tripod\" position, drooling, and has a high fever. He appears very toxic.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old is sitting in the \"tripod\" position, drooling, and has a high fever. He appears very toxic.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Croup", "Epiglottitis", "Retropharyngeal Abscess", "None"]', 1, 'Tripod positioning and drooling are red flags for epiglottitis.'),
    (v_case_id, 'What is the immediate priority in management?', '["Get a neck X-ray", "Secure the airway in a controlled environment (OR)", "Give IV antibiotics", "None"]', 1, 'Airway stabilization is the absolute priority; do not agitate the child with exams or X-rays.'),
    (v_case_id, 'What organism was the primary cause before the Hib vaccine?', '["Staph aureus", "Haemophilus influenzae type b", "Strep pyogenes", "None"]', 1, 'Hib was the dominant cause; it is now rare but other bacteria (Staph/Strep) can cause it.');

    ---------------------------------------------------------------------------
    -- CASE 03: Bronchiolitis - RSV (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Winter Wheezing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Winter Wheezing', 'An 8-month-old infant has a 3-day history of runny nose and cough, now presenting with tachypnea and diffuse wheezing.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-month-old infant has a 3-day history of runny nose and cough, now presenting with tachypnea and diffuse wheezing.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common viral cause of bronchiolitis?', '["Influenza", "Respiratory Syncytial Virus (RSV)", "Parainfluenza", "None"]', 1, 'RSV causes seasonal outbreaks of bronchiolitis in infants.'),
    (v_case_id, 'What is the mainstay of treatment for a typical case of bronchiolitis?', '["Antibiotics", "Supportive care (suctioning and hydration)", "Inhaled Albuterol", "Steroids"]', 1, 'Evidence shows that bronchodilators and steroids are generally not effective for the first episode of bronchiolitis.'),
    (v_case_id, 'Which infants are at high risk for severe disease and may receive palivizumab prophylaxis?', '["All infants", "Former preterms (< 29 weeks) and those with chronic lung/heart disease", "None", "Full-term infants"]', 1, 'Palivizumab is a monoclonal antibody used for high-risk populations.');

    ---------------------------------------------------------------------------
    -- CASE 04: Asthma - Acute Exacerbation (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Status Asthmaticus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Status Asthmaticus', 'A 7-year-old with known asthma presents with severe respiratory distress, accessory muscle use, and a \"silent chest\" on exam.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 7-year-old with known asthma presents with severe respiratory distress, accessory muscle use, and a \"silent chest\" on exam.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the \"silent chest\" signify?', '["Improvement", "Severe airway obstruction with minimal air movement", "Normal lung", "None"]', 1, 'The absence of wheezing in a struggling child is an ominous sign of impending respiratory failure.'),
    (v_case_id, 'What is the first-line pharmacological intervention?', '["Oral steroids", "Nebulized Albuterol and Ipratropium Bromide", "Antibiotics", "None"]', 1, 'Rapid bronchodilation is required.'),
    (v_case_id, 'What is a potentially life-saving IV medication for refractory status asthmaticus?', '["Calcium", "Magnesium Sulfate", "Lidocaine", "None"]', 1, 'Magnesium acts as a smooth muscle relaxant in the airways.');

    ---------------------------------------------------------------------------
    -- CASE 05: Cystic Fibrosis - Diagnosis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Salty Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Salty Baby', 'An infant has a history of meconium ileus at birth and is now having recurrent cough and greasy, foul-smelling stools.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Salty Baby', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the gold standard diagnostic test for Cystic Fibrosis?', '["Chest X-ray", "Sweat Chloride Test", "Sputum culture", "None"]', 1, 'A chloride concentration > 60 mEq/L is diagnostic of CF.'),
    (v_case_id, 'What gene is mutated in Cystic Fibrosis?', '["FBN1", "CFTR (Cystic Fibrosis Transmembrane Conductance Regulator)", "DMD", "None"]', 1, 'Mutations lead to defective chloride transport and thick secretions.'),
    (v_case_id, 'What is the most common mutation seen in CF patients?', '["G551D", "Delta F508", "R117H", "None"]', 1, 'The deletion of phenylalanine at position 508 is the most frequent mutation.');

    ---------------------------------------------------------------------------
    -- CASE 06: Foreign Body Aspiration (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Wheeze' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Wheeze', 'A 2-year-old child was playing with coins and suddenly developed a cough and localized wheezing on the right side.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-year-old child was playing with coins and suddenly developed a cough and localized wheezing on the right side.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Asthma", "Foreign Body Aspiration", "Pneumonia", "None"]', 1, 'Sudden onset and localized (unilateral) wheezing strongly suggest a foreign body.'),
    (v_case_id, 'Where is the most common location for an aspirated foreign body?', '["Left main bronchus", "Right main bronchus", "Esophagus", "Trachea"]', 1, 'The right main bronchus is wider and more vertical than the left.'),
    (v_case_id, 'What is the definitive diagnostic and therapeutic procedure?', '["Chest CT", "Rigid Bronchoscopy", "Antibiotics", "None"]', 1, 'Rigid bronchoscopy allows for both visualization and removal of the object.');

    ---------------------------------------------------------------------------
    -- CASE 07: Bacterial Pneumonia (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Focal Infiltrate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Focal Infiltrate', 'A 5-year-old has high fever, productive cough, and decreased breath sounds in the right lower lobe.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Focal Infiltrate', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common bacterial cause of CAP in children?', '["Staph aureus", "Streptococcus pneumoniae", "Mycoplasma", "None"]', 1, 'Pneumococcus is the leading cause of lobar pneumonia.'),
    (v_case_id, 'What is the first-line oral antibiotic for suspected bacterial pneumonia in a child?', '["Azithromycin", "High-dose Amoxicillin", "Ciprofloxacin", "None"]', 1, 'Amoxicillin provides excellent coverage for S. pneumoniae.'),
    (v_case_id, 'If a child with pneumonia develops a persistent fever despite 48 hours of antibiotics, what should be suspected?', '["Wrong diagnosis", "Parapneumonic effusion or Empyema", "Viral infection", "None"]', 1, 'Complications like fluid accumulation in the pleural space must be ruled out with imaging.');

    ---------------------------------------------------------------------------
    -- CASE 08: Atypical Pneumonia - Mycoplasma (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Walking Pneumonia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Walking Pneumonia', 'A 12-year-old has a persistent dry cough, low-grade fever, and diffuse crackles, but appears otherwise well.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Walking Pneumonia', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely organism?', '["Strep", "Mycoplasma pneumoniae", "RSV", "None"]', 1, 'Mycoplasma is the most common cause of \"atypical\" pneumonia in school-aged children and teens.'),
    (v_case_id, 'What is a common extra-pulmonary manifestation of Mycoplasma infection?', '["Heart block", "Erythema Multiforme or Stevens-Johnson Syndrome", "Liver failure", "None"]', 1, 'Mycoplasma can trigger various skin and hematologic reactions.'),
    (v_case_id, 'What is the treatment of choice for atypical pneumonia?', '["Amoxicillin", "Macrolides (e.g., Azithromycin)", "Gentamicin", "None"]', 1, 'Macrolides are effective against cell-wall-deficient organisms like Mycoplasma.');

    ---------------------------------------------------------------------------
    -- CASE 09: Pertussis - Whooping Cough (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paroxysmal Cough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paroxysmal Cough', 'A 3-month-old infant has repetitive coughing spells followed by a high-pitched inspiratory sound.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Paroxysmal Cough', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Viruses", "Bordetella pertussis", "Staph", "None"]', 1, 'Pertussis is a highly contagious bacterial infection.'),
    (v_case_id, 'What is a common finding on the CBC in children with pertussis?', '["Anemia", "Absolute Lymphocytosis", "Low platelets", "None"]', 1, 'Marked lymphocytosis is a classic (but non-specific) clue.'),
    (v_case_id, 'What is the primary goal of treating the patient with Macrolides after the cough has started?', '["Stop the cough", "Reduce transmissibility to others", "Prevent pneumonia", "None"]', 1, 'Antibiotics don''t usually shorten the cough phase once established but are vital for public health.');

    ---------------------------------------------------------------------------
    -- CASE 10: Laryngomalacia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Infant Stridor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Infant Stridor', 'A 4-week-old infant has noisy breathing (inspiratory stridor) that is worse when lying on his back and improves when prone.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-week-old infant has noisy breathing (inspiratory stridor) that is worse when lying on his back and improves when prone.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of congenital stridor?', '["Croup", "Laryngomalacia", "Vocal cord palsy", "None"]', 1, 'Laryngomalacia is due to floppiness of the supraglottic structures.'),
    (v_case_id, 'What is the typical natural history of laryngomalacia?', '["It gets worse", "It usually resolves spontaneously by 12-18 months of age", "It causes death", "None"]', 1, 'Most cases are benign and resolve as the cartilage matures.'),
    (v_case_id, 'What condition commonly exacerbates the stridor in laryngomalacia?', '["Hunger", "Gastroesophageal Reflux (GERD)", "Exercise", "None"]', 1, 'Acid reflux causes edema of the arytenoids, worsening the airway obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 11: RDS - Respiratory Distress Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Prematurity and Surfactant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Prematurity and Surfactant', 'A neonate born at 28 weeks gestation has grunting, flaring, and retractions immediately after birth.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate born at 28 weeks gestation has grunting, flaring, and retractions immediately after birth.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying cause of RDS?', '["Fluid in lungs", "Deficiency of Surfactant", "Infection", "None"]', 1, 'Surfactant reduces alveolar surface tension; without it, alveoli collapse (atelectasis).'),
    (v_case_id, 'What is the classic X-ray finding for RDS?', '["Large heart", "Diffuse ground-glass opacities and air bronchograms", "Snowman", "None"]', 1, 'The \"ground-glass\" appearance represents micro-atelectasis.'),
    (v_case_id, 'What medication given to the mother before delivery can reduce the risk of RDS?', '["Antibiotics", "Antenatal Corticosteroids (e.g., Betamethasone)", "Oxytocin", "None"]', 1, 'Steroids accelerate fetal lung maturity and surfactant production.');

    ---------------------------------------------------------------------------
    -- CASE 12: TTN - Transient Tachypnea of the Newborn (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The C-Section Lung' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The C-Section Lung', 'A full-term infant born via elective C-section has tachypnea (RR 80) but otherwise appears well.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A full-term infant born via elective C-section has tachypnea (RR 80) but otherwise appears well.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of TTN?', '["Missing surfactant", "Delayed clearance of fetal lung fluid", "Infection", "None"]', 1, 'Without the \"squeeze\" of labor, fluid remains in the lungs.'),
    (v_case_id, 'What is seen on X-ray in TTN?', '["Ground glass", "Fluid in the fissures and perihilar streaking", "Abscess", "None"]', 1, 'These findings represent the interstitial fluid being absorbed.'),
    (v_case_id, 'How long does TTN typically last?', '["Weeks", "Resolves within 24-72 hours", "Permanent", "None"]', 1, 'TTN is a self-limited condition with an excellent prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 13: Meconium Aspiration Syndrome - MAS (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pea-Soup Lungs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pea-Soup Lungs', 'A post-term infant born through thick meconium-stained fluid has immediate respiratory distress.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A post-term infant born through thick meconium-stained fluid has immediate respiratory distress.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is meconium harmful to the lungs?', '["It is nutritious", "It causes airway obstruction, chemical pneumonitis, and surfactant inactivation", "It is cold", "None"]', 1, 'Meconium is highly irritating and obstructive.'),
    (v_case_id, 'What is a common complication of MAS due to high pulmonary pressures?', '["Hypotension", "Persistent Pulmonary Hypertension of the Newborn (PPHN)", "Anemia", "None"]', 1, 'Mas can lead to right-to-left shunting across the ductus/foramen ovale.'),
    (v_case_id, 'What is the characteristic X-ray finding for MAS?', '["Ground glass", "Patchy, coarse infiltrates with areas of hyperinflation", "Clear lungs", "None"]', 1, 'The uneven obstruction leads to areas of atelectasis and air trapping.');

    ---------------------------------------------------------------------------
    -- CASE 14: Bronchopulmonary Dysplasia - BPD (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Chronic Lung Disease' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Chronic Lung Disease', 'A former 26-weeker is now 36 weeks post-menstrual age and still requires supplemental oxygen.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Lung Disease', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of BPD?', '["Asthma", "Requirement for supplemental oxygen at 36 weeks post-menstrual age in a preterm infant", "Cough", "None"]', 1, 'BPD is a consequence of oxygen toxicity and barotrauma to the immature lung.'),
    (v_case_id, 'What is the hallmark pathological finding in the \"New\" BPD?', '["Scarring", "Arrested alveolar development (fewer, larger alveoli)", "Mucus", "None"]', 1, 'Modern BPD is more about impaired development than inflammatory scarring.'),
    (v_case_id, 'What are these children at high risk for in the first 2 years of life?', '["Obesity", "Severe RSV bronchiolitis and hospital readmission", "Diabetes", "None"]', 1, 'Their limited reserve makes viral infections very dangerous.');

    ---------------------------------------------------------------------------
    -- CASE 15: Bacterial Tracheitis (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Croup that Failed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Croup that Failed', 'A 5-year-old was diagnosed with Croup but is now getting worse, has a high fever, and thick secretions.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 5-year-old was diagnosed with Croup but is now getting worse, has a high fever, and thick secretions.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Severe Croup", "Bacterial Tracheitis", "Asthma", "None"]', 1, 'Tracheitis is a bacterial superinfection of the trachea that mimics Croup but is more toxic.'),
    (v_case_id, 'What organism is most frequently implicated?', '["RSV", "Staphylococcus aureus", "Mycoplasma", "None"]', 1, 'S. aureus is the most common cause.'),
    (v_case_id, 'What is often seen in the tracheal lumen on X-ray?', '["Nothing", "Shaggy, irregular borders or membranes", "Clear air", "None"]', 1, 'The thick purulent secretions create an irregular tracheal appearance.');

    ---------------------------------------------------------------------------
    -- CASE 16: Retropharyngeal Abscess (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neck Pain and Drooling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neck Pain and Drooling', 'A 3-year-old has a high fever, refuses to eat, and holds his neck stiffly. He is drooling.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neck Pain and Drooling', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Epiglottitis", "Retropharyngeal Abscess", "Meningitis", "None"]', 1, 'The combination of fever, drooling, and stiff neck (torticollis) is classic for a deep neck space abscess.'),
    (v_case_id, 'How is the diagnosis usually confirmed initially?', '["Throat swab", "Lateral neck X-ray showing widened prevertebral space", "CT chest", "None"]', 1, 'Prevertebral widening > 50% of the vertebral body width is suspicious.'),
    (v_case_id, 'What is the definitive management for a large abscess?', '["Antibiotics alone", "Surgical incision and drainage", "Wait", "None"]', 1, 'Surgical drainage is often required to prevent airway obstruction or rupture.');

    ---------------------------------------------------------------------------
    -- CASE 17: Peritonsillar Abscess (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hot Potato Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hot Potato Voice', 'A teenager has severe sore throat, muffled voice, and uvular deviation to the left.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hot Potato Voice', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Streptococcal pharyngitis", "Peritonsillar Abscess (Quinsy)", "Epiglottitis", "None"]', 1, 'Uvular deviation away from the affected side is the hallmark.'),
    (v_case_id, 'What is the \"Hot Potato Voice\"?', '["Loud voice", "Muffled speech due to pain and soft palate swelling", "Deep voice", "None"]', 1, 'The patient sounds like they are holding a hot potato in their mouth.'),
    (v_case_id, 'What is trismus?', '["Eye twitching", "Inability to open the mouth fully due to muscle spasm", "Fever", "None"]', 1, 'Trismus is common in PTA due to irritation of the pterygoid muscles.');

    ---------------------------------------------------------------------------
    -- CASE 18: Obstructive Sleep Apnea - OSA (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Snoring and School Issues' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Snoring and School Issues', 'A 5-year-old snores loudly, has restless sleep, and is having behavioral problems in school.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Snoring and School Issues', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of OSA in children?', '["Obesity", "Adenotonsillar Hypertrophy", "Small chin", "None"]', 1, 'Unlike adults, lymphoid tissue enlargement is the primary driver in kids.'),
    (v_case_id, 'What is the definitive diagnostic test for OSA?', '["Physical exam", "Polysomnography (Sleep study)", "Chest X-ray", "None"]', 1, 'A sleep study quantifies the Apnea-Hypopnea Index (AHI).'),
    (v_case_id, 'What is the first-line treatment for pediatric OSA with large tonsils?', '["CPAP", "Adenotonsillectomy", "Weight loss", "None"]', 1, 'Surgery is curative in the majority of healthy children.');

    ---------------------------------------------------------------------------
    -- CASE 19: BRUE - Brief Resolved Unexplained Event (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue Spell' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue Spell', 'An infant had a 20-second episode of turning blue and limp, now back to baseline.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blue Spell', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this event called?', '["SIDS", "BRUE (Brief Resolved Unexplained Event)", "Seizure", "None"]', 1, 'Formerly known as ALTE (Apparent Life-Threatening Event).'),
    (v_case_id, 'What is a requirement for the event to be classified as a BRUE?', '["Ongoing symptoms", "No explained cause after thorough history and physical", "Lasts > 10 mins", "None"]', 1, 'It must be unexplained and completely resolved.'),
    (v_case_id, 'What is a feature of a \"Low Risk\" BRUE?', '["Born preterm", "Age > 60 days, first-time event, and no concerning findings", "Required CPR", "None"]', 1, 'Low risk babies often require minimal workup and observation.');

    ---------------------------------------------------------------------------
    -- CASE 20: SIDS Prevention (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Safe Sleep' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Safe Sleep', 'A mother asks about the best way to prevent Sudden Infant Death Syndrome (SIDS).', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Safe Sleep', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important position for sleep to prevent SIDS?', '["Side-lying", "Supine (Back to sleep)", "Prone (Tummy sleep)", "None"]', 1, 'Supine sleeping is the #1 modifiable risk factor.'),
    (v_case_id, 'What should NOT be in the infant''s crib?', '["A pacifier", "Soft bedding, pillows, or bumper pads", "A fitted sheet", "None"]', 1, 'Loose bedding increases the risk of suffocation.'),
    (v_case_id, 'What maternal habit is a major risk factor for SIDS?', '["Coffee", "Smoking during or after pregnancy", "Reading", "None"]', 1, 'Exposure to tobacco smoke is a significant SIDS risk.');

    ---------------------------------------------------------------------------
    -- CASE 21: Cystic Fibrosis - Lung Infection (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pseudomonas in CF' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pseudomonas in CF', 'A 10-year-old with CF has a pulmonary exacerbation with increased sputum production.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pseudomonas in CF', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common chronic colonizer in the CF lung as children age?', '["Staph", "Pseudomonas aeruginosa", "Influenza", "None"]', 1, 'Pseudomonas is the hallmark pathogen of the CF lung.'),
    (v_case_id, 'Why are CF patients prone to chronic infections?', '["They have no immune system", "Dehydrated, thick mucus impairs mucociliary clearance", "They eat too much", "None"]', 1, 'The \"sol\" layer is thin, trapping bacteria in a thick mucus \"gel\".'),
    (v_case_id, 'What is the goal of Chest Physiotherapy (CPT)?', '["To make them cough", "To mobilize and clear the thick secretions", "To exercise the heart", "None"]', 1, 'Airway clearance techniques are vital to preserving lung function.');

    ---------------------------------------------------------------------------
    -- CASE 22: Primary Ciliary Dyskinesia - PCD (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mirror Image' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mirror Image', 'A child has recurrent pneumonia and situs inversus (heart on the right side).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mirror Image', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the syndrome with PCD and situs inversus?', '["Turner", "Kartagener Syndrome", "Down", "None"]', 1, 'A subset of PCD characterized by the triad of situs inversus, chronic sinusitis, and bronchiectasis.'),
    (v_case_id, 'What is the defect in PCD?', '["Mucus", "Abnormal ciliary structure and function (e.g., dynein arms)", "Antibodies", "None"]', 1, 'Cilia cannot beat properly to move mucus.'),
    (v_case_id, 'What is a potential long-term complication for males with PCD?', '["Diabetes", "Infertility (due to immotile sperm)", "Obesity", "None"]', 1, 'Sperm tails are modified cilia.');

    ---------------------------------------------------------------------------
    -- CASE 23: Tracheoesophageal Fistula - TEF (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bubbling and Choking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bubbling and Choking', 'A newborn infant has excessive drooling/bubbling and chokes during the first feed.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bubbling and Choking', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pyloric stenosis", "Esophageal Atresia with TEF", "Reflux", "None"]', 1, 'Inability to pass a gastric tube is the hallmark diagnostic step.'),
    (v_case_id, 'What is the most common type of TEF?', '["H-type", "Distal TEF with proximal Esophageal Atresia (Type C)", "Pure Atresia", "None"]', 1, 'Over 85% of cases are this type.'),
    (v_case_id, 'What associated anomalies should be looked for in these infants?', '["VACTERL (Vertebral, Anal, Cardiac, TEF, Renal, Limb)", "None", "Brain holes", "None"]', 0, 'TEF is often part of a broader association of congenital defects.');

    ---------------------------------------------------------------------------
    -- CASE 24: Congenital Diaphragmatic Hernia - CDH (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Scaphoid Abdomen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Scaphoid Abdomen', 'A neonate has severe respiratory distress, a sunken (scaphoid) abdomen, and bowel sounds are heard in the chest.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate has severe respiratory distress, a sunken (scaphoid) abdomen, and bowel sounds are heard in the chest.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumothorax", "Congenital Diaphragmatic Hernia (CDH)", "TEF", "None"]', 1, 'The abdominal contents have herniated into the thoracic cavity.'),
    (v_case_id, 'What is the primary cause of respiratory failure in CDH?', '["Infection", "Pulmonary Hypoplasia and Pulmonary Hypertension", "Broken rib", "None"]', 1, 'The mass effect in utero prevents the lungs from developing normally.'),
    (v_case_id, 'Should you use bag-mask ventilation in a neonate with suspected CDH?', '["Yes", "No, it causes gastric inflation and further lung compression; intubate immediately", "Maybe", "None"]', 1, 'Bag-masking a CDH baby is a major clinical \"No-No\".');

    ---------------------------------------------------------------------------
    -- CASE 25: Exercise-Induced Bronchospasm (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Short-Winded Athlete' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Short-Winded Athlete', 'A 15-year-old athlete complains of chest tightness and cough only during sports.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Short-Winded Athlete', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Heart failure", "Exercise-Induced Bronchospasm (EIB)", "Pneumonia", "None"]', 1, 'Airway cooling and drying during rapid breathing trigger bronchoconstriction.'),
    (v_case_id, 'What is the first-line treatment for EIB?', '["Steroids", "Short-acting Beta-agonist (Albuterol) 15-30 mins before exercise", "Aspirin", "None"]', 1, 'SABAs prevent the reaction.'),
    (v_case_id, 'If EIB is the only symptom, is a daily controller needed?', '["Yes", "Usually no, but if it occurs more than once daily, consider stepping up", "Always", "None"]', 1, 'Management depends on frequency and overall asthma control.');

    ---------------------------------------------------------------------------
    -- CASE 26: Aspiration Pneumonia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Choking Episode' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Choking Episode', 'A child with cerebral palsy and severe reflux presents with a new fever and infiltrate on X-ray.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Choking Episode', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Croup", "Aspiration Pneumonia", "Asthma", "None"]', 1, 'Children with neurologic impairment are at high risk for aspiration.'),
    (v_case_id, 'Which lung lobe is most commonly involved in aspiration in the supine position?', '["Left lower lobe", "Right upper lobe (posterior segment)", "Right lower lobe", "None"]', 1, 'Gravity and bronchial anatomy favor this location.'),
    (v_case_id, 'What is the best way to prevent aspiration in a high-risk child?', '["Antibiotics", "Thickened fluids and upright positioning during feeds", "Coughing", "None"]', 1, 'Feeding modifications are the key to prevention.');

    ---------------------------------------------------------------------------
    -- CASE 27: Choanal Atresia (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cyclic Cyanosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cyclic Cyanosis', 'A neonate is pink when crying but turns blue when quiet or feeding.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A neonate is pink when crying but turns blue when quiet or feeding.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["TOF", "Choanal Atresia", "MAS", "None"]', 1, 'Neonates are obligate nose breathers; crying allows mouth breathing, which relieves the obstruction.'),
    (v_case_id, 'How do you test for this at the bedside?', '["Stethoscope", "Attempt to pass a small catheter through the nose into the pharynx", "Look in ears", "None"]', 1, 'Failure to pass the catheter is diagnostic.'),
    (v_case_id, 'What syndrome is associated with Choanal Atresia?', '["VACTERL", "CHARGE Syndrome", "Down", "None"]', 1, 'Coloboma, Heart defects, Atresia choanae, Retardation, Genital/Ear anomalies.');

    ---------------------------------------------------------------------------
    -- CASE 28: Empyema (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pus in the Chest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pus in the Chest', 'A child with pneumonia has a persistent fever and a large pleural effusion that is thick on ultrasound.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pus in the Chest', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Empyema?', '["Fluid in lung", "Purulent fluid (pus) in the pleural space", "Clear fluid", "None"]', 1, 'It is an infection of the pleural fluid itself.'),
    (v_case_id, 'What is the preferred management for a loculated empyema?', '["Antibiotics alone", "Chest tube drainage with fibrinolytics or VATS (Surgery)", "Observation", "None"]', 1, 'Removing the infected fluid and debris is necessary for recovery.'),
    (v_case_id, 'What organism is now a leading cause of empyema despite vaccination?', '["Hib", "Staph aureus (including MRSA) and resistant Strep pneumoniae", "RSV", "None"]', 1, 'The microbiology has shifted post-pneumococcal vaccine.');

    ---------------------------------------------------------------------------
    -- CASE 29: Tuberculosis in Children (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Positive TST' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Positive TST', 'A 4-year-old child from an endemic area has a TST (PPD) of 15 mm. He is asymptomatic.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Positive TST', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the next step for a positive TST in an asymptomatic child?', '["Treatment", "Chest X-ray to rule out active disease", "Repeat test", "None"]', 1, 'A clear X-ray in an asymptomatic patient confirms Latent TB Infection (LTBI).'),
    (v_case_id, 'Why are young children treated for LTBI more aggressively than adults?', '["They have more years to live", "Higher risk of progression to disseminated disease or TB meningitis", "They are small", "None"]', 1, 'The immature immune system cannot contain the infection as well.'),
    (v_case_id, 'What is the first-line treatment for LTBI?', '["Rifampin or Isoniazid (INH)", "Amoxicillin", "Cough syrup", "None"]', 0, 'Standard regimens involve months of mono-therapy.');

    ---------------------------------------------------------------------------
    -- CASE 30: Kartagener Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reversed Organs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reversed Organs', 'A 6-year-old with chronic ear infections and sinusitis has a heart heard on the right side.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reversed Organs', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical triad of Kartagener Syndrome?', '["Fever, Cough, Rash", "Situs Inversus, Bronchiectasis, and Sinusitis", "Blue, Limp, No breath", "None"]', 1, 'This is the most common form of PCD.'),
    (v_case_id, 'How do you test for ciliary function?', '["Nasal nitric oxide levels or Ciliary biopsy", "Blood test", "X-ray", "None"]', 0, 'Nasal NO is often very low in PCD.'),
    (v_case_id, 'What is the underlying genetic defect?', '["CFTR", "Dynein arm mutations", "Hemoglobin", "None"]', 1, 'The dynein arms provide the force for ciliary movement.');

    ---------------------------------------------------------------------------
    -- CASE 31: Pneumothorax (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Shortness of Breath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Shortness of Breath', 'A tall, thin 16-year-old male has sudden onset left-sided chest pain and dyspnea.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Shortness of Breath', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Heart attack", "Spontaneous Pneumothorax", "Pneumonia", "None"]', 1, 'Rupture of apical blebs is common in tall, thin adolescent males.'),
    (v_case_id, 'What is seen on X-ray?', '["Large heart", "Visible visceral pleural line with absence of lung markings peripherally", "Infiltrate", "None"]', 1, 'The lung collapses away from the chest wall.'),
    (v_case_id, 'What is the management for a small (< 2 cm) stable pneumothorax?', '["Chest tube", "Observation and supplemental oxygen", "Surgery", "None"]', 1, 'Oxygen helps the pleural air be absorbed faster.');

    ---------------------------------------------------------------------------
    -- CASE 32: Cystic Fibrosis - Nutrition (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Malabsorption' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Malabsorption', 'A child with CF is not gaining weight and has foul, oily stools.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Malabsorption', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of the oily stools (steatorrhea)?', '["Too much fat", "Pancreatic Insufficiency (thick mucus blocks enzyme secretion)", "Infection", "None"]', 1, 'The lack of lipase prevents fat digestion.'),
    (v_case_id, 'Which vitamins are CF patients at risk for lacking?', '["Vitamin C", "Fat-soluble vitamins (A, D, E, K)", "B vitamins", "None"]', 1, 'Fat malabsorption leads to deficiency of fat-soluble vitamins.'),
    (v_case_id, 'What is the treatment for pancreatic insufficiency?', '["Vitamins only", "Pancreatic Enzyme Replacement Therapy (PERT) with every meal", "Low fat diet", "None"]', 1, 'Taking enzymes with meals allows for nutrient absorption.');

    ---------------------------------------------------------------------------
    -- CASE 33: Asthma - Stepwise Therapy (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Daily Controller' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Daily Controller', 'An 8-year-old has asthma symptoms 3 days a week and wakes up twice a month at night.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Daily Controller', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classification of this patient''s asthma?', '["Intermittent", "Mild Persistent", "Moderate Persistent", "Severe"]', 1, 'Symptoms > 2 days/week but not daily = Mild Persistent.'),
    (v_case_id, 'What is the preferred first-line controller for persistent asthma?', '["Daily SABA", "Inhaled Corticosteroids (ICS)", "Oral steroids", "None"]', 1, 'Low-dose ICS is the gold standard for long-term control.'),
    (v_case_id, 'What is the most common side effect of inhaled steroids?', '["Weight gain", "Oral Candidiasis (Thrush)", "Stunted growth", "None"]', 1, 'Rinsing the mouth and using a spacer helps prevent thrush.');

    ---------------------------------------------------------------------------
    -- CASE 34: Laryngomalacia - Position (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Gravity Stridor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Gravity Stridor', 'A mother is worried because her baby''s noise gets louder when he is on his back.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Gravity Stridor', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is laryngomalacia worse in the supine position?', '["The baby is cold", "Gravity pulls the redundant epiglottis/arytenoids over the airway opening", "The tongue is big", "None"]', 1, 'When prone, gravity helps pull the tissue away from the glottis.'),
    (v_case_id, 'When is surgical intervention (supraglottoplasty) indicated?', '["Always", "In cases with severe failure to thrive, hypoxia, or cor pulmonale", "Never", "None"]', 1, 'Only severe, life-altering cases require surgery.'),
    (v_case_id, 'What is the sound quality of laryngomalacia?', '["Expiratory wheeze", "High-pitched, inspiratory stridor", "Barking", "None"]', 1, 'It is purely an inspiratory, upper-airway sound.');

    ---------------------------------------------------------------------------
    -- CASE 35: RSV Prevention (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Antibody Prophylaxis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Antibody Prophylaxis', 'A former 27-weeker is entering his first winter season.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Antibody Prophylaxis', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the RSV prophylaxis?', '["RSV vaccine", "Palivizumab", "Penicillin", "None"]', 1, 'It is an injectable monoclonal antibody given monthly.'),
    (v_case_id, 'Does palivizumab treat active RSV infection?', '["Yes", "No, it is for prevention only", "Maybe", "None"]', 1, 'It has no effect once the infection has started.'),
    (v_case_id, 'What is the primary goal of this therapy?', '["Prevent sniffles", "Reduce the rate of RSV-related hospitalization", "Kill the virus", "None"]', 1, 'It protects high-risk lungs from severe lower-airway disease.');

    ---------------------------------------------------------------------------
    -- CASE 36: Congenital Pulmonary Airway Malformation - CPAM (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cystic Lung Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cystic Lung Mass', 'A fetus was found to have a cystic mass in the left lung on prenatal ultrasound.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cystic Lung Mass', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pneumonia", "CPAM (Congenital Pulmonary Airway Malformation)", "Asthma", "None"]', 1, 'Formerly called CCAM, it is a developmental abnormality of the lung.'),
    (v_case_id, 'Why is CPAM often surgically removed?', '["It is ugly", "Risk of recurrent infection and a small risk of malignant transformation", "It will disappear", "None"]', 1, 'Resection is usually done in early childhood.'),
    (v_case_id, 'Does CPAM typically have a systemic blood supply?', '["Yes", "No, it is usually supplied by the pulmonary circulation (unlike sequestration)", "Yes", "None"]', 1, 'This distinguishes it from pulmonary sequestration.');

    ---------------------------------------------------------------------------
    -- CASE 37: Pulmonary Sequestration (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Non-Functional Lung' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Non-Functional Lung', 'An island of lung tissue is found to have a direct blood supply from the systemic aorta.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Non-Functional Lung', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["CPAM", "Pulmonary Sequestration", "TEF", "None"]', 1, 'A mass of lung tissue that does not communicate with the tracheobronchial tree.'),
    (v_case_id, 'What is the hallmark of sequestration?', '["Big size", "Systemic arterial blood supply", "It is blue", "None"]', 1, 'The artery usually arises from the aorta.'),
    (v_case_id, 'What is the difference between intralobar and extralobar?', '["Intralobar is inside the normal lung; extralobar has its own pleural sac", "Size", "Color", "None"]', 0, 'Extralobar is more common in neonates and often found with other anomalies.');

    ---------------------------------------------------------------------------
    -- CASE 38: Inhaler Technique (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Spacer use' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Spacer use', 'A parent is giving an inhaler directly into their 4-year-old''s mouth.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spacer use', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why should a child use a spacer (Valved Holding Chamber) with an MDI?', '["It looks better", "It improves drug delivery to the lungs and reduces oropharyngeal deposition", "It is easier to clean", "None"]', 1, 'Without a spacer, most of the medicine hits the back of the throat.'),
    (v_case_id, 'For a 2-year-old, what should be attached to the spacer?', '["A mouthpiece", "A face mask", "A tube", "None"]', 1, 'Infants and toddlers cannot coordinate breathing through a mouthpiece.'),
    (v_case_id, 'What is the most common reason for \"refractory\" asthma in children?', '["Bad genes", "Poor inhaler technique and medication non-adherence", "Allergies", "None"]', 1, 'Always review technique before increasing medication.');

    ---------------------------------------------------------------------------
    -- CASE 39: Chlamydia Pneumonia of Infancy (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Staccato Cough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Staccato Cough', 'A 6-week-old infant has a dry, machine-gun-like cough, no fever, and a history of \"red eyes\" at 2 weeks.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Staccato Cough', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the organism?', '["RSV", "Chlamydia trachomatis", "Strep", "None"]', 1, 'Acquired during birth; often starts with conjunctivitis and progresses to pneumonia.'),
    (v_case_id, 'What is the characteristic cough description?', '["Barking", "Staccato cough", "Whooping", "None"]', 1, 'Distinctive, repetitive coughing spells without a whoop.'),
    (v_case_id, 'What is the classic lab finding on CBC?', '["Anemia", "Eosinophilia", "Low WBC", "None"]', 1, 'Peripheral eosinophilia is common in Chlamydia pneumonia.');

    ---------------------------------------------------------------------------
    -- CASE 40: Spirometry in Children (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing the Lungs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing the Lungs', 'A 5-year-old is asked to perform a breathing test.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Testing the Lungs', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age can most children reliably perform spirometry?', '["2 years", "5-6 years", "12 years", "None"]', 1, 'Spirometry requires cooperation and specific maneuvers that younger children cannot follow.'),
    (v_case_id, 'What finding on spirometry defines an obstructive disease like asthma?', '["Low FVC", "Reduced FEV1/FVC ratio", "High FEV1", "None"]', 1, 'Obstruction prevents rapid air expulsion.'),
    (v_case_id, 'What constitutes a positive bronchodilator response?', '["No change", "An increase in FEV1 by > 12%", "Decrease in FVC", "None"]', 1, 'Reversibility is a hallmark of asthma.');

    ---------------------------------------------------------------------------
    -- CASE 41: Pleural Effusion (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dullness to Percussion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dullness to Percussion', 'A child with pneumonia has decreased breath sounds and dullness to percussion on the right.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dullness to Percussion', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause?', '["Pneumothorax", "Pleural Effusion", "Asthma", "None"]', 1, 'Dullness is characteristic of fluid; hyperresonance is characteristic of air.'),
    (v_case_id, 'What X-ray view is best for detecting a small amount of pleural fluid?', '["AP", "Lateral decubitus (lying on the side)", "Oblique", "None"]', 1, 'Fluid will layer out along the chest wall in decubitus view.'),
    (v_case_id, 'What is a parapneumonic effusion?', '["Fluid due to cancer", "An effusion that occurs as a complication of an adjacent bacterial pneumonia", "Rain", "None"]', 1, 'Most pediatric effusions are related to pneumonia.');

    ---------------------------------------------------------------------------
    -- CASE 42: Chronic Cough (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The 4-Week Cough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The 4-Week Cough', 'A 6-year-old has been coughing for over a month.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The 4-Week Cough', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of a \"chronic\" cough in a child?', '["1 week", "Greater than 4 weeks", "6 months", "None"]', 1, 'Cough lasting > 4 weeks warrants further investigation.'),
    (v_case_id, 'What is a common cause of isolated chronic night-time cough?', '["Heart failure", "Cough-variant asthma", "TV", "None"]', 1, 'Asthma often presents only as a cough, especially at night or with exercise.'),
    (v_case_id, 'What does a \"honking\" or \"barking\" cough only while awake suggest?', '["Croup", "Habit (Psychogenic) Cough", "Epiglottitis", "None"]', 1, 'A loud cough that disappears during sleep is often psychogenic.');

    ---------------------------------------------------------------------------
    -- CASE 43: RDS - Surfactant Therapy (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Exogenous Surfactant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Exogenous Surfactant', 'A preterm infant is intubated for severe RDS.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Exogenous Surfactant', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is exogenous surfactant administered?', '["IV", "Endotracheal instillation (directly into the lungs)", "Oral", "None"]', 1, 'It must be delivered to the site of action in the alveoli.'),
    (v_case_id, 'What is the immediate effect of surfactant administration?', '["Fever", "Rapid improvement in lung compliance and oxygenation", "Vomiting", "None"]', 1, 'The pressure needed to open the lungs drops instantly.'),
    (v_case_id, 'What is a risk of rapid lung improvement after surfactant?', '["Pneumothorax or Pulmonary Hemorrhage", "Obesity", "Growth", "None"]', 0, 'As compliance improves, the ventilator pressures may become too high if not adjusted.');

    ---------------------------------------------------------------------------
    -- CASE 44: Bronchiectasis (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Permanently Dilated' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Permanently Dilated', 'A child with recurrent, poorly treated pneumonias now has a chronic, productive cough and finger clubbing.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Permanently Dilated', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Asthma", "Bronchiectasis", "Croup", "None"]', 1, 'Irreversible dilation and destruction of the bronchial walls.'),
    (v_case_id, 'What is the imaging test of choice for bronchiectasis?', '["X-ray", "High-Resolution CT (HRCT)", "MRI", "None"]', 1, 'HRCT shows the \"tram track\" or \"signet ring\" signs of dilated airways.'),
    (v_case_id, 'What is finger clubbing a sign of?', '["Pain", "Chronic hypoxia and inflammation", "Cold", "None"]', 1, 'Clubbing is common in CF, bronchiectasis, and cyanotic CHD.');

    ---------------------------------------------------------------------------
    -- CASE 45: Sudden Infant Death Syndrome - SIDS (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unexplained Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unexplained Loss', 'An infant under 1 year is found dead in the crib with no obvious cause.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Unexplained Loss', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the peak age of incidence for SIDS?', '["1 week", "2 to 4 months", "12 months", "None"]', 1, 'Most cases occur before 6 months of age.'),
    (v_case_id, 'Does SIDS have a specific autopsy finding?', '["Yes", "No, by definition it is the death of an infant that remains unexplained after thorough investigation", "Small heart", "None"]', 1, 'SIDS is a diagnosis of exclusion.'),
    (v_case_id, 'Is \"Room Sharing\" without \"Bed Sharing\" protective against SIDS?', '["No", "Yes, sleeping in the same room as parents but in a separate crib is recommended", "Maybe", "None"]', 1, 'The AAP recommends room sharing for at least the first 6 months.');

    ---------------------------------------------------------------------------
    -- CASE 46: Primary Ciliary Dyskinesia - Ear Issues (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Constant Drainage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Constant Drainage', 'A child with recurrent pneumonia also has chronic middle ear effusions and hearing loss.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Constant Drainage', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does PCD cause ear issues?', '["The ears are big", "Cilia in the eustachian tube are dysfunctional, preventing drainage", "Wax", "None"]', 1, 'Chronic secretory otitis media is almost universal in PCD.'),
    (v_case_id, 'How do the respiratory symptoms of PCD differ from CF?', '["PCD has no sinus issues", "PCD typically presents with neonatal respiratory distress even at term", "PCD has no cough", "None"]', 1, 'Early neonatal respiratory distress is a key clinical differentiator.'),
    (v_case_id, 'What is the impact on female fertility in PCD?', '["None", "Reduced due to dysfunctional fallopian tube cilia", "Increased", "None"]', 1, 'Cilia are also needed for ovum transport.');

    ---------------------------------------------------------------------------
    -- CASE 47: Mycoplasma - Cold Agglutinins (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Testing for Mycoplasma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Testing for Mycoplasma', 'A child with walking pneumonia has a positive \"Cold Agglutinin\" test.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Testing for Mycoplasma', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are Cold Agglutinins?', '["Ice", "IgM antibodies that agglutinate RBCs at low temperatures", "Virus", "None"]', 1, 'These are produced in about 50% of Mycoplasma cases.'),
    (v_case_id, 'What is the gold standard for diagnosis today?', '["Culture", "PCR from a nasopharyngeal swab", "Cold agglutinins", "None"]', 1, 'PCR is much faster and more sensitive than culture or serology.'),
    (v_case_id, 'Why is Mycoplasma resistant to Penicillin?', '["It is a virus", "It lacks a cell wall (the target of beta-lactams)", "It is smart", "None"]', 1, 'Beta-lactams are useless against Mycoplasma.');

    ---------------------------------------------------------------------------
    -- CASE 48: High Flow Nasal Cannula - HFNC (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Heated and Humidified' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Heated and Humidified', 'An infant with bronchiolitis is started on HFNC.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Heated and Humidified', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does HFNC provide support?', '["Just more O2", "High flow rates provide some positive pressure and wash out dead space", "It sucks air out", "None"]', 1, 'HFNC is a form of non-invasive ventilation.'),
    (v_case_id, 'Why is the gas heated and humidified?', '["To keep them warm", "To prevent airway drying and improve comfort at high flow rates", "No reason", "None"]', 1, 'Cold, dry air at high flows would be intolerable and damaging.'),
    (v_case_id, 'What is the main goal of HFNC in bronchiolitis?', '["Cure the virus", "Reduce the work of breathing and avoid intubation", "None", "None"]', 1, 'It provides a bridge of support while the child recovers.');

    ---------------------------------------------------------------------------
    -- CASE 49: Lung Abscess (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cavitary Lesion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cavitary Lesion', 'A child with persistent fever and foul-smelling breath has an X-ray showing a thick-walled cavity with an air-fluid level.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Cavitary Lesion', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Lung Abscess", "Asthma", "None"]', 1, 'A localized area of necrosis and pus in the lung.'),
    (v_case_id, 'What organisms are often involved in aspiration-related abscesses?', '["Only Strep", "Anaerobes from the oral cavity", "Viruses", "None"]', 1, 'Poor oral hygiene and aspiration are major risk factors.'),
    (v_case_id, 'What is the primary treatment?', '["Surgery today", "Long-term IV antibiotics", "Inhalers", "None"]', 1, 'Lung abscesses usually respond well to medical management without drainage.');

    ---------------------------------------------------------------------------
    -- CASE 50: Spirometry - Obstruction (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Interpreting the Graph' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Interpreting the Graph', 'A 10-year-old''s spirometry shows a FEV1/FVC of 0.65.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Interpreting the Graph', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this value normal?', '["Yes", "No, a ratio < 0.8 in children suggests an obstructive pattern", "Always", "None"]', 1, 'The threshold for obstruction is higher in children than adults.'),
    (v_case_id, 'What does a \"scooped-out\" expiratory flow-volume loop indicate?', '["Restriction", "Obstruction (e.g., Asthma)", "Normal", "None"]', 1, 'The curve represents the slow exit of air through narrowed passages.'),
    (v_case_id, 'What defines a \"Restrictive\" pattern?', '["Low ratio", "Low Total Lung Capacity (TLC) and FVC with a normal or high ratio", "High FEV1", "None"]', 1, 'Restriction is about lung volume; obstruction is about flow rate.');

    RAISE NOTICE 'SUCCESS: 50 Pediatric Respiratory Case Blocks registered.';
END $$;

COMMIT;
