-- ENT (Otolaryngology): Ear — otitis, hearing loss, vertigo, cholesteatoma
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-ear
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-ear' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-ear';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acute Otitis Media (AOM) - Pediatric
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fussy Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fussy Infant', 'A 14-month-old male is brought to the clinic for 2 days of irritability, low-grade fever, and tugging at his right ear. He had a mild upper respiratory infection last week.

Vitals: Temp 101.2°F (38.4°C), HR 115 bpm, RR 26/min.
Physical Examination: Otoscopy of the right ear reveals a bulging, erythematous tympanic membrane (TM) with significantly decreased mobility on pneumatic otoscopy. The left TM is normal. No post-auricular swelling or tenderness.
Laboratory Results: Normal WBC count.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 14-month-old male with AOM; bulging/erythematous TM and decreased mobility.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common bacterial pathogen isolated in Acute Otitis Media?', '["Staphylococcus aureus", "Streptococcus pneumoniae", "Mycoplasma pneumoniae", "Pseudomonas aeruginosa"]', 1, 'S. pneumoniae remains the most common bacterial cause, followed by non-typeable Haemophilus influenzae and Moraxella catarrhalis.'),
    (v_case_id, 'Which physical exam finding has the highest positive predictive value for AOM?', '["Erythema of the TM", "TM bulging", "Decreased TM mobility", "Presence of fluid"]', 1, 'Bulging of the TM is the most specific sign of acute inflammation and pressure in the middle ear.'),
    (v_case_id, 'What is the first-line antibiotic treatment for AOM in a child with no penicillin allergy?', '["Amoxicillin", "Azithromycin", "Ciprofloxacin", "Cephalexin"]', 0, 'High-dose amoxicillin (80-90 mg/kg/day) is the first-line treatment.');

    ---------------------------------------------------------------------------
    -- CASE 02: AOM with Perforation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Relief' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Relief', 'A 4-year-old girl was crying in pain all night with an earache. Suddenly, she stopped crying and her mother noticed yellow-tinged fluid draining from the ear.

Vitals: Temp 99.8°F, HR 105 bpm.
Physical Examination: Yellow purulent discharge in the external auditory canal. After suctioning, a small perforation is visible in the pars tensa of the TM. The rest of the TM is thickened.
Laboratory Results: Culture of discharge shows H. influenzae.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old with AOM and spontaneous perforation; purulent otorrhea.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the typical clinical course of a small spontaneous AOM perforation?', '["Requires immediate surgery", "Usually heals spontaneously within weeks", "Leads to permanent hearing loss", "Requires a permanent ear plug"]', 1, 'Most small perforations from AOM heal spontaneously. Persistent perforations (>3 months) may require myringoplasty.'),
    (v_case_id, 'In the presence of a perforation, what type of topical drops should be avoided if they contain aminoglycosides?', '["Ototoxic drops", "Steroid drops", "Acidifying drops", "Saline"]', 0, 'Aminoglycoside-containing drops (like neomycin/polymyxin B) should be avoided in the presence of an open middle ear due to potential ototoxicity.'),
    (v_case_id, 'What is the classic presentation of "relief" in this patient?', '["Pain stops when the pressure is released by perforation", "Fever disappears instantly", "Hearing returns to normal", "None"]', 0, 'The sudden cessation of pain (otalgia) followed by otorrhea is the hallmark of a spontaneous TM perforation during AOM.');

    ---------------------------------------------------------------------------
    -- CASE 03: Otitis Media with Effusion (OME / Serous Otitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Muffled World' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Muffled World', 'A 6-year-old boy is brought in because his teacher noticed he is not following instructions and asks "what?" frequently. He has no pain or fever.

Vitals: Stable.
Physical Examination: Bilateral TMs are retracted with an amber/yellow tint. Air-fluid levels and bubbles are visible behind the TMs. Mobility is restricted.
Laboratory Results: Tympanometry shows a Type B (flat) curve bilaterally.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old with OME; retracted TMs with air-fluid levels; Type B tympanogram.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does OME differ from AOM?', '["OME involves infection; AOM does not", "OME lacks signs of acute inflammation (pain, fever, bulging)", "OME always requires antibiotics", "OME is more painful"]', 1, 'OME is middle ear fluid without acute infection symptoms.'),
    (v_case_id, 'What is the standard initial management for asymptomatic OME in a child?', '["Immediate tubes", "Amoxicillin-Clavulanate", "Watchful waiting for 3 months", "Oral steroids"]', 2, 'Watchful waiting is the standard as many cases resolve spontaneously. If it persists >3 months or causes significant hearing loss, tubes are considered.'),
    (v_case_id, 'Which type of hearing loss is associated with OME?', '["Sensorineural", "Conductive", "Mixed", "Central"]', 1, 'Fluid in the middle ear prevents effective vibration of the ossicles, causing a conductive hearing loss.');

    ---------------------------------------------------------------------------
    -- CASE 04: Chronic Suppurative Otitis Media (CSOM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chronic Drain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chronic Drain', 'A 45-year-old male with a long history of ear "problems" since childhood presents with persistent, foul-smelling ear drainage for the past 4 months. He has significant hearing loss in that ear.

Vitals: Stable.
Physical Examination: A large central perforation of the TM is seen with mucopurulent discharge and granular tissue on the middle ear mucosa. No cholesteatoma is visible.
Laboratory Results: Culture grows Pseudomonas aeruginosa.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Suppurative Otitis Media; foul otorrhea, central perforation, Pseudomonas.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of CSOM?', '["AOM for 1 week", "Persistent otorrhea through a perforated TM for >6-12 weeks", "OME with a fever", "Ear pain after swimming"]', 1, 'CSOM is characterized by chronic drainage through a perforation.'),
    (v_case_id, 'What is the first-line medical treatment for CSOM?', '["Oral Amoxicillin", "Topical fluoroquinolone drops (e.g., Ciprofloxacin)", "Intravenous Vancomycin", "Antihistamines"]', 1, 'Topical fluoroquinolones are more effective than oral antibiotics for CSOM, targeting Pseudomonas and S. aureus.'),
    (v_case_id, 'If medical therapy fails, what is the next step to address the perforation and chronic infection?', '["Cochlear implant", "Tympanomastoidectomy", "Hearing aid", "None"]', 1, 'Surgical intervention may be needed to eradicate infection in the mastoid air cells and repair the TM.');

    ---------------------------------------------------------------------------
    -- CASE 05: Bullous Myringitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blistered Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blistered Ear', 'A 28-year-old female presents with sudden, severe, throbbing ear pain following a viral-like illness. She notes her hearing is slightly decreased but she has no drainage.

Vitals: Temp 100.1°F.
Physical Examination: Otoscopy shows large, fluid-filled blebs (bullae) on the lateral surface of the tympanic membrane. The rest of the middle ear appears congested.
Laboratory Results: Normal.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bullous myringitis; painful bullae on the TM lateral surface.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Bullous myringitis was classically associated with which organism, although now considered similar to AOM?', '["Mycoplasma pneumoniae", "Streptococcus pyogenes", "Virus only", "Fungus"]', 0, 'Classically associated with Mycoplasma, but now recognized as a variant of AOM caused by standard pathogens.'),
    (v_case_id, 'What is the primary symptom that distinguishes bullous myringitis?', '["Extreme pain (otalgia)", "Pulsatile tinnitus", "Vertigo", "Itching"]', 0, 'The tension of the bullae on the sensitive TM causes disproportionately severe pain.'),
    (v_case_id, 'Treatment for bullous myringitis includes:', '["Antibiotics and analgesics", "Surgery only", "Acupuncture", "None"]', 0, 'Treatment is similar to AOM with a focus on adequate pain control.');

    ---------------------------------------------------------------------------
    -- CASE 06: Mastoiditis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Displaced Pinna' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Displaced Pinna', 'A 3-year-old male with a "cold" and ear pain for 10 days presents with worsening fever and a protruding left ear.

Vitals: Temp 103.4°F, HR 135 bpm.
Physical Examination: The left pinna is displaced laterally and inferiorly. There is erythema, fluctuance, and tenderness over the post-auricular (mastoid) area. Otoscopy shows a bulging TM and sagging of the posterior ear canal wall.
Laboratory Results: WBC 19,000 with left shift.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Mastoiditis; post-auricular swelling and pinna displacement.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the gold standard imaging modality to confirm mastoiditis and evaluate for complications?', '["X-ray Mastoid", "CT scan of the temporal bone (with contrast if intracranial spread suspected)", "Ultrasound", "MRI only"]', 1, 'CT shows opacification and loss of bony septa (coalescence) in the mastoid air cells.'),
    (v_case_id, 'Initial management of acute mastoiditis usually requires:', '["Oral antibiotics at home", "Hospital admission and IV antibiotics", "Immediate total ear removal", "Wait and see"]', 1, 'Mastoiditis is a serious complication requiring parenteral therapy and often surgical drainage (myringotomy +/- tubes).'),
    (v_case_id, 'What is a "Bezold Abscess"?', '["A brain abscess", "Abscess tracking down the sternocleidomastoid muscle", "Infection in the eye", "None"]', 1, 'It occurs when mastoid infection erodes through the mastoid tip into the neck.');

    ---------------------------------------------------------------------------
    -- CASE 07: Tympanosclerosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The White Patch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The White Patch', 'A 22-year-old male is seen for a routine physical. He had many "ear tubes" as a child but has no current symptoms.

Vitals: Stable.
Physical Examination: Otoscopy shows chalky, white, semi-circular patches within the substance of the tympanic membrane. The TM moves well with pneumatic otoscopy.
Laboratory Results: Audiogram shows normal hearing.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tympanosclerosis; chalky white patches on the TM.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is tympanosclerosis?', '["A fungal infection", "Hyalinization and calcification of the TM and/or middle ear structures", "A malignant tumor", "Early cholesteatoma"]', 1, 'It is often a sequela of recurrent otitis media or previous tympanostomy tubes.'),
    (v_case_id, 'If tympanosclerosis involves only the TM, it is often called:', '["Myringosclerosis", "Otosclerosis", "Cholesteatoma", "None"]', 0, 'Myringosclerosis refers specifically to involvement of the TM alone.'),
    (v_case_id, 'What is the clinical significance of asymptomatic myringosclerosis?', '["High risk of cancer", "Usually none; it rarely affects hearing", "Requires immediate surgery", "Contagious"]', 1, 'Unless it is extensive enough to stiffen the TM or involve the ossicles, it is typically asymptomatic.');

    ---------------------------------------------------------------------------
    -- CASE 08: Eustachian Tube Dysfunction (ETD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pressure Build-up' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pressure Build-up', 'A 35-year-old male complains of a "clogged" feeling and "popping" in his ears during a descent on a flight. He has a history of seasonal allergies.

Vitals: Stable.
Physical Examination: TMs are retracted (Type C tympanogram). No fluid or infection is present.
Laboratory Results: Normal.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Eustachian Tube Dysfunction; retracted TM and Type C tympanogram.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary function of the Eustachian tube?', '["Produce earwax", "Pressure equalization of the middle ear", "Amplify sound", "Balance"]', 1, 'It connects the middle ear to the nasopharynx to equalize pressure and drain secretions.'),
    (v_case_id, 'What does a "Type C" tympanogram indicate?', '["Normal pressure", "Negative middle ear pressure", "Fluid", "Discontinuity of ossicles"]', 1, 'Negative pressure is characteristic of ETD.'),
    (v_case_id, 'Management for ETD caused by allergies includes:', '["Antibiotics", "Nasal steroids and decongestants", "Surgical removal of ET", "None"]', 1, 'Treating the underlying nasal inflammation helps open the tube.');

    ---------------------------------------------------------------------------
    -- CASE 09: Glue Ear (OME Management)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Delayed Talker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Delayed Talker', 'A 2.5-year-old male is evaluated for speech delay. He has had bilateral "glue ear" (thick OME) for 6 months.

Vitals: Stable.
Physical Examination: Bilateral thick, opaque middle ear effusions.
Laboratory Results: Audiology shows a 35 dB conductive hearing loss in the better ear.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic OME (Glue Ear) with speech delay and conductive hearing loss.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is hearing loss from OME particularly concerning in this age group?', '["It causes permanent deafness", "It can lead to speech and language developmental delays", "It makes the child more aggressive", "None"]', 1, 'Conductive loss during critical periods of language acquisition is a major concern.'),
    (v_case_id, 'What is the treatment of choice for chronic OME (>3 months) with significant hearing loss?', '["Myringotomy with Tympanostomy Tube insertion (PE tubes)", "Adenoidectomy alone", "Long-term steroids", "Hearing aids"]', 0, 'Pressure Equalization (PE) tubes bypass the Eustachian tube to ventilate the middle ear.'),
    (v_case_id, 'True or False: Most PE tubes stay in permanently.', '["True", "False"]', 1, 'Most tubes are designed to be extruded by the TM spontaneously within 6-18 months.');

    ---------------------------------------------------------------------------
    -- CASE 10: Recurrent AOM
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Frequent Infections' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Frequent Infections', 'An 18-month-old female has had 5 documented episodes of AOM in the last 6 months, requiring multiple courses of antibiotics.

Vitals: Currently afebrile.
Physical Examination: Currently has clear middle ear fluid (OME) but no acute infection.
Laboratory Results: Normal.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent AOM (5 episodes in 6 months).', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of "Recurrent AOM" that warrants consideration for tubes?', '["2 episodes in a year", "3 episodes in 6 months OR 4 episodes in 12 months", "1 episode every month", "None"]', 1, 'This is the standard criteria for surgical referral.'),
    (v_case_id, 'Which procedure is often performed alongside tubes in children with recurrent AOM/OME, especially if >4 years old?', '["Tonsillectomy", "Adenoidectomy", "Mastoidectomy", "Septoplasty"]', 1, 'Adenoidectomy can reduce the reservoir of bacteria and improve ET function.'),
    (v_case_id, 'What is a common risk of PE tube placement?', '["Permanent deafness", "TM perforation (persistent) or Otorrhea", "Loss of balance", "None"]', 1, 'Otorrhea through the tube is common; a small percentage may have a non-healing hole after the tube falls out.');

    ---------------------------------------------------------------------------
    -- CASE 11: Otitis Externa (Swimmer''s Ear)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Itchy Canal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Itchy Canal', 'A 19-year-old competitive swimmer presents with severe right ear pain and itching. The pain is so intense that he cannot sleep.

Vitals: Stable.
Physical Examination: Manipulation of the pinna and pressure on the tragus cause exquisite pain. The external auditory canal (EAC) is swollen and erythematous with white debris. The TM is partially visualized and appears normal.
Laboratory Results: Culture of EAC swab grows Pseudomonas aeruginosa.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Otitis Externa; tragal tenderness, swollen EAC, Pseudomonas.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common pathogen in acute bacterial otitis externa?', '["Staphylococcus aureus", "Pseudomonas aeruginosa", "Candida albicans", "Aspergillus"]', 1, 'Pseudomonas is the most frequent culprit, especially in swimmers.'),
    (v_case_id, 'What is the "Tragal Sign"?', '["Pain when pulling the earlobe", "Pain when pressing on the tragus", "A type of skin rash", "None"]', 1, 'Tragal tenderness is a classic sign of otitis externa, distinguishing it from otitis media.'),
    (v_case_id, 'Treatment for uncomplicated otitis externa includes:', '["Systemic Amoxicillin", "Topical antibiotic/steroid drops (e.g., Cipro/Dexamethasone)", "Total ear canal ablation", "None"]', 1, 'Topical therapy is the mainstay of treatment for otitis externa.');

    ---------------------------------------------------------------------------
    -- CASE 12: Fungal Otitis Externa (Otomycosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wet Newspaper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wet Newspaper', 'A 40-year-old male presents with persistent ear itching and a feeling of fullness. He recently finished a course of antibiotic drops for a previous infection.

Vitals: Stable.
Physical Examination: Otoscopy reveals black, "speck-like" debris (conidiophores) and white filamentous growth in the EAC, resembling "wet newspaper."
Laboratory Results: KOH prep shows fungal hyphae.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Otomycosis (Aspergillus); black/white debris in EAC.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which fungal species is most commonly associated with black spores in the ear?', '["Candida albicans", "Aspergillus niger", "Microsporum", "None"]', 1, 'Aspergillus niger typically produces the characteristic black spores.'),
    (v_case_id, 'What is a major risk factor for developing otomycosis?', '["Prolonged use of topical antibiotic drops", "Diabetes", "Living in a humid climate", "All of the above"]', 3, 'These factors all predispose to fungal overgrowth in the EAC.'),
    (v_case_id, 'Management of otomycosis requires:', '["Thorough debridement (suctioning) and topical antifungals (e.g., Clotrimazole)", "Systemic Fluconazole", "Daily ear syringing with water", "None"]', 0, 'Meticulous cleaning of the canal is essential for effective treatment.');

    ---------------------------------------------------------------------------
    -- CASE 13: Malignant Otitis Externa (Necrotizing Otitis Externa)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Diabetic Deep Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Diabetic Deep Pain', 'A 72-year-old male with poorly controlled Type 2 Diabetes presents with deep, unrelenting ear pain that is worse at night. He has had no relief from standard ear drops.

Vitals: Temp 100.5°F.
Physical Examination: Granulation tissue is visible at the floor of the EAC at the bone-cartilage junction. Cranial nerve VII palsy is noted (drooping of the face).
Laboratory Results: ESR 95 mm/hr, CRP elevated. Culture grows Pseudomonas aeruginosa.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Malignant Otitis Externa in a diabetic; granulation tissue and CN VII palsy.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiology of Malignant Otitis Externa (MOE)?', '["A simple skin infection", "An aggressive osteomyelitis of the temporal bone", "A viral infection of the nerve", "None"]', 1, 'MOE is a life-threatening infection that spreads from the EAC to the skull base.'),
    (v_case_id, 'Which clinical finding is highly suggestive of MOE in an elderly diabetic?', '["Granulation tissue in the EAC", "High fever", "Itchy ear", "None"]', 0, 'Granulation tissue at the junction of the cartilaginous and bony canal is a hallmark sign.'),
    (v_case_id, 'What is the primary treatment for MOE?', '["Immediate surgery", "Long-term IV antipseudomonal antibiotics (e.g., Ciprofloxacin or Ceftazidime)", "Insulin only", "None"]', 1, 'Prolonged systemic antibiotics are the cornerstone of therapy.');

    ---------------------------------------------------------------------------
    -- CASE 14: Auricular Hematoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wrestler''s Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wrestler''s Ear', 'A 17-year-old high school wrestler presents with a swollen, painful right ear after a match.

Vitals: Stable.
Physical Examination: Fluctuant, purple/red swelling of the anterior pinna, obscuring the normal cartilaginous landmarks. The earlobe is spared.
Laboratory Results: Normal.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Auricular Hematoma; swollen, fluctuant pinna.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary concern if an auricular hematoma is not drained promptly?', '["Loss of hearing", "Permanent deformity (Cauliflower Ear) due to cartilage necrosis", "Brain infection", "None"]', 1, 'The hematoma separates the perichondrium from the cartilage, cutting off its blood supply.'),
    (v_case_id, 'What is the recommended management for an acute auricular hematoma?', '["Observation and ice", "Incision and drainage followed by a bolster/pressure dressing", "Needle aspiration only", "None"]', 1, 'Drainage and pressure are required to prevent the fluid from re-accumulating.'),
    (v_case_id, 'Why is the earlobe spared in an auricular hematoma?', '["The lobe has a better blood supply", "The lobe does not contain cartilage", "The lobe is tougher", "None"]', 1, 'The hematoma occurs between the perichondrium and cartilage; the lobe is purely fibrofatty tissue.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cerumen Impaction
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Ear', 'An 80-year-old female is brought in by her family because she has become increasingly withdrawn and stops responding to conversations.

Vitals: Stable.
Physical Examination: Otoscopy reveals a hard, dark-brown mass of wax completely occluding the EAC bilaterally.
Laboratory Results: Audiology (post-cleaning) shows age-appropriate hearing.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cerumen impaction causing pseudo-dementia/withdrawal in an elderly patient.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in managing symptomatic cerumen impaction?', '["Order an MRI", "Removal via irrigation, cerumenolytics, or manual instrumentation", "Prescribe hearing aids", "None"]', 1, 'Safe removal of the wax is the standard treatment.'),
    (v_case_id, 'Irrigation should be avoided in which scenario?', '["In a child", "Known or suspected TM perforation", "Elderly patient", "None"]', 1, 'Irrigation can push wax or water into the middle ear through a hole, causing infection or vertigo.'),
    (v_case_id, 'What is "Keratosis Obturans"?', '["Normal earwax", "A rare condition where a large plug of desquamated keratin occludes the EAC, causing bony expansion", "A type of skin cancer", "None"]', 1, 'It is much more aggressive than simple cerumen impaction.');

    ---------------------------------------------------------------------------
    -- CASE 16: Presbycusis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crowded Room' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crowded Room', 'A 75-year-old male complains that he can hear people talking but cannot understand the words, especially in noisy environments like restaurants.

Vitals: Stable.
Physical Examination: Otoscopy is normal.
Laboratory Results: Audiogram shows a symmetric, down-sloping high-frequency sensorineural hearing loss (SNHL).', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Presbycusis; symmetric, high-frequency SNHL.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathology in Presbycusis?', '["Middle ear fluid", "Degeneration of the hair cells and stria vascularis in the cochlea", "A brain tumor", "Otosclerosis"]', 1, 'It is age-related wear and tear of the inner ear structures.'),
    (v_case_id, 'Which type of sounds are usually lost first in Presbycusis?', '["Low-frequency (bass)", "High-frequency (consonants like s, f, th)", "Middle-frequency", "None"]', 1, 'High-frequency loss makes speech discrimination difficult.'),
    (v_case_id, 'What is the most effective management for Presbycusis?', '["Surgery", "Hearing aids and communication strategies", "Vitamins", "None"]', 1, 'Amplification helps improve the signal-to-noise ratio.');

    ---------------------------------------------------------------------------
    -- CASE 17: Noise-Induced Hearing Loss (NIHL)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Factory Worker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Factory Worker', 'A 50-year-old man who has worked in a loud steel mill for 25 years presents with bilateral hearing loss and high-pitched tinnitus.

Vitals: Stable.
Laboratory Results: Audiogram shows a symmetric SNHL with a characteristic "notch" (dip) at 4000 Hz.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'NIHL; 4000 Hz notch on audiogram.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the classic "notch" seen on an audiogram in NIHL?', '["1000 Hz", "4000 Hz", "8000 Hz", "None"]', 1, 'The 4 kHz notch is the hallmark of chronic noise exposure.'),
    (v_case_id, 'True or False: Hearing loss from noise exposure is typically permanent.', '["True", "False"]', 0, 'Chronic exposure leads to irreversible damage to the hair cells.'),
    (v_case_id, 'What is the most important preventive measure for NIHL?', '["Annual hearing tests", "Consistent use of hearing protection (earplugs/muffs)", "Taking aspirin", "None"]', 1, 'Prevention is key as the damage cannot be reversed.');

    ---------------------------------------------------------------------------
    -- CASE 18: Otosclerosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Stapes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Stapes', 'A 32-year-old female presents with progressive bilateral hearing loss. She notes that her hearing worsened significantly during her last pregnancy.

Vitals: Stable.
Physical Examination: Otoscopy shows a faint reddish hue behind the TM (Schwartze sign).
Laboratory Results: Audiogram shows a conductive hearing loss with a "Carhart notch" (dip in bone conduction) at 2000 Hz. Tympanometry is Type As (shallow).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Otosclerosis; Carhart notch at 2000 Hz, Schwartze sign.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathology of Otosclerosis?', '["Middle ear infection", "Abnormal bone remodeling in the otic capsule, leading to stapes fixation", "Hair cell death", "None"]', 1, 'The stapes footplate becomes frozen in the oval window.'),
    (v_case_id, 'What is the "Carhart Notch"?', '["A dip in air conduction", "A characteristic dip in bone conduction at 2000 Hz", "A type of earwax", "None"]', 1, 'This is a pseudo-SNHL finding caused by the loss of the inertial component of bone conduction.'),
    (v_case_id, 'What are the treatment options for Otosclerosis?', '["Hearing aids", "Stapedectomy (surgical replacement of stapes)", "Sodium fluoride (historical)", "All of the above"]', 3, 'Both amplification and surgery are viable options.');

    ---------------------------------------------------------------------------
    -- CASE 19: Sudden Sensorineural Hearing Loss (SSNHL)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Morning Surprise' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Morning Surprise', 'A 44-year-old male woke up this morning and realized he was completely deaf in his left ear. He also has a loud "hissing" tinnitus.

Vitals: Stable.
Physical Examination: Normal otoscopy. Weber test lateralizes to the right (better ear). Rinne test is positive (AC > BC) bilaterally.
Laboratory Results: Audiogram shows a 60 dB SNHL in the left ear across at least 3 frequencies.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'SSNHL; sudden unilateral deafness, Weber lateralizes to normal ear.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Sudden SNHL is defined as a loss of at least how many decibels over how many frequencies occurring within 72 hours?', '["10 dB over 1 freq", "30 dB over 3 frequencies", "50 dB over all freq", "None"]', 1, 'The "30-3-3" rule is the standard definition.'),
    (v_case_id, 'What is the most important "emergency" treatment for SSNHL to improve recovery?', '["Antibiotics", "Systemic and/or intratympanic steroids", "Surgery", "Observation"]', 1, 'Early steroid administration (within 2 weeks) is critical for prognosis.'),
    (v_case_id, 'What is the standard workup for a unilateral SSNHL once stabilized?', '["Repeat audiogram in 1 year", "MRI of the internal auditory canals (to rule out acoustic neuroma)", "None", "Genetic testing"]', 1, 'Up to 1-2% of SSNHL cases are caused by a vestibular schwannoma.');

    ---------------------------------------------------------------------------
    -- CASE 20: Ototoxicity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Price of Recovery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Price of Recovery', 'A 55-year-old male was treated for a severe Pseudomonas bone infection with IV Gentamicin for 4 weeks. He now notices difficulty with balance and high-pitched tinnitus.

Vitals: Stable.
Laboratory Results: Audiogram shows a new bilateral high-frequency SNHL.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ototoxicity due to Gentamicin; bilateral SNHL and vestibular dysfunction.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which class of antibiotics is most notoriously ototoxic?', '["Penicillins", "Aminoglycosides (e.g., Gentamicin, Neomycin)", "Cephalosporins", "Macrolides"]', 1, 'Aminoglycosides can cause both cochleotoxicity (hearing loss) and vestibulotoxicity (imbalance).'),
    (v_case_id, 'Which chemotherapeutic agent is well known for causing irreversible SNHL?', '["Cisplatin", "Vincristine", "Cyclophosphamide", "None"]', 0, 'Cisplatin causes dose-related, symmetric, high-frequency SNHL.'),
    (v_case_id, 'Common loop diuretic that can cause reversible or irreversible ototoxicity:', '["Hydrochlorothiazide", "Furosemide", "Spironolactone", "None"]', 1, 'High-dose IV Furosemide can be ototoxic, especially in patients with renal failure.');

    ---------------------------------------------------------------------------
    -- CASE 21: Congenital Hearing Loss
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Failed Screen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Failed Screen', 'A newborn fails his universal newborn hearing screening (OAE) twice.

Vitals: Stable.
Physical Examination: No dysmorphic features.
Laboratory Results: Diagnostic ABR (Auditory Brainstem Response) confirms bilateral profound SNHL. Testing reveals a mutation in the GJB2 gene (Connexin 26).', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital SNHL; GJB2 (Connexin 26) mutation.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common non-genetic cause of congenital SNHL?', '["Waardenburg Syndrome", "Connexin 26 (GJB2) mutations", "Usher Syndrome", "None"]', 1, 'GJB2 mutations account for up to 50% of non-syndromic autosomal recessive hearing loss.'),
    (v_case_id, 'Which TORCH infection is the most common non-genetic cause of congenital SNHL?', '["Toxoplasmosis", "Cytomegalovirus (CMV)", "Rubella", "Syphilis"]', 1, 'CMV is a leading cause of childhood hearing loss, which may be late-onset or progressive.'),
    (v_case_id, 'What is the most appropriate management for a child with bilateral profound SNHL to facilitate language development?', '["Wait until age 5", "Hearing aids followed by Cochlear Implantation if benefits are limited", "Sign language only", "None"]', 1, 'Early intervention with amplification or cochlear implants (often as early as 9-12 months) is crucial.');

    ---------------------------------------------------------------------------
    -- CASE 22: Weber/Rinne - Conductive Loss
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tuning Fork - Part 1' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tuning Fork - Part 1', 'A patient with a large plug of wax in the right ear is tested with a 512 Hz tuning fork.

Vitals: Normal.
Physical Examination: Right EAC occluded by cerumen.
Laboratory Results: Weber and Rinne tests are performed.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weber/Rinne interpretation for Right Conductive Hearing Loss.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a patient with Conductive Hearing Loss in the RIGHT ear, where will the Weber test lateralize?', '["Left ear", "Right ear (the bad ear)", "Middle of head", "Nowhere"]', 1, 'In conductive loss, the sound is louder in the affected ear because background noise is blocked.'),
    (v_case_id, 'What will the Rinne test show in the RIGHT ear with conductive loss?', '["Air conduction > Bone conduction (Positive)", "Bone conduction > Air conduction (Negative)", "No sound heard", "None"]', 1, 'BC > AC (Negative Rinne) is the hallmark of conductive loss.'),
    (v_case_id, 'What frequency tuning fork is standard for clinical hearing assessment?', '["128 Hz", "512 Hz", "2048 Hz", "None"]', 1, '512 Hz provides the best balance between tone and vibration.');

    ---------------------------------------------------------------------------
    -- CASE 23: Weber/Rinne - Sensorineural Loss
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tuning Fork - Part 2' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tuning Fork - Part 2', 'A patient with an acoustic neuroma in the LEFT ear is tested with a 512 Hz tuning fork.

Vitals: Normal.
Physical Examination: Normal otoscopy.
Laboratory Results: Weber and Rinne tests are performed.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weber/Rinne interpretation for Left Sensorineural Hearing Loss.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a patient with SNHL in the LEFT ear, where will the Weber test lateralize?', '["Left ear", "Right ear (the good ear)", "Middle of head", "None"]', 1, 'In SNHL, the sound is heard better in the ear with the functioning cochlea.'),
    (v_case_id, 'What will the Rinne test show in the LEFT ear with SNHL?', '["Air conduction > Bone conduction (Positive)", "Bone conduction > Air conduction (Negative)", "No sound heard", "None"]', 0, 'In SNHL, AC > BC is maintained (Positive Rinne), but both are reduced compared to the other side.'),
    (v_case_id, 'What does "False Negative Rinne" refer to?', '["Normal hearing", "When severe unilateral SNHL leads to hearing bone conduction in the opposite (good) ear", "A broken tuning fork", "None"]', 1, 'The patient "hears" BC because the sound travels through the skull to the healthy ear.');

    ---------------------------------------------------------------------------
    -- CASE 24: Cochlear Implant Indications
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bypassing the Cochlea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bypassing the Cochlea', 'A 60-year-old female with progressive bilateral profound SNHL no longer benefits from the most powerful hearing aids. She can no longer use the telephone even with amplification.

Vitals: Stable.
Laboratory Results: Audiogram shows profound loss (>90 dB) bilaterally. Sentence recognition score is 20% in the best-aided condition.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cochlear implant candidate; profound bilateral SNHL, poor speech discrimination.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does a cochlear implant differ from a hearing aid?', '["It just makes sound louder", "It bypasses damaged hair cells to directly stimulate the auditory nerve", "It is only for the middle ear", "None"]', 1, 'It converts sound into electrical signals for the nerve.'),
    (v_case_id, 'What is a primary requirement for a cochlear implant to work?', '["An intact tympanic membrane", "A functioning auditory nerve", "Normal middle ear bones", "None"]', 1, 'If the nerve is dead, the implant has nothing to stimulate.'),
    (v_case_id, 'True or False: Cochlear implants restore "natural" hearing.', '["True", "False"]', 1, 'The sound is described as "electronic" or "mechanical" and requires the brain to learn to interpret the new signals.');

    ---------------------------------------------------------------------------
    -- CASE 25: Temporal Bone Fracture - Longitudinal
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lateral Impact' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lateral Impact', 'A 25-year-old male is brought to the ED after a lateral blow to the head in a motorcycle accident. He has bleeding from the right ear and hearing loss.

Vitals: Stable.
Physical Examination: Hemotympanum (blood behind the TM) and a step-off in the bony external auditory canal. No facial nerve weakness.
Laboratory Results: CT temporal bone shows a fracture line parallel to the long axis of the petrous pyramid.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Longitudinal temporal bone fracture; hemotympanum, CHL.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of hearing loss associated with a Longitudinal temporal bone fracture?', '["Sensorineural", "Conductive (due to ossicular disruption or hemotympanum)", "Central", "None"]', 1, 'Longitudinal fractures often involve the middle ear and EAC.'),
    (v_case_id, 'Is facial nerve injury more or less common in longitudinal vs. transverse fractures?', '["More common in longitudinal", "Less common in longitudinal (approx 20%)", "Equal", "Never occurs"]', 1, 'Transverse fractures have a much higher rate of facial nerve injury (~50%).'),
    (v_case_id, 'What does "Battle Sign" indicate in head trauma?', '["A broken nose", "Post-auricular ecchymosis indicating a skull base/temporal bone fracture", "A black eye", "None"]', 1, 'Ecchymosis over the mastoid process is a classic sign of basilar skull fracture.');

    ---------------------------------------------------------------------------
    -- CASE 26: Temporal Bone Fracture - Transverse
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Frontal Impact' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Frontal Impact', 'A 30-year-old female is involved in a high-speed head-on collision. She has severe vertigo, nausea, and immediate total hearing loss in the left ear.

Vitals: Stable.
Physical Examination: Spontaneous nystagmus with the fast phase beating to the right. Left-sided facial nerve palsy (House-Brackmann Grade V). The TM appears normal.
Laboratory Results: CT temporal bone shows a fracture line perpendicular to the long axis of the petrous pyramid, crossing the internal auditory canal.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Transverse temporal bone fracture; SNHL, vertigo, facial palsy.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of hearing loss is most common in a Transverse temporal bone fracture?', '["Conductive", "Sensorineural (often permanent due to cochlear/nerve involvement)", "Mixed", "None"]', 1, 'Transverse fractures frequently involve the otic capsule or IAC.'),
    (v_case_id, 'What is the rate of facial nerve paralysis in transverse fractures?', '["10%", "20%", "50%", "100%"]', 2, 'Transverse fractures are much more likely to damage the facial nerve than longitudinal ones.'),
    (v_case_id, 'Why is nystagmus seen in this patient?', '["Eye injury", "Sudden loss of vestibular function on the left side", "Brain concussion", "None"]', 1, 'The brain compensates for the missing input from the damaged ear, causing a "vestibular crisis."');

    ---------------------------------------------------------------------------
    -- CASE 27: Otic Barotrauma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scuba Dive' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scuba Dive', 'A 28-year-old male presents with ear pain and a "blocked" feeling after a rapid ascent while scuba diving.

Vitals: Stable.
Physical Examination: Otoscopy shows hemorrhage within the TM and a small middle ear effusion (hemotympanum).
Laboratory Results: Audiogram shows a mild conductive hearing loss.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Otic Barotrauma; hemotympanum after diving.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What causes barotrauma during diving or flying?', '["Infection", "Failure of the Eustachian tube to equalize pressure between the middle ear and environment", "Salt water", "None"]', 1, 'Rapid pressure changes can cause negative or positive pressure in the middle ear, leading to tissue damage.'),
    (v_case_id, 'What is "Boyle''s Law" in the context of barotrauma?', '["Pressure is equal to volume", "The volume of a gas is inversely proportional to its pressure", "Sound travels faster in water", "None"]', 1, 'As pressure increases (descent), the volume of air in the middle ear decreases; if not equalized, the TM is sucked inward.'),
    (v_case_id, 'Preventive measures for barotrauma include:', '["Valsalva maneuver", "Oral decongestants before flying", "Avoiding diving while congested", "All of the above"]', 3, 'These all help maintain Eustachian tube patency.');

    ---------------------------------------------------------------------------
    -- CASE 28: BPPV (Dix-Hallpike)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spinning Bed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spinning Bed', 'A 62-year-old female presents with brief episodes of intense vertigo triggered by rolling over in bed or looking up. Each episode lasts less than 30 seconds.

Vitals: Stable.
Physical Examination: A Dix-Hallpike maneuver is performed. When the head is turned right and lowered, after a 5-second latency, she develops rotatory, geotropic nystagmus and severe vertigo that fatigues after 20 seconds.
Laboratory Results: Normal hearing.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'BPPV (Posterior Canal); positive Dix-Hallpike maneuver.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common underlying cause of BPPV?', '["Viral infection", "Canalithiasis (displacement of otoconia from the utricle into the semicircular canals)", "Tumor", "None"]', 1, 'Most BPPV involves the posterior semicircular canal.'),
    (v_case_id, 'What are the four classic features of BPPV nystagmus during the Dix-Hallpike?', '["Latency, Rotatory, Fatigability, Reversibility", "Immediate, Vertical, Constant, Unidirectional", "No nystagmus", "None"]', 0, 'These features help distinguish peripheral BPPV from central causes of vertigo.'),
    (v_case_id, 'Which maneuver is used to TREAT posterior canal BPPV?', '["Dix-Hallpike", "Epley maneuver (Canalith Repositioning Procedure)", "Valsalva", "None"]', 1, 'The Epley maneuver aims to move the otoconia back into the utricle.');

    ---------------------------------------------------------------------------
    -- CASE 29: BPPV - Lateral Canal
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Supine Roll' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Supine Roll', 'A patient has symptoms suggestive of BPPV, but the Dix-Hallpike maneuver is negative.

Vitals: Stable.
Physical Examination: The "Supine Roll Test" is performed. When the head is turned to either side while supine, a horizontal nystagmus is seen.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lateral (Horizontal) Canal BPPV; positive Supine Roll Test.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of nystagmus is characteristic of Lateral Canal BPPV?', '["Rotatory", "Horizontal (Geotropic or Apogeotropic)", "Vertical", "None"]', 1, 'Horizontal nystagmus indicates involvement of the horizontal canal.'),
    (v_case_id, 'Which maneuver is used to treat Lateral Canal BPPV?', '["Epley", "Lempert (BBQ) Roll", "Semont", "None"]', 1, 'The BBQ roll rotates the patient 360 degrees to move the canalith.'),
    (v_case_id, 'How does Lateral Canal BPPV typically differ in duration/intensity from Posterior Canal BPPV?', '["It is milder", "It is often more intense and may last longer during the provoking position", "It is identical", "None"]', 1, 'Lateral canal BPPV can be very distressing for the patient.');

    ---------------------------------------------------------------------------
    -- CASE 30: Meniere''s Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fullness and Roar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fullness and Roar', 'A 45-year-old male presents with recurrent episodes of spinning vertigo lasting 3 hours, accompanied by a "roaring" tinnitus and a feeling of "fullness" in his right ear.

Vitals: Stable.
Physical Examination: Currently normal, but during an attack, he has spontaneous nystagmus.
Laboratory Results: Audiogram shows a low-frequency SNHL in the right ear.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Meniere''s Disease; triad of vertigo, tinnitus, and low-frequency SNHL.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected underlying pathology in Meniere''s disease?', '["Bacterial infection", "Endolymphatic hydrops (overaccumulation of endolymph)", "Vascular spasm", "None"]', 1, 'This leads to distortion and eventual rupture of the membranous labyrinth.'),
    (v_case_id, 'What is the classic audiometric finding in early Meniere''s disease?', '["High-frequency SNHL", "Low-frequency SNHL", "Flat Conductive loss", "None"]', 1, 'Low-frequency loss is very characteristic and may fluctuate initially.'),
    (v_case_id, 'Standard medical management for Meniere''s includes:', '["Antibiotics", "Low-salt diet and diuretics (e.g., Dyazide)", "High-sugar diet", "None"]', 1, 'Reducing endolymphatic pressure is the goal of medical therapy.');

    ---------------------------------------------------------------------------
    -- CASE 31: Vestibular Neuritis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vertigo without Deafness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vertigo without Deafness', 'A 38-year-old female presents with sudden, severe, continuous vertigo, nausea, and vomiting that has lasted for 24 hours. She has no hearing loss or tinnitus.

Vitals: Stable.
Physical Examination: Spontaneous horizontal-rotatory nystagmus beating away from the affected side. Positive "Head Thrust Test" to the affected side.
Laboratory Results: Normal hearing on audiogram.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vestibular Neuritis; severe continuous vertigo, normal hearing.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely etiology of Vestibular Neuritis?', '["Autoimmune", "Viral or post-viral inflammation of the vestibular nerve", "Tumor", "Stroke"]', 1, 'It often follows a viral URI.'),
    (v_case_id, 'How is Vestibular Neuritis distinguished from Labyrinthitis?', '["Neuritis is more painful", "Neuritis has normal hearing; Labyrinthitis has hearing loss", "They are the same", "None"]', 1, 'Both involve the vestibular system, but labyrinthitis also involves the cochlea.'),
    (v_case_id, 'What is the typical management for the acute phase of Vestibular Neuritis?', '["Immediate surgery", "Vestibular suppressants (e.g., Meclizine) and potentially a steroid taper", "Lifetime bed rest", "None"]', 1, 'Treatment is symptomatic followed by vestibular rehabilitation.');

    ---------------------------------------------------------------------------
    -- CASE 32: Labyrinthitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vertigo and Deafness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vertigo and Deafness', 'A 42-year-old male presents with sudden vertigo and a new hearing loss in his left ear following a severe ear infection.

Vitals: Stable.
Physical Examination: Nystagmus and positive head thrust test.
Laboratory Results: Audiogram confirms a new SNHL in the left ear.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Labyrinthitis; continuous vertigo with SNHL.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Labyrinthitis involves inflammation of:', '["The nerve only", "Both the vestibular and cochlear components of the inner ear", "The external ear only", "The brainstem"]', 1, 'This explains the combination of vertigo and hearing loss.'),
    (v_case_id, 'A "Suppurative Labyrinthitis" is a medical emergency because:', '["It causes bad breath", "It indicates bacterial invasion of the inner ear with high risk of meningitis", "It is contagious", "None"]', 1, 'Bacterial labyrinthitis requires aggressive treatment.'),
    (v_case_id, 'True or False: The hearing loss in viral labyrinthitis is often permanent.', '["True", "False"]', 0, 'While vertigo often improves, the cochlear damage may be irreversible.');

    ---------------------------------------------------------------------------
    -- CASE 33: Acoustic Neuroma (Vestibular Schwannoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Fade' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Fade', 'A 52-year-old female presents with progressive unilateral hearing loss and mild imbalance (not spinning vertigo) for the past year.

Vitals: Stable.
Physical Examination: Decreased corneal reflex on the affected side.
Laboratory Results: Audiogram shows unilateral high-frequency SNHL. MRI with gadolinium shows a "light-bulb" enhancing mass in the internal auditory canal.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acoustic Neuroma; unilateral SNHL and mass in the IAC.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Acoustic neuromas most commonly arise from which nerve?', '["Cochlear nerve", "Vestibular nerve (superior or inferior)", "Facial nerve", "Trigeminal nerve"]', 1, 'Specifically, they are schwannomas of the vestibular nerve.'),
    (v_case_id, 'Bilateral acoustic neuromas are a hallmark of which genetic condition?', '["Neurofibromatosis Type 1", "Neurofibromatosis Type 2", "Down Syndrome", "None"]', 1, 'NF2 is associated with bilateral vestibular schwannomas.'),
    (v_case_id, 'What are the three main management options for an acoustic neuroma?', '["Antibiotics, steroids, surgery", "Observation (serial MRI), Stereotactic Radiosurgery (Gamma Knife), or Microsurgical Excision", "Chemotherapy, radiation, massage", "None"]', 1, 'The choice depends on tumor size, patient age, and hearing status.');

    ---------------------------------------------------------------------------
    -- CASE 34: Perilymphatic Fistula
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sneeze Vertigo' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sneeze Vertigo', 'A 33-year-old male presents with fluctuating hearing loss and vertigo that is triggered by sneezing, coughing, or heavy lifting.

Vitals: Stable.
Physical Examination: Positive "Hennebert sign" (vertigo/nystagmus induced by applying pressure to the EAC).
Laboratory Results: Normal otoscopy.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Perilymphatic Fistula; vertigo with pressure changes (sneeze/cough).', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Perilymphatic Fistula?', '["A hole in the TM", "An abnormal communication between the fluid-filled inner ear and the air-filled middle ear", "A type of earwax", "None"]', 1, 'It usually occurs at the round or oval windows.'),
    (v_case_id, 'What is a common precipitating event for a fistula?', '["Head trauma, barotrauma, or severe straining (Valsalva)", "A viral cold", "Swimming", "None"]', 0, 'These events cause a sudden pressure spike that ruptures the window membranes.'),
    (v_case_id, 'Initial management of a suspected perilymphatic fistula:', '["Immediate surgery", "Bed rest with head elevation and avoidance of straining", "Antibiotics", "None"]', 1, 'Many fistulas heal spontaneously with conservative management; surgery is reserved for persistent cases.');

    ---------------------------------------------------------------------------
    -- CASE 35: Superior Canal Dehiscence (SCD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loud Sound Vertigo' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loud Sound Vertigo', 'A 48-year-old female complains of vertigo when she hears loud music (Tullio phenomenon) and can hear her own heartbeat and eye movements ("autophony").

Vitals: Stable.
Laboratory Results: Audiogram shows a "pseudo-conductive" hearing loss (normal BC, slightly elevated AC). CT temporal bone (high resolution) shows a thinning or absence of bone over the superior semicircular canal.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Superior Canal Dehiscence; Tullio phenomenon and autophony.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Tullio Phenomenon"?', '["Hearing voices", "Vertigo/nystagmus induced by loud sounds", "Loss of smell", "None"]', 1, 'Sound energy is shunted through the "third window" (the dehiscence) into the vestibular system.'),
    (v_case_id, 'What is "Autophony" in SCD?', '["Hearing one''s own internal sounds (heartbeat, eyes moving) abnormally loudly", "Difficulty speaking", "A type of deafness", "None"]', 0, 'Patients often describe hearing their heels strike the ground or their eyes "clicking."'),
    (v_case_id, 'How is SCD definitively diagnosed?', '["MRI", "High-resolution CT of the temporal bone and VEMP testing", "Blood test", "None"]', 1, 'CT shows the bony defect; VEMP (Vestibular Evoked Myogenic Potentials) shows abnormally low thresholds.');

    ---------------------------------------------------------------------------
    -- CASE 36: Vestibular Migraine
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dizzy Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dizzy Headache', 'A 34-year-old female with a history of "sick headaches" presents with recurrent episodes of vertigo lasting 20 minutes to 2 hours. Sometimes she has a headache with the vertigo, but not always. She is sensitive to light and sound during attacks.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal hearing.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vestibular Migraine; recurrent vertigo with migrainous features.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How common is vertigo in migraine patients?', '["Very rare", "Up to 30-50% of migraineurs experience some dizziness or vertigo", "100%", "None"]', 1, 'Vestibular migraine is one of the most common causes of recurrent vertigo.'),
    (v_case_id, 'True or False: A headache MUST be present at the same time as the vertigo to diagnose vestibular migraine.', '["True", "False"]', 1, 'Vertigo can occur as a "migraine equivalent" without an actual headache.'),
    (v_case_id, 'What is the mainstay of treatment for vestibular migraine?', '["Ear surgery", "Migraine prophylaxis (e.g., diet triggers, Beta-blockers, Amitriptyline) and abortives", "Antibiotics", "None"]', 1, 'Management focuses on standard migraine preventative strategies.');

    ---------------------------------------------------------------------------
    -- CASE 37: Central Vertigo (Vertebrobasilar Insufficiency)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dangerous Dizzy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dangerous Dizzy', 'An 82-year-old male with hypertension and atrial fibrillation presents with sudden onset vertigo, double vision (diplopia), and slurred speech (dysarthria).

Vitals: BP 175/95.
Physical Examination: Vertical nystagmus that changes direction with gaze. Ataxia (unsteadiness) is present.
Laboratory Results: Normal hearing.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Central Vertigo (VBI); vertigo with "D" symptoms (diplopia, dysarthria).', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a sign of "Central" vertigo?', '["Direction-changing nystagmus", "Vertical nystagmus", "Associated neurological deficits (the \"D''s\")", "All of the above"]', 3, 'These findings should prompt an immediate evaluation for stroke or other CNS pathology.'),
    (v_case_id, 'What is the "HINTS" exam used for?', '["To test for hearing", "To differentiate between a peripheral vestibular event and a central stroke in patients with continuous vertigo", "To measure height", "None"]', 1, 'HINTS stands for Head Impulse, Nystagmus, and Test of Skew.'),
    (v_case_id, 'In the HINTS exam, which finding is more concerning for a STROKE?', '["A normal Head Impulse Test in a patient with severe vertigo", "A positive (abnormal) Head Impulse Test", "Tinnitus", "None"]', 0, 'A normal Head Impulse Test in a patient with severe continuous vertigo is "INfarct" (more likely central).');

    ---------------------------------------------------------------------------
    -- CASE 38: Motion Sickness
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sea Legs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sea Legs', 'A 24-year-old female complains of severe nausea and dizziness whenever she tries to read while in a moving car.

Vitals: Stable.
Physical Examination: Normal.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Motion Sickness (Kinetosis).', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of motion sickness?', '["Inner ear infection", "Sensory conflict between the vestibular, visual, and somatosensory systems", "Bad food", "None"]', 1, 'For example, the eyes see a stationary book while the vestibular system feels the car moving.'),
    (v_case_id, 'Which medication is commonly used as a patch behind the ear for motion sickness prophylaxis?', '["Scopolamine", "Amoxicillin", "Lisinopril", "Insulin"]', 0, 'Scopolamine is an anticholinergic that suppresses vestibular input.'),
    (v_case_id, 'Non-pharmacological advice for motion sickness in a car includes:', '["Looking at the phone", "Looking at the horizon (the distant outside environment)", "Closing one''s eyes tightly", "None"]', 1, 'This helps synchronize the visual and vestibular inputs.');

    ---------------------------------------------------------------------------
    -- CASE 39: Drug-Induced Vertigo (Vestibulotoxicity)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wobbly Walk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wobbly Walk', 'A patient treated with Streptomycin for tuberculosis now complains that the world "bounces" when he walks (oscillopsia) and he has to hold onto walls at night.

Vitals: Stable.
Physical Examination: Positive "Head Thrust Test" bilaterally. Significant unsteadiness on Romberg test.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilateral Vestibulotoxicity; oscillopsia.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Oscillopsia"?', '["Loss of vision", "The illusion of the environment jumping or bouncing during head movement", "Seeing double", "None"]', 1, 'It occurs due to loss of the Vestibulo-Ocular Reflex (VOR).'),
    (v_case_id, 'Which drug is most famously VESTIBULO-toxic (rather than cochleotoxic)?', '["Amoxicillin", "Streptomycin", "Aspirin", "None"]', 1, 'Streptomycin and Gentamicin are highly vestibulotoxic.'),
    (v_case_id, 'True or False: Recovery from bilateral vestibular loss is often complete and rapid.', '["True", "False"]', 1, 'Recovery is slow and relies on sensory substitution (using eyes and proprioception); it is often permanent.');

    ---------------------------------------------------------------------------
    -- CASE 40: Mal de Debarquement Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Boat on Land' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Boat on Land', 'A 40-year-old female just returned from a 7-day cruise. She feels like she is still on the boat, with a persistent "rocking" or "swaying" sensation that only improves when she is back in a moving vehicle.

Vitals: Stable.
Physical Examination: Normal. No nystagmus.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mal de Debarquement Syndrome; persistent rocking sensation after travel.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Mal de Debarquement"?', '["A type of flu", "Sickness of disembarkation; a persistent sensation of motion after travel", "Fear of boats", "None"]', 1, 'It most commonly occurs after a cruise or long flight.'),
    (v_case_id, 'What is a unique feature of the dizziness in this syndrome?', '["It is worse in a car", "It improves during passive motion (e.g., being a passenger in a moving car)", "It causes deafness", "None"]', 1, 'This is a key diagnostic feature.'),
    (v_case_id, 'True or False: Mal de Debarquement usually resolves within days, but can become chronic.', '["True", "False"]', 0, 'In some cases, the "rocking" sensation can last for months or years.');

    ---------------------------------------------------------------------------
    -- CASE 41: Primary Acquired Cholesteatoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Attic Debris' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Attic Debris', 'A 12-year-old boy presents with painless, scant, foul-smelling drainage from the left ear and progressive hearing loss.

Vitals: Stable.
Physical Examination: Otoscopy reveals a retraction pocket in the pars flaccida (attic) of the TM, containing white, squamous debris (keratin).
Laboratory Results: Audiogram shows a 30 dB conductive hearing loss.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Primary Acquired Cholesteatoma; pars flaccida retraction with keratin.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a cholesteatoma?', '["A malignant tumor", "A benign but locally aggressive collection of desquamated keratinizing squamous epithelium in the middle ear", "A cholesterol cyst", "None"]', 1, 'Despite the name, it is not a tumor and does not contain cholesterol.'),
    (v_case_id, 'What is the most common site of origin for a primary acquired cholesteatoma?', '["Pars tensa", "Pars flaccida (Shrapnell''s membrane)", "External canal", "None"]', 1, 'Negative middle ear pressure pulls the weak pars flaccida inward, creating a pocket.'),
    (v_case_id, 'Why is a cholesteatoma dangerous even if it is not "cancer"?', '["It is contagious", "It produces enzymes (collagenases) that erode bone, including ossicles and the skull base", "It causes high fever", "None"]', 1, 'Bone erosion can lead to hearing loss, vertigo, facial palsy, and intracranial infections.');

    ---------------------------------------------------------------------------
    -- CASE 42: Secondary Acquired Cholesteatoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Migration Error' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Migration Error', 'A 55-year-old male with a history of a large marginal TM perforation for 20 years now has a white mass visible through the perforation.

Vitals: Stable.
Physical Examination: Large marginal perforation of the posterior-superior TM. Squamous epithelium is seen migrating from the EAC into the middle ear space.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Secondary Acquired Cholesteatoma; migration of skin through a marginal perforation.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does a secondary acquired cholesteatoma form?', '["Retraction pocket", "Migration of squamous epithelium through a pre-existing TM perforation", "Genetic mutation", "None"]', 1, 'This typically occurs through marginal or attic perforations.'),
    (v_case_id, 'What is a "Marginal" perforation?', '["A perforation in the center of the TM", "A perforation that reaches the bony annulus (edge) of the TM", "A small hole", "None"]', 1, 'Marginal perforations carry a much higher risk of cholesteatoma than central ones.'),
    (v_case_id, 'Treatment for cholesteatoma is almost always:', '["Antibiotic drops", "Surgical (Tympanomastoidectomy)", "Observation", "None"]', 1, 'The goal is to create a "safe" ear by removing all squamous debris and diseased bone.');

    ---------------------------------------------------------------------------
    -- CASE 43: Congenital Cholesteatoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The White Pearl' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The White Pearl', 'A 4-year-old boy is seen for a routine check-up. He has no history of ear infections or surgery.

Vitals: Stable.
Physical Examination: Behind an intact, normal-appearing TM, there is a discrete, pearl-white mass in the anterior-superior quadrant of the middle ear.
Laboratory Results: Normal hearing.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Congenital Cholesteatoma; white mass behind an intact TM.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the criteria for a "Congenital" cholesteatoma?', '["White mass behind an intact TM", "No history of TM perforation or ear surgery", "No history of previous otitis media (though some allow for mild AOM)", "All of the above"]', 3, 'These criteria distinguish it from acquired types.'),
    (v_case_id, 'What is the most common location for a congenital cholesteatoma?', '["Posterior-superior", "Anterior-superior", "Hypotympanum", "None"]', 1, 'It is often found in the anterior-superior quadrant of the middle ear.'),
    (v_case_id, 'True or False: Congenital cholesteatomas are often asymptomatic until they grow large enough to cause hearing loss.', '["True", "False"]', 0, 'They are often discovered incidentally during routine screening.');

    ---------------------------------------------------------------------------
    -- CASE 44: Chronic Ear (Radical Mastoidectomy)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Failed Repair' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Failed Repair', 'A 60-year-old female has had three previous surgeries for cholesteatoma, but the disease keeps recurring. She has significant hearing loss and a "dead" ear.

Vitals: Stable.
Physical Examination: Extensive disease in the middle ear and mastoid.
Laboratory Results: Profound SNHL in the affected ear.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Ear; indication for Radical Mastoidectomy.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Radical Mastoidectomy"?', '["A minor procedure", "A surgery that creates a common cavity of the EAC, middle ear, and mastoid, removing the TM and ossicles", "A brain surgery", "None"]', 1, 'It is used for extensive disease when hearing reconstruction is not possible or desired.'),
    (v_case_id, 'What is the goal of a "Canal Wall Down" mastoidectomy?', '["To improve hearing", "To provide better access for disease removal and create a cavity that can be easily cleaned in the office", "To fix a broken nose", "None"]', 1, 'This is often done for aggressive or recurrent cholesteatoma.'),
    (v_case_id, 'What is a common maintenance requirement for a mastoid bowl (cavity)?', '["Regular cleaning of earwax/debris by an ENT (every 6-12 months)", "Daily antibiotics", "None", "Regular swimming"]', 0, 'The large cavity does not self-clean effectively.');

    ---------------------------------------------------------------------------
    -- CASE 45: Facial Nerve Palsy (Cholesteatoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crooked Smile' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crooked Smile', 'A patient with a known cholesteatoma presents with sudden inability to close the eye or smile on the affected side.

Vitals: Stable.
Physical Examination: House-Brackmann Grade IV facial palsy.
Laboratory Results: CT shows the cholesteatoma eroding the fallopian canal (facial nerve canal) in the tympanic segment.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Facial Nerve Palsy as a complication of cholesteatoma.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which segment of the facial nerve is most commonly dehiscent or eroded by disease?', '["Meatal", "Tympanic (Horizontal)", "Mastoid (Vertical)", "None"]', 1, 'The tympanic segment above the oval window is the most vulnerable.'),
    (v_case_id, 'The development of facial palsy in the setting of chronic ear disease is an indication for:', '["Urgent surgical exploration and decompression/disease removal", "Wait and see", "Antibiotics only", "None"]', 0, 'This is a surgical emergency to save the nerve.'),
    (v_case_id, 'What is the House-Brackmann scale used for?', '["To measure hearing", "To grade the severity of facial nerve paralysis (I to VI)", "To measure weight", "None"]', 1, 'Grade I is normal; Grade VI is total paralysis.');

    ---------------------------------------------------------------------------
    -- CASE 46: Ramsay Hunt Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Vesicles' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Vesicles', 'A 50-year-old male presents with severe ear pain, facial paralysis, and a rash in his ear canal. He also complains of vertigo and hearing loss.

Vitals: Stable.
Physical Examination: Vesicles on an erythematous base in the EAC and on the pinna. Facial nerve palsy (HB Grade IV).
Laboratory Results: Audiogram shows SNHL.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ramsay Hunt Syndrome (Herpes Zoster Oticus).', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent of Ramsay Hunt Syndrome?', '["Herpes Simplex Virus", "Varicella Zoster Virus (Reactivation)", "Pseudomonas", "None"]', 1, 'It is a reactivation of "shingles" in the geniculate ganglion.'),
    (v_case_id, 'How does Ramsay Hunt typically differ from Bell''s Palsy?', '["Ramsay Hunt has vesicles and often involves CN VIII (hearing/balance)", "Bell''s palsy is more painful", "They are identical", "None"]', 0, 'The involvement of multiple cranial nerves and the rash distinguishes Ramsay Hunt.'),
    (v_case_id, 'Treatment for Ramsay Hunt involves:', '["High-dose steroids and antivirals (e.g., Valacyclovir)", "Antibiotics", "Surgery", "None"]', 0, 'Early treatment improves the prognosis for facial nerve recovery.');

    ---------------------------------------------------------------------------
    -- CASE 47: Relapsing Polychondritis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Pinna' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Pinna', 'A 45-year-old female presents with bilateral painful, red, and swollen ears.

Vitals: Stable.
Physical Examination: The cartilaginous part of both pinnae is bright red and tender. Importantly, the earlobe is completely normal and unaffected.
Laboratory Results: Elevated ESR and CRP.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Relapsing Polychondritis; red pinna sparing the earlobe.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Relapsing Polychondritis?', '["A skin infection", "A multi-system autoimmune disease targeting cartilage", "A fungal infection", "None"]', 1, 'It can also affect the nose, trachea, and heart valves.'),
    (v_case_id, 'Why is the earlobe spared in this condition?', '["Better blood supply", "It contains no cartilage", "It is not exposed to the air", "None"]', 1, 'The disease specifically targets cartilaginous structures.'),
    (v_case_id, 'What is a potentially life-threatening complication of this disease?', '["Earwax buildup", "Tracheobronchial collapse", "Hearing loss", "None"]', 1, 'Cartilage destruction in the airway can lead to respiratory failure.');

    ---------------------------------------------------------------------------
    -- CASE 48: Exostoses (Surfer''s Ear)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cold Water Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cold Water Ear', 'A 30-year-old male surfer complains of recurrent ear infections and water getting "trapped" in his ears.

Vitals: Stable.
Physical Examination: Otoscopy shows multiple, bilateral, smooth, bony outgrowths (humps) in the medial EAC, partially obscuring the TM.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Exostoses (Surfer''s Ear); multiple bilateral bony outgrowths.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of exostoses?', '["Genetic", "Chronic exposure to cold water", "Tumor", "None"]', 1, 'The cold water stimulates reactive bone growth.'),
    (v_case_id, 'How do exostoses differ from an Osteoma?', '["Exostoses are multiple and bilateral; Osteomas are usually single and unilateral", "They are the same", "Exostoses are soft", "None"]', 0, 'This is a classic distinction in ENT.'),
    (v_case_id, 'Management of asymptomatic exostoses:', '["Immediate surgery", "Observation and use of earplugs during water activities", "Daily drops", "None"]', 1, 'Surgery (canalplasty) is only indicated if they cause significant hearing loss or recurrent infections.');

    ---------------------------------------------------------------------------
    -- CASE 49: Glomus Tympanicum
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thumping Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thumping Ear', 'A 55-year-old female presents with "thumping" or "pulsatile" tinnitus in her right ear that is synchronous with her heartbeat.

Vitals: Stable.
Physical Examination: A red/blue pulsatile mass is visible behind the inferior part of the TM. "Brown''s Sign" (the mass blanches with positive pressure on pneumatic otoscopy) is positive.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Glomus Tympanicum; pulsatile mass behind the TM.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Glomus Tympanicum?', '["A bacterial infection", "A highly vascular paraganglioma of the middle ear", "A type of earwax", "None"]', 1, 'It arises from the Jacobson''s nerve (tympanic branch of CN IX).'),
    (v_case_id, 'What is the most common presenting symptom of a glomus tumor?', '["Severe pain", "Pulsatile tinnitus", "Fever", "None"]', 1, 'The patient hears the blood flow through the tumor.'),
    (v_case_id, 'What is "Brown''s Sign"?', '["A skin rash", "Blanching of the middle ear mass with pneumatic otoscopy", "Loss of balance", "None"]', 1, 'The pressure temporarily slows the blood flow in the vascular mass.');

    ---------------------------------------------------------------------------
    -- CASE 50: Foreign Body in EAC (Insect)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scratching Sound' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scratching Sound', 'A 10-year-old male is brought to the ED at 2 AM screaming that something is "scratching" and "moving" inside his ear.

Vitals: Stable.
Physical Examination: Otoscopy shows a live cockroach moving in the EAC, near the TM.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Live foreign body (insect) in the EAC.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in managing a live insect in the ear?', '["Try to grab it with forceps immediately", "Kill or immobilize it with mineral oil or lidocaine before removal", "Order an X-ray", "None"]', 1, 'Removing a live insect can cause it to panic and damage the TM; drowning it first is safer.'),
    (v_case_id, 'Why should vegetable-based objects (like beans or peas) NOT be irrigated with water?', '["It makes them toxic", "They can swell and become more difficult to remove", "They dissolve and cause infection", "None"]', 1, 'Hygroscopic objects should be removed mechanically.'),
    (v_case_id, 'Which foreign body in the ear requires truly EMERGENT removal?', '["A bead", "A button battery", "A piece of cotton", "None"]', 1, 'Button batteries can cause rapid liquefactive necrosis and permanent damage.');

END $$;

COMMIT;
