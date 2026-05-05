-- ENT (Otolaryngology) / Dermatology: Common Dermatoses
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: derm-common-dermatoses
-- Sourced/Inspired by: Fitzpatrick's, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-common-dermatoses' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-common-dermatoses';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Atopic Dermatitis (Infantile Phase)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Itchy Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Itchy Infant', 'A 6-month-old infant is brought to the clinic for a severe rash. The mother reports the infant is constantly scratching and rubbing his face against the crib sheets. The rash spares the diaper area.

Vitals: Normal.
Physical Examination: Erythematous, ill-defined, scaly, and oozing plaques prominently over the cheeks, scalp, and extensor surfaces of the arms and legs. The diaper area is completely clear.
Laboratory Results: Elevated total IgE.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-month-old infant is brought to the clinic for a severe rash. The mother reports the infant is constantly scratching and rubbing his face against the crib sheets. The rash spares the diaper area.

Vitals: Normal.
Physical Examination: Erythematous, ill-defined, scaly, and oozing plaques prominently over the cheeks, scalp, and extensor surfaces of the arms and legs. The diaper area is completely clear.
Laboratory Results: Elevated total IgE.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic distribution of atopic dermatitis in infants?', '["Flexural creases (antecubital and popliteal fossae)","Face (cheeks), scalp, and extensor surfaces of the extremities","Trunk and diaper area","Palms and soles"]', 1, 'In infants (0-2 years), the rash classically affects the face and extensors, while sparing the diaper area due to the moisture barrier of the diaper.'),
    (v_case_id, 'What genetic mutation is heavily implicated in the pathogenesis of severe atopic dermatitis?', '["BRCA1","Filaggrin (FLG)","TP53","CFTR"]', 1, 'Loss-of-function mutations in the filaggrin gene compromise the epidermal barrier, leading to transepidermal water loss and allergen penetration.'),
    (v_case_id, 'What is the most critical first-line daily maintenance therapy for this infant?', '["Oral corticosteroids","Frequent application of thick emollients (ointments/creams) immediately after bathing","Topical antibiotics","Phototherapy"]', 1, 'Barrier repair with liberal emollient use is the cornerstone of atopic dermatitis management.');

    ---------------------------------------------------------------------------
    -- CASE 02: Atopic Dermatitis (Childhood/Adult Phase)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flexural Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flexural Rash', 'A 15-year-old girl with a history of asthma and allergic rhinitis presents with a chronic, severely pruritic rash. She states she ''just can''t stop scratching.''

Vitals: Normal.
Physical Examination: Erythematous, excoriated, and lichenified (thickened, with accentuated skin markings) plaques located in the antecubital and popliteal fossae, as well as the posterior neck.
Laboratory Results: Eosinophilia.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl with a history of asthma and allergic rhinitis presents with a chronic, severely pruritic rash. She states she ''just can''t stop scratching.''

Vitals: Normal.
Physical Examination: Erythematous, excoriated, and lichenified (thickened, with accentuated skin markings) plaques located in the antecubital and popliteal fossae, as well as the posterior neck.
Laboratory Results: Eosinophilia.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does the distribution of atopic dermatitis shift as a child grows older?', '["It moves from the flexures to the extensors","It moves from the face/extensors to the flexural creases (antecubital and popliteal fossae)","It localizes only to the groin","It only affects the face"]', 1, 'After age 2, the distribution classically shifts to the flexural folds.'),
    (v_case_id, 'What defines the ''Atopic Triad''?', '["Acne, Rosacea, Psoriasis","Atopic dermatitis, Allergic rhinitis, and Asthma","Eczema, Urticaria, Anaphylaxis","Psoriasis, Arthritis, Uveitis"]', 1, 'Patients with one atopic disease are genetically predisposed to develop the others.'),
    (v_case_id, 'What is the primary cause of the lichenification seen in this patient?', '["Bacterial infection","Chronic scratching and rubbing (the ''itch that rashes'')","Use of topical steroids","Sun exposure"]', 1, 'Lichenification is a reactive thickening of the epidermis secondary to chronic mechanical trauma.');

    ---------------------------------------------------------------------------
    -- CASE 03: Eczema Herpeticum
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Punched-Out Lesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Punched-Out Lesions', 'A 4-year-old boy with known severe atopic dermatitis presents with a rapid worsening of his skin over the past 3 days. He has a low-grade fever and is irritable.

Vitals: T 38.2 C, HR 110.
Physical Examination: Widespread clusters of monomorphic, punched-out, hemorrhagic erosions and crusted vesicles on the face and neck, overlying areas of active eczema.
Laboratory Results: Tzanck smear from a fresh vesicle shows multinucleated giant cells.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old boy with known severe atopic dermatitis presents with a rapid worsening of his skin over the past 3 days. He has a low-grade fever and is irritable.

Vitals: T 38.2 C, HR 110.
Physical Examination: Widespread clusters of monomorphic, punched-out, hemorrhagic erosions and crusted vesicles on the face and neck, overlying areas of active eczema.
Laboratory Results: Tzanck smear from a fresh vesicle shows multinucleated giant cells.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Impetigo","Eczema Herpeticum (Kaposi varicelliform eruption)","Varicella (Chickenpox)","Psoriasis"]', 1, 'Eczema herpeticum is a disseminated Herpes Simplex Virus (HSV) infection occurring in patients with a compromised skin barrier, most commonly atopic dermatitis.'),
    (v_case_id, 'What classic morphological feature distinguishes Eczema Herpeticum from typical bacterial impetigo?', '["Honey-colored crusts","Monomorphic ''punched-out'' erosions and umbilicated vesicles","Large tense bullae","Silvery scales"]', 1, 'The lesions are uniformly sized, discrete, punched-out erosions that often become hemorrhagic or crusted.'),
    (v_case_id, 'What is the most appropriate immediate medical treatment?', '["Topical hydrocortisone","Systemic antiviral therapy (e.g., oral or IV Acyclovir)","Oral antibiotics (cephalexin)","Emollients only"]', 1, 'This is a dermatologic emergency that requires prompt systemic antiviral therapy to prevent progression to keratoconjunctivitis, encephalitis, or death.');

    ---------------------------------------------------------------------------
    -- CASE 04: Nummular Eczema
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Coin-Shaped Plaques' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Coin-Shaped Plaques', 'A 65-year-old man presents with an extremely itchy rash on his lower legs that has been present for 2 months, worsening in the dry winter air. He has tried over-the-counter moisturizers without relief.

Vitals: Normal.
Physical Examination: Multiple 2-5 cm, sharply demarcated, coin-shaped (discoid) erythematous plaques with overlying crust and scale on the bilateral anterior lower legs. No central clearing.
Laboratory Results: KOH preparation is negative for fungal hyphae.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old man presents with an extremely itchy rash on his lower legs that has been present for 2 months, worsening in the dry winter air. He has tried over-the-counter moisturizers without relief.

Vitals: Normal.
Physical Examination: Multiple 2-5 cm, sharply demarcated, coin-shaped (discoid) erythematous plaques with overlying crust and scale on the bilateral anterior lower legs. No central clearing.
Laboratory Results: KOH preparation is negative for fungal hyphae.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tinea Corporis","Nummular Eczema (Discoid eczema)","Plaque Psoriasis","Lichen Planus"]', 1, 'Nummular (coin-shaped) eczema presents as intensely pruritic, round plaques, classically on the extremities of older adults.'),
    (v_case_id, 'Why was a KOH preparation performed, and what does the negative result help rule out?', '["To rule out bacterial infection","To definitively rule out Tinea Corporis (ringworm), which can also present as round scaly plaques","To rule out scabies","To rule out psoriasis"]', 1, 'Tinea corporis classically has central clearing and a leading scaly edge, but nummular eczema can look very similar.'),
    (v_case_id, 'What is the first-line pharmacologic treatment for Nummular Eczema?', '["Topical antifungals","Mid-to-high potency topical corticosteroids","Oral antibiotics","Oral antihistamines only"]', 1, 'Nummular eczema is highly inflammatory and resistant; it requires strong topical steroids and aggressive moisturization.');

    ---------------------------------------------------------------------------
    -- CASE 05: Dyshidrotic Eczema (Pompholyx)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tapioca Blisters' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tapioca Blisters', 'A 28-year-old nurse presents with recurrent, intensely itchy blisters on her hands. She washes her hands frequently at work.

Vitals: Normal.
Physical Examination: Deep-seated, firm, clear vesicles resembling ''tapioca pudding'' clustered along the lateral aspects of the fingers and on the palms. The surrounding skin is red and peeling.
Laboratory Results: None.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old nurse presents with recurrent, intensely itchy blisters on her hands. She washes her hands frequently at work.

Vitals: Normal.
Physical Examination: Deep-seated, firm, clear vesicles resembling ''tapioca pudding'' clustered along the lateral aspects of the fingers and on the palms. The surrounding skin is red and peeling.
Laboratory Results: None.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Scabies","Dyshidrotic Eczema (Pompholyx)","Psoriasis","Tinea Manuum"]', 1, 'Dyshidrotic eczema classically presents with deep-seated, intensely pruritic ''tapioca-like'' vesicles on the palms, soles, and lateral fingers.'),
    (v_case_id, 'Despite the historical name ''dyshidrotic'', what is true regarding the pathogenesis of this condition?', '["It is caused by blocked sweat glands","It is NOT related to sweat gland dysfunction; it is a form of vesicular eczema often triggered by stress, wet work, or metal allergies (nickel/cobalt)","It is a bacterial infection","It only occurs in summer"]', 1, 'The sweat glands are normal. It is an endogenous eczema.'),
    (v_case_id, 'What is the first-line treatment for acute flares of Dyshidrotic Eczema?', '["Topical antifungals","Ultra-high potency topical corticosteroids (e.g., Clobetasol) due to the thick stratum corneum of the palms","Oral acyclovir","Salicylic acid"]', 1, 'The thick skin of the palms and soles requires Class 1 (super-potent) steroids to penetrate.');

    ---------------------------------------------------------------------------
    -- CASE 06: Allergic Contact Dermatitis (Rhus Dermatitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Linear Blisters' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Linear Blisters', 'A 35-year-old male presents with severe itching on his forearms and legs. He was clearing brush in the woods two days ago. He reports no prior history of skin disease.

Vitals: Normal.
Physical Examination: Extremely pruritic, erythematous streaks and sharp linear arrays of papules and tense vesicles on the exposed areas of the forearms and lower legs.
Laboratory Results: None.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male presents with severe itching on his forearms and legs. He was clearing brush in the woods two days ago. He reports no prior history of skin disease.

Vitals: Normal.
Physical Examination: Extremely pruritic, erythematous streaks and sharp linear arrays of papules and tense vesicles on the exposed areas of the forearms and lower legs.
Laboratory Results: None.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Impetigo","Allergic Contact Dermatitis due to Poison Ivy/Oak (Rhus dermatitis)","Shingles","Scabies"]', 1, 'Linear configurations of vesicles are the hallmark of an exogenous contact dermatitis, specifically from brushing against a plant.'),
    (v_case_id, 'What type of hypersensitivity reaction is Allergic Contact Dermatitis?', '["Type I (IgE-mediated)","Type II (Cytotoxic)","Type III (Immune complex)","Type IV (Delayed, T-cell mediated)"]', 3, 'It requires prior sensitization and takes 48-72 hours for the memory T-cells to mount the inflammatory response upon re-exposure.'),
    (v_case_id, 'What is the specific allergenic resin found in Poison Ivy, Oak, and Sumac?', '["Nickel","Urushiol","Neomycin","Balsam of Peru"]', 1, 'Urushiol binds to skin proteins and acts as a hapten, triggering the severe Type IV reaction.');

    ---------------------------------------------------------------------------
    -- CASE 07: Allergic Contact Dermatitis (Nickel)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Belt Buckle Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Belt Buckle Rash', 'A 22-year-old female presents with an itchy rash on her lower abdomen that comes and goes. She notes it seems worse when she wears her favorite jeans.

Vitals: Normal.
Physical Examination: A well-demarcated, 4x4 cm erythematous, scaly, and slightly lichenified plaque located exactly at the umbilicus/infraumbilical region.
Laboratory Results: None.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old female presents with an itchy rash on her lower abdomen that comes and goes. She notes it seems worse when she wears her favorite jeans.

Vitals: Normal.
Physical Examination: A well-demarcated, 4x4 cm erythematous, scaly, and slightly lichenified plaque located exactly at the umbilicus/infraumbilical region.
Laboratory Results: None.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of Allergic Contact Dermatitis worldwide, and the likely cause in this patient?', '["Latex","Nickel (from the metal button/belt buckle of her jeans)","Gold","Fragrance"]', 1, 'Nickel is ubiquitous in jewelry, belt buckles, and clothing snaps. The infraumbilical location is a classic ''giveaway'' for a nickel button allergy.'),
    (v_case_id, 'If the diagnosis is uncertain, what is the gold standard test to confirm the specific allergen causing a contact dermatitis?', '["Skin prick testing (allergy shots)","Patch testing","Serum IgE levels","Skin biopsy"]', 1, 'Patch testing applies allergens to the back for 48 hours to deliberately induce and read a localized Type IV hypersensitivity reaction.'),
    (v_case_id, 'Why is skin prick testing NOT useful for diagnosing Allergic Contact Dermatitis?', '["It hurts too much","Skin prick tests evaluate Type I (IgE-mediated, immediate) hypersensitivity, not Type IV (delayed, T-cell mediated) hypersensitivity","It is too expensive","It only works on the face"]', 1, 'Prick testing is for hives and anaphylaxis (Type I), not contact eczema (Type IV).');

    ---------------------------------------------------------------------------
    -- CASE 08: Irritant Contact Dermatitis (Diaper Dermatitis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sparing Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sparing Rash', 'A 9-month-old infant presents with a bright red rash in the diaper area. The parents note the infant recently had a mild diarrheal illness.

Vitals: Normal.
Physical Examination: Bright erythematous, glazed patches over the convex surfaces of the buttocks, thighs, and lower abdomen. Crucially, the deep skin folds (inguinal creases) are completely SPARED.
Laboratory Results: None.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 9-month-old infant presents with a bright red rash in the diaper area. The parents note the infant recently had a mild diarrheal illness.

Vitals: Normal.
Physical Examination: Bright erythematous, glazed patches over the convex surfaces of the buttocks, thighs, and lower abdomen. Crucially, the deep skin folds (inguinal creases) are completely SPARED.
Laboratory Results: None.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Candidal diaper dermatitis","Irritant contact diaper dermatitis","Seborrheic dermatitis","Inverse psoriasis"]', 1, 'Irritant diaper dermatitis affects the convexities (where the diaper rubs and traps urine/feces) and classically spares the deep folds.'),
    (v_case_id, 'How does the physical exam specifically rule out Candidal diaper dermatitis?', '["The color is red","Candidal dermatitis classically INVOLVES the skin folds and has satellite papules/pustules beyond the main border","Candida only happens in adults","It doesn''t rule it out"]', 1, 'Yeast loves warm, moist environments, so it thrives deep inside the inguinal folds. Irritant dermatitis spares the folds.'),
    (v_case_id, 'What is the primary treatment for irritant diaper dermatitis?', '["Topical antifungals","Frequent diaper changes, airing out the area, and thick barrier creams (e.g., zinc oxide or petrolatum)","Oral antibiotics","High-potency steroids"]', 1, 'Prevention involves protecting the skin from prolonged contact with urine and feces.');

    ---------------------------------------------------------------------------
    -- CASE 09: Seborrheic Dermatitis (Cradle Cap)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Greasy Scalp' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Greasy Scalp', 'A 6-week-old infant is brought in for a rash on his head. The parents have been trying to wash it off, but it persists. The infant does not seem bothered by it and is feeding well.

Vitals: Normal.
Physical Examination: Thick, greasy, yellow crusts and scales tightly adherent to the vertex of the scalp. No significant erythema. The rest of the skin is clear.
Laboratory Results: None.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-week-old infant is brought in for a rash on his head. The parents have been trying to wash it off, but it persists. The infant does not seem bothered by it and is feeding well.

Vitals: Normal.
Physical Examination: Thick, greasy, yellow crusts and scales tightly adherent to the vertex of the scalp. No significant erythema. The rest of the skin is clear.
Laboratory Results: None.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the common term for this infantile presentation of Seborrheic Dermatitis?', '["Dandruff","Cradle Cap","Ringworm","Impetigo"]', 1, 'Cradle cap is extremely common, benign, and self-limiting in young infants, driven by maternal androgens.'),
    (v_case_id, 'What yeast species is strongly implicated in the pathogenesis of Seborrheic Dermatitis?', '["Candida albicans","Malassezia species (formerly Pityrosporum ovale)","Trichophyton rubrum","Cryptococcus neoformans"]', 1, 'Malassezia is a lipophilic yeast that lives in sebum-rich areas and triggers an inflammatory response in susceptible individuals.'),
    (v_case_id, 'What is the recommended treatment for this infant?', '["Oral antifungals","Gentle washing with baby shampoo, applying mineral oil to soften crusts, and gentle brushing; it is benign and self-resolving","High-potency topical steroids","UV light therapy"]', 1, 'Aggressive treatment is unnecessary and potentially harmful for simple cradle cap.');

    ---------------------------------------------------------------------------
    -- CASE 10: Seborrheic Dermatitis (Adult)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nasolabial Redness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nasolabial Redness', 'A 35-year-old male presents with a persistent, slightly itchy rash on his face and chest. He notes ''dandruff'' that falls onto his shoulders.

Vitals: Normal.
Physical Examination: Ill-defined erythematous patches with fine, greasy, yellowish scales located on the nasolabial folds, eyebrows, glabella, and the central chest (pre-sternal area).
Laboratory Results: None.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male presents with a persistent, slightly itchy rash on his face and chest. He notes ''dandruff'' that falls onto his shoulders.

Vitals: Normal.
Physical Examination: Ill-defined erythematous patches with fine, greasy, yellowish scales located on the nasolabial folds, eyebrows, glabella, and the central chest (pre-sternal area).
Laboratory Results: None.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic distribution of Adult Seborrheic Dermatitis?', '["Extensor surfaces of elbows and knees","Sebum-rich areas: scalp, eyebrows, glabella, nasolabial folds, central chest, and external auditory canals","Palms and soles","Only the back"]', 1, 'The rash follows the density of sebaceous glands.'),
    (v_case_id, 'If a young adult presents with sudden, extremely severe, widespread, and intractable Seborrheic Dermatitis, what underlying systemic condition MUST be screened for?', '["Diabetes","HIV infection","Hypothyroidism","Celiac disease"]', 1, 'Severe, explosive seborrheic dermatitis is a classic early cutaneous manifestation of HIV/AIDS or Parkinson''s disease.'),
    (v_case_id, 'What is the first-line pharmacologic treatment for facial Seborrheic Dermatitis?', '["Oral steroids","Topical antifungals (e.g., Ketoconazole cream) and low-potency topical corticosteroids (e.g., Hydrocortisone 1% or 2.5%)","Oral isotretinoin","Topical 5-fluorouracil"]', 1, 'Antifungals target the Malassezia yeast, while low-potency steroids reduce the inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 11: Stasis Dermatitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heavy Legs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heavy Legs', 'A 65-year-old woman with a history of obesity, multiple pregnancies, and deep vein thrombosis presents with bilateral itchy rashes on her lower legs.

Vitals: Normal. BMI 35.
Physical Examination: Bilateral lower legs show pitting edema, prominent varicose veins, and areas of reddish-brown hyperpigmentation. The medial malleoli have weeping, erythematous, scaly plaques.
Laboratory Results: Ultrasound of the lower extremities shows venous valvular incompetence.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old woman with a history of obesity, multiple pregnancies, and deep vein thrombosis presents with bilateral itchy rashes on her lower legs.

Vitals: Normal. BMI 35.
Physical Examination: Bilateral lower legs show pitting edema, prominent varicose veins, and areas of reddish-brown hyperpigmentation. The medial malleoli have weeping, erythematous, scaly plaques.
Laboratory Results: Ultrasound of the lower extremities shows venous valvular incompetence.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying pathophysiology causing Stasis Dermatitis?', '["Arterial insufficiency","Chronic venous insufficiency leading to venous hypertension, capillary permeability, and extravasation of fluid and red blood cells into the dermis","Lymphatic obstruction","Autoimmune attack"]', 1, 'The valves in the veins fail, blood pools in the legs, and the increased hydrostatic pressure pushes fluid and cells into the skin, causing inflammation.'),
    (v_case_id, 'What is the cause of the characteristic reddish-brown ''cayenne pepper'' discoloration (hyperpigmentation) in stasis dermatitis?', '["Melanin deposition","Hemosiderin deposition from the breakdown of extravasated red blood cells","Dirt","Fungal infection"]', 1, 'RBCs leak out of the high-pressure capillaries, die, and the iron (hemosiderin) permanently stains the skin.'),
    (v_case_id, 'What is the most critical, foundational treatment for Stasis Dermatitis?', '["Topical antibiotics","Compression therapy (e.g., compression stockings or Unna boots) and leg elevation","Surgical amputation","Oral steroids"]', 1, 'Topical steroids help the eczema, but if you do not reverse the venous hypertension with compression, it will never heal.');

    ---------------------------------------------------------------------------
    -- CASE 12: Asteatotic Eczema (Eczema Craquele)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dried Riverbed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dried Riverbed', 'An 80-year-old man living in a nursing home in winter presents with extremely itchy lower legs. He takes hot baths every day.

Vitals: Normal.
Physical Examination: The skin of the bilateral anterior shins is extremely dry, erythematous, and covered in a network of fine fissures resembling ''cracked porcelain'' or a dried riverbed.
Laboratory Results: None.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man living in a nursing home in winter presents with extremely itchy lower legs. He takes hot baths every day.

Vitals: Normal.
Physical Examination: The skin of the bilateral anterior shins is extremely dry, erythematous, and covered in a network of fine fissures resembling ''cracked porcelain'' or a dried riverbed.
Laboratory Results: None.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Cellulitis","Asteatotic Eczema (Eczema craquelé)","Psoriasis","Ichthyosis vulgaris"]', 1, 'Asteatotic eczema is caused by severe loss of skin surface lipids, presenting as intensely dry, fissured skin, most commonly on the shins of the elderly in winter.'),
    (v_case_id, 'What behavioral factor in this patient''s history heavily contributed to this condition?', '["Eating too much salt","Taking daily hot baths, which strips the natural lipid barrier from the aging skin","Walking too much","Wearing wool socks"]', 1, 'Hot water and aggressive soap use exacerbate the epidermal barrier dysfunction.'),
    (v_case_id, 'What is the primary treatment?', '["Oral antibiotics","Decreasing bathing frequency, using lukewarm water, and applying thick, greasy emollients (ointments) immediately after bathing to trap moisture","Topical antifungals","Phototherapy"]', 1, 'Restoring the lipid barrier is curative.');

    ---------------------------------------------------------------------------
    -- CASE 13: Lichen Simplex Chronicus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scratch that Thickened' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scratch that Thickened', 'A 45-year-old woman presents with a thick, itchy patch of skin on the back of her neck. She admits she rubs and scratches it constantly when she is stressed.

Vitals: Normal.
Physical Examination: A single, well-demarcated, hyperpigmented, fiercely lichenified (leathery) plaque on the posterior neck. The skin lines are deeply accentuated.
Laboratory Results: Biopsy shows hyperkeratosis, acanthosis, and a thickened granular layer.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman presents with a thick, itchy patch of skin on the back of her neck. She admits she rubs and scratches it constantly when she is stressed.

Vitals: Normal.
Physical Examination: A single, well-demarcated, hyperpigmented, fiercely lichenified (leathery) plaque on the posterior neck. The skin lines are deeply accentuated.
Laboratory Results: Biopsy shows hyperkeratosis, acanthosis, and a thickened granular layer.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Lichen Simplex Chronicus?', '["A primary autoimmune disease","A localized, end-stage hyperproliferation of the epidermis resulting purely from repetitive, chronic rubbing or scratching","A bacterial infection","A type of skin cancer"]', 1, 'It is essentially a callus that forms because the patient cannot stop scratching a specific spot.'),
    (v_case_id, 'What must the patient completely stop doing for the plaque to resolve?', '["Eating gluten","Scratching and rubbing the area","Going in the sun","Using soap"]', 1, 'If the mechanical trauma stops, the skin will eventually remodel back to normal.'),
    (v_case_id, 'What is the most effective topical therapy to break the itch-scratch cycle in this condition?', '["Hydrocortisone 1%","High or Ultra-high potency topical corticosteroids (under occlusion if necessary) to penetrate the thick, leathery skin","Aloe vera","Salicylic acid only"]', 1, 'Weak steroids will not penetrate the massive hyperkeratosis.');

    ---------------------------------------------------------------------------
    -- CASE 14: Plaque Psoriasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silvery Scales' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silvery Scales', 'A 30-year-old male presents with a chronic rash on his elbows and knees. It is mildly itchy but cosmetically bothersome.

Vitals: Normal.
Physical Examination: Well-demarcated, thick, erythematous plaques covered by a dense, micaceous (silvery-white) scale located symmetrically on the extensor surfaces of the elbows and knees, and the gluteal cleft.
Laboratory Results: None.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male presents with a chronic rash on his elbows and knees. It is mildly itchy but cosmetically bothersome.

Vitals: Normal.
Physical Examination: Well-demarcated, thick, erythematous plaques covered by a dense, micaceous (silvery-white) scale located symmetrically on the extensor surfaces of the elbows and knees, and the gluteal cleft.
Laboratory Results: None.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic distribution of Plaque Psoriasis?', '["Flexural creases","Extensor surfaces (elbows, knees), scalp, lumbosacral region, and gluteal cleft","Only the face","Palms and soles only"]', 1, 'Psoriasis favors extensors, while atopic dermatitis favors flexures.'),
    (v_case_id, 'If you physically scrape off the silvery scale and pinpoint bleeding occurs, what is this clinical sign called?', '["Nikolsky sign","Auspitz sign","Koebner phenomenon","Darier sign"]', 1, 'Auspitz sign occurs because the dermal papillae (and their blood vessels) are elongated and sit very close to the surface due to the thinning of the overlying suprapapillary epidermis.'),
    (v_case_id, 'What defines the Koebner phenomenon, which is highly characteristic of psoriasis?', '["Skin clears in the sun","The development of new psoriatic lesions at sites of skin trauma (e.g., a scratch or surgical scar)","Bleeding when scales are removed","Blistering with friction"]', 1, 'Trauma induces the inflammatory cascade that creates a new plaque.');

    ---------------------------------------------------------------------------
    -- CASE 15: Guttate Psoriasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Droplet Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Droplet Rash', 'A 16-year-old girl presents with a sudden eruption of hundreds of small, scaly spots all over her trunk and limbs. Two weeks ago, she had a severe sore throat and fever.

Vitals: Normal.
Physical Examination: Widespread, 2-10 mm, ''drop-like'' (guttate) erythematous, scaly papules and small plaques primarily on the trunk and proximal extremities.
Laboratory Results: Anti-streptolysin O (ASO) titer is elevated.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl presents with a sudden eruption of hundreds of small, scaly spots all over her trunk and limbs. Two weeks ago, she had a severe sore throat and fever.

Vitals: Normal.
Physical Examination: Widespread, 2-10 mm, ''drop-like'' (guttate) erythematous, scaly papules and small plaques primarily on the trunk and proximal extremities.
Laboratory Results: Anti-streptolysin O (ASO) titer is elevated.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pityriasis rosea","Guttate Psoriasis","Tinea versicolor","Secondary syphilis"]', 1, 'Guttate (''drop-like'') psoriasis typically presents as an acute, explosive eruption of small plaques.'),
    (v_case_id, 'What is the classic trigger for Guttate Psoriasis?', '["Viral URI","A recent Group A Beta-Hemolytic Streptococcal (GABHS) infection, usually pharyngitis","Sunburn","Starting a beta-blocker"]', 1, 'Strep acts as a superantigen, triggering the massive T-cell response in genetically susceptible individuals.'),
    (v_case_id, 'What is the natural history of this specific form of psoriasis?', '["It is always fatal","It often spontaneously resolves over weeks to months, though a subset of patients will eventually develop chronic plaque psoriasis","It leaves deep scars","It requires lifelong biologics"]', 1, 'Many patients have one episode and never get it again, while others transition to classic plaque disease.');

    ---------------------------------------------------------------------------
    -- CASE 16: Inverse Psoriasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hidden Redness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hidden Redness', 'A 40-year-old obese female complains of a painful, raw rash under her breasts and in her armpits. She has tried antifungal powders without success.

Vitals: BMI 34.
Physical Examination: Bright red, sharply demarcated, completely smooth (non-scaly), macerated plaques in the bilateral axillae and inframammary folds. A small, classic scaly plaque is noted in the gluteal cleft.
Laboratory Results: KOH is negative.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old obese female complains of a painful, raw rash under her breasts and in her armpits. She has tried antifungal powders without success.

Vitals: BMI 34.
Physical Examination: Bright red, sharply demarcated, completely smooth (non-scaly), macerated plaques in the bilateral axillae and inframammary folds. A small, classic scaly plaque is noted in the gluteal cleft.
Laboratory Results: KOH is negative.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Inverse Psoriasis?', '["Psoriasis that only affects the nails","Psoriasis that localizes to the skin folds (intertriginous areas like axillae, inframammary, groin) rather than the extensor surfaces","Psoriasis caused by medications","Psoriasis that heals quickly"]', 1, 'It is the ''inverse'' of the normal extensor distribution.'),
    (v_case_id, 'Why do the lesions of Inverse Psoriasis typically LACK the classic silvery scale?', '["It is a different disease","The warm, moist environment of the skin folds macerates and rubs off the scale, leaving smooth, glazed, red plaques","The yeast eats the scale","It hasn''t grown long enough"]', 1, 'Friction and moisture alter the morphology, making it easily misdiagnosed as fungal intertrigo.'),
    (v_case_id, 'Why should ultra-high potency topical steroids (like Clobetasol) be AVOIDED or used with extreme caution in Inverse Psoriasis?', '["They don''t work","Skin folds naturally occlude the medication, drastically increasing systemic absorption and the risk of local side effects (skin atrophy, striae)","They cause the rash to spread","They are too expensive"]', 1, 'Low to mid-potency steroids, or steroid-sparing agents (calcineurin inhibitors), are preferred in intertriginous areas.');

    ---------------------------------------------------------------------------
    -- CASE 17: Erythrodermic Psoriasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burning Red Man' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burning Red Man', 'A 55-year-old man with a long history of plaque psoriasis ran out of his systemic steroid medication abruptly. He presents to the ER with chills, malaise, and a burning sensation all over his body.

Vitals: T 38.5 C, HR 120, BP 100/60.
Physical Examination: Bright red erythema covering >90% of his total body surface area, with diffuse fine scaling. He is shivering despite the room being warm.
Laboratory Results: WBC 18,000, ESR 80.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old man with a long history of plaque psoriasis ran out of his systemic steroid medication abruptly. He presents to the ER with chills, malaise, and a burning sensation all over his body.

Vitals: T 38.5 C, HR 120, BP 100/60.
Physical Examination: Bright red erythema covering >90% of his total body surface area, with diffuse fine scaling. He is shivering despite the room being warm.
Laboratory Results: WBC 18,000, ESR 80.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Guttate Psoriasis","Erythrodermic Psoriasis","Toxic Epidermal Necrolysis","Stevens-Johnson Syndrome"]', 1, 'Erythroderma is defined as generalized erythema and scaling affecting >90% of the body surface area.'),
    (v_case_id, 'What is a major life-threatening complication of erythroderma?', '["Hair loss","High-output cardiac failure, severe hypothermia, and massive fluid/protein loss due to total failure of the skin barrier function","Blindness","Deafness"]', 1, 'The vasodilation of the entire skin surface shunts blood away from the core, causing hypothermia and forcing the heart to pump at high output.'),
    (v_case_id, 'What was the likely trigger for this acute severe flare?', '["A new soap","The abrupt withdrawal of systemic corticosteroids","Sun exposure","Drinking alcohol"]', 1, 'Systemic steroids are generally contraindicated in psoriasis because abruptly stopping them causes massive, life-threatening rebound flares (erythrodermic or pustular psoriasis).');

    ---------------------------------------------------------------------------
    -- CASE 18: Generalized Pustular Psoriasis (von Zumbusch)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sea of Pus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sea of Pus', 'A 40-year-old pregnant woman in her 3rd trimester presents with fever, malaise, and a sudden eruption of painful skin lesions.

Vitals: T 39.0 C, HR 115.
Physical Examination: Widespread sheets of erythema studded with hundreds of 2-3 mm, sterile, yellow pustules that coalesce into ''lakes of pus''.
Laboratory Results: WBC 25,000 with neutrophilia. Pustule culture is negative for bacteria.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old pregnant woman in her 3rd trimester presents with fever, malaise, and a sudden eruption of painful skin lesions.

Vitals: T 39.0 C, HR 115.
Physical Examination: Widespread sheets of erythema studded with hundreds of 2-3 mm, sterile, yellow pustules that coalesce into ''lakes of pus''.
Laboratory Results: WBC 25,000 with neutrophilia. Pustule culture is negative for bacteria.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Chickenpox","Generalized Pustular Psoriasis (von Zumbusch type)","Impetigo","Acne fulminans"]', 1, 'This is a rare, severe, systemic variant of psoriasis characterized by sterile pustules.'),
    (v_case_id, 'What is the nature of the pustules in Pustular Psoriasis?', '["Filled with Staph aureus","They are entirely STERILE, representing massive neutrophilic infiltration of the epidermis (Kogoj spongiform pustules), not an infection","Filled with yeast","Filled with viral particles"]', 1, 'Despite looking like a massive infection, antibiotics will do nothing. It is purely inflammatory.'),
    (v_case_id, 'What specific pregnancy-associated dermatosis is considered a variant of generalized pustular psoriasis?', '["PUPPP","Impetigo Herpetiformis","Pemphigoid gestationis","Prurigo of pregnancy"]', 1, 'Impetigo herpetiformis is a life-threatening form of pustular psoriasis triggered by pregnancy, carrying significant risk for placental insufficiency and fetal death.');

    ---------------------------------------------------------------------------
    -- CASE 19: Psoriatic Arthritis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sausage Digits' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sausage Digits', 'A 45-year-old male with a history of psoriasis presents to the rheumatologist. His right index finger and left second toe are uniformly swollen, red, and painful.

Vitals: Normal.
Physical Examination: Psoriatic plaques on the elbows. The affected digits are diffusely swollen resembling ''sausages''. He has pitting of his fingernails.
Laboratory Results: Rheumatoid factor is negative.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male with a history of psoriasis presents to the rheumatologist. His right index finger and left second toe are uniformly swollen, red, and painful.

Vitals: Normal.
Physical Examination: Psoriatic plaques on the elbows. The affected digits are diffusely swollen resembling ''sausages''. He has pitting of his fingernails.
Laboratory Results: Rheumatoid factor is negative.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the diffuse swelling of an entire digit seen in this patient?', '["Bouchard node","Dactylitis (''sausage digit'')","Heberden node","Swan neck deformity"]', 1, 'Dactylitis is caused by profound inflammation of both the joint and the surrounding tenosynovium, highly characteristic of Psoriatic Arthritis.'),
    (v_case_id, 'Psoriatic arthritis is classified in what family of rheumatologic diseases?', '["Crystal arthropathies","Seronegative Spondyloarthropathies (associated with HLA-B27, negative Rheumatoid Factor)","Connective tissue diseases","Vasculitis"]', 1, 'Like Ankylosing Spondylitis and Reactive Arthritis, it is RF negative and often involves the axial spine.'),
    (v_case_id, 'What classic radiographic finding is seen in the distal interphalangeal (DIP) joints in advanced Psoriatic Arthritis?', '["Bamboo spine","''Pencil-in-cup'' deformity (osteolysis of the proximal phalanx with bony proliferation of the distal phalanx)","Rat bite erosions","Punched out lesions"]', 1, 'The aggressive, destructive bone remodeling creates a sharpened bone resting in a cupped bone.');

    ---------------------------------------------------------------------------
    -- CASE 20: Psoriatic Nail Disease
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pitted Nails' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pitted Nails', 'A 35-year-old female presents to the dermatologist. Her only complaint is that her fingernails look ''ugly.''

Vitals: Normal.
Physical Examination: The nails show multiple small, ice-pick-like depressions on the surface. Several nails have yellowish-brown spots under the nail plate. Her scalp shows mild silvery scaling.
Laboratory Results: KOH of the nail clippings is negative.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female presents to the dermatologist. Her only complaint is that her fingernails look ''ugly.''

Vitals: Normal.
Physical Examination: The nails show multiple small, ice-pick-like depressions on the surface. Several nails have yellowish-brown spots under the nail plate. Her scalp shows mild silvery scaling.
Laboratory Results: KOH of the nail clippings is negative.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of the small, ice-pick-like depressions (Nail Pitting)?', '["Fungal infection","Focal parakeratosis and inflammation in the proximal nail matrix, causing defective, crumbling nail plate formation","Trauma","Vitamin deficiency"]', 1, 'As the nail grows out, the defective spots slough off, leaving pits.'),
    (v_case_id, 'What are the yellowish-brown spots under the nail plate called?', '["Melanoma","''Oil drop'' sign or ''Salmon patches''","Splinter hemorrhages","Beau lines"]', 1, 'These represent psoriatic plaques located in the nail bed (underneath the plate).'),
    (v_case_id, 'The presence of severe psoriatic nail disease is highly correlated with the development of what complication?', '["Erythroderma","Psoriatic Arthritis (especially involving the DIP joints)","Melanoma","Guttate psoriasis"]', 1, 'Patients with nail disease should be heavily screened for joint pain, as the nail matrix is anatomically continuous with the DIP joint entheses.');

    ---------------------------------------------------------------------------
    -- CASE 21: Comedonal Acne Vulgaris
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blackheads and Whiteheads' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blackheads and Whiteheads', 'A 14-year-old boy presents for an acne evaluation. He is primarily bothered by the bumps on his forehead and nose. He washes his face daily.

Vitals: Normal.
Physical Examination: Forehead, nose, and chin demonstrate numerous open comedones (black dots) and closed comedones (small, flesh-colored bumps). There is NO erythema, NO pustules, and NO cysts.
Laboratory Results: None.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 14-year-old boy presents for an acne evaluation. He is primarily bothered by the bumps on his forehead and nose. He washes his face daily.

Vitals: Normal.
Physical Examination: Forehead, nose, and chin demonstrate numerous open comedones (black dots) and closed comedones (small, flesh-colored bumps). There is NO erythema, NO pustules, and NO cysts.
Laboratory Results: None.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the fundamental, primary lesion of all acne vulgaris?', '["The pustule","The comedone (a plugged pilosebaceous unit)","The cyst","The nodule"]', 1, 'Every inflammatory acne lesion starts as a microscopic, non-inflammatory comedone.'),
    (v_case_id, 'Why are open comedones (blackheads) black?', '["Because they are filled with dirt","Because the melanin in the oxidized sebum and keratinous plug turns dark when exposed to air","Because of dried blood","Because of bacterial pigments"]', 1, 'Blackheads are open to the air; oxidation causes the color, not poor hygiene.'),
    (v_case_id, 'What is the absolute first-line, most essential topical medication for pure comedonal acne?', '["Topical antibiotics (clindamycin)","Topical Retinoids (e.g., Tretinoin, Adapalene), which are keratolytic and normalize follicular desquamation","Oral antibiotics","Benzoyl peroxide only"]', 1, 'Retinoids unclog the pores and prevent new comedones from forming, attacking the root cause.');

    ---------------------------------------------------------------------------
    -- CASE 22: Inflammatory (Papulopustular) Acne
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Bumps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Bumps', 'A 16-year-old girl presents with worsening acne. She has been using salicylic acid washes without improvement.

Vitals: Normal.
Physical Examination: Face, upper chest, and back show numerous erythematous papules and pustules. Scattered comedones are also present. No deep nodules are noted.
Laboratory Results: None.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old girl presents with worsening acne. She has been using salicylic acid washes without improvement.

Vitals: Normal.
Physical Examination: Face, upper chest, and back show numerous erythematous papules and pustules. Scattered comedones are also present. No deep nodules are noted.
Laboratory Results: None.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What specific anaerobic bacterium proliferates in the plugged follicle and drives the inflammation in acne?', '["Staphylococcus aureus","Cutibacterium acnes (formerly Propionibacterium acnes)","Streptococcus pyogenes","Pseudomonas aeruginosa"]', 1, 'C. acnes thrives in the anaerobic, lipid-rich environment of the plugged comedone, releasing lipases that break down sebum into pro-inflammatory free fatty acids.'),
    (v_case_id, 'What is the rationale for combining Topical Benzoyl Peroxide with a Topical Antibiotic (like Clindamycin)?', '["To bleach the skin","Benzoyl peroxide is highly bactericidal and strictly prevents the development of bacterial resistance to the topical antibiotic","It smells better","It absorbs oil faster"]', 1, 'You should NEVER prescribe topical antibiotics for acne without benzoyl peroxide due to rapid resistance.'),
    (v_case_id, 'What is the standard, first-line combination therapy for mild-to-moderate inflammatory acne?', '["Oral isotretinoin","A topical retinoid (to unplug pores) PLUS a topical antimicrobial (Benzoyl Peroxide +/- Clindamycin to kill C. acnes and reduce inflammation)","Oral steroids","Washing the face more"]', 1, 'This attacks three pathogenic factors: abnormal desquamation, C. acnes proliferation, and inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 23: Severe Nodulocystic Acne
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scarring Cysts' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scarring Cysts', 'A 19-year-old male presents with severe, painful acne that has been present for 3 years. He has failed oral doxycycline and topical retinoids.

Vitals: Normal.
Physical Examination: The face, back, and shoulders are covered in large (>5mm), deep, tender, fluctuant nodules and cysts. There is significant ''ice-pick'' and ''boxcar'' scarring present.
Laboratory Results: None.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old male presents with severe, painful acne that has been present for 3 years. He has failed oral doxycycline and topical retinoids.

Vitals: Normal.
Physical Examination: The face, back, and shoulders are covered in large (>5mm), deep, tender, fluctuant nodules and cysts. There is significant ''ice-pick'' and ''boxcar'' scarring present.
Laboratory Results: None.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Given the failure of standard oral therapy and the presence of severe scarring, what is the clear drug of choice for this patient?', '["A different oral antibiotic","Oral Isotretinoin (Accutane)","Oral corticosteroids","Chemical peels"]', 1, 'Isotretinoin is the only drug that alters the natural course of the disease and induces long-term remission in severe, scarring nodulocystic acne.'),
    (v_case_id, 'How does Oral Isotretinoin work?', '["It kills bacteria directly","It is a potent Vitamin A derivative that massively reduces sebaceous gland size and sebum production, while also normalizing desquamation","It suppresses the immune system","It increases sweat production"]', 1, 'By eliminating the sebum, it starves C. acnes and stops the entire pathogenic cascade.'),
    (v_case_id, 'What is the most common, universally expected side effect of Oral Isotretinoin?', '["Liver failure","Severe dryness of the lips (cheilitis), skin, and mucous membranes","Depression","Hair growth"]', 1, 'If a patient on isotretinoin does not have chapped lips, they are likely not absorbing the medication.');

    ---------------------------------------------------------------------------
    -- CASE 24: Isotretinoin Teratogenicity and iPLEDGE
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Accutane Contract' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Accutane Contract', 'A 22-year-old female with severe nodulocystic acne and significant scarring is discussing starting Oral Isotretinoin with her dermatologist.

Vitals: Normal.
Physical Examination: Nodulocystic acne.
Laboratory Results: Urine pregnancy test is negative. Liver function tests and lipid panels are normal.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old female with severe nodulocystic acne and significant scarring is discussing starting Oral Isotretinoin with her dermatologist.

Vitals: Normal.
Physical Examination: Nodulocystic acne.
Laboratory Results: Urine pregnancy test is negative. Liver function tests and lipid panels are normal.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the absolute, most severe risk of Oral Isotretinoin in a female of childbearing potential?', '["Weight gain","Severe teratogenicity (massive craniofacial, cardiac, and CNS birth defects)","Infertility","Early menopause"]', 1, 'Isotretinoin is an extreme teratogen. A single pill can cause catastrophic fetal malformations.'),
    (v_case_id, 'In the United States, what strict regulatory program must the patient, prescriber, and pharmacist enroll in before starting this medication?', '["REMS","iPLEDGE","VAERS","MedWatch"]', 1, 'iPLEDGE is designed specifically to prevent fetal exposure to isotretinoin.'),
    (v_case_id, 'What are the specific contraceptive requirements for a female of childbearing potential under iPLEDGE?', '["Must not have sex","Must commit to using TWO simultaneous forms of effective contraception for 1 month before, during, and 1 month after therapy, and have monthly negative pregnancy tests","One form of birth control","Pull-out method"]', 1, 'Absolute adherence to double contraception and monthly testing is mandatory to receive the prescription.');

    ---------------------------------------------------------------------------
    -- CASE 25: Acne Conglobata
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burrowing Acne' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burrowing Acne', 'A 25-year-old male with a history of severe acne presents with massive worsening. He has very deep, painful lesions that seem to connect under the skin.

Vitals: Normal.
Physical Examination: The chest and back show huge, inflammatory, fluctuant nodules that form communicating sinus tracts. There is foul-smelling purulent discharge and massive disfiguring keloidal scarring. No fever or joint pain.
Laboratory Results: None.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male with a history of severe acne presents with massive worsening. He has very deep, painful lesions that seem to connect under the skin.

Vitals: Normal.
Physical Examination: The chest and back show huge, inflammatory, fluctuant nodules that form communicating sinus tracts. There is foul-smelling purulent discharge and massive disfiguring keloidal scarring. No fever or joint pain.
Laboratory Results: None.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Acne vulgaris","Acne Conglobata","Acne fulminans","Rosacea"]', 1, 'Acne conglobata is a severe, highly inflammatory, eruptive form of nodulocystic acne characterized by burrowing interconnecting abscesses and sinus tracts.'),
    (v_case_id, 'Acne conglobata is part of the ''Follicular Occlusion Tetrad.'' What are the other three diseases?', '["Psoriasis, Eczema, Rosacea","Hidradenitis suppurativa, Pilonidal cysts, and Dissecting cellulitis of the scalp","Lupus, Scleroderma, Dermatomyositis","None"]', 1, 'These four conditions share a common pathogenesis of follicular hyperkeratosis, occlusion, and subsequent rupture/inflammation.'),
    (v_case_id, 'What is the drug of choice for Acne Conglobata?', '["Topical benzoyl peroxide","Oral Isotretinoin (often requiring a brief initial course of systemic steroids to calm the massive inflammation)","Oral doxycycline","Topical retinoids"]', 1, 'Only isotretinoin can shut down the massive sebaceous activity driving this destructive disease.');

    ---------------------------------------------------------------------------
    -- CASE 26: Acne Fulminans
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Systemic Breakout' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Systemic Breakout', 'A 15-year-old boy presents to the emergency room. Over the last week, his chest and back erupted in massive, ulcerating, necrotic acne lesions. He also complains of severe bone pain in his clavicles and sternum, fever, and extreme fatigue.

Vitals: T 39.5 C, HR 115.
Physical Examination: Extremely painful, ulcerated, and crusted necrotic plaques over the trunk. Exquisite tenderness over the sternoclavicular joints.
Laboratory Results: WBC 22,000. ESR 90. X-ray of the clavicle shows osteolytic lesions.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old boy presents to the emergency room. Over the last week, his chest and back erupted in massive, ulcerating, necrotic acne lesions. He also complains of severe bone pain in his clavicles and sternum, fever, and extreme fatigue.

Vitals: T 39.5 C, HR 115.
Physical Examination: Extremely painful, ulcerated, and crusted necrotic plaques over the trunk. Exquisite tenderness over the sternoclavicular joints.
Laboratory Results: WBC 22,000. ESR 90. X-ray of the clavicle shows osteolytic lesions.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What distinguishes Acne Fulminans from Acne Conglobata?', '["There is no difference","Acne fulminans is an acute, immunologically mediated event characterized by abrupt ulcerating acne AND severe systemic symptoms (fever, leukocytosis, polyarthralgia, osteolytic bone lesions)","Acne fulminans only happens in adults","Acne fulminans has no scars"]', 1, 'Acne fulminans is a systemic inflammatory storm triggered by C. acnes antigens.'),
    (v_case_id, 'What is the immediate, life-saving treatment for Acne Fulminans?', '["High-dose oral isotretinoin","High-dose Systemic Corticosteroids (e.g., Prednisone) to shut down the systemic inflammatory storm","IV antibiotics","Surgery"]', 1, 'You CANNOT start isotretinoin immediately, as it will paradoxically worsen the massive inflammation. You must quiet the storm with steroids first.'),
    (v_case_id, 'What bony lesions are classic in Acne Fulminans?', '["Fractures of the femur","Sterile osteolytic lesions, most commonly in the sternum, clavicles, and sacroiliac joints (SAPHO syndrome spectrum)","Bone spurs","None"]', 1, 'The severe bone pain is sterile inflammation, not an infection.');

    ---------------------------------------------------------------------------
    -- CASE 27: Acne Excoriee des Jeunes Filles
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Picked Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Picked Face', 'A 20-year-old female presents complaining of ''terrible acne.'' She admits to spending 2 hours a day in front of a magnifying mirror picking at every pore.

Vitals: Normal.
Physical Examination: The face shows minimal to no actual comedones or pustules. However, there are dozens of crusted, excoriated erosions, linear scratch marks, and hyperpigmented scars distributed symmetrically over the face where she can easily reach.
Laboratory Results: None.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old female presents complaining of ''terrible acne.'' She admits to spending 2 hours a day in front of a magnifying mirror picking at every pore.

Vitals: Normal.
Physical Examination: The face shows minimal to no actual comedones or pustules. However, there are dozens of crusted, excoriated erosions, linear scratch marks, and hyperpigmented scars distributed symmetrically over the face where she can easily reach.
Laboratory Results: None.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Severe nodulocystic acne","Acne Excoriée (des jeunes filles)","Impetigo","Rosacea"]', 1, 'This is a psychodermatologic condition where the patient obsessively picks at trivial or non-existent acne lesions, creating the primary pathology.'),
    (v_case_id, 'What underlying psychiatric conditions are frequently associated with this presentation?', '["Schizophrenia","Obsessive-compulsive disorder (OCD), anxiety, and body dysmorphic disorder","Bipolar disorder","None"]', 1, 'The picking is a compulsive behavior to relieve anxiety or perceived imperfections.'),
    (v_case_id, 'What is an appropriate treatment approach?', '["Oral isotretinoin","Psychiatric intervention (CBT) and SSRIs, alongside gentle local wound care","High-dose antibiotics","Surgery"]', 1, 'Treating the skin with harsh acne meds will often worsen the picking; you must treat the underlying compulsion.');

    ---------------------------------------------------------------------------
    -- CASE 28: Drug-Induced (Steroid) Acne
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Monomorphic Crop' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Monomorphic Crop', 'A 30-year-old male with severe asthma recently completed a 3-week course of high-dose oral prednisone. He presents with a sudden eruption of ''acne'' all over his chest and back. He had clear skin previously.

Vitals: Normal.
Physical Examination: Widespread eruption on the trunk consisting of hundreds of small, uniform, erythematous papules and pustules all in the exact same stage of development. There are NO comedones.
Laboratory Results: None.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male with severe asthma recently completed a 3-week course of high-dose oral prednisone. He presents with a sudden eruption of ''acne'' all over his chest and back. He had clear skin previously.

Vitals: Normal.
Physical Examination: Widespread eruption on the trunk consisting of hundreds of small, uniform, erythematous papules and pustules all in the exact same stage of development. There are NO comedones.
Laboratory Results: None.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What physical exam finding heavily differentiates Steroid-Induced Acne from classic Acne Vulgaris?', '["It only affects the face","Steroid acne is monomorphic (all lesions look exactly the same size/stage) and notably lacks true comedones","It has blackheads","It has deep cysts"]', 1, 'Classic acne is pleomorphic (you see a mix of blackheads, red bumps, and healing scars simultaneously). Steroid acne all erupts at once.'),
    (v_case_id, 'What is the primary treatment for Steroid-Induced Acne?', '["Lifelong antibiotics","Discontinuation of the offending systemic corticosteroid (if medically possible); the rash will spontaneously resolve","Oral isotretinoin","Surgery"]', 1, 'It is a direct adverse effect of the drug, not a true dysfunction of the pilosebaceous unit.'),
    (v_case_id, 'Besides systemic corticosteroids, what other common medications can trigger an acneiform eruption?', '["Aspirin","Lithium, Isoniazid, Phenytoin, and EGF-receptor inhibitors (e.g., Cetuximab)","Penicillin","Beta-blockers"]', 1, 'EGFR inhibitors cause a very characteristic, severe acneiform rash that actually correlates with the drug''s anti-cancer efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 29: Neonatal Acne (Neonatal Cephalic Pustulosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Newborn Bumps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Newborn Bumps', 'A 3-week-old male infant is brought in by anxious parents. The baby has developed a rash on his cheeks and nose. He is otherwise healthy.

Vitals: Normal.
Physical Examination: Numerous pinpoint erythematous papules and pustules over the cheeks, chin, and forehead. No comedones are visible.
Laboratory Results: None.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-week-old male infant is brought in by anxious parents. The baby has developed a rash on his cheeks and nose. He is otherwise healthy.

Vitals: Normal.
Physical Examination: Numerous pinpoint erythematous papules and pustules over the cheeks, chin, and forehead. No comedones are visible.
Laboratory Results: None.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Infantile acne","Neonatal Acne (Neonatal Cephalic Pustulosis)","Herpes simplex","Milia"]', 1, 'Occurring in the first month of life, this is an extremely common, benign, self-limited condition.'),
    (v_case_id, 'Despite the name ''Neonatal Acne'', what organism is thought to be the actual trigger for this inflammatory response, distinguishing it from true acne?', '["Cutibacterium acnes","Malassezia yeast species colonization","Staphylococcus aureus","Candida"]', 1, 'It is not a true acne driven by sebum and C. acnes, but rather an inflammatory reaction to yeast on the skin.'),
    (v_case_id, 'If an infant presents at 6 MONTHS of age with true comedones, deep inflammatory papules, and scarring, what is the diagnosis and significance?', '["It is still neonatal acne","Infantile Acne; this is true acne driven by endogenous androgens and carries a high risk for severe acne later in adolescence","Rosacea","Allergy"]', 1, 'Infantile acne (3-12 months) is much more severe, requires treatment, and is a strong predictor of severe teen acne.');

    ---------------------------------------------------------------------------
    -- CASE 30: PCOS-related (Hormonal) Acne
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hormonal Jawline' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hormonal Jawline', 'A 28-year-old female presents with persistent acne that flares fiercely the week before her period. She also notes recent weight gain, irregular menses, and increased facial hair on her chin.

Vitals: BMI 30.
Physical Examination: Deep, tender, inflammatory nodules localized strictly to the lower third of the face (jawline, chin, and upper neck). Hirsutism is noted.
Laboratory Results: Elevated free testosterone and LH:FSH ratio > 2:1.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old female presents with persistent acne that flares fiercely the week before her period. She also notes recent weight gain, irregular menses, and increased facial hair on her chin.

Vitals: BMI 30.
Physical Examination: Deep, tender, inflammatory nodules localized strictly to the lower third of the face (jawline, chin, and upper neck). Hirsutism is noted.
Laboratory Results: Elevated free testosterone and LH:FSH ratio > 2:1.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic distribution of hormonal acne in adult women?', '["Forehead and nose (T-zone)","The ''U-zone'': along the jawline, chin, and upper neck","The back only","The chest only"]', 1, 'Adult female acne is highly sensitive to androgen fluctuations and heavily targets the lower face.'),
    (v_case_id, 'What underlying systemic endocrine disorder does this patient likely have?', '["Hypothyroidism","Polycystic Ovary Syndrome (PCOS)","Cushing''s syndrome","Addison''s disease"]', 1, 'The triad of adult acne, hirsutism, and irregular menses/obesity is the hallmark of PCOS.'),
    (v_case_id, 'What specific oral medication is highly effective for adult female hormonal acne by blocking androgen receptors?', '["Isotretinoin","Spironolactone (an aldosterone antagonist with anti-androgenic properties)","Doxycycline","Lithium"]', 1, 'Spironolactone directly blocks testosterone from binding to the sebaceous glands, drastically reducing sebum production in females.');

    ---------------------------------------------------------------------------
    -- CASE 31: Erythematotelangiectatic Rosacea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Flushing Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Flushing Face', 'A 45-year-old fair-skinned female of Celtic descent complains that her face is constantly red. She notes that drinking hot coffee, eating spicy foods, or going out in the sun causes intense, embarrassing facial flushing.

Vitals: Normal.
Physical Examination: Persistent erythema and numerous prominent telangiectasias (spider veins) over the central face (cheeks, nose, glabella). There are NO papules, pustules, or comedones.
Laboratory Results: None.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old fair-skinned female of Celtic descent complains that her face is constantly red. She notes that drinking hot coffee, eating spicy foods, or going out in the sun causes intense, embarrassing facial flushing.

Vitals: Normal.
Physical Examination: Persistent erythema and numerous prominent telangiectasias (spider veins) over the central face (cheeks, nose, glabella). There are NO papules, pustules, or comedones.
Laboratory Results: None.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Acne vulgaris","Erythematotelangiectatic Rosacea","Systemic Lupus Erythematosus (Malar rash)","Seborrheic dermatitis"]', 1, 'This is the classic vascular subtype of rosacea, characterized by vasomotor instability and permanent capillary dilation.'),
    (v_case_id, 'How does the physical exam of Rosacea classically differentiate it from Acne Vulgaris?', '["Rosacea is purple","Rosacea strictly lacks comedones (blackheads/whiteheads) and is dominated by background erythema/flushing","Rosacea has deep cysts","Rosacea affects the back"]', 1, 'If you see blackheads, it is acne. Rosacea is an inflammatory/vascular disease, not a follicular plugging disease.'),
    (v_case_id, 'What topical alpha-2 adrenergic agonist can be prescribed to temporarily vasoconstrict the blood vessels and reduce the redness in this patient?', '["Topical steroids","Topical Brimonidine or Oxymetazoline","Topical retinoids","Topical benzoyl peroxide"]', 1, 'These agents clamp down the capillaries, ''blanching'' the redness for 8-12 hours.');

    ---------------------------------------------------------------------------
    -- CASE 32: Papulopustular Rosacea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Bumps without Blackheads' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Bumps without Blackheads', 'A 50-year-old woman presents complaining of ''adult acne''. She has a red face and multiple small pimples.

Vitals: Normal.
Physical Examination: Erythema of the central face with dozens of small, dome-shaped erythematous papules and tiny pustules. Crucially, there are zero comedones.
Laboratory Results: None.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old woman presents complaining of ''adult acne''. She has a red face and multiple small pimples.

Vitals: Normal.
Physical Examination: Erythema of the central face with dozens of small, dome-shaped erythematous papules and tiny pustules. Crucially, there are zero comedones.
Laboratory Results: None.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Inflammatory acne","Papulopustular Rosacea","Impetigo","Eczema"]', 1, 'This subtype of rosacea features inflammatory bumps that look exactly like acne, but occur on a background of erythema and lack comedones.'),
    (v_case_id, 'What oral antibiotic, used at sub-antimicrobial anti-inflammatory doses, is highly effective for this condition?', '["Penicillin","Doxycycline (often given at a low dose of 40mg daily to strictly utilize its anti-inflammatory effects without altering gut flora)","Ciprofloxacin","Amoxicillin"]', 1, 'Tetracyclines inhibit matrix metalloproteinases and calm the inflammation driving the papules.'),
    (v_case_id, 'What topical anti-parasitic cream is highly effective for papulopustular rosacea?', '["Permethrin","Ivermectin 1% cream","Clotrimazole","Lindane"]', 1, 'Ivermectin targets the Demodex mites that are heavily implicated in triggering the inflammatory response in rosacea.');

    ---------------------------------------------------------------------------
    -- CASE 33: Phymatous Rosacea (Rhinophyma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bulbous Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bulbous Nose', 'A 65-year-old male presents for a routine checkup. He has a long history of facial redness. He is profoundly embarrassed by the size and shape of his nose, which has been slowly growing for years.

Vitals: Normal.
Physical Examination: The nose is massively enlarged, bulbous, lobulated, and purple-red, with grossly thickened skin and gaping, prominent pores.
Laboratory Results: None.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male presents for a routine checkup. He has a long history of facial redness. He is profoundly embarrassed by the size and shape of his nose, which has been slowly growing for years.

Vitals: Normal.
Physical Examination: The nose is massively enlarged, bulbous, lobulated, and purple-red, with grossly thickened skin and gaping, prominent pores.
Laboratory Results: None.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the medical term for this specific end-stage complication of rosacea?', '["Gargoylism","Rhinophyma (Phymatous rosacea)","Nasal polyp","Squamous cell carcinoma"]', 1, 'Rhinophyma is a severe sebaceous gland hyperplasia and fibrous thickening of the skin of the nose.'),
    (v_case_id, 'Who predominantly develops Rhinophyma?', '["Young women","Older men (despite rosacea being more common overall in women)","Children","Pregnant women"]', 1, 'For unknown reasons, the massive fibrotic/sebaceous overgrowth is almost exclusively seen in males.'),
    (v_case_id, 'What is the definitive treatment for advanced Rhinophyma?', '["Topical antibiotics","Surgical debulking (via CO2 laser, scalpel, or electrosurgery) to sculpt the nose back to a normal contour","Oral steroids","Sunscreen"]', 1, 'Once the fibrous tissue is formed, medications will not shrink it. It must be physically removed.');

    ---------------------------------------------------------------------------
    -- CASE 34: Ocular Rosacea
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gritty Eyes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gritty Eyes', 'A 55-year-old female with known facial rosacea presents to the eye clinic. She complains that her eyes constantly feel dry, burn, and feel like ''there is sand in them.'' She frequently has red, swollen eyelids.

Vitals: Normal.
Physical Examination: Bilateral conjunctival injection, crusting at the eyelid margins (blepharitis), and telangiectasias on the eyelid margins. A chalazion is present on the right lower lid.
Laboratory Results: None.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old female with known facial rosacea presents to the eye clinic. She complains that her eyes constantly feel dry, burn, and feel like ''there is sand in them.'' She frequently has red, swollen eyelids.

Vitals: Normal.
Physical Examination: Bilateral conjunctival injection, crusting at the eyelid margins (blepharitis), and telangiectasias on the eyelid margins. A chalazion is present on the right lower lid.
Laboratory Results: None.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Allergic conjunctivitis","Ocular Rosacea","Viral pink eye","Glaucoma"]', 1, 'Over 50% of rosacea patients have ocular involvement, which can sometimes precede the skin findings.'),
    (v_case_id, 'What is the primary pathophysiologic issue causing the ''gritty'' feeling in Ocular Rosacea?', '["Loss of tears","Meibomian gland dysfunction (the oil glands in the eyelids get clogged and inflamed), leading to rapid evaporation of the tear film and severe dry eye","Corneal scratching","Bacterial infection"]', 1, 'The meibomian glands are modified sebaceous glands, so they suffer the same inflammation as the facial glands.'),
    (v_case_id, 'What is a severe, vision-threatening complication of untreated Ocular Rosacea?', '["Cataracts","Corneal ulceration and perforation due to severe dryness and chronic inflammation","Retinal detachment","Macular degeneration"]', 1, 'Severe cases require prompt evaluation by an ophthalmologist.');

    ---------------------------------------------------------------------------
    -- CASE 35: Perioral Dermatitis (Steroid Rosacea)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rebound Redness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rebound Redness', 'A 30-year-old female presents with a bright red, burning rash around her mouth. She states she had a small patch of dry skin a month ago and started using her husband''s prescription Clobetasol ointment. It helped initially, but now when she stops using it, the rash explodes.

Vitals: Normal.
Physical Examination: Confluent erythema, papules, and pinpoint pustules clustered heavily around the mouth, sparing a narrow clear zone immediately adjacent to the vermilion border (lips).
Laboratory Results: None.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old female presents with a bright red, burning rash around her mouth. She states she had a small patch of dry skin a month ago and started using her husband''s prescription Clobetasol ointment. It helped initially, but now when she stops using it, the rash explodes.

Vitals: Normal.
Physical Examination: Confluent erythema, papules, and pinpoint pustules clustered heavily around the mouth, sparing a narrow clear zone immediately adjacent to the vermilion border (lips).
Laboratory Results: None.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical diagnosis for this specific eruption?', '["Cold sores","Perioral Dermatitis","Impetigo","Acne"]', 1, 'Perioral dermatitis classically presents as a papulopustular eruption around the mouth with a characteristic ''vermilion sparing'' zone.'),
    (v_case_id, 'What is the most common iatrogenic trigger for Perioral Dermatitis?', '["Antibiotics","The inappropriate use of mid-to-high potency topical corticosteroids on the face","Moisturizers","Sunscreen"]', 1, 'Steroids suppress the local immune system allowing Demodex/bacteria to flourish, and cause a severe rebound vasodilation/inflammation when stopped.'),
    (v_case_id, 'What must be explained to the patient regarding the treatment course?', '["It will clear in 1 day","She must immediately stop all topical steroids, and the rash will inevitably GET WORSE (rebound flare) before it gets better with the correct treatment (e.g., oral doxycycline, topical metronidazole)","She needs stronger steroids","Surgery is required"]', 1, 'Patient counseling is critical, as the ''steroid withdrawal'' flare will make them want to use the steroid again.');

    ---------------------------------------------------------------------------
    -- CASE 36: Topical Corticosteroid Pharmacology
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Potency Ladder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Potency Ladder', 'A medical student is asked to prescribe a topical corticosteroid for a patient''s mild facial eczema, and a different steroid for thick psoriasis on the palms.

Vitals: Normal.
Physical Examination: Mild eczema on the thin skin of the eyelids. Thick hyperkeratotic psoriasis on the thick skin of the palms.
Laboratory Results: None.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student is asked to prescribe a topical corticosteroid for a patient''s mild facial eczema, and a different steroid for thick psoriasis on the palms.

Vitals: Normal.
Physical Examination: Mild eczema on the thin skin of the eyelids. Thick hyperkeratotic psoriasis on the thick skin of the palms.
Laboratory Results: None.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the United States, how are topical corticosteroids classified by potency?', '["Class A to Z","Class 1 (Ultra-High potency, e.g., Clobetasol 0.05%) to Class 7 (Lowest potency, e.g., Hydrocortisone 1%)","Class 1 is weakest","By color"]', 1, 'It is crucial to know that Class 1 is the STRONGEST.'),
    (v_case_id, 'Which class of steroid is appropriate for the thin, highly permeable skin of the face, eyelids, and intertriginous folds to prevent atrophy?', '["Class 1","Class 6 or 7 (Low potency, e.g., Desonide or Hydrocortisone)","Class 2","Class 3"]', 1, 'Using strong steroids on the face rapidly causes skin thinning, telangiectasias, and steroid-induced rosacea.'),
    (v_case_id, 'Which class of steroid is required to penetrate the thick stratum corneum of the palms and soles?', '["Class 7","Class 1 (Ultra-High potency, e.g., Clobetasol, Halobetasol)","Class 4","Class 5"]', 1, 'Weak steroids will not penetrate the palms and soles at all.');

    ---------------------------------------------------------------------------
    -- CASE 37: Calcineurin Inhibitors in Atopic Dermatitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steroid Sparing Alternative' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steroid Sparing Alternative', 'A 10-year-old boy has severe, chronic atopic dermatitis affecting his eyelids and face. His dermatologist is worried about the risk of skin atrophy and glaucoma from long-term topical steroid use on the eyelids.

Vitals: Normal.
Physical Examination: Eczematous plaques on the eyelids and cheeks.
Laboratory Results: None.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old boy has severe, chronic atopic dermatitis affecting his eyelids and face. His dermatologist is worried about the risk of skin atrophy and glaucoma from long-term topical steroid use on the eyelids.

Vitals: Normal.
Physical Examination: Eczematous plaques on the eyelids and cheeks.
Laboratory Results: None.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What class of topical, steroid-sparing anti-inflammatory medication is highly indicated for sensitive areas like the face and eyelids?', '["Topical retinoids","Topical Calcineurin Inhibitors (e.g., Tacrolimus ointment, Pimecrolimus cream)","Topical antibiotics","Topical antifungals"]', 1, 'These drugs inhibit T-cell activation but have absolutely ZERO risk of causing skin atrophy, striae, or glaucoma.'),
    (v_case_id, 'What is the most common local side effect patients experience when first applying topical Tacrolimus to inflamed skin?', '["Bleeding","A transient, intense burning or stinging sensation at the application site","Numbness","Hair loss"]', 1, 'Patients must be warned about the burning, which usually subsides after a few days of use as the skin heals.'),
    (v_case_id, 'What black box warning is associated with topical calcineurin inhibitors, though highly controversial in dermatology?', '["Heart attack","A theoretical increased risk of malignancy (lymphoma/skin cancer) based on animal studies and systemic immunosuppression data","Liver failure","Kidney failure"]', 1, 'Extensive long-term human data has generally failed to show a clinically significant risk with appropriate topical use.');

    ---------------------------------------------------------------------------
    -- CASE 38: Biologics in Psoriasis (TNF-alpha)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Biologic Target' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Biologic Target', 'A 40-year-old male with severe, widespread plaque psoriasis and psoriatic arthritis has failed topical therapies and oral methotrexate. He is started on Adalimumab (Humira).

Vitals: Normal.
Physical Examination: Widespread psoriasis. Swollen joints.
Laboratory Results: Quantiferon-TB Gold is negative.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old male with severe, widespread plaque psoriasis and psoriatic arthritis has failed topical therapies and oral methotrexate. He is started on Adalimumab (Humira).

Vitals: Normal.
Physical Examination: Widespread psoriasis. Swollen joints.
Laboratory Results: Quantiferon-TB Gold is negative.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific immunologic target of Adalimumab, Etanercept, and Infliximab?', '["IL-17","Tumor Necrosis Factor alpha (TNF-alpha)","CD20","IL-4"]', 1, 'TNF-alpha is a master pro-inflammatory cytokine driving both the skin proliferation and joint destruction in psoriasis.'),
    (v_case_id, 'Why was a Quantiferon-TB Gold (or PPD) test mandatory before starting this medication?', '["To check for anemia","TNF-alpha is critical for the maintenance of granulomas; blocking it can cause fatal reactivation of latent Tuberculosis","To check liver function","To check for HIV"]', 1, 'All patients must be screened for latent TB, Hepatitis B/C, and HIV before starting immunosuppressive biologics.'),
    (v_case_id, 'TNF-alpha inhibitors are generally contraindicated in patients with what preexisting neurologic condition?', '["Migraines","Multiple Sclerosis (or other demyelinating diseases), as TNF blockers can trigger or worsen demyelination","Parkinson''s","Alzheimer''s"]', 1, 'They can also exacerbate or induce severe congestive heart failure.');

    ---------------------------------------------------------------------------
    -- CASE 39: Biologics in Psoriasis (IL-17)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Downstream Blockade' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Downstream Blockade', 'A 35-year-old female with severe plaque psoriasis is prescribed Secukinumab (Cosentyx). She has no joint pain, but her skin is covered >30% BSA.

Vitals: Normal.
Physical Examination: Widespread plaques.
Laboratory Results: None.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female with severe plaque psoriasis is prescribed Secukinumab (Cosentyx). She has no joint pain, but her skin is covered >30% BSA.

Vitals: Normal.
Physical Examination: Widespread plaques.
Laboratory Results: None.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What specific cytokine does Secukinumab and Ixekizumab target?', '["TNF-alpha","Interleukin-17A (IL-17A)","IL-12","IL-23"]', 1, 'IL-17 is a downstream effector cytokine heavily produced by Th17 cells, playing a massive, highly specific role in psoriatic plaque formation.'),
    (v_case_id, 'Because IL-17 is vital for mucosal defense against a specific organism, what is a notable risk of taking IL-17 inhibitors?', '["Strep throat","Increased risk of mucocutaneous Candidiasis (thrush, yeast infections)","Tuberculosis","Herpes"]', 1, 'Patients often develop mild, treatable yeast infections while on the drug.'),
    (v_case_id, 'IL-17 inhibitors should be avoided or used with extreme caution in patients with a personal history of what disease?', '["Asthma","Inflammatory Bowel Disease (specifically Crohn''s disease), as IL-17 blockade can trigger severe exacerbations of IBD","Diabetes","Hypertension"]', 1, 'For psoriasis patients with concomitant Crohn''s, TNF-alpha inhibitors or IL-12/23 inhibitors (Ustekinumab) are preferred.');

    ---------------------------------------------------------------------------
    -- CASE 40: Biologics in Atopic Dermatitis (Dupilumab)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Eczema Miracle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Eczema Miracle', 'A 25-year-old male with severe, lifelong, refractory atopic dermatitis (covering 60% of his body) is started on a newly approved biologic injection, Dupilumab (Dupixent). Within weeks, his skin is nearly completely clear, and he stops scratching for the first time in his life.

Vitals: Normal.
Physical Examination: Resolving excoriations.
Laboratory Results: None.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male with severe, lifelong, refractory atopic dermatitis (covering 60% of his body) is started on a newly approved biologic injection, Dupilumab (Dupixent). Within weeks, his skin is nearly completely clear, and he stops scratching for the first time in his life.

Vitals: Normal.
Physical Examination: Resolving excoriations.
Laboratory Results: None.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific immunologic target of Dupilumab?', '["TNF-alpha","The Interleukin-4 (IL-4) receptor alpha subunit, which simultaneously blocks both IL-4 and IL-13 signaling","IL-17","CD20"]', 1, 'IL-4 and IL-13 are the core Th2 cytokines that drive the intense allergic inflammation, itch, and barrier dysfunction in atopic dermatitis.'),
    (v_case_id, 'Because it targets the Th2 pathway, what other diseases is Dupilumab FDA-approved to treat?', '["Psoriasis and Rheumatoid Arthritis","Moderate-to-severe Asthma, Chronic Rhinosinusitis with Nasal Polyps, and Eosinophilic Esophagitis","Crohn''s disease","Acne"]', 1, 'It essentially turns off the ''atopic'' side of the immune system.'),
    (v_case_id, 'What is the most common, unique side effect associated with Dupilumab use?', '["Tuberculosis","Conjunctivitis (often requiring ophthalmic steroid drops) and dry eyes","Liver failure","Kidney failure"]', 1, 'The exact mechanism of Dupilumab-induced conjunctivitis is unknown, but it is very common and manageable.');

    ---------------------------------------------------------------------------
    -- CASE 41: Phototherapy (NB-UVB)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Light Therapy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Light Therapy', 'A 28-year-old female with widespread guttate psoriasis wishes to avoid systemic immunosuppressives because she is trying to become pregnant. Her dermatologist recommends coming to the clinic three times a week to stand in a light booth.

Vitals: Normal.
Physical Examination: Guttate psoriasis.
Laboratory Results: None.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old female with widespread guttate psoriasis wishes to avoid systemic immunosuppressives because she is trying to become pregnant. Her dermatologist recommends coming to the clinic three times a week to stand in a light booth.

Vitals: Normal.
Physical Examination: Guttate psoriasis.
Laboratory Results: None.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What specific wavelength of ultraviolet light is currently the gold standard for dermatologic phototherapy due to its high efficacy and safety profile?', '["UVA","Narrowband UVB (NB-UVB, precisely 311-313 nm)","UVC","Infrared"]', 1, 'Narrowband UVB provides the therapeutic anti-inflammatory/anti-proliferative benefits of UV light without the deep penetrating, highly carcinogenic risks of UVA.'),
    (v_case_id, 'How does UV light primarily treat psoriasis?', '["It burns the skin off","It induces apoptosis (programmed cell death) of the pathogenic T-cells residing in the skin and slows epidermal hyperproliferation","It kills bacteria","It increases Vitamin D"]', 1, 'It is essentially targeted, local immunosuppression of the skin.'),
    (v_case_id, 'Why is NB-UVB an excellent choice for this specific patient?', '["It is fast","It is completely safe during pregnancy and breastfeeding, unlike oral retinoids or methotrexate","It prevents stretch marks","It treats morning sickness"]', 1, 'It is the treatment of choice for pregnant patients with severe psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 42: Minocycline Induced Hyperpigmentation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue-Gray Scars' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue-Gray Scars', 'A 19-year-old male has been taking an oral antibiotic for his acne for the past 2 years. His acne has improved, but he presents to the clinic concerned about a strange, dirty-looking discoloration on his shins, face, and the sclera of his eyes.

Vitals: Normal.
Physical Examination: Muddy, blue-gray hyperpigmentation located on the anterior shins, the hard palate, and the sclerae.
Laboratory Results: None.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old male has been taking an oral antibiotic for his acne for the past 2 years. His acne has improved, but he presents to the clinic concerned about a strange, dirty-looking discoloration on his shins, face, and the sclera of his eyes.

Vitals: Normal.
Physical Examination: Muddy, blue-gray hyperpigmentation located on the anterior shins, the hard palate, and the sclerae.
Laboratory Results: None.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What oral antibiotic, commonly used for acne, is the classic culprit for this specific adverse effect?', '["Doxycycline","Minocycline","Amoxicillin","Erythromycin"]', 1, 'Minocycline can deposit iron-containing drug complexes in the skin, bone, teeth, and sclera, especially with long-term use.'),
    (v_case_id, 'What rare, severe autoimmune condition can also be triggered by long-term Minocycline use?', '["Multiple Sclerosis","Drug-induced Lupus Erythematosus (DILE) and Autoimmune Hepatitis","Rheumatoid arthritis","Type 1 Diabetes"]', 1, 'Patients may present with a positive ANA, joint pain, and elevated liver enzymes.'),
    (v_case_id, 'Unlike its sister drug doxycycline, minocycline is uniquely known to cause what neurologic side effect?', '["Seizures","Vestibular toxicity (dizziness, vertigo, ataxia, tinnitus)","Blindness","Paralysis"]', 1, 'Minocycline is highly lipophilic and crosses the blood-brain barrier easily.');

    ---------------------------------------------------------------------------
    -- CASE 43: Retinoid Dermatitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Peeling Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Peeling Face', 'A 15-year-old girl was prescribed topical Tretinoin cream for her comedonal acne. She returns one week later furious. Her face is bright red, burning, peeling, and her acne looks worse.

Vitals: Normal.
Physical Examination: Diffuse erythema, dryness, and fine desquamation over the entire face.
Laboratory Results: None.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl was prescribed topical Tretinoin cream for her comedonal acne. She returns one week later furious. Her face is bright red, burning, peeling, and her acne looks worse.

Vitals: Normal.
Physical Examination: Diffuse erythema, dryness, and fine desquamation over the entire face.
Laboratory Results: None.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Allergic reaction","Retinoid Dermatitis (a highly expected irritant contact dermatitis from initiating topical retinoids)","Bacterial infection","Rosacea"]', 1, 'This is the most common reason patients quit using their acne medication.'),
    (v_case_id, 'What is the correct counseling regarding the application of topical retinoids to prevent this?', '["Apply it thickly twice a day","Apply a pea-sized amount to the entire face ONLY at night, strictly avoiding the eyes/corners of the mouth, and use a moisturizer alongside it","Wash it off after 5 minutes","Apply it only to active pimples"]', 1, 'Retinoids are photosensitive and highly irritating. They must be titrated up slowly (e.g., every other night initially).'),
    (v_case_id, 'Why do patients often think their acne is ''getting worse'' in the first few weeks of retinoid use?', '["It causes infections","The keratolytic action accelerates the maturation of existing microcomedones, bringing all the invisible, underlying acne to the surface at once (''purging'')","It causes cysts","It doesn''t work"]', 1, 'Patients must be counseled to push through the first 4-6 weeks to see the clearing effect.');

    ---------------------------------------------------------------------------
    -- CASE 44: Demodex Folliculitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Demodex Mite' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Demodex Mite', 'A 40-year-old male with a suppressed immune system (kidney transplant) presents with a fierce, unilateral papulopustular eruption on his right cheek. It resembles severe rosacea but is very itchy, and traditional rosacea therapies have failed.

Vitals: Normal.
Physical Examination: Unilateral grouping of follicular papules and pustules on an erythematous base on the right cheek. A skin scraping is performed.
Laboratory Results: KOH prep shows massive numbers of microscopic, cigar-shaped mites with 8 stubby legs living inside the hair follicles.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old male with a suppressed immune system (kidney transplant) presents with a fierce, unilateral papulopustular eruption on his right cheek. It resembles severe rosacea but is very itchy, and traditional rosacea therapies have failed.

Vitals: Normal.
Physical Examination: Unilateral grouping of follicular papules and pustules on an erythematous base on the right cheek. A skin scraping is performed.
Laboratory Results: KOH prep shows massive numbers of microscopic, cigar-shaped mites with 8 stubby legs living inside the hair follicles.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What organism is identified on the scraping?', '["Sarcoptes scabiei","Demodex folliculorum (or brevis)","Pediculus humanus","Candida"]', 1, 'Demodex mites are normal commensal flora of human facial hair follicles, but they can overproliferate massively in immunosuppression or local steroid use, causing severe inflammation.'),
    (v_case_id, 'How does Demodex folliculitis clinically differ from typical papulopustular rosacea?', '["It doesn''t","It is often intensely itchy, frequently unilateral or asymmetric, and features a fine, spiky, ''frosty'' scale sticking out of the hair follicles","It has blackheads","It only affects the nose"]', 1, 'The sheer volume of mites protruding from the follicles gives a rough, sandpaper texture.'),
    (v_case_id, 'What is the definitive topical treatment?', '["Hydrocortisone","Topical anti-parasitics like Ivermectin 1% cream or Permethrin 5% cream","Benzoyl peroxide","Salicylic acid"]', 1, 'You must kill the mites to stop the inflammatory reaction.');

    ---------------------------------------------------------------------------
    -- CASE 45: Coal Tar Therapy for Psoriasis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tar Bath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tar Bath', 'A 55-year-old man with chronic plaque psoriasis refuses biologic injections and phototherapy. He asks for an ''old school'' topical treatment his grandfather used.

Vitals: Normal.
Physical Examination: Thick plaques on elbows.
Laboratory Results: None.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old man with chronic plaque psoriasis refuses biologic injections and phototherapy. He asks for an ''old school'' topical treatment his grandfather used.

Vitals: Normal.
Physical Examination: Thick plaques on elbows.
Laboratory Results: None.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What classic, traditional topical agent is known to slow epidermal proliferation and reduce inflammation in psoriasis, despite its strong odor and staining properties?', '["Vaseline","Coal Tar (often compounded in ointments or shampoos)","Olive oil","Apple cider vinegar"]', 1, 'Before steroids and biologics, Goeckerman therapy (Coal tar + UV light) was the gold standard inpatient treatment for psoriasis.'),
    (v_case_id, 'How does Coal Tar work?', '["It kills bacteria","It contains thousands of hydrocarbon compounds that suppress DNA synthesis (anti-mitotic) and reduce scaling","It bleaches the skin","It increases blood flow"]', 1, 'It physically slows down the hyperproliferating keratinocytes.'),
    (v_case_id, 'What is a known, significant side effect of applying Coal Tar to the skin?', '["Skin thinning","Folliculitis (tar acne) and severe photosensitivity","Hair loss","Bleeding"]', 1, 'It irritates the hair follicles and makes the skin highly susceptible to sunburn.');

    ---------------------------------------------------------------------------
    -- CASE 46: Erythema Multiforme (EM) Minor
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Target Lesion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Target Lesion', 'A 25-year-old male presents with a sudden rash on his hands and arms. He had a cold sore on his lip one week ago.

Vitals: Normal.
Physical Examination: Multiple ''target'' or ''iris'' lesions on the palms, forearms, and soles. They consist of a dusky central blister, a pale ring of edema, and an erythematous halo. The oral mucosa is spared.
Laboratory Results: None.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male presents with a sudden rash on his hands and arms. He had a cold sore on his lip one week ago.

Vitals: Normal.
Physical Examination: Multiple ''target'' or ''iris'' lesions on the palms, forearms, and soles. They consist of a dusky central blister, a pale ring of edema, and an erythematous halo. The oral mucosa is spared.
Laboratory Results: None.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common infectious trigger for Erythema Multiforme?', '["Mycoplasma pneumoniae","Herpes Simplex Virus (HSV)","Streptococcus pyogenes","Staphylococcus aureus"]', 1, 'Over 90% of EM cases are triggered by a preceding HSV infection.'),
    (v_case_id, 'What morphological feature is an absolute requirement for the diagnosis of classic Erythema Multiforme?', '["Pustules","The 3-zone target lesion","Silvery scale","Black comedones"]', 1, 'The target lesion represents cell-mediated immune destruction of the epidermis (the dark center is necrotic skin).'),
    (v_case_id, 'How does EM ''Minor'' clinically differ from EM ''Major''?', '["EM minor affects the trunk","EM Minor lacks significant mucosal involvement (mouth, eyes, genitals) and has no systemic symptoms, whereas EM Major involves at least one mucosal surface","EM minor is caused by drugs","EM minor leaves scars"]', 1, 'Mucosal involvement is the key distinguishing factor.');

    ---------------------------------------------------------------------------
    -- CASE 47: Stevens-Johnson Syndrome (SJS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sloughing Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sloughing Skin', 'A 40-year-old woman was started on Allopurinol 2 weeks ago for gout. She presents to the ER with high fever, sore throat, and severe eye pain. Her skin is exquisitely painful to touch.

Vitals: T 39.5 C, HR 120.
Physical Examination: Widespread dusky erythematous macules that coalesce into flaccid blisters. Gently rubbing the normal-appearing skin causes the epidermis to shear off completely. Severe hemorrhagic crusting of the lips and conjunctivitis are present.
Laboratory Results: Skin biopsy shows full-thickness epidermal necrosis.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old woman was started on Allopurinol 2 weeks ago for gout. She presents to the ER with high fever, sore throat, and severe eye pain. Her skin is exquisitely painful to touch.

Vitals: T 39.5 C, HR 120.
Physical Examination: Widespread dusky erythematous macules that coalesce into flaccid blisters. Gently rubbing the normal-appearing skin causes the epidermis to shear off completely. Severe hemorrhagic crusting of the lips and conjunctivitis are present.
Laboratory Results: Skin biopsy shows full-thickness epidermal necrosis.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical sign demonstrated by rubbing the skin and causing it to shear off?', '["Auspitz sign","Nikolsky sign","Koebner phenomenon","Darier sign"]', 1, 'A positive Nikolsky sign indicates that the intraepidermal adhesion is completely destroyed, allowing the top layer of skin to slip off with slight friction.'),
    (v_case_id, 'What is the defining threshold that separates Stevens-Johnson Syndrome (SJS) from Toxic Epidermal Necrolysis (TEN)?', '["The type of drug","SJS involves <10% of the body surface area (BSA) detachment; TEN involves >30% BSA detachment (10-30% is SJS/TEN overlap)","The presence of mucosal lesions","The presence of fever"]', 1, 'They are the same disease spectrum (massive drug-induced apoptosis of keratinocytes), graded by the percentage of skin lost.'),
    (v_case_id, 'What class of medications is the most notorious trigger for SJS/TEN?', '["Antihistamines","Anticonvulsants (Carbamazepine, Lamotrigine), Allopurinol, Sulfa antibiotics, and NSAIDs","Beta-blockers","Statins"]', 1, 'These specific drugs are extreme high-risk triggers.');

    ---------------------------------------------------------------------------
    -- CASE 48: Bullous Pemphigoid
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blistering Elderly Man' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blistering Elderly Man', 'An 80-year-old man presents with severe itching and large blisters on his abdomen and thighs. He feels otherwise well.

Vitals: Normal.
Physical Examination: Numerous large, tense, thick-roofed bullae on an erythematous base located on the lower trunk and flexural thighs. Nikolsky sign is NEGATIVE. Mucous membranes are clear.
Laboratory Results: Direct immunofluorescence (DIF) shows linear IgG and C3 deposited along the basement membrane zone.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old man presents with severe itching and large blisters on his abdomen and thighs. He feels otherwise well.

Vitals: Normal.
Physical Examination: Numerous large, tense, thick-roofed bullae on an erythematous base located on the lower trunk and flexural thighs. Nikolsky sign is NEGATIVE. Mucous membranes are clear.
Laboratory Results: Direct immunofluorescence (DIF) shows linear IgG and C3 deposited along the basement membrane zone.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are the blisters in Bullous Pemphigoid described as ''tense'' and why is the Nikolsky sign negative?', '["The fluid is very thick","The split occurs DEEP in the skin, at the dermoepidermal junction (subepidermal), meaning the entire thickness of the epidermis forms a strong roof over the blister","They are viral","They are small"]', 1, 'Subepidermal blisters don''t rupture easily.'),
    (v_case_id, 'What are the specific autoantibodies in Bullous Pemphigoid targeting?', '["Desmoglein 1 and 3","Hemidesmosomes (BP180 and BP230 antigens), which anchor the basal keratinocytes to the basement membrane","Transglutaminase","Nuclear antigens"]', 1, 'Destroying the hemidesmosome unzips the epidermis from the dermis.'),
    (v_case_id, 'What is the initial treatment of choice for localized Bullous Pemphigoid?', '["Oral antibiotics","High-potency topical corticosteroids (e.g., Clobetasol) to shut down local inflammation","IVIG","Surgery"]', 1, 'Topical steroids are surprisingly effective even for widespread disease and carry less mortality risk than systemic steroids in the elderly.');

    ---------------------------------------------------------------------------
    -- CASE 49: Pemphigus Vulgaris
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Mouth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Mouth', 'A 50-year-old woman presents with severe mouth pain and weight loss because she cannot eat. Over the past month, she developed painful sores on her chest.

Vitals: Normal.
Physical Examination: Extensive, painful erosions on the buccal mucosa and palate. The chest shows flaccid, easily ruptured blisters that leave raw, weeping, painful erosions. Nikolsky sign is strongly POSITIVE.
Laboratory Results: DIF shows intercellular IgG deposition in a ''chicken wire'' pattern throughout the epidermis.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old woman presents with severe mouth pain and weight loss because she cannot eat. Over the past month, she developed painful sores on her chest.

Vitals: Normal.
Physical Examination: Extensive, painful erosions on the buccal mucosa and palate. The chest shows flaccid, easily ruptured blisters that leave raw, weeping, painful erosions. Nikolsky sign is strongly POSITIVE.
Laboratory Results: DIF shows intercellular IgG deposition in a ''chicken wire'' pattern throughout the epidermis.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are the blisters in Pemphigus Vulgaris flaccid and easily ruptured (positive Nikolsky)?', '["They are filled with acid","The split occurs SHALLOW within the epidermis (intraepidermal) just above the basal layer, so the roof of the blister is incredibly thin and fragile","They are subepidermal","They are infectious"]', 1, 'The blister roof is only a few cell layers thick, so it pops almost immediately, leaving painful erosions.'),
    (v_case_id, 'What specific adhesion structures are the autoantibodies targeting in Pemphigus Vulgaris?', '["Hemidesmosomes","Desmosomes (specifically Desmoglein 1 and 3), which glue adjacent keratinocytes together","Basement membrane","Collagen"]', 1, 'When the desmosomes are destroyed, the keratinocytes fall apart from each other (acantholysis).'),
    (v_case_id, 'Historically, before the invention of systemic corticosteroids and immunosuppressants (like Rituximab), what was the mortality rate of Pemphigus Vulgaris?', '["10%","Near 100% due to massive fluid loss and fatal sepsis from the raw, open skin","0%","50%"]', 1, 'It is an inherently fatal disease without aggressive systemic immunosuppression.');

    ---------------------------------------------------------------------------
    -- CASE 50: Dermatitis Herpetiformis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gluten Itch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gluten Itch', 'A 35-year-old male with chronic diarrhea and bloating presents with an excruciatingly itchy rash on his elbows, knees, and buttocks.

Vitals: Normal.
Physical Examination: Symmetrically distributed, severely excoriated grouped papules and tiny vesicles on the extensor surfaces of the elbows, knees, and buttocks.
Laboratory Results: Skin biopsy with DIF shows granular IgA deposits in the tips of the dermal papillae.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male with chronic diarrhea and bloating presents with an excruciatingly itchy rash on his elbows, knees, and buttocks.

Vitals: Normal.
Physical Examination: Symmetrically distributed, severely excoriated grouped papules and tiny vesicles on the extensor surfaces of the elbows, knees, and buttocks.
Laboratory Results: Skin biopsy with DIF shows granular IgA deposits in the tips of the dermal papillae.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Dermatitis Herpetiformis is the cutaneous manifestation of what underlying systemic disease?', '["Crohn''s disease","Celiac Disease (Gluten-sensitive enteropathy)","Ulcerative Colitis","Rheumatoid Arthritis"]', 1, 'Almost all patients with DH have histologic evidence of celiac disease, even if they have no GI symptoms.'),
    (v_case_id, 'What is the target antigen that the IgA antibodies are attacking in the skin?', '["Desmoglein","Epidermal Transglutaminase (which is highly homologous to tissue transglutaminase in the gut)","Hemidesmosomes","Collagen VII"]', 1, 'The body makes antibodies against the gut enzyme handling gluten, and these antibodies cross-react with a similar enzyme in the skin.'),
    (v_case_id, 'While a strict gluten-free diet is the definitive long-term cure, what oral medication provides rapid (within 24-48 hours) relief of the severe itching?', '["Prednisone","Dapsone","Antihistamines","Ibuprofen"]', 1, 'Dapsone shuts down the massive neutrophilic inflammation in the dermal papillae almost instantly.');

END $$;
COMMIT;
