-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: Drug-induced skin reactions (SJS, TEN)
-- Topic Slug: derm-drug-reactions
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-drug-reactions' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-drug-reactions';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Typical Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Typical Rash', 'A 25-year-old male presents with a widespread rash that started 7 days after beginning Amoxicillin for a throat infection. He denies any fever, mucosal pain, or skin tenderness.

Vitals: Normal.
Physical Examination: Symmetric, erythematous macules and papules on the trunk and proximal extremities. Many lesions are ''morbilliform'' (measles-like). No blisters or Nikolsky sign.
Laboratory Results: CBC shows no significant eosinophilia.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common type of adverse drug reaction in the skin?', '["SJS","Exanthematous (Morbiliform) Drug Eruption","Fixed Drug Eruption","TEN"]', 1, 'Exanthematous eruptions account for approximately 90% of all skin drug reactions.'),
        (v_case_id, 'What is the typical timing for the onset of an exanthematous eruption in a previously unexposed patient?', '["1-2 hours","7-14 days","6 months","Immediate"]', 1, 'It typically develops 1-2 weeks after starting a new medication, reflecting a delayed Type IV hypersensitivity.'),
        (v_case_id, 'Which finding would be MOST concerning for a transition to a more severe reaction (like SJS)?', '["Itching","Skin tenderness and fever","Redness on the trunk","History of asthma"]', 1, 'Fever and skin pain are ''red flag'' symptoms that suggest a more serious bullous reaction.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Recurrent Spot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Recurrent Spot', 'A 30-year-old male presents with a recurring dark spot on his glans penis. He notes that every time he takes Trimethoprim-Sulfamethoxazole for a UTI, the same spot becomes red, itchy, and occasionally blisters.

Vitals: Normal.
Physical Examination: A single, well-demarcated, 1.5 cm dusky red-to-violaceous plaque on the glans. 
Laboratory Results: Biopsy shows interface dermatitis with many necrotic keratinocytes and dermal melanophages.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark clinical feature of a Fixed Drug Eruption?', '["It moves around the body","It recurs in the exact same location upon re-exposure to the drug","It only affects the face","It is always associated with hair loss"]', 1, 'FDE ''fixes'' to the same site due to resident memory T-cells.'),
        (v_case_id, 'Which medication class is the most common trigger for FDE on the genitalia?', '["Aspirin","Sulfonamides","Beta-blockers","Statins"]', 1, 'Sulfonamides are classic triggers for genital FDE.'),
        (v_case_id, 'What is the characteristic residual appearance of an FDE after the acute inflammation subsides?', '["A scar","Post-inflammatory hyperpigmentation (dusky brown)","White patch","The skin returns to normal instantly"]', 1, 'FDE typically leaves a persistent dusky brown patch due to pigment incontinence.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Puffy Face and Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Puffy Face and Rash', 'A 40-year-old woman began Carbamazepine 3 weeks ago for trigeminal neuralgia. She now presents with high fever, a diffuse rash, and facial swelling.

Vitals: T 39.2 C, HR 110, BP 120/80.
Physical Examination: Diffuse morbilliform eruption becoming confluent. Marked periorbital and facial edema. Palpable lymphadenopathy in the neck.
Laboratory Results: WBC 15,000 with 15% eosinophils (Absolute eosinophil count 2,250). AST/ALT are elevated (3x normal).', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the acronym DRESS stand for?', '["Drug Rash with Eosinophilia and Systemic Symptoms","Delayed Rash and Eosinophil Skin Sore","Drug-induced Redness and Eczema","Direct Reaction to Exogenous Systemic Steroids"]', 0, 'DRESS is a severe systemic drug reaction involving internal organs.'),
        (v_case_id, 'What is the typical latency period for DRESS syndrome?', '["1 day","2-8 weeks","1 year","1 hour"]', 1, 'DRESS has a longer latency than most other drug reactions (average 3-6 weeks).'),
        (v_case_id, 'Which virus reactivation is frequently associated with DRESS syndrome?', '["HIV","HHV-6 (Human Herpesvirus 6)","Hepatitis C","HPV"]', 1, 'HHV-6 reactivation is a key part of the pathogenesis in many DRESS cases.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Acute Pustules
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acute Pustules', 'A 50-year-old male starts Cephalexin for a leg infection. 48 hours later, he develops a high fever and a burning rash in his skin folds.

Vitals: T 38.8 C.
Physical Examination: Diffuse erythema with hundreds of non-follicular, sterile, pinpoint pustules concentrated in the axillae and groin.
Laboratory Results: WBC 18,000 with neutrophilia. Pustule culture is negative.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic timing for AGEP?', '["1 month","Rapid onset (usually <48 hours after drug exposure)","10 days","Instant"]', 1, 'AGEP is one of the fastest-onset delayed-type hypersensitivity reactions.'),
        (v_case_id, 'Which medication class is most commonly associated with AGEP?', '["Aminoglycosides","Beta-lactam antibiotics (Penicillins/Cephalosporins)","NSAIDS","Calcium channel blockers"]', 1, 'Beta-lactams and Macrolides are top triggers.'),
        (v_case_id, 'What is the typical prognosis for AGEP after stopping the offending drug?', '["Lethal","Excellent; pustules typically desquamate and resolve within 1-2 weeks","Requires lifelong steroids","Causes permanent scarring"]', 1, 'AGEP has a very good prognosis once the drug is discontinued.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Painful Mouth and Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Mouth and Skin', 'A 60-year-old male started Allopurinol 2 weeks ago. He now presents with a painful rash and mouth sores.

Vitals: T 38.5 C.
Physical Examination: Atypical ''targetoid'' macules on the chest and face. Two or more mucosal sites (mouth and eyes) are involved. Skin detachment is noted on about 5% of the body surface area.
Laboratory Results: Skin biopsy shows full-thickness epidermal necrosis.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the defining body surface area (BSA) threshold for SJS?', '[">30% BSA","<10% BSA detachment","50% BSA","Must involve the whole body"]', 1, 'SJS involves <10% BSA detachment; 10-30% is overlap, and >30% is TEN.'),
        (v_case_id, 'Which HLA allele is strongly associated with Allopurinol-induced SJS in Han Chinese and Thai populations?', '["HLA-B*5701","HLA-B*5801","HLA-B*1502","HLA-B*27"]', 1, 'HLA-B*5801 is the marker for Allopurinol risk; B*1502 is for Carbamazepine.'),
        (v_case_id, 'What is the hallmark histologic finding in SJS/TEN?', '["Pustules","Full-thickness epidermal necrosis/apoptosis with minimal dermal inflammation","Thickened epidermis","Fungal hyphae"]', 1, 'The massive cell death is caused by cytotoxic T-cells and granulysin.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Sheet-Like Sloughing
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sheet-Like Sloughing', 'A 70-year-old patient on Phenytoin for seizures develops a high fever and widespread skin pain. Within 24 hours, her skin begins to peel off in large sheets.

Vitals: T 39.5 C, HR 120, BP 90/60.
Physical Examination: Dusky erythema progressing to confluent blisters. Nikolsky sign is positive. Epidermal detachment is estimated at 40% of the BSA.
Laboratory Results: SCORTEN score is calculated to predict mortality.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the Nikolsky sign?', '["Rubbing skin to see if it turns red","Applying lateral pressure to the skin causes the epidermis to slide off the dermis","A type of headache","Pain on joint movement"]', 1, 'A positive Nikolsky sign indicates active epidermal cleavage.'),
        (v_case_id, 'What is the primary cause of death in TEN patients?', '["Liver failure","Infection/Sepsis and multi-organ failure","Brain damage","Heart attack"]', 1, 'Loss of the skin barrier leads to massive fluid loss and overwhelming infection.'),
        (v_case_id, 'Where should a patient with >30% BSA involvement from TEN be managed?', '["At home","A specialized Burn Unit or ICU","Standard medical ward","Psychiatric unit"]', 1, 'TEN patients require intensive fluid management and wound care similar to major burns.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Skin Necrosis (Warfarin)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Skin Necrosis (Warfarin)', 'A 55-year-old woman with a history of DVT is started on Warfarin without a Heparin bridge. On day 3, she develops extremely painful, dark purple patches on her breasts and thighs.

Vitals: Normal.
Physical Examination: Well-demarcated areas of ecchymosis progressing to necrotic black eschars on adipose-rich areas.
Laboratory Results: Patient is found to have a hereditary Protein C deficiency.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does Warfarin-induced skin necrosis occur early in treatment?', '["The drug is toxic to skin cells","Warfarin causes a rapid drop in Protein C (which has a short half-life), creating a transient hypercoagulable state before the pro-coagulant factors fall","It is an allergic reaction","It only happens in the winter"]', 1, 'Protein C falls faster than Factors II, IX, and X, leading to microthrombosis in skin vessels.'),
        (v_case_id, 'What is the treatment for this condition?', '["Increase the Warfarin dose","Stop Warfarin, give Vitamin K, and administer Protein C concentrate or Fresh Frozen Plasma (FFP)","Apply topical steroids","Antibiotics"]', 1, 'You must reverse the Warfarin effect and restore anticoagulation with Heparin.'),
        (v_case_id, 'Which body areas are most commonly affected by this condition?', '["Face","Fat-rich areas (breasts, thighs, buttocks)","Palms and soles","Scalp"]', 1, 'Adipose tissue is the classic location for these necrotic lesions.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Sunburn-like Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sunburn-like Rash', 'A patient taking Doxycycline for acne goes to the beach for 2 hours. She returns with a severe, painful redness only on her face, neck, and the backs of her hands.

Vitals: Normal.
Physical Examination: Well-demarcated, bright red erythema and edema in a strictly ''sun-exposed'' distribution.
Laboratory Results: None.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Phototoxic reaction?', '["An allergy to the sun","A non-immunologic reaction where a drug absorbs UV energy and directly damages the skin","A fungal infection","A type of acne"]', 1, 'Phototoxicity can happen to anyone if the drug concentration and UV dose are high enough.'),
        (v_case_id, 'Which class of antibiotics is the most common cause of phototoxicity?', '["Penicillins","Tetracyclines (especially Doxycycline)","Cephalosporins","Macrolides"]', 1, 'Tetracyclines, Sulfonamides, and Fluoroquinolones are common triggers.'),
        (v_case_id, 'How does the distribution of phototoxicity differ from a typical drug rash?', '["It is only on the trunk","It is limited to areas exposed to the sun (sun-exposed distribution)","It is only on the feet","It is random"]', 1, 'The ''sparing'' of areas covered by clothing or shadows (like under the chin) is a key clue.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Anti-Histone Positive Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Anti-Histone Positive Rash', 'A 65-year-old male on Procainamide for arrhythmias presents with joint pain, fever, and a rash on his face and trunk.

Vitals: T 38.0 C.
Physical Examination: Malar-like erythema and discoid-like plaques on the trunk.
Laboratory Results: Positive ANA (1:640) and positive Anti-Histone antibodies. Anti-dsDNA is negative.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which antibody is highly sensitive (approx 95%) for Drug-Induced Lupus?', '["Anti-dsDNA","Anti-Histone","Anti-Smith","Anti-Ro/SSA"]', 1, 'Anti-histone antibodies are the classic marker for DILE.'),
        (v_case_id, 'Which common medication for hypertension is a classic cause of DILE?', '["Amlodipine","Hydralazine","Lisinopril","Hydrochlorothiazide"]', 1, 'Hydralazine, Procainamide, and Isoniazid are the ''big three'' triggers.'),
        (v_case_id, 'Does DILE typically involve the kidneys or CNS?', '["Yes, frequently","No, systemic involvement is usually limited to skin, joints, and serositis (pleuritis/pericarditis)","Only in children","Always"]', 1, 'Unlike idiopathic SLE, DILE rarely involves the renal or central nervous systems.');

    ---------------------------------------------------------------------------
    -- CASE 10: The New Blisters (Pemphigus)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The New Blisters (Pemphigus)', 'A patient being treated with D-Penicillamine for Wilson''s disease develops flaccid blisters and painful erosions in her mouth and on her chest.

Vitals: Normal.
Physical Examination: Flaccid bullae that rupture easily. Positive Nikolsky sign on the skin.
Laboratory Results: Biopsy shows acantholysis. Direct Immunofluorescence (DIF) shows IgG in a ''fishnet'' pattern.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which chemical group in drugs like Penicillamine is thought to trigger Pemphigus?', '["Phenol","Thiol (Sulfhydryl) group","Amine","Carboxyl"]', 1, 'Thiol-containing drugs can biochemically interfere with desmosome stability or act as haptens.'),
        (v_case_id, 'How does Drug-Induced Pemphigus behave compared to Pemphigus Vulgaris?', '["It is much worse","It often resolves spontaneously upon discontinuation of the drug (especially if thiol-induced)","It is contagious","It is caused by a virus"]', 1, 'Many cases of drug-induced pemphigus are reversible.'),
        (v_case_id, 'What is the target of the autoantibodies in Pemphigus?', '["BP180","Desmogleins (Dsg1 and Dsg3)","Type VII Collagen","Laminin"]', 1, 'Desmogleins are the ''glue'' between keratinocytes that is destroyed in pemphigus.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Tense Blisters (Pemphigoid)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tense Blisters (Pemphigoid)', 'An 80-year-old male on Furosemide develops large, very itchy, firm blisters on his legs and arms.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative.
Laboratory Results: DIF shows a linear band of IgG and C3 along the basement membrane zone.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary difference in the physical exam between Pemphigus and Pemphigoid?', '["Color of skin","Pemphigoid has tense blisters (subepidermal); Pemphigus has flaccid blisters (intraepidermal)","Pemphigoid is not itchy","Pemphigus only affects feet"]', 1, 'Tense bullae are the hallmark of subepidermal blistering diseases like Bullous Pemphigoid.'),
        (v_case_id, 'Which drug class has been recently and strongly associated with Bullous Pemphigoid?', '["Statins","DPP-4 inhibitors (Gliptins, e.g., Linagliptin)","Metformin","Aspirin"]', 1, 'Gliptins are now recognized as a major trigger for BP, especially in the elderly.'),
        (v_case_id, 'What is the target antigen in Bullous Pemphigoid?', '["Desmoglein 1","BP180 (Type XVII Collagen) and BP230","Desmoglein 3","Integrin"]', 1, 'Autoantibodies target the hemidesmosomes that anchor the epidermis to the dermis.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Purple, Polygonal Papules
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple, Polygonal Papules', 'A 50-year-old patient being treated with Gold salts for rheumatoid arthritis develops itchy, flat-topped purple bumps on his wrists.

Vitals: Normal.
Physical Examination: Multiple purple, polygonal, planar, pruritic papules (The ''4 Ps''). Fine white lines (Wickham striae) are seen on the surface.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the ''4 Ps'' of Lichen Planus?', '["Painful, Puffy, Pink, Pustular","Purple, Polygonal, Planar, Pruritic","Peeling, Pale, Pitted, Pointy","Persisting, Papular, Phlegmonous, Pale"]', 1, 'These describe the classic morphology of LP.'),
        (v_case_id, 'How does drug-induced (lichenoid) LP often differ from ''classic'' LP?', '["It is not itchy","It is often more generalized, symmetric, and may lack Wickham striae or mucosal involvement","It is only on the face","It looks like a blister"]', 1, 'Lichenoid drug eruptions are often more extensive than idiopathic LP.'),
        (v_case_id, 'Which cardiovascular drug class is a common cause of lichenoid eruptions?', '["Beta-blockers and ACE inhibitors","Statins","Calcium channel blockers","Nitrates"]', 0, 'Antihypertensives are frequent culprits for lichenoid drug rashes.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Steroid Acne
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Steroid Acne', 'A bodybuilder presents with an explosive onset of acne on his chest, back, and shoulders. He denies having acne as a teenager.

Vitals: Normal.
Physical Examination: Numerous monomorphic (all same size) inflammatory papules and pustules. No comedones (blackheads/whiteheads) are seen.
Laboratory Results: Patient admits to taking anabolic steroids.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark clinical feature of steroid-induced acne?', '["Deep cysts","Monomorphic appearance (all lesions are at the same stage of development) and absence of comedones","Only on the face","Presence of many blackheads"]', 1, 'True acne has lesions in various stages (polymorphic); drug-induced is usually uniform (monomorphic).'),
        (v_case_id, 'Besides anabolic steroids, which medication is a common cause of this eruption?', '["Systemic corticosteroids (e.g., Prednisone)","Antibiotics","Aspirin","Vitamin C"]', 0, 'Prednisone is a classic trigger for ''steroid acne'' in patients being treated for systemic diseases.'),
        (v_case_id, 'What is the primary treatment?', '["More steroids","Discontinuing the offending agent","Surgery","Radiation"]', 1, 'The acne usually resolves once the steroids are stopped.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Target Lesion
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Target Lesion', 'A 20-year-old presents with a ''bullseye'' rash on his palms after taking a sulfonamide for a cold. He has no fever or mouth sores.

Vitals: Normal.
Physical Examination: Symmetric targetoid lesions with three distinct zones (dusky center, pale ring, erythematous rim) on the hands and feet.
Laboratory Results: Biopsy shows vacuolar interface dermatitis.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of Erythema Multiforme overall?', '["Drugs","Infections (especially Herpes Simplex Virus)","Food","Stress"]', 1, 'HSV is responsible for up to 90% of EM cases. Drugs are a much less common cause.'),
        (v_case_id, 'How many zones of color are typically seen in a ''classic'' EM target lesion?', '["1","2","3","4"]', 2, 'Classic targets have 3 zones; ''atypical'' targets (seen in SJS) often have only 2.'),
        (v_case_id, 'What is the difference between EM Minor and EM Major?', '["Size of lesions","EM Major involves one or more mucosal surfaces; EM Minor does not","EM Major is lethal","There is no difference"]', 1, 'Mucosal involvement defines the ''Major'' subtype.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Red Man
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Man', 'A patient receiving a rapid infusion of IV Vancomycin develops flushing, redness, and itching of his face, neck, and upper torso.

Vitals: HR 110, BP 100/60.
Physical Examination: Diffuse erythematous flush of the upper body. No hives or wheezing.
Laboratory Results: None.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of Red Man Syndrome?', '["IgE-mediated allergy","Direct, non-immunologic histamine release from mast cells triggered by rapid vancomycin infusion","A fungal infection","An autoimmune attack"]', 1, 'It is a pseudo-allergy (anaphylactoid), not a true Type I allergy.'),
        (v_case_id, 'How can Red Man Syndrome be prevented?', '["Give the drug faster","Slowing the rate of infusion (to >60 minutes) and pre-treating with antihistamines","It cannot be prevented","Avoid all antibiotics"]', 1, 'Infusion rate is the key factor.'),
        (v_case_id, 'Is Red Man Syndrome a contraindication to future Vancomycin use?', '["Yes, always","No, it is not a true allergy; the drug can be used again with slower infusion rates","Only if the patient is old","Only in children"]', 1, 'Unlike anaphylaxis, you can safely reuse the drug.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Heparin Skin Necrosis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heparin Skin Necrosis', 'A patient on Unfractionated Heparin for 1 week develops painful, red-to-purple patches at his abdominal injection sites.

Vitals: Normal.
Physical Examination: Circumscribed areas of necrosis and bruising around the needle marks.
Laboratory Results: Platelet count has dropped from 250,000 to 80,000.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of skin necrosis in a patient on Heparin?', '["It is a normal bruise","It is often a localized manifestation of Heparin-Induced Thrombocytopenia (HIT)","It means the heparin is too strong","It is an infection"]', 1, 'Skin necrosis at injection sites should immediately raise suspicion for systemic HIT.'),
        (v_case_id, 'What antibody is responsible for HIT?', '["Anti-dsDNA","Antibodies against Platelet Factor 4 (PF4)-Heparin complexes","Anti-S100","ANA"]', 1, 'These antibodies activate platelets, causing both a drop in platelet count and massive clotting.'),
        (v_case_id, 'What is the first step in management?', '["Increase the heparin","Stop all heparin immediately and switch to a non-heparin anticoagulant (e.g., Argatroban)","Give Vitamin K","Apply ice"]', 1, 'Stopping heparin is critical to prevent life-threatening thrombosis.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Cefaclor Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cefaclor Rash', 'A 5-year-old child presents with a hive-like rash and joint swelling 10 days after starting Cefaclor for an ear infection.

Vitals: T 37.8 C.
Physical Examination: Large, dusky, annular wheals. Swollen knees and ankles.
Laboratory Results: CBC is normal; no true vasculitis on biopsy.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Serum Sickness-Like Reaction?', '["A true Type III reaction","A reaction mimicking serum sickness (rash, fever, arthralgia) but lacking circulating immune complexes and vasculitis","A bacterial infection","A drug overdose"]', 1, 'SSLR is common in children, especially with Cefaclor.'),
        (v_case_id, 'How does SSLR differ from true Serum Sickness?', '["SSLR has kidney damage","SSLR lacks immune complexes, proteinuria, and vasculitis","SSLR is lethal","There is no difference"]', 1, 'SSLR is a much milder, though dramatic-looking, condition.'),
        (v_case_id, 'What is the prognosis?', '["Requires surgery","Excellent; spontaneous resolution after stopping the drug","Chronic arthritis","Permanent kidney failure"]', 1, 'It clears quickly and leaves no long-term damage.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Hand-Foot Soreness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hand-Foot Soreness', 'A patient on high-dose Capecitabine for colon cancer presents with redness, tingling, and pain on his palms and soles.

Vitals: Normal.
Physical Examination: Symmetric, bright red erythema and edema of the palms and soles. Some areas have begun to peel.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is another name for Hand-Foot Syndrome?', '["SJS","Palmar-Plantar Erythrodysesthesia (PPE)","Acne","Dermatitis"]', 1, 'PPE is the formal medical term.'),
        (v_case_id, 'Which chemotherapy agents are most commonly associated with PPE?', '["Penicillin","Capecitabine, 5-FU, and Cytarabine","Aspirin","Statins"]', 1, 'Capecitabine is the classic trigger in oncology.'),
        (v_case_id, 'What is the mechanism thought to cause PPE?', '["Allergy","Leakage of the drug from small capillaries into the thick skin of the palms and soles","A viral infection","Sun damage"]', 1, 'The high density of sweat glands and pressure/friction in these areas are also factors.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Acneiform Chemo Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acneiform Chemo Rash', 'A patient being treated with Cetuximab for lung cancer develops an acne-like rash on his face and chest 1 week into treatment.

Vitals: Normal.
Physical Examination: Numerous small, itchy papules and pustules on the face and upper trunk. No comedones.
Laboratory Results: None.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of this rash in a patient on Cetuximab?', '["It means the drug is not working","It is a positive prognostic indicator (the rash correlates with tumor response)","It is a dangerous allergy","It is an infection"]', 1, 'Counter-intuitively, patients who get the ''EGFR rash'' often have better cancer outcomes.'),
        (v_case_id, 'What is the target of Cetuximab?', '["TNF-alpha","Epidermal Growth Factor Receptor (EGFR)","VEGF","BRAF"]', 1, 'EGFR is essential for normal skin development, which is why blocking it causes this rash.'),
        (v_case_id, 'Should the Cetuximab be stopped because of this rash?', '["Yes, immediately","No, it is usually managed with topical/oral antibiotics and steroids while continuing the chemo","Yes, forever","No, it goes away in 1 hour"]', 1, 'Dose reduction is only needed for very severe (Grade 3/4) rashes.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Blue Gums
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Gums', 'A 20-year-old on long-term Minocycline for acne presents with a new blue-gray color on his gums and shins.

Vitals: Normal.
Physical Examination: Muddy, blue-gray hyperpigmentation of the shins and the oral mucosa.
Laboratory Results: Biopsy shows iron-containing pigment in the dermis.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How many types of Minocycline pigmentation are there?', '["1","2","3","4"]', 2, 'Type I (scars), Type II (shins/arms), and Type III (sun-exposed muddy-brown).'),
        (v_case_id, 'What is the classic appearance of Type II Minocycline pigmentation?', '["Blue-gray color on the shins and forearms (like bruises that don''t fade)","Red spots","White patches","Orange skin"]', 0, 'The shins are the most classic ''high-yield'' location for Type II.'),
        (v_case_id, 'Is this pigmentation permanent?', '["Yes","It fades very slowly (months to years) after stopping the drug, and some types may require laser treatment","It goes away in 1 day","No, it turns into a tan"]', 1, 'Pigmentation can be very persistent and psychologically distressing.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Blue-Gray Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue-Gray Face', 'A 70-year-old male with a history of chronic arrhythmias on Amiodarone presents with a distinct blue-gray color on his face and ears.

Vitals: Normal.
Physical Examination: Slate-gray to violaceous pigmentation of sun-exposed areas (face, ears, neck).
Laboratory Results: Biopsy shows lipofuscin-like granules in dermal macrophages.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent for ''slate-gray'' facial pigmentation?', '["Aspirin","Amiodarone","Penicillin","Insulin"]', 1, 'Amiodarone is the classic cause of this ''blue man'' appearance.'),
        (v_case_id, 'In what distribution does Amiodarone pigmentation occur?', '["Only on the feet","Sun-exposed areas (it is a photo-induced process)","Only the palms","Internal organs only"]', 1, 'UV light is required for the development of the pigment.'),
        (v_case_id, 'What is another potential skin side effect of Amiodarone?', '["Hair growth","Photosensitivity (exaggerated sunburn)","Skin thickening","Warts"]', 1, 'Up to 50% of patients on Amiodarone experience some degree of photosensitivity.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Shifting Bullae
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Shifting Bullae', 'A patient on Sulfasalazine for Crohn''s disease presents with a fever and a rash covering 20% of his body. The skin is beginning to slough.

Vitals: T 38.5 C.
Physical Examination: Detached skin on the trunk and limbs. Nikolsky sign is positive. BSA of detachment is exactly 20%.
Laboratory Results: SCORTEN is 2.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What defines the ''SJS/TEN Overlap'' category?', '["1-5% BSA","10% to 30% BSA detachment","Exactly 50% BSA","It involves only the mouth"]', 1, 'This is the ''gray zone'' between SJS and TEN.'),
        (v_case_id, 'Which medication is a major trigger for the SJS/TEN spectrum in patients with the HLA-B*1502 allele?', '["Aspirin","Carbamazepine","Allopurinol","Doxycycline"]', 1, 'B*1502 screening is mandatory before starting Carbamazepine in many Asian countries.'),
        (v_case_id, 'What is the SCORTEN system used for?', '["To measure height","To predict the probability of death (prognosis) in SJS/TEN based on 7 clinical variables","To count white blood cells","To measure BP"]', 1, 'Variables include age, heart rate, BUN, BSA, bicarbonate, malignancy history, and glucose.');

    ---------------------------------------------------------------------------
    -- CASE 23: The Flagellate Erythema
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flagellate Erythema', 'A 30-year-old woman being treated with Bleomycin for Hodgkin''s lymphoma develops itchy, linear red streaks on her back that look like ''whip marks''.

Vitals: Normal.
Physical Examination: Multiple linear, criss-crossing erythematous streaks on the trunk and back.
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which medication is the classic cause of flagellate erythema?', '["Penicillin","Bleomycin","Insulin","Methotrexate"]', 1, 'The ''whip-mark'' appearance is virtually pathognomonic for bleomycin toxicity (though it can rarely occur with shiitake mushroom ingestion).'),
        (v_case_id, 'What is the mechanism for the flagellate distribution?', '["The patient is scratching","Induced by minor trauma or scratching (Koebner-like) in the setting of the drug","It follows the nerves","It follows the veins"]', 1, 'Scratching likely concentrates the drug or its effects along the lines of trauma.'),
        (v_case_id, 'Is flagellate erythema a reason to stop Bleomycin?', '["Yes, always","No, it is usually managed symptomatically (antihistamines) and isn''t a contraindication to more chemo","Yes, it means the patient is allergic","Only in children"]', 1, 'It is a cutaneous side effect, not a life-threatening emergency.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Gingival Overgrowth
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Gingival Overgrowth', 'A patient being treated for epilepsy presents with ''swollen gums'' that are now covering half of his teeth.

Vitals: Normal.
Physical Examination: Firm, non-tender, fibrous enlargement of the gingival papillae.
Laboratory Results: Patient is taking Phenytoin.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Besides Phenytoin, which other drug class is a major cause of gingival hyperplasia?', '["Calcium channel blockers (especially Nifedipine)","ACE inhibitors","Statins","NSAIDs"]', 0, 'Nifedipine and Cyclosporine are the other two major culprits.'),
        (v_case_id, 'What is the best way to manage drug-induced gingival hyperplasia?', '["Pulling the teeth","Meticulous oral hygiene and potentially switching to an alternative medication","Gargling with salt water","Nothing"]', 1, 'Good hygiene can significantly reduce the severity of the overgrowth.'),
        (v_case_id, 'Is this condition reversible?', '["Yes, it usually resolves several months after stopping the offending drug","No, it requires surgery","Yes, in 1 day","No, it is permanent"]', 0, 'While it can resolve after drug cessation, severe cases may require surgical gingivectomy.');

    ---------------------------------------------------------------------------
    -- CASE 25: The Naproxen Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Naproxen Blisters', 'A patient taking Naproxen for arthritis develops small, fragile blisters on the back of his hands. He notes his skin is ''fragile'' and shears easily.

Vitals: Normal.
Physical Examination: Multiple small vesicles and erosions on sun-exposed hands. Milia are present.
Laboratory Results: Normal porphyrin levels (rules out Porphyria Cutanea Tarda).', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Pseudoporphyria?', '["A real porphyria","A condition that clinically and histologically mimics Porphyria Cutanea Tarda (PCT) but has normal porphyrin levels","A fungal infection","A type of bruise"]', 1, 'It looks identical to PCT but is triggered by drugs rather than metabolic defects.'),
        (v_case_id, 'Which medication is the most common cause of Pseudoporphyria?', '["Naproxen","Aspirin","Penicillin","Metformin"]', 0, 'NSAIDs, particularly naproxen, are the leading cause.'),
        (v_case_id, 'How do you distinguish Pseudoporphyria from PCT?', '["Check the color of the skin","Test urine and blood for porphyrin levels (normal in pseudoporphyria)","By the patient''s age","Biopsy only"]', 1, 'Normal porphyrin studies are diagnostic for pseudoporphyria.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Antimalarial Shins
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Antimalarial Shins', 'A 40-year-old female with Lupus who has been taking Hydroxychloroquine for 5 years presents with slate-gray patches on her shins.

Vitals: Normal.
Physical Examination: Well-demarcated, blue-gray patches on the pretibial areas. The nails also show some muddy-brown transverse bands.
Laboratory Results: None.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In what percentage of patients on long-term antimalarials (Chloroquine/Hydroxychloroquine) does skin pigmentation occur?', '["1%","Approximately 25%","90%","0%"]', 1, 'Skin and mucosal pigmentation is a relatively common side effect of long-term antimalarial therapy.'),
        (v_case_id, 'What is the most characteristic site for antimalarial-induced pigmentation?', '["Face","Shins (pretibial area)","Palms","Scalp"]', 1, 'The shins are the classic ''board exam'' location for this side effect.'),
        (v_case_id, 'What other anatomic site should be examined for pigmentation in these patients?', '["The eyes","The hard palate","The ears","The toes"]', 1, 'Bluish-gray pigmentation of the hard palate is another common finding.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Red Bumps on the Shins
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Bumps on the Shins', 'A 25-year-old woman began taking oral contraceptives (OCPs) 2 months ago. She now presents with painful, red, warm nodules on both shins.

Vitals: T 37.5 C.
Physical Examination: Multiple 2-4 cm deep-seated, tender, erythematous nodules on the pretibial areas. They look like bruises in some areas.
Laboratory Results: ESR is mildly elevated. Biopsy shows septal panniculitis.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common medication trigger for Erythema Nodosum?', '["Aspirin","Oral Contraceptives (OCPs)","Penicillin","Insulin"]', 1, 'OCPs and Sulfonamides are the most frequent drug-related causes of EN.'),
        (v_case_id, 'What is the characteristic histological finding in EN?', '["Lobular panniculitis","Septal panniculitis without vasculitis","Granulomas","Pustules"]', 1, 'EN is the prototype of septal panniculitis.'),
        (v_case_id, 'Do EN nodules typically ulcerate or scar?', '["Yes, always","No, they typically resolve over 3-6 weeks like a bruise, without scarring","They leave white patches","They only scar in children"]', 1, 'Unlike other forms of panniculitis, EN resolves without permanent tissue loss.');

    ---------------------------------------------------------------------------
    -- CASE 28: The SJS-like Infection
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The SJS-like Infection', 'A 10-year-old boy presents with severe mouth sores, red eyes, and a few target-like spots on his arms. He was treated for a ''walking pneumonia'' (Mycoplasma) 1 week ago.

Vitals: T 38.8 C.
Physical Examination: Severe hemorrhagic crusting of the lips and conjunctival injection. Minimal skin involvement (<1% BSA).
Laboratory Results: Mycoplasma pneumoniae PCR is positive.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is MIRAS?', '["A drug reaction","A condition triggered by Mycoplasma pneumoniae that mimics SJS but usually has severe mucosal involvement with very little skin involvement","A type of flu","A fungal rash"]', 1, 'MIRAS is now recognized as a distinct entity from drug-induced SJS.'),
        (v_case_id, 'What is the prognosis of MIRAS compared to drug-induced SJS?', '["Worse","Generally much better, with lower mortality and fewer long-term sequelae","The same","Always lethal"]', 1, 'Despite the severe-looking mouth sores, these children usually recover well.'),
        (v_case_id, 'What is the hallmark of MIRAS?', '["Skin peeling","Mucositis out of proportion to skin findings","Hair loss","Joint pain"]', 1, 'Significant involvement of at least two mucosal sites with minimal skin detachment is the key clue.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Purple Cocaine Ear
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Cocaine Ear', 'A 35-year-old patient presents with painful, dark purple, necrotic patches on his ears and cheeks.

Vitals: Normal.
Physical Examination: Retiform (star-shaped) purpura with central necrosis on the earlobes and face.
Laboratory Results: WBC count is very low (agranulocytosis). Urine drug screen is positive for Cocaine.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Levamisole?', '["A type of cocaine","A veterinary dewormer often used as a cutting agent in illicit cocaine","A blood pressure med","A vitamin"]', 1, 'Levamisole is found in a large percentage of cocaine in the US.'),
        (v_case_id, 'What is the classic cutaneous ''high-yield'' location for levamisole-induced vasculitis?', '["The palms","The ears (earlobes)","The belly button","The toes"]', 1, 'The ears are a highly characteristic site for this retiform purpura.'),
        (v_case_id, 'Which laboratory abnormality is a hallmark of levamisole toxicity?', '["High platelets","Neutropenia/Agranulocytosis","Low glucose","High calcium"]', 1, 'Levamisole is a potent bone marrow suppressant.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ANCA Vasculitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ANCA Vasculitis', 'A patient who has been on Hydralazine for 10 years for hypertension develops fever, weight loss, and a purple rash on his legs.

Vitals: T 37.9 C, BP 150/90.
Physical Examination: Palpable purpura on the lower legs.
Laboratory Results: Positive ANA and very high p-ANCA (MPO) titers. Urinalysis shows proteinuria and hematuria.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which antibody is most characteristically positive in drug-induced ANCA vasculitis?', '["c-ANCA (PR3)","p-ANCA (MPO)","Anti-centromere","Anti-Jo1"]', 1, 'p-ANCA is found in the vast majority of cases, often with dual MPO/PR3 positivity in some instances.'),
        (v_case_id, 'How does this differ from simple drug-induced lupus (DILE)?', '["It doesn''t","It involves a true systemic necrotizing vasculitis, often with glomerulonephritis (renal involvement), which is rare in classic DILE","It is caused by the same drug","It is only on the skin"]', 1, 'ANCA-associated vasculitis is a much more serious condition than simple DILE.'),
        (v_case_id, 'What is the first step in treatment?', '["Double the hydralazine","Stop the drug and often start systemic immunosuppression (steroids/cyclophosphamide) if organs are involved","Antibiotics","Aspirin"]', 1, 'Organ-threatening vasculitis requires aggressive treatment beyond just stopping the trigger.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Pityriasis Rosea Mimic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pityriasis Rosea Mimic', 'A patient on Captopril develops a widespread scaly rash on his trunk. He remembers a ''large patch'' appearing first, followed by smaller ones in a ''Christmas tree'' pattern.

Vitals: Normal.
Physical Examination: Multiple oval, scaly, erythematous plaques following the skin tension lines of the back.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which drug class is famously associated with a Pityriasis Rosea-like eruption?', '["ACE inhibitors (e.g., Captopril)","Aspirin","Statins","Penicillin"]', 0, 'ACE inhibitors, Gold, and Beta-blockers can mimic PR.'),
        (v_case_id, 'What is a ''Herald Patch''?', '["A patch used to quit smoking","The large, initial plaque seen in PR that precedes the generalized eruption","A type of blister","A scar"]', 1, 'The herald patch is the classic clinical sign of PR.'),
        (v_case_id, 'How does drug-induced PR differ from idiopathic PR?', '["It is not itchy","It may lack a herald patch and often takes longer to resolve after the drug is stopped","It is only on the face","It is contagious"]', 1, 'Drug-induced forms are often more inflammatory and persistent.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Psoriasis Flare
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Psoriasis Flare', 'A patient with stable psoriasis is started on Lithium for bipolar disorder. Within 2 weeks, his psoriasis flares dramatically, covering almost his entire body.

Vitals: Normal.
Physical Examination: Diffuse, thick silvery-white scales on erythematous plaques. New pustules are appearing on the palms.
Laboratory Results: None.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of the following is a ''big four'' drug known for flaring psoriasis?', '["Aspirin","Lithium","Vitamin D","Penicillin"]', 1, 'The ''big four'' for psoriasis flares are Lithium, Beta-blockers, Antimalarials, and NSAIDs.'),
        (v_case_id, 'What happens if you give a psoriasis patient systemic steroids and then stop them abruptly?', '["The skin clears forever","Risk of a life-threatening flare of Von Zumbusch (generalized pustular) psoriasis","Nothing","The patient gets a tan"]', 1, 'NEVER give systemic steroids for psoriasis unless absolutely necessary, due to the rebound risk.'),
        (v_case_id, 'Which other common heart medication can worsen psoriasis?', '["ACE inhibitors","Beta-blockers","Calcium channel blockers","Nitrates"]', 1, 'Beta-blockers are notorious for exacerbating psoriatic plaques.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Red Man'' (Erythroderma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red Man'' (Erythroderma)', 'A 60-year-old male presents with redness covering 95% of his body. He feels cold and is shivering despite the warm room.

Vitals: T 35.8 C (Hypothermia), HR 105.
Physical Examination: Diffuse erythema and fine scaling over >90% of the BSA. Peripheral edema and lymphadenopathy are present.
Laboratory Results: Low albumin.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What defines erythroderma?', '["Red face","Redness covering >90% of the body surface area","Red palms only","50% BSA involvement"]', 1, 'Erythroderma is a dermatologic emergency due to the loss of skin function.'),
        (v_case_id, 'Which is a common drug cause of erythroderma?', '["Aspirin","Allopurinol, Sulfonamides, and Antiepileptics","Vitamin C","Moisturizers"]', 1, 'Many of the same drugs that cause SJS or DRESS can also cause erythroderma.'),
        (v_case_id, 'What is a major metabolic complication of erythroderma?', '["High albumin","Hypothermia and high-output heart failure (due to massive skin blood flow)","Constipation","Weight gain"]', 1, 'The ''open'' skin acts like a heat radiator, causing thermoregulation failure.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Syphilis Reaction
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Syphilis Reaction', 'A patient with secondary syphilis is given his first dose of IM Penicillin G. 6 hours later, he develops fever, chills, headache, and his rash becomes much brighter and more prominent.

Vitals: T 38.5 C.
Physical Examination: Exacerbation of the existing copper-colored maculopapular rash on palms and soles.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What causes the Jarisch-Herxheimer reaction?', '["Allergy to penicillin","The sudden release of lipoproteins/endotoxins from dying spirochetes (Treponema pallidum)","Drug overdose","A new infection"]', 1, 'It is an inflammatory response to the ''kill-off'' of the bacteria.'),
        (v_case_id, 'Is this reaction a reason to stop Penicillin?', '["Yes, always","No, it is a self-limited reaction (usually <24 hours) and indicates the treatment is working","Yes, it means the drug is toxic","Only in children"]', 1, 'Management is purely symptomatic (Aspirin/NSAIDS).'),
        (v_case_id, 'Besides Syphilis, in which other disease is this reaction common?', '["Acne","Lyme disease and Leptospirosis","Fungal infections","Cancer"]', 1, 'It can occur in any spirochetal infection being treated with effective antibiotics.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Bad IM Injection
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bad IM Injection', 'Immediately after receiving an IM injection of penicillin in the buttock, the patient develops severe pain and a blue-gray discoloration around the injection site.

Vitals: Normal.
Physical Examination: Retiform (star-shaped) cyanosis and livedo-like patches at the site, quickly progressing to deep necrosis.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Nicolau Syndrome?', '["An allergy","A rare complication of IM injections where the drug accidentally enters an artery or causes vasospasm/thrombosis","A type of flu","An infection"]', 1, 'It is a vascular catastrophe, not an allergy.'),
        (v_case_id, 'What is the typical clinical course of Nicolau syndrome?', '["Resolves in 1 hour","Immediate pain and discoloration followed by extensive, deep tissue necrosis/sloughing","Turns into a freckle","It is painless"]', 1, 'It can lead to permanent muscle loss and scarring.'),
        (v_case_id, 'How can it be prevented?', '["Injecting faster","Proper injection technique (aspirating before injecting to ensure no vessel was hit)","Using a smaller needle","It cannot be prevented"]', 1, 'Aspiration is the key safety step.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Neutrophilic Fever
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Neutrophilic Fever', 'A patient being treated for chemotherapy-induced neutropenia with G-CSF develops high fevers and painful, juicy red plaques on her neck and arms.

Vitals: T 39.0 C.
Physical Examination: ''Succulent'' or ''juicy'' erythematous plaques and nodules. They look like blisters but are firm (pseudovesiculation).
Laboratory Results: Biopsy shows a massive infiltrate of neutrophils in the upper dermis.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Sweet''s Syndrome?', '["A sugar allergy","Acute Febrile Neutrophilic Dermatosis","A fungal infection","A type of acne"]', 1, 'Sweet''s features fever, neutrophilia, and characteristic ''juicy'' skin lesions.'),
        (v_case_id, 'Which medication is the most common trigger for drug-induced Sweet''s?', '["Aspirin","G-CSF (Granulocyte Colony-Stimulating Factor)","Penicillin","Insulin"]', 1, 'Since G-CSF stimulates neutrophil production, it can trigger this neutrophilic dermatosis.'),
        (v_case_id, 'What is the first-line treatment for Sweet''s syndrome?', '["Antibiotics","Systemic corticosteroids (e.g., Prednisone)","Surgery","Antifungals"]', 1, 'Sweet''s is exquisitely sensitive to steroids.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Scleroderma Mimic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scleroderma Mimic', 'A patient being treated with Paclitaxel for breast cancer develops thickening and hardening of the skin on her legs and forearms.

Vitals: Normal.
Physical Examination: Indurated, ''woody'' skin that is difficult to pinch. Raynaud''s phenomenon is absent.
Laboratory Results: ANA is negative.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which chemotherapy class is associated with scleroderma-like skin changes?', '["Penicillins","Taxanes (Paclitaxel, Docetaxel)","NSAIDs","Statins"]', 1, 'Taxanes can induce a fibrotic response in the skin.'),
        (v_case_id, 'How does drug-induced scleroderma differ from systemic sclerosis?', '["It has a positive ANA","It usually lacks internal organ involvement and Raynaud''s phenomenon","It is only on the face","It is contagious"]', 1, 'The lack of Raynaud''s and nailfold capillary changes helps distinguish the drug-induced form.'),
        (v_case_id, 'Is it reversible?', '["Yes","Often resolves or improves significantly after the drug is stopped","No, never","Only with surgery"]', 1, 'Cessation of the taxane is the primary treatment.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Eruptive Warts
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Eruptive Warts', 'A patient on Vemurafenib (BRAF inhibitor) for melanoma develops several dozen new, fast-growing ''warts'' on his arms within the first month of treatment.

Vitals: Normal.
Physical Examination: Multiple 5-10 mm dome-shaped nodules with central keratinous plugs, resembling Keratoacanthomas.
Laboratory Results: Biopsy confirms well-differentiated SCC/KA.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why do BRAF inhibitors cause new skin cancers?', '["They damage DNA","Paradoxical activation of the MAP kinase pathway in cells that do NOT have the BRAF mutation","They suppress the immune system","It is a coincidence"]', 1, 'This is a unique ''off-target'' effect where the drug actually stimulates growth in normal skin cells.'),
        (v_case_id, 'How is this side effect managed?', '["Stopping the melanoma treatment","Surgical excision or destruction of the new lesions while continuing the BRAF inhibitor","Radiation","Topical steroids"]', 1, 'The new tumors are low-grade and manageable; the melanoma treatment is usually prioritized.'),
        (v_case_id, 'Does adding a MEK inhibitor increase or decrease the risk of these lesions?', '["Increases","Decreases (it blocks the pathway downstream, preventing the paradoxical activation)","No effect","Depends on age"]', 1, 'Dual BRAF/MEK therapy significantly lowers the rate of secondary skin cancers.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Hand-Foot Skin Reaction (HFSR)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hand-Foot Skin Reaction (HFSR)', 'A patient on Sorafenib for renal cell carcinoma develops thick, painful calluses on the pressure points of his feet.

Vitals: Normal.
Physical Examination: Hyperkeratotic (thick, yellow) plaques on the heels and balls of the feet, surrounded by a red halo.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Sorafenib-induced HFSR differ from Capecitabine-induced Hand-Foot Syndrome?', '["It is not painful","It is more localized to pressure points and shows significant hyperkeratosis (thickening)","It only affects the hands","It is a flat rash"]', 1, 'Classic HFS (Capecitabine) is diffuse redness; HFSR (Sorafenib/Sunitinib) is localized thick calluses.'),
        (v_case_id, 'What is the primary management for HFSR?', '["Walking more","Keratolytics (urea cream), cushioning, and potential dose reduction","Surgery","Antibiotics"]', 1, 'Softening the calluses and reducing friction is key.'),
        (v_case_id, 'Which drug class causes HFSR?', '["Beta-lactams","Multi-kinase inhibitors (e.g., Sorafenib, Sunitinib, Regorafenib)","Statins","Steroids"]', 1, 'These drugs target VEGF and other growth receptors, interfering with skin repair.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Immunotherapy Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Immunotherapy Rash', 'A patient receiving Nivolumab (PD-1 inhibitor) develops an itchy, red rash on her trunk after her third infusion.

Vitals: Normal.
Physical Examination: Mild-to-moderate maculopapular eruption. No blisters or mucosal involvement.
Laboratory Results: None.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is an ICPI?', '["A type of antibiotic","Immune Checkpoint Inhibitor (e.g., PD-1, PD-L1, or CTLA-4 blockers)","A heart medication","A vitamin"]', 1, 'ICPIs are the mainstay of modern cancer immunotherapy.'),
        (v_case_id, 'How common are skin side effects with ICPIs?', '["Rare","The most common category of Immune-Related Adverse Events (irAEs)","100%","Only in the elderly"]', 1, 'Skin toxicity is often the first irAE to appear.'),
        (v_case_id, 'How is a mild-to-moderate ICPI rash typically managed?', '["Stop the cancer treatment immediately","Continue the immunotherapy and treat the rash with topical steroids and antihistamines","Give antibiotics","Radiation"]', 1, 'Most ICPI rashes can be managed ''through'' the treatment without stopping it.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Vitiligo-like Depigmentation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Vitiligo-like Depigmentation', 'A patient being treated for metastatic melanoma with Pembrolizumab notices white patches appearing on her hands and face.

Vitals: Normal.
Physical Examination: Sharply demarcated, depigmented (bone-white) patches, indistinguishable from vitiligo.
Laboratory Results: None.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In which cancer type is ICPI-induced vitiligo most common?', '["Lung cancer","Melanoma","Renal cancer","Colon cancer"]', 1, 'Because the immune system is targeting melanocytic antigens, vitiligo is very frequent in melanoma patients.'),
        (v_case_id, 'What does the development of vitiligo mean for the patient''s cancer prognosis?', '["It is a bad sign","It is a good prognostic sign (correlates with improved survival in melanoma)","It means the drug is toxic","No correlation"]', 1, 'Vitiligo indicates a robust immune response against melanocytes, which includes the melanoma cells.'),
        (v_case_id, 'Is this vitiligo reversible?', '["Yes, quickly","Often permanent, as the melanocytes are destroyed by T-cells","It turns into a tan","Only with surgery"]', 1, 'Like idiopathic vitiligo, it is often a permanent change.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Immunotherapy Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Immunotherapy Blisters', 'Six months into Nivolumab therapy, a patient develops extremely itchy, tense blisters on his trunk and limbs.

Vitals: Normal.
Physical Examination: Numerous large, tense bullae. DIF shows linear IgG and C3 along the BMZ.
Laboratory Results: Biopsy confirms subepidermal blister with eosinophils.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which ICPI-related skin reaction can occur many months after starting or even after stopping the drug?', '["Maculopapular rash","Bullous Pemphigoid","Hives","Acne"]', 1, 'ICPI-induced BP has a very late onset compared to other rashes.'),
        (v_case_id, 'How is severe ICPI-induced BP managed?', '["Topical steroids only","Stopping the immunotherapy and using high-dose systemic steroids or biologics (e.g., Rituximab/Omalizumab)","Giving more immunotherapy","Antibiotics"]', 1, 'Blistering is a Grade 3/4 event that requires stopping the ICPI.'),
        (v_case_id, 'Is this reaction specific to melanoma?', '["Yes","No, it can occur in any patient receiving ICPIs for any cancer type (e.g., lung, renal, bladder)","Only in women","Only in children"]', 1, 'It is a drug effect, not limited by tumor type.');

    ---------------------------------------------------------------------------
    -- CASE 43: The Halogen Nodule
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Halogen Nodule', 'A patient who has been taking a ''calming'' health supplement containing Bromide develops large, painful, vegetating plaques on her face and legs.

Vitals: Normal.
Physical Examination: Large, inflammatory, pustular nodules and plaques that look like an infection but failed to respond to antibiotics.
Laboratory Results: Biopsy shows massive epidermal hyperplasia (pseudoepitheliomatous hyperplasia) and neutrophils.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Bromoderma?', '["A fungal infection","A rare skin reaction to the ingestion of bromide-containing compounds","A type of melanoma","Sun damage"]', 1, 'Halogenodermas (Bromoderma/Iododerma) are rare but dramatic drug reactions.'),
        (v_case_id, 'What does it often mimic clinically?', '["A simple mole","Blastomycosis or Pyoderma Gangrenosum (due to the vegetating, pustular appearance)","A freckle","Nothing"]', 1, 'It is often mistaken for a deep fungal infection or cancer (SCC).'),
        (v_case_id, 'What is the primary treatment?', '["Antibiotics","Stopping the source of bromide and potentially using diuretics/saline to speed up excretion","Surgery","Radiation"]', 1, 'Identifying the hidden source (e.g., sedatives, supplements) is the most important step.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Iodide Plaque
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Iodide Plaque', 'A patient receives IV contrast for a CT scan. Two days later, he develops several small, painful pustules on his face and trunk.

Vitals: Normal.
Physical Examination: Discrete, inflammatory papulopustules. He also has some small vegetating plaques on his legs.
Laboratory Results: Patient has known renal insufficiency.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the common trigger for Iododerma?', '["Aspirin","Iodinated contrast or potassium iodide (SSKI)","Penicillin","Insulin"]', 1, 'Iodine is the causative agent.'),
        (v_case_id, 'Which patient population is at higher risk for halogenoderma?', '["Children","Patients with renal insufficiency (who cannot clear the halogen efficiently)","Athletes","Pregnant women"]', 1, 'Impaired excretion leads to higher systemic levels and skin deposition.'),
        (v_case_id, 'Is Iododerma an IgE-mediated allergy?', '["Yes","No, it is a non-immunologic toxic accumulation/sensitivity","Only in the elderly","Yes, it is like a bee sting"]', 1, 'It is a dose-related or cumulative toxicity, not an allergy.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Sweaty Palm
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sweaty Palm', 'A 30-year-old on Sertraline (SSRI) for depression complains that his hands and armpits are constantly dripping with sweat, even when he is cold.

Vitals: Normal.
Physical Examination: Visible beads of sweat on palms and soles. No other skin rash.
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which common medication class is a frequent cause of excessive sweating?', '["Antibiotics","Antidepressants (especially SSRIs and SNRIs)","Statins","Antifungals"]', 1, 'Up to 10-15% of patients on SSRIs report hyperhidrosis.'),
        (v_case_id, 'What is the mechanism for drug-induced hyperhidrosis with SSRIs?', '["Direct sweat gland stimulation","Alteration of the hypothalamic thermoregulatory set point","Allergy","Fear"]', 1, 'It is a central effect on the brain''s thermostat.'),
        (v_case_id, 'How is this side effect managed if the medication cannot be stopped?', '["Drinking less water","Anticholinergics (e.g., Glycopyrrolate) or topical aluminum chloride","Surgery","Exercise"]', 1, 'Anticholinergics can help ''dry out'' the patient.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Serpentine Veins
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Serpentine Veins', 'A patient being treated with IV 5-Fluorouracil (5-FU) for gastric cancer develops dark, linear streaks on his arms that follow the paths of his veins.

Vitals: Normal.
Physical Examination: Serpentine (snake-like) hyperpigmentation of the skin overlying the venous network where the chemotherapy was infused.
Laboratory Results: None.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which chemotherapy drug is most commonly associated with serpentine supravenous hyperpigmentation?', '["Bleomycin","5-Fluorouracil (5-FU)","Cyclophosphamide","Cisplatin"]', 1, '5-FU is the classic cause of this unique pigmentary pattern.'),
        (v_case_id, 'What is the primary management for this condition?', '["Surgery","Reassurance (it is a benign, asymptomatic side effect)","Antibiotics","Stopping all chemo"]', 1, 'It is purely a cosmetic issue and does not require stopping the life-saving chemotherapy.'),
        (v_case_id, 'Does it cause pain or inflammation of the vein (phlebitis)?', '["Yes, always","No, the vein itself is usually healthy; the pigment is in the overlying skin","Only in the elderly","Only in children"]', 1, 'It is a pigmentary change, not a thrombophlebitis.');

    ---------------------------------------------------------------------------
    -- CASE 47: The Orange-Red Scale
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Orange-Red Scale', 'A patient on Imatinib for GIST develops a widespread orange-red, scaly rash. He has small islands of normal skin within the redness.

Vitals: Normal.
Physical Examination: Follicular papules on an erythematous base. Distinct ''islands of sparing'' (normal skin) are visible. Thicker scales on the palms and soles.
Laboratory Results: Biopsy shows alternating orthokeratosis and parakeratosis.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark clinical feature of Pityriasis Rubra Pilaris (PRP)?', '["Blisters","Islands of sparing (patches of normal skin within the generalized redness)","Target lesions","Hives"]', 1, 'Islands of sparing are the classic diagnostic clue for PRP.'),
        (v_case_id, 'Which targeted cancer therapy is a known trigger for a PRP-like eruption?', '["Aspirin","Imatinib (Tyrosine Kinase Inhibitor)","Penicillin","Insulin"]', 1, 'Imatinib is one of the few drugs that can specifically trigger a PRP-like morphology.'),
        (v_case_id, 'What is the typical color of the rash in PRP?', '["Bright blue","Orange-red (salmon-colored)","Pure white","Deep black"]', 1, 'The ''salmon-colored'' or orange-red hue is very characteristic.');

    ---------------------------------------------------------------------------
    -- CASE 48: The PTU Vasculitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The PTU Vasculitis', 'A woman being treated for Graves'''' disease with Propylthiouracil (PTU) develops painful purple spots on her legs and ears.

Vitals: Normal.
Physical Examination: Palpable purpura and small necrotic ulcers on the lower extremities and ear helices.
Laboratory Results: Positive ANA and very high titers of p-ANCA (MPO).', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which medication for hyperthyroidism is a major trigger for ANCA-associated vasculitis?', '["Methimazole","Propylthiouracil (PTU)","Propranolol","Radioactive Iodine"]', 1, 'PTU is significantly more likely than methimazole to cause this serious vasculitis.'),
        (v_case_id, 'What is a common systemic complication of PTU-induced vasculitis?', '["Hair loss","Glomerulonephritis (Kidney damage)","Constipation","Hearing loss"]', 1, 'Like other ANCA vasculitides, the kidneys are a major target.'),
        (v_case_id, 'What is the first step in management?', '["Increase the PTU dose","Immediate discontinuation of PTU","Antibiotics","Apply ice"]', 1, 'The drug must be stopped immediately to prevent further organ damage.');

    ---------------------------------------------------------------------------
    -- CASE 49: The True Serum Sickness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The True Serum Sickness', 'A transplant patient receives Rabbit Antithymocyte Globulin (ATG). Seven days later, he develops high fever, joint pain, and a widespread hive-like rash.

Vitals: T 39.5 C.
Physical Examination: Urticarial plaques and morbilliform eruption. Swelling of the small joints of the hands.
Laboratory Results: Low C3 and C4 levels. Proteinuria is present.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of True Serum Sickness?', '["IgE-mediated allergy","Type III Hypersensitivity (Circulating immune complexes depositing in small vessels)","Direct mast cell release","Fungal infection"]', 1, 'Classic serum sickness involves the deposition of drug-antibody complexes.'),
        (v_case_id, 'What is a classic laboratory finding in True Serum Sickness?', '["High complement (C3/C4)","Low complement (C3/C4) due to consumption in immune complexes","Low WBC","High glucose"]', 1, 'Hypocomplementemia is a key indicator of immune complex consumption.'),
        (v_case_id, 'Which animal-derived products are modern causes of serum sickness?', '["Milk","Antivenoms and Antithymocyte Globulin (ATG)","Wool","Honey"]', 1, 'Therapeutic proteins derived from non-human sources (horses, rabbits) are the most common triggers today.');

    ---------------------------------------------------------------------------
    -- CASE 50: Drug Timelines Review
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Drug Timelines Review', 'A medical student is reviewing for the boards. She wants to know the typical timing for different drug reactions.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which reaction typically occurs within MINUTES to HOURS of exposure?', '["SJS","Urticaria/Anaphylaxis","DRESS","FDE"]', 1, 'IgE-mediated Type I reactions are immediate.'),
        (v_case_id, 'Which reaction typically occurs 2-8 WEEKS after starting a drug?', '["AGEP","DRESS Syndrome","Urticaria","FDE"]', 1, 'DRESS has a characteristically long latency.'),
        (v_case_id, 'Which reaction typically occurs 1-3 DAYS after exposure?', '["SJS","AGEP","DRESS","Melanoma"]', 1, 'AGEP is the ''fast'' delayed-type reaction.');

    RAISE NOTICE 'Finished populating 50 cases for derm-drug-reactions.';
END $$;

COMMIT;
