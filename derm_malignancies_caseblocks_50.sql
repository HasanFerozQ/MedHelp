-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: Skin malignancies — melanoma, BCC, SCC
-- Topic Slug: derm-malignancies
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-malignancies';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, consistent upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: Nodular Basal Cell Carcinoma (BCC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pearly Papule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pearly Papule', 'A 65-year-old fair-skinned male presents with a non-healing bump on his nose that has been present for 6 months. He notes it bleeds occasionally when he towels his face.

Vitals: Normal.
Physical Examination: A 6mm shiny, pearly, flesh-colored papule on the right nasal ala. Central ulceration (''rodent ulcer'') and prominent arborizing telangiectasias are visible under magnification.
Laboratory Results: Biopsy shows islands of basaloid cells with peripheral palisading and retraction artifact.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old fair-skinned male presents with a non-healing bump on his nose that has been present for 6 months. He notes it bleeds occasionally when he towels his face.

Vitals: Normal.
Physical Examination: A 6mm shiny, pearly, flesh-colored papule on the right nasal ala. Central ulceration (''rodent ulcer'') and prominent arborizing telangiectasias are visible under magnification.
Laboratory Results: Biopsy shows islands of basaloid cells with peripheral palisading and retraction artifact.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common clinical subtype of Basal Cell Carcinoma?', '["Superficial","Nodular","Morpheaform","Pigmented"]', 1, 'Nodular BCC is the most common subtype, classically presenting as a pearly papule with telangiectasias on sun-exposed areas.'),
        (v_case_id, 'Which histological feature is characteristic of BCC?', '["Keratin pearls","Peripheral palisading of nuclei","Decentering of melanocytes","S-100 positivity"]', 1, 'Basaloid islands with peripheral palisading and a specialized stroma with retraction artifact are hallmark pathologic findings.'),
        (v_case_id, 'What is the primary risk factor for developing BCC?', '["Chronic arsenic exposure","Intermittent intense UV radiation and fair skin type","Human Papillomavirus (HPV)","Ionizing radiation only"]', 1, 'UV radiation (especially UVB) is the primary driver. Fair-skinned individuals (Fitzpatrick I-II) are at highest risk.');

    ---------------------------------------------------------------------------
    -- CASE 02: Superficial Basal Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Eczema that Didn''t Quit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Eczema that Didn''t Quit', 'A 55-year-old woman presents with a red, scaly patch on her upper back. She has been treating it with over-the-counter hydrocortisone for 3 months without improvement.

Vitals: Normal.
Physical Examination: A 1.5 cm well-demarcated, thin, erythematous scaly plaque. It lacks the pearly border of a typical nodule.
Laboratory Results: Shave biopsy reveals budding of basaloid cells from the epidermis into the superficial dermis.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old woman presents with a red, scaly patch on her upper back. She has been treating it with over-the-counter hydrocortisone for 3 months without improvement.

Vitals: Normal.
Physical Examination: A 1.5 cm well-demarcated, thin, erythematous scaly plaque. It lacks the pearly border of a typical nodule.
Laboratory Results: Shave biopsy reveals budding of basaloid cells from the epidermis into the superficial dermis.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which subtype of BCC is most likely to be confused with eczema or psoriasis?', '["Nodular","Superficial","Infiltrative","Morpheaform"]', 1, 'Superficial BCC presents as a scaly, red plaque and is frequently misdiagnosed as an inflammatory dermatosis.'),
        (v_case_id, 'On which body site is Superficial BCC most commonly found?', '["Nose","Trunk and extremities","Palms","Scalp"]', 1, 'Unlike nodular BCC which favors the face, superficial BCC is very common on the trunk.'),
        (v_case_id, 'What is a viable non-surgical treatment option for this specific superficial lesion?', '["Systemic chemotherapy","Topical 5-fluorouracil or Imiquimod","Oral isotretinoin","Topical antifungal"]', 1, 'Topical field therapies like Imiquimod or 5-FU are FDA-approved and effective for superficial BCC.');

    ---------------------------------------------------------------------------
    -- CASE 03: Pigmented Basal Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dark Non-Melanoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dark Non-Melanoma', 'A 70-year-old male presents with a dark spot on his cheek. He is concerned about melanoma.

Vitals: Normal.
Physical Examination: A 5mm brown-to-black pigmented papule. On dermoscopy, large blue-gray ovoid nests and leaf-like structures are seen. No pigment network is present.
Laboratory Results: Biopsy confirms BCC with heavy melanin deposition.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male presents with a dark spot on his cheek. He is concerned about melanoma.

Vitals: Normal.
Physical Examination: A 5mm brown-to-black pigmented papule. On dermoscopy, large blue-gray ovoid nests and leaf-like structures are seen. No pigment network is present.
Laboratory Results: Biopsy confirms BCC with heavy melanin deposition.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Pigmented BCC is most common in which population?', '["Fitzpatrick Type I","Individuals with darker skin phototypes (Fitzpatrick IV-VI)","Children","Albino patients"]', 1, 'While rare in Caucasians, pigmented BCC is a common presentation of BCC in darker-skinned individuals.'),
        (v_case_id, 'Which dermoscopic finding is highly suggestive of pigmented BCC rather than melanoma?', '["Atypical pigment network","Leaf-like areas and large blue-gray ovoid nests","Pseudopods","Regression structures"]', 1, 'Leaf-like areas, spoke-wheel structures, and blue-gray ovoid nests are specific for BCC.'),
        (v_case_id, 'Does pigmentation change the prognosis of BCC?', '["Yes, it is more aggressive","No, the biological behavior is similar to the nodular subtype","Yes, it frequently metastasizes","It is always benign"]', 1, 'The presence of pigment does not inherently change the biological behavior of the underlying BCC subtype.');

    ---------------------------------------------------------------------------
    -- CASE 04: Morpheaform (Sclerosing) Basal Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Subtle Scar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Subtle Scar', 'A 45-year-old female presents with what she describes as a ''white scar'' on her temple, though she recalls no injury there.

Vitals: Normal.
Physical Examination: An ill-defined, indurated, ivory-white plaque that looks like a small area of localized scleroderma. The borders are difficult to palpate.
Laboratory Results: Biopsy shows narrow strands and cords of basaloid cells embedded in a dense, fibrotic stroma.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female presents with what she describes as a ''white scar'' on her temple, though she recalls no injury there.

Vitals: Normal.
Physical Examination: An ill-defined, indurated, ivory-white plaque that looks like a small area of localized scleroderma. The borders are difficult to palpate.
Laboratory Results: Biopsy shows narrow strands and cords of basaloid cells embedded in a dense, fibrotic stroma.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the Morpheaform subtype of BCC considered particularly dangerous?', '["It grows very fast","It has high metastatic potential","It is clinically subtle with extensive subclinical spread, making surgical margins difficult to determine","It is painful"]', 2, 'The ''iceberg'' nature of morpheaform BCC often leads to large surgical defects because the tumor extends far beyond its visible clinical borders.'),
        (v_case_id, 'What is the preferred surgical management for this subtype of BCC on the face?', '["Wide local excision (2cm margins)","Mohs Micrographic Surgery","Cryosurgery","Curettage and electrodesiccation"]', 1, 'Mohs surgery is indicated for aggressive subtypes (morpheaform, infiltrative) and high-risk locations (face) to ensure clear margins while sparing tissue.'),
        (v_case_id, 'What is the classic histological description of Morpheaform BCC?', '["Large nests with palisading","Single-file ''Indian-filing'' cells","Narrow ''finger-like'' strands of basaloid cells in a dense ''desmoplastic'' stroma","Squamous eddies"]', 2, 'The dense fibrous stroma gives it the scar-like (morpheaform) clinical appearance.');

    ---------------------------------------------------------------------------
    -- CASE 05: Gorlin Syndrome (Nevoid Basal Cell Carcinoma Syndrome)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Multiple BCC Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Multiple BCC Syndrome', 'A 20-year-old male presents with dozens of BCCs on his face and trunk. He also has odontogenic keratocysts of the jaw and palmar pits.

Vitals: Normal.
Physical Examination: Multiple BCCs of varying sizes. Tiny ''pits'' on the palms and soles. Frontal bossing and hypertelorism.
Laboratory Results: X-ray shows bifid ribs and calcification of the falx cerebri.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old male presents with dozens of BCCs on his face and trunk. He also has odontogenic keratocysts of the jaw and palmar pits.

Vitals: Normal.
Physical Examination: Multiple BCCs of varying sizes. Tiny ''pits'' on the palms and soles. Frontal bossing and hypertelorism.
Laboratory Results: X-ray shows bifid ribs and calcification of the falx cerebri.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which gene mutation is responsible for Gorlin Syndrome?', '["PTCH1 (Patched)","BRAF","p53","CDKN2A"]', 0, 'Mutations in PTCH1 lead to constitutive activation of the Hedgehog signaling pathway.'),
        (v_case_id, 'What is a classic skeletal finding in Gorlin Syndrome?', '["Osteosarcoma","Bifid ribs","Vertebral fusion","Short stature"]', 1, 'Skeletal anomalies like bifid ribs and kyphoscoliosis are major/minor criteria for the syndrome.'),
        (v_case_id, 'Which treatment modality should be AVOIDED in Gorlin Syndrome patients if possible?', '["Surgical excision","Radiation therapy","Photodynamic therapy","Topical retinoids"]', 1, 'Radiation therapy can induce an explosive eruption of hundreds of new BCCs within the radiation field in these genetically susceptible individuals.');

    ---------------------------------------------------------------------------
    -- CASE 06: Locally Advanced BCC (Hedgehog Inhibitors)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Advanced BCC Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Advanced BCC Management', 'A 75-year-old patient has a massive, locally invasive BCC of the scalp that has eroded into the calvarium. It is deemed non-resectable by the surgical team.

Vitals: Normal.
Physical Examination: Large, ulcerated, fungating mass on the scalp with bone exposure.
Laboratory Results: Biopsy confirms BCC.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old patient has a massive, locally invasive BCC of the scalp that has eroded into the calvarium. It is deemed non-resectable by the surgical team.

Vitals: Normal.
Physical Examination: Large, ulcerated, fungating mass on the scalp with bone exposure.
Laboratory Results: Biopsy confirms BCC.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the target of the medication Vismodegib?', '["VEGF","SMO (Smoothened) in the Hedgehog pathway","PD-1","CTLA-4"]', 1, 'Vismodegib is a small molecule inhibitor of SMO, blocking the overactive Hedgehog pathway in BCC.'),
        (v_case_id, 'What is a common, treatment-limiting side effect of Vismodegib?', '["Hypertension","Muscle cramps, dysgeusia (loss of taste), and alopecia","Diarrhea","Kidney stones"]', 1, 'Muscle cramps and taste disturbances are very common and often lead to patients discontinuing the drug.'),
        (v_case_id, 'When is Vismodegib indicated?', '["For all nodular BCCs","For metastatic or locally advanced BCC that is not amenable to surgery or radiation","As first-line for superficial BCC","For melanoma"]', 1, 'It is reserved for advanced disease where local therapies have failed or are impossible.');

    ---------------------------------------------------------------------------
    -- CASE 07: Actinic Keratosis (AK)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rough Spot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rough Spot', 'A 70-year-old fair-skinned male presents with multiple rough, sandpaper-like spots on his bald scalp.

Vitals: Normal.
Physical Examination: Multiple 3-5 mm erythematous, gritty, scaly papules on the scalp and ears. They are better felt than seen.
Laboratory Results: Biopsy shows partial-thickness epidermal dysplasia with ''flag sign'' (alternating orthokeratosis and parakeratosis).', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old fair-skinned male presents with multiple rough, sandpaper-like spots on his bald scalp.

Vitals: Normal.
Physical Examination: Multiple 3-5 mm erythematous, gritty, scaly papules on the scalp and ears. They are better felt than seen.
Laboratory Results: Biopsy shows partial-thickness epidermal dysplasia with ''flag sign'' (alternating orthokeratosis and parakeratosis).', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Actinic Keratosis is a precursor to which malignancy?', '["BCC","Squamous Cell Carcinoma (SCC)","Melanoma","Merkel Cell Carcinoma"]', 1, 'AK is considered an intraepithelial (pre-cancerous) stage of SCC.'),
        (v_case_id, 'What is the ''flag sign'' in AK pathology?', '["Red, white, and blue staining","Alternating areas of parakeratosis (over dysplastic cells) and orthokeratosis (over normal cells)","Peripheral palisading","Melanin incontinence"]', 1, 'The ''flag sign'' reflects the skip-like nature of the dysplasia.'),
        (v_case_id, 'What is the concept of ''field cancerization'' in AK management?', '["The cancer spreads like a field","The entire sun-damaged area contains subclinical genetic damage and is at risk for multiple future cancers, justifying treatments like topical 5-FU for the whole area","It only affects farmers","It requires soil analysis"]', 1, 'Field therapy treats both visible AKs and the surrounding ''field'' of sun-damaged skin.');

    ---------------------------------------------------------------------------
    -- CASE 08: Bowen''s Disease (SCC In-Situ)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SCC In-Situ' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SCC In-Situ', 'A 60-year-old woman presents with a slow-growing, 2 cm, well-demarcated, scaly red plaque on her left lower leg. It looks like a patch of fixed psoriasis.

Vitals: Normal.
Physical Examination: Sharply demarcated, erythematous, scaly plaque on the pretibial area.
Laboratory Results: Biopsy shows full-thickness epidermal dysplasia without invasion into the dermis. Windblown (disorganized) appearance of keratinocytes.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman presents with a slow-growing, 2 cm, well-demarcated, scaly red plaque on her left lower leg. It looks like a patch of fixed psoriasis.

Vitals: Normal.
Physical Examination: Sharply demarcated, erythematous, scaly plaque on the pretibial area.
Laboratory Results: Biopsy shows full-thickness epidermal dysplasia without invasion into the dermis. Windblown (disorganized) appearance of keratinocytes.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the definition of SCC in-situ?', '["Cancer that has spread to lymph nodes","Full-thickness dysplasia confined to the epidermis","A deep invasive tumor","A benign growth"]', 1, 'In-situ means ''in its original place,'' meaning the basement membrane is still intact.'),
        (v_case_id, 'What is the term for Bowen''s disease occurring on the glans penis?', '["Queyrat''s erythroplasia","Balanitis xerotica obliterans","Pearly penile papules","Fordyce spots"]', 0, 'Erythroplasia of Queyrat is the specific term for mucosal SCC in-situ of the glans.'),
        (v_case_id, 'What is the risk of progression to invasive SCC in untreated Bowen''s disease?', '["0%","Approximately 3-5%","90%","100%"]', 1, 'The risk is relatively low but real, necessitating treatment.');

    ---------------------------------------------------------------------------
    -- CASE 09: Invasive Squamous Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Invasive Growth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Invasive Growth', 'A 75-year-old male smoker presents with a rapidly growing, painful, ulcerated nodule on his lower lip.

Vitals: Normal.
Physical Examination: A 1.2 cm firm, erythematous, hyperkeratotic nodule with a central ulcer on the vermilion border of the lower lip.
Laboratory Results: Biopsy shows nests of atypical keratinocytes invading the dermis, with keratin pearls.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male smoker presents with a rapidly growing, painful, ulcerated nodule on his lower lip.

Vitals: Normal.
Physical Examination: A 1.2 cm firm, erythematous, hyperkeratotic nodule with a central ulcer on the vermilion border of the lower lip.
Laboratory Results: Biopsy shows nests of atypical keratinocytes invading the dermis, with keratin pearls.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which site for SCC has a higher risk of metastasis?', '["Sun-exposed cheek","Lower lip or ear","Trunk","Forearm"]', 1, 'SCCs on the lip and ear have a higher metastatic rate (approx 10%) compared to SCCs arising in AKs on the face (approx 1%).'),
        (v_case_id, 'What is a keratin pearl?', '["A piece of jewelry","Concentric layers of squamous cells with central keratinization within the dermis","A fungal spore","A calcified follicle"]', 1, 'Keratin pearls indicate that the malignant cells are still attempting to differentiate into mature squamous cells.'),
        (v_case_id, 'Which patient population has a 65-100 fold increased risk of developing SCC?', '["Diabetics","Organ transplant recipients on chronic immunosuppression","Patients with hypertension","Pregnant women"]', 1, 'Immunosuppression drastically increases the risk of SCC, and these tumors are often more aggressive.');

    ---------------------------------------------------------------------------
    -- CASE 10: Keratoacanthoma (KA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapid Crater' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapid Crater', 'A 60-year-old male presents with a large, unsightly bump on his hand that appeared and grew to 2 cm in just 4 weeks.

Vitals: Normal.
Physical Examination: A symmetric, dome-shaped nodule with a central, prominent keratinous plug (''volcano-like'').
Laboratory Results: Biopsy shows a well-differentiated squamous proliferation with a central crater.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male presents with a large, unsightly bump on his hand that appeared and grew to 2 cm in just 4 weeks.

Vitals: Normal.
Physical Examination: A symmetric, dome-shaped nodule with a central, prominent keratinous plug (''volcano-like'').
Laboratory Results: Biopsy shows a well-differentiated squamous proliferation with a central crater.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic clinical course of a Keratoacanthoma?', '["Slow growth over years","Rapid growth (weeks) followed by a period of stability and potential spontaneous involution","It never stops growing","It only occurs in children"]', 1, 'KAs are known for their explosive growth followed by slow regression, leaving a scar.'),
        (v_case_id, 'How are KAs currently classified by most dermatopathologists?', '["As benign cysts","As a well-differentiated variant of Squamous Cell Carcinoma","As viral warts","As melanocytic lesions"]', 1, 'Because they can be histologically indistinguishable from invasive SCC, they are usually treated as SCCs.'),
        (v_case_id, 'Multiple Keratoacanthomas are associated with which syndrome?', '["Gorlin syndrome","Muir-Torre syndrome","Ferguson-Smith or Grzybowski types","Cowden syndrome"]', 2, 'Ferguson-Smith features multiple KAs that resolve, while Grzybowski involves thousands of eruptive KAs.');

    ---------------------------------------------------------------------------
    -- CASE 11: Marjolin''s Ulcer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cancer in the Scar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cancer in the Scar', 'A 50-year-old male presents with a non-healing, enlarging ulcer within a large burn scar on his leg that he sustained 20 years ago.

Vitals: Normal.
Physical Examination: A chronic ulcer with rolled, everted edges arising within an area of extensive scarring and skin graft.
Laboratory Results: Biopsy shows invasive SCC.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male presents with a non-healing, enlarging ulcer within a large burn scar on his leg that he sustained 20 years ago.

Vitals: Normal.
Physical Examination: A chronic ulcer with rolled, everted edges arising within an area of extensive scarring and skin graft.
Laboratory Results: Biopsy shows invasive SCC.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Marjolin''s ulcer?', '["A stomach ulcer","An SCC arising in an area of chronic inflammation, trauma, or scarring (e.g., burn scar, osteomyelitis sinus tract)","A viral ulcer","A pressure sore"]', 1, 'The term specifically refers to malignancy arising in chronically damaged skin.'),
        (v_case_id, 'What is true about the metastatic potential of Marjolin''s ulcers compared to typical cutaneous SCC?', '["It is lower","It is significantly higher (often 20-30%)","It never metastasizes","It is the same"]', 1, 'SCCs arising in scars or chronic ulcers are much more aggressive and prone to early metastasis.'),
        (v_case_id, 'What is the best management?', '["Topical antibiotics","Wide surgical excision with lymph node assessment","Wait and see","Daily bandages"]', 1, 'Aggressive surgical intervention is required due to the high risk of spread.');

    ---------------------------------------------------------------------------
    -- CASE 12: Xeroderma Pigmentosum (XP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Child with Early Cancers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Child with Early Cancers', 'An 8-year-old child presents with multiple BCCs and SCCs on his face. His parents report he is extremely sensitive to the sun and develops severe burns easily.

Vitals: Normal.
Physical Examination: Marked poikiloderma (mottled pigmentation, atrophy, telangiectasias) on sun-exposed areas. Multiple skin cancers.
Laboratory Results: DNA analysis shows a defect in nucleotide excision repair.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-year-old child presents with multiple BCCs and SCCs on his face. His parents report he is extremely sensitive to the sun and develops severe burns easily.

Vitals: Normal.
Physical Examination: Marked poikiloderma (mottled pigmentation, atrophy, telangiectasias) on sun-exposed areas. Multiple skin cancers.
Laboratory Results: DNA analysis shows a defect in nucleotide excision repair.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying defect in Xeroderma Pigmentosum?', '["Vitamin D deficiency","Defective nucleotide excision repair (NER) of UV-induced DNA damage (thymine dimers)","Too much melanin","Melanocyte absence"]', 1, 'XP patients cannot repair the DNA damage caused by UV light, leading to a 10,000-fold increase in skin cancer risk.'),
        (v_case_id, 'What is the most common cause of death in XP patients?', '["Infection","Metastatic skin cancer (Melanoma or SCC)","Heart failure","Renal failure"]', 1, 'Despite rigorous sun protection, many succumb to multiple, aggressive skin malignancies.'),
        (v_case_id, 'What other organ system is frequently involved in XP?', '["Endocrine","Neurological (progressive neurodegeneration in some types)","Gastrointestinal","Hematological"]', 1, 'Neurological abnormalities occur in about 20-30% of patients.');

    ---------------------------------------------------------------------------
    -- CASE 13: Superficial Spreading Melanoma (SSM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Changing Mole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Changing Mole', 'A 40-year-old female presents with a mole on her calf that has become darker and larger over the past 6 months. It occasionally itches.

Vitals: Normal.
Physical Examination: A 7mm asymmetric, irregularly bordered plaque with multiple shades of brown and black. No ulceration.
Laboratory Results: Excisional biopsy is performed.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old female presents with a mole on her calf that has become darker and larger over the past 6 months. It occasionally itches.

Vitals: Normal.
Physical Examination: A 7mm asymmetric, irregularly bordered plaque with multiple shades of brown and black. No ulceration.
Laboratory Results: Excisional biopsy is performed.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common subtype of melanoma in Caucasians?', '["Lentigo maligna","Nodular","Superficial Spreading","Acral lentiginous"]', 2, 'SSM accounts for approximately 70% of all melanomas.'),
        (v_case_id, 'What are the ABCDEs of melanoma?', '["Ache, Bleed, Color, Depth, Edge","Asymmetry, Border irregularity, Color variegation, Diameter >6mm, Evolving","Appearance, Benign, Cancer, Dark, Even","Always, Be, Careful, During, Exams"]', 1, 'These are the classic clinical warning signs for a melanocytic lesion.'),
        (v_case_id, 'What is the recommended initial biopsy technique for a suspicious melanocytic lesion?', '["Superficial shave biopsy","Narrow-margin excisional biopsy (to the fat)","Punch biopsy of the darkest part","Fine needle aspiration"]', 1, 'Excisional biopsy is preferred to allow the pathologist to determine the full Breslow depth, which is critical for staging.');

    ---------------------------------------------------------------------------
    -- CASE 14: Nodular Melanoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Growing Bump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Growing Bump', 'A 50-year-old male presents with a rapidly growing, dark blue-black bump on his arm. He says it appeared out of nowhere 2 months ago.

Vitals: Normal.
Physical Examination: A 1 cm firm, symmetric, blue-black dome-shaped nodule. No preceding flat patch.
Laboratory Results: Biopsy shows a thick tumor with a Breslow depth of 4.5 mm. High mitotic rate.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male presents with a rapidly growing, dark blue-black bump on his arm. He says it appeared out of nowhere 2 months ago.

Vitals: Normal.
Physical Examination: A 1 cm firm, symmetric, blue-black dome-shaped nodule. No preceding flat patch.
Laboratory Results: Biopsy shows a thick tumor with a Breslow depth of 4.5 mm. High mitotic rate.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What defines Nodular Melanoma compared to other subtypes?', '["It is always blue","It lacks a significant radial growth phase, beginning almost immediately in the vertical growth phase","It only affects children","It is the least dangerous type"]', 1, 'Nodular melanoma is aggressive because it grows downward (vertically) from the start, often reaching deep levels quickly.'),
        (v_case_id, 'Which ABCDE criteria does Nodular Melanoma frequently fail to meet?', '["A","D","E","A, B, C, and D (it can be symmetric, small, and uniform)"]', 3, 'Nodular melanomas can be deceptively symmetric and uniform, but the ''E'' (Evolving) is usually very prominent.'),
        (v_case_id, 'What is the most common color for nodular melanoma?', '["Tan","Blue-black (though it can be amelanotic/red)","Yellow","White"]', 1, 'The deep pigment often gives it a dark, coal-like appearance.');

    ---------------------------------------------------------------------------
    -- CASE 15: Lentigo Maligna (LM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sun-Damaged Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sun-Damaged Face', 'An 80-year-old female presents with a large, brown, ''smudge-like'' patch on her cheek that has been slowly expanding for 10 years.

Vitals: Normal.
Physical Examination: A 3 cm ill-defined, tan-to-dark brown macule with irregular pigmentation on a background of severe solar elastosis.
Laboratory Results: Biopsy shows a proliferation of atypical melanocytes along the dermo-epidermal junction in a background of atrophic epidermis.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old female presents with a large, brown, ''smudge-like'' patch on her cheek that has been slowly expanding for 10 years.

Vitals: Normal.
Physical Examination: A 3 cm ill-defined, tan-to-dark brown macule with irregular pigmentation on a background of severe solar elastosis.
Laboratory Results: Biopsy shows a proliferation of atypical melanocytes along the dermo-epidermal junction in a background of atrophic epidermis.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Lentigo Maligna is the in-situ stage of which melanoma subtype?', '["Superficial spreading","Lentigo Maligna Melanoma","Acral lentiginous","Nodular"]', 1, 'Once an LM invades the dermis, it becomes Lentigo Maligna Melanoma.'),
        (v_case_id, 'In which population and site is LM most common?', '["Young adults, trunk","Elderly individuals, chronically sun-damaged face/neck","Children, legs","African Americans, palms"]', 1, 'LM is a ''cumulative sun damage'' melanoma, contrasting with the ''intermittent sun'' SSM.'),
        (v_case_id, 'What is a common management challenge for LM?', '["It metastasizes early","Ill-defined borders and large size make surgical clearance difficult on the face","It is resistant to all therapy","It is usually painful"]', 1, 'Because the borders are hard to see, recurrences are common unless wide margins or Mohs/map-guided surgery is used.');

    ---------------------------------------------------------------------------
    -- CASE 16: Acral Lentiginous Melanoma (ALM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dark Sole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dark Sole', 'A 60-year-old African American male presents with a dark patch on the sole of his foot. He thought it was a bruise from walking.

Vitals: Normal.
Physical Examination: A 2 cm irregular, variegated black and gray macule on the right heel.
Laboratory Results: Biopsy shows a lentiginous proliferation of melanocytes with prominent dendritic processes.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old African American male presents with a dark patch on the sole of his foot. He thought it was a bruise from walking.

Vitals: Normal.
Physical Examination: A 2 cm irregular, variegated black and gray macule on the right heel.
Laboratory Results: Biopsy shows a lentiginous proliferation of melanocytes with prominent dendritic processes.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is unique about the epidemiology of ALM?', '["It is the most common melanoma overall","It is the most common subtype of melanoma in non-Caucasian populations (Black, Asian, Hispanic)","It is caused by tanning beds","It only affects the scalp"]', 1, 'While rare in whites, ALM is the dominant subtype in dark-skinned individuals.'),
        (v_case_id, 'Is ALM related to UV exposure?', '["Yes, very much","No, it occurs on non-hair-bearing, non-sun-exposed surfaces (palms, soles, subungual)","Only in fair-skinned people","Only in the summer"]', 1, 'ALM is NOT driven by UV radiation, which is why it occurs in dark-skinned people on the soles.'),
        (v_case_id, 'What is the prognosis of ALM compared to other subtypes?', '["Inherently better","Often poorer, but primarily due to frequent delay in diagnosis resulting in thicker tumors at presentation","It is always benign","It never metastasizes"]', 1, 'Because it''s on the foot and patients/doctors often don''t check there, it is usually advanced when found.');

    ---------------------------------------------------------------------------
    -- CASE 17: Subungual Melanoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Streak in the Nail' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Streak in the Nail', 'A 45-year-old female presents with a dark line in her thumbnail. She noticed it a year ago and says it is widening.

Vitals: Normal.
Physical Examination: A 4mm wide, dark brown longitudinal band in the right thumb nail plate. Pigment is also visible on the proximal nail fold (Hutchinson''s sign).
Laboratory Results: Nail matrix biopsy is performed.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female presents with a dark line in her thumbnail. She noticed it a year ago and says it is widening.

Vitals: Normal.
Physical Examination: A 4mm wide, dark brown longitudinal band in the right thumb nail plate. Pigment is also visible on the proximal nail fold (Hutchinson''s sign).
Laboratory Results: Nail matrix biopsy is performed.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Hutchinson''s sign in the context of the nail?', '["A split in the nail","Extension of pigment from the nail matrix onto the proximal or lateral nail fold","A fungal infection","Pitting of the nail"]', 1, 'Hutchinson''s sign is a major clinical clue for subungual melanoma.'),
        (v_case_id, 'Subungual melanoma is a variant of which subtype?', '["Superficial spreading","Acral lentiginous","Nodular","Lentigo maligna"]', 1, 'ALM covers both the skin of the palms/soles and the nail apparatus.'),
        (v_case_id, 'What common benign condition is in the differential diagnosis for a longitudinal dark streak (melanonychia)?', '["Fungal infection","Subungual hematoma (blood under the nail)","Nail pitting","Clubbing"]', 1, 'Trauma/hematoma is very common. If it doesn''t ''grow out'' with the nail, it needs a biopsy.');

    ---------------------------------------------------------------------------
    -- CASE 18: Amelanotic Melanoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pink Melanoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pink Melanoma', 'A 35-year-old male presents with a pink, friable nodule on his shoulder. It was diagnosed as a ''pyogenic granuloma'' but grew back after being scraped off.

Vitals: Normal.
Physical Examination: A 5mm symmetric, red-pink glistening papule. No visible pigment.
Laboratory Results: Biopsy shows a malignant melanocytic proliferation with nearly zero melanin production.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male presents with a pink, friable nodule on his shoulder. It was diagnosed as a ''pyogenic granuloma'' but grew back after being scraped off.

Vitals: Normal.
Physical Examination: A 5mm symmetric, red-pink glistening papule. No visible pigment.
Laboratory Results: Biopsy shows a malignant melanocytic proliferation with nearly zero melanin production.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Amelanotic Melanoma a ''diagnostic trap''?', '["It is not dangerous","It lacks the classic ''C'' (Color) of the ABCDEs, often mimicking benign lesions like pyogenic granuloma, hemangioma, or a dermal nevus","It only affects animals","It is always flat"]', 1, 'Without pigment, it doesn''t look like a typical melanoma, leading to dangerous delays.'),
        (v_case_id, 'How can a pathologist confirm the diagnosis if no pigment is seen?', '["Looking for hair","Immunohistochemistry for markers like S100, SOX10, or Melan-A","By its color","By its smell"]', 1, 'Melanocytic markers confirm the cell lineage even if the cells have lost the ability to make melanin.'),
        (v_case_id, 'What is the prognosis of amelanotic melanoma?', '["Better than pigmented","Similar to pigmented melanoma of the same Breslow depth, but often found later","Always stage IV","Benign"]', 1, 'Biological behavior is stage-for-stage identical to pigmented melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 19: Breslow Depth and Staging
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Prognostic Ruler' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Prognostic Ruler', 'A pathology report for a melanoma excision returns. The clinician is looking for the most important number to determine the patient''s next steps.

Vitals: Normal.
Physical Examination: Post-op scar.
Laboratory Results: ''Melanoma, superficial spreading type. Breslow depth 1.2 mm. Ulceration absent. Mitoses 2/mm2.''', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pathology report for a melanoma excision returns. The clinician is looking for the most important number to determine the patient''s next steps.

Vitals: Normal.
Physical Examination: Post-op scar.
Laboratory Results: ''Melanoma, superficial spreading type. Breslow depth 1.2 mm. Ulceration absent. Mitoses 2/mm2.''', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Breslow depth?', '["The width of the tumor","The vertical measurement of the tumor from the granular layer of the epidermis to the deepest malignant cell in the dermis (in millimeters)","The anatomic layer reached","The number of lymph nodes"]', 1, 'Breslow depth is the single most important prognostic factor in primary cutaneous melanoma.'),
        (v_case_id, 'What is Clark''s Level?', '["The measurement in mm","An older staging system based on the anatomic layer of skin involved (e.g., Level IV involves the reticular dermis)","The patient''s name","The color of the tumor"]', 1, 'Clark''s level is less reproducible and has been largely replaced by Breslow depth in current AJCC staging.'),
        (v_case_id, 'At what Breslow depth threshold is a Sentinel Lymph Node Biopsy (SLNB) typically considered?', '["0.1 mm",">0.8 mm (or <0.8 mm with ulceration/high mitosis)","5.0 mm","Only if nodes are felt"]', 1, 'SLNB is used to stage the regional lymph nodes in intermediate-depth melanomas.');

    ---------------------------------------------------------------------------
    -- CASE 20: BRAF Mutations and Targeted Therapy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Targeted Therapy in Melanoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Targeted Therapy in Melanoma', 'A 45-year-old patient with metastatic melanoma is tested for genetic mutations to guide therapy.

Vitals: Normal.
Physical Examination: Multiple subcutaneous nodules.
Laboratory Results: Molecular testing shows a V600E mutation.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old patient with metastatic melanoma is tested for genetic mutations to guide therapy.

Vitals: Normal.
Physical Examination: Multiple subcutaneous nodules.
Laboratory Results: Molecular testing shows a V600E mutation.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What percentage of cutaneous melanomas harbor a BRAF mutation?', '["5%","Approximately 40-50%","90%","0%"]', 1, 'BRAF mutations are common, particularly in tumors on non-chronically sun-damaged skin.'),
        (v_case_id, 'Which medication combination is used for BRAF V600E positive metastatic melanoma?', '["Penicillin + Aspirin","A BRAF inhibitor (e.g., Vemurafenib) and a MEK inhibitor (e.g., Cobimetinib)","Insulin + Metformin","Isotretinoin"]', 1, 'Combined BRAF/MEK inhibition has better response rates and fewer side effects than BRAF inhibition alone.'),
        (v_case_id, 'What is a unique cutaneous side effect of BRAF inhibitor monotherapy?', '["Hives","Development of Squamous Cell Carcinomas and Keratoacanthomas","Acne","Hair loss"]', 1, 'Paradoxical activation of the MAP kinase pathway in cells without the BRAF mutation can lead to SCCs.');

    ---------------------------------------------------------------------------
    -- CASE 21: Checkpoint Inhibitors (Immunotherapy)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Immunotherapy Breakthrough' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Immunotherapy Breakthrough', 'A patient with stage IV melanoma is started on Nivolumab.

Vitals: Normal.
Physical Examination: Metastatic disease.
Laboratory Results: High tumor mutational burden.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with stage IV melanoma is started on Nivolumab.

Vitals: Normal.
Physical Examination: Metastatic disease.
Laboratory Results: High tumor mutational burden.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Nivolumab and Pembrolizumab?', '["Directly killing tumor cells","Blocking the PD-1 (Programmed Death-1) receptor on T-cells, ''releasing the brakes'' on the immune system to attack cancer","Inhibiting BRAF","Antibiotics"]', 1, 'These are ''checkpoint inhibitors'' that reactivate the patient''s own immune response.'),
        (v_case_id, 'Ipilimumab targets which checkpoint molecule?', '["PD-L1","CTLA-4","VEGF","BRAF"]', 1, 'Ipilimumab was the first checkpoint inhibitor, targeting CTLA-4.'),
        (v_case_id, 'What is a major category of side effects for these drugs?', '["Infections","Immune-related Adverse Events (irAEs) like colitis, hepatitis, and thyroiditis","Cardiac arrest","Hair loss"]', 1, 'Because you are over-activating the immune system, the body can attack its own healthy tissues.');

    ---------------------------------------------------------------------------
    -- CASE 22: FAMMM Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dysplastic Nevus Syndrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dysplastic Nevus Syndrome', 'A 25-year-old male presents with over 100 moles. He has a strong family history of melanoma in his father and grandfather.

Vitals: Normal.
Physical Examination: Countless clinically atypical nevi (large, irregular borders, multiple colors). Several ''ugly duckling'' lesions.
Laboratory Results: Genetic testing reveals a CDKN2A mutation.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male presents with over 100 moles. He has a strong family history of melanoma in his father and grandfather.

Vitals: Normal.
Physical Examination: Countless clinically atypical nevi (large, irregular borders, multiple colors). Several ''ugly duckling'' lesions.
Laboratory Results: Genetic testing reveals a CDKN2A mutation.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does FAMMM stand for?', '["Family Always Makes Me Mad","Familial Atypical Multiple Mole-Melanoma syndrome","Fast Acting Malignant Melanoma","Focal Atypical Melanocytic Marker"]', 1, 'FAMMM is a hereditary syndrome with a very high lifetime risk of melanoma.'),
        (v_case_id, 'Which gene is most commonly mutated in FAMMM?', '["CDKN2A (encoding p16)","PTEN","BRCA1","TP53"]', 0, 'p16 is a tumor suppressor gene that regulates the cell cycle.'),
        (v_case_id, 'What other internal malignancy are FAMMM patients at increased risk for?', '["Colon cancer","Pancreatic cancer","Leukemia","Brain tumors"]', 1, 'There is a strong association between CDKN2A mutations and pancreatic adenocarcinoma.');

    ---------------------------------------------------------------------------
    -- CASE 23: Melanoma Regression
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Receding Color' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Receding Color', 'A 50-year-old patient has a melanoma on his back. Parts of the lesion appear to be turning white or even disappearing.

Vitals: Normal.
Physical Examination: A variegated plaque with an area of gray-white scarring and loss of pigment in the center.
Laboratory Results: Biopsy shows a brisk lymphocytic infiltrate and fibrosis where tumor cells have been destroyed.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old patient has a melanoma on his back. Parts of the lesion appear to be turning white or even disappearing.

Vitals: Normal.
Physical Examination: A variegated plaque with an area of gray-white scarring and loss of pigment in the center.
Laboratory Results: Biopsy shows a brisk lymphocytic infiltrate and fibrosis where tumor cells have been destroyed.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is regression in melanoma?', '["The tumor is getting worse","The body''s immune system (T-cells) attacking and destroying part of the tumor, leaving behind a scarred or depigmented area","The tumor is changing color to black","The tumor is spreading"]', 1, 'Regression is a sign of an active host immune response.'),
        (v_case_id, 'Why is extensive regression (>75%) potentially problematic for the pathologist?', '["It looks ugly","It can make the true maximum Breslow depth difficult to determine, as the deepest part may have been destroyed","It means the tumor is gone","It is infectious"]', 1, 'If the thickest part regressed, the Breslow depth may be ''under-measured''.'),
        (v_case_id, 'What is the clinical term for a mole that develops a white ring of depigmentation around it?', '["Vitiligo","Halo Nevus","Blue Nevus","Spitz Nevus"]', 1, 'Halo nevi represent immune-mediated regression of a benign nevus, common in adolescents.');

    ---------------------------------------------------------------------------
    -- CASE 24: Kaposi Sarcoma (KS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Purple Lump in HIV' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Purple Lump in HIV', 'A 30-year-old HIV-positive male with a low CD4 count presents with multiple purple macules and nodules on his legs and trunk.

Vitals: Normal.
Physical Examination: Multiple violaceous, non-blanching papules and plaques. One lesion is on the hard palate.
Laboratory Results: Biopsy shows a proliferation of spindle cells forming slit-like spaces containing red blood cells.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old HIV-positive male with a low CD4 count presents with multiple purple macules and nodules on his legs and trunk.

Vitals: Normal.
Physical Examination: Multiple violaceous, non-blanching papules and plaques. One lesion is on the hard palate.
Laboratory Results: Biopsy shows a proliferation of spindle cells forming slit-like spaces containing red blood cells.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Kaposi Sarcoma?', '["HIV itself","Human Herpesvirus 8 (HHV-8) / KSHV","HPV 16","EBV"]', 1, 'HHV-8 is the necessary viral driver for all forms of KS.'),
        (v_case_id, 'What is the cell of origin in KS?', '["Melanocytes","Vascular or lymphatic endothelial cells","Keratinocytes","Fibroblasts"]', 1, 'KS is a low-grade vascular tumor.'),
        (v_case_id, 'What is the first-line management for AIDS-related KS?', '["Surgical excision of all spots","Highly Active Antiretroviral Therapy (HAART) to restore immune function","Systemic chemotherapy","Radiation"]', 1, 'Restoring the CD4 count with HAART often leads to regression of the KS lesions.');

    ---------------------------------------------------------------------------
    -- CASE 25: Merkel Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Aggressive Pink Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Aggressive Pink Nodule', 'An 80-year-old male presents with a rapidly growing, painless, firm, red nodule on his sun-damaged forehead. It appeared only 3 weeks ago.

Vitals: Normal.
Physical Examination: A 1.5 cm glistening, reddish-purple, dome-shaped nodule. No ulceration.
Laboratory Results: Biopsy shows a ''small blue cell tumor'' in the dermis. Immunohistochemistry is positive for CK20 in a ''perinuclear dot'' pattern.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old male presents with a rapidly growing, painless, firm, red nodule on his sun-damaged forehead. It appeared only 3 weeks ago.

Vitals: Normal.
Physical Examination: A 1.5 cm glistening, reddish-purple, dome-shaped nodule. No ulceration.
Laboratory Results: Biopsy shows a ''small blue cell tumor'' in the dermis. Immunohistochemistry is positive for CK20 in a ''perinuclear dot'' pattern.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the typical clinical behavior of Merkel Cell Carcinoma?', '["Indolent","Extremely aggressive with high rates of local recurrence and early lymph node metastasis","Benign","Only locally invasive"]', 1, 'Merkel cell is much more lethal than melanoma on a stage-for-stage basis.'),
        (v_case_id, 'What virus is associated with the majority (approx 80%) of Merkel Cell Carcinomas?', '["HPV","Merkel Cell Polyomavirus (MCPyV)","HHV-8","HSV-2"]', 1, 'MCPyV integration into the host genome drives the malignancy.'),
        (v_case_id, 'The ''perinuclear dot'' pattern of CK20 is characteristic of which tumor?', '["Small cell lung cancer","Merkel Cell Carcinoma","Basal Cell Carcinoma","Lymphoma"]', 1, 'CK20 is a sensitive and specific marker for Merkel cell when seen in this specific pattern.');

    ---------------------------------------------------------------------------
    -- CASE 26: Mycosis Fungoides (Patch Stage)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patchy Itch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patchy Itch', 'A 55-year-old male presents with long-standing ''eczema'' on his buttocks and trunk. It has not responded to mid-potency topical steroids over several years.

Vitals: Normal.
Physical Examination: Multiple 5-10 cm, thin, erythematous, slightly scaly patches with a ''cigarette paper'' (atrophic) appearance. Distribution is in non-sun-exposed ''bathing suit'' areas.
Laboratory Results: Biopsy shows a band-like infiltrate of atypical lymphocytes in the upper dermis with prominent epidermotropism (Pautrier microabscesses).', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male presents with long-standing ''eczema'' on his buttocks and trunk. It has not responded to mid-potency topical steroids over several years.

Vitals: Normal.
Physical Examination: Multiple 5-10 cm, thin, erythematous, slightly scaly patches with a ''cigarette paper'' (atrophic) appearance. Distribution is in non-sun-exposed ''bathing suit'' areas.
Laboratory Results: Biopsy shows a band-like infiltrate of atypical lymphocytes in the upper dermis with prominent epidermotropism (Pautrier microabscesses).', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Mycosis Fungoides?', '["A fungal infection","The most common form of Cutaneous T-Cell Lymphoma (CTCL)","A type of SCC","A benign growth"]', 1, 'Despite the name, it is a primary skin lymphoma, not a fungal infection.'),
        (v_case_id, 'What is epidermotropism in the context of MF?', '["Cancer spreading to the liver","The migration of malignant T-cells into the epidermis without significant spongiosis","Skin thickening","Loss of hair"]', 1, 'Epidermotropism is a hallmark histologic feature of MF.'),
        (v_case_id, 'What is the classic distribution for early Mycosis Fungoides?', '["Face and sun-exposed areas","Non-sun-exposed ''bathing suit'' distribution (buttocks, trunk, inner thighs)","Palms and soles","Scalp only"]', 1, 'MF classically avoids the sun, favoring areas covered by clothing.');

    ---------------------------------------------------------------------------
    -- CASE 27: Mycosis Fungoides (Plaque Stage)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Thickening Patch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Thickening Patch', 'A patient with known patch-stage MF returns with several areas that have become thick, indurated, and elevated.

Vitals: Normal.
Physical Examination: Well-demarcated, dusky red, scaly, elevated plaques on the trunk and limbs.
Laboratory Results: Biopsy shows a denser dermal infiltrate of atypical T-cells.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with known patch-stage MF returns with several areas that have become thick, indurated, and elevated.

Vitals: Normal.
Physical Examination: Well-demarcated, dusky red, scaly, elevated plaques on the trunk and limbs.
Laboratory Results: Biopsy shows a denser dermal infiltrate of atypical T-cells.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the progression of MF stages?', '["Tumor -> Plaque -> Patch","Patch -> Plaque -> Tumor","Patch -> Tumor -> Plaque","Plaque -> Patch -> Tumor"]', 1, 'MF typically follows a slow progression over years or decades through these three clinical stages.'),
        (v_case_id, 'What is a Pautrier microabscess?', '["A collection of pus","A small cluster of malignant T-cells within the epidermis","A fungal colony","A calcified follicle"]', 1, 'These clusters are highly suggestive of MF.'),
        (v_case_id, 'What is a common skin-directed therapy for plaque-stage MF?', '["Systemic chemotherapy","Phototherapy (PUVA or Narrowband UVB) or topical nitrogen mustard","Oral antibiotics","Topical antifungal"]', 1, 'Skin-directed therapies are preferred for early-stage disease to minimize systemic toxicity.');

    ---------------------------------------------------------------------------
    -- CASE 28: Mycosis Fungoides (Tumor Stage)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ulcerating Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ulcerating Tumor', 'A 65-year-old with a 20-year history of MF now presents with large, mushroom-like, ulcerating nodules on his chest.

Vitals: Normal.
Physical Examination: Multiple 3-5 cm firm, reddish-brown, ulcerated nodules.
Laboratory Results: Biopsy shows a diffuse, non-epidermotropic dermal infiltrate of large atypical T-cells. Large cell transformation is noted.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old with a 20-year history of MF now presents with large, mushroom-like, ulcerating nodules on his chest.

Vitals: Normal.
Physical Examination: Multiple 3-5 cm firm, reddish-brown, ulcerated nodules.
Laboratory Results: Biopsy shows a diffuse, non-epidermotropic dermal infiltrate of large atypical T-cells. Large cell transformation is noted.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the prognosis of tumor-stage MF compared to patch-stage?', '["Better","Significantly worse, with high risk of systemic involvement (lymph nodes, viscera)","The same","Always curative"]', 1, 'Tumor stage indicates a more aggressive biology and a higher stage (IIB).'),
        (v_case_id, 'What is ''large cell transformation'' in MF?', '["The cells get bigger and more benign","A poor prognostic finding where >25% of the infiltrate consists of cells 4x larger than small lymphocytes","The tumor turns into BCC","The cells turn into fat"]', 1, 'Transformation marks a transition to a more aggressive clinical course.'),
        (v_case_id, 'Which systemic therapy is specifically used for tumor-stage or refractory MF?', '["Topical steroids","Bexarotene (a systemic retinoid X receptor selective retinoid)","Penicillin","Moisturizers"]', 1, 'Systemic retinoids like Bexarotene or HDAC inhibitors like Vorinostat are used for advanced MF.');

    ---------------------------------------------------------------------------
    -- CASE 29: Sezary Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Man (Sezary)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Man (Sezary)', 'A 70-year-old male presents with generalized redness and severe itching. He has enlarged lymph nodes in his neck and groin.

Vitals: Normal.
Physical Examination: Diffuse erythroderma (redness >90% BSA). Palmoplantar keratoderma. Generalized lymphadenopathy.
Laboratory Results: Peripheral blood smear shows lymphocytes with ''cerebriform'' nuclei. Flow cytometry shows a CD4:CD8 ratio >10.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male presents with generalized redness and severe itching. He has enlarged lymph nodes in his neck and groin.

Vitals: Normal.
Physical Examination: Diffuse erythroderma (redness >90% BSA). Palmoplantar keratoderma. Generalized lymphadenopathy.
Laboratory Results: Peripheral blood smear shows lymphocytes with ''cerebriform'' nuclei. Flow cytometry shows a CD4:CD8 ratio >10.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Sezary Syndrome?', '["A fungal infection of the blood","The leukemic (systemic) phase of CTCL, characterized by erythroderma, lymphadenopathy, and circulating malignant T-cells","A type of psoriasis","A benign drug rash"]', 1, 'Sezary syndrome is defined by the triad of erythroderma, lymphadenopathy, and circulating Sezary cells.'),
        (v_case_id, 'What is a Sezary cell?', '["A red blood cell","A malignant T-cell with a folded, ''cerebriform'' (brain-like) nucleus","A giant cell","A plasma cell"]', 1, 'The unique nuclear morphology is a key diagnostic clue.'),
        (v_case_id, 'What is the primary treatment modality for Sezary Syndrome?', '["Topical steroids only","Extracorporeal Photopheresis (ECP)","Oral antibiotics","Surgical excision"]', 1, 'ECP is a systemic therapy that treats the patient''s blood with a photosensitizer and UV light to induce apoptosis of malignant T-cells.');

    ---------------------------------------------------------------------------
    -- CASE 30: Dermatofibrosarcoma Protuberans (DFSP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Firm Plaque on the Trunk' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Firm Plaque on the Trunk', 'A 35-year-old female presents with a slow-growing, firm, ''woody'' plaque on her abdomen that has been present for 2 years.

Vitals: Normal.
Physical Examination: A 5 cm multi-nodular, firm, flesh-colored to violaceous plaque on the abdominal wall.
Laboratory Results: Biopsy shows a ''storiform'' (mat-like) pattern of spindle cells invading the subcutaneous fat in a ''honeycomb'' fashion. IHC is positive for CD34.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female presents with a slow-growing, firm, ''woody'' plaque on her abdomen that has been present for 2 years.

Vitals: Normal.
Physical Examination: A 5 cm multi-nodular, firm, flesh-colored to violaceous plaque on the abdominal wall.
Laboratory Results: Biopsy shows a ''storiform'' (mat-like) pattern of spindle cells invading the subcutaneous fat in a ''honeycomb'' fashion. IHC is positive for CD34.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic histological pattern of DFSP?', '["Peripheral palisading","Storiform pattern of spindle cells","Keratin pearls","Melanin nests"]', 1, 'A storiform (wheel-spoke) arrangement of fibroblasts is characteristic.'),
        (v_case_id, 'Which genetic translocation is pathognomonic for DFSP?', '["t(9;22)","t(17;22) involving COL1A1 and PDGFB","t(15;17)","t(8;14)"]', 1, 'This translocation results in the overexpression of Platelet-Derived Growth Factor Beta (PDGFB), driving tumor growth.'),
        (v_case_id, 'What is the treatment of choice for DFSP?', '["Shave excision","Mohs Micrographic Surgery or Wide Local Excision with very broad margins (2-3 cm)","Topical imiquimod","Radiation only"]', 1, 'DFSP has long, tentacle-like extensions into the surrounding tissue, necessitating wide or Mohs-guided clearance to prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 31: Angiosarcoma (Stewart-Treves Syndrome)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bruise that Grew' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bruise that Grew', 'An 80-year-old male with chronic lymphedema of the arm following axillary node dissection for breast cancer presents with purple spots on the swollen limb.

Vitals: Normal.
Physical Examination: Multiple ill-defined purple-to-red ''bruise-like'' patches and nodules on an edematous arm.
Laboratory Results: Biopsy shows malignant endothelial cells forming irregular vascular channels that dissect between collagen bundles.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old male with chronic lymphedema of the arm following axillary node dissection for breast cancer presents with purple spots on the swollen limb.

Vitals: Normal.
Physical Examination: Multiple ill-defined purple-to-red ''bruise-like'' patches and nodules on an edematous arm.
Laboratory Results: Biopsy shows malignant endothelial cells forming irregular vascular channels that dissect between collagen bundles.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Stewart-Treves Syndrome?', '["A type of melanoma","Angiosarcoma arising in a setting of chronic lymphedema","A genetic heart defect","A fungal infection"]', 1, 'Chronic lymphedema is a known risk factor for the development of this aggressive vascular malignancy.'),
        (v_case_id, 'What is the most common site for ''classic'' (non-Stewart-Treves) angiosarcoma?', '["Scalp and face of elderly males","Palms","Lower legs of children","Internal organs only"]', 0, 'Classic angiosarcoma typically affects the head and neck of older men.'),
        (v_case_id, 'What is the prognosis for cutaneous angiosarcoma?', '["Excellent","Poor, with high rates of local recurrence and early pulmonary metastasis","Benign","Curable with topical therapy"]', 1, 'Angiosarcoma is one of the most aggressive and lethal skin malignancies.');

    ---------------------------------------------------------------------------
    -- CASE 32: Sebaceous Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Eyelid Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Eyelid Nodule', 'A 65-year-old female presents with a yellow-orange nodule on her right upper eyelid. She has been treated for ''recurrent chalazion'' multiple times at the same site.

Vitals: Normal.
Physical Examination: A firm, yellow-hued nodule on the tarsal plate of the upper eyelid. Loss of eyelashes (madarosis) in that area.
Laboratory Results: Biopsy shows lobules of cells with foamy, vacuolated cytoplasm (sebaceous differentiation).', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old female presents with a yellow-orange nodule on her right upper eyelid. She has been treated for ''recurrent chalazion'' multiple times at the same site.

Vitals: Normal.
Physical Examination: A firm, yellow-hued nodule on the tarsal plate of the upper eyelid. Loss of eyelashes (madarosis) in that area.
Laboratory Results: Biopsy shows lobules of cells with foamy, vacuolated cytoplasm (sebaceous differentiation).', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is sebaceous carcinoma often misdiagnosed?', '["It is invisible","It mimics benign conditions like chalazion or blepharitis","It looks like a wart","It looks like a freckle"]', 1, 'A ''chalazion'' that recurs in the same spot or doesn''t respond to standard treatment must be biopsied to rule out sebaceous carcinoma.'),
        (v_case_id, 'Which syndrome is associated with multiple sebaceous tumors and internal malignancies (especially GI)?', '["Gorlin syndrome","Muir-Torre syndrome (a variant of Lynch syndrome)","Cowden syndrome","Gardner syndrome"]', 1, 'Muir-Torre features sebaceous adenomas, epitheliomas, or carcinomas and internal cancers (mismatch repair defect).'),
        (v_case_id, 'What is ''pagetoid spread'' in sebaceous carcinoma?', '["Spread to the bones","The migration of malignant cells individually into the overlying conjunctival or epidermal epithelium","Spread to the lymph nodes","Spread to the liver"]', 1, 'Pagetoid spread makes determining surgical margins very difficult.');

    ---------------------------------------------------------------------------
    -- CASE 33: Extramammary Paget''s Disease (EMPD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Itchy Vulva' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Itchy Vulva', 'A 60-year-old woman presents with a chronic, ''unbearably itchy'' red patch on her vulva. She has used antifungal creams for a year.

Vitals: Normal.
Physical Examination: A well-demarcated, bright red, moist plaque with small white islands of hyperkeratosis (''strawberries and cream'' appearance).
Laboratory Results: Biopsy shows large, pale cells (Paget cells) infiltrating the epidermis. They are PAS positive.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old woman presents with a chronic, ''unbearably itchy'' red patch on her vulva. She has used antifungal creams for a year.

Vitals: Normal.
Physical Examination: A well-demarcated, bright red, moist plaque with small white islands of hyperkeratosis (''strawberries and cream'' appearance).
Laboratory Results: Biopsy shows large, pale cells (Paget cells) infiltrating the epidermis. They are PAS positive.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Extramammary Paget''s Disease?', '["An infection","An intraepithelial adenocarcinoma, most commonly on the vulva or perianal skin","A type of SCC","A fungal rash"]', 1, 'EMPD is a slow-growing cancer that mimics eczema or tinea.'),
        (v_case_id, 'What is the significance of diagnosing EMPD, especially in the perianal area?', '["It is always benign","It is associated with an underlying internal malignancy (e.g., colorectal or urogenital) in up to 25% of cases","It means the patient has breast cancer","It is contagious"]', 1, 'A thorough workup for internal adenocarcinoma is mandatory in EMPD patients.'),
        (v_case_id, 'What stain helps differentiate Paget cells from melanoma cells?', '["S100","PAS (Periodic Acid-Schiff) or Mucicarmine (Paget cells contain mucin and are positive; melanoma is negative)","Gram stain","KOH"]', 1, 'The presence of mucin (PAS+) confirms the glandular (adenocarcinoma) nature of Paget''s.');

    ---------------------------------------------------------------------------
    -- CASE 34: Metastatic Melanoma (CNS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Melanoma Complications: Brain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Melanoma Complications: Brain', 'A 55-year-old male with a history of a 4mm Breslow melanoma on his back 2 years ago presents with new-onset headaches and a seizure.

Vitals: Normal.
Physical Examination: No new skin lesions. Neurological deficits noted on exam.
Laboratory Results: MRI shows multiple ring-enhancing lesions in the brain.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male with a history of a 4mm Breslow melanoma on his back 2 years ago presents with new-onset headaches and a seizure.

Vitals: Normal.
Physical Examination: No new skin lesions. Neurological deficits noted on exam.
Laboratory Results: MRI shows multiple ring-enhancing lesions in the brain.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of death from metastatic melanoma?', '["Liver failure","Central Nervous System (CNS) metastases","Skin infection","Kidney failure"]', 1, 'Melanoma has a high predilection for spreading to the brain.'),
        (v_case_id, 'If a patient has a single brain metastasis from melanoma, what is a potential treatment?', '["Topical imiquimod","Surgical resection or Stereotactic Radiosurgery (Gamma Knife)","Oral antibiotics","Wait and see"]', 1, 'Local control of brain mets can significantly improve quality of life and survival.'),
        (v_case_id, 'Does immunotherapy work for brain metastases?', '["No, it can''t cross the blood-brain barrier","Yes, drugs like Nivolumab and Ipilimumab have shown activity against intracranial melanoma","Only if given as an injection into the brain","Only in children"]', 1, 'Modern immunotherapy has revolutionized the treatment of CNS melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 35: Metastatic SCC (Nodal)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SCC: The Nodal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SCC: The Nodal Mass', 'A 70-year-old male with a history of multiple SCCs of the scalp presents with a firm, painless 3 cm lump in his neck.

Vitals: Normal.
Physical Examination: A fixed, non-tender, firm mass in the right cervical lymph node chain.
Laboratory Results: Fine needle aspiration (FNA) confirms metastatic squamous cell carcinoma.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male with a history of multiple SCCs of the scalp presents with a firm, painless 3 cm lump in his neck.

Vitals: Normal.
Physical Examination: A fixed, non-tender, firm mass in the right cervical lymph node chain.
Laboratory Results: Fine needle aspiration (FNA) confirms metastatic squamous cell carcinoma.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which cutaneous SCCs are at highest risk for nodal metastasis?', '["Small ones on the trunk","Large (>2cm), deep (>6mm), poorly differentiated tumors on the ear or lip","Those arising in a sunspot","All SCCs have equal risk"]', 1, 'Size, depth, and location are key prognostic indicators for SCC.'),
        (v_case_id, 'What is the standard management for a patient with a single regional node metastasis from skin SCC?', '["Chemotherapy only","Regional lymph node dissection and potentially adjuvant radiation","Topical therapy","Observation"]', 1, 'Surgical removal of the nodal basin is the mainstay of treatment for regional spread.'),
        (v_case_id, 'What is the role of PD-1 inhibitors (e.g., Cemiplimab) in SCC?', '["None","First-line for metastatic or locally advanced SCC not amenable to surgery/radiation","Only for BCC","Only for melanoma"]', 1, 'Cemiplimab was the first immunotherapy approved specifically for advanced cutaneous SCC.');

    ---------------------------------------------------------------------------
    -- CASE 36: BRAF Inhibitor Resistance
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Targeted Therapy: The Escape' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Targeted Therapy: The Escape', 'A patient on Vemurafenib (BRAF inhibitor) for metastatic melanoma initially had a dramatic response, but after 6 months, the tumors have begun to grow back.

Vitals: Normal.
Physical Examination: New subcutaneous nodules appearing.
Laboratory Results: Repeat biopsy shows the same V600E mutation.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on Vemurafenib (BRAF inhibitor) for metastatic melanoma initially had a dramatic response, but after 6 months, the tumors have begun to grow back.

Vitals: Normal.
Physical Examination: New subcutaneous nodules appearing.
Laboratory Results: Repeat biopsy shows the same V600E mutation.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common mechanism of resistance to BRAF inhibitor monotherapy?', '["The mutation disappears","Reactivation of the MAP kinase pathway through alternative routes (e.g., MEK or NRAS bypass)","The patient stops taking the drug","The tumor turns into BCC"]', 1, 'Tumors ''learn'' to bypass the specific BRAF block.'),
        (v_case_id, 'How is this resistance clinically managed?', '["Increasing the dose of the BRAF inhibitor","Using dual therapy with both a BRAF inhibitor AND a MEK inhibitor (e.g., Dabrafenib + Trametinib)","Switching to antibiotics","Surgery"]', 1, 'Blocking the pathway at two points (BRAF and MEK) significantly delays the onset of resistance.'),
        (v_case_id, 'Is immunotherapy an option after BRAF therapy fails?', '["No","Yes, and it is often sequenced either before or after targeted therapy","Only if the BRAF mutation is gone","Only in the elderly"]', 1, 'Patients who fail targeted therapy can still respond to checkpoint inhibitors.');

    ---------------------------------------------------------------------------
    -- CASE 37: Immune-Mediated Colitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Immunotherapy: The Side Effect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Immunotherapy: The Side Effect', 'A patient receiving Ipilimumab for melanoma develops 10 episodes of bloody diarrhea per day and severe abdominal pain.

Vitals: T 38.0 C, HR 105, BP 100/60.
Physical Examination: Diffuse abdominal tenderness.
Laboratory Results: Colonoscopy shows diffuse ulceration and inflammation of the colonic mucosa.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient receiving Ipilimumab for melanoma develops 10 episodes of bloody diarrhea per day and severe abdominal pain.

Vitals: T 38.0 C, HR 105, BP 100/60.
Physical Examination: Diffuse abdominal tenderness.
Laboratory Results: Colonoscopy shows diffuse ulceration and inflammation of the colonic mucosa.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of this patient''s diarrhea?', '["Infection (C. diff)","Immune-related Adverse Event (irAE) - specifically Ipilimumab-induced autoimmune colitis","Food poisoning","Side effect of surgery"]', 1, 'Checkpoint inhibitors can cause ''autoimmune'' side effects in almost any organ.'),
        (v_case_id, 'What is the first-line treatment for severe (Grade 3/4) immune-mediated colitis?', '["Antibiotics","High-dose systemic corticosteroids (e.g., IV Methylprednisolone)","Increasing the Ipilimumab dose","Anti-diarrheal meds (Loperamide) only"]', 1, 'You must suppress the overactive immune system to prevent bowel perforation.'),
        (v_case_id, 'If steroids fail to improve the colitis, what biologic can be used?', '["Nivolumab","Infliximab (TNF-alpha inhibitor)","Rituximab","Insulin"]', 1, 'Infliximab is the standard ''rescue'' therapy for steroid-refractory immunotherapy colitis.');

    ---------------------------------------------------------------------------
    -- CASE 38: Immunotherapy-induced Hypothyroidism
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Immunotherapy: Endocrine Effects' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Immunotherapy: Endocrine Effects', 'A patient on Pembrolizumab complains of extreme fatigue, cold intolerance, and weight gain.

Vitals: HR 55 (bradycardia).
Physical Examination: Non-pitting edema (myxedema), delayed relaxation of deep tendon reflexes.
Laboratory Results: TSH 50 (Very high), Free T4 low.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient on Pembrolizumab complains of extreme fatigue, cold intolerance, and weight gain.

Vitals: HR 55 (bradycardia).
Physical Examination: Non-pitting edema (myxedema), delayed relaxation of deep tendon reflexes.
Laboratory Results: TSH 50 (Very high), Free T4 low.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How common are endocrine side effects with PD-1 inhibitors?', '["Very rare","Relatively common (up to 10-15% of patients)","100%","Only in women"]', 1, 'Thyroid dysfunction is one of the most frequent irAEs.'),
        (v_case_id, 'Unlike colitis, if a patient develops hypothyroidism from immunotherapy, do you usually need to stop the cancer treatment?', '["Yes, immediately","No, you usually continue the immunotherapy and simply provide lifelong thyroid hormone replacement (Levothyroxine)","Yes, forever","No, it goes away on its own"]', 1, 'Endocrine toxicities are often permanent but easily managed with replacement therapy.'),
        (v_case_id, 'What is another, more dangerous endocrine irAE to watch for?', '["Diabetes type 2","Primary Adrenal Insufficiency (Adrenal Crisis) or Hypophysitis","Hyperparathyroidism","Gout"]', 1, 'Adrenal crisis can be life-threatening and requires prompt steroid replacement.');

    ---------------------------------------------------------------------------
    -- CASE 39: Dermoscopy of Melanoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue-White Veil' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue-White Veil', 'A dermatologist is performing dermoscopy on a dark, suspicious lesion on a patient''s back.

Vitals: Normal.
Physical Examination: A 7mm dark blue and white variegated plaque.
Laboratory Results: Dermoscopy shows a ''blue-white veil'' and ''atypical pigment network''.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A dermatologist is performing dermoscopy on a dark, suspicious lesion on a patient''s back.

Vitals: Normal.
Physical Examination: A 7mm dark blue and white variegated plaque.
Laboratory Results: Dermoscopy shows a ''blue-white veil'' and ''atypical pigment network''.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does a ''blue-white veil'' on dermoscopy represent histologically?', '["Too much water","A thick area of orthokeratosis (the white) overlying a dense collection of heavily pigmented melanocytes in the dermis (the blue/Tyndall effect)","A fungal infection","A scar"]', 1, 'The blue-white veil is highly specific for invasive melanoma.'),
        (v_case_id, 'What are ''chrysalis structures'' (or shiny white streaks)?', '["Bugs","Bright white, short, linear streaks seen only with polarized dermoscopy, representing altered dermal collagen","Small blisters","Hairs"]', 1, 'These structures are often seen in melanoma and BCC.'),
        (v_case_id, 'What is the benefit of dermoscopy for the clinician?', '["It cures the cancer","It increases sensitivity and specificity for the diagnosis of melanoma compared to the naked eye","It is used for treatment","It is only for research"]', 1, 'Dermoscopy allows visualization of structures beneath the stratum corneum.');

    ---------------------------------------------------------------------------
    -- CASE 40: Mohs Surgery Technique
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mohs Micrographic Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mohs Micrographic Surgery', 'A patient is undergoing Mohs surgery for a BCC on the tip of the nose.

Vitals: Normal.
Physical Examination: Small defect on the nose after the first ''stage''.
Laboratory Results: The surgeon is looking at frozen sections in the office.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient is undergoing Mohs surgery for a BCC on the tip of the nose.

Vitals: Normal.
Physical Examination: Small defect on the nose after the first ''stage''.
Laboratory Results: The surgeon is looking at frozen sections in the office.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary advantage of Mohs surgery over standard wide local excision?', '["It is faster","It allows for 100% margin evaluation while preserving as much healthy tissue as possible","It uses general anesthesia","It doesn''t leave a scar"]', 1, 'By examining horizontal sections of the entire margin, Mohs provides the highest cure rate.'),
        (v_case_id, 'How are Mohs sections cut compared to traditional ''bread-loafing''?', '["Vertically","Horizontally (tangentially), allowing the entire deep and peripheral margin to be seen on one slide","In triangles","They aren''t cut"]', 1, 'Traditional bread-loafing only samples about 1% of the margin.'),
        (v_case_id, 'Which skin cancer is Mohs NOT typically the first-line treatment for?', '["Nodular BCC on the nose","Superficial BCC on the back","Infiltrative BCC on the eyelid","SCC on the lip"]', 1, 'Low-risk tumors in low-risk areas (like the trunk) can be treated with simpler, less expensive methods.');

    ---------------------------------------------------------------------------
    -- CASE 41: Topical Field Therapy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Field Therapy for AKs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Field Therapy for AKs', 'A patient with dozens of actinic keratoses on his face is prescribed a cream to use for 5 days.

Vitals: Normal.
Physical Examination: Diffuse sun damage and multiple AKs.
Laboratory Results: None.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with dozens of actinic keratoses on his face is prescribed a cream to use for 5 days.

Vitals: Normal.
Physical Examination: Diffuse sun damage and multiple AKs.
Laboratory Results: None.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of 5-fluorouracil (5-FU) cream?', '["Antifungal","Antimetabolite that inhibits thymidylate synthase, causing death of rapidly dividing (dysplastic) cells","Antibiotic","Steroid"]', 1, '5-FU targets the DNA synthesis of the precancerous cells.'),
        (v_case_id, 'What is Imiquimod''s mechanism?', '["Killing cells directly","Toll-like receptor 7 (TLR7) agonist that stimulates the local innate and adaptive immune response","Blocking the sun","Moisturizing"]', 1, 'Imiquimod uses the patient''s own immune system to clear the AKs.'),
        (v_case_id, 'What should the patient be warned about when using these creams?', '["The skin will look perfect during treatment","The treated area will become red, crusty, and inflamed (this is a sign the drug is working)","The skin will turn blue","There are no side effects"]', 1, 'The ''brisk'' inflammatory response is expected and necessary for efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 42: Sister Mary Joseph Nodule
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sister Mary Joseph Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sister Mary Joseph Nodule', 'A 65-year-old male presents with a firm, red-to-purple nodule in his umbilicus.

Vitals: Normal.
Physical Examination: A 1.5 cm indurated, slightly ulcerated nodule at the umbilicus.
Laboratory Results: Biopsy shows adenocarcinoma. Imaging reveals a mass in the stomach.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male presents with a firm, red-to-purple nodule in his umbilicus.

Vitals: Normal.
Physical Examination: A 1.5 cm indurated, slightly ulcerated nodule at the umbilicus.
Laboratory Results: Biopsy shows adenocarcinoma. Imaging reveals a mass in the stomach.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Sister Mary Joseph nodule?', '["A type of BCC","Cutaneous metastasis to the umbilicus from an internal (usually intra-abdominal) malignancy","A hernia","An umbilical infection"]', 1, 'It is a classic sign of advanced internal cancer, most commonly gastric, pancreatic, or ovarian.'),
        (v_case_id, 'Who was Sister Mary Joseph?', '["A dermatologist","The surgical assistant to Dr. William Mayo who noticed that patients with umbilical nodules often had advanced abdominal cancer","The patient","A famous surgeon"]', 1, 'Her observation has remained a classic clinical sign in medicine.'),
        (v_case_id, 'What is the prognosis when this nodule is found?', '["Excellent","Poor, as it usually represents advanced, metastatic disease","Benign","Curative"]', 1, 'The presence of cutaneous metastasis generally indicates Stage IV disease.');

    ---------------------------------------------------------------------------
    -- CASE 43: High-Risk SCC Features
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SCC: The High-Risk Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SCC: The High-Risk Ear', 'A 70-year-old male has an SCC on the helix of his ear. It is 2.5 cm in diameter.

Vitals: Normal.
Physical Examination: Firm, scaly nodule on the ear.
Laboratory Results: Biopsy shows poorly differentiated SCC with perineural invasion.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male has an SCC on the helix of his ear. It is 2.5 cm in diameter.

Vitals: Normal.
Physical Examination: Firm, scaly nodule on the ear.
Laboratory Results: Biopsy shows poorly differentiated SCC with perineural invasion.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of these is a high-risk feature for SCC recurrence and metastasis?', '["Diameter < 1cm","Perineural invasion (tumor cells wrapping around nerves)","Well-differentiated histology","Location on the arm"]', 1, 'Perineural invasion allows the tumor to travel along nerve sheaths far from the primary site.'),
        (v_case_id, 'Why is the ear a high-risk location?', '["It has a lot of hair","Thin skin and proximity to large vessels/lymphatics, leading to higher metastatic rates","It is hard to wash","It is cold"]', 1, 'SCCs on the ''mask'' area of the face (ears, lips, nose) are inherently more aggressive.'),
        (v_case_id, 'What is the management of choice for this ear lesion?', '["Cryosurgery","Mohs Micrographic Surgery","Topical imiquimod","Shave excision"]', 1, 'High-risk SCCs should be managed with Mohs or wide local excision with margin control.');

    ---------------------------------------------------------------------------
    -- CASE 44: Actinic Cheilitis and Lip SCC
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SCC: The Lower Lip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SCC: The Lower Lip', 'A 60-year-old male smoker with a history of many years of sun exposure presents with a non-healing white patch on his lower lip.

Vitals: Normal.
Physical Examination: Diffuse blurring of the vermilion border of the lower lip with scaly white patches (leukoplakia). One area is ulcerated.
Laboratory Results: Biopsy of the ulcer shows invasive SCC.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male smoker with a history of many years of sun exposure presents with a non-healing white patch on his lower lip.

Vitals: Normal.
Physical Examination: Diffuse blurring of the vermilion border of the lower lip with scaly white patches (leukoplakia). One area is ulcerated.
Laboratory Results: Biopsy of the ulcer shows invasive SCC.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the precursor to SCC of the lip?', '["Cold sores","Actinic Cheilitis (essentially AK of the lip)","Fordyce spots","Mucocele"]', 1, 'Actinic cheilitis results from chronic sun damage to the lower lip.'),
        (v_case_id, 'Which lip is more commonly affected by SCC and why?', '["Upper lip, more sun exposure","Lower lip, because it protrudes more and receives more direct UV radiation","Both equally","Upper lip, due to smoking"]', 1, 'The lower lip''s anatomy makes it much more susceptible to sun damage.'),
        (v_case_id, 'What is the metastatic rate for SCC of the lip?', '["0%","Approximately 10-15%","90%","50%"]', 1, 'The lip is a high-risk site with significant potential for nodal spread.');

    ---------------------------------------------------------------------------
    -- CASE 45: Verrucous Carcinoma (Ackerman Tumor)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SCC: The Slow-Growing Wart' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SCC: The Slow-Growing Wart', 'A 70-year-old male presents with a large, wart-like growth on the sole of his foot that has been present for 5 years. He thought it was a plantar wart.

Vitals: Normal.
Physical Examination: A massive, cauliflower-like, malodorous plaque on the heel. It is very slow-growing and locally destructive.
Laboratory Results: Biopsy shows a very well-differentiated squamous proliferation with ''pushing'' borders.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male presents with a large, wart-like growth on the sole of his foot that has been present for 5 years. He thought it was a plantar wart.

Vitals: Normal.
Physical Examination: A massive, cauliflower-like, malodorous plaque on the heel. It is very slow-growing and locally destructive.
Laboratory Results: Biopsy shows a very well-differentiated squamous proliferation with ''pushing'' borders.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Verrucous Carcinoma?', '["A viral wart","A low-grade, well-differentiated variant of SCC that is locally aggressive but rarely metastasizes","A type of melanoma","A benign cyst"]', 1, 'It looks like a wart but is a slow-motion cancer.'),
        (v_case_id, 'What is the term for verrucous carcinoma occurring in the oral cavity (often in tobacco chewers)?', '["Bowen''s disease","Oral florid papillomatosis","Erythroplasia of Queyrat","Leukoplakia"]', 1, 'It presents as white, shaggy plaques in the mouth.'),
        (v_case_id, 'What is the treatment?', '["Wart freezing","Wide surgical excision","Antibiotics","Topical steroids"]', 1, 'Surgery is curative, but it must be completely removed to prevent local destruction.');

    ---------------------------------------------------------------------------
    -- CASE 46: Recurrent BCC Management
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'BCC: The Recurrent Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'BCC: The Recurrent Nodule', 'A patient has a BCC on the nose that was treated with ''scraping and burning'' 2 years ago. It has now returned as a scar with a small pearl in the center.

Vitals: Normal.
Physical Examination: A 1 cm scar on the nasal tip with a recurrent pearly papule and telangiectasias.
Laboratory Results: Biopsy confirms recurrent BCC.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a BCC on the nose that was treated with ''scraping and burning'' 2 years ago. It has now returned as a scar with a small pearl in the center.

Vitals: Normal.
Physical Examination: A 1 cm scar on the nasal tip with a recurrent pearly papule and telangiectasias.
Laboratory Results: Biopsy confirms recurrent BCC.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a recurrent BCC more difficult to treat than a primary one?', '["The cells are stronger","The tumor is often larger than it appears and is hidden within the surgical scar tissue","It is always metastatic","It doesn''t bleed"]', 1, 'Scar tissue masks the borders of the tumor.'),
        (v_case_id, 'What is the gold standard treatment for recurrent BCC on the face?', '["Repeat scraping (C&E)","Mohs Micrographic Surgery","Topical 5-FU","Radiation"]', 1, 'Mohs surgery is specifically indicated for recurrent tumors due to its margin-mapping capability.'),
        (v_case_id, 'What is the 5-year cure rate for Mohs surgery in recurrent BCC?', '["50%","Approximately 95-97%","10%","100%"]', 1, 'Even for difficult recurrent cases, Mohs offers excellent cure rates.');

    ---------------------------------------------------------------------------
    -- CASE 47: Skin Malignancy Summary
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Yield Malignancy Review' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Yield Malignancy Review', 'A medical student is preparing for the dermatology shelf exam.

Vitals: Normal.
Physical Examination: Focused.
Laboratory Results: None.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A medical student is preparing for the dermatology shelf exam.

Vitals: Normal.
Physical Examination: Focused.
Laboratory Results: None.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most important prognostic factor for a localized melanoma?', '["Color","Breslow depth","Diameter","Patient age"]', 1, 'Depth is the key to staging and prognosis.'),
        (v_case_id, 'Which skin cancer is most common in organ transplant recipients?', '["BCC","SCC (often outnumbering BCC 3:1 or 4:1)","Melanoma","Kaposi Sarcoma"]', 1, 'Immunosuppression specifically favors SCC development.'),
        (v_case_id, 'Which tumor is associated with the Hedgehog signaling pathway?', '["SCC","BCC (PTCH1 and SMO mutations)","Melanoma","Merkel Cell"]', 1, 'BCC pathogenesis is almost universally driven by Hedgehog pathway activation.');

    ---------------------------------------------------------------------------
    -- CASE 48: Atypical Fibroxanthoma (AFX)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scalp Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scalp Nodule', 'An 80-year-old male presents with a rapidly growing, firm, red-to-purple nodule on his sun-damaged scalp. It appeared only 1 month ago.

Vitals: Normal.
Physical Examination: A 1.5 cm dome-shaped, ulcerated nodule. It looks very aggressive.
Laboratory Results: Biopsy shows a pleomorphic spindle cell tumor in the superficial dermis. IHC is negative for S100, Cytokeratins, and Desmin, but positive for CD10.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old male presents with a rapidly growing, firm, red-to-purple nodule on his sun-damaged scalp. It appeared only 1 month ago.

Vitals: Normal.
Physical Examination: A 1.5 cm dome-shaped, ulcerated nodule. It looks very aggressive.
Laboratory Results: Biopsy shows a pleomorphic spindle cell tumor in the superficial dermis. IHC is negative for S100, Cytokeratins, and Desmin, but positive for CD10.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Atypical Fibroxanthoma?', '["A benign mole","A low-grade, pleomorphic spindle cell sarcoma of sun-damaged skin","A type of melanoma","A fungal infection"]', 1, 'AFX is a diagnosis of exclusion (IHC must be negative for melanoma, SCC, and leiomyosarcoma markers) in a spindle cell tumor.'),
        (v_case_id, 'In which population and site is AFX most common?', '["Children, trunk","Elderly men, sun-damaged scalp and ears","Young women, legs","Infants, face"]', 1, 'Severe solar damage is the primary risk factor for AFX.'),
        (v_case_id, 'What is the prognosis for AFX?', '["Poor, high metastatic rate","Generally excellent with local excision, despite its aggressive histological appearance","Always lethal","Benign"]', 1, 'AFX looks very ''scary'' under the microscope but rarely metastasizes if caught early.');

    ---------------------------------------------------------------------------
    -- CASE 49: Microcystic Adnexal Carcinoma (MAC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Subtle Indurated Plaque' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Subtle Indurated Plaque', 'A 50-year-old female presents with a slow-growing, skin-colored plaque on her upper lip that she thought was a scar from 10 years ago.

Vitals: Normal.
Physical Examination: An ill-defined, firm, yellowish-white indurated plaque. It is painless.
Laboratory Results: Biopsy shows small nests and cords of cells with prominent ductal/microcystic structures infiltrating deep into the dermis and muscle. Perineural invasion is present.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female presents with a slow-growing, skin-colored plaque on her upper lip that she thought was a scar from 10 years ago.

Vitals: Normal.
Physical Examination: An ill-defined, firm, yellowish-white indurated plaque. It is painless.
Laboratory Results: Biopsy shows small nests and cords of cells with prominent ductal/microcystic structures infiltrating deep into the dermis and muscle. Perineural invasion is present.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the clinical hallmark of MAC?', '["Rapid growth","Extremely slow growth and subtle clinical appearance masking deep, aggressive local invasion","It is always purple","It is very painful"]', 1, 'MAC is a ''wolf in sheep''''s clothing,'' often misdiagnosed as a benign cyst or scar for years.'),
        (v_case_id, 'What is the preferred treatment for MAC?', '["Shave excision","Mohs Micrographic Surgery (due to its high rate of subclinical spread and perineural invasion)","Cryosurgery","Antibiotics"]', 1, 'Mohs is essential to track the subtle, deep ''tentacles'' of this tumor.'),
        (v_case_id, 'MAC is a malignancy of which structure?', '["Melanocytes","Sweat duct (adnexal) structures","Nerves","Fat"]', 1, 'It shows differentiation toward sweat ducts and hair follicles.');

    ---------------------------------------------------------------------------
    -- CASE 50: Primary Cutaneous Marginal Zone Lymphoma (PCMZL)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red-Purple Back Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red-Purple Back Nodule', 'A 45-year-old male presents with several firm, red-to-violaceous nodules on his back. They are not itchy or painful.

Vitals: Normal.
Physical Examination: Multiple 1-2 cm smooth, non-scaly, erythematous-to-purple nodules on the upper back.
Laboratory Results: Biopsy shows a dense dermal infiltrate of small lymphocytes, plasma cells, and reactive follicles. IHC shows a B-cell phenotype (CD19+, CD20+, CD79a+).', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male presents with several firm, red-to-violaceous nodules on his back. They are not itchy or painful.

Vitals: Normal.
Physical Examination: Multiple 1-2 cm smooth, non-scaly, erythematous-to-purple nodules on the upper back.
Laboratory Results: Biopsy shows a dense dermal infiltrate of small lymphocytes, plasma cells, and reactive follicles. IHC shows a B-cell phenotype (CD19+, CD20+, CD79a+).', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is PCMZL?', '["A type of T-cell lymphoma","An indolent form of Primary Cutaneous B-cell Lymphoma","A metastatic lung cancer","A bacterial infection"]', 1, 'PCMZL is a low-grade B-cell lymphoma that often remains confined to the skin.'),
        (v_case_id, 'Which infectious agent has been associated with PCMZL in Europe?', '["HIV","Borrelia burgdorferi (the cause of Lyme disease)","Hepatitis C","HPV"]', 1, 'In certain geographic areas, Borrelia is thought to provide the chronic antigenic stimulus for the B-cell proliferation.'),
        (v_case_id, 'What is the 5-year survival rate for PCMZL?', '["10%","Nearly 100% (it is extremely indolent)","50%","0%"]', 1, 'Cutaneous marginal zone lymphoma has an excellent prognosis.');

END $$;
COMMIT;