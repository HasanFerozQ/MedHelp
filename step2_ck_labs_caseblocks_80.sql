-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Interpretation of labs, imaging, biopsies in context
-- Topic Slug: case-labs-imaging
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-labs-imaging' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-labs-imaging';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Glow of the Inner Thigh
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Glow of the Inner Thigh', 'A 40-year-old obese male presents with a macerated, red rash in his groin that doesn''t itch much but is slightly painful.

Vitals: Normal.
Physical Examination: Well-demarcated, reddish-brown patches in the bilateral inguinal folds. No satellite lesions are seen.
Laboratory Results: Wood''''s lamp examination shows ''coral-red'' fluorescence.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism for this patient''s condition?', '["Trichophyton rubrum","Corynebacterium minutissimum","Candida albicans","None"]', 1, 'Erythrasma is caused by Corynebacterium minutissimum, which produces porphyrins that fluoresce coral-red.'),
        (v_case_id, 'How would the Wood''s lamp fluorescence differ if this were Tinea Cruris (Jock Itch)?', '["It would be bright green","It would show no fluorescence (usually)","It would be blue","None"]', 1, 'Most common dermatophytes causing jock itch do not fluoresce.'),
        (v_case_id, 'What is the best initial treatment for localized erythrasma?', '["Topical antifungal","Topical antibiotics (e.g., Clindamycin or Erythromycin) or antibacterial washes","Oral steroids","None"]', 1, 'Since it is bacterial, antibiotics are the treatment of choice.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Multinucleated Giant Cell
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Multinucleated Giant Cell', 'A 25-year-old female presents with a cluster of painful vesicles on her lip. The physician performs a ''Tzanck smear'' in the clinic.

Vitals: Normal.
Physical Examination: Grouped vesicles on an erythematous base.
Laboratory Results: Tzanck smear shows ''multinucleated giant cells'' and ''acantholytic'' keratinocytes.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'A positive Tzanck smear (multinucleated giant cells) is seen in which of the following infections?', '["HSV-1 and HSV-2 only","VZV (Chickenpox/Shingles) only","Both HSV and VZV","Human Papillomavirus (HPV)"]', 2, 'The Tzanck smear identifies viral cytopathic effects common to the Herpesviridae family.'),
        (v_case_id, 'Can the Tzanck smear distinguish between HSV and VZV?', '["Yes","No, it only indicates a herpesvirus infection; Viral culture, PCR, or DFA is needed for typing","Only in children","None"]', 1, 'Typing requires more specific molecular or culture methods.'),
        (v_case_id, 'What is the most sensitive and specific modern test for confirming HSV?', '["Tzanck smear","Viral culture","PCR (Polymerase Chain Reaction)","Wood''s lamp"]', 2, 'PCR is now the preferred test due to its high sensitivity.');

    ---------------------------------------------------------------------------
    -- CASE 03: The ''Spaghetti and Meatballs''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Spaghetti and Meatballs''', 'A patient presents with white, non-tanning spots on his back after a vacation in Hawaii.

Vitals: Normal.
Physical Examination: Multiple hypo- and hyper-pigmented finely scaly macules.
Laboratory Results: KOH prep shows ''short hyphae and round spores''.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''spaghetti and meatballs'' appearance on KOH prep is pathognomonic for which condition?', '["Tinea Corporis","Tinea Versicolor (Pityriasis versicolor)","Candidiasis","None"]', 1, 'This refers to the short hyphae (spaghetti) and spores (meatballs) of Malassezia furfur.'),
        (v_case_id, 'What is the characteristic Wood''s lamp fluorescence for Tinea Versicolor?', '["Bright green","Yellow-orange or copper-orange","Pink","None"]', 1, 'Malassezia produces metabolites that glow yellow-orange under Wood''s lamp.'),
        (v_case_id, 'What is the best initial topical treatment for this patient?', '["Topical steroids","Selenium sulfide or Ketoconazole shampoo/cream","Topical antibiotics","None"]', 1, 'Anti-seborrheic/anti-fungal agents are effective against Malassezia.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Mite and the Burrow
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mite and the Burrow', 'A 20-year-old student has intense itching between his fingers that is worse at night.

Vitals: Normal.
Physical Examination: Small linear ridges (burrows) and excoriated papules in the finger webs.
Laboratory Results: Skin scraping with mineral oil shows an adult mite and several oval eggs.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where is the ''Best'' place to scrape for a scabies diagnosis?', '["A red papule","A non-excoriated burrow","Normal skin","The center of the chest"]', 1, 'Mites, eggs, and feces (scybala) are most concentrated within the burrows.'),
        (v_case_id, 'What is the name of the mite that causes scabies?', '["Demodex folliculorum","Sarcoptes scabiei","Pediculus humanus","None"]', 1, 'Sarcoptes scabiei var. hominis is the human itch mite.'),
        (v_case_id, 'If the scraping is negative, but the clinical suspicion is high, should you still treat?', '["No, wait for a positive test","Yes, scabies scrapings have low sensitivity; a clinical diagnosis is often sufficient for treatment","Only if the patient has a fever","None"]', 1, 'Failure to find the mite is common and does not rule out the diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 05: The ''Stuck-On'' Network
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Stuck-On'' Network', 'A physician is examining a dark brown, warty lesion on a patient''s back using a dermatoscope.

Vitals: Normal.
Physical Examination: 1-cm brown, ''stuck-on'' plaque.
Laboratory Results: Dermoscopy shows ''milky-white cysts'' (pseudo-horn cysts) and ''comedo-like openings''.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'These dermoscopic features (horn cysts, comedo-like openings) are highly suggestive of:', '["Melanoma","Seborrheic Keratosis","BCC","None"]', 1, 'Pseudo-horn cysts are a hallmark of benign seborrheic keratoses.'),
        (v_case_id, 'Dermoscopy is primarily used to distinguish between:', '["Infection and allergy","Melanocytic vs. non-melanocytic lesions and benign vs. malignant tumors","Dry vs. oily skin","None"]', 1, 'It allows for visualization of subsurface structures not visible to the naked eye.'),
        (v_case_id, 'A ''pigment network'' seen on dermoscopy is a feature of:', '["BCC","Melanocytic lesions (moles/melanomas)","Warts","None"]', 1, 'The network represents the rete ridges of the epidermis containing melanin.');

    ---------------------------------------------------------------------------
    -- CASE 06: The ''Leaf-Like'' Border
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Leaf-Like'' Border', 'A 60-year-old male has a suspicious translucent bump on his cheek. The physician uses dermoscopy.

Vitals: Normal.
Physical Examination: Pearly papule with telangiectasias.
Laboratory Results: Dermoscopy shows ''arborizing telangiectasias'' and ''leaf-like areas'' at the periphery.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''arborizing (tree-like) telangiectasias'' is a classic dermoscopic clue for:', '["SCC","BCC","Melanoma","Psoriasis"]', 1, 'These large, distinct, branching vessels are very common in nodular BCC.'),
        (v_case_id, 'What do ''leaf-like areas'' represent on dermoscopy?', '["Hairs","Basaloid tumor nests at the periphery","Fungus","None"]', 1, 'They are another high-yield dermoscopic feature of BCC.'),
        (v_case_id, 'Is a ''pigment network'' typically seen in BCC?', '["Yes","No, BCC is a non-melanocytic tumor (though pigmented variants exist, they show globule-like structures rather than a network)","Only in children","None"]', 1, 'The absence of a network helps distinguish BCC from a melanocytic nevus.');

    ---------------------------------------------------------------------------
    -- CASE 07: The ABCD and the E
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ABCD and the E', 'A patient is concerned about a changing mole on her arm.

Vitals: Normal.
Physical Examination: A 7-mm mole with irregular borders and two shades of brown.
Laboratory Results: None.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''D'' stand for in the melanoma ABCD criteria?', '["Depth","Diameter (> 6 mm)","Dermal involvement","None"]', 1, 'Asymmetry, Border, Color, Diameter (>6mm), and Evolving are the classic keys.'),
        (v_case_id, 'Which of the ABCD criteria is often considered the MOST important for early detection?', '["Asymmetry","Border","Evolving (changing over time)","Diameter"]', 2, 'Change is the most sensitive indicator of malignancy.'),
        (v_case_id, 'What is the ''Ugly Duckling'' sign?', '["A very pretty mole","A mole that looks significantly different from all the other moles on that specific patient","A mole on the neck","None"]', 1, 'Most people have a ''signature'' mole pattern; the one that doesn''t fit is suspicious.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Scalp Glow
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Glow', 'A 6-year-old child has a patch of hair loss with ''black dots'' and scale.

Vitals: Normal.
Physical Examination: Alopecia with broken hairs.
Laboratory Results: Wood''''s lamp examination shows ''bright yellow-green'' fluorescence along the hair shafts.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is the most likely cause of yellow-green fluorescence in Tinea Capitis?', '["Trichophyton tonsurans","Microsporum canis or Microsporum audouinii","Candida","None"]', 1, 'Microsporum species classically fluoresce; the most common US cause (T. tonsurans) does NOT fluoresce.'),
        (v_case_id, 'If the Wood''s lamp is negative, can you rule out Tinea Capitis?', '["Yes","No, because the most common cause (T. tonsurans) is ''non-fluorescent''","Only in adults","None"]', 1, 'A negative Wood''s lamp does not rule out fungal infection.'),
        (v_case_id, 'What is the ''Gold Standard'' test for confirming Tinea Capitis?', '["Wood''s lamp","Fungal culture of the hair and scale","Tzanck smear","None"]', 1, 'Culture remains the definitive diagnostic test.');

    ---------------------------------------------------------------------------
    -- CASE 09: The ''Linear'' Deposit
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Linear'' Deposit', 'A 50-year-old presents with tense blisters on his shins. A biopsy is taken for Direct Immunofluorescence (DIF).

Vitals: Normal.
Physical Examination: Tense bullae.
Laboratory Results: DIF shows ''Linear IgG and C3'' along the basement membrane zone.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Linear IgG/C3 along the BMZ is the hallmark of which condition?', '["Pemphigus Vulgaris","Bullous Pemphigoid","Lupus","None"]', 1, 'Autoantibodies target the hemidesmosomes (BP180/BP230) in the basement membrane.'),
        (v_case_id, 'How would the DIF pattern differ in Pemphigus Vulgaris?', '["It would be the same","It would show ''Net-like'' or ''Chicken-wire'' (intercellular) IgG deposition in the epidermis","It would be negative","None"]', 1, 'Pemphigus targets the desmosomes between keratinocytes.'),
        (v_case_id, 'Salt-split skin testing is used to distinguish BP from which other condition?', '["Pemphigus","Epidermolysis Bullosa Acquisita (EBA)","Acne","None"]', 1, 'In BP, the antibodies stay on the ''roof'' (epidermal side); in EBA, they stay on the ''floor'' (dermal side).');

    ---------------------------------------------------------------------------
    -- CASE 10: The ''Psoriasiform'' Pattern
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasiform'' Pattern', 'A pathology report for a red, scaly plaque mentions ''regular acanthosis, parakeratosis, and neutrophilic microabscesses''.

Vitals: Normal.
Physical Examination: Silver scaly plaques on the elbows.
Laboratory Results: Biopsy report received.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the ''Munro microabscesses'' mentioned in the report?', '["Pockets of bacteria","Collections of neutrophils within the stratum corneum","Fungal colonies","None"]', 1, 'Neutrophilic migration into the epidermis is a key feature of psoriasis.'),
        (v_case_id, 'What does ''Acanthosis'' mean in a pathology report?', '["Skin thinning","Thickening of the epidermis (specifically the stratum spinosum)","Skin cancer","None"]', 1, 'Regular, ''test-tube'' like acanthosis is classic for psoriasis.'),
        (v_case_id, 'What happens to the ''Granular Layer'' in psoriasis?', '["It gets thicker","It is absent or significantly thinned (hypogranulosis)","It turns blue","None"]', 1, 'The rapid turnover in psoriasis prevents the formation of a normal granular layer.');

    ---------------------------------------------------------------------------
    -- CASE 11: The ''Interface'' Dermatitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Interface'' Dermatitis', 'A patient with a purple, flat-topped rash on his wrist has a biopsy. The report mentions ''interface dermatitis'' and ''Civatte bodies''.

Vitals: Normal.
Physical Examination: Purple, polygonal, planar, pruritic papules (Lichen Planus).
Laboratory Results: Biopsy shows a ''saw-tooth'' rete ridge pattern.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Interface Dermatitis'' describe?', '["Infection","Inflammation/damage localized to the dermal-epidermal junction","A rash on the hands","None"]', 1, 'The ''interface'' is where the epidermis and dermis meet.'),
        (v_case_id, 'What are ''Civatte bodies'' (also called cytoid or colloid bodies)?', '["Bacteria","Apoptotic (dead) keratinocytes","Fungal spores","None"]', 1, 'They are the remnants of keratinocytes damaged by the inflammation.'),
        (v_case_id, 'Which other ''Step'' condition classically shows an interface dermatitis pattern?', '["Lupus Erythematosus","Psoriasis","Acne","None"]', 0, 'Lupus, Lichen Planus, and Erythema Multiforme are the ''big three'' for interface patterns.');

    ---------------------------------------------------------------------------
    -- CASE 12: The ''Wood'' and the ''Ash Leaf''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wood'' and the ''Ash Leaf''', 'A child with several ''white spots'' on his trunk and a history of seizures is examined with a Wood''''s lamp.

Vitals: Normal.
Physical Examination: Hypopigmented, leaf-shaped macules.
Laboratory Results: Wood''''s lamp makes the spots appear ''bright blue-white''.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the Wood''s lamp helpful in diagnosing ''Ash-leaf spots'' in fair-skinned children?', '["It turns them red","It enhances the contrast between the hypopigmented spots and normal skin, making them easier to see","It cures the spots","None"]', 1, 'Hypopigmented lesions are often invisible in bright light on fair skin.'),
        (v_case_id, 'What is the ''bright blue-white'' fluorescence in Vitiligo due to?', '["A fungus","The total absence of melanin, which allows for increased reflection and autofluorescence of dermal collagen","A pigment","None"]', 1, 'Wood''s lamp helps distinguish between hypopigmentation (low melanin) and depigmentation (no melanin).'),
        (v_case_id, 'Which other cutaneous sign of Tuberous Sclerosis is typically found on the face?', '["Acne","Angiofibromas (historically called adenoma sebaceum)","Warts","None"]', 1, 'These small, red-to-pink papules are a hallmark of TS.');

    ---------------------------------------------------------------------------
    -- CASE 13: The ''Pearly'' Bump and the ''Palisading''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Palisading''', 'A pathology report for a pearly bump on the face describes ''islands of basaloid cells with peripheral palisading and clefting''.

Vitals: Normal.
Physical Examination: Classic BCC.
Laboratory Results: Histology confirms the diagnosis.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Peripheral Palisading'' describe?', '["Tumor cells arranged in a circle","The outermost layer of tumor cells arranged vertically, like a ''picket fence''","Cells in a line","None"]', 1, 'This is a characteristic architectural feature of BCC.'),
        (v_case_id, 'What is the ''Clefting'' (retraction artifact) seen in BCC histology?', '["A tear in the skin","A space between the tumor nests and the surrounding stroma, often due to tissue processing","A hole in the cell","None"]', 1, 'The ''shrinkage'' away from the stroma is very common in BCC specimens.'),
        (v_case_id, 'Which type of BCC is the most aggressive and likely to recur?', '["Nodular","Superficial","Morpheaform (Sclerosing) or Infiltrative","None"]', 2, 'Infiltrative patterns have ''roots'' that are hard to see clinically.');

    ---------------------------------------------------------------------------
    -- CASE 14: The ''Blue-White'' Veil
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Blue-White'' Veil', 'A dermatologist is examining a dark, irregular mole on a patient''''s leg using dermoscopy.

Vitals: Normal.
Physical Examination: Atypical mole.
Laboratory Results: Dermoscopy shows a ''blue-white veil'' and ''atypical network''.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Blue-White Veil'' represent on dermoscopy?', '["Fungus","A sign of deep (dermal) melanin and orthokeratosis, often seen in invasive melanoma","Skin oil","None"]', 1, 'This is a high-risk feature for melanoma.'),
        (v_case_id, 'What are ''Chrysalis structures'' (also called shiny white streaks)?', '["Worms","Shiny white lines seen only with polarized dermoscopy, representing altered dermal collagen (common in BCC and Melanoma)","Soap residue","None"]', 1, 'These are a marker of invasive growth and collagen remodeling.'),
        (v_case_id, 'An ''asymmetric'' distribution of structures is characteristic of:', '["Benign moles","Malignant melanoma","Normal skin","None"]', 1, 'Malignancy is characterized by architectural chaos.');

    ---------------------------------------------------------------------------
    -- CASE 15: The ''Target'' and the ''PAS'' Stain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''PAS'' Stain', 'A pathology report for a suspected fungal infection on the foot says ''PAS stain is positive for fungal hyphae in the stratum corneum''.

Vitals: Normal.
Physical Examination: Scaly foot.
Laboratory Results: PAS stain performed.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''PAS'' (Periodic Acid-Schiff) stain highlight?', '["Bacteria","Carbohydrates (specifically the glycogen in fungal cell walls), turning them bright magenta/red","Iron","None"]', 1, 'PAS is the standard stain for detecting dermatophytes in skin and nails.'),
        (v_case_id, 'Which other stain is commonly used to find fungi, turning them black?', '["Gram stain","GMS (Gomori Methenamine Silver)","H&E","None"]', 1, 'GMS provides excellent contrast for identifying fungal morphology.'),
        (v_case_id, 'Is PAS helpful for identifying ''Pityriasis Versicolor''?', '["No","Yes, it highlights the Malassezia organisms very clearly","Only in the sun","None"]', 1, 'While KOH is faster, PAS is very sensitive for Malassezia.');

    ---------------------------------------------------------------------------
    -- CASE 16: The ''Itch'' and the ''Patch'' Test
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Patch'' Test', 'A patient with chronic hand dermatitis undergoes ''Patch testing''.

Vitals: Normal.
Physical Examination: Red, scaly, cracked hands.
Laboratory Results: Patch test is read at 48 and 96 hours. A positive result is seen for Nickel.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What type of hypersensitivity reaction is being tested in ''Patch Testing''?', '["Type I (IgE-mediated)","Type IV (Delayed-type, T-cell mediated)","Type II","None"]', 1, 'Contact allergy is a T-cell mediated process, which is why the test is read days later.'),
        (v_case_id, 'How does this differ from ''Skin Prick'' testing?', '["Prick testing is for Type IV","Prick testing is for Type I (e.g., pollen, food, hives) and is read within 15-20 minutes","They are the same","None"]', 1, 'The timing and mechanism are completely different.'),
        (v_case_id, 'Can you perform a patch test while a patient is on high-dose oral Prednisone?', '["Yes","No, systemic steroids can suppress the T-cell response and lead to false-negative results","Only in adults","None"]', 1, 'Patients must be off or on very low-dose steroids for accurate testing.');

    ---------------------------------------------------------------------------
    -- CASE 17: The ''Pearly'' Bump and the ''Granuloma''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Granuloma''', 'A biopsy of a red bump on the arm shows ''naked, non-caseating granulomas''.

Vitals: Normal.
Physical Examination: Red/brown papules on the skin and a history of a dry cough.
Laboratory Results: ACE (Angiotensin-Converting Enzyme) level is elevated.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Naked'' granuloma mean in the context of Sarcoidosis?', '["It''s visible to the eye","Granulomas with a minimal surrounding ''rim'' of lymphocytes","It has no skin over it","None"]', 1, 'The lack of a significant inflammatory cuff is characteristic of sarcoid granulomas.'),
        (v_case_id, 'What is a ''Caseating'' granuloma characteristic of?', '["Sarcoidosis","Tuberculosis (TB)","Fungus","All of the above"]', 1, 'Caseation (cheese-like necrosis) is the hallmark of TB.'),
        (v_case_id, 'Where is the most common ''non-skin'' location involved in sarcoidosis?', '["Liver","Lungs and Intrathoracic lymph nodes","Brain","None"]', 1, 'Hilar lymphadenopathy is a classic finding on Chest X-ray.');

    ---------------------------------------------------------------------------
    -- CASE 18: The ''Itch'' and the ''Prick'' Test
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Prick'' Test', 'A patient with chronic hives (urticaria) is having ''Skin Prick'' testing for food allergies.

Vitals: Normal.
Physical Examination: Hives appearing and disappearing.
Laboratory Results: A ''wheal and flare'' reaction is seen within 15 minutes to shrimp.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''wheal and flare'' reaction is a hallmark of which antibody-mediated response?', '["IgG","IgE","IgM","None"]', 1, 'IgE cross-linking on mast cells leads to immediate histamine release.'),
        (v_case_id, 'What is a mandatory ''Positive Control'' used during skin prick testing?', '["Water","Histamine","Salt","None"]', 1, 'Histamine must cause a wheal to ensure the patient''s skin is responsive (and they aren''t on antihistamines).'),
        (v_case_id, 'Which medication must be stopped at least 3-7 days BEFORE skin prick testing?', '["Antibiotics","Antihistamines","Vitamins","None"]', 1, 'Antihistamines will block the reaction and cause false-negatives.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Target'' and the ''Direct'' (Pemphigus)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Direct'' (Pemphigus)', 'A patient with mouth ulcers has a biopsy taken for DIF. The report describes ''Intercellular IgG and C3 in a fish-net pattern''.

Vitals: Normal.
Physical Examination: Painful oral erosions and a positive Nikolsky sign.
Laboratory Results: Histology shows ''acantholysis'' and a ''tombstoning'' pattern.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Tombstoning'' describe on histology?', '["Dead skin","A single layer of basal keratinocytes remaining attached to the basement membrane, while the layers above have separated (acantholysis)","Pus","None"]', 1, 'This is a classic histologic description for Pemphigus Vulgaris.'),
        (v_case_id, 'Which specific protein is the target of autoantibodies in Pemphigus Vulgaris?', '["BP180","Desmoglein 3 (and sometimes 1)","Keratin 5","None"]', 1, 'Anti-desmoglein 3 is responsible for the mucosal-dominant form.'),
        (v_case_id, 'What is the Nikolsky sign?', '["A rash","The sliding away of the top layer of skin when lateral pressure is applied, indicating weak intercellular adhesion","A fever","None"]', 1, 'Nikolsky is positive in Pemphigus but negative in Bullous Pemphigoid.');

    ---------------------------------------------------------------------------
    -- CASE 20: The ''Target'' and the ''Acantholysis''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Acantholysis''', 'A pathology report mentions ''acantholytic keratinocytes'' in a patient with a blistering disease.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the definition of ''Acantholysis''?', '["Skin thickening","Loss of intercellular adhesion between keratinocytes, leading to ''rounded-up'' individual cells","Infection","None"]', 1, 'It is the fundamental process in Pemphigus.'),
        (v_case_id, 'Besides Pemphigus, which ''viral'' infection classically shows acantholysis on Tzanck smear/biopsy?', '["HPV","HSV/VZV","Flu","None"]', 1, 'Viral damage can also cause cells to lose adhesion and round up.'),
        (v_case_id, 'How does acantholysis differ from ''Spongiosis''?', '["They are the same","Spongiosis is intercellular EDEMA (fluid between cells), seen in eczema; acantholysis is loss of the cellular CONNECTIONS themselves","None","Spongiosis is faster"]', 1, 'Spongiosis looks like ''stretching'' of the desmosomes (the ''sponge'' look), while acantholysis is the complete breakage of those connections.');

    ---------------------------------------------------------------------------
    -- CASE 21: The '' Wood'' and the ''Porphyria''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The '' Wood'' and the ''Porphyria''', 'A patient with blisters on the back of his hands and tea-colored urine has his urine examined with a Wood''''s lamp.

Vitals: Normal.
Physical Examination: Erosions, milia, and scarring on sun-exposed hands.
Laboratory Results: Urine fluoresces ''coral-pink/orange'' under Wood''''s lamp.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The coral-pink fluorescence in the urine is due to the presence of high levels of what?', '["Sugar","Uroporphyrins","Blood","None"]', 1, 'Porphyrins are naturally fluorescent under UV light.'),
        (v_case_id, 'What is the most common underlying liver association with Porphyria Cutanea Tarda (PCT)?', '["Hepatitis B","Hepatitis C (and Chronic Alcohol use)","Fatty liver only","None"]', 1, 'Screening for Hep C is mandatory in new cases of PCT.'),
        (v_case_id, 'What is the best initial treatment for PCT?', '["Steroids","Phlebotomy or low-dose Hydroxychloroquine","Antibiotics","None"]', 1, 'Removing iron (phlebotomy) or increasing porphyrin excretion (hydroxychloroquine) is effective.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Target'' and the ''Imaging'' (Ultrasound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Ultrasound)', 'A patient has a soft, mobile lump on his forehead. The doctor performs a bedside ultrasound.

Vitals: Normal.
Physical Examination: Soft subcutaneous nodule.
Laboratory Results: Ultrasound shows a ''well-circumscribed, hypoechoic mass with no internal blood flow''.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can ultrasound help distinguish a Lipoma from a Cyst?', '["It can''t","Lipomas are typically hyperechoic/isoechoic and soft; cysts are often hypoechoic with ''posterior acoustic enhancement'' (due to fluid)","None","Cysts are red"]', 1, 'Ultrasound is excellent for characterizing the nature of subcutaneous lumps.'),
        (v_case_id, 'What does ''Posterior Acoustic Enhancement'' indicate?', '["A tumor","The presence of fluid (the ultrasound waves pass through fluid easily and look brighter behind it)","Bone","None"]', 1, 'This is a classic ultrasound finding for cysts.'),
        (v_case_id, 'Why is checking for ''internal blood flow'' (Doppler) important in a skin tumor?', '["No reason","Increased vascularity can be a sign of malignancy or an inflammatory process","It''s just for fun","None"]', 1, 'High-flow lesions require more cautious management.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Itch'' and the ''Congo Red''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Congo Red''', 'A pathology report for a waxy, translucent papule on the eyelid mentions ''apple-green birefringence under polarized light after Congo Red staining''.

Vitals: Normal.
Physical Examination: Waxy papules around the eyes (Pinch purpura is also noted).
Laboratory Results: Biopsy results received.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Apple-green birefringence with Congo Red stain is pathognomonic for:', '["Collagen","Amyloid","Fungus","None"]', 1, 'This is a classic ''Step'' board association for amyloid proteins.'),
        (v_case_id, 'What is ''Pinch Purpura'' in the context of Systemic Amyloidosis?', '["A bug bite","Easy bruising (ecchymosis) of the skin after minor trauma/pinching, especially around the eyes","A rash","None"]', 1, 'Amyloid infiltration of blood vessel walls makes them extremely fragile.'),
        (v_case_id, 'Which organ system must be screened for in a patient with biopsy-proven systemic amyloidosis?', '["Lungs","Heart (restrictive cardiomyopathy) and Kidneys (nephrotic syndrome)","Limb length","None"]', 1, 'Amyloid can infiltrate vital organs, leading to significant morbidity.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Pearly'' Bump and the ''SCC'' (Histology)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''SCC'' (Histology)', 'A pathology report for a rough, scaly lesion describes ''full-thickness atypia of the epidermis without invasion into the dermis''.

Vitals: Normal.
Physical Examination: Scaly red patch on sun-damaged skin.
Laboratory Results: Histology report received.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for Squamous Cell Carcinoma that is ''in situ'' (limited to the epidermis)?', '["Actinic Keratosis","Bowen''s Disease (SCC in situ)","Invasive SCC","BCC"]', 1, 'In situ means the basement membrane is intact.'),
        (v_case_id, 'How does Actinic Keratosis differ histologically from SCC in situ?', '["AK is deeper","AK shows ''partial-thickness'' atypia (usually the lower 1/3 of the epidermis), while SCC in situ is ''full-thickness''","No difference","None"]', 1, 'AK is a precursor; SCC in situ is cancer that hasn''t started invading yet.'),
        (v_case_id, 'What are ''Keratin Pearls'' a sign of?', '["BCC","Well-differentiated invasive Squamous Cell Carcinoma","A skin infection","None"]', 1, 'They represent focal areas of keratinization within tumor nests.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Target'' and the ''Imaging'' (MRI)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (MRI)', 'A patient with a rapidly spreading leg infection and high fever is being rushed for an MRI.

Vitals: T 39.5, BP 90/60.
Physical Examination: Dusky skin, crepitus.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most characteristic MRI finding for necrotizing fasciitis?', '["Bone fracture","Thickening and enhancement of the deep fascia with fluid/gas along the fascial planes","A tumor","None"]', 1, 'MRI is very sensitive for identifying deep fascial involvement.'),
        (v_case_id, 'Should surgery be DELAYED to wait for an MRI if the clinical suspicion is very high?', '["Yes, always confirm first","No, necrotizing fasciitis is a clinical diagnosis; surgery should proceed immediately to prevent death","Only in the elderly","None"]', 1, 'Time is tissue; surgical exploration is the gold standard and the ultimate ''test''.'),
        (v_case_id, 'What is the ''LRINEC'' score used for?', '["Melanoma staging","A laboratory-based scoring system (using WBC, CRP, Sodium, Glucose, etc.) to help identify necrotizing fasciitis","Acne grading","None"]', 1, 'Laboratory Risk Indicator for Necrotizing Fasciitis (LRINEC) is a triage tool.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Starry'' Night
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Starry'' Night', 'A dermatologist is examining a dark spot on the face of an 80-year-old woman with extensive sun damage. The lesion is flat and has uneven pigment.

Vitals: Normal.
Physical Examination: 1.5 cm irregular brown macule on the cheek.
Laboratory Results: Dermoscopy shows ''pseudo-network'', ''asymmetric follicular opening pigmentation'', and ''rhomboidal structures''.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The dermoscopic features described (pigmentation around follicular openings) are highly suggestive of what melanoma variant?', '["Nodular melanoma","Lentigo Maligna (Melanoma in situ on sun-damaged skin)","Acral lentiginous melanoma","None"]', 1, 'Melanocytes in Lentigo Maligna classically migrate down the hair follicles.'),
        (v_case_id, 'Why is a ''Punch'' biopsy sometimes preferred over a ''Shave'' for a large facial lesion like this?', '["It''s faster","To get a representative sample of the most suspicious area without causing extensive scarring from a large excision","No reason","None"]', 1, 'While WLE is definitive, a targeted punch helps confirm the diagnosis first in cosmetically sensitive areas.'),
        (v_case_id, 'What is the ''Rhomboidal structure'' in this context?', '["A square","Pigment forming diamond-like shapes around hair follicles, a late sign of LM","A fungus","None"]', 1, 'It is a highly specific dermoscopic indicator for Lentigo Maligna.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Target'' and the ''Vasculitis''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Vasculitis''', 'A pathology report for a palpable purpura on the legs describes ''leukocytoclastic vasculitis (LCV) with fibrinoid necrosis and RBC extravasation''.

Vitals: Normal.
Physical Examination: Non-blanching purple spots on the shins.
Laboratory Results: Biopsy results received.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Leukocytoclasis'' refer to histologically?', '["Bacteria","Nuclear dust (fragments of neutrophils) in the vessel wall","Dead skin","None"]', 1, 'LCV is characterized by neutrophil destruction and the resulting ''dust''.'),
        (v_case_id, 'What is ''Fibrinoid Necrosis''?', '["A type of scar","Damage to the blood vessel wall characterized by the deposition of fibrin and protein, making the wall look thick and pink","A clot","None"]', 1, 'This indicates severe inflammatory damage to the vasculature.'),
        (v_case_id, 'What is the ''Most Important'' next step when LCV is found on skin biopsy?', '["Start steroids immediately","Screen for systemic involvement (e.g., UA for hematuria/proteinuria to check for glomerulonephritis)","Apply ice","None"]', 1, 'Skin-limited vasculitis must be distinguished from systemic vasculitis (e.g., GPA or IgA vasculitis).');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Indirect'' Evidence
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Indirect'' Evidence', 'A patient with suspected Pemphigus Vulgaris has blood drawn for ''Indirect Immunofluorescence (IIF)''.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: IIF is positive on ''monkey esophagus'' substrate.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does ''Indirect'' Immunofluorescence differ from ''Direct'' (DIF)?', '["IIF is on the skin","IIF is a blood test (serum) used to detect circulating autoantibodies; DIF is on the patient''s actual skin tissue","There is no difference","None"]', 1, 'IIF measures the systemic burden of the disease.'),
        (v_case_id, 'What is the ''Substrate'' in IIF?', '["The patient''s skin","Laboratory tissue (e.g., monkey esophagus or human salt-split skin) used as a ''target'' for the patient''s serum antibodies","The microscope","None"]', 1, 'Serum antibodies bind to the substrate and are then visualized.'),
        (v_case_id, 'Which IIF ''Titer'' would correlate with disease activity in Pemphigus?', '["The higher the titer (e.g., 1:160), the more active the disease","Titer doesn''t matter","Lower titers are worse","None"]', 0, 'IIF titers often mirror the clinical severity and treatment response in Pemphigus.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Target'' and the ''ELISA''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ELISA''', 'A patient with suspected Bullous Pemphigoid is tested for anti-BP180 and anti-BP230 antibodies using ELISA.

Vitals: Normal.
Physical Examination: Tense bullae.
Laboratory Results: ELISA shows high levels of anti-BP180.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''ELISA'' stand for?', '["Every Lung Is So Airy","Enzyme-Linked Immunosorbent Assay","Easy Laboratory Internal Safety Audit","None"]', 1, 'It is a highly sensitive and quantitative tool for measuring specific antibodies.'),
        (v_case_id, 'Anti-BP180 antibodies specifically target which part of the skin?', '["Desmosomes","Hemidesmosomes (the transmembrane protein NC16A domain)","Melanocytes","None"]', 1, 'BP180 (Type XVII Collagen) is the primary target in Bullous Pemphigoid.'),
        (v_case_id, 'Is ELISA more specific than DIF for diagnosing Bullous Pemphigoid?', '["No, DIF is the gold standard for the ''pattern'', but ELISA confirms the ''specific'' antigen target","Yes, ELISA is the only test needed","No, ELISA is only for HIV","None"]', 0, 'The tests are complementary; DIF shows where the damage is, ELISA shows what is being attacked.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Red'' Face and the ''Demodex''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Face and the ''Demodex''', 'A 45-year-old with papulopustular rosacea has a ''skin surface biopsy'' with cyanoacrylate (Super Glue) to check for mites.

Vitals: Normal.
Physical Examination: Erythema and papules on the cheeks and nose.
Laboratory Results: Microscopy shows >5 Demodex mites per square centimeter.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where do Demodex mites normally live in the skin?', '["Sweat glands","Pilosebaceous units (hair follicles and oil glands)","The stratum corneum","None"]', 1, 'They are part of the normal skin flora but are increased in Rosacea.'),
        (v_case_id, 'Which specific type of Rosacea is most associated with Demodex overgrowth?', '["Erythematotelangiectatic","Papulopustular","Phymatous","None"]', 1, 'Inflammation from the mites (and their bacteria) contributes to the papules and pustules.'),
        (v_case_id, 'What is a highly effective ''Topical'' treatment for Demodex in rosacea?', '["Steroids","Ivermectin 1% cream (Soolantra)","Antifungals","None"]', 1, 'Ivermectin is an anti-parasitic agent that reduces mite counts.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Target'' and the ''PCR'' (Nails)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''PCR'' (Nails)', 'A patient with thick, yellow toenails has a piece of nail sent for PCR testing for onychomycosis.

Vitals: Normal.
Physical Examination: Onycholysis and subungual hyperkeratosis.
Laboratory Results: PCR is positive for Trichophyton rubrum.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary advantage of PCR over fungal culture for nails?', '["It''s cheaper","Much faster (days vs. weeks) and higher sensitivity (detects DNA even if the fungus won''t grow)","It''s a Wood''s lamp test","None"]', 1, 'Cultures often fail to grow in 30-50% of true nail infections.'),
        (v_case_id, 'Which fungus is the ''Most Common'' cause of toenail onychomycosis worldwide?', '["Candida","Trichophyton rubrum","Aspergillus","None"]', 1, 'T. rubrum is the leading dermatophyte for nail disease.'),
        (v_case_id, 'Is PCR able to distinguish between ''Live'' and ''Dead'' fungus?', '["Yes","No, it only detects the presence of DNA, which can persist after the fungus is killed","Only in the sun","None"]', 1, 'This is a limitation of molecular testing compared to culture.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Target'' and the ''Birefringence''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Birefringence''', 'A pathology report for a nodule in a surgical scar describes ''foreign body granulomas with refractile material''.

Vitals: Normal.
Physical Examination: Firm nodule in a 10-year-old scar.
Laboratory Results: Polarized light microscopy shows ''brightly birefringent'' crystals.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Refractile'' or ''Birefringent'' material usually indicate in a biopsy of a scar?', '["Cancer","Foreign material (e.g., suture remnants, silica, talc, or wood) that bends polarized light","Bacteria","None"]', 1, 'Polarized light is the best way to find ''hidden'' foreign bodies in tissue.'),
        (v_case_id, 'Which specific granulomatous disease is NOT birefringent?', '["Sarcoidosis","Suture granuloma","Silica granuloma","Talc granuloma"]', 0, 'Sarcoid is a ''non-caseating'' granuloma of unknown origin, not a reaction to a visible foreign crystal.'),
        (v_case_id, 'What is the term for the giant cells seen in these reactions?', '["Munro microabscesses","Foreign body giant cells (with randomly arranged nuclei)","Langerhans giant cells (with horseshoe-shaped nuclei)","None"]', 1, 'Nuclear arrangement helps distinguish between foreign body and immune (e.g., TB/Sarcoid) reactions.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Target'' and the ''Silver'' Stain (Treponemes)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Silver'' Stain (Treponemes)', 'A patient with a ''copper-colored'' rash on the palms and soles is being tested for Syphilis.

Vitals: Normal.
Physical Examination: Widespread maculopapular rash involving the palms.
Laboratory Results: A biopsy of a papule is stained with ''Warthin-Starry'' silver stain.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Warthin-Starry'' or ''Steiner'' stain highlight in Syphilis?', '["Bacteria","Spirochetes (Treponema pallidum), which look like ''corkscrews''","Fungus","None"]', 1, 'Silver stains are the traditional way to visualize spirochetes in tissue.'),
        (v_case_id, 'What is the more modern and ''Specific'' immunohistochemical (IHC) stain used for Syphilis?', '["PAS","Anti-Treponema pallidum IHC","Gram stain","None"]', 1, 'IHC is much easier to read and has fewer ''false-positive'' silver deposits.'),
        (v_case_id, 'Which non-treponemal blood test is used for initial ''screening'' of syphilis?', '["FTA-ABS","RPR or VDRL","PCR","None"]', 1, 'RPR/VDRL are cheap and sensitive for screening.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Target'' and the ''Immunohistochemistry'' (Melanoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Immunohistochemistry'' (Melanoma)', 'A pathology report for a suspicious lesion on the back mentions ''Positive staining for S100, HMB-45, and Melan-A''.

Vitals: Normal.
Physical Examination: Atypical mole.
Laboratory Results: IHC results received.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of these markers is the ''Most Sensitive'' for melanocytic lesions (but less specific)?', '["HMB-45","S100","Melan-A","None"]', 1, 'S100 is almost always positive in melanoma but can also be positive in nerve and fat cells.'),
        (v_case_id, 'Which marker is the ''Most Specific'' for melanocytic differentiation?', '["S100","Melan-A (MART-1) or HMB-45","PAS","None"]', 1, 'These markers are much more selective for melanin-producing cells.'),
        (v_case_id, 'What is ''SOX10''?', '["A shoe brand","A highly sensitive and specific nuclear marker for melanocytes and nerve sheath tumors","A type of UV light","None"]', 1, 'SOX10 is a modern, ''clean'' marker often used to identify melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Target'' and the ''Cytology'' (BCC)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cytology'' (BCC)', 'A physician performs a ''fine-needle aspiration'' or ''touch prep'' of a pearly nodule.

Vitals: Normal.
Physical Examination: BCC suspected.
Laboratory Results: Cytology shows ''clusters of basaloid cells with little cytoplasm''.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is cytology (needle aspiration) the ''Standard'' way to diagnose BCC?', '["Yes","No, a punch or shave biopsy (histology) is the standard, but cytology can be used in specialized settings","Only in the elderly","None"]', 1, 'Histology provides architectural context (palisading, clefting) that cytology lacks.'),
        (v_case_id, 'What is ''Touch Imprint'' cytology?', '["Pressing a slide against a freshly cut biopsy","A type of massage","A blood test","None"]', 0, 'It allows for rapid assessment of cells, sometimes used during Mohs surgery.'),
        (v_case_id, 'Can cytology distinguish between the ''Subtypes'' of BCC (e.g., nodular vs. morpheaform)?', '["Yes","No, architecture is needed for subtyping","Only with special stains","None"]', 1, 'The ''growth pattern'' is a histologic feature.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Target'' and the ''Cultures'' (Mycobacteria)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cultures'' (Mycobacteria)', 'A patient with a non-healing nodule on his hand after cleaning a fish tank.

Vitals: Normal.
Physical Examination: Linear nodules (sporotrichoid spread) on the arm.
Laboratory Results: A tissue culture is requested at ''30 degrees Celsius''.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the culture temperature (30 C) important for M. marinum?', '["It''s the standard temperature","M. marinum is a ''cold-loving'' organism that grows best in the extremities (lower than body temp)","It grows faster at 30 C","None"]', 1, 'Standard 37 C (body temp) cultures may be negative for this organism.'),
        (v_case_id, 'What is the common name for this infection?', '["Fish tank granuloma","Cat scratch disease","Shingles","None"]', 0, 'Exposure to non-chlorinated water (tanks, pools) is a key history point.'),
        (v_case_id, 'Which specific stain is used to find Mycobacteria in tissue?', '["Gram stain","Acid-Fast Bacillus (AFB) stain, such as Ziehl-Neelsen or Fite","PAS","None"]', 1, 'AFB stains highlight the waxy cell walls of mycobacteria.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Target'' and the ''Dermoscopy'' (Vascular)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Vascular)', 'A physician is looking at a small, bright red papule on a patient''''s abdomen.

Vitals: Normal.
Physical Examination: 2-mm bright red papule.
Laboratory Results: Dermoscopy shows ''red lacunae'' (well-demarcated red lakes).', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''red lacunae'' is diagnostic for which benign vascular lesion?', '["BCC","Cherry Angioma","Pyogenic Granuloma","Melanoma"]', 1, 'These lakes represent dilated vascular spaces.'),
        (v_case_id, 'How does the dermoscopy of a ''Pyogenic Granuloma'' differ?', '["It''s the same","It shows a ''white collarette'' and ''reddish-pink homogeneous areas'' but lacks the well-defined lacunae of a cherry angioma","It''s blue","None"]', 1, 'The white collarette is a classic clinical and dermoscopic clue for PG.'),
        (v_case_id, 'Are cherry angiomas dangerous?', '["Yes","No, they are benign proliferations of capillaries that increase with age","Only if they bleed","None"]', 1, 'They are extremely common and require no treatment.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Target'' and the ''Imaging'' (CT Scan)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (CT Scan)', 'A patient with a large, indurated mass on the neck is having a CT scan with contrast.

Vitals: Normal.
Physical Examination: Fixed, firm 4-cm mass.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary goal of CT imaging in a suspected head and neck cancer?', '["To see the skin","To assess the ''depth'' of invasion, involvement of underlying bone/nerves, and to look for lymphadenopathy","To check the lungs only","None"]', 1, 'Imaging is essential for TNM staging.'),
        (v_case_id, 'What is ''Contrast'' used for in this setting?', '["To make the patient feel warm","To highlight vascularity and differentiate between a cystic mass and a solid, necrotic tumor","To clean the blood","None"]', 1, 'Iodinated contrast improves the visualization of tumor margins.'),
        (v_case_id, 'Which specific ''lymph node'' feature on CT is highly suggestive of malignancy?', '["Small size","Central necrosis (a dark hole in the middle of the node)","Round shape","None"]', 1, 'Necrotic nodes are almost always malignant.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Target'' and the ''Biopsy'' (Scalp)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Scalp)', 'A patient with scarring hair loss (alopecia) needs a biopsy.

Vitals: Normal.
Physical Examination: Areas of the scalp with no hair follicles and smooth, shiny skin.
Laboratory Results: A ''4-mm punch biopsy'' is taken.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best'' location to biopsy for scarring alopecia?', '["The center of the bald patch","The active, expanding border where hair is still present but looks abnormal","The back of the neck","None"]', 1, 'The center of a scar is just ''fibrosis'' and lacks diagnostic features.'),
        (v_case_id, 'Which specialized histologic processing is often required for scalp biopsies?', '["Vertical sectioning only","Horizontal (transverse) sectioning to allow for the counting of follicles and assessment of hair cycle","None","Freezing only"]', 1, 'Horizontal sections allow for the best assessment of hair density and anatomy.'),
        (v_case_id, 'A biopsy showing ''perifollicular fibrosis'' and ''loss of sebaceous glands'' is characteristic of:', '["Alopecia Areata","Scarring (Cicatricial) Alopecia","Male pattern baldness","None"]', 1, 'Loss of the ''oil gland'' is a very early sign of permanent scarring alopecia.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Target'' and the ''Stain'' (Melanin)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Melanin)', 'A pathologist is trying to find ''melanin'' in a poorly differentiated tumor.

Vitals: Normal.
Physical Examination: Large black/grey tumor.
Laboratory Results: A ''Fontana-Masson'' stain is performed.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the Fontana-Masson stain highlight?', '["Fungus","Melanin (it turns it black)","Iron","Fat"]', 1, 'This is a specialized silver stain for melanin.'),
        (v_case_id, 'How can you distinguish Melanin from ''Iron'' (hemosiderin) on histology?', '["They look the same","Use a ''Perls Prussian Blue'' stain; iron turns blue, while melanin does not","Melanin is always blue","None"]', 1, 'Iron stains help distinguish bruising/stasis from true pigment.'),
        (v_case_id, 'What is ''Solar Elastosis''?', '["A type of cancer","The accumulation of fragmented, bluish-gray elastic fibers in the dermis due to chronic sun damage","Skin thinning","None"]', 1, 'This is an ubiquitous finding in biopsies from older, sun-exposed skin.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Target'' and the ''Molecular'' (B-RAF)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Molecular'' (B-RAF)', 'A patient with metastatic melanoma is having his tumor tested for ''B-RAF mutations''.

Vitals: Normal.
Physical Examination: Multiple cutaneous and visceral metastases.
Laboratory Results: Tumor is positive for the V600E mutation.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of finding a B-RAF V600E mutation?', '["It''s a bad sign only","It allows for the use of targeted therapy with B-RAF inhibitors (e.g., Vemurafenib) and MEK inhibitors","It means the patient is cured","None"]', 1, 'Targeted therapy is only effective in patients with the specific mutation.'),
        (v_case_id, 'What percentage of cutaneous melanomas carry a B-RAF mutation?', '["1%","40-50%","90%","None"]', 1, 'It is a very common driver mutation in melanoma.'),
        (v_case_id, 'Does finding a B-RAF mutation change the initial ''Surgical'' margin for the primary tumor?', '["Yes","No, surgical margins are based on Breslow depth and stage, not molecular status","Only in children","None"]', 1, 'Molecular status guides systemic therapy, not local excision.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Target'' and the ''Dermoscopy'' (Acral)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Acral)', 'A physician is looking at a pigmented spot on a patient''''s ''sole'' (foot).

Vitals: Normal.
Physical Examination: 8-mm brown macule on the arch of the foot.
Laboratory Results: Dermoscopy shows a ''parallel ridge pattern''.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''Parallel Ridge'' pattern (pigment on the ridges of the skin) is highly suggestive of:', '["Benign acral nevus","Acral Lentiginous Melanoma","A wart","None"]', 1, 'Ridges are for ''Bad'' (Melanoma); Furrows are for ''Fine'' (Benign).'),
        (v_case_id, 'What is the ''Parallel Furrow'' pattern?', '["Melanoma","A common benign pattern in acral nevi (moles) where pigment is concentrated in the grooves of the skin","A scar","None"]', 1, 'This is a classic ''Step'' differentiator for foot lesions.'),
        (v_case_id, 'Is ''Hutchinson Sign'' relevant here?', '["No","Yes, pigment on the proximal nail fold is a key clue for subungual melanoma","Only in the eyes","None"]', 1, 'Nail and acral lesions are often grouped in clinical reasoning.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Target'' and the ''Stain'' (Mast Cells)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Mast Cells)', 'A child with ''Urticaria Pigmentosa'' has a biopsy. The doctor rubs the skin before the biopsy (Darier sign) and it hives.

Vitals: Normal.
Physical Examination: Widespread brown macules.
Laboratory Results: A ''Tryptase'' stain or ''Leder'' stain is performed.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which stain is commonly used to highlight mast cells in tissue?', '["PAS","Tryptase, Giemsa, or Toluidine Blue","Gram stain","None"]', 1, 'Tryptase is a highly specific marker for mast cell granules.'),
        (v_case_id, 'What is the ''Darier Sign''?', '["A fever","Urtication (hiving) and redness after stroking a lesion, due to mast cell degranulation","Hair loss","None"]', 1, 'This is the classic clinical test for cutaneous mastocytosis.'),
        (v_case_id, 'What systemic lab test should be ordered if systemic mastocytosis is suspected?', '["Blood sugar","Serum Tryptase level","Potassium","None"]', 1, 'Elevated baseline tryptase (>20 ng/mL) is a diagnostic criterion for systemic disease.');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Target'' and the ''Imaging'' (PET Scan)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (PET Scan)', 'A patient with Stage III melanoma is being monitored for recurrence with periodic PET-CT scans.

Vitals: Normal.
Physical Examination: No clinical recurrence.
Laboratory Results: Scan shows a ''hypermetabolic node'' in the groin.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does a PET (Positron Emission Tomography) scan detect?', '["Blood flow","Increased glucose metabolism (using FDG) in rapidly dividing cells (like cancer)","Bone density","None"]', 1, 'Cancer cells ''eat'' more sugar than normal cells.'),
        (v_case_id, 'Is PET-CT recommended for the ''Initial Staging'' of thin (Stage I) melanomas?', '["Yes, to be safe","No, the risk of metastasis is too low and the rate of false positives is too high","Only in the elderly","None"]', 1, 'Imaging is generally reserved for Stage III and higher.'),
        (v_case_id, 'What can cause a ''False-Positive'' PET scan (besides cancer)?', '["Drinking too much water","Inflammation, recent surgery, or infection (which are also metabolically active)","None","Being too cold"]', 1, 'Clinical correlation is always required with imaging.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Target'' and the ''Biopsy'' (Mouth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Mouth)', 'A patient has a white, lacy patch on his inner cheek (buccal mucosa).

Vitals: Normal.
Physical Examination: Lacy white lines (Wickham striae) on the mucosa.
Laboratory Results: A ''punch'' biopsy is taken.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Most Likely'' diagnosis for lacy white oral lesions?', '["Oral thrush","Oral Lichen Planus","Leukoplakia","Cancer"]', 1, 'The lacy pattern (Wickham striae) is classic for LP.'),
        (v_case_id, 'If the patch were ''thick, white, and could NOT be scraped off'', what would be the concern?', '["Thrush","Leukoplakia (a premalignant lesion requiring biopsy to rule out dysplasia)","None","Food residue"]', 1, 'Leukoplakia is a clinical term for a white patch that doesn''t fit other diagnoses.'),
        (v_case_id, 'How do you distinguish Oral Thrush from Lichen Planus clinically?', '["Thrush can be scraped off, leaving a red/bleeding base; LP cannot be scraped off","LP is redder","Thrush is on the teeth","None"]', 0, 'The ''scraping'' test is a high-yield clinical differentiator.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Target'' and the ''Stain'' (Lipids)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Lipids)', 'A pathology report for a yellowish eyelid growth mentions ''Foamy macrophages positive for oil red O stain''.

Vitals: Normal.
Physical Examination: Yellowish plaques on the eyelids (Xanthelasma).
Laboratory Results: Biopsy results received.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Oil Red O'' stain highlight?', '["Bacteria","Lipids (fats)","Iron","Melanin"]', 1, 'Xanthomas are composed of lipid-laden macrophages.'),
        (v_case_id, 'What is the ''Most Important'' lab test to order for a patient with xanthelasma?', '["Blood sugar","Fast Lipid Panel (to check for dyslipidemia)","Renal panel","None"]', 1, 'Xanthomas are often external markers of internal lipid disorders.'),
        (v_case_id, 'What are ''Foamy Macrophages''?', '["Infected cells","Cells that have eaten so much lipid that their cytoplasm looks bubbly or ''foamy'' on H&E","Dying cells","None"]', 1, 'This is a classic histologic description.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Target'' and the ''Culture'' (Deep Tissue)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Culture'' (Deep Tissue)', 'A patient with a chronic, non-healing ulcer on the foot. The physician takes a ''Deep Tissue Culture''.

Vitals: Normal.
Physical Examination: Ulcer.
Laboratory Results: Culture grows 10^5 colony-forming units (CFU) of mixed organisms.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of the ''10^5'' threshold in wound cultures?', '["No significance","It is the standard threshold for ''Infection'' (as opposed to colonization) that impairs healing","It means the patient is healthy","None"]', 1, 'High bacterial loads prevent the wound from moving into the proliferative phase.'),
        (v_case_id, 'Why is ''Curettage'' or ''Biopsy'' culture better than a ''Swab''?', '["It''s faster","It bypasses surface contaminants and finds the organisms actually present in the deep tissue","It''s less painful","None"]', 1, 'Surface swabs are notoriously unreliable for chronic wounds.'),
        (v_case_id, 'Does every ''Positive'' culture require systemic antibiotics?', '["Yes","No, if the wound is healing well and there are no clinical signs of infection, it may just be ''colonized''","Only in the elderly","None"]', 1, 'Treat the patient, not the lab report.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Target'' and the ''Dermoscopy'' (Scabies)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Scabies)', 'A dermatologist uses a dermatoscope to look at a burrow on a patient''s hand.

Vitals: Normal.
Physical Examination: Itchy burrows.
Laboratory Results: Dermoscopy shows a ''Jet with a contrail'' or ''Delta-wing'' sign.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Delta-wing'' or ''Jet'' sign represent on dermoscopy?', '["A piece of lint","The triangular head and front legs of the scabies mite at the end of a burrow","A hair","None"]', 1, 'This is a highly specific sign that allows for bedside diagnosis without scraping.'),
        (v_case_id, 'Is dermoscopy more sensitive than a skin scraping for scabies?', '["No","Yes, it allows for the screening of many sites quickly to find the best place to scrape or to make a direct diagnosis","Only in children","None"]', 1, 'It is a powerful triage tool.'),
        (v_case_id, 'What is the ''Contrail''?', '["A cloud","The burrow itself, filled with eggs and feces (scybala)","The mite''s tail","None"]', 1, 'The burrow follows the mite, much like a jet''s trail.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Target'' and the ''Biopsy'' (Nail)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Nail)', 'A surgeon is performing a ''Nail Matrix'' biopsy for a dark band.

Vitals: Normal.
Physical Examination: Longitudinal melanonychia.
Laboratory Results: A 3-mm punch is taken from the proximal matrix.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where must the biopsy be taken to determine the cause of a longitudinal nail band?', '["The distal nail tip","The nail matrix (where the nail plate is produced)","The skin of the finger","None"]', 1, 'The pigment is produced in the matrix and grows into the plate.'),
        (v_case_id, 'What is the risk of a matrix biopsy?', '["Infection only","Permanent nail dystrophy (scarring or splitting of the nail)","Loss of the finger","None"]', 1, 'The patient must be counseled about permanent nail changes.'),
        (v_case_id, 'Which part of the matrix produces the ''top'' of the nail plate?', '["Distal matrix","Proximal matrix","Nail bed","None"]', 1, 'Biopsying the proximal matrix is more likely to cause a visible defect.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Target'' and the ''Imaging'' (Chest X-ray)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Chest X-ray)', 'A 40-year-old with EN (Erythema Nodosum) is having a Chest X-ray.

Vitals: Normal.
Physical Examination: Painful red nodules on the shins.
Laboratory Results: CXR shows ''bilateral hilar lymphadenopathy''.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a Chest X-ray part of the standard workup for Erythema Nodosum?', '["To check for heart disease","To screen for Sarcoidosis (Lofgren syndrome) or Tuberculosis as a cause of the EN","To see the skin","None"]', 1, 'EN is a reactive process; finding the trigger is the goal.'),
        (v_case_id, 'What is ''Lofgren Syndrome''?', '["A type of cancer","The triad of Erythema Nodosum, Bilateral Hilar Lymphadenopathy, and Migratory Polyarthralgia","A skin infection","None"]', 1, 'It is a highly specific, acute presentation of sarcoidosis with a good prognosis.'),
        (v_case_id, 'Does EN itself need a biopsy if it is clinically classic?', '["Yes, always","No, it is a clinical diagnosis; the workup should focus on the underlying trigger (CXR, ASO titer, etc.)","Only in the elderly","None"]', 1, 'The cause is more important than the skin histology in classic EN.');

    ---------------------------------------------------------------------------
    -- CASE 51: The ''Flame'' Figure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Flame'' Figure', 'A pathology report for an itchy, blistering rash describes ''dermal edema and flame figures (major basic protein surrounding collagen bundles)''.

Vitals: Normal.
Physical Examination: Erythematous plaques with peripheral ''pseudopodia''.
Laboratory Results: Peripheral eosinophilia is noted in the CBC.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Flame Figure'' characteristic of?', '["Infection","Eosinophilic Dermatitis (e.g., Wells Syndrome)","Psoriasis","None"]', 1, 'Flame figures are formed by degranulated eosinophils.'),
        (v_case_id, 'Which other common condition can occasionally show flame figures?', '["Acne","Arthropod (insect) bites","Warts","None"]', 1, 'Any process with intense eosinophilic infiltrate can produce them.'),
        (v_case_id, 'What is the primary treatment for Wells Syndrome?', '["Antibiotics","Systemic corticosteroids","Antifungals","None"]', 1, 'It is an inflammatory, non-infectious condition.');

    ---------------------------------------------------------------------------
    -- CASE 52: The ''Caterpillar'' Body
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Caterpillar'' Body', 'A pathology report for a subepidermal blister on the hand mentions ''festooning of the dermal papillae'' and ''caterpillar bodies''.

Vitals: Normal.
Physical Examination: Fragile skin and blisters on sun-exposed hands.
Laboratory Results: Biopsy results received.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are ''Caterpillar Bodies''?', '["Small worms","Linear basement membrane and collagen fragments within the epidermis of a PCT blister","A sign of infection","None"]', 1, 'They are a classic histologic finding in PCT.'),
        (v_case_id, 'What does ''Festooning'' describe in a subepidermal blister?', '["It looks like a party","The preservation of the dermal papillae architecture at the base of the blister","Skin thinning","None"]', 1, 'In PCT, the dermal papillae protrude upward into the blister cavity like ''festoons''.'),
        (v_case_id, 'Why are there no ''neutrophils'' in a PCT blister?', '["They are shy","PCT is a metabolic/phototoxic process, not primarily an inflammatory one","Fungus kills them","None"]', 1, 'The ''cell-poor'' nature of the blister helps distinguish it from Bullous Pemphigoid.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Target'' and the ''ENA'' Panel
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ENA'' Panel', 'A 30-year-old woman with a malar rash and joint pain has a positive ANA (1:1280, speckled). An ''ENA'' (Extractable Nuclear Antigen) panel is ordered.

Vitals: Normal.
Physical Examination: Butterfly rash.
Laboratory Results: ENA is positive for ''Anti-dsDNA'' and ''Anti-Smith''.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of these antibodies is ''Most Specific'' for the diagnosis of SLE?', '["Anti-Ro","Anti-Smith and Anti-dsDNA","Anti-La","None"]', 1, 'While ANA is sensitive, Anti-Smith and Anti-dsDNA are highly specific.'),
        (v_case_id, 'Which antibody correlates with the presence of ''Lupus Nephritis'' and disease activity?', '["Anti-Smith","Anti-dsDNA","Anti-Ro","None"]', 1, 'Anti-dsDNA levels often rise during a lupus flare involving the kidneys.'),
        (v_case_id, 'Anti-Ro (SS-A) and Anti-La (SS-B) are most strongly associated with which other condition?', '["Gout","Sjögren Syndrome","Acne","None"]', 1, 'These are classic markers for Sjögren''s.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Target'' and the ''Jo-1''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Jo-1''', 'A patient with a purple rash on the eyelids (heliotrope rash) and ''mechanic''''s hands'' (rough, cracked skin on the fingers) has a blood test.

Vitals: Normal.
Physical Examination: Gottron papules on the knuckles.
Laboratory Results: Elevated Creatine Kinase (CK) and positive ''Anti-Jo-1'' antibody.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The Anti-Jo-1 antibody is associated with which systemic complication in dermatomyositis?', '["Liver failure","Interstitial Lung Disease (Antisynthetase Syndrome)","Brain tumor","None"]', 1, 'Anti-Jo-1 is a marker for lung involvement and a more severe course.'),
        (v_case_id, 'Which other antibody is highly specific for Dermatomyositis specifically (as opposed to polymyositis)?', '["Anti-dsDNA","Anti-Mi-2","Anti-Smith","None"]', 1, 'Anti-Mi-2 is strongly associated with the classic skin findings of DM.'),
        (v_case_id, 'What is the ''Screening'' priority in a newly diagnosed adult with dermatomyositis?', '["Eye exam","Age-appropriate malignancy screening (due to high paraneoplastic risk)","Bone density","None"]', 1, 'Adult-onset DM is frequently associated with an internal malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Target'' and the ''Centromere''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Centromere''', 'A 50-year-old woman with Raynaud phenomenon and tight skin on her fingers has a blood test.

Vitals: Normal.
Physical Examination: Telangiectasias on the face and Sclerodactyly.
Laboratory Results: Positive ''Anti-Centromere'' antibody.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Anti-Centromere antibody is the hallmark of which variant of Systemic Sclerosis?', '["Diffuse Scleroderma","Limited Scleroderma (CREST Syndrome)","Lupus","None"]', 1, 'CREST stands for Calcinosis, Raynaud, Esophageal dysmotility, Sclerodactyly, and Telangiectasias.'),
        (v_case_id, 'Which antibody is characteristic of ''Diffuse'' Systemic Sclerosis?', '["Anti-Centromere","Anti-Scl-70 (Anti-topoisomerase I)","Anti-Jo-1","None"]', 1, 'Anti-Scl-70 is associated with the more aggressive, diffuse form of the disease.'),
        (v_case_id, 'What is the major ''Renal'' complication of Scleroderma?', '["Kidney stones","Scleroderma Renal Crisis (abrupt onset of malignant hypertension and renal failure)","Glomerulonephritis","None"]', 1, 'This is a life-threatening emergency treated with ACE inhibitors.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Target'' and the ''Histone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Histone''', 'A patient on Hydralazine for high blood pressure develops a malar rash and joint pain. A blood test is performed.

Vitals: Normal.
Physical Examination: Rash.
Laboratory Results: Positive ANA and positive ''Anti-Histone'' antibody. Negative anti-dsDNA.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of Anti-Histone antibodies (in the absence of Anti-dsDNA) is highly suggestive of:', '["Systemic Lupus (SLE)","Drug-induced Lupus Erythematosus (DILE)","Scleroderma","None"]', 1, 'This is the classic board differentiator for drug-induced lupus.'),
        (v_case_id, 'Which of the following drugs is NOT a classic cause of DILE?', '["Hydralazine","Procainamide","Isoniazid","Penicillin"]', 3, 'Penicillin is not a recognized cause; Minocycline and Anti-TNF agents are newer causes.'),
        (v_case_id, 'What is the best treatment for DILE?', '["More Hydralazine","Discontinue the offending drug","Lifelong steroids","None"]', 1, 'Symptoms and lab abnormalities usually resolve after the drug is stopped.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Target'' and the ''Cryptococcus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cryptococcus''', 'An HIV patient with a low CD4 count presents with ''umbilicated'' papules on his face that look like Molluscum, but he is also febrile and confused.

Vitals: T 38.8 C.
Physical Examination: Widespread pearly, umbilicated papules.
Laboratory Results: A skin biopsy is performed and stained with ''India Ink'' and ''Mucicarmine''.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Mucicarmine'' stain highlight in Cryptococcus?', '["DNA","The thick polysaccharide capsule (turns it red/pink)","The nucleus","None"]', 1, 'The capsule is the hallmark of Cryptococcus neoformans.'),
        (v_case_id, 'The ''India Ink'' preparation of CSF (or tissue) highlights what?', '["The organism itself","The ''halo'' created by the thick capsule that excludes the ink particles","Nothing","None"]', 1, 'The clear halo is diagnostic.'),
        (v_case_id, 'In an immunosuppressed patient, umbilicated facial papules should ALWAYS prompt an evaluation for what?', '["Acne","Disseminated deep fungal infection (e.g., Cryptococcosis, Histoplasmosis)","Normal Molluscum","None"]', 1, 'Molluscum-like lesions can be a ''skin sign'' of a life-threatening systemic infection.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Target'' and the ''Prion''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Prion''', 'This is a theoretical question on high-yield infection control.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which ''Surgical'' decontamination method is REQUIRED for instruments used on a patient with suspected Prion disease (e.g., CJD)?', '["Standard autoclaving","Extended autoclaving and/or concentrated Sodium Hydroxide (Bleach) exposure","Hand washing","None"]', 1, 'Prions are highly resistant to standard sterilization methods.'),
        (v_case_id, 'Is the skin considered a ''high-risk'' tissue for prion transmission?', '["Yes","No, CNS and lymphoid tissues are high-risk; skin is considered low-risk, but precautions are still taken during biopsies","Only in the elderly","None"]', 1, 'The brain and spinal cord are the most infectious tissues.'),
        (v_case_id, 'What is the pathognomonic feature of Prion disease in a brain biopsy?', '["Inflammation","Spongiform change (vacuolation of the neuropil)","Bacteria","None"]', 1, 'This ''sponge-like'' appearance is diagnostic.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Target'' and the ''Grenz'' Zone
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Grenz'' Zone', 'A pathology report mentions a ''Grenz zone'' in a biopsy of a reddish-brown plaque on the nose.

Vitals: Normal.
Physical Examination: Firm, red plaque on the nasal bridge (Granuloma Faciale).
Laboratory Results: Biopsy shows a dense dermal infiltrate.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Grenz Zone''?', '["A type of cancer","A narrow band of UNINVOLVED (normal) dermis separating the epidermis from an underlying dermal infiltrate","A scar","None"]', 1, 'The ''clear'' space is characteristic of conditions like Granuloma Faciale or Leprosy.'),
        (v_case_id, 'Besides Granuloma Faciale, which classic ''Step'' infection shows a prominent Grenz zone?', '["Staphylococcal infection","Lepromatous Leprosy","Acne","None"]', 1, 'In lepromatous leprosy, the Grenz zone separates the ''foamy'' macrophage infiltrate from the epidermis.'),
        (v_case_id, 'Granuloma Faciale is primarily composed of which cell type?', '["Lymphocytes only","A ''mixed'' infiltrate including many eosinophils and neutrophils","Fungus","None"]', 1, 'The mixed nature of the infiltrate is a key histologic clue.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Target'' and the ''Wood'' (Erythrasma Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wood'' (Erythrasma Review)', 'A quick review of Wood''''s lamp basics.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which Wood''s lamp color matches Pseudomonas infection in a wound?', '["Coral-red","Bright green (due to Pyoverdin)","Yellow","None"]', 1, 'Pseudomonas produces fluorescent pigments.'),
        (v_case_id, 'Which Wood''s lamp color matches Porphyria Cutanea Tarda (Urine)?', '["Pink/Coral-red","Green","Blue","None"]', 0, 'Porphyrins glow red/pink.'),
        (v_case_id, 'Which Wood''s lamp color matches Vitiligo?', '["Green","Bright blue-white (enhancement, not true fluorescence)","Orange","None"]', 1, 'Total loss of melanin allows UV light to penetrate to the collagen.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Biopsy'' (Vesicle)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Vesicle)', 'A patient has a suspected dermatitis herpetiformis (DH).

Vitals: Normal.
Physical Examination: Small, extremely itchy vesicles on the elbows.
Laboratory Results: A biopsy is taken for DIF.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic DIF pattern for Dermatitis Herpetiformis?', '["Linear IgG","Granular IgA deposits at the tips of the dermal papillae","Net-like IgG","None"]', 1, 'IgA deposition is the diagnostic gold standard for DH.'),
        (v_case_id, 'Dermatitis Herpetiformis is the cutaneous manifestation of which systemic disease?', '["Diabetes","Celiac Disease (Gluten-sensitive enteropathy)","Asthma","None"]', 1, 'Almost all DH patients have some degree of gluten sensitivity.'),
        (v_case_id, 'Where is the ''Best'' place to biopsy for DH?', '["Directly from a vesicle","Perilesional (normal-appearing) skin","The center of a scar","None"]', 1, 'Inflammation within the vesicle destroys the IgA; perilesional skin preserves it.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Target'' and the ''Imaging'' (CT in SJS)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (CT in SJS)', 'A patient with Stevens-Johnson Syndrome (SJS) is being evaluated in the ER.

Vitals: T 39.0 C, BP 100/60.
Physical Examination: Skin sloughing and oral erosions.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a Chest X-ray or CT often performed in SJS/TEN patients?', '["To see the skin","To screen for ''Inhalation'' injury (sloughing of the bronchial epithelium) or pneumonia","To check for broken bones","None"]', 1, 'The ''skin'' sloughing in TEN can involve the entire respiratory tract.'),
        (v_case_id, 'What is the most common cause of death in SJS/TEN?', '["Heart attack","Sepsis (due to loss of the skin barrier)","The drug reaction itself","None"]', 1, 'Infection is the leading killer.'),
        (v_case_id, 'Is ''Nikolsky sign'' positive in SJS?', '["No","Yes, the epidermis is necrolytic and slides easily away from the dermis","Only in the eyes","None"]', 1, 'Nikolsky is a hallmark of epidermal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Target'' and the ''Scabies'' (Norwegian)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Scabies'' (Norwegian)', 'An elderly patient with dementia in a nursing home has ''thick, crusty'' scale on his hands and feet. He doesn''''t itch much.

Vitals: Normal.
Physical Examination: Massive, gray-yellow hyperkeratotic crusting.
Laboratory Results: A single skin scraping shows ''hundreds'' of mites.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does the patient NOT itch much despite the massive mite load?', '["He is old","Immunocompromised or debilitated patients may lack the vigorous hypersensitivity response that causes itching","The mites are dead","None"]', 1, 'The lack of itch is common in crusted scabies.'),
        (v_case_id, 'How many mites are typically present in a ''normal'' case of scabies?', '["Thousands","10-15 total","1 million","None"]', 1, 'Normal scabies has very few mites; crusted scabies has millions.'),
        (v_case_id, 'What is the management of choice for crusted scabies?', '["Topical Permethrin only","Combination of oral Ivermectin AND topical Permethrin/Sulfur","Antibiotics","None"]', 1, 'Systemic therapy is mandatory for the high burden of mites.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Target'' and the ''Biopsy'' (Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Depth)', 'A patient with a suspected deep fungal infection is having a biopsy.

Vitals: Normal.
Physical Examination: Nodule on the leg.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific histologic ''fixative'' is used for standard H&E processing?', '["Michel''s medium","10% Buffered Formalin","Water","None"]', 1, 'Formalin preserves architecture but kills organisms/proteins.'),
        (v_case_id, 'Why is ''splitting'' the biopsy into Formalin and Saline essential for a suspected infection?', '["To be safe","Formalin allows for architecture and specialized stains (PAS/GMS); Saline allows for live tissue culture","No reason","None"]', 1, 'This is a key procedural point for medical exams.'),
        (v_case_id, 'If the PAS/GMS stains are negative, but the culture is positive, which is correct?', '["Pathology","Culture (it is more sensitive for low numbers of organisms)","Both are wrong","None"]', 1, 'Culture can detect a single viable organism; stains require many.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Target'' and the ''ANA'' (Pattern)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ANA'' (Pattern)', 'A patient has a positive ANA with a ''Nucleolar'' pattern.

Vitals: Normal.
Physical Examination: Thick skin on the hands.
Laboratory Results: ANA 1:640, Nucleolar.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''Nucleolar'' ANA pattern is most characteristic of which disease?', '["Lupus","Systemic Sclerosis (Scleroderma)","RA","None"]', 1, 'Specific patterns (homogeneous, speckled, nucleolar, centromere) point toward specific diseases.'),
        (v_case_id, 'Which pattern is classic for Drug-induced Lupus?', '["Nucleolar","Homogeneous (associated with anti-histone antibodies)","Centromere","None"]', 1, 'Homogeneous patterns are common in DILE and SLE.'),
        (v_case_id, 'What does the ''Speckled'' pattern indicate?', '["Lupus","Non-specific (seen in SLE, Sjögren''s, MCTD)","Normal","None"]', 1, 'Speckled is the most common and least specific pattern.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Target'' and the ''Porphyrin'' (Screen)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Porphyrin'' (Screen)', 'A quick review of Porphyria screening.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Test'' to screen for Porphyria Cutanea Tarda (PCT)?', '["Total plasma porphyrins or 24-hour urine porphyrins","Liver biopsy","Blood sugar","None"]', 0, 'Plasma/Urine porphyrins will be markedly elevated.'),
        (v_case_id, 'What is the best initial screening test for ''Acute Intermittent Porphyria'' (AIP)?', '["Skin biopsy","Urine Porphobilinogen (PBG) during an attack","Blood pressure","None"]', 1, 'AIP is a neurovisceral porphyria; PBG is the marker.'),
        (v_case_id, 'Which ''Metal'' can worsen porphyria and should be avoided?', '["Zinc","Iron (Overload is common in PCT)","Magnesium","None"]', 1, 'Phlebotomy works by depleting iron stores.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Target'' and the ''Dermoscopy'' (Lice)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Lice)', 'A school nurse uses a dermatoscope to look at a child''''s scalp.

Vitals: Normal.
Physical Examination: Itching scalp.
Laboratory Results: Dermoscopy shows ''oval structures glued to the hair shaft''.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best way to distinguish between a ''Nit'' and ''Dandruff'' under a dermatoscope?', '["Color","Nits are firmly attached to the hair shaft; dandruff (scale) is loose and can be easily moved","Nits are larger","None"]', 1, 'Attachment is the key differentiator.'),
        (v_case_id, 'What does a ''live'' nit look like compared to an empty one?', '["Live nits are dark and contain a developing nymph; empty ones are white/translucent","No difference","Empty ones are bigger","None"]', 0, 'The presence of a nymph indicates an active infection.'),
        (v_case_id, 'Where should you look for ''Lice'' eggs on the head?', '["On the face","Close to the scalp (within 1cm), especially behind the ears and at the nape of the neck","The top of the head","None"]', 1, 'Heat from the scalp is needed for incubation.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Target'' and the ''Biopsy'' (Melanoma Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Melanoma Depth)', 'A final question on melanoma staging.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which staging system is currently used to determine T-stage in melanoma?', '["Clark Level (Anatomical level of invasion)","Breslow Thickness (Absolute depth in millimeters)","The mole''s weight","None"]', 1, 'Breslow thickness is the standard for the AJCC staging system.'),
        (v_case_id, 'Breslow thickness is measured from which layer to the deepest tumor cell?', '["Stratum corneum","Granular layer (or ulcer base)","Dermis","None"]', 1, 'The granular layer is the starting point for measurement.'),
        (v_case_id, 'Is ''Ulceration'' considered in the T-staging?', '["No","Yes, the presence of ulceration automatically increases the ''b'' category (e.g., T1a vs T1b)","Only in the elderly","None"]', 1, 'Ulceration is an independent high-risk prognostic feature.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Target'' and the ''Imaging'' (Dermal Ultrasound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Dermal Ultrasound)', 'A patient with a suspected BCC is having ''High-frequency Ultrasound'' (HFUS) in the clinic.

Vitals: Normal.
Physical Examination: BCC.
Laboratory Results: HFUS shows a ''hypoechoic area'' with specific dimensions.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary clinical use of HFUS in skin cancer management?', '["To cure the cancer","To estimate the ''depth'' and ''lateral margins'' of the tumor before surgery","To see the bone","None"]', 1, 'It is a helpful ''pre-surgical'' mapping tool.'),
        (v_case_id, 'Is HFUS a replacement for a biopsy?', '["Yes","No, it cannot provide the histologic diagnosis needed for treatment","Only for children","None"]', 1, 'Pathology remains the only definitive way to diagnose BCC.'),
        (v_case_id, 'Which specific ''layer'' of the skin does HFUS visualize best?', '["The bone","The dermis and dermo-epidermal junction","The brain","None"]', 1, 'High frequency (20-50 MHz) allows for high-resolution imaging of superficial structures.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Scraping'' (Final Tips)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Scraping'' (Final Tips)', 'A final review of lab procedures.

Vitals: Normal.
Physical Examination: Patient is ready.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which ''Prep'' is used to identify the ''Yeast'' form of Candida?', '["Wood''s lamp","KOH prep (showing pseudohyphae and budding yeast)","Gram stain","None"]', 1, 'KOH is the rapid test for all fungi.'),
        (v_case_id, 'Which procedure is used to identify the ''Mite'' in Scabies?', '["Wood''s lamp","Skin scraping with mineral oil","Tzanck smear","None"]', 1, 'Mineral oil prevents the mites from crawling away.'),
        (v_case_id, 'Which procedure is used to identify the ''Cells'' in a suspected bullous disease?', '["Tzanck smear","Biopsy for Histology (H&E)","None","Both 1 and 2"]', 3, 'H&E provides architecture; Tzanck is for rapid bedside cell assessment (especially for virus).');

    ---------------------------------------------------------------------------
    -- CASE 71: The Tzanck Smear (Pemphigus)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tzanck Smear (Pemphigus)', 'A Tzanck smear is performed on a patient with flaccid blisters.

Vitals: Normal.
Physical Examination: Mouth ulcers and skin erosions.
Laboratory Results: Tzanck smear shows ''acantholytic cells'' (rounded keratinocytes with large nuclei) but NO multinucleated giant cells.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In the context of a flaccid blister, acantholytic cells WITHOUT multinucleated giant cells suggest:', '["HSV","Pemphigus Vulgaris","VZV","None"]', 1, 'Acantholysis is the primary process in Pemphigus; viral infections show both acantholysis AND characteristic multinucleation.'),
        (v_case_id, 'What is the ''Tzanck cell'' specifically?', '["A white blood cell","An acantholytic keratinocyte","A fungal spore","None"]', 1, 'These cells lose their connections and become spherical.'),
        (v_case_id, 'Is the Tzanck smear sufficient for a definitive diagnosis of Pemphigus?', '["Yes","No, DIF and Histology are required for confirmation","Only in the mouth","None"]', 1, 'It is a rapid bedside screen, not a definitive test.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Dark'' Lacunae
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dark'' Lacunae', 'A dermoscopic exam of a dark purple, slightly scaly papule on the scrotum.

Vitals: Normal.
Physical Examination: Multiple 2-4 mm dark purple papules on the scrotum.
Laboratory Results: Dermoscopy shows ''large, well-demarcated dark red to blue-black lacunae''.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of dark lacunae in this location is classic for:', '["Melanoma","Angiokeratoma (of Fordyce)","BCC","Wart"]', 1, 'Angiokeratomas are benign vascular ectasias.'),
        (v_case_id, 'A large number of angiokeratomas in a young patient should prompt screening for which metabolic disorder?', '["Diabetes","Fabry Disease (alpha-galactosidase A deficiency)","Gout","None"]', 1, 'Angiokeratoma corporis diffusum is a hallmark of Fabry disease.'),
        (v_case_id, 'How does the ''scale'' on an angiokeratoma affect the dermoscopic view?', '["It makes it clearer","It can hide the lacunae, requiring the use of ultrasound gel or alcohol to increase transparency","No effect","None"]', 1, 'Interface fluid improves the dermoscopic visualization of vascular structures.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Palisaded'' Mucin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Palisaded'' Mucin', 'A pathology report for an annular rash describes ''palisaded granulomas surrounding central mucin and degenerated collagen''.

Vitals: Normal.
Physical Examination: Non-scaly annular plaque on the hand.
Laboratory Results: Biopsy results received.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''mucin'' in the center of a palisaded granuloma is a key feature of:', '["Sarcoidosis","Granuloma Annulare (GA)","Rheumatoid nodules","None"]', 1, 'GA is characterized by interstitial mucin deposition.'),
        (v_case_id, 'How do ''Rheumatoid Nodules'' differ histologically from GA?', '["They have no granulomas","They have a more ''fibrinoid'' center and LACK significant mucin","They are identical","None"]', 1, 'Fibrin vs. Mucin is the classic histologic differentiator.'),
        (v_case_id, 'What is ''Mucin'' on a standard H&E stain?', '["Bright red","Stringy, pale blue or grey material between collagen bundles","Black","None"]', 1, 'Special stains like Alcian Blue can make mucin much easier to see.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Tiered'' Granuloma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Tiered'' Granuloma', 'A pathology report for a yellow shin plaque describes ''tiered, horizontal (sandwich-like) granulomatous inflammation throughout the dermis''.

Vitals: Normal.
Physical Examination: Yellowish-brown plaque on the shin.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Tiered'' or ''Horizontal'' granuloma refer to?', '["Granulomas in a circle","Alternating layers of inflammation and degenerated collagen throughout the thickness of the dermis","A scar","None"]', 1, 'This ''layer-cake'' appearance is classic for NL.'),
        (v_case_id, 'Which specific histologic finding is often seen in the vessels of NL?', '["Vasculitis","Granulomatous vasculitis or wall thickening","Normal vessels","None"]', 1, 'Vascular changes contribute to the tissue degeneration.'),
        (v_case_id, 'Is there mucin in Necrobiosis Lipoidica?', '["Yes, lots","Usually very little or none (unlike GA)","Only in the center","None"]', 1, 'The lack of mucin helps distinguish NL from GA.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Dotted'' Vessels
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dotted'' Vessels', 'A dermoscopic exam of a scaly scalp patch.

Vitals: Normal.
Physical Examination: Red, scaly patch on the scalp.
Laboratory Results: Dermoscopy shows ''regularly distributed dotted vessels'' and ''silver-white scale''.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Regularly distributed ''dotted'' vessels are highly characteristic of:', '["Seborrheic dermatitis","Psoriasis","Tinea capitis","None"]', 1, 'The vessels represent the elongated dermal papillae seen in psoriasis.'),
        (v_case_id, 'How would ''Seborrheic Dermatitis'' differ on dermoscopy?', '["It would be the same","It shows more ''yellowish'' (greasy) scale and less regular, thinner vessels","It has no vessels","None"]', 1, 'Seb derm has ''greasy'' scale; psoriasis has ''micaceous'' (silver-white) scale.'),
        (v_case_id, 'What is the ''Auspitz sign'' correlating with these vessels?', '["A rash","Pinpoint bleeding after scraping the silver scale, due to the proximity of the dilated vessels to the surface","A fever","None"]', 1, 'Dermoscopy provides the structural explanation for this clinical sign.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Punched-Out'' Erosion
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Punched-Out'' Erosion', 'An X-ray of the big toe of a patient with a painful, swollen joint.

Vitals: Normal.
Physical Examination: Swollen, red first MTP joint (Podagra).
Laboratory Results: X-ray shows ''punched-out'' bone erosions with ''overhanging edges''.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''overhanging edge'' (Martel''s sign) on X-ray is classic for:', '["Rheumatoid arthritis","Gout","Osteoarthritis","None"]', 1, 'This is a late finding in chronic tophaceous gout.'),
        (v_case_id, 'How do ''Rheumatoid Arthritis'' erosions differ?', '["They are larger","They are ''marginal'' (at the edges of the joint) and associated with periarticular osteopenia","They don''t exist","None"]', 1, 'The location and quality of the bone help distinguish the two.'),
        (v_case_id, 'What is the ''Gold Standard'' for diagnosing an acute gout flare?', '["X-ray","Joint aspiration showing negatively birefringent needle-shaped crystals","Serum uric acid level","None"]', 1, 'Note: Serum uric acid can be NORMAL during an acute flare.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Target'' and the ''Ovarian'' CT
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Ovarian'' CT', 'A 55-year-old woman is diagnosed with Dermatomyositis.

Vitals: Normal.
Physical Examination: Heliotrope rash and proximal muscle weakness.
Laboratory Results: CK is 2000. CT of the abdomen/pelvis is ordered.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In an older woman with Dermatomyositis, which cancer has the strongest association?', '["Lung","Ovarian Cancer","Breast Cancer","Colon Cancer"]', 1, 'Ovarian cancer is highly over-represented in female DM patients.'),
        (v_case_id, 'Is malignancy screening recommended for ''Juvenile'' (childhood) Dermatomyositis?', '["Yes, same as adults","No, juvenile DM is generally NOT associated with malignancy","Only if they have a cough","None"]', 1, 'The paraneoplastic risk is primarily in adults.'),
        (v_case_id, 'Besides CT, what is a common ''screening'' test for ovarian cancer in these patients?', '["Blood sugar","Pelvic Ultrasound and CA-125 level","UA","None"]', 1, 'Multi-modal screening is often used.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Target'' and the ''ASO'' Titer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ASO'' Titer', 'An 8-year-old child presents with dozens of small, scaly ''teardrop'' spots all over his body, two weeks after a sore throat.

Vitals: Normal.
Physical Examination: Guttate (teardrop) psoriasis.
Laboratory Results: An ''ASO'' (Antistreptolysin O) titer is elevated.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does an elevated ASO titer indicate?', '["Active psoriasis","A recent Group A Streptococcal infection","A fungal infection","None"]', 1, 'Guttate psoriasis is frequently triggered by a preceding Strep throat or skin infection.'),
        (v_case_id, 'What is the most common management for post-streptococcal guttate psoriasis?', '["Chemotherapy","Antibiotics (to treat any remaining Strep) and Phototherapy or topical steroids","Surgery","None"]', 1, 'Clearing the infection often helps the psoriasis resolve.'),
        (v_case_id, 'Will this patient eventually develop ''Chronic Plaque Psoriasis''?', '["No, it always resolves","About 30-40% of guttate cases eventually progress to classic plaque psoriasis","Yes, 100%","None"]', 1, 'The prognosis is variable.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Target'' and the ''False'' RPR
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''False'' RPR', 'A pregnant woman with a history of Lupus has a positive RPR screen for Syphilis. Her confirmatory FTA-ABS is NEGATIVE.

Vitals: Normal.
Physical Examination: No lesions.
Laboratory Results: RPR (+), FTA-ABS (-).', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely reason for this patient''s positive RPR?', '["She has syphilis","A ''Biological False Positive'' (BFP) due to her underlying Lupus or Pregnancy","The lab made a mistake","None"]', 1, 'Non-treponemal tests (RPR/VDRL) are not specific and can be triggered by other conditions.'),
        (v_case_id, 'Which antibody in Lupus is most commonly associated with a false-positive RPR?', '["Anti-Smith","Antiphospholipid antibodies (e.g., Lupus Anticoagulant, Anti-cardiolipin)","Anti-Ro","None"]', 1, 'The RPR test uses cardiolipin as an antigen.'),
        (v_case_id, 'Besides Lupus and Pregnancy, what is another common cause of a BFP RPR?', '["Viral infections (e.g., Mono, HIV, Hepatitis)","Eating too much meat","Drinking coffee","None"]', 0, 'Acute viral infections are a frequent cause of transient BFP.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Target'' and the ''Hives'' (Histology)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Hives'' (Histology)', 'A biopsy of a classic ''hive'' (urticaria) that has been present for 4 hours.

Vitals: Normal.
Physical Examination: Transient erythematous wheal.
Laboratory Results: Histology shows ''mild dermal edema and a sparse perivascular infiltrate of lymphocytes, eosinophils, and neutrophils''.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is there any damage to the ''blood vessel wall'' in classic urticaria?', '["Yes, always","No, the vessels are dilated (edema) but the walls are intact; this distinguishes it from vasculitis","Only if it is red","None"]', 1, 'Vasculitis (LCV) shows fibrinoid necrosis; urticaria does not.'),
        (v_case_id, 'If the ''hive'' stays in the same spot for > 24 hours, what should you suspect?', '["Simple urticaria","Urticarial Vasculitis (which requires a biopsy for confirmation)","A food allergy","None"]', 1, 'Duration > 24 hours and bruising (purpura) are ''Red Flags'' for vasculitis.'),
        (v_case_id, 'What is ''Angioedema'' compared to Urticaria?', '["A different disease","The same process but occurring deeper in the dermis and subcutaneous tissue","Only in the eyes","None"]', 1, 'They often occur together.');

    RAISE NOTICE 'Finished populating 80 cases for case-labs-imaging.';
END $$;

COMMIT;
