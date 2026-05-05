-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: Autoimmune skin conditions — pemphigus, bullous pemphigoid
-- Topic Slug: derm-autoimmune
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-autoimmune' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-autoimmune';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Fragile Mouth
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fragile Mouth', 'A 45-year-old male presents with painful mouth sores that make eating difficult. Two weeks later, he develops flaccid blisters on his chest and back that rupture easily, leaving painful erosions.

Vitals: Normal.
Physical Examination: Extensive oral erosions. Multiple flaccid bullae and large denuded areas on the trunk. Positive Nikolsky sign (lateral pressure on normal-appearing skin causes shedding).
Laboratory Results: Biopsy shows suprabasal acantholysis (row of tombstones). Direct Immunofluorescence (DIF) shows IgG and C3 in a ''chicken-wire'' or ''fishnet'' pattern.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary autoantibody target in Pemphigus Vulgaris?', '["Desmoglein 1 and 3","Desmoglein 1 only","BP180","Type VII Collagen"]', 0, 'Pemphigus vulgaris involves antibodies against Desmoglein 3 (mucosal-dominant) and often Desmoglein 1 (mucocutaneous).'),
        (v_case_id, 'Where is the site of blister formation in Pemphigus Vulgaris?', '["Subepidermal","Suprabasal (within the epidermis)","Subcutaneous","Stratum corneum"]', 1, 'Acantholysis occurs just above the basal layer, leading to flaccid blisters.'),
        (v_case_id, 'What is the first-line treatment for Pemphigus Vulgaris?', '["Topical steroids only","Systemic corticosteroids (Prednisone) often combined with Rituximab","Acyclovir","Topical Ketoconazole"]', 1, 'Aggressive immunosuppression is required to control this potentially fatal disease.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Scaly Blister
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Blister', 'A 50-year-old female presents with scaly, crusted plaques on her face and upper trunk. She does not have any mouth sores.

Vitals: Normal.
Physical Examination: Erythematous, scaly, and crusted patches in a seborrheic distribution. No mucosal involvement. Nikolsky sign is positive in the affected areas.
Laboratory Results: Biopsy shows acantholysis in the superficial epidermis (granular layer). DIF shows ''fishnet'' IgG/C3 in the superficial epidermis.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the autoantibody target in Pemphigus Foliaceus?', '["Desmoglein 3","Desmoglein 1","BP230","Laminin 332"]', 1, 'Pemphigus foliaceus specifically targets Desmoglein 1, which is found in the upper epidermis.'),
        (v_case_id, 'Why is there no mucosal involvement in Pemphigus Foliaceus?', '["Desmoglein 3 compensates for the loss of Desmoglein 1 in the mucosa","The mouth is too dry","Antibodies cannot reach the mouth","It is a viral infection"]', 0, 'Desmoglein 3 is highly expressed throughout the mucosa, maintaining adhesion even when Dsg1 is inhibited.'),
        (v_case_id, 'What is ''Fogo Selvagem''?', '["A type of spicy food","An endemic form of Pemphigus Foliaceus found in rural Brazil, linked to black fly bites","A viral wart","A type of skin cancer"]', 1, 'This is a geographically clustered variant of the disease.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Tense Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tense Blisters', 'An 80-year-old male presents with large, itchy blisters on his limbs and abdomen. He says it started as ''hives'' weeks ago.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative. Some urticarial (hive-like) plaques are present.
Laboratory Results: Biopsy shows subepidermal split with numerous eosinophils. DIF shows linear IgG and C3 along the basement membrane zone (BMZ).', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the primary targets in Bullous Pemphigoid?', '["Desmogleins","BP180 (Type XVII Collagen) and BP230","Desmoplakin","Gliadin"]', 1, 'These are components of the hemidesmosome, which anchors the epidermis to the dermis.'),
        (v_case_id, 'Why are the blisters in Bullous Pemphigoid ''tense'' while Pemphigus blisters are ''flaccid''?', '["The patient is older","BP involves a deep, subepidermal split with an intact epidermal roof, while Pemphigus involves a superficial intraepidermal split","It''s a mystery","BP has more fluid"]', 1, 'The full thickness of the epidermis forms the roof of the BP blister, making it much stronger.'),
        (v_case_id, 'What is the most common symptom preceding the appearance of blisters in BP?', '["Pain","Intense pruritus (itching)","Numbness","Fever"]', 1, 'Patients often have a ''non-bullous'' phase of intense itching and urticarial plaques.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Scarring Mouth Sights
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scarring Mouth Sights', 'A 70-year-old female complains of chronic painful mouth erosions and persistent ''red eyes''.

Vitals: Normal.
Physical Examination: Desquamative gingivitis and erosions on the buccal mucosa. Ophthalmology exam shows symblepharon (adhesion between the eyelid and the eyeball).
Laboratory Results: DIF shows linear IgG, C3, and sometimes IgA at the BMZ.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark complication of Mucous Membrane Pemphigoid?', '["Weight gain","Scarring of mucosal surfaces (which can lead to blindness or airway stenosis)","Better vision","Hair growth"]', 1, 'Scarring (cicatrization) is the defining feature and the cause of major morbidity.'),
        (v_case_id, 'Which target antigen is associated with a higher risk of solid organ malignancy in this condition?', '["BP180","Laminin 332 (Laminin 5)","BP230","Integrin"]', 1, 'Anti-Laminin 332 MMP is considered a paraneoplastic marker in some studies.'),
        (v_case_id, 'What is the Brunsting-Perry variant?', '["A type of tea","A localized form of MMP affecting the head and neck, usually without mucosal involvement, leading to scarring alopecia","A viral infection","A drug reaction"]', 1, 'This variant focuses on the skin rather than the mucous membranes.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Pregnancy Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pregnancy Rash', 'A 28-year-old woman in her third trimester develops extremely itchy blisters starting around her belly button.

Vitals: Normal.
Physical Examination: Urticarial plaques and vesicles/bullae beginning in the periumbilical region and spreading to the limbs. The face and mucosa are spared.
Laboratory Results: DIF of perilesional skin shows linear C3 along the BMZ.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What was the historical name for Pemphigoid Gestationis?', '["Prurigo","Herpes Gestationis (misleading name as it is not viral)","Diaper rash","Eczema"]', 1, 'It is an autoimmune bullous disease, not related to the herpes virus.'),
        (v_case_id, 'When does this condition typically resolve?', '["Never","Usually shortly after delivery, although ''flares'' can occur at the time of birth","Only with surgery","In the first trimester"]', 1, 'Resolution post-partum is typical, but it often recurs in subsequent pregnancies.'),
        (v_case_id, 'Is there a risk to the fetus?', '["No","Yes, there is a risk of premature birth and a small percentage of neonates may have transient blisters due to passive transfer of antibodies","Always fatal","Only to the mother"]', 1, 'The fetal risk is generally manageable but requires monitoring.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Celiac Itch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Celiac Itch', 'A 30-year-old male presents with intensely itchy, small blisters on his elbows, knees, and buttocks. He also has frequent bloating and diarrhea.

Vitals: Normal.
Physical Examination: Grouped (herpetiform) vesicles and excoriations in a symmetric distribution over extensor surfaces.
Laboratory Results: Biopsy shows subepidermal split with neutrophils in dermal papillae (microabscesses). DIF shows granular IgA deposits in the dermal papillae.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Dermatitis Herpetiformis is strongly associated with which systemic condition?', '["Diabetes","Celiac Disease (Gluten-sensitive enteropathy)","Hypertension","Lung cancer"]', 1, 'Nearly 100% of these patients have underlying celiac disease, though it may be asymptomatic.'),
        (v_case_id, 'What is the autoantigen in Dermatitis Herpetiformis?', '["Desmoglein","Epidermal Transglutaminase (TG3)","Collagen VII","Insulin"]', 1, 'IgA antibodies against transglutaminase-3 deposit in the skin.'),
        (v_case_id, 'What is the first-line pharmacologic treatment for the skin lesions?', '["Steroids","Dapsone","Penicillin","Insulin"]', 1, 'Dapsone provides rapid relief of the itch, but a gluten-free diet is the long-term solution.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Trauma Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Trauma Blisters', 'A 40-year-old male notices that minor bumps or friction on his hands and feet cause blisters that heal with scarring and small white bumps.

Vitals: Normal.
Physical Examination: Mechanobullous disease (blisters at sites of trauma), atrophic scars, and milia (small cysts) on the extensor surfaces.
Laboratory Results: DIF shows linear IgG and C3 at the BMZ. Salt-split skin study shows localization to the dermal side (floor) of the split.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the target antigen in EBA?', '["BP180","Type VII Collagen (the main component of anchoring fibrils)","Laminin 332","Desmoglein"]', 1, 'Type VII collagen anchors the basement membrane to the dermis.'),
        (v_case_id, 'How does the salt-split skin technique help diagnose EBA?', '["It identifies bacteria","In EBA, the antibodies bind to the ''floor'' (dermal side) of the artificial split; in Bullous Pemphigoid, they bind to the ''roof'' (epidermal side)","It makes the skin taste salty","It is used for eczema"]', 1, 'This distinguishes EBA from Bullous Pemphigoid when standard DIF is identical.'),
        (v_case_id, 'EBA can be associated with which inflammatory bowel disease?', '["Crohn''s Disease","IBS","Celiac","Appendicitis"]', 0, 'A significant minority of EBA patients have Crohn''s.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Ring of Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ring of Blisters', 'A 5-year-old child presents with ''strings of pearls'' blisters on her lower abdomen and groin.

Vitals: Normal.
Physical Examination: Annular (ring-shaped) erythematous plaques with a border of small vesicles (''string of pearls'').
Laboratory Results: DIF shows linear IgA along the BMZ.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common drug trigger for Linear IgA Bullous Dermatosis in adults?', '["Penicillin","Vancomycin","Aspirin","Vitamin C"]', 1, 'Vancomycin is the classic culprit for drug-induced LABD.'),
        (v_case_id, 'What is the name for this condition when it occurs in children?', '["Roseola","Chronic Bullous Disease of Childhood","Chickenpox","Impetigo"]', 1, 'This is the pediatric equivalent of the same immunopathologic process.'),
        (v_case_id, 'What is the primary target in most cases of LABD?', '["Desmoglein","A 120-kDa fragment of BP180 (LAD-1)","Gliadin","Keratin"]', 1, 'The antibodies target the shed ectodomain of BP180.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Cancer-Linked Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cancer-Linked Blisters', 'A 60-year-old patient with Non-Hodgkin Lymphoma develops severe, intractable oral ulcerations and a polymorphous rash on the body.

Vitals: Normal.
Physical Examination: Painful, extensive mucosal erosions. Skin shows targetoid lesions, blisters, and lichenoid plaques.
Laboratory Results: Indirect Immunofluorescence (IIF) shows binding to rat bladder epithelium.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common underlying malignancy associated with PNP?', '["Breast cancer","Hematologic malignancies (e.g., Non-Hodgkin Lymphoma, CLL, Castleman Disease)","Skin cancer","Colon cancer"]', 1, 'PNP is almost always associated with a B-cell lymphoproliferative disorder.'),
        (v_case_id, 'What is the sensitivity of ''rat bladder'' IIF for PNP?', '["Low","Highly specific, as rat bladder epithelium contains desmoplakins but no desmogleins, distinguishing it from classic pemphigus","Zero","Only for children"]', 1, 'Plakin antibodies are the hallmark of PNP.'),
        (v_case_id, 'What is a frequent and often fatal respiratory complication of PNP?', '["Asthma","Bronchiolitis Obliterans","Pneumonia","Lung cancer"]', 1, 'The same antibodies can attack the respiratory epithelium, leading to obstructive lung disease.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Butterfly Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Butterfly Rash', 'A 24-year-old female presents with a red rash on her cheeks and bridge of her nose that gets worse after sun exposure. She also has joint pain.

Vitals: Normal.
Physical Examination: Erythematous, confluent macules on the malar area (cheeks and nose), sparing the nasolabial folds.
Laboratory Results: Positive ANA (1:640, speckled pattern) and high Anti-dsDNA.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic distribution of the ACLE ''butterfly'' rash?', '[" Nasolabial folds are involved","Malar distribution, characteristically sparing the nasolabial folds","Only on the forehead","Only on the chin"]', 1, 'Sparing of the folds helps distinguish it from Seborrheic Dermatitis.'),
        (v_case_id, 'What is the correlation between ACLE and systemic lupus (SLE)?', '["No correlation","ACLE is almost always associated with active systemic disease","It only happens in old men","It is a fungus"]', 1, 'Unlike discoid lupus, ACLE is a strong indicator of systemic involvement.'),
        (v_case_id, 'Does ACLE typically cause scarring?', '["Yes, always","No, it is usually non-scarring, though it may leave post-inflammatory pigment changes","Only on the ears","Only in smokers"]', 1, 'Inflammation is relatively superficial compared to discoid lupus.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Ring-Shaped Sun Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ring-Shaped Sun Rash', 'A patient presents with several ring-shaped, red, scaly patches on her upper back and chest after a beach vacation.

Vitals: Normal.
Physical Examination: Annular, polycyclic erythematous plaques with a fine scale on the ''V'' of the neck and upper back.
Laboratory Results: Positive Anti-Ro (SS-A) and Anti-La (SS-B).', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which autoantibody is most characteristically associated with SCLE?', '["Anti-dsDNA","Anti-Ro (SS-A)","Anti-Scl70","Anti-Centromere"]', 1, 'Anti-Ro is positive in about 75-90% of SCLE patients.'),
        (v_case_id, 'Which medication is a common trigger for ''Drug-Induced'' SCLE?', '["Hydrochlorothiazide (HCTZ)","Aspirin","Vitamin C","Penicillin"]', 0, 'HCTZ, calcium channel blockers, and terbinafine are common culprits.'),
        (v_case_id, 'Does SCLE usually cause scarring or atrophy?', '["Yes","No, it is non-scarring and non-atrophic (distinguishing it from DLE)","Only if scratched","Always"]', 1, 'The lack of scarring is a key clinical differentiator.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Scarring Ear Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scarring Ear Spots', 'A 40-year-old male has chronic, thick, red patches on his ears and scalp that leave bald spots.

Vitals: Normal.
Physical Examination: Well-demarcated, erythematous, indurated plaques with adherent scale, follicular plugging, and central atrophy/scarring on the conchal bowls and scalp.
Laboratory Results: Biopsy shows interface dermatitis and thick basement membrane.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''follicular plugging'' in the context of DLE?', '["Hair growth","Accumulation of keratin in the hair follicles, seen as ''carpet-tack'' scale when the scale is removed","A type of wart","Pus"]', 1, 'This is a classic clinical finding in DLE.'),
        (v_case_id, 'What percentage of patients with localized DLE will go on to develop systemic lupus (SLE)?', '["100%","Approximately 5-10%","50%","0%"]', 1, 'Most DLE is skin-limited, though screening is still necessary.'),
        (v_case_id, 'What is the long-term consequence of DLE on the scalp?', '["Curly hair","Permanent scarring alopecia (cicatricial alopecia)","Better hair growth","Itching"]', 1, 'The destruction of the hair follicles leads to irreversible hair loss.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Heliotrope Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heliotrope Eyes', 'A 50-year-old female presents with weakness climbing stairs and a purple rash on her eyelids.

Vitals: Normal.
Physical Examination: Violaceous (heliotrope) erythema and edema of the eyelids. Red-purple flat-topped papules on the knuckles (Gottron papules).
Laboratory Results: Elevated Creatine Kinase (CK) and Aldolase. Positive Anti-Jo-1.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are ''Gottron Papules''?', '["Warts","Violaceous, flat-topped papules over the dorsal interphalangeal and metacarpophalangeal joints","Freckles","Blisters"]', 1, 'These are pathognomonic for dermatomyositis.'),
        (v_case_id, 'What is the ''Shawl Sign''?', '["Wearing a scarf","Erythema over the upper back and shoulders","A type of bandage","Weakness"]', 1, 'It refers to the distribution of the rash on the shoulders.'),
        (v_case_id, 'Adults with dermatomyositis have an increased risk of which systemic condition?', '["Internal malignancy (cancer screening is mandatory)","Diabetes","Glaucoma","Stroke"]', 0, 'Dermatomyositis can be a paraneoplastic syndrome in adults.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Hardened Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hardened Skin', 'A 45-year-old female complains that her fingers turn blue in the cold and the skin on her hands feels tight and ''shiny''.

Vitals: Normal.
Physical Examination: Sclerodactyly (tightening of the skin on the fingers), telangiectasias on the face, and Raynaud''s phenomenon.
Laboratory Results: Positive Anti-Centromere antibody.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''C'' in CREST stand for?', '["Cancer","Calcinosis (calcium deposits in the skin)","Cough","Cold"]', 1, 'Calcinosis cutis is a frequent finding.'),
        (v_case_id, 'What is ''Sclerodactyly''?', '["Long fingers","Tightening and thickening of the skin of the fingers, leading to a ''claw-like'' appearance","Extra fingers","Swollen fingers"]', 1, 'The skin loses its elasticity and becomes bound down.'),
        (v_case_id, 'Which antibody is most specific for the DIFFUSE form of systemic sclerosis?', '["Anti-Centromere","Anti-Scl-70 (Topoisomerase I)","Anti-Ro","Anti-Sm"]', 1, 'Anti-Centromere is for limited; Scl-70 is for diffuse disease.');

    ---------------------------------------------------------------------------
    -- CASE 15: The En Coup de Sabre
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The En Coup de Sabre', 'A 10-year-old girl has a vertical, indented line on her forehead that looks like a ''sword strike''.

Vitals: Normal.
Physical Examination: A linear, atrophic, hyperpigmented band extending from the forehead into the scalp, causing a line of hair loss.
Laboratory Results: Biopsy shows thick, homogenized collagen bundles.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name for this specific forehead presentation of linear morphea?', '["Scar","En coup de sabre (''''strike of the sword'''')","Butterfly rash","Heliotrope"]', 1, 'The French name describes the indented, linear appearance.'),
        (v_case_id, 'Does Morphea (localized scleroderma) usually involve internal organs?', '["Yes, always","No, it is typically limited to the skin and underlying tissues","Only the heart","Only the lungs"]', 1, 'Morphea is distinct from systemic sclerosis.'),
        (v_case_id, 'What is Parry-Romberg syndrome?', '["A type of fracture","Progressive hemifacial atrophy, sometimes associated with linear morphea of the face","A heart valve problem","Eye disease"]', 1, 'It involves deep atrophy of the fat and muscle on one side of the face.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Purple Wrist Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Wrist Bumps', 'A middle-aged male presents with very itchy, flat-topped, purple bumps on his wrists and shins.

Vitals: Normal.
Physical Examination: Planar, purple, polygonal, pruritic, papules/plaques (the 6 P''s). Fine white lines (Wickham striae) are visible on the surface.
Laboratory Results: Biopsy shows a ''saw-tooth'' pattern of epidermal hyperplasia.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the ''6 P''s'' of Lichen Planus?', '["Painful, Purple, Pale, Pustular, Poorly-defined, Pruritic","Planar, Purple, Polygonal, Pruritic, Papules, Plaques","Pink, Pearly, Polished, Painless, Pits, Patches","None of the above"]', 1, 'This is the classic mnemonic for LP.'),
        (v_case_id, 'What are ''Wickham Striae''?', '["Wrinkles","Fine, white, lacy lines on the surface of LP lesions or oral mucosa","Scars","Hairs"]', 1, 'They are caused by focal thickening of the granular layer.'),
        (v_case_id, 'Lichen Planus is famously associated with which chronic viral infection?', '["HIV","Hepatitis C","Herpes","HPV"]', 1, 'Patients with widespread LP should be screened for Hep C.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Painful Leg Ulcer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Leg Ulcer', 'A 40-year-old female with Ulcerative Colitis develops a small ''pimple'' on her leg that rapidly turns into a large, painful ulcer with a purple, undermined edge.

Vitals: Normal.
Physical Examination: A deep ulcer with a necrotic base and a characteristic ''overhanging'' or undermined violaceous border.
Laboratory Results: Biopsy shows a massive neutrophilic infiltrate but no infection.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is Pyoderma Gangrenosum caused by an infection?', '["Yes, bacteria","No, it is a sterile, neutrophilic dermatosis","Yes, a fungus","Yes, a virus"]', 1, 'Despite the name ''pyoderma'', it is an autoinflammatory process, not an infection.'),
        (v_case_id, 'What is ''Pathergy''?', '["Fear of paths","Development of new lesions or worsening of existing ones at the site of minor trauma (e.g., a needle stick or surgery)","A type of allergy","Healing with scars"]', 1, 'This is why debriding PG ulcers can be very dangerous.'),
        (v_case_id, 'What systemic diseases are commonly associated with Pyoderma Gangrenosum?', '["Inflammatory Bowel Disease (IBD), Rheumatoid Arthritis, and Hematologic malignancies","Diabetes and Hypertension","Asthma","Acne"]', 0, 'About 50% of cases are associated with an underlying condition.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Fever and Tender Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fever and Tender Bumps', 'A patient presents with high fever, a high white blood cell count, and sudden onset of painful, red plaques on her face and neck.

Vitals: T 39.4 C.
Physical Examination: Juicy, erythematous, edematous plaques and nodules that look like blisters but are firm (pseudovesiculation).
Laboratory Results: WBC 18,000 (Neutrophilia). Biopsy shows massive edema in the papillary dermis and dense neutrophils.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic clinical triad of Sweet''s Syndrome?', '["Fever, neutrophilia, and tender red plaques","Itch, rash, scaling","Pain, blue skin, hair loss","Cough, rash, diarrhea"]', 0, 'The symptoms are often dramatic and resemble an infection.'),
        (v_case_id, 'Sweet''s syndrome can be a sign of which underlying malignancy?', '["Breast cancer","Acute Myeloid Leukemia (AML)","Colon cancer","Brain tumor"]', 1, 'The ''Malignancy-associated'' form is often linked to AML.'),
        (v_case_id, 'How do these lesions typically respond to treatment?', '["Slowly to antibiotics","Rapidly to systemic corticosteroids","They don''t respond","Surgery is needed"]', 1, 'The response to steroids is often ''miraculous'', with fever and skin clearing in days.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Recurrent Mouth and Genital Sores
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Recurrent Mouth and Genital Sores', 'A 25-year-old male of Turkish descent has had recurrent, painful mouth ulcers for years. He now has a painful sore on his scrotum and red, blurry vision.

Vitals: Normal.
Physical Examination: Aphthous-like ulcers in the mouth and a deep ulcer on the scrotum. Ophthalmology exam shows uveitis.
Laboratory Results: Positive Pathergy test (pustule forms at the site of a sterile needle prick).', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of Behcet''s Disease?', '["Oral ulcers, genital ulcers, and uveitis (eye inflammation)","Fever, rash, joint pain","Diarrhea, rash, weight loss","None of the above"]', 0, 'This multisystem inflammatory disease is more common along the ''Silk Road''.'),
        (v_case_id, 'What is the Pathergy test?', '["A blood test","A skin test where a small pustule forms within 24-48 hours after a sterile needle prick","A breathing test","An X-ray"]', 1, 'This reflects the exaggerated neutrophilic response to trauma.'),
        (v_case_id, 'What is the most common cause of morbidity/mortality in Behcet''s?', '["Oral ulcers","Vascular involvement (aneurysms, thrombosis) or CNS involvement","Itching","Scarring"]', 1, 'Vascular ''Behcet'' is a serious complication.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Skin-Colored Rings
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Skin-Colored Rings', 'A 10-year-old girl has several non-itchy, skin-colored-to-pink rings on the back of her hands.

Vitals: Normal.
Physical Examination: Annular plaques composed of small, firm, skin-colored papules. The center of the ring is normal skin.
Laboratory Results: Biopsy shows necrobiotic granulomas (palisading granulomas).', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is the ring of Granuloma Annulare (GA) different from Tinea Corporis (fungus)?', '["GA is blue","GA has no scale (the surface is smooth), whereas Tinea has a scaly border","There is no difference","GA is only on the face"]', 1, 'The lack of scale is a critical clinical differentiator.'),
        (v_case_id, 'What is the most common association for WIDESPREAD (generalized) Granuloma Annulare in adults?', '["Diabetes mellitus","Hypertension","Asthma","Acne"]', 0, 'Localized GA is usually idiopathic, but generalized GA warrants a check for diabetes.'),
        (v_case_id, 'What is the typical management for localized GA in a child?', '["Surgery","Reassurance (most resolve spontaneously within 2 years)","Chemotherapy","Antibiotics"]', 1, 'Wait-and-see is often the best approach for asymptomatic lesions.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Diabetic Shin Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Diabetic Shin Rash', 'A 50-year-old diabetic female has a large, yellow-brown patch on her shin that has been getting thinner over time.

Vitals: Normal.
Physical Examination: A well-demarcated plaque with a waxy, yellowish center, telangiectasias, and a violaceous border. The skin in the center is atrophic.
Laboratory Results: Biopsy shows ''tiered'' granulomatous inflammation.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Necrobiosis Lipoidica is most famously associated with which disease?', '["Diabetes Mellitus","Lung cancer","Thyroid disease","Heart failure"]', 0, 'Though most diabetics do not have NL, most patients with NL have diabetes.'),
        (v_case_id, 'What is a major risk factor if the atrophic skin in the center of NL is injured?', '["It heals fast","Chronic ulceration (which is difficult to treat due to poor blood flow)","It turns into a wart","Nothing"]', 1, 'The thin, scarred skin is very fragile.'),
        (v_case_id, 'What does ''necrobiosis'' refer to histologically?', '["Living skin","Degeneration of collagen","Bacteria","Hair loss"]', 1, 'It describes the altered, ''dead-looking'' appearance of the dermal collagen.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Purple Nose (Sarcoid)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Nose (Sarcoid)', 'An African American female presents with a persistent cough and several purple, firm patches on her nose and cheeks.

Vitals: Normal.
Physical Examination: Large, violaceous, indurated plaques on the nose, cheeks, and ears (Lupus Pernio). She also has red bumps on her shins.
Laboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. Biopsy shows ''naked'' non-caseating granulomas.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Lupus Pernio'' in the context of sarcoidosis?', '["A type of lupus","Violaceous, plaque-like skin lesions on the nose/face, which is a marker for chronic, systemic sarcoidosis (especially of the respiratory tract)","A fungal infection","Frostbite"]', 1, 'The name is confusing but it is a classic sign of sarcoid.'),
        (v_case_id, 'What are ''naked'' granulomas?', '["Granulomas without clothes","Granulomas with a very thin or absent rim of surrounding lymphocytes","Granulomas that are bleeding","Pus"]', 1, 'This is a characteristic histological finding in sarcoidosis.'),
        (v_case_id, 'What is the name for the combination of Erythema Nodosum, bilateral hilar lymphadenopathy, and fever?', '["Behcet''s","Lofgren Syndrome (a benign, acute presentation of sarcoidosis)","Sweet''s","Lupus"]', 1, 'Lofgren syndrome has a very good prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 23: The White Patches
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The White Patches', 'A 20-year-old male notices white spots on his hands and around his eyes that are slowly getting larger.

Vitals: Normal.
Physical Examination: Well-demarcated, depigmented (chalk-white) macules and patches. No scale.
Laboratory Results: Wood''s lamp shows bright blue-white fluorescence.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of depigmentation in Vitiligo?', '["The fungus eats the pigment","Autoimmune destruction of melanocytes","Sunburn","Vitamin deficiency"]', 1, 'The skin has a complete absence of melanocytes in the affected areas.'),
        (v_case_id, 'Vitiligo is often associated with which other autoimmune condition?', '["Autoimmune thyroid disease (Hashimoto''s or Grave''s)","Lung cancer","Acne","Asthma"]', 0, 'Checking TSH is often part of the workup.'),
        (v_case_id, 'What is ''Poliosis''?', '["A type of poll","A localized patch of white hair (due to vitiligo affecting the hair follicle)","Losing teeth","Yellow nails"]', 1, 'Vitiligo can involve the melanocytes in the hair bulb.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Patchy Hair Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Patchy Hair Loss', 'A child suddenly develops a round, smooth bald spot on the back of his head.

Vitals: Normal.
Physical Examination: A well-demarcated, smooth, non-scaly area of hair loss. Short, broken hairs (''exclamation point'' hairs) are seen at the edges.
Laboratory Results: None.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are ''exclamation point'' hairs?', '["Hairs that look surprised","Hairs that are narrower at the base than at the tip, seen at the active border of alopecia areata","Thick hairs","Curly hairs"]', 1, 'These are a diagnostic clue for this condition.'),
        (v_case_id, 'What is the term for complete loss of scalp hair?', '["Alopecia Areata","Alopecia Totalis","Alopecia Universalis","Pattern baldness"]', 1, 'Totalis = Total scalp; Universalis = Universal (all body hair).'),
        (v_case_id, 'What is the ''swarm of bees'' on histology?', '["Literal bees","A peribulbar lymphocytic infiltrate around the hair follicle","Bacteria","A type of hive"]', 1, 'The lymphocytes attack the hair bulb like a swarm of bees.');

    ---------------------------------------------------------------------------
    -- CASE 25: The White Genital Patch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The White Genital Patch', 'An 8-year-old girl (or a postmenopausal woman) presents with intense itching in the genital area.

Vitals: Normal.
Physical Examination: Ivory-white, atrophic patches in a ''figure-eight'' distribution around the vulva and anus. The skin looks like ''crinkled cigarette paper''.
Laboratory Results: Biopsy shows epidermal atrophy and a dense band of homogenized collagen in the upper dermis.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''figure-eight'' or ''hourglass'' sign?', '["A type of watch","Involvement of both the vulvar and perianal skin in Lichen Sclerosus","A heart problem","A type of rash on the face"]', 1, 'This distribution is highly characteristic.'),
        (v_case_id, 'Lichen Sclerosus carries a small but significant risk of which cancer in the affected area?', '["Basal Cell Carcinoma","Squamous Cell Carcinoma (SCC)","Melanoma","Lymphoma"]', 1, 'Chronic inflammation and scarring can lead to SCC.'),
        (v_case_id, 'What is the first-line treatment?', '["Antibiotics","Ultrapotent topical corticosteroids (e.g., Clobetasol)","Moisturizers","Surgery"]', 1, 'Aggressive steroid treatment can prevent scarring and reduce cancer risk.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Floppy Ear
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Floppy Ear', 'A 50-year-old male presents with sudden redness and painful swelling of his right ear. He mentions that the earlobe is not affected.

Vitals: Normal.
Physical Examination: Erythema, edema, and tenderness of the auricular cartilage. The earlobe (which lacks cartilage) is spared. He also has a ''saddle-nose'' deformity from a similar previous episode.
Laboratory Results: Elevated ESR and CRP.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical clue that distinguishes Relapsing Polychondritis from auricular cellulitis?', '["The ear is blue","Relapsing polychondritis spares the earlobe (non-cartilaginous), whereas cellulitis involves it","It is not painful","It is a fungus"]', 1, 'The disease specifically targets cartilage.'),
        (v_case_id, 'What is a ''Saddle-nose'' deformity?', '["A nose like a horse","Collapse of the nasal bridge due to destruction of the nasal cartilage","A long nose","A red nose"]', 1, 'Recurrent inflammation can destroy the structural integrity of the nose.'),
        (v_case_id, 'Which serious systemic involvement can be life-threatening in this condition?', '["Skin rash","Laryngotracheal involvement (leading to airway collapse)","Itchy eyes","Yellow nails"]', 1, 'Destruction of the tracheal rings is the most dangerous complication.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Dry Eyes and Red Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dry Eyes and Red Spots', 'A 55-year-old female complains of ''grittiness'' in her eyes and a very dry mouth. She also has multiple small purple spots on her lower legs.

Vitals: Normal.
Physical Examination: Xerostomia (dry mouth) and xerophthalmia (dry eyes). Palpable purpura on the lower extremities.
Laboratory Results: Positive Anti-Ro (SS-A) and Anti-La (SS-B). Schirmer test shows decreased tear production.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the term for the dry eyes and dry mouth seen in Sjogren''s?', '["Sicca Syndrome","Sweet''s Syndrome","Sjögren''s triad","Dryness"]', 0, 'Sicca comes from the Latin word for ''dry''.'),
        (v_case_id, 'Sjogren''s syndrome carries a 44-fold increased risk of which malignancy?', '["Breast cancer","Non-Hodgkin B-cell Lymphoma (especially MALT lymphoma)","Skin cancer","Lung cancer"]', 1, 'The chronic stimulation of B-cells can lead to transformation.'),
        (v_case_id, 'What is the significance of palpable purpura in a Sjogren''s patient?', '["It is a bruise","It indicates an underlying small-vessel vasculitis (leukocytoclastic vasculitis)","It is a wart","It is normal"]', 1, 'Vasculitis is a common extra-glandular manifestation.');

    ---------------------------------------------------------------------------
    -- CASE 28: The Neonatal Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Neonatal Rash', 'A 2-week-old baby develops ring-shaped red spots on his face, especially around the eyes (''raccoon eyes''). His mother has a history of ''joint pains''.

Vitals: Normal.
Physical Examination: Annular erythematous plaques with a fine scale in a periorbital and facial distribution.
Laboratory Results: Baby and mother both positive for Anti-Ro (SS-A) antibodies. EKG shows third-degree heart block.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'NLE is caused by the transplacental transfer of which maternal antibodies?', '["Anti-dsDNA","Anti-Ro (SS-A) or Anti-La (SS-B)","Anti-Scl70","IgM"]', 1, 'Passive transfer of IgG antibodies causes the clinical features.'),
        (v_case_id, 'Which manifestation of NLE is PERMANENT and does not resolve when the maternal antibodies clear the baby''s system?', '["The skin rash","Congenital heart block (AV block)","Liver inflammation","Low platelets"]', 1, 'The rash and hematologic issues are transient; heart block is irreversible and often requires a pacemaker.'),
        (v_case_id, 'Does the mother always have a diagnosis of Lupus at the time of the baby''s birth?', '["Yes","No, many mothers are asymptomatic or undiagnosed but are found to have the antibodies upon testing","Only if she is old","Only in the winter"]', 1, 'NLE in a child is often the first clue to a mother''s underlying autoimmune status.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Cold Hands and Purple Toes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cold Hands and Purple Toes', 'A patient presents with painful, purple bumps on his fingers every winter. He also has a ''butterfly rash'' that persists throughout the year.

Vitals: Normal.
Physical Examination: Dusky, violaceous plaques on the fingertips and toes (chilblains). Malar erythema on the face.
Laboratory Results: ANA positive 1:1280.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Chilblain Lupus''?', '["Lupus caused by a virus","A form of cutaneous lupus that presents as cold-induced, painful, purple-red nodules on the acral areas (fingers, toes, ears)","Lupus of the lungs","A type of frostbite"]', 1, 'It mimics common chilblains (pernio) but is associated with SLE or DLE.'),
        (v_case_id, 'How can you distinguish chilblain lupus from regular chilblains (pernio)?', '["Regular chilblains resolve in weeks; chilblain lupus is chronic, persists through warmer months, and shows lupus-specific histology","Regular chilblains are blue","They are the same","Lupus is painless"]', 0, 'The persistence and histology are the keys.'),
        (v_case_id, 'What is ''Aicardi-Goutieres Syndrome''?', '["A type of pasta","A genetic interferonopathy that can present with severe chilblain lupus-like lesions in childhood","A heart valve problem","Eye disease"]', 1, 'This is a rare mimic that highlights the role of interferon in lupus.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Mechanic''''s Hands
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mechanic''''s Hands', 'A patient with Dermatomyositis presents with thick, cracked skin on the sides of his fingers and a chronic cough.

Vitals: Normal.
Physical Examination: Hyperkeratotic, fissured (cracked) skin on the lateral and palmar aspects of the fingers. Bibasilar crackles on lung auscultation.
Laboratory Results: Positive Anti-Jo-1 antibody. CT chest shows interstitial lung disease.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Mechanic''s Hands''?', '["Greasy hands","Thick, fissured, hyperkeratotic skin on the radial sides of the digits, resembling the hands of a manual laborer","Hand tremors","Long fingers"]', 1, 'It is a characteristic skin finding in the antisynthetase variant of dermatomyositis.'),
        (v_case_id, 'Which antibody is most famously associated with this syndrome?', '["Anti-Ro","Anti-Jo-1 (Histidyl-tRNA synthetase)","Anti-Centromere","Anti-Mi-2"]', 1, 'Jo-1 is the most common antisynthetase antibody.'),
        (v_case_id, 'What is the primary cause of mortality in patients with Antisynthetase Syndrome?', '["Skin rash","Interstitial Lung Disease (ILD)","Muscle weakness","Heart attack"]', 1, 'The lung involvement is often progressive and severe.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Clinically Amyopathic Dermatomyositis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Clinically Amyopathic Dermatomyositis', 'A 40-year-old female has a heliotrope rash and Gottron papules for 1 year. She has full strength on testing and normal muscle enzymes.

Vitals: Normal.
Physical Examination: Classic skin findings of dermatomyositis. Normal strength in the deltoids and iliopsoas.
Laboratory Results: Normal CK and Aldolase. Positive Anti-MDA5 antibody.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What defines ''Amyopathic'' Dermatomyositis?', '["No skin rash","Presence of classic skin findings without clinical or laboratory evidence of muscle disease for at least 6 months","Only muscle disease","It''s a mistake"]', 1, 'The patient has the ''derma'' but not the ''myositis''.'),
        (v_case_id, 'The Anti-MDA5 (CADM-140) antibody is associated with what dangerous complication?', '["Better skin","Rapidly progressive Interstitial Lung Disease (RP-ILD)","Hair growth","Diabetes"]', 1, 'MDA5+ patients often have relatively mild skin disease but aggressive, lethal lung disease.'),
        (v_case_id, 'What skin finding is more common in MDA5+ patients?', '["Heliotrope rash","Painful palmar papules and skin ulcerations (vasculopathy)","Scalp itching","None"]', 1, 'The antibody is associated with a distinct ''vasculopathic'' skin phenotype.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Hard Patch (Morphea)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hard Patch (Morphea)', 'A woman notices a firm, shiny patch on her abdomen that started as a purple ring.

Vitals: Normal.
Physical Examination: An oval, indurated plaque with a porcelain-white center and a violaceous (lilac) border. The hair is absent in the patch.
Laboratory Results: Biopsy shows ''squared-off'' biopsy edges due to dense, thickened collagen replacing the fat.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''lilac border'' of a morphea plaque indicate?', '["Healing","Active inflammation and expansion of the lesion","Permanent damage","Infection"]', 1, 'When the border turns brown/white, the lesion is becoming stable (quiescent).'),
        (v_case_id, 'How does the hair loss in morphea occur?', '["The patient pulls it out","The dense collagen destroys the hair follicles (scarring alopecia within the plaque)","Fungus","It''s a coincidence"]', 1, 'The sclerosis ''chokes'' the follicles.'),
        (v_case_id, 'What is the primary histological feature of morphea?', '["Pus","Thickened, ''homogenized'' collagen bundles in the dermis and loss of the eccrine glands","Bacteria","Cancer cells"]', 1, 'The glands are ''pushed up'' by the dense collagen.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Figure-Eight'' Sclerosis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Figure-Eight'' Sclerosis', 'A post-menopausal woman presents with intense itching and ''tightness'' in her genital area.

Vitals: Normal.
Physical Examination: An ivory-white, hourglass-shaped patch around the vulva and anus. There is evidence of scarring and resorption of the labia minora.
Laboratory Results: Biopsy confirms Lichen Sclerosus.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which demographic is most commonly affected by Lichen Sclerosus?', '["Teenage boys","Pre-pubertal girls and post-menopausal women","Middle-aged men","Infants"]', 1, 'There is a ''bimodal'' age distribution.'),
        (v_case_id, 'What is a significant long-term risk of untreated genital Lichen Sclerosus?', '["Better skin","Squamous Cell Carcinoma (SCC)","Diabetes","Weight loss"]', 1, 'About 3-5% of patients may develop SCC in the affected area.'),
        (v_case_id, 'What is the ''parchment paper'' sign?', '["Writing on the skin","The thin, crinkled, atrophic appearance of the skin in Lichen Sclerosus","Eating paper","None of the above"]', 1, 'The epidermis becomes extremely thin.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Mouth Mesh
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Mesh', 'A patient complains of ''white lines'' in her mouth that sting when she eats spicy food.

Vitals: Normal.
Physical Examination: A reticulated, lacy pattern of white lines (Wickham striae) on the bilateral buccal mucosa. No ulcerations are present.
Laboratory Results: Biopsy shows lichenoid interface dermatitis.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common form of Oral Lichen Planus?', '["Erosive","Reticular (white lacy lines)","Bullous","Pigmented"]', 1, 'Reticular LP is often asymptomatic and found incidentally.'),
        (v_case_id, 'How does the ''Erosive'' form of Oral LP differ?', '["It is blue","It is extremely painful and presents with bright red erosions and ulcers, often surrounded by Wickham striae","It is painless","It is not in the mouth"]', 1, 'Erosive LP has a higher risk of malignant transformation to SCC.'),
        (v_case_id, 'Can Lichen Planus affect the nails?', '["No","Yes, it can cause ''pterygium'' (cuticle growing over the nail) and even complete nail loss (anonychia)","Only with fungus","It makes them grow faster"]', 1, 'Nail LP is often aggressive and requires systemic treatment to prevent permanent loss.');

    ---------------------------------------------------------------------------
    -- CASE 35: The V-Sign Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The V-Sign Rash', 'A woman presents with a red rash on her chest and neck that appears after she spends time in the garden.

Vitals: Normal.
Physical Examination: Confluent, violaceous erythema on the lower neck and upper chest (''V-sign'').
Laboratory Results: Elevated CK and Aldolase.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''V-sign'' in dermatomyositis?', '["A hand gesture","Photosensitive erythema in the ''V'' area of the neck and chest","A type of vaccine","None of the above"]', 1, 'It is one of the characteristic ''telangiectatic'' rashes of DM.'),
        (v_case_id, 'What is the ''Holster Sign''?', '["Wearing a gun","Erythema on the lateral thighs, resembling where a holster would rest","Weakness in the legs","A type of boot"]', 1, 'This is another classic (though less frequent) sign of DM.'),
        (v_case_id, 'Dermatomyositis is associated with which abnormality of the nail folds?', '["Fungus","Periungual telangiectasia and ''ragged'' cuticles (Samitz sign)","Yellow nails","Nail biting"]', 1, 'The capillaries at the nail fold become dilated and looped.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Salt and Pepper'' Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Salt and Pepper'' Skin', 'A patient with systemic sclerosis notices that her skin is becoming dark in some areas and white in others, especially on her chest.

Vitals: Normal.
Physical Examination: Diffuse hyperpigmentation with perifollicular sparing (small spots of normal color or hypopigmentation around hair follicles), giving a ''salt and pepper'' appearance.
Laboratory Results: Positive Anti-Scl-70.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''salt and pepper'' sign in systemic sclerosis?', '["Seasoning the skin","A pattern of vitiligo-like depigmentation with sparing of the pigment around the hair follicles","A type of rash","Lice"]', 1, 'The melanocytes around the follicles are often preserved.'),
        (v_case_id, 'Where is this sign most commonly seen?', '["The palms","The upper trunk and forehead","The toes","The tongue"]', 1, 'It is a common early sign of diffuse disease.'),
        (v_case_id, 'Does this represent true vitiligo?', '["Yes","No, it is a leukoderma related to the scleroderma process, not a primary autoimmune destruction of melanocytes as in vitiligo","It is a fungus","It is a burn"]', 1, 'The mechanism of pigment loss is different.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Scarring Pemphigoid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scarring Pemphigoid', 'An elderly man presents with recurring blisters on his scalp that always leave a scar.

Vitals: Normal.
Physical Examination: Several tense bullae and multiple areas of scarring alopecia on the vertex of the scalp. No mucosal involvement.
Laboratory Results: DIF shows linear IgG at the BMZ.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the unique feature of the Brunsting-Perry variant of MMP?', '["It only affects the feet","It is limited to the skin (usually head and neck) and does NOT involve the mucous membranes","It is caused by a virus","It is not painful"]', 1, 'It is a rare, skin-limited form of scarring pemphigoid.'),
        (v_case_id, 'What is the end result of these lesions on the scalp?', '["Curly hair","Permanent scarring alopecia","Better hair growth","Itching"]', 1, 'The subepidermal split and inflammation destroy the hair bulbs.'),
        (v_case_id, 'How is it treated differently from classic Bullous Pemphigoid?', '["It isn''t","It often requires more aggressive treatment (like Dapsone or immunosuppressants) because of the risk of permanent scarring","Only with moisturizers","Surgery is first-line"]', 1, 'Preventing scarring is the primary goal.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Gluten-Free Diet Failure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Gluten-Free Diet Failure', 'A patient with Dermatitis Herpetiformis (DH) continues to have outbreaks despite being on a ''strict'' gluten-free diet for 1 month.

Vitals: Normal.
Physical Examination: New clusters of vesicles on the elbows.
Laboratory Results: Granular IgA in the dermal papillae.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How long does it typically take for a gluten-free diet to clear the skin in DH?', '["1 week","Months to years (the skin response is much slower than the intestinal response)","1 day","Never"]', 1, 'This is why Dapsone is used to bridge the gap.'),
        (v_case_id, 'What is the ''gold standard'' for the diagnosis of DH?', '["Blood test for gluten","Direct Immunofluorescence (DIF) of perilesional (normal-looking) skin","Skin scraping","X-ray"]', 1, 'DIF showing granular IgA is the definitive diagnostic test.'),
        (v_case_id, 'Why should you biopsy perilesional skin rather than the blister itself for DIF?', '["Blisters are scary","The inflammatory process in the blister destroys the IgA deposits, leading to a false-negative result","It is less painful","It is a rule"]', 1, 'Always biopsy the normal skin adjacent to a lesion for immunofluorescence.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Drug-Induced Pemphigus
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Drug-Induced Pemphigus', 'A patient being treated for Rheumatoid Arthritis with D-Penicillamine develops flaccid blisters on his trunk.

Vitals: Normal.
Physical Examination: Multiple flaccid bullae and erosions. Positive Nikolsky sign.
Laboratory Results: Biopsy shows acantholysis. DIF shows fishnet pattern.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which drug is the most classic cause of drug-induced pemphigus?', '["Aspirin","D-Penicillamine (a thiol-containing drug)","Vitamin D","Penicillin"]', 1, 'Thiol groups can interfere with desmosomal bonds.'),
        (v_case_id, 'Does drug-induced pemphigus always resolve when the drug is stopped?', '["Yes, always","No, in many cases (especially with thiol drugs), the disease becomes self-perpetuating and requires full treatment","Only in children","Only if caught early"]', 1, 'It can trigger a permanent autoimmune state.'),
        (v_case_id, 'How does it differ from drug-induced Bullous Pemphigoid?', '["One is blue","Pemphigus is intraepidermal (acantholytic); Pemphigoid is subepidermal","They are the same","One is a virus"]', 1, 'The level of the split is the key histological difference.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Lichenoid'' Drug Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lichenoid'' Drug Rash', 'A patient starts taking HCTZ for blood pressure and develops a purple, scaly rash on his arms that looks like Lichen Planus.

Vitals: Normal.
Physical Examination: Violaceous plaques, but with more scale and less Wickham striae than classic LP. It is in sun-exposed areas.
Laboratory Results: Biopsy shows interface dermatitis with eosinophils.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What histological clue suggests a ''drug-induced'' lichenoid eruption rather than idiopathic LP?', '["Pus","Presence of eosinophils and parakeratosis on biopsy","Bacteria","Hair loss"]', 1, 'Idiopathic LP characteristically lacks eosinophils.'),
        (v_case_id, 'Which common medication class is linked to this eruption?', '["Antibiotics","Antihypertensives (e.g., ACE inhibitors, Beta-blockers, Thiazides)","Vitamins","Insulin"]', 1, 'Many cardiovascular drugs are triggers.'),
        (v_case_id, 'Does Lichenoid Drug Eruption typically involve the mouth?', '["Yes, always","No, mucosal involvement is much less common than in idiopathic Lichen Planus","Only in the summer","Only if the drug is a liquid"]', 1, 'Sparing of the mucosa is a helpful clinical clue.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Chronic Bullous Disease of Childhood
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Chronic Bullous Disease of Childhood', 'A 4-year-old child develops large, itchy blisters on his groin and legs. They are arranged in a ring.

Vitals: Normal.
Physical Examination: Tense bullae in a ''cluster of jewels'' or ''string of pearls'' configuration on the lower trunk and thighs.
Laboratory Results: DIF shows linear IgA at the BMZ.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'CBDC is the pediatric variant of which adult disease?', '["Bullous Pemphigoid","Linear IgA Bullous Dermatosis (LABD)","Pemphigus","Eczema"]', 1, 'They share the same immunopathology (linear IgA).'),
        (v_case_id, 'What is the typical clinical course for most children with CBDC?', '["Lethal","Self-limited, usually resolving by puberty","Progresses to cancer","Permanent"]', 1, 'The prognosis is generally excellent.'),
        (v_case_id, 'What is the preferred first-line treatment for CBDC?', '["Topical steroids","Oral Dapsone","Antibiotics","Surgery"]', 1, 'Dapsone is very effective, but G6PD levels must be checked first.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Target'' Pemphigoid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' Pemphigoid', 'A 70-year-old patient presents with blisters that look like target lesions, similar to erythema multiforme.

Vitals: Normal.
Physical Examination: Blisters developing on target-like erythematous plaques.
Laboratory Results: DIF shows linear IgG and C3. IIF shows antibodies against BP180.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Can Bullous Pemphigoid look like Erythema Multiforme (targetoid)?', '["No","Yes, BP can be very polymorphous and mimic EM, hives, or eczema before classic blisters appear","Only in children","Only in the winter"]', 1, 'This is why BP should be in the differential for any itchy, bullous eruption in the elderly.'),
        (v_case_id, 'What is the ''localised'' form of BP?', '["BP affecting only the mouth","BP occurring in a single area, often a site of prior trauma, surgery, or radiation","BP on the toes","None of the above"]', 1, 'Localized BP is often mistaken for infection or contact dermatitis.'),
        (v_case_id, 'Why is the mortality rate for BP high in the first year (approx 20%) despite it being ''just'' a skin disease?', '["The skin is toxic","Complications of treatment (high-dose steroids) in an elderly, frail population","Skin cancer","Heart failure"]', 1, 'Infection and steroid side effects are major risks; this has led to the use of ''steroid-sparing'' agents or topical-only regimens.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Nail'' Lupus
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Nail'' Lupus', 'A patient with systemic lupus notices his cuticles are red and he has small ''splinter-like'' red lines in his nails.

Vitals: Normal.
Physical Examination: Periungual telangiectasia (dilated blood vessels at the nail fold) and splinter hemorrhages.
Laboratory Results: High-titer ANA.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are periungual telangiectasias a sign of?', '["Fungus","Underlying connective tissue disease (Lupus, Dermatomyositis, or Scleroderma)","Nail biting","Old age"]', 1, 'They reflect systemic microvascular damage.'),
        (v_case_id, 'How can you distinguish the nail fold changes of Lupus from Dermatomyositis?', '["You can''t","Lupus telangiectasias are often more ''disorganized'' or ''meandering'', while DM shows more ''dilated loops'' and ''ragged cuticles'', though they overlap significantly","Lupus is blue","DM is painless"]', 1, 'The Sammitz sign (ragged cuticles) is more characteristic of DM.'),
        (v_case_id, 'What is the significance of splinter hemorrhages in a lupus patient?', '["Trauma","Can be a sign of vasculitis or even Libman-Sacks endocarditis","Normal","Fungus"]', 1, 'In a patient with systemic disease, they are a ''red flag'' for internal involvement.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Sclero-edema of Buschke
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sclero-edema of Buschke', 'A diabetic male presents with thick, ''woody'' skin on his upper back and neck. He cannot ''pinch'' the skin.

Vitals: Normal.
Physical Examination: Non-pitting, indurated thickening of the skin on the posterior neck and upper back. The skin has a ''peau d''orange'' (orange peel) texture.
Laboratory Results: Elevated HbA1c.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Scleredema is most commonly associated with which chronic condition?', '["Hypertension","Diabetes Mellitus (Type 2, often long-standing and poorly controlled)","Asthma","Acne"]', 1, 'The ''Scleredema adultorum of Buschke'' is a classic diabetic dermatosis.'),
        (v_case_id, 'How does Scleredema differ from Scleroderma (Systemic Sclerosis)?', '["One is blue","Scleredema spares the hands and feet and lacks Raynaud''s phenomenon, both of which are central to Scleroderma","They are the same","Scleredema is a virus"]', 1, 'The lack of acral involvement is a key clinical differentiator.'),
        (v_case_id, 'What is the histologic finding in Scleredema?', '["Pus","A markedly thickened dermis with large ''spaces'' between collagen bundles filled with mucin (glycosaminoglycans)","Bacteria","Cancer"]', 1, 'The ''swelling'' of the collagen with mucin causes the thickness.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Parry-Romberg Atrophy
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Parry-Romberg Atrophy', 'An 8-year-old girl has one side of her face ''sinking in''. The skin is thin and the underlying muscle seems to be disappearing.

Vitals: Normal.
Physical Examination: Severe atrophy of the skin, subcutaneous fat, and muscle on the left side of the face. A faint ''en coup de sabre'' line is visible on the forehead.
Laboratory Results: MRI shows brain atrophy on the same side.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Parry-Romberg Syndrome?', '["A type of fracture","Progressive hemifacial atrophy, often considered a severe, deep-tissue variant of linear morphea","A heart problem","Eye disease"]', 1, 'It goes much deeper than the skin.'),
        (v_case_id, 'Which tissues are affected in this syndrome?', '["Skin only","Skin, fat, muscle, and sometimes even the underlying bone","Only the hair","Only the eyes"]', 1, 'It is a devastating pan-atrophic process.'),
        (v_case_id, 'What is a common associated neurological finding?', '["Better memory","Ipsilateral epilepsy (seizures) or brain calcifications","Deafness","Blindness"]', 1, 'The process can involve the underlying central nervous system.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Scleromyxedema (Multiple Myeloma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scleromyxedema (Multiple Myeloma)', 'A 60-year-old male has hundreds of tiny, firm, waxy bumps in a row on his arms and a very stiff face (Leonine facies).

Vitals: Normal.
Physical Examination: 2-3 mm dome-shaped, waxy papules in linear arrays (''string of beads''). The skin is generally thickened and the face appears ''lion-like''.
Laboratory Results: Serum Protein Electrophoresis (SPEP) shows an IgG-lambda monoclonal gammopathy.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Scleromyxedema is almost always associated with which plasma cell disorder?', '["None","Monoclonal Gammopathy of Undetermined Significance (MGUS), usually IgG-lambda","Leukemia","Anemia"]', 1, 'The association with a paraprotein is a diagnostic requirement.'),
        (v_case_id, 'What is ''Leonine Facies''?', '["A happy face","A ''lion-like'' appearance of the face due to deep furrows and massive thickening of the skin","A face with whiskers","None of the above"]', 1, 'It is also seen in Lepromatous Leprosy and some lymphomas.'),
        (v_case_id, 'What is the primary histological finding?', '["Pus","Triad of: diffuse mucin deposition, fibroblast proliferation, and fibrosis","Bacteria","Cancer"]', 1, 'The fibroblasts are stimulated by the paraprotein (though the exact mechanism is debated).');

    ---------------------------------------------------------------------------
    -- CASE 47: The Rowell Syndrome
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rowell Syndrome', 'A patient with systemic lupus develops targetoid lesions that look like Erythema Multiforme (EM), but her labs show specific lupus markers.

Vitals: Normal.
Physical Examination: Classic malar rash plus targetoid, EM-like plaques on the limbs.
Laboratory Results: Positive ANA, Anti-Ro (SS-A), and a speckled pattern of IIF.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Rowell Syndrome?', '["A type of flu","The occurrence of Erythema Multiforme-like lesions in the setting of Lupus Erythematosus (usually with positive Anti-Ro)","A bone disease","A heart problem"]', 1, 'It represents a specific immunologic overlap.'),
        (v_case_id, 'How does it differ from regular Erythema Multiforme?', '["It doesn''t","It is chronic, associated with lupus antibodies (Ro/La), and lacks the usual EM triggers like Herpes or Mycoplasma","It is blue","It is painless"]', 1, 'The clinical context and labs define the syndrome.'),
        (v_case_id, 'Is it common?', '["Yes","No, it is a rare and somewhat controversial entity","Only in the winter","Only in children"]', 1, 'Many dermatologists debate whether it is a distinct syndrome or just SCLE mimicking EM.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Lupus Panniculitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lupus Panniculitis', 'A woman with Lupus develops deep, painful ''dents'' on her upper arms and thighs after the skin was initially red and lumpy.

Vitals: Normal.
Physical Examination: Indurated, erythematous plaques that progress to deep, cup-shaped areas of fat loss (atrophy).
Laboratory Results: Biopsy shows a lobular panniculitis with ''lymphoid follicles''.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Lupus Profundus?', '["Lupus of the lungs","A form of lupus that affects the subcutaneous fat (panniculitis), leading to deep scarring and atrophy","Lupus of the brain","Superficial lupus"]', 1, 'It is a deep-seated inflammatory process.'),
        (v_case_id, 'Where are the most common sites for this condition?', '["The palms","Proximal extremities (upper arms, thighs) and buttocks","The toes","The tongue"]', 1, 'Fat-rich areas are the primary targets.'),
        (v_case_id, 'Does it always occur in patients with systemic lupus?', '["Yes","No, it can be a manifestation of either DLE or SLE, or occur in isolation","Only in the elderly","Only in smokers"]', 1, 'It is a cutaneous variant that may or may not have systemic links.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Anti-Synthetase Lung
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Anti-Synthetase Lung', 'A patient with a mild rash on her hands presents with severe shortness of breath and ''velcro crackles'' on lung exam.

Vitals: T 37.2 C, RR 24, O2 Sat 90% on room air.
Physical Examination: Mechanic''s hands (scaly, cracked skin). Minimal proximal muscle weakness.
Laboratory Results: Positive Anti-Jo-1. PFTs show a restrictive pattern.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is this patient''s prognosis concerning?', '["The hand rash is itchy","Anti-Jo-1 is associated with severe Interstitial Lung Disease (ILD) which may not respond well to steroids alone","She might get a cold","The rash will scar"]', 1, 'Lung disease is the primary driver of mortality in this group.'),
        (v_case_id, 'Besides Jo-1 and Mechanic''s Hands, what is the third ''classic'' feature of this syndrome?', '["Weight gain","Raynaud''s phenomenon and Inflammatory Arthritis","Blindness","Hearing loss"]', 1, 'The syndrome involves a constellation of autoimmune features.'),
        (v_case_id, 'What is the best initial imaging for suspected ILD in this patient?', '["Standard Chest X-ray","High-Resolution CT (HRCT) of the chest","Ultrasound","PET scan"]', 1, 'HRCT is much more sensitive than X-ray for early ILD.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Lichen Planopilaris
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lichen Planopilaris', 'A woman presents with patches of hair loss that feel ''rough'' and ''itchy''.

Vitals: Normal.
Physical Examination: Small, red, scaly papules at the base of hair follicles (perifollicular erythema and scale) at the edge of expanding bald spots. The center is smooth and lacks follicles.
Laboratory Results: Biopsy shows lichenoid inflammation around the hair bulge.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Lichen Planopilaris?', '["A fungal infection","Follicular variant of Lichen Planus that leads to permanent scarring alopecia","A type of wart","Patterns of baldness"]', 1, 'The inflammation destroys the stem cells in the hair bulge.'),
        (v_case_id, 'What is Graham-Little-Piccardi-Lassueur Syndrome?', '["A type of cheese","A triad of: scalp LPP, non-scarring alopecia of the axillae/pubis, and lichenoid papules on the body","A heart problem","None of the above"]', 1, 'This is a rare variant of Lichen Planus.'),
        (v_case_id, 'How does LPP differ from Alopecia Areata?', '["Areata is blue","LPP is a scarring alopecia (the follicles are gone); Areata is non-scarring (the follicles are asleep and can regrow)","They are the same","LPP is only in men"]', 1, 'Checking for follicular orifices is the key clinical step.');

    RAISE NOTICE 'Finished populating 50 cases for derm-autoimmune.';
END $$;

COMMIT;
